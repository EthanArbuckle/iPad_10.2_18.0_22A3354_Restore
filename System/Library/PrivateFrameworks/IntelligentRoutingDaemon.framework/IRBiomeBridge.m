@implementation IRBiomeBridge

- (IRBiomeBridge)initWithBiomeProvider:(id)a3 targetQueue:(id)a4
{
  id v6;
  IRBiomeBridge *v7;
  IRBiomeBridge *v8;
  uint64_t v9;
  NSMutableDictionary *eventTypeToSinkMap;
  uint64_t v11;
  NSMutableDictionary *eventTypeToSchedulerMap;
  uint64_t i;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableDictionary *v19;
  void *v20;
  id obj;
  objc_super v23;

  obj = a3;
  v6 = a4;
  v23.receiver = self;
  v23.super_class = (Class)IRBiomeBridge;
  v7 = -[IRBiomeBridge init](&v23, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeWeak((id *)&v7->_biomeProvider, obj);
    v9 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
    eventTypeToSinkMap = v8->_eventTypeToSinkMap;
    v8->_eventTypeToSinkMap = (NSMutableDictionary *)v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 4);
    eventTypeToSchedulerMap = v8->_eventTypeToSchedulerMap;
    v8->_eventTypeToSchedulerMap = (NSMutableDictionary *)v11;

    for (i = 1; i != 4; ++i)
    {
      v14 = objc_alloc(MEMORY[0x24BE0CB48]);
      v15 = (void *)MEMORY[0x24BDD17C8];
      IRBiomeEventTypeToString((const char *)i);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "stringWithFormat:", CFSTR("com.apple.%@"), v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (void *)objc_msgSend(v14, "initWithIdentifier:targetQueue:waking:", v17, v6, 0);

      v19 = v8->_eventTypeToSchedulerMap;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", i);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v19, "setObject:forKeyedSubscript:", v18, v20);

    }
  }

  return v8;
}

- (void)dealloc
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = self->_eventTypeToSinkMap;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_eventTypeToSinkMap, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "cancel");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  v9.receiver = self;
  v9.super_class = (Class)IRBiomeBridge;
  -[IRBiomeBridge dealloc](&v9, sel_dealloc);
}

- (void)subscribeEvent:(int64_t)a3
{
  const void **v5;
  void *v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  id v10;
  IRBiomeParameters *v11;
  void *v12;
  NSMutableDictionary *eventTypeToSchedulerMap;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableDictionary *eventTypeToSinkMap;
  void *v19;
  os_log_t v20;
  NSObject *v21;
  id v22;
  uint64_t v23;
  _QWORD v24[6];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v5 = (const void **)MEMORY[0x24BE5B328];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (os_log_t *)MEMORY[0x24BE5B270];
  v8 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    IRBiomeEventTypeToString((const char *)a3);
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    *(_DWORD *)buf = 136315650;
    v26 = "#biome-bridge, ";
    v27 = 2112;
    v28 = v6;
    v29 = 2080;
    v30 = objc_msgSend(v10, "UTF8String");
    _os_log_impl(&dword_23FFBA000, v9, OS_LOG_TYPE_INFO, "%s[%@], IRBiomeBridge, subscribing a context notification of event type, %s", buf, 0x20u);

  }
  v11 = -[IRBiomeParameters initWithBiomeEventType:]([IRBiomeParameters alloc], "initWithBiomeEventType:", a3);
  -[IRBiomeParameters contextPublisher](v11, "contextPublisher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  eventTypeToSchedulerMap = self->_eventTypeToSchedulerMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](eventTypeToSchedulerMap, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "subscribeOn:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __32__IRBiomeBridge_subscribeEvent___block_invoke_9;
  v24[3] = &unk_251044D18;
  v24[4] = self;
  v24[5] = a3;
  objc_msgSend(v16, "sinkWithCompletion:receiveInput:", &__block_literal_global_13, v24);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    eventTypeToSinkMap = self->_eventTypeToSinkMap;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](eventTypeToSinkMap, "setObject:forKeyedSubscript:", v17, v19);
  }
  else
  {
    dispatch_get_specific(*v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
    {
      v21 = v20;
      IRBiomeEventTypeToString((const char *)a3);
      v22 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v23 = objc_msgSend(v22, "UTF8String");
      *(_DWORD *)buf = 136315650;
      v26 = "#biome-bridge, ";
      v27 = 2112;
      v28 = v19;
      v29 = 2080;
      v30 = v23;
      _os_log_impl(&dword_23FFBA000, v21, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Biome subscribe error] Failed at subscribing a biome stream of event type: %s", buf, 0x20u);

    }
  }

}

