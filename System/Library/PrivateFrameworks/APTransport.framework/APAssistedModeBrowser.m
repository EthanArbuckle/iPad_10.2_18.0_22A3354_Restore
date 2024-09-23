@implementation APAssistedModeBrowser

- (APAssistedModeBrowser)init
{
  APAssistedModeBrowser *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APAssistedModeBrowser;
  v2 = -[APAssistedModeBrowser init](&v4, sel_init);
  if (v2)
  {
    -[APAssistedModeBrowser setInternalBrowserQueue:](v2, "setInternalBrowserQueue:", dispatch_queue_create("APAPAssistedModeBrowserInternalQueue", 0));
    -[APAssistedModeBrowser setDispatchQueue:](v2, "setDispatchQueue:", MEMORY[0x1E0C80D38]);
    dispatch_retain((dispatch_object_t)-[APAssistedModeBrowser dispatchQueue](v2, "dispatchQueue"));
  }
  return v2;
}

- (void)dealloc
{
  id deviceFoundHandlerBlock;
  NSObject *internalBrowserQueue;
  NSObject *timeoutTimer;
  NSObject *dispatchQueue;
  objc_super v7;

  self->_instanceName = 0;
  self->_bonjourServiceName = 0;

  self->_bonjourProtocol = 0;
  if (self->_bonjourBrowser)
  {
    BonjourBrowser_Stop();
    CFRelease(self->_bonjourBrowser);
    self->_bonjourBrowser = 0;
  }
  deviceFoundHandlerBlock = self->_deviceFoundHandlerBlock;
  if (deviceFoundHandlerBlock)
  {
    _Block_release(deviceFoundHandlerBlock);
    self->_deviceFoundHandlerBlock = 0;
  }
  internalBrowserQueue = self->_internalBrowserQueue;
  if (internalBrowserQueue)
  {
    dispatch_release(internalBrowserQueue);
    self->_internalBrowserQueue = 0;
  }
  timeoutTimer = self->_timeoutTimer;
  if (timeoutTimer)
  {
    dispatch_source_cancel((dispatch_source_t)self->_timeoutTimer);
    dispatch_release(timeoutTimer);
    self->_timeoutTimer = 0;
  }
  dispatchQueue = self->_dispatchQueue;
  if (dispatchQueue)
  {
    dispatch_release(dispatchQueue);
    self->_dispatchQueue = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)APAssistedModeBrowser;
  -[APAssistedModeBrowser dealloc](&v7, sel_dealloc);
}

- (void)startBrowsingFor:(id)a3 withTimeout:(double)a4 deviceFoundHandler:(id)a5
{
  OS_dispatch_queue *v9;
  _QWORD v10[8];

  v9 = -[APAssistedModeBrowser internalBrowserQueue](self, "internalBrowserQueue");
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __73__APAssistedModeBrowser_startBrowsingFor_withTimeout_deviceFoundHandler___block_invoke;
  v10[3] = &unk_1E8258D78;
  v10[4] = self;
  v10[5] = a3;
  v10[6] = a5;
  *(double *)&v10[7] = a4;
  dispatch_async((dispatch_queue_t)v9, v10);
}

