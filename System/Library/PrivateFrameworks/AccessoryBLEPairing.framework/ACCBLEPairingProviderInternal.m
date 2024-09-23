@implementation ACCBLEPairingProviderInternal

+ (id)SharedInstance
{
  if (SharedInstance_onceToken != -1)
    dispatch_once(&SharedInstance_onceToken, &__block_literal_global);
  return (id)SharedInstance__sharedInstance;
}

void __47__ACCBLEPairingProviderInternal_SharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[ACCBLEPairingProviderInternal initSharedInstance]([ACCBLEPairingProviderInternal alloc], "initSharedInstance");
  v1 = (void *)SharedInstance__sharedInstance;
  SharedInstance__sharedInstance = (uint64_t)v0;

}

- (id)initSharedInstance
{
  ACCBLEPairingProviderInternal *v3;
  void *v4;
  uint64_t v5;
  NSString *providerUID;
  NSObject *v7;
  id v8;
  NSString *v9;
  NSLock *v10;
  NSLock *delegateListLock;
  NSMutableDictionary *v12;
  NSMutableDictionary *delegateList;
  NSXPCConnection *serverConnection;
  ACCBLEPairingXPCServerProtocol *remoteObject;
  NSMutableDictionary *v16;
  NSMutableDictionary *accessories;
  uint64_t v18;
  ACCBLEPairingProviderInternal *v19;
  id v20;
  _QWORD handler[4];
  id v23;
  _QWORD v24[4];
  ACCBLEPairingProviderInternal *v25;
  id v26;
  objc_super v27;
  _BYTE buf[12];
  __int16 v29;
  ACCBLEPairingProviderInternal *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  init_logging();
  v27.receiver = self;
  v27.super_class = (Class)ACCBLEPairingProviderInternal;
  v3 = -[ACCBLEPairingProviderInternal init](&v27, sel_init);
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v5 = objc_claimAutoreleasedReturnValue();
    providerUID = v3->_providerUID;
    v3->_providerUID = (NSString *)v5;

    if (gLogObjects && gNumLogObjects >= 1)
    {
      v7 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v7 = MEMORY[0x24BDACB70];
      v8 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v3->_providerUID;
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)&buf[4] = v9;
      v29 = 2048;
      v30 = v3;
      _os_log_impl(&dword_215447000, v7, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider init, _providerUID=%@, %p", buf, 0x16u);
    }

    v10 = (NSLock *)objc_alloc_init(MEMORY[0x24BDD1648]);
    delegateListLock = v3->_delegateListLock;
    v3->_delegateListLock = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    delegateList = v3->_delegateList;
    v3->_delegateList = v12;

    serverConnection = v3->_serverConnection;
    v3->_serverConnection = 0;

    remoteObject = v3->_remoteObject;
    v3->_remoteObject = 0;

    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    accessories = v3->_accessories;
    v3->_accessories = v16;

    v3->_accDetectToken = -1;
    v3->_lastScorpiusDetectType = -[ACCBLEPairingProviderInternal getAccDetectType:](v3, "getAccDetectType:", 0xFFFFFFFFLL);
    *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v3);
    v18 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke;
    v24[3] = &unk_24D3488A8;
    v19 = v3;
    v25 = v19;
    objc_copyWeak(&v26, (id *)buf);
    accessoryServer_registerAvailabilityChangedHandler("com.apple.accessories.blepairing.availability-changed", v24);
    -[ACCBLEPairingProviderInternal connectToServer](v19, "connectToServer");
    v20 = MEMORY[0x24BDAC9B8];
    handler[0] = v18;
    handler[1] = 3221225472;
    handler[2] = __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke_66;
    handler[3] = &unk_24D3488D0;
    objc_copyWeak(&v23, (id *)buf);
    notify_register_dispatch("com.apple.accessories.scp.objdetect", &v3->_accDetectToken, MEMORY[0x24BDAC9B8], handler);

    objc_destroyWeak(&v23);
    objc_destroyWeak(&v26);

    objc_destroyWeak((id *)buf);
  }
  return v3;
}

void __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id WeakRetained;
  _DWORD v11[2];
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 32);
    v11[0] = 67109378;
    v11[1] = a2;
    v12 = 2112;
    v13 = v7;
    _os_log_impl(&dword_215447000, v6, OS_LOG_TYPE_DEFAULT, "Server availability changed! State: %d UID: %@", (uint8_t *)v11, 0x12u);
  }

  if (a2)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v8 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v8 = MEMORY[0x24BDACB70];
      v9 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v11[0]) = 0;
      _os_log_impl(&dword_215447000, v8, OS_LOG_TYPE_DEFAULT, "Trying to connect to server...", (uint8_t *)v11, 2u);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    objc_msgSend(WeakRetained, "connectToServer");

  }
}

void __51__ACCBLEPairingProviderInternal_initSharedInstance__block_invoke_66(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  int v25;
  NSObject *v26;
  uint64_t v27;
  int v28;
  BOOL v29;
  NSObject *v30;
  NSObject *v31;
  NSObject *v32;
  id v33;
  void *v34;
  NSObject *v35;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  id *location;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  _BYTE v46[10];
  void *v47;
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x24BDAC8D0];
  location = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = objc_msgSend(WeakRetained, "getAccDetectType:", a2);

  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_loadWeakRetained(location);
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v46 = objc_msgSend(v8, "lastScorpiusDetectType");
    *(_WORD *)&v46[4] = 1024;
    *(_DWORD *)&v46[6] = v4;
    _os_log_impl(&dword_215447000, v7, OS_LOG_TYPE_DEFAULT, "lastDetectType %d -> %d", buf, 0xEu);

  }
  v9 = objc_loadWeakRetained(location);
  objc_msgSend(v9, "setLastScorpiusDetectType:", v4);

  v10 = objc_loadWeakRetained(location);
  objc_msgSend(v10, "delegateListLock");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lock");

  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v12 = objc_loadWeakRetained(location);
  objc_msgSend(v12, "delegateList");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "allValues");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
  if (v15)
  {
    v17 = v15;
    v18 = *(_QWORD *)v42;
    v19 = MEMORY[0x24BDACB70];
    *(_QWORD *)&v16 = 134218240;
    v39 = v16;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v42 != v18)
          objc_enumerationMutation(v14);
        v21 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v21, "delegate", v39);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "provider");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v22 && (objc_opt_respondsToSelector() & 1) != 0)
        {
          v24 = gLogObjects;
          v25 = gNumLogObjects;
          if (gLogObjects && gNumLogObjects >= 1)
          {
            v26 = *(id *)gLogObjects;
          }
          else
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v39;
              *(_QWORD *)v46 = v24;
              *(_WORD *)&v46[8] = 1024;
              LODWORD(v47) = v25;
              _os_log_error_impl(&dword_215447000, v19, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v32 = v19;
            v26 = v19;
          }
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v46 = v22;
            *(_WORD *)&v46[8] = 2112;
            v47 = v23;
            _os_log_impl(&dword_215447000, v26, OS_LOG_TYPE_INFO, "BLEPairingProvider delegate respond to blePairing:accessoryDetect:, delegate = %@, provider = %@", buf, 0x16u);
          }

          v31 = objc_loadWeakRetained(location);
          objc_msgSend(v22, "blePairing:accessoryDetect:", v23, -[NSObject lastScorpiusDetectType](v31, "lastScorpiusDetectType"));
        }
        else
        {
          v27 = gLogObjects;
          v28 = gNumLogObjects;
          if (gLogObjects)
            v29 = gNumLogObjects < 1;
          else
            v29 = 1;
          if (v29)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v39;
              *(_QWORD *)v46 = v27;
              *(_WORD *)&v46[8] = 1024;
              LODWORD(v47) = v28;
              _os_log_error_impl(&dword_215447000, v19, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v30 = v19;
            v31 = v19;
          }
          else
          {
            v31 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)v46 = v22;
            *(_WORD *)&v46[8] = 2112;
            v47 = v23;
            _os_log_impl(&dword_215447000, v31, OS_LOG_TYPE_INFO, "BLEPairingProvider delegate doesn't respond to blePairing:accessoryDetect:, delegate = %@, provider = %@", buf, 0x16u);
          }
        }

      }
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    }
    while (v17);
  }

  v33 = objc_loadWeakRetained(location);
  objc_msgSend(v33, "delegateListLock");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "unlock");

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v35 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v35 = MEMORY[0x24BDACB70];
    v36 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    v37 = objc_loadWeakRetained(location);
    objc_msgSend(v37, "providerUID");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)v46 = v38;
    _os_log_impl(&dword_215447000, v35, OS_LOG_TYPE_INFO, "EXIT object detect notification handler, %@", buf, 0xCu);

  }
}

