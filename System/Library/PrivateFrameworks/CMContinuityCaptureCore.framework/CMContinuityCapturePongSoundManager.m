@implementation CMContinuityCapturePongSoundManager

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_8 != -1)
    dispatch_once(&sharedInstance_onceToken_8, &__block_literal_global_22);
  return (id)_pongSoundManager;
}

void __53__CMContinuityCapturePongSoundManager_sharedInstance__block_invoke()
{
  CMContinuityCapturePongSoundManager *v0;
  void *v1;

  v0 = objc_alloc_init(CMContinuityCapturePongSoundManager);
  v1 = (void *)_pongSoundManager;
  _pongSoundManager = (uint64_t)v0;

}

- (CMContinuityCapturePongSoundManager)init
{
  CMContinuityCapturePongSoundManager *v2;
  CMContinuityCapturePongSoundManager *v3;
  CMContinuityCaptureProximityMonitor *v4;
  uint64_t v5;
  CMContinuityCaptureProximityMonitor *proximityMonitor;
  uint64_t v7;
  OS_dispatch_queue *internalQueue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CMContinuityCapturePongSoundManager;
  v2 = -[CMContinuityCapturePongSoundManager init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    if (-[CMContinuityCapturePongSoundManager _shouldUseNearbyInteractionToDeterminePongSound](v2, "_shouldUseNearbyInteractionToDeterminePongSound"))
    {
      v4 = [CMContinuityCaptureProximityMonitor alloc];
      v5 = -[CMContinuityCaptureProximityMonitor initWithQueue:delegate:](v4, "initWithQueue:delegate:", MEMORY[0x24BDAC9B8], v3);
      proximityMonitor = v3->_proximityMonitor;
      v3->_proximityMonitor = (CMContinuityCaptureProximityMonitor *)v5;

    }
    v7 = FigDispatchQueueCreateWithPriority();
    internalQueue = v3->_internalQueue;
    v3->_internalQueue = (OS_dispatch_queue *)v7;

  }
  return v3;
}

- (void)waitForPongCompletion:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;
  uint8_t buf[4];
  CMContinuityCapturePongSoundManager *v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v13 = self;
    v14 = 2080;
    v15 = "-[CMContinuityCapturePongSoundManager waitForPongCompletion:]";
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s start", buf, 0x16u);
  }

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_internalQueue);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__CMContinuityCapturePongSoundManager_waitForPongCompletion___block_invoke;
  block[3] = &unk_24F06B548;
  objc_copyWeak(&v10, &location);
  v9 = v4;
  v7 = v4;
  dispatch_async_and_wait(internalQueue, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

uint64_t __61__CMContinuityCapturePongSoundManager_waitForPongCompletion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v5;
  id v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 134218242;
    v6 = WeakRetained;
    v7 = 2080;
    v8 = "-[CMContinuityCapturePongSoundManager waitForPongCompletion:]_block_invoke";
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s end", (uint8_t *)&v5, 0x16u);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)acquireSystemPongAssertion
{
  NSObject *v3;
  CMContinuityCapturePongSoundManager *v4;
  dispatch_semaphore_t v5;
  OS_dispatch_semaphore *pongAssertSemaphore;
  NSObject *internalQueue;
  _QWORD block[5];
  uint8_t buf[4];
  CMContinuityCapturePongSoundManager *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v10 = self;
    v11 = 2080;
    v12 = "-[CMContinuityCapturePongSoundManager acquireSystemPongAssertion]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s", buf, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  v5 = dispatch_semaphore_create(0);
  pongAssertSemaphore = v4->_pongAssertSemaphore;
  v4->_pongAssertSemaphore = (OS_dispatch_semaphore *)v5;

  objc_sync_exit(v4);
  internalQueue = v4->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __65__CMContinuityCapturePongSoundManager_acquireSystemPongAssertion__block_invoke;
  block[3] = &unk_24F06AEB0;
  block[4] = v4;
  dispatch_async(internalQueue, block);
}

void __65__CMContinuityCapturePongSoundManager_acquireSystemPongAssertion__block_invoke(uint64_t a1)
{
  id v2;
  dispatch_time_t v3;
  NSObject *dsema;

  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  dsema = *(id *)(*(_QWORD *)(a1 + 32) + 32);
  objc_sync_exit(v2);

  if (dsema)
  {
    v3 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(dsema, v3);
  }

}

- (void)releaseSystemPongAssertion
{
  NSObject *v3;
  CMContinuityCapturePongSoundManager *v4;
  NSObject *pongAssertSemaphore;
  OS_dispatch_semaphore *v6;
  int v7;
  CMContinuityCapturePongSoundManager *v8;
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218242;
    v8 = self;
    v9 = 2080;
    v10 = "-[CMContinuityCapturePongSoundManager releaseSystemPongAssertion]";
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %s", (uint8_t *)&v7, 0x16u);
  }

  v4 = self;
  objc_sync_enter(v4);
  pongAssertSemaphore = v4->_pongAssertSemaphore;
  if (pongAssertSemaphore)
  {
    dispatch_semaphore_signal(pongAssertSemaphore);
    v6 = v4->_pongAssertSemaphore;
    v4->_pongAssertSemaphore = 0;

  }
  objc_sync_exit(v4);

}

