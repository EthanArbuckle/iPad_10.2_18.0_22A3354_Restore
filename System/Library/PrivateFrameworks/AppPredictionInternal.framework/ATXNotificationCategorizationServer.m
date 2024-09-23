@implementation ATXNotificationCategorizationServer

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_16 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_16, &__block_literal_global_109);
  return (id)sharedInstance__pasExprOnceResult_21;
}

void __53__ATXNotificationCategorizationServer_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_21;
  sharedInstance__pasExprOnceResult_21 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXNotificationCategorizationServer)init
{
  ATXNotificationCategorizationServer *v2;
  NSObject *v3;
  uint64_t v4;
  _PASLazyResult *contactStore;
  id v6;
  uint64_t v7;
  _PASLazyResult *contactRelationships;
  id v9;
  uint64_t v10;
  _PASLazyResult *featuresCorrelator;
  uint64_t v12;
  _PASLazyResult *notificationSenderImportanceModel;
  uint64_t v14;
  _PASLazyResult *mailSenderImportanceModel;
  uint64_t v16;
  _PASLazyResult *messageSenderImportanceModel;
  uint64_t v18;
  NSXPCListener *listener;
  NSObject *v20;
  uint64_t v22;
  uint64_t v23;
  ATXContactRelationshipsCollector *(*v24)(uint64_t);
  void *v25;
  id v26;
  id location;
  objc_super v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v28.receiver = self;
  v28.super_class = (Class)ATXNotificationCategorizationServer;
  v2 = -[ATXNotificationCategorizationServer init](&v28, sel_init);
  if (v2)
  {
    __atxlog_handle_notification_categorization();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "ATXNotificationCategorizationServer: launched", buf, 2u);
    }

    objc_initWeak(&location, v2);
    v4 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithBlock:", &__block_literal_global_22_1);
    contactStore = v2->_contactStore;
    v2->_contactStore = (_PASLazyResult *)v4;

    v6 = objc_alloc(MEMORY[0x1E0D815E8]);
    v22 = MEMORY[0x1E0C809B0];
    v23 = 3221225472;
    v24 = __43__ATXNotificationCategorizationServer_init__block_invoke_2;
    v25 = &unk_1E82E3BA8;
    objc_copyWeak(&v26, &location);
    v7 = objc_msgSend(v6, "initWithBlock:", &v22);
    contactRelationships = v2->_contactRelationships;
    v2->_contactRelationships = (_PASLazyResult *)v7;

    v9 = objc_alloc(MEMORY[0x1E0D815E8]);
    v10 = objc_msgSend(v9, "initWithBlock:", &__block_literal_global_27_0, v22, v23, v24, v25);
    featuresCorrelator = v2->_featuresCorrelator;
    v2->_featuresCorrelator = (_PASLazyResult *)v10;

    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithBlock:", &__block_literal_global_30_0);
    notificationSenderImportanceModel = v2->_notificationSenderImportanceModel;
    v2->_notificationSenderImportanceModel = (_PASLazyResult *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithBlock:", &__block_literal_global_33_0);
    mailSenderImportanceModel = v2->_mailSenderImportanceModel;
    v2->_mailSenderImportanceModel = (_PASLazyResult *)v14;

    v16 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E8]), "initWithBlock:", &__block_literal_global_36_1);
    messageSenderImportanceModel = v2->_messageSenderImportanceModel;
    v2->_messageSenderImportanceModel = (_PASLazyResult *)v16;

    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.personalization.notificationCategorization"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v18;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
    __atxlog_handle_notification_categorization();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ATXNotificationCategorizationServer init]";
      _os_log_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEFAULT, "%s: Listening for connections", buf, 0xCu);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&location);
  }
  return v2;
}

id __43__ATXNotificationCategorizationServer_init__block_invoke()
{
  return (id)objc_opt_new();
}

