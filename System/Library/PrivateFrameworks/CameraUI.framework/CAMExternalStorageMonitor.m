@implementation CAMExternalStorageMonitor

- (CAMExternalStorageMonitor)init
{
  CAMExternalStorageMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *authorizationQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CAMExternalStorageMonitor;
  v2 = -[CAMExternalStorageMonitor init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.camera.external-storage-auth-queue", v3);
    authorizationQueue = v2->__authorizationQueue;
    v2->__authorizationQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)setMonitoringState:(unint64_t)a3
{
  unint64_t monitoringState;

  monitoringState = self->_monitoringState;
  if (monitoringState != a3)
  {
    self->_monitoringState = a3;
    -[CAMExternalStorageMonitor _logMonitoringChangeFromState:toState:](self, "_logMonitoringChangeFromState:toState:", monitoringState, a3);
    if (a3 == 1)
    {
      if (-[CAMExternalStorageMonitor _isObservingKVO](self, "_isObservingKVO"))
        -[CAMExternalStorageMonitor _resumeMonitoring](self, "_resumeMonitoring");
      else
        -[CAMExternalStorageMonitor _beginMonitoring](self, "_beginMonitoring");
    }
    else if (!a3)
    {
      -[CAMExternalStorageMonitor _endMonitoring](self, "_endMonitoring");
    }
  }
}

- (void)_endMonitoring
{
  void *v3;
  void *v4;
  id v5;

  if (-[CAMExternalStorageMonitor _isObservingKVO](self, "_isObservingKVO"))
  {
    -[CAMExternalStorageMonitor _externalStorageDiscoverySession](self, "_externalStorageDiscoverySession");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("externalStorageDevices"));

    -[CAMExternalStorageMonitor set_isObservingKVO:](self, "set_isObservingKVO:", 0);
  }
  -[CAMExternalStorageMonitor delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99D20]);
  objc_msgSend(v4, "externalStorageMonitor:didChangeConnectedStorageDevices:", self, v5);

  -[CAMExternalStorageMonitor set_externalStorageDiscoverySession:](self, "set_externalStorageDiscoverySession:", 0);
}

- (void)_beginMonitoring
{
  void *v3;
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  _QWORD aBlock[5];

  objc_msgSend(MEMORY[0x1E0C8B1D0], "sharedSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMExternalStorageMonitor set_externalStorageDiscoverySession:](self, "set_externalStorageDiscoverySession:", v3);

  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke;
  aBlock[3] = &unk_1EA328868;
  aBlock[4] = self;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_4;
  v10 = &unk_1EA32BB70;
  v11 = _Block_copy(aBlock);
  v4 = v11;
  v5 = _Block_copy(&v7);
  -[CAMExternalStorageMonitor _authorizationQueue](self, "_authorizationQueue", v7, v8, v9, v10);
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v6, v5);

}

void __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "monitoringState") == 1)
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "_isObservingKVO") & 1) != 0)
    {
      v2 = os_log_create("com.apple.camera", "Camera");
      if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v6) = 0;
        _os_log_impl(&dword_1DB760000, v2, OS_LOG_TYPE_DEFAULT, "External Storage: skipping setting up KVO since we're already observing", (uint8_t *)&v6, 2u);
      }

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_externalStorageDiscoverySession");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObserver:forKeyPath:options:context:", *(_QWORD *)(a1 + 32), CFSTR("externalStorageDevices"), 5, 0);

      objc_msgSend(*(id *)(a1 + 32), "set_isObservingKVO:", 1);
    }
  }
  else
  {
    v3 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend((id)objc_opt_class(), "_stringFromMonitoringState:", objc_msgSend(*(id *)(a1 + 32), "monitoringState"));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "External Storage: skipping setting up KVO since we're not in a monitoring state (%{public}@)", (uint8_t *)&v6, 0xCu);

    }
  }
}

