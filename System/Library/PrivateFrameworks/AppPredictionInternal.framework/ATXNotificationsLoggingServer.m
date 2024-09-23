@implementation ATXNotificationsLoggingServer

+ (ATXNotificationsLoggingServer)sharedInstance
{
  if (sharedInstance_onceToken_11 != -1)
    dispatch_once(&sharedInstance_onceToken_11, &__block_literal_global_212);
  return (ATXNotificationsLoggingServer *)(id)sharedInstance_instance_4;
}

void __47__ATXNotificationsLoggingServer_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_instance_4;
  sharedInstance_instance_4 = v0;

}

- (ATXNotificationsLoggingServer)init
{
  ATXNotificationsLoggingServer *v2;
  ATXModeTimelineManager *v3;
  ATXModeTimelineManager *modeTimelineManager;
  uint64_t v5;
  _ATXAggregateLogger *aggdlogger;
  uint64_t v7;
  ATXBBNotificationManager *bbNotificationManager;
  ATXNotificationDeliverySuggestionManager *v9;
  ATXNotificationDeliverySuggestionManager *notificationDeliverySuggestionManager;
  uint64_t v11;
  _PASLazyPurgeableResult *cachedLoggingSources;
  uint64_t v13;
  OS_dispatch_queue *donationQueue;
  uint64_t v15;
  ATXNotificationsDedupeTracker *dedupetracker;
  uint64_t v17;
  _DKKnowledgeSaving *duetstorer;
  uint64_t v19;
  NSXPCListener *listener;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)ATXNotificationsLoggingServer;
  v2 = -[ATXNotificationsLoggingServer init](&v22, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(ATXModeTimelineManager);
    modeTimelineManager = v2->_modeTimelineManager;
    v2->_modeTimelineManager = v3;

    +[_ATXAggregateLogger sharedInstance](_ATXAggregateLogger, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    aggdlogger = v2->_aggdlogger;
    v2->_aggdlogger = (_ATXAggregateLogger *)v5;

    +[ATXBBNotificationManager sharedInstance](ATXBBNotificationManager, "sharedInstance");
    v7 = objc_claimAutoreleasedReturnValue();
    bbNotificationManager = v2->_bbNotificationManager;
    v2->_bbNotificationManager = (ATXBBNotificationManager *)v7;

    v9 = objc_alloc_init(ATXNotificationDeliverySuggestionManager);
    notificationDeliverySuggestionManager = v2->_notificationDeliverySuggestionManager;
    v2->_notificationDeliverySuggestionManager = v9;

    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0D815E0]), "initWithBlock:idleTimeout:", &__block_literal_global_35_3, 1800.0);
    cachedLoggingSources = v2->_cachedLoggingSources;
    v2->_cachedLoggingSources = (_PASLazyPurgeableResult *)v11;

    objc_msgSend(MEMORY[0x1E0D81598], "autoreleasingSerialQueueWithLabel:", "ATXNotificationsLoggingServer-donateNotification");
    v13 = objc_claimAutoreleasedReturnValue();
    donationQueue = v2->_donationQueue;
    v2->_donationQueue = (OS_dispatch_queue *)v13;

    +[ATXNotificationsDedupeTracker sharedInstance](ATXNotificationsDedupeTracker, "sharedInstance");
    v15 = objc_claimAutoreleasedReturnValue();
    dedupetracker = v2->_dedupetracker;
    v2->_dedupetracker = (ATXNotificationsDedupeTracker *)v15;

    objc_msgSend(MEMORY[0x1E0D15A50], "knowledgeStore");
    v17 = objc_claimAutoreleasedReturnValue();
    duetstorer = v2->_duetstorer;
    v2->_duetstorer = (_DKKnowledgeSaving *)v17;

    v19 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B58]), "initWithMachServiceName:", CFSTR("com.apple.notifications.logging"));
    listener = v2->_listener;
    v2->_listener = (NSXPCListener *)v19;

    -[NSXPCListener setDelegate:](v2->_listener, "setDelegate:", v2);
    -[NSXPCListener resume](v2->_listener, "resume");
  }
  return v2;
}

id __37__ATXNotificationsLoggingServer_init__block_invoke()
{
  return (id)objc_opt_new();
}

