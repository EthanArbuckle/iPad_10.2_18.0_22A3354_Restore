@implementation CBHIDPerformanceMonitor

- (CBHIDPerformanceMonitor)init
{
  CBHIDPerformanceMonitor *v2;
  CBHIDPerformanceMonitor *v3;
  uint64_t v4;
  OS_dispatch_queue *workQueue;
  NSString *targetBTAddrData;
  NSString *targetBTAddrKey;
  CBHIDPerformanceMonitor *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CBHIDPerformanceMonitor;
  v2 = -[CBHIDPerformanceMonitor init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    objc_storeStrong((id *)&v2->_dispatchQueue, MEMORY[0x1E0C80D38]);
    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    v3->_hidManager = 0;
    targetBTAddrData = v3->_targetBTAddrData;
    v3->_targetBTAddrData = (NSString *)&stru_1E5403C08;

    targetBTAddrKey = v3->_targetBTAddrKey;
    v3->_targetBTAddrKey = (NSString *)&stru_1E5403C08;

    v8 = v3;
  }

  return v3;
}

- (void)activateWithCompletion:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__CBHIDPerformanceMonitor_activateWithCompletion___block_invoke;
  v7[3] = &unk_1E54007A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

uint64_t __50__CBHIDPerformanceMonitor_activateWithCompletion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_activateWithCompletion:", *(_QWORD *)(a1 + 40));
}

- (void)_activateWithCompletion:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void (**v7)(_QWORD);
  double testSeconds;
  void *v9;
  id *v10;
  BOOL v11;
  NSObject *workQueue;
  uint64_t v13;
  void *v14;
  void *v15;
  double v16;
  double testSecondsActual;
  _QWORD block[5];
  id obj;
  _QWORD v20[5];
  id v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;

  v4 = a3;
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = __Block_byref_object_copy__7;
  v27 = __Block_byref_object_dispose__7;
  v28 = 0;
  v5 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke;
  v20[3] = &unk_1E53FF898;
  v22 = &v23;
  v20[4] = self;
  v6 = v4;
  v21 = v6;
  v7 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v20);
  if (*(_WORD *)&self->_activateCalled)
  {
    NSErrorF_safe();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = (void *)v24[5];
    v24[5] = v13;

  }
  else
  {
    self->_activateCalled = 1;
    testSeconds = self->_testSeconds;
    if (testSeconds <= 0.0)
      testSeconds = 30.0;
    self->_testSecondsActual = testSeconds;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSObjectOneLine();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = self->_testSeconds;
      testSecondsActual = self->_testSecondsActual;
      v15 = v9;
      LogPrintF_safe();

    }
    v10 = (id *)(v24 + 5);
    obj = (id)v24[5];
    v11 = -[CBHIDPerformanceMonitor _findDevicesAndReturnError:](self, "_findDevicesAndReturnError:", &obj, v15, *(_QWORD *)&v16, *(_QWORD *)&testSecondsActual);
    objc_storeStrong(v10, obj);
    if (v11)
    {
      (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
      -[CBHIDPerformanceMonitor _packetLoggerStart](self, "_packetLoggerStart");
      workQueue = self->_workQueue;
      block[0] = v5;
      block[1] = 3221225472;
      block[2] = __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke_2;
      block[3] = &unk_1E53FF780;
      block[4] = self;
      dispatch_async(workQueue, block);
    }
  }
  v7[2](v7);

  _Block_object_dispose(&v23, 8);
}

uint64_t __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;

  result = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (result)
  {
    if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    objc_msgSend(*(id *)(a1 + 32), "_packetLoggerStop", v3);
    objc_msgSend(*(id *)(a1 + 32), "_hidStop");
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  return result;
}

uint64_t __51__CBHIDPerformanceMonitor__activateWithCompletion___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_testStart");
}

- (void)invalidate
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  dispatchQueue = self->_dispatchQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CBHIDPerformanceMonitor_invalidate__block_invoke;
  block[3] = &unk_1E53FF780;
  block[4] = self;
  dispatch_async(dispatchQueue, block);
}

uint64_t __37__CBHIDPerformanceMonitor_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_invalidate");
}

- (void)_invalidate
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  if (!self->_invalidateCalled)
  {
    self->_invalidateCalled = 1;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      v4 = timeoutTimer;
      dispatch_source_cancel(v4);
      v5 = self->_timeoutTimer;
      self->_timeoutTimer = 0;

    }
    -[CBHIDPerformanceMonitor _packetLoggerStop](self, "_packetLoggerStop");
    -[CBHIDPerformanceMonitor _hidStop](self, "_hidStop");
    -[CBHIDPerformanceMonitor _invalidated](self, "_invalidated");
  }
}

- (void)_invalidated
{
  __IOHIDManager *hidManager;
  id excessiveIntervalHandler;
  id invalidationHandler;
  id summaryHandler;
  void *v7;
  int v8;
  uint64_t v9;

  hidManager = self->_hidManager;
  if (hidManager)
  {
    IOHIDManagerClose(hidManager, 0);
    CFRelease(self->_hidManager);
    self->_hidManager = 0;
  }
  if (self->_invalidateCalled && !self->_invalidateDone)
  {
    v9 = MEMORY[0x1A85D1CE4](self->_invalidationHandler, a2);
    excessiveIntervalHandler = self->_excessiveIntervalHandler;
    self->_excessiveIntervalHandler = 0;

    invalidationHandler = self->_invalidationHandler;
    self->_invalidationHandler = 0;

    summaryHandler = self->_summaryHandler;
    self->_summaryHandler = 0;

    v7 = (void *)v9;
    if (v9)
    {
      (*(void (**)(uint64_t))(v9 + 16))(v9);
      v7 = (void *)v9;
    }
    self->_invalidateDone = 1;
    if (gLogCategory_CBHIDPerf <= 30)
    {
      if (gLogCategory_CBHIDPerf != -1 || (v8 = _LogCategory_Initialize(), v7 = (void *)v9, v8))
      {
        LogPrintF_safe();
        v7 = (void *)v9;
      }
    }

  }
}

- (void)_testStart
{
  NSUInteger v3;
  unint64_t targetDeviceIndex;
  NSUInteger v5;
  NSArray *targetDevices;
  CBDevice *v7;
  CBDevice *targetDevice;
  _BOOL4 v9;
  id v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD);
  CBHIDPerformanceSummary *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v3 = -[NSArray count](self->_targetDevices, "count");
  targetDeviceIndex = self->_targetDeviceIndex;
  if (targetDeviceIndex >= v3)
  {
LABEL_11:
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
      LogPrintF_safe();
    -[CBHIDPerformanceMonitor invalidate](self, "invalidate");
  }
  else
  {
    v5 = v3;
    while (1)
    {
      targetDevices = self->_targetDevices;
      self->_targetDeviceIndex = targetDeviceIndex + 1;
      -[NSArray objectAtIndexedSubscript:](targetDevices, "objectAtIndexedSubscript:");
      v7 = (CBDevice *)objc_claimAutoreleasedReturnValue();
      targetDevice = self->_targetDevice;
      self->_targetDevice = v7;

      -[CBHIDPerformanceMonitor _rssiAndHandleRead](self, "_rssiAndHandleRead");
      v17 = 0;
      v9 = -[CBHIDPerformanceMonitor _hidStartAndReturnError:](self, "_hidStartAndReturnError:", &v17);
      v10 = v17;
      if (v9)
        break;
      if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
      {
        CUDescriptionWithLevel();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v15 = v11;
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
      v12 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A85D1CE4](self->_summaryHandler);
      if (v12)
      {
        v13 = objc_alloc_init(CBHIDPerformanceSummary);
        -[CBHIDPerformanceSummary setDevice:](v13, "setDevice:", self->_targetDevice);
        -[CBHIDPerformanceSummary setError:](v13, "setError:", v10);
        ((void (**)(_QWORD, CBHIDPerformanceSummary *))v12)[2](v12, v13);

      }
      -[CBHIDPerformanceMonitor _hidStop](self, "_hidStop", v15, v16);

      targetDeviceIndex = self->_targetDeviceIndex;
      if (targetDeviceIndex >= v5)
        goto LABEL_11;
    }
    -[CBHIDPerformanceMonitor _timerStart](self, "_timerStart");
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      CUDescriptionWithLevel();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
  }
}

