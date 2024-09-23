@implementation CLSQueryHandler

- (CLSQueryHandler)initWithQueryPerformer:(id)a3 geoServiceThread:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  dispatch_queue_t v15;
  void *v16;
  dispatch_source_t v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD handler[4];
  id v28;
  id location;
  objc_super v30;
  uint8_t buf[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v30.receiver = self;
  v30.super_class = (Class)CLSQueryHandler;
  v12 = -[CLSQueryHandler init](&v30, sel_init);
  if (v12)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v13, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue();

    v15 = dispatch_queue_create("Cacher Handler Queue", v14);
    v16 = (void *)*((_QWORD *)v12 + 7);
    *((_QWORD *)v12 + 7) = v15;

    objc_storeStrong((id *)v12 + 8, a5);
    objc_storeStrong((id *)v12 + 12, a4);
    objc_storeStrong((id *)v12 + 1, a3);
    *((_WORD *)v12 + 24) = 0;
    *((_QWORD *)v12 + 2) = 0;
    v17 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v12 + 7));
    v18 = (void *)*((_QWORD *)v12 + 3);
    *((_QWORD *)v12 + 3) = v17;

    objc_initWeak(&location, v12);
    v19 = *((_QWORD *)v12 + 3);
    v20 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke;
    handler[3] = &unk_1E84F8E50;
    objc_copyWeak(&v28, &location);
    dispatch_source_set_event_handler(v19, handler);
    v21 = *((_QWORD *)v12 + 3);
    v24[0] = v20;
    v24[1] = 3221225472;
    v24[2] = __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke_2;
    v24[3] = &unk_1E84F8E80;
    objc_copyWeak(&v26, &location);
    v25 = v9;
    dispatch_source_set_cancel_handler(v21, v24);
    v22 = *((_QWORD *)v12 + 8);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v32 = v12;
      _os_log_debug_impl(&dword_1CAB79000, v22, OS_LOG_TYPE_DEBUG, "----- New Query Performer <%p> ----", buf, 0xCu);
    }

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return (CLSQueryHandler *)v12;
}

- (void)cacheItems
{
  NSObject *timerQueue;
  _QWORD block[5];

  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __29__CLSQueryHandler_cacheItems__block_invoke;
  block[3] = &unk_1E84F8F20;
  block[4] = self;
  dispatch_async(timerQueue, block);
}

- (void)_forwardToGeoThread
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1D1796094](self, a2);
  -[CLSQueryHandler methodSignatureForSelector:](self, "methodSignatureForSelector:", sel__startQuery);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB8], "invocationWithMethodSignature:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTarget:", self);
  objc_msgSend(v5, "setSelector:", sel__startQuery);
  objc_msgSend(v5, "retainArguments");
  objc_msgSend(v5, "performSelector:onThread:withObject:waitUntilDone:", sel_invoke, self->_geoServiceThread, 0, 0);

  objc_autoreleasePoolPop(v3);
}