- (void)dealloc
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSString *providerUID;
  void *v7;
  NSMutableDictionary *delegateList;
  NSLock *delegateListLock;
  ACCBLEPairingXPCServerProtocol *remoteObject;
  NSMutableDictionary *accessories;
  objc_super v12;
  uint8_t buf[4];
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412290;
    v14 = providerUID;
    _os_log_impl(&dword_215447000, v5, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider dealloc, _providerUID %@", buf, 0xCu);
  }

  notify_cancel(self->_accDetectToken);
  self->_accDetectToken = -1;
  accessoryServer_unregisterAvailabilityChangedHandler();
  -[ACCBLEPairingProviderInternal serverConnection](self, "serverConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  -[ACCBLEPairingProviderInternal setServerConnection:](self, "setServerConnection:", 0);
  delegateList = self->_delegateList;
  self->_delegateList = 0;

  delegateListLock = self->_delegateListLock;
  self->_delegateListLock = 0;

  remoteObject = self->_remoteObject;
  self->_remoteObject = 0;

  accessories = self->_accessories;
  self->_accessories = 0;

  v12.receiver = self;
  v12.super_class = (Class)ACCBLEPairingProviderInternal;
  -[ACCBLEPairingProviderInternal dealloc](&v12, sel_dealloc);
}

- (void)registerDelegate:(id)a3 provider:(id)a4 forUUID:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  ACCBLEPairingDelegateReference *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t i;
  void *v20;
  uint64_t v21;
  int v22;
  BOOL v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  int v34;
  NSObject *v35;
  NSObject *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSObject *v41;
  id v42;
  NSObject *v43;
  id v44;
  ACCBLEPairingDelegateReference *v45;
  void *v46;
  id v47;
  ACCBLEPairingProviderInternal *v48;
  id obj;
  uint64_t v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  int v59;
  __int16 v60;
  id v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v51 = a4;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
    v58 = 1024;
    v59 = 315;
    v60 = 2112;
    v61 = v8;
    v62 = 2112;
    v63 = v9;
    _os_log_impl(&dword_215447000, v12, OS_LOG_TYPE_DEFAULT, "%s:%d, delegate %@, uuid %@", buf, 0x26u);
  }

  -[ACCBLEPairingProviderInternal connectToServer](self, "connectToServer");
  -[NSLock lock](self->_delegateListLock, "lock");
  -[NSMutableDictionary allValues](self->_accessories, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v15 = -[ACCBLEPairingDelegateReference initWithDelegate:provider:]([ACCBLEPairingDelegateReference alloc], "initWithDelegate:provider:", v8, v51);
  -[NSMutableDictionary setObject:forKey:](self->_delegateList, "setObject:forKey:", v15, v9);
  if (accessoryServer_isServerAvailable())
  {
    v45 = v15;
    v46 = v14;
    v47 = v9;
    v48 = self;
    v54 = 0u;
    v55 = 0u;
    v52 = 0u;
    v53 = 0u;
    obj = v14;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
    if (v16)
    {
      v17 = v16;
      v50 = *(_QWORD *)v53;
      v18 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v53 != v50)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
          v21 = gLogObjects;
          v22 = gNumLogObjects;
          if (gLogObjects)
            v23 = gNumLogObjects < 1;
          else
            v23 = 1;
          if (v23)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v57 = (const char *)v21;
              v58 = 1024;
              v59 = v22;
              _os_log_error_impl(&dword_215447000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v24 = v18;
            v25 = v18;
          }
          else
          {
            v25 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
          {
            objc_msgSend(v20, "accessoryUID");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "blePairingUUID");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316418;
            v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
            v58 = 1024;
            v59 = 333;
            v60 = 2112;
            v61 = v26;
            v62 = 2112;
            v63 = v27;
            v64 = 2112;
            v65 = v8;
            v66 = 2112;
            v67 = v51;
            _os_log_impl(&dword_215447000, v25, OS_LOG_TYPE_DEFAULT, "%s:%d call accessoryAttached: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x3Au);

          }
          objc_msgSend(v20, "accessoryUID");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "blePairingUUID");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "accInfo");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "supportedPairTypes");
          v31 = v8;
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "blePairing:accessoryAttached:blePairingUUID:accInfoDict:supportedPairTypes:", v51, v28, v29, v30, v32);

          v8 = v31;
          if (objc_msgSend(v20, "blePairingFinished"))
          {
            v33 = gLogObjects;
            v34 = gNumLogObjects;
            if (gLogObjects && gNumLogObjects >= 1)
            {
              v35 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v57 = (const char *)v33;
                v58 = 1024;
                v59 = v34;
                _os_log_error_impl(&dword_215447000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v36 = v18;
              v35 = v18;
            }
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v20, "accessoryUID");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "blePairingUUID");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136316418;
              v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
              v58 = 1024;
              v59 = 344;
              v60 = 2112;
              v61 = v37;
              v62 = 2112;
              v63 = v38;
              v64 = 2112;
              v65 = v31;
              v66 = 2112;
              v67 = v51;
              _os_log_impl(&dword_215447000, v35, OS_LOG_TYPE_DEFAULT, "%s:%d call pairingFinished: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x3Au);

            }
            objc_msgSend(v20, "accessoryUID");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "blePairingUUID");
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "blePairing:pairingFinished:blePairingUUID:", v51, v39, v40);

          }
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v52, v68, 16);
      }
      while (v17);
    }

    v9 = v47;
    self = v48;
    v15 = v45;
    v14 = v46;
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v41 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v41 = MEMORY[0x24BDACB70];
      v42 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315906;
      v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
      v58 = 1024;
      v59 = 355;
      v60 = 2112;
      v61 = v8;
      v62 = 2112;
      v63 = v51;
      _os_log_impl(&dword_215447000, v41, OS_LOG_TYPE_INFO, "%s:%d NOT accessoryServer_isServerAvailable(), delegate=%@, provider=%@", buf, 0x26u);
    }

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v43 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
        v43 = MEMORY[0x24BDACB70];
        v44 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315906;
        v57 = "-[ACCBLEPairingProviderInternal registerDelegate:provider:forUUID:]";
        v58 = 1024;
        v59 = 360;
        v60 = 2112;
        v61 = v8;
        v62 = 2112;
        v63 = v51;
        _os_log_impl(&dword_215447000, v43, OS_LOG_TYPE_DEFAULT, "%s:%d call blePairingNoAccessories, delegate=%@, provider=%@", buf, 0x26u);
      }

      objc_msgSend(v8, "blePairingNoAccessories:", v51);
    }
  }
  -[NSLock unlock](self->_delegateListLock, "unlock", v45, v46, v47, v48);

}

