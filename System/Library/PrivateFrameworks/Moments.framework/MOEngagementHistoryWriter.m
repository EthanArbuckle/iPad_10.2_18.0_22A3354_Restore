@implementation MOEngagementHistoryWriter

- (MOEngagementHistoryWriter)init
{
  MOEngagementHistoryWriter *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *cachedViewedContext;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSXPCConnection *connection;
  uint64_t v18;
  MOEngagementHistoryXCPProtocol *proxy;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  MOEngagementHistoryWriter *v28;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)MOEngagementHistoryWriter;
  v2 = -[MOEngagementHistoryWriter init](&v30, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("MOEngagementHistoryWriter", v3);
    queue = v2->queue;
    v2->queue = (OS_dispatch_queue *)v4;

    cachedViewedContext = v2->cachedViewedContext;
    v2->cachedViewedContext = 0;

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF99CC08);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    _mo_log_facility_get_os_log(MOLogFacilityEngagement);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      -[MOEngagementHistoryWriter init].cold.2(v8, v9, v10, v11, v12, v13, v14, v15);

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.momentsd"), 0);
    connection = v2->connection;
    v2->connection = (NSXPCConnection *)v16;

    -[NSXPCConnection setRemoteObjectInterface:](v2->connection, "setRemoteObjectInterface:", v7);
    -[NSXPCConnection setInterruptionHandler:](v2->connection, "setInterruptionHandler:", &__block_literal_global_1);
    -[NSXPCConnection setInvalidationHandler:](v2->connection, "setInvalidationHandler:", &__block_literal_global_10);
    -[NSXPCConnection remoteObjectProxyWithErrorHandler:](v2->connection, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_14);
    v18 = objc_claimAutoreleasedReturnValue();
    proxy = v2->proxy;
    v2->proxy = (MOEngagementHistoryXCPProtocol *)v18;

    -[NSXPCConnection resume](v2->connection, "resume");
    _mo_log_facility_get_os_log(MOLogFacilityEngagement);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      -[MOEngagementHistoryWriter init].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

    v28 = v2;
  }

  return v2;
}

void __33__MOEngagementHistoryWriter_init__block_invoke()
{
  NSLog(CFSTR("Interrupted"));
}

void __33__MOEngagementHistoryWriter_init__block_invoke_2()
{
  NSLog(CFSTR("Invalidated"));
}

void __33__MOEngagementHistoryWriter_init__block_invoke_3(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __33__MOEngagementHistoryWriter_init__block_invoke_3_cold_1(v2, v3);

}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCConnection invalidate](self->connection, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)MOEngagementHistoryWriter;
  -[MOEngagementHistoryWriter dealloc](&v3, sel_dealloc);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__MOEngagementHistoryWriter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, block);
  return (id)sharedInstance_shared;
}

void __43__MOEngagementHistoryWriter_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_shared;
  sharedInstance_shared = v0;

}

- (void)logEngagementEvent:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOEngagementHistoryXCPProtocol *proxy;
  void *v10;

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOEngagementHistoryWriter logEngagementEvent:withContext:].cold.1();

  proxy = self->proxy;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEngagementHistoryXCPProtocol logEngagementEvent:timestamp:withContext:](proxy, "logEngagementEvent:timestamp:withContext:", v6, v10, v7);

}

- (void)logPerformanceEvent:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOEngagementHistoryXCPProtocol *proxy;
  void *v10;

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOEngagementHistoryWriter logPerformanceEvent:withContext:].cold.1();

  proxy = self->proxy;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEngagementHistoryXCPProtocol logPerformanceEvent:timestamp:withContext:](proxy, "logPerformanceEvent:timestamp:withContext:", v6, v10, v7);

}

- (void)logUsageEvent:(id)a3 withContext:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  MOEngagementHistoryXCPProtocol *proxy;
  void *v10;

  v6 = a3;
  v7 = a4;
  _mo_log_facility_get_os_log(MOLogFacilityEngagement);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[MOEngagementHistoryWriter logUsageEvent:withContext:].cold.1();

  proxy = self->proxy;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEngagementHistoryXCPProtocol logUsageEvent:timestamp:withContext:](proxy, "logUsageEvent:timestamp:withContext:", v6, v10, v7);

}

- (void)logAppEntryEngagementEvent:(id)a3 clientIdentifier:(id)a4 forBundles:(id)a5 startTime:(id)a6 endTime:(id)a7 totalCharacters:(id)a8 addedCharacters:(id)a9 otherContext:(id)a10
{
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  MOEngagementHistoryXCPProtocol *proxy;
  void *v25;
  id v27;

  v16 = (void *)MEMORY[0x1E0C99E08];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a4;
  v23 = a3;
  objc_msgSend(v16, "dictionaryWithDictionary:", a10);
  v27 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v22, CFSTR("clientIdentifier"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v21, CFSTR("eventBundles"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v20, CFSTR("entryStartTime"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v19, CFSTR("entryEndTime"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v18, CFSTR("entryTotalCharacters"));

  objc_msgSend(v27, "setObject:forKeyedSubscript:", v17, CFSTR("entryAddedCharacters"));
  proxy = self->proxy;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEngagementHistoryXCPProtocol logEngagementEvent:timestamp:withContext:](proxy, "logEngagementEvent:timestamp:withContext:", v23, v25, v27);

}

- (BOOL)isOkToMergeSuggestionViewedContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  BOOL v10;

  v4 = a3;
  v5 = v4;
  if (!self->cachedViewedContext)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->cachedViewedContext, "objectForKeyedSubscript:", CFSTR("clientIdentifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6 == v7)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("viewContainerName"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](self->cachedViewedContext, "objectForKeyedSubscript:", CFSTR("viewContainerName"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 != v9)
      goto LABEL_5;
LABEL_6:
    v10 = 1;
    goto LABEL_7;
  }

LABEL_5:
  v10 = 0;
LABEL_7:

  return v10;
}

- (void)logClientEngagementEvent:(id)a3 clientIdentifier:(id)a4 otherContext:(id)a5
{
  void *v8;
  id v9;
  id v10;
  MOEngagementHistoryXCPProtocol *proxy;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1E0C99E08];
  v9 = a4;
  v10 = a3;
  objc_msgSend(v8, "dictionaryWithDictionary:", a5);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v9, CFSTR("clientIdentifier"));

  proxy = self->proxy;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[MOEngagementHistoryXCPProtocol logEngagementEvent:timestamp:withContext:](proxy, "logEngagementEvent:timestamp:withContext:", v10, v12, v13);

}

