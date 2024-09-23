@implementation UARPUploaderUARP

- (UARPUploaderUARP)init
{
  char *v2;
  os_log_t v3;
  void *v4;
  dispatch_queue_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  const char *v10;
  os_log_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)UARPUploaderUARP;
  v2 = -[UARPUploader init](&v19, sel_init);
  if (v2)
  {
    v3 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    v4 = (void *)*((_QWORD *)v2 + 3);
    *((_QWORD *)v2 + 3) = v3;

    v5 = dispatch_queue_create("com.apple.UARPUploaderUARP.Internal", 0);
    v6 = (void *)*((_QWORD *)v2 + 4);
    *((_QWORD *)v2 + 4) = v5;

    v7 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v8 = (void *)*((_QWORD *)v2 + 140);
    *((_QWORD *)v2 + 140) = v7;

    bzero(v2 + 40, 0x260uLL);
    v9 = 0;
    *(_OWORD *)(v2 + 648) = 0u;
    *(_OWORD *)(v2 + 664) = 0u;
    *(_OWORD *)(v2 + 680) = 0u;
    *(_OWORD *)(v2 + 696) = 0u;
    *(_OWORD *)(v2 + 712) = 0u;
    *(_OWORD *)(v2 + 728) = 0u;
    *(_OWORD *)(v2 + 744) = 0u;
    *(_OWORD *)(v2 + 760) = 0u;
    *(_OWORD *)(v2 + 776) = 0u;
    *(_OWORD *)(v2 + 792) = 0u;
    *(_OWORD *)(v2 + 808) = 0u;
    *(_OWORD *)(v2 + 824) = 0u;
    *(_OWORD *)(v2 + 840) = 0u;
    *(_OWORD *)(v2 + 856) = 0u;
    *(_OWORD *)(v2 + 872) = 0u;
    *(_OWORD *)(v2 + 888) = 0u;
    *(_OWORD *)(v2 + 904) = 0u;
    *(_OWORD *)(v2 + 920) = 0u;
    *(_OWORD *)(v2 + 936) = 0u;
    *(_OWORD *)(v2 + 952) = 0u;
    *(_OWORD *)(v2 + 968) = 0u;
    *(_OWORD *)(v2 + 984) = 0u;
    *(_OWORD *)(v2 + 1000) = 0u;
    *(_OWORD *)(v2 + 1016) = 0u;
    *(_OWORD *)(v2 + 1032) = 0u;
    *(_OWORD *)(v2 + 1048) = 0u;
    *(_OWORD *)(v2 + 1064) = 0u;
    *(_OWORD *)(v2 + 1080) = 0u;
    *(_OWORD *)(v2 + 1096) = 0u;
    *((_QWORD *)v2 + 139) = 0;
    do
    {
      v10 = uarpLoggingCategoryToString(v9);
      v11 = os_log_create("com.apple.uarp.layer3.au", v10);
      v12 = *(void **)&v2[8 * v9 + 1128];
      *(_QWORD *)&v2[8 * v9 + 1128] = v11;

      ++v9;
    }
    while (v9 != 9);
    v2[1200] = MGGetBoolAnswer();
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)*((_QWORD *)v2 + 151);
    *((_QWORD *)v2 + 151) = v13;

    v15 = (void *)*((_QWORD *)v2 + 152);
    *((_QWORD *)v2 + 152) = 0;

    v2[1224] = 0;
    v16 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v17 = (void *)*((_QWORD *)v2 + 154);
    *((_QWORD *)v2 + 154) = v16;

  }
  return (UARPUploaderUARP *)v2;
}

- (uarpPlatformEndpoint)uarpEndpoint
{
  return &self->_uarpEndpoint;
}

- (uarpPlatformEndpointApple)uarpVendorExtension
{
  return &self->_uarpVendorExtension;
}

- (id)logTokenForCategory:(int)a3
{
  OS_os_log *v3;
  id v4;

  if (a3 < 0xA)
  {
    v3 = self->_tokens[a3];
  }
  else
  {
    v3 = (OS_os_log *)MEMORY[0x24BDACB70];
    v4 = MEMORY[0x24BDACB70];
  }
  return v3;
}

- (BOOL)setController:(id)a3
{
  NSObject *queue;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  int v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)UARPUploaderUARP;
  if (!-[UARPUploader setController:](&v12, sel_setController_, a3))
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__UARPUploaderUARP_setController___block_invoke;
  v7[3] = &unk_24CEA3CC8;
  v7[4] = self;
  v7[5] = &v8;
  dispatch_sync(queue, v7);
  v5 = *((_DWORD *)v9 + 6) == 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t __34__UARPUploaderUARP_setController___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = UARPPlatformControllerInit(*(void **)(a1 + 32));
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (BOOL)addAccessory:(id)a3 error:(id *)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP addAccessory:error:].cold.1();
  v7 = -[UARPUploaderUARP accessoryReachable:error:](self, "accessoryReachable:error:", v6, a4);

  return v7;
}

- (BOOL)accessoryReachable:(id)a3 error:(id *)a4
{
  id v6;
  UARPUploaderEndpoint *v7;
  NSObject *queue;
  UARPUploaderEndpoint *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  UARPUploaderUARP *v15;
  UARPUploaderEndpoint *v16;

  v6 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP accessoryReachable:error:].cold.1();
  v7 = -[UARPUploaderEndpoint initWithUARPAccessory:uploader:]([UARPUploaderEndpoint alloc], "initWithUARPAccessory:uploader:", v6, self);
  queue = self->_queue;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __45__UARPUploaderUARP_accessoryReachable_error___block_invoke;
  v14 = &unk_24CEA2488;
  v15 = self;
  v16 = v7;
  v9 = v7;
  dispatch_sync(queue, &v11);
  -[UARPUploaderUARP accessoryReachable:remoteEndpoint:error:](self, "accessoryReachable:remoteEndpoint:error:", v6, v9, a4, v11, v12, v13, v14, v15);

  return 1;
}

uint64_t __45__UARPUploaderUARP_accessoryReachable_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "addObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)accessoryReachable:(id)a3 remoteEndpoint:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;

  v6 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP accessoryReachable:remoteEndpoint:error:].cold.1();
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __60__UARPUploaderUARP_accessoryReachable_remoteEndpoint_error___block_invoke;
  v10[3] = &unk_24CEA2488;
  v10[4] = self;
  v11 = v6;
  v8 = v6;
  dispatch_async(queue, v10);

  return 1;
}

uint64_t __60__UARPUploaderUARP_accessoryReachable_remoteEndpoint_error___block_invoke(uint64_t a1)
{
  return UARPPlatformControllerAddAccessory(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)removeAccessory:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *log;
  BOOL v8;
  int v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v10 = 138412290;
    v11 = v6;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Remove accessory %@", (uint8_t *)&v10, 0xCu);
  }
  v8 = -[UARPUploaderUARP accessoryUnreachable:error:](self, "accessoryUnreachable:error:", v6, a4);

  return v8;
}

- (BOOL)accessoryUnreachable:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *log;
  NSObject *queue;
  id v8;
  _QWORD v10[5];
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Unreachable accessory %@", buf, 0xCu);
  }
  queue = self->_queue;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __47__UARPUploaderUARP_accessoryUnreachable_error___block_invoke;
  v10[3] = &unk_24CEA2488;
  v10[4] = self;
  v11 = v5;
  v8 = v5;
  dispatch_sync(queue, v10);

  return 1;
}

void __47__UARPUploaderUARP_accessoryUnreachable_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1120), "removeObject:", v2);
    objc_msgSend(*(id *)(a1 + 32), "accessoryUnreachable:remoteEndpoint:error:", *(_QWORD *)(a1 + 40), v3, 0);
    v2 = v3;
  }

}

- (BOOL)accessoryUnreachable:(id)a3 remoteEndpoint:(id)a4 error:(id *)a5
{
  id v6;
  NSObject *log;
  NSObject *queue;
  id v9;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v14 = v6;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Unreachable remoteEndpoint %@", buf, 0xCu);
  }
  queue = self->_queue;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __62__UARPUploaderUARP_accessoryUnreachable_remoteEndpoint_error___block_invoke;
  v11[3] = &unk_24CEA2488;
  v11[4] = self;
  v12 = v6;
  v9 = v6;
  dispatch_async(queue, v11);

  return 1;
}

uint64_t __62__UARPUploaderUARP_accessoryUnreachable_remoteEndpoint_error___block_invoke(uint64_t a1)
{
  return UARPPlatformControllerRemoveAccessory(*(void **)(a1 + 32), *(void **)(a1 + 40));
}

- (BOOL)recvDataFromAccessory:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v7 = a3;
  v8 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP recvDataFromAccessory:data:error:].cold.1();
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v8);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v13 = v7;
  v14 = v15;
  v10 = v7;
  dispatch_async(queue, block);

  _Block_object_dispose(v15, 8);
  return 1;
}

void __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v3, "recvDataFromEndpoint:data:error:", v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), 0);
  }
  else
  {
    v4 = v3[3];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke_cold_1(v4, v5, v6);
  }

}

- (BOOL)recvDataFromEndpoint:(id)a3 data:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v13;
  UARPUploaderUARP *v14;
  _QWORD *v15;
  _QWORD v16[5];
  id v17;

  v7 = a3;
  v8 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP recvDataFromEndpoint:data:error:].cold.1();
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x3032000000;
  v16[3] = __Block_byref_object_copy__4;
  v16[4] = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x24BDBCEC8], "dataWithData:", v8);
  v17 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke;
  block[3] = &unk_24CEA3F98;
  v14 = self;
  v15 = v16;
  v13 = v7;
  v10 = v7;
  dispatch_async(queue, block);

  _Block_object_dispose(v16, 8);
  return 1;
}

void __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  NSObject *v4;

  if ((objc_msgSend(*(id *)(a1 + 32), "isDownstreamEndpoint") & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "dumpRxUARPMsg:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  v2 = UARPPlatformControllerRecvMessage(*(void **)(a1 + 40), *(void **)(a1 + 32), *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke_cold_1(v4, v3);
  }
}

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *queue;
  id v18;
  id v19;
  BOOL v20;
  _QWORD v22[5];
  id v23;
  id v24;
  _BYTE *v25;
  _BYTE buf[24];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v10 = log;
    objc_msgSend(v8, "id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetVersion");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "modelIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "serialNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    *(_QWORD *)&buf[4] = v12;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v14;
    *(_WORD *)&buf[22] = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "UARP.OFFER asset version %@ to %@ <SN=%@> <UUID=%@>", buf, 0x2Au);

  }
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  LODWORD(v27) = 0;
  queue = self->_queue;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke;
  v22[3] = &unk_24CEA3DE0;
  v22[4] = self;
  v23 = v7;
  v24 = v8;
  v25 = buf;
  v18 = v8;
  v19 = v7;
  dispatch_sync(queue, v22);
  v20 = *(_DWORD *)(*(_QWORD *)&buf[8] + 24) == 0;

  _Block_object_dispose(buf, 8);
  return v20;
}

void __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke(uint64_t a1)
{
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v2 = (uint64_t *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(v2 - 1);
  if (v3)
  {
    v5 = *(void **)(v4 + 1208);
    objc_msgSend(*(id *)(a1 + 40), "uuid");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

    objc_msgSend(*(id *)(a1 + 32), "addMappingDatabaseFromAsset:", *(_QWORD *)(a1 + 48));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = UARPPlatformControllerOfferFirmwareAsset(*(void **)(a1 + 32), v3, *(void **)(a1 + 48));
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_2(a1 + 56, v7, v2);
      v8 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "id");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "firmwareStagingComplete:assetID:withStatus:", v9, v10, 4);

    }
    objc_msgSend(*(id *)(a1 + 32), "qHandlePowerSourcePercentChange:", v3);
  }
  else
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 24), OS_LOG_TYPE_ERROR))
      __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_1();
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 27;
  }

}

- (BOOL)applyStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;

  v5 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__UARPUploaderUARP_applyStagedAssetsForAccessory_error___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v10 = v5;
  v11 = &v12;
  v7 = v5;
  dispatch_sync(queue, block);
  LOBYTE(queue) = *((_DWORD *)v13 + 6) == 0;

  _Block_object_dispose(&v12, 8);
  return (char)queue;
}

void __56__UARPUploaderUARP_applyStagedAssetsForAccessory_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "getID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "serialNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v7;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_212D08000, v5, OS_LOG_TYPE_INFO, "UARP.APPLY assets for %@ <SN=%@> <UUID=%@>", (uint8_t *)&v11, 0x20u);

    }
    v10 = UARPPlatformControllerApplyStagedAssets(*(void **)(a1 + 32), v2);
  }
  else
  {
    v10 = 27;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v10;

}

