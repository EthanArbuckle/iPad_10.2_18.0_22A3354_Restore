@implementation CUBLEScanner

- (CUBLEScanner)init
{
  CUBLEScanner *v2;
  CUBLEScanner *v3;
  CUBLEScanner *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CUBLEScanner;
  v2 = -[CUBLEScanner init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    v3->_scanRate = 30;
    v3->_ucat = (LogCategory *)&gLogCategory_CUBLEScanner;
    v4 = v3;
  }

  return v3;
}

- (void)dealloc
{
  LogCategory *ucat;
  objc_super v4;

  ucat = self->_ucat;
  if (ucat && (ucat->var3 & 0x40000) != 0)
  {
    LogCategory_Remove(ucat);
    self->_ucat = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)CUBLEScanner;
  -[CUBLEScanner dealloc](&v4, sel_dealloc);
}

- (void)setChangeFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __31__CUBLEScanner_setChangeFlags___block_invoke;
  v3[3] = &unk_1E25DC710;
  v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setLabel:(id)a3
{
  id v5;
  uint64_t *p_ucat;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;

  objc_storeStrong((id *)&self->_label, a3);
  v5 = a3;
  p_ucat = (uint64_t *)&self->_ucat;
  v7 = qword_1EE066730;
  v14 = objc_retainAutorelease(v5);
  objc_msgSend(v14, "UTF8String");
  LogCategoryReplaceF(p_ucat, (uint64_t)"%s-%s", v8, v9, v10, v11, v12, v13, v7);

}

- (int)rssiThreshold
{
  CUBLEScanner *v2;
  int rssiThreshold;

  v2 = self;
  objc_sync_enter(v2);
  rssiThreshold = v2->_rssiThreshold;
  objc_sync_exit(v2);

  return rssiThreshold;
}

- (void)setRssiThreshold:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __33__CUBLEScanner_setRssiThreshold___block_invoke;
  v3[3] = &unk_1E25DC710;
  v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setScanFlags:(unsigned int)a3
{
  _QWORD v3[5];
  unsigned int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __29__CUBLEScanner_setScanFlags___block_invoke;
  v3[3] = &unk_1E25DC710;
  v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)setScanRate:(int)a3
{
  _QWORD v3[5];
  int v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __28__CUBLEScanner_setScanRate___block_invoke;
  v3[3] = &unk_1E25DC710;
  v4 = a3;
  v3[4] = self;
  -[CUBLEScanner _updateIfNeededWithBlock:](self, "_updateIfNeededWithBlock:", v3);
}

- (void)activate
{
  CUBLEScanner *v2;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v2 = self;
  objc_sync_enter(v2);
  v2->_activateCalled = 1;
  dispatchQueue = v2->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __24__CUBLEScanner_activate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = v2;
  dispatch_async(dispatchQueue, block);
  objc_sync_exit(v2);

}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __26__CUBLEScanner_invalidate__block_invoke;
  block[3] = &unk_1E25DF2A0;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

- (void)_invalidate
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  LogCategory *ucat;
  CUSystemMonitor *systemMonitor;
  CBCentralManager *centralManager;
  uint64_t v10;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _invalidate]", 0x1Eu, (uint64_t)"Invalidate\n", v2, v3, v4, v5, v10);
    }
LABEL_6:
    -[CUSystemMonitor invalidate](self->_systemMonitor, "invalidate");
    systemMonitor = self->_systemMonitor;
    self->_systemMonitor = 0;

    -[CUBLEScanner _stopScanIfNeededWithReason:](self, "_stopScanIfNeededWithReason:", "invalidate");
    -[CBCentralManager setDelegate:](self->_centralManager, "setDelegate:", 0);
    centralManager = self->_centralManager;
    self->_centralManager = 0;

    -[CUBLEScanner _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  void (**invalidationHandler)(id, SEL);
  id bluetoothStateChangedHandler;
  id deviceFoundHandler;
  id deviceLostHandler;
  id deviceChangedHandler;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  LogCategory *ucat;
  uint64_t v14;

  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    invalidationHandler = (void (**)(id, SEL))self->_invalidationHandler;
    if (invalidationHandler)
      invalidationHandler[2](invalidationHandler, a2);
    bluetoothStateChangedHandler = self->_bluetoothStateChangedHandler;
    self->_bluetoothStateChangedHandler = 0;

    deviceFoundHandler = self->_deviceFoundHandler;
    self->_deviceFoundHandler = 0;

    deviceLostHandler = self->_deviceLostHandler;
    self->_deviceLostHandler = 0;

    deviceChangedHandler = self->_deviceChangedHandler;
    self->_deviceChangedHandler = 0;

    v8 = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    self->_invalidateDone = 1;
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 != -1)
      {
LABEL_7:
        LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _invalidated]", 0x1Eu, (uint64_t)"Invalidated\n", v9, v10, v11, v12, v14);
        return;
      }
      if (_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      {
        ucat = self->_ucat;
        goto LABEL_7;
      }
    }
  }
}

