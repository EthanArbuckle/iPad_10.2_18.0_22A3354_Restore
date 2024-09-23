@implementation AWUnitTestFaceDetectOperation

- (AWUnitTestFaceDetectOperation)init
{
  id v2;
  dispatch_queue_t v3;
  void *v4;
  const dispatch_source_type_s *v5;
  dispatch_source_t v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  dispatch_source_t v10;
  void *v11;
  NSObject *v12;
  dispatch_source_t v13;
  void *v14;
  NSObject *v15;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD handler[4];
  id v22;
  id location;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)AWUnitTestFaceDetectOperation;
  v2 = -[AWUnitTestFaceDetectOperation init](&v24, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AttentionAwareness.AWUnitTestFaceDetectOperation", 0);
    v4 = (void *)*((_QWORD *)v2 + 11);
    *((_QWORD *)v2 + 11) = v3;

    objc_initWeak(&location, v2);
    v5 = (const dispatch_source_type_s *)MEMORY[0x1E0C80DD0];
    v6 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *((dispatch_queue_t *)v2 + 11));
    v7 = (void *)*((_QWORD *)v2 + 12);
    *((_QWORD *)v2 + 12) = v6;

    v8 = *((_QWORD *)v2 + 12);
    v9 = MEMORY[0x1E0C809B0];
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __37__AWUnitTestFaceDetectOperation_init__block_invoke;
    handler[3] = &unk_1E5F8E658;
    objc_copyWeak(&v22, &location);
    dispatch_source_set_event_handler(v8, handler);
    v10 = dispatch_source_create(v5, 0, 0, *((dispatch_queue_t *)v2 + 11));
    v11 = (void *)*((_QWORD *)v2 + 13);
    *((_QWORD *)v2 + 13) = v10;

    v12 = *((_QWORD *)v2 + 13);
    v19[0] = v9;
    v19[1] = 3221225472;
    v19[2] = __37__AWUnitTestFaceDetectOperation_init__block_invoke_2;
    v19[3] = &unk_1E5F8E658;
    objc_copyWeak(&v20, &location);
    dispatch_source_set_event_handler(v12, v19);
    v13 = dispatch_source_create(v5, 0, 0, *((dispatch_queue_t *)v2 + 11));
    v14 = (void *)*((_QWORD *)v2 + 14);
    *((_QWORD *)v2 + 14) = v13;

    v15 = *((_QWORD *)v2 + 14);
    v17[0] = v9;
    v17[1] = 3221225472;
    v17[2] = __37__AWUnitTestFaceDetectOperation_init__block_invoke_3;
    v17[3] = &unk_1E5F8E658;
    objc_copyWeak(&v18, &location);
    dispatch_source_set_event_handler(v15, v17);
    *((_BYTE *)v2 + 122) = 0;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
  }
  return (AWUnitTestFaceDetectOperation *)v2;
}

- (void)dealloc
{
  NSObject *awInitTimer;
  NSObject *deadlineTimer;
  NSObject *streamingTimer;
  objc_super v6;

  awInitTimer = self->_awInitTimer;
  if (awInitTimer)
    dispatch_source_cancel(awInitTimer);
  deadlineTimer = self->_deadlineTimer;
  if (deadlineTimer)
    dispatch_source_cancel(deadlineTimer);
  streamingTimer = self->_streamingTimer;
  if (streamingTimer)
    dispatch_source_cancel(streamingTimer);
  v6.receiver = self;
  v6.super_class = (Class)AWUnitTestFaceDetectOperation;
  -[BKOperation dealloc](&v6, sel_dealloc);
}

