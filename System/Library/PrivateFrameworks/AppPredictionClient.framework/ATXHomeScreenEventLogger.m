@implementation ATXHomeScreenEventLogger

void __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke_cold_1(a1, v2);

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPageIndex:", v4);

  objc_msgSend(v3, "setStacks:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "blendingCacheId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v6, 1, 0, 0, 0, 0, 0, v7, v3);

}

- (void)_sendEventToBiomeWithDate:(id)a3 eventType:(int)a4 stackIdentifier:(id)a5 stackKind:(unint64_t)a6 stackLocation:(unint64_t)a7 reason:(id)a8 widget:(id)a9 blendingCacheIdentifier:(id)a10 metadata:(id)a11
{
  uint64_t v15;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  __CFString *v22;
  void *v23;
  ATXUniversalBiomeUIStream *biomeUIStream;
  void *v25;
  id v26;

  v15 = *(_QWORD *)&a4;
  v26 = a3;
  v17 = a5;
  v18 = a8;
  v19 = a9;
  v20 = a10;
  v21 = a11;
  if (v15 >= 0x17)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v15);
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v22 = off_1E4D5AFA8[(int)v15];
  }
  -[ATXHomeScreenEventLogger _homeScreenEventWithDate:eventTypeString:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:](self, "_homeScreenEventWithDate:eventTypeString:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v26, v22, v17, a6, a7, v18, v19, v20, v21);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  biomeUIStream = self->_biomeUIStream;
  +[ATXUIEvent uiEventWithHomeScreenEvent:](ATXUIEvent, "uiEventWithHomeScreenEvent:", v23);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXUniversalBiomeUIStream donateGenericUIEvent:](biomeUIStream, "donateGenericUIEvent:", v25);

}

- (id)_homeScreenEventWithDate:(id)a3 eventTypeString:(id)a4 stackIdentifier:(id)a5 stackKind:(unint64_t)a6 stackLocation:(unint64_t)a7 reason:(id)a8 widget:(id)a9 blendingCacheIdentifier:(id)a10 metadata:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  id v33;

  v17 = a9;
  v33 = a10;
  v18 = a11;
  v19 = a8;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setDate:", v22);

  objc_msgSend(v23, "setEventTypeString:", v21);
  objc_msgSend(v23, "setStackId:", v20);

  objc_msgSend(v23, "setStackKind:", a6);
  objc_msgSend(v23, "setStackLocation:", a7);
  objc_msgSend(v23, "setReason:", v19);

  if (v17)
  {
    objc_msgSend(v17, "extensionBundleId");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWidgetBundleId:", v24);

    objc_msgSend(v17, "intent");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "intentDescription");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    if (v26)
    {
      objc_msgSend(v23, "setIntentDescription:", v26);
    }
    else
    {
      objc_msgSend(v17, "intent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "description");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setIntentDescription:", v28);

    }
    objc_msgSend(v17, "widgetUniqueId");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWidgetUniqueId:", v29);

    objc_msgSend(v17, "widgetKind");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setWidgetKind:", v30);

    objc_msgSend(v23, "setWidgetSize:", objc_msgSend(v17, "size"));
    objc_msgSend(v17, "appBundleId");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAppBundleId:", v31);

    objc_msgSend(v23, "setIsSuggestedWidget:", objc_msgSend(v17, "isSuggestedWidget"));
  }
  objc_msgSend(v23, "setBlendingCacheId:", v33);
  objc_msgSend(v23, "setMetadata:", v18);

  return v23;
}

- (void)logHomeScreenPageDidAppear:(unint64_t)a3 topWidgetsByStackIdentifier:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATXHomeScreenEventLogger *v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke;
  v13[3] = &unk_1E4D594B0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __69__ATXHomeScreenEventLogger_logWidgetDidDisappear_stackId_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "widgetUniqueId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v18 = "-[ATXHomeScreenEventLogger logWidgetDidDisappear:stackId:prediction:]_block_invoke";
    v19 = 2114;
    v20 = v4;
    v21 = 2112;
    v22 = v3;
    v23 = 2114;
    v24 = v5;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: stackID: %{public}@ topWidget: %@ (widgetID %{public}@)", buf, 0x2Au);

  }
  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "_stackKindGivenWidgetUniqueId:", v10);
  v12 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "_stackLocationGivenWidgetUniqueId:", v13);
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "blendingCacheId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v7, 15, v9, v11, v14, 0, v15, v16, 0);

}

- (void)logWidgetDidDisappear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ATXHomeScreenEventLogger *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__ATXHomeScreenEventLogger_logWidgetDidDisappear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

- (unint64_t)_stackLocationGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5
{
  id v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;

  v7 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v7, "objectForKeyedSubscript:", v8), (v9 = (_QWORD *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9[2];

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_stackLocationGivenWidgetUniqueId:(id)a3
{
  return -[ATXHomeScreenEventLogger _stackLocationGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:](self, "_stackLocationGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", a3, self->_stackIdToCachedStackData, self->_widgetIdToStackId);
}

- (unint64_t)_stackKindGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5
{
  id v7;
  void *v8;
  _QWORD *v9;
  unint64_t v10;

  v7 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8
    && (objc_msgSend(v7, "objectForKeyedSubscript:", v8), (v9 = (_QWORD *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = v9[1];

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (unint64_t)_stackKindGivenWidgetUniqueId:(id)a3
{
  return -[ATXHomeScreenEventLogger _stackKindGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:](self, "_stackKindGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", a3, self->_stackIdToCachedStackData, self->_widgetIdToStackId);
}

- (ATXHomeScreenEventLogger)initWithHomeScreenConfigCache:(id)a3 biomeUIStream:(id)a4 PETEventTracker:(id)a5 defaults:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  ATXHomeScreenEventLogger *v15;
  ATXHomeScreenEventLogger *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  BMStream *discoverabilitySignalsStream;
  NSObject *v21;
  dispatch_queue_t v22;
  OS_dispatch_queue *queue;
  uint64_t v24;
  NSMutableDictionary *widgetIdToStackId;
  uint64_t v26;
  NSMutableDictionary *stackIdToCachedStackData;
  uint64_t v28;
  NSMutableDictionary *bundleIdToSBPageNumber;
  uint64_t v30;
  NSSet *dockAppSet;
  id v32;
  OS_dispatch_queue *v33;
  uint64_t v34;
  ATXHomeScreenEventLogger *v35;
  uint64_t v36;
  _PASSimpleCoalescingTimer *coalescedConfigDiffOperation;
  NSObject *v38;
  _QWORD block[4];
  ATXHomeScreenEventLogger *v41;
  id v42;
  _QWORD v43[4];
  ATXHomeScreenEventLogger *v44;
  objc_super v45;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v45.receiver = self;
  v45.super_class = (Class)ATXHomeScreenEventLogger;
  v15 = -[ATXHomeScreenEventLogger init](&v45, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_homeScreenConfigCache, a3);
    objc_storeStrong((id *)&v16->_biomeUIStream, a4);
    BiomeLibrary();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "Discoverability");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "Signals");
    v19 = objc_claimAutoreleasedReturnValue();
    discoverabilitySignalsStream = v16->_discoverabilitySignalsStream;
    v16->_discoverabilitySignalsStream = (BMStream *)v19;

    objc_storeStrong((id *)&v16->_tracker, a5);
    objc_storeStrong((id *)&v16->_defaults, a6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = dispatch_queue_create("com.apple.proactive.ATXHomeScreenEventLogger", v21);
    queue = v16->_queue;
    v16->_queue = (OS_dispatch_queue *)v22;

    v24 = objc_opt_new();
    widgetIdToStackId = v16->_widgetIdToStackId;
    v16->_widgetIdToStackId = (NSMutableDictionary *)v24;

    v26 = objc_opt_new();
    stackIdToCachedStackData = v16->_stackIdToCachedStackData;
    v16->_stackIdToCachedStackData = (NSMutableDictionary *)v26;

    v28 = objc_opt_new();
    bundleIdToSBPageNumber = v16->_bundleIdToSBPageNumber;
    v16->_bundleIdToSBPageNumber = (NSMutableDictionary *)v28;

    v30 = objc_opt_new();
    dockAppSet = v16->_dockAppSet;
    v16->_dockAppSet = (NSSet *)v30;

    v32 = objc_alloc(MEMORY[0x1E0D81618]);
    v33 = v16->_queue;
    v34 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke;
    v43[3] = &unk_1E4D57590;
    v35 = v16;
    v44 = v35;
    v36 = objc_msgSend(v32, "initWithQueue:operation:", v33, v43);
    coalescedConfigDiffOperation = v35->_coalescedConfigDiffOperation;
    v35->_coalescedConfigDiffOperation = (_PASSimpleCoalescingTimer *)v36;

    v38 = v16->_queue;
    block[0] = v34;
    block[1] = 3221225472;
    block[2] = __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2;
    block[3] = &unk_1E4D57258;
    v41 = v35;
    v42 = v11;
    dispatch_async(v38, block);

  }
  return v16;
}

uint64_t __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateCurrentConfigurationsAndLogDiff");
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  _QWORD *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  id v23;

  v2 = *(void **)(a1 + 40);
  v23 = 0;
  objc_msgSend(v2, "loadHomeScreenAndTodayPageConfigurationsWithError:", &v23);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v23;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(v5 + 24);
  *(_QWORD *)(v5 + 24) = v3;

  if (v4)
  {
    __atxlog_handle_home_screen();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_4();

  }
  if (!*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24))
  {
    __atxlog_handle_home_screen();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_3();

    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 24);
    *(_QWORD *)(v9 + 24) = MEMORY[0x1E0C9AA60];

  }
  v11 = *(void **)(a1 + 40);
  v22 = 0;
  objc_msgSend(v11, "loadDockAppListWithError:", &v22);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = v22;
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 56);
  *(_QWORD *)(v14 + 56) = v12;

  if (v13)
  {
    __atxlog_handle_home_screen();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_2();

  }
  v17 = *(_QWORD **)(a1 + 32);
  if (!v17[7])
  {
    __atxlog_handle_home_screen();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_1();

    v19 = objc_opt_new();
    v20 = *(_QWORD *)(a1 + 32);
    v21 = *(void **)(v20 + 56);
    *(_QWORD *)(v20 + 56) = v19;

    v17 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v17, "_populateCachedIconState:", v17[3]);
  objc_msgSend(*(id *)(a1 + 32), "_populateStackKindAndLocation:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

}

