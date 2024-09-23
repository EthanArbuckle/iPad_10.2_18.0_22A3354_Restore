@implementation ACCBLEPairingFeaturePlugin

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
  -[ACCBLEPairingFeaturePlugin pluginName](self, "pluginName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = obfuscatedPointer((uint64_t)self);
  v6 = -[ACCBLEPairingFeaturePlugin isRunning](self, "isRunning");
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
  ACCBLEPairingProvider *blePairingProvider;
  NSMutableDictionary *blePairingAccessoryList;

  init_logging();
  iap2server = self->_iap2server;
  self->_iap2server = 0;

  blePairingProvider = self->_blePairingProvider;
  self->_blePairingProvider = 0;

  blePairingAccessoryList = self->_blePairingAccessoryList;
  self->_blePairingAccessoryList = 0;

  -[ACCBLEPairingFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  objc_msgSend(MEMORY[0x24BE00DD0], "resetServerState");
}

- (void)startPlugin
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_219602000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_2();
}

- (void)stopPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  ACCBLEPairingShim *blePairingShim;
  ACCBLEPairingProvider *blePairingProvider;
  OS_dispatch_queue *blePairingQueue;
  NSMutableDictionary *blePairingAccessoryList;
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
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
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
    _os_log_impl(&dword_219602000, v5, OS_LOG_TYPE_DEFAULT, "Stopping BLE Pairing feature plugin...", buf, 2u);
  }

  -[ACCBLEPairingFeaturePlugin setIsRunning:](self, "setIsRunning:", 0);
  -[ACCiAP2ShimServer removeDelegate:](self->_iap2server, "removeDelegate:", self->_blePairingShim);
  blePairingShim = self->_blePairingShim;
  self->_blePairingShim = 0;

  dispatch_sync((dispatch_queue_t)self->_blePairingQueue, &__block_literal_global);
  blePairingProvider = self->_blePairingProvider;
  self->_blePairingProvider = 0;

  blePairingQueue = self->_blePairingQueue;
  self->_blePairingQueue = 0;

  blePairingAccessoryList = self->_blePairingAccessoryList;
  self->_blePairingAccessoryList = 0;

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
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v11 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_219602000, v11, OS_LOG_TYPE_DEFAULT, "Stopping BLE Pairing feature plugin... finished", v13, 2u);
  }

}