- (void)_testEnd
{
  _BOOL4 hidStartedErrorRateMode;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  hidStartedErrorRateMode = self->_hidStartedErrorRateMode;
  self->_finishWait = hidStartedErrorRateMode;
  if (hidStartedErrorRateMode)
  {
    v8 = 0;
    -[CBHIDPerformanceMonitor _hidStopPERAndRetunError:](self, "_hidStopPERAndRetunError:", &v8);
    v4 = v8;
    self->_hidStartedErrorRateMode = 0;
    if (v4)
    {
      self->_finishWait = 0;
      if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
      {
        CUDescriptionWithLevel();
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        CUPrintNSError();
        v6 = v5;
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        LogPrintF_safe();

      }
    }
    -[CBHIDPerformanceMonitor _testEnded](self, "_testEnded", v6, v7);

  }
}

- (void)_testEnded
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v4;
  OS_dispatch_source *v5;

  if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v4 = timeoutTimer;
    dispatch_source_cancel(v4);
    v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  -[CBHIDPerformanceMonitor _hidStop](self, "_hidStop");
  -[CBHIDPerformanceMonitor _testStart](self, "_testStart");
}

- (BOOL)_isAppleOldHIDs:(unsigned int)a3
{
  BOOL result;

  result = 1;
  switch(a3)
  {
    case 0x208u:
    case 0x209u:
    case 0x20Au:
    case 0x22Cu:
    case 0x22Du:
    case 0x22Eu:
    case 0x239u:
    case 0x23Au:
    case 0x23Bu:
    case 0x255u:
    case 0x256u:
    case 0x257u:
      return result;
    case 0x20Bu:
    case 0x20Cu:
    case 0x20Du:
    case 0x20Eu:
    case 0x20Fu:
    case 0x210u:
    case 0x211u:
    case 0x212u:
    case 0x213u:
    case 0x214u:
    case 0x215u:
    case 0x216u:
    case 0x217u:
    case 0x218u:
    case 0x219u:
    case 0x21Au:
    case 0x21Bu:
    case 0x21Cu:
    case 0x21Du:
    case 0x21Eu:
    case 0x21Fu:
    case 0x220u:
    case 0x221u:
    case 0x222u:
    case 0x223u:
    case 0x224u:
    case 0x225u:
    case 0x226u:
    case 0x227u:
    case 0x228u:
    case 0x229u:
    case 0x22Au:
    case 0x22Bu:
    case 0x22Fu:
    case 0x230u:
    case 0x231u:
    case 0x232u:
    case 0x233u:
    case 0x234u:
    case 0x235u:
    case 0x236u:
    case 0x237u:
    case 0x238u:
    case 0x23Cu:
    case 0x23Du:
    case 0x23Eu:
    case 0x23Fu:
    case 0x240u:
    case 0x241u:
    case 0x242u:
    case 0x243u:
    case 0x244u:
    case 0x245u:
    case 0x246u:
    case 0x247u:
    case 0x248u:
    case 0x249u:
    case 0x24Au:
    case 0x24Bu:
    case 0x24Cu:
    case 0x24Du:
    case 0x24Eu:
    case 0x24Fu:
    case 0x250u:
    case 0x251u:
    case 0x252u:
    case 0x253u:
    case 0x254u:
      goto LABEL_5;
    default:
      if (a3 - 777 > 5 || ((1 << (a3 - 9)) & 0x39) == 0)
LABEL_5:
        result = 0;
      break;
  }
  return result;
}

- (BOOL)_isMac
{
  return 0;
}

- (BOOL)_findDevicesAndReturnError:(id *)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  uint64_t v39;
  CBHIDPerformanceMonitor *v40;
  CBHIDPerformanceMonitor *v41;
  id *v42;
  NSArray *obj;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  +[CBDiscovery devicesWithDiscoveryFlags:error:](CBDiscovery, "devicesWithDiscoveryFlags:error:", 0x200000, a3);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v44)
  {
    v42 = a3;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    obj = self->_devices;
    v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v54;
      v40 = self;
      while (2)
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v54 != v8)
            objc_enumerationMutation(obj);
          v10 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * i);
          v49 = 0u;
          v50 = 0u;
          v51 = 0u;
          v52 = 0u;
          v11 = v44;
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
          if (!v12)
          {
LABEL_40:

LABEL_41:
            if (v42)
            {
              CBErrorF(-6727, (uint64_t)"Device not found: %@", v18, v19, v20, v21, v22, v23, v10);
              *v42 = (id)objc_claimAutoreleasedReturnValue();
            }

            goto LABEL_44;
          }
          v13 = v12;
          v14 = *(_QWORD *)v50;
LABEL_12:
          v15 = 0;
          while (1)
          {
            if (*(_QWORD *)v50 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * v15);
            if ((objc_msgSend(v16, "connectedServices", v38) & 0x20) != 0
              && objc_msgSend(v16, "deviceType") != 26
              && (objc_msgSend(v16, "isEquivalentToCBDevice:compareFlags:", v10, 8) & 1) != 0)
            {
              break;
            }
            if (v13 == ++v15)
            {
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v49, v58, 16);
              if (!v13)
                goto LABEL_40;
              goto LABEL_12;
            }
          }
          v17 = v16;

          if (!v17)
            goto LABEL_41;
          objc_msgSend(v5, "addObject:", v17);
          if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
          {
            CUDescriptionWithLevel();
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            LogPrintF_safe();

          }
        }
        v7 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
        self = v40;
        if (v7)
          continue;
        break;
      }
    }

    if (!objc_msgSend(v5, "count"))
    {
      v41 = self;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      v24 = v44;
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v46;
        do
        {
          for (j = 0; j != v26; ++j)
          {
            if (*(_QWORD *)v46 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * j);
            if ((objc_msgSend(v29, "connectedServices", v38) & 0x20) != 0
              && objc_msgSend(v29, "deviceType") != 26)
            {
              objc_msgSend(v5, "addObject:", v29);
              if (gLogCategory_CBHIDPerf <= 30
                && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
              {
                CUDescriptionWithLevel();
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                LogPrintF_safe();

              }
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v45, v57, 16);
        }
        while (v26);
      }

      self = v41;
    }
    if (objc_msgSend(v5, "count", v38))
    {
      objc_storeStrong((id *)&self->_targetDevices, v5);
      v30 = 1;
      goto LABEL_48;
    }
    if (v42)
    {
      CBErrorF(-6727, (uint64_t)"No devices found", v31, v32, v33, v34, v35, v36, v39);
      v30 = 0;
      *v42 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_48;
    }
  }