- (void)_updateIfNeededWithBlock:(id)a3
{
  uint64_t (**v4)(_QWORD);
  CUBLEScanner *v5;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v4 = (uint64_t (**)(_QWORD))a3;
  v5 = self;
  objc_sync_enter(v5);
  if ((v4[2](v4) & 1) != 0 && v5->_activateCalled && !v5->_changesPending)
  {
    v5->_changesPending = 1;
    dispatchQueue = v5->_dispatchQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __41__CUBLEScanner__updateIfNeededWithBlock___block_invoke;
    block[3] = &unk_1E25DF2A0;
    block[4] = v5;
    dispatch_async(dispatchQueue, block);
  }
  objc_sync_exit(v5);

}

- (void)_update
{
  CBCentralManager *centralManager;
  CBCentralManager *v4;
  id v5;
  OS_dispatch_queue *dispatchQueue;
  void *v7;
  void *v8;
  CBCentralManager *v9;
  CBCentralManager *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CUSystemMonitor *v17;
  CUSystemMonitor *systemMonitor;
  uint64_t v19;
  CUSystemMonitor *v20;
  CUBLEScanner *v21;
  _BOOL4 changesPending;
  void *v23;
  id *p_scanParametersCurrent;
  NSDictionary *scanParametersCurrent;
  NSDictionary *v26;
  NSDictionary *v27;
  NSDictionary *v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  LogCategory *ucat;
  const char *v36;
  const char *v37;
  unsigned int v38;
  NSDictionary *v39;
  LogCategory *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  LogCategory *v46;
  LogCategory *v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  NSDictionary *v53;
  uint64_t v54;
  _QWORD v55[5];
  _QWORD v56[5];
  void *v57;
  _QWORD v58[2];

  v58[1] = *MEMORY[0x1E0C80C00];
  if (!self->_invalidateCalled)
  {
    centralManager = self->_centralManager;
    v4 = centralManager;
    if (!centralManager)
    {
      v5 = objc_alloc((Class)getCBCentralManagerClass_1419[0]());
      dispatchQueue = self->_dispatchQueue;
      getCBManagerNeedsRestrictedStateOperation_1422[0]();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v57 = v7;
      v58[0] = MEMORY[0x1E0C9AAB0];
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v58, &v57, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = (CBCentralManager *)objc_msgSend(v5, "initWithDelegate:queue:options:", self, dispatchQueue, v8);
      v10 = self->_centralManager;
      self->_centralManager = v9;

      v4 = self->_centralManager;
      if (!v4)
      {
        ucat = self->_ucat;
        if (ucat->var0 > 90)
          return;
        if (ucat->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)ucat, 0x5Au))
            return;
          ucat = self->_ucat;
        }
        v37 = "### Create CBCentralManager failed\n";
        v38 = 90;
        goto LABEL_44;
      }
    }
    v15 = -[CBCentralManager state](v4, "state");
    if (v15 != 5 && v15 != 10)
    {
      if (!centralManager)
        return;
      v34 = v15;
      ucat = self->_ucat;
      if (ucat->var0 > 30)
        return;
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          return;
        ucat = self->_ucat;
      }
      if (v34 > 0xA)
        v36 = "?";
      else
        v36 = off_1E25DC5B8[v34];
      v54 = (uint64_t)v36;
      v37 = "Deferring until Bluetooth powered: %s\n";
      v38 = 30;
