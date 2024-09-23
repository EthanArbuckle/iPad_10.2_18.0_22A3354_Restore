@implementation CMContinuityCaptureProximityMonitor

- (CMContinuityCaptureProximityMonitor)initWithQueue:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  CMContinuityCaptureProximityMonitor *v9;
  CMContinuityCaptureProximityMonitor *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *internalQueue;
  uint64_t v13;
  NISession *niSession;
  uint64_t v15;
  NIRegionPredicate *innerPredicate;
  uint64_t v17;
  NIRegionPredicate *outerPredicate;
  uint64_t v19;
  NSMutableSet *tracking;
  uint64_t v21;
  NSMutableSet *nearby;
  uint64_t v23;
  NSMutableSet *knownDevices;
  NSObject *v25;
  CMContinuityCaptureProximityMonitor *v26;
  CMContinuityCaptureProximityMonitor *v27;
  _QWORD block[4];
  CMContinuityCaptureProximityMonitor *v30;
  objc_super v31;

  v7 = a3;
  v8 = a4;
  v31.receiver = self;
  v31.super_class = (Class)CMContinuityCaptureProximityMonitor;
  v9 = -[CMContinuityCaptureProximityMonitor init](&v31, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_havePendingUpdates = 0;
    objc_storeWeak((id *)&v9->_delegate, v8);
    v11 = dispatch_queue_create("continuity-capture-proximity-monitor", 0);
    internalQueue = v10->_internalQueue;
    v10->_internalQueue = (OS_dispatch_queue *)v11;

    objc_storeStrong((id *)&v10->_callbackQueue, a3);
    v13 = objc_opt_new();
    niSession = v10->_niSession;
    v10->_niSession = (NISession *)v13;

    v15 = objc_msgSend(objc_alloc(MEMORY[0x24BDDFE30]), "initWithName:devicePresencePreset:", CFSTR("inner"), 2);
    innerPredicate = v10->_innerPredicate;
    v10->_innerPredicate = (NIRegionPredicate *)v15;

    v17 = objc_msgSend(objc_alloc(MEMORY[0x24BDDFE30]), "initWithName:devicePresencePreset:", CFSTR("outer"), 5);
    outerPredicate = v10->_outerPredicate;
    v10->_outerPredicate = (NIRegionPredicate *)v17;

    v19 = objc_opt_new();
    tracking = v10->_tracking;
    v10->_tracking = (NSMutableSet *)v19;

    v21 = objc_opt_new();
    nearby = v10->_nearby;
    v10->_nearby = (NSMutableSet *)v21;

    v23 = objc_opt_new();
    knownDevices = v10->_knownDevices;
    v10->_knownDevices = (NSMutableSet *)v23;

    v25 = v10->_internalQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __62__CMContinuityCaptureProximityMonitor_initWithQueue_delegate___block_invoke;
    block[3] = &unk_24F06AEB0;
    v26 = v10;
    v30 = v26;
    dispatch_sync(v25, block);
    v27 = v26;

  }
  return v10;
}

uint64_t __62__CMContinuityCaptureProximityMonitor_initWithQueue_delegate___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startNearbyInteractionSession");
}

- (void)beginTracking:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  CMContinuityCaptureProximityMonitor *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ begin tracking %@", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke;
  v8[3] = &unk_24F06ADE8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(internalQueue, v8);

}

void __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke(uint64_t a1)
{
  char v2;
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id v6;
  char v7;
  id to;

  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "addObject:", *(_QWORD *)(a1 + 40));
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      to = (id)0xAAAAAAAAAAAAAAAALL;
      objc_copyWeak(&to, (id *)(*(_QWORD *)(a1 + 32) + 16));
      v2 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", *(_QWORD *)(a1 + 40));
      v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 32);
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke_2;
      v4[3] = &unk_24F06B570;
      objc_copyWeak(&v6, &to);
      v5 = *(id *)(a1 + 40);
      v7 = v2;
      dispatch_async(v3, v4);

      objc_destroyWeak(&v6);
      objc_destroyWeak(&to);
    }
  }
}

