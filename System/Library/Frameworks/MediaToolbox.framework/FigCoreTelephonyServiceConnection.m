@implementation FigCoreTelephonyServiceConnection

- (OpaqueFigCoreTelephonyStatus)currentStatus
{
  NSObject *queue;
  OpaqueFigCoreTelephonyStatus v3;
  _QWORD block[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;
  char v10;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2810000000;
  v9 = &unk_19339E166;
  v10 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __50__FigCoreTelephonyServiceConnection_currentStatus__block_invoke;
  block[3] = &unk_1E2F8AFB8;
  block[4] = self;
  block[5] = &v6;
  dispatch_sync(queue, block);
  v3.hasHighSpeedHighPower = *((_BYTE *)v7 + 32);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __50__FigCoreTelephonyServiceConnection_currentStatus__block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 32) = *(_BYTE *)(*(_QWORD *)(result + 32) + 48);
  return result;
}

- (int)registerListener:(void *)a3 callback:(void *)a4 queue:(id)a5
{
  _QWORD *v9;
  uint64_t v10;
  NSObject *queue;
  int v12;
  _QWORD v14[6];

  if (a3)
  {
    v9 = malloc_type_calloc(1uLL, 0x28uLL, 0x10A004016944D70uLL);
    if (v9)
    {
      v10 = FigCFWeakReferenceHolderCreateWithReferencedObject();
      v9[2] = v10;
      if (v10)
      {
        v9[1] = a3;
        v9[3] = a4;
        dispatch_retain((dispatch_object_t)a5);
        v9[4] = a5;
        queue = self->_queue;
        v14[0] = MEMORY[0x1E0C809B0];
        v14[1] = 3221225472;
        v14[2] = __69__FigCoreTelephonyServiceConnection_registerListener_callback_queue___block_invoke;
        v14[3] = &unk_1E2F8B008;
        v14[4] = self;
        v14[5] = v9;
        dispatch_async(queue, v14);
        return 0;
      }
    }
  }
  else
  {
    v9 = 0;
  }
  v12 = FigSignalErrorAt();
  if (v12)
    FigCoreTelephonyMonitorCallbackEntryFree(v9);
  return v12;
}

uint64_t __69__FigCoreTelephonyServiceConnection_registerListener_callback_queue___block_invoke(uint64_t a1)
{
  dispatch_source_t *v2;

  **(_QWORD **)(a1 + 40) = 0;
  **(_QWORD **)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) = *(_QWORD *)(a1 + 40);
  v2 = *(dispatch_source_t **)(a1 + 32);
  if (v2[2])
  {
    dispatch_source_cancel(v2[2]);
    dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
    v2 = *(dispatch_source_t **)(a1 + 32);
  }
  return -[dispatch_source_t _setupConnection](v2, "_setupConnection");
}

- (void)deregisterListener:(void *)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke;
  v4[3] = &unk_1E2F8B008;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(queue, v4);
}

void __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD handler[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD **)(v2 + 56);
  if (!v3)
  {
LABEL_13:
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, *(dispatch_queue_t *)(v2 + 8));
    v9 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 16);
    v10 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v9, v10, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = *(NSObject **)(v11 + 16);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke_2;
    handler[3] = &unk_1E2F88548;
    handler[4] = v11;
    dispatch_source_set_event_handler(v12, handler);
    dispatch_resume(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 16));
    return;
  }
  do
  {
    v4 = (_QWORD *)*v3;
    if (v3[1] != *(_QWORD *)(a1 + 40))
      goto LABEL_11;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD **)(v5 + 56);
    if (v6 != v3)
    {
      do
      {
        v7 = v6;
        v6 = (_QWORD *)*v6;
      }
      while (v6 != v3);
      *v7 = v4;
      if (v4)
        goto LABEL_10;
      v8 = *(_QWORD *)(a1 + 32);
      goto LABEL_9;
    }
    *(_QWORD *)(v5 + 56) = v4;
    if (!v4)
    {
      v8 = *(_QWORD *)(a1 + 32);
      v7 = (_QWORD *)(v8 + 56);
LABEL_9:
      *(_QWORD *)(v8 + 64) = v7;
    }
LABEL_10:
    FigCoreTelephonyMonitorCallbackEntryFree(v3);
LABEL_11:
    v3 = v4;
  }
  while (v4);
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_QWORD *)(v2 + 56))
    goto LABEL_13;
}

void __56__FigCoreTelephonyServiceConnection_deregisterListener___block_invoke_2(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;

  v2 = *(_QWORD **)(a1 + 32);
  if (!v2[7])
  {
    objc_msgSend(v2, "_teardownConnection");
    v2 = *(_QWORD **)(a1 + 32);
  }
  v3 = v2[2];
  if (v3)
  {
    dispatch_release(v3);
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  }
}

