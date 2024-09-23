@implementation CUPowerSourceMonitor

- (CUPowerSourceMonitor)init
{
  CUPowerSourceMonitor *v2;
  CUPowerSourceMonitor *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CUPowerSourceMonitor;
  v2 = -[CUPowerSourceMonitor init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_changeFlags = 5;
    if (CUMainQueue_sOnce != -1)
      dispatch_once(&CUMainQueue_sOnce, &__block_literal_global_16);
    objc_storeStrong((id *)&v3->_dispatchQueue, (id)CUMainQueue_sQueue);
    *(_QWORD *)&v3->_psNotifyTokenAccessoryAttach = -1;
    *(_QWORD *)&v3->_psNotifyTokenAccessoryTimeRemaining = -1;
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[CUPowerSourceMonitor _cleanup](self, "_cleanup");
  v3.receiver = self;
  v3.super_class = (Class)CUPowerSourceMonitor;
  -[CUPowerSourceMonitor dealloc](&v3, sel_dealloc);
}

- (void)_cleanup
{
  id invalidationHandler;
  id powerSourceFoundHandler;
  id powerSourceLostHandler;
  id powerSourceChangedHandler;
  NSMutableDictionary *powerSources;
  int psNotifyTokenAccessoryAttach;
  int psNotifyTokenAccessoryPowerSource;
  int psNotifyTokenAccessoryTimeRemaining;
  int psNotifyTokenAnyPowerSource;

  invalidationHandler = self->_invalidationHandler;
  self->_invalidationHandler = 0;

  powerSourceFoundHandler = self->_powerSourceFoundHandler;
  self->_powerSourceFoundHandler = 0;

  powerSourceLostHandler = self->_powerSourceLostHandler;
  self->_powerSourceLostHandler = 0;

  powerSourceChangedHandler = self->_powerSourceChangedHandler;
  self->_powerSourceChangedHandler = 0;

  -[NSMutableDictionary removeAllObjects](self->_powerSources, "removeAllObjects");
  powerSources = self->_powerSources;
  self->_powerSources = 0;

  psNotifyTokenAccessoryAttach = self->_psNotifyTokenAccessoryAttach;
  if (psNotifyTokenAccessoryAttach != -1)
  {
    notify_cancel(psNotifyTokenAccessoryAttach);
    self->_psNotifyTokenAccessoryAttach = -1;
  }
  psNotifyTokenAccessoryPowerSource = self->_psNotifyTokenAccessoryPowerSource;
  if (psNotifyTokenAccessoryPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAccessoryPowerSource);
    self->_psNotifyTokenAccessoryPowerSource = -1;
  }
  psNotifyTokenAccessoryTimeRemaining = self->_psNotifyTokenAccessoryTimeRemaining;
  if (psNotifyTokenAccessoryTimeRemaining != -1)
  {
    notify_cancel(psNotifyTokenAccessoryTimeRemaining);
    self->_psNotifyTokenAccessoryTimeRemaining = -1;
  }
  psNotifyTokenAnyPowerSource = self->_psNotifyTokenAnyPowerSource;
  if (psNotifyTokenAnyPowerSource != -1)
  {
    notify_cancel(psNotifyTokenAnyPowerSource);
    self->_psNotifyTokenAnyPowerSource = -1;
  }
}

