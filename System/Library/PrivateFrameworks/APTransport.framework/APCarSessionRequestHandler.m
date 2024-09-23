@implementation APCarSessionRequestHandler

- (APCarSessionRequestHandler)init
{
  APCarSessionRequestHandler *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)APCarSessionRequestHandler;
  v2 = -[APCarSessionRequestHandler init](&v4, sel_init);
  if (v2)
  {
    v2->_queue = (OS_dispatch_queue *)dispatch_queue_create("com.apple.airplay.APCarSessionRequestHandler", 0);
    v2->_carPlayHelpers = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
  }
  return v2;
}

- (void)dealloc
{
  __CFSet *carPlayHelpers;
  NSObject *queue;
  objc_super v5;

  carPlayHelpers = self->_carPlayHelpers;
  if (carPlayHelpers)
  {
    CFRelease(carPlayHelpers);
    self->_carPlayHelpers = 0;
  }
  queue = self->_queue;
  if (queue)
  {
    dispatch_release(queue);
    self->_queue = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)APCarSessionRequestHandler;
  -[APCarSessionRequestHandler dealloc](&v5, sel_dealloc);
}

- (void)registerSessionRequestHandlerMachService
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  self->_agent = (CARSessionRequestAgent *)objc_msgSend(objc_alloc(getCARSessionRequestAgentClass()), "initWithRequestHandler:", self);
}

- (void)addCarPlayHelper:(OpaqueAPCarPlayHelperHelper *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (self->_agent)
  {
    APSLogErrorAt();
    if (gLogCategory_APBrowserCarSessionHelper <= 90
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
  }
  else
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __47__APCarSessionRequestHandler_addCarPlayHelper___block_invoke;
    v4[3] = &unk_1E8256F90;
    v4[4] = self;
    v4[5] = a3;
    dispatch_sync(queue, v4);
  }
}

void __47__APCarSessionRequestHandler_addCarPlayHelper___block_invoke(uint64_t a1)
{
  CFSetAddValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 16), *(const void **)(a1 + 40));
}

- (void)removeCarPlayHelper:(OpaqueAPCarPlayHelperHelper *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __50__APCarSessionRequestHandler_removeCarPlayHelper___block_invoke;
  v4[3] = &unk_1E8256F90;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

void __50__APCarSessionRequestHandler_removeCarPlayHelper___block_invoke(uint64_t a1)
{
  CFSetRemoveValue(*(CFMutableSetRef *)(*(_QWORD *)(a1 + 32) + 16), *(const void **)(a1 + 40));
}

- (void)startSessionWithHost:(id)a3 requestIdentifier:(id)a4 completion:(id)a5
{
  NSObject *queue;
  _QWORD block[7];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke;
  block[3] = &unk_1E8259CD0;
  block[4] = self;
  block[5] = a4;
  block[6] = a3;
  dispatch_sync(queue, block);
  if (a5)
    (*((void (**)(id, uint64_t, _QWORD))a5 + 2))(a5, 1, 0);
}

uint64_t __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke()
{
  return CFSetApplyBlock();
}

void __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  _QWORD v6[4];
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(NSObject **)(DerivedStorage + 16);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke_3;
  v6[3] = &unk_1E8259C80;
  v8 = DerivedStorage;
  v9 = a2;
  v7 = *(_OWORD *)(a1 + 32);
  dispatch_sync(v5, v6);
}