uint64_t __73__APAssistedModeBrowser_startBrowsingFor_withTimeout_deviceFoundHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;

  if (objc_msgSend(*(id *)(a1 + 32), "isBrowsing"))
  {
    APSLogErrorAt();
    v4 = 4294960587;
  }
  else
  {
    if (gLogCategory_APAssistedModeBrowser <= 30
      && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
    {
      v5 = *(_QWORD *)(a1 + 32);
      LogPrintF();
    }
    objc_msgSend(*(id *)(a1 + 32), "setInstanceName:", (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("AssistedInstanceName"), v5));
    if (objc_msgSend(*(id *)(a1 + 32), "instanceName")
      && (objc_msgSend(*(id *)(a1 + 32), "setBonjourServiceName:", (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("AssistedBonjourServiceName"))), objc_msgSend(*(id *)(a1 + 32), "bonjourServiceName"))&& (objc_msgSend(*(id *)(a1 + 32), "setBonjourProtocol:", (id)objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", CFSTR("AssistedBonjourProtocol"))), objc_msgSend(*(id *)(a1 + 32), "bonjourProtocol")))
    {
      objc_msgSend(*(id *)(a1 + 32), "setDeviceFoundHandlerBlock:", _Block_copy(*(const void **)(a1 + 48)));
      v2 = objc_msgSend(*(id *)(a1 + 32), "startBonjourBrowser");
      if (!(_DWORD)v2)
      {
        objc_msgSend(*(id *)(a1 + 32), "startTimerWithTimeout:", *(double *)(a1 + 56));
        return objc_msgSend(*(id *)(a1 + 32), "setIsBrowsing:", 1);
      }
      v4 = v2;
      APSLogErrorAt();
    }
    else
    {
      APSLogErrorAt();
      v4 = 4294960591;
    }
  }
  return objc_msgSend(*(id *)(a1 + 32), "stopBrowsingWithError:", v4);
}

- (void)stopBrowsing
{
  OS_dispatch_queue *v3;
  _QWORD block[5];

  v3 = -[APAssistedModeBrowser internalBrowserQueue](self, "internalBrowserQueue");
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__APAssistedModeBrowser_stopBrowsing__block_invoke;
  block[3] = &unk_1E8254E38;
  block[4] = self;
  dispatch_sync((dispatch_queue_t)v3, block);
}

uint64_t __37__APAssistedModeBrowser_stopBrowsing__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopBrowsingWithError:", 4294960573);
}

- (void)setDispatchQueue:(id)a3
{
  OS_dispatch_queue *v5;
  _QWORD v6[6];

  v5 = -[APAssistedModeBrowser internalBrowserQueue](self, "internalBrowserQueue");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__APAssistedModeBrowser_setDispatchQueue___block_invoke;
  v6[3] = &unk_1E8258DA0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_sync((dispatch_queue_t)v5, v6);
}

void __42__APAssistedModeBrowser_setDispatchQueue___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;

  if (*(_QWORD *)(a1 + 32))
    v2 = *(NSObject **)(a1 + 32);
  else
    v2 = MEMORY[0x1E0C80D38];
  dispatch_retain(v2);
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(NSObject **)(v3 + 16);
  if (v4)
  {
    dispatch_release(v4);
    v3 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v3 + 16) = v2;
}

- (int)startBonjourBrowser
{
  int v3;
  int v4;
  APAssistedModeBrowser *v6;
  id v7;

  v3 = -[APAssistedModeBrowser setupBonjourBrowser](self, "setupBonjourBrowser");
  if (v3)
  {
    v4 = v3;
LABEL_9:
    APSLogErrorAt();
    return v4;
  }
  if (gLogCategory_APAssistedModeBrowser <= 50
    && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
  {
    v6 = self;
    v7 = -[APAssistedModeBrowser getExpectedServiceInstanceName](self, "getExpectedServiceInstanceName");
    LogPrintF();
  }
  -[APAssistedModeBrowser bonjourBrowser](self, "bonjourBrowser", v6, v7);
  objc_msgSend(-[APAssistedModeBrowser getExpectedBonjourService](self, "getExpectedBonjourService"), "UTF8String");
  v4 = BonjourBrowser_Start();
  if (v4)
    goto LABEL_9;
  return v4;
}

- (int)setupBonjourBrowser
{
  int v3;
  int v4;

  if (!-[APAssistedModeBrowser bonjourBrowser](self, "bonjourBrowser"))
  {
    v3 = BonjourBrowser_CreateEx();
    if (v3)
    {
      v4 = v3;
      APSLogErrorAt();
      return v4;
    }
    -[APAssistedModeBrowser bonjourBrowser](self, "bonjourBrowser");
    -[APAssistedModeBrowser internalBrowserQueue](self, "internalBrowserQueue");
    BonjourBrowser_SetDispatchQueue();
  }
  -[APAssistedModeBrowser bonjourBrowser](self, "bonjourBrowser");
  BonjourBrowser_SetEventHandlerBlock();
  return 0;
}

uint64_t __44__APAssistedModeBrowser_setupBonjourBrowser__block_invoke(uint64_t result, int a2, CFDictionaryRef theDict)
{
  uint64_t v5;
  const char *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  CFDictionaryRef v11;

  v5 = result;
  if (gLogCategory_APAssistedModeBrowser <= 30
    && (gLogCategory_APAssistedModeBrowser != -1 || (result = _LogCategory_Initialize(), (_DWORD)result)))
  {
    if ((a2 - 1) >= 3)
    {
      v6 = "UNKNOWN";
      if (a2 == 4)
        v6 = "Restarted";
    }
    else
    {
      v6 = off_1E8258E10[a2 - 1];
    }
    v10 = v6;
    v11 = theDict;
    v9 = *(void **)(v5 + 32);
    result = LogPrintF();
    if (!theDict)
      goto LABEL_12;
  }
  else if (!theDict)
  {
    goto LABEL_12;
  }
  result = objc_msgSend((id)objc_msgSend((id)CFDictionaryGetValue(theDict, CFSTR("dnsName")), "lowercaseString"), "hasPrefix:", objc_msgSend((id)objc_msgSend(*(id *)(v5 + 32), "getExpectedServiceInstanceName"), "lowercaseString"));
  if ((result & 1) == 0)
  {
    if (gLogCategory_APAssistedModeBrowser > 30)
      return result;
    if (gLogCategory_APAssistedModeBrowser == -1)
    {
      result = _LogCategory_Initialize();
      if (!(_DWORD)result)
        return result;
    }
    objc_msgSend(*(id *)(v5 + 32), "getExpectedServiceInstanceName", v9, v10, v11);
    return LogPrintF();
  }
LABEL_12:
  if (a2 != 1)
  {
    if (gLogCategory_APAssistedModeBrowser > 30)
      return result;
    if (gLogCategory_APAssistedModeBrowser == -1)
    {
      result = _LogCategory_Initialize();
      if (!(_DWORD)result)
        return result;
    }
    return LogPrintF();
  }
  if (gLogCategory_APAssistedModeBrowser <= 50
    && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
  {
    v7 = *(void **)(v5 + 32);
    v8 = objc_msgSend(v7, "getExpectedServiceInstanceName", v9, v10, v11);
    v10 = "Add";
    v11 = (CFDictionaryRef)v8;
    v9 = v7;
    LogPrintF();
  }
  objc_msgSend(*(id *)(v5 + 32), "callDeviceFoundHandlerOnce:error:", theDict, 0, v9, v10, v11);
  return objc_msgSend(*(id *)(v5 + 32), "stopBrowsingWithError:", 0);
}

- (int)startTimerWithTimeout:(double)a3
{
  OS_dispatch_queue *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  dispatch_time_t v8;
  APAssistedModeBrowser *v10;
  double v11;
  _QWORD handler[5];

  if (-[APAssistedModeBrowser isBrowsing](self, "isBrowsing")
    || -[APAssistedModeBrowser timeoutTimer](self, "timeoutTimer"))
  {
    APSLogErrorAt();
    return -6709;
  }
  else
  {
    v5 = -[APAssistedModeBrowser internalBrowserQueue](self, "internalBrowserQueue");
    -[APAssistedModeBrowser setTimeoutTimer:](self, "setTimeoutTimer:", dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, (dispatch_queue_t)v5));
    if (-[APAssistedModeBrowser timeoutTimer](self, "timeoutTimer"))
    {
      v6 = -[APAssistedModeBrowser timeoutTimer](self, "timeoutTimer");
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __47__APAssistedModeBrowser_startTimerWithTimeout___block_invoke;
      handler[3] = &unk_1E8254E38;
      handler[4] = self;
      dispatch_source_set_event_handler((dispatch_source_t)v6, handler);
      if (gLogCategory_APAssistedModeBrowser <= 30
        && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
      {
        v11 = a3;
        v10 = self;
        LogPrintF();
      }
      v7 = -[APAssistedModeBrowser timeoutTimer](self, "timeoutTimer", v10, *(_QWORD *)&v11);
      v8 = dispatch_time(0, 1000000000 * (uint64_t)a3);
      dispatch_source_set_timer((dispatch_source_t)v7, v8, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
      dispatch_resume((dispatch_object_t)-[APAssistedModeBrowser timeoutTimer](self, "timeoutTimer"));
      return 0;
    }
    else
    {
      APSLogErrorAt();
      return -6728;
    }
  }
}

uint64_t __47__APAssistedModeBrowser_startTimerWithTimeout___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isBrowsing");
  if ((_DWORD)result)
  {
    if (gLogCategory_APAssistedModeBrowser <= 30
      && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 32), "stopBrowsingWithError:", 4294960574);
  }
  return result;
}

- (void)stopBrowsingWithError:(int)a3
{
  uint64_t v3;
  NSObject *timeoutTimer;
  uint64_t v6;
  APAssistedModeBrowser *v7;
  id v8;
  uint64_t v9;

  v3 = *(_QWORD *)&a3;
  if (-[APAssistedModeBrowser timeoutTimer](self, "timeoutTimer"))
  {
    timeoutTimer = self->_timeoutTimer;
    if (timeoutTimer)
    {
      dispatch_release(timeoutTimer);
      self->_timeoutTimer = 0;
    }
  }
  if (-[APAssistedModeBrowser bonjourBrowser](self, "bonjourBrowser"))
  {
    -[APAssistedModeBrowser bonjourBrowser](self, "bonjourBrowser");
    BonjourBrowser_Stop();
    -[APAssistedModeBrowser bonjourBrowser](self, "bonjourBrowser");
    BonjourBrowser_SetEventHandlerBlock();
  }
  if (-[APAssistedModeBrowser isBrowsing](self, "isBrowsing")
    && gLogCategory_APAssistedModeBrowser <= 50
    && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
  {
    v8 = -[APAssistedModeBrowser getExpectedServiceInstanceName](self, "getExpectedServiceInstanceName");
    v9 = v3;
    v7 = self;
    LogPrintF();
  }

  self->_instanceName = 0;
  self->_bonjourServiceName = 0;

  self->_bonjourProtocol = 0;
  if ((_DWORD)v3)
    v6 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2F90], (int)v3, 0);
  else
    v6 = 0;
  -[APAssistedModeBrowser callDeviceFoundHandlerOnce:error:](self, "callDeviceFoundHandlerOnce:error:", 0, v6, v7, v8, v9);
  -[APAssistedModeBrowser setIsBrowsing:](self, "setIsBrowsing:", 0);
}

- (void)callDeviceFoundHandlerOnce:(id)a3 error:(id)a4
{
  void *v7;
  id deviceFoundHandlerBlock;
  OS_dispatch_queue *v9;
  APAssistedModeBrowser *v10;
  id v11;
  id v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = __Block_byref_object_copy_;
  v18 = __Block_byref_object_dispose_;
  v19 = 0;
  if (-[APAssistedModeBrowser deviceFoundHandlerBlock](self, "deviceFoundHandlerBlock"))
  {
    if (gLogCategory_APAssistedModeBrowser <= 30
      && (gLogCategory_APAssistedModeBrowser != -1 || _LogCategory_Initialize()))
    {
      v11 = -[APAssistedModeBrowser deviceFoundHandlerBlock](self, "deviceFoundHandlerBlock");
      v12 = a4;
      v10 = self;
      LogPrintF();
    }
    v7 = _Block_copy(-[APAssistedModeBrowser deviceFoundHandlerBlock](self, "deviceFoundHandlerBlock", v10, v11, v12));
    v15[5] = (uint64_t)v7;
    deviceFoundHandlerBlock = self->_deviceFoundHandlerBlock;
    if (deviceFoundHandlerBlock)
    {
      _Block_release(deviceFoundHandlerBlock);
      self->_deviceFoundHandlerBlock = 0;
    }
    v9 = -[APAssistedModeBrowser dispatchQueue](self, "dispatchQueue");
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __58__APAssistedModeBrowser_callDeviceFoundHandlerOnce_error___block_invoke;
    block[3] = &unk_1E8258DF0;
    block[5] = a4;
    block[6] = &v14;
    block[4] = a3;
    dispatch_async((dispatch_queue_t)v9, block);
  }
  _Block_object_dispose(&v14, 8);
}

void __58__APAssistedModeBrowser_callDeviceFoundHandlerOnce_error___block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) + 16))();
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  if (v2)
  {
    _Block_release(v2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = 0;
  }
}

