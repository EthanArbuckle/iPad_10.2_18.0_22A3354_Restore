@implementation CHSChronoServicesConnection

void __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reloadDescriptorsForContainerBundleIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

- (id)_queue_remoteTargetCreatingConnectionIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  BOOL v6;
  NSObject *v7;
  uint8_t v9[16];

  v3 = a3;
  BSDispatchQueueAssert();
  -[BSServiceConnection remoteTarget](self->_queue_connection, "remoteTarget");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = 1;
  else
    v6 = !v3;
  if (!v6)
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_18FB18000, v7, OS_LOG_TYPE_DEFAULT, "Creating connection", v9, 2u);
    }

    -[CHSChronoServicesConnection _queue_invalidateConnection](self, "_queue_invalidateConnection");
    -[CHSChronoServicesConnection _queue_createConnection](self, "_queue_createConnection");
    -[BSServiceConnection remoteTarget](self->_queue_connection, "remoteTarget");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)reloadDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
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
  block[2] = __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v12 = *(id *)(v6 + 40);
    objc_msgSend(v3, "reloadTimeline:error:", v5, &v12);
    v7 = v12;
    v8 = *(NSObject **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_1();
  }

}

- (BOOL)reloadTimeline:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  BOOL v9;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke;
  block[3] = &unk_1E2A5AC58;
  block[4] = self;
  v8 = v6;
  v12 = v8;
  v13 = &v14;
  dispatch_sync(queue, block);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v9 = v15[5] == 0;

  _Block_object_dispose(&v14, 8);
  return v9;
}

+ (void)_debugRestartServer
{
  dispatch_time_t v2;
  dispatch_queue_t *v3;
  id v4;

  v4 = objc_alloc_init(MEMORY[0x1E0CB3958]);
  objc_msgSend(v4, "setLaunchPath:", CFSTR("/usr/bin/killall"));
  objc_msgSend(v4, "setArguments:", &unk_1E2A82AC0);
  objc_msgSend(v4, "launch");
  objc_msgSend(v4, "waitUntilExit");
  v2 = dispatch_time(0, 1000000000);
  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v3 = (dispatch_queue_t *)objc_claimAutoreleasedReturnValue();
  dispatch_after(v2, v3[2], &__block_literal_global_4);

}

void __50__CHSChronoServicesConnection__debugRestartServer__block_invoke()
{
  id v0;
  id v1;

  +[CHSChronoServicesConnection sharedInstance](CHSChronoServicesConnection, "sharedInstance");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (id)objc_msgSend(v1, "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);

}

+ (CHSChronoServicesConnection)sharedInstance
{
  if (sharedInstance_onceToken_0 != -1)
    dispatch_once(&sharedInstance_onceToken_0, &__block_literal_global_8);
  return (CHSChronoServicesConnection *)(id)sharedInstance___sharedInstance_0;
}

void __45__CHSChronoServicesConnection_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CHSChronoServicesConnection _initWithMachServiceName:listenForReconnect:]([CHSChronoServicesConnection alloc], "_initWithMachServiceName:listenForReconnect:", CFSTR("com.apple.chronoservices"), 1);
  v1 = (void *)sharedInstance___sharedInstance_0;
  sharedInstance___sharedInstance_0 = (uint64_t)v0;

}

+ (id)ncBridgeConnection
{
  if (ncBridgeConnection_onceToken != -1)
    dispatch_once(&ncBridgeConnection_onceToken, &__block_literal_global_11);
  return (id)ncBridgeConnection___sharedInstance;
}

void __49__CHSChronoServicesConnection_ncBridgeConnection__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[CHSChronoServicesConnection _initWithMachServiceName:listenForReconnect:]([CHSChronoServicesConnection alloc], "_initWithMachServiceName:listenForReconnect:", CFSTR("com.apple.chronoservices.chronodbridge"), 0);
  v1 = (void *)ncBridgeConnection___sharedInstance;
  ncBridgeConnection___sharedInstance = (uint64_t)v0;

}

- (CHSChronoServicesConnection)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSChronoServicesConnection.m"), 114, CFSTR("use +sharedInstance"));

  return 0;
}

