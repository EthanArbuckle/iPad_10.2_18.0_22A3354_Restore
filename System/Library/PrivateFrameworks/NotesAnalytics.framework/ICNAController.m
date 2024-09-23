@implementation ICNAController

void __34__ICNAController_sharedController__block_invoke()
{
  ICNAController *v0;
  void *v1;

  v0 = objc_alloc_init(ICNAController);
  v1 = (void *)sharedController_s_instance_0;
  sharedController_s_instance_0 = (uint64_t)v0;

}

- (ICNAController)init
{
  ICNAController *v2;
  NSObject *v3;
  NSObject *v4;
  dispatch_queue_t v5;
  OS_dispatch_queue *instrumentationQueue;
  void *v7;
  uint64_t v8;
  AAAppSessionManager *appSessionManager;
  id v10;
  void *v11;
  uint64_t v12;
  AAClient *client;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  AAUploadBatchEventConfig *uploadBatchEventConfig;
  ICNAServerEnvironment *v19;
  ICNAServerEnvironment *serverEnvironment;
  uint64_t v21;
  AAFlushManager *flushManager;
  NSMutableDictionary *v23;
  NSMutableDictionary *sessionForWindowDict;
  NSMutableDictionary *v25;
  NSMutableDictionary *sessionTrackerForWindowDict;
  uint64_t v27;
  NSNumber *endSessionBackgroundTaskIdentifier;
  NSMutableDictionary *v29;
  NSMutableDictionary *endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier;
  ICNAMultiSceneSessionTracker *v31;
  ICNAMultiSceneSessionTracker *multiSceneSessionTracker;
  void *v33;
  id v34;
  objc_super v36;

  v36.receiver = self;
  v36.super_class = (Class)ICNAController;
  v2 = -[ICNAOptedInObject init](&v36, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = dispatch_queue_create_with_target_V2("ICNAController.instrumentationQueue", v3, v4);
    instrumentationQueue = v2->_instrumentationQueue;
    v2->_instrumentationQueue = (OS_dispatch_queue *)v5;

    objc_msgSend(MEMORY[0x1E0CF8748], "shared");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[ICNAOptedInObject isOptedInForAnalytics](ICNAOptedInObject, "isOptedInForAnalytics"))
      objc_msgSend(v7, "allow");
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF86E8]), "initWithTrackingConsent:", v7);
    appSessionManager = v2->_appSessionManager;
    v2->_appSessionManager = (AAAppSessionManager *)v8;

    v10 = objc_alloc(MEMORY[0x1E0CF86F0]);
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "initWithBundle:", v11);
    client = v2->_client;
    v2->_client = (AAClient *)v12;

    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "BOOLForKey:", CFSTR("analyticsEnableBatchDebugging"));

    objc_msgSend(MEMORY[0x1E0CF8750], "default");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "withDebuggingEnabled:", v15);
    v17 = objc_claimAutoreleasedReturnValue();
    uploadBatchEventConfig = v2->_uploadBatchEventConfig;
    v2->_uploadBatchEventConfig = (AAUploadBatchEventConfig *)v17;

    v19 = objc_alloc_init(ICNAServerEnvironment);
    serverEnvironment = v2->_serverEnvironment;
    v2->_serverEnvironment = v19;

    v21 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF8710]), "initWithAppSessionManager:client:endpoint:config:", v2->_appSessionManager, v2->_client, v2, v2->_uploadBatchEventConfig);
    flushManager = v2->_flushManager;
    v2->_flushManager = (AAFlushManager *)v21;

    v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionForWindowDict = v2->_sessionForWindowDict;
    v2->_sessionForWindowDict = v23;

    v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    sessionTrackerForWindowDict = v2->_sessionTrackerForWindowDict;
    v2->_sessionTrackerForWindowDict = v25;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0CEB390]);
    v27 = objc_claimAutoreleasedReturnValue();
    endSessionBackgroundTaskIdentifier = v2->_endSessionBackgroundTaskIdentifier;
    v2->_endSessionBackgroundTaskIdentifier = (NSNumber *)v27;

    v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier = v2->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier;
    v2->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier = v29;

    objc_storeStrong((id *)&v2->_privateSessionID, CFSTR("session_inactive"));
    v2->_sessionState = 0;
    v31 = objc_alloc_init(ICNAMultiSceneSessionTracker);
    multiSceneSessionTracker = v2->_multiSceneSessionTracker;
    v2->_multiSceneSessionTracker = v31;

    v2->_deviceOrientationEnum = 0;
    performBlockOnMainThreadAndWait();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "addObserver:selector:name:object:", v2, sel_orientationDidChange_, *MEMORY[0x1E0CEB450], 0);

    v34 = +[ICNAInlineDrawingRecognitionReporter sharedReporter](ICNAInlineDrawingRecognitionReporter, "sharedReporter");
    -[ICNAController removePreSydneyDAnalyticsData](v2, "removePreSydneyDAnalyticsData");
    -[ICNAController flushWithCompletionHandler:](v2, "flushWithCompletionHandler:", &__block_literal_global_61);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)ICNAController;
  -[ICNAController dealloc](&v4, sel_dealloc);
}

+ (id)sharedController
{
  if (s_onceToken_4 != -1)
    dispatch_once(&s_onceToken_4, &__block_literal_global_8);
  return (id)sharedController_s_instance_0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionStartDate, 0);
  objc_storeStrong((id *)&self->_multiSceneSessionTracker, 0);
  objc_storeStrong((id *)&self->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier, 0);
  objc_storeStrong((id *)&self->_endSessionBackgroundTaskIdentifier, 0);
  objc_storeStrong((id *)&self->_instrumentationQueue, 0);
  objc_storeStrong((id *)&self->_serverEnvironment, 0);
  objc_storeStrong((id *)&self->_sessionTrackerForWindowDict, 0);
  objc_storeStrong((id *)&self->_sessionForWindowDict, 0);
  objc_storeStrong((id *)&self->_sessionManager, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_uploadBatchEventConfig, 0);
  objc_storeStrong((id *)&self->_flushManager, 0);
  objc_storeStrong((id *)&self->_appSessionManager, 0);
  objc_storeStrong((id *)&self->_privateSessionID, 0);
  objc_storeStrong((id *)&self->_startingSessionType, 0);
  objc_storeStrong((id *)&self->_referringApplication, 0);
  objc_storeStrong((id *)&self->_referringInboundURL, 0);
  objc_destroyWeak((id *)&self->_appDelegate);
}

- (void)startSessionWithReferralURL:(id)a3 referralApplication:(id)a4
{
  -[ICNAController startSessionWithReferralURL:referralApplication:startingSessionType:](self, "startSessionWithReferralURL:referralApplication:startingSessionType:", a3, a4, CFSTR("notes"));
}

- (void)startSessionWithReferralURL:(id)a3 referralApplication:(id)a4 startingSessionType:(id)a5
{
  __CFString *v8;
  id v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v8 = (__CFString *)a4;
  v9 = a5;
  if (v8)
  {
    -[__CFString lowercaseString](v8, "lowercaseString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "hasPrefix:", CFSTR("com.apple."));

    if ((v11 & 1) == 0)
    {

      v8 = CFSTR("other");
    }
  }
  -[ICNAController referringApplication](self, "referringApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    -[ICNAController setReferringApplication:](self, "setReferringApplication:", v8);
  -[ICNAController referringInboundURL](self, "referringInboundURL");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
    -[ICNAController setReferringInboundURL:](self, "setReferringInboundURL:", v14);
  -[ICNAController startSessionWithType:](self, "startSessionWithType:", v9);

}

void __22__ICNAController_init__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "beginGeneratingDeviceOrientationNotifications");

}

void __22__ICNAController_init__block_invoke_2()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_1BDCEC000, v0, OS_LOG_TYPE_INFO, "Completed flush of analytics data", v1, 2u);
  }

}

- (void)generatePrivateSessionIDIfNecessary
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  id v8;

  -[ICNAController privateSessionID](self, "privateSessionID");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3
    || (v4 = (void *)v3,
        -[ICNAController privateSessionID](self, "privateSessionID"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(CFSTR("session_inactive"), "isEqualToString:", v5),
        v5,
        v4,
        v6))
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAController setPrivateSessionID:](self, "setPrivateSessionID:", v7);

  }
}

- (void)startAppSession
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAController generatePrivateSessionIDIfNecessary](self, "generatePrivateSessionIDIfNecessary");
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__ICNAController_startAppSession__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __33__ICNAController_startAppSession__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "appSessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "startAppSession");

  objc_msgSend(*(id *)(a1 + 32), "createSessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setSessionManager:", v3);

  objc_msgSend(*(id *)(a1 + 32), "orientationDidChange:", 0);
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "sessionManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "tracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pushLongLivedDataObjects:", v5);

}

- (void)appSessionDidTerminate
{
  NSObject *v3;
  _QWORD block[5];

  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__ICNAController_appSessionDidTerminate__block_invoke;
  block[3] = &unk_1E771BE80;
  block[4] = self;
  dispatch_async(v3, block);

}

void __40__ICNAController_appSessionDidTerminate__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushToSessionManager:endReason:", v3, 3);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessionForWindowDict", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allValues");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(a1 + 32), "pushToSessionManager:endReason:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), 3);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

  objc_msgSend(*(id *)(a1 + 32), "appSessionManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "appSessionDidTerminate");

}

- (id)sessionManagerForWindowSceneIdentifier:(id)a3 shouldCreate:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  ICNAController *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[ICNAController sessionForWindowDict](v7, "sessionForWindowDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectForKeyedSubscript:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 && v4)
  {
    -[ICNAController createSessionManager](v7, "createSessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAController sessionForWindowDict](v7, "sessionForWindowDict");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v6);

  }
  objc_sync_exit(v7);

  return v9;
}

- (id)sessionManagerForWindowSceneIdentifier:(id)a3
{
  return -[ICNAController sessionManagerForWindowSceneIdentifier:shouldCreate:](self, "sessionManagerForWindowSceneIdentifier:shouldCreate:", a3, 0);
}

- (id)sessionTrackerForWindowSceneIdentifier:(id)a3
{
  id v4;
  ICNAController *v5;
  void *v6;
  ICNAMultiSceneSessionTracker *v7;
  void *v8;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[ICNAController sessionTrackerForWindowDict](v5, "sessionTrackerForWindowDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (ICNAMultiSceneSessionTracker *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = objc_alloc_init(ICNAMultiSceneSessionTracker);
    -[ICNAController sessionTrackerForWindowDict](v5, "sessionTrackerForWindowDict");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, v4);

  }
  objc_sync_exit(v5);

  return v7;
}

