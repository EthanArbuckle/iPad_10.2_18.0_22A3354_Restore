@implementation ATXChinSuggestionThrottlingManager

- (ATXChinSuggestionThrottlingManager)init
{
  ATXChinSuggestionThrottlingManager *v2;
  id v3;
  uint64_t v4;
  NSUserDefaults *defaults;
  id v6;
  double v7;
  double v8;
  NSObject *v9;
  double maxWallClockTimeCredits;
  double wallClockTimeCreditsReplenishingRate;
  NSObject *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *requestManagementQueue;
  NSObject *v15;
  dispatch_queue_t v16;
  OS_dispatch_queue *requestProcessingQueue;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  double v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v19.receiver = self;
  v19.super_class = (Class)ATXChinSuggestionThrottlingManager;
  v2 = -[ATXChinSuggestionThrottlingManager init](&v19, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0C99EA0]);
    v4 = objc_msgSend(v3, "initWithSuiteName:", *MEMORY[0x1E0CF9510]);
    defaults = v2->_defaults;
    v2->_defaults = (NSUserDefaults *)v4;

    v6 = objc_alloc_init(MEMORY[0x1E0CF8FB8]);
    objc_msgSend(v6, "doubleForKey:defaultReturnValue:", CFSTR("ATXChinSuggestionThrottlingManager.maxWallClockTimeCredits"), 5.0);
    v2->_maxWallClockTimeCredits = v7;
    objc_msgSend(v6, "doubleForKey:defaultReturnValue:", CFSTR("ATXChinSuggestionThrottlingManager.wallClockTimeCreditsReplenishingRate"), 0.005);
    v2->_wallClockTimeCreditsReplenishingRate = v8;
    __atxlog_handle_notification_management();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      maxWallClockTimeCredits = v2->_maxWallClockTimeCredits;
      wallClockTimeCreditsReplenishingRate = v2->_wallClockTimeCreditsReplenishingRate;
      *(_DWORD *)buf = 136315650;
      v21 = "-[ATXChinSuggestionThrottlingManager init]";
      v22 = 2048;
      v23 = maxWallClockTimeCredits;
      v24 = 2048;
      v25 = wallClockTimeCreditsReplenishingRate;
      _os_log_impl(&dword_1C9A3B000, v9, OS_LOG_TYPE_DEFAULT, "%s: Starting up throttling manager with maxWallClockTimeCredits: %fs wallClockTimeCreditsReplenishingRate: %fs per second", buf, 0x20u);
    }

    v2->_requestProcessingQueueInUse = 0;
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = dispatch_queue_create("ATXChinSuggestionThrottlingManager.requestManagementQueue", v12);
    requestManagementQueue = v2->_requestManagementQueue;
    v2->_requestManagementQueue = (OS_dispatch_queue *)v13;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = dispatch_queue_create("ATXChinSuggestionThrottlingManager.requestProcessingQueue", v15);
    requestProcessingQueue = v2->_requestProcessingQueue;
    v2->_requestProcessingQueue = (OS_dispatch_queue *)v16;

    v2->_debuggingRequestSequenceNumber = 0;
  }
  return v2;
}

- (void)scheduleRequest:(id)a3
{
  id v4;
  NSObject *requestManagementQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  ATXChinSuggestionThrottlingManager *v9;

  v4 = a3;
  requestManagementQueue = self->_requestManagementQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __54__ATXChinSuggestionThrottlingManager_scheduleRequest___block_invoke;
  v7[3] = &unk_1E82DACB0;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(requestManagementQueue, v7);

}

uint64_t __54__ATXChinSuggestionThrottlingManager_scheduleRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  id *v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 64);
  objc_msgSend(*(id *)(a1 + 32), "setDebugIdentifier:");
  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v6 = 136315394;
    v7 = "-[ATXChinSuggestionThrottlingManager scheduleRequest:]_block_invoke";
    v8 = 2112;
    v9 = v3;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Received %@", (uint8_t *)&v6, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "logReceivedEventToCoreAnalytics");
  v4 = *(id **)(a1 + 40);
  if (v4[4])
  {
    objc_msgSend(v4, "_rejectPendingRequest");
    v4 = *(id **)(a1 + 40);
  }
  objc_storeStrong(v4 + 4, *(id *)(a1 + 32));
  return objc_msgSend(*(id *)(a1 + 40), "_acceptOrRejectPendingRequestIfExists");
}

