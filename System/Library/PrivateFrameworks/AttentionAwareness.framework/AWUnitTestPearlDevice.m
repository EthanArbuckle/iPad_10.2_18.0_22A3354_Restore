@implementation AWUnitTestPearlDevice

- (AWUnitTestPearlDevice)init
{
  AWUnitTestPearlDevice *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *awQueue;
  uint64_t v5;
  NSMutableArray *displayCallbacks;
  uint64_t v7;
  NSMutableArray *smarCoverCallbacks;
  uint64_t v9;
  NSMutableArray *carplayCallbacks;
  AVFoundationUnitTestSession *v11;
  AVFoundationUnitTestSession *AVFoundationSession;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)AWUnitTestPearlDevice;
  v2 = -[AWUnitTestPearlDevice init](&v14, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.AttentionAwareness.AWUnitTestPearlDevice", 0);
    awQueue = v2->_awQueue;
    v2->_awQueue = (OS_dispatch_queue *)v3;

    v2->_sampleStatsPtr = ($F99D9A4FB75BC57F3386B8DC8EE08D7A *)&v2->_sampleStats;
    v2->_pearlError = 0;
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    displayCallbacks = v2->_displayCallbacks;
    v2->_displayCallbacks = (NSMutableArray *)v5;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = objc_claimAutoreleasedReturnValue();
    smarCoverCallbacks = v2->_smarCoverCallbacks;
    v2->_smarCoverCallbacks = (NSMutableArray *)v7;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v9 = objc_claimAutoreleasedReturnValue();
    carplayCallbacks = v2->_carplayCallbacks;
    v2->_carplayCallbacks = (NSMutableArray *)v9;

    v11 = objc_alloc_init(AVFoundationUnitTestSession);
    AVFoundationSession = v2->_AVFoundationSession;
    v2->_AVFoundationSession = v11;

  }
  return v2;
}

- (id)AVFoundationSession
{
  return self->_AVFoundationSession;
}

- (id)createPresenceDetectOperationWithError:(id *)a3
{
  NSObject *awQueue;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__1552;
  v11 = __Block_byref_object_dispose__1553;
  v12 = 0;
  awQueue = self->_awQueue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __64__AWUnitTestPearlDevice_createPresenceDetectOperationWithError___block_invoke;
  v6[3] = &unk_1E5F8EAC0;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(awQueue, v6);
  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

- (void)deliverPearlDeviceEvent:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[AWUnitTestPearlDevice queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AWUnitTestPearlDevice_deliverPearlDeviceEvent___block_invoke;
  v6[3] = &unk_1E5F8EB10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)deliverPearlDeviceState:(int64_t)a3
{
  NSObject *v5;
  _QWORD v6[6];

  -[AWUnitTestPearlDevice queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__AWUnitTestPearlDevice_deliverPearlDeviceState___block_invoke;
  v6[3] = &unk_1E5F8EB10;
  v6[4] = self;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

- (void)getStatsWithBlock:(id)a3
{
  id v4;
  NSObject *awQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__AWUnitTestPearlDevice_getStatsWithBlock___block_invoke;
  block[3] = &unk_1E5F8EB38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(awQueue, block);

}

- (void)resetStats
{
  NSObject *awQueue;
  _QWORD block[5];

  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__AWUnitTestPearlDevice_resetStats__block_invoke;
  block[3] = &unk_1E5F8EC18;
  block[4] = self;
  dispatch_sync(awQueue, block);
}

- (void)setSampleState:(BOOL)a3
{
  -[AWUnitTestPearlDevice setSampleState:deliverEvent:](self, "setSampleState:deliverEvent:", a3, 1);
}

- (void)setSampleState:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[AWUnitTestPearlDevice setSampleState:](self, "setSampleState:", v4);
  v6[2](v6, 0);

}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4
{
  _BOOL4 v5;
  NSObject *v7;
  unint64_t v8;
  double v9;
  const char *v10;
  NSObject *awQueue;
  _QWORD v12[5];
  BOOL v13;
  BOOL v14;
  uint8_t buf[4];
  double v16;
  __int16 v17;
  const char *v18;
  uint64_t v19;

  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
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
      v10 = "FACE NOT FOUND";
      if (v5)
        v10 = "FACE FOUND";
      *(_DWORD *)buf = 134218242;
      v16 = v9;
      v17 = 2080;
      v18 = v10;
      _os_log_impl(&dword_1AF589000, v7, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: set %s", buf, 0x16u);
    }

  }
  awQueue = self->_awQueue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__AWUnitTestPearlDevice_setSampleState_deliverEvent___block_invoke;
  v12[3] = &unk_1E5F8E6A0;
  v12[4] = self;
  v13 = v5;
  v14 = a4;
  dispatch_sync(awQueue, v12);
}

- (void)setSampleState:(BOOL)a3 deliverEvent:(BOOL)a4 reply:(id)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void (**v8)(id, _QWORD);

  v5 = a4;
  v6 = a3;
  v8 = (void (**)(id, _QWORD))a5;
  -[AWUnitTestPearlDevice setSampleState:deliverEvent:](self, "setSampleState:deliverEvent:", v6, v5);
  v8[2](v8, 0);

}

