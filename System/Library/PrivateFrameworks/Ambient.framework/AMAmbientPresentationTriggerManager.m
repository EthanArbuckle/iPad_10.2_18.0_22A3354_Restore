@implementation AMAmbientPresentationTriggerManager

- (AMAmbientPresentationTriggerManager)initWithMagicMountManager:(id)a3
{
  id v5;
  AMAmbientPresentationTriggerManager *v6;
  AMAmbientPresentationTriggerManager *v7;

  v5 = a3;
  v6 = -[AMAmbientPresentationTriggerManager init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_overridenMagicMountManager, a3);

  return v7;
}

- (void)setPresentationDetectionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (self->_presentationDetectionEnabled != a3)
  {
    v3 = a3;
    AMLogPresentation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_235FFE000, v5, OS_LOG_TYPE_DEFAULT, "Ambient presentation detection enabled : %{BOOL}d", (uint8_t *)v6, 8u);
    }

    self->_presentationDetectionEnabled = v3;
    -[AMAmbientPresentationTriggerManager _setDeviceBatteryMonitoringEnabled:](self, "_setDeviceBatteryMonitoringEnabled:", v3);
    if (v3)
      -[AMAmbientPresentationTriggerManager _setupMagicMountDetectionIfNecessary](self, "_setupMagicMountDetectionIfNecessary");
    else
      -[AMAmbientPresentationTriggerManager _disableMagicMountDetection](self, "_disableMagicMountDetection");
  }
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;

  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (int64_t)_currentTriggerState
{
  if (-[AMAmbientPresentationTriggerManager _effectiveMountState](self, "_effectiveMountState") == 1)
    return -[AMAmbientPresentationTriggerManager _isDeviceBatteryCharging](self, "_isDeviceBatteryCharging");
  else
    return 0;
}

- (int64_t)_currentMountState
{
  void *v3;
  void *v5;
  uint64_t v6;

  if (!-[AMAmbientPresentationTriggerManager _isDeviceBatteryCharging](self, "_isDeviceBatteryCharging"))
    return 0;
  -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMounted"))
  {

    return 3;
  }
  else
  {
    -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "mountStatus");

    if ((unint64_t)(v6 - 2) >= 3)
      return 0;
    else
      return v6 - 1;
  }
}

- (int64_t)_currentPresentationState
{
  void *v3;
  void *v5;
  uint64_t v6;

  if (!-[AMAmbientPresentationTriggerManager _isDeviceBatteryCharging](self, "_isDeviceBatteryCharging"))
    return 0;
  -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isMounted"))
  {

    return 1;
  }
  -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "mountStatus");

  if ((unint64_t)(v6 - 2) <= 2)
    return qword_236005380[v6 - 2];
  else
    return 0;
}

- (void)_updateAmbientTriggerState
{
  int64_t v3;
  _BOOL4 v4;
  int64_t v5;
  NSObject *v6;
  _BOOL4 v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  unint64_t v11;
  const __CFString *v12;
  _BOOL4 v13;
  int64_t v14;
  __CFString *v15;
  __CFString *v16;
  int v17;
  __CFString *v18;
  __int16 v19;
  _BOOL4 v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  _BOOL4 v24;
  __int16 v25;
  _BOOL4 v26;
  __int16 v27;
  __CFString *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v3 = -[AMAmbientPresentationTriggerManager _effectiveMountState](self, "_effectiveMountState");
  v4 = -[AMAmbientPresentationTriggerManager _isDeviceBatteryCharging](self, "_isDeviceBatteryCharging");
  v5 = -[AMAmbientPresentationTriggerManager _currentTriggerState](self, "_currentTriggerState");
  AMLogPresentation();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = v3 == 1;
    v8 = CFSTR("asserted");
    if (v5 != 1)
      v8 = CFSTR("unknown");
    if (!v5)
      v8 = CFSTR("idle");
    v9 = v8;
    -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "mountStatus") - 1;
    v12 = CFSTR("unknown");
    if (v11 <= 3)
      v12 = off_25075F888[v11];
    v13 = -[AMAmbientPresentationTriggerManager _ignoreBatteryChargingForPresentation](self, "_ignoreBatteryChargingForPresentation");
    v14 = -[AMAmbientPresentationTriggerManager _effectiveMountState](self, "_effectiveMountState");
    v15 = CFSTR("mounted");
    if (v14 != 1)
      v15 = CFSTR("unknown");
    if (!v14)
      v15 = CFSTR("unmounted");
    v16 = v15;
    v17 = 138544642;
    v18 = v9;
    v19 = 1024;
    v20 = v7;
    v21 = 2114;
    v22 = v12;
    v23 = 1024;
    v24 = v4;
    v25 = 1024;
    v26 = v13;
    v27 = 2114;
    v28 = v16;
    _os_log_impl(&dword_235FFE000, v6, OS_LOG_TYPE_DEFAULT, "Updating ambient trigger state : %{public}@ [ isMounted : %{BOOL}d ; mountStatus : %{public}@ ; isCharging : %{BOO"
      "L}d ; ignoreCharging : %{BOOL}d ; effectiveMountState : %{public}@ ]",
      (uint8_t *)&v17,
      0x32u);

  }
  -[AMAmbientPresentationTriggerManager _notifyObserversUpdatedAmbientPresentationState:](self, "_notifyObserversUpdatedAmbientPresentationState:", -[AMAmbientPresentationTriggerManager _currentPresentationState](self, "_currentPresentationState"));
  -[AMAmbientPresentationTriggerManager _notifyObserversUpdatedAmbientTriggerState:](self, "_notifyObserversUpdatedAmbientTriggerState:", v5);
}

