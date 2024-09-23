@implementation ATAssetLinkPowerLogger

- (ATAssetLinkPowerLogger)init
{
  ATAssetLinkPowerLogger *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *aggregation;
  objc_class *v5;
  const char *Name;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *loggerQueue;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)ATAssetLinkPowerLogger;
  v2 = -[ATAssetLinkPowerLogger init](&v11, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    aggregation = v2->_aggregation;
    v2->_aggregation = v3;

    v5 = (objc_class *)objc_opt_class();
    Name = class_getName(v5);
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = dispatch_queue_create(Name, v7);
    loggerQueue = v2->_loggerQueue;
    v2->_loggerQueue = (OS_dispatch_queue *)v8;

  }
  return v2;
}

- (void)logAssetLinkOfType:(int64_t)a3 didBeginDownloadingAsset:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  char v12;
  char v13;
  char v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  ATAssetLinkPowerLogger *v22;
  id v23;
  int64_t v24;
  uint64_t v25;
  char v26;
  char v27;
  char v28;

  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  objc_msgSend(v6, "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dataclass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v7, "totalBytes");
  v12 = objc_msgSend(v7, "canUseCellularData");
  v13 = objc_msgSend(v7, "isForeground");
  v14 = objc_msgSend(v7, "deviceWasChargingWhenEnqueued");

  -[ATAssetLinkPowerLogger loggerQueue](self, "loggerQueue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didBeginDownloadingAsset___block_invoke;
  block[3] = &unk_1E928CB08;
  v20 = v9;
  v21 = v10;
  v22 = self;
  v23 = v8;
  v24 = a3;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v14;
  v16 = v8;
  v17 = v10;
  v18 = v9;
  dispatch_async(v15, block);

}

- (void)logAssetLinkOfType:(int64_t)a3 didFinishAsset:(id)a4 withError:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  const __CFString *v16;
  void *v17;
  ATAssetLinkPowerLogger *v18;
  int64_t v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  char v25;
  void *v26;
  _QWORD block[4];
  id v28;
  id v29;
  ATAssetLinkPowerLogger *v30;
  id v31;
  id v32;
  __CFString *v33;
  int64_t v34;
  uint64_t v35;
  char v36;

  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dataclass");
  v11 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "totalBytes");
  if (v9)
    v13 -= objc_msgSend(v8, "bytesRemaining");
  objc_msgSend(MEMORY[0x1E0DDBF60], "sharedMonitor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v14, "isCharging");
  v15 = objc_msgSend(v14, "networkType");
  v16 = CFSTR("Unknown");
  v26 = (void *)v10;
  v17 = (void *)v11;
  v18 = self;
  v19 = a3;
  if (v15 > 99)
  {
    if (v15 > 1000)
    {
      switch(v15)
      {
        case 1001:
          v16 = CFSTR("Bridged WiFi");
          break;
        case 2000:
          v16 = CFSTR("Wired Ethernet");
          break;
        case 3000:
          v16 = CFSTR("Other");
          break;
      }
    }
    else
    {
      switch(v15)
      {
        case 100:
          goto LABEL_5;
        case 500:
          v16 = CFSTR("Bluetooth");
          break;
        case 1000:
          v16 = CFSTR("WiFi");
          break;
      }
    }
  }
  else if ((unint64_t)(v15 - 1) < 8)
  {
LABEL_5:
    v16 = CFSTR("Cellular");
  }
  -[ATAssetLinkPowerLogger loggerQueue](v18, "loggerQueue");
  v20 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didFinishAsset_withError___block_invoke;
  block[3] = &unk_1E928CB30;
  v28 = v17;
  v29 = v12;
  v30 = v18;
  v31 = v26;
  v34 = v19;
  v35 = v13;
  v36 = v25;
  v32 = v9;
  v33 = (__CFString *)v16;
  v21 = v9;
  v22 = v26;
  v23 = v12;
  v24 = v17;
  dispatch_async(v20, block);

}

- (void)_scheduleFlushTimer
{
  void *v3;
  NSObject *v4;
  dispatch_source_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  NSObject *v8;
  NSObject *v9;
  _QWORD handler[5];

  -[ATAssetLinkPowerLogger flushTimer](self, "flushTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[ATAssetLinkPowerLogger loggerQueue](self, "loggerQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v4);
    -[ATAssetLinkPowerLogger setFlushTimer:](self, "setFlushTimer:", v5);

    -[ATAssetLinkPowerLogger flushTimer](self, "flushTimer");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_walltime(0, 1800000000000);
    dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0x29E8D60800uLL);

    -[ATAssetLinkPowerLogger flushTimer](self, "flushTimer");
    v8 = objc_claimAutoreleasedReturnValue();
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__ATAssetLinkPowerLogger__scheduleFlushTimer__block_invoke;
    handler[3] = &unk_1E928CC80;
    handler[4] = self;
    dispatch_source_set_event_handler(v8, handler);

    -[ATAssetLinkPowerLogger flushTimer](self, "flushTimer");
    v9 = objc_claimAutoreleasedReturnValue();
    dispatch_resume(v9);

  }
}