- (id)_initWithMachServiceName:(id)a3 listenForReconnect:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  CHSChronoServicesConnection *v7;
  uint64_t v8;
  NSString *machServiceName;
  uint64_t v10;
  NSHashTable *queue_observers;
  uint64_t v12;
  NSMapTable *queue_extensionProviderOptionsByClient;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *callOutQueue;
  uint64_t v20;
  NSMutableDictionary *queue_widgetHostsByHostIdentifier;
  int *p_serverStartupToken;
  uint64_t v23;
  void *v24;
  const char *v25;
  NSObject *v26;
  CHSServerSubscription *v27;
  CHSChronoServicesConnection *v28;
  uint64_t v29;
  CHSServerSubscription *notQueue_extensionsSubscription;
  CHSServerSubscription *v31;
  CHSChronoServicesConnection *v32;
  uint64_t v33;
  CHSServerSubscription *notQueue_remoteDevicesSubscription;
  CHSServerSubscription *v35;
  CHSChronoServicesConnection *v36;
  uint64_t v37;
  CHSServerSubscription *notQueue_timelineEntryRelevanceSubscription;
  CHSServerSubscription *v39;
  CHSChronoServicesConnection *v40;
  uint64_t v41;
  CHSServerSubscription *notQueue_widgetRelevanceSubscription;
  CHSServerSubscription *v43;
  CHSChronoServicesConnection *v44;
  uint64_t v45;
  CHSServerSubscription *notQueue_activityServiceSubscription;
  void *v47;
  CHSServerSubscription *v48;
  CHSServerSubscription *v49;
  void *v50;
  uint64_t v51;
  NSSet *notQueue_subscriptions;
  void *v54;
  _QWORD v55[4];
  CHSChronoServicesConnection *v56;
  _QWORD v57[4];
  CHSChronoServicesConnection *v58;
  _QWORD v59[4];
  CHSChronoServicesConnection *v60;
  _QWORD v61[4];
  CHSChronoServicesConnection *v62;
  _QWORD v63[4];
  CHSChronoServicesConnection *v64;
  _QWORD handler[4];
  CHSChronoServicesConnection *v66;
  objc_super v67;
  void *v68;
  _QWORD v69[5];
  __int128 v70;
  uint64_t v71;
  uint64_t v72;

  v4 = a4;
  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v67.receiver = self;
  v67.super_class = (Class)CHSChronoServicesConnection;
  v7 = -[CHSChronoServicesConnection init](&v67, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    machServiceName = v7->_machServiceName;
    v7->_machServiceName = (NSString *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    queue_observers = v7->_queue_observers;
    v7->_queue_observers = (NSHashTable *)v10;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v12 = objc_claimAutoreleasedReturnValue();
    queue_extensionProviderOptionsByClient = v7->_queue_extensionProviderOptionsByClient;
    v7->_queue_extensionProviderOptionsByClient = (NSMapTable *)v12;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = dispatch_queue_create("com.apple.chronoservices.CHSChronoServicesConnection", v14);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v15;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = dispatch_queue_create("com.apple.chronoservices.CHSChronoServicesConnection.call-out", v17);
    callOutQueue = v7->_callOutQueue;
    v7->_callOutQueue = (OS_dispatch_queue *)v18;

    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = objc_claimAutoreleasedReturnValue();
    queue_widgetHostsByHostIdentifier = v7->_queue_widgetHostsByHostIdentifier;
    v7->_queue_widgetHostsByHostIdentifier = (NSMutableDictionary *)v20;

    v7->_serverStartupToken = -1;
    p_serverStartupToken = &v7->_serverStartupToken;
    v23 = MEMORY[0x1E0C809B0];
    if (!v4)
    {
LABEL_8:
      v27 = [CHSServerSubscription alloc];
      v63[0] = v23;
      v63[1] = 3221225472;
      v63[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_2;
      v63[3] = &unk_1E2A5ABE0;
      v28 = v7;
      v64 = v28;
      v29 = -[CHSServerSubscription initWithIdentifier:serverSubscriptionBlock:](v27, "initWithIdentifier:serverSubscriptionBlock:", CFSTR("extensions"), v63);
      notQueue_extensionsSubscription = v28->_notQueue_extensionsSubscription;
      v28->_notQueue_extensionsSubscription = (CHSServerSubscription *)v29;

      v31 = [CHSServerSubscription alloc];
      v61[0] = v23;
      v61[1] = 3221225472;
      v61[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_3;
      v61[3] = &unk_1E2A5ABE0;
      v32 = v28;
      v62 = v32;
      v33 = -[CHSServerSubscription initWithIdentifier:serverSubscriptionBlock:](v31, "initWithIdentifier:serverSubscriptionBlock:", CFSTR("remoteDevices"), v61);
      notQueue_remoteDevicesSubscription = v32->_notQueue_remoteDevicesSubscription;
      v32->_notQueue_remoteDevicesSubscription = (CHSServerSubscription *)v33;

      v35 = [CHSServerSubscription alloc];
      v59[0] = v23;
      v59[1] = 3221225472;
      v59[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_4;
      v59[3] = &unk_1E2A5ABE0;
      v36 = v32;
      v60 = v36;
      v37 = -[CHSServerSubscription initWithIdentifier:serverSubscriptionBlock:](v35, "initWithIdentifier:serverSubscriptionBlock:", CFSTR("timelineEntryRelevance"), v59);
      notQueue_timelineEntryRelevanceSubscription = v36->_notQueue_timelineEntryRelevanceSubscription;
      v36->_notQueue_timelineEntryRelevanceSubscription = (CHSServerSubscription *)v37;

      v39 = [CHSServerSubscription alloc];
      v57[0] = v23;
      v57[1] = 3221225472;
      v57[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_5;
      v57[3] = &unk_1E2A5ABE0;
      v40 = v36;
      v58 = v40;
      v41 = -[CHSServerSubscription initWithIdentifier:serverSubscriptionBlock:](v39, "initWithIdentifier:serverSubscriptionBlock:", CFSTR("widgetRelevance"), v57);
      notQueue_widgetRelevanceSubscription = v40->_notQueue_widgetRelevanceSubscription;
      v40->_notQueue_widgetRelevanceSubscription = (CHSServerSubscription *)v41;

      v43 = [CHSServerSubscription alloc];
      v55[0] = v23;
      v55[1] = 3221225472;
      v55[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_6;
      v55[3] = &unk_1E2A5ABE0;
      v44 = v40;
      v56 = v44;
      v45 = -[CHSServerSubscription initWithIdentifier:serverSubscriptionBlock:](v43, "initWithIdentifier:serverSubscriptionBlock:", CFSTR("activityService"), v55);
      notQueue_activityServiceSubscription = v44->_notQueue_activityServiceSubscription;
      v44->_notQueue_activityServiceSubscription = (CHSServerSubscription *)v45;

      v47 = (void *)MEMORY[0x1E0C99E60];
      v48 = v32->_notQueue_remoteDevicesSubscription;
      v69[0] = v28->_notQueue_extensionsSubscription;
      v69[1] = v48;
      v49 = v40->_notQueue_widgetRelevanceSubscription;
      v69[2] = v36->_notQueue_timelineEntryRelevanceSubscription;
      v69[3] = v49;
      v69[4] = v44->_notQueue_activityServiceSubscription;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 5);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "setWithArray:", v50);
      v51 = objc_claimAutoreleasedReturnValue();
      notQueue_subscriptions = v44->_notQueue_subscriptions;
      v44->_notQueue_subscriptions = (NSSet *)v51;

      goto LABEL_9;
    }
    v68 = 0;
    if (!ProactiveSuggestionClientModelLibraryCore_frameworkLibrary)
    {
      v70 = xmmword_1E2A5AF70;
      v71 = 0;
      ProactiveSuggestionClientModelLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (ProactiveSuggestionClientModelLibraryCore_frameworkLibrary)
    {
      v24 = v68;
      if (!v68)
      {
LABEL_7:
        v25 = CHSChronodStartupNotification;
        v26 = v7->_queue;
        handler[0] = v23;
        handler[1] = 3221225472;
        handler[2] = __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke;
        handler[3] = &unk_1E2A5ABB8;
        v66 = v7;
        notify_register_dispatch(v25, p_serverStartupToken, v26, handler);

        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *ProactiveSuggestionClientModelLibrary(void)");
      p_serverStartupToken = (int *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v54, "handleFailureInFunction:file:lineNumber:description:", p_serverStartupToken, CFSTR("CHSChronoServicesConnection.m"), 43, CFSTR("%s"), v68);

      __break(1u);
    }
    free(v24);
    goto LABEL_7;
  }
LABEL_9:

  return v7;
}

id __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeToExtensions");
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeToRemoteDevices");
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeToTimelineEntryRelevance");
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_5(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeToWidgetRelevance");
}

uint64_t __75__CHSChronoServicesConnection__initWithMachServiceName_listenForReconnect___block_invoke_6(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_subscribeToActivityService");
}

- (void)dealloc
{
  int serverStartupToken;
  objc_super v4;

  serverStartupToken = self->_serverStartupToken;
  if (serverStartupToken != -1)
    notify_cancel(serverStartupToken);
  v4.receiver = self;
  v4.super_class = (Class)CHSChronoServicesConnection;
  -[CHSChronoServicesConnection dealloc](&v4, sel_dealloc);
}

- (id)cachedExtensionsWithOptions:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isSubsetOf:", self->_queue_currentExtensionSubscriptionProviderOptions))
  {
    -[CHSServerSubscription cachedValue](self->_notQueue_extensionsSubscription, "cachedValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHSChronoServicesConnection _filterExtensions:toOptions:](self, "_filterExtensions:toOptions:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "description");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "cachedExtensionsWithOptions: Not using cache for %{public}@", (uint8_t *)&v11, 0xCu);

    }
    v7 = 0;
  }

  return v7;
}

- (void)addClient:(id)a3
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
  v7[2] = __41__CHSChronoServicesConnection_addClient___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __41__CHSChronoServicesConnection_addClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_addClient:", *(_QWORD *)(a1 + 40));
}

- (void)removeClient:(id)a3
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
  v7[2] = __44__CHSChronoServicesConnection_removeClient___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __44__CHSChronoServicesConnection_removeClient___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_removeClient:", *(_QWORD *)(a1 + 40));
}

- (id)subscribeToTimelineEntryRelevance:(id *)a3 outTimelineEntryRelevance:(id *)a4
{
  return -[CHSServerSubscription subscribeWithResult:error:](self->_notQueue_timelineEntryRelevanceSubscription, "subscribeWithResult:error:", a4, a3);
}

- (id)subscribeToWidgetRelevanceEvents:(id *)a3
{
  return -[CHSServerSubscription subscribeWithResult:error:](self->_notQueue_widgetRelevanceSubscription, "subscribeWithResult:error:", 0, a3);
}

- (id)subscribeToActivityPayloadUpdates:(id *)a3
{
  return -[CHSServerSubscription subscribeWithResult:error:](self->_notQueue_activityServiceSubscription, "subscribeWithResult:error:", 0, a3);
}

