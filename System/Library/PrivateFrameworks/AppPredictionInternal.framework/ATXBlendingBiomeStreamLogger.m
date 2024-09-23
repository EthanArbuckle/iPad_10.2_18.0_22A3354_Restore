@implementation ATXBlendingBiomeStreamLogger

+ (id)defaultBiomeStreamLogger
{
  void *v3;
  void *v4;

  v3 = (void *)objc_opt_new();
  objc_msgSend(a1, "biomeStreamLoggerWithPath:dataStoreWrapper:", CFSTR("biomeStreamMetricsLogger"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)biomeStreamLoggerWithPath:(id)a3 dataStoreWrapper:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_opt_new();
  objc_msgSend(a1, "biomeStreamLoggerWithPath:tracker:dataStoreWrapper:", v7, v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)biomeStreamLoggerWithPath:(id)a3 tracker:(id)a4 dataStoreWrapper:(id)a5
{
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v7 = (void *)MEMORY[0x1E0CF94D8];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  objc_msgSend(v7, "metricsRootDirectory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:", v12);
  objc_msgSend(MEMORY[0x1E0CF94A0], "bookmarkFromURLPath:maxFileSize:versionNumber:", v13, 1000000, &unk_1E83CD3D8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v14)
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF94A0]), "initWithURLPath:versionNumber:bookmark:metadata:", v13, &unk_1E83CD3D8, 0, 0);
  v15 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithBookmark:tracker:dataStoreWrapper:", v14, v9, v8);

  return v15;
}

- (ATXBlendingBiomeStreamLogger)initWithBookmark:(id)a3 tracker:(id)a4 dataStoreWrapper:(id)a5
{
  id v9;
  id v10;
  id v11;
  ATXBlendingBiomeStreamLogger *v12;
  ATXBlendingBiomeStreamLogger *v13;
  ATXHeroAppSingleSuggestionLogger *v14;
  ATXHeroAppSingleSuggestionLogger *heroLogger;
  ATXAppClipSingleSuggestionLogger *v16;
  ATXAppClipSingleSuggestionLogger *appClipLogger;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)ATXBlendingBiomeStreamLogger;
  v12 = -[ATXBlendingBiomeStreamLogger init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_bookmark, a3);
    objc_storeStrong((id *)&v13->_tracker, a4);
    objc_storeStrong((id *)&v13->_dataStoreWrapper, a5);
    v14 = -[ATXHeroAppSingleSuggestionLogger initWithTracker:]([ATXHeroAppSingleSuggestionLogger alloc], "initWithTracker:", v10);
    heroLogger = v13->_heroLogger;
    v13->_heroLogger = v14;

    v16 = -[ATXAppClipSingleSuggestionLogger initWithTracker:]([ATXAppClipSingleSuggestionLogger alloc], "initWithTracker:", v10);
    appClipLogger = v13->_appClipLogger;
    v13->_appClipLogger = v16;

  }
  return v13;
}

- (NSString)abGroup
{
  NSString *currentABGroup;
  void *v4;
  NSString *v5;
  NSString *v6;

  currentABGroup = self->_currentABGroup;
  if (!currentABGroup)
  {
    objc_msgSend(MEMORY[0x1E0D80CD0], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "abGroup");
    v5 = (NSString *)objc_claimAutoreleasedReturnValue();
    v6 = self->_currentABGroup;
    self->_currentABGroup = v5;

    currentABGroup = self->_currentABGroup;
  }
  return currentABGroup;
}

- (void)updateCurrentABGroup:(id)a3
{
  objc_storeStrong((id *)&self->_currentABGroup, a3);
}

- (void)logBlendingMetricsFromBiomeStream
{
  void *v4;
  void *v5;
  dispatch_semaphore_t v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  ATXBMBookmark *bookmark;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  objc_class *v16;
  void *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  ATXBMBookmark *v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t, void *);
  void *v25;
  uint64_t *v26;
  id v27;
  _QWORD v28[4];
  NSObject *v29;
  uint64_t *v30;
  id v31;
  id location;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  ATXBMBookmark *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  -[ATXBlendingBiomeStreamLogger mergedSessionEventWithContextPublisher](self, "mergedSessionEventWithContextPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  sel_getName(a2);
  v5 = (void *)os_transaction_create();
  v6 = dispatch_semaphore_create(0);
  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  objc_initWeak(&location, self);
  __atxlog_handle_metrics();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    bookmark = self->_bookmark;
    *(_DWORD *)buf = 138412546;
    v38 = v9;
    v39 = 2112;
    v40 = bookmark;
    _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - starting with bookmark %@", buf, 0x16u);

  }
  -[ATXBMBookmark bookmark](self->_bookmark, "bookmark");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v28[0] = MEMORY[0x1E0C809B0];
  v28[1] = 3221225472;
  v28[2] = __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke;
  v28[3] = &unk_1E82E60B8;
  objc_copyWeak(&v31, &location);
  v30 = &v33;
  v13 = v6;
  v29 = v13;
  v22 = v12;
  v23 = 3221225472;
  v24 = __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke_20;
  v25 = &unk_1E82E60E0;
  objc_copyWeak(&v27, &location);
  v26 = &v33;
  v14 = (id)objc_msgSend(v4, "sinkWithBookmark:completion:receiveInput:", v11, v28, &v22);

  if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v13, 2.0, v22, v23, v24, v25) == 1)
  {
    __atxlog_handle_metrics();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (objc_class *)objc_opt_class();
      NSStringFromClass(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v38 = v17;
      _os_log_impl(&dword_1C9A3B000, v15, OS_LOG_TYPE_DEFAULT, "%@ - event processing timeout", buf, 0xCu);

    }
  }
  else
  {
    __atxlog_handle_metrics();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = (ATXBMBookmark *)v34[3];
      *(_DWORD *)buf = 138412546;
      v38 = v20;
      v39 = 2048;
      v40 = v21;
      _os_log_impl(&dword_1C9A3B000, v18, OS_LOG_TYPE_DEFAULT, "%@ - processed %ld events", buf, 0x16u);

    }
    if (v34[3] >= 1)
      -[ATXBlendingBiomeStreamLogger persistContext](self, "persistContext");
  }
  objc_destroyWeak(&v27);

  objc_destroyWeak(&v31);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v33, 8);

}

void __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id *WeakRetained;
  id *v6;
  NSObject *v7;
  objc_class *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    if (*(uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) >= 1)
    {
      objc_msgSend(WeakRetained[8], "flushEventBuffers");
      objc_msgSend(v6[9], "flushEventBuffers");
      __atxlog_handle_metrics();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = (objc_class *)objc_opt_class();
        NSStringFromClass(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = 138412290;
        v15 = v9;
        _os_log_impl(&dword_1C9A3B000, v7, OS_LOG_TYPE_DEFAULT, "%@ - obtained new bookmark", (uint8_t *)&v14, 0xCu);

      }
      v10 = objc_alloc(MEMORY[0x1E0CF94A0]);
      objc_msgSend(v6[3], "urlPath");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v10, "initWithURLPath:versionNumber:bookmark:metadata:", v11, &unk_1E83CD3D8, v4, 0);
      v13 = v6[3];
      v6[3] = (id)v12;

    }
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  }

}

void __65__ATXBlendingBiomeStreamLogger_logBlendingMetricsFromBiomeStream__block_invoke_20(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = (void *)MEMORY[0x1CAA48B6C]();
    objc_msgSend(v8, "event");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "eventBody");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "loggerContext");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "handleClientModelCacheUpdateEvent:loggerContext:", v6, v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "loggerContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "handleBlendingModelCacheUpdateEvent:loggerContext:", v6, v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
