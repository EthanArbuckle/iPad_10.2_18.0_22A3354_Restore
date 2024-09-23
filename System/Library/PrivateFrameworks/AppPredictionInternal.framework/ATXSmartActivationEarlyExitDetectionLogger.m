@implementation ATXSmartActivationEarlyExitDetectionLogger

+ (id)sharedInstance
{
  if (sharedInstance__pasOnceToken6_24 != -1)
    dispatch_once(&sharedInstance__pasOnceToken6_24, &__block_literal_global_133);
  return (id)sharedInstance__pasExprOnceResult_30;
}

void __60__ATXSmartActivationEarlyExitDetectionLogger_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)MEMORY[0x1CAA48B6C]();
  v1 = objc_opt_new();
  v2 = (void *)sharedInstance__pasExprOnceResult_30;
  sharedInstance__pasExprOnceResult_30 = v1;

  objc_autoreleasePoolPop(v0);
}

- (ATXSmartActivationEarlyExitDetectionLogger)init
{
  ATXSmartActivationEarlyExitDetectionLogger *v2;
  ATXSmartActivationEarlyExitDetectionLogger *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ATXSmartActivationEarlyExitDetectionLogger;
  v2 = -[ATXSmartActivationEarlyExitDetectionLogger init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[ATXSmartActivationEarlyExitDetectionLogger _registerForModeChangeNotifications](v2, "_registerForModeChangeNotifications");
  return v3;
}

- (void)_registerForModeChangeNotifications
{
  NSObject *v3;
  OS_dispatch_queue *v4;
  OS_dispatch_queue *queue;
  NSObject *v6;
  BMBiomeScheduler *v7;
  BMBiomeScheduler *scheduler;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BPSSink *v14;
  BPSSink *sink;
  _QWORD v16[4];
  id v17;
  id buf[2];

  if (!self->_queue)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.SmartActivationEarlyExitDetection.queue", v3);
    queue = self->_queue;
    self->_queue = v4;

  }
  __atxlog_handle_modes();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: registering for real time mode change events", (uint8_t *)buf, 2u);
  }

  v7 = (BMBiomeScheduler *)objc_msgSend(objc_alloc(MEMORY[0x1E0D025E0]), "initWithIdentifier:targetQueue:", CFSTR("FocusModes.SmartActivationEarlyExitDetection"), self->_queue);
  scheduler = self->_scheduler;
  self->_scheduler = v7;

  objc_initWeak(buf, self);
  BiomeLibrary();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "UserFocus");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "ComputedMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "atx_DSLPublisher");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "subscribeOn:", self->_scheduler);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_10;
  v16[3] = &unk_1E82DE280;
  objc_copyWeak(&v17, buf);
  objc_msgSend(v13, "sinkWithCompletion:receiveInput:", &__block_literal_global_9_0, v16);
  v14 = (BPSSink *)objc_claimAutoreleasedReturnValue();
  sink = self->_sink;
  self->_sink = v14;

  objc_destroyWeak(&v17);
  objc_destroyWeak(buf);
}

void __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint8_t v6[16];

  v2 = a2;
  v3 = objc_msgSend(v2, "state");
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_cold_1(v2, v5);
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1C9A3B000, v5, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: done listening to mode change events", v6, 2u);
  }

}

void __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  id WeakRetained;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  __atxlog_handle_modes();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138543362;
    v8 = v5;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: processing new userFocusComputedModeEvent: %{public}@", (uint8_t *)&v7, 0xCu);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_processNewUserFocusComputedModeEvent:", v3);

}

- (void)_processNewUserFocusComputedModeEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v6, "eventBody");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXSmartActivationEarlyExitDetectionLogger _logEventIfEarlyExit:](self, "_logEventIfEarlyExit:", v5);

  }
}

- (BOOL)_logEventIfEarlyExit:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if ((objc_msgSend(v3, "starting") & 1) != 0 || objc_msgSend(v3, "updateReason") != 1)
  {
    LOBYTE(v5) = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D80E50], "currentMode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "modeIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v4, "modeIdentifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "mode");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v6, "isEqualToString:", v7);

      if (v8)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CF8C60]), "initWithBiomeInferredModeEvent:", v4);
        v9 = objc_alloc(MEMORY[0x1E0CF8C70]);
        objc_msgSend(MEMORY[0x1E0C99D68], "now");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = (void *)objc_msgSend(v9, "initWithEventDate:activity:acceptedTriggers:eventType:suggestionType:location:", v10, v5, MEMORY[0x1E0C9AA60], 5, 1, 2);

        __atxlog_handle_modes();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v4, "modeIdentifier");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138543874;
          v18 = v13;
          v19 = 2048;
          v20 = (int)objc_msgSend(v4, "modeType");
          v21 = 2112;
          v22 = v11;
          _os_log_impl(&dword_1C9A3B000, v12, OS_LOG_TYPE_DEFAULT, "ATXSmartActivationEarlyExitDetectionLogger: Early exit detected for modeUUID: %{public}@, type:%ld. Sending feedback event to Biome: %@", (uint8_t *)&v17, 0x20u);

        }
        v14 = (void *)objc_opt_new();
        objc_msgSend(v14, "source");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "sendEvent:", v11);

        LOBYTE(v5) = 1;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }

  }
  return (char)v5;
}

- (void)stopListening
{
  BPSSink *sink;
  BMBiomeScheduler *scheduler;

  -[BPSSink cancel](self->_sink, "cancel");
  sink = self->_sink;
  self->_sink = 0;

  scheduler = self->_scheduler;
  self->_scheduler = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sink, 0);
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __81__ATXSmartActivationEarlyExitDetectionLogger__registerForModeChangeNotifications__block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "error");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1C9A3B000, a2, OS_LOG_TYPE_ERROR, "ATXSmartActivationEarlyExitDetectionLogger: error listening to mode change events: %@", (uint8_t *)&v4, 0xCu);

}

@end