LABEL_44:
  v30 = 0;
LABEL_48:

  return v30;
}

- (BOOL)_hidStartAndReturnError:(id *)a3
{
  mach_port_t v4;
  const __CFDictionary *v5;
  kern_return_t MatchingServices;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (**v14)(_QWORD);
  void *CFProperty;
  void *v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __IOHIDManager *v24;
  IOReturn v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  NSString *v41;
  NSString *targetBTAddrData;
  NSString *v43;
  NSString *targetBTAddrKey;
  __IOHIDManager *hidManager;
  const __CFArray *v46;
  CFSetRef v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  NSString *v53;
  NSString *v54;
  NSString *v55;
  __IOHIDManager *v56;
  const __CFArray *v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  const __CFSet *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t i;
  __IOHIDDevice *v68;
  void *v69;
  __CFString *v70;
  void *Property;
  double intervalMs;
  CBDeviceRequest *v73;
  CBDevice *targetDevice;
  void *v75;
  id v76;
  unsigned int v77;
  void *v78;
  const __CFUUID *v79;
  const __CFUUID *v80;
  kern_return_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  IOCFPlugInInterfaceStruct **hidPluginInterface;
  HRESULT (__cdecl *QueryInterface)(void *, REFIID, LPVOID *);
  const __CFUUID *v90;
  CFUUIDBytes v91;
  int v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  int v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  int v106;
  int v107;
  CBDeviceRequest *v108;
  CBDevice *v109;
  void *v110;
  id v111;
  unsigned int v112;
  CBDeviceRequest *v113;
  CBDevice *v114;
  void *v115;
  id v116;
  unsigned int v117;
  CBDeviceRequest *v118;
  CBDevice *v119;
  void *v120;
  id v121;
  unsigned int v122;
  id v123;
  void *v124;
  id v125;
  unint64_t byte7;
  void *byte7a;
  void *byte7b;
  void *byte7c;
  void *byte7d;
  void (**v132)(void);
  unsigned int entry;
  void *entrya;
  id v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  _QWORD v141[5];
  _QWORD v142[4];
  io_iterator_t v143;
  io_iterator_t existing;
  _BYTE v145[128];
  void *v146;
  void *v147;
  SInt32 theScore[2];
  SInt32 *v149;
  uint64_t v150;
  io_object_t v151;
  uint64_t v152;

  v152 = *MEMORY[0x1E0C80C00];
  if (!-[CBHIDPerformanceMonitor _isMac](self, "_isMac")
    || _os_feature_enabled_impl()
    && !-[CBHIDPerformanceMonitor _isAppleOldHIDs:](self, "_isAppleOldHIDs:", -[CBDevice productID](self->_targetDevice, "productID")))
  {
    if (!self->_hidManager)
    {
      v24 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
      self->_hidManager = v24;
      v25 = IOHIDManagerOpen(v24, 0);
      if (v25)
      {
        if (a3)
        {
          CBErrorF(v25, (uint64_t)"Open HID Manager failed", v26, v27, v28, v29, v30, v31, byte7);
          v125 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v107) = 0;
          *a3 = v125;
          return v107;
        }
        goto LABEL_39;
      }
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    entrya = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Transport");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(entrya, "setObject:forKey:", CFSTR("Bluetooth"), v32);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 76);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "VendorID");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(entrya, "setObject:forKey:", v33, v34);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 65280);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PrimaryUsagePage");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(entrya, "setObject:forKey:", v35, v36);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 18);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PrimaryUsage");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(entrya, "setObject:forKey:", v37, v38);

    -[CBDevice btAddressData](self->_targetDevice, "btAddressData");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v39;
    if (v39)
    {
      *(_QWORD *)theScore = 0;
      v149 = 0;
      LOWORD(v150) = 0;
      objc_msgSend(objc_retainAutorelease(v39), "bytes");
      HardwareAddressToCString();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", theScore, 4);
      v41 = (NSString *)objc_claimAutoreleasedReturnValue();
      targetBTAddrData = self->_targetBTAddrData;
      self->_targetBTAddrData = v41;

      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SerialNumber");
      v43 = (NSString *)objc_claimAutoreleasedReturnValue();
      targetBTAddrKey = self->_targetBTAddrKey;
      self->_targetBTAddrKey = v43;

      objc_msgSend(entrya, "setObject:forKey:", self->_targetBTAddrData, self->_targetBTAddrKey);
    }

    hidManager = self->_hidManager;
    v147 = entrya;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v147, 1);
    v46 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
    IOHIDManagerSetDeviceMatchingMultiple(hidManager, v46);

    v47 = IOHIDManagerCopyDevices(self->_hidManager);
    if (!v47)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "SerialNumber");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(entrya, "removeObjectForKey:", v48);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PrimaryUsagePage");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(entrya, "setObject:forKey:", v49, v50);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", 1);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PrimaryUsage");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(entrya, "setObject:forKey:", v51, v52);

      -[NSString stringByReplacingOccurrencesOfString:withString:](self->_targetBTAddrData, "stringByReplacingOccurrencesOfString:withString:", CFSTR(":"), CFSTR("-"));
      v53 = (NSString *)objc_claimAutoreleasedReturnValue();
      v54 = self->_targetBTAddrData;
      self->_targetBTAddrData = v53;

      v55 = self->_targetBTAddrKey;
      self->_targetBTAddrKey = (NSString *)CFSTR("DeviceAddress");

      objc_msgSend(entrya, "setObject:forKey:", self->_targetBTAddrData, self->_targetBTAddrKey);
      v56 = self->_hidManager;
      v146 = entrya;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v146, 1);
      v57 = (const __CFArray *)objc_claimAutoreleasedReturnValue();
      IOHIDManagerSetDeviceMatchingMultiple(v56, v57);

      v47 = IOHIDManagerCopyDevices(self->_hidManager);
      if (!v47)
      {
        if (a3)
        {
          CBErrorF(-6762, (uint64_t)"No HID devices", v58, v59, v60, v61, v62, v63, byte7);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }

        goto LABEL_39;
      }
    }
    v139 = 0u;
    v140 = 0u;
    v137 = 0u;
    v138 = 0u;
    v64 = v47;
    v65 = -[__CFSet countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
    if (v65)
    {
      v66 = *(_QWORD *)v138;
      do
      {
        for (i = 0; i != v65; ++i)
        {
          if (*(_QWORD *)v138 != v66)
            objc_enumerationMutation(v64);
          v68 = *(__IOHIDDevice **)(*((_QWORD *)&v137 + 1) + 8 * i);
          IOHIDDeviceGetProperty(v68, (CFStringRef)self->_targetBTAddrKey);
          v69 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && !objc_msgSend(v69, "caseInsensitiveCompare:", self->_targetBTAddrData))
          {
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "ProductID");
            v70 = (__CFString *)objc_claimAutoreleasedReturnValue();
            Property = (void *)IOHIDDeviceGetProperty(v68, v70);
            self->_hidProductID = (unsigned __int16)CFGetInt64Ranged();

          }
        }
        v65 = -[__CFSet countByEnumeratingWithState:objects:count:](v64, "countByEnumeratingWithState:objects:count:", &v137, v145, 16);
      }
      while (v65);
    }

    goto LABEL_28;
  }
  existing = 0;
  v4 = *MEMORY[0x1E0CBBAB0];
  v5 = IOServiceMatching((const char *)objc_msgSend(CFSTR("IOBluetoothHIDDriver"), "UTF8String"));
  MatchingServices = IOServiceGetMatchingServices(v4, v5, &existing);
  if (!existing)
  {
    if (a3)
    {
      if (!MatchingServices)
        MatchingServices = -6700;
      CBErrorF(MatchingServices, (uint64_t)"Get HID services failed", v7, v8, v9, v10, v11, v12, byte7);
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_39;
  }
  v13 = MEMORY[0x1E0C809B0];
  v142[0] = MEMORY[0x1E0C809B0];
  v142[1] = 3221225472;
  v142[2] = __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke;
  v142[3] = &__block_descriptor_36_e5_v8__0l;
  v143 = existing;
  v132 = (void (**)(void))MEMORY[0x1A85D1CE4](v142);
  entry = 0;
  while (1)
  {
    *(_QWORD *)theScore = 0;
    v149 = theScore;
    v150 = 0x2020000000;
    v151 = 0;
    v151 = IOIteratorNext(existing);
    if (!v149[6])
      break;
    v141[0] = v13;
    v141[1] = 3221225472;
    v141[2] = __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke_2;
    v141[3] = &unk_1E5403A50;
    v141[4] = theScore;
    v14 = (void (**)(_QWORD))MEMORY[0x1A85D1CE4](v141);
    CFProperty = (void *)IORegistryEntryCreateCFProperty(v149[6], CFSTR("BD_ADDR"), 0, 0);
    -[CBDevice btAddressData](self->_targetDevice, "btAddressData");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(CFProperty, "isEqual:", v16);

    if ((v17 & 1) != 0)
    {
      entry = v149[6];
      v149[6] = 0;
    }

    v14[2](v14);
    _Block_object_dispose(theScore, 8);
    if ((v17 & 1) != 0)
      goto LABEL_33;
  }
  _Block_object_dispose(theScore, 8);
LABEL_33:
  if (entry)
  {
    self->_hidService = entry;
    v78 = (void *)IORegistryEntryCreateCFProperty(entry, CFSTR("ProductID"), 0, 0);
    self->_hidProductID = (unsigned __int16)CFGetInt64Ranged();

    theScore[0] = 0;
    v79 = CFUUIDGetConstantUUIDWithBytes(0, 0xFAu, 0x12u, 0xFAu, 0x38u, 0x6Fu, 0x1Au, 0x11u, 0xD4u, 0xBAu, 0xCu, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
    v80 = CFUUIDGetConstantUUIDWithBytes(0, 0xC2u, 0x44u, 0xE8u, 0x58u, 0x10u, 0x9Cu, 0x11u, 0xD4u, 0x91u, 0xD4u, 0, 0x50u, 0xE4u, 0xC6u, 0x42u, 0x6Fu);
    v81 = IOCreatePlugInInterfaceForService(entry, v79, v80, &self->_hidPluginInterface, theScore);
    hidPluginInterface = self->_hidPluginInterface;
    if (hidPluginInterface)
    {
      QueryInterface = (*hidPluginInterface)->QueryInterface;
      v90 = CFUUIDGetConstantUUIDWithBytes(0, 0x78u, 0xBDu, 0x42u, 0xCu, 0x6Fu, 0x14u, 0x11u, 0xD4u, 0x94u, 0x74u, 0, 5u, 2u, 0x8Fu, 0x18u, 0xD5u);
      v91 = CFUUIDGetUUIDBytes(v90);
      v92 = ((uint64_t (*)(IOCFPlugInInterfaceStruct **, _QWORD, _QWORD, IOHIDDeviceInterface ***))QueryInterface)(hidPluginInterface, *(_QWORD *)&v91.byte0, *(_QWORD *)&v91.byte8, &self->_hidInterface);
      if (self->_hidInterface)
      {
        v99 = ((uint64_t (*)(IOHIDDeviceInterface **, _QWORD))(*self->_hidInterface)->open)(self->_hidInterface, 0);
        if (!v99)
        {
          v106 = 0;
          goto LABEL_38;
        }
        if (a3)
        {
          CBErrorF(v99, (uint64_t)"Open HID interface failed", v100, v101, v102, v103, v104, v105, byte7);
          v124 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_97:
          v123 = v124;
          goto LABEL_98;
        }
      }
      else if (a3)
      {
        if (!v92)
          v92 = -6700;
        CBErrorF(v92, (uint64_t)"Get HID interface failed", v93, v94, v95, v96, v97, v98, byte7);
        v124 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_97;
      }
    }
    else if (a3)
    {
      if (!v81)
        v81 = -6700;
      CBErrorF(v81, (uint64_t)"Get HID plugin failed", v82, v83, v84, v85, v86, v87, byte7);
      v124 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_97;
    }
  }
  else if (a3)
  {
    CBErrorF(-6727, (uint64_t)"HID not found", v18, v19, v20, v21, v22, v23, byte7);
    v123 = (id)objc_claimAutoreleasedReturnValue();
LABEL_98:
    *a3 = v123;
  }
  v106 = 1;
LABEL_38:
  v132[2]();

  if (v106)
  {
LABEL_39:
    LOBYTE(v107) = 0;
    return v107;
  }
LABEL_28:
  intervalMs = self->_intervalMs;
  if (intervalMs > 0.0)
  {
    self->_statsPacketIntervalMicsExpected = (intervalMs * 1000.0);
LABEL_70:
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      byte7 = self->_statsPacketIntervalMicsExpected;
      LogPrintF_safe();
    }
    if (-[CBHIDPerformanceMonitor _hidStartPERAndRetunError:](self, "_hidStartPERAndRetunError:", a3, byte7))
    {
      LOBYTE(v107) = 1;
    }
    else
    {
      -[CBHIDPerformanceMonitor _hidStopPERAndRetunError:](self, "_hidStopPERAndRetunError:", 0);
      LOBYTE(v107) = -[CBHIDPerformanceMonitor _hidStartPERAndRetunError:](self, "_hidStartPERAndRetunError:", a3);
    }
    return v107;
  }
  self->_statsPacketIntervalMicsExpected = 0;
  v73 = objc_alloc_init(CBDeviceRequest);
  -[CBDeviceRequest setRequestFlags:](v73, "setRequestFlags:", 512);
  targetDevice = self->_targetDevice;
  v136 = 0;
  +[CBController performDeviceRequest:device:error:](CBController, "performDeviceRequest:device:error:", v73, targetDevice, &v136);
  v75 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = v136;
  v77 = objc_msgSend(v75, "sniffInterval");
  if (v77)
  {
    self->_statsPacketIntervalMicsExpected = v77;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    byte7a = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7a);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected)
    goto LABEL_70;
  v108 = objc_alloc_init(CBDeviceRequest);
  -[CBDeviceRequest setRequestFlags:](v108, "setRequestFlags:", 512);
  v109 = self->_targetDevice;
  v136 = 0;
  +[CBController performDeviceRequest:device:error:](CBController, "performDeviceRequest:device:error:", v108, v109, &v136);
  v110 = (void *)objc_claimAutoreleasedReturnValue();
  v111 = v136;
  v112 = objc_msgSend(v110, "sniffInterval");
  if (v112)
  {
    self->_statsPacketIntervalMicsExpected = v112;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    byte7b = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7b);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected)
    goto LABEL_70;
  v113 = objc_alloc_init(CBDeviceRequest);
  -[CBDeviceRequest setRequestFlags:](v113, "setRequestFlags:", 512);
  v114 = self->_targetDevice;
  v136 = 0;
  +[CBController performDeviceRequest:device:error:](CBController, "performDeviceRequest:device:error:", v113, v114, &v136);
  v115 = (void *)objc_claimAutoreleasedReturnValue();
  v116 = v136;
  v117 = objc_msgSend(v115, "sniffInterval");
  if (v117)
  {
    self->_statsPacketIntervalMicsExpected = v117;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    byte7c = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7c);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected)
    goto LABEL_70;
  v118 = objc_alloc_init(CBDeviceRequest);
  -[CBDeviceRequest setRequestFlags:](v118, "setRequestFlags:", 512);
  v119 = self->_targetDevice;
  v136 = 0;
  +[CBController performDeviceRequest:device:error:](CBController, "performDeviceRequest:device:error:", v118, v119, &v136);
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  v121 = v136;
  v122 = objc_msgSend(v120, "sniffInterval");
  if (v122)
  {
    self->_statsPacketIntervalMicsExpected = v122;
  }
  else if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
  {
    CUPrintNSError();
    byte7d = (void *)objc_claimAutoreleasedReturnValue();
    LogPrintF_safe();

    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7d);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", 5.0, byte7);
  }

  if (self->_statsPacketIntervalMicsExpected)
    goto LABEL_70;
  if (gLogCategory_CBHIDPerf > 90)
    goto LABEL_39;
  if (gLogCategory_CBHIDPerf != -1 || (v107 = _LogCategory_Initialize()) != 0)
  {
    LogPrintF_safe();
    goto LABEL_39;
  }
  return v107;
}