- (void)clearSessionForWindowSceneIdentifier:(id)a3
{
  ICNAController *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[ICNAController sessionForWindowDict](v4, "sessionForWindowDict");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v7);

  -[ICNAController sessionTrackerForWindowDict](v4, "sessionTrackerForWindowDict");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, v7);

  objc_sync_exit(v4);
}

- (id)aaTrackerForWindowSceneIdentifier:(id)a3
{
  id v4;
  ICNAController *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    -[ICNAController sessionManagerForWindowSceneIdentifier:](v5, "sessionManagerForWindowSceneIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "tracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_sync_exit(v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)createSessionManager
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  -[ICNAController appSessionManager](self, "appSessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "createSessionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8718]), "initWithFormat:", 2);
  objc_msgSend(v4, "processorManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addEventProcessor:", v5);

  v7 = objc_alloc(MEMORY[0x1E0CF8758]);
  -[ICNAController client](self, "client");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAController uploadBatchEventConfig](self, "uploadBatchEventConfig");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v7, "initWithClient:endpoint:config:", v8, self, v9);

  objc_msgSend(v4, "processorManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addEventProcessor:", v10);

  return v4;
}

- (void)startSessionWithType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[ICNAController generatePrivateSessionIDIfNecessary](self, "generatePrivateSessionIDIfNecessary");
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __39__ICNAController_startSessionWithType___block_invoke;
  v7[3] = &unk_1E771BEA8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __39__ICNAController_startSessionWithType___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  ICNAMultiSceneSessionTracker *v4;
  id *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  uint8_t buf[4];
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "multiSceneSessionTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isInvalidated");

  if (v3)
  {
    v4 = objc_alloc_init(ICNAMultiSceneSessionTracker);
    objc_msgSend(*(id *)(a1 + 32), "setMultiSceneSessionTracker:", v4);

  }
  v5 = (id *)(a1 + 40);
  if (objc_msgSend(*(id *)(a1 + 40), "isEqualToString:", CFSTR("notes")))
  {
    objc_msgSend(*(id *)(a1 + 32), "multiSceneSessionTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startNotesSession");
LABEL_7:

    goto LABEL_8;
  }
  if (objc_msgSend(*v5, "isEqualToString:", CFSTR("paper")))
  {
    objc_msgSend(*(id *)(a1 + 32), "multiSceneSessionTracker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "startPaperSession");
    goto LABEL_7;
  }
  if ((objc_msgSend(*v5, "isEqualToString:", CFSTR("global")) & 1) == 0)
  {
    v25 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      __39__ICNAController_startSessionWithType___block_invoke_cold_1();

  }
LABEL_8:
  v7 = *(void **)(a1 + 32);
  objc_msgSend(v7, "sessionManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "tracker");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "pushLongLivedPrivateEventData:", v9);

  if (objc_msgSend(*(id *)(a1 + 32), "sessionState") == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "referringInboundURL");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "referringApplication");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v26)
      {
LABEL_20:
        v16 = os_log_create("com.apple.notes", "Analytics");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(*(id *)(a1 + 32), "multiSceneSessionTracker");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "sessionDetailDescription");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v34 = v30;
          _os_log_impl(&dword_1BDCEC000, v16, OS_LOG_TYPE_INFO, "Not Starting AA Session as it already exists. Session Type Detail: %@", buf, 0xCu);

        }
        v14 = v16;
        goto LABEL_23;
      }
    }
    v27 = *(void **)(a1 + 32);
    objc_msgSend(v27, "sessionManager");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "pushReferralDataToSessionManager:", v28);

    goto LABEL_20;
  }
  v11 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "multiSceneSessionTracker");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sessionDetailDescription");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v34 = v13;
    _os_log_impl(&dword_1BDCEC000, v11, OS_LOG_TYPE_INFO, "Really Starting AA Session. Session Type Detail: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF8740], "default");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "withEnabled:", 1);
  v16 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "UUIDString");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "startSessionForKind:withName:identifier:startDate:timestampJitter:", 0, 0, v19, v14, v16);

  objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 1);
  objc_msgSend(*(id *)(a1 + 32), "setSessionStartDate:", v14);
  objc_msgSend(*(id *)(a1 + 32), "sessionManager");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "tracker");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "submitEventType:", objc_opt_class());
  objc_msgSend(v21, "timeEventType:", objc_opt_class());
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "loadIdentifiersAndRegenerateIfNecessary");

  objc_msgSend(*(id *)(a1 + 32), "instrumentationQueue");
  v23 = objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __39__ICNAController_startSessionWithType___block_invoke_74;
  v31[3] = &unk_1E771BEA8;
  v24 = *(void **)(a1 + 40);
  v31[4] = *(_QWORD *)(a1 + 32);
  v32 = v24;
  dispatch_async(v23, v31);

LABEL_23:
}

void __39__ICNAController_startSessionWithType___block_invoke_74(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sessionManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushSessionLevelDataIntoSessionManager:withSessionType:isGlobalSession:", v3, *(_QWORD *)(a1 + 40), 1);

}

- (void)startWindowSceneSessionWithType:(id)a3 windowScene:(id)a4 successHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  _QWORD block[5];
  id v19;
  id v20;
  id v21;
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(v9, "session");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "persistentIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v13 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke;
  block[3] = &unk_1E771D038;
  block[4] = self;
  v19 = v12;
  v20 = v8;
  v21 = v9;
  v22 = v10;
  v14 = v10;
  v15 = v9;
  v16 = v8;
  v17 = v12;
  dispatch_async(v13, block);

}

void __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke(uint64_t a1)
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
  void *v13;
  NSObject *v14;
  uint64_t v15;
  id v16;
  void *v17;
  NSObject *v18;
  _QWORD v19[4];
  id v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t);
  void *v24;
  uint64_t v25;
  id v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint8_t buf[16];

  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BDCEC000, v2, OS_LOG_TYPE_INFO, "Really Starting AA Window Session.", buf, 2u);
  }

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CF8740], "default");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "withEnabled:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "sessionManagerForWindowSceneIdentifier:shouldCreate:", *(_QWORD *)(a1 + 40), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "startSessionForKind:withName:identifier:startDate:timestampJitter:", 0, 0, v5, v3, v9);
  objc_msgSend(*(id *)(a1 + 32), "sessionTrackerForWindowSceneIdentifier:", *(_QWORD *)(a1 + 40));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("notes")))
  {
    objc_msgSend(v11, "startNotesSession");
  }
  else if (objc_msgSend(*(id *)(a1 + 48), "isEqualToString:", CFSTR("paper")))
  {
    objc_msgSend(v11, "startPaperSession");
  }
  objc_msgSend(v10, "tracker");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "pushLongLivedDataObjects:privateSessionIdentifier:", v12, v7);
  objc_msgSend(v12, "submitEventType:", objc_opt_class());
  objc_msgSend(v12, "timeEventType:", objc_opt_class());
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "loadIdentifiersAndRegenerateIfNecessary");

  objc_msgSend(*(id *)(a1 + 32), "instrumentationQueue");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_77;
  block[3] = &unk_1E771D010;
  block[4] = *(_QWORD *)(a1 + 32);
  v16 = v10;
  v28 = v16;
  v29 = *(id *)(a1 + 48);
  dispatch_async(v14, block);

  objc_msgSend(*(id *)(a1 + 32), "appDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    v21 = v15;
    v22 = 3221225472;
    v23 = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_2;
    v24 = &unk_1E771BEA8;
    v25 = *(_QWORD *)(a1 + 32);
    v26 = *(id *)(a1 + 56);
    performBlockOnMainThread();

  }
  objc_msgSend(*(id *)(a1 + 32), "instrumentationQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  v19[0] = v15;
  v19[1] = 3221225472;
  v19[2] = __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_3;
  v19[3] = &unk_1E771C630;
  v20 = *(id *)(a1 + 64);
  dispatch_async(v18, v19);

}

uint64_t __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_77(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "pushSessionLevelDataIntoSessionManager:withSessionType:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "appDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sessionDidStartForWindowScene:", *(_QWORD *)(a1 + 40));

}

uint64_t __77__ICNAController_startWindowSceneSessionWithType_windowScene_successHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (int64_t)sessionState
{
  ICNAController *v2;
  int64_t sessionState;

  v2 = self;
  objc_sync_enter(v2);
  sessionState = v2->_sessionState;
  objc_sync_exit(v2);

  return sessionState;
}

- (void)setSessionState:(int64_t)a3
{
  ICNAController *v5;
  uint64_t sessionState;
  void *v7;
  void *v8;
  ICNAController *obj;

  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  obj = self;
  objc_sync_enter(obj);
  v5 = obj;
  sessionState = obj->_sessionState;
  if (sessionState != a3)
  {
    if (a3 < 1 || sessionState)
    {
      if (a3 || sessionState < 1)
        goto LABEL_9;
      -[ICNAController setPrivateSessionID:](obj, "setPrivateSessionID:", CFSTR("session_inactive"));
      -[ICNAController sessionManager](obj, "sessionManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tracker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNAController pushLongLivedPrivateEventData:](obj, "pushLongLivedPrivateEventData:", v8);
    }
    else
    {
      -[ICNAController generatePrivateSessionIDIfNecessary](obj, "generatePrivateSessionIDIfNecessary");
      -[ICNAController sessionManager](obj, "sessionManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "tracker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ICNAController pushLongLivedPrivateEventData:](obj, "pushLongLivedPrivateEventData:", v8);
    }

    v5 = obj;
LABEL_9:
    v5->_sessionState = a3;
  }
  objc_sync_exit(v5);

}

- (BOOL)killEndSessionBackgroundTaskIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v10;

  -[ICNAController appDelegate](self, "appDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[ICNAController endSessionBackgroundTaskIdentifier](self, "endSessionBackgroundTaskIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_sync_enter(v4);
  -[ICNAController endSessionBackgroundTaskIdentifier](self, "endSessionBackgroundTaskIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  v7 = *MEMORY[0x1E0CEB390];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0CEB390]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAController setEndSessionBackgroundTaskIdentifier:](self, "setEndSessionBackgroundTaskIdentifier:", v8);

  objc_sync_exit(v4);
  if (v6 == v7)
    return 0;
  -[ICNAController appDelegate](self, "appDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "endBackgroundTask:", v6);

  return 1;
}

- (BOOL)killEndSessionBackgroundTaskIfNecessaryForWindowScene:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;

  v4 = a3;
  -[ICNAController appDelegate](self, "appDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "session");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "persistentIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[ICNAController endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier](self, "endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v8);
    -[ICNAController endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier](self, "endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectForKeyedSubscript:", v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "unsignedIntegerValue");

    v12 = *MEMORY[0x1E0CEB390];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *MEMORY[0x1E0CEB390]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ICNAController endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier](self, "endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v7);

    objc_sync_exit(v8);
    v15 = v11 != v12;
    if (v11 != v12)
    {
      -[ICNAController appDelegate](self, "appDelegate");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "endBackgroundTask:", v11);

    }
  }
  else
  {
    v15 = 0;
  }

  return v15;
}

- (void)performOnInstrumentationQueueWaitUntilDone:(BOOL)a3 block:(id)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  NSObject *v8;

  v4 = a3;
  v6 = a4;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v4)
    dispatch_sync(v7, v6);
  else
    dispatch_async(v7, v6);

}