ATXContactRelationshipsCollector *__43__ATXNotificationCategorizationServer_init__block_invoke_2(uint64_t a1)
{
  id *WeakRetained;
  ATXContactRelationshipsCollector *v2;
  void *v3;
  ATXContactRelationshipsCollector *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = [ATXContactRelationshipsCollector alloc];
    objc_msgSend(WeakRetained[6], "result");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ATXContactRelationshipsCollector initWithContactStore:](v2, "initWithContactStore:", v3);

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_3()
{
  return (id)objc_opt_new();
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_4()
{
  return (id)objc_opt_new();
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_5()
{
  return (id)objc_opt_new();
}

id __43__ATXNotificationCategorizationServer_init__block_invoke_6()
{
  return (id)objc_opt_new();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  BOOL v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  uint8_t buf[4];
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  __atxlog_handle_notification_categorization();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v30 = "-[ATXNotificationCategorizationServer listener:shouldAcceptNewConnection:]";
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_INFO, "%s: Connection attempted", buf, 0xCu);
  }

  objc_msgSend(v7, "valueForEntitlement:", CFSTR("com.apple.personalization.notificationCategorization"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 && (objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v9, "BOOLValue") & 1) != 0)
  {
    __atxlog_handle_notification_categorization();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v30 = "-[ATXNotificationCategorizationServer listener:shouldAcceptNewConnection:]";
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_INFO, "%s: Connection established", buf, 0xCu);
    }

    ATXNotificationCategorizationXPCInterface();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v11);

    objc_msgSend(v7, "setExportedObject:", self);
    objc_initWeak((id *)buf, v7);
    v12 = MEMORY[0x1E0C809B0];
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke;
    v27[3] = &unk_1E82DB988;
    objc_copyWeak(&v28, (id *)buf);
    objc_msgSend(v7, "setInterruptionHandler:", v27);
    v22 = v12;
    v23 = 3221225472;
    v24 = __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_43;
    v25 = &unk_1E82DB988;
    objc_copyWeak(&v26, (id *)buf);
    objc_msgSend(v7, "setInvalidationHandler:", &v22);
    objc_msgSend(v7, "resume", v22, v23, v24, v25);
    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak((id *)buf);
    v13 = 1;
  }
  else
  {
    __atxlog_handle_notification_categorization();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationServer listener:shouldAcceptNewConnection:].cold.1((uint64_t)v7, v14, v15, v16, v17, v18, v19, v20);

    v13 = 0;
  }

  return v13;
}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_notification_categorization();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_cold_1();

}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_43(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  __atxlog_handle_notification_categorization();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_43_cold_1();

}

- (void)collectDynamicBreakthroughFeaturesForNotification:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  id v7;
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  int v19;
  const char *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, _QWORD))a4;
  v7 = a3;
  __atxlog_handle_notification_categorization();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v19 = 136315138;
    v20 = "-[ATXNotificationCategorizationServer collectDynamicBreakthroughFeaturesForNotification:completion:]";
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Starting %s", (uint8_t *)&v19, 0xCu);
  }

  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  __atxlog_handle_notification_categorization();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ATXNotificationCategorizationServer.dynamicBreakthroughDataCollection", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  -[_PASLazyResult result](self->_featuresCorrelator, "result");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyResult result](self->_contactStore, "result");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyResult result](self->_contactRelationships, "result");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "collectDynamicBreakthroughFeaturesForNotification:contactStore:withContactRelationships:", v7, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_notification_categorization();
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = v17;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v17))
  {
    LOWORD(v19) = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v18, OS_SIGNPOST_INTERVAL_END, v10, "ATXNotificationCategorizationServer.dynamicBreakthroughDataCollection", " enableTelemetry=YES ", (uint8_t *)&v19, 2u);
  }

  v6[2](v6, v16, 0);
}