- (void)blePairing:(id)a3 accessoryAttached:(id)a4 blePairingUUID:(id)a5 accInfoDict:(id)a6 supportedPairTypes:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  BOOL v17;
  id v18;
  NSObject *v19;
  ACCBLEPairingShim *blePairingShim;
  ACCBLEPairingProvider *blePairingProvider;
  ACCiAP2ShimServer *iap2server;
  void *v23;
  NSObject *v24;
  id v25;
  NSObject *blePairingQueue;
  _QWORD block[4];
  NSObject *v28;
  id v29;
  id v30;
  id v31;
  ACCBLEPairingFeaturePlugin *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  __int16 v39;
  ACCBLEPairingProvider *v40;
  __int16 v41;
  ACCBLEPairingShim *v42;
  __int16 v43;
  ACCiAP2ShimServer *v44;
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (gLogObjects)
    v17 = gNumLogObjects < 1;
  else
    v17 = 1;
  if (v17)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v19 = MEMORY[0x24BDACB70];
    v18 = MEMORY[0x24BDACB70];
  }
  else
  {
    v19 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    blePairingShim = self->_blePairingShim;
    iap2server = self->_iap2server;
    blePairingProvider = self->_blePairingProvider;
    *(_DWORD *)buf = 138413570;
    v34 = v12;
    v35 = 2112;
    v36 = v13;
    v37 = 2112;
    v38 = v14;
    v39 = 2112;
    v40 = blePairingProvider;
    v41 = 2112;
    v42 = blePairingShim;
    v43 = 2112;
    v44 = iap2server;
    _os_log_impl(&dword_219602000, v19, OS_LOG_TYPE_INFO, "blePairing: %@ accessoryAttached: %@, blePairingUUID=%@, _blePairingProvider=%@ _blePairingShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  if (v15)
  {
    objc_msgSend(v15, "objectForKey:", *MEMORY[0x24BE00938]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v23 = 0;
  }
  if (objc_msgSend(v23, "isEqualToString:", CFSTR("A1603"))
    && !-[ACCBLEPairingFeaturePlugin _isSupportedType:supportedListData:](self, "_isSupportedType:supportedListData:", 1, v16))
  {
    blePairingQueue = self->_blePairingQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke;
    block[3] = &unk_24DB1DBA0;
    v28 = v13;
    v29 = v15;
    v30 = v14;
    v31 = v16;
    v32 = self;
    dispatch_async(blePairingQueue, block);

    v24 = v28;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v24 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v24 = MEMORY[0x24BDACB70];
      v25 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v34 = v12;
      v35 = 2112;
      v36 = v13;
      v37 = 2112;
      v38 = v14;
      _os_log_impl(&dword_219602000, v24, OS_LOG_TYPE_INFO, "blePairing: %@ accessoryAttached: %@, blePairingUUID=%@, detected non-supported, don't use shim plugin", buf, 0x20u);
    }
  }

}

void __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  __CFString *v12;
  void *v13;
  __CFString *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  ACCBLEPairingAccessory *v21;
  NSObject *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  id v32;
  ACCBLEPairingAccessory *v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  uint8_t buf[4];
  ACCBLEPairingAccessory *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  NSObject *v47;
  __int16 v48;
  uint64_t v49;
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE00DC8]), "initWithUID:keyTag:features:", a1[4], CFSTR("BLEPairing"), 0);
  v3 = (void *)a1[5];
  if (v3)
  {
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x24BE00938]);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = (void *)a1[5];
  if (v5)
  {
    objc_msgSend(v5, "objectForKey:", *MEMORY[0x24BE00930]);
    v6 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  v7 = (void *)a1[5];
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BE00940]);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  v9 = (void *)a1[5];
  if (v9)
  {
    objc_msgSend(v9, "objectForKey:", *MEMORY[0x24BE00948]);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
  v11 = (void *)a1[5];
  if (v11)
  {
    objc_msgSend(v11, "objectForKey:", *MEMORY[0x24BE00920]);
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v12 = 0;
  }
  v13 = (void *)a1[5];
  if (v13)
  {
    objc_msgSend(v13, "objectForKey:", *MEMORY[0x24BE00928]);
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = 0;
  }
  v41 = (void *)v8;
  if (v8)
    v15 = (const __CFString *)v8;
  else
    v15 = &stru_24DB1DD38;
  objc_msgSend(v2, "setName:", v15);
  v39 = (void *)v4;
  if (v4)
    v16 = (const __CFString *)v4;
  else
    v16 = &stru_24DB1DD38;
  objc_msgSend(v2, "setModel:", v16);
  if (v6)
    v17 = (const __CFString *)v6;
  else
    v17 = &stru_24DB1DD38;
  objc_msgSend(v2, "setManufacturer:", v17, v6);
  v40 = (void *)v10;
  if (v10)
    v18 = (const __CFString *)v10;
  else
    v18 = &stru_24DB1DD38;
  objc_msgSend(v2, "setSerialNumber:", v18);
  if (v12)
    v19 = v12;
  else
    v19 = &stru_24DB1DD38;
  objc_msgSend(v2, "setFirmwareVersion:", v19);
  if (v14)
    v20 = v14;
  else
    v20 = &stru_24DB1DD38;
  objc_msgSend(v2, "setHardwareVersion:", v20);
  objc_msgSend(v2, "addFeature:", 4);
  v21 = objc_alloc_init(ACCBLEPairingAccessory);
  -[ACCBLEPairingAccessory setIap2ShimAccessory:](v21, "setIap2ShimAccessory:", v2);
  -[ACCBLEPairingAccessory setBlePairingUUID:](v21, "setBlePairingUUID:", a1[6]);
  -[ACCBLEPairingAccessory setSupportedPairTypes:](v21, "setSupportedPairTypes:", a1[7]);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v22 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v22 = MEMORY[0x24BDACB70];
    v23 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke_cold_3(v2, v22);

  v24 = *(void **)(a1[8] + 48);
  objc_msgSend(v2, "connectionIDObj");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setObject:forKey:", v21, v25);

  objc_msgSend(*(id *)(a1[8] + 16), "addAccessory:", v2);
  if (a1[6] && *(_QWORD *)(a1[8] + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "accessoryInfoDict");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setObject:forKey:](v27, "setObject:forKey:", v28, *MEMORY[0x24BE00980]);

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v29 = *(id *)gLogObjects;
      v31 = v38;
      v30 = v39;
    }
    else
    {
      v31 = v38;
      v30 = v39;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v29 = MEMORY[0x24BDACB70];
      v35 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      v36 = a1[6];
      v37 = a1[7];
      *(_DWORD *)buf = 138413058;
      v43 = v21;
      v44 = 2112;
      v45 = v36;
      v46 = 2112;
      v47 = v27;
      v48 = 2112;
      v49 = v37;
      _os_log_debug_impl(&dword_219602000, v29, OS_LOG_TYPE_DEBUG, "accessoryAttached: call shim accessoryAttached: bleAccessory=%@ blePairingUUID=%@ pAccDict=%@ supportedPairTypes=%@", buf, 0x2Au);
    }

    objc_msgSend(*(id *)(a1[8] + 40), "accessoryAttached:blePairingUUID:accInfoDict:supportedPairTypes:", v21, a1[6], v27, a1[7]);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v27 = *(id *)gLogObjects;
      v31 = v38;
      v30 = v39;
    }
    else
    {
      v31 = v38;
      v30 = v39;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v27 = MEMORY[0x24BDACB70];
      v32 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      v33 = (ACCBLEPairingAccessory *)a1[6];
      v34 = *(_QWORD *)(a1[8] + 40);
      *(_DWORD *)buf = 138412546;
      v43 = v33;
      v44 = 2112;
      v45 = v34;
      _os_log_impl(&dword_219602000, v27, OS_LOG_TYPE_INFO, "Invalid blePairingUUID(%@) or _blePairingShim(%@)", buf, 0x16u);
    }
  }

}