- (id)allPairedDevices
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__2;
  v10 = __Block_byref_object_dispose__2;
  v11 = (id)MEMORY[0x1E0C9AA60];
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __47__CHSChronoServicesConnection_allPairedDevices__block_invoke;
  v5[3] = &unk_1E2A5A300;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __47__CHSChronoServicesConnection_allPairedDevices__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allPairedDevices");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject devices](v5, "devices");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;

  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_1();
  }

}

- (void)pairDevice:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  CHSChronoServicesConnection *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, block);

}

void __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  int v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v10 = 138412290;
    v11 = v3;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Pairing device %@", (uint8_t *)&v10, 0xCu);
  }

  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "pairDeviceWith:completion:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else
  {
    CHSLogChronoServices();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_1();

    v8 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);

  }
}

- (BOOL)unpairDevice:(id)a3 error:(id *)a4
{
  id v6;
  NSObject *queue;
  id v8;
  char v9;
  _QWORD v11[4];
  id v12;
  CHSChronoServicesConnection *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;

  v6 = a3;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x2020000000;
  v19 = 0;
  queue = self->_queue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke;
  v11[3] = &unk_1E2A5AC08;
  v8 = v6;
  v12 = v8;
  v13 = self;
  v14 = &v16;
  v15 = &v20;
  dispatch_sync(queue, v11);
  if (a4)
    *a4 = objc_retainAutorelease((id)v21[5]);
  v9 = *((_BYTE *)v17 + 24);

  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);

  return v9;
}

void __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id obj;
  uint8_t buf[4];
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v16 = v3;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Unpairing device %@", buf, 0xCu);
  }

  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    obj = *(id *)(v8 + 40);
    v9 = objc_msgSend(v5, "unpairDeviceWith:error:", v7, &obj);
    objc_storeStrong((id *)(v8 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v9;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    CHSLogChronoServices();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_1();

  }
}

- (id)subscribeToRemoteDevices:(id *)a3 outRemoteDevices:(id *)a4
{
  return -[CHSServerSubscription subscribeWithResult:error:](self->_notQueue_remoteDevicesSubscription, "subscribeWithResult:error:", a4, a3);
}

- (BOOL)toggleRemoteWidgetsEnabled:(BOOL)a3 error:(id *)a4
{
  NSObject *queue;
  char v6;
  _QWORD v8[7];
  BOOL v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__2;
  v18 = __Block_byref_object_dispose__2;
  v19 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke;
  v8[3] = &unk_1E2A5AC30;
  v9 = a3;
  v8[4] = self;
  v8[5] = &v10;
  v8[6] = &v14;
  dispatch_sync(queue, v8);
  if (a4)
    *a4 = objc_retainAutorelease((id)v15[5]);
  v6 = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v14, 8);

  return v6;
}

void __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  const char *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id obj;
  uint8_t buf[4];
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    if (*(_BYTE *)(a1 + 56))
      v3 = "enabled";
    else
      v3 = "disabled";
    *(_DWORD *)buf = 136315138;
    v14 = v3;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Setting remote widgets to %s", buf, 0xCu);
  }

  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 56));
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v7 + 40);
    v8 = objc_msgSend(v5, "toggleRemoteWidgetsEnabled:error:", v6, &obj);
    objc_storeStrong((id *)(v7 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_1();
  }

}

- (BOOL)reloadRemoteWidgetsWithError:(id *)a3
{
  NSObject *queue;
  char v5;
  _QWORD block[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke;
  block[3] = &unk_1E2A5A698;
  block[4] = self;
  block[5] = &v8;
  block[6] = &v12;
  dispatch_sync(queue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v13[5]);
  v5 = *((_BYTE *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);

  return v5;
}

void __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  id obj;
  uint8_t buf[16];

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Reloading remote widgets", buf, 2u);
  }

  CHSLogChronoServices();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    obj = *(id *)(v6 + 40);
    v7 = objc_msgSend(v4, "reloadRemoteWidgetsWithError:", &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    CHSLogChronoServices();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_1();

  }
}

- (BOOL)remoteWidgetsEnabled
{
  NSObject *queue;
  char v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke;
  v5[3] = &unk_1E2A5A300;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v3, "remoteWidgetsEnabled");
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_1();

  }
}

- (void)flushPowerlog
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__CHSChronoServicesConnection_flushPowerlog__block_invoke;
  block[3] = &unk_1E2A5A2D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __44__CHSChronoServicesConnection_flushPowerlog__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;

  if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 32))
  {
    CHSLogChronoServices();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __44__CHSChronoServicesConnection_flushPowerlog__block_invoke_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
      objc_msgSend(v3, "flushPowerlog");

  }
}

- (void)retryStuckRemotePairings
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke;
  block[3] = &unk_1E2A5A2D8;
  block[4] = self;
  dispatch_async(queue, block);
}

void __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "retryStuckRemotePairings");
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_1();

  }
}

- (void)modifyDescriptorEnablement:(id)a3 completion:(id)a4
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
  block[2] = __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "modifyDescriptorEnablement:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v6 + 16))(v6, v7);

  }
}

- (void)performDescriptorDiscoveryForHost:(id)a3
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
  v7[2] = __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "performDescriptorDiscoveryForHost:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_1();

  }
}

- (void)fetchDescriptorsForContainerBundleIdentifier:(id)a3 completion:(id)a4
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
  block[2] = __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "fetchDescriptorsForContainerBundleIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

- (id)widgetEnvironmentDataForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke;
  block[3] = &unk_1E2A5AC80;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "widgetEnvironmentDataForBundleIdentifier:", *(_QWORD *)(a1 + 40));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_1(v8, v9, v10);

    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v7 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = 0;
  }

}

- (id)_URLSessionDidCompleteForExtensionWithBundleIdentifier:(id)a3 info:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__2;
  v21 = __Block_byref_object_dispose__2;
  v22 = 0;
  queue = self->_queue;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke;
  v13[3] = &unk_1E2A5ACA8;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v16 = &v17;
  v9 = v7;
  v10 = v6;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

void __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_URLSessionDidCompleteForExtensionWithBundleIdentifier:info:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;
  }
  else
  {
    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_1();

    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v7 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = 0;
  }

}

- (void)removeWidgetHost:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CHSChronoServicesConnection *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", 0, v2);
  CHSLogChronoServices();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "removeWidgetHostWithIdentifier:", v2);
  }
  else
  {
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_1((uint64_t)v2, v6, v7);

  }
}

- (void)updateWidgetHostConfigurations:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CHSChronoServicesConnection *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
  CHSLogChronoServices();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_2((uint64_t)v2, v3, v4);

  objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "configuration");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "activationState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setWidgetConfiguration:activationState:forWidgetHostWithIdentifier:", v6, v7, v2);

  }
  else
  {
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_1((uint64_t)v2, v6, v8);
  }

}

- (void)updateWidgetHostActivationState:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[4];
  id v8;
  CHSChronoServicesConnection *v9;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 56), "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), v2);
  CHSLogChronoServices();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 40), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v5 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "activationState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setActivationState:forWidgetHostWithIdentifier:", v6, v5);

  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_1();
  }

}

- (void)allWidgetConfigurationsByHostWithCompletion:(id)a3
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
  v7[2] = __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke;
  v7[3] = &unk_1E2A5A808;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "allWidgetConfigurationsByHostWithCompletion:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);

  }
}

- (void)getAppIntentsXPCListenerEndpointForBundleIdentifier:(id)a3 completion:(id)a4
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
  block[2] = __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "getAppIntentsXPCListenerEndpointForBundleIdentifier:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_1();

    v6 = *(_QWORD *)(a1 + 48);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, _QWORD, void *))(v6 + 16))(v6, 0, 0, v7);

  }
}

