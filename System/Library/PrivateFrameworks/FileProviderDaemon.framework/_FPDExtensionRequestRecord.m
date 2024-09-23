@implementation _FPDExtensionRequestRecord

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_proxy);
  objc_storeStrong((id *)&self->_fractionCompletedObservation, 0);
  objc_storeStrong((id *)&self->_lastEventDate, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_progress, 0);
  objc_storeStrong((id *)&self->_timeout, 0);
  objc_storeStrong((id *)&self->_progressTimer, 0);
  objc_storeStrong((id *)&self->_timer, 0);
}

- (FPXPCAutomaticErrorProxy)proxy
{
  return (FPXPCAutomaticErrorProxy *)objc_loadWeakRetained((id *)&self->_proxy);
}

- (_FPDExtensionRequestRecord)initWithSelector:(SEL)a3 proxy:(id)a4 timeout:(double)a5 queue:(id)a6 log:(id)a7 timeoutHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  _FPDExtensionRequestRecord *v18;
  _FPDExtensionRequestRecord *v19;
  uint64_t v20;
  NSDate *timeout;
  uint64_t v22;
  id handler;
  objc_super v25;

  v14 = a4;
  v15 = a6;
  v16 = a7;
  v17 = a8;
  v25.receiver = self;
  v25.super_class = (Class)_FPDExtensionRequestRecord;
  v18 = -[_FPDExtensionRequestRecord init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_selector = a3;
    objc_storeWeak((id *)&v18->_proxy, v14);
    if (a5 > 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", a5);
      v20 = objc_claimAutoreleasedReturnValue();
      timeout = v19->_timeout;
      v19->_timeout = (NSDate *)v20;

    }
    objc_storeStrong((id *)&v19->_queue, a6);
    objc_storeStrong((id *)&v19->_log, a7);
    v22 = MEMORY[0x1D17D1C84](v17);
    handler = v19->_handler;
    v19->_handler = (id)v22;

    -[_FPDExtensionRequestRecord _setupTimer:](v19, "_setupTimer:", a5);
  }

  return v19;
}

- (void)cancelTimeout
{
  NSObject *timer;
  OS_dispatch_source *v4;
  NSObject *progressTimer;
  OS_dispatch_source *v6;
  NSObservation *fractionCompletedObservation;
  NSObservation *v8;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v6 = self->_progressTimer;
    self->_progressTimer = 0;

  }
  fractionCompletedObservation = self->_fractionCompletedObservation;
  if (fractionCompletedObservation)
  {
    -[NSObservation finishObserving](fractionCompletedObservation, "finishObserving");
    v8 = self->_fractionCompletedObservation;
    self->_fractionCompletedObservation = 0;

  }
}

- (void)_setupTimer:(double)a3
{
  OS_dispatch_source *v5;
  OS_dispatch_source *timer;
  NSObject *v7;
  dispatch_time_t v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_block_t v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  id location;

  if (!self->_handler)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ setting up timer without a timeout handler"), a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[_FPDExtensionRequestRecord _setupTimer:]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionRequestRecord.m", 116, (const char *)objc_msgSend(objc_retainAutorelease(v12), "UTF8String"));
  }
  if (a3 > 0.0)
  {
    v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    timer = self->_timer;
    self->_timer = v5;

    v7 = self->_timer;
    v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
    dispatch_source_set_timer(v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_set_qos_class_fallback();
    location = 0;
    objc_initWeak(&location, self);
    v9 = self->_timer;
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __42___FPDExtensionRequestRecord__setupTimer___block_invoke;
    v14[3] = &unk_1E8C75E70;
    objc_copyWeak(&v15, &location);
    v10 = v9;
    v11 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v14);
    dispatch_source_set_event_handler(v10, v11);

    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (void)monitorProgress:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (self->_timeout)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46___FPDExtensionRequestRecord_monitorProgress___block_invoke;
    v7[3] = &unk_1E8C75850;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_handleTimeout
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_2(&dword_1CF55F000, v0, v1, "[DEBUG] %@: soft expiration reached, cancelling progress", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_8_0();
}

- (void)_setupProgressTimer
{
  void *v3;
  double v4;
  double v5;
  NSObject *progressTimer;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  OS_dispatch_source *v9;
  NSObject *v10;
  dispatch_time_t v11;
  OS_dispatch_source *v12;
  NSObject *v13;
  dispatch_block_t v14;
  void *v15;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id location;

  if (!self->_handler)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[ASSERT] ‼️ setting up timer without a timeout handler"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    fp_current_or_default_log();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
      __103__FPDDomainExtensionBackend_startProvidingItemAtURL_readerID_readingOptions_request_completionHandler___block_invoke_2_160_cold_1();

    __assert_rtn("-[_FPDExtensionRequestRecord _setupProgressTimer]", "/Library/Caches/com.apple.xbs/Sources/FileProviderTools/fileproviderd/FPDExtensionRequestRecord.m", 144, (const char *)objc_msgSend(objc_retainAutorelease(v15), "UTF8String"));
  }
  +[FPDConfigurationStore defaultStore](FPDConfigurationStore, "defaultStore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "upcallExcutionTimeLimitStaleProgress");
  v5 = v4;
  progressTimer = self->_progressTimer;
  if (progressTimer)
  {
    dispatch_source_cancel(progressTimer);
    v7 = self->_progressTimer;
    self->_progressTimer = 0;

  }
  if (v5 > 0.0)
  {
    v8 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
    v9 = self->_progressTimer;
    self->_progressTimer = v8;

    v10 = self->_progressTimer;
    v11 = dispatch_time(0, (uint64_t)((v5 + 5.0) * 1000000000.0));
    dispatch_source_set_timer(v10, v11, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_set_qos_class_fallback();
    location = 0;
    objc_initWeak(&location, self);
    v12 = self->_progressTimer;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __49___FPDExtensionRequestRecord__setupProgressTimer__block_invoke;
    v17[3] = &unk_1E8C75E70;
    objc_copyWeak(&v18, &location);
    v13 = v12;
    v14 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v17);
    dispatch_source_set_event_handler(v13, v14);

    dispatch_resume((dispatch_object_t)self->_progressTimer);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

- (const)_timeoutExpirationState
{
  id WeakRetained;
  void *v3;
  uint64_t v4;
  const char *v5;
  const char *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_proxy);
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = objc_msgSend(WeakRetained, "timeoutState");
    v5 = "not expired";
    if (v4 == 1)
      v5 = "soft expired";
    if (v4 == 2)
      v6 = "hard expired";
    else
      v6 = v5;
  }
  else
  {
    v6 = "no proxy";
  }

  return v6;
}

- (id)description
{
  NSProgress *progress;
  void *v4;
  double v5;
  __CFString *v6;
  void *v7;
  NSDate *timeout;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;

  progress = self->_progress;
  if (progress)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    -[NSProgress fractionCompleted](progress, "fractionCompleted");
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%.1f%%"), v5 * 100.0);
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = CFSTR("no progress");
  }
  v7 = (void *)MEMORY[0x1E0CB3940];
  timeout = self->_timeout;
  NSStringFromSelector(self->_selector);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (timeout)
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (%@ - %s), %@"), v9, self->_timeout, -[_FPDExtensionRequestRecord _timeoutExpirationState](self, "_timeoutExpirationState"), v6);
  else
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@ (no timeout), %@"), v9, v6, v13, v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
