@implementation ACCTransportPluginIOAccessoryManager

- (void)initPlugin
{
  objc_super v3;

  init_logging();
  v3.receiver = self;
  v3.super_class = (Class)ACCTransportPluginIOAccessoryManager;
  -[ACCTransportPlugin initPlugin](&v3, sel_initPlugin);
}

- (NSString)pluginName
{
  return (NSString *)CFSTR("IOAccessoryManager");
}

- (void)startPlugin
{
  BOOL v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[16];

  if (gLogObjects)
    v3 = gNumLogObjects < 1;
  else
    v3 = 1;
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
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
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "Starting IOAccessoryManager transport plugin...", buf, 2u);
  }

  v8.receiver = self;
  v8.super_class = (Class)ACCTransportPluginIOAccessoryManager;
  -[ACCTransportPlugin startPlugin](&v8, sel_startPlugin);
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", self);

  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "startIOACCTransportManager");

  -[ACCTransportPlugin setHandler:forEndpointProperty:](self, "setHandler:forEndpointProperty:", &__block_literal_global_8, *MEMORY[0x24BE1A180]);
  -[ACCTransportPluginIOAccessoryManager setIsRunning:](self, "setIsRunning:", 1);
}

void __51__ACCTransportPluginIOAccessoryManager_startPlugin__block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v5;
  void *v6;
  id v7;

  v5 = a2;
  LODWORD(a4) = objc_msgSend(a4, "BOOLValue");
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)a4)
    objc_msgSend(v6, "handleOpenEASessionNotification:", v5);
  else
    objc_msgSend(v6, "handleCloseEASessionNotification:", v5);

}

- (void)stopPlugin
{
  void *v3;
  void *v4;
  NSObject *v5;
  id v6;
  uint8_t v7[16];
  objc_super v8;

  -[ACCTransportPlugin setHandler:forEndpointProperty:](self, "setHandler:forEndpointProperty:", 0, *MEMORY[0x24BE1A180]);
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopIOACCTransportManager");

  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", 0);

  v8.receiver = self;
  v8.super_class = (Class)ACCTransportPluginIOAccessoryManager;
  -[ACCTransportPlugin stopPlugin](&v8, sel_stopPlugin);
  -[ACCTransportPluginIOAccessoryManager setIsRunning:](self, "setIsRunning:", 0);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v5 = *(id *)gLogObjects;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v5 = MEMORY[0x24BDACB70];
    v6 = MEMORY[0x24BDACB70];
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21722C000, v5, OS_LOG_TYPE_DEFAULT, "Stopped IOAccessoryManager plugin!", v7, 2u);
  }

}

- (BOOL)sendOutgoingData:(id)a3 forEndpointWithUUID:(id)a4 connectionUUID:(id)a5
{
  id v7;
  id v8;
  id v9;
  BOOL v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v15;
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (gLogObjects)
    v10 = gNumLogObjects < 1;
  else
    v10 = 1;
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v12 = MEMORY[0x24BDACB70];
    v11 = MEMORY[0x24BDACB70];
  }
  else
  {
    v12 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412802;
    v16 = v7;
    v17 = 2112;
    v18 = v9;
    v19 = 2112;
    v20 = v8;
    _os_log_debug_impl(&dword_21722C000, v12, OS_LOG_TYPE_DEBUG, "Plugin sending outgoing data %@ for connection UUID: %@ endpoint UUID: %@", (uint8_t *)&v15, 0x20u);
  }

  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "transmitData:forEndpointUUID:", v7, v8);

  return 1;
}