LABEL_9:
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);

          objc_autoreleasePoolPop(v4);
          goto LABEL_10;
        }
        objc_msgSend(v8, "loggerContext");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(WeakRetained, "handleUIEvent:loggerContext:", v6, v7);
      }
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (void)persistContext
{
  ATXBMBookmark *bookmark;
  id v4;
  NSObject *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  bookmark = self->_bookmark;
  v9 = 0;
  -[ATXBMBookmark saveBookmarkWithError:](bookmark, "saveBookmarkWithError:", &v9);
  v4 = v9;
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (objc_class *)objc_opt_class();
    NSStringFromClass(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXBMBookmark urlPath](self->_bookmark, "urlPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v11 = v7;
    v12 = 2112;
    v13 = v8;
    v14 = 2112;
    v15 = v4;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "%@ - persisted bookmark to path %@ with error: %@", buf, 0x20u);

  }
}

- (id)mergedSessionEventWithContextPublisher
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[3];

  v10[2] = *MEMORY[0x1E0C80C00];
  -[ATXBlendingBiomeStreamLogger _clientModelPublisher](self, "_clientModelPublisher");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBlendingBiomeStreamLogger _blendingModelPublisher](self, "_blendingModelPublisher");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBlendingBiomeStreamLogger _uiPublisher](self, "_uiPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  v10[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ATXBlendingBiomeStreamLogger _timeBasedMergePublisher:withOtherPublishers:](self, "_timeBasedMergePublisher:withOtherPublishers:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[ATXBlendingBiomeStreamLogger _loggerContextPublisherWithPublisher:](self, "_loggerContextPublisherWithPublisher:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_clientModelPublisher
{
  BPSPublisher *clientModelPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  clientModelPublisher = self->_clientModelPublisher;
  if (!clientModelPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_clientModelPublisher;
    self->_clientModelPublisher = v6;

    clientModelPublisher = self->_clientModelPublisher;
  }
  return clientModelPublisher;
}

- (id)_blendingModelPublisher
{
  BPSPublisher *blendingModelPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  blendingModelPublisher = self->_blendingModelPublisher;
  if (!blendingModelPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "publisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_blendingModelPublisher;
    self->_blendingModelPublisher = v6;

    blendingModelPublisher = self->_blendingModelPublisher;
  }
  return blendingModelPublisher;
}

- (id)_uiPublisher
{
  BPSPublisher *uiPublisher;
  void *v4;
  void *v5;
  BPSPublisher *v6;
  BPSPublisher *v7;

  uiPublisher = self->_uiPublisher;
  if (!uiPublisher)
  {
    v4 = (void *)objc_opt_new();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", -86400.0);
    objc_msgSend(v5, "timeIntervalSinceReferenceDate");
    objc_msgSend(v4, "genericEventPublisherFromStartTime:");
    v6 = (BPSPublisher *)objc_claimAutoreleasedReturnValue();
    v7 = self->_uiPublisher;
    self->_uiPublisher = v6;

    uiPublisher = self->_uiPublisher;
  }
  return uiPublisher;
}

- (id)_timeBasedMergePublisher:(id)a3 withOtherPublishers:(id)a4
{
  return (id)objc_msgSend(a3, "orderedMergeWithOthers:comparator:", a4, &__block_literal_global_144);
}

uint64_t __77__ATXBlendingBiomeStreamLogger__timeBasedMergePublisher_withOtherPublishers___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)_loggerContextPublisherWithPublisher:(id)a3
{
  id v3;
  ATXBlendingBiomeStreamLoggerContextWrapper *v4;
  void *v5;
  ATXBlendingBiomeStreamLoggerContextWrapper *v6;
  void *v7;

  v3 = a3;
  v4 = [ATXBlendingBiomeStreamLoggerContextWrapper alloc];
  v5 = (void *)objc_opt_new();
  v6 = -[ATXBlendingBiomeStreamLoggerContextWrapper initWithEvent:loggerContext:](v4, "initWithEvent:loggerContext:", 0, v5);

  objc_msgSend(v3, "scanWithInitial:nextPartialResult:", v6, &__block_literal_global_35_1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

ATXBlendingBiomeStreamLoggerContextWrapper *__69__ATXBlendingBiomeStreamLogger__loggerContextPublisherWithPublisher___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  ATXBlendingBiomeStreamLoggerContextWrapper *v10;

  v4 = a2;
  v5 = a3;
  v6 = (void *)MEMORY[0x1CAA48B6C]();
  objc_msgSend(v5, "eventBody");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "loggerContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v8, "updateWithClientModelCacheUpdate:", v7);
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v8, "updateWithBlendingUICacheUpdate:", v7);
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          objc_msgSend(v8, "updateWithUIEvent:", v7);
      }
    }
    v10 = -[ATXBlendingBiomeStreamLoggerContextWrapper initWithEvent:loggerContext:]([ATXBlendingBiomeStreamLoggerContextWrapper alloc], "initWithEvent:loggerContext:", v5, v8);

  }
  else
  {
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      __69__ATXBlendingBiomeStreamLogger__loggerContextPublisherWithPublisher___block_invoke_cold_1(v9);

    v10 = (ATXBlendingBiomeStreamLoggerContextWrapper *)v4;
  }

  objc_autoreleasePoolPop(v6);
  return v10;
}

- (void)handleClientModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a4;
  objc_msgSend(a3, "clientModelId");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cacheUpdateContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "cacheAgeForPreviousClientModelCacheWithClientModelId:", v9);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && v9)
  {
    objc_msgSend(v8, "doubleValue");
    -[ATXBlendingBiomeStreamLogger _logCacheAgeMetricEventWithCacheAge:clientModelId:](self, "_logCacheAgeMetricEventWithCacheAge:clientModelId:", v9);
  }

}

- (void)handleBlendingModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4
{
  id v6;
  id v7;

  v7 = a4;
  v6 = a3;
  -[ATXBlendingBiomeStreamLogger logBlendingLayerRefreshMetricWithBlendingModelCacheUpdateEvent:loggerContext:](self, "logBlendingLayerRefreshMetricWithBlendingModelCacheUpdateEvent:loggerContext:", v6, v7);
  -[ATXBlendingBiomeStreamLogger logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:](self, "logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:", v6);
  -[ATXBlendingBiomeStreamLogger logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent:](self, "logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent:", v6);
  -[ATXBlendingBiomeStreamLogger logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent:](self, "logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent:", v6);

  -[ATXBlendingBiomeStreamLogger tryLogSingleSuggestionSessionMetricsWithLoggerContext:](self, "tryLogSingleSuggestionSessionMetricsWithLoggerContext:", v7);
}

- (void)handleUIEvent:(id)a3 loggerContext:(id)a4
{
  id v5;

  v5 = a4;
  -[ATXBlendingBiomeStreamLogger tryLogSingleSuggestionSessionMetricsWithLoggerContext:](self, "tryLogSingleSuggestionSessionMetricsWithLoggerContext:", v5);
  -[ATXBlendingBiomeStreamLogger logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:](self, "logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:", v5);
  -[ATXBlendingBiomeStreamLogger logScreenUnlockSessionsIfPossibleWithLoggerContext:](self, "logScreenUnlockSessionsIfPossibleWithLoggerContext:", v5);

}