- (void)logSuggestionEngagementEvent:(id)a3 clientIdentifier:(id)a4 forBundles:(id)a5 uiContainer:(id)a6 containerVisibleTime:(id)a7 otherContext:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *queue;
  MOEngagementHistoryXCPProtocol *proxy;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id location;

  v14 = a3;
  v15 = a5;
  v16 = a7;
  v17 = (void *)MEMORY[0x1E0C99E08];
  v18 = a6;
  v19 = a4;
  objc_msgSend(v17, "dictionaryWithDictionary:", a8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, CFSTR("clientIdentifier"));

  objc_msgSend(v20, "setObject:forKeyedSubscript:", v18, CFSTR("viewContainerName"));
  if (objc_msgSend(v14, "isEqual:", CFSTR("suggestionsViewed")))
  {
    objc_initWeak(&location, self);
    queue = self->queue;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke;
    v24[3] = &unk_1E85418C0;
    objc_copyWeak(&v29, &location);
    v25 = v20;
    v26 = v15;
    v27 = v14;
    v28 = v16;
    dispatch_async(queue, v24);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  else
  {
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v15, CFSTR("eventBundles"));
    objc_msgSend(v20, "setObject:forKeyedSubscript:", v16, CFSTR("viewVisibleTime"));
    proxy = self->proxy;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[MOEngagementHistoryXCPProtocol logEngagementEvent:timestamp:withContext:](proxy, "logEngagementEvent:timestamp:withContext:", v14, v23, v20);

  }
}

void __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke(uint64_t a1)
{
  id *v2;
  id *WeakRetained;
  id *v4;
  id *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  dispatch_time_t v11;
  NSObject *v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v2 = (id *)(a1 + 64);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 64));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained + 4;
    if (!WeakRetained[4])
      goto LABEL_7;
    if (objc_msgSend(WeakRetained, "isOkToMergeSuggestionViewedContext:", *(_QWORD *)(a1 + 32)))
    {
      objc_msgSend(*v5, "objectForKeyedSubscript:", CFSTR("eventBundles"));
      v6 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "addObjectsFromArray:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v7 = v4[2];
      v8 = *(_QWORD *)(a1 + 48);
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logEngagementEvent:timestamp:withContext:", v8, v9, v4[4]);

      v6 = v4[4];
      v4[4] = 0;
    }

    if (!*v5)
    {
LABEL_7:
      objc_storeStrong(v4 + 4, *(id *)(a1 + 32));
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", *(_QWORD *)(a1 + 40));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v10, CFSTR("eventBundles"));

      objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("viewVisibleTime"));
      v11 = dispatch_time(0, 3000000000);
      v12 = v4[3];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke_2;
      v13[3] = &unk_1E8541898;
      objc_copyWeak(&v15, v2);
      v14 = *(id *)(a1 + 48);
      dispatch_after(v11, v12, v13);

      objc_destroyWeak(&v15);
    }
  }

}

void __132__MOEngagementHistoryWriter_logSuggestionEngagementEvent_clientIdentifier_forBundles_uiContainer_containerVisibleTime_otherContext___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  _QWORD *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained && WeakRetained[4])
  {
    v3 = (void *)WeakRetained[2];
    v4 = *(_QWORD *)(a1 + 32);
    v7 = WeakRetained;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "logEngagementEvent:timestamp:withContext:", v4, v5, v7[4]);

    v6 = (void *)v7[4];
    v7[4] = 0;

    WeakRetained = v7;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->cachedViewedContext, 0);
  objc_storeStrong((id *)&self->queue, 0);
  objc_storeStrong((id *)&self->proxy, 0);
  objc_storeStrong((id *)&self->connection, 0);
}

- (void)init
{
  OUTLINED_FUNCTION_2_2(&dword_1CAE42000, a1, a3, "connecting", a5, a6, a7, a8, 0);
}

void __33__MOEngagementHistoryWriter_init__block_invoke_3_cold_1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  const __CFString *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "localizedDescription");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "localizedFailureReason");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412802;
  v7 = CFSTR("Error on remote object proxy");
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_1CAE42000, a2, OS_LOG_TYPE_DEBUG, "%@: %@ %@\n", (uint8_t *)&v6, 0x20u);

}

- (void)logEngagementEvent:withContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "Engagement event: %@, context: %{private}@");
  OUTLINED_FUNCTION_2();
}

- (void)logPerformanceEvent:withContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "Performace event: %@, context: %{private}@");
  OUTLINED_FUNCTION_2();
}

- (void)logUsageEvent:withContext:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_1(&dword_1CAE42000, v0, v1, "Usage event: %@, context: %{private}@");
  OUTLINED_FUNCTION_2();
}

@end
