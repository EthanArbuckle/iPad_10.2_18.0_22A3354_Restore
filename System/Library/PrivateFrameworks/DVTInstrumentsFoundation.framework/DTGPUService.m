@implementation DTGPUService

+ (id)serviceName
{
  return CFSTR("com.apple.instruments.server.services.gpu");
}

+ (void)registerCapabilities:(id)a3
{
  id v4;
  int v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu"), 1, a1);
  objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu.immediate"), 1, a1);
  objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu.deferred"), 1, a1);
  objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu.counters"), 4, a1);
  v4 = MTLCreateSystemDefaultDevice();
  v5 = objc_msgSend(v4, "supportsFamily:", 1004);

  if (v5)
  {
    objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu.shaderprofiler"), 1, a1);
    objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu.performancestate"), 2, a1);
  }
  objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu.counters.multisources"), 1, a1);
  objc_msgSend(v6, "publishCapability:withVersion:forClass:", CFSTR("com.apple.instruments.server.services.gpu.counters.aps"), 1, a1);

}

- (DTGPUService)initWithChannel:(id)a3
{
  DTGPUService *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *workQueue;
  uint64_t v6;
  NSMutableDictionary *collectingDataSources;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)DTGPUService;
  v3 = -[DTXService initWithChannel:](&v9, sel_initWithChannel_, a3);
  if (v3)
  {
    v4 = dispatch_queue_create("com.apple.dt.instruments.gpu", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    v6 = objc_opt_new();
    collectingDataSources = v3->_collectingDataSources;
    v3->_collectingDataSources = (NSMutableDictionary *)v6;

    v3->_enableShaderProfiler = 0;
  }
  return v3;
}

- (void)messageReceived:(id)a3
{
  if (objc_msgSend(a3, "errorStatus") == 2)
  {
    -[DTGPUService _resetAllDataSources](self, "_resetAllDataSources");
    -[DTGPUService _stopHeartbeatTimer](self, "_stopHeartbeatTimer");
  }
}

- (void)_resetAllDataSources
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *collectingDataSources;
  NSMutableDictionary *v11;
  NSMutableDictionary *dataSourceDict;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = -[DTGPUService stopCollectingCounters](self, "stopCollectingCounters");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMutableDictionary allValues](self->_collectingDataSources, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v8++), "reset");
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v9 = (NSMutableDictionary *)objc_opt_new();
  collectingDataSources = self->_collectingDataSources;
  self->_collectingDataSources = v9;

  v11 = (NSMutableDictionary *)objc_opt_new();
  dataSourceDict = self->_dataSourceDict;
  self->_dataSourceDict = v11;

  self->_enableShaderProfiler = 0;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeObserver:", self);

}

- (void)_setupDataSources
{
  NSMutableDictionary *v3;
  NSMutableDictionary *dataSourceDict;
  NSString *importAPSDataPath;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  DTGPUDataSource *v13;
  NSMutableDictionary *v14;
  void *v15;
  DTGPUDataSource *obja;
  id obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[3];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v3 = (NSMutableDictionary *)objc_opt_new();
  dataSourceDict = self->_dataSourceDict;
  self->_dataSourceDict = v3;

  if (self->_importAPSDataPath)
  {
    obja = -[DTGPUDataSource initWithImportAPSDataPath:workQueue:]([DTGPUDataSource alloc], "initWithImportAPSDataPath:workQueue:", self->_importAPSDataPath, self->_workQueue);
    -[DTGPUDataSource setDelegate:](obja, "setDelegate:", self);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_dataSourceDict, "setObject:forKeyedSubscript:", obja, &unk_24EB4EB10);
    importAPSDataPath = self->_importAPSDataPath;
    self->_importAPSDataPath = 0;

  }
  else
  {
    v6 = MTLCreateSystemDefaultDevice();
    v23[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = -[DTGPUDataSource initWithMTLDevice:workQueue:]([DTGPUDataSource alloc], "initWithMTLDevice:workQueue:", v12, self->_workQueue);
          -[DTGPUDataSource setDelegate:](v13, "setDelegate:", self);
          v14 = self->_dataSourceDict;
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v12, "registryID"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v13, v15);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

  }
}