- (void)tryLogSingleSuggestionSessionMetricsWithLoggerContext:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *heroLogger;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "sessionTrackingContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "completedSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
    goto LABEL_19;
  v22 = v4;
  objc_msgSend(v4, "sessionTrackingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeStoredCompletedSessionsAndReturnCompletedSessionsCopy");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D81198], "clientModelIdFromClientModelType:", 13);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v12)
    goto LABEL_16;
  v13 = v12;
  v14 = *(_QWORD *)v26;
  do
  {
    for (i = 0; i != v13; ++i)
    {
      if (*(_QWORD *)v26 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
      objc_msgSend(v16, "suggestion");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "clientModelSpecification");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "clientModelId");
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v19, "isEqualToString:", v10))
      {
        -[ATXBlendingBiomeStreamLogger logAnchorModelEngagementMetricsWithCompletedSession:](self, "logAnchorModelEngagementMetricsWithCompletedSession:", v16);
        goto LABEL_14;
      }
      if (objc_msgSend(v19, "isEqualToString:", v24))
      {
        heroLogger = self->_heroLogger;
      }
      else
      {
        if (!objc_msgSend(v19, "isEqualToString:", v23))
          goto LABEL_14;
        heroLogger = self->_appClipLogger;
      }
      objc_msgSend(heroLogger, "handleSingleSuggestion:", v16);
LABEL_14:

    }
    v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  }
  while (v13);
LABEL_16:

  __atxlog_handle_metrics();
  v21 = objc_claimAutoreleasedReturnValue();
  v4 = v22;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    -[ATXBlendingBiomeStreamLogger tryLogSingleSuggestionSessionMetricsWithLoggerContext:].cold.1(v22);

LABEL_19:
}

- (void)logScreenUnlockSessionsIfPossibleWithLoggerContext:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  objc_class *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unsigned int v31;
  objc_class *v32;
  void *v33;
  int v34;
  int v35;
  int v36;
  int v37;
  int v38;
  int v39;
  int v40;
  objc_class *v41;
  void *v42;
  int v43;
  int v44;
  int v45;
  int v46;
  int v47;
  int v48;
  __int128 v49;
  int v50;
  ATXBlendingBiomeStreamLogger *v51;
  uint64_t v52;
  id v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  void *v60;
  __int16 v61;
  int v62;
  __int16 v63;
  _BYTE v64[10];
  uint64_t v65;
  _BYTE v66[10];
  __int16 v67;
  uint64_t v68;
  __int16 v69;
  uint64_t v70;
  __int16 v71;
  uint64_t v72;
  __int16 v73;
  uint64_t v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "screenLogUnlockSessionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unlockSessionManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeCompletedSessions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v56;
    *(_QWORD *)&v9 = 138413826;
    v49 = v9;
    v51 = self;
    v52 = *(_QWORD *)v56;
    v53 = v7;
    do
    {
      v12 = 0;
      v54 = v10;
      do
      {
        if (*(_QWORD *)v56 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * v12);
        objc_msgSend(v13, "sessionEndDate", v49);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "sessionStartDate");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "timeIntervalSinceDate:", v15);
        v17 = v16;

        v18 = fmax(v17, 0.0);
        if (v18 >= 0x64)
          v18 = 100 * (v18 / 0x64);
        v19 = (void *)objc_opt_new();
        objc_msgSend(v19, "setSessionLengthInSeconds:", v18);
        objc_msgSend(v19, "setSpotlightEnabled:", objc_msgSend(v13, "spotlightEnabled"));
        objc_msgSend(v19, "setAppLibraryEnabled:", objc_msgSend(v13, "appLibraryEnabled"));
        objc_msgSend(v19, "setSuggestionsWidgetEnabled:", objc_msgSend(v13, "hasSuggestionsWidget"));
        objc_msgSend(v19, "setSuggestionsWidgetTodayPageEnabled:", objc_msgSend(v13, "hasSuggestionsWidgetInTodayPage"));
        objc_msgSend(v19, "setAppPredictionPanelEnabled:", objc_msgSend(v13, "hasAppPredictionPanel"));
        objc_msgSend(v19, "setAppPredictionPanelTodayPageEnabled:", objc_msgSend(v13, "hasAppPredictionPanelInTodayPage"));
        objc_msgSend(v19, "setNumEngagementsInSpotlightApps:", objc_msgSend(v13, "numEngagementsInSpotlightApps"));
        objc_msgSend(v19, "setNumEngagementsInSpotlightActions:", objc_msgSend(v13, "numEngagementsInSpotlightActions"));
        objc_msgSend(v19, "setNumEngagementsInSuggestionsWidget:", objc_msgSend(v13, "numEngagementsInSuggestionsWidget"));
        objc_msgSend(v19, "setNumEngagementsInSuggestionsWidgetTodayPage:", objc_msgSend(v13, "numEngagementsInSuggestionsWidgetTodayPage"));
        objc_msgSend(v19, "setNumEngagementsInAppPredictionPanel:", objc_msgSend(v13, "numEngagementsInAppPredictionPanel"));
        objc_msgSend(v19, "setNumEngagementsInAppPredictionPanelTodayPage:", objc_msgSend(v13, "numEngagementsInAppPredictionPanelTodayPage"));
        objc_msgSend(v19, "setNumEngagementsInAppLibrary:", objc_msgSend(v13, "numEngagementsInAppLibrary"));
        objc_msgSend(v19, "setSpotlightAppsViewed:", objc_msgSend(v13, "numViewsInSpotlightApps") != 0);
        objc_msgSend(v19, "setSpotlightActionsViewed:", objc_msgSend(v13, "numViewsInSpotlightActions") != 0);
        objc_msgSend(v19, "setSuggestionsWidgetViewed:", objc_msgSend(v13, "numViewsInSuggestionsWidget") != 0);
        objc_msgSend(v19, "setAppPredictionPanelViewed:", objc_msgSend(v13, "numViewsInAppPredictionPanel") != 0);
        objc_msgSend(v19, "setAppLibraryViewed:", objc_msgSend(v13, "numViewsInAppLibrary") != 0);
        objc_msgSend(v19, "setAppPredictionPanelTodayPageViewed:", objc_msgSend(v13, "numViewsInAppPredictionPanelTodayPage") != 0);
        objc_msgSend(v19, "setSuggestionsWidgetTodayPageViewed:", objc_msgSend(v13, "numViewsInSuggestionsWidgetTodayPage") != 0);
        -[ATXPETEventTracker2Protocol logMessage:](self->_tracker, "logMessage:", v19);
        __atxlog_handle_metrics();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v23 = (objc_class *)objc_opt_class();
          NSStringFromClass(v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = objc_msgSend(v19, "sessionLengthInSeconds");
          v25 = objc_msgSend(v19, "numEngagementsInSpotlightApps");
          v26 = objc_msgSend(v19, "numEngagementsInSpotlightActions");
          v27 = objc_msgSend(v19, "numEngagementsInSuggestionsWidget");
          v28 = objc_msgSend(v19, "numEngagementsInSuggestionsWidgetTodayPage");
          v29 = objc_msgSend(v19, "numEngagementsInAppPredictionPanel");
          v30 = objc_msgSend(v19, "numEngagementsInAppPredictionPanelTodayPage");
          v31 = objc_msgSend(v19, "numEngagementsInAppLibrary");
          *(_DWORD *)buf = 138414338;
          v60 = v24;
          v61 = 1024;
          v62 = v50;
          v63 = 2048;
          *(_QWORD *)v64 = v25;
          *(_WORD *)&v64[8] = 2048;
          v65 = v26;
          v11 = v52;
          v7 = v53;
          *(_WORD *)v66 = 2048;
          *(_QWORD *)&v66[2] = v27;
          v67 = 2048;
          v68 = v28;
          v69 = 2048;
          v70 = v29;
          self = v51;
          v71 = 2048;
          v72 = v30;
          v10 = v54;
          v73 = 2048;
          v74 = v31;
          _os_log_debug_impl(&dword_1C9A3B000, v20, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBScreenLogUnlockSessionTracker with sessionLengthInSeconds: %u, spotlightAppEngagements: %lu, spotlightActionEngagements: %lu, suggestionsWidgetEngagements: %lu, suggestionsWidgetTodayPageEngagements: %lu appPredictionPanelEngagements: %lu, appPredictionPanelTodayPageEngagements: %lu, appLibraryEngagements: %lu", buf, 0x58u);

        }
        __atxlog_handle_metrics();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v19, "spotlightAppsViewed");
          v35 = objc_msgSend(v19, "spotlightActionsViewed");
          v36 = objc_msgSend(v19, "suggestionsWidgetViewed");
          v37 = objc_msgSend(v19, "suggestionsWidgetTodayPageViewed");
          v38 = objc_msgSend(v19, "appPredictionPanelViewed");
          v39 = objc_msgSend(v19, "appPredictionPanelTodayPageViewed");
          v40 = objc_msgSend(v19, "appLibraryViewed");
          *(_DWORD *)buf = 138414082;
          v60 = v33;
          v61 = 1024;
          v62 = v34;
          v63 = 1024;
          *(_DWORD *)v64 = v35;
          *(_WORD *)&v64[4] = 1024;
          *(_DWORD *)&v64[6] = v36;
          LOWORD(v65) = 1024;
          *(_DWORD *)((char *)&v65 + 2) = v37;
          HIWORD(v65) = 1024;
          *(_DWORD *)v66 = v38;
          self = v51;
          v11 = v52;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v39;
          v7 = v53;
          v10 = v54;
          v67 = 1024;
          LODWORD(v68) = v40;
          _os_log_debug_impl(&dword_1C9A3B000, v21, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBScreenLogUnlockSessionTracker (continued) with spotlightAppsViewed: %u, spotlightActionsViewed: %u, suggestionsWidgetViewed: %u, suggestionsWidgetTodayPageViewed: %u appPredictionPanelViewed: %u, appPredictionPanelTodayPageViewed: %u, appLibraryViewed: %u", buf, 0x36u);

        }
        __atxlog_handle_metrics();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          v41 = (objc_class *)objc_opt_class();
          NSStringFromClass(v41);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v19, "spotlightEnabled");
          v44 = objc_msgSend(v19, "appLibraryEnabled");
          v45 = objc_msgSend(v19, "suggestionsWidgetEnabled");
          v46 = objc_msgSend(v19, "suggestionsWidgetTodayPageEnabled");
          v47 = objc_msgSend(v19, "appPredictionPanelEnabled");
          v48 = objc_msgSend(v19, "appPredictionPanelTodayPageEnabled");
          *(_DWORD *)buf = v49;
          v60 = v42;
          v61 = 1024;
          v62 = v43;
          v63 = 1024;
          *(_DWORD *)v64 = v44;
          v11 = v52;
          v7 = v53;
          *(_WORD *)&v64[4] = 1024;
          *(_DWORD *)&v64[6] = v45;
          LOWORD(v65) = 1024;
          *(_DWORD *)((char *)&v65 + 2) = v46;
          v10 = v54;
          HIWORD(v65) = 1024;
          *(_DWORD *)v66 = v47;
          *(_WORD *)&v66[4] = 1024;
          *(_DWORD *)&v66[6] = v48;
          _os_log_debug_impl(&dword_1C9A3B000, v22, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBScreenLogUnlockSessionTracker (continued) with spotlightEnabled: %d, appLibraryEnabled: %d, hasSuggestionsWidgetEnabled: %d, hasSuggestionsWidgetTodayPageEnabled: %d, hasAppPredictionPanelEnabled: %d, hasAppPredictionPanelTodayPageEnabled: %d", buf, 0x30u);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
    }
    while (v10);
  }

}