void __53__CMContinuityCaptureProximityMonitor_beginTracking___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "device:isNearby:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
    WeakRetained = v3;
  }

}

- (void)endTracking:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  CMContinuityCaptureProximityMonitor *v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(1);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ end tracking %@", buf, 0x16u);
  }

  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __51__CMContinuityCaptureProximityMonitor_endTracking___block_invoke;
  v8[3] = &unk_24F06ADE8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_sync(internalQueue, v8);

}

uint64_t __51__CMContinuityCaptureProximityMonitor_endTracking___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "removeObject:", *(_QWORD *)(a1 + 40));
}

- (BOOL)isDeviceNearby:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -86;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__CMContinuityCaptureProximityMonitor_isDeviceNearby___block_invoke;
  block[3] = &unk_24F06B320;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __54__CMContinuityCaptureProximityMonitor_isDeviceNearby___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 72), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (BOOL)isDeviceKnown:(id)a3
{
  id v4;
  NSObject *internalQueue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = -86;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__CMContinuityCaptureProximityMonitor_isDeviceKnown___block_invoke;
  block[3] = &unk_24F06B320;
  v9 = v4;
  v10 = &v11;
  block[4] = self;
  v6 = v4;
  dispatch_sync(internalQueue, block);
  LOBYTE(internalQueue) = *((_BYTE *)v12 + 24);

  _Block_object_dispose(&v11, 8);
  return (char)internalQueue;
}

uint64_t __53__CMContinuityCaptureProximityMonitor_isDeviceKnown___block_invoke(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1[4] + 80), "containsObject:", a1[5]);
  *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

- (void)invalidate
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__CMContinuityCaptureProximityMonitor_invalidate__block_invoke;
  block[3] = &unk_24F06AEB0;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

uint64_t __49__CMContinuityCaptureProximityMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)dealloc
{
  objc_super v3;

  -[CMContinuityCaptureProximityMonitor _invalidate](self, "_invalidate");
  v3.receiver = self;
  v3.super_class = (Class)CMContinuityCaptureProximityMonitor;
  -[CMContinuityCaptureProximityMonitor dealloc](&v3, sel_dealloc);
}

- (void)_startNearbyInteractionSession
{
  NSObject *v3;
  id v4;
  NIRegionPredicate *innerPredicate;
  NIRegionPredicate *outerPredicate;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  uint8_t buf[4];
  CMContinuityCaptureProximityMonitor *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_internalQueue);
  CMContinuityCaptureLog(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = self;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ : monitoring nearby interaction", buf, 0xCu);
  }

  v4 = objc_alloc(MEMORY[0x24BDDFDF8]);
  innerPredicate = self->_innerPredicate;
  outerPredicate = self->_outerPredicate;
  v10 = 0;
  v7 = (void *)objc_msgSend(v4, "initWithInnerBoundary:outerBoundary:error:", innerPredicate, outerPredicate, &v10);
  v8 = v10;
  objc_msgSend(v7, "setAllowedDevices:", 2);
  objc_msgSend(v7, "setMonitoringOption:", 1);
  if (v8)
  {
    CMContinuityCaptureLog(1);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = self;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_227C5D000, v9, OS_LOG_TYPE_DEFAULT, "%@ ERROR in NIDevicePresenceConfiguration: %@", buf, 0x16u);
    }

  }
  else
  {
    -[NISession setDelegate:](self->_niSession, "setDelegate:", self);
    -[NISession setDelegateQueue:](self->_niSession, "setDelegateQueue:", self->_callbackQueue);
    -[NISession runWithConfiguration:](self->_niSession, "runWithConfiguration:", v7);
  }

}

- (void)_invalidate
{
  NSObject *v3;
  int v4;
  int v5;
  NISession *niSession;
  int v7;
  CMContinuityCaptureProximityMonitor *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(1);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[NSMutableSet count](self->_tracking, "count");
    v5 = -[NSMutableSet count](self->_nearby, "count");
    v7 = 138412802;
    v8 = self;
    v9 = 1024;
    v10 = v4;
    v11 = 1024;
    v12 = v5;
    _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_DEFAULT, "%@ invalidate (%d tracked, %d nearby)", (uint8_t *)&v7, 0x18u);
  }

  -[NISession invalidate](self->_niSession, "invalidate");
  niSession = self->_niSession;
  self->_niSession = 0;

  objc_storeWeak((id *)&self->_delegate, 0);
  -[NSMutableSet removeAllObjects](self->_tracking, "removeAllObjects");
}