- (void)endSessionSynchronously:(BOOL)a3 endReason:(int64_t)a4
{
  -[ICNAController endSessionSynchronously:forSessionType:endReason:](self, "endSessionSynchronously:forSessionType:endReason:", a3, CFSTR("notes"), a4);
}

- (void)endSessionSynchronously:(BOOL)a3 forSessionType:(id)a4 endReason:(int64_t)a5
{
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  void (**v10)(_QWORD);
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  ICNAController *v18;
  void (**v19)(_QWORD);
  _QWORD v20[5];
  _QWORD v21[6];
  BOOL v22;
  uint8_t buf[4];
  void *v24;
  uint64_t v25;

  v6 = a3;
  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke;
  v21[3] = &unk_1E771D0B0;
  v22 = v6;
  v21[4] = self;
  v21[5] = a5;
  v10 = (void (**)(_QWORD))MEMORY[0x1C3B7B9AC](v21);
  if (v6)
  {
    -[ICNAController multiSceneSessionTracker](self, "multiSceneSessionTracker");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "endAllSessionsAndInvalidate");

    v20[0] = v9;
    v20[1] = 3221225472;
    v20[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_90;
    v20[3] = &unk_1E771BE80;
    v20[4] = self;
    -[ICNAController performOnInstrumentationQueueWaitUntilDone:block:](self, "performOnInstrumentationQueueWaitUntilDone:block:", 1, v20);
    v12 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      -[ICNAController multiSceneSessionTracker](self, "multiSceneSessionTracker");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "sessionDetailDescription");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v24 = v14;
      _os_log_impl(&dword_1BDCEC000, v12, OS_LOG_TYPE_INFO, "Synchronously ending AA Session. Session Type Detail: %@", buf, 0xCu);

    }
    if (v10)
      v10[2](v10);
  }
  else
  {
    -[ICNAController instrumentationQueue](self, "instrumentationQueue");
    v15 = objc_claimAutoreleasedReturnValue();
    block[0] = v9;
    block[1] = 3221225472;
    block[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_91;
    block[3] = &unk_1E771D0D8;
    v17 = v8;
    v18 = self;
    v19 = v10;
    dispatch_async(v15, block);

  }
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9[2];
  char v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "appDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_2;
    v14 = &unk_1E771C188;
    objc_copyWeak(&v15, &location);
    performBlockOnMainThreadAndWait();
    objc_destroyWeak(&v15);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICNASessionWillEndNotification"), *(_QWORD *)(a1 + 32));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICNASessionFlushTimedDataNotification"), *(_QWORD *)(a1 + 32));

  v6 = *(void **)(a1 + 32);
  v7 = *(unsigned __int8 *)(a1 + 48);
  v8[0] = v3;
  v8[1] = 3221225472;
  v8[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_80;
  v8[3] = &unk_1E771D088;
  v8[4] = v6;
  objc_copyWeak(v9, &location);
  v10 = *(_BYTE *)(a1 + 48);
  v9[1] = *(id *)(a1 + 40);
  objc_msgSend(v6, "performOnInstrumentationQueueWaitUntilDone:block:", v7, v8);
  objc_destroyWeak(v9);
  objc_destroyWeak(&location);
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "endSessionBackgroundTaskIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v3);
    objc_msgSend(v2, "appDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3;
    v7[3] = &unk_1E771BE80;
    v7[4] = v2;
    v5 = objc_msgSend(v4, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Finish end analytics session operation"), v7);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setEndSessionBackgroundTaskIdentifier:", v6);

    objc_sync_exit(v3);
  }

}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "killEndSessionBackgroundTaskIfNecessary"))
  {
    v1 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_80(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  id v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(_QWORD);
  NSObject *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  _QWORD v31[6];
  char v32;
  uint8_t buf[4];
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushLongLivedSessionSummaryData:", v4);

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (objc_msgSend(WeakRetained, "sessionState"))
    {
      objc_msgSend(v6, "setSessionState:", 2);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "sessionStartDate");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = (void *)v8;
        objc_msgSend(*(id *)(a1 + 32), "sessionStartDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "timeIntervalSinceDate:", v10);
        v12 = v11;

        if (v12 > 12000.0)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0CB3570]);
          objc_msgSend(v13, "setZeroFormattingBehavior:", 1);
          objc_msgSend(v13, "setAllowedUnits:", 240);
          objc_msgSend(v13, "setUnitsStyle:", 1);
          objc_msgSend(v13, "stringFromTimeInterval:", v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = os_log_create("com.apple.notes", "Analytics");
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_80_cold_1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

        }
      }
      v31[0] = MEMORY[0x1E0C809B0];
      v31[1] = 3221225472;
      v31[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_82;
      v31[3] = &unk_1E771D060;
      v32 = *(_BYTE *)(a1 + 56);
      v31[4] = *(_QWORD *)(a1 + 32);
      v31[5] = v6;
      v22 = (void (**)(_QWORD))MEMORY[0x1C3B7B9AC](v31);
      v23 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        if (*(_BYTE *)(a1 + 56))
          v24 = CFSTR("YES");
        else
          v24 = CFSTR("NO");
        *(_DWORD *)buf = 138412290;
        v34 = v24;
        _os_log_impl(&dword_1BDCEC000, v23, OS_LOG_TYPE_INFO, "Triggering endSessionWithCompletion. isSync: %@", buf, 0xCu);
      }

      v25 = *(void **)(a1 + 32);
      objc_msgSend(v6, "sessionManager");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "pushToSessionManager:endReason:", v26, *(_QWORD *)(a1 + 48));

      if (*(_BYTE *)(a1 + 56)
        && (objc_msgSend(v6, "sessionManager"),
            v27 = (void *)objc_claimAutoreleasedReturnValue(),
            v28 = objc_opt_respondsToSelector(),
            v27,
            (v28 & 1) != 0))
      {
        objc_msgSend(v6, "sessionManager");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "endSync");

        v22[2](v22);
      }
      else
      {
        objc_msgSend(v6, "sessionManager");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "endSessionWithCompletion:", v22);

      }
    }
    else
    {
      objc_msgSend(v6, "killEndSessionBackgroundTaskIfNecessary");
    }
  }

}

uint64_t __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_82(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  void *v4;
  _QWORD v6[5];
  uint8_t buf[4];
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 48))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1BDCEC000, v2, OS_LOG_TYPE_INFO, "Completed endSessionWithCompletion. isSync: %@", buf, 0xCu);
  }

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_87;
  v6[3] = &unk_1E771BE80;
  v4 = *(void **)(a1 + 32);
  v6[4] = *(_QWORD *)(a1 + 40);
  return objc_msgSend(v4, "performOnInstrumentationQueueWaitUntilDone:block:", 0, v6);
}

uint64_t __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_87(uint64_t a1)
{
  if (objc_msgSend(*(id *)(a1 + 32), "sessionState") == 2)
    objc_msgSend(*(id *)(a1 + 32), "setSessionState:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "killEndSessionBackgroundTaskIfNecessary");
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_90(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "sessionManager");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pushLongLivedSessionSummaryData:", v2);

}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_91(id *a1)
{
  id *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _QWORD block[4];
  NSObject *v18;
  uint8_t buf[4];
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a1 + 4;
  if (objc_msgSend(a1[4], "isEqualToString:", CFSTR("notes")))
  {
    objc_msgSend(a1[5], "multiSceneSessionTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endNotesSession");
LABEL_5:

    goto LABEL_9;
  }
  if (objc_msgSend(*v2, "isEqualToString:", CFSTR("paper")))
  {
    objc_msgSend(a1[5], "multiSceneSessionTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endPaperSession");
    goto LABEL_5;
  }
  v4 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_91_cold_1();

LABEL_9:
  objc_msgSend(a1[5], "multiSceneSessionTracker");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasLiveTimers");

  if ((v6 & 1) != 0)
  {
    v7 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1[5], "multiSceneSessionTracker");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sessionDetailDescription");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1BDCEC000, v7, OS_LOG_TYPE_INFO, "Not ending AA Session asynchronously. Session Type Detail: %@", buf, 0xCu);

    }
  }
  else
  {
    objc_msgSend(a1[5], "multiSceneSessionTracker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "endAllSessionsAndInvalidate");

    v11 = a1[5];
    objc_msgSend(v11, "sessionManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "tracker");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pushLongLivedSessionSummaryData:", v13);

    v14 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(a1[5], "multiSceneSessionTracker");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "sessionDetailDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v20 = v16;
      _os_log_impl(&dword_1BDCEC000, v14, OS_LOG_TYPE_INFO, "Ending AA Session asynchronously. Session Type Detail: %@", buf, 0xCu);

    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_92;
    block[3] = &unk_1E771C630;
    v18 = a1[6];
    dispatch_async(MEMORY[0x1E0C80D38], block);
    v7 = v18;
  }

}

uint64_t __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_92(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)endSessionSynchronously:(BOOL)a3 forSessionType:(id)a4 endReason:(int64_t)a5 successHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v8 = a3;
  v10 = a6;
  -[ICNAController endSessionSynchronously:forSessionType:endReason:](self, "endSessionSynchronously:forSessionType:endReason:", v8, a4, a5);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __82__ICNAController_endSessionSynchronously_forSessionType_endReason_successHandler___block_invoke;
  v12[3] = &unk_1E771C630;
  v13 = v10;
  v11 = v10;
  -[ICNAController performOnInstrumentationQueueWaitUntilDone:block:](self, "performOnInstrumentationQueueWaitUntilDone:block:", v8, v12);

}