void __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(MEMORY[0x1E0C8B1C8], "authorizationStatus");
  v3 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v9 = v2;
    _os_log_impl(&dword_1DB760000, v3, OS_LOG_TYPE_DEFAULT, "External Storage: current authorization status %ld monitoring for updates", buf, 0xCu);
  }

  if (v2 == 3)
  {
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
  }
  else if (!v2)
  {
    v4 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "External Storage: requesting access", buf, 2u);
    }

    v5 = (void *)MEMORY[0x1E0C8B1C8];
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_6;
    v6[3] = &unk_1EA32A6A8;
    v7 = *(id *)(a1 + 32);
    objc_msgSend(v5, "requestAccessWithCompletionHandler:", v6);

  }
}

void __45__CAMExternalStorageMonitor__beginMonitoring__block_invoke_6(uint64_t a1, int a2)
{
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("denied");
    if (a2)
      v5 = CFSTR("granted");
    v6 = 138543362;
    v7 = v5;
    _os_log_impl(&dword_1DB760000, v4, OS_LOG_TYPE_DEFAULT, "External Storage: access %{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (a2)
    dispatch_async(MEMORY[0x1E0C80D38], *(dispatch_block_t *)(a1 + 32));
}

- (void)_resumeMonitoring
{
  void *v3;
  id v4;

  if (-[CAMExternalStorageMonitor _hasPendingChangesSinceLastDelegateCall](self, "_hasPendingChangesSinceLastDelegateCall"))
  {
    -[CAMExternalStorageMonitor set_hasPendingChangesSinceLastDelegateCall:](self, "set_hasPendingChangesSinceLastDelegateCall:", 0);
    -[CAMExternalStorageMonitor delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[CAMExternalStorageMonitor connectedStorageDevices](self, "connectedStorageDevices");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "externalStorageMonitor:didChangeConnectedStorageDevices:", self, v3);

  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  CAMExternalStorage *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  CAMExternalStorageMonitor *v24;
  id v25;
  _QWORD block[5];
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  void *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("externalStorageDevices"), a4, a5, a6))
  {
    -[CAMExternalStorageMonitor _externalStorageDiscoverySession](self, "_externalStorageDiscoverySession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "externalStorageDevices");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v9 = os_log_create("com.apple.camera", "Camera");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v33 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1DB760000, v9, OS_LOG_TYPE_DEFAULT, "External Storage: list of devices updated, %ld connected devices", buf, 0xCu);
    }
    v24 = self;

    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v10 = v8;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    if (v11)
    {
      v12 = v11;
      v13 = 0;
      v14 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v29 != v14)
            objc_enumerationMutation(v10);
          v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
          if ((objc_msgSend(v16, "isConnected", v24) & 1) != 0)
          {
            if (objc_msgSend(v16, "isNotRecommendedForCaptureUse"))
            {
              v17 = (CAMExternalStorage *)os_log_create("com.apple.camera", "Camera");
              if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
              {
                objc_msgSend(v16, "displayName");
                v18 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v16, "baseURL");
                v19 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543618;
                v33 = (uint64_t)v18;
                v34 = 2114;
                v35 = v19;
                _os_log_impl(&dword_1DB760000, &v17->super, OS_LOG_TYPE_DEFAULT, "External Storage: ignoring not recommended storage device (%{public}@) on mount point %{public}@", buf, 0x16u);

              }
              v13 = 1;
            }
            else
            {
              v17 = -[CAMExternalStorage initWithStorageDevice:]([CAMExternalStorage alloc], "initWithStorageDevice:", v16);
              objc_msgSend(v25, "addObject:", v17);
            }
          }
          else
          {
            v17 = (CAMExternalStorage *)os_log_create("com.apple.camera", "Camera");
            if (os_log_type_enabled(&v17->super, OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v16, "displayName");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "baseURL");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v33 = (uint64_t)v20;
              v34 = 2114;
              v35 = v21;
              _os_log_impl(&dword_1DB760000, &v17->super, OS_LOG_TYPE_DEFAULT, "External Storage: ignoring disconnected storage device (%{public}@) on mount point %{public}@", buf, 0x16u);

            }
          }

        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
      }
      while (v12);
    }
    else
    {
      v13 = 0;
    }

    objc_storeStrong((id *)&v24->_connectedStorageDevices, v25);
    v24->_hasExternalStorageNotRecommendedForCapture = v13 & 1;
    v22 = -[CAMExternalStorageMonitor monitoringState](v24, "monitoringState");
    switch(v22)
    {
      case 2:
        goto LABEL_24;
      case 1:
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __76__CAMExternalStorageMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke;
        block[3] = &unk_1EA328A40;
        block[4] = v24;
        v27 = v25;
        dispatch_async(MEMORY[0x1E0C80D38], block);

        break;
      case 0:
LABEL_24:
        v23 = os_log_create("com.apple.camera", "Camera");
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1DB760000, v23, OS_LOG_TYPE_DEFAULT, "External storage: devices where update while monitoring was paused", buf, 2u);
        }

        -[CAMExternalStorageMonitor set_hasPendingChangesSinceLastDelegateCall:](v24, "set_hasPendingChangesSinceLastDelegateCall:", 1);
        break;
    }

  }
}