uint64_t __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke(uint64_t a1)
{
  return IOObjectRelease(*(_DWORD *)(a1 + 32));
}

uint64_t __51__CBHIDPerformanceMonitor__hidStartAndReturnError___block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((_DWORD)result)
    return IOObjectRelease(result);
  return result;
}

- (void)_hidStop
{
  IOHIDDeviceInterface **hidInterface;
  IOCFPlugInInterfaceStruct **hidPluginInterface;
  io_object_t hidService;
  __IOHIDManager *hidManager;

  if (self->_hidStartedErrorRateMode)
  {
    -[CBHIDPerformanceMonitor _hidStopPERAndRetunError:](self, "_hidStopPERAndRetunError:", 0);
    self->_hidStartedErrorRateMode = 0;
  }
  hidInterface = self->_hidInterface;
  if (hidInterface)
  {
    ((void (*)(IOHIDDeviceInterface **, SEL))(*hidInterface)->close)(hidInterface, a2);
    ((void (*)(IOHIDDeviceInterface **))(*self->_hidInterface)->Release)(self->_hidInterface);
    self->_hidInterface = 0;
  }
  hidPluginInterface = self->_hidPluginInterface;
  if (hidPluginInterface)
  {
    ((void (*)(IOCFPlugInInterfaceStruct **, SEL))(*hidPluginInterface)->Release)(hidPluginInterface, a2);
    self->_hidPluginInterface = 0;
  }
  hidService = self->_hidService;
  if (hidService)
  {
    IOObjectRelease(hidService);
    self->_hidService = 0;
  }
  hidManager = self->_hidManager;
  if (hidManager)
  {
    IOHIDManagerClose(hidManager, 0);
    CFRelease(self->_hidManager);
    self->_hidManager = 0;
  }
}