void __32__IRBiomeBridge_subscribeEvent___block_invoke()
{
  void *v0;
  NSObject *v1;
  int v2;
  const char *v3;
  __int16 v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v2 = 136315394;
    v3 = "#biome-bridge, ";
    v4 = 2112;
    v5 = v0;
    _os_log_impl(&dword_23FFBA000, v1, OS_LOG_TYPE_INFO, "%s[%@], IRBiomeBridge, context stream comletion block called, possibly sink is cancelled", (uint8_t *)&v2, 0x16u);
  }

}

void __32__IRBiomeBridge_subscribeEvent___block_invoke_9(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_DEBUG))
  {
    v7 = 136315394;
    v8 = "#biome-bridge, ";
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_23FFBA000, v5, OS_LOG_TYPE_DEBUG, "%s[%@], IRBiomeBridge, received a context biome event", (uint8_t *)&v7, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(WeakRetained, "notifyObserversOfEvent:withValue:", *(_QWORD *)(a1 + 40), v3);

}

- (void)unsubscribeEvent:(int64_t)a3
{
  NSMutableDictionary *eventTypeToSinkMap;
  void *v6;
  NSMutableDictionary *v7;
  void *v8;
  id v9;

  eventTypeToSinkMap = self->_eventTypeToSinkMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](eventTypeToSinkMap, "objectForKeyedSubscript:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "cancel");
  v7 = self->_eventTypeToSinkMap;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](v7, "removeObjectForKey:", v8);

}

- (id)fetchLatestEventsOfEventType:(int64_t)a3 numEvents:(unint64_t)a4
{
  void *v6;
  IRBiomeParameters *v7;
  void *v8;
  IRBiomeParameters *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  IRBiomeParameters *v14;
  uint64_t *v15;
  _QWORD v16[7];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__3;
  v21 = __Block_byref_object_dispose__3;
  v22 = (id)objc_opt_new();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE0CC98]), "initWithStartDate:endDate:maxEvents:lastN:reversed:", 0, 0, a4, a4, 0);
  v7 = -[IRBiomeParameters initWithBiomeEventType:]([IRBiomeParameters alloc], "initWithBiomeEventType:", a3);
  -[IRBiomeParameters queryPublisherWithOptions:](v7, "queryPublisherWithOptions:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke;
  v16[3] = &unk_251044D40;
  v16[5] = a4;
  v16[6] = a3;
  v16[4] = &v17;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke_14;
  v13[3] = &unk_251044D68;
  v9 = v7;
  v14 = v9;
  v15 = &v17;
  v10 = (id)objc_msgSend(v8, "sinkWithCompletion:receiveInput:", v16, v13);
  v11 = (void *)objc_msgSend((id)v18[5], "copy");

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)*MEMORY[0x24BE5B270];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE5B270], OS_LOG_TYPE_INFO))
  {
    v6 = (void *)MEMORY[0x24BDD16E0];
    v7 = *(_QWORD *)(a1 + 40);
    v8 = v5;
    objc_msgSend(v6, "numberWithUnsignedInteger:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    IRBiomeEventTypeToString(*(const char **)(a1 + 48));
    v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v11 = objc_msgSend(v10, "UTF8String");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316162;
    v14 = "#biome-bridge, ";
    v15 = 2112;
    v16 = v4;
    v17 = 2112;
    v18 = v9;
    v19 = 2080;
    v20 = v11;
    v21 = 2112;
    v22 = v12;
    _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_INFO, "%s[%@], Fetching latest %@ events of eventType %s completed. Fetch returned %@ events", (uint8_t *)&v13, 0x34u);

  }
  +[IRBiomeBridge _logCompletion:](IRBiomeBridge, "_logCompletion:", v3);

}

void __56__IRBiomeBridge_fetchLatestEventsOfEventType_numEvents___block_invoke_14(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "eventBody");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "biomeEventClass");
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v5);

}

+ (void)_logCompletion:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  id v10;
  int v11;
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = objc_msgSend(v3, "state");
  dispatch_get_specific((const void *)*MEMORY[0x24BE5B328]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x24BE5B270];
  v7 = *MEMORY[0x24BE5B270];
  if (v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = v6;
      objc_msgSend(v3, "error");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "description");
      v10 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v11 = 136315650;
      v12 = "#biome-bridge, ";
      v13 = 2112;
      v14 = v5;
      v15 = 2080;
      v16 = objc_msgSend(v10, "UTF8String");
      _os_log_impl(&dword_23FFBA000, v8, OS_LOG_TYPE_ERROR, "%s[%@], [ErrorId - Biome stream complete error] Stream operation completed with error, %s\n", (uint8_t *)&v11, 0x20u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v11 = 136315394;
    v12 = "#biome-bridge, ";
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_23FFBA000, v6, OS_LOG_TYPE_DEBUG, "%s[%@], Stream operation completed succesfully.", (uint8_t *)&v11, 0x16u);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventTypeToSchedulerMap, 0);
  objc_storeStrong((id *)&self->_eventTypeToSinkMap, 0);
  objc_destroyWeak((id *)&self->_biomeProvider);
}

@end