- (void)launchLiveActivityWithID:(id)a3 deviceID:(id)a4 url:(id)a5
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
  v15[2] = __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke;
  v15[3] = &unk_1E2A5ACD0;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(queue, v15);

}

void __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "launchLiveActivityWithID:deviceID:url:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_1();

  }
}

- (id)subscribeToExtensions:(id *)a3 fromClient:(id)a4 withOptions:(id)a5 outExtensions:(id *)a6
{
  id v10;
  id v11;
  uint64_t v12;
  NSObject *queue;
  id v14;
  id v15;
  CHSServerSubscription *notQueue_extensionsSubscription;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  _QWORD v25[6];
  id v26;
  id location;
  id v28;
  _QWORD v29[5];
  id v30;
  _QWORD block[5];
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;
  char v38;

  v10 = a4;
  v11 = a5;
  v35 = 0;
  v36 = &v35;
  v37 = 0x2020000000;
  v38 = 0;
  v12 = MEMORY[0x1E0C809B0];
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke;
  block[3] = &unk_1E2A5ACF8;
  block[4] = self;
  v14 = v11;
  v32 = v14;
  v34 = &v35;
  v15 = v10;
  v33 = v15;
  dispatch_sync(queue, block);
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__2;
  v29[4] = __Block_byref_object_dispose__2;
  notQueue_extensionsSubscription = self->_notQueue_extensionsSubscription;
  v28 = 0;
  -[CHSServerSubscription subscribeWithResult:forcingServerUpdate:error:](notQueue_extensionsSubscription, "subscribeWithResult:forcingServerUpdate:error:", &v28, *((unsigned __int8 *)v36 + 24), a3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v28;
  v30 = v17;
  objc_initWeak(&location, v15);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = objc_alloc(MEMORY[0x1E0D01868]);
  v25[0] = v12;
  v25[1] = 3221225472;
  v25[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_53;
  v25[3] = &unk_1E2A5AD70;
  v25[4] = self;
  objc_copyWeak(&v26, &location);
  v25[5] = v29;
  v22 = (void *)objc_msgSend(v21, "initWithIdentifier:forReason:invalidationBlock:", v20, CFSTR("extensionSubscription"), v25);
  if (a6)
  {
    objc_msgSend(v18, "extensions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[CHSChronoServicesConnection _filterExtensions:toOptions:](self, "_filterExtensions:toOptions:", v23, v14);
    *a6 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_destroyWeak(&v26);

  objc_destroyWeak(&location);
  _Block_object_dispose(v29, 8);

  _Block_object_dispose(&v35, 8);
  return v22;
}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  objc_msgSend(*(id *)(a1 + 40), "mergedWith:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = objc_msgSend(v2, "isEqual:", v3) ^ 1;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "setObject:forKey:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v3);
  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "description");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
      v7 = CFSTR("YES");
    else
      v7 = CFSTR("NO");
    v8 = 138543618;
    v9 = v5;
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "Extension subscription updating options to %{public}@, forcing update %@", (uint8_t *)&v8, 0x16u);

  }
}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_53(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[7];
  id v5;
  _QWORD v6[3];
  char v7;

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v7 = 0;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_2;
  v4[3] = &unk_1E2A5AD48;
  objc_copyWeak(&v5, (id *)(a1 + 48));
  v3 = *(_QWORD *)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v4[5] = v6;
  v4[6] = v3;
  dispatch_async(v2, v4);
  objc_destroyWeak(&v5);
  _Block_object_dispose(v6, 8);
}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  CHSWidgetExtensionProviderOptions *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  CHSWidgetExtensionProviderOptions *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSObject *v13;
  _QWORD block[5];
  int8x16_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "Extension subscription count reduced; adjusting server subscription and publishing results.",
      buf,
      2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "removeObjectForKey:", WeakRetained);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "count") != 0;
  v4 = -[CHSWidgetExtensionProviderOptions initWithWidgetsPredicate:controlsPredicate:includeIntents:]([CHSWidgetExtensionProviderOptions alloc], "initWithWidgetsPredicate:controlsPredicate:includeIntents:", 0, 0, 0);
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v17;
    do
    {
      v8 = 0;
      v9 = v4;
      do
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v8));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[CHSWidgetExtensionProviderOptions mergedWith:](v9, "mergedWith:", v10);
        v4 = (CHSWidgetExtensionProviderOptions *)objc_claimAutoreleasedReturnValue();

        ++v8;
        v9 = v4;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v22, 16);
    }
    while (v6);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v4);
  CHSLogChronoServices();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[CHSWidgetExtensionProviderOptions description](v4, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v21 = v12;
    _os_log_impl(&dword_18FB18000, v11, OS_LOG_TYPE_DEFAULT, "Extension subscription updating options to %{public}@", buf, 0xCu);

  }
  dispatch_get_global_queue(33, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_55;
  block[3] = &unk_1E2A5AD20;
  v15 = vextq_s8(*(int8x16_t *)(a1 + 40), *(int8x16_t *)(a1 + 40), 8uLL);
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v13, block);

}

void __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_55(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  id v12;
  _QWORD block[5];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "invalidate");
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = 0;

  if (*(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24))
  {
    v4 = *(void **)(a1[4] + 96);
    v15 = 0;
    objc_msgSend(v4, "updateSubscription:", &v15);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v15;
    objc_msgSend(v5, "extensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = objc_msgSend(v7, "count");
      *(_DWORD *)buf = 134217984;
      v17 = v9;
      _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "Extension subscription new extension count: %lu", buf, 0xCu);
    }

    v10 = a1[4];
    v11 = *(NSObject **)(v10 + 16);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_56;
    block[3] = &unk_1E2A5A290;
    block[4] = v10;
    v14 = v7;
    v12 = v7;
    dispatch_async(v11, block);

  }
}

uint64_t __90__CHSChronoServicesConnection_subscribeToExtensions_fromClient_withOptions_outExtensions___block_invoke_56(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyExtensionsDidChange:generatedWithOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

- (void)loadSuggestedWidget:(id)a3 metrics:(id)a4 stackIdentifier:(id)a5 reason:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  NSObject *queue;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  queue = self->_queue;
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke;
  v23[3] = &unk_1E2A5AD98;
  v23[4] = self;
  v24 = v12;
  v25 = v13;
  v26 = v14;
  v27 = v15;
  v28 = v16;
  v18 = v16;
  v19 = v15;
  v20 = v14;
  v21 = v13;
  v22 = v12;
  dispatch_async(queue, v23);

}

void __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "loadSuggestedWidget:metrics:stackIdentifier:reason:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_1();

  }
}

- (void)suggestionBudgetsForStackIdentifiers:(id)a3 completion:(id)a4
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
  block[2] = __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke;
  block[3] = &unk_1E2A5A350;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  NSObject *v7;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    +[CHSArrayBox boxedValue:](CHSArrayBox, "boxedValue:", *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_59;
    v6[3] = &unk_1E2A5ADC0;
    v7 = *(id *)(a1 + 48);
    objc_msgSend(v3, "suggestionBudgetsForStackIdentifiers:completion:", v4, v6);

    v5 = v7;
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_1();
  }

}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_59(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a3;
  v5 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "value");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, void *, id))(v5 + 16))(v5, v6, v7);

}

- (id)acquireKeepAliveAssertionForExtensionBundleIdentifier:(id)a3 reason:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *queue;
  id v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__2;
  v30 = __Block_byref_object_dispose__2;
  v31 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke;
  block[3] = &unk_1E2A5ADE8;
  block[4] = self;
  v18 = &v26;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v19 = &v20;
  dispatch_sync(queue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = (id)v27[5];

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  id obj;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_2();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(_QWORD *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = 0;
    objc_msgSend(v3, "acquireKeepAliveAssertionForExtensionBundleIdentifier:reason:error:", v5, v6, &obj);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;
  }
  else
  {
    CHSLogChronoServices();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_1();

    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    v10 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;
  }

}