- (void)_sendMessage:(id)a3
{
  void *v4;
  void *v5;
  DTGPUServiceDelegate **p_delegate;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithObject:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTXService channel](self, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:replyHandler:", v4, 0);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "receiveMessage:", v9);

  }
}

- (void)_sendError:(id)a3
{
  void *v4;
  void *v5;
  DTGPUServiceDelegate **p_delegate;
  id WeakRetained;
  id v8;
  id v9;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BE2A960], "messageWithError:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DTXService channel](self, "channel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sendMessage:replyHandler:", v4, 0);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);

  if (WeakRetained)
  {
    v8 = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(v8, "receiveError:", v9);

  }
}

- (void)_addGPU:(id)a3
{
  id v4;
  DTGPUDataSource *v5;
  NSMutableDictionary *dataSourceDict;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];

  v11[3] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[NSMutableDictionary count](self->_dataSourceDict, "count"))
  {
    v5 = -[DTGPUDataSource initWithMTLDevice:workQueue:]([DTGPUDataSource alloc], "initWithMTLDevice:workQueue:", v4, self->_workQueue);
    -[DTGPUDataSource setDelegate:](v5, "setDelegate:", self);
    dataSourceDict = self->_dataSourceDict;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "registryID"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](dataSourceDict, "setObject:forKeyedSubscript:", v5, v7);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time(), &unk_24EB4EB28);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v8;
    -[DTGPUDataSource deviceInfoDict](v5, "deviceInfoDict");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[DTGPUService _sendMessage:](self, "_sendMessage:", v10);
  }

}

- (void)_removeGPU:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];

  v12[3] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_collectingDataSources, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "stop");
    objc_msgSend(v7, "reset");
    -[NSMutableDictionary removeObjectForKey:](self->_collectingDataSources, "removeObjectForKey:", v5);
  }
  -[NSMutableDictionary objectForKeyedSubscript:](self->_dataSourceDict, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_dataSourceDict, "removeObjectForKey:", v5);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time(), &unk_24EB4EB40);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[1] = v9;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[2] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[DTGPUService _sendMessage:](self, "_sendMessage:", v11);
  }

}

- (id)requestDeviceGPUInfo
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[DTGPUService _setupDataSources](self, "_setupDataSources");
  -[DTGPUService _startHeartbeatTimer](self, "_startHeartbeatTimer");
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "deviceInfoDict");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)dataSourceFromGPUIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (a3 > 5)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
          objc_msgSend(v10, "device");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "registryID");

          if (v12 == a3)
          {
            v13 = v10;
            goto LABEL_15;
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  if (-[NSMutableDictionary count](self->_dataSourceDict, "count") != 1)
    return 0;
  -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", 0);
  v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_15:
  v15 = v13;

  return v15;
}

- (void)configureCounters:(unint64_t)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6 tracingPID:(int)a7
{
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  NSMutableDictionary *collectingDataSources;
  const __CFString *v13;
  DTGPUService *v14;
  uint64_t v15;
  NSMutableDictionary *v16;
  NSMutableDictionary *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  unsigned int v37;
  unint64_t v38;
  unint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v7 = a6;
  v8 = a5;
  v9 = *(_QWORD *)&a4;
  v45 = *MEMORY[0x24BDAC8D0];
  collectingDataSources = self->_collectingDataSources;
  if (collectingDataSources)
  {
    if (-[NSMutableDictionary count](collectingDataSources, "count", a3, *(_QWORD *)&a4, a5, a6, *(_QWORD *)&a7))
    {
      v13 = CFSTR("Already collecting counters");
      v14 = self;
      v15 = 4;
LABEL_20:
      -[DTGPUService _sendErrorMessage:code:](v14, "_sendErrorMessage:code:", v13, v15);
      return;
    }
  }
  else
  {
    v16 = (NSMutableDictionary *)objc_opt_new();
    v17 = self->_collectingDataSources;
    self->_collectingDataSources = v16;

  }
  if (a3 > 4)
  {
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v22)
    {
      v23 = v22;
      v37 = v9;
      v38 = v8;
      v39 = v7;
      v24 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v41 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v26, "device");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "registryID");

          if (v28 == a3)
          {
            objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v26);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            goto LABEL_18;
          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v23)
          continue;
        break;
      }
      v20 = 0;