- (void)setDisplayState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  NSObject *awQueue;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
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
      v8 = "DISPLAY OFF";
      if (v3)
        v8 = "DISPLAY ON";
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: set %s", buf, 0x16u);
    }

  }
  awQueue = self->_awQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __41__AWUnitTestPearlDevice_setDisplayState___block_invoke;
  v10[3] = &unk_1E5F8EB88;
  v10[4] = self;
  v11 = v3;
  dispatch_sync(awQueue, v10);
}

- (void)setDisplayState:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[AWUnitTestPearlDevice setDisplayState:](self, "setDisplayState:", v4);
  v6[2](v6, 0);

}

- (void)setDisplayCallback:(id)a3
{
  id v4;
  NSObject *awQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__AWUnitTestPearlDevice_setDisplayCallback___block_invoke;
  block[3] = &unk_1E5F8EB38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(awQueue, block);

}

- (void)setSmartCoverClosed:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  NSObject *awQueue;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
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
      v8 = "OPEN";
      if (v3)
        v8 = "CLOSED";
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: set SMART COVER %s", buf, 0x16u);
    }

  }
  awQueue = self->_awQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke;
  v10[3] = &unk_1E5F8EB88;
  v10[4] = self;
  v11 = v3;
  dispatch_sync(awQueue, v10);
}

- (void)setSmartCoverClosed:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[AWUnitTestPearlDevice setSmartCoverClosed:](self, "setSmartCoverClosed:", v4);
  v6[2](v6, 0);

}

- (void)setSmartCoverCallback:(id)a3
{
  id v4;
  NSObject *awQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__AWUnitTestPearlDevice_setSmartCoverCallback___block_invoke;
  block[3] = &unk_1E5F8EB38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(awQueue, block);

}

- (void)setCarPlayConnected:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[AWUnitTestPearlDevice setCarPlayConnected:](self, "setCarPlayConnected:", v4);
  v6[2](v6, 0);

}

- (void)setCarPlayConnected:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  NSObject *awQueue;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
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
      v8 = "DISCONNECTED";
      if (v3)
        v8 = "CONNECTED";
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: set CarPlay connected state: %s", buf, 0x16u);
    }

  }
  awQueue = self->_awQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke;
  v10[3] = &unk_1E5F8EB88;
  v10[4] = self;
  v11 = v3;
  dispatch_sync(awQueue, v10);
}

- (void)setCarplayStateChangedCallback:(id)a3
{
  id v4;
  NSObject *awQueue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  awQueue = self->_awQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__AWUnitTestPearlDevice_setCarplayStateChangedCallback___block_invoke;
  block[3] = &unk_1E5F8EB38;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(awQueue, block);

}

- (void)setPearlErrorState:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  unint64_t v6;
  double v7;
  const char *v8;
  NSObject *awQueue;
  _QWORD v10[5];
  BOOL v11;
  uint8_t buf[4];
  double v13;
  __int16 v14;
  const char *v15;
  uint64_t v16;

  v3 = a3;
  v16 = *MEMORY[0x1E0C80C00];
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
      v8 = "clear";
      if (v3)
        v8 = "set";
      *(_DWORD *)buf = 134218242;
      v13 = v7;
      v14 = 2080;
      v15 = v8;
      _os_log_impl(&dword_1AF589000, v5, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: %s SAMPLER ERROR", buf, 0x16u);
    }

  }
  awQueue = self->_awQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__AWUnitTestPearlDevice_setPearlErrorState___block_invoke;
  v10[3] = &unk_1E5F8EB88;
  v10[4] = self;
  v11 = v3;
  dispatch_sync(awQueue, v10);
}