- (BOOL)rescindStagedAssetsForAccessory:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *queue;
  id v7;
  _QWORD v9[5];
  id v10;

  v5 = a3;
  queue = self->_queue;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __58__UARPUploaderUARP_rescindStagedAssetsForAccessory_error___block_invoke;
  v9[3] = &unk_24CEA2488;
  v9[4] = self;
  v10 = v5;
  v7 = v5;
  dispatch_async(queue, v9);

  return 1;
}

void __58__UARPUploaderUARP_rescindStagedAssetsForAccessory_error___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v4 = *(void **)(a1 + 40);
      v5 = v3;
      objc_msgSend(v4, "getID");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "modelIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "serialNumber");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412802;
      v11 = v7;
      v12 = 2112;
      v13 = v8;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_212D08000, v5, OS_LOG_TYPE_INFO, "UARP.RESCIND assets for %@ <SN=%@> <UUID=%@>", (uint8_t *)&v10, 0x20u);

    }
    UARPPlatformControllerResindAllAssets(*(void **)(a1 + 32), v2);
  }

}

- (BOOL)pauseAssetTransfersForAccessory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  int v12;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP pauseAssetTransfersForAccessory:].cold.1();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __52__UARPUploaderUARP_pauseAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v9 = v4;
  v10 = v11;
  v6 = v4;
  dispatch_async(queue, block);

  _Block_object_dispose(v11, 8);
  return 1;
}

void __52__UARPUploaderUARP_pauseAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = UARPPlatformControllerPauseAssetTransfers(*(void **)(a1 + 32), v2);
    v2 = v4;
  }
  else
  {
    v3 = 27;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (BOOL)resumeAssetTransfersForAccessory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  _QWORD *v10;
  _QWORD v11[3];
  int v12;

  v4 = a3;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP resumeAssetTransfersForAccessory:].cold.1();
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__UARPUploaderUARP_resumeAssetTransfersForAccessory___block_invoke;
  block[3] = &unk_24CEA3878;
  block[4] = self;
  v9 = v4;
  v10 = v11;
  v6 = v4;
  dispatch_async(queue, block);

  _Block_object_dispose(v11, 8);
  return 1;
}

void __53__UARPUploaderUARP_resumeAssetTransfersForAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = UARPPlatformControllerResumeAssetTransfers(*(void **)(a1 + 32), v2);
    v2 = v4;
  }
  else
  {
    v3 = 27;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v3;

}

- (BOOL)cancelAssetStagingForAccessory:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  BOOL v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  int v20;

  v6 = a3;
  v7 = a4;
  if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP cancelAssetStagingForAccessory:asset:].cold.1();
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __57__UARPUploaderUARP_cancelAssetStagingForAccessory_asset___block_invoke;
  v13[3] = &unk_24CEA3DE0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = *((_DWORD *)v18 + 6) == 0;

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __57__UARPUploaderUARP_cancelAssetStagingForAccessory_asset___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = UARPPlatformControllerRescindAsset(*(void **)(a1 + 32), v2, *(_QWORD *)(a1 + 48));
    v2 = v4;
  }
  else
  {
    v3 = 27;
  }
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v3;

}

- (BOOL)supplementalAssetUpdated:(id)a3 assetName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  char appended;
  NSObject *log;
  NSObject *v24;
  void *v26;
  id *v27;
  UARPUploaderUARP *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(v8, "modelNumber");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.1();
    goto LABEL_23;
  }
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  objc_msgSend(v11, "supplementalAssets");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  if (!v13)
  {

LABEL_21:
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.2();
LABEL_23:
    appended = 0;
    goto LABEL_24;
  }
  v14 = v13;
  v27 = a5;
  v28 = self;
  v15 = 0;
  v16 = 0;
  v17 = *(_QWORD *)v30;
  do
  {
    for (i = 0; i != v14; ++i)
    {
      if (*(_QWORD *)v30 != v17)
        objc_enumerationMutation(v12);
      if (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "isEqualToString:", v9))
      {
        v15 |= objc_msgSend(v9, "containsString:", CFSTR("VoiceAssist"));
        v16 = 1;
      }
    }
    v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v37, 16);
  }
  while (v14);

  self = v28;
  if ((v16 & 1) == 0)
    goto LABEL_21;
  v19 = (void *)MEMORY[0x24BDD16A8];
  UARPStringSupplementalAssetsFilepath();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("%@/%@"), v20, v9);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  appended = appendFirstUarpFilenameToFilepath(v21, (uint64_t)v27);
  log = v28->_log;
  if ((appended & 1) != 0)
  {
    if (os_log_type_enabled((os_log_t)v28->_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v34 = v8;
      v35 = 2112;
      v36 = v21;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_DEFAULT, "Supplemental asset for %@, located at %@", buf, 0x16u);
    }
    if (objc_msgSend(v8, "suppressAutomaticDynamicAssets"))
    {
      v24 = v28->_log;
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = v8;
        _os_log_impl(&dword_212D08000, v24, OS_LOG_TYPE_INFO, "Supplemental Asset Updated: Suppressed Automatic Dynamic Asset Solicitation for %@", buf, 0xCu);
      }
    }
    else if ((objc_msgSend(v11, "supportsVoiceAssist") & v15) == 1)
    {
      +[UARPHeySiriModelVoiceAssist tag](UARPHeySiriModelVoiceAssist, "tag");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:](v28, "solicitDynamicAssetForAccessory:assetTag:error:", v8, v26, v27);

    }
  }
  else if (os_log_type_enabled((os_log_t)v28->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.3();
  }

LABEL_24:
  return appended;
}

- (BOOL)genericNotification:(id)a3 notificationName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *log;
  void *v11;
  void *v12;
  NSObject *v14;
  void *v15;
  void *v16;
  int v17;
  id v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v17 = 138412546;
    v18 = v9;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "NSD Notification %@ for accessory %@", (uint8_t *)&v17, 0x16u);
  }
  objc_msgSend(v8, "modelNumber");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.system.powersources.percent")))
    {
      -[UARPUploaderUARP handlePowerSourcePercentChange:](self, "handlePowerSourcePercentChange:", v8);
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.uarp.internal.personalization")))
    {
      -[UARPUploaderUARP handlePersonalizationRequest:](self, "handlePersonalizationRequest:", v8);
    }
    else if (objc_msgSend(v8, "suppressAutomaticDynamicAssets"))
    {
      v14 = self->_log;
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v17 = 138412290;
        v18 = v8;
        _os_log_impl(&dword_212D08000, v14, OS_LOG_TYPE_INFO, "BSD Notification: Suppressed Automatic Dynamic Asset Solicitation for %@", (uint8_t *)&v17, 0xCu);
      }
    }
    else if (objc_msgSend(v9, "isEqualToString:", CFSTR("com.apple.corespeech.voicetriggerassetchange")))
    {
      if (objc_msgSend(v12, "supportsVoiceAssist"))
      {
        +[UARPHeySiriModelVoiceAssist tag](UARPHeySiriModelVoiceAssist, "tag");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:](self, "solicitDynamicAssetForAccessory:assetTag:error:", v8, v15, a5);

      }
      if (objc_msgSend(v12, "supportsHeySiriCompact"))
      {
        +[UARPHeySiriModelCompact tag](UARPHeySiriModelCompact, "tag");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:](self, "solicitDynamicAssetForAccessory:assetTag:error:", v8, v16, a5);

      }
    }
  }
  else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
  {
    -[UARPUploaderUARP supplementalAssetUpdated:assetName:error:].cold.1();
  }

  return v12 != 0;
}

- (void)queryFirmwareUpdateResultForAccessory:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke;
  v7[3] = &unk_24CEA2488;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke_cold_1(a1, v2, v3);
}

- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v11;
  unint64_t v12;

  v6 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47__UARPUploaderUARP_queryProperty_forAccessory___block_invoke;
  block[3] = &unk_24CEA3930;
  block[4] = self;
  v11 = v6;
  v12 = a3;
  v8 = v6;
  dispatch_async(queue, block);

  return 0;
}

void __47__UARPUploaderUARP_queryProperty_forAccessory___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "_queryProperty:endpoint:", *(_QWORD *)(a1 + 48), v2);
    v2 = v3;
  }

}

- (int64_t)_queryProperty:(unint64_t)a3 endpoint:(id)a4
{
  id v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v8 = log;
    objc_msgSend(v6, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "getID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    v21 = 2112;
    v22 = v14;
    v23 = 2080;
    v24 = UARPAccessoryPropertyToString(a3);
    _os_log_impl(&dword_212D08000, v8, OS_LOG_TYPE_INFO, "UARP.QUERY.INFO %@ <SN=%@> <UUID=%@>; property is <%s>",
      buf,
      0x2Au);

  }
  UARPPlatformControllerQueryProperty(self, v6, a3);

  return 0;
}

- (BOOL)solicitDynamicAssetForAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *log;
  BOOL v11;
  int v13;
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v13 = 138412546;
    v14 = v9;
    v15 = 2112;
    v16 = v8;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Solicit Dynamic Asset from accessory\n%@%@", (uint8_t *)&v13, 0x16u);
  }
  v11 = -[UARPUploaderUARP solicitDynamicAssetForAccessory:asset:internalSolicit:error:](self, "solicitDynamicAssetForAccessory:asset:internalSolicit:error:", v8, v9, 0, a5);

  return v11;
}

- (BOOL)solicitDynamicAssetForAccessory:(id)a3 assetTag:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  UARPAssetID *v11;
  UARPAsset *v12;
  BOOL v13;

  v8 = a3;
  v9 = a4;
  uarpDynamicAssetURL(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = -[UARPAssetID initWithLocationType:assetTag:url:]([UARPAssetID alloc], "initWithLocationType:assetTag:url:", 10, v9, v10);
    v12 = -[UARPAsset initWithID:]([UARPAsset alloc], "initWithID:", v11);
    v13 = -[UARPUploaderUARP solicitDynamicAssetForAccessory:asset:internalSolicit:error:](self, "solicitDynamicAssetForAccessory:asset:internalSolicit:error:", v8, v12, 1, a5);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:].cold.1();
    v13 = 0;
  }

  return v13;
}

- (BOOL)solicitDynamicAssetForAccessory:(id)a3 asset:(id)a4 internalSolicit:(BOOL)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v9 = a3;
  v10 = a4;
  queue = self->_queue;
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke;
  v15[3] = &unk_24CEA3E30;
  v15[4] = self;
  v16 = v9;
  v17 = v10;
  v18 = a5;
  v12 = v10;
  v13 = v9;
  dispatch_async(queue, v15);

  return 1;
}

void __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *log;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  const __CFString *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(v2 - 8);
  v5 = *(void **)(v4 + 24);
  if (v3)
  {
    if (os_log_type_enabled(*(os_log_t *)(v4 + 24), OS_LOG_TYPE_INFO))
    {
      v6 = *(void **)(a1 + 48);
      log = v5;
      objc_msgSend(v6, "id");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tag");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (*(_BYTE *)(a1 + 56))
        v9 = CFSTR("Internal");
      else
        v9 = CFSTR("External");
      objc_msgSend(*(id *)(a1 + 40), "getID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "modelIdentifier");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "serialNumber");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "uuid");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v17 = v8;
      v18 = 2112;
      v19 = v9;
      v20 = 2112;
      v21 = v11;
      v22 = 2112;
      v23 = v12;
      v24 = 2112;
      v25 = v13;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.SOLICIT %@ <%@> from %@ <SN=%@> <UUID=%@>", buf, 0x34u);

    }
    UARPPlatformControllerPrepareSolicitedDynamicAsset(*(_QWORD *)(a1 + 32), v3, *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (UARPPlatformControllerSolicitDynamicAsset(*(void **)(a1 + 32), v3, v14)
      && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 24), OS_LOG_TYPE_ERROR))
    {
      __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_2();
    }

  }
  else if (os_log_type_enabled(*(os_log_t *)(v4 + 24), OS_LOG_TYPE_ERROR))
  {
    __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_1();
  }

}