LABEL_18:
      v8 = v38;
      v7 = v39;
      v9 = v37;
    }
    else
    {
      v20 = 0;
    }

    if (!objc_msgSend(v20, "count") && -[NSMutableDictionary count](self->_dataSourceDict, "count") == 1)
    {
      v29 = (void *)MEMORY[0x24BDBCF20];
      -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "objectAtIndexedSubscript:", 0);
      v31 = v9;
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setWithObject:", v32);
      v33 = objc_claimAutoreleasedReturnValue();

      v9 = v31;
      v20 = (void *)v33;
    }
  }
  else
  {
    -[DTGPUService dataSourceFromGPUIndex:](self, "dataSourceFromGPUIndex:", a3);
    v18 = objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v13 = CFSTR("Failed to find target GPU for counter collection");
      v14 = self;
      v15 = 0;
      goto LABEL_20;
    }
    v19 = (void *)v18;
    objc_msgSend(MEMORY[0x24BDBCF20], "setWithObject:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (self->_importAPSDataPath)
  {
    v34 = (void *)MEMORY[0x24BDBCF20];
    -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWithArray:", v35);
    v36 = objc_claimAutoreleasedReturnValue();

    v20 = (void *)v36;
  }
  -[DTGPUService _configureDataSourcesAndSendMessage:counterProfile:interval:windowLimit:](self, "_configureDataSourcesAndSendMessage:counterProfile:interval:windowLimit:", v20, v9, v8, v7);

}