- (void)_donateNotificationToPortraitWithNotificationsInterface:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  OS_dispatch_queue *donationQueue;
  NSObject *v11;
  uint8_t v12[8];
  _QWORD v13[4];
  id v14;

  v4 = a3;
  objc_msgSend(v4, "sectionID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
  {
    objc_msgSend(v4, "message");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      -[ATXNotificationsLoggingServer _createPortraitNotificationWithNotificationInterface:](self, "_createPortraitNotificationWithNotificationInterface:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (void *)MEMORY[0x1E0D81598];
      donationQueue = self->_donationQueue;
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke;
      v13[3] = &unk_1E82DAC38;
      v14 = v8;
      v11 = v8;
      objc_msgSend(v9, "runAsyncOnQueue:afterDelaySeconds:block:", donationQueue, v13, 60.0);

      goto LABEL_7;
    }
  }
  else
  {

  }
  __atxlog_handle_default();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v12 = 0;
    _os_log_impl(&dword_1C9A3B000, v11, OS_LOG_TYPE_DEFAULT, "ATXNotificationsLoggingServer could not donate notification to PersonalizationPortrait as it was missing a sectionID or message", v12, 2u);
  }
LABEL_7:

}

void __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke(uint64_t a1)
{
  uint64_t v1;
  int v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;

  v1 = *(_QWORD *)(a1 + 32);
  v12 = 0;
  v2 = objc_msgSend(MEMORY[0x1E0D70B28], "donateNotification:error:", v1, &v12);
  v3 = v12;
  __atxlog_handle_default();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v2)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_1(v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_2((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  }

}

- (id)_createPortraitNotificationWithNotificationInterface:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (objc_class *)MEMORY[0x1E0D70BE8];
  v4 = a3;
  v5 = [v3 alloc];
  objc_msgSend(v4, "sectionID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "subtitle");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "message");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_msgSend(v5, "initWithCurrentDateAndBundleId:title:subtitle:message:", v6, v7, v8, v9);
  return v10;
}

- (void)logNotificationWithMetadata:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v8 = a4;
  v9 = a5;
  if (-[ATXNotificationsDedupeTracker addNotificationId:](self->_dedupetracker, "addNotificationId:", v8))
  {
    objc_msgSend(MEMORY[0x1E0CF8978], "getBundleIdFromMetadata:", v12);
    v10 = objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      v11 = (void *)v10;
      -[ATXBBNotificationManager addNotificationForBundleId:withPublicationDate:](self->_bbNotificationManager, "addNotificationForBundleId:withPublicationDate:", v10, v9);
      -[ATXNotificationsLoggingServer logNotificationToCoreDuet:withNotificationId:timestamp:](self, "logNotificationToCoreDuet:withNotificationId:timestamp:", v12, v8, v9);

    }
  }

}

- (void)logNotificationToCoreDuet:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5
{
  id v8;
  void *v9;
  id v10;

  v8 = a5;
  -[ATXNotificationsLoggingServer getDuetMetadataFromNotification:metadata:](self, "getDuetMetadataFromNotification:metadata:", a4, a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  ATXNEventTypeToString();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingServer logToCoreDuet:identifier:timestamp:](self, "logToCoreDuet:identifier:timestamp:", v10, v9, v8);

}

- (void)_logEventToCoreDuet:(int64_t)a3 forNotificationId:(id)a4 timestamp:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D15A98], "identifier");
    v9 = objc_claimAutoreleasedReturnValue();
    v12 = v9;
    v13[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ATXNEventTypeToString();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXNotificationsLoggingServer logToCoreDuet:identifier:timestamp:](self, "logToCoreDuet:identifier:timestamp:", v10, v11, v8);

  }
  else
  {
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[ATXNotificationsLoggingServer _logEventToCoreDuet:forNotificationId:timestamp:].cold.1(v9);
  }

}

- (void)logNotification:(id)a3 withNotificationId:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;

  v8 = a5;
  v9 = a4;
  v11 = a3;
  objc_msgSend(v11, "extractMetadata");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXNotificationsLoggingServer logNotificationWithMetadata:withNotificationId:timestamp:](self, "logNotificationWithMetadata:withNotificationId:timestamp:", v10, v9, v8);

  -[ATXNotificationsLoggingServer _donateNotificationToPortraitWithNotificationsInterface:](self, "_donateNotificationToPortraitWithNotificationsInterface:", v11);
}

- (void)getModeTimelineDataFromStartDate:(id)a3 reply:(id)a4
{
  void (**v6)(id, void *, _QWORD);
  ATXModeTimelineManager *modeTimelineManager;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = (void (**)(id, void *, _QWORD))a4;
  modeTimelineManager = self->_modeTimelineManager;
  v8 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXModeTimelineManager modeFromStartDate:toEndDate:](modeTimelineManager, "modeFromStartDate:toEndDate:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  v6[2](v6, v10, 0);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v9[16];

  v5 = a4;
  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_INFO, "Established connection", v9, 2u);
  }

  ATXNotificationsLoggingInterface();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExportedInterface:", v7);

  objc_msgSend(v5, "setExportedObject:", self);
  objc_msgSend(v5, "resume");

  return 1;
}