- (BOOL)_hidStartPERAndRetunError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int hidProductID;
  uint64_t v10;
  uint64_t v11;
  _BOOL4 v12;
  id v13;

  hidProductID = self->_hidProductID;
  v10 = 7;
  v11 = 213;
  switch(hidProductID)
  {
    case 0x239u:
    case 0x23Au:
    case 0x23Bu:
    case 0x255u:
    case 0x256u:
    case 0x257u:
      goto LABEL_9;
    case 0x23Cu:
    case 0x23Du:
    case 0x23Eu:
    case 0x23Fu:
    case 0x240u:
    case 0x241u:
    case 0x242u:
    case 0x243u:
    case 0x244u:
    case 0x245u:
    case 0x246u:
    case 0x247u:
    case 0x248u:
    case 0x249u:
    case 0x24Au:
    case 0x24Bu:
    case 0x24Cu:
    case 0x24Du:
    case 0x24Eu:
    case 0x24Fu:
    case 0x250u:
    case 0x251u:
    case 0x252u:
    case 0x253u:
    case 0x254u:
    case 0x258u:
    case 0x259u:
    case 0x25Au:
    case 0x25Bu:
    case 0x25Cu:
    case 0x25Du:
    case 0x25Eu:
    case 0x25Fu:
    case 0x260u:
    case 0x261u:
    case 0x262u:
    case 0x263u:
    case 0x264u:
    case 0x266u:
    case 0x268u:
    case 0x26Au:
    case 0x26Bu:
    case 0x26Du:
    case 0x26Eu:
    case 0x26Fu:
    case 0x270u:
    case 0x271u:
    case 0x272u:
    case 0x273u:
    case 0x274u:
    case 0x275u:
    case 0x276u:
    case 0x277u:
    case 0x278u:
    case 0x279u:
    case 0x27Au:
    case 0x27Bu:
    case 0x27Cu:
    case 0x27Du:
    case 0x27Eu:
    case 0x27Fu:
    case 0x280u:
    case 0x281u:
    case 0x282u:
    case 0x283u:
    case 0x284u:
    case 0x285u:
    case 0x286u:
    case 0x287u:
    case 0x288u:
    case 0x289u:
    case 0x28Au:
    case 0x28Bu:
    case 0x28Cu:
    case 0x28Du:
    case 0x28Eu:
    case 0x28Fu:
    case 0x290u:
    case 0x291u:
    case 0x292u:
    case 0x293u:
    case 0x294u:
    case 0x295u:
    case 0x296u:
    case 0x297u:
    case 0x298u:
    case 0x299u:
    case 0x29Bu:
    case 0x29Du:
    case 0x29Eu:
      goto LABEL_12;
    case 0x265u:
    case 0x269u:
      v10 = 52;
      goto LABEL_8;
    case 0x267u:
    case 0x26Cu:
    case 0x29Au:
    case 0x29Cu:
    case 0x29Fu:
      v10 = 10;
LABEL_8:
      v11 = 214;
LABEL_9:
      self->_startWait = 0;
      v12 = -[CBHIDPerformanceMonitor _hidSetFeatureWithReportID:value:error:](self, "_hidSetFeatureWithReportID:value:error:", v11, v10, a3);
      if (v12)
        goto LABEL_10;
      return v12;
    default:
      if (hidProductID == 782)
      {
        self->_startWait = 0;
        v12 = -[CBHIDPerformanceMonitor _hidSetFeatureWithReportID:value:error:](self, "_hidSetFeatureWithReportID:value:error:", 213, 15, a3);
        if (v12)
        {
LABEL_10:
          LOBYTE(v12) = 1;
          self->_hidStartedErrorRateMode = 1;
          self->_statsPacketIntervalMicsMax = 0;
          *(_OWORD *)&self->_statsPacketMicsStart = 0u;
          *(_OWORD *)&self->_statsPacketMicsPrevious = 0u;
          self->_statsPacketCountExpected = 0;
        }
      }
      else
      {
        if (hidProductID == 781)
        {
          self->_startWait = 0;
          v12 = -[CBHIDPerformanceMonitor _hidSetFeatureWithReportID:value:error:](self, "_hidSetFeatureWithReportID:value:error:", 213, 12, a3);
          if (!v12)
            return v12;
          goto LABEL_10;
        }
LABEL_12:
        if (a3)
        {
          CBErrorF(-6735, (uint64_t)"Unsupported HID: PID 0x%04X", 213, 7, v3, v4, v5, v6, self->_hidProductID);
          v13 = (id)objc_claimAutoreleasedReturnValue();
          LOBYTE(v12) = 0;
          *a3 = v13;
        }
        else
        {
          LOBYTE(v12) = 0;
        }
      }
      return v12;
  }
}