- (void)session:(id)a3 object:(id)a4 didUpdateRegion:(id)a5 previousRegion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  void *v15;
  float v16;
  void *v17;
  uint64_t v18;
  NSObject *internalQueue;
  id v20;
  void *v21;
  _QWORD block[5];
  id v23;
  _QWORD *v24;
  _BYTE *v25;
  char v26;
  _QWORD v27[3];
  char v28;
  _BYTE buf[24];
  double v30;
  _BYTE v31[20];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  CMContinuityCaptureLog(1);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "deviceIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "distance");
    *(_DWORD *)buf = 138413314;
    *(_QWORD *)&buf[4] = self;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v15;
    *(_WORD *)&buf[22] = 2048;
    v30 = v16;
    *(_WORD *)v31 = 2112;
    *(_QWORD *)&v31[2] = v13;
    *(_WORD *)&v31[10] = 2112;
    *(_QWORD *)&v31[12] = v12;
    _os_log_impl(&dword_227C5D000, v14, OS_LOG_TYPE_INFO, "%@ : device %@ (%f) moved from %@ to %@", buf, 0x34u);

  }
  objc_msgSend(v11, "deviceIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v12, "isEqual:", self->_innerPredicate);
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  v28 = v18;
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v30 = COERCE_DOUBLE(__Block_byref_object_copy__8);
  *(_QWORD *)v31 = __Block_byref_object_dispose__8;
  *(_QWORD *)&v31[8] = 0;
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __85__CMContinuityCaptureProximityMonitor_session_object_didUpdateRegion_previousRegion___block_invoke;
  block[3] = &unk_24F06D2C8;
  block[4] = self;
  v20 = v17;
  v23 = v20;
  v24 = v27;
  v26 = v18;
  v25 = buf;
  dispatch_sync(internalQueue, block);
  v21 = *(void **)(*(_QWORD *)&buf[8] + 40);
  if (v21)
    objc_msgSend(v21, "device:isNearby:", v20, v18);

  _Block_object_dispose(buf, 8);
  _Block_object_dispose(v27, 8);

}

void __85__CMContinuityCaptureProximityMonitor_session_object_didUpdateRegion_previousRegion___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  _BOOL4 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  BOOL v14;
  int v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "addObject:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "containsObject:", *(_QWORD *)(a1 + 40));
  v2 = *(unsigned __int8 *)(a1 + 64);
  if (v2 != *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    CMContinuityCaptureLog(1);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v4)
      {
        v5 = *(_QWORD *)(a1 + 32);
        v6 = *(_QWORD *)(a1 + 40);
        v16 = 138412546;
        v17 = v5;
        v18 = 2112;
        v19 = v6;
        _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_INFO, "%@ : device entered inner boundary: %@", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "addObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      if (v4)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v8 = *(_QWORD *)(a1 + 40);
        v16 = 138412546;
        v17 = v7;
        v18 = 2112;
        v19 = v8;
        _os_log_impl(&dword_227C5D000, v3, OS_LOG_TYPE_INFO, "%@ : device left inner boundary: %@", (uint8_t *)&v16, 0x16u);
      }

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "removeObject:", *(_QWORD *)(a1 + 40));
    }
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 64), "containsObject:", *(_QWORD *)(a1 + 40)))
    {
      WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 16));
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
      v11 = *(void **)(v10 + 40);
      *(_QWORD *)(v10 + 40) = WeakRetained;

    }
  }
  v12 = *(_QWORD *)(a1 + 32);
  v13 = *(_DWORD *)(v12 + 88);
  v14 = __OFSUB__(v13, 1);
  v15 = v13 - 1;
  if (v15 < 0 == v14)
    *(_DWORD *)(v12 + 88) = v15;
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v5;
  NSObject *internalQueue;
  id v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id location;

  v5 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  internalQueue = self->_internalQueue;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke;
  v8[3] = &unk_24F06BAB0;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  objc_copyWeak(&v10, &location);
  dispatch_async(internalQueue, v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
}

