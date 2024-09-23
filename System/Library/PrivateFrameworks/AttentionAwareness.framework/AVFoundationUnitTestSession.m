@implementation AVFoundationUnitTestSession

- (AVFoundationUnitTestSession)init
{
  AVFoundationUnitTestSession *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  AVFoundationUnitTestEventReceiving *delegate;
  OS_dispatch_queue *eventDeliveryQueue;
  NSObject *v7;
  unint64_t v8;
  double v9;
  objc_super v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  AVFoundationUnitTestSession *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)AVFoundationUnitTestSession;
  v2 = -[AVFoundationUnitTestSession init](&v11, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AttentionAwareness.AVFoundationUnitTestSession", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    delegate = v2->_delegate;
    v2->_delegate = 0;

    eventDeliveryQueue = v2->_eventDeliveryQueue;
    v2->_eventDeliveryQueue = 0;

    *(_WORD *)&v2->_currentOptions.AWAttentionStreamerActivateEyeRelief = 0;
    v2->_errorState = 0;
  }
  if (currentLogLevel >= 6)
  {
    _AALog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = absTimeNS();
      if (v8 == -1)
        v9 = INFINITY;
      else
        v9 = (double)v8 / 1000000000.0;
      *(_DWORD *)buf = 134218242;
      v13 = v9;
      v14 = 2112;
      v15 = v2;
      _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: Initializing AVFoundationUnitTestSession %@", buf, 0x16u);
    }

  }
  return v2;
}

- (void)initializeStreamingTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *streamingTimer;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id location;

  objc_initWeak(&location, self);
  v3 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_queue);
  streamingTimer = self->_streamingTimer;
  self->_streamingTimer = v3;

  v5 = self->_streamingTimer;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __55__AVFoundationUnitTestSession_initializeStreamingTimer__block_invoke;
  v6[3] = &unk_1E5F8E658;
  objc_copyWeak(&v7, &location);
  dispatch_source_set_event_handler(v5, v6);
  dispatch_source_set_timer((dispatch_source_t)self->_streamingTimer, 0, 0x1DCD6500uLL, 0x3B9ACA00uLL);
  dispatch_resume((dispatch_object_t)self->_streamingTimer);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

- (void)AVFoundationDeliverStreamingEvent
{
  NSObject *v3;
  unint64_t v4;
  double v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
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
      v6 = 134217984;
      v7 = v5;
      _os_log_impl(&dword_1AF589000, v3, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: Delivering streaming event for AVFoundation", (uint8_t *)&v6, 0xCu);
    }

  }
  -[AVFoundationUnitTestEventReceiving receiveStreamingEvent](self->_delegate, "receiveStreamingEvent");
}

- (void)setAVFoundationDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (BOOL)startUnitTestStream:(id)a3 options:(id)a4
{
  id v5;
  NSObject *queue;
  int v7;
  NSObject *v8;
  unint64_t v9;
  double v10;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;
  uint8_t buf[4];
  double v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __59__AVFoundationUnitTestSession_startUnitTestStream_options___block_invoke;
  v12[3] = &unk_1E5F8EAC0;
  v12[4] = self;
  v12[5] = &v13;
  dispatch_sync(queue, v12);
  v7 = *((unsigned __int8 *)v14 + 24);
  if (*((_BYTE *)v14 + 24))
  {
    if (currentLogLevel >= 6)
    {
      _AALog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = absTimeNS();
        if (v9 == -1)
          v10 = INFINITY;
        else
          v10 = (double)v9 / 1000000000.0;
        *(_DWORD *)buf = 134217984;
        v18 = v10;
        _os_log_impl(&dword_1AF589000, v8, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: Not starting an AVFoundation streaming operation because of error state", buf, 0xCu);
      }

    }
  }
  else
  {
    -[AVFoundationUnitTestSession initializeStreamingTimer](self, "initializeStreamingTimer");
  }
  _Block_object_dispose(&v13, 8);

  return v7 == 0;
}

- (BOOL)cancelUnitTestStream
{
  OS_dispatch_source *streamingTimer;

  dispatch_source_cancel((dispatch_source_t)self->_streamingTimer);
  streamingTimer = self->_streamingTimer;
  self->_streamingTimer = 0;

  return 1;
}

- (void)setErrorState:(BOOL)a3
{
  NSObject *queue;
  NSObject *v5;
  unint64_t v6;
  double v7;
  _BOOL4 errorState;
  const char *v9;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  AVFoundationUnitTestSession *v15;
  __int16 v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  queue = self->_queue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__AVFoundationUnitTestSession_setErrorState___block_invoke;
  v10[3] = &unk_1E5F8EB88;
  v10[4] = self;
  v11 = a3;
  dispatch_sync(queue, v10);
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
      errorState = self->_errorState;
      *(_DWORD *)buf = 134218498;
      if (errorState)
        v9 = "true";
      else
        v9 = "false";
      v13 = v7;
      v14 = 2112;
      v15 = self;
      v16 = 2080;
      v17 = v9;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: %@ setting error state to %s", buf, 0x20u);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_streamingTimer, 0);
  objc_storeStrong((id *)&self->_eventDeliveryQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __45__AVFoundationUnitTestSession_setErrorState___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 43) = *(_BYTE *)(result + 40);
  return result;
}

void __59__AVFoundationUnitTestSession_startUnitTestStream_options___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  int v8;
  double v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(a1 + 32) + 43);
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
      v6 = "true";
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        v7 = "true";
      else
        v7 = "false";
      if (!*(_BYTE *)(v5 + 43))
        v6 = "false";
      v8 = 134218754;
      v9 = v4;
      v10 = 2112;
      v11 = v5;
      v12 = 2080;
      v13 = v7;
      v14 = 2080;
      v15 = v6;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: startUnitTestStream called for %@, localErrorState: %s _errorState: %s", (uint8_t *)&v8, 0x2Au);
    }

  }
}

void __55__AVFoundationUnitTestSession_initializeStreamingTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "AVFoundationDeliverStreamingEvent");

}

@end
