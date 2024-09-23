@implementation UARPUploaderEndpoint

- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 layer2Context:(uarpPlatformRemoteEndpoint *)a4 uploader:(id)a5
{
  id v9;
  id v10;
  UARPUploaderEndpoint *v11;
  UARPUploaderEndpoint *v12;
  os_log_t v13;
  OS_os_log *log;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  dispatch_queue_t v17;
  OS_dispatch_queue *personalizationQueue;
  unsigned __int16 v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  _BOOL4 v25;
  NSMutableArray *v26;
  NSMutableArray *txFirmwareAssets;
  NSMutableArray *v28;
  NSMutableArray *txDynamicAssets;
  NSMutableArray *v30;
  NSMutableArray *rxDynamicAssets;
  NSMutableArray *v32;
  NSMutableArray *downstreamEndpoints;
  NSMutableSet *v34;
  NSMutableSet *infoPropertiesToQuery;
  NSMutableSet *v36;
  NSMutableSet *applePropertiesToQuery;
  uint64_t v38;
  NSUUID *uuid;
  NSObject *v40;
  NSUUID *v41;
  NSObject *v42;
  void *v43;
  objc_super v45;
  uint8_t buf[4];
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v45.receiver = self;
  v45.super_class = (Class)UARPUploaderEndpoint;
  v11 = -[UARPUploaderEndpoint init](&v45, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_accessory, a3);
    objc_storeWeak((id *)&v12->_uploader, v10);
    v13 = os_log_create("com.apple.accessoryupdater.uarp", "uploader");
    log = v12->_log;
    v12->_log = (OS_os_log *)v13;

    v15 = dispatch_queue_create("com.apple.UARPUploaderUARP.accessory", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v15;

    v17 = dispatch_queue_create("com.apple.UARPUploaderEndpoint.personalization", 0);
    personalizationQueue = v12->_personalizationQueue;
    v12->_personalizationQueue = (OS_dispatch_queue *)v17;

    if (a4)
    {
      *(_WORD *)buf = 0;
      uarpDownstreamEndpointGetID((uint64_t)a4, buf);
      v19 = *(_WORD *)buf;
    }
    else
    {
      a4 = (uarpPlatformRemoteEndpoint *)malloc_type_calloc(1uLL, 0xB8uLL, 0x10A00403E4BE566uLL);
      v19 = 0;
    }
    v12->_downstreamID = v19;
    v12->_uarpEndpoint = a4;
    objc_msgSend(v9, "modelNumber");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    *(_DWORD *)&v12->_uarpOptions.upgradeOnly = 0;
    *(_OWORD *)&v12->_uarpOptions.maxTxPayloadLength = 0u;
    *(_OWORD *)&v12->_uarpOptions.responseTimeout = 0u;
    *(_QWORD *)&v12->_uarpOptions.maxTxPayloadLength = 0x800000008000;
    v12->_uarpOptions.payloadWindowLength = 0x8000;
    v12->_uarpOptions.protocolVersion = 4;
    v12->_uarpOptions.reofferFirmwareOnSync = 0;
    v12->_uarpOptions.responseTimeout = objc_msgSend(v21, "uploaderResponseTimeout");
    v12->_uarpOptions.retryLimit = objc_msgSend(v21, "uploaderRetryLimit");
    objc_msgSend(v9, "productGroup");
    v22 = objc_claimAutoreleasedReturnValue();
    v25 = 0;
    if (v22)
    {
      v23 = (void *)v22;
      objc_msgSend(v9, "productNumber");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
        v25 = 1;
    }
    v12->_uarpOptions.endpointType = v25;
    v12->_uarpVersion = 0;
    if (objc_msgSend(v21, "reofferFirmwareOnSync"))
      v12->_uarpOptions.reofferFirmwareOnSync = 1;
    v12->_uarpOptions.upgradeOnly = 1;
    v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    txFirmwareAssets = v12->_txFirmwareAssets;
    v12->_txFirmwareAssets = v26;

    v28 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    txDynamicAssets = v12->_txDynamicAssets;
    v12->_txDynamicAssets = v28;

    v30 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    rxDynamicAssets = v12->_rxDynamicAssets;
    v12->_rxDynamicAssets = v30;

    v32 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    downstreamEndpoints = v12->_downstreamEndpoints;
    v12->_downstreamEndpoints = v32;

    v34 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    infoPropertiesToQuery = v12->_infoPropertiesToQuery;
    v12->_infoPropertiesToQuery = v34;

    v36 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    applePropertiesToQuery = v12->_applePropertiesToQuery;
    v12->_applePropertiesToQuery = v36;

    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v38 = objc_claimAutoreleasedReturnValue();
    uuid = v12->_uuid;
    v12->_uuid = (NSUUID *)v38;

    v40 = v12->_log;
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = v12->_uuid;
      v42 = v40;
      -[NSUUID UUIDString](v41, "UUIDString");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v47 = v43;
      _os_log_impl(&dword_212D08000, v42, OS_LOG_TYPE_INFO, "New Remote Endpoint: UUID <%@>", buf, 0xCu);

    }
  }

  return v12;
}