- (BOOL)solicitDynamicAssetForRemoteEndpoint:(id)a3 assetTag:(id)a4 internalSolicit:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v6;
  id v9;
  id v10;
  void *v11;
  UARPAssetID *v12;
  UARPAsset *v13;
  NSObject *v14;
  UARPAssetID *v15;
  _BOOL4 v16;
  int v17;
  void *v18;
  uint64_t v19;
  void *v20;
  const __CFString *v21;
  NSObject *queue;
  UARPAsset *v23;
  NSObject *log;
  _QWORD block[5];
  id v27;
  UARPAsset *v28;
  BOOL v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  uint64_t v36;

  v6 = a5;
  v36 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  uarpDynamicAssetURL(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = -[UARPAssetID initWithLocationType:assetTag:url:]([UARPAssetID alloc], "initWithLocationType:assetTag:url:", 10, v10, v11);
    v13 = -[UARPAsset initWithID:]([UARPAsset alloc], "initWithID:", v12);
    v14 = self->_log;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      log = v14;
      v15 = v12;
      v16 = v6;
      v17 = objc_msgSend(v9, "downstreamID");
      -[UARPAsset id](v13, "id");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "tag");
      v19 = objc_claimAutoreleasedReturnValue();
      v20 = (void *)v19;
      v21 = CFSTR("External");
      *(_DWORD *)buf = 67109634;
      v31 = v17;
      v6 = v16;
      v12 = v15;
      v32 = 2112;
      if (v6)
        v21 = CFSTR("Internal");
      v33 = v19;
      v34 = 2112;
      v35 = v21;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.SOLICIT <DS.ID=%u> %@ <%@>", buf, 0x1Cu);

    }
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke;
    block[3] = &unk_24CEA3E30;
    block[4] = self;
    v27 = v9;
    v28 = v13;
    v29 = v6;
    v23 = v13;
    dispatch_async(queue, block);

  }
  else if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
  {
    -[UARPUploaderUARP solicitDynamicAssetForAccessory:assetTag:error:].cold.1();
  }

  return v11 != 0;
}

void __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke(uint64_t a1)
{
  void **v2;
  void *v3;

  v2 = (void **)(a1 + 40);
  UARPPlatformControllerPrepareSolicitedDynamicAsset(*(_QWORD *)(a1 + 32), *(void **)(a1 + 40), *(void **)(a1 + 48), *(unsigned __int8 *)(a1 + 56));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (UARPPlatformControllerSolicitDynamicAsset(*(v2 - 1), *v2, v3)
    && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 24), OS_LOG_TYPE_ERROR))
  {
    __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke_cold_1();
  }

}

- (BOOL)offerDynamicAssetToAccessory:(id)a3 asset:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v14 = v8;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, block);

  return 1;
}

void __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  UARPAssetTag *v14;
  unsigned int v15;
  UARPAssetTag *v16;
  void *v17;
  void *v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v20 = v3;
    v21 = 2112;
    v22 = v4;
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "Offer dynamic asset %@ to accessory %@", buf, 0x16u);
  }
  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 48));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v16 = [UARPAssetTag alloc];
    objc_msgSend(*(id *)(a1 + 40), "id");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "tag");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v17, "char1");
    objc_msgSend(*(id *)(a1 + 40), "id");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tag");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "char2");
    objc_msgSend(*(id *)(a1 + 40), "id");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tag");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "char3");
    objc_msgSend(*(id *)(a1 + 40), "id");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tag");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UARPAssetTag initWithChar1:char2:char3:char4:](v16, "initWithChar1:char2:char3:char4:", v15, v8, v11, objc_msgSend(v13, "char4"));

    objc_msgSend(*(id *)(a1 + 32), "offerDynamicAssetToAccessory:asset:internalOffer:tag:", v5, *(_QWORD *)(a1 + 40), 0, v14);
  }
  else if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 24), OS_LOG_TYPE_ERROR))
  {
    __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke_cold_1();
  }

}

- (BOOL)unsolicitedDynamicAssetForAccessory:(id)a3 assetTag:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v14;
  id v15;

  v7 = a3;
  v8 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke;
  block[3] = &unk_24CEA3E08;
  block[4] = self;
  v14 = v8;
  v15 = v7;
  v10 = v7;
  v11 = v8;
  dispatch_async(queue, block);

  return 1;
}

uint64_t __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke(uint64_t a1)
{
  if (os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 32) + 24), OS_LOG_TYPE_DEBUG))
    __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke_cold_1();
  objc_msgSend(*(id *)(a1 + 40), "char1");
  objc_msgSend(*(id *)(a1 + 40), "char2");
  objc_msgSend(*(id *)(a1 + 40), "char3");
  return objc_msgSend(*(id *)(a1 + 40), "char4");
}

- (BOOL)handlePowerSource:(id)a3 currentCapacity:(unint64_t)a4 maxCapacity:(unint64_t)a5
{
  id v8;
  NSObject *log;
  unint64_t v10;
  void *v11;
  void *v12;
  float v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  unint64_t v27;
  void *v28;
  id obj;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint8_t buf[4];
  unint64_t v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218240;
    v35 = a4;
    v36 = 2048;
    v37 = a5;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Power Source Current Capacity is %lu. Max Power is %lu.", buf, 0x16u);
  }
  v10 = a5 | a4;
  if (a5 | a4)
  {
    -[UARPUploaderUARP qFindRemoteEndpointForAccessory:](self, "qFindRemoteEndpointForAccessory:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      if (a5)
        v13 = (float)((float)a4 / (float)a5) * 100.0;
      else
        v13 = 0.0;
      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      objc_msgSend(v11, "txFirmwareAssets", a5 | a4, v8);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v31;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v31 != v16)
              objc_enumerationMutation(obj);
            v18 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
            if (!objc_msgSend(v18, "minimumHostBatteryLevel") && !objc_msgSend(v18, "triggerHostBatteryLevel"))
            {
              v25 = self->_log;
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                -[UARPUploaderUARP handlePowerSource:currentCapacity:maxCapacity:].cold.1(v25);
              goto LABEL_28;
            }
            if (v13 < (float)(unint64_t)objc_msgSend(v18, "minimumHostBatteryLevel"))
            {
              v19 = self->_log;
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                v20 = v19;
                v21 = objc_msgSend(v18, "minimumHostBatteryLevel");
                *(_DWORD *)buf = 138412802;
                v35 = (unint64_t)v18;
                v36 = 2048;
                v37 = (unint64_t)v13;
                v38 = 2048;
                v39 = v21;
                _os_log_impl(&dword_212D08000, v20, OS_LOG_TYPE_INFO, "Power Source: Asset <%@> pausing due to minimum host battery level of %lu, tlv says %lu", buf, 0x20u);

              }
              UARPPlatformControllerPauseAssetTransfers(self, v12);
            }
            if (v13 > (float)(unint64_t)objc_msgSend(v18, "triggerHostBatteryLevel"))
            {
              v22 = self->_log;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                v23 = v22;
                v24 = objc_msgSend(v18, "triggerHostBatteryLevel");
                *(_DWORD *)buf = 138412802;
                v35 = (unint64_t)v18;
                v36 = 2048;
                v37 = (unint64_t)v13;
                v38 = 2048;
                v39 = v24;
                _os_log_impl(&dword_212D08000, v23, OS_LOG_TYPE_INFO, "Power Source: Asset <%@> resuming due to trigger host battery level of %lu, tlv says %lu", buf, 0x20u);

              }
              UARPPlatformControllerResumeAssetTransfers(self, v12);
            }
          }
          v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v40, 16);
          if (v15)
            continue;
          break;
        }
      }
LABEL_28:

      v10 = v27;
      v8 = v28;
    }

  }
  return v10 != 0;
}

- (void)handlePowerSourcePercentChange:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__UARPUploaderUARP_handlePowerSourcePercentChange___block_invoke;
  v7[3] = &unk_24CEA2488;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __51__UARPUploaderUARP_handlePowerSourcePercentChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(*(id *)(a1 + 32), "qHandlePowerSourcePercentChange:", v2);
    v2 = v3;
  }

}

- (void)qHandlePowerSourcePercentChange:(id)a3
{
  id v4;
  CFTypeRef v5;
  const void *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  __int128 v9;
  CFIndex v10;
  const void *ValueAtIndex;
  void *v12;
  void *v13;
  void *v14;
  NSObject *log;
  void *v16;
  _BOOL4 v17;
  const __CFArray *v18;
  __int128 v19;
  uint8_t buf[4];
  CFIndex v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = IOPSCopyPowerSourcesInfo();
  if (v5)
  {
    v6 = v5;
    v7 = IOPSCopyPowerSourcesList(v5);
    if (v7)
    {
      v8 = v7;
      if (CFArrayGetCount(v7) >= 1)
      {
        v10 = 0;
        *(_QWORD *)&v9 = 134218242;
        v19 = v9;
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v10);
          IOPSGetPowerSourceDescription(v6, ValueAtIndex);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("Current Capacity"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("Max Capacity"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v19;
            v21 = v10;
            v22 = 2112;
            v23 = v12;
            _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Power Source Description for index %ld is %@", buf, 0x16u);
          }
          objc_msgSend(v4, "accessory", v19);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = -[UARPUploaderUARP handlePowerSource:currentCapacity:maxCapacity:](self, "handlePowerSource:currentCapacity:maxCapacity:", v16, objc_msgSend(v13, "unsignedIntegerValue"), objc_msgSend(v14, "unsignedIntegerValue"));

          if (v17)
            break;
          ++v10;
        }
        while (v10 < CFArrayGetCount(v8));
      }
      CFRelease(v6);
      v18 = v8;
    }
    else
    {
      v18 = (const __CFArray *)v6;
    }
    CFRelease(v18);
  }

}

- (void)handlePersonalizationRequest:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v11 = "-[UARPUploaderUARP handlePersonalizationRequest:]";
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: %@", buf, 0x16u);
  }
  queue = self->_queue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke;
  v8[3] = &unk_24CEA2488;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(queue, v8);

}

void __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  int v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v10 = 136315394;
    v11 = "-[UARPUploaderUARP handlePersonalizationRequest:]_block_invoke";
    v12 = 2112;
    v13 = v3;
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "%s: on queue %@", (uint8_t *)&v10, 0x16u);
  }
  v5 = *(_QWORD *)(a1 + 40);
  v4 = a1 + 40;
  objc_msgSend(*(id *)(v4 - 8), "qFindRemoteEndpointForAccessory:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(NSObject **)(*(_QWORD *)(v4 - 8) + 24);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    if (v8)
      __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_2((uint64_t)v6, v7, v9);
    objc_msgSend(v6, "handlePersonalizationRequest");
  }
  else if (v8)
  {
    __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_1();
  }

}

- (void)discoverDownstreamEndpoints:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke;
  v7[3] = &unk_24CEA2488;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  os_log_t *v3;

  v1 = a1 + 40;
  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(os_log_t **)(v1 - 8);
  if (v2)
  {
    UarpLayer4DiscoverDownstreamEndpoints(v3, v2);
  }
  else if (os_log_type_enabled(v3[3], OS_LOG_TYPE_ERROR))
  {
    __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke_cold_1();
  }

}

- (int64_t)queryProperty:(unint64_t)a3 forAccessory:(id)a4 downstreamID:(unint64_t)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unint64_t v15;

  v8 = a4;
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__UARPUploaderUARP_queryProperty_forAccessory_downstreamID___block_invoke;
  v12[3] = &unk_24CEA3F48;
  v12[4] = self;
  v13 = v8;
  v14 = a5;
  v15 = a3;
  v10 = v8;
  dispatch_async(queue, v12);

  return 0;
}

void __60__UARPUploaderUARP_queryProperty_forAccessory_downstreamID___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    objc_msgSend(v2, "downstreamEndpoint:", *(_QWORD *)(a1 + 48));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      objc_msgSend(*(id *)(a1 + 32), "_queryProperty:endpoint:", *(_QWORD *)(a1 + 56), v3);

    v2 = v4;
  }

}

- (BOOL)offerAssetToAccessory:(id)a3 asset:(id)a4 downstreamID:(unint64_t)a5 error:(id *)a6
{
  id v9;
  id v10;
  NSObject *log;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *queue;
  id v20;
  id v21;
  unint64_t v23;
  _QWORD block[5];
  id v25;
  id v26;
  _BYTE *v27;
  unint64_t v28;
  _BYTE buf[24];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v12 = log;
    objc_msgSend(v10, "id");
    v23 = a5;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "assetVersion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "getID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "modelIdentifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "serialNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "uuid");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = v14;
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = v23;
    *(_WORD *)&buf[22] = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v17;
    v33 = 2112;
    v34 = v18;
    _os_log_impl(&dword_212D08000, v12, OS_LOG_TYPE_INFO, "UARP.OFFER asset version %@ to <DSID=%lu> %@ <SN=%@> <UUID=%@>", buf, 0x34u);

    a5 = v23;
  }
  -[UARPUploaderUARP addMappingDatabaseFromAsset:](self, "addMappingDatabaseFromAsset:", v10);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  queue = self->_queue;
  LODWORD(v30) = 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__UARPUploaderUARP_offerAssetToAccessory_asset_downstreamID_error___block_invoke;
  block[3] = &unk_24CEA4090;
  block[4] = self;
  v25 = v9;
  v27 = buf;
  v28 = a5;
  v26 = v10;
  v20 = v10;
  v21 = v9;
  dispatch_async(queue, block);

  _Block_object_dispose(buf, 8);
  return 1;
}