- (void)homeScreenOrTodayPageConfigDidChange
{
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedConfigDiffOperation, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
}

- (void)dockAppListDidChange
{
  -[_PASSimpleCoalescingTimer runAfterDelaySeconds:coalescingBehavior:](self->_coalescedConfigDiffOperation, "runAfterDelaySeconds:coalescingBehavior:", 0, 1.0);
}

- (void)notifySuggestedWidgetsToStacksChanged:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__ATXHomeScreenEventLogger_notifySuggestedWidgetsToStacksChanged___block_invoke;
  v7[3] = &unk_1E4D57258;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __66__ATXHomeScreenEventLogger_notifySuggestedWidgetsToStacksChanged___block_invoke(uint64_t a1)
{
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "count") >= 0xC9)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addEntriesFromDictionary:", *(_QWORD *)(a1 + 40));
}

- (void)_populateCachedIconState:(id)a3
{
  NSMutableDictionary *bundleIdToSBPageNumber;
  id v5;
  _QWORD v6[5];

  bundleIdToSBPageNumber = self->_bundleIdToSBPageNumber;
  v5 = a3;
  -[NSMutableDictionary removeAllObjects](bundleIdToSBPageNumber, "removeAllObjects");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke;
  v6[3] = &unk_1E4D5AE50;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

}

void __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD v5[5];
  id v6;

  v3 = a2;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke_2;
  v5[3] = &unk_1E4D5A510;
  v5[4] = *(_QWORD *)(a1 + 32);
  v6 = v3;
  v4 = v3;
  objc_msgSend(v4, "enumerateApps:", v5);

}

void __53__ATXHomeScreenEventLogger__populateCachedIconState___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(a1 + 40);
  v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "pageIndex"));
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  objc_msgSend(v5, "bundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, v7);
}

- (void)_populateStackKindAndLocation:(id)a3
{
  id v4;
  uint64_t v5;
  NSUserDefaults *defaults;
  void *v7;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v4 = a3;
  -[NSMutableDictionary removeAllObjects](self->_stackIdToCachedStackData, "removeAllObjects");
  *(_DWORD *)&self->_hasAppPanelOnHomeScreen = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__ATXHomeScreenEventLogger__populateStackKindAndLocation___block_invoke;
  v8[3] = &unk_1E4D5AE78;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v8);
  if (*((_BYTE *)v10 + 24))
  {
    v5 = *MEMORY[0x1E0CF9530];
    if (!-[NSUserDefaults BOOLForKey:](self->_defaults, "BOOLForKey:", *MEMORY[0x1E0CF9530]))
    {
      -[NSUserDefaults setBool:forKey:](self->_defaults, "setBool:forKey:", 1, v5);
      defaults = self->_defaults;
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSUserDefaults setObject:forKey:](defaults, "setObject:forKey:", v7, *MEMORY[0x1E0CF9528]);

    }
  }
  _Block_object_dispose(&v9, 8);

}

void __58__ATXHomeScreenEventLogger__populateStackKindAndLocation___block_invoke(uint64_t a1, void *a2, unint64_t a3)
{
  id v5;
  uint64_t i;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t k;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  _QWORD *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  void *v50;
  id obj;
  id obja;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _BYTE v77[128];
  _BYTE v78[128];
  _BYTE v79[128];
  _BYTE v80[128];
  uint64_t v81;

  v81 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v59 = ATXStackLocationForPageAndIndex(v5, a3);
  v60 = v5;
  v73 = 0u;
  v74 = 0u;
  v75 = 0u;
  v76 = 0u;
  objc_msgSend(v5, "stacks");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
  if (v55)
  {
    v53 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v55; ++i)
      {
        if (*(_QWORD *)v74 != v53)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        objc_msgSend(v7, "widgets");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "count"))
        {
          v9 = objc_msgSend(v60, "pageIndex");

          if (v9 != 20000)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            if (objc_msgSend(v60, "containsSuggestionsWidget"))
              *(_BYTE *)(*(_QWORD *)(a1 + 32) + 66) = 1;
          }
        }
        else
        {

        }
        objc_msgSend(v7, "widgets");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v10, "count"))
        {
          v11 = objc_msgSend(v60, "pageIndex");

          if (v11 == 20000 && objc_msgSend(v60, "containsSuggestionsWidget"))
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 67) = 1;
        }
        else
        {

        }
        v57 = ATXStackKindForStack(v7);
        v69 = 0u;
        v70 = 0u;
        v71 = 0u;
        v72 = 0u;
        objc_msgSend(v7, "widgets");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v70;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v70 != v15)
                objc_enumerationMutation(v12);
              v17 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * j);
              objc_msgSend(v7, "identifier");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              v19 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
              objc_msgSend(v17, "widgetUniqueId");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "setObject:forKeyedSubscript:", v18, v20);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v69, v79, 16);
          }
          while (v14);
        }

        v21 = (_QWORD *)objc_opt_new();
        v21[1] = v57;
        v21[2] = v59;
        objc_msgSend(v7, "identifier");
        v22 = objc_claimAutoreleasedReturnValue();
        v23 = (void *)v21[3];
        v21[3] = v22;

        v21[4] = objc_msgSend(v60, "pageIndex");
        v24 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
        objc_msgSend(v7, "identifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v21, v25);

      }
      v55 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v80, 16);
    }
    while (v55);
  }

  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v60, "panels");
  obja = (id)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
  if (v56)
  {
    v54 = *(_QWORD *)v66;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v66 != v54)
          objc_enumerationMutation(obja);
        v27 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v26);
        objc_msgSend(v27, "widgets");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v28, "count"))
        {
          v29 = objc_msgSend(v60, "pageIndex");

          if (v29 != 20000)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 64) = 1;
          }
        }
        else
        {

        }
        objc_msgSend(v27, "widgets");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = v26;
        if (objc_msgSend(v30, "count"))
        {
          v31 = objc_msgSend(v60, "pageIndex");

          if (v31 == 20000)
            *(_BYTE *)(*(_QWORD *)(a1 + 32) + 65) = 1;
        }
        else
        {

        }
        v63 = 0u;
        v64 = 0u;
        v61 = 0u;
        v62 = 0u;
        objc_msgSend(v27, "widgets");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
        if (v33)
        {
          v34 = v33;
          v35 = *(_QWORD *)v62;
          do
          {
            for (k = 0; k != v34; ++k)
            {
              if (*(_QWORD *)v62 != v35)
                objc_enumerationMutation(v32);
              v37 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * k);
              objc_msgSend(v37, "extensionBundleId");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              v39 = objc_msgSend(v38, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

              if (v39)
              {
                objc_msgSend(v27, "identifier");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                v41 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
                objc_msgSend(v37, "widgetUniqueId");
                v42 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v41, "setObject:forKeyedSubscript:", v40, v42);

                objc_msgSend(v27, "identifier");
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                v44 = *(void **)(*(_QWORD *)(a1 + 32) + 32);
                objc_msgSend(v27, "identifier");
                v45 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v44, "setObject:forKeyedSubscript:", v43, v45);

                v46 = (_QWORD *)objc_opt_new();
                v46[1] = 1;
                v46[2] = v59;
                objc_msgSend(v27, "identifier");
                v47 = objc_claimAutoreleasedReturnValue();
                v48 = (void *)v46[3];
                v46[3] = v47;

                v46[4] = objc_msgSend(v60, "pageIndex");
                v49 = *(void **)(*(_QWORD *)(a1 + 32) + 40);
                objc_msgSend(v27, "identifier");
                v50 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v49, "setObject:forKeyedSubscript:", v46, v50);

              }
            }
            v34 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v61, v77, 16);
          }
          while (v34);
        }

        v26 = v58 + 1;
      }
      while (v58 + 1 != v56);
      v56 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v65, v78, 16);
    }
    while (v56);
  }

}

- (void)_updateCurrentConfigurationsAndLogDiff
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "ATXHomeScreenEventLogger: Could not load initial home screen and today page configurations: %@", v2);
  OUTLINED_FUNCTION_2();
}