void __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  id *v5;
  id WeakRetained;
  void *v7;
  int v8;
  int64_t v9;
  dispatch_time_t v10;
  NSObject *v11;
  int v12;
  NSObject *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  _WORD v19[17];

  *(_QWORD *)&v19[13] = *MEMORY[0x24BDAC8D0];
  CMContinuityCaptureLog(1);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(void **)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v17 = v3;
    v18 = 2112;
    *(_QWORD *)v19 = v4;
    _os_log_impl(&dword_227C5D000, v2, OS_LOG_TYPE_DEFAULT, "%@ NISession error: %@", buf, 0x16u);
  }

  v5 = (id *)(a1 + 48);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    v7 = *(void **)(a1 + 40);
    if (v7 && (unint64_t)(objc_msgSend(v7, "code") + 5889) <= 1)
    {
      objc_msgSend(WeakRetained, "_invalidate");
      goto LABEL_15;
    }
    v8 = *((_DWORD *)WeakRetained + 22);
    if (v8 < 1)
    {
      v10 = 0;
    }
    else
    {
      v9 = 250000000 * (1 << (v8 - 1));
      v10 = dispatch_time(0, v9);
      CMContinuityCaptureLog(1);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *((_DWORD *)WeakRetained + 22);
        *(_DWORD *)buf = 138412802;
        v17 = WeakRetained;
        v18 = 1024;
        *(_DWORD *)v19 = v12;
        v19[2] = 2048;
        *(_QWORD *)&v19[3] = v9;
        _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%@ Backing off NISession restart %d (%lld ns)", buf, 0x1Cu);
      }

      v8 = *((_DWORD *)WeakRetained + 22);
      if (v8 > 6)
        goto LABEL_14;
    }
    *((_DWORD *)WeakRetained + 22) = v8 + 1;
LABEL_14:
    v13 = *((_QWORD *)WeakRetained + 3);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke_10;
    block[3] = &unk_24F06AE60;
    objc_copyWeak(&v15, v5);
    dispatch_after(v10, v13, block);
    objc_destroyWeak(&v15);
  }
LABEL_15:

}

void __70__CMContinuityCaptureProximityMonitor_session_didInvalidateWithError___block_invoke_10(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD *WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v1 = objc_opt_new();
    v2 = (void *)WeakRetained[5];
    WeakRetained[5] = v1;

    objc_msgSend(WeakRetained, "_startNearbyInteractionSession");
  }

}

- (void)sessionWasSuspended:(id)a3
{
  NSObject *v4;
  int v5;
  CMContinuityCaptureProximityMonitor *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  CMContinuityCaptureLog(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = self;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@ NISession was suspended", (uint8_t *)&v5, 0xCu);
  }

}

- (void)sessionSuspensionEnded:(id)a3
{
  NSObject *v4;
  NSObject *internalQueue;
  _QWORD block[4];
  id v7;
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_callbackQueue);
  CMContinuityCaptureLog(1);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    *(_QWORD *)&buf[4] = self;
    _os_log_impl(&dword_227C5D000, v4, OS_LOG_TYPE_DEFAULT, "%@ NISession resuming", buf, 0xCu);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __62__CMContinuityCaptureProximityMonitor_sessionSuspensionEnded___block_invoke;
  block[3] = &unk_24F06AE60;
  objc_copyWeak(&v7, (id *)buf);
  dispatch_async(internalQueue, block);
  objc_destroyWeak(&v7);
  objc_destroyWeak((id *)buf);
}

void __62__CMContinuityCaptureProximityMonitor_sessionSuspensionEnded___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_startNearbyInteractionSession");
    WeakRetained = v2;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownDevices, 0);
  objc_storeStrong((id *)&self->_nearby, 0);
  objc_storeStrong((id *)&self->_tracking, 0);
  objc_storeStrong((id *)&self->_outerPredicate, 0);
  objc_storeStrong((id *)&self->_innerPredicate, 0);
  objc_storeStrong((id *)&self->_niSession, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