- (int64_t)state
{
  NSObject *awQueue;
  int64_t v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 1;
  awQueue = self->_awQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AWUnitTestFaceDetectOperation_state__block_invoke;
  v5[3] = &unk_1E5F8EAC0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(awQueue, v5);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (BOOL)startWithError:(id *)a3
{
  NSObject *v4;
  unint64_t v5;
  double v6;
  uint64_t v7;
  NSObject *awInitTimer;
  dispatch_time_t v9;
  double v10;
  double v11;
  id WeakRetained;
  uint64_t v13;
  int64_t v14;
  NSObject *deadlineTimer;
  dispatch_time_t v16;
  int v18;
  double v19;
  __int16 v20;
  AWUnitTestFaceDetectOperation *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = absTimeNS();
      if (v5 == -1)
        v6 = INFINITY;
      else
        v6 = (double)v5 / 1000000000.0;
      -[BKFaceDetectOperation timeout](self, "timeout");
      v18 = 134218496;
      v19 = v6;
      v20 = 2048;
      v21 = self;
      v22 = 2048;
      v23 = v7;
      _os_log_impl(&dword_1AF589000, v4, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: start operation %p with timeout %f", (uint8_t *)&v18, 0x20u);
    }

  }
  self->_started = 1;
  awInitTimer = self->_awInitTimer;
  v9 = dispatch_time(0, 500000000);
  dispatch_source_set_timer(awInitTimer, v9, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_awInitTimer);
  -[BKFaceDetectOperation timeout](self, "timeout");
  v11 = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_unitTestDevice);
  v13 = objc_msgSend(WeakRetained, "sampleStatsPtr");
  if (v11 == 0.0)
  {
    ++*(_QWORD *)(v13 + 16);

    v14 = 1000000000;
  }
  else
  {
    ++*(_QWORD *)(v13 + 8);

    v14 = (uint64_t)(v11 * 1000000000.0);
  }
  deadlineTimer = self->_deadlineTimer;
  v16 = dispatch_time(0, v14);
  dispatch_source_set_timer(deadlineTimer, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_resume((dispatch_object_t)self->_deadlineTimer);
  dispatch_activate((dispatch_object_t)self->_streamingTimer);
  return 1;
}

- (BOOL)startStreamWithError:(id *)a3
{
  NSObject *v5;
  unint64_t v6;
  double v7;
  _BOOL4 v8;
  const char *v9;
  NSObject *awQueue;
  uint64_t v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];
  _QWORD block[6];
  uint64_t v19;
  const __CFString *v20;
  _BYTE buf[24];
  char v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = absTimeNS();
      if (v6 == -1)
        v7 = INFINITY;
      else
        v7 = (double)v6 / 1000000000.0;
      v8 = -[BKFaceDetectOperation eyeRelief](self, "eyeRelief");
      v9 = "without";
      if (v8)
        v9 = "with";
      *(_DWORD *)buf = 134218242;
      *(double *)&buf[4] = v7;
      *(_WORD *)&buf[12] = 2080;
      *(_QWORD *)&buf[14] = v9;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: Starting stream %s eyeRelief", buf, 0x16u);
    }

  }
  dispatch_activate((dispatch_object_t)self->_awInitTimer);
  dispatch_activate((dispatch_object_t)self->_deadlineTimer);
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v22 = 0;
  awQueue = self->_awQueue;
  v11 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke;
  block[3] = &unk_1E5F8EAC0;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(awQueue, block);
  v12 = *(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    -[BKOperation queue](self, "queue");
    v13 = objc_claimAutoreleasedReturnValue();
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke_2;
    v17[3] = &unk_1E5F8EC18;
    v17[4] = self;
    dispatch_sync(v13, v17);

    v14 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0CB2D50];
    v20 = CFSTR(" Pearl is in error state");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 1, v15);
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    dispatch_source_set_timer((dispatch_source_t)self->_streamingTimer, 0, 0x1DCD6500uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_streamingTimer);
  }
  _Block_object_dispose(buf, 8);
  return v12 == 0;
}

- (void)setErrorState:(BOOL)a3
{
  NSObject *awQueue;
  _QWORD v4[5];
  BOOL v5;

  awQueue = self->_awQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __47__AWUnitTestFaceDetectOperation_setErrorState___block_invoke;
  v4[3] = &unk_1E5F8EB88;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(awQueue, v4);
}

- (void)awDeliverStreamingEvent
{
  NSObject *v3;
  unint64_t v4;
  double v5;
  id v6;
  _BOOL4 v7;
  float v8;
  double v9;
  void *v10;
  NSObject *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  double v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = absTimeNS();
      if (v4 == -1)
        v5 = INFINITY;
      else
        v5 = (double)v4 / 1000000000.0;
      *(_DWORD *)buf = 134217984;
      v16 = v5;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: Delivering streaming event", buf, 0xCu);
    }

  }
  v6 = objc_alloc(MEMORY[0x1E0D02820]);
  v7 = -[BKFaceDetectOperation eyeRelief](self, "eyeRelief");
  if (v7)
    v8 = 100.0;
  else
    v8 = 0.0;
  objc_msgSend(v6, "setEyeReliefStatus:", v7);
  *(float *)&v9 = v8;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDistance:", v10);

  -[BKOperation queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __56__AWUnitTestFaceDetectOperation_awDeliverStreamingEvent__block_invoke;
  v13[3] = &unk_1E5F8EC40;
  v13[4] = self;
  v14 = v6;
  v12 = v6;
  dispatch_sync(v11, v13);

}