- (void)_updateAmbientMountState
{
  _BOOL4 v3;
  unint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  unint64_t v8;
  const __CFString *v9;
  _BOOL4 v10;
  int64_t v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  const __CFString *v15;
  __int16 v16;
  const __CFString *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  _BOOL4 v21;
  __int16 v22;
  __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = -[AMAmbientPresentationTriggerManager _isDeviceBatteryCharging](self, "_isDeviceBatteryCharging");
  v4 = -[AMAmbientPresentationTriggerManager _currentMountState](self, "_currentMountState");
  AMLogPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    if (v4 > 3)
      v6 = CFSTR("unknown");
    else
      v6 = off_25075F868[v4];
    -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "mountStatus") - 1;
    v9 = CFSTR("unknown");
    if (v8 <= 3)
      v9 = off_25075F888[v8];
    v10 = -[AMAmbientPresentationTriggerManager _ignoreBatteryChargingForPresentation](self, "_ignoreBatteryChargingForPresentation");
    v11 = -[AMAmbientPresentationTriggerManager _effectiveMountState](self, "_effectiveMountState");
    v12 = CFSTR("mounted");
    if (v11 != 1)
      v12 = CFSTR("unknown");
    if (!v11)
      v12 = CFSTR("unmounted");
    v13 = v12;
    v14 = 138544386;
    v15 = v6;
    v16 = 2114;
    v17 = v9;
    v18 = 1024;
    v19 = v3;
    v20 = 1024;
    v21 = v10;
    v22 = 2114;
    v23 = v13;
    _os_log_impl(&dword_235FFE000, v5, OS_LOG_TYPE_DEFAULT, "Updating ambient mount state : %{public}@ [ mountStatus : %{public}@ ; isCharging : %{BOOL}d ; ignoreCharging : %{"
      "BOOL}d ; effectiveMountState : %{public}@ ]",
      (uint8_t *)&v14,
      0x2Cu);

  }
  -[AMAmbientPresentationTriggerManager _notifyObserversUpdatedAmbientPresentationState:](self, "_notifyObserversUpdatedAmbientPresentationState:", -[AMAmbientPresentationTriggerManager _currentPresentationState](self, "_currentPresentationState"));
  -[AMAmbientPresentationTriggerManager _notifyObserversUpdatedAmbientMountState:](self, "_notifyObserversUpdatedAmbientMountState:", v4);
}

- (void)_updateEffectiveMountState
{
  void *v3;
  uint64_t v4;
  int64_t v5;
  _BOOL8 v6;

  -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "mountStatus");

  v5 = -[AMAmbientPresentationTriggerManager _effectiveMountState](self, "_effectiveMountState");
  if (v5 == 1)
  {
    v6 = v4 != 1;
  }
  else
  {
    v6 = v5;
    if (!v5)
      v6 = v4 == 4
        || v4 == 3
        && -[AMAmbientPresentationTriggerManager _analogousTriggerEvents](self, "_analogousTriggerEvents", 0);
  }
  -[AMAmbientPresentationTriggerManager _setEffectiveMountState:](self, "_setEffectiveMountState:", v6);
}

