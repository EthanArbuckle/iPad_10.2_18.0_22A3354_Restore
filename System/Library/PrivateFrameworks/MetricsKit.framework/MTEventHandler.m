@implementation MTEventHandler

id __54__MTEventHandler_metricsDataWithCallerSuppliedFields___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "metricsKit");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "config");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configValueForKeyPath:sources:", CFSTR("metricsBase"), v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v6;
  else
    v7 = (void *)MEMORY[0x24BDBD1B8];
  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)metricsDataWithCallerSuppliedFields:(id)a3
{
  id v4;
  MTMetricsData *v5;
  void *v6;
  MTMetricsData *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v30[5];

  v4 = a3;
  +[MTEventHandler createEventContextCache](MTEventHandler, "createEventContextCache");
  v5 = [MTMetricsData alloc];
  -[MTObject metricsKit](self, "metricsKit");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[MTObject initWithMetricsKit:](v5, "initWithMetricsKit:", v6);

  -[MTObject metricsKit](self, "metricsKit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "system");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "environment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData setAnonymous:](v7, "setAnonymous:", objc_msgSend(v10, "isAnonymous"));

  -[MTEventHandler registeredEventData](self, "registeredEventData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData setRegisteredEventData:](v7, "setRegisteredEventData:", v11);

  -[MTMetricsData setCallerSuppliedFields:](v7, "setCallerSuppliedFields:", v4);
  -[MTObject metricsKit](self, "metricsKit");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "config");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sources");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __54__MTEventHandler_metricsDataWithCallerSuppliedFields___block_invoke;
  v30[3] = &unk_24C7A0240;
  v30[4] = self;
  objc_msgSend(v14, "thenWithBlock:", v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData setConfigBaseFields:](v7, "setConfigBaseFields:", v15);

  if (-[MTEventHandler mtIncludeBaseFields](self, "mtIncludeBaseFields"))
  {
    -[MTObject metricsKit](self, "metricsKit");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "eventHandlers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "base");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMetricsData performanceData](v7, "performanceData");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "processMetricsData:performanceData:", v4, v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMetricsData setBaseFields:](v7, "setBaseFields:", v20);

    -[MTObject metricsKit](self, "metricsKit");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "eventHandlers");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "base");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "flattenAdditionalData");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMetricsData setAdditionalBaseData:](v7, "setAdditionalBaseData:", v24);

  }
  -[MTMetricsData performanceData](v7, "performanceData");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventDataProvider processMetricsData:performanceData:](self, "processMetricsData:performanceData:", v4, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData setEventSpecificFields:](v7, "setEventSpecificFields:", v26);

  -[MTEventDataProvider flattenAdditionalData](self, "flattenAdditionalData");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMetricsData setAdditionalEventData:](v7, "setAdditionalEventData:", v27);

  -[MTEventHandler postProcessingBlocks](self, "postProcessingBlocks");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v28, "count"))
    -[MTMetricsData addPostProcessingBlocks:](v7, "addPostProcessingBlocks:", v28);
  +[MTEventHandler clearEventContextCache](MTEventHandler, "clearEventContextCache");
  -[MTEventHandler didCreateMetricsData:](self, "didCreateMetricsData:", v7);

  return v7;
}

- (NSArray)registeredEventData
{
  return self->_registeredEventData;
}

- (NSArray)postProcessingBlocks
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

+ (void)createEventContextCache
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("MTMetricsKitEventContextCache"));

}

+ (void)clearEventContextCache
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "threadDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", 0, CFSTR("MTMetricsKitEventContextCache"));

}

- (id)knownFields
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _QWORD v8[4];

  v8[3] = *MEMORY[0x24BDAC8D0];
  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "knownFields");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
  else
  {
    v8[0] = CFSTR("eventType");
    v8[1] = CFSTR("eventVersion");
    v8[2] = CFSTR("clientEventId");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v8, 3);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)eventVersion:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_respondsToSelector();

  if ((v6 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "eventVersion:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("eventVersion"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)eventType
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventDataProvider delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventType");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)metricsDataWithFields:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id *v9;
  id v10;
  void *v11;
  id *v13;
  uint64_t v14;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id *)&v14;
  v6 = v4;
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v5, "addObjectsFromArray:", v8);
      else
        objc_msgSend(v5, "addObject:", v8);
      v9 = v13++;
      v10 = *v9;

      v8 = v10;
    }
    while (v10);
  }
  -[MTEventHandler metricsDataWithEventData:](self, "metricsDataWithEventData:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)metricsDataWithEventData:(id)a3
{
  id v4;
  MTCallerSuppliedFields *v5;
  void *v6;

  v4 = a3;
  v5 = -[MTCallerSuppliedFields initWithEventData:]([MTCallerSuppliedFields alloc], "initWithEventData:", v4);

  -[MTEventHandler metricsDataWithCallerSuppliedFields:](self, "metricsDataWithCallerSuppliedFields:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)cachableWithKey:(id)a3 onBackgroundThread:(BOOL)a4 block:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  objc_msgSend(a1, "currentEventContextCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v12 = (void *)objc_opt_new();
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __59__MTEventHandler_cachableWithKey_onBackgroundThread_block___block_invoke;
    v18[3] = &unk_24C7A08D0;
    v21 = v9;
    v11 = v12;
    v19 = v11;
    v13 = v8;
    v20 = v13;
    v14 = MEMORY[0x212BA8428](v18);
    v15 = (void *)v14;
    if (v6)
    {
      dispatch_get_global_queue(0, 0);
      v16 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v16, v15);

    }
    else
    {
      (*(void (**)(uint64_t))(v14 + 16))(v14);
    }
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v11, v13);

  }
  return v11;
}

+ (id)currentEventContextCache
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BDD17F0], "currentThread");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "threadDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("MTMetricsKitEventContextCache"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_postProcessingBlocks, 0);
  objc_storeStrong((id *)&self->_registeredEventData, 0);
  objc_storeStrong((id *)&self->_registeredName, 0);
}

void __59__MTEventHandler_cachableWithKey_onBackgroundThread_block___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  v10 = v3;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "finishWithResult:", v2);
  }
  else
  {
    if (!v3)
    {
      MTError(108, CFSTR("Failed to retrieve cachable value for %@"), v4, v5, v6, v7, v8, v9, *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*(id *)(a1 + 32), "finishWithError:", v10);
  }

}

- (void)addPostProcessingBlock:(id)a3
{
  MTEventHandler *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTEventHandler postProcessingBlocks](v4, "postProcessingBlocks");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");

  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v7 = (void *)MEMORY[0x212BA8428](v9);
  objc_msgSend(v6, "addObject:", v7);

  v8 = (void *)objc_msgSend(v6, "copy");
  -[MTEventHandler setPostProcessingBlocks:](v4, "setPostProcessingBlocks:", v8);

  objc_sync_exit(v4);
}

- (BOOL)mtIncludeBaseFields
{
  void *v3;
  char v4;
  void *v5;
  char v6;

  -[MTEventDataProvider delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 1;
  -[MTEventDataProvider delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mtIncludeBaseFields");

  return v6;
}

- (NSString)registeredName
{
  return self->_registeredName;
}

- (void)setRegisteredName:(id)a3
{
  objc_storeStrong((id *)&self->_registeredName, a3);
}

- (void)setRegisteredEventData:(id)a3
{
  objc_storeStrong((id *)&self->_registeredEventData, a3);
}

- (void)setPostProcessingBlocks:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

@end