- (void)reloadWidgetRelevanceForExtensionIdentity:(id)a3 kind:(id)a4 completion:(id)a5
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
  v15[2] = __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke;
  v15[3] = &unk_1E2A5AE10;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

void __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "reloadWidgetRelevanceForExtensionIdentifier:kind:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)invalidateRelevancesOfKind:(id)a3 inBundle:(id)a4 completion:(id)a5
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
  v15[2] = __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke;
  v15[3] = &unk_1E2A5AE10;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

void __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "invalidateRelevancesOfKind:inBundle:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)acquireLifetimeAssertionForWidget:(id)a3 metrics:(id)a4 completion:(id)a5
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
  v15[2] = __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke;
  v15[3] = &unk_1E2A5AE10;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(queue, v15);

}

void __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "acquireLifetimeAssertionForWidget:metrics:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

  }
}

- (void)timelineEntryRelevanceDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  BSDispatchQueueAssertNot();
  objc_msgSend(v4, "timelineRelevanceEntries");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSServerSubscription setCachedValue:](self->_notQueue_timelineEntryRelevanceSubscription, "setCachedValue:", v5);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __63__CHSChronoServicesConnection_timelineEntryRelevanceDidChange___block_invoke;
  v8[3] = &unk_1E2A5A290;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __63__CHSChronoServicesConnection_timelineEntryRelevanceDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyTimelineEntryRelevanceDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)widgetExtensionsDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  CHSServerSubscription *notQueue_extensionsSubscription;
  uint64_t v10;
  id v11;
  NSObject *queue;
  _QWORD v13[5];
  id v14;
  uint64_t *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssertNot();
  v5 = objc_msgSend(v4, "sequenceNumber");
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__2;
  v24 = __Block_byref_object_dispose__2;
  v25 = 0;
  CHSLogChronoServices();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "extensions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134218240;
    v27 = v5;
    v28 = 2048;
    v29 = v8;
    _os_log_impl(&dword_18FB18000, v6, OS_LOG_TYPE_DEFAULT, "Received extensions box sequence %lu, with %lu extensions", buf, 0x16u);

  }
  notQueue_extensionsSubscription = self->_notQueue_extensionsSubscription;
  v10 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke;
  v16[3] = &unk_1E2A5AE38;
  v18 = &v20;
  v19 = v5;
  v11 = v4;
  v17 = v11;
  -[CHSServerSubscription updateCachedValue:](notQueue_extensionsSubscription, "updateCachedValue:", v16);
  if (v21[5])
  {
    queue = self->_queue;
    v13[0] = v10;
    v13[1] = 3221225472;
    v13[2] = __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke_62;
    v13[3] = &unk_1E2A5AC80;
    v13[4] = self;
    v15 = &v20;
    v14 = v11;
    dispatch_async(queue, v13);

  }
  _Block_object_dispose(&v20, 8);

}

id __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  id v11;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 <= objc_msgSend(v3, "sequenceNumber"))
  {
    CHSLogChronoServices();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(_QWORD *)(a1 + 48);
      v13 = 134217984;
      v14 = v10;
      _os_log_impl(&dword_18FB18000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring stale extensions box change %lu", (uint8_t *)&v13, 0xCu);
    }

    v8 = v3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "extensions");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    v8 = *(void **)(a1 + 32);
  }
  v11 = v8;

  return v11;
}

void __57__CHSChronoServicesConnection_widgetExtensionsDidChange___block_invoke_62(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  v1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "options");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_queue_notifyExtensionsDidChange:generatedWithOptions:", v1);

}

- (void)handleWidgetRelevanceEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __58__CHSChronoServicesConnection_handleWidgetRelevanceEvent___block_invoke;
  v7[3] = &unk_1E2A5A290;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

uint64_t __58__CHSChronoServicesConnection_handleWidgetRelevanceEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyHandleWidgetRelevanceEvent:", *(_QWORD *)(a1 + 40));
}

- (void)nearbyDevicesDidChange:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  BSDispatchQueueAssertNot();
  objc_msgSend(v4, "devices");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CHSServerSubscription setCachedValue:](self->_notQueue_remoteDevicesSubscription, "setCachedValue:", v5);
  queue = self->_queue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __54__CHSChronoServicesConnection_nearbyDevicesDidChange___block_invoke;
  v8[3] = &unk_1E2A5A290;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(queue, v8);

}

uint64_t __54__CHSChronoServicesConnection_nearbyDevicesDidChange___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDevicesDidChange:", *(_QWORD *)(a1 + 40));
}

- (void)activityDidUpdate:(id)a3 payloadID:(id)a4
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
  BSDispatchQueueAssertNot();
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__CHSChronoServicesConnection_activityDidUpdate_payloadID___block_invoke;
  block[3] = &unk_1E2A5A468;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

uint64_t __59__CHSChronoServicesConnection_activityDidUpdate_payloadID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDidReceiveActivityUpdate:payloadID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_queue_notifyDevicesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *callOutQueue;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  CHSLogChronoServices();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Notifying of %lu remote devices changed.", buf, 0xCu);
  }

  v6 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  callOutQueue = self->_callOutQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __61__CHSChronoServicesConnection__queue_notifyDevicesDidChange___block_invoke;
  v10[3] = &unk_1E2A5A290;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(callOutQueue, v10);

}

void __61__CHSChronoServicesConnection__queue_notifyDevicesDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "nearbyDevicesDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_queue_notifyExtensionsDidChange:(id)a3 generatedWithOptions:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *callOutQueue;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22;
  CHSChronoServicesConnection *v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  v8 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  CHSLogChronoServices();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(v8, "count");
    v11 = objc_msgSend(v6, "count");
    objc_msgSend(v7, "description");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218498;
    v26 = v10;
    v27 = 2048;
    v28 = v11;
    v29 = 2112;
    v30 = v12;
    _os_log_impl(&dword_18FB18000, v9, OS_LOG_TYPE_DEFAULT, "Notifying %lu clients of %lu widget extensions changed for opt %@.", buf, 0x20u);

  }
  v13 = (void *)-[NSMapTable copy](self->_queue_extensionProviderOptionsByClient, "copy");
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __85__CHSChronoServicesConnection__queue_notifyExtensionsDidChange_generatedWithOptions___block_invoke;
  block[3] = &unk_1E2A5AE60;
  v20 = v8;
  v21 = v13;
  v22 = v7;
  v23 = self;
  v24 = v6;
  v15 = v6;
  v16 = v7;
  v17 = v13;
  v18 = v8;
  dispatch_async(callOutQueue, block);

}

void __85__CHSChronoServicesConnection__queue_notifyExtensionsDidChange_generatedWithOptions___block_invoke(uint64_t a1)
{
  uint64_t v2;
  __int128 v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  __int128 v14;
  id obj;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
  if (v2)
  {
    v16 = *(_QWORD *)v18;
    *(_QWORD *)&v3 = 134218242;
    v14 = v3;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v18 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v4);
        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(*(id *)(a1 + 40), "objectForKey:", v5);
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v7 = v6;
          if (*(_QWORD *)(a1 + 48) && !objc_msgSend(v6, "isSubsetOf:"))
          {
            CHSLogChronoServices();
            v8 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v7, "description");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = v14;
              v22 = v5;
              v23 = 2114;
              v24 = (uint64_t)v12;
              _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "Not notifying client:%p because options don't match, wanted %{public}@", buf, 0x16u);

            }
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 56), "_filterExtensions:toOptions:", *(_QWORD *)(a1 + 64), v7, v14);
            v8 = objc_claimAutoreleasedReturnValue();
            CHSLogChronoServices();
            v9 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
            {
              v10 = -[NSObject count](v8, "count");
              objc_msgSend(v7, "description");
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 134218498;
              v22 = v5;
              v23 = 2048;
              v24 = v10;
              v25 = 2114;
              v26 = v11;
              _os_log_impl(&dword_18FB18000, v9, OS_LOG_TYPE_DEFAULT, "Notifying client:%p of %lu widget extensions changed, opts: %{public}@.", buf, 0x20u);

            }
            objc_msgSend(v5, "widgetExtensionsDidChange:", v8);
          }

        }
        ++v4;
      }
      while (v2 != v4);
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v27, 16);
      v2 = v13;
    }
    while (v13);
  }

}