- (void)_setEffectiveMountState:(int64_t)a3
{
  NSObject *v5;
  const __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;
  unint64_t v10;
  int v11;
  __CFString *v12;
  __int16 v13;
  const __CFString *v14;
  __int16 v15;
  _BOOL4 v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  AMLogPresentation();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = CFSTR("unknown");
    v7 = CFSTR("mounted");
    if (a3 != 1)
      v7 = CFSTR("unknown");
    if (!a3)
      v7 = CFSTR("unmounted");
    v8 = v7;
    -[AMAmbientPresentationTriggerManager cachedMagicMountState](self, "cachedMagicMountState");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "mountStatus") - 1;
    if (v10 <= 3)
      v6 = off_25075F888[v10];
    v11 = 138543874;
    v12 = v8;
    v13 = 2114;
    v14 = v6;
    v15 = 1024;
    v16 = -[AMAmbientPresentationTriggerManager _analogousTriggerEvents](self, "_analogousTriggerEvents");
    _os_log_impl(&dword_235FFE000, v5, OS_LOG_TYPE_DEFAULT, "Updating ambient effective mount state : %{public}@ [ mountStatus : %{public}@ ; analogousTriggerEvents : %{BOOL}d ]",
      (uint8_t *)&v11,
      0x1Cu);

  }
  if (self->_effectiveMountState != a3)
  {
    self->_effectiveMountState = a3;
    -[AMAmbientPresentationTriggerManager _updateAmbientTriggerState](self, "_updateAmbientTriggerState");
  }
}

- (void)_notifyObserversUpdatedAmbientPresentationState:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[6];

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __87__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientPresentationState___block_invoke;
  v7[3] = &unk_25075F7F8;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __87__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientPresentationState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "ambientPresentationManager:didUpdatePresentationState:analogousTriggerEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_analogousTriggerEvents"));
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "ambientPresentationManager:didUpdatePresentationState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  }

}

- (void)_notifyObserversUpdatedAmbientTriggerState:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[6];

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __82__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientTriggerState___block_invoke;
  v7[3] = &unk_25075F7F8;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __82__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientTriggerState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "ambientPresentationManager:didUpdateTriggerState:analogousTriggerEvents:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "_analogousTriggerEvents"));

}

- (void)_notifyObserversUpdatedAmbientMountState:(int64_t)a3
{
  void *v5;
  id v6;
  _QWORD v7[6];

  -[NSHashTable allObjects](self->_observers, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "copy");

  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __80__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientMountState___block_invoke;
  v7[3] = &unk_25075F7F8;
  v7[4] = self;
  v7[5] = a3;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

void __80__AMAmbientPresentationTriggerManager__notifyObserversUpdatedAmbientMountState___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "ambientPresentationManager:didUpdateMountState:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (BOOL)_analogousTriggerEvents
{
  NSDate *batteryStateChangeTimestamp;
  double v4;
  double v5;
  BOOL v6;
  NSObject *v7;
  NSDate *v8;
  NSDate *magicMountEventTimestamp;
  _DWORD v11[2];
  __int16 v12;
  double v13;
  __int16 v14;
  NSDate *v15;
  __int16 v16;
  NSDate *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (!-[AMAmbientPresentationTriggerManager _currentMountState](self, "_currentMountState"))
    return 0;
  batteryStateChangeTimestamp = self->_batteryStateChangeTimestamp;
  if (!batteryStateChangeTimestamp || !self->_magicMountEventTimestamp)
    return 0;
  -[NSDate timeIntervalSinceDate:](batteryStateChangeTimestamp, "timeIntervalSinceDate:");
  v5 = fabs(v4);
  v6 = v5 < 3.0;
  AMLogPresentation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = self->_batteryStateChangeTimestamp;
    magicMountEventTimestamp = self->_magicMountEventTimestamp;
    v11[0] = 67109890;
    v11[1] = v5 < 3.0;
    v12 = 2048;
    v13 = v5;
    v14 = 2114;
    v15 = v8;
    v16 = 2114;
    v17 = magicMountEventTimestamp;
    _os_log_impl(&dword_235FFE000, v7, OS_LOG_TYPE_DEFAULT, "Ambient presentation trigger events analogous : %{BOOL}d [ timeInterval : %.2f sec ; batteryTimestamp : %{public}@"
      " ; magicMountTimestamp : %{public}@ ]",
      (uint8_t *)v11,
      0x26u);
  }

  return v6;
}