- (UARPUploaderEndpoint)initWithUARPAccessory:(id)a3 uploader:(id)a4
{
  id v6;
  UARPUploaderEndpoint *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *log;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  UARPPacketDumper *v23;
  UARPPacketDumper *packetDumper;

  v6 = a4;
  v7 = -[UARPUploaderEndpoint initWithUARPAccessory:layer2Context:uploader:](self, "initWithUARPAccessory:layer2Context:uploader:", a3, 0, v6);
  if (v7)
  {
    UARPStringPcapFilesFilepath();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v8, 259200.0);

    UARPStringLogsDirectoryFilePath();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v9, 259200.0);

    UARPStringCrashAnalyticsDirectoryFilePath();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v10, 604800.0);

    objc_msgSend(v6, "ageOutUnprocessedDynamicAssets");
    UARPStringSysdiagnoseDirectoryFilePath();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    UARPCleanupAgedFiles(v11, 604800.0);

    -[UARPAccessory getID](v7->_accessory, "getID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "modelIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    UARPStringPcapFilesFilepath();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    UARPUniqueFilename(v13, 0, v14, 0, CFSTR(".pcap"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    log = v7->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[UARPUploaderEndpoint initWithUARPAccessory:uploader:].cold.1((uint64_t)v15, log, v17, v18, v19, v20, v21, v22);
    v23 = -[UARPPacketDumper initWithFileName:]([UARPPacketDumper alloc], "initWithFileName:", v15);
    packetDumper = v7->_packetDumper;
    v7->_packetDumper = v23;

  }
  return v7;
}

- (void)dealloc
{
  UARPPacketDumper *packetDumper;
  NSObject *layer2WatchdogTimer;
  OS_dispatch_source *v5;
  objc_super v6;

  packetDumper = self->_packetDumper;
  self->_packetDumper = 0;

  if (!self->_downstreamID)
    free(self->_uarpEndpoint);
  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  if (layer2WatchdogTimer)
  {
    dispatch_source_cancel(layer2WatchdogTimer);
    v5 = self->_layer2WatchdogTimer;
    self->_layer2WatchdogTimer = 0;

  }
  v6.receiver = self;
  v6.super_class = (Class)UARPUploaderEndpoint;
  -[UARPUploaderEndpoint dealloc](&v6, sel_dealloc);
}

- (uarpPlatformRemoteEndpoint)uarpEndpoint
{
  return self->_uarpEndpoint;
}

- (uarpPlatformOptionsObj)uarpOptions
{
  return &self->_uarpOptions;
}

- (UARPUploaderEndpoint)directEndpoint
{
  return self->_directEndpoint;
}

- (NSArray)txFirmwareAssets
{
  UARPUploaderEndpoint *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2->_txFirmwareAssets);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)txDynamicAssets
{
  UARPUploaderEndpoint *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2->_txDynamicAssets);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (NSArray)rxDynamicAssets
{
  UARPUploaderEndpoint *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v2->_rxDynamicAssets);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_exit(v2);

  return (NSArray *)v3;
}

- (void)addTxFirmwareAsset:(id)a3
{
  -[NSMutableArray addObject:](self->_txFirmwareAssets, "addObject:", a3);
}

- (void)addTxDynamicAsset:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Add Tx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  -[NSMutableArray addObject:](self->_txDynamicAssets, "addObject:", v4);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UARPUploaderEndpoint addTxDynamicAsset:].cold.1();

}

