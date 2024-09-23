@implementation ContinuityCaptureRemoteUISystemStatus

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_60 != -1)
    dispatch_once(&sharedInstance_onceToken_60, &__block_literal_global_61);
  return (id)_systemStatus;
}

void __55__ContinuityCaptureRemoteUISystemStatus_sharedInstance__block_invoke()
{
  ContinuityCaptureRemoteUISystemStatus *v0;
  uint64_t v1;
  void *v2;

  v0 = [ContinuityCaptureRemoteUISystemStatus alloc];
  v1 = -[ContinuityCaptureRemoteUISystemStatus initWithQueue:](v0, "initWithQueue:", MEMORY[0x24BDAC9B8]);
  v2 = (void *)_systemStatus;
  _systemStatus = v1;

}

- (ContinuityCaptureRemoteUISystemStatus)initWithQueue:(id)a3
{
  id v5;
  ContinuityCaptureRemoteUISystemStatus *v6;
  ContinuityCaptureRemoteUISystemStatus *v7;
  NSMutableSet *v8;
  NSMutableSet *incomingCallIDs;
  NSMutableSet *v10;
  NSMutableSet *activeCallIds;
  uint64_t v12;
  NSHashTable *observers;
  NSObject *queue;
  ContinuityCaptureRemoteUISystemStatus *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)ContinuityCaptureRemoteUISystemStatus;
  v6 = -[ContinuityCaptureRemoteUIPowerButtonStatus initWithQueue:](&v20, sel_initWithQueue_, v5);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v8 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    incomingCallIDs = v7->_incomingCallIDs;
    v7->_incomingCallIDs = v8;

    v10 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    activeCallIds = v7->_activeCallIds;
    v7->_activeCallIds = v10;

    atomic_store(0xFFFFFFFFFFFFFFFFLL, (unint64_t *)&v7->_callState);
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v12 = objc_claimAutoreleasedReturnValue();
    observers = v7->_observers;
    v7->_observers = (NSHashTable *)v12;

    location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, v7);
    queue = v7->_queue;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __55__ContinuityCaptureRemoteUISystemStatus_initWithQueue___block_invoke;
    v17[3] = &unk_24F06AE60;
    objc_copyWeak(&v18, &location);
    dispatch_async(queue, v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
    v15 = v7;
  }

  return v7;
}

void __55__ContinuityCaptureRemoteUISystemStatus_initWithQueue___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "setupCallStateMonitoring");
    WeakRetained = v2;
  }

}

- (BOOL)invalidated
{
  ContinuityCaptureRemoteUISystemStatus *v2;
  BOOL invalidated;

  v2 = self;
  objc_sync_enter(v2);
  invalidated = v2->_invalidated;
  objc_sync_exit(v2);

  return invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  ContinuityCaptureRemoteUISystemStatus *obj;

  obj = self;
  objc_sync_enter(obj);
  obj->_invalidated = a3;
  objc_sync_exit(obj);

}

+ (void)invalidate
{
  if ((objc_msgSend((id)_systemStatus, "invalidated") & 1) == 0)
  {
    objc_msgSend((id)_systemStatus, "invalidate");
    objc_msgSend((id)_systemStatus, "setInvalidated:", 1);
  }
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEB4AB8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BEB4AD0], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BE64908], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BE647F8], 0);

}