- (void)startCollectingCounters
{
  DTGPUService *v2;
  NSMutableDictionary *collectingDataSources;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t j;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  uint64_t v48;
  id obj;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  DTGPUService *v54;
  uint64_t v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[6];
  _QWORD v65[7];
  _QWORD v66[5];
  _BYTE v67[128];
  _BYTE v68[128];
  uint64_t v69;

  v2 = self;
  v69 = *MEMORY[0x24BDAC8D0];
  collectingDataSources = self->_collectingDataSources;
  if (collectingDataSources && -[NSMutableDictionary count](collectingDataSources, "count"))
  {
    v62 = 0u;
    v63 = 0u;
    v60 = 0u;
    v61 = 0u;
    -[NSMutableDictionary allValues](v2->_collectingDataSources, "allValues");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
    if (v5)
    {
      v6 = v5;
      LOBYTE(v7) = 0;
      v8 = *(_QWORD *)v61;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v61 != v8)
            objc_enumerationMutation(v4);
          v10 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * i);
          objc_msgSend(v10, "enableShaderProfiler:", v2->_enableShaderProfiler);
          if ((v7 & 1) != 0)
            v7 = 1;
          else
            v7 = objc_msgSend(v10, "run") ^ 1;
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v60, v68, 16);
      }
      while (v6);

      if (v7)
      {
        -[DTGPUService _sendErrorMessage:code:](v2, "_sendErrorMessage:code:", CFSTR("Failed to start counter collection"), 5);
        return;
      }
    }
    else
    {

    }
    v58 = 0u;
    v59 = 0u;
    v56 = 0u;
    v57 = 0u;
    -[NSMutableDictionary allValues](v2->_collectingDataSources, "allValues");
    obj = (id)objc_claimAutoreleasedReturnValue();
    v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
    if (v55)
    {
      v11 = *(_QWORD *)v57;
      v54 = v2;
      v48 = *(_QWORD *)v57;
      do
      {
        for (j = 0; j != v55; ++j)
        {
          if (*(_QWORD *)v57 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
          objc_msgSend(v13, "collectingProfile");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = objc_msgSend(v14, "isAPS");

          if (v15)
          {
            v66[0] = &unk_24EB4EB58;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v66[1] = v16;
            v17 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v13, "device");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v18, "registryID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v66[2] = v19;
            v20 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v13, "collectingProfile");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v21, "profile"));
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v66[3] = v22;
            objc_msgSend(v13, "collectingProfile");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "counterProfileForHost");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v66[4] = v24;
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v66, 5);
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            v2 = v54;
            -[DTGPUService _sendMessage:](v54, "_sendMessage:", v25);
          }
          else
          {
            if (v2->_enableMultiSourceCounters)
            {
              v65[0] = &unk_24EB4EB70;
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
              v52 = (void *)objc_claimAutoreleasedReturnValue();
              v65[1] = v52;
              v26 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v13, "device");
              v51 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v26, "numberWithUnsignedLongLong:", objc_msgSend(v51, "registryID"));
              v50 = (void *)objc_claimAutoreleasedReturnValue();
              v65[2] = v50;
              v27 = (void *)MEMORY[0x24BDD16E0];
              objc_msgSend(v13, "collectingProfile");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "numberWithUnsignedInteger:", objc_msgSend(v28, "profile"));
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v65[3] = v29;
              objc_msgSend(v13, "collectingProfile");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "counterProfileForHost");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v65[4] = v31;
              objc_msgSend(v13, "collectingProfile");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "sampleSizes");
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              v65[5] = v33;
              objc_msgSend(v13, "collectingProfile");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "ringBufferCounts");
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v65[6] = v35;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v65, 7);
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              v2 = v54;
              -[DTGPUService _sendMessage:](v54, "_sendMessage:", v25);
            }
            else
            {
              objc_msgSend(v13, "collectingProfile");
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v36, "counterProfileForHost");
              v25 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v13, "collectingProfile");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v37, "ringBufferCounts");
              v38 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v25, "count"))
              {
                if (objc_msgSend(v38, "count"))
                {
                  v64[0] = &unk_24EB4EB88;
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
                  v53 = (void *)objc_claimAutoreleasedReturnValue();
                  v64[1] = v53;
                  v39 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v13, "device");
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v39, "numberWithUnsignedLongLong:", objc_msgSend(v40, "registryID"));
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v64[2] = v41;
                  v42 = (void *)MEMORY[0x24BDD16E0];
                  objc_msgSend(v13, "collectingProfile");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "numberWithUnsignedInteger:", objc_msgSend(v43, "profile"));
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v64[3] = v44;
                  objc_msgSend(v25, "objectAtIndexedSubscript:", 0);
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  v64[4] = v45;
                  objc_msgSend(v38, "objectAtIndexedSubscript:", 0);
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  v64[5] = v46;
                  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v64, 6);
                  v47 = (void *)objc_claimAutoreleasedReturnValue();

                  v2 = v54;
                  -[DTGPUService _sendMessage:](v54, "_sendMessage:", v47);

                }
              }

            }
            v11 = v48;
          }

        }
        v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v67, 16);
      }
      while (v55);
    }

  }
  else
  {
    -[DTGPUService _sendErrorMessage:code:](v2, "_sendErrorMessage:code:", CFSTR("No configured data sources"), 2);
  }
}

- (void)enableShaderProfiler
{
  self->_enableShaderProfiler = 1;
}

