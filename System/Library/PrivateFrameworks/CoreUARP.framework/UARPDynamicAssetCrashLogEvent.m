@implementation UARPDynamicAssetCrashLogEvent

- (UARPDynamicAssetCrashLogEvent)init
{
  -[UARPDynamicAssetCrashLogEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetCrashLogEvent)initWithURL:(id)a3
{
  id v5;
  UARPDynamicAssetCrashLogEvent *v6;
  UARPDynamicAssetCrashLogEvent *v7;
  os_log_t v8;
  OS_os_log *log;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPDynamicAssetCrashLogEvent;
  v6 = -[UARPDynamicAssetCrashLogEvent init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = os_log_create("com.apple.accessoryupdater.uarp", "crsh");
    log = v7->_log;
    v7->_log = (OS_os_log *)v8;

  }
  return v7;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  v4 = v3;
  v5 = 72;
  if (!self->_cmapDatabase)
    v5 = 32;
  objc_msgSend(v3, "appendFormat:", CFSTR("Crash Analytics Event %@\n"), *(Class *)((char *)&self->super.isa + v5));
  return v4;
}

- (void)sendSpeedTracer
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Could not submit processed crash log to analytics, error %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t __48__UARPDynamicAssetCrashLogEvent_sendSpeedTracer__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "writeData:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (BOOL)expandToDirectory:(id)a3 forRemoteEndpoint:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *log;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "appleModelNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "serialNumber");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  UARPStringCrashAnalyticsDirectoryFilePath();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UARPUniqueFilename(v8, v9, v10, CFSTR("CRSH"), CFSTR(".json"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCF48]), "initWithString:", v11);
  v13 = UARPWriteFile(self->_processedCrashInstanceData, v12);
  if (v13)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
    {
      v15 = log;
      objc_msgSend(v12, "path");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 136315394;
      v21 = "-[UARPDynamicAssetCrashLogEvent expandToDirectory:forRemoteEndpoint:]";
      v22 = 2112;
      v23 = v16;
      _os_log_impl(&dword_212D08000, v15, OS_LOG_TYPE_INFO, "%s: Successfully Expanded CRSH to File: %@", (uint8_t *)&v20, 0x16u);

    }
    if (v6)
    {
      UARPStringCrashAnalyticsDirectoryFilePath();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "path");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      UARPCopyFile((uint64_t)v17, v18, v11);

    }
  }

  return v13;
}

- (BOOL)decomposeUARP
{
  UARPSuperBinaryAsset *v3;
  UARPSuperBinaryAsset *asset;
  NSMutableArray *v5;
  NSMutableArray *preProcessedCrashLogs;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void (*v18)(void *);
  void *v19;
  NSMutableArray *v20;
  void *v21;
  NSObject *log;
  BOOL v23;
  id obj;
  uint64_t v26;
  uint8_t buf;
  _BYTE v28[15];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[5];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  void *v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0)
    || !-[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo](self, "processCrashAdditionalInfo"))
  {
    return 0;
  }
  v5 = (NSMutableArray *)objc_opt_new();
  preProcessedCrashLogs = self->_preProcessedCrashLogs;
  self->_preProcessedCrashLogs = v5;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
  if (v7)
  {
    v26 = *(_QWORD *)v30;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v26)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        +[UARPDynamicAssetCrashLogEvent tag](UARPDynamicAssetCrashLogEvent, "tag");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "payloadTag");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v10);

        if (v12)
        {
          objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_alloc_init(MEMORY[0x24BDD16A8]);
          if (-[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:](self, "getCoreName:inPayload:", v14, v9))
          {
            v15 = (void *)objc_msgSend(v14, "copy");
            objc_msgSend(v13, "setObject:forKeyedSubscript:", v15, CFSTR("core"));

            objc_msgSend(v9, "rangePayload");
            -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v9, 0, v16, 0);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (!v17)
            {
              if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
                -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.1();

              v23 = 0;
              goto LABEL_27;
            }
            v34 = 0;
            v35 = &v34;
            v36 = 0x2020000000;
            v18 = (void (*)(void *))getRTBuddyCrashlogDecodeSymbolLoc_ptr;
            v37 = getRTBuddyCrashlogDecodeSymbolLoc_ptr;
            if (!getRTBuddyCrashlogDecodeSymbolLoc_ptr)
            {
              v33[0] = MEMORY[0x24BDAC760];
              v33[1] = 3221225472;
              v33[2] = __getRTBuddyCrashlogDecodeSymbolLoc_block_invoke;
              v33[3] = &unk_24CEA38A0;
              v33[4] = &v34;
              __getRTBuddyCrashlogDecodeSymbolLoc_block_invoke((uint64_t)v33);
              v18 = (void (*)(void *))v35[3];
            }
            _Block_object_dispose(&v34, 8);
            if (!v18)
            {
              -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.2();
              __break(1u);
            }
            v18(v17);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
            {
              objc_msgSend(v13, "setObject:forKeyedSubscript:", v19, CFSTR("crashlog"));
              v20 = self->_preProcessedCrashLogs;
              v21 = (void *)objc_msgSend(v13, "copy");
              -[NSMutableArray addObject:](v20, "addObject:", v21);

            }
            else
            {
              log = self->_log;
              if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.3(&buf, v28, log);
            }

          }
        }

      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v7)
        continue;
      break;
    }
  }
  v23 = 1;