- (void)logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
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
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  objc_class *v38;
  uint64_t v39;
  __CFString *v40;
  uint64_t v41;
  __CFString *v42;
  uint64_t v43;
  const __CFString *v44;
  uint64_t v45;
  NSObject *v46;
  __CFString *v47;
  void *v48;
  void *v49;
  __CFString *v50;
  void *v51;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  id v56;
  id obj;
  uint64_t v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  uint8_t buf[4];
  id v65;
  __int16 v66;
  void *v67;
  __int16 v68;
  __CFString *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  __int16 v76;
  __CFString *v77;
  __int16 v78;
  void *v79;
  __int16 v80;
  void *v81;
  __int16 v82;
  const __CFString *v83;
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "stackSuggestTrackingContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllAndReturnCompletedSystemSuggestSessions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v62 = 0u;
  v63 = 0u;
  v60 = 0u;
  v61 = 0u;
  obj = v5;
  v59 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
  if (v59)
  {
    v58 = *(_QWORD *)v61;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v61 != v58)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v60 + 1) + 8 * v6);
        __atxlog_handle_metrics();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
        {
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v65 = v37;
          v66 = 2112;
          v67 = v7;
          _os_log_debug_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEBUG, "%@ - handling completed session: %@", buf, 0x16u);

        }
        objc_msgSend(v7, "systemSuggestSuggestionLayout");
        v9 = objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          __atxlog_handle_metrics();
          v10 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
            -[ATXBlendingBiomeStreamLogger logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:].cold.1();
          goto LABEL_41;
        }
        v10 = v9;
        -[NSObject allSuggestionsInLayout](v9, "allSuggestionsInLayout");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "firstObject");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v12)
        {
          __atxlog_handle_metrics();
          v46 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
            -[ATXBlendingBiomeStreamLogger logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:].cold.2();

LABEL_41:
          goto LABEL_42;
        }
        if (objc_msgSend(v7, "isNPlusOneRotation"))
          v13 = 1;
        else
          v13 = 2;
        v14 = objc_msgSend(v7, "engagementStatus");
        if (v14 > 7)
          v15 = 0;
        else
          v15 = dword_1C9E80570[v14];
        v16 = objc_msgSend(v7, "stackLocation");
        if (v16 - 1 >= 5)
          v17 = 0;
        else
          v17 = v16;
        v18 = (void *)objc_opt_new();
        objc_msgSend(MEMORY[0x1E0D81220], "stringFromUILayoutType:", -[NSObject layoutType](v10, "layoutType"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLayoutType:", v19);

        objc_msgSend(v18, "setEngagementType:", v15);
        objc_msgSend(v12, "clientModelSpecification");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "clientModelId");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setClientModelId:", v21);

        v22 = objc_alloc(MEMORY[0x1E0CB3940]);
        objc_msgSend(v7, "widgetBundleId");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "widgetKind");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = (void *)objc_msgSend(v22, "initWithFormat:", CFSTR("%@-%@"), v23, v24);
        objc_msgSend(v18, "setWidgetIdentifier:", v25);

        objc_msgSend(v18, "setSelectionType:", v13);
        v26 = (void *)MEMORY[0x1E0D811C0];
        objc_msgSend(v12, "scoreSpecification");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "stringForSuggestedConfidenceCategory:", objc_msgSend(v27, "suggestedConfidenceCategory"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setHighestConfidenceCategory:", v28);

        v29 = (void *)MEMORY[0x1E0D811A8];
        objc_msgSend(v12, "executableSpecification");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "stringForExecutableType:", objc_msgSend(v30, "executableType"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setExecutableType:", v31);

        objc_msgSend(v18, "setStackLocation:", v17);
        -[ATXBlendingBiomeStreamLogger abGroup](self, "abGroup");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setAbGroup:", v32);

        objc_msgSend(v12, "clientModelSpecification");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "clientModelVersion");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setClientModelABGroup:", v34);

        -[ATXPETEventTracker2Protocol trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v18);
        __atxlog_handle_metrics();
        v35 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          v38 = (objc_class *)objc_opt_class();
          NSStringFromClass(v38);
          v56 = (id)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "clientModelId");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v18, "engagementType");
          if ((v39 - 1) >= 8)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v39);
            v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v40 = off_1E82E61B0[(int)v39 - 1];
          }
          v54 = v40;
          objc_msgSend(v18, "widgetIdentifier");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "highestConfidenceCategory");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "executableType");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          v41 = objc_msgSend(v18, "stackLocation");
          if (v41 >= 6)
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v41);
            v42 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v42 = off_1E82E61F0[(int)v41];
          }
          v50 = v42;
          objc_msgSend(v18, "abGroup");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "clientModelABGroup");
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = objc_msgSend(v18, "selectionType");
          if ((_DWORD)v43 == 1)
          {
            v44 = CFSTR("NPlusOne");
          }
          else if ((_DWORD)v43 == 2)
          {
            v44 = CFSTR("StackRotation");
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v43);
            v44 = (const __CFString *)objc_claimAutoreleasedReturnValue();
          }
          v47 = (__CFString *)v44;
          *(_DWORD *)buf = 138414594;
          v65 = v56;
          v66 = 2112;
          v67 = v55;
          v68 = 2112;
          v69 = v54;
          v70 = 2112;
          v71 = v53;
          v72 = 2112;
          v73 = v52;
          v74 = 2112;
          v75 = v51;
          v76 = 2112;
          v77 = v50;
          v78 = 2112;
          v79 = v49;
          v80 = 2112;
          v81 = v48;
          v82 = 2112;
          v83 = v44;
          _os_log_debug_impl(&dword_1C9A3B000, v35, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingWidgetRotationEngagementTracker with clientModelId: %@ and engagementType: %@ widgetIdentifier: %@ highestConfidenceCategory: %@ executableType: %@ stackLocation: %@ abGroup: %@ clientModelABGroup: %@ selectionType: %@", buf, 0x66u);

        }
        ++v6;
      }
      while (v59 != v6);
      v45 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
      v59 = v45;
    }
    while (v45);
  }