- (void)collectCoreAnalyticsJsonForNotification:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, id);
  NSObject *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  uint8_t buf[4];
  const char *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, id))a4;
  __atxlog_handle_notification_categorization();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v33 = "-[ATXNotificationCategorizationServer collectCoreAnalyticsJsonForNotification:completion:]";
    _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Starting %s", buf, 0xCu);
  }

  __atxlog_handle_notification_categorization();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  __atxlog_handle_notification_categorization();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "ATXNotificationCategorizationServer.collectCoreAnalyticsJsonForNotification", " enableTelemetry=YES ", buf, 2u);
  }

  v13 = (void *)objc_opt_new();
  objc_msgSend(v6, "bundleID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "notificationID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "recordDate");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "timeIntervalSinceReferenceDate");
  objc_msgSend(v13, "telemetryDataForNotificationWithBundleId:notificationId:recordTimestamp:", v14, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
    __atxlog_handle_notification_categorization();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      -[ATXNotificationCategorizationServer collectCoreAnalyticsJsonForNotification:completion:].cold.1(v6, v18);

  }
  -[_PASLazyResult result](self->_featuresCorrelator, "result");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyResult result](self->_contactStore, "result");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PASLazyResult result](self->_contactRelationships, "result");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "collectDynamicBreakthroughFeaturesForNotification:contactStore:withContactRelationships:", v6, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  +[ATXNotificationBreakthroughEventMetric coreAnalyticsDictionaryFromQueryResult:featureCollectionSet:](ATXNotificationBreakthroughEventMetric, "coreAnalyticsDictionaryFromQueryResult:featureCollectionSet:", v17, v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  __atxlog_handle_notification_categorization();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1C9A3B000, v25, OS_SIGNPOST_INTERVAL_END, v10, "ATXNotificationCategorizationServer.collectCoreAnalyticsJsonForNotification", " enableTelemetry=YES ", buf, 2u);
  }

  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v23, 1, &v31);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v31;
  v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v26, 4);
  if (v27)
  {
    v29 = 0;
    v30 = v27;
  }
  else
  {
    v29 = v28;
    v30 = 0;
  }
  v7[2](v7, v29, v30);

}