void __67__UARPUploaderUARP_offerAssetToAccessory_asset_downstreamID_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "qFindRemoteEndpointForAccessory:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v7 = v2;
    objc_msgSend(v2, "downstreamEndpoint:", *(_QWORD *)(a1 + 64));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = UARPPlatformControllerOfferFirmwareAsset(*(void **)(a1 + 32), v3, *(void **)(a1 + 48));
      if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      {
        v4 = *(void **)(a1 + 32);
        v5 = *(_QWORD *)(a1 + 40);
        objc_msgSend(*(id *)(a1 + 48), "id");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "firmwareStagingComplete:assetID:withStatus:", v5, v6, 4);

      }
    }
    else
    {
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 27;
    }

    v2 = v7;
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 27;
  }

}

- (id)firmwareAssetIDForDownstreamEndpoint:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  _BOOL4 v18;
  int v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  int v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  const char *v47;
  int v48;
  NSObject *loga;
  NSObject *logb;
  NSObject *log;
  void *v53;
  void *v54;
  void *v55;
  uint8_t buf[4];
  int v57;
  __int16 v58;
  void *v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  uint64_t v64;

  v64 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(v5, "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UARPUploaderUARP qFindRemoteEndpointForAccessory:](self, "qFindRemoteEndpointForAccessory:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "idealTxFirmwareAsset");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (!v8)
    {
      v31 = self->_log;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        logb = v31;
        v32 = objc_msgSend(v5, "downstreamID");
        objc_msgSend(v5, "accessory");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v54, "getID");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "modelIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessory");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "serialNumber");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessory");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "uuid");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v57 = v32;
        v58 = 2112;
        v59 = v34;
        v60 = 2112;
        v61 = v36;
        v62 = 2112;
        v63 = v38;
        _os_log_impl(&dword_212D08000, logb, OS_LOG_TYPE_INFO, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No pending asset", buf, 0x26u);

      }
      v29 = 0;
      goto LABEL_21;
    }
    objc_msgSend(v8, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "id");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "downstreamAssetIDs");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (v12)
    {
      objc_msgSend(v9, "asset");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "id");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "downstreamAssetIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "count");

      v17 = self->_log;
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_INFO);
      if (v16)
      {
        if (v18)
        {
          loga = v17;
          v19 = objc_msgSend(v5, "downstreamID");
          objc_msgSend(v5, "accessory");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "getID");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "modelIdentifier");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessory");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "serialNumber");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "accessory");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "uuid");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 67109890;
          v57 = v19;
          v58 = 2112;
          v59 = v21;
          v60 = 2112;
          v61 = v23;
          v62 = 2112;
          v63 = v25;
          _os_log_impl(&dword_212D08000, loga, OS_LOG_TYPE_INFO, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - downstreamAssetIDs' first object", buf, 0x26u);

        }
        objc_msgSend(v9, "asset");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "id");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "downstreamAssetIDs");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "firstObject");
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_20;
      }
      if (v18)
      {
        log = v17;
        v48 = objc_msgSend(v5, "downstreamID");
        objc_msgSend(v5, "accessory");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "getID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "modelIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessory");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "serialNumber");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessory");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v57 = v48;
        v58 = 2112;
        v59 = v42;
        v60 = 2112;
        v61 = v44;
        v62 = 2112;
        v63 = v46;
        v47 = "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - downstreamAssetIDs array has no entries";
        goto LABEL_18;
      }
    }
    else
    {
      v39 = self->_log;
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        log = v39;
        v40 = objc_msgSend(v5, "downstreamID");
        objc_msgSend(v5, "accessory");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "getID");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "modelIdentifier");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessory");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "serialNumber");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "accessory");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "uuid");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v57 = v40;
        v58 = 2112;
        v59 = v42;
        v60 = 2112;
        v61 = v44;
        v62 = 2112;
        v63 = v46;
        v47 = "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No downstreamAssetIDs array";
LABEL_18:
        _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, v47, buf, 0x26u);

      }
    }
    objc_msgSend(v9, "asset");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "id");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

LABEL_21:
    goto LABEL_22;
  }
  v30 = self->_log;
  if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
    -[UARPUploaderUARP firmwareAssetIDForDownstreamEndpoint:error:].cold.1(v30, v5);
  v29 = 0;
LABEL_22:

  return v29;
}

- (BOOL)offerFirmwareAssetToDownstreamEndpoint:(id)a3 error:(id *)a4
{
  id v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *queue;
  NSObject *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *log;
  os_log_t v27;
  NSObject *v28;
  _QWORD block[5];
  id v30;
  uint8_t buf[4];
  int v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self->_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    log = v6;
    v7 = objc_msgSend(v5, "downstreamID");
    objc_msgSend(v5, "accessory");
    v27 = (os_log_t)objc_claimAutoreleasedReturnValue();
    -[NSObject getID](v27, "getID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v32 = v7;
    v33 = 2112;
    v34 = v9;
    v35 = 2112;
    v36 = v11;
    v37 = 2112;
    v38 = v13;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@>", buf, 0x26u);

  }
  v14 = objc_msgSend(v5, "isDownstreamEndpoint");
  if ((v14 & 1) != 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __65__UARPUploaderUARP_offerFirmwareAssetToDownstreamEndpoint_error___block_invoke;
    block[3] = &unk_24CEA2488;
    block[4] = self;
    v30 = v5;
    dispatch_async(queue, block);

  }
  else
  {
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v28 = v16;
      v17 = objc_msgSend(v5, "downstreamID");
      objc_msgSend(v5, "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "getID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "modelIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessory");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "serialNumber");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "accessory");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "uuid");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      v32 = v17;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v22;
      v37 = 2112;
      v38 = v24;
      _os_log_impl(&dword_212D08000, v28, OS_LOG_TYPE_INFO, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - not downstream endpoint. No OFFER", buf, 0x26u);

    }
  }

  return v14;
}

void __65__UARPUploaderUARP_offerFirmwareAssetToDownstreamEndpoint_error___block_invoke(uint64_t a1)
{
  void *v2;
  UARPAsset *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  int v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *log;
  NSObject *loga;
  void *v35;
  void *v36;
  uint8_t buf[4];
  int v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "firmwareAssetIDForDownstreamEndpoint:error:", *(_QWORD *)(a1 + 40), 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = -[UARPAsset initWithID:]([UARPAsset alloc], "initWithID:", v2);
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(void **)(a1 + 40);
      log = v4;
      v6 = objc_msgSend(v5, "downstreamID");
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "getID");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "modelIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "serialNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67110146;
      v38 = v6;
      v39 = 2112;
      v40 = v8;
      v41 = 2112;
      v42 = v10;
      v43 = 2112;
      v44 = v12;
      v45 = 2112;
      v46 = v2;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - Offer asset %@", buf, 0x30u);

    }
    UARPPlatformControllerOfferFirmwareAsset(*(void **)(a1 + 32), *(void **)(a1 + 40), v3);

  }
  else
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = *(void **)(a1 + 40);
      loga = v13;
      v15 = objc_msgSend(v14, "downstreamID");
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "getID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "modelIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "serialNumber");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "uuid");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 67109890;
      v38 = v15;
      v39 = 2112;
      v40 = v17;
      v41 = 2112;
      v42 = v19;
      v43 = 2112;
      v44 = v21;
      _os_log_impl(&dword_212D08000, loga, OS_LOG_TYPE_INFO, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No asset available", buf, 0x26u);

    }
    if (UARPPlatformControllerNoFirmwareAssetAvailable(*(void **)(a1 + 32), *(void **)(a1 + 40)))
    {
      v22 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = *(void **)(a1 + 40);
        v24 = v22;
        v25 = objc_msgSend(v23, "downstreamID");
        objc_msgSend(*(id *)(a1 + 40), "accessory");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "getID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "modelIdentifier");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "accessory");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "serialNumber");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "accessory");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109890;
        v38 = v25;
        v39 = 2112;
        v40 = v28;
        v41 = 2112;
        v42 = v30;
        v43 = 2112;
        v44 = v32;
        _os_log_impl(&dword_212D08000, v24, OS_LOG_TYPE_INFO, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - failed", buf, 0x26u);

      }
    }
  }

}

- (void)applyStagedAssetsForoDownstreamEndpoint:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = log;
    v7 = objc_msgSend(v4, "downstreamID");
    objc_msgSend(v4, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v15 = v7;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_212D08000, v6, OS_LOG_TYPE_INFO, "UARP.APPLY assets <DSID=%lu> <UUID=%@>", buf, 0x16u);

  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __60__UARPUploaderUARP_applyStagedAssetsForoDownstreamEndpoint___block_invoke;
  v12[3] = &unk_24CEA2488;
  v12[4] = self;
  v13 = v4;
  v11 = v4;
  dispatch_async(queue, v12);

}

void __60__UARPUploaderUARP_applyStagedAssetsForoDownstreamEndpoint___block_invoke(uint64_t a1)
{
  unsigned int v2;
  unsigned int v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v2 = UARPPlatformControllerApplyStagedAssets(*(void **)(a1 + 32), *(void **)(a1 + 40));
  if (v2)
  {
    v3 = v2;
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = *(void **)(a1 + 40);
      v6 = v4;
      v7 = objc_msgSend(v5, "downstreamID");
      objc_msgSend(*(id *)(a1 + 40), "accessory");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "uuid");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 134218498;
      v11 = v7;
      v12 = 2112;
      v13 = v9;
      v14 = 2080;
      v15 = uarpStatusCodeToString(v3);
      _os_log_impl(&dword_212D08000, v6, OS_LOG_TYPE_INFO, "UARP.APPLY assets <DSID=%lu> <UUID=%@> - FAILED <%s>", (uint8_t *)&v10, 0x20u);

    }
  }
}

- (id)qFindRemoteEndpointForAccessory:(id)a3
{
  id v4;
  NSMutableArray *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_accessories;
  v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "accessory", (_QWORD)v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqual:", v10);

        if ((v11 & 1) != 0)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (void)sendMessageToAccessory:(id)a3 uarpMsg:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;
  UARPUploaderUARP *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    -[UARPUploaderUARP sendMessageToAccessory:uarpMsg:].cold.1(log, v7);
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__4;
  v15[4] = __Block_byref_object_dispose__4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithData:", v7);
  v16 = (id)objc_claimAutoreleasedReturnValue();
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UARPUploaderUARP_sendMessageToAccessory_uarpMsg___block_invoke;
  block[3] = &unk_24CEA3F98;
  v13 = self;
  v14 = v15;
  v12 = v6;
  v10 = v6;
  dispatch_async(queue, block);

  _Block_object_dispose(v15, 8);
}

void __51__UARPUploaderUARP_sendMessageToAccessory_uarpMsg___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "dumpTxUARPMsg:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
  objc_msgSend(*(id *)(a1 + 40), "controller");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendMessageToAccessory:uarpMsg:", v2, *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

}

- (void)watchdogExpireLayer2:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke;
  v7[3] = &unk_24CEA2488;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = a1 + 40;
  if (UARPPlatformControllerLayer3WatchDogExpired(*(void **)(a1 + 32), *(void **)(a1 + 40)))
  {
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke_cold_1(v2, v3);
  }
}

- (void)updateManufacturerName:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(0);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:manufacturer:error:", v11, v6, 0);

  }
}

- (void)updateModelName:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(1uLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:modelName:error:", v11, v6, 0);

  }
}

- (void)updateSerialNumber:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(2uLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  objc_msgSend(v7, "hasFullPersonality:", self);
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:serialNumber:error:", v11, v6, 0);

  }
}

- (void)updateHardwareVersion:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(3uLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:hardwareVersion:error:", v11, v6, 0);

  }
}

- (void)updateActiveFirmwareVersion:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(4uLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  objc_msgSend(v7, "hasFullPersonality:", self);
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:firmwareVersion:error:", v11, v6, 0);

  }
}