void __66__ATXHomeScreenEventLogger__updateCurrentConfigurationsAndLogDiff__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t m;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t n;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD *v50;
  uint64_t v51;
  NSObject *v52;
  void *v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t ii;
  void *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t jj;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t kk;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  uint64_t v87;
  void *v88;
  void *v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t mm;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  uint64_t v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  uint64_t v105;
  void *v106;
  void *v107;
  NSObject *v108;
  void *v109;
  const char *v110;
  void *v111;
  BOOL v112;
  void *obj;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  _BYTE v150[128];
  _BYTE v151[128];
  _BYTE v152[5];
  uint8_t v153[128];
  uint8_t buf[4];
  void *v155;
  _BYTE v156[128];
  _BYTE v157[128];
  _BYTE v158[128];
  _BYTE v159[128];
  _BYTE v160[128];
  uint64_t v161;

  v161 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    __atxlog_handle_home_screen();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __66__ATXHomeScreenEventLogger__updateCurrentConfigurationsAndLogDiff__block_invoke_cold_1();

  }
  v148 = 0u;
  v149 = 0u;
  v146 = 0u;
  v147 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "addedApps", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v147;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v147 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v146 + 1) + 8 * i);
        v11 = *(void **)(a1 + 40);
        objc_msgSend(v10, "page");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "logUserDidAddApp:page:", v10, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v146, v160, 16);
    }
    while (v7);
  }

  v144 = 0u;
  v145 = 0u;
  v142 = 0u;
  v143 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "removedApps");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v143;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v143 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v142 + 1) + 8 * j);
        v19 = *(void **)(a1 + 40);
        objc_msgSend(v18, "page");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "logUserDidRemoveApp:page:", v18, v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v142, v159, 16);
    }
    while (v15);
  }

  v140 = 0u;
  v141 = 0u;
  v138 = 0u;
  v139 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "addedPinnedWidgets");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
  v112 = v22 != 0;
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v139;
    do
    {
      for (k = 0; k != v23; ++k)
      {
        if (*(_QWORD *)v139 != v24)
          objc_enumerationMutation(v21);
        v26 = *(void **)(*((_QWORD *)&v138 + 1) + 8 * k);
        v27 = *(void **)(a1 + 40);
        objc_msgSend(v26, "page");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "logUserDidAddPinnedWidget:page:defaultsComparator:", v26, v28, *(_QWORD *)(a1 + 48));

      }
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v138, v158, 16);
    }
    while (v23);
  }

  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "widgetsAddedToStacksByUser");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
  if (v30)
  {
    v31 = v30;
    v32 = *(_QWORD *)v135;
    do
    {
      for (m = 0; m != v31; ++m)
      {
        if (*(_QWORD *)v135 != v32)
          objc_enumerationMutation(v29);
        v34 = *(void **)(*((_QWORD *)&v134 + 1) + 8 * m);
        v35 = objc_msgSend(*(id *)(a1 + 48), "rankOfWidgetSuggestedInGallery:", v34);
        objc_msgSend(v34, "widgetUniqueId");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        if (v36)
        {
          objc_msgSend(*(id *)(a1 + 32), "stackInCurrentConfigurationsForStackedWidget:", v34);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "identifier");
          v38 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 40), "logUserDidAddWidgetToStack:stackIdentifier:isSuggestion:", v34, v38, v35 != 0);
        }
      }
      v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v134, v157, 16);
    }
    while (v31);
    v112 = 1;
  }

  v132 = 0u;
  v133 = 0u;
  v130 = 0u;
  v131 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "suggestedWidgetsAddedPermanentlyByUser");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v130, v156, 16);
  if (v40)
  {
    v41 = v40;
    v42 = *(_QWORD *)v131;
    do
    {
      for (n = 0; n != v41; ++n)
      {
        if (*(_QWORD *)v131 != v42)
          objc_enumerationMutation(v39);
        v44 = *(void **)(*((_QWORD *)&v130 + 1) + 8 * n);
        objc_msgSend(v44, "widgetUniqueId");
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (v45)
        {
          v46 = *(void **)(a1 + 56);
          v47 = *(void **)(a1 + 64);
          objc_msgSend(v44, "widgetUniqueId");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "objectForKeyedSubscript:", v48);
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "objectForKeyedSubscript:", v49);
          v50 = (_QWORD *)objc_claimAutoreleasedReturnValue();

          if (v50 && (v51 = v50[3]) != 0)
          {
            objc_msgSend(*(id *)(a1 + 40), "_logSupplementaryActionInContextMenu:stackId:widget:prediction:", 3, v51, v44, 0);
          }
          else
          {
            __atxlog_handle_home_screen();
            v52 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v155 = v44;
              _os_log_error_impl(&dword_1A49EF000, v52, OS_LOG_TYPE_ERROR, "ATXHomeScreenEventLogger: Unable to emit 'Add To Stack' event for previously suggested widget %@, due to unkown stackId.", buf, 0xCu);
            }

          }
        }
      }
      v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v130, v156, 16);
    }
    while (v41);
  }

  v128 = 0u;
  v129 = 0u;
  v126 = 0u;
  v127 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "addedStacks");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v126, v153, 16);
  v55 = v112;
  if (v54)
  {
    v56 = v54;
    v57 = *(_QWORD *)v127;
    do
    {
      for (ii = 0; ii != v56; ++ii)
      {
        if (*(_QWORD *)v127 != v57)
          objc_enumerationMutation(v53);
        v59 = *(void **)(*((_QWORD *)&v126 + 1) + 8 * ii);
        v60 = objc_msgSend(*(id *)(a1 + 48), "isStackDefaultStack:", v59);
        v61 = *(void **)(a1 + 40);
        objc_msgSend(v59, "page");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v61, "logUserDidCreateStack:page:isSuggestion:", v59, v62, v60);

      }
      v56 = objc_msgSend(v53, "countByEnumeratingWithState:objects:count:", &v126, v153, 16);
    }
    while (v56);
    v55 = 1;
  }

  v124 = 0u;
  v125 = 0u;
  v122 = 0u;
  v123 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "deletedPinnedWidgets");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
  if (v64)
  {
    v65 = v64;
    v66 = *(_QWORD *)v123;
    do
    {
      for (jj = 0; jj != v65; ++jj)
      {
        if (*(_QWORD *)v123 != v66)
          objc_enumerationMutation(v63);
        v68 = *(void **)(*((_QWORD *)&v122 + 1) + 8 * jj);
        v69 = *(void **)(a1 + 40);
        objc_msgSend(v68, "widgetUniqueId");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        v71 = objc_msgSend(v69, "_stackLocationGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", v70, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

        v72 = *(void **)(a1 + 40);
        objc_msgSend(v68, "page");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "logUserDidDeletePinnedWidget:stackLocation:page:", v68, v71, v73);

        objc_msgSend(*(id *)(a1 + 40), "_logRemovalDateOfDefaultTVWidgetIfApplicable:configDiffer:", v68, *(_QWORD *)(a1 + 32));
      }
      v65 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v122, v152, 16);
    }
    while (v65);
    v55 = 1;
  }

  v120 = 0u;
  v121 = 0u;
  v118 = 0u;
  v119 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "widgetsDeletedFromStacksByUser");
  v74 = (void *)objc_claimAutoreleasedReturnValue();
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
  if (v75)
  {
    v76 = v75;
    v77 = *(_QWORD *)v119;
    do
    {
      for (kk = 0; kk != v76; ++kk)
      {
        if (*(_QWORD *)v119 != v77)
          objc_enumerationMutation(v74);
        v79 = *(void **)(*((_QWORD *)&v118 + 1) + 8 * kk);
        objc_msgSend(*(id *)(a1 + 32), "stackInPreviousConfigurationsForStackedWidget:", v79);
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v80, "identifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();

        v82 = *(void **)(a1 + 40);
        objc_msgSend(v79, "widgetUniqueId");
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        v84 = objc_msgSend(v82, "_stackKindGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", v83, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

        v85 = *(void **)(a1 + 40);
        objc_msgSend(v79, "widgetUniqueId");
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v87 = objc_msgSend(v85, "_stackLocationGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", v86, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

        objc_msgSend(*(id *)(a1 + 40), "logUserDidDeleteWidgetOnStack:stackIdentifier:stackKind:stackLocation:", v79, v81, v84, v87);
        objc_msgSend(*(id *)(a1 + 40), "_logRemovalDateOfDefaultTVWidgetIfApplicable:configDiffer:", v79, *(_QWORD *)(a1 + 32));

      }
      v76 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v118, v151, 16);
    }
    while (v76);
    v55 = 1;
  }

  v88 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "suggestedWidgetsRemoved");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v88, "_handleRemovedSuggestedWidgetsIfNecessary:", v89);

  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "deletedStacks");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v91 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v114, v150, 16);
  if (v91)
  {
    v92 = v91;
    v93 = *(_QWORD *)v115;
    obj = v90;
    do
    {
      for (mm = 0; mm != v92; ++mm)
      {
        if (*(_QWORD *)v115 != v93)
          objc_enumerationMutation(obj);
        v95 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * mm);
        v96 = *(void **)(a1 + 40);
        objc_msgSend(v95, "widgets");
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v97, "firstObject");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "widgetUniqueId");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = objc_msgSend(v96, "_stackKindGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", v99, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

        v101 = *(void **)(a1 + 40);
        objc_msgSend(v95, "widgets");
        v102 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v102, "firstObject");
        v103 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v103, "widgetUniqueId");
        v104 = (void *)objc_claimAutoreleasedReturnValue();
        v105 = objc_msgSend(v101, "_stackLocationGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", v104, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));

        v106 = *(void **)(a1 + 40);
        objc_msgSend(v95, "page");
        v107 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v106, "logUserDidDeleteStack:stackKind:stackLocation:page:", v95, v100, v105, v107);

      }
      v92 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v150, 16);
    }
    while (v92);

  }
  else
  {

    if ((v55 & 1) == 0)
    {
      __atxlog_handle_home_screen();
      v108 = objc_claimAutoreleasedReturnValue();
      v109 = v111;
      if (!os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
        goto LABEL_87;
      *(_WORD *)buf = 0;
      v110 = "ATXHomeScreenEventLogger: No widget or stack changes, not updating default home screen items";
      goto LABEL_86;
    }
  }
  notify_post((const char *)objc_msgSend(CFSTR("com.apple.duetexpertd.updateDefaultsDueToRelevantHomeScreenConfigUpdate"), "UTF8String"));
  __atxlog_handle_home_screen();
  v108 = objc_claimAutoreleasedReturnValue();
  v109 = v111;
  if (os_log_type_enabled(v108, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    v110 = "ATXHomeScreenEventLogger: Widgets or stacks changed, updating default home screen items";
LABEL_86:
    _os_log_impl(&dword_1A49EF000, v108, OS_LOG_TYPE_DEFAULT, v110, buf, 2u);
  }
LABEL_87:

}

- (void)_logRemovalDateOfDefaultTVWidgetIfApplicable:(id)a3 configDiffer:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSUserDefaults *defaults;
  id v16;

  v16 = a3;
  v6 = a4;
  if (!objc_msgSend(MEMORY[0x1E0D81588], "isiPad"))
    goto LABEL_10;
  objc_msgSend(v16, "extensionBundleId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isEqualToString:", CFSTR("com.apple.tv.TVWidgetExtension")) & 1) == 0)
  {
LABEL_9:

    goto LABEL_10;
  }
  objc_msgSend(v16, "widgetKind");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("com.apple.tv")) & 1) == 0)
  {

    goto LABEL_9;
  }
  v9 = objc_msgSend(v16, "size");

  if (v9 == 4
    && (-[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", *MEMORY[0x1E0CF9438]) & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v10 = *MEMORY[0x1E0CF9430];
    -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", *MEMORY[0x1E0CF9430]);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {

    }
    else
    {
      objc_msgSend(v16, "extensionBundleId");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "widgetKind");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v6, "currentConfigContainsWidgetWithBundleId:kind:size:", v12, v13, objc_msgSend(v16, "size"));

      if ((v14 & 1) == 0)
      {
        defaults = self->_defaults;
        objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
        -[NSUserDefaults setDouble:forKey:](defaults, "setDouble:forKey:", v10);
      }
    }
  }