- (void)rankUserNotificationWithRequest:(id)a3 completion:(id)a4
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
  id v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void (**v23)(id, void *, _QWORD);
  id v24;
  dispatch_queue_t v25;
  NSObject *queue;
  void *v27;
  _QWORD block[5];
  id v29;
  NSObject *v30;
  _BYTE *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t v36[4];
  const char *v37;
  __int16 v38;
  uint64_t v39;
  uint8_t v40[128];
  _BYTE buf[24];
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v24 = a3;
  v23 = (void (**)(id, void *, _QWORD))a4;
  __atxlog_handle_notification_categorization();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v24, "userNotifications");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "-[ATXNotificationCategorizationServer rankUserNotificationWithRequest:completion:]";
    *(_WORD *)&buf[12] = 2048;
    *(_QWORD *)&buf[14] = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%s: Received request to rank: %ld notifications", buf, 0x16u);

  }
  v27 = (void *)objc_opt_new();
  v7 = objc_msgSend(v24, "useLLM");
  v8 = &unk_1E83D09D0;
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E83D09D0, CFSTR("critical"));
  if (v7)
  {
    v8 = &unk_1E83D09E0;
    v9 = &unk_1E83D09F0;
  }
  else
  {
    v9 = &unk_1E83D0A00;
  }
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, CFSTR("timeSensitive"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", &unk_1E83D09D0, CFSTR("isMessage"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, CFSTR("personScore"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v8, CFSTR("tendencyToOpenAppAfterNotification"));
  objc_msgSend(v27, "setObject:forKeyedSubscript:", v9, CFSTR("llmScore"));
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  queue = dispatch_queue_create("ATXNotificationCategorizationServer.rankUserNotificationWithRequest.concurrent", v10);

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v11 = objc_claimAutoreleasedReturnValue();
  v25 = dispatch_queue_create("ATXNotificationCategorizationServer.rankUserNotificationWithRequest.serial", v11);

  v12 = dispatch_group_create();
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v42 = __Block_byref_object_copy__50;
  v43 = __Block_byref_object_dispose__50;
  v44 = (id)objc_opt_new();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  objc_msgSend(v24, "userNotifications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    v16 = MEMORY[0x1E0C809B0];
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        block[0] = v16;
        block[1] = 3221225472;
        block[2] = __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke;
        block[3] = &unk_1E82E2C08;
        block[4] = v18;
        v29 = v27;
        v30 = v25;
        v31 = buf;
        dispatch_group_async(v12, queue, block);

      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v14);
  }

  dispatch_group_wait(v12, 0xFFFFFFFFFFFFFFFFLL);
  v19 = objc_alloc(MEMORY[0x1E0CF8FD8]);
  v20 = (void *)objc_msgSend(v19, "initWithnotificationRankingSections:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  __atxlog_handle_notification_categorization();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "count");
    *(_DWORD *)v36 = 136315394;
    v37 = "-[ATXNotificationCategorizationServer rankUserNotificationWithRequest:completion:]";
    v38 = 2048;
    v39 = v22;
    _os_log_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEFAULT, "%s: Ranked notifications into %ld sections", v36, 0x16u);
  }

  v23[2](v23, v20, 0);
  _Block_object_dispose(buf, 8);

}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  uint64_t v35;
  id v36;
  _QWORD v37[4];
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;
  _QWORD v48[2];

  v48[1] = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_categorization();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_cold_1(a1, v2);

  v3 = (void *)objc_opt_new();
  v4 = objc_alloc(MEMORY[0x1E0CF8FC8]);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("critical"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithWeight:value:", v5, &unk_1E83CCA18);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v6, CFSTR("critical"));

  v7 = objc_alloc(MEMORY[0x1E0CF8FC8]);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("timeSensitive"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithWeight:value:", v8, &unk_1E83CCA18);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v9, CFSTR("timeSensitive"));

  v10 = objc_alloc(MEMORY[0x1E0CF8FC8]);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("isMessage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithWeight:value:", v11, &unk_1E83CCA18);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("isMessage"));

  v13 = objc_alloc(MEMORY[0x1E0CF8FC8]);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("personScore"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithWeight:value:", v14, &unk_1E83CCA18);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("personScore"));

  v16 = objc_alloc(MEMORY[0x1E0CF8FC8]);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("tendencyToOpenAppAfterNotification"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithWeight:value:", v17, &unk_1E83CCA18);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v18, CFSTR("tendencyToOpenAppAfterNotification"));

  v19 = objc_alloc(MEMORY[0x1E0CF8FC8]);
  objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("llmScore"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithWeight:value:", v20, &unk_1E83CCA18);
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v21, CFSTR("llmScore"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "urgency") == 0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("critical"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setValue:", v22);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", objc_msgSend(*(id *)(a1 + 32), "urgency") == 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("timeSensitive"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setValue:", v24);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(*(id *)(a1 + 32), "isMessage"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("isMessage"));
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setValue:", v26);

  v42 = 0;
  v43 = &v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy__50;
  v46 = __Block_byref_object_dispose__50;
  v47 = (id)objc_opt_new();
  v28 = objc_alloc(MEMORY[0x1E0CF8FD0]);
  v29 = (void *)objc_msgSend(v28, "initWithFeatures:metadata:", v3, v43[5]);
  v30 = objc_alloc(MEMORY[0x1E0CF8FE0]);
  v48[0] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 1);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v30, "initWithUserNotifications:featureSet:", v31, v29);

  v37[0] = MEMORY[0x1E0C809B0];
  v37[1] = 3221225472;
  v37[2] = __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_61;
  v37[3] = &unk_1E82E3CD0;
  v34 = *(NSObject **)(a1 + 48);
  v33 = *(_QWORD *)(a1 + 56);
  v35 = *(_QWORD *)(a1 + 32);
  v38 = v32;
  v39 = v35;
  v40 = v33;
  v41 = &v42;
  v36 = v32;
  dispatch_sync(v34, v37);

  _Block_object_dispose(&v42, 8);
}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_61(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "addObject:", *(_QWORD *)(a1 + 32));
  __atxlog_handle_notification_categorization();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_61_cold_1(a1, v2);

}

- (void)fetchContextForNotificationWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  double v31;
  void *v32;
  uint64_t v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "userNotification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_PASLazyResult result](self->_notificationSenderImportanceModel, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calculateSenderImportanceForNotificationWithContextRequest:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "senderImportanceScore");
    v13 = v12;
    objc_msgSend(v8, "notificationSenderImportanceThreshold");
    if (v13 >= v14)
    {
      v30 = objc_alloc(MEMORY[0x1E0CF8F88]);
      objc_msgSend(v11, "senderImportanceScore");
      v21 = v31;
      objc_msgSend(v11, "featureDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v30;
      v24 = 2;
    }
    else
    {
      objc_msgSend(v11, "senderImportanceScore");
      v16 = v15;
      objc_msgSend(v8, "notificationSenderImportanceThreshold");
      v18 = v17;
      v19 = objc_alloc(MEMORY[0x1E0CF8F88]);
      objc_msgSend(v11, "senderImportanceScore");
      v21 = v20;
      objc_msgSend(v11, "featureDictionary");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v19;
      v24 = v16 < v18;
    }
    v32 = (void *)objc_msgSend(v23, "initWithNotificationSenderImportance:importanceConfidenceScore:notificationFeatureDictionary:", v24, v22, v21);
    v7[2](v7, v32, 0);

  }
  else
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0CF8AC8];
    v27 = *MEMORY[0x1E0CF8AD0];
    v33 = *MEMORY[0x1E0CB2938];
    v34[0] = CFSTR("ATXNotificationCategorizationServer: Invalid Request Object: Nil ATXUserNotification object.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v29);

  }
}