void __76__CAMExternalStorageMonitor_observeValueForKeyPath_ofObject_change_context___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "set_hasPendingChangesSinceLastDelegateCall:", 0);
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "externalStorageMonitor:didChangeConnectedStorageDevices:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_logMonitoringChangeFromState:(unint64_t)a3 toState:(unint64_t)a4
{
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = os_log_create("com.apple.camera", "Camera");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "_stringFromMonitoringState:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_stringFromMonitoringState:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMExternalStorageMonitor _externalStorageDiscoverySession](self, "_externalStorageDiscoverySession");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "externalStorageDevices");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2048;
    v17 = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1DB760000, v7, OS_LOG_TYPE_DEFAULT, "External storage: monitoring state changed from (%{public}@) to (%{public}@), %ld connected devices", (uint8_t *)&v12, 0x20u);

  }
}

+ (id)_stringFromMonitoringState:(unint64_t)a3
{
  const __CFString *v3;

  v3 = CFSTR("None");
  if (a3 == 2)
    v3 = CFSTR("Paused");
  if (a3 == 1)
    return CFSTR("Monitoring");
  else
    return (id)v3;
}

- (CAMExternalStorageMonitorDelegate)delegate
{
  return (CAMExternalStorageMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)monitoringState
{
  return self->_monitoringState;
}

- (NSArray)connectedStorageDevices
{
  return self->_connectedStorageDevices;
}

- (BOOL)hasExternalStorageNotRecommendedForCapture
{
  return self->_hasExternalStorageNotRecommendedForCapture;
}

- (AVExternalStorageDeviceDiscoverySession)_externalStorageDiscoverySession
{
  return self->__externalStorageDiscoverySession;
}

- (void)set_externalStorageDiscoverySession:(id)a3
{
  objc_storeStrong((id *)&self->__externalStorageDiscoverySession, a3);
}

- (id)_monitoringContext
{
  return self->__monitoringContext;
}

- (void)set_monitoringContext:(id)a3
{
  objc_storeStrong(&self->__monitoringContext, a3);
}

- (OS_dispatch_queue)_authorizationQueue
{
  return self->__authorizationQueue;
}

- (BOOL)_isObservingKVO
{
  return self->__isObservingKVO;
}

- (void)set_isObservingKVO:(BOOL)a3
{
  self->__isObservingKVO = a3;
}

- (BOOL)_hasPendingChangesSinceLastDelegateCall
{
  return self->__hasPendingChangesSinceLastDelegateCall;
}

- (void)set_hasPendingChangesSinceLastDelegateCall:(BOOL)a3
{
  self->__hasPendingChangesSinceLastDelegateCall = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__authorizationQueue, 0);
  objc_storeStrong(&self->__monitoringContext, 0);
  objc_storeStrong((id *)&self->__externalStorageDiscoverySession, 0);
  objc_storeStrong((id *)&self->_connectedStorageDevices, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
