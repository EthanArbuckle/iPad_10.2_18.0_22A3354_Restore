@implementation ATXCDNDownloaderTriggerManager

uint64_t __78__ATXCDNDownloaderTriggerManager__registerForSiriSettingsChangedNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleSiriSettingsChangedNotification");
}

- (void)handleSiriSettingsChangedNotification
{
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  objc_class *v7;
  void *v8;
  ATXHeroClipManager *heroClipManager;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = (void *)CFPreferencesCopyAppValue(CFSTR("SuggestionsSuggestAppClips"), CFSTR("com.apple.suggestions"));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "BOOLValue");
  else
    v5 = 1;

  __atxlog_handle_default();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (objc_class *)objc_opt_class();
    NSStringFromClass(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v8;
    v13 = 1024;
    v14 = v5;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%@ - got siri settings notification, canSuggestAppClips is: %{BOOL}d", (uint8_t *)&v11, 0x12u);

  }
  if ((v5 & 1) == 0)
  {
    heroClipManager = self->_heroClipManager;
    v10 = (void *)objc_opt_new();
    -[ATXHeroClipManager donateAppClipsWithHeroAppPredictions:](heroClipManager, "donateAppClipsWithHeroAppPredictions:", v10);

  }
}

- (ATXCDNDownloaderTriggerManager)initWithCDNDownloader:(id)a3 predictionContextBuilder:(id)a4 nudgeRegistrar:(Class)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  ATXHeroDataServer *v12;
  void *v13;
  ATXHeroDataServer *v14;
  void *v15;
  ATXCDNDownloaderTriggerManager *v16;

  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_opt_new();
  v11 = (void *)objc_opt_new();
  v12 = [ATXHeroDataServer alloc];
  v13 = (void *)objc_opt_new();
  v14 = -[ATXHeroDataServer initWithHeroClipManager:heroAppManager:tracker:](v12, "initWithHeroClipManager:heroAppManager:tracker:", v10, v11, v13);

  objc_msgSend(MEMORY[0x1E0D80DC8], "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[ATXCDNDownloaderTriggerManager initWithCDNDownloader:heroAppServer:heroClipManager:heroAppManager:predictionContextBuilder:nudgeRegistrar:locationManager:](self, "initWithCDNDownloader:heroAppServer:heroClipManager:heroAppManager:predictionContextBuilder:nudgeRegistrar:locationManager:", v9, v14, v10, v11, v8, a5, v15);

  return v16;
}

- (ATXCDNDownloaderTriggerManager)initWithCDNDownloader:(id)a3 heroAppServer:(id)a4 heroClipManager:(id)a5 heroAppManager:(id)a6 predictionContextBuilder:(id)a7 nudgeRegistrar:(Class)a8 locationManager:(id)a9
{
  id v15;
  id v16;
  id v17;
  ATXCDNDownloaderTriggerManager *v18;
  ATXCDNDownloaderTriggerManager *v19;
  objc_class *v20;
  const char *Name;
  NSObject *v22;
  dispatch_queue_t v23;
  OS_dispatch_queue *queue;
  ATXTimeBucketedRateLimiter *v25;
  ATXTimeBucketedRateLimiter *rateLimiter;
  id v29;
  id v30;
  id v31;
  _QWORD v32[4];
  ATXCDNDownloaderTriggerManager *v33;
  objc_super v34;

  v31 = a3;
  v30 = a4;
  v29 = a5;
  v15 = a6;
  v16 = a7;
  v17 = a9;
  v34.receiver = self;
  v34.super_class = (Class)ATXCDNDownloaderTriggerManager;
  v18 = -[ATXCDNDownloaderTriggerManager init](&v34, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_heroClipManager, a5);
    objc_storeStrong((id *)&v19->_heroAppManager, a6);
    objc_storeStrong((id *)&v19->_server, a4);
    objc_storeStrong((id *)&v19->_cdnDownloader, a3);
    objc_storeStrong((id *)&v19->_locationManager, a9);
    objc_storeStrong((id *)&v19->_predictionContextBuilder, a7);
    v20 = (objc_class *)objc_opt_class();
    Name = class_getName(v20);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = dispatch_queue_create(Name, v22);
    queue = v19->_queue;
    v19->_queue = (OS_dispatch_queue *)v23;

    v25 = -[ATXTimeBucketedRateLimiter initWithMaxCount:perPeriod:]([ATXTimeBucketedRateLimiter alloc], "initWithMaxCount:perPeriod:", 2, 15.0);
    rateLimiter = v19->_rateLimiter;
    v19->_rateLimiter = v25;

    -[ATXCDNDownloaderTriggerManager _registerForRestrictionChangedNotifications](v19, "_registerForRestrictionChangedNotifications");
    -[ATXCDNDownloaderTriggerManager _registerForSiriSettingsChangedNotifications](v19, "_registerForSiriSettingsChangedNotifications");
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __157__ATXCDNDownloaderTriggerManager_initWithCDNDownloader_heroAppServer_heroClipManager_heroAppManager_predictionContextBuilder_nudgeRegistrar_locationManager___block_invoke;
    v32[3] = &unk_1E82DAC38;
    v33 = v19;
    -[objc_class registerForNearbyAppNudgeWithBlock:](a8, "registerForNearbyAppNudgeWithBlock:", v32);

  }
  return v19;
}