- (void)updateStagedFirmwareVersion:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(5uLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:stagedFirmwareVersion:error:", v11, v6, 0);

  }
}

- (void)updateLastError:(unint64_t)a3 remoteEndpoint:(id)a4
{
  id v6;
  NSObject *log;
  NSObject *v8;
  void *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v8 = log;
    v11[0] = 67109120;
    v11[1] = objc_msgSend(v6, "downstreamID");
    _os_log_impl(&dword_212D08000, v8, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <Last Error>", (uint8_t *)v11, 8u);

  }
  if ((objc_msgSend(v6, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "firmwareUpdateResult:vendorSpecificStatus:error:", v10, a3, 0);

  }
}

- (void)updateStatistics:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109378;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(6uLL);
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s>", (uint8_t *)v12, 0x12u);

  }
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:stats:error:", v11, v6, 0);

  }
}

- (void)updateAppleModelNumber:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(0xBuLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  objc_msgSend(v7, "hasFullPersonality:", self);
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:appleModelNumber:error:", v11, v6, 0);

  }
}

- (void)updateHardwareFusingType:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(0xCuLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  objc_msgSend(v7, "hasFullPersonality:", self);
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:hwFusingType:error:", v11, v6, 0);

  }
}

- (void)updateFriendlyName:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v12[0] = 67109634;
    v12[1] = objc_msgSend(v7, "downstreamID");
    v13 = 2080;
    v14 = UARPAccessoryPropertyToString(0xDuLL);
    v15 = 2112;
    v16 = v6;
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESPONSE.INFO <DSID=%u> for <%s> is <%@>", (uint8_t *)v12, 0x1Cu);

  }
  if ((objc_msgSend(v7, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "queryCompleteForAccessory:friendlyName:error:", v11, v6, 0);

  }
}

- (void)updateManifestPrefix:(id)a3 remoteEndpoint:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryCompleteForAccessory:manifestPrefix:error:", v8, v9, 0);

  }
}

- (void)updateBoardID:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:boardID:error:", v7, a3, 0);

  }
}

- (void)updateChipID:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:chipID:error:", v7, a3, 0);

  }
}

- (void)updateChipRevision:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:chipRevision:error:", v7, a3, 0);

  }
}

- (void)updateECID:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:ecid:error:", v7, a3, 0);

  }
}

- (void)updateSecurityDomain:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:securityDomain:error:", v7, a3, 0);

  }
}

- (void)updateSecurityMode:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:securityMode:error:", v7, a3, 0);

  }
}

- (void)updateProductionMode:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:productionMode:error:", v7, a3, 0);

  }
}

- (void)updateChipEpoch:(unint64_t)a3 remoteEndpoint:(id)a4
{
  void *v6;
  void *v7;
  id v8;

  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:epoch:error:", v7, a3, 0);

  }
}

- (void)updateEnableMixMatch:(BOOL)a3 remoteEndpoint:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:enableMixMatch:error:", v7, v4, 0);

  }
}

- (void)updateSocLiveNonce:(BOOL)a3 remoteEndpoint:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:liveNonce:error:", v7, v4, 0);

  }
}

- (void)updatePrefixNeedsLogicalUnitNumber:(BOOL)a3 remoteEndpoint:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:prefixNeedsLUN:error:", v7, v4, 0);

  }
}

- (void)updateSuffixNeedsLogicalUnitNumber:(BOOL)a3 remoteEndpoint:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = a4;
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) == 0)
  {
    -[UARPUploader controller](self, "controller");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "queryCompleteForAccessory:suffixNeedsLUN:error:", v7, v4, 0);

  }
}

- (BOOL)shouldSendFirmwareStagingProgressForAccessory:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;
  void *v12;
  void *v13;
  NSMutableDictionary *lastReportedProgressTime;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  NSMutableDictionary *v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_isInternalBuild
    && (objc_msgSend(v7, "id"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "isDynamicAsset"),
        v9,
        (v10 & 1) == 0))
  {
    objc_msgSend(v6, "modelNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v13, "supportsInternalSettings"))
    {
      lastReportedProgressTime = self->_lastReportedProgressTime;
      objc_msgSend(v6, "uuid");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary objectForKeyedSubscript:](lastReportedProgressTime, "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17;
      if (v16 && (objc_msgSend(v17, "timeIntervalSinceDate:", v16), v19 < 1.0))
      {
        v11 = 0;
      }
      else
      {
        v20 = self->_lastReportedProgressTime;
        objc_msgSend(v6, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary setObject:forKeyedSubscript:](v20, "setObject:forKeyedSubscript:", v18, v21);

        v11 = 1;
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (unsigned)requestBytesInRangeForAccessory:(id)a3 asset:(id)a4 bytes:(void *)a5 length:(unsigned int)a6 offset:(unsigned int)a7 bytesCopied:(unsigned int *)a8 offsetUsed:(unsigned int *)a9
{
  uint64_t v10;
  id v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unint64_t v24;
  unint64_t v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  unsigned int v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v39;
  void *v40;
  NSObject *log;
  void *v42;
  void *v43;
  unsigned int v44;
  UARPUploaderUARP *v45;
  unsigned int *v46;
  id v47;
  id v49;
  uint8_t buf[4];
  _BYTE v51[20];
  uint64_t v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;
  __int16 v57;
  void *v58;
  uint64_t v59;

  v10 = *(_QWORD *)&a7;
  v59 = *MEMORY[0x24BDAC8D0];
  v49 = a3;
  v14 = a4;
  v15 = self->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    log = v15;
    objc_msgSend(v14, "id");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "tag");
    v39 = v10;
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v45 = self;
    v16 = a6;
    objc_msgSend(v49, "accessory");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "getID");
    v47 = v14;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "modelIdentifier");
    v46 = a8;
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "accessory");
    v44 = a6;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "serialNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "accessory");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "uuid");
    v22 = v10;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    *(_QWORD *)v51 = v40;
    *(_WORD *)&v51[8] = 2048;
    *(_QWORD *)&v51[10] = v39;
    *(_WORD *)&v51[18] = 2048;
    v52 = v16;
    self = v45;
    v53 = 2112;
    v54 = v18;
    v55 = 2112;
    v56 = v20;
    v57 = 2112;
    v58 = v23;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.DATA.REQ <%@> <offset=%lu> <length=%lu> from %@ <SN=%@> <UUID=%@>", buf, 0x3Eu);

    v10 = v22;
    a6 = v44;

    a8 = v46;
    v14 = v47;

  }
  v24 = objc_msgSend(v14, "fileLength");
  if (!v24)
  {
    v36 = self->_log;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v51 = v10;
      *(_WORD *)&v51[4] = 2112;
      *(_QWORD *)&v51[6] = v14;
      *(_WORD *)&v51[14] = 1024;
      *(_DWORD *)&v51[16] = a6;
      _os_log_error_impl(&dword_212D08000, v36, OS_LOG_TYPE_ERROR, "Requested offset (%d) invalid for asset %@ with length (%d)", buf, 0x18u);
    }
    *a8 = 0;
    goto LABEL_15;
  }
  v25 = v24;
  if (v24 > v10)
  {
    if (v24 < v10 + a6)
    {
      a6 = v24 - v10;
      v26 = self->_log;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v51 = a6;
        *(_WORD *)&v51[4] = 1024;
        *(_DWORD *)&v51[6] = v10;
        *(_WORD *)&v51[10] = 2112;
        *(_QWORD *)&v51[12] = v14;
        _os_log_debug_impl(&dword_212D08000, v26, OS_LOG_TYPE_DEBUG, "Can only provide %d bytes from offset %d of asset %@", buf, 0x18u);
      }
    }
    v27 = a6;
    *a8 = a6;
    if (a9)
      *a9 = v10;
    if (a6)
    {
      objc_msgSend(v14, "getDataInRange:error:", v10, a6, 0);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "getBytes:range:", a5, 0, v27);
      objc_msgSend(v49, "accessory");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFirmwareUpdateBytesTransferred:", *a8 + objc_msgSend(v29, "firmwareUpdateBytesTransferred"));

      objc_msgSend(v49, "accessory");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "id");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPUploader firmwareStagingDataBlockTransferred:assetID:offset:blockSize:](self, "firmwareStagingDataBlockTransferred:assetID:offset:blockSize:", v30, v31, v10, v27);

      objc_msgSend(v49, "accessory");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v31) = -[UARPUploaderUARP shouldSendFirmwareStagingProgressForAccessory:asset:](self, "shouldSendFirmwareStagingProgressForAccessory:asset:", v32, v14);

      objc_msgSend(v49, "accessory");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "id");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[UARPUploader firmwareStagingProgress:assetID:bytesSent:bytesTotal:filterProgress:](self, "firmwareStagingProgress:assetID:bytesSent:bytesTotal:filterProgress:", v33, v34, (v27 + v10), v25, v31 ^ 1);

      v35 = 0;
      goto LABEL_19;
    }
LABEL_15:
    v35 = 5;
    goto LABEL_19;
  }
  v37 = self->_log;
  if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v51 = v10;
    *(_WORD *)&v51[4] = 2112;
    *(_QWORD *)&v51[6] = v14;
    *(_WORD *)&v51[14] = 1024;
    *(_DWORD *)&v51[16] = a6;
    _os_log_error_impl(&dword_212D08000, v37, OS_LOG_TYPE_ERROR, "Requested offset (%d) invalid for asset %@ with length (%d)", buf, 0x18u);
  }
  *a8 = 0;
  v35 = 4;
LABEL_19:

  return v35;
}

- (void)assetStagingComplete:(id)a3 asset:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  void *v21;
  NSObject *log;
  void *v23;
  void *v24;
  UARPUploaderUARP *v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  const char *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    log = v10;
    objc_msgSend(v9, "id");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "tag");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v8, "downstreamID");
    objc_msgSend(v8, "accessory");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "getID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "modelIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "serialNumber");
    v25 = self;
    v14 = a5;
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v27 = v21;
    v28 = 1024;
    v29 = v20;
    v30 = 2112;
    v31 = v12;
    v32 = 2112;
    v33 = v15;
    v34 = 2112;
    v35 = v17;
    v36 = 2080;
    v37 = UARPFirmwareStagingCompletionStatusToString(v14);
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.STAGE.COMPLETE <%@> from <DSID=%u> %@ <SN=%@> <UUID=%@>; status is <%s>",
      buf,
      0x3Au);

    a5 = v14;
    self = v25;

  }
  if ((objc_msgSend(v8, "isDownstreamEndpoint") & 1) != 0)
  {
    if (!a5)
      -[UARPUploaderUARP applyStagedAssetsForoDownstreamEndpoint:](self, "applyStagedAssetsForoDownstreamEndpoint:", v8);
  }
  else
  {
    objc_msgSend(v8, "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "id");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPUploader firmwareStagingComplete:assetID:withStatus:](self, "firmwareStagingComplete:assetID:withStatus:", v18, v19, a5);

  }
}

- (void)assetStagingPause:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *log;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    log = v5;
    v6 = objc_msgSend(v4, "downstreamID");
    objc_msgSend(v4, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.STAGE.PAUSE from <DSID=%u> %@ <SN=%@> <UUID=%@>", buf, 0x26u);

  }
  -[UARPUploader controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetStagingPause:", v15);

}

- (void)assetStagingResume:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *log;
  uint8_t buf[4];
  int v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = self->_log;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    log = v5;
    v6 = objc_msgSend(v4, "downstreamID");
    objc_msgSend(v4, "accessory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "getID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modelIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "serialNumber");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "uuid");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v18 = v6;
    v19 = 2112;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    v23 = 2112;
    v24 = v13;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.STAGE.RESUME from <DSID=%u> %@ <SN=%@> <UUID=%@>", buf, 0x26u);

  }
  -[UARPUploader controller](self, "controller");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessory");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "assetStagingResume:", v15);

}

- (void)rescindStagedAssetsAck:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *v9;
  void *v10;
  _DWORD v11[2];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v9 = log;
    v11[0] = 67109120;
    v11[1] = objc_msgSend(v6, "downstreamID");
    _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "UARP.RESCIND.ACK <DSID=%u>", (uint8_t *)v11, 8u);

  }
  if ((objc_msgSend(v6, "isDownstreamEndpoint") & 1) == 0)
  {
    objc_msgSend(v6, "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPUploader stagedFirmwareRescindComplete:withStatus:](self, "stagedFirmwareRescindComplete:withStatus:", v10, 6);

  }
}

- (void)assetRelease:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Release asset %@", buf, 0xCu);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __39__UARPUploaderUARP_assetRelease_asset___block_invoke;
  v12[3] = &unk_24CEA2488;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, v12);

}