- (void)_acceptOrRejectPendingRequestIfExists
{
  NSObject *requestManagementQueue;
  _QWORD block[5];

  requestManagementQueue = self->_requestManagementQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__ATXChinSuggestionThrottlingManager__acceptOrRejectPendingRequestIfExists__block_invoke;
  block[3] = &unk_1E82DAC38;
  block[4] = self;
  dispatch_async(requestManagementQueue, block);
}

void __75__ATXChinSuggestionThrottlingManager__acceptOrRejectPendingRequestIfExists__block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  double v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 32))
  {
    __atxlog_handle_notification_management();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[ATXChinSuggestionThrottlingManager _acceptOrRejectPendingRequestIfExists]_block_invoke";
      v4 = "%s: No pending request to schedule. Returning.";
      goto LABEL_7;
    }
LABEL_8:

    return;
  }
  if (*(_BYTE *)(v2 + 24))
  {
    __atxlog_handle_notification_management();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136315138;
      v9 = "-[ATXChinSuggestionThrottlingManager _acceptOrRejectPendingRequestIfExists]_block_invoke";
      v4 = "%s: A request is currently processing. Returning";
LABEL_7:
      _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v8, 0xCu);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  objc_msgSend((id)v2, "replenishWallClockTimeCredits");
  objc_msgSend(*(id *)(a1 + 32), "wallClockTimeCredits");
  if (v5 <= 0.0)
  {
    __atxlog_handle_notification_management();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(*(id *)(a1 + 32), "wallClockTimeCredits");
      v8 = 136315394;
      v9 = "-[ATXChinSuggestionThrottlingManager _acceptOrRejectPendingRequestIfExists]_block_invoke";
      v10 = 2048;
      v11 = v7;
      _os_log_impl(&dword_1C9A3B000, v6, OS_LOG_TYPE_DEFAULT, "%s: Not enough wallClockTimeCredits to process the request. Rejecting. wallClockTimeCredits: %fs", (uint8_t *)&v8, 0x16u);
    }

    objc_msgSend(*(id *)(a1 + 32), "_rejectPendingRequest");
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_acceptPendingRequest");
  }
}

- (void)_acceptPendingRequest
{
  ATXChinSuggestionRequest *v3;
  ATXChinSuggestionRequest *pendingRequest;
  NSObject *requestProcessingQueue;
  ATXChinSuggestionRequest *v6;
  _QWORD v7[4];
  ATXChinSuggestionRequest *v8;
  ATXChinSuggestionThrottlingManager *v9;

  v3 = self->_pendingRequest;
  pendingRequest = self->_pendingRequest;
  self->_pendingRequest = 0;

  self->_requestProcessingQueueInUse = 1;
  requestProcessingQueue = self->_requestProcessingQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke;
  v7[3] = &unk_1E82DACB0;
  v8 = v3;
  v9 = self;
  v6 = v3;
  dispatch_async(requestProcessingQueue, v7);

}

void __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  double v4;
  double v5;
  void (**v6)(void);
  uint64_t v7;
  void *v8;
  NSObject *v9;
  double v10;
  _QWORD block[5];
  id v12;
  double v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_management();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136315394;
    v15 = "-[ATXChinSuggestionThrottlingManager _acceptPendingRequest]_block_invoke";
    v16 = 2112;
    v17 = v3;
    _os_log_impl(&dword_1C9A3B000, v2, OS_LOG_TYPE_DEFAULT, "%s: Running %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "logAcceptedEventToCoreAnalytics");
  objc_msgSend(*(id *)(a1 + 40), "now");
  v5 = v4;
  objc_msgSend(*(id *)(a1 + 32), "acceptedBlock");
  v6 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v6[2]();

  objc_msgSend(*(id *)(a1 + 40), "now");
  v8 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v9 = *(NSObject **)(v7 + 40);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke_56;
  block[3] = &unk_1E82DEAD0;
  block[4] = v7;
  v13 = v10 - v5;
  v12 = v8;
  dispatch_async(v9, block);

}

uint64_t __59__ATXChinSuggestionThrottlingManager__acceptPendingRequest__block_invoke_56(uint64_t a1)
{
  void *v2;
  double v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  objc_msgSend(v2, "wallClockTimeCredits");
  objc_msgSend(v2, "setWallClockTimeCredits:", v3 - *(double *)(a1 + 48));
  __atxlog_handle_notification_management();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "wallClockTimeCredits");
    v9 = 136315906;
    v10 = "-[ATXChinSuggestionThrottlingManager _acceptPendingRequest]_block_invoke";
    v11 = 2112;
    v12 = v6;
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = v7;
    _os_log_impl(&dword_1C9A3B000, v4, OS_LOG_TYPE_DEFAULT, "%s: Finished %@ in %fs. Remaining wallClockTimeCredits: %fs", (uint8_t *)&v9, 0x2Au);
  }

  objc_msgSend(*(id *)(a1 + 32), "logWallClockTimeToCoreAnalytics:", *(double *)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 24) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "_acceptOrRejectPendingRequestIfExists");
}