- (id)_filterExtensions:(id)a3 toOptions:(id)a4
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  id obj;
  id v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke;
  v32[3] = &unk_1E2A5AE88;
  v23 = v5;
  v33 = v23;
  objc_msgSend(a3, "bs_filter:", v32);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  obj = v21;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v29 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v11, "orderedWidgetDescriptors");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v26[0] = v6;
        v26[1] = 3221225472;
        v26[2] = __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_2;
        v26[3] = &unk_1E2A5A328;
        v13 = v23;
        v27 = v13;
        objc_msgSend(v12, "bs_filter:", v26);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v11, "orderedControlDescriptors");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = v6;
        v24[1] = 3221225472;
        v24[2] = __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_3;
        v24[3] = &unk_1E2A5AA00;
        v25 = v13;
        objc_msgSend(v15, "bs_filter:", v24);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        v17 = (void *)objc_msgSend(v11, "mutableCopy");
        objc_msgSend(v17, "setOrderedWidgetDescriptors:", v14);
        objc_msgSend(v17, "setOrderedControlDescriptors:", v16);
        v18 = (void *)objc_msgSend(v17, "copy");
        objc_msgSend(v7, "addObject:", v18);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v8);
  }

  v19 = (void *)objc_msgSend(v7, "copy");
  return v19;
}

uint64_t __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesExtension:", a2);
}

uint64_t __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesWidgetDescriptor:", a2);
}

uint64_t __59__CHSChronoServicesConnection__filterExtensions_toOptions___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "matchesControlDescriptor:", a2);
}

- (void)_queue_notifyTimelineEntryRelevanceDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *callOutQueue;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  CHSLogChronoServices();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = objc_msgSend(v4, "count");
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Notifying of %lu timeline entry relevance sets changed.", buf, 0xCu);
  }

  v6 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  callOutQueue = self->_callOutQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __76__CHSChronoServicesConnection__queue_notifyTimelineEntryRelevanceDidChange___block_invoke;
  v10[3] = &unk_1E2A5A290;
  v11 = v6;
  v12 = v4;
  v8 = v4;
  v9 = v6;
  dispatch_async(callOutQueue, v10);

}

void __76__CHSChronoServicesConnection__queue_notifyTimelineEntryRelevanceDidChange___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "timelineEntryRelevanceDidChange:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_queue_notifyHandleWidgetRelevanceEvent:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *callOutQueue;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  BSDispatchQueueAssert();
  CHSLogChronoServices();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "description");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v15 = v6;
    _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "Notifying of widget relevance event %@", buf, 0xCu);

  }
  v7 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  callOutQueue = self->_callOutQueue;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__CHSChronoServicesConnection__queue_notifyHandleWidgetRelevanceEvent___block_invoke;
  v11[3] = &unk_1E2A5A290;
  v12 = v7;
  v13 = v4;
  v9 = v4;
  v10 = v7;
  dispatch_async(callOutQueue, v11);

}

void __71__CHSChronoServicesConnection__queue_notifyHandleWidgetRelevanceEvent___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "handleWidgetRelevanceEvent:", *(_QWORD *)(a1 + 40), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_queue_notifyDidReceiveActivityUpdate:(id)a3 payloadID:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *callOutQueue;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssert();
  CHSLogChronoServices();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v19 = v6;
    v20 = 2112;
    v21 = v7;
    _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "Notifying of activity update %@ payload ID %@", buf, 0x16u);
  }

  v9 = (void *)-[NSHashTable copy](self->_queue_observers, "copy");
  callOutQueue = self->_callOutQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __79__CHSChronoServicesConnection__queue_notifyDidReceiveActivityUpdate_payloadID___block_invoke;
  block[3] = &unk_1E2A5A468;
  v15 = v9;
  v16 = v6;
  v17 = v7;
  v11 = v7;
  v12 = v6;
  v13 = v9;
  dispatch_async(callOutQueue, block);

}

void __79__CHSChronoServicesConnection__queue_notifyDidReceiveActivityUpdate_payloadID___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = *(_QWORD *)v8;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v8 != v4)
          objc_enumerationMutation(v2);
        v6 = *(void **)(*((_QWORD *)&v7 + 1) + 8 * v5);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v6, "activityDidUpdate:payloadID:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), (_QWORD)v7);
        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v3);
  }

}