- (BOOL)_hidStopPERAndRetunError:(id *)a3
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int hidProductID;
  uint64_t v10;
  id *v11;

  self->_hidStartedErrorRateMode = 0;
  hidProductID = self->_hidProductID;
  switch(hidProductID)
  {
    case 0x239u:
    case 0x23Au:
    case 0x23Bu:
    case 0x255u:
    case 0x256u:
    case 0x257u:
      goto LABEL_5;
    case 0x23Cu:
    case 0x23Du:
    case 0x23Eu:
    case 0x23Fu:
    case 0x240u:
    case 0x241u:
    case 0x242u:
    case 0x243u:
    case 0x244u:
    case 0x245u:
    case 0x246u:
    case 0x247u:
    case 0x248u:
    case 0x249u:
    case 0x24Au:
    case 0x24Bu:
    case 0x24Cu:
    case 0x24Du:
    case 0x24Eu:
    case 0x24Fu:
    case 0x250u:
    case 0x251u:
    case 0x252u:
    case 0x253u:
    case 0x254u:
    case 0x258u:
    case 0x259u:
    case 0x25Au:
    case 0x25Bu:
    case 0x25Cu:
    case 0x25Du:
    case 0x25Eu:
    case 0x25Fu:
    case 0x260u:
    case 0x261u:
    case 0x262u:
    case 0x263u:
    case 0x264u:
    case 0x266u:
    case 0x268u:
    case 0x26Au:
    case 0x26Bu:
    case 0x26Du:
    case 0x26Eu:
    case 0x26Fu:
    case 0x270u:
    case 0x271u:
    case 0x272u:
    case 0x273u:
    case 0x274u:
    case 0x275u:
    case 0x276u:
    case 0x277u:
    case 0x278u:
    case 0x279u:
    case 0x27Au:
    case 0x27Bu:
    case 0x27Cu:
    case 0x27Du:
    case 0x27Eu:
    case 0x27Fu:
    case 0x280u:
    case 0x281u:
    case 0x282u:
    case 0x283u:
    case 0x284u:
    case 0x285u:
    case 0x286u:
    case 0x287u:
    case 0x288u:
    case 0x289u:
    case 0x28Au:
    case 0x28Bu:
    case 0x28Cu:
    case 0x28Du:
    case 0x28Eu:
    case 0x28Fu:
    case 0x290u:
    case 0x291u:
    case 0x292u:
    case 0x293u:
    case 0x294u:
    case 0x295u:
    case 0x296u:
    case 0x297u:
    case 0x298u:
    case 0x299u:
    case 0x29Bu:
    case 0x29Du:
    case 0x29Eu:
      goto LABEL_6;
    case 0x265u:
    case 0x267u:
    case 0x269u:
    case 0x26Cu:
    case 0x29Au:
    case 0x29Cu:
    case 0x29Fu:
      v10 = 214;
      v11 = a3;
      return -[CBHIDPerformanceMonitor _hidSetFeatureWithReportID:value:error:](self, "_hidSetFeatureWithReportID:value:error:", v10, 0, v11);
    default:
      if (hidProductID - 781 >= 2)
      {
LABEL_6:
        if (a3)
        {
          CBErrorF(-6735, (uint64_t)"Unsupported HID: PID 0x%04X", (uint64_t)a3, v3, v4, v5, v6, v7, self->_hidProductID);
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        return 0;
      }
      else
      {
LABEL_5:
        v10 = 213;
        v11 = a3;
        return -[CBHIDPerformanceMonitor _hidSetFeatureWithReportID:value:error:](self, "_hidSetFeatureWithReportID:value:error:", v10, 0, v11);
      }
  }
}

- (BOOL)_hidSetFeatureWithReportID:(unsigned __int8)a3 value:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  IOHIDDeviceInterface **hidInterface;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  int v23;
  __IOHIDManager *hidManager;
  CFSetRef v25;
  const __CFSet *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  __IOHIDDevice *v31;
  void *v32;
  BOOL result;
  const char *v34;
  const char *v35;
  id v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t report;
  unsigned __int8 v43;
  _BYTE v44[128];
  uint64_t v45;

  v7 = a3;
  v45 = *MEMORY[0x1E0C80C00];
  if (!-[CBHIDPerformanceMonitor _isMac](self, "_isMac")
    || _os_feature_enabled_impl()
    && !-[CBHIDPerformanceMonitor _isAppleOldHIDs:](self, "_isAppleOldHIDs:", -[CBDevice productID](self->_targetDevice, "productID")))
  {
    hidManager = self->_hidManager;
    if (hidManager)
    {
      report = v7;
      v43 = a4;
      v25 = IOHIDManagerCopyDevices(hidManager);
      if (v25)
      {
        v40 = 0u;
        v41 = 0u;
        v38 = 0u;
        v39 = 0u;
        v26 = v25;
        v27 = -[__CFSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v39;
          do
          {
            for (i = 0; i != v28; ++i)
            {
              if (*(_QWORD *)v39 != v29)
                objc_enumerationMutation(v26);
              v31 = *(__IOHIDDevice **)(*((_QWORD *)&v38 + 1) + 8 * i);
              IOHIDDeviceGetProperty(v31, (CFStringRef)self->_targetBTAddrKey);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0
                && !objc_msgSend(v32, "caseInsensitiveCompare:", self->_targetBTAddrData))
              {
                IOHIDDeviceSetReport(v31, kIOHIDReportTypeFeature, 0, &report, 2);
              }

            }
            v28 = -[__CFSet countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
          }
          while (v28);
        }

        v23 = gLogCategory_CBHIDPerf;
        if (gLogCategory_CBHIDPerf > 30)
          return 1;
        goto LABEL_21;
      }
      if (a5)
      {
        v35 = "No HID devices";
        v16 = -6762;
LABEL_35:
        CBErrorF(v16, (uint64_t)v35, v17, v18, v19, v20, v21, v22, v37);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      return 0;
    }
    if (!a5)
      return 0;
    v34 = "No HID Manager";
LABEL_32:
    CBErrorF(-6762, (uint64_t)v34, v9, v10, v11, v12, v13, v14, v37);
    v36 = (id)objc_claimAutoreleasedReturnValue();
    result = 0;
    *a5 = v36;
    return result;
  }
  hidInterface = self->_hidInterface;
  if (!hidInterface)
  {
    if (!a5)
      return 0;
    v34 = "No HID interface";
    goto LABEL_32;
  }
  report = v7;
  v43 = a4;
  v37 = 0;
  v16 = ((uint64_t (*)(IOHIDDeviceInterface **, uint64_t, uint64_t, uint8_t *, uint64_t, uint64_t, _QWORD, _QWORD))(*hidInterface)->setReport)(hidInterface, 2, v7, &report, 2, 1000, 0, 0);
  if (v16)
  {
    if (a5)
    {
      v35 = "SetFeature failed";
      goto LABEL_35;
    }
    return 0;
  }
  v23 = gLogCategory_CBHIDPerf;
  if (gLogCategory_CBHIDPerf <= 30)
  {
LABEL_21:
    if (v23 != -1 || _LogCategory_Initialize())
      LogPrintF_safe();
  }
  return 1;
}