- (void)unregisterDelegateForUUID:(id)a3
{
  id v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gLogObjects)
    v5 = gNumLogObjects < 1;
  else
    v5 = 1;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v7 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  else
  {
    v7 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315650;
    v9 = "-[ACCBLEPairingProviderInternal unregisterDelegateForUUID:]";
    v10 = 1024;
    v11 = 371;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_215447000, v7, OS_LOG_TYPE_DEFAULT, "%s:%d, uuid %@", (uint8_t *)&v8, 0x1Cu);
  }

  -[NSLock lock](self->_delegateListLock, "lock");
  -[NSMutableDictionary removeObjectForKey:](self->_delegateList, "removeObjectForKey:", v4);
  -[NSLock unlock](self->_delegateListLock, "unlock");

}

- (void)connectToServer
{
  BOOL v3;
  id v4;
  NSObject *v5;
  NSString *providerUID;
  ACCBLEPairingProviderInternal *v7;
  int isServerAvailable;
  BOOL v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  NSString *v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  id v18;
  NSString *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  NSObject *v33;
  id v34;
  void *v35;
  void *v36;
  NSObject *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44;
  _QWORD v45[4];
  id v46;
  _BYTE buf[24];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    providerUID = self->_providerUID;
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = providerUID;
    _os_log_impl(&dword_215447000, v5, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider connectToServer, _providerUID=%@", buf, 0xCu);
  }

  v7 = self;
  objc_sync_enter(v7);
  isServerAvailable = accessoryServer_isServerAvailable();
  if (gLogObjects)
    v9 = gNumLogObjects <= 0;
  else
    v9 = 1;
  v10 = !v9;
  if (isServerAvailable)
  {
    if (v10)
    {
      v11 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v11 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v14 = v7->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v14;
      _os_log_impl(&dword_215447000, v11, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider connectToServer, _providerUID=%@, IS accessoryServer_isServerAvailable()", buf, 0xCu);
    }

    -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15 == 0;

    if (v16)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v17 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
        v17 = MEMORY[0x24BDACB70];
        v20 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215447000, v17, OS_LOG_TYPE_DEFAULT, "Connecting to XPC server...", buf, 2u);
      }

      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithMachServiceName:options:", CFSTR("com.apple.accessories.blepairing"), 4096);
      -[ACCBLEPairingProviderInternal setServerConnection:](v7, "setServerConnection:", v21);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DC62D8);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setRemoteObjectInterface:", v22);

      objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254DC6338);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "setExportedInterface:", v24);

      -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setExportedObject:", v7);

      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v7);
      v27 = MEMORY[0x24BDAC760];
      v45[0] = MEMORY[0x24BDAC760];
      v45[1] = 3221225472;
      v45[2] = __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke;
      v45[3] = &unk_24D3488F8;
      objc_copyWeak(&v46, (id *)buf);
      -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "setInvalidationHandler:", v45);

      v43[0] = v27;
      v43[1] = 3221225472;
      v43[2] = __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_149;
      v43[3] = &unk_24D3488F8;
      objc_copyWeak(&v44, (id *)buf);
      -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setInterruptionHandler:", v43);

      -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "resume");

      objc_destroyWeak(&v44);
      objc_destroyWeak(&v46);
      objc_destroyWeak((id *)buf);
    }
    -[ACCBLEPairingProviderInternal remoteObject](v7, "remoteObject");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31 == 0;

    if (v32)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v33 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
        v33 = MEMORY[0x24BDACB70];
        v34 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215447000, v33, OS_LOG_TYPE_DEFAULT, "Getting remote object...", buf, 2u);
      }

      -[ACCBLEPairingProviderInternal serverConnection](v7, "serverConnection");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_152);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[ACCBLEPairingProviderInternal setRemoteObject:](v7, "setRemoteObject:", v36);

      if (gLogObjects && gNumLogObjects >= 1)
      {
        v37 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
        v37 = MEMORY[0x24BDACB70];
        v38 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        -[ACCBLEPairingProviderInternal remoteObject](v7, "remoteObject");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v39;
        _os_log_impl(&dword_215447000, v37, OS_LOG_TYPE_DEFAULT, "Call initConnection to remoteObject=%@", buf, 0xCu);

      }
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, v7);
      -[ACCBLEPairingProviderInternal remoteObject](v7, "remoteObject");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41[0] = MEMORY[0x24BDAC760];
      v41[1] = 3221225472;
      v41[2] = __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_153;
      v41[3] = &unk_24D348960;
      objc_copyWeak(&v42, (id *)buf);
      objc_msgSend(v40, "initConnection:", v41);

      objc_destroyWeak(&v42);
      objc_destroyWeak((id *)buf);
    }
  }
  else
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v19 = v7->_providerUID;
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v19;
      _os_log_impl(&dword_215447000, v12, OS_LOG_TYPE_DEFAULT, "ACCBLEPairingProvider connectToServer, _providerUID=%@, NOT accessoryServer_isServerAvailable()", buf, 0xCu);
    }

  }
  objc_sync_exit(v7);

}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  id v7;
  id v8;
  uint8_t v9[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "serverConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInvalidationHandler:", 0);

  v4 = objc_loadWeakRetained(v1);
  objc_msgSend(v4, "setRemoteObject:", 0);

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  accessoryServer_serverIsUnreachable();
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_215447000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection invalidated!", v9, 2u);
  }

  v8 = objc_loadWeakRetained(v1);
  objc_msgSend(v8, "accessoryBLEPairingDetachAll");

}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_149(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  void *v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t v8[16];

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setRemoteObject:", 0);

  v3 = objc_loadWeakRetained(v1);
  objc_msgSend(v3, "serverConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  v5 = objc_loadWeakRetained(v1);
  objc_msgSend(v5, "setServerConnection:", 0);

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_215447000, v6, OS_LOG_TYPE_DEFAULT, "XPC connection interrupted!", v8, 2u);
  }

}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_150(uint64_t a1, void *a2)
{
  id v2;
  BOOL v3;
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  else
  {
    v5 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v8) = 0;
    _os_log_impl(&dword_215447000, v5, OS_LOG_TYPE_DEFAULT, "XPC connection error!", (uint8_t *)&v8, 2u);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v6 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = v2;
    _os_log_impl(&dword_215447000, v6, OS_LOG_TYPE_DEFAULT, "%@", (uint8_t *)&v8, 0xCu);
  }

}