- (void)addRxDynamicAsset:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Add Rx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  -[NSMutableArray addObject:](self->_rxDynamicAssets, "addObject:", v4);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UARPUploaderEndpoint addRxDynamicAsset:].cold.1();

}

- (void)removeAsset:(id)a3
{
  NSMutableArray *txFirmwareAssets;
  id v5;

  txFirmwareAssets = self->_txFirmwareAssets;
  v5 = a3;
  -[NSMutableArray removeObject:](txFirmwareAssets, "removeObject:", v5);
  -[NSMutableArray removeObject:](self->_txDynamicAssets, "removeObject:", v5);

}

- (id)findMatch:(id)a3
{
  id v4;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  char v23;
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
  _BYTE v37[128];
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v5 = self->_txFirmwareAssets;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v34;
LABEL_3:
    v9 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v8)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v9);
      objc_msgSend(v10, "asset");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v4, "isEqual:", v11);

      if ((v12 & 1) != 0)
        goto LABEL_26;
      if (v7 == ++v9)
      {
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = self->_txDynamicAssets;
  v13 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v30;
LABEL_11:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v30 != v15)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v16);
      objc_msgSend(v10, "asset");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v4, "isEqual:", v17);

      if ((v18 & 1) != 0)
        goto LABEL_26;
      if (v14 == ++v16)
      {
        v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        if (v14)
          goto LABEL_11;
        break;
      }
    }
  }

  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = self->_rxDynamicAssets;
  v19 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v26;
LABEL_19:
    v21 = 0;
    while (1)
    {
      if (*(_QWORD *)v26 != v20)
        objc_enumerationMutation(v5);
      v10 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v21);
      objc_msgSend(v10, "asset", (_QWORD)v25);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v4, "isEqual:", v22);

      if ((v23 & 1) != 0)
        break;
      if (v19 == (id)++v21)
      {
        v19 = (id)-[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
        if (v19)
          goto LABEL_19;
        goto LABEL_27;
      }
    }
LABEL_26:
    v19 = v10;
  }
LABEL_27:

  return v19;
}

- (void)handleLayer2WatchdogTimer:(id)a3
{
  OS_dispatch_source *layer2WatchdogTimer;
  id v5;

  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  self->_layer2WatchdogTimer = 0;
  v5 = a3;

  objc_msgSend(v5, "watchdogExpireLayer2:", self);
}

- (void)cancelLayer2WatchdogTimer
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__UARPUploaderEndpoint_cancelLayer2WatchdogTimer__block_invoke;
  block[3] = &unk_24CEA38E0;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __49__UARPUploaderEndpoint_cancelLayer2WatchdogTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "qcancelLayer2WatchdogTimer");
}

- (void)qcancelLayer2WatchdogTimer
{
  NSObject *layer2WatchdogTimer;
  OS_dispatch_source *v4;

  layer2WatchdogTimer = self->_layer2WatchdogTimer;
  if (layer2WatchdogTimer)
  {
    dispatch_source_cancel(layer2WatchdogTimer);
    v4 = self->_layer2WatchdogTimer;
    self->_layer2WatchdogTimer = 0;

  }
}

- (void)setLayer2WatchdogTimer:(id)a3 timeoutMS:(unint64_t)a4
{
  id v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke;
  block[3] = &unk_24CEA3930;
  v10 = v6;
  v11 = a4;
  block[4] = self;
  v8 = v6;
  dispatch_async(queue, block);

}

void __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke(uint64_t a1)
{
  dispatch_source_t v2;
  uint64_t v3;
  void *v4;
  int64_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  _QWORD handler[4];
  id v9;
  id v10;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "qcancelLayer2WatchdogTimer");
  v2 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, *(dispatch_queue_t *)(*(_QWORD *)(a1 + 32) + 16));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  if ((unint64_t)(1000000 * *(_QWORD *)(a1 + 48)) <= 1)
    v5 = 1;
  else
    v5 = 1000000 * *(_QWORD *)(a1 + 48);
  v6 = dispatch_time(0, v5);
  dispatch_source_set_timer(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 32), v6, 0xFFFFFFFFFFFFFFFFLL, 0xF4240uLL);
  objc_initWeak(&location, *(id *)(a1 + 32));
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke_2;
  handler[3] = &unk_24CEA3908;
  objc_copyWeak(&v10, &location);
  v9 = *(id *)(a1 + 40);
  dispatch_source_set_event_handler(v7, handler);
  dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 32));

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