LABEL_10:

}

- (void)_handleRemovedSuggestedWidgetsIfNecessary:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSInteger v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  ATXHomeScreenEventLoggerDelegate **p_delegate;
  uint64_t v14;
  uint64_t v15;
  id WeakRetained;
  int v17;
  id v18;
  unsigned int v19;
  uint64_t v20;
  uint64_t v21;
  ATXHomeScreenEventLogger *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "_pas_filteredArrayWithTest:", &__block_literal_global_68);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v5 = *MEMORY[0x1E0CF9570];
    v6 = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:", *MEMORY[0x1E0CF9570]);
    if (v6 <= 9)
    {
      v7 = v6;
      v21 = v5;
      v20 = *MEMORY[0x1E0CF9578];
      v8 = -[NSUserDefaults integerForKey:](self->_defaults, "integerForKey:");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v23 = v4;
      v9 = v4;
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v22 = self;
      if (v10)
      {
        v11 = v10;
        v12 = *(_QWORD *)v25;
        p_delegate = &self->_delegate;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v25 != v12)
              objc_enumerationMutation(v9);
            v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14);
            WeakRetained = objc_loadWeakRetained((id *)p_delegate);
            v17 = objc_msgSend(WeakRetained, "hasWidgetBeenSeen:", v15);

            if (v17)
            {
              ++v7;
              v18 = objc_loadWeakRetained((id *)p_delegate);
              v19 = objc_msgSend(v18, "hasWidgetBeenTapped:", v15);

              v8 += v19;
            }
            ++v14;
          }
          while (v11 != v14);
          v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
        }
        while (v11);
      }

      -[NSUserDefaults setInteger:forKey:](v22->_defaults, "setInteger:forKey:", v7, v21);
      -[NSUserDefaults setInteger:forKey:](v22->_defaults, "setInteger:forKey:", v8, v20);
      v4 = v23;
    }
  }

}

uint64_t __70__ATXHomeScreenEventLogger__handleRemovedSuggestedWidgetsIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "extensionBundleId");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  return v3;
}

- (id)_pageIndexGivenWidgetUniqueId:(id)a3
{
  return -[ATXHomeScreenEventLogger _pageIndexGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:](self, "_pageIndexGivenWidgetUniqueId:stackIdToStackDataDictionary:widgetIdToStackIdDictionary:", a3, self->_stackIdToCachedStackData, self->_widgetIdToStackId);
}

- (id)_pageIndexGivenWidgetUniqueId:(id)a3 stackIdToStackDataDictionary:(id)a4 widgetIdToStackIdDictionary:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  v7 = a4;
  objc_msgSend(a5, "objectForKeyedSubscript:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && (objc_msgSend(v7, "objectForKeyedSubscript:", v8), (v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v10 = (void *)v9;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(v9 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)_stackIdentifierGivenWidgetUniqueId:(id)a3
{
  return -[ATXHomeScreenEventLogger _stackIdentifierGivenWidgetUniqueId:widgetIdToStackIdDictionary:](self, "_stackIdentifierGivenWidgetUniqueId:widgetIdToStackIdDictionary:", a3, self->_widgetIdToStackId);
}

- (id)_stackIdentifierGivenWidgetUniqueId:(id)a3 widgetIdToStackIdDictionary:(id)a4
{
  return (id)objc_msgSend(a4, "objectForKeyedSubscript:", a3);
}

- (void)_logProactiveWidgetEvent:(int)a3 suggestionIdentifiers:(id)a4 widget:(id)a5 blendingCacheId:(id)a6 date:(id)a7
{
  uint64_t v10;
  id v12;
  id v13;
  id v14;
  __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  unint64_t v19;
  void *v20;
  void *v21;
  ATXUniversalBiomeUIStream *biomeUIStream;
  void *v23;
  id v24;

  v10 = *(_QWORD *)&a3;
  v24 = a4;
  v12 = a5;
  v13 = a6;
  v14 = a7;
  if (v13)
  {
    if (v10 >= 0xA)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v15 = off_1E4D5B060[(int)v10];
    }
    objc_msgSend(v12, "widgetUniqueId");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenEventLogger _stackIdentifierGivenWidgetUniqueId:](self, "_stackIdentifierGivenWidgetUniqueId:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "widgetUniqueId");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[ATXHomeScreenEventLogger _stackKindGivenWidgetUniqueId:](self, "_stackKindGivenWidgetUniqueId:", v18);
    objc_msgSend(v12, "widgetUniqueId");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenEventLogger _homeScreenEventWithDate:eventTypeString:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:](self, "_homeScreenEventWithDate:eventTypeString:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v14, v15, v17, v19, -[ATXHomeScreenEventLogger _stackLocationGivenWidgetUniqueId:](self, "_stackLocationGivenWidgetUniqueId:", v20), 0, v12, v13, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "setSuggestionIds:", v24);
    biomeUIStream = self->_biomeUIStream;
    +[ATXUIEvent uiEventWithHomeScreenEvent:](ATXUIEvent, "uiEventWithHomeScreenEvent:", v21);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXUniversalBiomeUIStream donateGenericUIEvent:](biomeUIStream, "donateGenericUIEvent:", v23);

  }
}

- (void)_logCaptureRateForAppPredictionPanelWithEngagedSuggestion:(id)a3 isSuggestionsWidget:(BOOL)a4 widgetIdentifier:(id)a5
{
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  ATXPETEventTracker2Protocol *tracker;
  uint64_t v12;
  id v13;

  v6 = a4;
  v13 = a3;
  v8 = a5;
  if (self->_hasAppPanelOnHomeScreen)
  {
    objc_msgSend(v13, "executableSpecification");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "executableType");

    if (!ATXStackLocationIsTodayPage(-[ATXHomeScreenEventLogger _stackLocationGivenWidgetUniqueId:](self, "_stackLocationGivenWidgetUniqueId:", v8)))
    {
      if (v6)
      {
        if (v10 == 2)
        {
          tracker = self->_tracker;
          v12 = 5001;
          goto LABEL_9;
        }
        if (v10 == 1)
        {
          tracker = self->_tracker;
          v12 = 5003;
LABEL_9:
          +[ATXBlendingCaptureRateTracker logHomeScreenDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logHomeScreenDiversionWithCaptureType:tracker:", v12, tracker);
        }
      }
      else
      {
        +[ATXBlendingCaptureRateTracker logHomeScreenCaptureWithTracker:](ATXBlendingCaptureRateTracker, "logHomeScreenCaptureWithTracker:", self->_tracker);
      }
    }
  }

}

- (void)_logCaptureRateDiversionIfAppPredictionPanelExistsWithTappedWidget:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "widgetUniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v10, "extensionBundleId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0CF9480]))
    {

    }
    else
    {
      objc_msgSend(v10, "extensionBundleId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

      if ((v7 & 1) == 0)
      {
        objc_msgSend(v10, "widgetUniqueId");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = -[ATXHomeScreenEventLogger _stackLocationGivenWidgetUniqueId:](self, "_stackLocationGivenWidgetUniqueId:", v8);

        if (self->_hasAppPanelOnHomeScreen && !ATXStackLocationIsTodayPage(v9))
          +[ATXBlendingCaptureRateTracker logHomeScreenDiversionWithCaptureType:tracker:](ATXBlendingCaptureRateTracker, "logHomeScreenDiversionWithCaptureType:tracker:", 5002, self->_tracker);
      }
    }
  }

}

