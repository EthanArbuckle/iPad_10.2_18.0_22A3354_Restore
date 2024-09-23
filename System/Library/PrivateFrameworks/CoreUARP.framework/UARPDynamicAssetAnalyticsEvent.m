@implementation UARPDynamicAssetAnalyticsEvent

- (UARPDynamicAssetAnalyticsEvent)init
{
  -[UARPDynamicAssetAnalyticsEvent doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (UARPDynamicAssetAnalyticsEvent)initWithURL:(id)a3
{
  id v4;
  UARPDynamicAssetAnalyticsEvent *v5;
  uint64_t v6;
  NSURL *url;
  NSMutableArray *v8;
  NSMutableArray *events;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UARPDynamicAssetAnalyticsEvent;
  v5 = -[UARPDynamicAssetAnalyticsEvent init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    url = v5->_url;
    v5->_url = (NSURL *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    events = v5->_events;
    v5->_events = v8;

  }
  return v5;
}

- (id)description
{
  id v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("Analytics Events %@\n"), self->_events);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_events;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("Analytics Event %@\n"), *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (BOOL)decomposeUARP
{
  UARPSuperBinaryAsset *v3;
  UARPSuperBinaryAsset *asset;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t i;
  NSMutableArray *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSMutableArray *v19;
  BOOL v20;
  NSMutableArray *events;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BOOL8 v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  NSMutableArray *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v3 = -[UARPSuperBinaryAsset initWithURL:]([UARPSuperBinaryAsset alloc], "initWithURL:", self->_url);
  asset = self->_asset;
  self->_asset = v3;

  if (!-[UARPSuperBinaryAsset expandHeadersAndTLVs:](self->_asset, "expandHeadersAndTLVs:", 0))
    return 0;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[UARPSuperBinaryAsset payloads](self->_asset, "payloads");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (!v6)
    goto LABEL_19;
  v8 = v6;
  v9 = *(_QWORD *)v41;
  v10 = MEMORY[0x24BDACB70];
  *(_QWORD *)&v7 = 138412290;
  v39 = v7;
  while (2)
  {
    for (i = 0; i != v8; ++i)
    {
      if (*(_QWORD *)v41 != v9)
        objc_enumerationMutation(v5);
      v12 = *(NSMutableArray **)(*((_QWORD *)&v40 + 1) + 8 * i);
      -[NSMutableArray tlvs](v12, "tlvs", v39);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      +[UARPSuperBinaryAssetTLV findTLVWithType:tlvs:](UARPSuperBinaryAssetTLV, "findTLVWithType:tlvs:", 1483412481, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v14, "valueAsNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v15;
        if (!v15)
        {
          v22 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v22)
            -[UARPDynamicAssetAnalyticsEvent decomposeUARP].cold.1(v22, v23, v24, v25, v26, v27, v28, v29);
          goto LABEL_26;
        }
        if (objc_msgSend(v15, "unsignedIntegerValue"))
        {
          v30 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
          if (v30)
            -[UARPDynamicAssetAnalyticsEvent decomposeUARP].cold.2(v30, v31, v32, v33, v34, v35, v36, v37);
          goto LABEL_26;
        }

      }
      else if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v39;
        v45 = v12;
        _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "Process TICS assuming JSON : %@", buf, 0xCu);
      }
      -[NSMutableArray rangePayload](v12, "rangePayload");
      -[UARPSuperBinaryAsset payloadData:range:error:](self->_asset, "payloadData:range:error:", v12, 0, v17, 0);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1608], "JSONObjectWithData:options:error:", v16, 0, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v18 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {

LABEL_26:
        return 0;
      }
      v19 = v18;
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = v39;
        v45 = v19;
        _os_log_impl(&dword_212D08000, v10, OS_LOG_TYPE_INFO, "Analytics object : %@", buf, 0xCu);
      }
      -[NSMutableArray addObject:](self->_events, "addObject:", v19);

    }
    v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v8)
      continue;
    break;
  }
LABEL_19:

  v20 = 1;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    events = self->_events;
    *(_DWORD *)buf = 138412290;
    v45 = events;
    _os_log_impl(&dword_212D08000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "All Analytics objects for this asset: %@", buf, 0xCu);
  }
  return v20;
}

- (void)send
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  id v12;
  NSMutableArray *obj;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  void *v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = self->_events;
  v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
  if (v15)
  {
    v14 = *(_QWORD *)v23;
    v2 = MEMORY[0x24BDACB70];
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v23 != v14)
          objc_enumerationMutation(obj);
        v16 = v3;
        v4 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * v3);
        objc_msgSend(v4, "allKeys");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v19;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v19 != v8)
                objc_enumerationMutation(v5);
              v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              objc_msgSend(v4, "objectForKeyedSubscript:", v10);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v27 = v10;
                v28 = 2112;
                v29 = v11;
                _os_log_impl(&dword_212D08000, v2, OS_LOG_TYPE_INFO, "Posting Analytics %@ : %@", buf, 0x16u);
              }
              v17 = v11;
              v12 = v11;
              AnalyticsSendEventLazy();

            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v30, 16);
          }
          while (v7);
        }

        v3 = v16 + 1;
      }
      while (v16 + 1 != v15);
      v15 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v31, 16);
    }
    while (v15);
  }

}

id __38__UARPDynamicAssetAnalyticsEvent_send__block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

+ (id)tag
{
  char *v2;

  v2 = (char *)uarpAssetTagStructAnalytics();
  return -[UARPAssetTag initWithChar1:char2:char3:char4:]([UARPAssetTag alloc], "initWithChar1:char2:char3:char4:", *v2, v2[1], v2[2], v2[3]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

- (void)decomposeUARP
{
  OUTLINED_FUNCTION_0_0(&dword_212D08000, MEMORY[0x24BDACB70], a3, "Process TICS payload type tlv is not JSON", a5, a6, a7, a8, 0);
}

@end