void __57__UARPUploaderEndpoint_setLayer2WatchdogTimer_timeoutMS___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "handleLayer2WatchdogTimer:", *(_QWORD *)(a1 + 32));

}

- (id)initDownstreamWithDirectEndpoint:(id)a3 layer2Context:(void *)a4 uploader:(id)a5
{
  id v9;
  id v10;
  void *v11;
  UARPUploaderEndpoint *v12;

  v9 = a3;
  v10 = a5;
  objc_msgSend(v9, "accessory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[UARPUploaderEndpoint initWithUARPAccessory:layer2Context:uploader:](self, "initWithUARPAccessory:layer2Context:uploader:", v11, a4, v10);

  if (v12)
  {
    v12->_isDownstreamEndpoint = 1;
    objc_storeStrong((id *)&v12->_directEndpoint, a3);
  }

  return v12;
}

- (BOOL)isDownstreamEndpoint
{
  return self->_isDownstreamEndpoint;
}

- (void)addDownstreamEndpoint:(id)a3
{
  -[NSMutableArray addObject:](self->_downstreamEndpoints, "addObject:", a3);
}

- (void)removeDownstreamEndpoint:(id)a3
{
  -[NSMutableArray removeObject:](self->_downstreamEndpoints, "removeObject:", a3);
}

- (id)downstreamEndpoint:(unint64_t)a3
{
  unsigned __int16 v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_downstreamEndpoints;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "downstreamID", (_QWORD)v12) == v3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasFullPersonality:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  -[UARPUploaderEndpoint serialNumber](self, "serialNumber");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    goto LABEL_10;
  -[UARPUploaderEndpoint appleModelNumber](self, "appleModelNumber");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_10;
  -[UARPUploaderEndpoint hwFusingType](self, "hwFusingType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7
    && (-[UARPUploaderEndpoint firmwareVersion](self, "firmwareVersion"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    if (objc_msgSend(v4, "isTapToRadarMode"))
      objc_msgSend(v4, "solicitDynamicAssetsForTapToRadar:", self);
    if (-[UARPUploaderEndpoint isDownstreamEndpoint](self, "isDownstreamEndpoint"))
      objc_msgSend(v4, "offerFirmwareAssetToDownstreamEndpoint:error:", self, 0);
    v9 = 1;
  }
  else
  {
LABEL_10:
    v9 = 0;
  }

  return v9;
}

- (void)dumpTxUARPMsg:(id)a3
{
  UARPPacketDumper *packetDumper;
  UARPAccessory *accessory;
  id v5;
  id v6;

  packetDumper = self->_packetDumper;
  if (packetDumper)
  {
    accessory = self->_accessory;
    v5 = a3;
    -[UARPAccessory getID](accessory, "getID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UARPPacketDumper dump:accessoryID:uarpStatus:direction:](packetDumper, "dump:accessoryID:uarpStatus:direction:", v5, v6, 0, 0);

  }
}

- (void)dumpRxUARPMsg:(id)a3
{
  UARPPacketDumper *packetDumper;
  UARPAccessory *accessory;
  id v5;
  id v6;

  packetDumper = self->_packetDumper;
  if (packetDumper)
  {
    accessory = self->_accessory;
    v5 = a3;
    -[UARPAccessory getID](accessory, "getID");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[UARPPacketDumper dump:accessoryID:uarpStatus:direction:](packetDumper, "dump:accessoryID:uarpStatus:direction:", v5, v6, 0, 1);

  }
}

- (void)abandonRxDynamicAsset:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Remove Rx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  if ((objc_msgSend(v4, "internalSolicit") & 1) != 0)
  {
    -[NSMutableArray removeObject:](self->_rxDynamicAssets, "removeObject:", v4);
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      -[UARPUploaderEndpoint addRxDynamicAsset:].cold.1();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Do not abandon internally solicited Rx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
    }
    objc_msgSend(v4, "setUarpSuperBinary:", 0);
    objc_msgSend(v4, "setUarpPlatformAsset:", 0);
  }

}

- (void)abandonTxDynamicAsset:(id)a3
{
  id v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Remove Tx Dynamic Asset %@", (uint8_t *)&v5, 0xCu);
  }
  -[NSMutableArray removeObject:](self->_txDynamicAssets, "removeObject:", v4);
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[UARPUploaderEndpoint addTxDynamicAsset:].cold.1();

}