- (void)_setupMagicMountDetectionIfNecessary
{
  CMMagicMountManager *overridenMagicMountManager;
  CMMagicMountManager *v4;
  CMMagicMountManager *magicMountManager;
  CMMagicMountManager *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id location;

  if (!self->_magicMountManager)
  {
    overridenMagicMountManager = self->_overridenMagicMountManager;
    if (overridenMagicMountManager)
      v4 = overridenMagicMountManager;
    else
      v4 = (CMMagicMountManager *)objc_alloc_init(MEMORY[0x24BDC13E8]);
    magicMountManager = self->_magicMountManager;
    self->_magicMountManager = v4;

    -[CMMagicMountManager setMagicMountConfiguration:](self->_magicMountManager, "setMagicMountConfiguration:", 2);
    objc_initWeak(&location, self);
    v6 = self->_magicMountManager;
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __75__AMAmbientPresentationTriggerManager__setupMagicMountDetectionIfNecessary__block_invoke;
    v8[3] = &unk_25075F820;
    objc_copyWeak(&v9, &location);
    -[CMMagicMountManager startMagicMountUpdatesToQueue:withHandler:](v6, "startMagicMountUpdatesToQueue:withHandler:", v7, v8);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }
}

void __75__AMAmbientPresentationTriggerManager__setupMagicMountDetectionIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  const __CFString *v7;
  _QWORD *WeakRetained;
  uint64_t v9;
  void *v10;
  _DWORD v11[2];
  __int16 v12;
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  AMLogPresentation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = objc_msgSend(v3, "isMounted");
    v6 = objc_msgSend(v3, "mountStatus");
    if ((unint64_t)(v6 - 1) > 3)
      v7 = CFSTR("unknown");
    else
      v7 = off_25075F888[v6 - 1];
    v11[0] = 67109378;
    v11[1] = v5;
    v12 = 2114;
    v13 = v7;
    _os_log_impl(&dword_235FFE000, v4, OS_LOG_TYPE_DEFAULT, "Ambient magic mount state change detected [ isMounted : %{BOOL}d ; status : %{public}@ ]",
      (uint8_t *)v11,
      0x12u);
  }

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCachedMagicMountState:", v3);
  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)WeakRetained[2];
  WeakRetained[2] = v9;

  objc_msgSend(WeakRetained, "_updateEffectiveMountState");
  objc_msgSend(WeakRetained, "_updateAmbientMountState");
  objc_msgSend(WeakRetained, "_updateAmbientTriggerState");

}

- (void)_disableMagicMountDetection
{
  CMMagicMountManager *magicMountManager;
  CMMagicMountManager *v4;
  CMMagicMountState *cachedMagicMountState;

  magicMountManager = self->_magicMountManager;
  if (magicMountManager)
  {
    -[CMMagicMountManager stopMagicMountUpdates](magicMountManager, "stopMagicMountUpdates");
    v4 = self->_magicMountManager;
    self->_magicMountManager = 0;

    cachedMagicMountState = self->_cachedMagicMountState;
    self->_cachedMagicMountState = 0;

  }
}

- (void)_setDeviceBatteryMonitoringEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__deviceBatteryStateChanged, *MEMORY[0x24BDF76D0], 0);
  else
    objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF76D0], 0);

}

- (void)_deviceBatteryStateChanged
{
  NSObject *v3;
  NSDate *v4;
  NSDate *batteryStateChangeTimestamp;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  AMLogPresentation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = -[AMAmbientPresentationTriggerManager _isDeviceBatteryCharging](self, "_isDeviceBatteryCharging");
    _os_log_impl(&dword_235FFE000, v3, OS_LOG_TYPE_DEFAULT, "Ambient device battery state change detected [ isDeviceBatteryCharging : %{BOOL}d ]", (uint8_t *)v6, 8u);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  batteryStateChangeTimestamp = self->_batteryStateChangeTimestamp;
  self->_batteryStateChangeTimestamp = v4;

  -[AMAmbientPresentationTriggerManager _updateEffectiveMountState](self, "_updateEffectiveMountState");
  -[AMAmbientPresentationTriggerManager _updateAmbientMountState](self, "_updateAmbientMountState");
  -[AMAmbientPresentationTriggerManager _updateAmbientTriggerState](self, "_updateAmbientTriggerState");
}