- (void)_logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:(id)a3 suggestion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  int v11;
  BOOL v12;
  unsigned int v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSObject *v29;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "widgetUniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ATXHomeScreenEventLogger _stackLocationGivenWidgetUniqueId:](self, "_stackLocationGivenWidgetUniqueId:", v8);

  objc_msgSend(v6, "extensionBundleId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  if (v11)
  {
    v12 = !ATXStackLocationIsTodayPage(v9);
    v13 = 8;
  }
  else
  {
    objc_msgSend(v6, "extensionBundleId");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

    if (!v15)
      goto LABEL_21;
    v12 = !ATXStackLocationIsTodayPage(v9);
    v13 = 6;
  }
  if (v12)
    v16 = v13;
  else
    v16 = v13 + 1;
  objc_msgSend(v7, "bundleIdExecutableObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v17
    || (objc_msgSend(v7, "atxActionExecutableObject"),
        v18 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v18, "bundleId"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18,
        v17))
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_bundleIdToSBPageNumber, "objectForKeyedSubscript:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    if (v19)
    {
      v21 = objc_msgSend(v19, "unsignedIntegerValue");
      if (v21 >= 6)
        v22 = 8;
      else
        v22 = (v21 + 2);
    }
    else
    {
      v22 = -[NSSet containsObject:](self->_dockAppSet, "containsObject:", v17);
    }
    v23 = (void *)objc_opt_new();
    objc_msgSend(v23, "setCaptureType:", v16);
    objc_msgSend(v23, "setIconLocation:", v22);
    v24 = (void *)CFPreferencesCopyValue(CFSTR("SBSearchDisabledDomains"), CFSTR("com.apple.spotlightui"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    v25 = objc_msgSend(v24, "containsObject:", CFSTR("DOMAIN_ZKWS")) ^ 1;

    objc_msgSend(v23, "setSpotlightEnabled:", v25);
    v26 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsAppLibraryEnabled"), CFSTR("com.apple.suggestions"));
    v27 = v26;
    if (v26)
      v28 = objc_msgSend(v26, "BOOLValue");
    else
      v28 = 1;

    objc_msgSend(v23, "setAppLibraryEnabled:", v28);
    objc_msgSend(v23, "setAppPredictionPanelTodayEnabled:", self->_hasAppPanelOnLoH);
    objc_msgSend(v23, "setAppPredictionPanelEnabled:", self->_hasAppPanelOnHomeScreen);
    objc_msgSend(v23, "setSuggestionsWidgetEnabled:", self->_hasSuggestionWidgetOnHomeScreen);
    objc_msgSend(v23, "setSuggestionsWidgetTodayEnabled:", self->_hasSuggestionWidgetOnLoH);
    -[ATXPETEventTracker2Protocol trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v23);
    __atxlog_handle_metrics();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[ATXHomeScreenEventLogger _logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:suggestion:].cold.1((uint64_t)self, v23, v29);

  }
LABEL_21:

}

- (void)_logAppPanelLaunchRatioWithTappedWidget:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  id v10;

  v10 = a3;
  objc_msgSend(v10, "extensionBundleId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

  v6 = v10;
  if (v5)
  {
    objc_msgSend(v10, "widgetUniqueId");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXHomeScreenEventLogger _pageIndexGivenWidgetUniqueId:](self, "_pageIndexGivenWidgetUniqueId:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_msgSend(v8, "unsignedIntegerValue");
      if (v9 < 0x4E20)
        +[ATXAppPanelLaunchRatioLogger logAppPanelAppLaunchWithSBPageIndex:](ATXAppPanelLaunchRatioLogger, "logAppPanelAppLaunchWithSBPageIndex:", v9);
    }

    v6 = v10;
  }

}

- (void)logHomeScreenDidDisappearWithReason:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXHomeScreenEventLogger *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke;
  v7[3] = &unk_1E4D57258;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke_cold_1();

  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v4, 1, 0, 0, 0, *(_QWORD *)(a1 + 32), 0, 0, 0);

}

- (void)logSpecialPageDidAppear:(unint64_t)a3 widgetsByStackId:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATXHomeScreenEventLogger *v15;
  id v16;
  unint64_t v17;

  v8 = a4;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke;
  v13[3] = &unk_1E4D594B0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke_cold_1();

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 56));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPageIndex:", v4);

  objc_msgSend(v3, "setStacks:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "blendingCacheId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v6, 12, 0, 0, 0, 0, 0, v7, v3);

}

- (void)logSpecialPageDidDisappear:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke;
  v4[3] = &unk_1E4D5AEE8;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke_cold_1();

  v3 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPageIndex:", v4);

  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v6, 13, 0, 0, 0, 0, 0, 0, v3);

}

- (void)logWidgetDidAppear:(id)a3 stackId:(id)a4 prediction:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ATXHomeScreenEventLogger *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __66__ATXHomeScreenEventLogger_logWidgetDidAppear_stackId_prediction___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v16 = v9;
  v17 = v8;
  v18 = self;
  v19 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(queue, v15);

}

void __66__ATXHomeScreenEventLogger_logWidgetDidAppear_stackId_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "widgetUniqueId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v18 = "-[ATXHomeScreenEventLogger logWidgetDidAppear:stackId:prediction:]_block_invoke";
    v19 = 2114;
    v20 = v4;
    v21 = 2112;
    v22 = v3;
    v23 = 2114;
    v24 = v5;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: stackID: %{public}@ topWidget: %@ (widgetID %{public}@)", buf, 0x2Au);

  }
  v6 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(void **)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "_stackKindGivenWidgetUniqueId:", v10);
  v12 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "_stackLocationGivenWidgetUniqueId:", v13);
  v15 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "blendingCacheId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v7, 14, v9, v11, v14, 0, v15, v16, 0);

}

- (void)logStackDidAppear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  if (a4)
    -[ATXHomeScreenEventLogger logWidgetDidAppear:stackId:prediction:](self, "logWidgetDidAppear:stackId:prediction:", a4, a3, a5);
}

- (void)logStackDidDisappear:(id)a3 topWidget:(id)a4 prediction:(id)a5
{
  if (a4)
    -[ATXHomeScreenEventLogger logWidgetDidDisappear:stackId:prediction:](self, "logWidgetDidDisappear:stackId:prediction:", a4, a3, a5);
}

- (void)logStackVisibilityChanged:(id)a3 visibleRect:(CGRect)a4 topWidget:(id)a5 prediction:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v13;
  id v14;
  id v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  ATXHomeScreenEventLogger *v23;
  id v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v13 = a3;
  v14 = a5;
  v15 = a6;
  queue = self->_queue;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87__ATXHomeScreenEventLogger_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke;
  v20[3] = &unk_1E4D5AF10;
  v21 = v13;
  v22 = v14;
  v25 = x;
  v26 = y;
  v27 = width;
  v28 = height;
  v23 = self;
  v24 = v15;
  v17 = v15;
  v18 = v14;
  v19 = v13;
  dispatch_async(queue, v20);

}

void __87__ATXHomeScreenEventLogger_logStackVisibilityChanged_visibleRect_topWidget_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  ATXCGRectWrapper *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v3, "widgetUniqueId");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315906;
    v20 = "-[ATXHomeScreenEventLogger logStackVisibilityChanged:visibleRect:topWidget:prediction:]_block_invoke";
    v21 = 2114;
    v22 = v4;
    v23 = 2112;
    v24 = v3;
    v25 = 2114;
    v26 = v5;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: stackID: %{public}@ topWidget: %@ (widgetID %{public}@)", buf, 0x2Au);

  }
  v6 = (void *)objc_opt_new();
  v7 = -[ATXCGRectWrapper initWithCGRect:]([ATXCGRectWrapper alloc], "initWithCGRect:", *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80), *(double *)(a1 + 88));
  objc_msgSend(v6, "setVisibleRect:", v7);

  v8 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 48);
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "_stackKindGivenWidgetUniqueId:", v12);
  v14 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "_stackLocationGivenWidgetUniqueId:", v15);
  v17 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "blendingCacheId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v9, 20, v11, v13, v16, 0, v17, v18, v6);

}

- (void)logStackStatusDidChange:(id)a3 widgetOnTop:(id)a4 reason:(unint64_t)a5 prediction:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  id v20;
  ATXHomeScreenEventLogger *v21;
  unint64_t v22;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __82__ATXHomeScreenEventLogger_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke;
  block[3] = &unk_1E4D5AF38;
  v21 = self;
  v22 = a5;
  v18 = v10;
  v19 = v11;
  v20 = v12;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

void __82__ATXHomeScreenEventLogger_logStackStatusDidChange_widgetOnTop_reason_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  int v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 64);
    v5 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(a1 + 40);
    objc_msgSend(v4, "widgetUniqueId");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 67109890;
    v22 = v3;
    v23 = 2114;
    v24 = v5;
    v25 = 2112;
    v26 = v4;
    v27 = 2114;
    v28 = v6;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "logStackStatusDidChange: reason: %d, stackID: %{public}@, widget: %@ (widgetID %{public}@)", buf, 0x26u);

  }
  if (*(_QWORD *)(a1 + 64) == 2)
  {
    objc_msgSend(*(id *)(a1 + 48), "suggestionForStackIdentifier:", *(_QWORD *)(a1 + 32));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "isLowConfidenceStackRotationForStaleStack"))
    {
      v8 = (void *)objc_opt_new();
      objc_msgSend(v8, "setIsStalenessRotation:", MEMORY[0x1E0C9AAB0]);
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }
  v20 = *(void **)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 56);
  v11 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "_stackKindGivenWidgetUniqueId:", v12);
  v14 = *(void **)(a1 + 56);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "_stackLocationGivenWidgetUniqueId:", v15);
  NSStringForATXHomeScreenStackChangeReason(*(_QWORD *)(a1 + 64));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "blendingCacheId");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v9, 3, v11, v13, v16, v17, v18, v19, v8);

}

- (void)logStackDidTap:(id)a3 engagedUrl:(id)a4 widgetOnTop:(id)a5 prediction:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *queue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  ATXHomeScreenEventLogger *v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke;
  block[3] = &unk_1E4D5A950;
  v20 = v10;
  v21 = v12;
  v22 = self;
  v23 = v11;
  v24 = v13;
  v15 = v13;
  v16 = v11;
  v17 = v12;
  v18 = v10;
  dispatch_async(queue, block);

}

void __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke_cold_1(a1, v2);

  objc_msgSend(*(id *)(a1 + 48), "_logCaptureRateDiversionIfAppPredictionPanelExistsWithTappedWidget:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "setEngagedUrl:", *(_QWORD *)(a1 + 56));
  v4 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "_stackKindGivenWidgetUniqueId:", v8);
  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "_stackLocationGivenWidgetUniqueId:", v11);
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 64), "blendingCacheId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v5, 4, v7, v9, v12, 0, v13, v14, v3);

}