uint64_t __82__ICNAController_endSessionSynchronously_forSessionType_endReason_successHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)endWindowSceneSessionSynchronously:(BOOL)a3 forSessionType:(id)a4 endReason:(int64_t)a5 windowScene:(id)a6
{
  _BOOL4 v7;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  void (**v15)(_QWORD);
  void *v16;
  _QWORD v17[4];
  void (**v18)(_QWORD);
  _QWORD v19[5];
  id v20;
  id v21;
  int64_t v22;
  BOOL v23;

  v7 = a3;
  v9 = a6;
  objc_msgSend(v9, "session");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "persistentIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke;
  v19[3] = &unk_1E771D178;
  v19[4] = self;
  v13 = v9;
  v20 = v13;
  v14 = v11;
  v23 = v7;
  v21 = v14;
  v22 = a5;
  v15 = (void (**)(_QWORD))MEMORY[0x1C3B7B9AC](v19);
  v16 = v15;
  if (v7)
  {
    if (v15)
      v15[2](v15);
  }
  else
  {
    v17[0] = v12;
    v17[1] = 3221225472;
    v17[2] = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_98;
    v17[3] = &unk_1E771C630;
    v18 = v15;
    dispatch_async(MEMORY[0x1E0C80D38], v17);

  }
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13[2];
  char v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  id v21;
  id location;

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "appDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  v3 = MEMORY[0x1E0C809B0];
  if (v2)
  {
    v15 = MEMORY[0x1E0C809B0];
    v16 = 3221225472;
    v17 = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2;
    v18 = &unk_1E771D100;
    objc_copyWeak(&v21, &location);
    v19 = *(id *)(a1 + 40);
    v20 = *(id *)(a1 + 48);
    performBlockOnMainThreadAndWait();

    objc_destroyWeak(&v21);
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", CFSTR("ICNASessionWillEndNotification"), *(_QWORD *)(a1 + 40));

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", CFSTR("ICNASessionFlushTimedDataNotification"), *(_QWORD *)(a1 + 40));

  v6 = *(void **)(a1 + 32);
  v7 = *(unsigned __int8 *)(a1 + 64);
  v10[0] = v3;
  v10[1] = 3221225472;
  v10[2] = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_95;
  v10[3] = &unk_1E771D150;
  objc_copyWeak(v13, &location);
  v8 = *(id *)(a1 + 48);
  v9 = *(void **)(a1 + 56);
  v11 = v8;
  v13[1] = v9;
  v14 = *(_BYTE *)(a1 + 64);
  v12 = *(id *)(a1 + 40);
  objc_msgSend(v6, "performOnInstrumentationQueueWaitUntilDone:block:", v7, v10);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  void *v13;
  id v14;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_sync_enter(v4);
    objc_msgSend(v3, "appDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3;
    v12 = &unk_1E771BEA8;
    v13 = v3;
    v14 = *(id *)(a1 + 32);
    v6 = objc_msgSend(v5, "beginBackgroundTaskWithName:expirationHandler:", CFSTR("Finish end analytics window scene session operation"), &v9);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6, v9, v10, v11, v12, v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, *(_QWORD *)(a1 + 40));

    objc_sync_exit(v4);
  }

}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3(uint64_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (objc_msgSend(*(id *)(a1 + 32), "killEndSessionBackgroundTaskIfNecessaryForWindowScene:", *(_QWORD *)(a1 + 40)))
  {
    v1 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v1, OS_LOG_TYPE_ERROR))
      __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3_cold_1(v1, v2, v3, v4, v5, v6, v7, v8);

  }
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_95(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  NSObject *v9;
  const __CFString *v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  void *v15;
  id v16;
  id v17;
  char v18;
  uint8_t buf[4];
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "sessionManagerForWindowSceneIdentifier:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sessionTrackerForWindowSceneIdentifier:", *(_QWORD *)(a1 + 32));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAllSessionsAndInvalidate");
    objc_msgSend(v5, "sessionSummaryData");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tracker");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pushUniqueDataObject:tracker:", v6, v7);

    objc_msgSend(v3, "pushToSessionManager:endReason:", v4, *(_QWORD *)(a1 + 56));
    v11 = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2_96;
    v14 = &unk_1E771D128;
    v18 = *(_BYTE *)(a1 + 64);
    v15 = v3;
    v16 = *(id *)(a1 + 32);
    v17 = *(id *)(a1 + 40);
    v8 = (void (**)(_QWORD))MEMORY[0x1C3B7B9AC](&v11);
    v9 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      if (*(_BYTE *)(a1 + 64))
        v10 = CFSTR("YES");
      else
        v10 = CFSTR("NO");
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1BDCEC000, v9, OS_LOG_TYPE_INFO, "Triggering endSessionWithCompletion. isSync: %@", buf, 0xCu);
    }

    if (*(_BYTE *)(a1 + 64))
    {
      objc_msgSend(v4, "endSession", v11, v12, v13, v14, v15, v16);
      if (v8)
        v8[2](v8);
    }
    else
    {
      objc_msgSend(v4, "endSessionWithCompletion:", v8, v11, v12, v13, v14, v15, v16);
    }

  }
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_2_96(uint64_t a1)
{
  NSObject *v2;
  const __CFString *v3;
  id v4;
  uint8_t buf[4];
  const __CFString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(a1 + 56))
      v3 = CFSTR("YES");
    else
      v3 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1BDCEC000, v2, OS_LOG_TYPE_INFO, "Completed endSessionWithCompletion. isSync: %@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "clearSessionForWindowSceneIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "killEndSessionBackgroundTaskIfNecessaryForWindowScene:", *(_QWORD *)(a1 + 48));
  v4 = *(id *)(a1 + 48);
  dispatchMainAfterDelay();

}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_97(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "postNotificationName:object:", CFSTR("ICNASessionDidEndNotification"), *(_QWORD *)(a1 + 32));

}

uint64_t __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_98(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)endWindowSceneSessionSynchronously:(BOOL)a3 forSessionType:(id)a4 endReason:(int64_t)a5 windowScene:(id)a6 successHandler:(id)a7
{
  _BOOL8 v10;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v10 = a3;
  v12 = a7;
  -[ICNAController endWindowSceneSessionSynchronously:forSessionType:endReason:windowScene:](self, "endWindowSceneSessionSynchronously:forSessionType:endReason:windowScene:", v10, a4, a5, a6);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene_successHandler___block_invoke;
  v14[3] = &unk_1E771C630;
  v15 = v12;
  v13 = v12;
  -[ICNAController performOnInstrumentationQueueWaitUntilDone:block:](self, "performOnInstrumentationQueueWaitUntilDone:block:", v10, v14);

}

uint64_t __105__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene_successHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)pushLongLivedDataObjects:(id)a3
{
  -[ICNAController pushLongLivedDataObjects:privateSessionIdentifier:](self, "pushLongLivedDataObjects:privateSessionIdentifier:", a3, 0);
}

- (void)pushLongLivedDataObjects:(id)a3 privateSessionIdentifier:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  v7 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  -[ICNAController pushLongLivedPrivateUserData:](self, "pushLongLivedPrivateUserData:", v7);
  -[ICNAController pushLongLivedPrivateDeviceData:](self, "pushLongLivedPrivateDeviceData:", v7);
  -[ICNAController pushLongLivedPrivateEventData:privateSessionIdentifier:](self, "pushLongLivedPrivateEventData:privateSessionIdentifier:", v7, v6);

  -[ICNAController pushLongLivedOrientationData:](self, "pushLongLivedOrientationData:", v7);
}

- (void)pushUniqueDataObject:(id)a3 tracker:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  v8 = objc_alloc_init(MEMORY[0x1E0CF86F8]);
  objc_msgSend(v8, "setUnique:", 1);
  objc_msgSend(v6, "pushDataEvent:traits:file:line:", v7, v8, CFSTR("/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m"), 960);

}

- (void)pushLongLivedOrientationData:(id)a3
{
  id v4;
  ICASInterfaceOrientation *v5;
  ICASOrientationData *v6;
  ICASDeviceOrientation *v7;

  v4 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  v7 = -[ICASDeviceOrientation initWithDeviceOrientation:]([ICASDeviceOrientation alloc], "initWithDeviceOrientation:", -[ICNAController deviceOrientationEnum](self, "deviceOrientationEnum"));
  v5 = -[ICASInterfaceOrientation initWithInterfaceOrientation:]([ICASInterfaceOrientation alloc], "initWithInterfaceOrientation:", 0);
  v6 = -[ICASOrientationData initWithDeviceOrientation:interfaceOrientation:]([ICASOrientationData alloc], "initWithDeviceOrientation:interfaceOrientation:", v7, v5);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v6, v4);

}

- (void)pushLongLivedSessionSummaryData:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  -[ICNAController multiSceneSessionTracker](self, "multiSceneSessionTracker");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sessionSummaryData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v5, v4);

}

- (void)pushLongLivedPrivateUserData:(id)a3
{
  id v4;
  ICASPrivateUserData *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  ICASSyncHealthPrivateUserData *v13;
  void *v14;
  void *v15;
  void *v16;
  ICASSnapshotHealthPrivateUserData *v17;
  ICASPrivateUserData *v18;

  v4 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  v5 = [ICASPrivateUserData alloc];
  objc_msgSend((id)objc_opt_class(), "privateUserID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "saltVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startMonth"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startYear"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ICASPrivateUserData initWithPrivateUserID:saltVersion:userStartMonth:userStartYear:](v5, "initWithPrivateUserID:saltVersion:userStartMonth:userStartYear:", v6, v7, v8, v9);

  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v18, v4);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "privateUserID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "saltedID:forClass:", v11, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ICASSyncHealthPrivateUserData initWithSyncHealthPrivateUserID:]([ICASSyncHealthPrivateUserData alloc], "initWithSyncHealthPrivateUserID:", v12);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v13, v4);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "privateUserID");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saltedID:forClass:", v15, objc_opt_class());
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = -[ICASSnapshotHealthPrivateUserData initWithSnapshotHealthPrivateUserID:]([ICASSnapshotHealthPrivateUserData alloc], "initWithSnapshotHealthPrivateUserID:", v16);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v17, v4);

}

- (void)pushLongLivedPrivateDeviceData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  ICASSyncHealthPrivateDeviceData *v7;
  void *v8;
  void *v9;
  void *v10;
  ICASSnapshotHealthPrivateDeviceData *v11;
  id v12;

  v4 = a3;
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "deviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "saltedID:forClass:", v6, objc_opt_class());
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[ICASSyncHealthPrivateDeviceData initWithSyncHealthPrivateDeviceID:]([ICASSyncHealthPrivateDeviceData alloc], "initWithSyncHealthPrivateDeviceID:", v12);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v7, v4);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "deviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "saltedID:forClass:", v9, objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = -[ICASSnapshotHealthPrivateDeviceData initWithSnapshotHealthPrivateDeviceID:]([ICASSnapshotHealthPrivateDeviceData alloc], "initWithSnapshotHealthPrivateDeviceID:", v10);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v11, v4);

}

- (void)pushLongLivedPrivateEventData:(id)a3
{
  -[ICNAController pushLongLivedPrivateEventData:privateSessionIdentifier:](self, "pushLongLivedPrivateEventData:privateSessionIdentifier:", a3, 0);
}