uint64_t __157__ATXCDNDownloaderTriggerManager_initWithCDNDownloader_heroAppServer_heroClipManager_heroAppManager_predictionContextBuilder_nudgeRegistrar_locationManager___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  __atxlog_handle_hero();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "Trigger received", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "queryAndHandlePredictionsFromCDNDownloader");
}

- (ATXCDNDownloaderTriggerManager)init
{
  id v3;
  ATXPredictionContextBuilder *v4;
  ATXCDNDownloaderTriggerManager *v5;

  v3 = objc_alloc_init(MEMORY[0x1E0D80CD8]);
  v4 = objc_alloc_init(ATXPredictionContextBuilder);
  v5 = -[ATXCDNDownloaderTriggerManager initWithCDNDownloader:predictionContextBuilder:nudgeRegistrar:](self, "initWithCDNDownloader:predictionContextBuilder:nudgeRegistrar:", v3, v4, objc_opt_class());

  return v5;
}

- (void)queryAndHandlePredictionsFromCDNDownloader
{
  void *v3;
  char v4;
  ATXProactiveCDNDownloaderProtocol *cdnDownloader;
  NSObject *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  +[_ATXGlobals sharedInstance](_ATXGlobals, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "cdnDownloaderIsEnabled");

  if ((v4 & 1) != 0)
  {
    cdnDownloader = self->_cdnDownloader;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke;
    v7[3] = &unk_1E82DE988;
    v7[4] = self;
    -[ATXProactiveCDNDownloaderProtocol highConfidenceHeroDatasForCurrentLocationWithCompletion:](cdnDownloader, "highConfidenceHeroDatasForCurrentLocationWithCompletion:", v7);
  }
  else
  {
    __atxlog_handle_hero();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Skipping CDN download since it's disabled", buf, 2u);
    }

  }
}

void __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    __atxlog_handle_hero();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke_cold_1((uint64_t)v6, v7, v8);

    goto LABEL_5;
  }
  if (!objc_msgSend(v5, "count"))
  {
LABEL_5:
    __atxlog_handle_hero();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "-[ATXCDNDownloaderTriggerManager queryAndHandlePredictionsFromCDNDownloader]_block_invoke";
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "%s No high confidence hero app predictions received for current location. Forwarding location to CDNDownloader ", (uint8_t *)&v11, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "forwardLocationToCDNDownloaderAndHandleReply");
    goto LABEL_12;
  }
  __atxlog_handle_hero();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[ATXCDNDownloaderTriggerManager queryAndHandlePredictionsFromCDNDownloader]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, "%s Received high confidence hero app predictions for current location. Forwarding predictions to ATXHeroDataServer", (uint8_t *)&v11, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_forwardHeroAppPredictionsToHeroAppPredictionsServer:", v5);
LABEL_12:

}