- (id)stopCollectingCounters
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t j;
  unint64_t v14;
  unint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[NSMutableDictionary allValues](self->_collectingDataSources, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "stop");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v5);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[NSMutableDictionary allValues](self->_collectingDataSources, "allValues", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    v12 = -1;
    do
    {
      for (j = 0; j != v10; ++j)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v14 = objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * j), "timestampOfFirstSample");
        if (v12 >= v14)
          v15 = v14;
        else
          v15 = v12;
        if (v14)
          v12 = v15;
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v10);
  }
  else
  {
    v12 = -1;
  }

  self->_enableShaderProfiler = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v12);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_constructMessagePayload:(const unint64_t *)a3 sampleCount:(unint64_t)a4 length:(unint64_t)a5 dataSource:(id)a6 sampleType:(unint64_t)a7 ringBufferIndex:(unsigned int)a8 sourceIndex:(unsigned int)a9
{
  uint64_t v9;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  _QWORD *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v29;
  void *v30;
  _QWORD v31[8];
  _QWORD v32[8];
  _QWORD v33[9];

  v9 = *(_QWORD *)&a8;
  v33[7] = *MEMORY[0x24BDAC8D0];
  v14 = a6;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithBytes:length:", a3, a5);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (a7 == 1)
  {
    v32[0] = &unk_24EB4EBB8;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v32[1] = v16;
    v26 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v14, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "numberWithUnsignedLongLong:", objc_msgSend(v18, "registryID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v32[2] = v19;
    v32[3] = &unk_24EB4EB10;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[4] = v20;
    v32[5] = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v32[6] = v21;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v32[7] = v22;
    v23 = (void *)MEMORY[0x24BDBCE30];
    v24 = v32;
    v25 = 8;
    goto LABEL_5;
  }
  if (!a7)
  {
    v33[0] = &unk_24EB4EBA0;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v16;
    v17 = (void *)MEMORY[0x24BDD16E0];
    objc_msgSend(v14, "device");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v18, "registryID"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v19;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[3] = v20;
    v33[4] = v15;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v33[5] = v21;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v33[6] = v22;
    v23 = (void *)MEMORY[0x24BDBCE30];
    v24 = v33;
    v25 = 7;
LABEL_5:
    objc_msgSend(v23, "arrayWithObjects:count:", v24, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  if ((a7 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    v27 = 0;
    goto LABEL_7;
  }
  v31[0] = &unk_24EB4EBD0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v16;
  v29 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v14, "device");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "numberWithUnsignedLongLong:", objc_msgSend(v18, "registryID"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v19;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v20;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v21;
  v31[5] = v15;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v31[6] = v22;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", a9);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31[7] = v30;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_7:

  return v27;
}

- (id)flushRemainingData
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  NSMutableDictionary *v11;
  NSMutableDictionary *collectingDataSources;
  _QWORD v14[6];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  -[NSMutableDictionary allValues](self->_collectingDataSources, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        v14[0] = v8;
        v14[1] = 3221225472;
        v14[2] = sub_222B8772C;
        v14[3] = &unk_24EB2A9D8;
        v14[4] = self;
        v14[5] = v10;
        v15 = v3;
        objc_msgSend(v10, "getRemainingData:", v14);
        objc_msgSend(v10, "reset");

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  v11 = (NSMutableDictionary *)objc_opt_new();
  collectingDataSources = self->_collectingDataSources;
  self->_collectingDataSources = v11;

  return v3;
}

- (void)readyToSendData:(const unint64_t *)a3 sampleCount:(unint64_t)a4 length:(unint64_t)a5 dataSource:(id)a6 sampleType:(unint64_t)a7 ringBufferIndex:(unsigned int)a8 sourceIndex:(unsigned int)a9
{
  void *v10;
  uint64_t v11;
  void *v12;

  LODWORD(v11) = a9;
  -[DTGPUService _constructMessagePayload:sampleCount:length:dataSource:sampleType:ringBufferIndex:sourceIndex:](self, "_constructMessagePayload:sampleCount:length:dataSource:sampleType:ringBufferIndex:sourceIndex:", a3, a4, a5, a6, a7, *(_QWORD *)&a8, v11);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v12 = v10;
    -[DTGPUService _sendMessage:](self, "_sendMessage:", v10);
    v10 = v12;
  }

}

- (id)_findDataSourcesForTargetProcess:(int)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFAllocator *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  io_object_t v12;
  io_registry_entry_t v13;
  io_object_t v14;
  void *CFProperty;
  uint64_t v17;
  uint64_t v18;
  id obj;
  id v20;
  io_iterator_t iterator;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("pid %d"), *(_QWORD *)&a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (id)objc_opt_new();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
    v17 = *(_QWORD *)v23;
    do
    {
      v9 = 0;
      v18 = v6;
      do
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v9);
        iterator = 0;
        objc_msgSend(v10, "device");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (!MEMORY[0x227678CA8](objc_msgSend(v11, "acceleratorPort"), "IOService", &iterator))
        {
          v12 = IOIteratorNext(iterator);
          if (v12)
          {
            v13 = v12;
            do
            {
              v14 = IOIteratorNext(iterator);
              CFProperty = (void *)IORegistryEntryCreateCFProperty(v13, CFSTR("IOUserClientCreator"), v8, 0);
              IOObjectRelease(v13);
              if (objc_msgSend(CFProperty, "rangeOfString:", v4) != 0x7FFFFFFFFFFFFFFFLL)
              {
                IOObjectRelease(iterator);
                objc_msgSend(v20, "addObject:", v10);
              }

              v13 = v14;
            }
            while (v14);
          }
          IOObjectRelease(iterator);
          v7 = v17;
          v6 = v18;
        }

        ++v9;
      }
      while (v9 != v6);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v6);
  }

  return v20;
}