LABEL_44:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _update]", v38, (uint64_t)v37, v11, v12, v13, v14, v54);
      return;
    }
    if ((self->_scanFlags & 1) == 0 && !self->_systemMonitor)
    {
      v17 = objc_alloc_init(CUSystemMonitor);
      systemMonitor = self->_systemMonitor;
      self->_systemMonitor = v17;

      -[CUSystemMonitor setDispatchQueue:](self->_systemMonitor, "setDispatchQueue:", self->_dispatchQueue);
      v19 = MEMORY[0x1E0C809B0];
      v56[0] = MEMORY[0x1E0C809B0];
      v56[1] = 3221225472;
      v56[2] = __23__CUBLEScanner__update__block_invoke;
      v56[3] = &unk_1E25DF2A0;
      v56[4] = self;
      -[CUSystemMonitor setScreenOnChangedHandler:](self->_systemMonitor, "setScreenOnChangedHandler:", v56);
      v20 = self->_systemMonitor;
      v55[0] = v19;
      v55[1] = 3221225472;
      v55[2] = __23__CUBLEScanner__update__block_invoke_2;
      v55[3] = &unk_1E25DF2A0;
      v55[4] = self;
      -[CUSystemMonitor activateWithCompletion:](v20, "activateWithCompletion:", v55);
    }
    v21 = self;
    objc_sync_enter(v21);
    changesPending = v21->_changesPending;
    v21->_changesPending = 0;
    objc_sync_exit(v21);

    if (!-[CUBLEScanner _shouldScan](v21, "_shouldScan"))
    {
      -[CUBLEScanner _stopScanIfNeededWithReason:](v21, "_stopScanIfNeededWithReason:", "criteria");
      return;
    }
    if (v21->_scannerStartCalled)
    {
      if (!changesPending)
        return;
      -[CUBLEScanner _scanParameters](v21, "_scanParameters");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      p_scanParametersCurrent = (id *)&v21->_scanParametersCurrent;
      scanParametersCurrent = v21->_scanParametersCurrent;
      v26 = v23;
      v27 = scanParametersCurrent;
      if (v26 == v27)
      {

      }
      else
      {
        v28 = v27;
        if ((v26 == 0) == (v27 != 0))
        {

          goto LABEL_37;
        }
        v29 = -[NSDictionary isEqual:](v26, "isEqual:", v27);

        if ((v29 & 1) == 0)
        {
LABEL_37:
          v47 = v21->_ucat;
          if (v47->var0 <= 30)
          {
            if (v47->var0 == -1)
            {
              if (!_LogCategory_Initialize((uint64_t)v21->_ucat, 0x1Eu))
                goto LABEL_52;
              v47 = v21->_ucat;
            }
            -[CUBLEScanner _scanParametersSummary:](v21, "_scanParametersSummary:", v26);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF((uint64_t)v47, (uint64_t)"-[CUBLEScanner _update]", 0x1Eu, (uint64_t)"Scanner update: %@\n", v49, v50, v51, v52, (uint64_t)v48);

          }
LABEL_52:
          objc_storeStrong(p_scanParametersCurrent, v23);
          -[CBCentralManager stopScan](self->_centralManager, "stopScan");
          goto LABEL_53;
        }
      }
      v46 = v21->_ucat;
      if (v46->var0 <= 10)
      {
        if (v46->var0 == -1)
        {
          if (!_LogCategory_Initialize((uint64_t)v46, 0xAu))
            goto LABEL_54;
          v46 = v21->_ucat;
        }
        LogPrintF((uint64_t)v46, (uint64_t)"-[CUBLEScanner _update]", 0xAu, (uint64_t)"Scanner no changes\n", v30, v31, v32, v33, v54);
      }
LABEL_54:

      return;
    }
    -[CUBLEScanner _scanParameters](v21, "_scanParameters");
    v39 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v40 = v21->_ucat;
    if (v40->var0 <= 30)
    {
      if (v40->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)v21->_ucat, 0x1Eu))
          goto LABEL_48;
        v40 = v21->_ucat;
      }
      -[CUBLEScanner _scanParametersSummary:](v21, "_scanParametersSummary:", v39);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF((uint64_t)v40, (uint64_t)"-[CUBLEScanner _update]", 0x1Eu, (uint64_t)"Scanner start: %@\n", v42, v43, v44, v45, (uint64_t)v41);

    }
LABEL_48:
    v53 = v21->_scanParametersCurrent;
    v21->_scanParametersCurrent = v39;
    v26 = v39;

    v21->_scannerStartCalled = 1;
