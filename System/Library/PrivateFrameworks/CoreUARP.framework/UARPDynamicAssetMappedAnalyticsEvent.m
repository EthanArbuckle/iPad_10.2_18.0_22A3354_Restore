@implementation UARPDynamicAssetMappedAnalyticsEvent

- (UARPDynamicAssetMappedAnalyticsEvent)init
{
  -[UARPDynamicAssetMappedAnalyticsEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetMappedAnalyticsEvent)initWithURL:(id)a3
{
  id v5;
  UARPDynamicAssetMappedAnalyticsEvent *v6;
  UARPDynamicAssetMappedAnalyticsEvent *v7;
  NSMutableArray *v8;
  NSMutableArray *coreAnalyticsEvents;
  NSMutableArray *v10;
  NSMutableArray *payloads;
  os_log_t v12;
  OS_os_log *log;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)UARPDynamicAssetMappedAnalyticsEvent;
  v6 = -[UARPDynamicAssetMappedAnalyticsEvent init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_url, a3);
    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    coreAnalyticsEvents = v7->_coreAnalyticsEvents;
    v7->_coreAnalyticsEvents = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    payloads = v7->_payloads;
    v7->_payloads = v10;

    v12 = os_log_create("com.apple.accessoryupdater.uarp", "tmap");
    log = v7->_log;
    v7->_log = (OS_os_log *)v12;

  }
  return v7;
}

- (id)description
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  if (self->_tmapDatabase)
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v4 = self->_coreAnalyticsEvents;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v19 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("Mapped Analytics Event %@\n"), *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i));
        }
        v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v6);
    }
  }
  else
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_payloads;
    v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v15;
      do
      {
        for (j = 0; j != v10; ++j)
        {
          if (*(_QWORD *)v15 != v11)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("Mapped Analytics Payload %@\n"), *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * j));
        }
        v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      }
      while (v10);
    }
  }

  return v3;
}

- (void)send
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
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
  v2 = self->_coreAnalyticsEvents;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("EventName"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        AnalyticsSendEventLazy();

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

id __44__UARPDynamicAssetMappedAnalyticsEvent_send__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (BOOL)decomposeUARP
{
  UARPSuperBinaryAsset *v3;
  UARPSuperBinaryAsset *asset;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  NSObject *log;
  id obj;
  unsigned int v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0))
    return 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = 0;
        if (!-[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:](self, "getEventID:inPayload:", &v20, v9))
          goto LABEL_19;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v20);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, CFSTR("EventID"));

        v12 = objc_alloc_init(MEMORY[0x24BDD16A8]);
        if (!-[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:](self, "getAppleModelNumber:inPayload:", v12, v9))goto LABEL_18;
        v13 = (void *)objc_msgSend(v12, "copy");
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v13, CFSTR("AppleModelNumber"));

        objc_msgSend(v9, "rangePayload");
        -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v9, 0, v14, 0);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v15)
        {
          log = self->_log;
          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v26 = v9;
            _os_log_error_impl(&dword_212D08000, log, OS_LOG_TYPE_ERROR, "MTIC has no Payload Data: %@", buf, 0xCu);
          }

LABEL_18:
LABEL_19:

          v16 = 0;
          goto LABEL_20;
        }
        objc_msgSend(v10, "setObject:forKeyedSubscript:", v15, CFSTR("Events"));
        -[NSMutableArray addObject:](self->_payloads, "addObject:", v10);

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      v16 = 1;
      if (v6)
        continue;
      break;
    }
  }
  else
  {
    v16 = 1;
  }
LABEL_20:

  return v16;
}

- (BOOL)findMatchingTMAP
{
  UARPDynamicAssetTmapDatabase *v3;
  UARPDynamicAssetTmapDatabase *tmapDatabase;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  NSObject *log;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = -[UARPDynamicAssetTmapDatabase initTmapDatabase:]([UARPDynamicAssetTmapDatabase alloc], "initTmapDatabase:", 0);
  tmapDatabase = self->_tmapDatabase;
  self->_tmapDatabase = v3;

  if (self->_tmapDatabase)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = self->_payloads;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "objectForKeyedSubscript:", CFSTR("AppleModelNumber"), (_QWORD)v16);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = (void *)objc_msgSend(v10, "copy");

          -[UARPDynamicAssetTmapDatabase findTmapforAppleModel:](self->_tmapDatabase, "findTmapforAppleModel:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v12)
          {
            log = self->_log;
            if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
              -[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP].cold.2((uint64_t)v11, log);

            v13 = 0;
            goto LABEL_14;
          }

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v7)
          continue;
        break;
      }
    }
    v13 = 1;