- (void)blePairing:(id)a3 accessoryDetached:(id)a4 blePairingUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCBLEPairingShim *blePairingShim;
  ACCBLEPairingProvider *blePairingProvider;
  ACCiAP2ShimServer *iap2server;
  NSObject *blePairingQueue;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  ACCBLEPairingProvider *v30;
  __int16 v31;
  ACCBLEPairingShim *v32;
  __int16 v33;
  ACCiAP2ShimServer *v34;
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
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    blePairingShim = self->_blePairingShim;
    iap2server = self->_iap2server;
    blePairingProvider = self->_blePairingProvider;
    *(_DWORD *)buf = 138413570;
    v24 = v8;
    v25 = 2112;
    v26 = v9;
    v27 = 2112;
    v28 = v10;
    v29 = 2112;
    v30 = blePairingProvider;
    v31 = 2112;
    v32 = blePairingShim;
    v33 = 2112;
    v34 = iap2server;
    _os_log_impl(&dword_219602000, v13, OS_LOG_TYPE_INFO, "blePairing: %@ accessoryDetached: %@, blePairingUUID=%@, _blePairingProvider=%@ _blePairingShim=%@ _iap2server=%@", buf, 0x3Eu);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __74__ACCBLEPairingFeaturePlugin_blePairing_accessoryDetached_blePairingUUID___block_invoke;
  block[3] = &unk_24DB1DBC8;
  block[4] = self;
  v21 = v9;
  v22 = v10;
  v18 = v10;
  v19 = v9;
  dispatch_async(blePairingQueue, block);

}