- (void)pongIfNeededWithShouldConsiderPongHistory:(BOOL)a3 forIdentifier:(id)a4
{
  id v6;
  NSObject *internalQueue;
  id v8;
  _QWORD block[5];
  id v10;
  BOOL v11;

  v6 = a4;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __95__CMContinuityCapturePongSoundManager_pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke;
  block[3] = &unk_24F06AF78;
  v11 = a3;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(internalQueue, block);

}

uint64_t __95__CMContinuityCapturePongSoundManager_pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_pongIfNeededWithShouldConsiderPongHistory:forIdentifier:", *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

- (void)_pongIfNeededWithShouldConsiderPongHistory:(BOOL)a3 forIdentifier:(id)a4
{
  _BOOL4 v4;
  char *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  CMContinuityCaptureProximityMonitor *v10;
  CMContinuityCaptureProximityMonitor *v11;
  CMContinuityCaptureProximityMonitor *proximityMonitor;
  OS_dispatch_source *v13;
  OS_dispatch_source *proximityTimer;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  NSObject *v18;
  _QWORD handler[5];
  char *v20;
  id v21;
  _BYTE buf[12];
  __int16 v23;
  const char *v24;
  __int16 v25;
  char *v26;
  uint64_t v27;

  v4 = a3;
  v27 = *MEMORY[0x24BDAC8D0];
  v6 = (char *)a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  CMContinuityCaptureLog(0);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    *(_QWORD *)&buf[4] = self;
    v23 = 2112;
    v24 = v6;
    v25 = 1024;
    LODWORD(v26) = v4;
    _os_log_impl(&dword_227C5D000, v7, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] checking whether need to play pong for Identifier %@, should consider pong history: %d", buf, 0x1Cu);
  }

  if (v4 && -[NSString isEqualToString:](self->_playedPongForIdentifier, "isEqualToString:", v6))
  {
    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      *(_QWORD *)&buf[4] = self;
      v23 = 2080;
      v24 = "-[CMContinuityCapturePongSoundManager _pongIfNeededWithShouldConsiderPongHistory:forIdentifier:]";
      v25 = 2112;
      v26 = v6;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ %s [pong-check] Already ponged for %@, do not pong again", buf, 0x20u);
    }

  }
  else if (-[CMContinuityCapturePongSoundManager _shouldUseNearbyInteractionToDeterminePongSound](self, "_shouldUseNearbyInteractionToDeterminePongSound"))
  {
    if (!self->_proximityMonitor)
    {
      CMContinuityCaptureLog(0);
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = self;
        _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] restarting proximity monitor", buf, 0xCu);
      }

      v10 = [CMContinuityCaptureProximityMonitor alloc];
      v11 = -[CMContinuityCaptureProximityMonitor initWithQueue:delegate:](v10, "initWithQueue:delegate:", MEMORY[0x24BDAC9B8], self);
      proximityMonitor = self->_proximityMonitor;
      self->_proximityMonitor = v11;

    }
    if (!self->_proximityTimer)
    {
      v13 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
      proximityTimer = self->_proximityTimer;
      self->_proximityTimer = v13;

      v15 = self->_proximityTimer;
      v16 = dispatch_time(0, 5000000000);
      dispatch_source_set_timer(v15, v16, 0xFFFFFFFFFFFFFFFFLL, 0);
      *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
      objc_initWeak((id *)buf, self);
      v17 = self->_proximityTimer;
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __96__CMContinuityCapturePongSoundManager__pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke;
      handler[3] = &unk_24F06BAB0;
      handler[4] = self;
      v20 = v6;
      objc_copyWeak(&v21, (id *)buf);
      dispatch_source_set_event_handler(v17, handler);
      dispatch_resume((dispatch_object_t)self->_proximityTimer);
      objc_destroyWeak(&v21);

      objc_destroyWeak((id *)buf);
    }
    -[CMContinuityCaptureProximityMonitor beginTracking:](self->_proximityMonitor, "beginTracking:", v6);
  }
  else
  {
    CMContinuityCaptureLog(0);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = self;
      _os_log_impl(&dword_227C5D000, v18, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] Not using NearbyInteraction to determine whether pong sound is played. Go ahead and play it.", buf, 0xCu);
    }

    -[CMContinuityCapturePongSoundManager _playPongSoundForIdentifier:](self, "_playPongSoundForIdentifier:", v6);
  }

}