- (void)forwardLocationToCDNDownloaderAndHandleReply
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  ATXProactiveCDNDownloaderProtocol *cdnDownloader;
  NSObject *v8;
  void *v9;
  _QWORD v10[5];
  uint8_t buf[16];

  sel_getName(a2);
  v3 = (void *)os_transaction_create();
  -[ATXCDNDownloaderTriggerManager rateLimiter](self, "rateLimiter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "tryToIncrementCountAndReturnSuccess");

  if ((v5 & 1) != 0)
  {
    -[ATXCDNDownloaderTriggerManager requestHighQualityLocationWithHundredMeterAccuracy](self, "requestHighQualityLocationWithHundredMeterAccuracy");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      cdnDownloader = self->_cdnDownloader;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __78__ATXCDNDownloaderTriggerManager_forwardLocationToCDNDownloaderAndHandleReply__block_invoke;
      v10[3] = &unk_1E82DE988;
      v10[4] = self;
      -[ATXProactiveCDNDownloaderProtocol heroDatasForLocation:completion:](cdnDownloader, "heroDatasForLocation:completion:", v6, v10);
    }
    else
    {
      __atxlog_handle_hero();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEFAULT, "Clearing hero app predictions since nil or bad quality location received.", buf, 2u);
      }

      v9 = (void *)objc_opt_new();
      -[ATXCDNDownloaderTriggerManager _forwardHeroAppPredictionsToHeroAppPredictionsServer:](self, "_forwardHeroAppPredictionsToHeroAppPredictionsServer:", v9);

    }
  }
  else
  {
    __atxlog_handle_hero();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "Skipping CDN download since rate limit exceeded", buf, 2u);
    }
  }

}

void __78__ATXCDNDownloaderTriggerManager_forwardLocationToCDNDownloaderAndHandleReply__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;

  v5 = a3;
  if (v5)
  {
    __atxlog_handle_hero();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke_cold_1((uint64_t)v5, v6, v7);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_forwardHeroAppPredictionsToHeroAppPredictionsServer:", a2);
  }

}

- (id)requestHighQualityLocationWithHundredMeterAccuracy
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  NSObject *v13;
  _BOOL4 v14;
  id v15;
  int v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[ATXPredictionContextBuilderProtocol predictionContextForCurrentContext](self->_predictionContextBuilder, "predictionContextForCurrentContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXLocationManager getCurrentLocation](self->_locationManager, "getCurrentLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  __atxlog_handle_hero();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (!v4)
  {
    if (v8)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Nil location received. Ignoring trigger.", (uint8_t *)&v17, 2u);
    }

    goto LABEL_11;
  }
  if (v8)
  {
    objc_msgSend(v4, "coordinate");
    v10 = v9;
    objc_msgSend(v4, "coordinate");
    v17 = 134545921;
    v18 = v10;
    v19 = 2053;
    v20 = v11;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "Received location, %{sensitive}f, %{sensitive}f", (uint8_t *)&v17, 0x16u);
  }

  v12 = objc_msgSend((id)objc_opt_class(), "_locationIsStaleOrNotAccurateEnough:now:", v4, v6);
  __atxlog_handle_hero();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
  if (v12)
  {
    if (v14)
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Stale or inaccurate location received. Ignoring trigger.", (uint8_t *)&v17, 2u);
    }

LABEL_11:
    v15 = 0;
    goto LABEL_15;
  }
  if (v14)
  {
    LOWORD(v17) = 0;
    _os_log_impl(&dword_1C9A3B000, v13, OS_LOG_TYPE_DEFAULT, "Location passed quality checks. Forwarding to CDN Downloader.", (uint8_t *)&v17, 2u);
  }

  v15 = v4;
LABEL_15:

  return v15;
}

+ (BOOL)_locationIsStaleOrNotAccurateEnough:(id)a3 now:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  const char *v11;
  double v12;
  double v13;
  BOOL v14;
  int v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "timestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 <= 60.0)
  {
    objc_msgSend(v5, "horizontalAccuracy");
    if (v12 <= 100.0)
    {
      v14 = 0;
      goto LABEL_10;
    }
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v5, "horizontalAccuracy");
      v16 = 134217984;
      v17 = v13;
      v11 = "Location uncertainty too large, horizontalAccuracy, %f. Ignoring trigger.";
      goto LABEL_7;
    }
  }
  else
  {
    __atxlog_handle_hero();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 134217984;
      v17 = v9;
      v11 = "Location is stale. Age: %f. Ignoring trigger.";
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v10, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v16, 0xCu);
    }
  }

  v14 = 1;
LABEL_10:

  return v14;
}

- (void)_forwardHeroAppPredictionsToHeroAppPredictionsServer:(id)a3
{
  -[ATXHeroDataServer donateHeroAppPredictions:completion:](self->_server, "donateHeroAppPredictions:completion:", a3, &__block_literal_global_61);
}