- (void)_queue_createConnection
{
  void *v3;
  NSString *machServiceName;
  void *v5;
  BSServiceConnection *v6;
  BSServiceConnection *queue_connection;
  BSServiceConnection *v8;
  id v9;
  _QWORD v10[5];

  BSDispatchQueueAssert();
  if (!self->_queue_connection)
  {
    v3 = (void *)MEMORY[0x1E0D03458];
    machServiceName = self->_machServiceName;
    +[CHSChronoWidgetServiceSpecification identifier](CHSChronoWidgetServiceSpecification, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endpointForMachName:service:instance:", machServiceName, v5, 0);
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D03448], "connectionWithEndpoint:", v9);
    v6 = (BSServiceConnection *)objc_claimAutoreleasedReturnValue();
    queue_connection = self->_queue_connection;
    self->_queue_connection = v6;

    v8 = self->_queue_connection;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke;
    v10[3] = &unk_1E2A5A790;
    v10[4] = self;
    -[BSServiceConnection configureConnection:](v8, "configureConnection:", v10);
    -[BSServiceConnection activate](self->_queue_connection, "activate");

  }
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];

  v3 = a2;
  +[CHSChronoWidgetServiceSpecification serviceQuality](CHSChronoWidgetServiceSpecification, "serviceQuality");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v4);

  +[CHSChronoWidgetServiceSpecification interface](CHSChronoWidgetServiceSpecification, "interface");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  v6 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2;
  v9[3] = &unk_1E2A5AEB0;
  v9[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setActivationHandler:", v9);
  v8[0] = v6;
  v8[1] = 3221225472;
  v8[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_5;
  v8[3] = &unk_1E2A5AEB0;
  v8[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInterruptionHandler:", v8);
  v7[0] = v6;
  v7[1] = 3221225472;
  v7[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_84;
  v7[3] = &unk_1E2A5AEB0;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v7);

}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  uint64_t v26;
  id v27;
  _QWORD v28[5];
  id v29;
  _QWORD v30[5];
  id v31;
  _QWORD block[5];
  id v33;
  uint8_t buf[16];

  v3 = a2;
  CHSLogChronoServices();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FB18000, v4, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection activated", buf, 2u);
  }

  v5 = *(_QWORD *)(a1 + 32);
  v6 = MEMORY[0x1E0C809B0];
  v7 = *(NSObject **)(v5 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_80;
  block[3] = &unk_1E2A5A290;
  block[4] = v5;
  v8 = v3;
  v33 = v8;
  dispatch_async(v7, block);
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "resubscribeIfNecessary"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "cachedValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "extensions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 16);
    v30[0] = v6;
    v30[1] = 3221225472;
    v30[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_81;
    v30[3] = &unk_1E2A5A290;
    v30[4] = v11;
    v31 = v10;
    v13 = v10;
    dispatch_async(v12, v30);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "resubscribeIfNecessary"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "cachedValue");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = *(_QWORD *)(a1 + 32);
    v16 = *(NSObject **)(v15 + 16);
    v28[0] = v6;
    v28[1] = 3221225472;
    v28[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3;
    v28[3] = &unk_1E2A5A290;
    v28[4] = v15;
    v29 = v14;
    v17 = v14;
    dispatch_async(v16, v28);

  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "resubscribeIfNecessary"))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 104), "cachedValue");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = *(_QWORD *)(a1 + 32);
    v20 = *(NSObject **)(v19 + 16);
    v22 = v6;
    v23 = 3221225472;
    v24 = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_4;
    v25 = &unk_1E2A5A290;
    v26 = v19;
    v27 = v18;
    v21 = v18;
    dispatch_async(v20, &v22);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "resubscribeIfNecessary", v22, v23, v24, v25, v26);

}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_80(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 32) = 1;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v2; ++i)
      {
        if (*(_QWORD *)v12 != v3)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 56), "objectForKeyedSubscript:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "remoteTarget");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "configuration");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "activationState"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setWidgetConfiguration:activationState:forWidgetHostWithIdentifier:", v8, v9, v5);

      }
      v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v2);
  }

}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_81(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyExtensionsDidChange:generatedWithOptions:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64));
}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyDevicesDidChange:", *(_QWORD *)(a1 + 40));
}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_queue_notifyTimelineEntryRelevanceDidChange:", *(_QWORD *)(a1 + 40));
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _QWORD block[5];
  uint8_t buf[8];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18FB18000, v2, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection interrupted", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(NSObject **)(v3 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_83;
  block[3] = &unk_1E2A5A2D8;
  block[4] = v3;
  dispatch_async(v4, block);
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v5 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v8++), "noteConnectionTerminated", (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v9, v15, 16);
    }
    while (v6);
  }

}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_83(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

void __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_2_84(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD block[5];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3_85;
  block[3] = &unk_1E2A5A2D8;
  block[4] = v2;
  dispatch_async(v3, block);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = *(id *)(*(_QWORD *)(a1 + 32) + 88);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "noteConnectionTerminated");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

  CHSLogChronoServices();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "chrono widget service (service-side) connection invalidated", v9, 2u);
  }

}

uint64_t __54__CHSChronoServicesConnection__queue_createConnection__block_invoke_3_85(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 32) = 0;
  return result;
}

- (void)_queue_invalidateConnection
{
  BSServiceConnection *queue_connection;
  BSServiceConnection *v4;

  BSDispatchQueueAssert();
  queue_connection = self->_queue_connection;
  if (queue_connection)
  {
    -[BSServiceConnection invalidate](queue_connection, "invalidate");
    v4 = self->_queue_connection;
    self->_queue_connection = 0;

  }
}

- (void)_queue_addClient:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssert();
  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSChronoServicesConnection.m"), 1058, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != nil"));

    v5 = 0;
  }
  -[NSHashTable addObject:](self->_queue_observers, "addObject:", v5);

}

- (void)_queue_removeClient:(id)a3
{
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  BSDispatchQueueAssert();
  v5 = v7;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("CHSChronoServicesConnection.m"), 1065, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client != nil"));

    v5 = 0;
  }
  -[NSHashTable removeObject:](self->_queue_observers, "removeObject:", v5);
  -[NSMapTable removeObjectForKey:](self->_queue_extensionProviderOptionsByClient, "removeObjectForKey:", v7);

}

- (void)setCachedExtensions:(id)a3 withProviderOptions:(id)a4
{
  id v6;
  CHSWidgetExtensionsBox *v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;

  v10 = a3;
  v6 = a4;
  v7 = -[CHSWidgetExtensionsBox initWithExtensions:generatedFrom:]([CHSWidgetExtensionsBox alloc], "initWithExtensions:generatedFrom:", v10, v6);
  -[CHSServerSubscription setCachedValue:](self->_notQueue_extensionsSubscription, "setCachedValue:", v7);
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__CHSChronoServicesConnection_setCachedExtensions_withProviderOptions___block_invoke;
  block[3] = &unk_1E2A5A290;
  block[4] = self;
  v12 = v6;
  v9 = v6;
  dispatch_sync(queue, block);

}

void __71__CHSChronoServicesConnection_setCachedExtensions_withProviderOptions___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), *(id *)(a1 + 40));
}

- (id)_subscribeToExtensions
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  CHSServerSubscriptionResult *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke;
  v6[3] = &unk_1E2A5A300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  id location;
  uint8_t buf[24];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_2(a1, v2, v3);

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_initWeak(&location, *(id *)(a1 + 32));
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_93;
    v11[3] = &unk_1E2A5AED8;
    objc_copyWeak(&v12, &location);
    v11[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v4, "subscribeToExtensionsWithProviderOptions:completion:", v5, v11);
    CHSLogChronoServices();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "value");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_1(v7, (uint64_t)buf, v6);
    }

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    CHSLogChronoServices();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18FB18000, v8, OS_LOG_TYPE_DEFAULT, "Completing extensions task failed; unable to obtain the remote target",
        buf,
        2u);
    }

    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setError:", v10);

  }
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_93(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id WeakRetained;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAssertion:", v8);
      v11 = objc_msgSend(v7, "sequenceNumber");
      CHSLogChronoServices();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v7, "extensions");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 134218240;
        v17 = v11;
        v18 = 2048;
        v19 = objc_msgSend(v13, "count");
        _os_log_impl(&dword_18FB18000, v12, OS_LOG_TYPE_DEFAULT, "Subscription initial extensions box sequence %lu, with %lu extensions", (uint8_t *)&v16, 0x16u);

      }
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setValue:", v7);
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setError:", v9);
    }
    else if (v9)
    {
      CHSLogChronoServices();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v9, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_93_cold_1(v15, (uint64_t)&v16, v14);
      }

    }
  }

}

- (id)_subscribeToTimelineEntryRelevance
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  CHSServerSubscriptionResult *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke;
  v6[3] = &unk_1E2A5A300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_95;
    v9[3] = &unk_1E2A5AF00;
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "subscribeToTimelineEntryRelevance:", v9);
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "acquire relevance timeline monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setError:", v7);

  }
}

void __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_95(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAssertion:", v7);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v11, "timelineRelevanceEntries");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setError:", v8);
}

- (id)_subscribeToRemoteDevices
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  CHSServerSubscriptionResult *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke;
  v6[3] = &unk_1E2A5A300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_97;
    v9[3] = &unk_1E2A5AF28;
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "subscribeToRemoteDevices:", v9);
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "acquire device monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setError:", v7);

  }
}

void __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_97(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a2;
  v7 = a3;
  v8 = a4;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAssertion:", v7);
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v11, "devices");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setValue:", v10);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setError:", v8);
}

- (id)_subscribeToWidgetRelevance
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  CHSServerSubscriptionResult *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke;
  v6[3] = &unk_1E2A5A300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_99;
    v9[3] = &unk_1E2A5AF50;
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "subscribeToWidgetRelevance:", v9);
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "acquire widget relevance monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setError:", v7);

  }
}

void __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_99(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAssertion:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setError:", v5);

}