- (void)authStatusDidChange:(int)a3 forConnectionWithUUID:(id)a4 previousAuthStatus:(int)a5 authType:(int)a6 connectionIsAuthenticated:(BOOL)a7 connectionWasAuthenticated:(BOOL)a8
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v13;
  BOOL v14;
  id v15;
  NSObject *v16;
  const char *v17;
  const char *v18;
  void *v19;
  unsigned int v20;
  NSObject *v21;
  void *v22;
  int v23;
  NSObject *v24;
  int v25;
  NSObject *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  uint64_t v35;
  id v36;
  _BYTE *v37;
  uint64_t v38;
  BOOL v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t v58[128];
  uint8_t buf[4];
  id v60;
  __int16 v61;
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  int v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  const char *v70;
  uint64_t v71;

  v8 = a8;
  v9 = a7;
  v71 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  if (gLogObjects)
    v14 = gNumLogObjects < 1;
  else
    v14 = 1;
  if (v14)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
    v16 = MEMORY[0x24BDACB70];
    v15 = MEMORY[0x24BDACB70];
  }
  else
  {
    v16 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = "NO";
    *(_DWORD *)buf = 138413570;
    v60 = v13;
    if (v9)
      v18 = "YES";
    else
      v18 = "NO";
    v61 = 1024;
    v62 = a3;
    if (v8)
      v17 = "YES";
    v63 = 1024;
    v64 = a5;
    v65 = 1024;
    v66 = a6;
    v67 = 2080;
    v68 = v18;
    v69 = 2080;
    v70 = v17;
    _os_log_impl(&dword_21722C000, v16, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, previousAuthStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionIsAuthenticated: %s, connectionWasAuthenticated: %s", buf, 0x32u);
  }

  switch(a6)
  {
    case 1:
    case 3:
      +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegate");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v51, "connectionTypeForConnectionWithUUID:", v13);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v21 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v21 = MEMORY[0x24BDACB70];
        v27 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v60 = v13;
        v61 = 1024;
        v62 = a3;
        v63 = 1024;
        v64 = a6;
        v65 = 1024;
        v66 = v20;
        _os_log_impl(&dword_21722C000, v21, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionType %{coreacc:ACCConnection_Type_t}d", buf, 0x1Eu);
      }

      if (v20 > 6)
      {
        v22 = v51;
        goto LABEL_75;
      }
      v50 = v13;
      v22 = v51;
      if (((1 << v20) & 0x5A) == 0)
        goto LABEL_75;
      objc_msgSend(v51, "certificateDataForConnectionWithUUID:", v13);
      v28 = objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
        v29 = 2;
      else
        v29 = 1;
      v53 = (void *)v28;
      objc_msgSend(v19, "setFeaturesFromAuthStatus:andAuthCert:certType:forConnectionUUID:withConnectionType:", v29);
      -[ACCTransportPlugin allConnectionUUIDs](self, "allConnectionUUIDs");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "allObjects");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
      if (v31)
      {
        v32 = v31;
        v33 = *(_QWORD *)v55;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v55 != v33)
              objc_enumerationMutation(v30);
            v35 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * i);
            if (-[ACCTransportPlugin connectionTypeForConnectionWithUUID:](self, "connectionTypeForConnectionWithUUID:", v35) == 1)
            {
              objc_msgSend(v19, "digitalIDDataForUpstreamConnection:", v35);
              v36 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
              v37 = (_BYTE *)objc_msgSend(v36, "bytes");
              v38 = objc_msgSend(v36, "length");
              if (v37)
                v39 = v38 == 6;
              else
                v39 = 0;
              if (v39 && (*v37 & 0x38) == 0x18)
                objc_msgSend(v19, "setFeaturesFromAuthStatus:andAuthCert:certType:forConnectionUUID:withConnectionType:", v29, v53, 0xFFFFFFFFLL, v35, 1);

            }
          }
          v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v54, v58, 16);
        }
        while (v32);
      }

      v13 = v50;
      v22 = v51;
      v40 = v53;
      goto LABEL_74;
    case 2:
      +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "connectionTypeForConnectionWithUUID:", v13);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v24 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v24 = MEMORY[0x24BDACB70];
        v41 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v60 = v13;
        v61 = 1024;
        v62 = a3;
        v63 = 1024;
        v64 = 2;
        v65 = 1024;
        v66 = v23;
        _os_log_impl(&dword_21722C000, v24, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionType %{coreacc:ACCConnection_Type_t}d", buf, 0x1Eu);
      }

      if (v23 != 8)
        goto LABEL_75;
      objc_msgSend(v22, "certificateDataForConnectionWithUUID:", v13);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
        v42 = 2;
      else
        v42 = 1;
      v43 = v19;
      v44 = v40;
      v45 = 0xFFFFFFFFLL;
      v46 = v13;
      v47 = 8;
      break;
    case 4:
      +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "delegate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v22, "connectionTypeForConnectionWithUUID:", v13);
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v26 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[ACCTransportIOAccessoryOOBPairing dealloc].cold.1();
        v26 = MEMORY[0x24BDACB70];
        v48 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        v60 = v13;
        v61 = 1024;
        v62 = a3;
        v63 = 1024;
        v64 = 4;
        v65 = 1024;
        v66 = v25;
        _os_log_impl(&dword_21722C000, v26, OS_LOG_TYPE_INFO, "authStatusDidChange handler!\nconnectionUUID: %@, authStatus: %{coreacc:ACCAuthInfo_Status_t}d, authType: %{coreacc:ACCAuthInfo_Type_t}d, connectionType %{coreacc:ACCConnection_Type_t}d", buf, 0x1Eu);
      }

      if (v25 != 4)
        goto LABEL_75;
      objc_msgSend(v22, "certificateDataForConnectionWithUUID:", v13);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (a3 == 2)
        v42 = 2;
      else
        v42 = 1;
      v43 = v19;
      v44 = v40;
      v45 = 2;
      v46 = v13;
      v47 = 4;
      break;
    default:
      goto LABEL_76;
  }
  objc_msgSend(v43, "setFeaturesFromAuthStatus:andAuthCert:certType:forConnectionUUID:withConnectionType:", v42, v44, v45, v46, v47);