- (void)startWithReply:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t);
  void *v15;
  AWUnitTestFaceDetectOperation *v16;
  id v17;
  _QWORD v18[5];
  id v19;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke;
  v18[3] = &unk_1E5F8EB38;
  v18[4] = self;
  v6 = v4;
  v19 = v6;
  v7 = (void *)MEMORY[0x1B5DF9110](v18);
  v12 = v5;
  v13 = 3221225472;
  v14 = __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke_2;
  v15 = &unk_1E5F8EB38;
  v16 = self;
  v17 = v6;
  v8 = v6;
  v9 = (void *)MEMORY[0x1B5DF9110](&v12);
  dispatch_get_global_queue(0, 0);
  v10 = objc_claimAutoreleasedReturnValue();
  if (-[BKFaceDetectOperation mode](self, "mode", v12, v13, v14, v15, v16) == 1)
    v11 = v9;
  else
    v11 = v7;
  dispatch_async(v10, v11);

}

- (void)awFinishWithReason:(int64_t)a3
{
  NSObject *v5;
  unint64_t v6;
  double v7;
  NSObject *v8;
  _QWORD v9[6];
  uint8_t buf[4];
  double v11;
  __int16 v12;
  char *EndReasonDescription;
  __int16 v14;
  AWUnitTestFaceDetectOperation *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_awQueue);
  if (self->_finished)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v6 = absTimeNS();
        if (v6 == -1)
          v7 = INFINITY;
        else
          v7 = (double)v6 / 1000000000.0;
        *(_DWORD *)buf = 134218498;
        v11 = v7;
        v12 = 2080;
        EndReasonDescription = getEndReasonDescription(a3);
        v14 = 2048;
        v15 = self;
        _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: %s for already finished operation %p", buf, 0x20u);
      }

    }
  }
  else
  {
    self->_finished = 1;
    dispatch_source_cancel((dispatch_source_t)self->_awInitTimer);
    dispatch_source_cancel((dispatch_source_t)self->_deadlineTimer);
    -[BKOperation queue](self, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __52__AWUnitTestFaceDetectOperation_awFinishWithReason___block_invoke;
    v9[3] = &unk_1E5F8EB10;
    v9[4] = self;
    v9[5] = a3;
    dispatch_async(v8, v9);

    dispatch_source_cancel((dispatch_source_t)self->_streamingTimer);
  }
}

- (void)awDeliverFaceFound
{
  NSObject *v3;
  unint64_t v4;
  double v5;
  void *v6;
  int v7;
  double v8;
  __int16 v9;
  AWUnitTestFaceDetectOperation *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_awQueue);
  if (self->_finished)
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v4 = absTimeNS();
        if (v4 == -1)
          v5 = INFINITY;
        else
          v5 = (double)v4 / 1000000000.0;
        v7 = 134218240;
        v8 = v5;
        v9 = 2048;
        v10 = self;
        _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: face found for already finished operation %p", (uint8_t *)&v7, 0x16u);
      }

    }
  }
  else
  {
    +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deliverPearlDeviceEvent:", 3);

    -[AWUnitTestFaceDetectOperation awFinishWithReason:](self, "awFinishWithReason:", 1);
  }
}

- (void)cancel
{
  NSObject *awQueue;
  _QWORD block[5];

  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __39__AWUnitTestFaceDetectOperation_cancel__block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  dispatch_sync(awQueue, block);
}

- (void)awSetFaceFound
{
  NSObject *awQueue;
  _QWORD block[5];

  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AWUnitTestFaceDetectOperation_awSetFaceFound__block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  dispatch_sync(awQueue, block);
}

- (void)awSetFaceDetectError:(BOOL)a3
{
  NSObject *awQueue;
  _QWORD v4[5];
  BOOL v5;

  awQueue = self->_awQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __54__AWUnitTestFaceDetectOperation_awSetFaceDetectError___block_invoke;
  v4[3] = &unk_1E5F8EB88;
  v4[4] = self;
  v5 = a3;
  dispatch_sync(awQueue, v4);
}

- (AWUnitTestPearlDevice)unitTestDevice
{
  return (AWUnitTestPearlDevice *)objc_loadWeakRetained((id *)&self->_unitTestDevice);
}

- (void)setUnitTestDevice:(id)a3
{
  objc_storeWeak((id *)&self->_unitTestDevice, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_unitTestDevice);
  objc_storeStrong((id *)&self->_streamingTimer, 0);
  objc_storeStrong((id *)&self->_deadlineTimer, 0);
  objc_storeStrong((id *)&self->_awInitTimer, 0);
  objc_storeStrong((id *)&self->_awQueue, 0);
}

