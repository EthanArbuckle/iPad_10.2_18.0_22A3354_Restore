@implementation CLSQueueBasedGeoMapQueryHelper

- (CLSQueueBasedGeoMapQueryHelper)initWithQueryObject:(id)a3
{
  id v5;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  void *v10;
  dispatch_source_t v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD handler[4];
  id v21;
  id location;
  objc_super v23;

  v5 = a3;
  v23.receiver = self;
  v23.super_class = (Class)CLSQueueBasedGeoMapQueryHelper;
  v6 = -[CLSQueueBasedGeoMapQueryHelper init](&v23, sel_init);
  if (v6)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("Cache Handler Queue", v8);
    v10 = (void *)*((_QWORD *)v6 + 9);
    *((_QWORD *)v6 + 9) = v9;

    *(_OWORD *)(v6 + 40) = xmmword_1CABE9030;
    objc_storeStrong((id *)v6 + 2, a3);
    *(_WORD *)(v6 + 9) = 0;
    *((_QWORD *)v6 + 7) = 0;
    v11 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v6 + 9));
    v12 = (void *)*((_QWORD *)v6 + 8);
    *((_QWORD *)v6 + 8) = v11;

    objc_initWeak(&location, v6);
    v13 = *((_QWORD *)v6 + 8);
    v14 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __54__CLSQueueBasedGeoMapQueryHelper_initWithQueryObject___block_invoke;
    handler[3] = &unk_1E84F8E50;
    objc_copyWeak(&v21, &location);
    dispatch_source_set_event_handler(v13, handler);
    v15 = *((_QWORD *)v6 + 8);
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __54__CLSQueueBasedGeoMapQueryHelper_initWithQueryObject___block_invoke_2;
    v17[3] = &unk_1E84F8E80;
    objc_copyWeak(&v19, &location);
    v18 = v5;
    dispatch_source_set_cancel_handler(v15, v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);

  }
  return (CLSQueueBasedGeoMapQueryHelper *)v6;
}

- (void)launchQueryWithCancellerBlock:(id)a3 completionBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *timerQueue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  timerQueue = self->_timerQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CLSQueueBasedGeoMapQueryHelper_launchQueryWithCancellerBlock_completionBlock___block_invoke;
  block[3] = &unk_1E84F8EA8;
  block[4] = self;
  v12 = v7;
  v13 = v6;
  v9 = v6;
  v10 = v7;
  dispatch_async(timerQueue, block);

}

- (void)_handleQueryResultsForQuery:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void (**completionBlock)(id, uint64_t, _QWORD, id);
  id v9;
  OS_dispatch_source *timer;
  int v11;
  CLSQueueBasedGeoMapQueryHelper *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_timerQueue);
  if ((objc_msgSend(v6, "isCancelled") & 1) != 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v11 = 134218242;
      v12 = self;
      v13 = 2112;
      v14 = v6;
      _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%p - Query cancelled: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  else
  {
    self->_didFinishQuery = 1;
    if (v7)
    {
      -[CLSQueueBasedGeoMapQueryHelper _handleError:](self, "_handleError:", v7);
    }
    else
    {
      completionBlock = (void (**)(id, uint64_t, _QWORD, id))self->_completionBlock;
      if (completionBlock)
      {
        completionBlock[2](completionBlock, 1, 0, v6);
        v9 = self->_completionBlock;
        self->_completionBlock = 0;

      }
      timer = self->_timer;
      self->_timer = 0;

    }
  }

}