- (id)_aggregatesForKey:(id)a3 createIfNotExistsWithTimestamp:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  -[ATAssetLinkPowerLogger aggregation](self, "aggregation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("timestamp"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v6, "linkType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v10, CFSTR("linkType"));

    objc_msgSend(v6, "dataclass");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("dataclass"));

    objc_msgSend(v6, "assetType");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v6, "assetType");
    else
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("assetType"));

    -[ATAssetLinkPowerLogger aggregation](self, "aggregation");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v9, v6);

  }
  return v9;
}

- (void)_incrementCountForAggregates:(id)a3 key:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v6);

}

- (void)_flushMessagesToPowerlog
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  -[ATAssetLinkPowerLogger aggregation](self, "aggregation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v8 = CFSTR("messages");
    v9[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    PLLogRegisteredEvent();
    -[ATAssetLinkPowerLogger aggregation](self, "aggregation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAllObjects");

  }
  -[ATAssetLinkPowerLogger flushTimer](self, "flushTimer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[ATAssetLinkPowerLogger flushTimer](self, "flushTimer");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_source_cancel(v7);

    -[ATAssetLinkPowerLogger setFlushTimer:](self, "setFlushTimer:", 0);
  }

}

- (NSMutableDictionary)aggregation
{
  return self->_aggregation;
}

- (void)setAggregation:(id)a3
{
  objc_storeStrong((id *)&self->_aggregation, a3);
}

- (OS_dispatch_queue)loggerQueue
{
  return self->_loggerQueue;
}

- (void)setLoggerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_loggerQueue, a3);
}

- (OS_dispatch_source)flushTimer
{
  return self->_flushTimer;
}

- (void)setFlushTimer:(id)a3
{
  objc_storeStrong((id *)&self->_flushTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushTimer, 0);
  objc_storeStrong((id *)&self->_loggerQueue, 0);
  objc_storeStrong((id *)&self->_aggregation, 0);
}

uint64_t __45__ATAssetLinkPowerLogger__scheduleFlushTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushMessagesToPowerlog");
}

void __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didFinishAsset_withError___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  ATAssetLinkPowerLoggerAggregationKey *v8;

  v8 = -[ATAssetLinkPowerLoggerAggregationKey initWithLinkType:dataclass:assetType:]([ATAssetLinkPowerLoggerAggregationKey alloc], "initWithLinkType:dataclass:assetType:", *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_aggregatesForKey:createIfNotExistsWithTimestamp:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sumBytesDownloaded"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 88) + objc_msgSend(v4, "unsignedLongLongValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("sumBytesDownloaded"));

  if (*(_QWORD *)(a1 + 64))
    v6 = CFSTR("countDownloadsFailed");
  else
    v6 = CFSTR("countDownloadsSucceeded");
  objc_msgSend(*(id *)(a1 + 48), "_incrementCountForAggregates:key:", v2, v6);
  if (*(_BYTE *)(a1 + 96))
    objc_msgSend(*(id *)(a1 + 48), "_incrementCountForAggregates:key:", v2, CFSTR("countFinishedOnCharger"));
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("countNetworkTypes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("countNetworkTypes"));
  }
  objc_msgSend(*(id *)(a1 + 48), "_incrementCountForAggregates:key:", v7, *(_QWORD *)(a1 + 72));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("timestampEnd"));
  objc_msgSend(*(id *)(a1 + 48), "_scheduleFlushTimer");

}

void __70__ATAssetLinkPowerLogger_logAssetLinkOfType_didBeginDownloadingAsset___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  ATAssetLinkPowerLoggerAggregationKey *v6;

  v6 = -[ATAssetLinkPowerLoggerAggregationKey initWithLinkType:dataclass:assetType:]([ATAssetLinkPowerLoggerAggregationKey alloc], "initWithLinkType:dataclass:assetType:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "_aggregatesForKey:createIfNotExistsWithTimestamp:");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("sumBytesRequested"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithUnsignedLongLong:", *(_QWORD *)(a1 + 72) + objc_msgSend(v4, "unsignedLongLongValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v5, CFSTR("sumBytesRequested"));

  objc_msgSend(*(id *)(a1 + 48), "_incrementCountForAggregates:key:", v2, CFSTR("countDownloadsBegun"));
  if (*(_BYTE *)(a1 + 80))
    objc_msgSend(*(id *)(a1 + 48), "_incrementCountForAggregates:key:", v2, CFSTR("countCanUseCellular"));
  if (*(_BYTE *)(a1 + 81))
    objc_msgSend(*(id *)(a1 + 48), "_incrementCountForAggregates:key:", v2, CFSTR("countIsForeground"));
  if (*(_BYTE *)(a1 + 82))
    objc_msgSend(*(id *)(a1 + 48), "_incrementCountForAggregates:key:", v2, CFSTR("countEnqueuedOnCharger"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("timestampEnd"));
  objc_msgSend(*(id *)(a1 + 48), "_scheduleFlushTimer");

}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ATAssetLinkPowerLogger_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1751 != -1)
    dispatch_once(&sharedInstance_onceToken_1751, block);
  return (id)sharedInstance_logger;
}

void __40__ATAssetLinkPowerLogger_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_logger;
  sharedInstance_logger = (uint64_t)v0;

}

@end