uint64_t __80__APCarSessionRequestHandler_startSessionWithHost_requestIdentifier_completion___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  const void *v9;
  const void *v10;
  CFAbsoluteTime Current;
  uint64_t v12;
  const void *v13;
  const void *v14;
  uint8_t buf[72];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(result + 48);
  if (*(_BYTE *)(v1 + 160))
  {
    v2 = result;
    if (!*(_QWORD *)(v1 + 240) && !*(_BYTE *)(v1 + 248))
    {
      SNPrintF();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v3 = os_transaction_create();
      v1 = *(_QWORD *)(v2 + 48);
      *(_QWORD *)(v1 + 240) = v3;
      *(_BYTE *)(v1 + 248) = 1;
    }
    if (*(_QWORD *)(v1 + 256))
    {
      APSEventRecorderRecordEvent();
      v4 = LogCategoryCopyOSLogHandle();
      v5 = (void *)v4;
      if (v4)
        v6 = v4;
      else
        v6 = MEMORY[0x1E0C81028];
      if (os_signpost_enabled(v6))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1C9382000, v6, OS_SIGNPOST_EVENT, 0x2B8D0800uLL, "AP_SIGNPOST_CAR_STARTSESSIONHOST", ", buf, 2u);
      }
      if (v5)

    }
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }

    v7 = *(id *)(v2 + 40);
    v8 = *(_QWORD *)(v2 + 48);
    *(_QWORD *)(v8 + 168) = v7;
    v9 = *(const void **)(v8 + 176);
    v10 = *(const void **)(v2 + 32);
    *(_QWORD *)(v8 + 176) = v10;
    if (v10)
      CFRetain(v10);
    if (v9)
      CFRelease(v9);
    Current = CFAbsoluteTimeGetCurrent();
    v12 = *(_QWORD *)(v2 + 48);
    *(CFAbsoluteTime *)(v12 + 184) = Current;
    v13 = *(const void **)(v12 + 136);
    v14 = (const void *)objc_msgSend(*(id *)(v2 + 40), "carplayWiFiUUID");
    *(_QWORD *)(*(_QWORD *)(v2 + 48) + 136) = v14;
    if (v14)
      CFRetain(v14);
    if (v13)
      CFRelease(v13);
    if (*(_QWORD *)(*(_QWORD *)(v2 + 48) + 136))
      carPlayHelperSession_connectivityHelperCheckIfWiFiUUIDChanged();
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(v2 + 56));
  }
  return result;
}

- (void)stoppedSessionForHostIdentifier:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke;
  v4[3] = &unk_1E8258DA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke()
{
  return CFSetApplyBlock();
}

void __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(NSObject **)(DerivedStorage + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke_3;
  block[3] = &unk_1E8254E88;
  block[5] = DerivedStorage;
  block[6] = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v5, block);
}

uint64_t __62__APCarSessionRequestHandler_stoppedSessionForHostIdentifier___block_invoke_3(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;
  const void *v4;
  uint64_t v5;
  const void *v6;
  void *v7;
  void *v8;

  v1 = *(_QWORD *)(result + 40);
  if (*(_BYTE *)(v1 + 160) && *(_QWORD *)(v1 + 168))
  {
    v2 = result;
    if (gLogCategory_APBrowserCarSessionHelper <= 50)
    {
      if (gLogCategory_APBrowserCarSessionHelper != -1
        || (v3 = _LogCategory_Initialize(), v1 = *(_QWORD *)(v2 + 40), v3))
      {
        objc_msgSend(*(id *)(v1 + 168), "deviceIdentifier");
        LogPrintF();
        v1 = *(_QWORD *)(v2 + 40);
      }
    }
    v4 = *(const void **)(v1 + 136);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(*(_QWORD *)(v2 + 40) + 136) = 0;
      v1 = *(_QWORD *)(v2 + 40);
    }

    v5 = *(_QWORD *)(v2 + 40);
    *(_QWORD *)(v5 + 168) = 0;
    v6 = *(const void **)(v5 + 176);
    if (v6)
    {
      CFRelease(v6);
      *(_QWORD *)(*(_QWORD *)(v2 + 40) + 176) = 0;
      v5 = *(_QWORD *)(v2 + 40);
    }
    *(_QWORD *)(v5 + 184) = 0;
    *(_DWORD *)(v5 + 192) = 0;
    if (*(_QWORD *)(v5 + 240))
    {
      v7 = (void *)os_transaction_copy_description();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      free(v7);
      v8 = *(void **)(*(_QWORD *)(v2 + 40) + 240);
      if (v8)
      {

        *(_QWORD *)(*(_QWORD *)(v2 + 40) + 240) = 0;
      }
    }
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(v2 + 48));
  }
  return result;
}

- (void)_startAdvertisingCarPlayControlForUSB
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFSetApplyBlock();
}