- (void)logStackDidTap:(id)a3 widgetOnTop:(id)a4 prediction:(id)a5
{
  -[ATXHomeScreenEventLogger logStackDidTap:engagedUrl:widgetOnTop:prediction:](self, "logStackDidTap:engagedUrl:widgetOnTop:prediction:", a3, 0, a4, a5);
}

- (void)_logSupplementaryActionInContextMenu:(unint64_t)a3 stackId:(id)a4 widget:(id)a5 prediction:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *queue;
  id v14;
  id v15;
  id v16;
  _QWORD block[4];
  id v18;
  id v19;
  ATXHomeScreenEventLogger *v20;
  id v21;
  unint64_t v22;

  v10 = a4;
  v11 = a5;
  v12 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke;
  block[3] = &unk_1E4D5AF38;
  v18 = v10;
  v19 = v11;
  v21 = v12;
  v22 = a3;
  v20 = self;
  v14 = v12;
  v15 = v11;
  v16 = v10;
  dispatch_async(queue, block);

}

void __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke_cold_1((_QWORD *)a1, v2);

  v3 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "_stackKindGivenWidgetUniqueId:", v7);
  v9 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 40), "widgetUniqueId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v9, "_stackLocationGivenWidgetUniqueId:", v10);
  NSStringForATXHomeScreenWidgetExplicitFeedback(*(_QWORD *)(a1 + 64));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 56), "blendingCacheId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v4, 6, v6, v8, v11, v12, v13, v14, 0);

}

- (void)logUserDidChangeStackConfiguration:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXHomeScreenEventLogger *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke;
  v7[3] = &unk_1E4D57258;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke_cold_1();

  v3 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v4, 7, *(_QWORD *)(a1 + 32), 0, 0, 0, 0, 0, 0);

}

- (void)logUserDidAddPinnedWidget:(id)a3 page:(id)a4 defaultsComparator:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  id v17;
  ATXHomeScreenEventLogger *v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__ATXHomeScreenEventLogger_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v16 = v8;
  v17 = v10;
  v18 = self;
  v19 = v9;
  v12 = v9;
  v13 = v10;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __78__ATXHomeScreenEventLogger_logUserDidAddPinnedWidget_page_defaultsComparator___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "widgetUniqueId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v24 = "-[ATXHomeScreenEventLogger logUserDidAddPinnedWidget:page:defaultsComparator:]_block_invoke";
    v25 = 2112;
    v26 = v3;
    v27 = 2114;
    v28 = v4;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: user added pinned widget: %@ (widgetID %{public}@)", buf, 0x20u);

  }
  v5 = (void *)objc_opt_new();
  v6 = objc_msgSend(*(id *)(a1 + 40), "rankOfWidgetSuggestedInGallery:", *(_QWORD *)(a1 + 32));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v6 != 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsSuggestionInAddWidgetSheet:", v7);

  objc_msgSend(*(id *)(a1 + 48), "_populateSuggestedPageMetadata:forPage:", v5, *(_QWORD *)(a1 + 56));
  v8 = *(void **)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "widgetUniqueId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_homeScreenEventWithDate:eventTypeString:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v9, CFSTR("PinnedWidgetAdded"), 0, 1, objc_msgSend(v10, "_stackLocationGivenWidgetUniqueId:", v11), 0, *(_QWORD *)(a1 + 32), 0, v5);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = *(void **)(*(_QWORD *)(a1 + 48) + 80);
  +[ATXUIEvent uiEventWithHomeScreenEvent:](ATXUIEvent, "uiEventWithHomeScreenEvent:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "donateGenericUIEvent:", v14);

  v15 = objc_alloc(MEMORY[0x1E0D01FF0]);
  objc_msgSend(*(id *)(a1 + 32), "extensionBundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "operatingSystemVersionString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.duetexpertd.widget.added"), v16, v18, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 88), "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendEvent:", v19);

  objc_msgSend(*(id *)(a1 + 48), "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "galleryItems");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "logWidgetAddedFeaturesInCoreAnalytics:rankOfWidgetInGallery:galleryItems:", v12, v6, v22);

}

- (void)logUserDidDeletePinnedWidget:(id)a3 stackLocation:(unint64_t)a4 page:(id)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATXHomeScreenEventLogger *v15;
  id v16;
  unint64_t v17;

  v8 = a3;
  v9 = a5;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__ATXHomeScreenEventLogger_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke;
  v13[3] = &unk_1E4D594B0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __76__ATXHomeScreenEventLogger_logUserDidDeletePinnedWidget_stackLocation_page___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "widgetUniqueId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v9 = "-[ATXHomeScreenEventLogger logUserDidDeletePinnedWidget:stackLocation:page:]_block_invoke";
    v10 = 2112;
    v11 = v3;
    v12 = 2114;
    v13 = v4;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: user deleted pinned widget: %@ (widgetID %{public}@)", buf, 0x20u);

  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 40), "_populateSuggestedPageMetadata:forPage:", v5, *(_QWORD *)(a1 + 48));
  v6 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v7, 11, 0, 1, *(_QWORD *)(a1 + 56), 0, *(_QWORD *)(a1 + 32), 0, v5);

}

- (void)logUserDidAddApp:(id)a3 page:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATXHomeScreenEventLogger *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__ATXHomeScreenEventLogger_logUserDidAddApp_page___block_invoke;
  block[3] = &unk_1E4D57FE0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __50__ATXHomeScreenEventLogger_logUserDidAddApp_page___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBundleIds:", v4);

  objc_msgSend(*(id *)(a1 + 40), "_populateSuggestedPageMetadata:forPage:", v2, *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v2, "suggestedPageType"))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v6, 21, 0, 0, 0, 0, 0, 0, v2);

  }
}

- (void)logUserDidRemoveApp:(id)a3 page:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ATXHomeScreenEventLogger *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ATXHomeScreenEventLogger_logUserDidRemoveApp_page___block_invoke;
  block[3] = &unk_1E4D57FE0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __53__ATXHomeScreenEventLogger_logUserDidRemoveApp_page___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "bundleId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBundleIds:", v4);

  objc_msgSend(*(id *)(a1 + 40), "_populateSuggestedPageMetadata:forPage:", v2, *(_QWORD *)(a1 + 48));
  if (objc_msgSend(v2, "suggestedPageType"))
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v6, 22, 0, 0, 0, 0, 0, 0, v2);

  }
}

- (void)logUserDidAddWidgetToStack:(id)a3 stackIdentifier:(id)a4 isSuggestion:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATXHomeScreenEventLogger *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __84__ATXHomeScreenEventLogger_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke;
  v13[3] = &unk_1E4D5AF60;
  v17 = a5;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __84__ATXHomeScreenEventLogger_logUserDidAddWidgetToStack_stackIdentifier_isSuggestion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "widgetUniqueId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v22 = "-[ATXHomeScreenEventLogger logUserDidAddWidgetToStack:stackIdentifier:isSuggestion:]_block_invoke";
    v23 = 2112;
    v24 = v3;
    v25 = 2114;
    v26 = v4;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: user added widget to stack: %@ (widgetID %{public}@)", buf, 0x20u);

  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIsSuggestionInAddWidgetSheet:", v6);

  v7 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(a1 + 40);
  v9 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "widgetUniqueId");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "_stackKindGivenWidgetUniqueId:", v11);
  v13 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "widgetUniqueId");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v8, 18, v9, v12, objc_msgSend(v13, "_stackLocationGivenWidgetUniqueId:", v14), 0, *(_QWORD *)(a1 + 32), 0, v5);

  v15 = objc_alloc(MEMORY[0x1E0D01FF0]);
  objc_msgSend(*(id *)(a1 + 32), "extensionBundleId");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "operatingSystemVersionString");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v15, "initWithContentIdentifier:context:osBuild:userInfo:", CFSTR("com.apple.duetexpertd.widget.addedToStack"), v16, v18, 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "source");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "sendEvent:", v19);

}

- (void)logUserDidDeleteWidgetOnStack:(id)a3 stackIdentifier:(id)a4 stackKind:(unint64_t)a5 stackLocation:(unint64_t)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  ATXHomeScreenEventLogger *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  v10 = a3;
  v11 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__ATXHomeScreenEventLogger_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke;
  block[3] = &unk_1E4D59598;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v19 = a5;
  v20 = a6;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, block);

}

void __98__ATXHomeScreenEventLogger_logUserDidDeleteWidgetOnStack_stackIdentifier_stackKind_stackLocation___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint8_t buf[4];
  const char *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = (void *)a1[4];
    objc_msgSend(v3, "widgetUniqueId");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v8 = "-[ATXHomeScreenEventLogger logUserDidDeleteWidgetOnStack:stackIdentifier:stackKind:stackLocation:]_block_invoke";
    v9 = 2112;
    v10 = v3;
    v11 = 2114;
    v12 = v4;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: user deleted widget on stack: %@ (widgetID %{public}@)", buf, 0x20u);

  }
  v5 = (void *)a1[5];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v6, 19, a1[6], a1[7], a1[8], 0, a1[4], 0, 0);

}

- (void)_populateSuggestedPageMetadata:(id)a3 forPage:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v6)
  {
    __atxlog_handle_home_screen();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXHomeScreenEventLogger _populateSuggestedPageMetadata:forPage:].cold.1();
    goto LABEL_10;
  }
  if (objc_msgSend(v6, "pageIndex") != 20000)
  {
    objc_msgSend(v7, "uniqueIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      v9 = objc_opt_new();
      objc_msgSend(v7, "uniqueIdentifier");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = -[NSObject suggestedPageTypeWithIdentifier:](v9, "suggestedPageTypeWithIdentifier:", v10);

      if (v11)
        objc_msgSend(v5, "setSuggestedPageType:", v11);
    }
    else
    {
      __atxlog_handle_home_screen();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[ATXHomeScreenEventLogger _populateSuggestedPageMetadata:forPage:].cold.2(v7, v9);
    }
LABEL_10:

  }
}