uint64_t __39__UARPUploaderUARP_assetRelease_asset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeAsset:", *(_QWORD *)(a1 + 40));
}

- (void)applyStagedAssetStatus:(id)a3 status:(unint64_t)a4
{
  id v5;
  NSObject *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *log;
  uint8_t buf[4];
  int v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  const char *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = self->_log;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    log = v6;
    v7 = objc_msgSend(v5, "downstreamID");
    objc_msgSend(v5, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "getID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "modelIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessory");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "serialNumber");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessory");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67110146;
    v19 = v7;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    v24 = 2112;
    v25 = v14;
    v26 = 2080;
    v27 = UARPFirmwareApplicationStatusToString(a4);
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.APPLY.COMPLETE from <DSID=%u> %@ <SN=%@> <UUID=%@>; status is <%s>",
      buf,
      0x30u);

  }
  if ((objc_msgSend(v5, "isDownstreamEndpoint") & 1) == 0)
  {
    objc_msgSend(v5, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UARPUploader stagedFirmwareApplicationComplete:withStatus:](self, "stagedFirmwareApplicationComplete:withStatus:", v15, a4);

  }
}

- (void)transferPauseAck:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  int v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = log;
    v7 = objc_msgSend(v4, "downstreamID");
    objc_msgSend(v4, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109378;
    v9[1] = v7;
    v10 = 2112;
    v11 = v8;
    _os_log_impl(&dword_212D08000, v6, OS_LOG_TYPE_INFO, "UARP.PAUSE.ACK <DSID=%hu> %@", (uint8_t *)v9, 0x12u);

  }
  objc_msgSend(v4, "isDownstreamEndpoint");

}

- (void)transferResumeAck:(id)a3
{
  id v4;
  NSObject *log;
  NSObject *v6;
  int v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v6 = log;
    v7 = objc_msgSend(v4, "downstreamID");
    objc_msgSend(v4, "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109378;
    v9[1] = v7;
    v10 = 2112;
    v11 = v8;
    _os_log_impl(&dword_212D08000, v6, OS_LOG_TYPE_INFO, "UARP.RESUME.ACK <DSID=%hu> %@", (uint8_t *)v9, 0x12u);

  }
  objc_msgSend(v4, "isDownstreamEndpoint");

}

- (void)protocolVersionSelected:(id)a3 protocolVersion:(unsigned __int16)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[4];
  id v10;
  UARPUploaderUARP *v11;
  unsigned __int16 v12;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__UARPUploaderUARP_protocolVersionSelected_protocolVersion___block_invoke;
  block[3] = &unk_24CEA40B8;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __60__UARPUploaderUARP_protocolVersionSelected_protocolVersion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  NSObject *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  const char *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t i;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t j;
  void *v39;
  char v40;
  _QWORD *v41;
  NSObject *v42;
  void *v43;
  NSObject *log;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  int v59;
  __int16 v60;
  void *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  uint64_t v66;

  v66 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "modelNumber");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "setUarpVersion:", *(unsigned __int16 *)(a1 + 48));
  v5 = objc_msgSend(*(id *)(a1 + 32), "uarpVersion");
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setUarpVersion:", v5);

  v7 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = *(void **)(a1 + 32);
    log = v7;
    v9 = objc_msgSend(v8, "uarpVersion");
    v10 = v4;
    v11 = objc_msgSend(*(id *)(a1 + 32), "downstreamID");
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "getID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modelIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "serialNumber");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "uuid");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134219010;
    v57 = v9;
    v58 = 1024;
    v59 = v11;
    v4 = v10;
    v60 = 2112;
    v61 = v13;
    v62 = 2112;
    v63 = v15;
    v64 = 2112;
    v65 = v17;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.PROTOCOL.VERSION (%lu) <DSID=%hu> for %@ <SN=%@> <UUID=%@>", buf, 0x30u);

  }
  if (objc_msgSend(*(id *)(a1 + 32), "uarpVersion"))
  {
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "suppressInfoQueries");

    if ((v19 & 1) != 0)
    {
      v20 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(void **)(a1 + 32);
        v22 = v20;
        objc_msgSend(v21, "accessory");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v57 = (uint64_t)v23;
        _os_log_impl(&dword_212D08000, v22, OS_LOG_TYPE_INFO, "Protocol Version Selected: Suppressed Info Queries for %@", buf, 0xCu);

      }
    }
    else
    {
      if (objc_msgSend(v4, "supportsFriendlyName"))
        objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 13, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 2, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 4, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 5, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 12, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 11, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 3, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 0, *(_QWORD *)(a1 + 32));
      objc_msgSend(*(id *)(a1 + 40), "_queryProperty:endpoint:", 1, *(_QWORD *)(a1 + 32));
      v50 = 0u;
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "infoPropertiesToQuery");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v51;
        do
        {
          for (i = 0; i != v31; ++i)
          {
            if (*(_QWORD *)v51 != v32)
              objc_enumerationMutation(v29);
            uarpPlatformEndpointRequestInfoProperty(objc_msgSend(*(id *)(a1 + 40), "uarpEndpoint"), objc_msgSend(*(id *)(a1 + 32), "uarpEndpoint"), objc_msgSend(*(id *)(*((_QWORD *)&v50 + 1) + 8 * i), "unsignedLongValue"));
          }
          v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
        }
        while (v31);
      }

      objc_msgSend(*(id *)(a1 + 32), "clearQueuedInfoProperties");
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      objc_msgSend(*(id *)(a1 + 32), "applePropertiesToQuery");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v35)
      {
        v36 = v35;
        v37 = *(_QWORD *)v47;
        do
        {
          for (j = 0; j != v36; ++j)
          {
            if (*(_QWORD *)v47 != v37)
              objc_enumerationMutation(v34);
            UARPPlatformEndpointRequestAppleInfoProperty(*(void **)(a1 + 40), *(void **)(a1 + 32), objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * j), "unsignedLongValue"));
          }
          v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
        }
        while (v36);
      }

      objc_msgSend(*(id *)(a1 + 32), "clearQueuedAppleProperties");
    }
    objc_msgSend(*(id *)(a1 + 32), "accessory");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "suppressAutomaticDynamicAssets");

    v41 = *(_QWORD **)(a1 + 40);
    if ((v40 & 1) == 0)
    {
      objc_msgSend(v41, "solicitExpectedDynamicAssets:", *(_QWORD *)(a1 + 32));
      goto LABEL_31;
    }
    v42 = v41[3];
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      v43 = *(void **)(a1 + 32);
      v26 = v42;
      objc_msgSend(v43, "accessory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = (uint64_t)v27;
      v28 = "Protocol Version Selected: Suppressed Automatic Dynamic Asset Solicitation for %@";
      goto LABEL_29;
    }
  }
  else
  {
    v24 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 24);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = *(void **)(a1 + 32);
      v26 = v24;
      objc_msgSend(v25, "accessory");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v57 = (uint64_t)v27;
      v28 = "Protocol Version Invalid, no further action until a new SYNC occurs %@";
LABEL_29:
      _os_log_impl(&dword_212D08000, v26, OS_LOG_TYPE_INFO, v28, buf, 0xCu);

    }
  }
LABEL_31:

}

- (void)assetSolicitationComplete:(id)a3 asset:(id)a4 status:(unint64_t)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *log;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = self->_log;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    log = v10;
    objc_msgSend(v9, "id");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "tag");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "getID");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "modelIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "serialNumber");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessory");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "uuid");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v25 = v19;
    v26 = 2112;
    v27 = v11;
    v28 = 2112;
    v29 = v13;
    v30 = 2112;
    v31 = v15;
    v32 = 2080;
    v33 = UARPFirmwareStagingCompletionStatusToString(a5);
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.SOLICIT.COMPLETE <%@> from %@ <SN=%@> <UUID=%@>; status is <%s>",
      buf,
      0x34u);

  }
  -[UARPUploader controller](self, "controller");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessory");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "id");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "assetSolicitationComplete:assetID:withStatus:", v17, v18, a5);

}

- (void)assetSolicitationProgress:(id)a3 asset:(id)a4 offset:(unint64_t)a5 assetLength:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v26;
  NSObject *log;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  unint64_t v34;
  __int16 v35;
  unint64_t v36;
  __int16 v37;
  unint64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = self->_log;
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v23 = v12;
    objc_msgSend(v10, "accessory");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v32 = v11;
    v33 = 2112;
    v34 = (unint64_t)v24;
    v35 = 2048;
    v36 = a5;
    v37 = 2048;
    v38 = a6;
    _os_log_debug_impl(&dword_212D08000, v23, OS_LOG_TYPE_DEBUG, "Asset <%@> Solicitation progress for accessory <%@> offset=<%lu> of total=<%lu>", buf, 0x2Au);

  }
  v13 = self->_log;
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    log = v13;
    objc_msgSend(v11, "id");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "tag");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessory");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "getID");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "modelIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "serialNumber");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessory");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "uuid");
    v26 = v11;
    v18 = a5;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413570;
    v32 = v25;
    v33 = 2048;
    v34 = v18;
    v35 = 2048;
    v36 = a6;
    v37 = 2112;
    v38 = (unint64_t)v14;
    v39 = 2112;
    v40 = v16;
    v41 = 2112;
    v42 = v19;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.SOLICIT.PROGRESS <%@> <offset=%lu> <asset length=%lu> from %@ <SN=%@> <UUID=%@>", buf, 0x3Eu);

    a5 = v18;
    v11 = v26;

  }
  -[UARPUploader controller](self, "controller");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "accessory");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "id");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "assetSolicitationProgress:assetID:bytesReceived:bytesTotal:", v21, v22, a5, a6);

}

- (void)offerDynamicAssetToAccessory:(id)a3 asset:(id)a4 internalOffer:(BOOL)a5 tag:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[5];
  id v18;
  id v19;
  id v20;
  BOOL v21;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke;
  block[3] = &unk_24CEA40E0;
  block[4] = self;
  v18 = v11;
  v21 = a5;
  v19 = v10;
  v20 = v12;
  v14 = v12;
  v15 = v10;
  v16 = v11;
  dispatch_async(queue, block);

}

void __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void **v12;
  NSObject *v13;
  NSObject *log;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  const __CFString *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(void **)(a1 + 40);
    log = v2;
    objc_msgSend(v3, "id");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "tag");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(a1 + 64))
      v5 = CFSTR("Internal");
    else
      v5 = CFSTR("External");
    objc_msgSend(*(id *)(a1 + 48), "accessory");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "getID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "accessory");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "serialNumber");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "accessory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "uuid");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v18 = v4;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v7;
    v23 = 2112;
    v24 = v9;
    v25 = 2112;
    v26 = v11;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.OFFER.DA %@ <%@> from %@ <SN=%@> <UUID=%@>", buf, 0x34u);

  }
  v12 = (void **)(a1 + 48);
  if (UARPPlatformControllerOfferDynamicAsset(*(void **)(a1 + 32), *(void **)(a1 + 48), *(void **)(a1 + 40), *(void **)(a1 + 56), *(unsigned __int8 *)(a1 + 64)))
  {
    v13 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke_cold_1(v12, v13);
  }
}

- (void)processDynamicAssetVoiceAssist:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __51__UARPUploaderUARP_processDynamicAssetVoiceAssist___block_invoke;
  block[3] = &unk_24CEA38E0;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

uint64_t __51__UARPUploaderUARP_processDynamicAssetVoiceAssist___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  v3 = 0;
  return objc_msgSend(v1, "processDynamicAsset:", &v3);
}

- (void)processDynamicAssetHeySiriCompact:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__UARPUploaderUARP_processDynamicAssetHeySiriCompact___block_invoke;
  block[3] = &unk_24CEA38E0;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

}

uint64_t __54__UARPUploaderUARP_processDynamicAssetHeySiriCompact___block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v3;

  v1 = *(void **)(a1 + 32);
  v3 = 0;
  return objc_msgSend(v1, "processDynamicAsset:", &v3);
}