LABEL_42:

}

- (id)_anchorModelEngagementMetricFromAnchorPrediction:(id)a3 proactiveSuggestion:(id)a4 feedbackMetadata:(id)a5 engagementType:(int)a6 consumerSubType:(id)a7 completedSession:(id)a8
{
  uint64_t v9;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;

  v9 = *(_QWORD *)&a6;
  v13 = a8;
  v14 = a7;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_opt_new();
  objc_msgSend(v17, "anchorType");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAnchorType:", v19);

  objc_msgSend(v17, "score");
  objc_msgSend(v18, "setScore:");
  objc_msgSend(v18, "setNumUniqueOccurrencesAfterAnchor:", objc_msgSend(v17, "numUniqueOccurrencesAfterAnchor"));
  objc_msgSend(v17, "posteriorProbability");
  objc_msgSend(v18, "setPosteriorProbability:");
  objc_msgSend(v17, "classConditionalProbability");
  objc_msgSend(v18, "setClassConditionalProbability:");
  objc_msgSend(v17, "standardDeviationOfOffsetFromAnchor");
  objc_msgSend(v18, "setStandardDeviationOfOffsetFromAnchor:");
  objc_msgSend(v17, "anchorPopularity");
  objc_msgSend(v18, "setAnchorPopularity:");
  objc_msgSend(v17, "globalPopularity");
  objc_msgSend(v18, "setGlobalPopularity:");
  objc_msgSend(v17, "candidateType");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setCandidateType:", v20);

  objc_msgSend(v17, "offsetFromAnchorToShowPrediction");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v21, "startSecondsAfterAnchor");
  objc_msgSend(v18, "setSecondsAfterAnchor:", v22);

  v23 = objc_msgSend(v15, "numberOfAnchorModelPredictions");
  objc_msgSend(v18, "setNumPredictionsforAnchor:", v23);
  objc_msgSend(v18, "setEngagementType:", v9);
  objc_msgSend(v18, "setConsumerSubType:", v14);

  objc_msgSend(v13, "suggestion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v24, "clientModelSpecification");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "clientModelVersion");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAbGroup:", v26);

  objc_msgSend(v16, "genericStringForSuggestionExecutableObject");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setExecutableObject:", v27);
  return v18;
}

- (void)_logUnaggregatedAnchorModelEngagementMetric:(id)a3
{
  id v4;
  NSObject *v5;

  v4 = a3;
  -[ATXPETEventTracker2Protocol logMessage:](self->_tracker, "logMessage:", v4);
  __atxlog_handle_metrics();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ATXBlendingBiomeStreamLogger _logUnaggregatedAnchorModelEngagementMetric:].cold.1((uint64_t)self, v4, v5);

}

- (void)logAnchorModelEngagementMetricsWithCompletedSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  ATXAnchorModelDataStoreWrapperProtocol *dataStoreWrapper;
  uint64_t v29;
  _QWORD v30[5];
  id v31;
  id v32;
  id v33;
  uint64_t *v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  id v44[2];

  v4 = a3;
  objc_msgSend(v4, "feedbackMetadata");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = (void *)MEMORY[0x1CAA48B6C]();
    v7 = (void *)MEMORY[0x1E0CB3710];
    v8 = objc_opt_class();
    objc_msgSend(v4, "feedbackMetadata");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = 0;
    objc_msgSend(v7, "unarchivedObjectOfClass:fromData:error:", v8, v9, v44);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v44[0];

    objc_autoreleasePoolPop(v6);
    if (v10 && !v11)
    {
      objc_msgSend(v4, "suggestion");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "anchorModelPredictionForProactiveSuggestion:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
      {
        v40 = 0;
        v41 = &v40;
        v42 = 0x2020000000;
        v43 = 0;
        v36 = 0;
        v37 = &v36;
        v38 = 0x2020000000;
        v39 = 2;
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __84__ATXBlendingBiomeStreamLogger_logAnchorModelEngagementMetricsWithCompletedSession___block_invoke;
        v30[3] = &unk_1E82E6168;
        v30[4] = self;
        v14 = v13;
        v31 = v14;
        v15 = v4;
        v32 = v15;
        v16 = v10;
        v33 = v16;
        v34 = &v40;
        v35 = &v36;
        objc_msgSend(v15, "enumerateShownAndEngagedSessionStatusesAndConsumerSubTypesWithBlock:", v30);
        v17 = *((int *)v37 + 6);
        v26 = v15;
        v27 = v13;
        v25 = v16;
        if (v17 >= 3)
          v29 = 0;
        else
          v29 = qword_1C9E80590[v17];
        dataStoreWrapper = self->_dataStoreWrapper;
        v18 = (void *)objc_opt_new();
        objc_msgSend(v14, "anchorType");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "anchorEvent");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "identifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "candidateId");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[ATXAnchorModelDataStoreWrapperProtocol insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:](dataStoreWrapper, "insertAnchorSuggestionOutcome:date:anchorType:anchorEventIdentifier:candidateId:", v29, v18, v19, v21, v22);

        v13 = v27;
        if (*((_BYTE *)v41 + 24))
        {
          objc_msgSend(v26, "suggestion");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          -[ATXBlendingBiomeStreamLogger _anchorModelEngagementMetricFromAnchorPrediction:proactiveSuggestion:feedbackMetadata:engagementType:consumerSubType:completedSession:](self, "_anchorModelEngagementMetricFromAnchorPrediction:proactiveSuggestion:feedbackMetadata:engagementType:consumerSubType:completedSession:", v14, v23, v25, *((unsigned int *)v37 + 6), CFSTR("SingleSuggestionAnyConsumerSubType"), v26);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          -[ATXBlendingBiomeStreamLogger _logUnaggregatedAnchorModelEngagementMetric:](self, "_logUnaggregatedAnchorModelEngagementMetric:", v24);
        }

        _Block_object_dispose(&v36, 8);
        _Block_object_dispose(&v40, 8);
      }

    }
  }

}