- (void)_rejectPendingRequest
{
  NSObject *v3;
  ATXChinSuggestionRequest *pendingRequest;
  void (**v5)(void);
  ATXChinSuggestionRequest *v6;
  int v7;
  const char *v8;
  __int16 v9;
  ATXChinSuggestionRequest *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  __atxlog_handle_notification_management();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    pendingRequest = self->_pendingRequest;
    v7 = 136315394;
    v8 = "-[ATXChinSuggestionThrottlingManager _rejectPendingRequest]";
    v9 = 2112;
    v10 = pendingRequest;
    _os_log_impl(&dword_1C9A3B000, v3, OS_LOG_TYPE_DEFAULT, "%s: Rejecting %@", (uint8_t *)&v7, 0x16u);
  }

  -[ATXChinSuggestionThrottlingManager logRejectedEventToCoreAnalytics](self, "logRejectedEventToCoreAnalytics");
  -[ATXChinSuggestionRequest rejectedBlock](self->_pendingRequest, "rejectedBlock");
  v5 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v5[2]();

  v6 = self->_pendingRequest;
  self->_pendingRequest = 0;

}

- (void)logReceivedEventToCoreAnalytics
{
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("received");
  v4[0] = &unk_1E83CD960;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logAcceptedEventToCoreAnalytics
{
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("accepted");
  v4[0] = &unk_1E83CD960;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logRejectedEventToCoreAnalytics
{
  void *v2;
  const __CFString *v3;
  _QWORD v4[2];

  v4[1] = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("rejected");
  v4[0] = &unk_1E83CD960;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, &v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (void)logWallClockTimeToCoreAnalytics:(double)a3
{
  void *v3;
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v5 = CFSTR("wallClockTime");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AnalyticsSendEvent();

}

- (double)now
{
  double result;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  return result;
}

- (void)replenishWallClockTimeCredits
{
  double maxWallClockTimeCredits;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  maxWallClockTimeCredits = self->_maxWallClockTimeCredits;
  -[ATXChinSuggestionThrottlingManager wallClockTimeCredits](self, "wallClockTimeCredits");
  v5 = v4;
  -[ATXChinSuggestionThrottlingManager now](self, "now");
  v7 = v6;
  -[ATXChinSuggestionThrottlingManager timestampWallClockTimeCreditsLastReplenished](self, "timestampWallClockTimeCreditsLastReplenished");
  -[ATXChinSuggestionThrottlingManager setWallClockTimeCredits:](self, "setWallClockTimeCredits:", fmin(maxWallClockTimeCredits, v5 + (v7 - v8) * self->_wallClockTimeCreditsReplenishingRate));
  -[ATXChinSuggestionThrottlingManager now](self, "now");
  -[ATXChinSuggestionThrottlingManager setTimestampWallClockTimeCreditsLastReplenished:](self, "setTimestampWallClockTimeCreditsLastReplenished:");
}

- (double)wallClockTimeCredits
{
  void *v2;
  double v3;
  double v4;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("ATXChinSuggestionThrottlingManager.wallClockTimeCredits"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (double)timestampWallClockTimeCreditsLastReplenished
{
  void *v2;
  double v3;
  double v4;

  -[NSUserDefaults objectForKey:](self->_defaults, "objectForKey:", CFSTR("ATXChinSuggestionThrottlingManager.timestampWallClockTimeCreditsLastReplenished"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "doubleValue");
    v3 = v4;
  }

  return v3;
}

- (void)setWallClockTimeCredits:(double)a3
{
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("ATXChinSuggestionThrottlingManager.wallClockTimeCredits"), a3);
}

- (void)setTimestampWallClockTimeCreditsLastReplenished:(double)a3
{
  -[NSUserDefaults setDouble:forKey:](self->_defaults, "setDouble:forKey:", CFSTR("ATXChinSuggestionThrottlingManager.timestampWallClockTimeCreditsLastReplenished"), a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_requestProcessingQueue, 0);
  objc_storeStrong((id *)&self->_requestManagementQueue, 0);
  objc_storeStrong((id *)&self->_pendingRequest, 0);
}

@end