LABEL_27:

  return v23;
}

- (BOOL)processCrashInstance
{
  NSMutableDictionary *v3;
  NSMutableDictionary *processedCrashInstance;
  void *v5;
  uint64_t v6;
  _BOOL8 testMode;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSMutableDictionary *v17;
  NSData *v18;
  id v19;
  NSData *processedCrashInstanceData;
  BOOL v21;
  BOOL v22;
  NSObject *log;
  NSMutableDictionary *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v35;
  void *v36;
  void *v37;
  NSMutableDictionary *v38;
  void *v39;
  void *v40;
  id v41;
  uint8_t buf[4];
  NSMutableDictionary *v43;
  _QWORD v44[17];
  _QWORD v45[17];
  _QWORD v46[2];
  _QWORD v47[4];

  v47[2] = *MEMORY[0x24BDAC8D0];
  if (!-[UARPDynamicAssetCrashLogEvent findMatchingCMAP](self, "findMatchingCMAP"))
    return 0;
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  processedCrashInstance = self->_processedCrashInstance;
  self->_processedCrashInstance = v3;

  v46[0] = CFSTR("role");
  v46[1] = CFSTR("side");
  v47[0] = CFSTR("case");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v5;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 2);
  v6 = objc_claimAutoreleasedReturnValue();

  testMode = self->_testMode;
  v38 = self->_processedCrashInstance;
  v44[0] = CFSTR("bug_type");
  v44[1] = CFSTR("UI_country_code");
  v45[0] = CFSTR("305");
  v45[1] = CFSTR("US");
  v44[2] = CFSTR("log_version");
  v44[3] = CFSTR("accessory_type");
  v45[2] = CFSTR("1.0");
  v45[3] = CFSTR("audio");
  v35 = (void *)v6;
  v45[4] = v6;
  v44[4] = CFSTR("application-info");
  v44[5] = CFSTR("accessory_pid");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", self->_productId);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v45[5] = v40;
  v44[6] = CFSTR("analytics_test_mode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", testMode);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v45[6] = v39;
  v44[7] = CFSTR("crashlogs");
  v37 = (void *)objc_opt_new();
  v45[7] = v37;
  v44[8] = CFSTR("accessory_crashreporter_key");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v45[8] = v36;
  v44[9] = CFSTR("accessory_os_version");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v45[9] = v8;
  v44[10] = CFSTR("accessory_os_train");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v45[10] = v9;
  v44[11] = CFSTR("accessory_machine_config");
  v10 = (void *)-[NSString copy](self->_appleModelNumber, "copy");
  v45[11] = v10;
  v44[12] = CFSTR("accessory_release_type");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v45[12] = v11;
  v44[13] = CFSTR("usage_since_last_crash");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[13] = v12;
  v44[14] = CFSTR("usage_since_last_crash_user_facing");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v45[14] = v13;
  v44[15] = CFSTR("usage_since_last_crash_in_ear");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v45[15] = v14;
  v44[16] = CFSTR("accessory_fusing");
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v45[16] = v15;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setDictionary:](v38, "setDictionary:", v16);

  if (-[UARPDynamicAssetCrashLogEvent expandCRSHPayloads](self, "expandCRSHPayloads"))
  {
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_processedCrashInstance, "setObject:forKeyedSubscript:", self->_processedCrashLogs, CFSTR("crashlogs"));
    v17 = self->_processedCrashInstance;
    v41 = 0;
    objc_msgSend(MEMORY[0x24BDD1608], "dataWithJSONObject:options:error:", v17, 1, &v41);
    v18 = (NSData *)objc_claimAutoreleasedReturnValue();
    v19 = v41;
    processedCrashInstanceData = self->_processedCrashInstanceData;
    self->_processedCrashInstanceData = v18;

    if (self->_processedCrashInstanceData)
      v21 = v19 == 0;
    else
      v21 = 0;
    v22 = v21;
    log = self->_log;
    if (v21)
    {
      if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
      {
        v24 = self->_processedCrashInstance;
        *(_DWORD *)buf = 138412290;
        v43 = v24;
        _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "Successfully expanded CRSH Dynamic Asset: %@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetCrashLogEvent processCrashInstance].cold.1();
    }

  }
  else
  {
    v25 = self->_log;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCrashLogEvent processCrashInstance].cold.2(v25, v26, v27, v28, v29, v30, v31, v32);
    v22 = 0;
  }

  return v22;
}