- (void)_packetLoggerStart
{
  CBPacketLoggerClient **p_packetLoggerClient;
  CBPacketLoggerClient *v4;
  CBPacketLoggerClient *v5;
  uint64_t v6;
  CBPacketLoggerClient *v7;
  _QWORD v8[4];
  CBPacketLoggerClient *v9;
  CBHIDPerformanceMonitor *v10;
  _QWORD v11[4];
  CBPacketLoggerClient *v12;
  CBHIDPerformanceMonitor *v13;

  p_packetLoggerClient = &self->_packetLoggerClient;
  v4 = self->_packetLoggerClient;
  if (!v4)
  {
    v5 = objc_alloc_init(CBPacketLoggerClient);
    objc_storeStrong((id *)p_packetLoggerClient, v5);
    -[CBPacketLoggerClient setDispatchQueue:](v5, "setDispatchQueue:", self->_dispatchQueue);
    v6 = MEMORY[0x1E0C809B0];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke;
    v11[3] = &unk_1E53FFB68;
    v7 = v5;
    v12 = v7;
    v13 = self;
    -[CBPacketLoggerClient setRawPacketHandler:](v7, "setRawPacketHandler:", v11);
    v8[0] = v6;
    v8[1] = 3221225472;
    v8[2] = __45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke_2;
    v8[3] = &unk_1E5403A78;
    v4 = v7;
    v9 = v4;
    v10 = self;
    -[CBPacketLoggerClient activateWithCompletion:](v4, "activateWithCompletion:", v8);

  }
}

_QWORD *__45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke(uint64_t a1, uint64_t a2)
{
  _QWORD *result;
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 32);
  result = *(_QWORD **)(a1 + 40);
  if (v3 == result[8])
    return (_QWORD *)objc_msgSend(result, "_packetLoggerProcessPacketData:", a2);
  return result;
}

void __45__CBHIDPerformanceMonitor__packetLoggerStart__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v3 = a2;
  if (v3 && *(_QWORD *)(a1 + 32) == *(_QWORD *)(*(_QWORD *)(a1 + 40) + 64))
  {
    v7 = v3;
    if (gLogCategory_CBHIDPerf <= 90 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      CUPrintNSError();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

    }
    objc_msgSend(*(id *)(a1 + 32), "invalidate", v6);
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(void **)(v4 + 64);
    *(_QWORD *)(v4 + 64) = 0;

  }
  else
  {

  }
}

- (void)_packetLoggerStop
{
  CBPacketLoggerClient *packetLoggerClient;

  -[CBPacketLoggerClient invalidate](self->_packetLoggerClient, "invalidate");
  packetLoggerClient = self->_packetLoggerClient;
  self->_packetLoggerClient = 0;

}

- (void)_packetLoggerProcessPacketData:(id)a3
{
  CBDevice *v4;
  unsigned __int8 *bytes_ptr;
  size_t length;
  unint64_t v7;
  int v8;
  unint64_t statsPacketIntervalMicsExpected;
  uint64_t v10;
  CBHIDPerformanceSummary *v11;
  double v12;
  unint64_t statsPacketCountExpected;
  unsigned int v14;
  int v15;
  unsigned int v16;
  unint64_t statsPacketMicsPrevious;
  unint64_t v18;
  unint64_t v19;
  double v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  xpc_object_t xdata;

  xdata = a3;
  v4 = self->_targetDevice;
  if (!v4)
    goto LABEL_68;
  bytes_ptr = (unsigned __int8 *)xpc_data_get_bytes_ptr(xdata);
  length = xpc_data_get_length(xdata);
  if ((uint64_t)length <= 12 || (bytes_ptr[13] | ((bytes_ptr[14] & 0xF) << 8)) != self->_statsLastConnectionHandle)
    goto LABEL_68;
  v7 = bswap32(*((_DWORD *)bytes_ptr + 2)) + 1000000 * bswap32(*((_DWORD *)bytes_ptr + 1));
  v8 = bytes_ptr[12];
  if (v8 != 3)
  {
    if (v8 != 2)
      goto LABEL_68;
    if (length >= 0x18 && self->_finishWait)
    {
      if (bytes_ptr[15] != 7)
        goto LABEL_68;
      if (!bytes_ptr[23])
      {
        statsPacketIntervalMicsExpected = self->_statsPacketIntervalMicsExpected;
        if (statsPacketIntervalMicsExpected)
          statsPacketIntervalMicsExpected = (10
                                           * (self->_statsPacketMicsEnd - self->_statsPacketMicsStart)
                                           / statsPacketIntervalMicsExpected
                                           + 5)
                                          / 0xA
                                          + 1;
        v10 = statsPacketIntervalMicsExpected - self->_statsPacketCountActual;
        if (v10 < 0)
          statsPacketIntervalMicsExpected = self->_statsPacketCountActual;
        self->_statsPacketCountExpected = statsPacketIntervalMicsExpected;
        v11 = objc_alloc_init(CBHIDPerformanceSummary);
        -[CBHIDPerformanceSummary setDevice:](v11, "setDevice:", v4);
        v12 = 0.0;
        if (v10 >= 1)
        {
          statsPacketCountExpected = self->_statsPacketCountExpected;
          if (statsPacketCountExpected)
            v12 = (double)v10 / (double)statsPacketCountExpected;
        }
        -[CBHIDPerformanceSummary setErrorRate:](v11, "setErrorRate:", v12);
        -[CBHIDPerformanceSummary setIntervalSecondsExpected:](v11, "setIntervalSecondsExpected:", (double)self->_statsPacketIntervalMicsExpected / 1000000.0);
        -[CBHIDPerformanceSummary setIntervalSecondsMax:](v11, "setIntervalSecondsMax:", (double)self->_statsPacketIntervalMicsMax / 1000000.0);
        -[CBHIDPerformanceSummary setRssi:](v11, "setRssi:", self->_statsLastRSSI);
        if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
        {
          -[CBHIDPerformanceSummary errorRate](v11, "errorRate");
          -[CBHIDPerformanceSummary intervalSecondsExpected](v11, "intervalSecondsExpected");
          -[CBHIDPerformanceSummary intervalSecondsMax](v11, "intervalSecondsMax");
          -[CBHIDPerformanceSummary rssi](v11, "rssi");
          LogPrintF_safe();
        }
        v24 = MEMORY[0x1A85D1CE4](self->_summaryHandler);
        v25 = (void *)v24;
        if (v24)
          (*(void (**)(uint64_t, CBHIDPerformanceSummary *))(v24 + 16))(v24, v11);

        goto LABEL_68;
      }
    }
    else if (length < 0x18 || bytes_ptr[15] != 7)
    {
      goto LABEL_68;
    }
    v15 = bytes_ptr[22];
    if (v15 == 214)
    {
      v21 = bytes_ptr[23];
      if (v21 != 52 && v21 != 10)
        goto LABEL_68;
    }
    else
    {
      if (v15 != 213)
        goto LABEL_68;
      v16 = bytes_ptr[23];
      if (v16 > 0xF || ((1 << v16) & 0x9080) == 0)
        goto LABEL_68;
    }
    self->_startWait = 1;
    goto LABEL_68;
  }
  if (length >= 0x10 && self->_startWait)
  {
    v14 = bytes_ptr[15];
    if (v14 == 5)
    {
      self->_statsPacketIntervalMicsMax = 0;
      self->_statsPacketMicsStart = v7;
      self->_statsPacketMicsEnd = v7;
      self->_statsPacketMicsPrevious = v7;
      self->_statsPacketCountActual = 0;
      self->_startWait = 0;
      if (gLogCategory_CBHIDPerf > 10 || gLogCategory_CBHIDPerf == -1 && !_LogCategory_Initialize())
        goto LABEL_68;
      goto LABEL_47;
    }
  }
  else
  {
    if (length < 0x10)
      goto LABEL_68;
    v14 = bytes_ptr[15];
  }
  if ((v14 > 0x39 || ((1 << v14) & 0x248000000008080) == 0) && v14 != 81)
    goto LABEL_68;
  if (!self->_statsPacketMicsStart)
    self->_statsPacketMicsStart = v7;
  statsPacketMicsPrevious = self->_statsPacketMicsPrevious;
  v18 = v7;
  if (statsPacketMicsPrevious)
  {
    if (v7 < statsPacketMicsPrevious)
    {
      if (gLogCategory_CBHIDPerf > 90 || gLogCategory_CBHIDPerf == -1 && !_LogCategory_Initialize())
        goto LABEL_68;
LABEL_47:
      LogPrintF_safe();
      goto LABEL_68;
    }
    v18 = self->_statsPacketMicsPrevious;
  }
  v19 = v7 - v18;
  if (v7 - v18 > self->_statsPacketIntervalMicsMax)
    self->_statsPacketIntervalMicsMax = v19;
  self->_statsPacketMicsEnd = v7;
  self->_statsPacketMicsPrevious = v7;
  ++self->_statsPacketCountActual;
  v20 = (double)(v7 - v18) / 1000000.0;
  if (v19 < 3 * self->_statsPacketIntervalMicsExpected)
  {
    if (gLogCategory_CBHIDPerf > 10 || gLogCategory_CBHIDPerf == -1 && !_LogCategory_Initialize())
      goto LABEL_68;
    goto LABEL_47;
  }
  if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    LogPrintF_safe();
  v22 = MEMORY[0x1A85D1CE4](self->_excessiveIntervalHandler);
  v23 = (void *)v22;
  if (v22)
    (*(void (**)(uint64_t, CBDevice *, double))(v22 + 16))(v22, v4, v20);

LABEL_68:
}