- (void)_configureDataSourcesAndSendMessage:(id)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6
{
  uint64_t v6;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  NSMutableDictionary *collectingDataSources;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *heartbeatTimer;
  OS_dispatch_source *v23;
  id obj;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[2];
  _BYTE v32[128];
  uint64_t v33;

  v6 = *(_QWORD *)&a4;
  v33 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = v8;
  if (v8)
  {
    v29 = 0u;
    v30 = 0u;
    v27 = 0u;
    v28 = 0u;
    v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    obj = v9;
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v28 != v12)
            objc_enumerationMutation(obj);
          v14 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
          objc_msgSend(v14, "configure:interval:windowLimit:", v6, a5, a6);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v15)
          {
            collectingDataSources = self->_collectingDataSources;
            v17 = (void *)MEMORY[0x24BDD16E0];
            objc_msgSend(v14, "device");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "numberWithUnsignedLongLong:", objc_msgSend(v18, "registryID"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[NSMutableDictionary setObject:forKeyedSubscript:](collectingDataSources, "setObject:forKeyedSubscript:", v14, v19);

          }
        }
        v9 = obj;
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
      }
      while (v11);
    }
    if (-[NSMutableDictionary count](self->_collectingDataSources, "count"))
    {
      v31[0] = &unk_24EB4EBE8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", mach_absolute_time());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v20;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[DTGPUService _sendMessage:](self, "_sendMessage:", v21);
      v9 = obj;
    }
    else
    {
      -[DTGPUService _sendErrorMessage:code:](self, "_sendErrorMessage:code:", CFSTR("Selected counter profile is not supported on target device"), 1);
      heartbeatTimer = self->_heartbeatTimer;
      if (heartbeatTimer)
      {
        dispatch_source_cancel(heartbeatTimer);
        v23 = self->_heartbeatTimer;
        self->_heartbeatTimer = 0;

      }
    }
  }
  else
  {
    -[DTGPUService _sendErrorMessage:code:](self, "_sendErrorMessage:code:", CFSTR("Invalid device ID"), 0);
    if (self->_heartbeatTimer)
      -[DTGPUService _stopHeartbeatTimer](self, "_stopHeartbeatTimer");
  }

}