- (void)setChangeFlags:(unsigned int)a3
{
  CUPowerSourceMonitor *v4;
  NSObject *dispatchQueue;
  _QWORD v6[5];
  unsigned int v7;

  v4 = self;
  objc_sync_enter(v4);
  if (v4->_activateCalled)
  {
    dispatchQueue = v4->_dispatchQueue;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __39__CUPowerSourceMonitor_setChangeFlags___block_invoke;
    v6[3] = &unk_1E25DE500;
    v7 = a3;
    v6[4] = v4;
    dispatch_async(dispatchQueue, v6);
  }
  else
  {
    v4->_changeFlags = a3;
  }
  objc_sync_exit(v4);

}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  CUPowerSourceMonitor *v5;
  NSObject *dispatchQueue;
  id v7;
  _QWORD v8[5];
  id v9;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v5->_activateCalled = 1;
  dispatchQueue = v5->_dispatchQueue;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __47__CUPowerSourceMonitor_activateWithCompletion___block_invoke;
  v8[3] = &unk_1E25DE600;
  v8[4] = v5;
  v9 = v4;
  v7 = v4;
  dispatch_async(dispatchQueue, v8);

  objc_sync_exit(v5);
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __34__CUPowerSourceMonitor_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_aggregatePowerSourceFound:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  CUPowerSource *v15;
  void *v16;
  _BOOL4 v17;
  NSMutableDictionary *pendingAggregates;
  NSMutableDictionary *aggregateSources;
  NSMutableDictionary *v20;
  NSMutableDictionary *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSMutableDictionary *v26;
  NSMutableDictionary *v27;
  void (**powerSourceFoundHandler)(id, CUPowerSource *);
  id v29;

  v4 = a3;
  v29 = v4;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor != -1
      || (v9 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu), v4 = v29, v9))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceFound:]", 0x1Eu, (uint64_t)"Aggregate power source found: %@", v5, v6, v7, v8, (uint64_t)v4);
      v4 = v29;
    }
  }
  objc_msgSend(v4, "accessoryID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAggregates, "objectForKeyedSubscript:", v14);
    v15 = (CUPowerSource *)objc_claimAutoreleasedReturnValue();
    if (!v15)
      v15 = objc_alloc_init(CUPowerSource);
    objc_msgSend(v29, "partID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isEqualToString:", CFSTR("Left")))
    {
      -[CUPowerSource setSubLeft:](v15, "setSubLeft:", v29);
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("Right")))
    {
      -[CUPowerSource setSubRight:](v15, "setSubRight:", v29);
    }
    else if (objc_msgSend(v16, "isEqualToString:", CFSTR("Case")))
    {
      -[CUPowerSource setSubCase:](v15, "setSubCase:", v29);
    }
    -[CUPowerSource handleSubComponentsUpdatedWithBaseSource:](v15, "handleSubComponentsUpdatedWithBaseSource:", 0);
    v17 = -[CUPowerSource hasAllComponents](v15, "hasAllComponents");
    pendingAggregates = self->_pendingAggregates;
    if (v17)
    {
      -[NSMutableDictionary setObject:forKeyedSubscript:](pendingAggregates, "setObject:forKeyedSubscript:", 0, v14);
      aggregateSources = self->_aggregateSources;
      if (!aggregateSources)
      {
        v20 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v21 = self->_aggregateSources;
        self->_aggregateSources = v20;

        aggregateSources = self->_aggregateSources;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](aggregateSources, "setObject:forKeyedSubscript:", v15, v14);
      if (gLogCategory_CUPowerSourceMonitor <= 30
        && (gLogCategory_CUPowerSourceMonitor != -1
         || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceFound:]", 0x1Eu, (uint64_t)"Aggregate complete: %@", v22, v23, v24, v25, (uint64_t)v15);
      }
      powerSourceFoundHandler = (void (**)(id, CUPowerSource *))self->_powerSourceFoundHandler;
      if (powerSourceFoundHandler)
        powerSourceFoundHandler[2](powerSourceFoundHandler, v15);
    }
    else
    {
      if (!pendingAggregates)
      {
        v26 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
        v27 = self->_pendingAggregates;
        self->_pendingAggregates = v26;

        pendingAggregates = self->_pendingAggregates;
      }
      -[NSMutableDictionary setObject:forKeyedSubscript:](pendingAggregates, "setObject:forKeyedSubscript:", v15, v14);
    }

  }
  else if (gLogCategory_CUPowerSourceMonitor <= 60
         && (gLogCategory_CUPowerSourceMonitor != -1
          || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceFound:]", 0x3Cu, (uint64_t)"### No accessoryID for aggregate found: %@", v10, v11, v12, v13, (uint64_t)v29);
  }

}