LABEL_74:

LABEL_75:
LABEL_76:

}

- (BOOL)setUSBMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "setUSBMode:forConnectionUUID:", v4, v5);

  return v4;
}

- (BOOL)setUSBMode:(int)a3 forEndpointUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "setUSBMode:forEndpointUUID:", v4, v5);

  return v4;
}

- (int)USBModeForConnectionUUID:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "USBModeForConnectionUUID:", v3);

  return v5;
}

- (int)USBModeForEndpointUUID:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "USBModeForEndpointUUID:", v3);

  return v5;
}

- (BOOL)configureAccessoryPowerMode:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "configureAccessoryPowerMode:forConnectionUUID:", v4, v5);

  return v4;
}

- (BOOL)setUSBCurrentOffset:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "setUSBCurrentOffset:forConnectionUUID:", v4, v5);

  return v4;
}

- (BOOL)setUSBCurrentLimitBase:(unsigned int)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;

  v5 = a5;
  v6 = *(_QWORD *)&a3;
  v7 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "setUSBCurrentLimitBase:forConnectionUUID:forceResponse:", v6, v7, v5);

  return v5;
}

- (unsigned)USBCurrentLimitInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "USBCurrentLimitInmA:", v3);

  return v5;
}

- (unsigned)USBCurrentLimitBaseInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "USBCurrentLimitBaseInmA:", v3);

  return v5;
}

- (unsigned)USBCurrentLimitOffsetInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "USBCurrentLimitOffsetInmA:", v3);

  return v5;
}

- (unsigned)USBChargingVoltageInmV:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "USBChargingVoltageInmV:", v3);

  return v5;
}

- (int)CableType:(id)a3
{
  id v3;
  void *v4;
  int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "CableType:", v3);

  return v5;
}

- (unsigned)sleepPowerCurrentLimitInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "sleepPowerCurrentLimitInmA:", v3);

  return v5;
}

- (BOOL)isPowerDuringSleepSupported:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPowerDuringSleepSupported:", v3);

  return v5;
}

- (BOOL)setPowerDuringSleepEnabled:(BOOL)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "setPowerDuringSleepEnabled:forConnectionUUID:", v4, v5);

  return v4;
}

- (BOOL)isPowerDuringSleepEnabled:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isPowerDuringSleepEnabled:", v3);

  return v5;
}

- (BOOL)setBatteryPackMode:(BOOL)a3 forConnectionUUID:(id)a4 forceResponse:(BOOL)a5
{
  uint64_t v5;
  _BOOL8 v6;
  id v7;
  void *v8;

  v5 = a5;
  v6 = a3;
  v7 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = objc_msgSend(v8, "setBatteryPackMode:forConnectionUUID:forceResponse:", v6, v7, v5);

  return v5;
}

- (BOOL)isBatteryPackModeEnabled:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isBatteryPackModeEnabled:", v3);

  return v5;
}

- (BOOL)setAccessoryRequestedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "setAccessoryRequestedCurrent:forConnectionUUID:", v4, v5);

  return v4;
}

- (BOOL)setAccessoryUsedCurrent:(unsigned int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = objc_msgSend(v6, "setAccessoryUsedCurrent:forConnectionUUID:", v4, v5);

  return v4;
}

- (unsigned)accessoryChargingCurrentInmA:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "accessoryChargingCurrentInmA:", v3);

  return v5;
}

- (unsigned)accessoryPowerModeCurrentLimitInmA:(int)a3 forConnectionUUID:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v6, "accessoryPowerModeCurrentLimitInmA:forConnectionUUID:", v4, v5);

  return v4;
}

- (BOOL)resetAccessoryBaseCurrent:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "resetAccessoryBaseCurrent:", v3);

  return v5;
}

- (void)resetLightningBusForEndpointWithUUID:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[ACCTransportIOAccessorySharedManager sharedManager](ACCTransportIOAccessorySharedManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "resetLightningBusForEndpointWithUUID:", v3);

}

- (BOOL)isRunning
{
  return self->_isRunning;
}

- (void)setIsRunning:(BOOL)a3
{
  self->_isRunning = a3;
}

@end