- (void)queueInfoProperty:(unsigned int)a3
{
  void *v4;
  UARPUploaderEndpoint *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](obj->_infoPropertiesToQuery, "addObject:", v4);

  objc_sync_exit(obj);
}

- (void)queueAppleProperty:(unsigned int)a3
{
  void *v4;
  UARPUploaderEndpoint *obj;

  obj = self;
  objc_sync_enter(obj);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](obj->_applePropertiesToQuery, "addObject:", v4);

  objc_sync_exit(obj);
}

- (NSSet)infoPropertiesToQuery
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_infoPropertiesToQuery);
}

- (NSSet)applePropertiesToQuery
{
  return (NSSet *)objc_msgSend(MEMORY[0x24BDBCF20], "setWithSet:", self->_applePropertiesToQuery);
}

- (void)clearQueuedInfoProperties
{
  -[NSMutableSet removeAllObjects](self->_infoPropertiesToQuery, "removeAllObjects");
}

- (void)clearQueuedAppleProperties
{
  -[NSMutableSet removeAllObjects](self->_applePropertiesToQuery, "removeAllObjects");
}

- (id)idealTxFirmwareAsset
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _DWORD v19[4];
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = self->_txFirmwareAssets;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if (v5)
        {
          v20 = 0;
          v21 = 0;
          objc_msgSend(v8, "assetVersion");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v20) = objc_msgSend(v9, "majorVersion");

          objc_msgSend(v8, "assetVersion");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          HIDWORD(v20) = objc_msgSend(v10, "minorVersion");

          objc_msgSend(v8, "assetVersion");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          HIDWORD(v21) = objc_msgSend(v11, "buildVersion");

          objc_msgSend(v8, "assetVersion");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v21) = objc_msgSend(v12, "releaseVersion");

          objc_msgSend(v5, "assetVersion", 0, 0);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v19[0] = objc_msgSend(v13, "majorVersion");

          objc_msgSend(v5, "assetVersion");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v19[1] = objc_msgSend(v14, "minorVersion");

          objc_msgSend(v5, "assetVersion");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v19[3] = objc_msgSend(v15, "buildVersion");

          objc_msgSend(v5, "assetVersion");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v19[2] = objc_msgSend(v16, "releaseVersion");

          if (uarpVersionCompare(v19, &v20) == 1)
          {
            v17 = v8;

            v5 = v17;
          }
        }
        else
        {
          v5 = v8;
        }
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)im4mAssetReceived:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char *v8;
  UARPAssetTag *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  UARPDynamicAssetPersonalization *v16;
  id v17;
  void *v18;
  const char *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  NSObject *log;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v32;
  id v33;
  id v34;

  v4 = a3;
  objc_msgSend(v4, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "id");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tag");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (char *)uarpAssetTagStructPersonalization();
  v9 = -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v8, v8[1], v8[2], v8[3]);
  v10 = objc_msgSend(v7, "isEqual:", v9);
  if (v10)
  {
    objc_msgSend(v4, "asset");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "id");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localURL");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "copy");

    objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://gs.apple.com:443"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[UARPDynamicAssetPersonalization initWithEndpoint:url:tatsuServerURL:]([UARPDynamicAssetPersonalization alloc], "initWithEndpoint:url:tatsuServerURL:", self, v14, v15);
    v34 = 0;
    LODWORD(v13) = -[UARPDynamicAssetPersonalization processDynamicAsset:](v16, "processDynamicAsset:", &v34);
    v17 = v34;
    v18 = v17;
    if ((_DWORD)v13)
    {
      v32 = v14;
      v33 = v17;
      objc_msgSend(v4, "setPendingTssRequest:", v16);
      v19 = (const char *)objc_msgSend(CFSTR("com.apple.uarp.internal.personalization"), "UTF8String");
      -[UARPAccessory modelNumber](self->_accessory, "modelNumber");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v21, "personalizationNotification");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
      {
        objc_msgSend(v21, "personalizationNotification");
        v23 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        v19 = (const char *)objc_msgSend(v23, "UTF8String");

      }
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        -[UARPUploaderEndpoint im4mAssetReceived:].cold.1((uint64_t)v19, log, v25, v26, v27, v28, v29, v30);
      notify_post(v19);

      v14 = v32;
      v18 = v33;
    }

  }
  return v10;
}