- (void)_aggregatePowerSourceLost:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void (**powerSourceChangedHandler)(id, void *, uint64_t);
  void *v22;
  void (**powerSourceLostHandler)(id, void *);
  id v24;

  v24 = a3;
  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceLost:]", 0x1Eu, (uint64_t)"Aggregate power source lost: %@", v4, v5, v6, v7, (uint64_t)v24);
  }
  objc_msgSend(v24, "accessoryID");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAggregates, "objectForKeyedSubscript:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v13;
    if (v13
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateSources, "objectForKeyedSubscript:", v12),
          (v14 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v24, "partID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v19, "isEqualToString:", CFSTR("Left")))
      {
        objc_msgSend(v14, "setSubLeft:", 0);
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("Right")))
      {
        objc_msgSend(v14, "setSubRight:", 0);
      }
      else if (objc_msgSend(v19, "isEqualToString:", CFSTR("Case")))
      {
        objc_msgSend(v14, "setSubCase:", 0);
      }
      objc_msgSend(v14, "handleSubComponentsUpdatedWithBaseSource:", 0);
      objc_msgSend(v14, "subLeft");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v20 || (objc_msgSend(v14, "subRight"), (v20 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
      {

      }
      else
      {
        objc_msgSend(v14, "subCase");
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v22)
        {
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregateSources, "setObject:forKeyedSubscript:", 0, v12);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingAggregates, "setObject:forKeyedSubscript:", 0, v12);
          if (!v13)
          {
            powerSourceLostHandler = (void (**)(id, void *))self->_powerSourceLostHandler;
            if (powerSourceLostHandler)
              powerSourceLostHandler[2](powerSourceLostHandler, v14);
          }
          goto LABEL_25;
        }
      }
      if (v13)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingAggregates, "setObject:forKeyedSubscript:", v14, v12);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregateSources, "setObject:forKeyedSubscript:", v14, v12);
        powerSourceChangedHandler = (void (**)(id, void *, uint64_t))self->_powerSourceChangedHandler;
        if (powerSourceChangedHandler)
          powerSourceChangedHandler[2](powerSourceChangedHandler, v14, 512);
      }
LABEL_25:

      goto LABEL_26;
    }
    if (gLogCategory_CUPowerSourceMonitor <= 60
      && (gLogCategory_CUPowerSourceMonitor != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceLost:]", 0x3Cu, (uint64_t)"### No aggregate found for lost power source: %@", v15, v16, v17, v18, (uint64_t)v24);
    }
  }
  else if (gLogCategory_CUPowerSourceMonitor <= 60
         && (gLogCategory_CUPowerSourceMonitor != -1
          || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceLost:]", 0x3Cu, (uint64_t)"### No accessoryID for aggregate lost: %@", v8, v9, v10, v11, (uint64_t)v24);
  }
LABEL_26:

}