- (BOOL)expandCRSHPayloads
{
  UARPDynamicAssetCmapDatabase *v3;
  UARPDynamicAssetCmapDatabase *cmapDatabase;
  NSMutableArray *v5;
  NSMutableArray *processedCrashLogs;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  UARPDynamicAssetCmapDatabase *v13;
  void *v14;
  void *v15;
  BOOL v16;
  NSObject *log;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSMutableArray *obj;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = -[UARPDynamicAssetCmapDatabase initCmapDatabase:]([UARPDynamicAssetCmapDatabase alloc], "initCmapDatabase:", 0);
  cmapDatabase = self->_cmapDatabase;
  self->_cmapDatabase = v3;

  if (self->_cmapDatabase)
  {
    v5 = (NSMutableArray *)objc_opt_new();
    processedCrashLogs = self->_processedCrashLogs;
    self->_processedCrashLogs = v5;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    obj = self->_preProcessedCrashLogs;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v27 = *(_QWORD *)v29;
      while (2)
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v29 != v27)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("core"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = (void *)objc_opt_new();
          v13 = self->_cmapDatabase;
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("crashlog"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UARPDynamicAssetCmapDatabase expandCrshData:withAppleModelNumber:](v13, "expandCrshData:withAppleModelNumber:", v14, self->_appleModelNumber);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v15)
          {
            if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
              -[UARPDynamicAssetCrashLogEvent expandCRSHPayloads].cold.2();

            v16 = 0;
            goto LABEL_14;
          }
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v15, CFSTR("crashlog"));
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, CFSTR("core"));
          -[NSMutableArray addObject:](self->_processedCrashLogs, "addObject:", v12);

        }
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
        if (v8)
          continue;
        break;
      }
    }
    v16 = 1;
LABEL_14:

  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCrashLogEvent expandCRSHPayloads].cold.1(log, v18, v19, v20, v21, v22, v23, v24);
    return 0;
  }
  return v16;
}

- (BOOL)getCoreName:(id)a3 inPayload:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  v5 = a3;
  objc_msgSend(a4, "tlvs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 4042160640, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "valueAsString");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8 != 0;
    if (v8)
    {
      objc_msgSend(v5, "setString:", v8);
    }
    else
    {
      v18 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v18)
        -[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
    }

  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[UARPDynamicAssetCrashLogEvent getCoreName:inPayload:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
  }

  return v9;
}