- (void)handlePersonalizationRequest
{
  OUTLINED_FUNCTION_0_5(&dword_212D08000, a1, a3, "%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __52__UARPUploaderEndpoint_handlePersonalizationRequest__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  __int128 v13;
  id obj;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://gs.apple.com:443"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  obj = *(id *)(*(_QWORD *)(a1 + 32) + 104);
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v16;
    *(_QWORD *)&v4 = 136315138;
    v13 = v4;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
          v21 = 2112;
          v22 = v8;
          _os_log_impl(&dword_212D08000, v9, OS_LOG_TYPE_INFO, "%s: Check asset for pending tss request, %@", buf, 0x16u);
        }
        objc_msgSend(v8, "pendingTssRequest", v13);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
        v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
        if (v10)
        {
          if (v12)
          {
            *(_DWORD *)buf = v13;
            v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
            _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: Check asset; pending tss request", buf, 0xCu);
          }
          objc_msgSend(*(id *)(a1 + 32), "handlePersonalizationRequest:tatsuSigningServer:", v8, v2);
        }
        else if (v12)
        {
          *(_DWORD *)buf = v13;
          v20 = "-[UARPUploaderEndpoint handlePersonalizationRequest]_block_invoke";
          _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: Check asset; no pending tss request", buf, 0xCu);
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v5);
  }

}

- (void)handlePersonalizationRequest:(id)a3 tatsuSigningServer:(id)a4
{
  id v6;
  id v7;
  NSObject *log;
  void *v9;
  char v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id WeakRetained;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  UARPUploaderEndpoint *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:]";
    v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Handling TSS request for %@", buf, 0x16u);
  }
  objc_msgSend(v6, "pendingTssRequest");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  v10 = objc_msgSend(v9, "tssRequest:error:", v7, &v22);
  v11 = v22;

  if ((v10 & 1) == 0)
  {
    v12 = self->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:].cold.1(v12, v13, v14, v15, v16, v17, v18, v19);
    WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
    objc_msgSend(WeakRetained, "rescindAssets:", self);

  }
  v21 = self->_log;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v24 = "-[UARPUploaderEndpoint handlePersonalizationRequest:tatsuSigningServer:]";
    v25 = 2112;
    v26 = self;
    _os_log_impl(&dword_212D08000, v21, OS_LOG_TYPE_INFO, "%s: Respond with IM4M %@", buf, 0x16u);
  }
  -[UARPUploaderEndpoint respondIM4M:](self, "respondIM4M:", v6);

}