- (void)_aggregatePowerSourceUpdate:(id)a3 changes:(unsigned int)a4
{
  uint64_t v4;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void (**powerSourceChangedHandler)(id, void *, _QWORD);
  id v25;

  v4 = *(_QWORD *)&a4;
  v6 = a3;
  v25 = v6;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor != -1
      || (v11 = _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu), v6 = v25, v11))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:]", 0x1Eu, (uint64_t)"Aggregate power source update: %@", v7, v8, v9, v10, (uint64_t)v6);
      v6 = v25;
    }
  }
  objc_msgSend(v6, "accessoryID");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    -[NSMutableDictionary objectForKeyedSubscript:](self->_pendingAggregates, "objectForKeyedSubscript:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
    v18 = (void *)v17;
    if (v17
      || (-[NSMutableDictionary objectForKeyedSubscript:](self->_aggregateSources, "objectForKeyedSubscript:", v16),
          (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      objc_msgSend(v25, "partID");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v23, "isEqualToString:", CFSTR("Left")))
      {
        objc_msgSend(v18, "setSubLeft:", v25);
      }
      else if (objc_msgSend(v23, "isEqualToString:", CFSTR("Right")))
      {
        objc_msgSend(v18, "setSubRight:", v25);
      }
      else if (objc_msgSend(v23, "isEqualToString:", CFSTR("Case")))
      {
        objc_msgSend(v18, "setSubCase:", v25);
      }
      objc_msgSend(v18, "handleSubComponentsUpdatedWithBaseSource:", 0);
      if (v17)
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pendingAggregates, "setObject:forKeyedSubscript:", v18, v16);
      }
      else
      {
        -[NSMutableDictionary setObject:forKeyedSubscript:](self->_aggregateSources, "setObject:forKeyedSubscript:", v18, v16);
        powerSourceChangedHandler = (void (**)(id, void *, _QWORD))self->_powerSourceChangedHandler;
        if (powerSourceChangedHandler)
          powerSourceChangedHandler[2](powerSourceChangedHandler, v18, v4);
      }

    }
    else if (gLogCategory_CUPowerSourceMonitor <= 60
           && (gLogCategory_CUPowerSourceMonitor != -1
            || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:]", 0x3Cu, (uint64_t)"### No aggregate found for lost power source: %@", v19, v20, v21, v22, (uint64_t)v25);
    }
  }
  else if (gLogCategory_CUPowerSourceMonitor <= 60
         && (gLogCategory_CUPowerSourceMonitor != -1
          || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:]", 0x3Cu, (uint64_t)"### No accessoryID for aggregate changed: %@", v12, v13, v14, v15, (uint64_t)v25);
  }

}

