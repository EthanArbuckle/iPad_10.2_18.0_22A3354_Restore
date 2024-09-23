@implementation LiveFSUserClient

- (LiveFSUserClient)init
{
  LiveFSUserClient *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)LiveFSUserClient;
  result = -[LiveFSUserClient init](&v3, sel_init);
  if (result)
    result->ourPort = 0;
  return result;
}

- (void)dealloc
{
  io_connect_t ourPort;
  objc_super v4;

  ourPort = self->ourPort;
  if (ourPort + 1 >= 2)
    IOServiceClose(ourPort);
  v4.receiver = self;
  v4.super_class = (Class)LiveFSUserClient;
  -[LiveFSUserClient dealloc](&v4, sel_dealloc);
}

+ (id)defaultClient
{
  id v2;
  id v3;
  void *v4;
  id v5;
  void *v6;

  if (gDefaultClient)
  {
    v2 = (id)gDefaultClient;
  }
  else
  {
    v3 = a1;
    objc_sync_enter(v3);
    v4 = (void *)gDefaultClient;
    if (!gDefaultClient)
    {
      v5 = objc_alloc_init((Class)v3);
      v6 = (void *)gDefaultClient;
      gDefaultClient = (uint64_t)v5;

      v4 = (void *)gDefaultClient;
    }
    v2 = v4;
    objc_sync_exit(v3);

  }
  return v2;
}

- (unsigned)getConnPort
{
  return self->ourPort;
}

- (int)getUserClientPortForService:(const char *)a3
{
  const __CFDictionary *v4;
  io_service_t MatchingService;
  io_connect_t v6;
  kern_return_t v7;
  NSObject *v9;
  const char *v10;
  uint8_t *v11;
  __int16 v12;
  __int16 v13;

  v4 = IOServiceMatching(a3);
  if (v4)
  {
    MatchingService = IOServiceGetMatchingService(*MEMORY[0x24BDD8B20], v4);
    if (MatchingService)
    {
      v6 = MatchingService;
      v7 = IOServiceOpen(MatchingService, *MEMORY[0x24BDAEC58], 0, &self->ourPort);
      IOServiceClose(v6);
      return v7;
    }
    livefs_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 0;
      v10 = "Didn't find matching client";
      v11 = (uint8_t *)&v12;
      goto LABEL_8;
    }
  }
  else
  {
    livefs_std_log();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v13 = 0;
      v10 = "No matching dict";
      v11 = (uint8_t *)&v13;
LABEL_8:
      _os_log_impl(&dword_22BD61000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
    }
  }

  return -536870911;
}

- (int)getUserClientPort
{
  return -[LiveFSUserClient getUserClientPortForService:](self, "getUserClientPortForService:", "com_apple_filesystems_lifs");
}

- (int)checkUserClientPort
{
  LiveFSUserClient *v2;
  int v3;

  v2 = self;
  objc_sync_enter(v2);
  if (v2->ourPort + 1 > 1)
    v3 = 0;
  else
    v3 = -[LiveFSUserClient getUserClientPort](v2, "getUserClientPort");
  objc_sync_exit(v2);

  return v3;
}

- (int)setMainMachPort:(unsigned int)a3 forDomain:(id)a4
{
  uint64_t v4;
  int v6;
  int v7;
  NSObject *v8;
  const char *v9;
  kern_return_t v10;
  NSObject *v11;
  os_log_type_t v12;
  size_t outputStructCnt;
  uint8_t buf[4];
  int v16;
  _OWORD inputStruct[65];
  uint64_t v18;

  v4 = *(_QWORD *)&a3;
  v18 = *MEMORY[0x24BDAC8D0];
  memset(inputStruct, 0, 512);
  outputStructCnt = 0;
  objc_msgSend(objc_retainAutorelease(a4), "UTF8String");
  __strlcpy_chk();
  v6 = -[LiveFSUserClient checkUserClientPort](self, "checkUserClientPort");
  if (v6)
  {
    v7 = v6;
    livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      v9 = "get client returned %x";
LABEL_7:
      v11 = v8;
      v12 = OS_LOG_TYPE_DEFAULT;
LABEL_8:
      _os_log_impl(&dword_22BD61000, v11, v12, v9, buf, 8u);
    }
  }
  else
  {
    v10 = IOConnectCallStructMethod(self->ourPort, 1u, inputStruct, 0x28uLL, 0, &outputStructCnt);
    if (!v10)
    {
      v7 = MEMORY[0x22E2FA88C](self->ourPort, 0, v4, 0);
      livefs_std_log();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        goto LABEL_9;
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      v9 = "set notification port returned %x";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
      goto LABEL_8;
    }
    v7 = v10;
    livefs_std_log();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v16 = v7;
      v9 = "set client domain returned %x";
      goto LABEL_7;
    }
  }
LABEL_9:

  return v7;
}

- (int)callStructMethod:(unsigned int)a3 inStruct:(const void *)a4 inSize:(unint64_t)a5 outStruct:(void *)a6 outStructSize:(unint64_t *)a7
{
  int result;

  result = -[LiveFSUserClient checkUserClientPort](self, "checkUserClientPort");
  if (!result)
    return IOConnectCallStructMethod(self->ourPort, a3, a4, a5, a6, a7);
  return result;
}

- (int)configureUserClient:(unsigned int)a3 pid:(int)a4 pidversion:(int)a5 supportKOIO:(int)a6
{
  kern_return_t v11;
  NSObject *v12;
  size_t v14;
  _DWORD inputStruct[4];
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
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v11 = -[LiveFSUserClient checkUserClientPort](self, "checkUserClientPort", 0);
  if (!v11)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v22 = 0u;
    v21 = 0u;
    v20 = 0u;
    v19 = 0u;
    v18 = 0u;
    v17 = 0u;
    v16 = 0u;
    inputStruct[0] = a3;
    inputStruct[1] = a4;
    inputStruct[2] = a5;
    inputStruct[3] = a6;
    v11 = IOConnectCallStructMethod(-[LiveFSUserClient getConnPort](self, "getConnPort"), 0x2Bu, inputStruct, 0x10uLL, 0, &v14);
    if (v11)
    {
      livefs_std_log();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        -[LiveFSUserClient configureUserClient:pid:pidversion:supportKOIO:].cold.1();

    }
  }
  return v11;
}

- (void)configureUserClient:pid:pidversion:supportKOIO:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_0_2(&dword_22BD61000, v0, v1, "configureUserClient returned %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3_1();
}

@end