- (id)_subscribeToActivityService
{
  NSObject *queue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  CHSServerSubscriptionResult *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2;
  v11 = __Block_byref_object_dispose__2;
  v12 = objc_alloc_init(CHSServerSubscriptionResult);
  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke;
  v6[3] = &unk_1E2A5A300;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(queue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[8];
  _QWORD v9[5];

  CHSLogChronoServices();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_cold_1();

  objc_msgSend(*(id *)(a1 + 32), "_queue_remoteTargetCreatingConnectionIfNecessary:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_101;
    v9[3] = &unk_1E2A5AF50;
    v9[4] = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "subscribeToActivityPayloadUpdates:", v9);
  }
  else
  {
    CHSLogChronoServices();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_18FB18000, v5, OS_LOG_TYPE_DEFAULT, "acquire widget relevance monitor assertion failed; unable to obtain the remote target",
        v8,
        2u);
    }

    v6 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    objc_msgSend(MEMORY[0x1E0CB35C8], "serverUnavailable");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setError:", v7);

  }
}

void __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_101(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setAssertion:", v6);
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "setError:", v5);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notQueue_activityServiceSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_widgetRelevanceSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_remoteDevicesSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_timelineEntryRelevanceSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_extensionsSubscription, 0);
  objc_storeStrong((id *)&self->_notQueue_subscriptions, 0);
  objc_storeStrong((id *)&self->_callOutQueue, 0);
  objc_storeStrong((id *)&self->_queue_currentExtensionSubscriptionProviderOptions, 0);
  objc_storeStrong((id *)&self->_queue_widgetHostsByHostIdentifier, 0);
  objc_storeStrong((id *)&self->_queue_extensionProviderOptionsByClient, 0);
  objc_storeStrong((id *)&self->_queue_observers, 0);
  objc_storeStrong((id *)&self->_queue_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_machServiceName, 0);
}

void __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "fetch all devices failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __47__CHSChronoServicesConnection_allPairedDevices__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: allDevices", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "pairing device failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __53__CHSChronoServicesConnection_pairDevice_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: pairDevice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "unpair device failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __50__CHSChronoServicesConnection_unpairDevice_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: unpairDevice", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "toggle remote widgets failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __64__CHSChronoServicesConnection_toggleRemoteWidgetsEnabled_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: toggleRemoteWidgetsOn", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "reload remote widgets failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __60__CHSChronoServicesConnection_reloadRemoteWidgetsWithError___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: reloadRemoteWidgetsWithError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "remoteWidgetsEnabled failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __51__CHSChronoServicesConnection_remoteWidgetsEnabled__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: remoteWidgetsEnabled", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __44__CHSChronoServicesConnection_flushPowerlog__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: flushPowerlog", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "retry stuck remote pairings failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __55__CHSChronoServicesConnection_retryStuckRemotePairings__block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: retryStuckRemotePairings", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "perform modifyDescriptorEnablement failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __69__CHSChronoServicesConnection_modifyDescriptorEnablement_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: modifyDescriptorEnablement", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "perform descriptor discovery failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __65__CHSChronoServicesConnection_performDescriptorDiscoveryForHost___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: performDescriptorDiscovery", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "notifying server to reload descriptors failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __88__CHSChronoServicesConnection_reloadDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: reloadDescriptorsIfNecessaryForContainerBundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "notifying server to fetch descriptors if necessary failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __87__CHSChronoServicesConnection_fetchDescriptorsForContainerBundleIdentifier_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: fetchDescriptorsForContainerBundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "reloading timeline failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __52__CHSChronoServicesConnection_reloadTimeline_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: reloadTimeline:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "-[CHSChronoServicesConnection widgetEnvironmentDataForBundleIdentifier:]_block_invoke";
  OUTLINED_FUNCTION_4_0(&dword_18FB18000, a1, a3, "Completing %s failed; unable to obtain the remote target",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void __72__CHSChronoServicesConnection_widgetEnvironmentDataForBundleIdentifier___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: widgetEnvironmentDataForBundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Completing NSURLSession task failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __91__CHSChronoServicesConnection__URLSessionDidCompleteForExtensionWithBundleIdentifier_info___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: _URLSessionDidCompleteForExtensionWithBundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4_0(&dword_18FB18000, a2, a3, "Failed to remove widget host with identifier %@; unable to obtain the remote target",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void __48__CHSChronoServicesConnection_removeWidgetHost___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: removeWidgetHostWithIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_4_0(&dword_18FB18000, a2, a3, "Failed to set configuration for widget host with identifier %@; unable to obtain the remote target",
    (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void __62__CHSChronoServicesConnection_updateWidgetHostConfigurations___block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_5(&dword_18FB18000, a2, a3, "xpc: setWidgetConfiguration with identifier=%{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

void __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Setting host activation state failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __63__CHSChronoServicesConnection_updateWidgetHostActivationState___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: setWidgetHostActivationState:forWidgetHostWithIdentifier:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Fetching widget configurations by host failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __75__CHSChronoServicesConnection_allWidgetConfigurationsByHostWithCompletion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: allWidgetConfigurationsByHostWithCompletion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Fetching AppIntents XPC listener endpoint by host failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __94__CHSChronoServicesConnection_getAppIntentsXPCListenerEndpointForBundleIdentifier_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: getAppIntentsXPCListenerEndpointForBundleIdentifier", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Launching app for remote Live Activity on device failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __69__CHSChronoServicesConnection_launchLiveActivityWithID_deviceID_url___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: launchLiveActivityWithIDdeviceID", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Loading suggested widget failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __93__CHSChronoServicesConnection_loadSuggestedWidget_metrics_stackIdentifier_reason_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: loadSuggestedWidget", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "Loading suggested budgets for stack identifiers failed; unable to obtain remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __79__CHSChronoServicesConnection_suggestionBudgetsForStackIdentifiers_completion___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: suggestionBudgetsForStackIdentifiers", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_0(&dword_18FB18000, v0, v1, "acquire keep alive assertion failed; unable to obtain the remote target",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_3();
}

void __98__CHSChronoServicesConnection_acquireKeepAliveAssertionForExtensionBundleIdentifier_reason_error___block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: acquireKeepAliveAssertionWithError", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __89__CHSChronoServicesConnection_reloadWidgetRelevanceForExtensionIdentity_kind_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: reloadWidgetRelevance", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __78__CHSChronoServicesConnection_invalidateRelevancesOfKind_inBundle_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: invalidateRelevancesOfKind:inBundle:completion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __84__CHSChronoServicesConnection_acquireLifetimeAssertionForWidget_metrics_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: acquireLifetimeAssertionForWidget:metrics:completion:", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138412290;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_5(&dword_18FB18000, a3, (uint64_t)a3, "xpc: extensions subscription - result: %@", (uint8_t *)a2);

}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64);
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_5(&dword_18FB18000, a2, a3, "xpc: extension subscription - options=%{public}@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_6();
}

void __53__CHSChronoServicesConnection__subscribeToExtensions__block_invoke_93_cold_1(void *a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)a2 = 138543362;
  *(_QWORD *)(a2 + 4) = a1;
  OUTLINED_FUNCTION_4_0(&dword_18FB18000, a3, (uint64_t)a3, "Subscription resulted in error %{public}@", (uint8_t *)a2);

}

void __65__CHSChronoServicesConnection__subscribeToTimelineEntryRelevance__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: acquireRelevanceMonitorAssertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __56__CHSChronoServicesConnection__subscribeToRemoteDevices__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: acquireDeviceMonitorAssertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__CHSChronoServicesConnection__subscribeToWidgetRelevance__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: acquireWidgetRelevanceMonitorAssertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __58__CHSChronoServicesConnection__subscribeToActivityService__block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_18FB18000, v0, v1, "xpc: acquireActivityServiceMonitorAssertion", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

@end