void __48__ACCBLEPairingProviderInternal_connectToServer__block_invoke_153(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  id WeakRetained;
  void *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v4 = gNumLogObjects < 1;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v6 = MEMORY[0x24BDACB70];
    v5 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9[0] = 67109120;
    v9[1] = a2;
    _os_log_impl(&dword_215447000, v6, OS_LOG_TYPE_DEFAULT, "shouldStayConnected: %d", (uint8_t *)v9, 8u);
  }

  if ((a2 & 1) == 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "serverConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

  }
}

- (int)getAccDetectType:(int)a3
{
  int out_token;
  uint64_t state64;

  state64 = -1;
  if (a3 == -1)
  {
    out_token = -1;
    if (!notify_register_check("com.apple.accessories.scp.objdetect", &out_token))
    {
      notify_get_state(out_token, &state64);
      notify_cancel(out_token);
    }
  }
  else
  {
    notify_get_state(a3, &state64);
  }
  return state64;
}

- (void)accessoryBLEPairingAttached:(id)a3 blePairingUUID:(id)a4 accInfoDict:(id)a5 supportedPairTypes:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t i;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  id v32;
  const char *v33;
  NSObject *v34;
  uint32_t v35;
  id v36;
  NSObject *v37;
  id v38;
  ACCBLEPairingAccessory *v39;
  ACCBLEPairingProviderInternal *v40;
  id obj;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v10);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    v15 = (void *)v14;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v32 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v49 = (uint64_t)v10;
      v50 = 2112;
      v51 = v15;
      v33 = "accessoryBLEPairingAttached: accessory %@ (%@) already exists!";
      v34 = v16;
      v35 = 22;
LABEL_35:
      _os_log_impl(&dword_215447000, v34, OS_LOG_TYPE_DEFAULT, v33, buf, v35);
    }
  }
  else
  {
    v39 = -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:]([ACCBLEPairingAccessory alloc], "initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:", v10, v11, v12, v13);
    -[NSMutableDictionary setObject:forKey:](self->_accessories, "setObject:forKey:");
    -[NSLock lock](self->_delegateListLock, "lock");
    v46 = 0u;
    v47 = 0u;
    v44 = 0u;
    v45 = 0u;
    v40 = self;
    -[NSMutableDictionary allValues](self->_delegateList, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    if (v17)
    {
      v18 = v17;
      v43 = *(_QWORD *)v45;
      v42 = v13;
      v19 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v18; ++i)
        {
          v21 = v12;
          v22 = v10;
          if (*(_QWORD *)v45 != v43)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v23, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "provider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = gLogObjects;
          v27 = gNumLogObjects;
          if (gLogObjects)
            v28 = gNumLogObjects < 1;
          else
            v28 = 1;
          if (v28)
          {
            if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v49 = v26;
              v50 = 1024;
              LODWORD(v51) = v27;
              _os_log_error_impl(&dword_215447000, v19, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v29 = v19;
            v30 = v19;
          }
          else
          {
            v30 = *(id *)gLogObjects;
          }
          v10 = v22;
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v49 = (uint64_t)v22;
            v50 = 2112;
            v51 = v11;
            v52 = 2112;
            v53 = v24;
            v54 = 2112;
            v55 = v25;
            _os_log_impl(&dword_215447000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingAttached: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x2Au);
          }

          v12 = v21;
          v31 = v21;
          v13 = v42;
          objc_msgSend(v24, "blePairing:accessoryAttached:blePairingUUID:accInfoDict:supportedPairTypes:", v25, v22, v11, v31, v42);

        }
        v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
      }
      while (v18);
    }

    -[NSLock unlock](v40->_delegateListLock, "unlock");
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v16 = *(id *)gLogObjects;
      v15 = v39;
    }
    else
    {
      v15 = v39;
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v36 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v49 = (uint64_t)v10;
      v50 = 2112;
      v51 = v11;
      v52 = 2112;
      v53 = v15;
      v54 = 2112;
      v55 = v12;
      v56 = 2112;
      v57 = v13;
      v33 = "accessoryBLEPairingAttached: accessory %@, blePairingUUID %@, accessory=%@, accInfoDict=%@, supportedPairTypes=%@";
      v34 = v16;
      v35 = 52;
      goto LABEL_35;
    }
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v37 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v37 = MEMORY[0x24BDACB70];
    v38 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v49 = (uint64_t)v10;
    v50 = 2112;
    v51 = v11;
    v52 = 2112;
    v53 = v15;
    _os_log_impl(&dword_215447000, v37, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingAttached: accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
  }

}

- (void)accessoryBLEPairingDetached:(id)a3 blePairingUUID:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  BOOL v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  NSObject *v29;
  id v30;
  ACCBLEPairingProviderInternal *v31;
  void *v32;
  id obj;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  uint64_t v40;
  __int16 v41;
  id v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v34 = a4;
  v7 = v6;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (gLogObjects)
    v10 = gNumLogObjects <= 0;
  else
    v10 = 1;
  v11 = !v10;
  if (v8)
  {
    if (v11)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v40 = (uint64_t)v7;
      v41 = 2112;
      v42 = v34;
      v43 = 2112;
      v44 = v9;
      _os_log_impl(&dword_215447000, v12, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
    }
    v32 = v9;

    -[NSLock lock](self->_delegateListLock, "lock");
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v31 = self;
    -[NSMutableDictionary allValues](self->_delegateList, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v36;
      v18 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v36 != v17)
            objc_enumerationMutation(obj);
          v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
          objc_msgSend(v20, "delegate");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "provider");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = gLogObjects;
          v24 = gNumLogObjects;
          if (gLogObjects)
            v25 = gNumLogObjects < 1;
          else
            v25 = 1;
          if (v25)
          {
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v40 = v23;
              v41 = 1024;
              LODWORD(v42) = v24;
              _os_log_error_impl(&dword_215447000, v18, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v26 = v18;
            v27 = v18;
          }
          else
          {
            v27 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413058;
            v40 = (uint64_t)v7;
            v41 = 2112;
            v42 = v34;
            v43 = 2112;
            v44 = v21;
            v45 = 2112;
            v46 = v22;
            _os_log_impl(&dword_215447000, v27, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: accessory %@, blePairingUUID %@, call delegate=%@, provider=%@", buf, 0x2Au);
          }

          objc_msgSend(v21, "blePairing:accessoryDetached:blePairingUUID:", v22, v7, v34);
        }
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
      }
      while (v16);
    }

    -[NSLock unlock](v31->_delegateListLock, "unlock");
    -[NSMutableDictionary removeObjectForKey:](v31->_accessories, "removeObjectForKey:", v7);
    v9 = v32;
  }
  else
  {
    if (v11)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v28 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v40 = (uint64_t)v7;
      v41 = 2112;
      v42 = 0;
      _os_log_impl(&dword_215447000, v13, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: accessory %@ (%@) does not exist!", buf, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v29 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v29 = MEMORY[0x24BDACB70];
    v30 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v40 = (uint64_t)v7;
    v41 = 2112;
    v42 = v34;
    v43 = 2112;
    v44 = v9;
    _os_log_impl(&dword_215447000, v29, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetached: EXIT, accessory %@, blePairingUUID %@, accessory %@", buf, 0x20u);
  }

}

- (void)accessoryBLEPairingNoAccessories
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  int v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  ACCBLEPairingProviderInternal *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  void *v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
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
    _os_log_impl(&dword_215447000, v5, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingNoAccessories", buf, 2u);
  }

  -[NSLock lock](self->_delegateListLock, "lock");
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v20 = self;
  -[NSMutableDictionary allValues](self->_delegateList, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    v10 = MEMORY[0x24BDACB70];
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "delegate");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "provider");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = gLogObjects;
        v16 = gNumLogObjects;
        if (gLogObjects)
          v17 = gNumLogObjects < 1;
        else
          v17 = 1;
        if (v17)
        {
          if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v26 = v15;
            v27 = 1024;
            LODWORD(v28) = v16;
            _os_log_error_impl(&dword_215447000, v10, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v18 = v10;
          v19 = v10;
        }
        else
        {
          v19 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v26 = (uint64_t)v13;
          v27 = 2112;
          v28 = v14;
          _os_log_impl(&dword_215447000, v19, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingNoAccessories, call delegate=%@, provider=%@", buf, 0x16u);
        }

        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "blePairingNoAccessories:", v14);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v8);
  }

  -[NSLock unlock](v20->_delegateListLock, "unlock");
}