- (BOOL)_isDeviceBatteryCharging
{
  char v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  _DWORD v10[2];
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[AMAmbientPresentationTriggerManager _ignoreBatteryChargingForPresentation](self, "_ignoreBatteryChargingForPresentation"))
  {
    return 1;
  }
  -[AMAmbientPresentationTriggerManager overriddenBatteryChargingState](self, "overriddenBatteryChargingState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[AMAmbientPresentationTriggerManager overriddenBatteryChargingState](self, "overriddenBatteryChargingState");
    v5 = objc_claimAutoreleasedReturnValue();
    v3 = -[NSObject BOOLValue](v5, "BOOLValue");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "batteryState");

    v8 = v7 & 0xFFFFFFFFFFFFFFFELL;
    v3 = (v7 & 0xFFFFFFFFFFFFFFFELL) == 2;
    AMLogPresentation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109120;
      v10[1] = v8 == 2;
      _os_log_impl(&dword_235FFE000, v5, OS_LOG_TYPE_DEFAULT, "Ambient determining battery charging = %{BOOL}d ", (uint8_t *)v10, 8u);
    }
  }

  return v3;
}

- (void)testSetOverrideBatteryCharging:(BOOL)a3
{
  self->_overriddenBatteryChargingState = (NSNumber *)(id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  -[AMAmbientPresentationTriggerManager _deviceBatteryStateChanged](self, "_deviceBatteryStateChanged");
}

- (BOOL)_ignoreBatteryChargingForPresentation
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_ambientDefaults);
  v3 = objc_msgSend(WeakRetained, "ignoreBatteryChargingForPresentation");

  return v3;
}

- (void)setAmbientDefaults:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id location;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_ambientDefaults);

  if (WeakRetained != v4)
  {
    objc_storeWeak((id *)&self->_ambientDefaults, v4);
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "ignoreBatteryChargingForPresentation");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC9B8];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __58__AMAmbientPresentationTriggerManager_setAmbientDefaults___block_invoke;
    v10[3] = &unk_25075F848;
    objc_copyWeak(&v11, &location);
    v9 = (id)objc_msgSend(v4, "observeDefaults:onQueue:withBlock:", v7, MEMORY[0x24BDAC9B8], v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }

}

void __58__AMAmbientPresentationTriggerManager_setAmbientDefaults___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateEffectiveMountState");
  objc_msgSend(WeakRetained, "_updateAmbientTriggerState");

}

- (int64_t)_effectiveMountState
{
  return self->_effectiveMountState;
}

- (BOOL)isPresentationDetectionEnabled
{
  return self->_presentationDetectionEnabled;
}

- (AMAmbientDefaults)ambientDefaults
{
  return (AMAmbientDefaults *)objc_loadWeakRetained((id *)&self->_ambientDefaults);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (CMMagicMountManager)magicMountManager
{
  return self->_magicMountManager;
}

- (void)setMagicMountManager:(id)a3
{
  objc_storeStrong((id *)&self->_magicMountManager, a3);
}

- (CMMagicMountState)cachedMagicMountState
{
  return self->_cachedMagicMountState;
}

- (void)setCachedMagicMountState:(id)a3
{
  objc_storeStrong((id *)&self->_cachedMagicMountState, a3);
}

- (CMMagicMountManager)overridenMagicMountManager
{
  return self->_overridenMagicMountManager;
}

- (void)setOverridenMagicMountManager:(id)a3
{
  objc_storeStrong((id *)&self->_overridenMagicMountManager, a3);
}

- (NSNumber)overriddenBatteryChargingState
{
  return self->_overriddenBatteryChargingState;
}

- (void)setOverriddenBatteryChargingState:(id)a3
{
  self->_overriddenBatteryChargingState = (NSNumber *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overridenMagicMountManager, 0);
  objc_storeStrong((id *)&self->_cachedMagicMountState, 0);
  objc_storeStrong((id *)&self->_magicMountManager, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_ambientDefaults);
  objc_storeStrong((id *)&self->_magicMountEventTimestamp, 0);
  objc_storeStrong((id *)&self->_batteryStateChangeTimestamp, 0);
}

@end