void __74__ACCBLEPairingFeaturePlugin_blePairing_accessoryDetached_blePairingUUID___block_invoke(_QWORD *a1)
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
  uint64_t v11;
  int v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1[4] + 16), "findAccessoryForAccessoryUID:andKeyTag:", a1[5], CFSTR("BLEPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2 && a1[6] && *(_QWORD *)(a1[4] + 40) && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1[4] + 16), "removeAccessory:", v2);
    v3 = *(void **)(a1[4] + 48);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", objc_msgSend(v2, "connectionID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1[4] + 40), "accessoryDetached:blePairingUUID:", v5, a1[6]);
    v6 = *(void **)(a1[4] + 48);
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
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v10 = a1[6];
      v11 = *(_QWORD *)(a1[4] + 40);
      v12 = 138412802;
      v13 = v2;
      v14 = 2112;
      v15 = v10;
      v16 = 2112;
      v17 = v11;
      _os_log_impl(&dword_219602000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v12, 0x20u);
    }
  }

}

- (void)blePairingStateUpdate:(id)a3 validMask:(unsigned int)a4 btRadioOn:(BOOL)a5 pairingState:(int)a6 pairingModeOn:(BOOL)a7 accessory:(id)a8 blePairingUUID:(id)a9
{
  _BOOL4 v10;
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  BOOL v18;
  id v19;
  NSObject *v20;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v24;
  id v25;
  _QWORD block[5];
  id v27;
  id v28;
  unsigned int v29;
  int v30;
  BOOL v31;
  BOOL v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  unsigned int v36;
  __int16 v37;
  _BOOL4 v38;
  __int16 v39;
  int v40;
  __int16 v41;
  _BOOL4 v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;
  __int16 v47;
  ACCBLEPairingProvider *v48;
  __int16 v49;
  ACCBLEPairingShim *v50;
  uint64_t v51;

  v10 = a7;
  v12 = a5;
  v51 = *MEMORY[0x24BDAC8D0];
  v15 = a3;
  v16 = a8;
  v17 = a9;
  if (gLogObjects)
    v18 = gNumLogObjects < 1;
  else
    v18 = 1;
  if (v18)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v20 = MEMORY[0x24BDACB70];
    v19 = MEMORY[0x24BDACB70];
  }
  else
  {
    v20 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138414338;
    v34 = v15;
    v35 = 1024;
    v36 = a4;
    v37 = 1024;
    v38 = v12;
    v39 = 1024;
    v40 = a6;
    v41 = 1024;
    v42 = v10;
    v43 = 2112;
    v44 = v16;
    v45 = 2112;
    v46 = v17;
    v47 = 2112;
    v48 = blePairingProvider;
    v49 = 2112;
    v50 = blePairingShim;
    _os_log_impl(&dword_219602000, v20, OS_LOG_TYPE_INFO, "blePairingStateUpdate: %@ validMask: %d btRadioOn: %d pairingState: %d pairingModeOn: %d accessory: %@ blePairingUUID: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x4Cu);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __124__ACCBLEPairingFeaturePlugin_blePairingStateUpdate_validMask_btRadioOn_pairingState_pairingModeOn_accessory_blePairingUUID___block_invoke;
  block[3] = &unk_24DB1DBF0;
  block[4] = self;
  v27 = v16;
  v28 = v17;
  v31 = v12;
  v29 = a4;
  v30 = a6;
  v32 = v10;
  v24 = v17;
  v25 = v16;
  dispatch_async(blePairingQueue, block);

}

void __124__ACCBLEPairingFeaturePlugin_blePairingStateUpdate_validMask_btRadioOn_pairingState_pairingModeOn_accessory_blePairingUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), CFSTR("BLEPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && *(_QWORD *)(a1 + 48)
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v2, "connectionIDObj");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stateUpdate:blePairingUUID:validMask:btRadioOn:pairingState:pairingModeOn:", v5, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 64), *(unsigned int *)(a1 + 60), *(unsigned __int8 *)(a1 + 65));
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v10 = 138412802;
      v11 = v2;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_219602000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v10, 0x20u);
    }
  }

}