- (void)setPearlErrorState:(BOOL)a3 reply:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  -[AWUnitTestPearlDevice setPearlErrorState:](self, "setPearlErrorState:", v4);
  v6[2](v6, 0);

}

- (BKDevicePearlDelegate)delegate
{
  return (BKDevicePearlDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- ($F99D9A4FB75BC57F3386B8DC8EE08D7A)sampleStatsPtr
{
  return self->_sampleStatsPtr;
}

- (void)setSampleStatsPtr:(id *)a3
{
  self->_sampleStatsPtr = a3;
}

- (BOOL)facePresent
{
  return self->_facePresent;
}

- (void)setFacePresent:(BOOL)a3
{
  self->_facePresent = a3;
}

- (BOOL)pearlError
{
  return self->_pearlError;
}

- (void)setPearlError:(BOOL)a3
{
  self->_pearlError = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_AVFoundationSession, 0);
  objc_storeStrong((id *)&self->_carplayCallbacks, 0);
  objc_storeStrong((id *)&self->_smarCoverCallbacks, 0);
  objc_storeStrong((id *)&self->_displayCallbacks, 0);
  objc_storeStrong((id *)&self->_lastOperation, 0);
  objc_storeStrong((id *)&self->_awQueue, 0);
}

uint64_t __44__AWUnitTestPearlDevice_setPearlErrorState___block_invoke(uint64_t a1)
{
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 81) = *(_BYTE *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 81))
  {
    objc_msgSend(*(id *)(v2 + 40), "awSetFaceDetectError:", 1);
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 72), "setErrorState:", *(unsigned __int8 *)(a1 + 40));
}

void __56__AWUnitTestPearlDevice_setCarplayStateChangedCallback___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
  v2 = (id)MEMORY[0x1B5DF9110](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

void __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 64);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7))
        {
          v8 = (void *)MEMORY[0x1B5DF9110]();
          dispatch_get_global_queue(0, 0);
          v9 = objc_claimAutoreleasedReturnValue();
          v11[0] = v6;
          v11[1] = 3221225472;
          v11[2] = __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke_2;
          v11[3] = &unk_1E5F8E6C8;
          v12 = v8;
          v13 = *(_BYTE *)(a1 + 40);
          v10 = v8;
          dispatch_async(v9, v11);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __45__AWUnitTestPearlDevice_setCarPlayConnected___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __47__AWUnitTestPearlDevice_setSmartCoverCallback___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 56);
  v2 = (id)MEMORY[0x1B5DF9110](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

void __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7))
        {
          v8 = (void *)MEMORY[0x1B5DF9110]();
          dispatch_get_global_queue(0, 0);
          v9 = objc_claimAutoreleasedReturnValue();
          v11[0] = v6;
          v11[1] = 3221225472;
          v11[2] = __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke_2;
          v11[3] = &unk_1E5F8E6C8;
          v12 = v8;
          v13 = *(_BYTE *)(a1 + 40);
          v10 = v8;
          dispatch_async(v9, v11);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __45__AWUnitTestPearlDevice_setSmartCoverClosed___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

void __44__AWUnitTestPearlDevice_setDisplayCallback___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v2 = (id)MEMORY[0x1B5DF9110](*(_QWORD *)(a1 + 40));
  objc_msgSend(v1, "addObject:", v2);

}

void __41__AWUnitTestPearlDevice_setDisplayState___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = *(id *)(*(_QWORD *)(a1 + 32) + 48);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v15;
    v6 = MEMORY[0x1E0C809B0];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v5)
          objc_enumerationMutation(v2);
        if (*(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7))
        {
          v8 = (void *)MEMORY[0x1B5DF9110]();
          dispatch_get_global_queue(0, 0);
          v9 = objc_claimAutoreleasedReturnValue();
          v11[0] = v6;
          v11[1] = 3221225472;
          v11[2] = __41__AWUnitTestPearlDevice_setDisplayState___block_invoke_2;
          v11[3] = &unk_1E5F8E6C8;
          v12 = v8;
          v13 = *(_BYTE *)(a1 + 40);
          v10 = v8;
          dispatch_async(v9, v11);

        }
        ++v7;
      }
      while (v4 != v7);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v4);
  }

}