- (id)getExpectedBonjourService
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("_%@._%@."), -[APAssistedModeBrowser bonjourServiceName](self, "bonjourServiceName"), -[APAssistedModeBrowser bonjourProtocol](self, "bonjourProtocol"));
}

- (id)getExpectedServiceInstanceName
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@.%@"), -[APAssistedModeBrowser instanceName](self, "instanceName"), -[APAssistedModeBrowser getExpectedBonjourService](self, "getExpectedBonjourService"));
}

- (OS_dispatch_queue)dispatchQueue
{
  return self->_dispatchQueue;
}

- (BOOL)isBrowsing
{
  return self->_isBrowsing;
}

- (void)setIsBrowsing:(BOOL)a3
{
  self->_isBrowsing = a3;
}

- (NSString)instanceName
{
  return self->_instanceName;
}

- (void)setInstanceName:(id)a3
{
  self->_instanceName = (NSString *)a3;
}

- (NSString)bonjourServiceName
{
  return self->_bonjourServiceName;
}

- (void)setBonjourServiceName:(id)a3
{
  self->_bonjourServiceName = (NSString *)a3;
}

- (NSString)bonjourProtocol
{
  return self->_bonjourProtocol;
}

- (void)setBonjourProtocol:(id)a3
{
  self->_bonjourProtocol = (NSString *)a3;
}

- (BonjourBrowser)bonjourBrowser
{
  return self->_bonjourBrowser;
}

- (void)setBonjourBrowser:(BonjourBrowser *)a3
{
  self->_bonjourBrowser = a3;
}

- (id)deviceFoundHandlerBlock
{
  return self->_deviceFoundHandlerBlock;
}

- (void)setDeviceFoundHandlerBlock:(id)a3
{
  self->_deviceFoundHandlerBlock = a3;
}

- (OS_dispatch_queue)internalBrowserQueue
{
  return self->_internalBrowserQueue;
}

- (void)setInternalBrowserQueue:(id)a3
{
  self->_internalBrowserQueue = (OS_dispatch_queue *)a3;
}

- (OS_dispatch_source)timeoutTimer
{
  return self->_timeoutTimer;
}

- (void)setTimeoutTimer:(id)a3
{
  self->_timeoutTimer = (OS_dispatch_source *)a3;
}

@end