- (void)blePairingInfoUpdate:(id)a3 pairType:(int)a4 pairInfoList:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  int v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  ACCBLEPairingProvider *v41;
  __int16 v42;
  ACCBLEPairingShim *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413826;
    v31 = v12;
    v32 = 1024;
    v33 = a4;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v14;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = blePairingProvider;
    v42 = 2112;
    v43 = blePairingShim;
    _os_log_impl(&dword_219602000, v18, OS_LOG_TYPE_INFO, "blePairingInfoUpdate: %@ pairType: %d pairInfoList: %@ accessory: %@ blePairingUUID: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x44u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __98__ACCBLEPairingFeaturePlugin_blePairingInfoUpdate_pairType_pairInfoList_accessory_blePairingUUID___block_invoke;
  block[3] = &unk_24DB1DC18;
  block[4] = self;
  v26 = v14;
  v29 = a4;
  v27 = v15;
  v28 = v13;
  v22 = v13;
  v23 = v15;
  v24 = v14;
  dispatch_async(blePairingQueue, block);

}

void __98__ACCBLEPairingFeaturePlugin_blePairingInfoUpdate_pairType_pairInfoList_accessory_blePairingUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), CFSTR("BLEPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && *(_QWORD *)(a1 + 48)
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v2, "connectionIDObj");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "stateUpdate:blePairingUUID:pairType:pairInfoList:", v5, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v10 = 138412802;
      v11 = v2;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_219602000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v10, 0x20u);
    }
  }

}

- (void)blePairingDataUpdate:(id)a3 pairType:(int)a4 pairData:(id)a5 accessory:(id)a6 blePairingUUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  BOOL v16;
  id v17;
  NSObject *v18;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v22;
  id v23;
  id v24;
  _QWORD block[5];
  id v26;
  id v27;
  id v28;
  int v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  int v33;
  __int16 v34;
  id v35;
  __int16 v36;
  id v37;
  __int16 v38;
  id v39;
  __int16 v40;
  ACCBLEPairingProvider *v41;
  __int16 v42;
  ACCBLEPairingShim *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  if (gLogObjects)
    v16 = gNumLogObjects < 1;
  else
    v16 = 1;
  if (v16)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v18 = MEMORY[0x24BDACB70];
    v17 = MEMORY[0x24BDACB70];
  }
  else
  {
    v18 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413826;
    v31 = v12;
    v32 = 1024;
    v33 = a4;
    v34 = 2112;
    v35 = v13;
    v36 = 2112;
    v37 = v14;
    v38 = 2112;
    v39 = v15;
    v40 = 2112;
    v41 = blePairingProvider;
    v42 = 2112;
    v43 = blePairingShim;
    _os_log_impl(&dword_219602000, v18, OS_LOG_TYPE_INFO, "blePairingDataUpdate: %@ pairType: %d pairData: %@ accessory: %@ blePairingUUID: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x44u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __94__ACCBLEPairingFeaturePlugin_blePairingDataUpdate_pairType_pairData_accessory_blePairingUUID___block_invoke;
  block[3] = &unk_24DB1DC18;
  block[4] = self;
  v26 = v14;
  v29 = a4;
  v27 = v15;
  v28 = v13;
  v22 = v13;
  v23 = v15;
  v24 = v14;
  dispatch_async(blePairingQueue, block);

}

void __94__ACCBLEPairingFeaturePlugin_blePairingDataUpdate_pairType_pairData_accessory_blePairingUUID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  BOOL v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "findAccessoryForAccessoryUID:andKeyTag:", *(_QWORD *)(a1 + 40), CFSTR("BLEPairing"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && *(_QWORD *)(a1 + 48)
    && *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40)
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    objc_msgSend(v2, "connectionIDObj");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", v4);
    v5 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "dataUpdate:blePairingUUID:pairType:pairData:", v5, *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    if (gLogObjects)
      v6 = gNumLogObjects < 1;
    else
      v6 = 1;
    if (v6)
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v5 = MEMORY[0x24BDACB70];
      v7 = MEMORY[0x24BDACB70];
    }
    else
    {
      v5 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
      v10 = 138412802;
      v11 = v2;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_219602000, v5, OS_LOG_TYPE_INFO, "Invalid accessory(%@) or blePairingUUID(%@) or _blePairingShim(%@)", (uint8_t *)&v10, 0x20u);
    }
  }

}

