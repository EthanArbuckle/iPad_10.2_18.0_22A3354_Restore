@implementation ULCMPDRFenceProvider

- (ULCMPDRFenceProvider)initWithFenceIdentifier:(id)a3 queue:(id)a4 radiusInMeters:(id)a5 callback:(id)a6 statusCallback:(id)a7 errorCallback:(id)a8
{
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  ULCMPDRFenceProvider *v20;
  void *v21;
  void *v22;
  objc_super v24;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v24.receiver = self;
  v24.super_class = (Class)ULCMPDRFenceProvider;
  v20 = -[ULCMPDRFenceProvider init](&v24, sel_init);
  dispatch_assert_queue_V2(v15);
  if (v20)
  {
    objc_msgSend(CFSTR("com.apple.milod.ULCMPDRFenceManager."), "stringByAppendingString:", v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider setFenceIdentifier:](v20, "setFenceIdentifier:", v21);

    -[ULCMPDRFenceProvider setFenceName:](v20, "setFenceName:", v14);
    v22 = (void *)objc_opt_new();
    -[ULCMPDRFenceProvider setFenceManager:](v20, "setFenceManager:", v22);

    -[ULCMPDRFenceProvider setQueue:](v20, "setQueue:", v15);
    -[ULCMPDRFenceProvider setRadius:](v20, "setRadius:", v16);
    -[ULCMPDRFenceProvider setOnMotionMeasurements:](v20, "setOnMotionMeasurements:", v17);
    -[ULCMPDRFenceProvider setOnStatusReport:](v20, "setOnStatusReport:", v18);
    -[ULCMPDRFenceProvider setOnErrorIndication:](v20, "setOnErrorIndication:", v19);
  }

  return v20;
}

- (void)setFenceRadius:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  if (-[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive"))
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_ERROR, "Setting radius when fence is already active -- radius will *NOT BE APPLIED TO FENCE* ", v6, 2u);
    }
  }
  -[ULCMPDRFenceProvider setRadius:](self, "setRadius:", v4);

}

- (void)startSession
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[8];
  id location;

  -[ULCMPDRFenceProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  if (+[ULCMPDRFenceProvider _isAvailable](ULCMPDRFenceProvider, "_isAvailable"))
  {
    if (!-[ULCMPDRFenceProvider isSessionStarted](self, "isSessionStarted"))
    {
      -[ULCMPDRFenceProvider fenceManager](self, "fenceManager");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __36__ULCMPDRFenceProvider_startSession__block_invoke;
      v6[3] = &unk_2511D2240;
      objc_copyWeak(&v7, &location);
      objc_msgSend(v4, "startSessionWithStatusHandler:", v6);

      -[ULCMPDRFenceProvider setIsSessionStarted:](self, "setIsSessionStarted:", 1);
      objc_destroyWeak(&v7);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "Failed to start PDR session, PDR not available", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void __36__ULCMPDRFenceProvider_startSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__ULCMPDRFenceProvider_startSession__block_invoke_2;
    block[3] = &unk_2511D2218;
    block[4] = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __36__ULCMPDRFenceProvider_startSession__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleStatusUpdate:withError:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)endSession
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  uint8_t v6[16];

  -[ULCMPDRFenceProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (+[ULCMPDRFenceProvider _isAvailable](ULCMPDRFenceProvider, "_isAvailable")
    && -[ULCMPDRFenceProvider isSessionStarted](self, "isSessionStarted"))
  {
    if (-[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive"))
      -[ULCMPDRFenceProvider clearFence](self, "clearFence");
    -[ULCMPDRFenceProvider fenceManager](self, "fenceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "endSession");

    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v5 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2419D9000, v5, OS_LOG_TYPE_DEFAULT, "Ending PDR session", v6, 2u);
    }
    -[ULCMPDRFenceProvider setIsSessionStarted:](self, "setIsSessionStarted:", 0);
  }
}

- (void)setFence
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  float v10;
  float v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  int v17;
  double v18;
  NSObject *v19;
  _QWORD v20[4];
  id v21;
  id location;
  uint8_t buf[4];
  int v24;
  __int16 v25;
  const char *v26;
  __int16 v27;
  double v28;
  __int16 v29;
  _BOOL4 v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  -[ULCMPDRFenceProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  objc_initWeak(&location, self);
  if (+[ULCMPDRFenceProvider _isAvailable](ULCMPDRFenceProvider, "_isAvailable"))
  {
    if (!-[ULCMPDRFenceProvider isSessionStarted](self, "isSessionStarted"))
    {
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
      v4 = logObject_MicroLocation_Default;
      if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 68289026;
        v24 = 0;
        v25 = 2082;
        v26 = "";
        _os_log_impl(&dword_2419D9000, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"Requested PDR fence without an active session! starting session\"}", buf, 0x12u);
      }
      if (onceToken_MicroLocation_Default != -1)
        dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
      v5 = logObject_MicroLocation_Default;
      if (os_signpost_enabled((os_log_t)logObject_MicroLocation_Default))
      {
        *(_DWORD *)buf = 68289026;
        v24 = 0;
        v25 = 2082;
        v26 = "";
        _os_signpost_emit_with_name_impl(&dword_2419D9000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "Requested PDR fence without an active session! starting session", "{\"msg%{public}.0s\":\"Requested PDR fence without an active session! starting session\"}", buf, 0x12u);
      }
      -[ULCMPDRFenceProvider startSession](self, "startSession");
    }
    if (-[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive"))
    {
      -[ULCMPDRFenceProvider fenceManager](self, "fenceManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[ULCMPDRFenceProvider fenceIdentifier](self, "fenceIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "clearFence:", v7);

    }
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v8 = (id)logObject_MicroLocation_Default;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[ULCMPDRFenceProvider radius](self, "radius");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "floatValue");
      v11 = v10;
      v12 = -[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive");
      *(_DWORD *)buf = 68289538;
      v24 = 0;
      v25 = 2082;
      v26 = "";
      v27 = 2050;
      v28 = v11;
      v29 = 1026;
      v30 = v12;
      _os_log_impl(&dword_2419D9000, v8, OS_LOG_TYPE_DEFAULT, "{\"msg%{public}.0s\":\"Setting PDR fence \", \"fence size in m\":\"%{public}.2f\", \"previous fence state\":%{public}hhd}", buf, 0x22u);

    }
    -[ULCMPDRFenceProvider setIsFenceActive:](self, "setIsFenceActive:", 1);
    -[ULCMPDRFenceProvider fenceManager](self, "fenceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider fenceIdentifier](self, "fenceIdentifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider radius](self, "radius");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __32__ULCMPDRFenceProvider_setFence__block_invoke;
    v20[3] = &unk_2511D2268;
    objc_copyWeak(&v21, &location);
    LODWORD(v18) = v17;
    objc_msgSend(v13, "setFence:withRadius:withCompletion:", v14, v20, v18);

    objc_destroyWeak(&v21);
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v19 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2419D9000, v19, OS_LOG_TYPE_DEFAULT, "Failed to set pedestrian fence, PDR not available", buf, 2u);
    }
  }
  objc_destroyWeak(&location);
}

void __32__ULCMPDRFenceProvider_setFence__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v8 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __32__ULCMPDRFenceProvider_setFence__block_invoke_2;
    block[3] = &unk_2511D2218;
    block[4] = v8;
    v11 = v5;
    v12 = v6;
    dispatch_async(v9, block);

  }
}