- (void)accessoryBLEPairingDetachAll
{
  ACCBLEPairingProviderInternal *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *accessories;
  BOOL v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  NSMutableDictionary *v29;
  id obj;
  uint64_t v31;
  ACCBLEPairingProviderInternal *v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint8_t v43[128];
  uint8_t buf[4];
  uint64_t v45;
  __int16 v46;
  int v47;
  uint64_t v48;

  v2 = self;
  v48 = *MEMORY[0x24BDAC8D0];
  v3 = self->_accessories;
  v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
  accessories = v2->_accessories;
  v2->_accessories = v4;

  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v8 = MEMORY[0x24BDACB70];
    v7 = MEMORY[0x24BDACB70];
  }
  else
  {
    v8 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v45 = -[NSMutableDictionary count](v3, "count");
    _os_log_impl(&dword_215447000, v8, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetachAll: notify detach of %lu accessories!", buf, 0xCu);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v29 = v3;
  -[NSMutableDictionary allValues](v3, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v33)
  {
    v9 = MEMORY[0x24BDACB70];
    v31 = *(_QWORD *)v39;
    v32 = v2;
    do
    {
      for (i = 0; i != v33; ++i)
      {
        if (*(_QWORD *)v39 != v31)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v12 = gLogObjects;
        v13 = gNumLogObjects;
        if (gLogObjects)
          v14 = gNumLogObjects < 1;
        else
          v14 = 1;
        if (v14)
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 134218240;
            v45 = v12;
            v46 = 1024;
            v47 = v13;
            _os_log_error_impl(&dword_215447000, v9, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
          }
          v15 = v9;
        }
        else
        {
          v9 = *(id *)gLogObjects;
        }
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v45 = (uint64_t)v11;
          _os_log_impl(&dword_215447000, v9, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetachAll: accessory %@", buf, 0xCu);
        }

        -[NSLock lock](v2->_delegateListLock, "lock");
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        -[NSMutableDictionary allValues](v2->_delegateList, "allValues");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
        if (v17)
        {
          v18 = v17;
          v19 = *(_QWORD *)v35;
          do
          {
            for (j = 0; j != v18; ++j)
            {
              if (*(_QWORD *)v35 != v19)
                objc_enumerationMutation(v16);
              v21 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * j);
              objc_msgSend(v21, "delegate");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "provider");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "accessoryUID");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "blePairingUUID");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "blePairing:accessoryDetached:blePairingUUID:", v23, v24, v25);

            }
            v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
          }
          while (v18);
        }

        v2 = v32;
        -[NSLock unlock](v32->_delegateListLock, "unlock");
        v9 = MEMORY[0x24BDACB70];
      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v33);
  }

  if (gLogObjects && gNumLogObjects >= 1)
  {
    v26 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v26 = MEMORY[0x24BDACB70];
    v27 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v28 = -[NSMutableDictionary count](v29, "count");
    *(_DWORD *)buf = 134217984;
    v45 = v28;
    _os_log_impl(&dword_215447000, v26, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDetachAll: EXIT, notify detach of %lu accessories!", buf, 0xCu);
  }

}

- (void)accessoryBLEPairingStateUpdate:(id)a3 blePairingUUID:(id)a4 validMask:(unsigned int)a5 btRadioOn:(BOOL)a6 pairingState:(int)a7 pairingModeOn:(BOOL)a8
{
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  void *v34;
  id obj;
  _BOOL4 v37;
  _BOOL4 v39;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  uint64_t v47;
  __int16 v48;
  id v49;
  __int16 v50;
  unsigned int v51;
  __int16 v52;
  _BOOL4 v53;
  __int16 v54;
  int v55;
  __int16 v56;
  _BOOL4 v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  _BYTE v62[128];
  uint64_t v63;

  v39 = a8;
  v37 = a6;
  v63 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v40 = a4;
  v41 = v10;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (gLogObjects)
    v13 = gNumLogObjects <= 0;
  else
    v13 = 1;
  v14 = !v13;
  if (v11)
  {
    if (v14)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413826;
      v47 = (uint64_t)v41;
      v48 = 2112;
      v49 = v40;
      v50 = 1024;
      v51 = a5;
      v52 = 1024;
      v53 = v37;
      v54 = 1024;
      v55 = a7;
      v56 = 1024;
      v57 = v39;
      v58 = 2112;
      v59 = v12;
      _os_log_impl(&dword_215447000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: accessory %@, blePairingUUID %@, validMask=%x btRadioOn=%d pairingState=%d pairingModeOn=%d, accessory=%@", buf, 0x38u);
    }
    v34 = v12;

    -[NSLock lock](self->_delegateListLock, "lock");
    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    -[NSMutableDictionary allValues](self->_delegateList, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v43;
      v21 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v43 != v20)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(v23, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "provider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = gLogObjects;
          v27 = gNumLogObjects;
          if (gLogObjects)
            v28 = gNumLogObjects < 1;
          else
            v28 = 1;
          if (v28)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v47 = v26;
              v48 = 1024;
              LODWORD(v49) = v27;
              _os_log_error_impl(&dword_215447000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v29 = v21;
            v30 = v21;
          }
          else
          {
            v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138414082;
            v47 = (uint64_t)v41;
            v48 = 2112;
            v49 = v40;
            v50 = 1024;
            v51 = a5;
            v52 = 1024;
            v53 = v37;
            v54 = 1024;
            v55 = a7;
            v56 = 1024;
            v57 = v39;
            v58 = 2112;
            v59 = v24;
            v60 = 2112;
            v61 = v25;
            _os_log_impl(&dword_215447000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: accessory %@, blePairingUUID %@, validMask=%x btRadioOn=%d pairingState=%d pairingModeOn=%d, call delegate=%@, provider=%@", buf, 0x42u);
          }

          objc_msgSend(v24, "blePairingStateUpdate:validMask:btRadioOn:pairingState:pairingModeOn:accessory:blePairingUUID:", v25, a5, v37, a7, v39, v41, v40);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v62, 16);
      }
      while (v19);
    }

    -[NSLock unlock](self->_delegateListLock, "unlock");
    v12 = v34;
  }
  else
  {
    if (v14)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v47 = (uint64_t)v41;
      v48 = 2112;
      v49 = 0;
      _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v32 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v32 = MEMORY[0x24BDACB70];
    v33 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413826;
    v47 = (uint64_t)v41;
    v48 = 2112;
    v49 = v40;
    v50 = 1024;
    v51 = a5;
    v52 = 1024;
    v53 = v37;
    v54 = 1024;
    v55 = a7;
    v56 = 1024;
    v57 = v39;
    v58 = 2112;
    v59 = v12;
    _os_log_impl(&dword_215447000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingStateUpdate: EXIT, accessory %@, blePairingUUID %@, validMask=%x btRadioOn=%d pairingState=%d pairingModeOn=%d, accessory=%@", buf, 0x38u);
  }

}

- (void)accessoryBLEPairingInfoUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairInfoList:(id)a6
{
  uint64_t v7;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  ACCBLEPairingProviderInternal *v34;
  id obj;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v7 = a5;
  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v37 = a4;
  v36 = a6;
  v38 = v10;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (gLogObjects)
    v13 = gNumLogObjects <= 0;
  else
    v13 = 1;
  v14 = !v13;
  if (v11)
  {
    if (v14)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v44 = (uint64_t)v38;
      v45 = 2112;
      v46 = v37;
      v47 = 1024;
      v48 = v7;
      v49 = 2112;
      v50 = v36;
      v51 = 2112;
      v52 = v12;
      _os_log_impl(&dword_215447000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: accessory %@, blePairingUUID %@, pairType=%d pairInfoList=%@, accessory=%@", buf, 0x30u);
    }

    -[NSLock lock](self->_delegateListLock, "lock");
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = self;
    -[NSMutableDictionary allValues](self->_delegateList, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      v21 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v23, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "provider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = gLogObjects;
          v27 = gNumLogObjects;
          if (gLogObjects)
            v28 = gNumLogObjects < 1;
          else
            v28 = 1;
          if (v28)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v44 = v26;
              v45 = 1024;
              LODWORD(v46) = v27;
              _os_log_error_impl(&dword_215447000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v29 = v21;
            v30 = v21;
          }
          else
          {
            v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413570;
            v44 = (uint64_t)v38;
            v45 = 2112;
            v46 = v37;
            v47 = 1024;
            v48 = v7;
            v49 = 2112;
            v50 = v36;
            v51 = 2112;
            v52 = v24;
            v53 = 2112;
            v54 = v25;
            _os_log_impl(&dword_215447000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: accessory %@, blePairingUUID %@, pairType=%d pairInfoList=%@, call delegate=%@, provider=%@", buf, 0x3Au);
          }

          objc_msgSend(v24, "blePairingInfoUpdate:pairType:pairInfoList:accessory:blePairingUUID:", v25, v7, v36, v38, v37);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v19);
    }

    -[NSLock unlock](v34->_delegateListLock, "unlock");
  }
  else
  {
    if (v14)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v44 = (uint64_t)v38;
      v45 = 2112;
      v46 = 0;
      _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v32 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v32 = MEMORY[0x24BDACB70];
    v33 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v44 = (uint64_t)v38;
    v45 = 2112;
    v46 = v37;
    v47 = 1024;
    v48 = v7;
    v49 = 2112;
    v50 = v36;
    v51 = 2112;
    v52 = v12;
    _os_log_impl(&dword_215447000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingInfoUpdate: EXIT, accessory %@, blePairingUUID %@, pairType=%d pairInfoList=%@, accessory=%@", buf, 0x30u);
  }

}

- (void)accessoryBLEPairingDataUpdate:(id)a3 blePairingUUID:(id)a4 pairType:(unsigned __int8)a5 pairData:(id)a6
{
  uint64_t v7;
  id v10;
  uint64_t v11;
  void *v12;
  BOOL v13;
  int v14;
  NSObject *v15;
  NSObject *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  int v27;
  BOOL v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  NSObject *v32;
  id v33;
  ACCBLEPairingProviderInternal *v34;
  id obj;
  id v36;
  id v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  uint64_t v44;
  __int16 v45;
  id v46;
  __int16 v47;
  int v48;
  __int16 v49;
  id v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;

  v7 = a5;
  v56 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v37 = a4;
  v36 = a6;
  v38 = v10;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v10);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)v11;
  if (gLogObjects)
    v13 = gNumLogObjects <= 0;
  else
    v13 = 1;
  v14 = !v13;
  if (v11)
  {
    if (v14)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v17 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      v44 = (uint64_t)v38;
      v45 = 2112;
      v46 = v37;
      v47 = 1024;
      v48 = v7;
      v49 = 2112;
      v50 = v36;
      v51 = 2112;
      v52 = v12;
      _os_log_impl(&dword_215447000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: accessory %@, blePairingUUID %@, pairType=%d pairData=%@, accessory=%@", buf, 0x30u);
    }

    -[NSLock lock](self->_delegateListLock, "lock");
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v34 = self;
    -[NSMutableDictionary allValues](self->_delegateList, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v40;
      v21 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v40 != v20)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
          objc_msgSend(v23, "delegate");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "provider");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = gLogObjects;
          v27 = gNumLogObjects;
          if (gLogObjects)
            v28 = gNumLogObjects < 1;
          else
            v28 = 1;
          if (v28)
          {
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 134218240;
              v44 = v26;
              v45 = 1024;
              LODWORD(v46) = v27;
              _os_log_error_impl(&dword_215447000, v21, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
            }
            v29 = v21;
            v30 = v21;
          }
          else
          {
            v30 = *(id *)gLogObjects;
          }
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138413570;
            v44 = (uint64_t)v38;
            v45 = 2112;
            v46 = v37;
            v47 = 1024;
            v48 = v7;
            v49 = 2112;
            v50 = v36;
            v51 = 2112;
            v52 = v24;
            v53 = 2112;
            v54 = v25;
            _os_log_impl(&dword_215447000, v30, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: accessory %@, blePairingUUID %@, pairType=%d pairData=%@, call delegate=%@, provider=%@", buf, 0x3Au);
          }

          objc_msgSend(v24, "blePairingDataUpdate:pairType:pairData:accessory:blePairingUUID:", v25, v7, v36, v38, v37);
        }
        v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v19);
    }

    -[NSLock unlock](v34->_delegateListLock, "unlock");
  }
  else
  {
    if (v14)
    {
      v16 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v16 = MEMORY[0x24BDACB70];
      v31 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v44 = (uint64_t)v38;
      v45 = 2112;
      v46 = 0;
      _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: accessory %@ (%@) does not exist!", buf, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v32 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v32 = MEMORY[0x24BDACB70];
    v33 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138413314;
    v44 = (uint64_t)v38;
    v45 = 2112;
    v46 = v37;
    v47 = 1024;
    v48 = v7;
    v49 = 2112;
    v50 = v36;
    v51 = 2112;
    v52 = v12;
    _os_log_impl(&dword_215447000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingDataUpdate: EXIT, accessory %@, blePairingUUID %@, pairType=%d pairData=%@, accessory=%@", buf, 0x30u);
  }

}

- (void)accessoryBLEPairingFinished:(id)a3 blePairingUUID:(id)a4
{
  id v6;
  uint64_t v7;
  NSMutableDictionary *v8;
  BOOL v9;
  int v10;
  char *__ptr32 *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  NSMutableDictionary *delegateList;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  char v27;
  uint64_t v28;
  int v29;
  BOOL v30;
  int v31;
  NSObject *v32;
  NSObject *v33;
  NSObject *v34;
  NSObject *v35;
  id v36;
  NSObject *v37;
  id v38;
  ACCBLEPairingProviderInternal *v39;
  NSMutableDictionary *v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  uint64_t v49;
  __int16 v50;
  id v51;
  __int16 v52;
  NSMutableDictionary *v53;
  uint64_t v54;

  v54 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v41 = a4;
  v42 = v6;
  -[NSMutableDictionary objectForKey:](self->_accessories, "objectForKey:", v6);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (NSMutableDictionary *)v7;
  if (gLogObjects)
    v9 = gNumLogObjects <= 0;
  else
    v9 = 1;
  v10 = !v9;
  v11 = &off_215450000;
  if (v7)
  {
    if (v10)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v14 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v49 = (uint64_t)v42;
      v50 = 2112;
      v51 = v41;
      v52 = 2112;
      v53 = v8;
      _os_log_impl(&dword_215447000, v12, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
    }

    -[NSLock lock](self->_delegateListLock, "lock");
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v15 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v15 = MEMORY[0x24BDACB70];
      v16 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      delegateList = self->_delegateList;
      *(_DWORD *)buf = 138412802;
      v49 = (uint64_t)v42;
      v50 = 2112;
      v51 = v41;
      v52 = 2112;
      v53 = delegateList;
      _os_log_impl(&dword_215447000, v15, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: accessory %@, blePairingUUID %@, _delegateList=%@", buf, 0x20u);
    }

    v40 = v8;
    -[NSMutableDictionary setBlePairingFinished:](v8, "setBlePairingFinished:", 1);
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v39 = self;
    -[NSMutableDictionary allValues](self->_delegateList, "allValues");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v44;
      v22 = MEMORY[0x24BDACB70];
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v44 != v21)
            objc_enumerationMutation(v18);
          v24 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v24, "delegate");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "provider");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          v27 = objc_opt_respondsToSelector();
          v28 = gLogObjects;
          v29 = gNumLogObjects;
          if (gLogObjects)
            v30 = gNumLogObjects <= 0;
          else
            v30 = 1;
          v31 = !v30;
          if ((v27 & 1) != 0)
          {
            if (v31)
            {
              v32 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v49 = v28;
                v50 = 1024;
                LODWORD(v51) = v29;
                _os_log_error_impl(&dword_215447000, v22, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v34 = v22;
              v32 = v22;
            }
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = (uint64_t)v26;
              v50 = 2112;
              v51 = v25;
              _os_log_impl(&dword_215447000, v32, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: delegate respond to blePairing:pairingFinished:blePairingUUID:, provider =%@, delegate = %@", buf, 0x16u);
            }

            objc_msgSend(v25, "blePairing:pairingFinished:blePairingUUID:", v26, v42, v41);
          }
          else
          {
            if (v31)
            {
              v33 = *(id *)gLogObjects;
            }
            else
            {
              if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 134218240;
                v49 = v28;
                v50 = 1024;
                LODWORD(v51) = v29;
                _os_log_error_impl(&dword_215447000, v22, OS_LOG_TYPE_ERROR, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", buf, 0x12u);
              }
              v35 = v22;
              v33 = v22;
            }
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v49 = (uint64_t)v26;
              v50 = 2112;
              v51 = v25;
              _os_log_impl(&dword_215447000, v33, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: delegate doesn't respond to blePairing:pairingFinished:blePairingUUID:, provider = %@, delegate = %@", buf, 0x16u);
            }

          }
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v20);
    }

    -[NSLock unlock](v39->_delegateListLock, "unlock");
    v8 = v40;
    v11 = &off_215450000;
  }
  else
  {
    if (v10)
    {
      v13 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v13 = MEMORY[0x24BDACB70];
      v36 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v49 = (uint64_t)v42;
      v50 = 2112;
      v51 = 0;
      _os_log_impl(&dword_215447000, v13, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: accessory %@ (%@) does not exist!", buf, 0x16u);
    }

  }
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v37 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v37 = MEMORY[0x24BDACB70];
    v38 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = *((_QWORD *)v11 + 121);
    v49 = (uint64_t)v42;
    v50 = 2112;
    v51 = v41;
    v52 = 2112;
    v53 = v8;
    _os_log_impl(&dword_215447000, v37, OS_LOG_TYPE_DEFAULT, "accessoryBLEPairingFinished: EXIT, accessory %@, blePairingUUID %@, accessory=%@", buf, 0x20u);
  }

}