- (id)bleAccessoryForConnectionID:(unsigned int)a3
{
  NSObject *blePairingQueue;
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
  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__ACCBLEPairingFeaturePlugin_bleAccessoryForConnectionID___block_invoke;
  block[3] = &unk_24DB1DC40;
  block[4] = self;
  block[5] = &v8;
  v7 = a3;
  dispatch_sync(blePairingQueue, block);
  v4 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v4;
}

void __58__ACCBLEPairingFeaturePlugin_bleAccessoryForConnectionID___block_invoke(uint64_t a1)
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

- (void)deviceStartBLEUpdates:(id)a3 pairType:(int)a4 btRadio:(BOOL)a5 pairInfo:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL4 v7;
  id v10;
  BOOL v11;
  id v12;
  NSObject *v13;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v17;
  _QWORD block[5];
  id v19;
  int v20;
  BOOL v21;
  BOOL v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  __int16 v31;
  ACCBLEPairingProvider *v32;
  __int16 v33;
  ACCBLEPairingShim *v34;
  uint64_t v35;

  v6 = a6;
  v7 = a5;
  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  if (gLogObjects)
    v11 = gNumLogObjects < 1;
  else
    v11 = 1;
  if (v11)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v13 = MEMORY[0x24BDACB70];
    v12 = MEMORY[0x24BDACB70];
  }
  else
  {
    v13 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413570;
    v24 = v10;
    v25 = 1024;
    v26 = a4;
    v27 = 1024;
    v28 = v7;
    v29 = 1024;
    v30 = v6;
    v31 = 2112;
    v32 = blePairingProvider;
    v33 = 2112;
    v34 = blePairingShim;
    _os_log_impl(&dword_219602000, v13, OS_LOG_TYPE_INFO, "blePairing deviceStartBLEUpdates: %@ pairType:%d btRadio:%d pairInfoUpdateOn:%d, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x32u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __78__ACCBLEPairingFeaturePlugin_deviceStartBLEUpdates_pairType_btRadio_pairInfo___block_invoke;
  block[3] = &unk_24DB1DC68;
  block[4] = self;
  v19 = v10;
  v20 = a4;
  v21 = v7;
  v22 = v6;
  v17 = v10;
  dispatch_async(blePairingQueue, block);

}

void __78__ACCBLEPairingFeaturePlugin_deviceStartBLEUpdates_pairType_btRadio_pairInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "blePairingUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "startBLEUpdates:blePairingUUID:pairType:bRadioUpdatesOn:bPairInfoUpdatesOn:", v3, v4, *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 52), *(unsigned __int8 *)(a1 + 53));

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
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_219602000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceStartBLEUpdates: %@, skip processing, _blePairingProvider(%@) nil", buf, 0x16u);

    }
  }
}

- (void)deviceStateUpdate:(id)a3 btRadio:(unsigned __int8)a4 pairStatus:(int)a5 pairModeOn:(BOOL)a6 forceUpdates:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  int v10;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v19;
  _QWORD block[5];
  id v21;
  int v22;
  char v23;
  BOOL v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  _BOOL4 v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  ACCBLEPairingProvider *v36;
  __int16 v37;
  ACCBLEPairingShim *v38;
  uint64_t v39;

  v7 = a7;
  v8 = a6;
  v10 = a4;
  v39 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  if (gLogObjects)
    v13 = gNumLogObjects < 1;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413826;
    v26 = v12;
    v27 = 1024;
    v28 = v10;
    v29 = 1024;
    v30 = a5;
    v31 = 1024;
    v32 = v8;
    v33 = 1024;
    v34 = v7;
    v35 = 2112;
    v36 = blePairingProvider;
    v37 = 2112;
    v38 = blePairingShim;
    _os_log_impl(&dword_219602000, v15, OS_LOG_TYPE_INFO, "blePairing deviceStateUpdate: %@ btRadio:%d pairStatus:%d pairModeOn:%d forceUpdates:%d, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x38u);
  }

  blePairingQueue = self->_blePairingQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __91__ACCBLEPairingFeaturePlugin_deviceStateUpdate_btRadio_pairStatus_pairModeOn_forceUpdates___block_invoke;
  block[3] = &unk_24DB1DC68;
  block[4] = self;
  v21 = v12;
  v23 = v10;
  v22 = a5;
  v24 = v8;
  v19 = v12;
  dispatch_async(blePairingQueue, block);

}