void __84__ATXBlendingBiomeStreamLogger_logAnchorModelEngagementMetricsWithCompletedSession___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  id v13;

  if (a3 == 3)
    v5 = 1;
  else
    v5 = 2;
  if (a3 == 2)
    v6 = 0;
  else
    v6 = v5;
  v7 = *(void **)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "suggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(a1 + 56);
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_anchorModelEngagementMetricFromAnchorPrediction:proactiveSuggestion:feedbackMetadata:engagementType:consumerSubType:completedSession:", v8, v9, v10, v6, v11, *(_QWORD *)(a1 + 48));
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "_logUnaggregatedAnchorModelEngagementMetric:", v13);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  if ((int)v6 < *(_DWORD *)(v12 + 24))
    *(_DWORD *)(v12 + 24) = v6;

}

- (void)logBlendingLayerRefreshMetricWithBlendingModelCacheUpdateEvent:(id)a3 loggerContext:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  NSObject *v17;
  objc_class *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  double v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CF9508];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringForConsumerSubtype:", objc_msgSend(v8, "consumerSubType"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cacheUpdateContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v8, "consumerSubType");
  objc_msgSend(v10, "cacheAgeForPreviousBlendingUICacheUpdateForConsumerSubType:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "doubleValue");
  if (v12)
  {
    v14 = v13;
    if (v13 >= 0.0)
    {
      v15 = (void *)objc_opt_new();
      objc_msgSend(v15, "setConsumerSubType:", v9);
      -[ATXBlendingBiomeStreamLogger abGroup](self, "abGroup");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAbGroup:", v16);

      -[ATXPETEventTracker2Protocol trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v15, v14);
      __atxlog_handle_metrics();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
      {
        v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "abGroup");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v21 = 138413058;
        v22 = v19;
        v23 = 2112;
        v24 = v9;
        v25 = 2048;
        v26 = v14;
        v27 = 2112;
        v28 = v20;
        _os_log_debug_impl(&dword_1C9A3B000, v17, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingLayerRefreshTracker with consumerSubType: %@ interarrivalTime: %f abGroup: %@", (uint8_t *)&v21, 0x2Au);

      }
    }
  }

}

- (void)logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  char v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  _QWORD v15[5];
  _QWORD v16[5];

  v4 = a3;
  objc_msgSend(v4, "uiCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v4, "uiCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    objc_msgSend(v4, "uiCache");
    v8 = objc_claimAutoreleasedReturnValue();
    if ((isKindOfClass & 1) != 0)
    {
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSuggestionLayout:consumerSubType:](self, "_logLayoutSelectedWithSuggestionLayout:consumerSubType:", v8, objc_msgSend(v4, "consumerSubType"));
    }
    else
    {
      objc_opt_class();
      v9 = objc_opt_isKindOfClass();

      objc_msgSend(v4, "uiCache");
      v10 = objc_claimAutoreleasedReturnValue();
      v8 = v10;
      if ((v9 & 1) != 0)
      {
        -[NSObject cachedSuggestionWidgetLayouts](v10, "cachedSuggestionWidgetLayouts");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = MEMORY[0x1E0C809B0];
        v16[0] = MEMORY[0x1E0C809B0];
        v16[1] = 3221225472;
        v16[2] = __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke;
        v16[3] = &unk_1E82E6190;
        v16[4] = self;
        objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v16);

        -[NSObject cachedAppPredictionPanelLayouts](v8, "cachedAppPredictionPanelLayouts");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v15[0] = v12;
        v15[1] = 3221225472;
        v15[2] = __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke_2;
        v15[3] = &unk_1E82E6190;
        v15[4] = self;
        objc_msgSend(v13, "enumerateKeysAndObjectsUsingBlock:", v15);

      }
      else
      {
        objc_opt_class();
        v14 = objc_opt_isKindOfClass();

        if ((v14 & 1) != 0)
        {
          objc_msgSend(v4, "uiCache");
          v8 = objc_claimAutoreleasedReturnValue();
          -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:](self, "_logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:", v8, objc_msgSend(v4, "consumerSubType"));
        }
        else
        {
          __atxlog_handle_metrics();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
            -[ATXBlendingBiomeStreamLogger logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:].cold.1((uint64_t)self, v4, v8);
        }
      }
    }

  }
}

uint64_t __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logLayoutSelectedWithSuggestionLayout:consumerSubType:", a3, 36);
}

uint64_t __89__ATXBlendingBiomeStreamLogger_logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logLayoutSelectedWithSuggestionLayout:consumerSubType:", a3, 37);
}

- (void)_logLayoutSelectedWithSpotlightSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  void *v6;
  NSObject *v7;
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
  NSObject *v21;

  v4 = a4;
  objc_msgSend(a3, "highestConfidenceSuggestion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D81220], "stringFromUILayoutType:", 11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLayoutType:](v7, "setLayoutType:", v8);

    v9 = (void *)MEMORY[0x1E0D811C0];
    objc_msgSend(v6, "scoreSpecification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringForSuggestedConfidenceCategory:", objc_msgSend(v10, "suggestedConfidenceCategory"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHighestConfidenceCategory:](v7, "setHighestConfidenceCategory:", v11);

    objc_msgSend(v6, "clientModelSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "clientModelId");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHighestRankingClientModelId:](v7, "setHighestRankingClientModelId:", v13);

    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setConsumerSubType:](v7, "setConsumerSubType:", v14);

    v15 = (void *)MEMORY[0x1E0D811A8];
    objc_msgSend(v6, "executableSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringForExecutableType:", objc_msgSend(v16, "executableType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExecuableTypeOfHighestRankingSuggestion:](v7, "setExecuableTypeOfHighestRankingSuggestion:", v17);

    -[ATXBlendingBiomeStreamLogger abGroup](self, "abGroup");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAbGroup:](v7, "setAbGroup:", v18);

    objc_msgSend(v6, "clientModelSpecification");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "clientModelVersion");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHighestRankingClientModelABGroup:](v7, "setHighestRankingClientModelABGroup:", v20);

    -[ATXPETEventTracker2Protocol trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v7);
    __atxlog_handle_metrics();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:].cold.2((uint64_t)self, v7);

  }
  else
  {
    __atxlog_handle_metrics();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:].cold.1();
  }

}