- (void)pushLongLivedPrivateEventData:(id)a3 privateSessionIdentifier:(id)a4
{
  id v6;
  ICASSessionDetailType *v7;
  void *v8;
  ICASSessionDetailType *v9;
  ICASPrivateEventData *v10;
  void *v11;
  void *v12;
  ICASSyncHealthPrivateEventData *v13;
  void *v14;
  void *v15;
  ICASSnapshotHealthPrivateEventData *v16;
  id v17;

  v17 = a4;
  v6 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  if (!v17)
  {
    -[ICNAController privateSessionID](self, "privateSessionID");
    v17 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = [ICASSessionDetailType alloc];
  -[ICNAController multiSceneSessionTracker](self, "multiSceneSessionTracker");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASSessionDetailType initWithSessionDetailType:](v7, "initWithSessionDetailType:", objc_msgSend(v8, "sessionDetailType"));

  v10 = -[ICASPrivateEventData initWithPrivateSessionID:sessionDetailType:]([ICASPrivateEventData alloc], "initWithPrivateSessionID:sessionDetailType:", v17, v9);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v10, v6);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "saltedID:forClass:", v17, objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = -[ICASSyncHealthPrivateEventData initWithSyncHealthPrivateSessionID:]([ICASSyncHealthPrivateEventData alloc], "initWithSyncHealthPrivateSessionID:", v12);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v13, v6);
  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "saltedID:forClass:", v17, objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = -[ICASSnapshotHealthPrivateEventData initWithSnapshotHealthPrivateSessionID:]([ICASSnapshotHealthPrivateEventData alloc], "initWithSnapshotHealthPrivateSessionID:", v15);
  -[ICNAController pushUniqueDataObject:tracker:](self, "pushUniqueDataObject:tracker:", v16, v6);

}

- (void)orientationDidChange:(id)a3
{
  performBlockOnMainThread();
}

void __39__ICNAController_orientationDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  NSObject *v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "setDeviceOrientationEnum:", 0);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "orientation");

  if (v3 <= 6)
    objc_msgSend(*(id *)(a1 + 32), "setDeviceOrientationEnum:", v3);
  objc_msgSend(*(id *)(a1 + 32), "instrumentationQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__ICNAController_orientationDidChange___block_invoke_2;
  block[3] = &unk_1E771BE80;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(v4, block);

}

void __39__ICNAController_orientationDidChange___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "sessionManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tracker");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pushLongLivedOrientationData:", v4);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "sessionForWindowDict", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(a1 + 32);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "tracker");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "pushLongLivedOrientationData:", v13);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (NSURL)url
{
  void *v2;
  void *v3;

  -[ICNAController serverEnvironment](self, "serverEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "targetURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

- (NSString)name
{
  void *v2;
  void *v3;

  -[ICNAController serverEnvironment](self, "serverEnvironment");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "aaEndPointTypeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)addSnapshotReferralDataToSessionLevel
{
  id v3;

  objc_msgSend(MEMORY[0x1E0D639E0], "referralURLForSnapshotBackgroundTask");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNAController addReferralDataWithReferringInboundURL:referringApplication:](self, "addReferralDataWithReferringInboundURL:referringApplication:", v3, 0);

}

- (void)addReferralDataWithReferringInboundURL:(id)a3 referringApplication:(id)a4
{
  id v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  char v10;
  NSObject *v11;
  __CFString *v12;
  id v13;
  _QWORD block[5];
  id v15;
  __CFString *v16;

  v6 = a3;
  v7 = (__CFString *)a4;
  v8 = v7;
  if (v7)
  {
    -[__CFString lowercaseString](v7, "lowercaseString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "hasPrefix:", CFSTR("com.apple."));

    if ((v10 & 1) == 0)
    {

      v8 = CFSTR("other");
    }
  }
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__ICNAController_addReferralDataWithReferringInboundURL_referringApplication___block_invoke;
  block[3] = &unk_1E771D010;
  block[4] = self;
  v15 = v6;
  v16 = v8;
  v12 = v8;
  v13 = v6;
  dispatch_async(v11, block);

}

void __78__ICNAController_addReferralDataWithReferringInboundURL_referringApplication___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "referringInboundURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    objc_msgSend(*(id *)(a1 + 32), "setReferringInboundURL:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "referringApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    objc_msgSend(*(id *)(a1 + 32), "setReferringApplication:", *(_QWORD *)(a1 + 48));
  objc_msgSend(*(id *)(a1 + 32), "referringInboundURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "referringApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      return;
  }
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v6, "sessionManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushReferralDataToSessionManager:", v7);

}

- (void)pushReferralDataToSessionManager:(id)a3
{
  void *v4;
  id v5;
  id v6;

  v6 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  -[ICNAController referralData](self, "referralData");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CF86F8]);
    objc_msgSend(v5, "setOnlyOnce:", 1);
    objc_msgSend(v5, "setUnique:", 1);
    -[ICNAController pushToSessionManager:data:forKey:traits:](self, "pushToSessionManager:data:forKey:traits:", v6, v4, CFSTR("referralData"), v5);

  }
}

- (void)pushSessionLevelDataIntoSessionManager:(id)a3 withSessionType:(id)a4
{
  -[ICNAController pushSessionLevelDataIntoSessionManager:withSessionType:isGlobalSession:](self, "pushSessionLevelDataIntoSessionManager:withSessionType:isGlobalSession:", a3, a4, 0);
}

- (void)pushSessionLevelDataIntoSessionManager:(id)a3 withSessionType:(id)a4 isGlobalSession:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v5 = a5;
  v14 = a3;
  v8 = a4;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  -[ICNAController sessionDataWithType:isGlobalSession:](self, "sessionDataWithType:isGlobalSession:", v8, v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[ICNAController pushToSessionManager:data:forKey:traits:](self, "pushToSessionManager:data:forKey:traits:", v14, v9, CFSTR("sessionData"), 0);
  -[ICNAController appData](self, "appData");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAController pushToSessionManager:data:forKey:traits:](self, "pushToSessionManager:data:forKey:traits:", v14, v10, CFSTR("appData"), 0);
  -[ICNAController deviceData](self, "deviceData");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAController pushToSessionManager:data:forKey:traits:](self, "pushToSessionManager:data:forKey:traits:", v14, v11, CFSTR("deviceData"), 0);
  -[ICNAController userData](self, "userData");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAController pushToSessionManager:data:forKey:traits:](self, "pushToSessionManager:data:forKey:traits:", v14, v12, CFSTR("userData"), 0);
  -[ICNAController pushReferralDataToSessionManager:](self, "pushReferralDataToSessionManager:", v14);
  -[ICNAController debugData](self, "debugData");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
    -[ICNAController pushToSessionManager:data:forKey:traits:](self, "pushToSessionManager:data:forKey:traits:", v14, v13, CFSTR("debugData"), 0);

}

- (void)pushToSessionManager:(id)a3 endReason:(int64_t)a4
{
  id v5;
  ICASSessionEndData *v6;
  void *v7;
  ICASEndReason *v8;

  v5 = a3;
  v8 = -[ICASEndReason initWithEndReason:]([ICASEndReason alloc], "initWithEndReason:", a4);
  v6 = -[ICASSessionEndData initWithEndReason:]([ICASSessionEndData alloc], "initWithEndReason:", v8);
  objc_msgSend(v5, "tracker");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "pushDataEvent:traits:file:line:", v6, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m"), 1178);
}

- (void)pushToSessionManager:(id)a3 data:(id)a4 forKey:(id)a5 traits:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v15 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  if (v10 && v11)
  {
    v13 = v12;
    if (!v13)
      v13 = objc_alloc_init(MEMORY[0x1E0CF86F8]);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8720]), "initWithKey:data:", v11, v10);
    objc_msgSend(v15, "pushSessionData:traits:", v14, v13);

  }
}

- (id)userData
{
  void *v2;
  void *v3;
  ICASUserData *v4;
  void *v5;
  void *v6;
  void *v7;
  ICASUserData *v8;

  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  objc_msgSend((id)objc_opt_class(), "storeFrontID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [ICASUserData alloc];
  objc_msgSend((id)objc_opt_class(), "saltVersion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startMonth"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend((id)objc_opt_class(), "startYear"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ICASUserData initWithUserID:userStorefrontID:saltVersion:userStartMonth:userStartYear:](v4, "initWithUserID:userStorefrontID:saltVersion:userStartMonth:userStartYear:", v3, v2, v5, v6, v7);

  return v8;
}

- (id)sessionDataWithType:(id)a3 isGlobalSession:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  ICASSessionData *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  ICASSessionData *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;

  v4 = a4;
  v28 = a3;
  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "secondsFromGMTForDate:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "countryCode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "languageCode");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bundleIdentifier");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "identifierResetOccurred");

  if ((_DWORD)v13)
  {
    +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setIdentifierResetOccurred:", 0);

  }
  -[ICNAController cellularRadioAccessTechnology](self, "cellularRadioAccessTechnology");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = [ICASSessionData alloc];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "bioAuthEnabled"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend((id)objc_opt_class(), "localNotesEnabled"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[ICNAController accountTypeSummary](self, "accountTypeSummary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[ICASSessionData initWithUtcOffset:countryCode:languageCode:productType:cellularRadioAccessTechnology:bioAuthEnabled:localNotesEnabled:accountTypeSummary:sessionType:isSaltRegenerated:isGlobalSession:](v16, "initWithUtcOffset:countryCode:languageCode:productType:cellularRadioAccessTechnology:bioAuthEnabled:localNotesEnabled:accountTypeSummary:sessionType:isSaltRegenerated:isGlobalSession:", v27, v26, v25, v24, v15, v23, v21, v17, v28, v18, v19);

  return v22;
}

- (id)accountTypeSummary
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;
  _QWORD v18[4];
  id v19;
  ICNAController *v20;
  uint64_t *v21;
  _QWORD *v22;
  _QWORD v23[4];
  id v24;
  ICNAController *v25;
  uint64_t *v26;
  _QWORD *v27;
  _QWORD v28[5];
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;

  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  v30 = 0;
  v31 = &v30;
  v32 = 0x3032000000;
  v33 = __Block_byref_object_copy__4;
  v34 = __Block_byref_object_dispose__4;
  v35 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = __Block_byref_object_copy__4;
  v28[4] = __Block_byref_object_dispose__4;
  v29 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0D63BC8], "sharedContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "workerManagedObjectContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __36__ICNAController_accountTypeSummary__block_invoke;
  v23[3] = &unk_1E771D1A0;
  v6 = v4;
  v24 = v6;
  v25 = self;
  v26 = &v30;
  v27 = v28;
  objc_msgSend(v6, "performBlockAndWait:", v23);
  ICNewLegacyContext();
  v18[0] = v5;
  v18[1] = 3221225472;
  v18[2] = __36__ICNAController_accountTypeSummary__block_invoke_2;
  v18[3] = &unk_1E771D1A0;
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v19 = v7;
  v20 = self;
  v21 = &v30;
  v22 = v28;
  objc_msgSend(v7, "performBlockAndWait:", v18);
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__4;
  v16 = __Block_byref_object_dispose__4;
  v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)v31[5];
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __36__ICNAController_accountTypeSummary__block_invoke_3;
  v11[3] = &unk_1E771D1C8;
  v11[4] = v28;
  v11[5] = &v12;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v11);
  v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  _Block_object_dispose(v28, 8);
  _Block_object_dispose(&v30, 8);

  return v9;
}