- (void)_handleQueryResultsForQuery:(id)a3 items:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  CLSQueryHandler *v10;
  NSObject *loggingConnection;
  NSObject *v12;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void (**completionBlock)(id, uint64_t, unint64_t, _QWORD);
  NSObject *v17;
  id v18;
  OS_dispatch_source *timer;
  int v20;
  CLSQueryHandler *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (CLSQueryHandler *)a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if ((objc_msgSend(v8, "isCancelled") & 1) != 0)
  {
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
    {
      v20 = 134218242;
      v21 = self;
      v22 = 2112;
      v23 = (unint64_t)v8;
      _os_log_debug_impl(&dword_1CAB79000, loggingConnection, OS_LOG_TYPE_DEBUG, "%p - Query cancelled: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  else
  {
    self->_didQueryFinish = 1;
    if (v10)
    {
      v12 = self->_loggingConnection;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        v20 = 138412290;
        v21 = v10;
        _os_log_error_impl(&dword_1CAB79000, v12, OS_LOG_TYPE_ERROR, "GeoService returned error %@", (uint8_t *)&v20, 0xCu);
      }
      -[CLSQueryHandler _handleError:numberOfItems:](self, "_handleError:numberOfItems:", v10, objc_msgSend(v9, "count"));
    }
    else
    {
      v13 = (void *)MEMORY[0x1D1796094]();
      v14 = -[CLSQueryHandler _cacheMapItems:](self, "_cacheMapItems:", v9);
      objc_autoreleasePoolPop(v13);
      v15 = self->_loggingConnection;
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        v20 = 134218242;
        v21 = self;
        v22 = 2112;
        v23 = (unint64_t)v8;
        _os_log_debug_impl(&dword_1CAB79000, v15, OS_LOG_TYPE_DEBUG, "%p - Caching result from %@", (uint8_t *)&v20, 0x16u);
      }
      completionBlock = (void (**)(id, uint64_t, unint64_t, _QWORD))self->_completionBlock;
      if (completionBlock)
      {
        v17 = self->_loggingConnection;
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          v20 = 134218240;
          v21 = self;
          v22 = 2048;
          v23 = v14;
          _os_log_debug_impl(&dword_1CAB79000, v17, OS_LOG_TYPE_DEBUG, "%p - Completion Block: %ld items cached", (uint8_t *)&v20, 0x16u);
          completionBlock = (void (**)(id, uint64_t, unint64_t, _QWORD))self->_completionBlock;
        }
        completionBlock[2](completionBlock, 1, v14, 0);
        v18 = self->_completionBlock;
        self->_completionBlock = 0;

      }
      timer = self->_timer;
      self->_timer = 0;

    }
  }

}

- (void)_startQuery
{
  CLSQueryPerformerProtocol *v3;
  NSObject *loggingConnection;
  CLSQueryPerformerProtocol *v5;
  CLSQueryPerformerProtocol *v6;
  CLSQueryPerformerProtocol *query;
  _QWORD v8[4];
  CLSQueryPerformerProtocol *v9;
  id v10;
  id location;
  uint8_t buf[4];
  CLSQueryHandler *v13;
  __int16 v14;
  CLSQueryPerformerProtocol *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = self->_query;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
  {
    query = self->_query;
    *(_DWORD *)buf = 134218242;
    v13 = self;
    v14 = 2112;
    v15 = query;
    _os_log_debug_impl(&dword_1CAB79000, loggingConnection, OS_LOG_TYPE_DEBUG, "%p - Start query for %@", buf, 0x16u);
  }
  v5 = self->_query;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __30__CLSQueryHandler__startQuery__block_invoke;
  v8[3] = &unk_1E84F7750;
  objc_copyWeak(&v10, &location);
  v6 = v3;
  v9 = v6;
  -[CLSQueryPerformerProtocol submitWithHandler:](v5, "submitWithHandler:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)_heartBeat
{
  void *v3;
  void (**progressBlock)(id, char *);
  NSObject *loggingConnection;
  double v6;
  double timeoutInterval;
  NSObject *v8;
  unint64_t retryLevel;
  unint64_t numberOfRetries;
  void *v11;
  CLSQueryPerformerProtocol *query;
  void *v13;
  CLSQueryPerformerProtocol *v14;
  CLSQueryPerformerProtocol *v15;
  NSObject *v16;
  unint64_t v17;
  NSObject *v18;
  double internalProgressTimeInterval;
  const __CFString *v20;
  char v21;
  uint8_t buf[4];
  double v23;
  __int16 v24;
  double v25;
  __int16 v26;
  const __CFString *v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D1796094](self, a2);
  v21 = 0;
  progressBlock = (void (**)(id, char *))self->_progressBlock;
  if (progressBlock)
  {
    progressBlock[2](progressBlock, &v21);
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEBUG))
    {
      internalProgressTimeInterval = self->_internalProgressTimeInterval;
      if (v21)
        v20 = CFSTR("YES");
      else
        v20 = CFSTR("NO");
      *(_DWORD *)buf = 134218498;
      v23 = *(double *)&self;
      v24 = 2048;
      v25 = internalProgressTimeInterval;
      v26 = 2112;
      v27 = v20;
      _os_log_debug_impl(&dword_1CAB79000, loggingConnection, OS_LOG_TYPE_DEBUG, "%p - Progress tick %f seconds, shouldStop %@", buf, 0x20u);
    }
    if (v21)
      -[CLSQueryHandler _cancel](self, "_cancel");
  }
  if (self->_alreadyLaunched)
  {
    v6 = self->_internalProgressTimeInterval;
    timeoutInterval = self->_timeoutInterval;
    if (v6 < timeoutInterval)
    {
      self->_internalProgressTimeInterval = v6 + 1.0;
      goto LABEL_22;
    }
    self->_internalProgressTimeInterval = 0.0;
    if (self->_didQueryFinish)
      goto LABEL_13;
    retryLevel = self->_retryLevel;
    numberOfRetries = self->_numberOfRetries;
    if (retryLevel >= numberOfRetries)
    {
      v18 = self->_loggingConnection;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v23 = timeoutInterval * (double)numberOfRetries;
        _os_log_impl(&dword_1CAB79000, v18, OS_LOG_TYPE_INFO, "Cancelled request because it took more than %f seconds", buf, 0xCu);
      }
      v21 = 1;
      goto LABEL_21;
    }
    self->_retryLevel = retryLevel + 1;
    -[CLSQueryPerformerProtocol cancel](self->_query, "cancel");
    v11 = (void *)objc_opt_class();
    query = self->_query;
    -[CLSQueryPerformerProtocol regions](query, "regions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "queryWithTemplate:forRegions:", query, v13);
    v14 = (CLSQueryPerformerProtocol *)objc_claimAutoreleasedReturnValue();
    v15 = self->_query;
    self->_query = v14;

    v16 = self->_loggingConnection;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = self->_retryLevel;
      *(_DWORD *)buf = 134217984;
      v23 = *(double *)&v17;
      _os_log_impl(&dword_1CAB79000, v16, OS_LOG_TYPE_INFO, "Did hit %lu timeouts, try again", buf, 0xCu);
    }
  }
  else
  {
    self->_internalProgressTimeInterval = 0.0;
    if (self->_didQueryFinish)
    {
LABEL_13:
      v8 = self->_loggingConnection;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134217984;
        v23 = *(double *)&self;
        _os_log_debug_impl(&dword_1CAB79000, v8, OS_LOG_TYPE_DEBUG, "%p - Query Already finished", buf, 0xCu);
      }
      goto LABEL_22;
    }
  }
  if (v21)
  {
LABEL_21:
    -[CLSQueryHandler _cancel](self, "_cancel");
    goto LABEL_22;
  }
  if (CFAbsoluteTimeGetCurrent() >= self->_nextRetryTime)
  {
    self->_alreadyLaunched = 1;
    -[CLSQueryHandler _forwardToGeoThread](self, "_forwardToGeoThread");
  }