- (void)_startQuery
{
  CLSQueryProtocol *v3;
  CLSQueryProtocol *v4;
  _QWORD v5[4];
  CLSQueryProtocol *v6;
  id v7;
  id location;
  uint8_t buf[4];
  CLSQueueBasedGeoMapQueryHelper *v10;
  __int16 v11;
  CLSQueryProtocol *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  v3 = self->_query;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218242;
    v10 = self;
    v11 = 2112;
    v12 = v3;
    _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%p - Start query for %@", buf, 0x16u);
  }
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __45__CLSQueueBasedGeoMapQueryHelper__startQuery__block_invoke;
  v5[3] = &unk_1E84F8EF8;
  objc_copyWeak(&v7, &location);
  v4 = v3;
  v6 = v4;
  -[CLSQueryProtocol submitWithHandler:](v4, "submitWithHandler:", v5);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)_heartBeat
{
  void *v3;
  void (**cancellerBlock)(id, char *);
  double v5;
  double timeoutInterval;
  unint64_t retryLevel;
  double numberOfRetries;
  unint64_t v9;
  double internalProgressTimeInterval;
  const __CFString *v11;
  char v12;
  uint8_t buf[4];
  double v14;
  __int16 v15;
  double v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1D1796094](self, a2);
  v12 = 0;
  cancellerBlock = (void (**)(id, char *))self->_cancellerBlock;
  if (cancellerBlock)
  {
    cancellerBlock[2](cancellerBlock, &v12);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      internalProgressTimeInterval = self->_internalProgressTimeInterval;
      if (v12)
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      *(_DWORD *)buf = 134218498;
      v14 = *(double *)&self;
      v15 = 2048;
      v16 = internalProgressTimeInterval;
      v17 = 2112;
      v18 = v11;
      _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%p - Progress tick %f seconds, shouldStop %@", buf, 0x20u);
    }
    if (v12)
      goto LABEL_4;
  }
  if (self->_alreadyLaunched)
  {
    v5 = self->_internalProgressTimeInterval;
    timeoutInterval = self->_timeoutInterval;
    if (v5 < timeoutInterval)
    {
      self->_internalProgressTimeInterval = v5 + 1.0;
      goto LABEL_14;
    }
    self->_internalProgressTimeInterval = 0.0;
    if (self->_didFinishQuery)
      goto LABEL_12;
    retryLevel = self->_retryLevel;
    numberOfRetries = self->_numberOfRetries;
    if (numberOfRetries <= (double)retryLevel)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        v14 = timeoutInterval * numberOfRetries;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled request because it took more than %f seconds", buf, 0xCu);
      }
      v12 = 1;
    }
    else
    {
      self->_retryLevel = retryLevel + 1;
      -[CLSQueryProtocol cancel](self->_query, "cancel");
      -[CLSQueryProtocol prepareForRetry](self->_query, "prepareForRetry");
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v9 = self->_retryLevel;
        *(_DWORD *)buf = 134217984;
        v14 = *(double *)&v9;
        _os_log_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Did hit %lu timeouts, try again", buf, 0xCu);
      }
      if (!v12)
        goto LABEL_9;
    }
LABEL_4:
    -[CLSQueueBasedGeoMapQueryHelper _cancel](self, "_cancel");
    goto LABEL_14;
  }
  self->_internalProgressTimeInterval = 0.0;
  if (self->_didFinishQuery)
  {
LABEL_12:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134217984;
      v14 = *(double *)&self;
      _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%p - Query Already finished", buf, 0xCu);
    }
    goto LABEL_14;
  }
LABEL_9:
  if (CFAbsoluteTimeGetCurrent() >= self->_nextRetryTime)
  {
    self->_alreadyLaunched = 1;
    -[CLSQueueBasedGeoMapQueryHelper _startQuery](self, "_startQuery");
  }
LABEL_14:
  objc_autoreleasePoolPop(v3);
}