LABEL_53:
    -[CBCentralManager scanForPeripheralsWithServices:options:](self->_centralManager, "scanForPeripheralsWithServices:options:", 0, v26);
    goto LABEL_54;
  }
}

- (id)_scanParameters
{
  CUBLEScanner *v2;
  unsigned int scanFlags;
  int v4;
  uint64_t rssiThreshold;
  int scanRate;
  int v7;
  unsigned int v8;
  unsigned int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;

  v2 = self;
  objc_sync_enter(v2);
  scanFlags = v2->_scanFlags;
  v4 = v2->_changeFlags & 0x18;
  rssiThreshold = v2->_rssiThreshold;
  scanRate = v2->_scanRate;
  if (scanRate == 60)
    v7 = 30;
  else
    v7 = 966;
  if (scanRate == 50)
    v8 = 40;
  else
    v8 = v7;
  if (scanRate == 40)
    v9 = 60;
  else
    v9 = 966;
  if (scanRate == 30)
    v9 = 300;
  if (scanRate <= 49)
    v10 = v9;
  else
    v10 = v8;
  objc_sync_exit(v2);

  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if ((scanFlags & 0x40) != 0)
  {
    getCBCentralManagerScanOptionActive[0]();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v12);

  }
  if (v4)
  {
    getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v10);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionScanInterval[0]();
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v14, v15);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 30);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionScanWindow[0]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", v16, v17);

  getCBManagerIsPrivilegedDaemonKey_1415();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v18);

  v23 = 0;
  if ((scanFlags & 2) != 0)
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:](v2, "_updateScanRules:payloadType:rssiThreshold:", &v23, 15, rssiThreshold);
  if ((scanFlags & 4) != 0)
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:](v2, "_updateScanRules:payloadType:rssiThreshold:", &v23, 16, rssiThreshold);
  if ((scanFlags & 0x90) != 0)
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:](v2, "_updateScanRules:payloadType:rssiThreshold:", &v23, 7, rssiThreshold);
  if ((scanFlags & 0x20) != 0)
    -[CUBLEScanner _updateScanRules:payloadType:rssiThreshold:](v2, "_updateScanRules:payloadType:rssiThreshold:", &v23, 18, rssiThreshold);
  v19 = v23;
  if (v23)
  {
    getCBCentralManagerScanOptionMatchingRuleKey[0]();
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v19, v20);

    v21 = v23;
  }
  else
  {
    v21 = 0;
  }

  return v11;
}