- (void)fetchContextForMailWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "mailMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_PASLazyResult result](self->_mailSenderImportanceModel, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASLazyResult result](self->_contactStore, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASLazyResult result](self->_contactRelationships, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calculateSenderImportanceForMailWithContextRequest:contactStore:contactRelationships:", v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "senderImportanceScore");
    v15 = v14;
    objc_msgSend(v8, "mailSenderImportanceThreshold");
    if (v15 >= v16)
    {
      v32 = objc_alloc(MEMORY[0x1E0CF8F20]);
      objc_msgSend(v13, "senderImportanceScore");
      v23 = v33;
      objc_msgSend(v13, "featureDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v32;
      v26 = 2;
    }
    else
    {
      objc_msgSend(v13, "senderImportanceScore");
      v18 = v17;
      objc_msgSend(v8, "mailSenderImportanceThreshold");
      v20 = v19;
      v21 = objc_alloc(MEMORY[0x1E0CF8F20]);
      objc_msgSend(v13, "senderImportanceScore");
      v23 = v22;
      objc_msgSend(v13, "featureDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      v26 = v18 < v20;
    }
    v34 = (void *)objc_msgSend(v25, "initWithMailSenderImportance:importanceConfidenceScore:mailFeatureDictionary:", v26, v24, v23);
    v7[2](v7, v34, 0);

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CF8A80];
    v29 = *MEMORY[0x1E0CF8A88];
    v35 = *MEMORY[0x1E0CB2938];
    v36[0] = CFSTR("ATXNotificationCategorizationServer: Invalid Request Object: Nil ATXMailMessage object.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v31);

  }
}