- (void)_update
{
  NSObject *dispatchQueue;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD handler[5];

  if (self->_psNotifyTokenAccessoryAttach == -1)
  {
    dispatchQueue = self->_dispatchQueue;
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __31__CUPowerSourceMonitor__update__block_invoke;
    handler[3] = &unk_1E25DE468;
    handler[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.attach", &self->_psNotifyTokenAccessoryAttach, dispatchQueue, handler);
  }
  if (self->_psNotifyTokenAccessoryPowerSource == -1)
  {
    v4 = self->_dispatchQueue;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __31__CUPowerSourceMonitor__update__block_invoke_2;
    v9[3] = &unk_1E25DE468;
    v9[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.source", &self->_psNotifyTokenAccessoryPowerSource, v4, v9);
  }
  if (self->_psNotifyTokenAccessoryTimeRemaining == -1)
  {
    v5 = self->_dispatchQueue;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __31__CUPowerSourceMonitor__update__block_invoke_3;
    v8[3] = &unk_1E25DE468;
    v8[4] = self;
    notify_register_dispatch("com.apple.system.accpowersources.timeremaining", &self->_psNotifyTokenAccessoryTimeRemaining, v5, v8);
  }
  if (self->_psNotifyTokenAnyPowerSource == -1)
  {
    v6 = self->_dispatchQueue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __31__CUPowerSourceMonitor__update__block_invoke_4;
    v7[3] = &unk_1E25DE468;
    v7[4] = self;
    notify_register_dispatch("com.apple.system.powersources", &self->_psNotifyTokenAnyPowerSource, v6, v7);
  }
}

- (void)_updatePowerSources
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const void *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  CFIndex Count;
  CFIndex v16;
  CFIndex i;
  const void *ValueAtIndex;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  CFDictionaryRef v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  if (gLogCategory_CUPowerSourceMonitor <= 10
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]", 0xAu, (uint64_t)"Update power sources\n", v2, v3, v4, v5, v38);
  }
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_powerSources, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_6848);
  v39 = IOPSCopyExternalPowerAdapterDetails();
  v7 = (const void *)IOPSCopyPowerSourcesByType();
  v12 = v7;
  if (!v7)
  {
    if (gLogCategory_CUPowerSourceMonitor > 60)
      goto LABEL_39;
    if (gLogCategory_CUPowerSourceMonitor != -1
      || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]", 0x3Cu, (uint64_t)"### IOPSCopyPowerSourcesInfo failed\n", v8, v9, v10, v11, v38);
    }
    goto LABEL_33;
  }
  v13 = IOPSCopyPowerSourcesList(v7);
  if (!v13)
  {
LABEL_33:
    if (gLogCategory_CUPowerSourceMonitor <= 60
      && (gLogCategory_CUPowerSourceMonitor != -1
       || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
    {
      LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]", 0x3Cu, (uint64_t)"### IOPSCopyPowerSourcesList failed\n", v8, v9, v10, v11, v38);
    }
    goto LABEL_37;
  }
  v14 = v13;
  Count = CFArrayGetCount(v13);
  if (Count >= 1)
  {
    v16 = Count;
    for (i = 0; i != v16; ++i)
    {
      ValueAtIndex = CFArrayGetValueAtIndex(v14, i);
      IOPSGetPowerSourceDescription(v12, ValueAtIndex);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v19;
      if (v19)
      {
        objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("Power Source ID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (v29)
        {
          -[NSMutableDictionary objectForKeyedSubscript:](self->_powerSources, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          if (v30)
            -[CUPowerSourceMonitor _handlePowerSourceUpdate:desc:adapterDesc:](self, "_handlePowerSourceUpdate:desc:adapterDesc:", v30, v24, v39);
          else
            -[CUPowerSourceMonitor _handlePowerSourceFound:desc:adapterDesc:](self, "_handlePowerSourceFound:desc:adapterDesc:", v29, v24, v39);

        }
        else if (gLogCategory_CUPowerSourceMonitor <= 60
               && (gLogCategory_CUPowerSourceMonitor != -1
                || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
        {
          LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]", 0x3Cu, (uint64_t)"### No ID for power source %##@\n", v25, v26, v27, v28, (uint64_t)v24);
        }

      }
      else if (gLogCategory_CUPowerSourceMonitor <= 60
             && (gLogCategory_CUPowerSourceMonitor != -1
              || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x3Cu)))
      {
        LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _updatePowerSources]", 0x3Cu, (uint64_t)"### IOPSGetPowerSourceDescription %ld failed\n", v20, v21, v22, v23, i);
      }

    }
  }
  CFRelease(v14);
LABEL_37:
  if (v12)
    CFRelease(v12);
LABEL_39:
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  -[NSMutableDictionary allKeys](self->_powerSources, "allKeys");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
  if (v32)
  {
    v33 = v32;
    v34 = *(_QWORD *)v41;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v41 != v34)
          objc_enumerationMutation(v31);
        v36 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_powerSources, "objectForKeyedSubscript:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v37, "present") & 1) == 0)
          -[CUPowerSourceMonitor _handlePowerSourceLost:sourceID:](self, "_handlePowerSourceLost:sourceID:", v37, v36);

      }
      v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    }
    while (v33);
  }

}

- (void)_handlePowerSourceFound:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v8;
  id v9;
  CUPowerSource *v10;
  void *v11;
  NSMutableDictionary *powerSources;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (**powerSourceFoundHandler)(id, CUPowerSource *);
  void *v21;
  id v22;

  v22 = a3;
  v8 = a5;
  v9 = a4;
  v10 = objc_alloc_init(CUPowerSource);
  -[CUPowerSource setSourceID:](v10, "setSourceID:", objc_msgSend(v22, "integerValue"));
  -[CUPowerSource updateWithPowerSourceDescription:](v10, "updateWithPowerSourceDescription:", v9);

  -[CUPowerSource type](v10, "type");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v9) = objc_msgSend(v11, "isEqual:", CFSTR("InternalBattery"));

  if ((_DWORD)v9)
    -[CUPowerSource updateWithPowerAdapterDetails:](v10, "updateWithPowerAdapterDetails:", v8);
  powerSources = self->_powerSources;
  if (!powerSources)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = self->_powerSources;
    self->_powerSources = v13;

    powerSources = self->_powerSources;
  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](powerSources, "setObject:forKeyedSubscript:", v10, v22);
  v15 = gLogCategory_CUPowerSourceMonitor;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu))
        goto LABEL_13;
      v15 = gLogCategory_CUPowerSourceMonitor;
    }
    if (v15 == -1)
      _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 9u);
    -[CUPowerSource ioKitDescription](v10, "ioKitDescription");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _handlePowerSourceFound:desc:adapterDesc:]", 0x1Eu, (uint64_t)"Found   %@ %?@\n", v16, v17, v18, v19, (uint64_t)v10);

  }