void __36__ICNAController_accountTypeSummary__block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *context;
  id obj;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3B7B820]();
  objc_msgSend(MEMORY[0x1E0D639C8], "allAccountsInContext:", a1[4]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v25 != v4)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        if (objc_msgSend(v6, "didChooseToMigrate"))
        {
          v7 = objc_msgSend((id)objc_opt_class(), "accountTypeEnumForModernAccount:", v6);
          v8 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "objectForKeyedSubscript:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v11 + 1);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = *(void **)(*(_QWORD *)(a1[6] + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, v14);

          v15 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectForKeyedSubscript:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v6, "visibleNotesCount") + v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = *(void **)(*(_QWORD *)(a1[7] + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v19, v21);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v3);
  }

  objc_autoreleasePoolPop(context);
}

void __36__ICNAController_accountTypeSummary__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
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
  void *context;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1C3B7B820]();
  objc_msgSend(*(id *)(a1 + 32), "allAccounts");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v26;
    v24 = v2;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v26 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        if ((objc_msgSend(v7, "isDeleted") & 1) == 0 && (objc_msgSend(v7, "didChooseToMigrate") & 1) == 0)
        {
          v8 = objc_msgSend((id)objc_opt_class(), "accountTypeEnumForHTMLAccount:", v7);
          v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "objectForKeyedSubscript:", v10);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v12 + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v13, v15);

          v16 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "countOfVisibleNotesForAccount:", v7) + v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v8);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v22);

          v2 = v24;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v4);
  }

  objc_autoreleasePoolPop(context);
}

void __36__ICNAController_accountTypeSummary__block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  ICASAccountTypeItemData *v10;
  ICASAccountType *v11;
  uint64_t v12;
  ICASAccountType *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  ICASAccountTypeItemData *v18;

  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "unsignedIntegerValue");

  v10 = [ICASAccountTypeItemData alloc];
  v11 = [ICASAccountType alloc];
  v12 = objc_msgSend(v7, "integerValue");

  v13 = -[ICASAccountType initWithAccountType:](v11, "initWithAccountType:", v12);
  v14 = (void *)MEMORY[0x1E0CB37E8];
  v15 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v14, "numberWithInteger:", ICNARoundTo2SigFigsInt(v15));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", ICNARoundTo2SigFigsInt(v9));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = -[ICASAccountTypeItemData initWithAccountType:countOfAccounts:countOfNotes:](v10, "initWithAccountType:countOfAccounts:countOfNotes:", v13, v16, v17);

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "addObject:", v18);
}

+ (int64_t)accountTypeEnumForModernAccount:(id)a3
{
  id v3;
  int64_t v4;

  v3 = a3;
  if (objc_msgSend(v3, "accountType") == 3)
  {
    v4 = 10;
  }
  else if (objc_msgSend(v3, "accountType") == 1)
  {
    v4 = 1;
  }
  else
  {
    v4 = 12;
  }

  return v4;
}

+ (int64_t)accountTypeEnumForHTMLAccount:(id)a3
{
  id v3;
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  if ((objc_msgSend(v3, "didChooseToMigrate") & 1) != 0)
  {
    v4 = 3;
  }
  else if (objc_msgSend(v3, "isIMAPAccount"))
  {
    objc_msgSend(MEMORY[0x1E0D64180], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "accountIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accountWithIdentifier:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "parentAccount");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (!v9)
      v9 = v8;
    objc_msgSend(v9, "accountType");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F0A8]) & 1) != 0)
    {
      v4 = 5;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F160]) & 1) != 0)
    {
      v4 = 6;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F028]) & 1) != 0)
    {
      v4 = 7;
    }
    else if ((objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F080]) & 1) != 0)
    {
      v4 = 8;
    }
    else if (objc_msgSend(v12, "isEqualToString:", *MEMORY[0x1E0C8F030]))
    {
      v4 = 2;
    }
    else
    {
      v4 = 4;
    }

  }
  else if ((objc_msgSend(v3, "isExchangeAccount") & 1) != 0)
  {
    v4 = 9;
  }
  else if (objc_msgSend(v3, "isLocalAccount"))
  {
    v4 = 11;
  }
  else
  {
    v4 = 13;
  }

  return v4;
}

- (id)cellularRadioAccessTechnology
{
  void *v2;
  unint64_t v3;
  uint64_t v4;
  ICASCellularRadioAccessTechnology *v5;

  objc_msgSend(MEMORY[0x1E0D64250], "reachabilityForInternetConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentReachabilityStatus");
  if (v3 > 2)
    v4 = 0;
  else
    v4 = qword_1BDD4D2A0[v3];
  v5 = -[ICASCellularRadioAccessTechnology initWithCellularRadioAccessTechnology:]([ICASCellularRadioAccessTechnology alloc], "initWithCellularRadioAccessTechnology:", v4);

  return v5;
}

- (id)appData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  ICASAppData *v8;

  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "infoDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("CFBundleShortVersionString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "infoDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("CFBundleVersion"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[ICASAppData initWithAppVersion:appBuild:]([ICASAppData alloc], "initWithAppVersion:appBuild:", v4, v7);
  return v8;
}

- (id)deviceData
{
  uint64_t v2;
  ICASOsInstallVariant *v3;
  ICASDeviceData *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  ICASDeviceData *v9;

  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  if (objc_msgSend(MEMORY[0x1E0D64290], "isInternalInstall"))
    v2 = 1;
  else
    v2 = 2;
  v3 = -[ICASOsInstallVariant initWithOsInstallVariant:]([ICASOsInstallVariant alloc], "initWithOsInstallVariant:", v2);
  v4 = [ICASDeviceData alloc];
  objc_msgSend((id)objc_opt_class(), "deviceModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "devicePlatform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "osVersion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "osBundleVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[ICASDeviceData initWithDeviceModel:devicePlatform:osInstallVariant:osVersion:osBundleVersion:](v4, "initWithDeviceModel:devicePlatform:osInstallVariant:osVersion:osBundleVersion:", v5, v6, v3, v7, v8);

  return v9;
}

- (id)debugData
{
  void *v2;
  void *v3;
  ICASDebugData *v4;

  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("analyticsDebugDataName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = -[ICASDebugData initWithName:]([ICASDebugData alloc], "initWithName:", v3);
  else
    v4 = 0;

  return v4;
}

- (id)referralData
{
  void *v3;
  ICASReferralData *v4;
  void *v5;
  void *v6;
  ICASReferralData *v7;
  void *v8;

  -[ICNAController assertInstrumentationQueue](self, "assertInstrumentationQueue");
  -[ICNAController referringInboundURL](self, "referringInboundURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

LABEL_4:
    -[ICNAController referringInboundURL](self, "referringInboundURL");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[ICNAReferringInboundURLFilter filterReferringInboundURL:](ICNAReferringInboundURLFilter, "filterReferringInboundURL:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = [ICASReferralData alloc];
    -[ICNAController referringApplication](self, "referringApplication");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = -[ICASReferralData initWithReferringApplication:referringInboundUrl:](v7, "initWithReferringApplication:referringInboundUrl:", v8, v6);

    -[ICNAController setReferringApplication:](self, "setReferringApplication:", 0);
    -[ICNAController setReferringInboundURL:](self, "setReferringInboundURL:", 0);

    return v4;
  }
  -[ICNAController referringApplication](self, "referringApplication");
  v4 = (ICASReferralData *)objc_claimAutoreleasedReturnValue();

  if (v4)
    goto LABEL_4;
  return v4;
}

- (void)newAATrackerWithName:(id)a3 completionBlock:(id)a4
{
  -[ICNAController newAATrackerWithName:parentTracker:completionBlock:](self, "newAATrackerWithName:parentTracker:completionBlock:", a3, 0, a4);
}

- (void)newAATrackerWithName:(id)a3 parentTracker:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;

  v8 = a5;
  v9 = a3;
  objc_msgSend(a4, "aaTracker");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[ICNAController newAATrackerWithName:parentAATracker:completionBlock:](self, "newAATrackerWithName:parentAATracker:completionBlock:", v9, v10, v8);

}

- (void)newAATrackerWithName:(id)a3 parentAATracker:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;

  v8 = a3;
  v15 = a4;
  v9 = a5;
  if (v15)
  {
    v10 = v15;
  }
  else
  {
    -[ICNAController sessionManager](self, "sessionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tracker");
    v10 = (id)objc_claimAutoreleasedReturnValue();

  }
  v16 = v10;
  v17 = v8;
  v18 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  performBlockOnMainThreadAndWait();

}

void __71__ICNAController_newAATrackerWithName_parentAATracker_completionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "chainWithName:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 48);
  if (v3)
  {
    v4 = v2;
    (*(void (**)(void))(v3 + 16))();
    v2 = v4;
  }

}

- (void)trackTimedEventType:(Class)a3 subTracker:(id)a4
{
  -[ICNAController trackTimedEventType:subTracker:synchronousTaskBeforeStarting:](self, "trackTimedEventType:subTracker:synchronousTaskBeforeStarting:", a3, a4, 0);
}

- (void)trackTimedEventType:(Class)a3 subTracker:(id)a4 synchronousTaskBeforeStarting:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  ICNAController *v15;
  id v16;
  Class v17;

  v8 = a4;
  v9 = a5;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke;
  v13[3] = &unk_1E771D1F0;
  v14 = v8;
  v15 = self;
  v16 = v9;
  v17 = a3;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  v3 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v3, "aaTracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {
LABEL_5:
      objc_msgSend(v4, "timeEventType:", objc_opt_class());
      goto LABEL_10;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tracker");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      goto LABEL_5;
  }
  v6 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke_cold_1();

LABEL_10:
}

- (void)pushDataObject:(id)a3 unique:(BOOL)a4 onlyOnce:(BOOL)a5 subTracker:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICNAController *v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v10 = a3;
  v11 = a6;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke;
  v15[3] = &unk_1E771D218;
  v16 = v11;
  v17 = self;
  v19 = a4;
  v20 = a5;
  v18 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, v15);

}