- (void)logToCoreDuet:(id)a3 identifier:(id)a4 timestamp:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _DKKnowledgeSaving *v17;
  _DKKnowledgeSaving *duetstorer;
  void *v19;
  char v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D15A38];
  -[ATXNotificationsLoggingServer duetValueType](self, "duetValueType");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "identifierWithString:type:", v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x1E0D159F8];
  -[ATXNotificationsLoggingServer getDuetStream](self, "getDuetStream");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "eventWithStream:startDate:endDate:value:metadata:", v15, v10, v10, v13, v8);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = self->_duetstorer;
  objc_sync_enter(v17);
  duetstorer = self->_duetstorer;
  v30[0] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v20 = -[_DKKnowledgeSaving saveObjects:error:](duetstorer, "saveObjects:error:", v19, &v29);
  v21 = v29;

  if ((v20 & 1) == 0)
  {
    __atxlog_handle_default();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[ATXNotificationsLoggingServer logToCoreDuet:identifier:timestamp:].cold.1((uint64_t)v21, v22, v23, v24, v25, v26, v27, v28);

  }
  objc_sync_exit(v17);

}

- (id)getDuetMetadataFromNotification:(id)a3 metadata:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;
  void *v16;
  _QWORD v17[2];
  _QWORD v18[3];

  v18[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CF8978], "getBundleIdFromMetadata:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8CE8], "parentAppBundleIdForClipBundleID:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0D15A98], "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = v9;
  v18[0] = v5;
  objc_msgSend(MEMORY[0x1E0D15A98], "bundleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v17[1] = v10;
  v18[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addEntriesFromDictionary:", v11);

  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0D15990], "appBundleID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v12;
    v16 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addEntriesFromDictionary:", v13);

  }
  return v8;
}

- (id)getDuetStream
{
  return (id)objc_msgSend(MEMORY[0x1E0D15A18], "eventStreamWithName:", CFSTR("/notification/usage"));
}

- (id)duetValueType
{
  return (id)objc_msgSend(MEMORY[0x1E0D159D8], "typeForName:", CFSTR("notificationEvent"));
}

- (id)getLockscreenBundleIds
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1CAA48B6C](self, a2);
  v3 = (void *)objc_opt_new();
  objc_msgSend(v3, "allBundleIdsOfNotificationsOnLockscreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v2);
  return v4;
}

- (void)activeSuggestionsWithReply:(id)a3
{
  -[ATXNotificationDeliverySuggestionManager activeSuggestionsWithReply:](self->_notificationDeliverySuggestionManager, "activeSuggestionsWithReply:", a3);
}

- (void)logNotificationEvent:(int64_t)a3 notification:(id)a4 reason:(unint64_t)a5 interactionUI:(unint64_t)a6
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
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
  id v37;
  void *v38;
  unsigned int v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;

  v49 = a4;
  v10 = (void *)objc_opt_new();
  objc_msgSend(v49, "bundleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSectionID:", v11);

  objc_msgSend(v49, "title");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTitle:", v12);

  objc_msgSend(v49, "subtitle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSubtitle:", v13);

  objc_msgSend(v49, "body");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setMessage:", v14);

  objc_msgSend(v49, "categoryID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTopic:", v15);

  objc_msgSend(v49, "uuid");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "UUIDString");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v49, "timestamp");
  objc_msgSend(v18, "dateWithTimeIntervalSinceReferenceDate:");
  v19 = objc_claimAutoreleasedReturnValue();
  if ((unint64_t)a3 <= 0x11 && ((1 << a3) & 0x30001) != 0)
    -[ATXNotificationsLoggingServer logNotification:withNotificationId:timestamp:](self, "logNotification:withNotificationId:timestamp:", v10, v17, v19);
  v46 = (void *)v19;
  -[_PASLazyPurgeableResult result](self->_cachedLoggingSources, "result");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "contactRepresentationDatastore");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "setRawIdentifiersWithContactRepresentationDataStore:", v21);

  v45 = v20;
  objc_msgSend(v20, "userNotificationBiomeStream");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "sendEvent:notification:deliveryReason:interactionUI:", a3, v49, a5, a6);

  v37 = objc_alloc(MEMORY[0x1E0D02100]);
  v44 = (void *)objc_opt_new();
  objc_msgSend(v44, "UUIDString");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_alloc(MEMORY[0x1E0C99D68]);
  objc_msgSend(v49, "timestamp");
  v42 = (void *)objc_msgSend(v23, "initWithTimeIntervalSinceReferenceDate:");
  v47 = v10;
  if ((unint64_t)(a3 - 1) > 0x1A)
    v39 = 0;
  else
    v39 = dword_1C9E80AF8[a3 - 1];
  objc_msgSend(v49, "bundleID");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "uuid");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "UUIDString");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "title");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "subtitle");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v49, "badge"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "threadID");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "categoryID");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "sectionID");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "contactIDs");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v49, "isGroupMessage"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = (void *)MEMORY[0x1E0CF8CE8];
  objc_msgSend(v49, "bundleID");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "parentAppBundleIdForClipBundleID:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v49, "bodyLength"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = (void *)objc_msgSend(v37, "initWithUniqueID:absoluteTimestamp:usageType:bundleID:notificationID:deviceID:title:subtitle:body:badge:threadID:categoryID:sectionID:contactIDs:isGroupMessage:parentBundleID:bodyLength:", v43, v42, v39, v38, v36, 0, v48, v34, 0, v33, v32, v35, v31, v24, v25, v28,
                  v29);

  objc_msgSend(v45, "notificationUsageSource");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "sendEvent:", v40);

}