- (void)fetchContextForMessageWithRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, void *, _QWORD);
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  double v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, void *, _QWORD))a4;
  v8 = (void *)objc_opt_new();
  objc_msgSend(v6, "textMessage");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[_PASLazyResult result](self->_messageSenderImportanceModel, "result");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASLazyResult result](self->_contactStore, "result");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[_PASLazyResult result](self->_contactRelationships, "result");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "calculateSenderImportanceForMessageWithContextRequest:contactStore:contactRelationships:", v6, v11, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "senderImportanceScore");
    v15 = v14;
    objc_msgSend(v8, "messageSenderImportanceThreshold");
    if (v15 >= v16)
    {
      v32 = objc_alloc(MEMORY[0x1E0CF8F28]);
      objc_msgSend(v13, "senderImportanceScore");
      v23 = v33;
      objc_msgSend(v13, "featureDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v32;
      v26 = 2;
    }
    else
    {
      objc_msgSend(v13, "senderImportanceScore");
      v18 = v17;
      objc_msgSend(v8, "messageSenderImportanceThreshold");
      v20 = v19;
      v21 = objc_alloc(MEMORY[0x1E0CF8F28]);
      objc_msgSend(v13, "senderImportanceScore");
      v23 = v22;
      objc_msgSend(v13, "featureDictionary");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = v21;
      v26 = v18 < v20;
    }
    v34 = (void *)objc_msgSend(v25, "initWithMessageSenderImportance:importanceConfidenceScore:messageFeatureDictionary:", v26, v24, v23);
    v7[2](v7, v34, 0);

  }
  else
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = *MEMORY[0x1E0CF8A90];
    v29 = *MEMORY[0x1E0CF8A98];
    v35 = *MEMORY[0x1E0CB2938];
    v36[0] = CFSTR("ATXNotificationCategorizationServer: Invalid Request Object: Nil ATXTextMessage object.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "errorWithDomain:code:userInfo:", v28, v29, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v7)[2](v7, 0, v31);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactRelationships, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_messageSenderImportanceModel, 0);
  objc_storeStrong((id *)&self->_mailSenderImportanceModel, 0);
  objc_storeStrong((id *)&self->_notificationSenderImportanceModel, 0);
  objc_storeStrong((id *)&self->_featuresCorrelator, 0);
  objc_storeStrong((id *)&self->_listener, 0);
}

- (void)listener:(uint64_t)a3 shouldAcceptNewConnection:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, a2, a3, "ATXNotificationCategorizationServer: Rejecting connection %@ without entitlement %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Unexpected Interruption: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

void __74__ATXNotificationCategorizationServer_listener_shouldAcceptNewConnection___block_invoke_43_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_1_5(&dword_1C9A3B000, v0, v1, "%s: Connection invalidated: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)collectCoreAnalyticsJsonForNotification:(void *)a1 completion:(NSObject *)a2 .cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  int v10;
  const char *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "bundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "notificationID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recordDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v8 = v7;
  objc_msgSend(a1, "body");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 136316163;
  v11 = "-[ATXNotificationCategorizationServer collectCoreAnalyticsJsonForNotification:completion:]";
  v12 = 2112;
  v13 = v4;
  v14 = 2112;
  v15 = v5;
  v16 = 2048;
  v17 = v8;
  v18 = 2117;
  v19 = v9;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "%s: Got nil queryResult. Failed to find notification in database with bundleId: %@ notificationId: %@ recordTimestamp: %f body: %{sensitive}@", (uint8_t *)&v10, 0x34u);

}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = 136315394;
  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%s: Ranking notification %@", (uint8_t *)v4, 0x16u);

}

void __82__ATXNotificationCategorizationServer_rankUserNotificationWithRequest_completion___block_invoke_61_cold_1(uint64_t a1, NSObject *a2)
{
  void *v4;
  uint64_t v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 40), "uuid");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
  v6 = 136315650;
  v7 = "-[ATXNotificationCategorizationServer rankUserNotificationWithRequest:completion:]_block_invoke";
  v8 = 2112;
  v9 = v4;
  v10 = 2112;
  v11 = v5;
  _os_log_debug_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_DEBUG, "%s: Done ranking notification %@, llmMetadata: %@", (uint8_t *)&v6, 0x20u);

}

@end