void __91__ACCBLEPairingFeaturePlugin_deviceStateUpdate_btRadio_pairStatus_pairModeOn_forceUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "blePairingUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deviceStateUpdate:blePairingUUID:bRadioOn:pairState:bPairModeOn:", v3, v4, *(_BYTE *)(a1 + 52) != 0, *(unsigned int *)(a1 + 48), *(unsigned __int8 *)(a1 + 53));

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
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_219602000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceStateUpdate: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);

    }
  }
}

- (void)deviceSend:(id)a3 pairType:(int)a4 pairingData:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  int v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  ACCBLEPairingProvider *v29;
  __int16 v30;
  ACCBLEPairingShim *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413314;
    v23 = v8;
    v24 = 1024;
    v25 = a4;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = blePairingProvider;
    v30 = 2112;
    v31 = blePairingShim;
    _os_log_impl(&dword_219602000, v12, OS_LOG_TYPE_INFO, "blePairing deviceSend: %@ pairType:%d pairingData:%@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x30u);
  }

  blePairingQueue = self->_blePairingQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __62__ACCBLEPairingFeaturePlugin_deviceSend_pairType_pairingData___block_invoke;
  v18[3] = &unk_24DB1DC90;
  v18[4] = self;
  v19 = v8;
  v21 = a4;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  dispatch_async(blePairingQueue, v18);

}

void __62__ACCBLEPairingFeaturePlugin_deviceSend_pairType_pairingData___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "blePairingUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "devicePairingData:blePairingUUID:pairType:pairData:", v3, v4, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

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
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_219602000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceSend: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);

    }
  }
}

- (void)deviceUpdate:(id)a3 pairType:(int)a4 pairInfo:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  int v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  __int16 v28;
  ACCBLEPairingProvider *v29;
  __int16 v30;
  ACCBLEPairingShim *v31;
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138413314;
    v23 = v8;
    v24 = 1024;
    v25 = a4;
    v26 = 2112;
    v27 = v9;
    v28 = 2112;
    v29 = blePairingProvider;
    v30 = 2112;
    v31 = blePairingShim;
    _os_log_impl(&dword_219602000, v12, OS_LOG_TYPE_INFO, "blePairing deviceUpdate: %@ pairType:%d pairingInfo:%@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x30u);
  }

  blePairingQueue = self->_blePairingQueue;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __61__ACCBLEPairingFeaturePlugin_deviceUpdate_pairType_pairInfo___block_invoke;
  v18[3] = &unk_24DB1DC90;
  v18[4] = self;
  v19 = v8;
  v21 = a4;
  v20 = v9;
  v16 = v9;
  v17 = v8;
  dispatch_async(blePairingQueue, v18);

}

void __61__ACCBLEPairingFeaturePlugin_deviceUpdate_pairType_pairInfo___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "blePairingUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "deviceUpdatePairingInfo:blePairingUUID:pairType:pairInfo:", v3, v4, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

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
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_219602000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceUpdate: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);

    }
  }
}

