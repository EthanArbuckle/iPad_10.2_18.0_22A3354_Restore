@implementation iAP2EASession

- (iAP2EASession)init
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", CFSTR("IAPSession"), CFSTR("must call initWithConnectionID:protocolID:sessionID:"));

  return 0;
}

- (iAP2EASession)initWithProtocol:(id)a3 endpointUUID:(id)a4 eaSessionUUID:(id)a5
{
  id v7;
  id v8;
  iAP2EASession *v9;
  uint64_t v10;
  NSString *endpointUUID;
  uint64_t v12;
  NSString *eaSessionUUID;
  NSObject *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  objc_super v23;

  v7 = a4;
  v8 = a5;
  v23.receiver = self;
  v23.super_class = (Class)iAP2EASession;
  v9 = -[iAP2EASession init](&v23, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v7, "copy");
    endpointUUID = v9->_endpointUUID;
    v9->_endpointUUID = (NSString *)v10;

    v12 = objc_msgSend(v8, "copy");
    eaSessionUUID = v9->_eaSessionUUID;
    v9->_eaSessionUUID = (NSString *)v12;

    *(_QWORD *)&v9->_listenSock = -1;
    *(_WORD *)&v9->_openPipeToAppAfterAccept = 0;
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v14 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v14 = MEMORY[0x24BDACB70];
      v15 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      -[iAP2EASession initWithProtocol:endpointUUID:eaSessionUUID:].cold.1((uint64_t)&v9->_endpointUUID, v14, v16, v17, v18, v19, v20, v21);

    if (initWithProtocol_endpointUUID_eaSessionUUID__onceToken != -1)
      dispatch_once(&initWithProtocol_endpointUUID_eaSessionUUID__onceToken, &__block_literal_global_1);
  }

  return v9;
}

- (void)shuttingDownSession
{
  OUTLINED_FUNCTION_8_0(&dword_2171C1000, a2, a3, "endpointUUID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)iAP2EASession;
  -[iAP2EASession dealloc](&v2, sel_dealloc);
}

- (BOOL)openPipeToApp
{
  if (self->_sock < 0)
    self->_openPipeToAppAfterAccept = 1;
  else
    -[iAP2EASession _openPipeToApp](self, "_openPipeToApp");
  return 1;
}

- (BOOL)openPipeFromApp
{
  if (self->_sock < 0)
    self->_openPipeFromAppAfterAccept = 1;
  else
    -[iAP2EASession _openPipeFromApp](self, "_openPipeFromApp");
  return 1;
}

- (BOOL)closeDataPipes
{
  int listenSock;
  int sock;

  listenSock = self->_listenSock;
  if ((listenSock & 0x80000000) == 0)
  {
    close(listenSock);
    self->_listenSock = -1;
  }
  sock = self->_sock;
  if ((sock & 0x80000000) == 0)
  {
    close(sock);
    self->_sock = -1;
  }
  return 1;
}

- (int)_createListenSocket
{
  int v2;
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  sockaddr v8;
  uint64_t v9;
  char __str[16];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  *(_OWORD *)__str = 0u;
  v11 = 0u;
  snprintf(__str, 0x100uLL, "%s/ea.%lu", "/var/mobile/Library/ExternalAccessory", -[NSString hash](self->_eaSessionUUID, "hash"));
  unlink(__str);
  v2 = socket(1, 1, 0);
  if (v2 < 0)
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v3 = MEMORY[0x24BDACB70];
      v5 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[iAP2EASession _createListenSocket].cold.1();
    goto LABEL_29;
  }
  v9 = 0;
  memset(v8.sa_data, 0, 96);
  *(_WORD *)&v8.sa_len = 362;
  __strlcpy_chk();
  if (bind(v2, &v8, 0x6Au))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v3 = MEMORY[0x24BDACB70];
      v4 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[iAP2EASession _createListenSocket].cold.5();
LABEL_28:
    v2 = -1;
LABEL_29:

    return v2;
  }
  if (listen(v2, 5))
  {
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v3 = *(id *)gLogObjects;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        -[AccessoryUSBBillboardDeviceListener startDetectUSBBillboardDevice].cold.2();
      v3 = MEMORY[0x24BDACB70];
      v6 = MEMORY[0x24BDACB70];
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[iAP2EASession _createListenSocket].cold.3();
    goto LABEL_28;
  }
  return v2;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v7.receiver = self;
  v7.super_class = (Class)iAP2EASession;
  -[iAP2EASession description](&v7, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ endpointUUID: %@"), v4, self->_endpointUUID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eaSessionUUID, 0);
  objc_storeStrong((id *)&self->_endpointUUID, 0);
}

- (void)initWithProtocol:(uint64_t)a3 endpointUUID:(uint64_t)a4 eaSessionUUID:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_8_0(&dword_2171C1000, a2, a3, "endpointUUID: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)_createListenSocket
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9_1();
  OUTLINED_FUNCTION_1_0(&dword_2171C1000, v0, v1, "%s:%d can't bind to ea address", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