- (void)startBLEUpdates:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 bRadioUpdatesOn:(BOOL)a6 bPairInfoUpdatesOn:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  id v12;
  NSString *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  ACCBLEPairingXPCServerProtocol *remoteObject;
  NSObject *v18;
  id v19;
  NSString *providerUID;
  int v21;
  id v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  int v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v7 = a7;
  v8 = a6;
  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (NSString *)a4;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138413314;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 1024;
    v26 = a5;
    v27 = 1024;
    v28 = v8;
    v29 = 1024;
    v30 = v7;
    _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "startBLEUpdates: %@, blePairingUUID %@, pairType=%d bRadioUpdatesOn=%d bPairInfoUpdatesOn=%d", (uint8_t *)&v21, 0x28u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCBLEPairingXPCServerProtocol startBLEUpdates:blePairingUUID:pairType:bRadioUpdatesOn:bPairInfoUpdatesOn:](remoteObject, "startBLEUpdates:blePairingUUID:pairType:bRadioUpdatesOn:bPairInfoUpdatesOn:", v12, v13, a5, v8, v7);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v21 = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = providerUID;
      _os_log_impl(&dword_215447000, v18, OS_LOG_TYPE_DEFAULT, "startBLEUpdates: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v21, 0x16u);
    }

  }
}

- (void)deviceStateUpdate:(id)a3 blePairingUUID:(id)a4 bRadioOn:(BOOL)a5 pairState:(int)a6 bPairModeOn:(BOOL)a7
{
  _BOOL8 v7;
  uint64_t v8;
  _BOOL8 v9;
  id v12;
  NSString *v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  ACCBLEPairingXPCServerProtocol *remoteObject;
  NSObject *v18;
  id v19;
  NSString *providerUID;
  int v21;
  id v22;
  __int16 v23;
  NSString *v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  int v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v7 = a7;
  v8 = *(_QWORD *)&a6;
  v9 = a5;
  v31 = *MEMORY[0x24BDAC8D0];
  v12 = a3;
  v13 = (NSString *)a4;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 138413314;
    v22 = v12;
    v23 = 2112;
    v24 = v13;
    v25 = 1024;
    v26 = v9;
    v27 = 1024;
    v28 = v8;
    v29 = 1024;
    v30 = v7;
    _os_log_impl(&dword_215447000, v16, OS_LOG_TYPE_DEFAULT, "deviceStateUpdate: %@, blePairingUUID %@, bRadioOn=%d pairState=%d bPairModeOn=%d", (uint8_t *)&v21, 0x28u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCBLEPairingXPCServerProtocol deviceStateUpdate:blePairingUUID:bRadioOn:pairState:bPairModeOn:](remoteObject, "deviceStateUpdate:blePairingUUID:bRadioOn:pairState:bPairModeOn:", v12, v13, v9, v8, v7);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v18 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v18 = MEMORY[0x24BDACB70];
      v19 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v21 = 138412546;
      v22 = v12;
      v23 = 2112;
      v24 = providerUID;
      _os_log_impl(&dword_215447000, v18, OS_LOG_TYPE_DEFAULT, "deviceStateUpdate: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v21, 0x16u);
    }

  }
}