- (void)solicitExpectedDynamicAssets:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "isDownstreamEndpoint"))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Protocol Version Selected: Do not query expected dynamic assets for downstream endpoints", buf, 2u);
    }
  }
  else
  {
    objc_msgSend(v4, "accessory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "modelNumber");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      if (objc_msgSend(v8, "supportsHeySiriCompact"))
      {
        v9 = self->_log;
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          -[UARPUploaderUARP solicitExpectedDynamicAssets:].cold.3(v9);
        +[UARPHeySiriModelCompact tag](UARPHeySiriModelCompact, "tag");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = 0;
        -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:](self, "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:", v4, v10, 1, &v19);

      }
      if (objc_msgSend(v8, "supportsAnalytics"))
      {
        objc_msgSend(v8, "hardwareID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "transport");

        if (v12 == 3)
        {
          v13 = self->_log;
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[UARPUploaderUARP solicitExpectedDynamicAssets:].cold.2(v13);
          +[UARPDynamicAssetAnalyticsEvent tag](UARPDynamicAssetAnalyticsEvent, "tag");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 0;
          -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:](self, "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:", v4, v14, 1, &v18);

        }
      }
      if (objc_msgSend(v8, "supportsVersions"))
      {
        v15 = self->_log;
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          -[UARPUploaderUARP solicitExpectedDynamicAssets:].cold.1(v15);
        +[UARPDynamicAssetVersions tag](UARPDynamicAssetVersions, "tag");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 0;
        -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:](self, "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:", v4, v16, 1, &v17);

      }
    }

  }
}

- (void)processDynamicAssetVersions:(id)a3 partnerSerialNumbers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *queue;
  _QWORD block[4];
  id v11;
  UARPUploaderUARP *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke;
    block[3] = &unk_24CEA3E08;
    v11 = v7;
    v12 = self;
    v13 = v6;
    dispatch_async(queue, block);

  }
}

void __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(","));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "controller");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "updateProperty:value:forAccessory:", 35, v2, *(_QWORD *)(a1 + 48));

  if ((v4 & 1) == 0 && os_log_type_enabled(*(os_log_t *)(*(_QWORD *)(a1 + 40) + 24), OS_LOG_TYPE_ERROR))
    __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke_cold_1((uint64_t)v2);

}

- (void)rescindAssets:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  UARPUploaderUARP *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __34__UARPUploaderUARP_rescindAssets___block_invoke;
  v7[3] = &unk_24CEA2488;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __34__UARPUploaderUARP_rescindAssets___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(*(id *)(a1 + 32), "accessory");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayWithObject:", v3);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 40), "controller");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rescindStagedFirmwareOnAccessoryList:withUserIntent:", v5, 0);

}

- (void)rescindedRxDynamicAsset:(id)a3 asset:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v7;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Rescinded Dynamic Asset %@", buf, 0xCu);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __50__UARPUploaderUARP_rescindedRxDynamicAsset_asset___block_invoke;
  v12[3] = &unk_24CEA2488;
  v13 = v6;
  v14 = v7;
  v10 = v7;
  v11 = v6;
  dispatch_async(queue, v12);

}

uint64_t __50__UARPUploaderUARP_rescindedRxDynamicAsset_asset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "abandonRxDynamicAsset:", *(_QWORD *)(a1 + 40));
}

- (void)addMappingDatabaseFromAsset:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  UARPUploaderUARP *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__UARPUploaderUARP_addMappingDatabaseFromAsset___block_invoke;
  v7[3] = &unk_24CEA2488;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __48__UARPUploaderUARP_addMappingDatabaseFromAsset___block_invoke(uint64_t a1)
{
  UARPDynamicAssetTmapDatabase *v2;
  void *v3;
  void *v4;
  UARPDynamicAssetCmapDatabase *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v2 = [UARPDynamicAssetTmapDatabase alloc];
  objc_msgSend(*(id *)(a1 + 32), "id");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[UARPDynamicAssetTmapDatabase initTmapDatabase:](v2, "initTmapDatabase:", v4);

  objc_msgSend(v9, "decomposeUARP");
  v5 = [UARPDynamicAssetCmapDatabase alloc];
  objc_msgSend(*(id *)(a1 + 32), "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[UARPDynamicAssetCmapDatabase initCmapDatabase:](v5, "initCmapDatabase:", v7);

  objc_msgSend(v8, "decomposeUARP");
  objc_msgSend(*(id *)(a1 + 40), "qProcessDynamicAssets");

}

- (void)addUnprocessedDynamicAsset:(id)a3 withAssetTag:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  id v13;
  UARPUploaderUARP *v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__UARPUploaderUARP_addUnprocessedDynamicAsset_withAssetTag___block_invoke;
  block[3] = &unk_24CEA3E08;
  v12 = v6;
  v13 = v7;
  v14 = self;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __60__UARPUploaderUARP_addUnprocessedDynamicAsset_withAssetTag___block_invoke(_QWORD *a1)
{
  UARPSuperBinaryAsset *v2;

  v2 = -[UARPSuperBinaryAsset initWithURL:assetTag:]([UARPSuperBinaryAsset alloc], "initWithURL:assetTag:", a1[4], a1[5]);
  objc_msgSend(*(id *)(a1[6] + 1232), "addObject:", v2);

}

- (void)qProcessDynamicAssets
{
  NSObject *log;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  NSMutableArray *obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[16];
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP Processing Dynamic Assets.", buf, 2u);
  }
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  obj = self->_unprocessedDynamicAssets;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v8, "assetTag");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        +[UARPDynamicAssetMappedAnalyticsEvent tag](UARPDynamicAssetMappedAnalyticsEvent, "tag");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "isEqual:", v10))
          v11 = -[UARPUploaderUARP qProcessMticDynamicAsset:](self, "qProcessMticDynamicAsset:", v8);
        else
          v11 = 0;
        +[UARPDynamicAssetCrashLogEvent tag](UARPDynamicAssetCrashLogEvent, "tag");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v9, "isEqual:", v12))
        {
          if (!v11)
            goto LABEL_16;
LABEL_15:
          objc_msgSend(v13, "addObject:", v8);
          goto LABEL_16;
        }
        if (-[UARPUploaderUARP qProcessCrshDynamicAsset:](self, "qProcessCrshDynamicAsset:", v8))
          goto LABEL_15;
LABEL_16:

      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v5);
  }

  -[NSMutableArray removeObjectsInArray:](self->_unprocessedDynamicAssets, "removeObjectsInArray:", v13);
}

- (void)ageOutUnprocessedDynamicAssets
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __50__UARPUploaderUARP_ageOutUnprocessedDynamicAssets__block_invoke;
  block[3] = &unk_24CEA38E0;
  block[4] = self;
  dispatch_async(queue, block);
}

void __50__UARPUploaderUARP_ageOutUnprocessedDynamicAssets__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "UARP Aging out old Dynamic Assets.", buf, 2u);
  }
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + 1232);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v8, "timeCreated", (_QWORD)v12);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "timeIntervalSinceNow");
        v11 = v10;

        if (v11 >= 604800.0)
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1232), "removeObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v5);
  }

}

- (BOOL)qProcessMticDynamicAsset:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  UARPDynamicAssetMappedAnalyticsEvent *v7;
  BOOL v8;
  uint8_t v10[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Processing Existing MTIC Dynamic Asset with new TMAP", v10, 2u);
  }
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPDynamicAssetMappedAnalyticsEvent initWithURL:]([UARPDynamicAssetMappedAnalyticsEvent alloc], "initWithURL:", v6);
  if (-[UARPDynamicAssetMappedAnalyticsEvent decomposeUARP](v7, "decomposeUARP"))
  {
    if (!-[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP](v7, "findMatchingTMAP"))
    {
      v8 = 0;
      goto LABEL_9;
    }
    if (-[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads](v7, "expandMTICPayloads"))
      -[UARPDynamicAssetMappedAnalyticsEvent send](v7, "send");
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (BOOL)qProcessCrshDynamicAsset:(id)a3
{
  id v4;
  NSObject *log;
  void *v6;
  UARPDynamicAssetCrashLogEvent *v7;
  BOOL v8;
  uint8_t v10[16];

  v4 = a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Processing Existing CRSH Dynamic Asset with new CMAP", v10, 2u);
  }
  objc_msgSend(v4, "url");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UARPDynamicAssetCrashLogEvent initWithURL:]([UARPDynamicAssetCrashLogEvent alloc], "initWithURL:", v6);
  if (-[UARPDynamicAssetCrashLogEvent decomposeUARP](v7, "decomposeUARP"))
  {
    if (!-[UARPDynamicAssetCrashLogEvent findMatchingCMAP](v7, "findMatchingCMAP"))
    {
      v8 = 0;
      goto LABEL_9;
    }
    if (-[UARPDynamicAssetCrashLogEvent processCrashInstance](v7, "processCrashInstance"))
      -[UARPDynamicAssetCrashLogEvent sendSpeedTracer](v7, "sendSpeedTracer");
  }
  v8 = 1;
LABEL_9:

  return v8;
}

- (BOOL)startTapToRadar:(id)a3
{
  id v5;
  NSObject *log;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  if (self->_isTapToRadarMode)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Already in Tap To Radar Mode.", buf, 2u);
    }
  }
  else
  {
    self->_isTapToRadarMode = 1;
    objc_storeStrong((id *)&self->_ttrDirectory, a3);
    -[UARPUploaderUARP copyDynamicAssetsForTapToRadar](self, "copyDynamicAssetsForTapToRadar");
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v7 = self->_accessories;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v14;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v14 != v10)
            objc_enumerationMutation(v7);
          -[UARPUploaderUARP solicitDynamicAssetsForTapToRadar:](self, "solicitDynamicAssetsForTapToRadar:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v11++), (_QWORD)v13);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v9);
    }

  }
  return 1;
}

- (void)stopTapToRadar
{
  NSURL *ttrDirectory;

  self->_isTapToRadarMode = 0;
  ttrDirectory = self->_ttrDirectory;
  self->_ttrDirectory = 0;

}

- (void)solicitDynamicAssetsForTapToRadar:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *log;
  UARPAssetTag *v8;
  uint8_t v9[16];

  v4 = a3;
  objc_msgSend(v4, "appleModelNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "UARP.TTR.Solicit Dynamic Assets for Radar.", v9, 2u);
  }
  if (objc_msgSend(v6, "ttrSolicitLogs"))
  {
    v8 = -[UARPAssetTag initWithString:]([UARPAssetTag alloc], "initWithString:", CFSTR("LOGS"));
    -[UARPUploaderUARP solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:](self, "solicitDynamicAssetForRemoteEndpoint:assetTag:internalSolicit:error:", v4, v8, 1, 0);

  }
}

- (void)copyDynamicAssetsForTapToRadar
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringLogsDirectoryFilePath();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentsOfDirectoryAtPath:error:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v30;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v30 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
        UARPStringLogsDirectoryFilePath();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL path](self->_ttrDirectory, "path");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        UARPCopyFile((uint64_t)v12, v13, v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  UARPStringCrashAnalyticsDirectoryFilePath();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "contentsOfDirectoryAtPath:error:", v15, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v17 = v16;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
  if (v18)
  {
    v19 = v18;
    v20 = *(_QWORD *)v26;
    do
    {
      v21 = 0;
      do
      {
        if (*(_QWORD *)v26 != v20)
          objc_enumerationMutation(v17);
        v22 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v21);
        UARPStringCrashAnalyticsDirectoryFilePath();
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSURL path](self->_ttrDirectory, "path", (_QWORD)v25);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        UARPCopyFile((uint64_t)v23, v24, v22);

        ++v21;
      }
      while (v19 != v21);
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
    }
    while (v19);
  }

}

- (id)pendingTssRequests
{
  void *v3;
  NSObject *queue;
  id v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  UARPUploaderUARP *v12;
  id v13;

  v3 = (void *)objc_opt_new();
  queue = self->_queue;
  v8 = MEMORY[0x24BDAC760];
  v9 = 3221225472;
  v10 = __38__UARPUploaderUARP_pendingTssRequests__block_invoke;
  v11 = &unk_24CEA2488;
  v12 = self;
  v13 = v3;
  v5 = v3;
  dispatch_sync(queue, &v8);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5, v8, v9, v10, v11, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __38__UARPUploaderUARP_pendingTssRequests__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 1120);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "pendingTssRequestForEndpoint:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * v6), (_QWORD)v8);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
          objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v7);

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)pendingTssRequestForEndpoint:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  NSObject *log;
  NSObject *v11;
  void *v12;
  UARPUploaderUARP *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v29;
  uint64_t v30;
  id obj;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = (void *)objc_opt_new();
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v29 = v4;
  objc_msgSend(v4, "rxDynamicAssets");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
  if (v32)
  {
    v6 = *(_QWORD *)v34;
    v30 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v34 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        objc_msgSend(v8, "pendingTssRequest");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            v11 = log;
            objc_msgSend(v8, "pendingTssRequest");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "tatsuServerURL");
            v13 = self;
            v14 = v5;
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "pendingTssRequest");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "options");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136315650;
            v38 = "-[UARPUploaderUARP pendingTssRequestForEndpoint:]";
            v39 = 2112;
            v40 = v15;
            v41 = 2112;
            v42 = v17;
            _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: Pending TSS request for Signing Server %@ is %@", buf, 0x20u);

            v5 = v14;
            self = v13;
            v6 = v30;

          }
          v18 = (void *)MEMORY[0x24BDBCED8];
          objc_msgSend(v8, "pendingTssRequest");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "options");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "dictionaryWithDictionary:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v8, "pendingTssRequest");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "tatsuServerURL");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "absoluteString");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("tatsuSigningServer"));

          v25 = self->_log;
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            v38 = "-[UARPUploaderUARP pendingTssRequestForEndpoint:]";
            v39 = 2112;
            v40 = v21;
            _os_log_impl(&dword_212D08000, v25, OS_LOG_TYPE_INFO, "%s: Modified Pending TSS request is %@", buf, 0x16u);
          }
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithDictionary:", v21);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v26);

        }
      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v43, 16);
    }
    while (v32);
  }

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  return v27;
}