uint64_t __41__AWUnitTestPearlDevice_setDisplayState___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

uint64_t __53__AWUnitTestPearlDevice_setSampleState_deliverEvent___block_invoke(uint64_t result)
{
  uint64_t v1;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 80) = *(_BYTE *)(result + 40);
  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 81) && *(_BYTE *)(v1 + 80))
  {
    if (*(_BYTE *)(result + 41))
      return objc_msgSend(*(id *)(v1 + 40), "awSetFaceFound");
  }
  return result;
}

uint64_t __35__AWUnitTestPearlDevice_resetStats__block_invoke(uint64_t result)
{
  _QWORD *v1;

  v1 = *(_QWORD **)(result + 32);
  v1[1] = 0;
  v1[2] = 0;
  v1[3] = 0;
  return result;
}

uint64_t __43__AWUnitTestPearlDevice_getStatsWithBlock___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t, __int128 *);
  __int128 v4;
  __int128 v6;
  uint64_t v7;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(uint64_t (**)(uint64_t, __int128 *))(v1 + 16);
  v4 = *(_OWORD *)(v2 + 8);
  v7 = *(_QWORD *)(v2 + 24);
  v6 = v4;
  return v3(v1, &v6);
}

void __49__AWUnitTestPearlDevice_deliverPearlDeviceState___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  char *DeviceStateDescription;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  int v10;
  double v11;
  __int16 v12;
  char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
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
      DeviceStateDescription = getDeviceStateDescription(*(_QWORD *)(a1 + 40));
      v10 = 134218242;
      v11 = v4;
      v12 = 2080;
      v13 = DeviceStateDescription;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: delivering %s state", (uint8_t *)&v10, 0x16u);
    }

  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "device:pearlStateChanged:", v9, *(_QWORD *)(a1 + 40));

  }
}

void __49__AWUnitTestPearlDevice_deliverPearlDeviceEvent___block_invoke(uint64_t a1)
{
  NSObject *v2;
  unint64_t v3;
  double v4;
  char *DeviceEventDescription;
  _QWORD *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  double v14;
  __int16 v15;
  char *v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
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
      DeviceEventDescription = getDeviceEventDescription(*(_QWORD *)(a1 + 40));
      v6 = *(_QWORD **)(a1 + 32);
      v7 = v6[12];
      objc_msgSend(v6, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 134218754;
      v14 = v4;
      v15 = 2080;
      v16 = DeviceEventDescription;
      v17 = 2112;
      v18 = v7;
      v19 = 2112;
      v20 = v8;
      _os_log_impl(&dword_1AF589000, v2, OS_LOG_TYPE_DEFAULT, "%13.5f: UNIT TEST: delivering %s event on queue %@ to %@", (uint8_t *)&v13, 0x2Au);

    }
  }
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_opt_respondsToSelector();

  if ((v10 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "device:pearlEventOccurred:", v12, *(_QWORD *)(a1 + 40));

  }
}

void __64__AWUnitTestPearlDevice_createPresenceDetectOperationWithError___block_invoke(uint64_t a1)
{
  AWUnitTestFaceDetectOperation *v2;
  uint64_t v3;
  void *v4;

  ++*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v2 = objc_alloc_init(AWUnitTestFaceDetectOperation);
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setUnitTestDevice:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "setErrorState:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 81));
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 40), *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

+ (id)sharedDevice
{
  if (sharedDevice_onceToken != -1)
    dispatch_once(&sharedDevice_onceToken, &__block_literal_global_164);
  return (id)sharedDevice_device;
}

+ (id)sharedAVFoundationSession
{
  void *v2;
  void *v3;

  +[AWUnitTestPearlDevice sharedDevice](AWUnitTestPearlDevice, "sharedDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "AVFoundationSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __37__AWUnitTestPearlDevice_sharedDevice__block_invoke()
{
  AWUnitTestPearlDevice *v0;
  void *v1;

  v0 = objc_alloc_init(AWUnitTestPearlDevice);
  v1 = (void *)sharedDevice_device;
  sharedDevice_device = (uint64_t)v0;

}

@end