- (BOOL)handlePersonalizationResponse:(id)a3
{
  NSObject *log;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  UARPUploaderEndpoint *v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  UARPUploaderEndpoint *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  BOOL v22;
  NSObject *v23;
  void *v25;
  char v26;
  NSObject *v27;
  id WeakRetained;
  NSObject *v29;
  NSMutableArray *obj;
  UARPUploaderEndpoint *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t v37[128];
  uint8_t buf[4];
  const char *v39;
  __int16 v40;
  UARPUploaderEndpoint *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v32 = (UARPUploaderEndpoint *)a3;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
    v40 = 2112;
    v41 = self;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "%s: Checking pending TSS requests for %@", buf, 0x16u);
  }
  if (v32)
  {
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = self->_rxDynamicAssets;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v34;
      while (2)
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v34 != v7)
            objc_enumerationMutation(obj);
          v9 = *(UARPUploaderEndpoint **)(*((_QWORD *)&v33 + 1) + 8 * i);
          -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          v11 = self->_log;
          v12 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
          if (v10)
          {
            if (v12)
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              v40 = 2112;
              v41 = self;
              _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }
            v13 = self->_log;
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              v40 = 2112;
              v41 = v32;
              _os_log_impl(&dword_212D08000, v13, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);
            }
            v14 = self->_log;
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = v14;
              -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
              v16 = (UARPUploaderEndpoint *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 136315394;
              v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
              v40 = 2112;
              v41 = v16;
              _os_log_impl(&dword_212D08000, v15, OS_LOG_TYPE_INFO, "%s: Pending TSS requests for %@", buf, 0x16u);

            }
            -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "compareTssResponse:", v32);

            if (v18)
            {
              v23 = self->_log;
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                v40 = 2112;
                v41 = self;
                _os_log_impl(&dword_212D08000, v23, OS_LOG_TYPE_INFO, "%s: Matched TSS response for %@", buf, 0x16u);
              }
              -[UARPUploaderEndpoint pendingTssRequest](v9, "pendingTssRequest");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "processTssResponse:", v32);

              if ((v26 & 1) == 0)
              {
                v27 = self->_log;
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                  v40 = 2112;
                  v41 = self;
                  _os_log_impl(&dword_212D08000, v27, OS_LOG_TYPE_INFO, "%s: Failed TSS query for %@", buf, 0x16u);
                }
                WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
                objc_msgSend(WeakRetained, "rescindAssets:", self);

              }
              v29 = self->_log;
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315394;
                v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
                v40 = 2112;
                v41 = self;
                _os_log_impl(&dword_212D08000, v29, OS_LOG_TYPE_INFO, "%s: Respond with IM4M %@", buf, 0x16u);
              }
              -[UARPUploaderEndpoint respondIM4M:](self, "respondIM4M:", v9);

              v22 = 1;
              goto LABEL_37;
            }
          }
          else if (v12)
          {
            *(_DWORD *)buf = 136315394;
            v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
            v40 = 2112;
            v41 = v9;
            _os_log_impl(&dword_212D08000, v11, OS_LOG_TYPE_INFO, "%s: No pending TSS requests for %@", buf, 0x16u);
          }
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
        if (v6)
          continue;
        break;
      }
    }

    v19 = self->_log;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v39 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
      v40 = 2112;
      v41 = self;
      _os_log_impl(&dword_212D08000, v19, OS_LOG_TYPE_INFO, "%s: No pending/matching TSS requests for %@", buf, 0x16u);
    }
  }
  else
  {
    v20 = self->_log;
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[UARPUploaderEndpoint handlePersonalizationResponse:].cold.1((uint64_t)self, v20);
    v21 = objc_loadWeakRetained((id *)&self->_uploader);
    objc_msgSend(v21, "rescindAssets:", self);

  }
  v22 = 0;
LABEL_37:

  return v22;
}

- (void)respondIM4M:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  id v10;
  UARPAssetID *v11;
  void *v12;
  void *v13;
  UARPAssetID *v14;
  UARPAsset *v15;
  id WeakRetained;
  void *v17;
  void *v18;
  NSObject *log;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;

  v4 = a3;
  objc_msgSend(v4, "pendingTssRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tagIM4M");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  uarpDynamicAssetURL(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "pendingTssRequest");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v9 = objc_msgSend(v8, "prepareDynamicAsset:error:", v7, &v27);
  v10 = v27;

  if ((v9 & 1) != 0)
  {
    v11 = [UARPAssetID alloc];
    objc_msgSend(v4, "pendingTssRequest");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tagIM4M");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[UARPAssetID initWithLocationType:assetTag:url:](v11, "initWithLocationType:assetTag:url:", 0, v13, v7);

    v15 = -[UARPAsset initWithID:]([UARPAsset alloc], "initWithID:", v14);
    WeakRetained = objc_loadWeakRetained((id *)&self->_uploader);
    objc_msgSend(v4, "pendingTssRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "tagIM4M");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "offerDynamicAssetToAccessory:asset:internalOffer:tag:", self, v15, 1, v18);

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPUploaderEndpoint respondIM4M:].cold.1(log, v20, v21, v22, v23, v24, v25, v26);
    v14 = (UARPAssetID *)objc_loadWeakRetained((id *)&self->_uploader);
    -[UARPAssetID rescindAssets:](v14, "rescindAssets:", self);
  }

}