LABEL_22:
  objc_autoreleasePoolPop(v3);
}

- (void)_handleError:(id)a3 numberOfItems:(unint64_t)a4
{
  id v6;
  CFAbsoluteTime Current;
  unint64_t retryLevel;
  NSObject *loggingConnection;
  double nextRetryTime;
  NSObject *v11;
  uint64_t v12;
  void (**completionBlock)(id, BOOL, unint64_t, _QWORD);
  id v14;
  id v15;
  OS_dispatch_source *timer;
  int v17;
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  retryLevel = self->_retryLevel;
  self->_nextRetryTime = Current + (double)(1 << retryLevel++) * 15.0;
  self->_retryLevel = retryLevel;
  if (retryLevel < self->_numberOfRetries && (objc_msgSend(v6, "code") == -3 || objc_msgSend(v6, "code") == -9))
  {
    *(_WORD *)&self->_alreadyLaunched = 0;
    loggingConnection = self->_loggingConnection;
    if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
    {
      nextRetryTime = self->_nextRetryTime;
      v11 = loggingConnection;
      v17 = 134217984;
      v18 = nextRetryTime - CFAbsoluteTimeGetCurrent();
      _os_log_impl(&dword_1CAB79000, v11, OS_LOG_TYPE_INFO, "Re-Trying in %0.2fs", (uint8_t *)&v17, 0xCu);

    }
  }
  else
  {
    v12 = objc_msgSend(v6, "code");
    completionBlock = (void (**)(id, BOOL, unint64_t, _QWORD))self->_completionBlock;
    if (completionBlock)
    {
      if (v12 == -8)
        v14 = 0;
      else
        v14 = v6;
      ((void (**)(id, BOOL, unint64_t, id))completionBlock)[2](completionBlock, v12 == -8, a4, v14);
      v15 = self->_completionBlock;
      self->_completionBlock = 0;

    }
    timer = self->_timer;
    self->_timer = 0;

  }
}