- (void)_handleError:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  CFAbsoluteTime Current;
  unint64_t retryLevel;
  void (**completionBlock)(id, BOOL, id, CLSQueryProtocol *);
  id v11;
  OS_dispatch_source *timer;
  int v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "code");
  if (v5 == -8)
    v6 = 0;
  else
    v6 = v4;
  v7 = v6;
  if (v5 != -8 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v13 = 138412290;
    v14 = v4;
    _os_log_error_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "GeoServices returned error %@", (uint8_t *)&v13, 0xCu);
  }
  Current = CFAbsoluteTimeGetCurrent();
  retryLevel = self->_retryLevel;
  self->_nextRetryTime = Current + (double)(1 << retryLevel++) * 15.0;
  self->_retryLevel = retryLevel;
  if (self->_numberOfRetries > (double)retryLevel && (objc_msgSend(v7, "code") == -3 || objc_msgSend(v7, "code") == -9))
  {
    *(_WORD *)&self->_alreadyLaunched = 0;
  }
  else
  {
    completionBlock = (void (**)(id, BOOL, id, CLSQueryProtocol *))self->_completionBlock;
    if (completionBlock)
    {
      completionBlock[2](completionBlock, v5 == -8, v7, self->_query);
      v11 = self->_completionBlock;
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
  block[2] = __40__CLSQueueBasedGeoMapQueryHelper_cancel__block_invoke;
  block[3] = &unk_1E84F8F20;
  block[4] = self;
  dispatch_sync(timerQueue, block);
}

- (CLSQueryProtocol)query
{
  return self->_query;
}

- (id)cancellerBlock
{
  return self->_cancellerBlock;
}

- (id)completionBlock
{
  return self->_completionBlock;
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

- (double)numberOfRetries
{
  return self->_numberOfRetries;
}

- (void)setNumberOfRetries:(double)a3
{
  self->_numberOfRetries = a3;
}

- (double)internalProgressTimeInterval
{
  return self->_internalProgressTimeInterval;
}

- (void)setInternalProgressTimeInterval:(double)a3
{
  self->_internalProgressTimeInterval = a3;
}

- (OS_dispatch_source)timer
{
  return self->_timer;
}

- (void)setTimer:(id)a3
{
  objc_storeStrong((id *)&self->_timer, a3);
}

- (OS_dispatch_queue)timerQueue
{
  return self->_timerQueue;
}

- (void)setTimerQueue:(id)a3
{
  objc_storeStrong((id *)&self->_timerQueue, a3);
}

- (unint64_t)retryLevel
{
  return self->_retryLevel;
}

- (void)setRetryLevel:(unint64_t)a3
{
  self->_retryLevel = a3;
}

- (double)nextRetryTime
{
  return self->_nextRetryTime;
}

- (void)setNextRetryTime:(double)a3
{
  self->_nextRetryTime = a3;
}

- (BOOL)alreadyLaunched
{
  return self->_alreadyLaunched;
}

- (void)setAlreadyLaunched:(BOOL)a3
{
  self->_alreadyLaunched = a3;
}

- (BOOL)didFinishQuery
{
  return self->_didFinishQuery;
}

- (void)setDidFinishQuery:(BOOL)a3
{
  self->_didFinishQuery = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timerQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_storeStrong(&self->_cancellerBlock, 0);
  objc_storeStrong((id *)&self->_query, 0);
}

uint64_t __40__CLSQueueBasedGeoMapQueryHelper_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancel");
}

void __45__CLSQueueBasedGeoMapQueryHelper__startQuery__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject **WeakRetained;
  NSObject *v6;
  uint64_t v7;
  _QWORD block[5];
  id v9;
  id v10;
  uint8_t buf[4];
  NSObject **v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      v7 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 134218242;
      v12 = WeakRetained;
      v13 = 2112;
      v14 = v7;
      _os_log_debug_impl(&dword_1CAB79000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%p - Query Handler for %@ ", buf, 0x16u);
    }
    if (objc_msgSend(WeakRetained, "isSimulatingTimeout"))
      sleep((*((double *)WeakRetained + 5) + *((double *)WeakRetained + 5)));
    v6 = WeakRetained[9];
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__CLSQueueBasedGeoMapQueryHelper__startQuery__block_invoke_8;
    block[3] = &unk_1E84F8ED0;
    block[4] = WeakRetained;
    v9 = *(id *)(a1 + 32);
    v10 = v4;
    dispatch_async(v6, block);

  }
}

uint64_t __45__CLSQueueBasedGeoMapQueryHelper__startQuery__block_invoke_8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleQueryResultsForQuery:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __80__CLSQueueBasedGeoMapQueryHelper_launchQueryWithCancellerBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *object;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  v5 = objc_msgSend(*(id *)(a1 + 48), "copy");
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 24);
  *(_QWORD *)(v6 + 24) = v5;

  v8 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  if (v8)
  {
    object = v8;
    dispatch_source_set_timer(object, 0, 0x3B9ACA00uLL, 0xEE6B280uLL);
    dispatch_resume(object);

  }
}

void __54__CLSQueueBasedGeoMapQueryHelper_initWithQueryObject___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_heartBeat");

}

void __54__CLSQueueBasedGeoMapQueryHelper_initWithQueryObject___block_invoke_2(uint64_t a1)
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
    v3 = (void *)WeakRetained[2];
    v9 = v2;
    if (v3)
    {
      objc_msgSend(v3, "cancel");
      v2 = v9;
    }
    if (v2[4])
    {
      v4 = (void *)MEMORY[0x1E0CB35C8];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ did %ld retries of %fs"), objc_opt_class(), (unint64_t)*((double *)v9 + 6), v9[5]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "errorWithDomain:code:localizedDescription:", CFSTR("CLSErrorDomain"), -4, v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      (*(void (**)(void))(v9[4] + 16))();
      v7 = (void *)v9[4];
      v9[4] = 0;

      v2 = v9;
    }
    v8 = (void *)v2[8];
    v2[8] = 0;

    v2 = v9;
  }

}

@end