- (void)devicePairingData:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairData:(id)a6
{
  id v10;
  NSString *v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  ACCBLEPairingXPCServerProtocol *remoteObject;
  NSObject *v17;
  id v18;
  NSString *providerUID;
  int v20;
  id v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (NSString *)a4;
  v12 = a6;
  if (gLogObjects)
    v13 = gNumLogObjects < 1;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413058;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 1024;
    v25 = a5;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_215447000, v15, OS_LOG_TYPE_DEFAULT, "devicePairingData: %@, blePairingUUID %@, pairType=%d pairData=%@", (uint8_t *)&v20, 0x26u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCBLEPairingXPCServerProtocol devicePairingData:blePairingUUID:pairType:pairData:](remoteObject, "devicePairingData:blePairingUUID:pairType:pairData:", v10, v11, a5, v12);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v20 = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = providerUID;
      _os_log_impl(&dword_215447000, v17, OS_LOG_TYPE_DEFAULT, "devicePairingData: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v20, 0x16u);
    }

  }
}

- (void)deviceUpdatePairingInfo:(id)a3 blePairingUUID:(id)a4 pairType:(int)a5 pairInfo:(id)a6
{
  id v10;
  NSString *v11;
  id v12;
  BOOL v13;
  id v14;
  NSObject *v15;
  ACCBLEPairingXPCServerProtocol *remoteObject;
  NSObject *v17;
  id v18;
  NSString *providerUID;
  int v20;
  id v21;
  __int16 v22;
  NSString *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = (NSString *)a4;
  v12 = a6;
  if (gLogObjects)
    v13 = gNumLogObjects < 1;
  else
    v13 = 1;
  if (v13)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v15 = MEMORY[0x24BDACB70];
    v14 = MEMORY[0x24BDACB70];
  }
  else
  {
    v15 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138413058;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 1024;
    v25 = a5;
    v26 = 2112;
    v27 = v12;
    _os_log_impl(&dword_215447000, v15, OS_LOG_TYPE_DEFAULT, "deviceUpdatePairingInfo: %@, blePairingUUID %@, pairType=%d pairInfo=%@", (uint8_t *)&v20, 0x26u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCBLEPairingXPCServerProtocol deviceUpdatePairingInfo:blePairingUUID:pairType:pairInfo:](remoteObject, "deviceUpdatePairingInfo:blePairingUUID:pairType:pairInfo:", v10, v11, a5, v12);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v17 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v17 = MEMORY[0x24BDACB70];
      v18 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v20 = 138412546;
      v21 = v10;
      v22 = 2112;
      v23 = providerUID;
      _os_log_impl(&dword_215447000, v17, OS_LOG_TYPE_DEFAULT, "deviceUpdatePairingInfo: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v20, 0x16u);
    }

  }
}

- (void)stopBLEUpdates:(id)a3 blePairingUUID:(id)a4
{
  id v6;
  NSString *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  ACCBLEPairingXPCServerProtocol *remoteObject;
  NSObject *v12;
  id v13;
  NSString *providerUID;
  int v15;
  id v16;
  __int16 v17;
  NSString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = (NSString *)a4;
  if (gLogObjects)
    v8 = gNumLogObjects < 1;
  else
    v8 = 1;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
    v10 = MEMORY[0x24BDACB70];
    v9 = MEMORY[0x24BDACB70];
  }
  else
  {
    v10 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412546;
    v16 = v6;
    v17 = 2112;
    v18 = v7;
    _os_log_impl(&dword_215447000, v10, OS_LOG_TYPE_DEFAULT, "stopBLEUpdates: %@, blePairingUUID %@", (uint8_t *)&v15, 0x16u);
  }

  remoteObject = self->_remoteObject;
  if (remoteObject)
  {
    -[ACCBLEPairingXPCServerProtocol stopBLEUpdates:blePairingUUID:](remoteObject, "stopBLEUpdates:blePairingUUID:", v6, v7);
  }
  else
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v12 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[ACCBLEPairingAccessory initWithAccessoryUID:blePairingUUID:andAccInfo:supportedPairTypes:].cold.1();
      v12 = MEMORY[0x24BDACB70];
      v13 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      providerUID = self->_providerUID;
      v15 = 138412546;
      v16 = v6;
      v17 = 2112;
      v18 = providerUID;
      _os_log_impl(&dword_215447000, v12, OS_LOG_TYPE_DEFAULT, "stopBLEUpdates: %@, _remoteObject nil, _providerUID=%@", (uint8_t *)&v15, 0x16u);
    }

  }
}

- (int)lastScorpiusDetectType
{
  return self->_lastScorpiusDetectType;
}

- (void)setLastScorpiusDetectType:(int)a3
{
  self->_lastScorpiusDetectType = a3;
}

- (NSMutableDictionary)delegateList
{
  return self->_delegateList;
}

- (void)setDelegateList:(id)a3
{
  objc_storeStrong((id *)&self->_delegateList, a3);
}

- (NSLock)delegateListLock
{
  return self->_delegateListLock;
}

- (void)setDelegateListLock:(id)a3
{
  objc_storeStrong((id *)&self->_delegateListLock, a3);
}

- (NSString)providerUID
{
  return self->_providerUID;
}

- (void)setProviderUID:(id)a3
{
  objc_storeStrong((id *)&self->_providerUID, a3);
}

- (NSXPCConnection)serverConnection
{
  return self->_serverConnection;
}

- (void)setServerConnection:(id)a3
{
  objc_storeStrong((id *)&self->_serverConnection, a3);
}

- (ACCBLEPairingXPCServerProtocol)remoteObject
{
  return self->_remoteObject;
}

- (void)setRemoteObject:(id)a3
{
  objc_storeStrong((id *)&self->_remoteObject, a3);
}

- (NSMutableDictionary)accessories
{
  return self->_accessories;
}

- (void)setAccessories:(id)a3
{
  objc_storeStrong((id *)&self->_accessories, a3);
}

- (int)accDetectToken
{
  return self->_accDetectToken;
}

- (void)setAccDetectToken:(int)a3
{
  self->_accDetectToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_remoteObject, 0);
  objc_storeStrong((id *)&self->_serverConnection, 0);
  objc_storeStrong((id *)&self->_providerUID, 0);
  objc_storeStrong((id *)&self->_delegateListLock, 0);
  objc_storeStrong((id *)&self->_delegateList, 0);
}

@end