LABEL_14:

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP].cold.1();
    return 0;
  }
  return v13;
}

- (BOOL)expandMTICPayloads
{
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  NSObject *log;
  BOOL v16;
  NSMutableArray *coreAnalyticsEvents;
  NSMutableArray *obj;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[4];
  NSMutableArray *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!-[UARPDynamicAssetMappedAnalyticsEvent findMatchingTMAP](self, "findMatchingTMAP"))
    return 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = self->_payloads;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
  if (v3)
  {
    v4 = v3;
    v20 = *(_QWORD *)v22;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v22 != v20)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("Events"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (void *)objc_msgSend(v7, "copy");

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("AppleModelNumber"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = (void *)objc_msgSend(v9, "copy");

        objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("EventID"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "unsignedIntValue");

        -[UARPDynamicAssetTmapDatabase expandMticData:withEventID:appleModelNumber:](self->_tmapDatabase, "expandMticData:withEventID:appleModelNumber:", v8, v12, v10);
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            -[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads].cold.1();

          return 0;
        }
        v14 = (void *)v13;
        -[NSMutableArray addObject:](self->_coreAnalyticsEvents, "addObject:", v13);

      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v21, v27, 16);
      if (v4)
        continue;
      break;
    }
  }

  log = self->_log;
  v16 = 1;
  if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
  {
    coreAnalyticsEvents = self->_coreAnalyticsEvents;
    *(_DWORD *)buf = 138412290;
    v26 = coreAnalyticsEvents;
    _os_log_impl(&dword_212D08000, log, OS_LOG_TYPE_INFO, "All MTIC data for this asset: %@", buf, 0xCu);
  }
  return v16;
}

- (BOOL)prepareAndSend
{
  _BOOL4 v3;

  if (!-[UARPDynamicAssetMappedAnalyticsEvent decomposeUARP](self, "decomposeUARP"))
  {
    v3 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    -[UARPDynamicAssetMappedAnalyticsEvent prepareAndSend].cold.2();
    goto LABEL_9;
  }
  if (!-[UARPDynamicAssetMappedAnalyticsEvent expandMTICPayloads](self, "expandMTICPayloads"))
  {
    v3 = os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR);
    if (!v3)
      return v3;
    -[UARPDynamicAssetMappedAnalyticsEvent prepareAndSend].cold.1();
LABEL_9:
    LOBYTE(v3) = 0;
    return v3;
  }
  -[UARPDynamicAssetMappedAnalyticsEvent send](self, "send");
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)getEventID:(unsigned int *)a3 inPayload:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  objc_msgSend(a4, "tlvs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 538280449, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "valueAsNumber");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    v10 = v8 != 0;
    if (v8)
    {
      *a3 = objc_msgSend(v8, "unsignedIntValue");
    }
    else if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
    {
      -[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:].cold.2();
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
      -[UARPDynamicAssetMappedAnalyticsEvent getEventID:inPayload:].cold.1();
    v10 = 0;
  }

  return v10;
}

- (BOOL)getAppleModelNumber:(id)a3 inPayload:(id)a4
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
  +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 538280448, v6);
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
        -[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:].cold.2(v18, v19, v20, v21, v22, v23, v24, v25);
    }

  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v10)
      -[UARPDynamicAssetMappedAnalyticsEvent getAppleModelNumber:inPayload:].cold.1(v10, v11, v12, v13, v14, v15, v16, v17);
    v9 = 0;
  }

  return v9;
}

+ (id)tag
{
  char *v2;

  v2 = (char *)uarpAssetTagStructMappedAnalytics();
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v2, v2[1], v2[2], v2[3]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_tmapDatabase, 0);
  objc_storeStrong((id *)&self->_payloads, 0);
  objc_storeStrong((id *)&self->_coreAnalyticsEvents, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)findMatchingTMAP
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_212D08000, a2, OS_LOG_TYPE_ERROR, "Unable to find Matching TMAP for Apple Model Number: %@", (uint8_t *)&v2, 0xCu);
}

- (void)expandMTICPayloads
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Unable to expand Data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)prepareAndSend
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Failed to decompose MTIC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getEventID:inPayload:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Process MTIC Event ID tlv is not on payload", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getEventID:inPayload:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_0(&dword_212D08000, v0, v1, "Process MTIC Event ID tlv is not of type number", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)getAppleModelNumber:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Process MTIC Apple Model Number tlv is not on payload", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

- (void)getAppleModelNumber:(uint64_t)a3 inPayload:(uint64_t)a4 .cold.2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Process MTIC Apple Model Number tlv is not of type string", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

@end