void __87__ATXCDNDownloaderTriggerManager__forwardHeroAppPredictionsToHeroAppPredictionsServer___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  __atxlog_handle_hero();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      __87__ATXCDNDownloaderTriggerManager__forwardHeroAppPredictionsToHeroAppPredictionsServer___block_invoke_cold_1(v2, v4);
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[ATXCDNDownloaderTriggerManager _forwardHeroAppPredictionsToHeroAppPredictionsServer:]_block_invoke";
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s Successfully donated predictions.", (uint8_t *)&v5, 0xCu);
  }

}

- (void)_registerForRestrictionChangedNotifications
{
  void *v3;
  uint64_t v4;
  void *v5;
  id restrictionChangedNotificationToken;
  _QWORD v7[5];

  if (!self->_restrictionChangedNotificationToken)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *MEMORY[0x1E0D471F0];
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __77__ATXCDNDownloaderTriggerManager__registerForRestrictionChangedNotifications__block_invoke;
    v7[3] = &unk_1E82DE9D0;
    v7[4] = self;
    objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", v4, 0, 0, v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    restrictionChangedNotificationToken = self->_restrictionChangedNotificationToken;
    self->_restrictionChangedNotificationToken = v5;

  }
}

uint64_t __77__ATXCDNDownloaderTriggerManager__registerForRestrictionChangedNotifications__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleProfileChangedNotification");
}

- (void)handleProfileChangedNotification
{
  void *v3;
  char v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  ATXHeroClipManager *heroClipManager;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAppClipsAllowed");

  if ((v4 & 1) == 0)
  {
    __atxlog_handle_hero();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v7;
      _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - MCProfileConnection status changed, App clips no longer allowed. Clearing predictions", (uint8_t *)&v10, 0xCu);

    }
    heroClipManager = self->_heroClipManager;
    v9 = (void *)objc_opt_new();
    -[ATXHeroClipManager donateAppClipsWithHeroAppPredictions:](heroClipManager, "donateAppClipsWithHeroAppPredictions:", v9);

  }
}

- (void)_registerForSiriSettingsChangedNotifications
{
  NSObject *queue;
  _QWORD handler[5];

  if (!self->_siriSettingsChangedNotificationToken)
  {
    queue = self->_queue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __78__ATXCDNDownloaderTriggerManager__registerForSiriSettingsChangedNotifications__block_invoke;
    handler[3] = &unk_1E82DB9B0;
    handler[4] = self;
    notify_register_dispatch("com.apple.suggestions.settingsChanged", &self->_siriSettingsChangedNotificationToken, queue, handler);
  }
}

- (ATXHeroDataServer)server
{
  return self->_server;
}

- (ATXProactiveCDNDownloaderProtocol)cdnDownloader
{
  return self->_cdnDownloader;
}

- (ATXHeroAppManager)heroAppManager
{
  return self->_heroAppManager;
}

- (ATXHeroClipManager)heroClipManager
{
  return self->_heroClipManager;
}

- (ATXTimeBucketedRateLimiter)rateLimiter
{
  return self->_rateLimiter;
}

- (ATXPredictionContextBuilderProtocol)predictionContextBuilder
{
  return self->_predictionContextBuilder;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionContextBuilder, 0);
  objc_storeStrong((id *)&self->_rateLimiter, 0);
  objc_storeStrong((id *)&self->_heroClipManager, 0);
  objc_storeStrong((id *)&self->_heroAppManager, 0);
  objc_storeStrong((id *)&self->_cdnDownloader, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_restrictionChangedNotificationToken, 0);
}

void __76__ATXCDNDownloaderTriggerManager_queryAndHandlePredictionsFromCDNDownloader__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, a3, "Error while querying data from GeoServices. Error: %@.", (uint8_t *)&v3);
}

void __87__ATXCDNDownloaderTriggerManager__forwardHeroAppPredictionsToHeroAppPredictionsServer___block_invoke_cold_1(void *a1, NSObject *a2)
{
  id v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v5 = 136446210;
  v6 = objc_msgSend(v3, "UTF8String");
  OUTLINED_FUNCTION_0_3(&dword_1C9A3B000, a2, v4, "Error while donating predictions, %{public}s", (uint8_t *)&v5);

}

@end