LABEL_13:
  if (-[CUPowerSource isAggregateComponent](v10, "isAggregateComponent"))
  {
    -[CUPowerSourceMonitor _aggregatePowerSourceFound:](self, "_aggregatePowerSourceFound:", v10);
  }
  else
  {
    powerSourceFoundHandler = (void (**)(id, CUPowerSource *))self->_powerSourceFoundHandler;
    if (powerSourceFoundHandler)
      powerSourceFoundHandler[2](powerSourceFoundHandler, v10);
  }

}

- (void)_handlePowerSourceLost:(id)a3 sourceID:(id)a4
{
  id v6;
  int v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**powerSourceLostHandler)(id, id);
  void *v14;
  id v15;

  v15 = a3;
  v6 = a4;
  v7 = gLogCategory_CUPowerSourceMonitor;
  if (gLogCategory_CUPowerSourceMonitor <= 30)
  {
    if (gLogCategory_CUPowerSourceMonitor == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu))
        goto LABEL_12;
      v7 = gLogCategory_CUPowerSourceMonitor;
    }
    if (v7 <= 9)
    {
      v8 = v15;
      if (v7 != -1)
        goto LABEL_11;
      _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 9u);
    }
    v8 = v15;
LABEL_11:
    objc_msgSend(v8, "ioKitDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _handlePowerSourceLost:sourceID:]", 0x1Eu, (uint64_t)"Lost    %@ %?@\n", v9, v10, v11, v12, (uint64_t)v15);

  }
LABEL_12:
  -[NSMutableDictionary removeObjectForKey:](self->_powerSources, "removeObjectForKey:", v6);
  if (objc_msgSend(v15, "isAggregateComponent"))
  {
    -[CUPowerSourceMonitor _aggregatePowerSourceLost:](self, "_aggregatePowerSourceLost:", v15);
  }
  else
  {
    powerSourceLostHandler = (void (**)(id, id))self->_powerSourceLostHandler;
    if (powerSourceLostHandler)
      powerSourceLostHandler[2](powerSourceLostHandler, v15);
  }

}

- (void)_handlePowerSourceUpdate:(id)a3 desc:(id)a4 adapterDesc:(id)a5
{
  id v8;
  uint64_t v9;
  void *v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (**powerSourceChangedHandler)(id, id, uint64_t);
  void *v19;
  id v20;

  v20 = a3;
  v8 = a5;
  v9 = objc_msgSend(v20, "updateWithPowerSourceDescription:", a4);
  objc_msgSend(v20, "type");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", CFSTR("InternalBattery"));

  if (v11)
    v9 = objc_msgSend(v20, "updateWithPowerAdapterDetails:", v8) | v9;
  if ((self->_changeFlags & v9) != 0)
  {
    v12 = gLogCategory_CUPowerSourceMonitor;
    if (gLogCategory_CUPowerSourceMonitor > 10)
      goto LABEL_15;
    if (gLogCategory_CUPowerSourceMonitor == -1)
    {
      if (!_LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0xAu))
        goto LABEL_15;
      v12 = gLogCategory_CUPowerSourceMonitor;
    }
    if (v12 <= 9)
    {
      v13 = v20;
      if (v12 != -1)
        goto LABEL_14;
      _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 9u);
    }
    v13 = v20;
LABEL_14:
    objc_msgSend(v13, "ioKitDescription");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _handlePowerSourceUpdate:desc:adapterDesc:]", 0xAu, (uint64_t)"Changed %@ %#{flags} %?@\n", v14, v15, v16, v17, (uint64_t)v20);