void __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  void *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "aaTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_3;
LABEL_7:
    v4 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke_cold_1();
    goto LABEL_9;
  }
  objc_msgSend(*(id *)(a1 + 40), "sessionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "tracker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    goto LABEL_7;
LABEL_3:
  if (!*(_BYTE *)(a1 + 56) && !*(_BYTE *)(a1 + 57))
  {
    objc_msgSend(v3, "pushDataEvent:traits:file:line:", *(_QWORD *)(a1 + 48), 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m"), 1479);
    goto LABEL_10;
  }
  v4 = objc_alloc_init(MEMORY[0x1E0CF86F8]);
  -[NSObject setUnique:](v4, "setUnique:", *(unsigned __int8 *)(a1 + 56));
  -[NSObject setOnlyOnce:](v4, "setOnlyOnce:", *(unsigned __int8 *)(a1 + 57));
  objc_msgSend(v3, "pushDataEvent:traits:file:line:", *(_QWORD *)(a1 + 48), v4, CFSTR("/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m"), 1476);
LABEL_9:

LABEL_10:
}

- (void)pushDataObjects:(id)a3 unique:(BOOL)a4 onlyOnce:(BOOL)a5 subTracker:(id)a6
{
  id v10;
  id v11;
  NSObject *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  ICNAController *v17;
  id v18;
  BOOL v19;
  BOOL v20;

  v10 = a3;
  v11 = a6;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v12 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke;
  v15[3] = &unk_1E771D218;
  v16 = v11;
  v17 = self;
  v19 = a4;
  v20 = a5;
  v18 = v10;
  v13 = v10;
  v14 = v11;
  dispatch_async(v12, v15);

}

void __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  os_log_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "aaTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
LABEL_3:
      if (*(_BYTE *)(a1 + 56) || *(_BYTE *)(a1 + 57))
      {
        v4 = (os_log_t)objc_alloc_init(MEMORY[0x1E0CF86F8]);
        -[NSObject setUnique:](v4, "setUnique:", *(unsigned __int8 *)(a1 + 56));
        -[NSObject setOnlyOnce:](v4, "setOnlyOnce:", *(unsigned __int8 *)(a1 + 57));
        v21 = 0u;
        v22 = 0u;
        v19 = 0u;
        v20 = 0u;
        v5 = *(id *)(a1 + 48);
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v6)
        {
          v7 = v6;
          v8 = *(_QWORD *)v20;
          do
          {
            for (i = 0; i != v7; ++i)
            {
              if (*(_QWORD *)v20 != v8)
                objc_enumerationMutation(v5);
              objc_msgSend(v3, "pushDataEvent:traits:file:line:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i), v4, CFSTR("/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m"), 1498);
            }
            v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
          }
          while (v7);
        }

      }
      else
      {
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v4 = (os_log_t)*(id *)(a1 + 48);
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          do
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v4);
              objc_msgSend(v3, "pushDataEvent:traits:file:line:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m"), 1503, (_QWORD)v15);
            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
          }
          while (v12);
        }
      }
      goto LABEL_16;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "tracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      goto LABEL_3;
  }
  v4 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke_cold_1();
LABEL_16:

}

- (void)popDataObjectWithType:(Class)a3
{
  -[ICNAController popDataObjectWithType:subTracker:](self, "popDataObjectWithType:subTracker:", a3, 0);
}

- (void)popDataObjectWithType:(Class)a3 subTracker:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  ICNAController *v11;
  Class v12;

  v6 = a4;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__ICNAController_popDataObjectWithType_subTracker___block_invoke;
  block[3] = &unk_1E771D240;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_async(v7, block);

}

void __51__ICNAController_popDataObjectWithType_subTracker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "aaTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
LABEL_3:
      objc_msgSend(v3, "popDataEventType:", objc_opt_class());
      goto LABEL_8;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "tracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      goto LABEL_3;
  }
  v5 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __51__ICNAController_popDataObjectWithType_subTracker___block_invoke_cold_1();

LABEL_8:
}

- (void)popDataObjectsWithTypes:(id)a3
{
  -[ICNAController popDataObjectsWithTypes:subTracker:](self, "popDataObjectsWithTypes:subTracker:", a3, 0);
}

- (void)popDataObjectsWithTypes:(id)a3 subTracker:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  ICNAController *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke;
  block[3] = &unk_1E771D010;
  v12 = v7;
  v13 = self;
  v14 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  os_log_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "aaTracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tracker");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
LABEL_3:
      v12 = 0u;
      v13 = 0u;
      v10 = 0u;
      v11 = 0u;
      v4 = (os_log_t)*(id *)(a1 + 48);
      v5 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
      {
        v6 = v5;
        v7 = *(_QWORD *)v11;
        do
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v11 != v7)
              objc_enumerationMutation(v4);
            objc_msgSend(v3, "popDataEventType:", objc_opt_class(), v10);
          }
          v6 = -[NSObject countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
        }
        while (v6);
      }
      goto LABEL_14;
    }
  }
  v4 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke_cold_1();
LABEL_14:

}

- (void)submitEventOfType:(Class)a3 subTracker:(id)a4
{
  -[ICNAController submitEventOfType:subTracker:synchronousTaskBeforeSubmitting:](self, "submitEventOfType:subTracker:synchronousTaskBeforeSubmitting:", a3, a4, 0);
}

- (void)submitEventOfType:(Class)a3 subTracker:(id)a4 synchronousTaskBeforeSubmitting:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  Class v16;

  v8 = a4;
  v9 = a5;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke;
  v13[3] = &unk_1E771D268;
  v15 = v9;
  v16 = a3;
  v13[4] = self;
  v14 = v8;
  v11 = v8;
  v12 = v9;
  dispatch_async(v10, v13);

}

void __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = *(_QWORD *)(a1 + 48);
  if (v2 && !(*(unsigned int (**)(void))(v2 + 16))())
  {
    v3 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke_cold_1();

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_immediatelySubmitEventOfType:subTracker:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));
  }
}

- (void)_immediatelySubmitEventOfType:(Class)a3 subTracker:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v6 = a4;
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "aaTracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
LABEL_3:
      objc_msgSend(v8, "submitEventType:", objc_opt_class());
      goto LABEL_8;
    }
  }
  else
  {
    -[ICNAController sessionManager](self, "sessionManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "tracker");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      goto LABEL_3;
  }
  v10 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    -[ICNAController _immediatelySubmitEventOfType:subTracker:].cold.1((uint64_t)a3, v10, v11, v12, v13, v14, v15, v16);

LABEL_8:
}

- (void)submitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4
{
  -[ICNAController submitEventOfType:pushThenPopDataObjects:subTracker:](self, "submitEventOfType:pushThenPopDataObjects:subTracker:", a3, a4, 0);
}

- (void)submitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4 subTracker:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  Class v16;

  v8 = a4;
  v9 = a5;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __70__ICNAController_submitEventOfType_pushThenPopDataObjects_subTracker___block_invoke;
  v13[3] = &unk_1E771D290;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a3;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

uint64_t __70__ICNAController_submitEventOfType_pushThenPopDataObjects_subTracker___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_immediatelySubmitEventOfType:pushThenPopDataObjects:subTracker:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)_immediatelySubmitEventOfType:(Class)a3 pushThenPopDataObjects:(id)a4 subTracker:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  _QWORD v20[5];
  _QWORD v21[5];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v8 = a4;
  v9 = a5;
  v10 = v9;
  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__4;
  v26 = __Block_byref_object_dispose__4;
  if (v9)
  {
    objc_msgSend(v9, "aaTracker");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[ICNAController sessionManager](self, "sessionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "tracker");
    v27 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v23[5])
  {
    v12 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke;
    v21[3] = &unk_1E771D2B8;
    v21[4] = &v22;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v21);
    objc_msgSend((id)v23[5], "submitEventType:", objc_opt_class());
    v20[0] = v12;
    v20[1] = 3221225472;
    v20[2] = __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke_2;
    v20[3] = &unk_1E771D2B8;
    v20[4] = &v22;
    objc_msgSend(v8, "enumerateObjectsWithOptions:usingBlock:", 2, v20);
  }
  else
  {
    v13 = os_log_create("com.apple.notes", "Analytics");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[ICNAController _immediatelySubmitEventOfType:pushThenPopDataObjects:subTracker:].cold.1((uint64_t)a3, v13, v14, v15, v16, v17, v18, v19);

  }
  _Block_object_dispose(&v22, 8);

}

uint64_t __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "pushDataEvent:traits:file:line:", a2, 0, CFSTR("/Library/Caches/com.apple.xbs/Sources/MobileNotes/NotesAnalytics/ICNAController.m"), 1602);
}

uint64_t __82__ICNAController__immediatelySubmitEventOfType_pushThenPopDataObjects_subTracker___block_invoke_2(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_opt_class();
  return objc_msgSend(v1, "popDataEventType:", objc_opt_class());
}

- (void)enterGroupWithSubtracker:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__ICNAController_enterGroupWithSubtracker___block_invoke;
  block[3] = &unk_1E771BE80;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, block);

}

void __43__ICNAController_enterGroupWithSubtracker___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "aaTracker");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "enterGroup");

}

- (void)leaveGroupWithSubtracker:(id)a3
{
  -[ICNAController leaveGroupWithSubtracker:completionHandler:](self, "leaveGroupWithSubtracker:completionHandler:", a3, 0);
}

- (void)leaveGroupWithSubtracker:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __61__ICNAController_leaveGroupWithSubtracker_completionHandler___block_invoke;
  v11[3] = &unk_1E771C658;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, v11);

}

uint64_t __61__ICNAController_leaveGroupWithSubtracker_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "aaTracker");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "leaveGroup");

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)removePreSydneyDAnalyticsData
{
  NSObject *v2;

  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_149);

}