- (id)_scanParametersSummary:(id)a3
{
  const __CFDictionary *v3;
  id v4;
  id v5;
  int64_t Int64Ranged;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __CFString *v13;
  id v14;
  CFTypeID TypeID;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __CFString *v23;
  uint64_t v24;
  uint64_t v25;
  const char *v26;
  uint64_t v27;
  uint64_t i;
  const __CFDictionary *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  __CFString *v37;
  id v38;
  int64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __CFString *v52;
  id v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  __CFString *v60;
  __CFString *v61;
  __CFString *v62;
  uint64_t v64;
  id obj;
  CFMutableStringRef v66;
  CFMutableStringRef v67;
  CFMutableStringRef v68;
  CFMutableStringRef v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  CFMutableStringRef v74;
  CFMutableStringRef v75;
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v3 = (const __CFDictionary *)a3;
  v4 = (id)getCBCentralManagerScanOptionScanInterval[0]();
  CFDictionaryGetInt64Ranged(v3, v4, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  v5 = (id)getCBCentralManagerScanOptionScanWindow[0]();
  Int64Ranged = CFDictionaryGetInt64Ranged(v3, v5, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
  v75 = 0;
  NSAppendPrintF(&v75, (uint64_t)"%d/%d ms (%d%%)", v7, v8, v9, v10, v11, v12, Int64Ranged);
  v13 = v75;
  v14 = (id)getCBCentralManagerScanOptionMatchingRuleKey[0]();
  TypeID = CFArrayGetTypeID();
  CFDictionaryGetTypedValue(v3, v14, TypeID, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "count"))
  {
    v74 = v13;
    NSAppendPrintF(&v74, (uint64_t)", Filters[", v17, v18, v19, v20, v21, v22, v64);
    v23 = v74;

    v13 = v23;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  obj = v16;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
  if (v24)
  {
    v25 = v24;
    v26 = "";
    v27 = *(_QWORD *)v71;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v71 != v27)
          objc_enumerationMutation(obj);
        v29 = *(const __CFDictionary **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v30 = (id)getCBCentralManagerScanOptionMatchingRuleTypeKey[0]();
        CFDictionaryGetInt64Ranged(v29, v30, 0, 255, 0);
        v69 = v13;
        NSAppendPrintF(&v69, (uint64_t)"%s%s", v31, v32, v33, v34, v35, v36, (uint64_t)v26);
        v37 = v69;

        v38 = (id)getCBCentralManagerScanOptionMatchingRuleRSSIKey[0]();
        v39 = CFDictionaryGetInt64Ranged(v29, v38, 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);
        if ((_DWORD)v39)
        {
          v68 = v37;
          NSAppendPrintF(&v68, (uint64_t)", RSSI %d", v40, v41, v42, v43, v44, v45, v39);
          v13 = v68;

        }
        else
        {
          v13 = v37;
        }
        v26 = "; ";
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v76, 16);
      v26 = "; ";
    }
    while (v25);
  }

  if (objc_msgSend(obj, "count"))
  {
    v67 = v13;
    NSAppendPrintF(&v67, (uint64_t)"]", v46, v47, v48, v49, v50, v51, v64);
    v52 = v67;

    v13 = v52;
  }
  v53 = (id)getCBCentralManagerScanOptionAllowDuplicatesKey[0]();
  if (CFDictionaryGetInt64(v3, v53, 0))
  {
    v66 = v13;
    NSAppendPrintF(&v66, (uint64_t)", Dups", v54, v55, v56, v57, v58, v59, v64);
    v60 = v66;

    v13 = v60;
  }
  if (v13)
    v61 = v13;
  else
    v61 = CFSTR("?");
  v62 = v61;

  return v62;
}

- (BOOL)_shouldScan
{
  _BOOL4 v2;

  if ((self->_scanFlags & 1) != 0 || (v2 = -[CUSystemMonitor screenOn](self->_systemMonitor, "screenOn")))
    LOBYTE(v2) = 1;
  return v2;
}

- (void)_stopScanIfNeededWithReason:(const char *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  LogCategory *ucat;
  void *v10;
  NSMutableDictionary *devices;
  _QWORD v12[5];

  if (self->_scannerStartCalled)
  {
    ucat = self->_ucat;
    if (ucat->var0 <= 30)
    {
      if (ucat->var0 == -1)
      {
        if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
          goto LABEL_6;
        ucat = self->_ucat;
      }
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner _stopScanIfNeededWithReason:]", 0x1Eu, (uint64_t)"Scanner stop (%s)\n", v3, v4, v5, v6, (uint64_t)a3);
    }
LABEL_6:
    self->_scannerStartCalled = 0;
    -[CBCentralManager stopScan](self->_centralManager, "stopScan");
  }
  if (!self->_invalidateCalled)
  {
    v10 = _Block_copy(self->_deviceLostHandler);
    if (v10)
    {
      devices = self->_devices;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __44__CUBLEScanner__stopScanIfNeededWithReason___block_invoke;
      v12[3] = &unk_1E25DC150;
      v12[4] = v10;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](devices, "enumerateKeysAndObjectsUsingBlock:", v12);
    }

  }
  -[NSMutableDictionary removeAllObjects](self->_devices, "removeAllObjects", a3);
}

- (void)_updateScanRules:(id *)a3 payloadType:(unsigned __int8)a4 rssiThreshold:(int)a5
{
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  _QWORD v20[2];
  uint64_t v21;
  _QWORD v22[3];

  v6 = a4;
  v22[2] = *MEMORY[0x1E0C80C00];
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionMatchingRuleTypeKey[0]();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v10);

  if (a5)
    v11 = a5;
  else
    v11 = 4294967216;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  getCBCentralManagerScanOptionMatchingRuleRSSIKey[0]();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, v13);

  v21 = 0;
  v22[0] = 0;
  *(_QWORD *)((char *)v22 + 6) = 0;
  v19 = 0;
  v20[0] = 0;
  *(_QWORD *)((char *)v20 + 6) = 0;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v21, 22);
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", &v19, 22);
  getCBCentralManagerScanOptionMatchingRulePayloadKey[0]();
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, v16);

  getCBCentralManagerScanOptionMatchingRuleMaskKey[0]();
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, v17);

  v18 = *a3;
  if (!v18)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_storeStrong(a3, v18);
  }
  objc_msgSend(v18, "addObject:", v8);

}