uint64_t __32__ULCMPDRFenceProvider_setFence__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handleFenceCross:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)clearFence
{
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  NSString *fenceIdentifier;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  int v12;
  NSString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[ULCMPDRFenceProvider queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  if (-[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive"))
  {
    -[ULCMPDRFenceProvider fenceManager](self, "fenceManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider fenceIdentifier](self, "fenceIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "clearFence:", v5);

    -[ULCMPDRFenceProvider setIsFenceActive:](self, "setIsFenceActive:", 0);
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v6 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      fenceIdentifier = self->_fenceIdentifier;
      v12 = 138412290;
      v13 = fenceIdentifier;
      v8 = "Clearing PDR fence, with identifier: %@ -- will not receive any more fence breach notifications";
      v9 = v6;
      v10 = 12;
LABEL_10:
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, v8, (uint8_t *)&v12, v10);
    }
  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v12) = 0;
      v8 = "No fence active -- ignoring request to clear fence";
      v9 = v11;
      v10 = 2;
      goto LABEL_10;
    }
  }
}

- (void)_handleFenceCross:(id)a3 error:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v12;
  void *v13;
  NSObject *v14;
  void (**v15)(_QWORD, _QWORD, _QWORD);
  void *v16;
  void *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v8 = (void *)logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v8;
      objc_msgSend(v7, "localizedDescription");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = 138412546;
      v19 = v10;
      v20 = 2112;
      v21 = v6;
      _os_log_impl(&dword_2419D9000, v9, OS_LOG_TYPE_DEFAULT, "PDR fence completion error, PDR fence completed with error: %@ and identifier %@", (uint8_t *)&v18, 0x16u);

    }
    -[ULCMPDRFenceProvider onErrorIndication](self, "onErrorIndication");
    v11 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider fenceName](self, "fenceName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, void *))v11)[2](v11, v7, v12, v13);

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v14 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 138412290;
      v19 = v6;
      _os_log_impl(&dword_2419D9000, v14, OS_LOG_TYPE_DEFAULT, "PDR fence completed sucessfully, with identifier: %@", (uint8_t *)&v18, 0xCu);
    }
    -[ULCMPDRFenceProvider onMotionMeasurements](self, "onMotionMeasurements");
    v15 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider fenceName](self, "fenceName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, void *))v15)[2](v15, v16, v17);

    -[ULCMPDRFenceProvider setIsFenceActive:](self, "setIsFenceActive:", 0);
  }

}