uint64_t __54__AWUnitTestFaceDetectOperation_awSetFaceDetectError___block_invoke(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  void *v6;
  int v7;
  double v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(result + 32) + 122) = *(_BYTE *)(result + 40);
  if (*(_BYTE *)(result + 40))
  {
    v1 = result;
    result = objc_msgSend(*(id *)(result + 32), "mode");
    if (result != 1)
    {
      if (currentLogLevel >= 6)
      {
        _AALog();
        v2 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
        {
          v3 = absTimeNS();
          if (v3 == -1)
            v4 = INFINITY;
          else
            v4 = (double)v3 / 1000000000.0;
          v5 = *(_QWORD *)(v1 + 32);
          v7 = 134218240;
          v8 = v4;
          v9 = 2048;
          v10 = v5;
          _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: delivering error for operation %p", (uint8_t *)&v7, 0x16u);
        }

      }
      +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "deliverPearlDeviceState:", 5);

      return objc_msgSend(*(id *)(v1 + 32), "awFinishWithReason:", 3);
    }
  }
  return result;
}

uint64_t __47__AWUnitTestFaceDetectOperation_awSetFaceFound__block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  int v7;
  double v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      v5 = *(_QWORD *)(a1 + 32);
      v7 = 134218240;
      v8 = v4;
      v9 = 2048;
      v10 = v5;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: delivering face present event for operation %p", (uint8_t *)&v7, 0x16u);
    }

  }
  return objc_msgSend(*(id *)(a1 + 32), "awDeliverFaceFound");
}

uint64_t __39__AWUnitTestFaceDetectOperation_cancel__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "awFinishWithReason:", 2);
}

void __52__AWUnitTestFaceDetectOperation_awFinishWithReason___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  char *EndReasonDescription;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  if (currentLogLevel >= 6)
  {
    _AALog();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      v3 = absTimeNS();
      if (v3 == -1)
        v4 = INFINITY;
      else
        v4 = (double)v3 / 1000000000.0;
      EndReasonDescription = getEndReasonDescription(*(_QWORD *)(a1 + 40));
      v6 = *(_QWORD *)(a1 + 32);
      v10 = 134218498;
      v11 = v4;
      v12 = 2080;
      v13 = EndReasonDescription;
      v14 = 2048;
      v15 = v6;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: delivering %s for operation %p", (uint8_t *)&v10, 0x20u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_respondsToSelector();

  if ((v8 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "operation:finishedWithReason:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

void __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "startWithError:", &v4);
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __48__AWUnitTestFaceDetectOperation_startWithReply___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v4 = 0;
  objc_msgSend(v2, "startStreamWithError:", &v4);
  v3 = v4;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __56__AWUnitTestFaceDetectOperation_awDeliverStreamingEvent__block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "operation:faceDetectStateChanged:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
}

uint64_t __47__AWUnitTestFaceDetectOperation_setErrorState___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 122) = *(_BYTE *)(result + 40);
  return result;
}

uint64_t __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(result + 32) + 122);
  return result;
}

void __54__AWUnitTestFaceDetectOperation_startStreamWithError___block_invoke_2(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_respondsToSelector();

  if ((v3 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "operation:finishedWithReason:", *(_QWORD *)(a1 + 32), 3);

  }
}

uint64_t __38__AWUnitTestFaceDetectOperation_state__block_invoke(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(result + 32);
  if (*(_BYTE *)(v1 + 121))
  {
    v2 = 4;
  }
  else
  {
    if (!*(_BYTE *)(v1 + 120))
      return result;
    v2 = 2;
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = v2;
  return result;
}

void __37__AWUnitTestFaceDetectOperation_init__block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  void *v4;
  void *v5;
  int v6;
  id WeakRetained;

  +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "pearlError");

  +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "deliverPearlDeviceState:", 5);

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    objc_msgSend(WeakRetained, "awFinishWithReason:", 3);
  }
  else
  {
    v6 = objc_msgSend(v4, "facePresent");

    if (v6)
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
      objc_msgSend(WeakRetained, "awDeliverFaceFound");
    }
    else
    {
      +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
      WeakRetained = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "deliverPearlDeviceEvent:", 2);
    }
  }

}

void __37__AWUnitTestFaceDetectOperation_init__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "awFinishWithReason:", 4);

}

void __37__AWUnitTestFaceDetectOperation_init__block_invoke_3(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "awDeliverStreamingEvent");

}

@end