- (void)_handleCTNotification:(__CFString *)a3 notificationInfo:(__CFDictionary *)a4
{
  const void *v6;
  FigCoreTelephonyMonitorCallbackEntry *i;
  dispatch_time_t v8;
  NSObject *queue;
  _QWORD block[5];

  v6 = (const void *)getkCTConnectionInvalidatedNotification[0]();
  if (CFEqual(a3, v6))
  {
    -[FigCoreTelephonyServiceConnection _teardownConnection](self, "_teardownConnection");
    for (i = self->_callbackEntries.stqh_first; i; i = *(FigCoreTelephonyMonitorCallbackEntry **)i)
      FigCoreTelephonyMonitorCallbackEntryDoCallback((uint64_t)i, self->_currentStatus.hasHighSpeedHighPower);
    v8 = dispatch_time(0, 10000000000);
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __76__FigCoreTelephonyServiceConnection__handleCTNotification_notificationInfo___block_invoke;
    block[3] = &unk_1E2F88548;
    block[4] = self;
    dispatch_after(v8, queue, block);
  }
}

uint64_t __76__FigCoreTelephonyServiceConnection__handleCTNotification_notificationInfo___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_setupConnection");
}

- (void)_setupConnection
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke;
  block[3] = &unk_1E2F88548;
  block[4] = self;
  dispatch_async(queue, block);
}

void __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];

  v1 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)(v1 + 56) && !*(_QWORD *)(v1 + 24))
  {
    v3 = (void *)MEMORY[0x19403137C]();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(_QWORD *)(v4 + 72);
    v6 = *(_QWORD *)(v4 + 8);
    v7 = MEMORY[0x1E0C809B0];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_2;
    v14[3] = &unk_1E2FB65C0;
    v14[4] = v4;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))softLink_CTServerConnectionCreateOnTargetQueue[0])(v5, (uint64_t)CFSTR("com.apple.coremedia"), v6, (uint64_t)v14);
    v8 = *(_QWORD **)(a1 + 32);
    if (!v8[3]
      || (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 32) = objc_msgSend(objc_alloc((Class)getCoreTelephonyClientClass[0]()), "initWithQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "setDelegate:"), v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), v10 = getkCTConnectionInvalidatedNotification[0](), v11 = ((uint64_t (*)(uint64_t, uint64_t))softLink_CTServerConnectionRegisterForNotification[0])(v9, v10), v8 = *(_QWORD **)(a1 + 32), HIDWORD(v11)))
    {
      objc_msgSend(v8, "_teardownConnection");
    }
    else
    {
      v12 = (void *)v8[4];
      v13[0] = v7;
      v13[1] = 3221225472;
      v13[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_3;
      v13[3] = &unk_1E2FB65E8;
      v13[4] = v8;
      objc_msgSend(v12, "getDataStatusBasic:completion:", 0, v13);
    }
    objc_autoreleasePoolPop(v3);
  }
}

void __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;

  v6 = (void *)MEMORY[0x19403137C]();
  objc_msgSend(*(id *)(a1 + 32), "_handleCTNotification:notificationInfo:", a2, a3);
  objc_autoreleasePoolPop(v6);
}

void __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(NSObject **)(v2 + 8);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_4;
  v4[3] = &unk_1E2F8AEF0;
  v4[4] = v2;
  v4[5] = a2;
  dispatch_async(v3, v4);
}

uint64_t __53__FigCoreTelephonyServiceConnection__setupConnection__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "processDataStatusBasic:", *(_QWORD *)(a1 + 40));
}

- (void)_teardownConnection
{
  void *v3;
  CoreTelephonyClient *ctClient;
  __CTServerConnection *ctServerConnection;

  v3 = (void *)MEMORY[0x19403137C](self, a2);
  ctClient = self->_ctClient;
  if (ctClient)
  {
    -[CoreTelephonyClient setDelegate:](ctClient, "setDelegate:", 0);

    self->_ctClient = 0;
  }
  ctServerConnection = self->_ctServerConnection;
  if (ctServerConnection)
  {
    softLink_CTServerConnectionUnregisterForAllNotifications((uint64_t)ctServerConnection);
    CFRelease(self->_ctServerConnection);
    self->_ctServerConnection = 0;
  }

  self->_ctDataStatus = 0;
  self->_currentStatus.hasHighSpeedHighPower = 0;
  objc_autoreleasePoolPop(v3);
}

+ (id)sharedInstance
{
  if (sharedInstance_sFigCoreTelephonyServiceConnectionOnceToken != -1)
    dispatch_once(&sharedInstance_sFigCoreTelephonyServiceConnectionOnceToken, &__block_literal_global_116);
  return (id)sharedInstance_sFigCoreTelephonyServiceConnection;
}