- (void)_logLayoutSelectedWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  uint64_t v4;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
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
  NSObject *v23;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "uuidOfHighestConfidenceSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestionWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D81220], "stringFromUILayoutType:", objc_msgSend(v6, "layoutType"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLayoutType:](v9, "setLayoutType:", v10);

    v11 = (void *)MEMORY[0x1E0D811C0];
    objc_msgSend(v8, "scoreSpecification");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringForSuggestedConfidenceCategory:", objc_msgSend(v12, "suggestedConfidenceCategory"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHighestConfidenceCategory:](v9, "setHighestConfidenceCategory:", v13);

    objc_msgSend(v8, "clientModelSpecification");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "clientModelId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHighestRankingClientModelId:](v9, "setHighestRankingClientModelId:", v15);

    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setConsumerSubType:](v9, "setConsumerSubType:", v16);

    v17 = (void *)MEMORY[0x1E0D811A8];
    objc_msgSend(v8, "executableSpecification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "stringForExecutableType:", objc_msgSend(v18, "executableType"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setExecuableTypeOfHighestRankingSuggestion:](v9, "setExecuableTypeOfHighestRankingSuggestion:", v19);

    -[ATXBlendingBiomeStreamLogger abGroup](self, "abGroup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAbGroup:](v9, "setAbGroup:", v20);

    objc_msgSend(v8, "clientModelSpecification");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clientModelVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setHighestRankingClientModelABGroup:](v9, "setHighestRankingClientModelABGroup:", v22);

    -[ATXPETEventTracker2Protocol trackScalarForMessage:](self->_tracker, "trackScalarForMessage:", v9);
    __atxlog_handle_metrics();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:].cold.2((uint64_t)self, v9);

  }
  else
  {
    __atxlog_handle_metrics();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:].cold.1();
  }

}

- (void)logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v10 = a3;
  objc_msgSend(v10, "uiCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v10, "uiCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedSuggestionWidgetLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x1E0C809B0];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke;
    v12[3] = &unk_1E82E6190;
    v12[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v12);

    objc_msgSend(v6, "cachedAppPredictionPanelLayouts");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke_2;
    v11[3] = &unk_1E82E6190;
    v11[4] = self;
    objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v11);

  }
}

uint64_t __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:consumerSubType:", a3, 36);
}

uint64_t __114__ATXBlendingBiomeStreamLogger_logClientModelsIncludedInHomeScreenLayoutsMetricWithBlendingModelCacheUpdateEvent___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:consumerSubType:", a3, 37);
}

- (void)_logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:(id)a3 consumerSubType:(unsigned __int8)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  unsigned int v27;
  ATXBlendingBiomeStreamLogger *v28;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v4 = a4;
  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(v6, "uuidOfHighestConfidenceSuggestion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "suggestionWithUUID:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "clientModelSpecification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "clientModelId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v28 = self;
    v29 = v8;
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    objc_msgSend(v6, "minSuggestionListInLayout");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    v27 = v4;
    if (v12)
    {
      v13 = v12;
      LODWORD(v14) = 0;
      v15 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v31 != v15)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "clientModelSpecification");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "clientModelId");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v18, "isEqualToString:", v10);

          v14 = (v14 + v19);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
      }
      while (v13);
    }
    else
    {
      v14 = 0;
    }

    v20 = objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D81220], "stringFromUILayoutType:", objc_msgSend(v6, "layoutType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setLayoutType:](v20, "setLayoutType:", v21);

    -[NSObject setClientModelId:](v20, "setClientModelId:", v10);
    -[NSObject setNumSuggestionsForClientModelInLayout:](v20, "setNumSuggestionsForClientModelInLayout:", v14);
    objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", v27);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setConsumerSubType:](v20, "setConsumerSubType:", v22);

    -[ATXBlendingBiomeStreamLogger abGroup](v28, "abGroup");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setAbGroup:](v20, "setAbGroup:", v23);

    v8 = v29;
    objc_msgSend(v29, "clientModelSpecification");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "clientModelVersion");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setClientModelABGroup:](v20, "setClientModelABGroup:", v25);

    -[ATXPETEventTracker2Protocol trackScalarForMessage:](v28->_tracker, "trackScalarForMessage:", v20);
    __atxlog_handle_metrics();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      -[ATXBlendingBiomeStreamLogger _logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:consumerSubType:].cold.2((uint64_t)v28, v20, v26);

  }
  else
  {
    __atxlog_handle_metrics();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      -[ATXBlendingBiomeStreamLogger _logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:].cold.1();
  }

}

- (void)logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent:(id)a3
{
  void *v4;
  char isKindOfClass;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  v8 = a3;
  objc_msgSend(v8, "uiCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v8, "uiCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cachedTopOfStackLayouts");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke;
    v9[3] = &unk_1E82E6190;
    v9[4] = self;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

void __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;

  v4 = a3;
  objc_msgSend(v4, "uuidOfHighestConfidenceSuggestion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "suggestionWithUUID:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0D81220], "stringFromUILayoutType:", objc_msgSend(v4, "layoutType"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLayoutType:", v8);

    if (objc_msgSend(v4, "isNPlusOne"))
      v9 = 1;
    else
      v9 = 2;
    objc_msgSend(v7, "setSelectionType:", v9);
    objc_msgSend(v6, "clientModelSpecification");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "clientModelId");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClientModelIdOfHighestRankingSuggestion:", v11);

    v12 = (void *)MEMORY[0x1E0D811C0];
    objc_msgSend(v6, "scoreSpecification");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringForSuggestedConfidenceCategory:", objc_msgSend(v13, "suggestedConfidenceCategory"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHighestConfidenceCategory:", v14);

    v15 = (void *)MEMORY[0x1E0D811A8];
    objc_msgSend(v6, "executableSpecification");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringForExecutableType:", objc_msgSend(v16, "executableType"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExecuableTypeOfHighestRankingSuggestion:", v17);

    v19 = *(void **)(a1 + 32);
    v18 = (id *)(a1 + 32);
    objc_msgSend(v19, "abGroup");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAbGroup:", v20);

    objc_msgSend(v6, "clientModelSpecification");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "clientModelVersion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setClientModelABGroup:", v22);

    objc_msgSend(v7, "setWidgetsInStack:", objc_msgSend(*v18, "_ensureWidgetsInStackBetweenZeroAndTen:", objc_msgSend(v4, "numWidgetsInStack")));
    objc_msgSend(*((id *)*v18 + 7), "trackScalarForMessage:", v7);
    __atxlog_handle_metrics();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke_cold_1((uint64_t)v18, v7, v23);

  }
}

- (unsigned)_ensureWidgetsInStackBetweenZeroAndTen:(unint64_t)a3
{
  if (a3 >= 0xA)
    return 10;
  else
    return a3;
}

- (void)_logCacheAgeMetricEventWithCacheAge:(double)a3 clientModelId:(id)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  double v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void *)objc_opt_new();
  objc_msgSend(v7, "setCacheName:", v6);

  -[ATXPETEventTracker2Protocol trackDistributionForMessage:value:](self->_tracker, "trackDistributionForMessage:value:", v7, a3);
  __atxlog_handle_metrics();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = (objc_class *)objc_opt_class();
    NSStringFromClass(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cacheName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412802;
    v13 = v10;
    v14 = 2112;
    v15 = v11;
    v16 = 2048;
    v17 = a3;
    _os_log_debug_impl(&dword_1C9A3B000, v8, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMCacheAgeAtCacheRefreshTracker with cacheName: %@ and cacheAge: %f", (uint8_t *)&v12, 0x20u);

  }
}

- (ATXBMBookmark)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
  objc_storeStrong((id *)&self->_bookmark, a3);
}

- (BPSPublisher)clientModelPublisher
{
  return self->_clientModelPublisher;
}

- (void)setClientModelPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_clientModelPublisher, a3);
}

- (BPSPublisher)blendingModelPublisher
{
  return self->_blendingModelPublisher;
}

- (void)setBlendingModelPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_blendingModelPublisher, a3);
}