- (unint64_t)activeCallCountOnMainQueue
{
  NSObject *v2;
  id v3;
  unint64_t v4;
  _QWORD block[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v2 = MEMORY[0x24BDAC9B8];
  v3 = MEMORY[0x24BDAC9B8];
  dispatch_assert_queue_not_V2(v2);

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__ContinuityCaptureRemoteUISystemStatus_activeCallCountOnMainQueue__block_invoke;
  block[3] = &unk_24F06B090;
  block[4] = &v7;
  dispatch_async_and_wait(v2, block);

  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __67__ContinuityCaptureRemoteUISystemStatus_activeCallCountOnMainQueue__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "currentAudioAndVideoCalls");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7), "status") == 1)
          ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)holdIdleSleepAssertionForReason:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  IOReturn v10;
  NSObject *v11;
  _QWORD v12[2];
  uint8_t buf[4];
  ContinuityCaptureRemoteUISystemStatus *v14;
  __int16 v15;
  _BYTE v16[18];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412802;
    v14 = self;
    v15 = 2080;
    *(_QWORD *)v16 = "-[ContinuityCaptureRemoteUISystemStatus holdIdleSleepAssertionForReason:]";
    *(_WORD *)&v16[8] = 2112;
    *(_QWORD *)&v16[10] = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@: %s %@", buf, 0x20u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!self->_preventSystemSleepAssertionID)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("idleSleepPreventionSystemActivityForContinuityCapture(%d)_%@"), getpid(), v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = IOPMAssertionDeclareSystemActivity();
    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v14 = self;
      v15 = 1024;
      *(_DWORD *)v16 = v7;
      *(_WORD *)&v16[4] = 1024;
      *(_DWORD *)&v16[6] = 1;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ IOPMAssertionDeclareSystemActivity returned %x systemState %d", buf, 0x18u);
    }

    if (!v7)
    {
      v12[0] = CFSTR("audio-in");
      v12[1] = CFSTR("Camera");
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v12, 2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = IOPMAssertionSetProperty(self->_preventSystemSleepAssertionID, CFSTR("ResourcesUsed"), v9);
      CMContinuityCaptureLog(0);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v14 = self;
        v15 = 1024;
        *(_DWORD *)v16 = v10;
        *(_WORD *)&v16[4] = 2112;
        *(_QWORD *)&v16[6] = v9;
        _os_log_impl(&dword_227C5D000, v11, OS_LOG_TYPE_DEFAULT, "%@ IOPMAssertionSetProperty returned %x for setting kIOPMAssertionResourcesUsed: %@", buf, 0x1Cu);
      }

    }
  }

}

- (void)releaseCurrentIdleSleepAssertion
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138412546;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_227C5D000, log, OS_LOG_TYPE_ERROR, "%@  IOPMAssertionRelease failed (%d)", (uint8_t *)&v3, 0x12u);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  ContinuityCaptureRemoteUISystemStatus *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v6, 0x16u);
  }

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  -[NSHashTable addObject:](self->_observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  ContinuityCaptureRemoteUISystemStatus *v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412546;
    v7 = self;
    v8 = 2112;
    v9 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@: %@", (uint8_t *)&v6, 0x16u);
  }

  -[NSHashTable removeObject:](self->_observers, "removeObject:", v4);
}

- (void)_handleCallStatusChangedNotification:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  char v11;
  id location;
  uint8_t buf[4];
  ContinuityCaptureRemoteUISystemStatus *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = self;
    v15 = 2112;
    v16 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ Received: %@", buf, 0x16u);
  }

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BEB4AB8]) & 1) != 0)
    goto LABEL_6;
  objc_msgSend(v4, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BEB4AD0]))
  {

LABEL_6:
    goto LABEL_7;
  }
  objc_msgSend(v4, "name");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x24BE647F8]);

  if ((v11 & 1) == 0)
  {
    CMContinuityCaptureLog(0);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v14 = self;
      v15 = 2112;
      v16 = v4;
      _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ Received unhandled notification from call center: %@", buf, 0x16u);
    }
    goto LABEL_9;
  }
LABEL_7:
  v8 = objc_loadWeakRetained(&location);
  if (v8)
  {
    objc_msgSend(v4, "object");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject _handleCall:](v8, "_handleCall:", v9);

LABEL_9:
  }
  objc_destroyWeak(&location);

}

- (void)_setupAVSystemController
{
  AVSystemController *v3;
  AVSystemController *avSystemController;
  AVSystemController *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  AVSystemController *v9;
  int v10;
  ContinuityCaptureRemoteUISystemStatus *v11;
  __int16 v12;
  AVSystemController *v13;
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BE64988], "sharedAVSystemController");
  v3 = (AVSystemController *)objc_claimAutoreleasedReturnValue();
  avSystemController = self->_avSystemController;
  self->_avSystemController = v3;

  v5 = self->_avSystemController;
  v6 = *MEMORY[0x24BE647F8];
  v14[0] = *MEMORY[0x24BE64908];
  v14[1] = v6;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AVSystemController setAttribute:forKey:error:](v5, "setAttribute:forKey:error:", v7, *MEMORY[0x24BE64930], 0);

  CMContinuityCaptureLog(0);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = self->_avSystemController;
    v10 = 138412546;
    v11 = self;
    v12 = 2112;
    v13 = v9;
    _os_log_impl(&dword_227C5D000, v8, OS_LOG_TYPE_DEFAULT, "%@ Setup avSystemController: %@", (uint8_t *)&v10, 0x16u);
  }

}