void __96__CMContinuityCapturePongSoundManager__pongIfNeededWithShouldConsiderPongHistory_forIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  id WeakRetained;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    v6 = 134218242;
    v7 = v3;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %@ did not get proximity update in time, assume the device is too far away", (uint8_t *)&v6, 0x16u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "device:isNearby:", *(_QWORD *)(a1 + 40), 0);

}

- (BOOL)_shouldUseNearbyInteractionToDeterminePongSound
{
  return 0;
}

- (void)_playPongSoundForIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  dispatch_semaphore_t v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  NSString *playedPongForIdentifier;
  id v11;
  _QWORD v12[4];
  id v13;
  NSObject *v14;
  id v15;
  id location;
  uint8_t buf[4];
  CMContinuityCapturePongSoundManager *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v18 = self;
    v19 = 2112;
    v20 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] playing pong sound for %@", buf, 0x16u);
  }

  v6 = dispatch_semaphore_create(0);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __67__CMContinuityCapturePongSoundManager__playPongSoundForIdentifier___block_invoke;
  v12[3] = &unk_24F06AF00;
  objc_copyWeak(&v15, &location);
  v7 = v4;
  v13 = v7;
  v8 = v6;
  v14 = v8;
  AudioServicesPlaySystemSoundWithCompletion(0x424u, v12);
  v9 = dispatch_time(0, 5000000000);
  dispatch_semaphore_wait(v8, v9);
  playedPongForIdentifier = self->_playedPongForIdentifier;
  self->_playedPongForIdentifier = (NSString *)v7;
  v11 = v7;

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

intptr_t __67__CMContinuityCapturePongSoundManager__playPongSoundForIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  uint64_t v4;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(0);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 134218242;
    v7 = WeakRetained;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] pong sound is done being played for %@", (uint8_t *)&v6, 0x16u);

  }
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)device:(id)a3 isNearby:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  NSObject *proximityTimer;
  OS_dispatch_source *v11;
  CMContinuityCaptureProximityMonitor *proximityMonitor;
  NSObject *internalQueue;
  _QWORD block[4];
  id v15;
  id v16;
  id location;
  uint8_t buf[4];
  CMContinuityCapturePongSoundManager *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  _BOOL4 v23;
  uint64_t v24;

  v4 = a4;
  v24 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v7 = MEMORY[0x24BDAC9B8];
  v8 = MEMORY[0x24BDAC9B8];
  dispatch_assert_queue_V2(v7);

  CMContinuityCaptureLog(0);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218498;
    v19 = self;
    v20 = 2112;
    v21 = v6;
    v22 = 1024;
    v23 = v4;
    _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "<%p> [pong-check] %@ got proximity update: nearby %d", buf, 0x1Cu);
  }

  proximityTimer = self->_proximityTimer;
  if (proximityTimer)
  {
    dispatch_source_cancel(proximityTimer);
    v11 = self->_proximityTimer;
    self->_proximityTimer = 0;

  }
  -[CMContinuityCaptureProximityMonitor endTracking:](self->_proximityMonitor, "endTracking:", v6);
  proximityMonitor = self->_proximityMonitor;
  self->_proximityMonitor = 0;

  if (!v4)
  {
    internalQueue = self->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __55__CMContinuityCapturePongSoundManager_device_isNearby___block_invoke;
    block[3] = &unk_24F06AE88;
    objc_copyWeak(&v16, &location);
    v15 = v6;
    dispatch_async(internalQueue, block);

    objc_destroyWeak(&v16);
  }
  objc_destroyWeak(&location);

}

void __55__CMContinuityCapturePongSoundManager_device_isNearby___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "_playPongSoundForIdentifier:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong((id *)&self->_pongAssertSemaphore, 0);
  objc_storeStrong((id *)&self->_proximityTimer, 0);
  objc_storeStrong((id *)&self->_proximityMonitor, 0);
  objc_storeStrong((id *)&self->_playedPongForIdentifier, 0);
}

@end