void __67__APCarSessionRequestHandler__startAdvertisingCarPlayControlForUSB__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v4;
  _QWORD v5[6];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(NSObject **)(DerivedStorage + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__APCarSessionRequestHandler__startAdvertisingCarPlayControlForUSB__block_invoke_2;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = DerivedStorage;
  v5[5] = a2;
  dispatch_sync(v4, v5);
}

uint64_t __67__APCarSessionRequestHandler__startAdvertisingCarPlayControlForUSB__block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(result + 32);
  if (!*(_BYTE *)(v1 + 160) && *(_BYTE *)(v1 + 64))
  {
    v2 = result;
    if (!*(_QWORD *)(v1 + 240) && !*(_BYTE *)(v1 + 248))
    {
      SNPrintF();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v3 = os_transaction_create();
      v4 = *(_QWORD *)(v2 + 32);
      *(_QWORD *)(v4 + 240) = v3;
      *(_BYTE *)(v4 + 248) = 1;
    }
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    *(CFAbsoluteTime *)(*(_QWORD *)(v2 + 32) + 96) = CFAbsoluteTimeGetCurrent();
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(v2 + 40));
  }
  return result;
}

- (void)startAdvertisingCarPlayControlForUSB
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__APCarSessionRequestHandler_startAdvertisingCarPlayControlForUSB__block_invoke;
  block[3] = &unk_1E8254E38;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __66__APCarSessionRequestHandler_startAdvertisingCarPlayControlForUSB__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAdvertisingCarPlayControlForUSB");
}

- (void)checkCarPlayControlAdvertisingForUSB
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __66__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForUSB__block_invoke;
  block[3] = &unk_1E8254E38;
  block[4] = self;
  dispatch_async(queue, block);
}

uint64_t __66__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForUSB__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "wantsCarPlayControlAdvertisingForUSB");
  if ((_DWORD)result)
  {
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 32), "_startAdvertisingCarPlayControlForUSB");
  }
  return result;
}

- (void)_startAdvertisingCarPlayControlForWiFiUUID:(id)a3
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  CFSetApplyBlock();
}

void __73__APCarSessionRequestHandler__startAdvertisingCarPlayControlForWiFiUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(NSObject **)(DerivedStorage + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__APCarSessionRequestHandler__startAdvertisingCarPlayControlForWiFiUUID___block_invoke_2;
  block[3] = &unk_1E8254E88;
  block[5] = DerivedStorage;
  block[6] = a2;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v5, block);
}

uint64_t __73__APCarSessionRequestHandler__startAdvertisingCarPlayControlForWiFiUUID___block_invoke_2(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  const void *v5;
  uint64_t v6;
  const void *v7;

  v1 = *(_QWORD *)(result + 40);
  if (!*(_BYTE *)(v1 + 160) && *(_BYTE *)(v1 + 104))
  {
    v2 = result;
    if (!*(_QWORD *)(v1 + 240) && !*(_BYTE *)(v1 + 248))
    {
      SNPrintF();
      if (gLogCategory_APBrowserCarSessionHelper <= 50
        && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
      {
        LogPrintF();
      }
      v3 = os_transaction_create();
      v4 = *(_QWORD *)(v2 + 40);
      *(_QWORD *)(v4 + 240) = v3;
      *(_BYTE *)(v4 + 248) = 1;
    }
    carPlayHelperSession_connectivityHelperCheckIfWiFiUUIDChanged();
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    v5 = *(const void **)(v2 + 32);
    v6 = *(_QWORD *)(v2 + 40);
    v7 = *(const void **)(v6 + 136);
    *(_QWORD *)(v6 + 136) = v5;
    if (v5)
      CFRetain(v5);
    if (v7)
      CFRelease(v7);
    *(CFAbsoluteTime *)(*(_QWORD *)(v2 + 40) + 144) = CFAbsoluteTimeGetCurrent();
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(v2 + 48));
  }
  return result;
}

- (void)startAdvertisingCarPlayControlForWiFiUUID:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__APCarSessionRequestHandler_startAdvertisingCarPlayControlForWiFiUUID___block_invoke;
  v4[3] = &unk_1E8258DA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(queue, v4);
}