- (void)centralManagerDidUpdateState:(id)a3
{
  NSObject *dispatchQueue;
  id v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  LogCategory *ucat;
  const char *v12;
  unint64_t v13;
  int v14;
  void *v15;
  void *v16;

  dispatchQueue = self->_dispatchQueue;
  v5 = a3;
  dispatch_assert_queue_V2(dispatchQueue);
  v6 = objc_msgSend(v5, "state");

  ucat = self->_ucat;
  if (ucat->var0 > 30)
    goto LABEL_9;
  if (ucat->var0 == -1)
  {
    if (!_LogCategory_Initialize((uint64_t)ucat, 0x1Eu))
      goto LABEL_9;
    ucat = self->_ucat;
  }
  if (v6 > 0xA)
    v12 = "?";
  else
    v12 = off_1E25DC628[v6];
  LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner centralManagerDidUpdateState:]", 0x1Eu, (uint64_t)"Bluetooth scanner state changed: %s\n", v7, v8, v9, v10, (uint64_t)v12);
LABEL_9:
  v13 = v6 - 1;
  if (v6 - 1 > 9)
    v14 = 0;
  else
    v14 = dword_18D51E02C[v13];
  self->_bluetoothState = v14;
  v15 = _Block_copy(self->_bluetoothStateChangedHandler);
  v16 = v15;
  if (v15)
    (*((void (**)(void *))v15 + 2))(v15);

  switch(v13)
  {
    case 0uLL:
    case 3uLL:
      self->_scannerStartCalled = 0;
      break;
    case 4uLL:
    case 9uLL:
      -[CUBLEScanner _update](self, "_update");
      break;
    default:
      return;
  }
}

- (void)centralManager:(id)a3 didDiscoverPeripheral:(id)a4 advertisementData:(id)a5 RSSI:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  CUBLEDevice *v16;
  uint64_t v17;
  unsigned int v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unsigned int scanFlags;
  signed int v28;
  int v29;
  LogCategory *ucat;
  NSMutableDictionary *devices;
  NSMutableDictionary *v32;
  NSMutableDictionary *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  objc_msgSend(v12, "identifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  v37 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_devices, "objectForKeyedSubscript:", v37);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc_init(CUBLEDevice);
  -[CUBLEDevice setIdentifier:](v16, "setIdentifier:", v37);
  v17 = objc_msgSend(v10, "intValue");

  v18 = -[CUBLEDevice updateWithAdvertisementData:rssi:oldDevice:](v16, "updateWithAdvertisementData:rssi:oldDevice:", v11, v17, v15);
  v19 = v18 | 0x18;
  if (v15)
    v20 = v19;
  else
    v20 = v18 | 0x38;
  -[CUBLEDevice setChangeFlags:](v16, "setChangeFlags:", v20);
  objc_msgSend(v13, "sharedPairingAgent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = objc_msgSend(v21, "isPeerPaired:", v12);
  -[CUBLEDevice setDeviceFlags:](v16, "setDeviceFlags:", v22);
  scanFlags = self->_scanFlags;
  if ((scanFlags & 0xFE) != 0 && (-[CUBLEDevice scanFlags](v16, "scanFlags") & scanFlags & 0xFE) == 0)
  {
    v29 = 0;
    v28 = 8;
  }
  else
  {
    v28 = 9;
    v29 = 1;
  }
  ucat = self->_ucat;
  if (v28 >= ucat->var0)
  {
    if (ucat->var0 != -1)
    {
LABEL_10:
      LogPrintF((uint64_t)ucat, (uint64_t)"-[CUBLEScanner centralManager:didDiscoverPeripheral:advertisementData:RSSI:]", v28, (uint64_t)"Found: %@\n", v23, v24, v25, v26, (uint64_t)v16);
      goto LABEL_12;
    }
    if (_LogCategory_Initialize((uint64_t)ucat, v28))
    {
      ucat = self->_ucat;
      goto LABEL_10;
    }
  }
LABEL_12:
  if (v29)
  {
    devices = self->_devices;
    if (!devices)
    {
      v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
      v33 = self->_devices;
      self->_devices = v32;

      devices = self->_devices;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](devices, "setObject:forKeyedSubscript:", v16, v37);
    if (!v15)
      goto LABEL_20;
    if ((self->_changeFlags & v19) != 0)
    {
      if ((scanFlags & 0x100) == 0)
      {
        v34 = _Block_copy(self->_deviceChangedHandler);
        v35 = v34;
        if (v34)
          (*((void (**)(void *, CUBLEDevice *, uint64_t))v34 + 2))(v34, v16, v19);
LABEL_22:

        goto LABEL_23;
      }
LABEL_20:
      v36 = _Block_copy(self->_deviceFoundHandler);
      v35 = v36;
      if (v36)
        (*((void (**)(void *, CUBLEDevice *))v36 + 2))(v36, v16);
      goto LABEL_22;
    }
  }
LABEL_23:

}

- (int)bluetoothState
{
  return self->_bluetoothState;
}

- (void)setBluetoothState:(int)a3
{
  self->_bluetoothState = a3;
}

- (id)bluetoothStateChangedHandler
{
  return self->_bluetoothStateChangedHandler;
}

- (void)setBluetoothStateChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (unsigned)changeFlags
{
  return self->_changeFlags;
}

- (id)deviceFoundHandler
{
  return self->_deviceFoundHandler;
}

- (void)setDeviceFoundHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 104);
}