- (void)_avSystemControllerProcessDied
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__ContinuityCaptureRemoteUISystemStatus__avSystemControllerProcessDied__block_invoke;
  v4[3] = &unk_24F06AE60;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __71__ContinuityCaptureRemoteUISystemStatus__avSystemControllerProcessDied__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_setupAVSystemController");
    WeakRetained = v2;
  }

}

- (void)_handleCallAudioSessionActiveNotification:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *queue;
  id v7;
  _QWORD block[4];
  id v9;
  ContinuityCaptureRemoteUISystemStatus *v10;
  id v11;
  _BYTE buf[12];
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CMContinuityCaptureLog(0);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = self;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ Received: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__ContinuityCaptureRemoteUISystemStatus__handleCallAudioSessionActiveNotification___block_invoke;
  block[3] = &unk_24F06AF00;
  objc_copyWeak(&v11, (id *)buf);
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v11);
  objc_destroyWeak((id *)buf);
}

void __83__ContinuityCaptureRemoteUISystemStatus__handleCallAudioSessionActiveNotification___block_invoke(uint64_t a1)
{
  unsigned __int8 *WeakRetained;
  void *v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE64800]);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "BOOLValue");

    if (WeakRetained[96] != v5)
    {
      CMContinuityCaptureLog(0);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 40);
        v8 = WeakRetained[96];
        v9 = 138412802;
        v10 = v7;
        v11 = 1024;
        v12 = v8;
        v13 = 1024;
        v14 = v5;
        _os_log_impl(&dword_227C5D000, v6, OS_LOG_TYPE_DEFAULT, "%@ _hasActiveCallAudioSession changed %d -> %d ", (uint8_t *)&v9, 0x18u);
      }

      WeakRetained[96] = v5;
      objc_msgSend(WeakRetained, "_resolveActiveCallState");
    }
  }

}

- (int64_t)callState
{
  return atomic_load((unint64_t *)&self->_callState);
}

- (void)_resolveActiveCallState
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  int v6;
  _BOOL4 hasActiveCallAudioSession;
  NSHashTable *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t v17[128];
  uint8_t buf[4];
  ContinuityCaptureRemoteUISystemStatus *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = atomic_load((unint64_t *)&self->_callState);
  v4 = atomic_load((unint64_t *)&self->_callState);
  if (-[NSMutableSet count](self->_activeCallIds, "count") || self->_hasActiveCallAudioSession)
  {
    v3 = 0;
  }
  else if (!v4 && !-[NSMutableSet count](self->_activeCallIds, "count") && !self->_hasActiveCallAudioSession)
  {
    v3 = 1;
  }
  if (v3 != v4)
  {
    CMContinuityCaptureLog(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = -[NSMutableSet count](self->_activeCallIds, "count");
      hasActiveCallAudioSession = self->_hasActiveCallAudioSession;
      *(_DWORD *)buf = 138413314;
      v19 = self;
      v20 = 1024;
      v21 = v6;
      v22 = 1024;
      v23 = hasActiveCallAudioSession;
      v24 = 1024;
      v25 = v4;
      v26 = 1024;
      v27 = v3;
      _os_log_impl(&dword_227C5D000, v5, OS_LOG_TYPE_DEFAULT, "%@ #ofActiveCalls %d callAudioSessionActive %d callState %d -> %d", buf, 0x24u);
    }

    -[ContinuityCaptureRemoteUISystemStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("callState"));
    atomic_store(v3, (unint64_t *)&self->_callState);
    -[ContinuityCaptureRemoteUISystemStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("callState"));
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = self->_observers;
    v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "callActive:", v3 == 0, (_QWORD)v13);
        }
        v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)setupCallStateMonitoring
{
  TUCallCenter *v3;
  TUCallCenter *callCenter;
  TUNeighborhoodActivityConduit *v5;
  TUNeighborhoodActivityConduit *callCenterNeighborhoodActivityConduit;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  objc_msgSend(MEMORY[0x24BEB4938], "sharedInstance");
  v3 = (TUCallCenter *)objc_claimAutoreleasedReturnValue();
  callCenter = self->_callCenter;
  self->_callCenter = v3;

  -[TUCallCenter neighborhoodActivityConduit](self->_callCenter, "neighborhoodActivityConduit");
  v5 = (TUNeighborhoodActivityConduit *)objc_claimAutoreleasedReturnValue();
  callCenterNeighborhoodActivityConduit = self->_callCenterNeighborhoodActivityConduit;
  self->_callCenterNeighborhoodActivityConduit = v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__handleCallStatusChangedNotification_, *MEMORY[0x24BEB4AB8], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__handleCallStatusChangedNotification_, *MEMORY[0x24BEB4AD0], 0);

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[TUCallCenter currentAudioAndVideoCalls](self->_callCenter, "currentAudioAndVideoCalls", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        -[ContinuityCaptureRemoteUISystemStatus _handleCall:](self, "_handleCall:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v13++));
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  -[ContinuityCaptureRemoteUISystemStatus _setupAVSystemController](self, "_setupAVSystemController");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:object:", self, sel__avSystemControllerProcessDied, *MEMORY[0x24BE64908], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addObserver:selector:name:object:", self, sel__handleCallAudioSessionActiveNotification_, *MEMORY[0x24BE647F8], 0);

}