- (void)_waitForProcessMetalDevice:(int)a3 counterProfile:(unsigned int)a4 interval:(unint64_t)a5 windowLimit:(unint64_t)a6
{
  NSObject *workQueue;
  _QWORD block[4];
  id v13[3];
  int v14;
  unsigned int v15;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B87D20;
  block[3] = &unk_24EB2AA00;
  objc_copyWeak(v13, &location);
  v14 = a3;
  v15 = a4;
  v13[1] = (id)a5;
  v13[2] = (id)a6;
  dispatch_async(workQueue, block);
  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_startHeartbeatTimer
{
  NSObject *workQueue;
  _QWORD block[5];
  id v5;
  id location;

  objc_initWeak(&location, self);
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B87F88;
  block[3] = &unk_24EB2AA28;
  objc_copyWeak(&v5, &location);
  block[4] = self;
  dispatch_sync(workQueue, block);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopHeartbeatTimer
{
  NSObject *workQueue;
  _QWORD block[5];

  workQueue = self->_workQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_222B881D0;
  block[3] = &unk_24EB27E30;
  block[4] = self;
  dispatch_sync(workQueue, block);
}

- (void)_sendErrorMessage:(id)a3 code:(unint64_t)a4
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v6 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = a3;
  v7 = (void *)MEMORY[0x24BDBCE70];
  v8 = a3;
  objc_msgSend(v7, "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("com.apple.DTGPUService"), a4, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[DTGPUService _sendError:](self, "_sendError:", v10);
}

- (id)currentConsistentGPUPerformanceState
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[NSMutableDictionary allValues](self->_dataSourceDict, "allValues", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "currentConsistentGPUPerformanceState");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)enableConsistentGPUPerformanceState:(unint64_t)a3 acceleratorID:(unint64_t)a4
{
  unint64_t v4;
  void *v5;
  id v7;

  if (a3)
  {
    v4 = a3;
    self->_targetPerfState = a3;
    self->_enableConsistentPerfState = 1;
    -[DTGPUService dataSourceFromGPUIndex:](self, "dataSourceFromGPUIndex:", a4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v4) = objc_msgSend(v5, "enableConsistentGPUPerformanceState:", v4);

    return v4;
  }
  else
  {
    v7 = -[DTGPUService disableConsistentGPUPerformanceState:](self, "disableConsistentGPUPerformanceState:", a4);
    return 1;
  }
}

- (id)disableConsistentGPUPerformanceState:(unint64_t)a3
{
  void *v3;
  void *v4;

  self->_enableConsistentPerfState = 0;
  -[DTGPUService dataSourceFromGPUIndex:](self, "dataSourceFromGPUIndex:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "disableConsistentGPUPerformanceState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)enableMultiSourceCounters
{
  self->_enableMultiSourceCounters = 1;
}

- (void)importAPSData:(id)a3
{
  objc_storeStrong((id *)&self->_importAPSDataPath, a3);
}

- (void)configureAPS:(id)a3
{
  objc_storeStrong((id *)&self->_apsConfiguration, a3);
}

- (void)setAPSCounterConfig:(id)a3
{
  id v4;
  NSMutableDictionary *dataSourceDict;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  dataSourceDict = self->_dataSourceDict;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = sub_222B885A4;
  v7[3] = &unk_24EB2AA50;
  v8 = v4;
  v6 = v4;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](dataSourceDict, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (DTGPUServiceDelegate)delegate
{
  return (DTGPUServiceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_apsConfiguration, 0);
  objc_storeStrong((id *)&self->_importAPSDataPath, 0);
  objc_storeStrong((id *)&self->_dataSourceDict, 0);
  objc_storeStrong((id *)&self->_collectingDataSources, 0);
  objc_storeStrong((id *)&self->_deviceObserver, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_waitingForDeviceTimer, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