- (void)_rssiAndHandleRead
{
  CBDevice *targetDevice;
  CBDevice *v4;
  dispatch_semaphore_t v5;
  CBController *v6;
  CBDeviceRequest *v7;
  NSObject *v8;
  dispatch_time_t v9;
  _QWORD v10[4];
  dispatch_semaphore_t v11;
  CBDevice *v12;
  CBHIDPerformanceMonitor *v13;
  CBController *v14;

  targetDevice = self->_targetDevice;
  if (targetDevice)
  {
    self->_statsLastRSSI = 0;
    self->_statsLastConnectionHandle = 0;
    v4 = targetDevice;
    v5 = dispatch_semaphore_create(0);
    v6 = objc_alloc_init(CBController);
    -[CBController setDispatchQueue:](v6, "setDispatchQueue:", self->_dispatchQueue);
    v7 = objc_alloc_init(CBDeviceRequest);
    -[CBDeviceRequest setRequestFlags:](v7, "setRequestFlags:", 9);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__CBHIDPerformanceMonitor__rssiAndHandleRead__block_invoke;
    v10[3] = &unk_1E5403AA0;
    v11 = v5;
    v12 = v4;
    v13 = self;
    v14 = v6;
    v8 = v5;
    -[CBController performDeviceRequest:device:completion:](v6, "performDeviceRequest:device:completion:", v7, v4, v10);
    v9 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v8, v9);

  }
}

void __45__CBHIDPerformanceMonitor__rssiAndHandleRead__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  int v10;
  unsigned int v11;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;

  v19 = a2;
  v5 = a3;
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "btAddressData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "btAddressData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    v9 = objc_msgSend(v19, "rssi");
    v10 = v9;
    if (v9)
      *(_BYTE *)(*(_QWORD *)(a1 + 48) + 136) = v9;
    v11 = objc_msgSend(v19, "connectionHandle");
    v12 = v11;
    if (v11)
      *(_WORD *)(*(_QWORD *)(a1 + 48) + 138) = v11;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      objc_msgSend(*(id *)(a1 + 40), "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      CUPrintNSError();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LogPrintF_safe();

      objc_msgSend(*(id *)(a1 + 56), "invalidate", v10, v12, v13, v18);
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "invalidate", v14, v15, v16, v17);
    }
  }

}

- (void)_timerStart
{
  OS_dispatch_source *timeoutTimer;
  NSObject *v4;
  OS_dispatch_source *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  NSObject *v8;
  _QWORD v9[6];

  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    v4 = timeoutTimer;
    dispatch_source_cancel(v4);
    v5 = self->_timeoutTimer;
    self->_timeoutTimer = 0;

  }
  v6 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)self->_workQueue);
  v7 = self->_timeoutTimer;
  self->_timeoutTimer = v6;
  v8 = v6;

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __38__CBHIDPerformanceMonitor__timerStart__block_invoke;
  v9[3] = &unk_1E53FF5A0;
  v9[4] = v8;
  v9[5] = self;
  dispatch_source_set_event_handler(v8, v9);
  CUDispatchTimerSet();
  dispatch_activate(v8);

}

uint64_t __38__CBHIDPerformanceMonitor__timerStart__block_invoke(uint64_t result)
{
  uint64_t v1;
  void *v2;

  if (*(_QWORD *)(result + 32) == *(_QWORD *)(*(_QWORD *)(result + 40) + 128))
  {
    v1 = result;
    if (gLogCategory_CBHIDPerf <= 30 && (gLogCategory_CBHIDPerf != -1 || _LogCategory_Initialize()))
    {
      LogPrintF_safe();
      v2 = *(void **)(v1 + 40);
    }
    else
    {
      v2 = *(void **)(v1 + 40);
    }
    return objc_msgSend(v2, "_testEnd");
  }
  return result;
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
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (NSArray)devices
{
  return self->_devices;
}

- (void)setDevices:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 224);
}

- (id)excessiveIntervalHandler
{
  return self->_excessiveIntervalHandler;
}

- (void)setExcessiveIntervalHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (double)intervalMs
{
  return self->_intervalMs;
}

- (void)setIntervalMs:(double)a3
{
  self->_intervalMs = a3;
}

- (id)summaryHandler
{
  return self->_summaryHandler;
}

- (void)setSummaryHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (double)testSeconds
{
  return self->_testSeconds;
}

- (void)setTestSeconds:(double)a3
{
  self->_testSeconds = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_summaryHandler, 0);
  objc_storeStrong(&self->_excessiveIntervalHandler, 0);
  objc_storeStrong((id *)&self->_devices, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong(&self->_invalidationHandler, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_timeoutTimer, 0);
  objc_storeStrong((id *)&self->_targetDevices, 0);
  objc_storeStrong((id *)&self->_targetBTAddrKey, 0);
  objc_storeStrong((id *)&self->_targetBTAddrData, 0);
  objc_storeStrong((id *)&self->_targetDevice, 0);
  objc_storeStrong((id *)&self->_packetLoggerClient, 0);
}

@end