void __47__ICNAController_removePreSydneyDAnalyticsData__block_invoke()
{
  void *v0;
  char v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  os_log_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint8_t buf[4];
  void *v55;
  __int16 v56;
  id v57;
  _BYTE v58[128];
  _BYTE v59[128];
  _QWORD v60[4];

  v60[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("analyticsRemovedPreviousVersionData"));

  if ((v1 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D64240], "applicationDataContainerURL");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v36 = v2;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = *MEMORY[0x1E0C999D0];
      v60[0] = *MEMORY[0x1E0C999D0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v60, 1);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = v3;
      objc_msgSend(v4, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v3, v5, 5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v53 = 0u;
      v51 = 0u;
      v52 = 0u;
      v50 = 0u;
      v7 = v6;
      v8 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v51;
        v37 = *(_QWORD *)v51;
        v38 = v7;
        do
        {
          v11 = 0;
          v39 = v9;
          do
          {
            if (*(_QWORD *)v51 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * v11);
            objc_msgSend(v12, "lastPathComponent");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v49 = 0;
            objc_msgSend(v12, "getResourceValue:forKey:error:", &v49, v42, 0);
            v43 = v49;
            if (objc_msgSend(v43, "BOOLValue")
              && objc_msgSend(v13, "hasPrefix:", CFSTR("com.apple.app-analytics."))
              && ((objc_msgSend(v13, "hasSuffix:", CFSTR(".upload-dropbox")) & 1) != 0
               || objc_msgSend(v13, "hasSuffix:", CFSTR(".upload-dropbox.debugging"))))
            {
              v40 = v13;
              v41 = v11;
              v14 = os_log_create("com.apple.notes", "Analytics");
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v12, "lastPathComponent");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                v55 = v15;
                _os_log_impl(&dword_1BDCEC000, v14, OS_LOG_TYPE_INFO, "Removing old analytics data at %@", buf, 0xCu);

              }
              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v12, 0, 1, 0);
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              v47 = 0u;
              v48 = 0u;
              v45 = 0u;
              v46 = 0u;
              v18 = v17;
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v46;
                do
                {
                  for (i = 0; i != v20; ++i)
                  {
                    if (*(_QWORD *)v46 != v21)
                      objc_enumerationMutation(v18);
                    v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
                    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = 0;
                    objc_msgSend(v24, "removeItemAtURL:error:", v23, &v44);
                    v25 = v44;

                    if (v25)
                    {
                      v26 = os_log_create("com.apple.notes", "Analytics");
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)buf = 138412546;
                        v55 = v23;
                        v56 = 2112;
                        v57 = v25;
                        _os_log_error_impl(&dword_1BDCEC000, v26, OS_LOG_TYPE_ERROR, "Error deleting item: %@, error: %@", buf, 0x16u);
                      }

                    }
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v45, v58, 16);
                }
                while (v20);
              }

              v7 = v38;
              v9 = v39;
              v10 = v37;
              v13 = v40;
              v11 = v41;
            }

            ++v11;
          }
          while (v11 != v9);
          v9 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        }
        while (v9);
      }

      objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBool:forKey:", 1, CFSTR("analyticsRemovedPreviousVersionData"));

      v3 = v35;
      v2 = v36;
    }
    else
    {
      v7 = os_log_create("com.apple.notes", "Analytics");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __47__ICNAController_removePreSydneyDAnalyticsData__block_invoke_cold_1(v7, v28, v29, v30, v31, v32, v33, v34);
    }

  }
}

- (void)flushWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[16];

  v4 = a3;
  v5 = os_log_create("com.apple.notes", "Analytics");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1BDCEC000, v5, OS_LOG_TYPE_INFO, "flushWithCompletionHandler started", buf, 2u);
  }

  -[ICNAController instrumentationQueue](self, "instrumentationQueue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __45__ICNAController_flushWithCompletionHandler___block_invoke;
  v8[3] = &unk_1E771C658;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __45__ICNAController_flushWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "flushManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "flushWithCompletion:", *(_QWORD *)(a1 + 40));

}

+ (NSString)userID
{
  void *v2;
  void *v3;

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (id)privateUserID
{
  void *v2;
  void *v3;

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "privateUserID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (NSString)saltVersion
{
  void *v2;
  void *v3;

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identityTimestampYYYYMM");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (unint64_t)startYear
{
  void *v2;
  unint64_t v3;

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startYear");

  return v3;
}

+ (unint64_t)startMonth
{
  void *v2;
  unint64_t v3;

  +[ICNAIdentityManager sharedManager](ICNAIdentityManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "startMonth");

  return v3;
}

+ (NSString)deviceModel
{
  utsname v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  memset(&v3, 0, 512);
  uname(&v3);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v3.machine, 4);
  return (NSString *)(id)objc_claimAutoreleasedReturnValue();
}

+ (NSString)devicePlatform
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "systemName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

+ (BOOL)bioAuthEnabled
{
  return objc_msgSend(MEMORY[0x1E0D63B90], "biometricsEnrolled");
}

+ (BOOL)localNotesEnabled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D64270], "objectForKey:", CFSTR("LocalNotes"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (NSString)osVersion
{
  if (osVersion_onceToken != -1)
    dispatch_once(&osVersion_onceToken, &__block_literal_global_166);
  return (NSString *)(id)osVersion_osVersion;
}

void __27__ICNAController_osVersion__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)_CFCopySupplementalVersionDictionary();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9ABB0]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)osVersion_osVersion;
  osVersion_osVersion = v0;

}

+ (id)osBundleVersion
{
  if (osBundleVersion_onceToken != -1)
    dispatch_once(&osBundleVersion_onceToken, &__block_literal_global_167);
  return (id)osBundleVersion_buildVersion;
}

void __33__ICNAController_osBundleVersion__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  v2 = (id)_CFCopySupplementalVersionDictionary();
  objc_msgSend(v2, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)osBundleVersion_buildVersion;
  osBundleVersion_buildVersion = v0;

}

+ (NSString)deviceID
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("analytics_device_id"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "UUIDString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0D64188], "sharedAppGroupDefaults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("analytics_device_id"));

  }
  return (NSString *)v3;
}

+ (NSString)storeFrontID
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "ams_activeiTunesAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "ams_sharedAccountStore");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "ams_localiTunesAccount");
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v5, "ams_storefront");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (ICNAControllerAppDelegate)appDelegate
{
  return (ICNAControllerAppDelegate *)objc_loadWeakRetained((id *)&self->_appDelegate);
}

- (void)setAppDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_appDelegate, a3);
}

- (NSURL)referringInboundURL
{
  return (NSURL *)objc_getProperty(self, a2, 24, 1);
}

- (void)setReferringInboundURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)referringApplication
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setReferringApplication:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSString)startingSessionType
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setStartingSessionType:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSString)privateSessionID
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPrivateSessionID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (AAAppSessionManager)appSessionManager
{
  return self->_appSessionManager;
}

- (void)setAppSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_appSessionManager, a3);
}

- (AAFlushManager)flushManager
{
  return self->_flushManager;
}

- (void)setFlushManager:(id)a3
{
  objc_storeStrong((id *)&self->_flushManager, a3);
}

- (AAUploadBatchEventConfig)uploadBatchEventConfig
{
  return self->_uploadBatchEventConfig;
}

- (void)setUploadBatchEventConfig:(id)a3
{
  objc_storeStrong((id *)&self->_uploadBatchEventConfig, a3);
}

- (AAClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (AASessionManager)sessionManager
{
  return self->_sessionManager;
}

- (void)setSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_sessionManager, a3);
}

- (NSMutableDictionary)sessionForWindowDict
{
  return self->_sessionForWindowDict;
}

- (void)setSessionForWindowDict:(id)a3
{
  objc_storeStrong((id *)&self->_sessionForWindowDict, a3);
}

- (NSMutableDictionary)sessionTrackerForWindowDict
{
  return self->_sessionTrackerForWindowDict;
}

- (void)setSessionTrackerForWindowDict:(id)a3
{
  objc_storeStrong((id *)&self->_sessionTrackerForWindowDict, a3);
}

- (ICNAServerEnvironment)serverEnvironment
{
  return self->_serverEnvironment;
}

- (void)setServerEnvironment:(id)a3
{
  objc_storeStrong((id *)&self->_serverEnvironment, a3);
}

- (int64_t)deviceOrientationEnum
{
  return self->_deviceOrientationEnum;
}

- (void)setDeviceOrientationEnum:(int64_t)a3
{
  self->_deviceOrientationEnum = a3;
}

- (OS_dispatch_queue)instrumentationQueue
{
  return self->_instrumentationQueue;
}

- (void)setInstrumentationQueue:(id)a3
{
  objc_storeStrong((id *)&self->_instrumentationQueue, a3);
}

- (NSNumber)endSessionBackgroundTaskIdentifier
{
  return self->_endSessionBackgroundTaskIdentifier;
}

- (void)setEndSessionBackgroundTaskIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endSessionBackgroundTaskIdentifier, a3);
}

- (NSMutableDictionary)endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier
{
  return self->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier;
}

- (void)setEndSessionBackgroundTaskIdentifiersByWindowSceneIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_endSessionBackgroundTaskIdentifiersByWindowSceneIdentifier, a3);
}

- (ICNAMultiSceneSessionTracker)multiSceneSessionTracker
{
  return self->_multiSceneSessionTracker;
}

- (void)setMultiSceneSessionTracker:(id)a3
{
  objc_storeStrong((id *)&self->_multiSceneSessionTracker, a3);
}

- (NSDate)sessionStartDate
{
  return self->_sessionStartDate;
}

- (void)setSessionStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_sessionStartDate, a3);
}

void __39__ICNAController_startSessionWithType___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, v0, v1, "Attempting to start a session with an unknown type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, a1, a3, "endSession Background task expired before endSession completed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_80_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, a2, a3, "A longer than normal analytics session was detected. Session duration was %@.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __67__ICNAController_endSessionSynchronously_forSessionType_endReason___block_invoke_91_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, v0, v1, "Attempting to end a session with an unknown type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __90__ICNAController_endWindowSceneSessionSynchronously_forSessionType_endReason_windowScene___block_invoke_3_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, a1, a3, "endWindowSceneSession Background task expired before endSession completed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __79__ICNAController_trackTimedEventType_subTracker_synchronousTaskBeforeStarting___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, v0, v1, "No tracker is found when tracking timed event type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __60__ICNAController_pushDataObject_unique_onlyOnce_subTracker___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, v0, v1, "No tracker is found when pushing data object: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __61__ICNAController_pushDataObjects_unique_onlyOnce_subTracker___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, v0, v1, "No tracker is found when pushing data objects: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __51__ICNAController_popDataObjectWithType_subTracker___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, v0, v1, "No tracker is found when popping data object type: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __53__ICNAController_popDataObjectsWithTypes_subTracker___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, v0, v1, "No tracker is found when popping data object types: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

void __79__ICNAController_submitEventOfType_subTracker_synchronousTaskBeforeSubmitting___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1BDCEC000, v0, OS_LOG_TYPE_DEBUG, "Ignoring event submission. It should have already been submitted as synchronous task block returned NO: %@", v1, 0xCu);
  OUTLINED_FUNCTION_4();
}

- (void)_immediatelySubmitEventOfType:(uint64_t)a3 subTracker:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, a2, a3, "No tracker is found for an active session when immediately submitting event type: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

- (void)_immediatelySubmitEventOfType:(uint64_t)a3 pushThenPopDataObjects:(uint64_t)a4 subTracker:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3(&dword_1BDCEC000, a2, a3, "No tracker is found for an active session when submitting event type: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __47__ICNAController_removePreSydneyDAnalyticsData__block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1BDCEC000, a1, a3, "Error removing pre SydneyD analytics data, appDocumentsDirectoryURL is nil", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