- (void)_cancel
{
  NSObject *timer;

  timer = self->_timer;
  if (timer)
  {
    if (!dispatch_source_testcancel((dispatch_source_t)self->_timer))
      dispatch_source_cancel(timer);
  }
}

- (void)cancel
{
  NSObject *timerQueue;
  _QWORD block[5];

  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __25__CLSQueryHandler_cancel__block_invoke;
  block[3] = &unk_1E84F8F20;
  block[4] = self;
  dispatch_sync(timerQueue, block);
}

- (unint64_t)_cacheMapItems:(id)a3
{
  return -[CLSQueryPerformerProtocol cacheItems:](self->_query, "cacheItems:", a3);
}

- (id)progressBlock
{
  return self->_progressBlock;
}

- (void)setProgressBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)completionBlock
{
  return self->_completionBlock;
}

- (void)setCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (CLSGeoServiceThread)geoServiceThread
{
  return self->_geoServiceThread;
}

- (void)setGeoServiceThread:(id)a3
{
  objc_storeStrong((id *)&self->_geoServiceThread, a3);
}

- (BOOL)isSimulatingTimeout
{
  return self->_simulatesTimeout;
}

- (void)setSimulatesTimeout:(BOOL)a3
{
  self->_simulatesTimeout = a3;
}

- (double)timeoutInterval
{
  return self->_timeoutInterval;
}

- (void)setTimeoutInterval:(double)a3
{
  self->_timeoutInterval = a3;
}

- (unint64_t)numberOfRetries
{
  return self->_numberOfRetries;
}

- (void)setNumberOfRetries:(unint64_t)a3
{
  self->_numberOfRetries = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_geoServiceThread, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_progressBlock, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

uint64_t __25__CLSQueryHandler_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

void __30__CLSQueryHandler__startQuery__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject **WeakRetained;
  NSObject **v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[5];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  NSObject **v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained[8];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v11 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v17 = v8;
      v18 = 2112;
      v19 = v11;
      _os_log_debug_impl(&dword_1CAB79000, v9, OS_LOG_TYPE_DEBUG, "%p - Query Handler for %@ ", buf, 0x16u);
    }
    if (objc_msgSend(v8, "isSimulatingTimeout"))
      sleep((*((double *)v8 + 13) + *((double *)v8 + 13)));
    v10 = v8[7];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __30__CLSQueryHandler__startQuery__block_invoke_45;
    v12[3] = &unk_1E84F7950;
    v12[4] = v8;
    v13 = *(id *)(a1 + 32);
    v14 = v5;
    v15 = v6;
    dispatch_async(v10, v12);

  }
}

uint64_t __30__CLSQueryHandler__startQuery__block_invoke_45(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQueryResultsForQuery:items:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
}

void __29__CLSQueryHandler_cacheItems__block_invoke(uint64_t a1)
{
  NSObject *v2;

  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 24);
  if (v2)
  {
    dispatch_source_set_timer(v2, 0, 0x3B9ACA00uLL, 0xEE6B280uLL);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  }
}

void __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_heartBeat");

}

void __77__CLSQueryHandler_initWithQueryPerformer_geoServiceThread_loggingConnection___block_invoke_2(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = (void *)WeakRetained[1];
    v9 = v2;
    if (v3)
    {
      objc_msgSend(v3, "cancel");
      v2 = v9;
    }
    if (v2[11])
    {
      v4 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ did %ld retries of %fs"), objc_opt_class(), v9[14], v9[13]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "errorWithDomain:code:localizedDescription:", CFSTR("CLSErrorDomain"), -4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(v9[11] + 16))();
      v7 = (void *)v9[11];
      v9[11] = 0;

      v2 = v9;
    }
    v8 = (void *)v2[3];
    v2[3] = 0;

    v2 = v9;
  }

}

@end