- (void)logSuggestionEvent:(int64_t)a3 suggestionType:(int64_t)a4 suggestionIdentifier:(id)a5 timestamp:(id)a6
{
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v9 = (objc_class *)MEMORY[0x1E0CF9010];
  v10 = a6;
  v11 = a5;
  v14 = (id)objc_msgSend([v9 alloc], "initWithSuggestionType:eventType:suggestionUUID:eventDate:", a4, a3, v11, v10);

  v12 = (void *)objc_opt_new();
  objc_msgSend(v12, "source");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sendEvent:", v14);

}

- (void)logNotificationDeliveryUI:(unint64_t)a3 notificationUUIDs:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  ATXNotificationDeliveryEvent *v8;
  void *v9;
  void *v10;

  v5 = a4;
  v6 = v5;
  if (!v5)
  {
    __atxlog_handle_notification_management();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      -[ATXNotificationsLoggingServer logNotificationDeliveryUI:notificationUUIDs:].cold.1(a3, v7);

    v6 = (id)MEMORY[0x1E0C9AA60];
  }
  v8 = -[ATXNotificationDeliveryEvent initWithDeliveryUI:suggestionUUIDs:]([ATXNotificationDeliveryEvent alloc], "initWithDeliveryUI:suggestionUUIDs:", a3, v6);
  v9 = (void *)objc_opt_new();
  objc_msgSend(v9, "source");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "sendEvent:", v8);

}

- (void)logNotificationGroupEvent:(int64_t)a3 eventIdentifier:(id)a4 timestamp:(id)a5
{
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v7 = (objc_class *)MEMORY[0x1E0CF8FA0];
  v8 = a5;
  v9 = a4;
  v12 = (id)objc_msgSend([v7 alloc], "initWithEventType:uuid:eventDate:", a3, v9, v8);

  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "source");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "sendEvent:", v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_donationQueue, 0);
  objc_storeStrong((id *)&self->_notificationDeliverySuggestionManager, 0);
  objc_storeStrong((id *)&self->_modeTimelineManager, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_duetstorer, 0);
  objc_storeStrong((id *)&self->_cachedLoggingSources, 0);
  objc_storeStrong((id *)&self->_dedupetracker, 0);
  objc_storeStrong((id *)&self->_bbNotificationManager, 0);
  objc_storeStrong((id *)&self->_aggdlogger, 0);
}

void __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_DEBUG, "ATXNotificationsLoggingServer successfully donated notification to PersonalizationPortrait", v1, 2u);
}

void __89__ATXNotificationsLoggingServer__donateNotificationToPortraitWithNotificationsInterface___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "ATXNotificationsLoggingServer could not donate notification to PersonalizationPortrait: %@", a5, a6, a7, a8, 2u);
}

- (void)_logEventToCoreDuet:(os_log_t)log forNotificationId:timestamp:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Nullability violation: notificationId is nil", v1, 2u);
}

- (void)logToCoreDuet:(uint64_t)a3 identifier:(uint64_t)a4 timestamp:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1C9A3B000, a2, a3, "Notifications donation to CoreDuet failed: %@", a5, a6, a7, a8, 2u);
}

- (void)logNotificationDeliveryUI:(uint64_t)a1 notificationUUIDs:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  ATXNotificationDeliveryUIToString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138543362;
  v5 = v3;
  _os_log_fault_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_FAULT, "-logNotificationDeliveryUI:notificationUUIDs: deliveryUI: %{public}@. notificationsUUIDs was nil, this shouldn't happen.", (uint8_t *)&v4, 0xCu);

}

@end