- (UARPUploaderUARP)uploader
{
  return (UARPUploaderUARP *)objc_loadWeakRetained((id *)&self->_uploader);
}

- (UARPAccessory)accessory
{
  return (UARPAccessory *)objc_getProperty(self, a2, 192, 1);
}

- (unint64_t)uarpVersion
{
  return self->_uarpVersion;
}

- (void)setUarpVersion:(unint64_t)a3
{
  self->_uarpVersion = a3;
}

- (unsigned)downstreamID
{
  return self->_downstreamID;
}

- (NSString)manufacturerName
{
  return (NSString *)objc_getProperty(self, a2, 208, 1);
}

- (void)setManufacturerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 208);
}

- (NSString)modelName
{
  return (NSString *)objc_getProperty(self, a2, 216, 1);
}

- (void)setModelName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 216);
}

- (NSString)serialNumber
{
  return (NSString *)objc_getProperty(self, a2, 224, 1);
}

- (void)setSerialNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 224);
}

- (NSString)friendlyName
{
  return (NSString *)objc_getProperty(self, a2, 232, 1);
}

- (void)setFriendlyName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 232);
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 240, 1);
}

- (void)setAppleModelNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 240);
}

- (NSString)hwFusingType
{
  return (NSString *)objc_getProperty(self, a2, 248, 1);
}

- (void)setHwFusingType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 248);
}

- (NSString)hardwareVersion
{
  return (NSString *)objc_getProperty(self, a2, 256, 1);
}

- (void)setHardwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 256);
}

- (UARPAssetVersion)firmwareVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 264, 1);
}

- (void)setFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 264);
}

- (UARPAssetVersion)stagedFirmwareVersion
{
  return (UARPAssetVersion *)objc_getProperty(self, a2, 272, 1);
}

- (void)setStagedFirmwareVersion:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 272);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stagedFirmwareVersion, 0);
  objc_storeStrong((id *)&self->_firmwareVersion, 0);
  objc_storeStrong((id *)&self->_hardwareVersion, 0);
  objc_storeStrong((id *)&self->_hwFusingType, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_friendlyName, 0);
  objc_storeStrong((id *)&self->_serialNumber, 0);
  objc_storeStrong((id *)&self->_modelName, 0);
  objc_storeStrong((id *)&self->_manufacturerName, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
  objc_destroyWeak((id *)&self->_uploader);
  objc_storeStrong((id *)&self->_applePropertiesToQuery, 0);
  objc_storeStrong((id *)&self->_infoPropertiesToQuery, 0);
  objc_storeStrong((id *)&self->_packetDumper, 0);
  objc_storeStrong((id *)&self->_directEndpoint, 0);
  objc_storeStrong((id *)&self->_downstreamEndpoints, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_rxDynamicAssets, 0);
  objc_storeStrong((id *)&self->_txDynamicAssets, 0);
  objc_storeStrong((id *)&self->_txFirmwareAssets, 0);
  objc_storeStrong((id *)&self->_layer2WatchdogTimer, 0);
  objc_storeStrong((id *)&self->_personalizationQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_log, 0);
}

- (void)initWithUARPAccessory:(uint64_t)a3 uploader:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_212D08000, a2, a3, "Endpoint Packet Capture at %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)addTxDynamicAsset:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_5(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Tx Dynamic Assets %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)addRxDynamicAsset:.cold.1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_3_2();
  OUTLINED_FUNCTION_0_5(&dword_212D08000, MEMORY[0x24BDACB70], v0, "Rx Dynamic Assets %@", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

- (void)im4mAssetReceived:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_212D08000, a2, a3, "posting bsd notification to personalization helper; %s",
    a5,
    a6,
    a7,
    a8,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)handlePersonalizationRequest:(uint64_t)a3 tatsuSigningServer:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Personalization Tatsu request failed", a5, a6, a7, a8, 0);
}

- (void)handlePersonalizationResponse:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v2 = 136315394;
  v3 = "-[UARPUploaderEndpoint handlePersonalizationResponse:]";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_212D08000, a2, OS_LOG_TYPE_ERROR, "%s: TSS response is nil for %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)respondIM4M:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Failed to prepare IM4M", a5, a6, a7, a8, 0);
}

@end