- (void)deviceStopBLEUpdates:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  ACCBLEPairingProvider *blePairingProvider;
  ACCBLEPairingShim *blePairingShim;
  NSObject *blePairingQueue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  ACCBLEPairingProvider *v17;
  __int16 v18;
  ACCBLEPairingShim *v19;
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
      -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    blePairingProvider = self->_blePairingProvider;
    blePairingShim = self->_blePairingShim;
    *(_DWORD *)buf = 138412802;
    v15 = v4;
    v16 = 2112;
    v17 = blePairingProvider;
    v18 = 2112;
    v19 = blePairingShim;
    _os_log_impl(&dword_219602000, v7, OS_LOG_TYPE_INFO, "blePairing deviceStopBLEUpdates: %@, _blePairingProvider=%@ _blePairingShim=%@", buf, 0x20u);
  }

  blePairingQueue = self->_blePairingQueue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __51__ACCBLEPairingFeaturePlugin_deviceStopBLEUpdates___block_invoke;
  v12[3] = &unk_24DB1DCB8;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(blePairingQueue, v12);

}

void __51__ACCBLEPairingFeaturePlugin_deviceStopBLEUpdates___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessoryUID");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "blePairingUUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stopBLEUpdates:blePairingUUID:", v3, v4);

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
        -[ACCBLEPairingFeaturePlugin startPlugin].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    else
    {
      v7 = *(id *)gLogObjects;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 40), "iap2ShimAccessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessoryUID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
      *(_DWORD *)buf = 138412546;
      v13 = v9;
      v14 = 2112;
      v15 = v10;
      _os_log_impl(&dword_219602000, v7, OS_LOG_TYPE_DEFAULT, "blePairing deviceStopBLEUpdates: %@, skip processing, _blePairingProvider(%@) nil or doesn't support selector", buf, 0x16u);

    }
  }
}

- (BOOL)_isSupportedType:(unsigned __int8)a3 supportedListData:(id)a4
{
  int v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  int v9;
  BOOL v10;

  v4 = a3;
  v5 = a4;
  v6 = v5;
  if (v5 && objc_msgSend(v5, "length") && objc_msgSend(v6, "length"))
  {
    v7 = 0;
    do
    {
      v8 = objc_retainAutorelease(v6);
      v9 = *(unsigned __int8 *)(objc_msgSend(v8, "bytes") + v7);
      v10 = v9 == v4;
      if (v9 == v4)
        break;
      ++v7;
    }
    while (objc_msgSend(v8, "length") > v7);
  }
  else
  {
    v10 = 0;
  }

  return v10;
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

- (ACCBLEPairingProvider)blePairingProvider
{
  return self->_blePairingProvider;
}

- (void)setBlePairingProvider:(id)a3
{
  objc_storeStrong((id *)&self->_blePairingProvider, a3);
}

- (OS_dispatch_queue)blePairingQueue
{
  return self->_blePairingQueue;
}

- (void)setBlePairingQueue:(id)a3
{
  objc_storeStrong((id *)&self->_blePairingQueue, a3);
}

- (ACCBLEPairingShim)blePairingShim
{
  return self->_blePairingShim;
}

- (void)setBlePairingShim:(id)a3
{
  objc_storeStrong((id *)&self->_blePairingShim, a3);
}

- (NSMutableDictionary)blePairingAccessoryList
{
  return self->_blePairingAccessoryList;
}

- (void)setBlePairingAccessoryList:(id)a3
{
  objc_storeStrong((id *)&self->_blePairingAccessoryList, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blePairingAccessoryList, 0);
  objc_storeStrong((id *)&self->_blePairingShim, 0);
  objc_storeStrong((id *)&self->_blePairingQueue, 0);
  objc_storeStrong((id *)&self->_blePairingProvider, 0);
  objc_storeStrong((id *)&self->_iap2server, 0);
}

void __105__ACCBLEPairingFeaturePlugin_blePairing_accessoryAttached_blePairingUUID_accInfoDict_supportedPairTypes___block_invoke_cold_3(void *a1, NSObject *a2)
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
  _os_log_debug_impl(&dword_219602000, a2, OS_LOG_TYPE_DEBUG, "accessoryAttached: accessory=%@ connectionIDObj=%@", (uint8_t *)&v5, 0x16u);

}

@end