- (void)_handleCall:(id)a3
{
  id v4;
  NSMutableSet *v5;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSHashTable *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  NSMutableSet *incomingCallIDs;
  void *v36;
  NSMutableSet *activeCallIds;
  void *v38;
  id v39;
  void *v40;
  NSHashTable *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t j;
  NSMutableSet *v46;
  void *v47;
  void *v48;
  NSHashTable *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t m;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint8_t buf[4];
  ContinuityCaptureRemoteUISystemStatus *v79;
  __int16 v80;
  uint64_t v81;
  __int16 v82;
  uint64_t v83;
  _BYTE v84[128];
  _BYTE v85[128];
  _BYTE v86[128];
  _BYTE v87[128];
  uint64_t v88;

  v88 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "status") == 4
    && (v5 = self->_incomingCallIDs,
        objc_msgSend(v4, "uniqueProxyIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        LOBYTE(v5) = -[NSMutableSet containsObject:](v5, "containsObject:", v6),
        v6,
        (v5 & 1) == 0))
  {
    v9 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "provider");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isFaceTimeProvider"))
      v11 = -[TUNeighborhoodActivityConduit isRingingFaceTimeCallsOnConnectedTVDevice](self->_callCenterNeighborhoodActivityConduit, "isRingingFaceTimeCallsOnConnectedTVDevice") ^ 1;
    else
      v11 = 1;

    v12 = 0x24BDD1000uLL;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v4, "service"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("kCMContinuityCaptureCallService"));

    objc_msgSend(v4, "provider");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, CFSTR("kCMContinuityCaptureCallProvider"));

    objc_msgSend(v4, "displayName");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v16, CFSTR("kCMContinuityCaptureCallerName"));

    objc_msgSend(v4, "handle");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "type");

    objc_msgSend(v4, "handle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "value");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18 == 2)
    {
      objc_msgSend(v4, "isoCountryCode");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      TUFormattedPhoneNumber();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v22, CFSTR("kCMContinuityCaptureCallerHandle"));

      v12 = 0x24BDD1000;
    }
    else
    {
      objc_msgSend(v9, "setObject:forKeyedSubscript:", v20, CFSTR("kCMContinuityCaptureCallerHandle"));
    }

    objc_msgSend(v4, "callUUID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v23, CFSTR("kCMContinuityCaptureCallUUID"));

    objc_msgSend(v4, "callGroupUUID");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "UUIDString");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v25, CFSTR("kCMContinuityCaptureCallGroupUUID"));

    objc_msgSend(v4, "uniqueProxyIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v26, CFSTR("kCMContinuityCaptureCallUniqueProxyIdentifier"));

    v27 = *(void **)(v12 + 1760);
    objc_msgSend(v4, "provider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "numberWithBool:", objc_msgSend(v28, "isFaceTimeProvider"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v29, CFSTR("kCMContinuityCaptureIsFaceTime"));

    v76 = 0u;
    v77 = 0u;
    v74 = 0u;
    v75 = 0u;
    v30 = self->_observers;
    v31 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v75;
      do
      {
        for (i = 0; i != v32; ++i)
        {
          if (*(_QWORD *)v75 != v33)
            objc_enumerationMutation(v30);
          objc_msgSend(*(id *)(*((_QWORD *)&v74 + 1) + 8 * i), "incomingCall:data:shouldDisplayNotification:", 1, v9, v11);
        }
        v32 = -[NSHashTable countByEnumeratingWithState:objects:count:](v30, "countByEnumeratingWithState:objects:count:", &v74, v87, 16);
      }
      while (v32);
    }

    incomingCallIDs = self->_incomingCallIDs;
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](incomingCallIDs, "addObject:", v36);

  }
  else if (objc_msgSend(v4, "status") != 4)
  {
    v7 = self->_incomingCallIDs;
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v7, "removeObject:", v8);

  }
  if (objc_msgSend(v4, "status") == 1)
  {
    activeCallIds = self->_activeCallIds;
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](activeCallIds, "addObject:", v38);

    v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v40, CFSTR("kCMContinuityCaptureCallUniqueProxyIdentifier"));

    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    v41 = self->_observers;
    v42 = -[NSHashTable countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
    if (v42)
    {
      v43 = v42;
      v44 = *(_QWORD *)v71;
      do
      {
        for (j = 0; j != v43; ++j)
        {
          if (*(_QWORD *)v71 != v44)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v70 + 1) + 8 * j), "incomingCall:data:shouldDisplayNotification:", 1, v39, 0);
        }
        v43 = -[NSHashTable countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v70, v86, 16);
      }
      while (v43);
    }
  }
  else
  {
    if (objc_msgSend(v4, "status") == 6)
    {
      v46 = self->_activeCallIds;
      objc_msgSend(v4, "uniqueProxyIdentifier");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](v46, "removeObject:", v47);

      v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v4, "uniqueProxyIdentifier");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "setObject:forKeyedSubscript:", v48, CFSTR("kCMContinuityCaptureCallUniqueProxyIdentifier"));

      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v49 = self->_observers;
      v50 = -[NSHashTable countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
      if (v50)
      {
        v51 = v50;
        v52 = *(_QWORD *)v67;
        do
        {
          for (k = 0; k != v51; ++k)
          {
            if (*(_QWORD *)v67 != v52)
              objc_enumerationMutation(v49);
            objc_msgSend(*(id *)(*((_QWORD *)&v66 + 1) + 8 * k), "incomingCall:data:shouldDisplayNotification:", 0, v39, 0);
          }
          v51 = -[NSHashTable countByEnumeratingWithState:objects:count:](v49, "countByEnumeratingWithState:objects:count:", &v66, v85, 16);
        }
        while (v51);
      }

      if (objc_msgSend(v4, "disconnectedReason") == 2)
      {
        -[ContinuityCaptureRemoteUISystemStatus willChangeValueForKey:](self, "willChangeValueForKey:", CFSTR("callState"));
        atomic_store(2uLL, (unint64_t *)&self->_callState);
        -[ContinuityCaptureRemoteUISystemStatus didChangeValueForKey:](self, "didChangeValueForKey:", CFSTR("callState"));
      }
      goto LABEL_47;
    }
    if (objc_msgSend(v4, "status") != 2)
      goto LABEL_48;
    v39 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    objc_msgSend(v4, "uniqueProxyIdentifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKeyedSubscript:", v54, CFSTR("kCMContinuityCaptureCallUniqueProxyIdentifier"));

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v41 = self->_observers;
    v55 = -[NSHashTable countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
    if (v55)
    {
      v56 = v55;
      v57 = *(_QWORD *)v63;
      do
      {
        for (m = 0; m != v56; ++m)
        {
          if (*(_QWORD *)v63 != v57)
            objc_enumerationMutation(v41);
          objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * m), "incomingCall:data:shouldDisplayNotification:", 0, v39, 0, (_QWORD)v62);
        }
        v56 = -[NSHashTable countByEnumeratingWithState:objects:count:](v41, "countByEnumeratingWithState:objects:count:", &v62, v84, 16);
      }
      while (v56);
    }
  }

LABEL_47:
LABEL_48:
  CMContinuityCaptureLog(0);
  v59 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
  {
    v60 = -[NSMutableSet count](self->_activeCallIds, "count");
    v61 = -[NSMutableSet count](self->_incomingCallIDs, "count");
    *(_DWORD *)buf = 138412802;
    v79 = self;
    v80 = 2048;
    v81 = v60;
    v82 = 2048;
    v83 = v61;
    _os_log_impl(&dword_227C5D000, v59, OS_LOG_TYPE_DEFAULT, "%@ #ofActiveCalls %ld, #ofIncomingCalls: %ld", buf, 0x20u);
  }

  -[ContinuityCaptureRemoteUISystemStatus _resolveActiveCallState](self, "_resolveActiveCallState");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeCallIds, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_incomingCallIDs, 0);
  objc_storeStrong((id *)&self->_avSystemController, 0);
  objc_storeStrong((id *)&self->_callCenterNeighborhoodActivityConduit, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