- (void)logUserDidCreateStack:(id)a3 page:(id)a4 isSuggestion:(BOOL)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ATXHomeScreenEventLogger *v15;
  id v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__ATXHomeScreenEventLogger_logUserDidCreateStack_page_isSuggestion___block_invoke;
  v13[3] = &unk_1E4D5AF60;
  v17 = a5;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_async(queue, v13);

}

void __68__ATXHomeScreenEventLogger_logUserDidCreateStack_page_isSuggestion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    v21 = "-[ATXHomeScreenEventLogger logUserDidCreateStack:page:isSuggestion:]_block_invoke";
    v22 = 2114;
    v23 = v3;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: user created stack (ID %{public}@)", buf, 0x16u);

  }
  v4 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "widgets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setWidgetsInStack:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsSuggestionInAddWidgetSheet:", v7);

  objc_msgSend(*(id *)(a1 + 40), "_populateSuggestedPageMetadata:forPage:", v4, *(_QWORD *)(a1 + 48));
  v19 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "widgets");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "widgetUniqueId");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "_stackKindGivenWidgetUniqueId:", v12);
  v14 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "widgets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "widgetUniqueId");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v18, 16, v8, v13, objc_msgSend(v14, "_stackLocationGivenWidgetUniqueId:", v17), 0, 0, 0, v4);

}

- (void)logUserDidDeleteStack:(id)a3 stackKind:(unint64_t)a4 stackLocation:(unint64_t)a5 page:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[4];
  id v16;
  ATXHomeScreenEventLogger *v17;
  id v18;
  unint64_t v19;
  unint64_t v20;

  v10 = a3;
  v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__ATXHomeScreenEventLogger_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke;
  block[3] = &unk_1E4D59598;
  v16 = v10;
  v17 = self;
  v18 = v11;
  v19 = a4;
  v20 = a5;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, block);

}

void __79__ATXHomeScreenEventLogger_logUserDidDeleteStack_stackKind_stackLocation_page___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315650;
    v12 = "-[ATXHomeScreenEventLogger logUserDidDeleteStack:stackKind:stackLocation:page:]_block_invoke";
    v13 = 2112;
    v14 = v3;
    v15 = 2114;
    v16 = v4;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "%s: user deleted stack: %@ (ID %{public}@)", buf, 0x20u);

  }
  v5 = (void *)objc_opt_new();
  objc_msgSend(*(id *)(a1 + 32), "widgets");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v5, "setWidgetsInStack:", v7);

  objc_msgSend(*(id *)(a1 + 40), "_populateSuggestedPageMetadata:forPage:", v5, *(_QWORD *)(a1 + 48));
  v8 = *(void **)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v9, 17, v10, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), 0, 0, 0, v5);

}

- (void)logDeviceLock
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__ATXHomeScreenEventLogger_logDeviceLock__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

void __41__ATXHomeScreenEventLogger_logDeviceLock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t buf[16];

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenEventLogger: donating lock event", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v4, 8, 0, 0, 0, 0, 0, 0, 0);

}

- (void)logDeviceUnlock
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ATXHomeScreenEventLogger_logDeviceUnlock__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

void __43__ATXHomeScreenEventLogger_logDeviceUnlock__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t buf[16];

  __atxlog_handle_home_screen();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A49EF000, v2, OS_LOG_TYPE_DEFAULT, "ATXHomeScreenEventLogger: donating unlock event", buf, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_sendEventToBiomeWithDate:eventType:stackIdentifier:stackKind:stackLocation:reason:widget:blendingCacheIdentifier:metadata:", v4, 9, 0, 0, 0, 0, 0, 0, 0);

}

- (void)logWidgetDidAppear:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __63__ATXHomeScreenEventLogger_logWidgetDidAppear_blendingCacheId___block_invoke;
  block[3] = &unk_1E4D57FE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __63__ATXHomeScreenEventLogger_logWidgetDidAppear_blendingCacheId___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = (id)objc_opt_new();
  objc_msgSend(v1, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 4, 0, v2, v3, v4);

}

- (void)logWidgetDidDisappear:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__ATXHomeScreenEventLogger_logWidgetDidDisappear_blendingCacheId___block_invoke;
  block[3] = &unk_1E4D57FE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __66__ATXHomeScreenEventLogger_logWidgetDidDisappear_blendingCacheId___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = (id)objc_opt_new();
  objc_msgSend(v1, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 5, 0, v2, v3, v4);

}

- (void)logSuggestionsDidAppear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __75__ATXHomeScreenEventLogger_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __75__ATXHomeScreenEventLogger_logSuggestionsDidAppear_widget_blendingCacheId___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 6, v2, v3, v4, v5);

}

- (void)logSuggestionsDidDisappear:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __78__ATXHomeScreenEventLogger_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __78__ATXHomeScreenEventLogger_logSuggestionsDidDisappear_widget_blendingCacheId___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = a1[7];
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 7, v2, v3, v4, v5);

}

- (void)logWidgetOccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__ATXHomeScreenEventLogger_logWidgetOccluded_blendingCacheId___block_invoke;
  block[3] = &unk_1E4D57FE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __62__ATXHomeScreenEventLogger_logWidgetOccluded_blendingCacheId___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = (id)objc_opt_new();
  objc_msgSend(v1, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 8, 0, v2, v3, v4);

}

- (void)logWidgetUnoccluded:(id)a3 blendingCacheId:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__ATXHomeScreenEventLogger_logWidgetUnoccluded_blendingCacheId___block_invoke;
  block[3] = &unk_1E4D57FE0;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __64__ATXHomeScreenEventLogger_logWidgetUnoccluded_blendingCacheId___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  id v4;

  v1 = (void *)a1[4];
  v2 = a1[5];
  v3 = a1[6];
  v4 = (id)objc_opt_new();
  objc_msgSend(v1, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 9, 0, v2, v3, v4);

}

- (void)logDidTapSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  ATXHomeScreenPrediction *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 1, v5, v7, v6, v8);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 48), "widgetUniqueId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_stackIdentifierGivenWidgetUniqueId:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(a1 + 56) && v11)
  {
    v12 = *(void **)(a1 + 32);
    v13 = *(_QWORD *)(a1 + 48);
    v14 = [ATXHomeScreenPrediction alloc];
    v15 = -[ATXHomeScreenPrediction initWithBlendingCacheIdentifier:widgetSuggestions:stacksAffectedByDebugRotation:](v14, "initWithBlendingCacheIdentifier:widgetSuggestions:stacksAffectedByDebugRotation:", *(_QWORD *)(a1 + 56), MEMORY[0x1E0C9AA70], 0);
    objc_msgSend(v12, "logStackDidTap:widgetOnTop:prediction:", v11, v13, v15);
  }
  else
  {
    __atxlog_handle_home_screen();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke_cold_1((uint64_t *)(a1 + 56), (uint64_t)v11, v15);
  }

  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:](ATXMFeedbackConversionLogger, "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 0, 34, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  v16 = *(void **)(a1 + 32);
  v17 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "extensionBundleId");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "isEqualToString:", *MEMORY[0x1E0CF9480]);
  objc_msgSend(*(id *)(a1 + 48), "widgetUniqueId");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "_logCaptureRateForAppPredictionPanelWithEngagedSuggestion:isSuggestionsWidget:widgetIdentifier:", v17, v19, v20);

  objc_msgSend(*(id *)(a1 + 32), "_logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:suggestion:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_logAppPanelLaunchRatioWithTappedWidget:", *(_QWORD *)(a1 + 48));

}

- (void)logContextMenuDismissOnceForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __90__ATXHomeScreenEventLogger_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __90__ATXHomeScreenEventLogger_logContextMenuDismissOnceForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 2, v5, v6, v7, v8);

  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:](ATXMFeedbackConversionLogger, "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 1, 34, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(*(id *)(a1 + 48), "extensionBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  if ((v3 & 1) != 0)
  {
    v10 = 36;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "extensionBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

    if (v12)
      v10 = 37;
    else
      v10 = 0;
  }
  return +[ATXContextMenuFeedbackTracker logContextMenuFeedbackForDismissOnceWithSuggestion:consumerSubType:tracker:](ATXContextMenuFeedbackTracker, "logContextMenuFeedbackForDismissOnceWithSuggestion:consumerSubType:tracker:", *(_QWORD *)(a1 + 40), v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)logContextMenuNeverShowAgainForSuggestion:(id)a3 widget:(id)a4 blendingCacheId:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *queue;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  queue = self->_queue;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __93__ATXHomeScreenEventLogger_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke;
  v15[3] = &unk_1E4D5A2A0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

uint64_t __93__ATXHomeScreenEventLogger_logContextMenuNeverShowAgainForSuggestion_widget_blendingCacheId___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_logProactiveWidgetEvent:suggestionIdentifiers:widget:blendingCacheId:date:", 3, v5, v6, v7, v8);

  +[ATXMFeedbackConversionLogger logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:](ATXMFeedbackConversionLogger, "logUserInteractionFeedbackWithEngagementType:consumerSubType:tracker:", 1, 34, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
  objc_msgSend(*(id *)(a1 + 48), "extensionBundleId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CF9480]);

  if ((v3 & 1) != 0)
  {
    v10 = 36;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "extensionBundleId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.proactive.appprediction.panel"));

    if (v12)
      v10 = 37;
    else
      v10 = 0;
  }
  return +[ATXContextMenuFeedbackTracker logContextMenuFeedbackForNeverShowAgainWithSuggestion:consumerSubType:tracker:](ATXContextMenuFeedbackTracker, "logContextMenuFeedbackForNeverShowAgainWithSuggestion:consumerSubType:tracker:", *(_QWORD *)(a1 + 40), v10, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96));
}