- (id)deviceLostHandler
{
  return self->_deviceLostHandler;
}

- (void)setDeviceLostHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (id)deviceChangedHandler
{
  return self->_deviceChangedHandler;
}

- (void)setDeviceChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (NSString)label
{
  return self->_label;
}

- (unsigned)scanFlags
{
  return self->_scanFlags;
}

- (int)scanRate
{
  return self->_scanRate;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong(&self->_deviceChangedHandler, 0);
  objc_storeStrong(&self->_deviceLostHandler, 0);
  objc_storeStrong(&self->_deviceFoundHandler, 0);
  objc_storeStrong(&self->_bluetoothStateChangedHandler, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_scanParametersCurrent, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_centralManager, 0);
}

uint64_t __44__CUBLEScanner__stopScanIfNeededWithReason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __23__CUBLEScanner__update__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __23__CUBLEScanner__update__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __41__CUBLEScanner__updateIfNeededWithBlock___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_update");
}

uint64_t __26__CUBLEScanner_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

uint64_t __24__CUBLEScanner_activate__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v9;
  int *v10;
  _BOOL4 v11;
  uint64_t v13;

  v9 = *(_QWORD **)(a1 + 32);
  v10 = (int *)v9[9];
  if (*v10 <= 30)
  {
    if (*v10 == -1)
    {
      v11 = _LogCategory_Initialize((uint64_t)v10, 0x1Eu);
      v9 = *(_QWORD **)(a1 + 32);
      if (!v11)
        return objc_msgSend(v9, "_update");
      v10 = (int *)v9[9];
    }
    LogPrintF((uint64_t)v10, (uint64_t)"-[CUBLEScanner activate]_block_invoke", 0x1Eu, (uint64_t)"Activate\n", a5, a6, a7, a8, v13);
    v9 = *(_QWORD **)(a1 + 32);
  }
  return objc_msgSend(v9, "_update");
}

BOOL __28__CUBLEScanner_setScanRate___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 92);
  if (v1 != v3)
    *(_DWORD *)(v2 + 92) = v1;
  return v1 != v3;
}

BOOL __29__CUBLEScanner_setScanFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 88);
  if (v1 != v3)
    *(_DWORD *)(v2 + 88) = v1;
  return v1 != v3;
}

BOOL __33__CUBLEScanner_setRssiThreshold___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 44);
  if (v1 != v3)
    *(_DWORD *)(v2 + 44) = v1;
  return v1 != v3;
}

BOOL __31__CUBLEScanner_setChangeFlags___block_invoke(uint64_t a1)
{
  int v1;
  uint64_t v2;
  int v3;

  v1 = *(_DWORD *)(a1 + 40);
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 84);
  if (v1 != v3)
    *(_DWORD *)(v2 + 84) = v1;
  return v1 != v3;
}

@end