uint64_t __72__APCarSessionRequestHandler_startAdvertisingCarPlayControlForWiFiUUID___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_startAdvertisingCarPlayControlForWiFiUUID:", *(_QWORD *)(a1 + 40));
}

- (void)checkCarPlayControlAdvertisingForWiFiUUID:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __72__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForWiFiUUID___block_invoke;
  v4[3] = &unk_1E8258DA0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

uint64_t __72__APCarSessionRequestHandler_checkCarPlayControlAdvertisingForWiFiUUID___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "wantsCarPlayControlAdvertisingForWiFiUUID:", *(_QWORD *)(a1 + 40));
  if ((_DWORD)result)
  {
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    return objc_msgSend(*(id *)(a1 + 32), "_startAdvertisingCarPlayControlForWiFiUUID:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

- (void)prepareForRemovingWiFiUUID:(id)a3 completion:(id)a4
{
  NSObject *queue;
  _QWORD v6[6];

  queue = self->_queue;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke;
  v6[3] = &unk_1E8258DA0;
  v6[4] = a3;
  v6[5] = self;
  dispatch_sync(queue, v6);
  if (a4)
    (*((void (**)(id, uint64_t, _QWORD))a4 + 2))(a4, 1, 0);
}

uint64_t __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke()
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSetApplyBlock();
}

void __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v5;
  _QWORD block[7];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v5 = *(NSObject **)(DerivedStorage + 16);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke_3;
  block[3] = &unk_1E8254E88;
  block[5] = a2;
  block[6] = DerivedStorage;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_sync(v5, block);
}

uint64_t __68__APCarSessionRequestHandler_prepareForRemovingWiFiUUID_completion___block_invoke_3(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  const void *v4;

  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  result = FigCFEqual();
  if ((_DWORD)result)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(const void **)(v3 + 136);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(*(_QWORD *)(a1 + 48) + 136) = 0;
      v3 = *(_QWORD *)(a1 + 48);
    }
    *(_QWORD *)(v3 + 144) = 0;
    return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(a1 + 40));
  }
  return result;
}

- (void)cancelRequests
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__APCarSessionRequestHandler_cancelRequests__block_invoke;
  block[3] = &unk_1E8254E38;
  block[4] = self;
  dispatch_sync(queue, block);
}

uint64_t __44__APCarSessionRequestHandler_cancelRequests__block_invoke()
{
  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  return CFSetApplyBlock();
}

void __44__APCarSessionRequestHandler_cancelRequests__block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t DerivedStorage;
  NSObject *v4;
  _QWORD v5[6];

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v4 = *(NSObject **)(DerivedStorage + 16);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __44__APCarSessionRequestHandler_cancelRequests__block_invoke_3;
  v5[3] = &__block_descriptor_48_e5_v8__0l;
  v5[4] = a2;
  v5[5] = DerivedStorage;
  dispatch_sync(v4, v5);
}

uint64_t __44__APCarSessionRequestHandler_cancelRequests__block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  uint64_t v4;
  const void *v5;
  void *v6;
  void *v7;

  if (gLogCategory_APBrowserCarSessionHelper <= 50
    && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v2 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v2 + 96) = 0;
  v3 = *(const void **)(v2 + 136);
  if (v3)
  {
    CFRelease(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 136) = 0;
    v2 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v2 + 144) = 0;

  v4 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(v4 + 168) = 0;
  v5 = *(const void **)(v4 + 176);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 176) = 0;
    v4 = *(_QWORD *)(a1 + 40);
  }
  *(_QWORD *)(v4 + 184) = 0;
  *(_DWORD *)(v4 + 192) = 0;
  if (*(_QWORD *)(v4 + 240))
  {
    v6 = (void *)os_transaction_copy_description();
    if (gLogCategory_APBrowserCarSessionHelper <= 50
      && (gLogCategory_APBrowserCarSessionHelper != -1 || _LogCategory_Initialize()))
    {
      LogPrintF();
    }
    free(v6);
    v7 = *(void **)(*(_QWORD *)(a1 + 40) + 240);
    if (v7)
    {

      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 240) = 0;
    }
  }
  return carPlayHelperSession_updateNetworkAndSessionState(*(const void **)(a1 + 32));
}

@end