- (void)tssResponse:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __32__UARPUploaderUARP_tssResponse___block_invoke;
  block[3] = &unk_24CEA2488;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __32__UARPUploaderUARP_tssResponse___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  NSObject *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t v15[128];
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 136315394;
    v17 = "-[UARPUploaderUARP tssResponse:]_block_invoke";
    v18 = 2112;
    v19 = v3;
    _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "%s: Checking pending TSS requests for response %@", buf, 0x16u);
  }
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 1120);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(a1 + 32), "tssResponseForEndpoint:tssResponse:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), *(_QWORD *)(a1 + 40), (_QWORD)v11))
        {
          v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            v10 = *(_QWORD *)(a1 + 40);
            *(_DWORD *)buf = 136315394;
            v17 = "-[UARPUploaderUARP tssResponse:]_block_invoke";
            v18 = 2112;
            v19 = v10;
            _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "%s: Matched TSS requests with response %@", buf, 0x16u);
          }
          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

}

- (BOOL)tssResponseForEndpoint:(id)a3 tssResponse:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    v14 = 136315394;
    v15 = "-[UARPUploaderUARP tssResponseForEndpoint:tssResponse:]";
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Check matching TSS requests for %@", (uint8_t *)&v14, 0x16u);
  }
  v9 = objc_msgSend(v6, "handlePersonalizationResponse:", v7);
  v10 = self->_log;
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v9)
  {
    if (v11)
    {
      v14 = 136315394;
      v15 = "-[UARPUploaderUARP tssResponseForEndpoint:tssResponse:]";
      v16 = 2112;
      v17 = v6;
      v12 = "%s: matching TSS request for %@";
LABEL_8:
      _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, v12, (uint8_t *)&v14, 0x16u);
    }
  }
  else if (v11)
  {
    v14 = 136315394;
    v15 = "-[UARPUploaderUARP tssResponseForEndpoint:tssResponse:]";
    v16 = 2112;
    v17 = v6;
    v12 = "%s: No matching TSS requests for %@";
    goto LABEL_8;
  }

  return 0;
}

- (BOOL)isTapToRadarMode
{
  return self->_isTapToRadarMode;
}

- (NSURL)ttrDirectory
{
  return (NSURL *)objc_getProperty(self, a2, 1216, 1);
}

- (void).cxx_destruct
{
  uint64_t i;

  objc_storeStrong((id *)&self->_unprocessedDynamicAssets, 0);
  objc_storeStrong((id *)&self->_ttrDirectory, 0);
  objc_storeStrong((id *)&self->_lastReportedProgressTime, 0);
  for (i = 8; i != -1; --i)
    objc_storeStrong((id *)&self->_tokens[i], 0);
  objc_storeStrong((id *)&self->_accessories, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)addAccessory:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v0, v1, "Add accessory %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)accessoryReachable:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v0, v1, "Reachable accessory %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)accessoryReachable:remoteEndpoint:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v0, v1, "Reachable remoteEndpoint %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)recvDataFromAccessory:data:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9_0(&dword_212D08000, v0, v1, "Recv %@ bytes accessory %@");
  OUTLINED_FUNCTION_1();
}

void __53__UARPUploaderUARP_recvDataFromAccessory_data_error___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[UARPUploaderUARP recvDataFromAccessory:data:error:]_block_invoke";
  OUTLINED_FUNCTION_5_0(&dword_212D08000, a1, a3, "%s: could not find remote endpoint", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

- (void)recvDataFromEndpoint:data:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9_0(&dword_212D08000, v0, v1, "Recv %@ bytes endpoint %@");
  OUTLINED_FUNCTION_1();
}

void __52__UARPUploaderUARP_recvDataFromEndpoint_data_error___block_invoke_cold_1(void *a1, unsigned int a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = OUTLINED_FUNCTION_12_0(a1);
  uarpStatusCodeToString(a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v3, v4, "UARPPlatformControllerRecvMessage() returned %s", v5);

  OUTLINED_FUNCTION_2_3();
}

void __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  v2 = 136315394;
  v3 = "-[UARPUploaderUARP offerAssetToAccessory:asset:error:]_block_invoke";
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, v1, "%s: could not find remote endpoint for accessory %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __54__UARPUploaderUARP_offerAssetToAccessory_asset_error___block_invoke_cold_2(uint64_t a1, void *a2, uint64_t *a3)
{
  unsigned int v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 24);
  v5 = a2;
  v6 = uarpStatusCodeToString(v4);
  v7 = *a3;
  v8 = 136315650;
  v9 = "-[UARPUploaderUARP offerAssetToAccessory:asset:error:]_block_invoke";
  v10 = 2080;
  v11 = v6;
  v12 = 2112;
  v13 = v7;
  _os_log_error_impl(&dword_212D08000, v5, OS_LOG_TYPE_ERROR, "%s: failed to offer firmware <%s> for accessory %@", (uint8_t *)&v8, 0x20u);

}

- (void)pauseAssetTransfersForAccessory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v0, v1, "Pause asset transfers %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)resumeAssetTransfersForAccessory:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v0, v1, "Resume asset transfers %@", v2);
  OUTLINED_FUNCTION_1();
}

- (void)cancelAssetStagingForAccessory:asset:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_9_0(&dword_212D08000, v0, v1, "Rescind asset %@ for accessory %@");
  OUTLINED_FUNCTION_1();
}

- (void)supplementalAssetUpdated:assetName:error:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Could not find supported accessory %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)supplementalAssetUpdated:assetName:error:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Unknown supplemental asset %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)supplementalAssetUpdated:assetName:error:.cold.3()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_15();
  OUTLINED_FUNCTION_3(&dword_212D08000, v0, v1, "NO Supplemental asset ?! for %@, located at %@");
  OUTLINED_FUNCTION_1();
}

void __58__UARPUploaderUARP_queryFirmwareUpdateResultForAccessory___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_0(&dword_212D08000, a2, a3, "Query last action/status for accessory %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

- (void)solicitDynamicAssetForAccessory:assetTag:error:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Could not create file for solicited dynamic asset %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_212D08000, v0, v1, "Could not find remote endpoint to solicit Dynamic Asset from accessory\n%@%@");
  OUTLINED_FUNCTION_1();
}

void __80__UARPUploaderUARP_solicitDynamicAssetForAccessory_asset_internalSolicit_error___block_invoke_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  _BYTE v3[24];

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = v0;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = v1;
  OUTLINED_FUNCTION_3(&dword_212D08000, v1, v2, "Could not solicit Dynamic Asset from accessory\n%@%@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  OUTLINED_FUNCTION_1();
}

void __88__UARPUploaderUARP_solicitDynamicAssetForRemoteEndpoint_assetTag_internalSolicit_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_212D08000, v0, v1, "Could not solicit Dynamic Asset from accessory\n%@%@");
  OUTLINED_FUNCTION_1();
}

void __61__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_error___block_invoke_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_3(&dword_212D08000, v0, v1, "Failed to find endpoint for offering dynamic asset; accessory is %@ asset is %@");
  OUTLINED_FUNCTION_1();
}

void __71__UARPUploaderUARP_unsolicitedDynamicAssetForAccessory_assetTag_error___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6_0();
  _os_log_debug_impl(&dword_212D08000, v0, OS_LOG_TYPE_DEBUG, "Unsolicited Dynamic Asset %@\nfrom accessory %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePowerSource:(os_log_t)log currentCapacity:maxCapacity:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_212D08000, log, OS_LOG_TYPE_DEBUG, "Power Source: Asset not using host battery level", v1, 2u);
}

void __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2;
  const char *v3;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  v2 = 136315394;
  v3 = "-[UARPUploaderUARP handlePersonalizationRequest:]_block_invoke";
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5(&dword_212D08000, v0, v1, "%s: no matching remote endpoint %@", (uint8_t *)&v2);
  OUTLINED_FUNCTION_1();
}

void __49__UARPUploaderUARP_handlePersonalizationRequest___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 136315394;
  v4 = "-[UARPUploaderUARP handlePersonalizationRequest:]_block_invoke";
  v5 = 2112;
  v6 = a1;
  OUTLINED_FUNCTION_5(&dword_212D08000, a2, a3, "%s: remote endpoint %@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void __48__UARPUploaderUARP_discoverDownstreamEndpoints___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Failed to find endpoint for accessory is %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)firmwareAssetIDForDownstreamEndpoint:(void *)a1 error:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = objc_msgSend(a2, "downstreamID");
  objc_msgSend(a2, "accessory");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "getID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "modelIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "accessory");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "accessory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = 67109890;
  v12[1] = v4;
  v13 = 2112;
  v14 = v7;
  v15 = 2112;
  v16 = v9;
  v17 = 2112;
  v18 = v11;
  _os_log_error_impl(&dword_212D08000, v3, OS_LOG_TYPE_ERROR, "UARP.OFFER firmware asset to <DSID=%u> %@ <SN=%@> <UUID=%@> - No direct endpoint", (uint8_t *)v12, 0x26u);

}

- (void)sendMessageToAccessory:(void *)a1 uarpMsg:(void *)a2 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  _DWORD v5[2];
  __int16 v6;
  void *v7;

  v3 = OUTLINED_FUNCTION_12_0(a1);
  objc_msgSend(a2, "length");
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = 67109378;
  v5[1] = (_DWORD)a2;
  v6 = 2112;
  v7 = v4;
  _os_log_debug_impl(&dword_212D08000, v3, OS_LOG_TYPE_DEBUG, "Send %d bytes to accessory %@", (uint8_t *)v5, 0x12u);

  OUTLINED_FUNCTION_13_1();
}

void __41__UARPUploaderUARP_watchdogExpireLayer2___block_invoke_cold_1(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  void *v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  _os_log_error_impl(&dword_212D08000, v2, OS_LOG_TYPE_ERROR, "Failed to service TX Queue %@", v5, 0xCu);

  OUTLINED_FUNCTION_2_3();
}

void __73__UARPUploaderUARP_offerDynamicAssetToAccessory_asset_internalOffer_tag___block_invoke_cold_1(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "accessory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412546;
  v7 = v4;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_5(&dword_212D08000, v3, v5, "Failed to offering dynamic asset; accessory is %@ asset is %@",
    (uint8_t *)&v6);

  OUTLINED_FUNCTION_13_1();
}

- (void)solicitExpectedDynamicAssets:(void *)a1 .cold.1(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v1, v3, "Solicit VERS from accessory %@", v4);

  OUTLINED_FUNCTION_2_3();
}

- (void)solicitExpectedDynamicAssets:(void *)a1 .cold.2(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v1, v3, "Solicit TICS (expected Dynamic Assets) from accessory %@", v4);

  OUTLINED_FUNCTION_2_3();
}

- (void)solicitExpectedDynamicAssets:(void *)a1 .cold.3(void *a1)
{
  NSObject *v1;
  void *v2;
  uint64_t v3;
  uint8_t v4[24];

  OUTLINED_FUNCTION_12_0(a1);
  objc_msgSend((id)OUTLINED_FUNCTION_16(), "accessory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_0(&dword_212D08000, v1, v3, "Solicit HSML from accessory %@", v4);

  OUTLINED_FUNCTION_2_3();
}

void __69__UARPUploaderUARP_processDynamicAssetVersions_partnerSerialNumbers___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138412546;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_3(&dword_212D08000, v1, v2, "Failed to send partnerSerialNumbers %@ for accessory %@", (_QWORD)v3, DWORD2(v3));
  OUTLINED_FUNCTION_1();
}

@end