- (void)logWidgetInsertionDidFailInStack:(id)a3 prediction:(id)a4
{
  NSObject *v4;

  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    -[ATXHomeScreenEventLogger logWidgetInsertionDidFailInStack:prediction:].cold.1();

}

- (void)logUserDidStartWidgetOnboarding
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

void __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setBool:forKey:", 1, *MEMORY[0x1E0CF9580]);
  v2 = (void *)objc_opt_new();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke_2;
  v3[3] = &unk_1E4D5AF88;
  v3[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v2, "fetchSmartStackOfVariant:completionHandler:", 2, v3);

}

void __59__ATXHomeScreenEventLogger_logUserDidStartWidgetOnboarding__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  id v7;

  objc_msgSend(a2, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "smallDefaultStack");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v7, "smallDefaultStack");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "rankType") != 5 && objc_msgSend(v5, "rankType") != 6;
  }
  else
  {
    v6 = 1;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setBool:forKey:", v6, *MEMORY[0x1E0CF95B0]);

}

- (void)logUserDidAcceptWidgetOnboardingSuggestion:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATXHomeScreenEventLogger_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __71__ATXHomeScreenEventLogger_logUserDidAcceptWidgetOnboardingSuggestion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setValue:forKey:", CFSTR("accepted"), *MEMORY[0x1E0CF95A8]);
}

- (void)logUserDidRejectWidgetOnboardingSuggestion:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__ATXHomeScreenEventLogger_logUserDidRejectWidgetOnboardingSuggestion___block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __71__ATXHomeScreenEventLogger_logUserDidRejectWidgetOnboardingSuggestion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setValue:forKey:", CFSTR("rejected"), *MEMORY[0x1E0CF95A8]);
}

- (void)logUserDidEnterEditModeForWidgetOnboarding
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __70__ATXHomeScreenEventLogger_logUserDidEnterEditModeForWidgetOnboarding__block_invoke;
  block[3] = &unk_1E4D57590;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __70__ATXHomeScreenEventLogger_logUserDidEnterEditModeForWidgetOnboarding__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "setValue:forKey:", CFSTR("edited"), *MEMORY[0x1E0CF95A8]);
}

- (ATXHomeScreenEventLoggerDelegate)delegate
{
  return (ATXHomeScreenEventLoggerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_discoverabilitySignalsStream, 0);
  objc_storeStrong((id *)&self->_biomeUIStream, 0);
  objc_storeStrong((id *)&self->_homeScreenConfigCache, 0);
  objc_storeStrong((id *)&self->_dockAppSet, 0);
  objc_storeStrong((id *)&self->_bundleIdToSBPageNumber, 0);
  objc_storeStrong((id *)&self->_stackIdToCachedStackData, 0);
  objc_storeStrong((id *)&self->_widgetIdToStackId, 0);
  objc_storeStrong((id *)&self->_currentConfigurations, 0);
  objc_storeStrong((id *)&self->_coalescedConfigDiffOperation, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXHomeScreenEventLogger: Loaded dock app set, but it is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXHomeScreenEventLogger: Could not load dock app list", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXHomeScreenEventLogger: Loaded HomeScreen and Today page configs, but they are nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __97__ATXHomeScreenEventLogger_initWithHomeScreenConfigCache_biomeUIStream_PETEventTracker_defaults___block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_1A49EF000, v0, v1, "ATXHomeScreenEventLogger: Could not load initial home screen and today page configurations", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

void __66__ATXHomeScreenEventLogger__updateCurrentConfigurationsAndLogDiff__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, v0, v1, "ATXHomeScreenEventLogger: Could not load default items with default home screen item comparator: %@", v2);
  OUTLINED_FUNCTION_2();
}

- (void)_logAppLaunchOverallCaptureRateFromAppPredictionPanelWithTappedWidget:(NSObject *)a3 suggestion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  uint64_t v7;
  __CFString *v8;
  __CFString *v9;
  uint64_t v10;
  __CFString *v11;
  uint8_t buf[4];
  id v13;
  __int16 v14;
  __CFString *v15;
  __int16 v16;
  __CFString *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(a2, "captureType");
  if (v7 >= 0xA)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v7);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = off_1E4D5B0B0[(int)v7];
  }
  v9 = v8;
  v10 = objc_msgSend(a2, "iconLocation");
  if (v10 >= 9)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v10);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = off_1E4D5B100[(int)v10];
  }
  *(_DWORD *)buf = 138414338;
  v13 = v6;
  v14 = 2112;
  v15 = v9;
  v16 = 2112;
  v17 = v11;
  v18 = 1024;
  v19 = objc_msgSend(a2, "spotlightEnabled");
  v20 = 1024;
  v21 = objc_msgSend(a2, "appLibraryEnabled");
  v22 = 1024;
  v23 = objc_msgSend(a2, "appPredictionPanelEnabled");
  v24 = 1024;
  v25 = objc_msgSend(a2, "appPredictionPanelTodayEnabled");
  v26 = 1024;
  v27 = objc_msgSend(a2, "suggestionsWidgetEnabled");
  v28 = 1024;
  v29 = objc_msgSend(a2, "suggestionsWidgetTodayEnabled");
  _os_log_debug_impl(&dword_1A49EF000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAppLaunchOverallCaptureRateTracker with captureType: %@, iconLocation: %@, spotlightEnabled: %u, appLibraryEnabled: %u, hasAppPanel: %u, hasAppPanelToday: %u, suggestionsWidgetEnabled: %u, suggestionsWidgetTodayEnabled: %u", buf, 0x44u);

}

void __94__ATXHomeScreenEventLogger_logHomeScreenPageDidAppear_topWidgetsByStackIdentifier_prediction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 56);
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 136315650;
  v5 = "-[ATXHomeScreenEventLogger logHomeScreenPageDidAppear:topWidgetsByStackIdentifier:prediction:]_block_invoke";
  v6 = 1024;
  v7 = v2;
  v8 = 2112;
  v9 = v3;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "%s: page %d, widgets: %@", (uint8_t *)&v4, 0x1Cu);
  OUTLINED_FUNCTION_5_2();
}

void __64__ATXHomeScreenEventLogger_logHomeScreenDidDisappearWithReason___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_8_2(&dword_1A49EF000, v0, v1, "%s: reason: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __80__ATXHomeScreenEventLogger_logSpecialPageDidAppear_widgetsByStackId_prediction___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_3(&dword_1A49EF000, v0, v1, "%s: special page %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __55__ATXHomeScreenEventLogger_logSpecialPageDidDisappear___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_10_2();
  OUTLINED_FUNCTION_7_3(&dword_1A49EF000, v0, v1, "%s: special page %d", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __77__ATXHomeScreenEventLogger_logStackDidTap_engagedUrl_widgetOnTop_prediction___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = 136315650;
  v5 = "-[ATXHomeScreenEventLogger logStackDidTap:engagedUrl:widgetOnTop:prediction:]_block_invoke";
  v6 = 2112;
  v7 = v2;
  v8 = 2112;
  v9 = v3;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "%s: stack: %@, widget: %@", (uint8_t *)&v4, 0x20u);
  OUTLINED_FUNCTION_5_2();
}

void __91__ATXHomeScreenEventLogger__logSupplementaryActionInContextMenu_stackId_widget_prediction___block_invoke_cold_1(_QWORD *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  const char *v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v3 = a1[5];
  v4 = a1[8];
  v5 = 136315906;
  v6 = "-[ATXHomeScreenEventLogger _logSupplementaryActionInContextMenu:stackId:widget:prediction:]_block_invoke";
  v7 = 2112;
  v8 = v2;
  v9 = 2112;
  v10 = v3;
  v11 = 1024;
  v12 = v4;
  _os_log_debug_impl(&dword_1A49EF000, a2, OS_LOG_TYPE_DEBUG, "%s: stack: %@, widget: %@, feedback: %d", (uint8_t *)&v5, 0x26u);
  OUTLINED_FUNCTION_5_2();
}

void __63__ATXHomeScreenEventLogger_logUserDidChangeStackConfiguration___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_9_3();
  OUTLINED_FUNCTION_8_2(&dword_1A49EF000, v0, v1, "%s: stack: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

- (void)_populateSuggestedPageMetadata:forPage:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "We have a missing parent page during diffing", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

- (void)_populateSuggestedPageMetadata:(void *)a1 forPage:(NSObject *)a2 .cold.2(void *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "pageIndex");
  OUTLINED_FUNCTION_2_2();
  OUTLINED_FUNCTION_0_15(&dword_1A49EF000, a2, v3, "We have a page without a unique page identifier: %ld", v4);
  OUTLINED_FUNCTION_5_2();
}

void __71__ATXHomeScreenEventLogger_logDidTapSuggestion_widget_blendingCacheId___block_invoke_cold_1(uint64_t *a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315650;
  v5 = "-[ATXHomeScreenEventLogger logDidTapSuggestion:widget:blendingCacheId:]_block_invoke";
  v6 = 2114;
  v7 = v3;
  v8 = 2114;
  v9 = a2;
  _os_log_fault_impl(&dword_1A49EF000, log, OS_LOG_TYPE_FAULT, "%s: unable to emit stackDidTap log - blendingCacheId %{public}@, stackId %{public}@", (uint8_t *)&v4, 0x20u);
  OUTLINED_FUNCTION_5_2();
}

- (void)logWidgetInsertionDidFailInStack:prediction:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_4(&dword_1A49EF000, v0, v1, "This hasn't been implemented", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