- (BPSPublisher)uiPublisher
{
  return self->_uiPublisher;
}

- (void)setUiPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_uiPublisher, a3);
}

- (ATXPETEventTracker2Protocol)tracker
{
  return self->_tracker;
}

- (void)setTracker:(id)a3
{
  objc_storeStrong((id *)&self->_tracker, a3);
}

- (ATXHeroAppSingleSuggestionLogger)heroLogger
{
  return self->_heroLogger;
}

- (void)setHeroLogger:(id)a3
{
  objc_storeStrong((id *)&self->_heroLogger, a3);
}

- (ATXAppClipSingleSuggestionLogger)appClipLogger
{
  return self->_appClipLogger;
}

- (void)setAppClipLogger:(id)a3
{
  objc_storeStrong((id *)&self->_appClipLogger, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appClipLogger, 0);
  objc_storeStrong((id *)&self->_heroLogger, 0);
  objc_storeStrong((id *)&self->_tracker, 0);
  objc_storeStrong((id *)&self->_uiPublisher, 0);
  objc_storeStrong((id *)&self->_blendingModelPublisher, 0);
  objc_storeStrong((id *)&self->_clientModelPublisher, 0);
  objc_storeStrong((id *)&self->_bookmark, 0);
  objc_storeStrong((id *)&self->_currentABGroup, 0);
  objc_storeStrong((id *)&self->_dataStoreWrapper, 0);
}

void __69__ATXBlendingBiomeStreamLogger__loggerContextPublisherWithPublisher___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_ERROR, "event from biome stream can't be deserialized", v1, 2u);
}

- (void)tryLogSingleSuggestionSessionMetricsWithLoggerContext:(void *)a1 .cold.1(void *a1)
{
  void *v2;
  objc_class *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a1, "sessionTrackingContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "sessionTrackingContext");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v5, v6, "%@ - finished logging sessions, state is: %@", v7, v8, v9, v10, 2u);

  OUTLINED_FUNCTION_1_1();
}

- (void)logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - did not find suggestion layout: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)logWidgetRotationEngagementMetricsIfPossibleWithLoggerContext:.cold.2()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2_0(&dword_1C9A3B000, v2, v3, "%@ - did not find suggestion inside suggestion layout: %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_1_1();
}

- (void)_logUnaggregatedAnchorModelEngagementMetric:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint8_t buf[32];
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a2, "engagementType");
  if (v8 > 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = off_1E82E6220[(int)v8];
  }
  objc_msgSend(a2, "anchorType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "score");
  v12 = v11;
  objc_msgSend(a2, "candidateType");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(a2, "secondsAfterAnchor");
  v15 = objc_msgSend(a2, "numPredictionsforAnchor");
  objc_msgSend(a2, "abGroup");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "executableObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_5();
  v21 = v18;
  v22 = v10;
  v23 = 2048;
  v24 = v12;
  v25 = v18;
  v26 = v13;
  v27 = 1024;
  v28 = v14;
  v29 = 1024;
  v30 = v15;
  v31 = v18;
  v32 = v16;
  v33 = v18;
  v34 = v19;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBAnchorModelEngagementTracker with consumerSubType: %@ engagementType: %@ anchorType: %@ score: %f candidateType: %@ secondsAfterAnchor: %u numPredictionsforAnchor: %u abGroup: %@ executableObject: %@", buf, 0x5Eu);

}

- (void)logLayoutSelectedMetricWithBlendingModelCacheUpdateEvent:(NSObject *)a3 .cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "uiCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CF9508], "stringForConsumerSubtype:", objc_msgSend(a2, "consumerSubType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138412802;
  v12 = v6;
  v13 = 2112;
  v14 = v9;
  v15 = 2112;
  v16 = v10;
  _os_log_fault_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_FAULT, "%@ - got blending cache update with unsupported class: %@ for consumerSubType: %@", (uint8_t *)&v11, 0x20u);

}

- (void)_logLayoutSelectedWithSpotlightSuggestionLayout:consumerSubType:.cold.1()
{
  objc_class *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = (objc_class *)OUTLINED_FUNCTION_3_0();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_2(&dword_1C9A3B000, v2, v3, "%@ - could not determine highest confidence suggestion from suggestion layout", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)_logLayoutSelectedWithSpotlightSuggestionLayout:(uint64_t)a1 consumerSubType:(void *)a2 .cold.2(uint64_t a1, void *a2)
{
  objc_class *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint8_t v18;

  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "layoutType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "consumerSubType");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "highestConfidenceCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "highestRankingClientModelId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "execuableTypeOfHighestRankingSuggestion");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "abGroup");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "highestRankingClientModelABGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_13();
  OUTLINED_FUNCTION_8_2(&dword_1C9A3B000, v12, v13, "LOGGED: %@ - ATXMPBBlendingLayoutSelectionTracker with layoutType: %@ consumerSubType: %@ highestConfidenceCategory: %@ highestRankingClientModelId: %@ execuableTypeOfHighestRankingSuggestion: %@ abGroup: %@ highestRankingClientModelABGroup: %@", v14, v15, v16, v17, v18);

  OUTLINED_FUNCTION_3_12();
}

- (void)_logClientModelsIncludedInHomeScreenLayoutWithSuggestionLayout:(NSObject *)a3 consumerSubType:.cold.2(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "layoutType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientModelId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(a2, "numSuggestionsForClientModelInLayout");
  objc_msgSend(a2, "consumerSubType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "abGroup");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientModelABGroup");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 138413826;
  v14 = v6;
  v15 = 2112;
  v16 = v7;
  v17 = 2112;
  v18 = v8;
  v19 = 1024;
  v20 = v9;
  v21 = 2112;
  v22 = v10;
  v23 = 2112;
  v24 = v11;
  v25 = 2112;
  v26 = v12;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingClientModelHomeScreenLayoutTracker with layoutType: %@ clientModelId: %@ numSuggestionsForClientModelInLayout: %u consumerSubType: %@ abGroup: %@ clientModelABGroup: %@", (uint8_t *)&v13, 0x44u);

}

void __95__ATXBlendingBiomeStreamLogger_logTopOfStackPredictionMetricWithBlendingModelCacheUpdateEvent___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  objc_class *v5;
  id v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint8_t buf[32];
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "layoutType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(a2, "selectionType");
  if ((_DWORD)v8 == 1)
  {
    v9 = CFSTR("NPlusOne");
  }
  else if ((_DWORD)v8 == 2)
  {
    v9 = CFSTR("StackRotation");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(unknown: %i)"), v8);
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v10 = objc_msgSend(a2, "widgetsInStack");
  objc_msgSend(a2, "clientModelIdOfHighestRankingSuggestion");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "highestConfidenceCategory");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "execuableTypeOfHighestRankingSuggestion");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "abGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "clientModelABGroup");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_5_5();
  v19 = 1024;
  v20 = v10;
  v21 = v16;
  v22 = v11;
  v23 = v16;
  v24 = v12;
  v25 = v16;
  v26 = v13;
  v27 = v16;
  v28 = v14;
  v29 = v16;
  v30 = v17;
  _os_log_debug_impl(&dword_1C9A3B000, a3, OS_LOG_TYPE_DEBUG, "LOGGED: %@ - ATXMPBBlendingHomeScreenWidgetTopOfStackSelectionTracker with layoutType: %@, selectionType: %@, widgetsInStack: %u clientModelIdOfHighestRankingSuggestion: %@ highestConfidenceCategory: %@ execuableTypeOfHighestRankingSuggestion: %@ abGroup: %@ clientModelABGroup: %@", buf, 0x58u);

}

@end