- (BOOL)processCrashAdditionalInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSString *v7;
  NSString *appleModelNumber;
  void *v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  _BOOL8 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  _BOOL8 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _BOOL8 v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;

  -[UARPSuperBinaryAsset tlvs](self->_asset, "tlvs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 4042160641, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "valueAsString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = (NSString *)objc_msgSend(v5, "copy");
      appleModelNumber = self->_appleModelNumber;
      self->_appleModelNumber = v7;

      +[UARPSupportedAccessory findByAppleModelNumber:](UARPSupportedAccessory, "findByAppleModelNumber:", self->_appleModelNumber);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v9, "hardwareID");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        self->_productId = objc_msgSend(v10, "productID");

      }
      else
      {
        self->_productId = 0;
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.5((uint64_t)&self->_appleModelNumber, v28, v29, v30, v31, v32, v33, v34);
      }
      -[UARPSuperBinaryAsset tlvs](self->_asset, "tlvs");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 4042160643, v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();

      if (v36)
      {
        objc_msgSend(v36, "valueAsNumber");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v37;
        v19 = v37 != 0;
        if (v37)
        {
          if (objc_msgSend(v37, "unsignedIntValue"))
            self->_testMode = 1;
          else
            self->_testMode = 0;
        }
        else
        {
          v47 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v47)
            -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.4(v47, v48, v49, v50, v51, v52, v53, v54);
        }

      }
      else
      {
        v39 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
        if (v39)
          -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.3(v39, v40, v41, v42, v43, v44, v45, v46);
        v19 = 0;
      }

    }
    else
    {
      v20 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v20)
        -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.2(v20, v21, v22, v23, v24, v25, v26, v27);
      v19 = 0;
    }

  }
  else
  {
    v11 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v11)
      -[UARPDynamicAssetCrashLogEvent processCrashAdditionalInfo].cold.1(v11, v12, v13, v14, v15, v16, v17, v18);
    v19 = 0;
  }

  return v19;
}

- (BOOL)findMatchingCMAP
{
  UARPDynamicAssetCmapDatabase *v3;
  UARPDynamicAssetCmapDatabase *cmapDatabase;
  UARPDynamicAssetCmapDatabase *v5;
  NSString **p_appleModelNumber;
  void *v7;
  BOOL v8;
  NSObject *log;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v3 = -[UARPDynamicAssetCmapDatabase initCmapDatabase:]([UARPDynamicAssetCmapDatabase alloc], "initCmapDatabase:", 0);
  cmapDatabase = self->_cmapDatabase;
  self->_cmapDatabase = v3;

  v5 = self->_cmapDatabase;
  if (v5)
  {
    p_appleModelNumber = &self->_appleModelNumber;
    -[UARPDynamicAssetCmapDatabase findCmapforAppleModel:](v5, "findCmapforAppleModel:", self->_appleModelNumber);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7 != 0;
    if (!v7)
    {
      log = self->_log;
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
        -[UARPDynamicAssetCrashLogEvent findMatchingCMAP].cold.2((uint64_t)p_appleModelNumber, log, v10, v11, v12, v13, v14, v15);
    }

  }
  else
  {
    v16 = self->_log;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetCrashLogEvent expandCRSHPayloads].cold.1(v16, v17, v18, v19, v20, v21, v22, v23);
    return 0;
  }
  return v8;
}

+ (id)tag
{
  char *v2;

  v2 = (char *)uarpAssetTagStructCrashAnalytics();
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v2, v2[1], v2[2], v2[3]);
}

- (NSString)appleModelNumber
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAppleModelNumber:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmapDatabase, 0);
  objc_storeStrong((id *)&self->_processedCrashInstance, 0);
  objc_storeStrong((id *)&self->_processedCrashInstanceData, 0);
  objc_storeStrong((id *)&self->_appleModelNumber, 0);
  objc_storeStrong((id *)&self->_processedCrashLogs, 0);
  objc_storeStrong((id *)&self->_preProcessedCrashLogs, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)decomposeUARP
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "RTKitBuddy unable to decode Crash Log", buf, 2u);
}

- (uint64_t)decomposeUARP
{
  uint8_t *v0;
  int v1;
  os_log_t v2;

  dlerror();
  v0 = (uint8_t *)abort_report_np();
  return -[UARPDynamicAssetCrashLogEvent decomposeUARP].cold.3(v0, v1, v2);
}

- (void)processCrashInstance
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, a1, a3, "Unable to expand Crash Payloads", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)expandCRSHPayloads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_1(&dword_212D08000, v0, v1, "Unable to expand CRSH Data for: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)getCoreName:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Process CRSH Core Name TLV  is not on payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)getCoreName:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Process CRSH Core Name TLV is not of type string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)processCrashAdditionalInfo
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Cannot find Product ID for AMN: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

- (void)findMatchingCMAP
{
  OUTLINED_FUNCTION_0_1(&dword_212D08000, a2, a3, "Unable to find Matching CMAP for Apple Model Number: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end