FigCoreTelephonyServiceConnection *__51__FigCoreTelephonyServiceConnection_sharedInstance__block_invoke()
{
  FigCoreTelephonyServiceConnection *result;

  result = objc_alloc_init(FigCoreTelephonyServiceConnection);
  sharedInstance_sFigCoreTelephonyServiceConnection = (uint64_t)result;
  return result;
}

- (void)processDataStatusBasic:(id)a3
{
  NSObject *queue;
  _QWORD v4[6];

  queue = self->_queue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __60__FigCoreTelephonyServiceConnection_processDataStatusBasic___block_invoke;
  v4[3] = &unk_1E2F8AEF0;
  v4[4] = a3;
  v4[5] = self;
  dispatch_async(queue, v4);
}

void __60__FigCoreTelephonyServiceConnection_processDataStatusBasic___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;
  int v4;
  uint64_t v5;
  void *v6;
  _QWORD *v7;

  v2 = (void *)MEMORY[0x19403137C]();
  v3 = objc_msgSend(*(id *)(a1 + 32), "newRadioCoverage");
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 40), "newRadioCoverage");
  v5 = *(_QWORD *)(a1 + 40);
  if (v3 != v4)
  {
    v6 = *(void **)(a1 + 32);
    if (v6)
      LOBYTE(v6) = objc_msgSend(v6, "newRadioCoverage");
    *(_BYTE *)(v5 + 48) = (_BYTE)v6;
    v5 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD **)(v5 + 56);
    if (v7)
    {
      do
      {
        FigCoreTelephonyMonitorCallbackEntryDoCallback((uint64_t)v7, *(_BYTE *)(*(_QWORD *)(a1 + 40) + 48));
        v7 = (_QWORD *)*v7;
      }
      while (v7);
      v5 = *(_QWORD *)(a1 + 40);
    }
  }

  *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40) = *(id *)(a1 + 32);
  objc_autoreleasePoolPop(v2);
}

- (FigCoreTelephonyServiceConnection)init
{
  FigCoreTelephonyServiceConnection *v2;
  FigCoreTelephonyServiceConnection *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FigCoreTelephonyServiceConnection;
  v2 = -[FigCoreTelephonyServiceConnection init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_allocator = (__CFAllocator *)*MEMORY[0x1E0C9AE00];
    v4 = FigDispatchQueueCreateWithPriority();
    v3->_queue = (OS_dispatch_queue *)v4;
    if (v4)
    {
      v3->_callbackEntries.stqh_first = 0;
      v3->_callbackEntries.stqh_last = &v3->_callbackEntries.stqh_first;
      v3->_currentStatus.hasHighSpeedHighPower = 0;
    }
    else
    {
      return 0;
    }
  }
  return v3;
}

- (void)dealloc
{
  NSObject *queue;
  NSObject *doomTimer;
  FigCoreTelephonyMonitorCallbackEntry *stqh_first;
  FigCoreTelephonyMonitorListHead *p_callbackEntries;
  FigCoreTelephonyMonitorCallbackEntry *v7;
  FigCoreTelephonyMonitorCallbackEntry *v8;
  FigCoreTelephonyMonitorListHead *v9;
  objc_super v10;

  queue = self->_queue;
  if (queue)
    dispatch_release(queue);
  doomTimer = self->_doomTimer;
  if (doomTimer)
  {
    dispatch_source_cancel(doomTimer);
    dispatch_release((dispatch_object_t)self->_doomTimer);
    self->_doomTimer = 0;
  }
  p_callbackEntries = &self->_callbackEntries;
  stqh_first = self->_callbackEntries.stqh_first;
  if (!stqh_first)
    goto LABEL_14;
  while (1)
  {
    v7 = *(FigCoreTelephonyMonitorCallbackEntry **)stqh_first;
    v8 = p_callbackEntries->stqh_first;
    if (p_callbackEntries->stqh_first == stqh_first)
      break;
    do
    {
      v9 = (FigCoreTelephonyMonitorListHead *)v8;
      v8 = *(FigCoreTelephonyMonitorCallbackEntry **)v8;
    }
    while (v8 != stqh_first);
    v9->stqh_first = v7;
    if (!v7)
      goto LABEL_13;
LABEL_11:
    FigCoreTelephonyMonitorCallbackEntryFree(stqh_first);
    stqh_first = v7;
  }
  p_callbackEntries->stqh_first = v7;
  if (v7)
    goto LABEL_11;
  v9 = &self->_callbackEntries;
LABEL_13:
  self->_callbackEntries.stqh_last = &v9->stqh_first;
  FigCoreTelephonyMonitorCallbackEntryFree(stqh_first);
LABEL_14:
  v10.receiver = self;
  v10.super_class = (Class)FigCoreTelephonyServiceConnection;
  -[FigCoreTelephonyServiceConnection dealloc](&v10, sel_dealloc);
}

@end