- (void)_handleStatusUpdateError:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (onceToken_MicroLocation_Default != -1)
    dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
  v5 = (void *)logObject_MicroLocation_Default;
  if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    objc_msgSend(v4, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider fenceIdentifier](self, "fenceIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULCMPDRFenceProvider isSessionStarted](self, "isSessionStarted"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138413058;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    v15 = 2112;
    v16 = v9;
    v17 = 2112;
    v18 = v10;
    _os_log_impl(&dword_2419D9000, v6, OS_LOG_TYPE_DEFAULT, "PDR fence error, PDR fence cleared with error: %@ and identifier %@, session is started: %@, fence is active: %@", (uint8_t *)&v11, 0x2Au);

  }
  if (-[ULCMPDRFenceProvider isFenceActive](self, "isFenceActive"))
    -[ULCMPDRFenceProvider clearFence](self, "clearFence");
  if (-[ULCMPDRFenceProvider isSessionStarted](self, "isSessionStarted"))
  {
    -[ULCMPDRFenceProvider endSession](self, "endSession");
    -[ULCMPDRFenceProvider startSession](self, "startSession");
  }

}

- (void)_handleStatusUpdate:(id)a3 withError:(id)a4
{
  id v6;
  id v7;
  void (**v8)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void (**v13)(_QWORD, _QWORD);
  int v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  if (v7)
  {
    -[ULCMPDRFenceProvider _handleStatusUpdateError:](self, "_handleStatusUpdateError:", v7);
    -[ULCMPDRFenceProvider onErrorIndication](self, "onErrorIndication");
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE60], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider fenceName](self, "fenceName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, void *, void *))v8)[2](v8, v7, v9, v10);

  }
  else
  {
    if (onceToken_MicroLocation_Default != -1)
      dispatch_once(&onceToken_MicroLocation_Default, &__block_literal_global_1);
    v11 = logObject_MicroLocation_Default;
    if (os_log_type_enabled((os_log_t)logObject_MicroLocation_Default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412290;
      v15 = v6;
      _os_log_impl(&dword_2419D9000, v11, OS_LOG_TYPE_DEFAULT, "get PDR status: %@", (uint8_t *)&v14, 0xCu);
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithDictionary:", v6);
    v8 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[ULCMPDRFenceProvider fenceName](self, "fenceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", &stru_2511DC120, v12);

    -[ULCMPDRFenceProvider onStatusReport](self, "onStatusReport");
    v13 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v13[2](v13, v8);

  }
}

+ (BOOL)_isAvailable
{
  int v2;

  v2 = objc_msgSend(MEMORY[0x24BDC1410], "isAvailable");
  if (v2)
    LOBYTE(v2) = (objc_msgSend(MEMORY[0x24BDC1410], "availableFenceTypes") & 3) != 0;
  return v2;
}

- (CMPedestrianFenceManager)fenceManager
{
  return self->_fenceManager;
}

- (void)setFenceManager:(id)a3
{
  objc_storeStrong((id *)&self->_fenceManager, a3);
}

- (NSString)fenceIdentifier
{
  return self->_fenceIdentifier;
}

- (void)setFenceIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_fenceIdentifier, a3);
}

- (NSString)fenceName
{
  return self->_fenceName;
}

- (void)setFenceName:(id)a3
{
  objc_storeStrong((id *)&self->_fenceName, a3);
}

- (BOOL)isFenceActive
{
  return self->_isFenceActive;
}

- (void)setIsFenceActive:(BOOL)a3
{
  self->_isFenceActive = a3;
}

- (BOOL)isSessionStarted
{
  return self->_isSessionStarted;
}

- (void)setIsSessionStarted:(BOOL)a3
{
  self->_isSessionStarted = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSNumber)radius
{
  return self->_radius;
}

- (void)setRadius:(id)a3
{
  objc_storeStrong((id *)&self->_radius, a3);
}

- (id)onMotionMeasurements
{
  return self->_onMotionMeasurements;
}

- (void)setOnMotionMeasurements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)onStatusReport
{
  return self->_onStatusReport;
}

- (void)setOnStatusReport:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (id)onErrorIndication
{
  return self->_onErrorIndication;
}

- (void)setOnErrorIndication:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onErrorIndication, 0);
  objc_storeStrong(&self->_onStatusReport, 0);
  objc_storeStrong(&self->_onMotionMeasurements, 0);
  objc_storeStrong((id *)&self->_radius, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_fenceName, 0);
  objc_storeStrong((id *)&self->_fenceIdentifier, 0);
  objc_storeStrong((id *)&self->_fenceManager, 0);
}

@end