LABEL_15:
    if (objc_msgSend(v20, "isAggregateComponent"))
    {
      -[CUPowerSourceMonitor _aggregatePowerSourceUpdate:changes:](self, "_aggregatePowerSourceUpdate:changes:", v20, v9);
    }
    else
    {
      powerSourceChangedHandler = (void (**)(id, id, uint64_t))self->_powerSourceChangedHandler;
      if (powerSourceChangedHandler)
        powerSourceChangedHandler[2](powerSourceChangedHandler, v20, v9);
    }
  }

}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)&self->_dispatchQueue, a3);
}

- (id)invalidationHandler
{
  return self->_invalidationHandler;
}

- (void)setInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)powerSourceFoundHandler
{
  return self->_powerSourceFoundHandler;
}

- (void)setPowerSourceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (id)powerSourceLostHandler
{
  return self->_powerSourceLostHandler;
}

- (void)setPowerSourceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (id)powerSourceChangedHandler
{
  return self->_powerSourceChangedHandler;
}

- (void)setPowerSourceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_powerSourceChangedHandler, 0);
  objc_storeStrong(&self->_powerSourceLostHandler, 0);
  objc_storeStrong(&self->_powerSourceFoundHandler, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_powerSources, 0);
  objc_storeStrong((id *)&self->_pendingAggregates, 0);
  objc_storeStrong((id *)&self->_aggregateSources, 0);
}

uint64_t __43__CUPowerSourceMonitor__updatePowerSources__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setPresent:", 0);
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke", 0x1Eu, (uint64_t)"Power notification: AccessoryAttach\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updatePowerSources");
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke_2", 0x1Eu, (uint64_t)"Power notification: AccessoryPowerSource\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updatePowerSources");
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUPowerSourceMonitor <= 10
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke_3", 0xAu, (uint64_t)"Power notification: AccessoryTimeRemaining\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updatePowerSources");
}

uint64_t __31__CUPowerSourceMonitor__update__block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v10;

  if (gLogCategory_CUPowerSourceMonitor <= 10
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0xAu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor _update]_block_invoke_4", 0xAu, (uint64_t)"Power notification: AnyPowerSource\n", a5, a6, a7, a8, v10);
  }
  return objc_msgSend(*(id *)(a1 + 32), "_updatePowerSources");
}

uint64_t __34__CUPowerSourceMonitor_invalidate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  uint64_t v10;
  uint64_t v12;

  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor invalidate]_block_invoke", 0x1Eu, (uint64_t)"Invalidate\n", a5, a6, a7, a8, v12);
  }
  v9 = *(_QWORD **)(a1 + 32);
  v10 = v9[9];
  if (v10)
  {
    (*(void (**)(_QWORD))(v10 + 16))(v9[9]);
    v9 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v9, "_cleanup");
}

uint64_t __47__CUPowerSourceMonitor_activateWithCompletion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v9;
  uint64_t v11;

  if (gLogCategory_CUPowerSourceMonitor <= 30
    && (gLogCategory_CUPowerSourceMonitor != -1
     || _LogCategory_Initialize((uint64_t)&gLogCategory_CUPowerSourceMonitor, 0x1Eu)))
  {
    LogPrintF((uint64_t)&gLogCategory_CUPowerSourceMonitor, (uint64_t)"-[CUPowerSourceMonitor activateWithCompletion:]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v11);
  }
  objc_msgSend(*(id *)(a1 + 32), "_update");
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, _QWORD))(v9 + 16))(v9, 0);
  return objc_msgSend(*(id *)(a1 + 32), "_updatePowerSources");
}

uint64_t __39__CUPowerSourceMonitor_setChangeFlags___block_invoke(uint64_t result)
{
  int v1;
  uint64_t v2;

  v1 = *(_DWORD *)(result + 40);
  v2 = *(_QWORD *)(result + 32);
  if (v1 != *(_DWORD *)(v2 + 56))
  {
    *(_DWORD *)(v2 + 56) = v1;
    return objc_msgSend(*(id *)(result + 32), "_update");
  }
  return result;
}

@end
