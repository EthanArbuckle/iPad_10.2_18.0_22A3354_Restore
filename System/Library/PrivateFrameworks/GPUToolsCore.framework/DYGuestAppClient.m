@implementation DYGuestAppClient

+ (id)timebaseDictionary
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  timeval v10;

  v2 = mach_absolute_time();
  gettimeofday(&v10, 0);
  v3 = mach_absolute_time();
  mach_timebase_info((mach_timebase_info_t)&g_DYTimebaseInfo);
  v4 = v2 + ((v3 - v2) >> 1);
  v5 = (void *)MEMORY[0x24BDBCE70];
  v6 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", 1000000000 * v10.tv_sec + 1000 * v10.tv_usec);
  v7 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", v4);
  v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", g_DYTimebaseInfo);
  return (id)objc_msgSend(v5, "dictionaryWithObjectsAndKeys:", v6, CFSTR("nanoseconds since epoch timestamp"), v7, CFSTR("mach absolute timestamp"), v8, CFSTR("mach timebase numerator"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", dword_256BC8DD4), CFSTR("mach timebase denominator"), 0);
}

- (void)_handleTurnOnCapture
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_handleTurnOffCapture
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_handleCaptureStreamCreated
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_handleFrameEnd:(unint64_t)a3
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (DYGuestAppClient)init
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (unsigned)incrementGlobalFrameCounter
{
  unsigned int *p_globalFrameCounter;
  unsigned int v3;
  unsigned int result;

  p_globalFrameCounter = &self->_globalFrameCounter;
  do
  {
    v3 = __ldxr(p_globalFrameCounter);
    result = v3 + 1;
  }
  while (__stxr(v3 + 1, p_globalFrameCounter));
  return result;
}

- (void)setTraceMode:(int)a3
{
  int traceMode;

  traceMode = self->_traceMode;
  if (traceMode != a3)
  {
    self->_traceMode = a3;
    self->_previousTraceMode = traceMode;
  }
  -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:objectPayload:](DYTransportMessage, "messageWithKind:objectPayload:", 1796, objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:")));
}

- (DYGuestAppClient)initWithTransport:(id)a3
{
  char *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  id v14;
  NSObject *v15;
  void *v16;
  _QWORD v18[2];
  intptr_t (*v19)(uint64_t);
  void *v20;
  char *v21;
  NSObject *v22;
  _QWORD v23[5];
  _QWORD v24[5];
  objc_super v25;
  void *memptr;

  v25.receiver = self;
  v25.super_class = (Class)DYGuestAppClient;
  v4 = -[DYGuestAppClient init](&v25, sel_init);
  if (v4)
  {
    if (-[DYGuestAppClient initWithTransport:]::onceToken != -1)
      dispatch_once(&-[DYGuestAppClient initWithTransport:]::onceToken, &__block_literal_global_11);
    objc_msgSend((id)_gWeakAppClients, "addPointer:", v4);
    v5 = MEMORY[0x24BDAC760];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = __38__DYGuestAppClient_initWithTransport___block_invoke_2;
    v24[3] = &unk_250D63828;
    v24[4] = v4;
    v6 = (void *)objc_msgSend(v24, "copy");
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 8uLL, 0x40uLL, 0x9FC05F6DuLL);
    v7 = memptr;
    GPUTools::FB::Stream::Stream((uint64_t)memptr, v6, 0);
    *((_QWORD *)v4 + 8) = v7;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 8uLL, 0x40uLL, 0x9FC05F6DuLL);
    v8 = memptr;
    GPUTools::FB::Stream::Stream((uint64_t)memptr, v6, 0);
    *((_QWORD *)v4 + 9) = v8;
    memptr = 0;
    malloc_type_posix_memalign(&memptr, 8uLL, 0x40uLL, 0x9FC05F6DuLL);
    v9 = memptr;
    GPUTools::FB::Stream::Stream((uint64_t)memptr, v6, 0);
    *((_QWORD *)v4 + 10) = v9;

    GPUTools::FB::Stream::Open(*((GPUTools::FB::Stream **)v4 + 8), CFSTR("live"));
    GPUTools::FB::Stream::Open(*((GPUTools::FB::Stream **)v4 + 9), (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%d-%@"), CFSTR("startup"), 0, CFSTR("platform")));
    v10 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v4)), v4, CFSTR("global_sync")), "UTF8String");
    *((_QWORD *)v4 + 6) = dispatch_queue_create(v10, 0);
    v11 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v4)), v4, CFSTR("saveptr")), "UTF8String");
    *((_QWORD *)v4 + 4) = dispatch_queue_create(v11, 0);
    v12 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v4)), v4, CFSTR("stop_capture")), "UTF8String");
    *((_QWORD *)v4 + 7) = dispatch_queue_create(v12, 0);
    v13 = (const char *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("gputools.%@.%p.%@"), objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", object_getClassName(v4)), v4, CFSTR("graphics_lock")), "UTF8String");
    *((_QWORD *)v4 + 13) = dispatch_queue_create(v13, 0);
    *((_QWORD *)v4 + 14) = dispatch_semaphore_create(1);
    *((_QWORD *)v4 + 11) = 0x100000001;
    *((_DWORD *)v4 + 24) = 0;
    *((_DWORD *)v4 + 31) = 0;
    *((_QWORD *)v4 + 17) = 0;
    *((_QWORD *)v4 + 3) = objc_opt_new();
    *((_QWORD *)v4 + 5) = objc_opt_new();
    v14 = a3;
    *((_QWORD *)v4 + 1) = v14;
    objc_msgSend(v14, "setSynchronous:", 1);
    *((_DWORD *)v4 + 25) = 0;
    *(_OWORD *)(v4 + 152) = 0u;
    *(_OWORD *)(v4 + 168) = 0u;
    atexit((void (*)(void))handle_exit);
    v15 = dispatch_semaphore_create(0);
    v16 = (void *)objc_msgSend(*((id *)v4 + 1), "newSourceWithQueue:", *((_QWORD *)v4 + 6));
    *((_QWORD *)v4 + 2) = v16;
    v23[0] = v5;
    v23[1] = 3221225472;
    v23[2] = __38__DYGuestAppClient_initWithTransport___block_invoke_3;
    v23[3] = &unk_250D63850;
    v23[4] = v4;
    objc_msgSend(v16, "setMessageHandler:", v23);
    objc_msgSend(*((id *)v4 + 2), "setCancellationHandler:", &__block_literal_global_111);
    v18[0] = v5;
    v18[1] = 3221225472;
    v19 = __38__DYGuestAppClient_initWithTransport___block_invoke_6;
    v20 = &unk_250D622A0;
    v21 = v4;
    v22 = v15;
    objc_msgSend(*((id *)v4 + 2), "setRegistrationHandler:", v18);
    objc_msgSend(*((id *)v4 + 2), "resume");
    if (!*((_QWORD *)v4 + 1))
      v19((uint64_t)v18);
    dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v15);
  }
  return (DYGuestAppClient *)v4;
}

id __38__DYGuestAppClient_initWithTransport___block_invoke()
{
  id result;

  result = (id)objc_msgSend(MEMORY[0x24BDD1748], "weakObjectsPointerArray");
  _gWeakAppClients = (uint64_t)result;
  return result;
}

void __38__DYGuestAppClient_initWithTransport___block_invoke_2(uint64_t a1, DYGuestAppClient *a2, Stream *a3)
{
  GPUTools::Interpose::DYFlushFbufStream(*(GPUTools::Interpose **)(a1 + 32), a2, a3);
}

uint64_t __38__DYGuestAppClient_initWithTransport___block_invoke_3(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "processMessage:", a2);
}

void __38__DYGuestAppClient_initWithTransport___block_invoke_4()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_112);
}

void __38__DYGuestAppClient_initWithTransport___block_invoke_5()
{
  exit(1);
}

intptr_t __38__DYGuestAppClient_initWithTransport___block_invoke_6(uint64_t a1)
{
  dispatch_suspend(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 48));
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_globalSyncQueue);
  v3.receiver = self;
  v3.super_class = (Class)DYGuestAppClient;
  -[DYGuestAppClient dealloc](&v3, sel_dealloc);
}

- (void)atexit
{
  if (self->_state == 3)
    -[DYGuestAppClient handleCaptureModeTransition:](self, "handleCaptureModeTransition:", 0);
  if (-[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames")
    && !-[DYCaptureState allDataReceivedAck](self->_activeCaptureState, "allDataReceivedAck"))
  {
    do
    {
      if (-[DYTransport invalid](self->_transport, "invalid"))
        break;
      sleep(1u);
    }
    while (!-[DYCaptureState allDataReceivedAck](self->_activeCaptureState, "allDataReceivedAck"));
  }
}

- (void)handleFrameBoundaryCommon
{
  unint64_t v3;
  unint64_t state;
  BOOL v5;
  unint64_t globalFrameCounter;

  if (self->_state)
  {
    v3 = -[DYCaptureDescriptor framesToCapture](self->_activeCaptureDescriptor, "framesToCapture");
    state = self->_state;
    if (state == 1)
    {
      globalFrameCounter = self->_globalFrameCounter;
      if (-[DYCaptureDescriptor triggerFrame](self->_activeCaptureDescriptor, "triggerFrame") <= globalFrameCounter
        && !-[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames")
        && -[DYGuestAppClient _canTriggerCaptureOnNextGraphicsCommand](self, "_canTriggerCaptureOnNextGraphicsCommand"))
      {
        -[DYGuestAppClient triggerArmedCapture](self, "triggerArmedCapture");
      }
    }
    else
    {
      v5 = state != 3 || v3 == 0;
      if (!v5 && -[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames") >= v3)
        -[DYGuestAppClient stopCapture](self, "stopCapture");
    }
  }
}

- (void)handleCaptureModeTransition:(BOOL)a3
{
  NSObject *globalSyncQueue;
  _QWORD v4[5];
  BOOL v5;

  globalSyncQueue = self->_globalSyncQueue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __48__DYGuestAppClient_handleCaptureModeTransition___block_invoke;
  v4[3] = &unk_250D62880;
  v5 = a3;
  v4[4] = self;
  dispatch_sync(globalSyncQueue, v4);
}

void __48__DYGuestAppClient_handleCaptureModeTransition___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  if (!*(_BYTE *)(a1 + 40))
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 4;
    v2 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_WORD *)v5 = 0;
      _os_signpost_emit_with_name_impl(&dword_23C6D4000, v2, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StopActiveCapture", ", v5, 2u);
    }
  }
  if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 160), "sessionId"))
  {
    v3 = (void *)MEMORY[0x2426231FC]();
    v4 = *(void **)(a1 + 32);
    if (*(_BYTE *)(a1 + 40))
      objc_msgSend(v4, "_turnOnCapturing");
    else
      objc_msgSend(v4, "_turnOffCapturing");
    objc_autoreleasePoolPop(v3);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 152) = 0;

    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 160) = 0;
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168) = 0;
  }
}

- (void)processMessage:(id)a3
{
  int v5;
  NSObject *stopCaptureQueue;
  int v7;
  _QWORD block[5];

  v5 = objc_msgSend(a3, "kind");
  switch(v5)
  {
    case 256:
      -[DYCaptureDescriptor setTriggerFrame:](self->_activeCaptureDescriptor, "setTriggerFrame:", self->_globalFrameCounter);
      goto LABEL_12;
    case 257:
    case 258:
    case 259:
    case 261:
    case 262:
      return;
    case 260:
      if ((self->_state | 2) == 3)
      {
        -[DYGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 1);
        stopCaptureQueue = self->_stopCaptureQueue;
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __35__DYGuestAppClient_processMessage___block_invoke;
        block[3] = &unk_250D62318;
        block[4] = self;
        dispatch_async(stopCaptureQueue, block);
      }
      goto LABEL_12;
    case 263:
      -[DYCaptureState setAllDataReceivedAck:](self->_activeCaptureState, "setAllDataReceivedAck:", 1);
      goto LABEL_12;
    case 264:
      -[DYGuestAppClient _handleActivateCaptureMessage:](self, "_handleActivateCaptureMessage:", a3);
LABEL_12:
      v7 = objc_msgSend((id)objc_msgSend(a3, "attributeForKey:", CFSTR("capture serial")), "unsignedIntValue");
      if (-[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId") == v7)
        return;
      goto LABEL_20;
    case 265:
      v7 = objc_msgSend((id)objc_msgSend(a3, "attributeForKey:", CFSTR("capture serial")), "unsignedIntValue");
      if (-[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId") != v7)
LABEL_20:
        dy_abort("received capture session message with invalid session serial: serial=%u expected=%u message=%s", v7, -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"), (const char *)objc_msgSend((id)objc_msgSend(a3, "description"), "UTF8String"));
      -[DYGuestAppClient invalidateCapture](self, "invalidateCapture");
      break;
    default:
      switch(v5)
      {
        case 1537:
          dispatch_semaphore_signal((dispatch_semaphore_t)GPUTools::Interpose::gInterposeSemaphore);
          break;
        case 1538:
        case 1541:
        case 1542:
        case 1543:
        case 1544:
          return;
        case 1539:
          -[DYGuestAppClient sendMessage:inReplyTo:](self, "sendMessage:inReplyTo:", +[DYTransportMessage messageWithKind:attributes:](DYTransportMessage, "messageWithKind:attributes:", 1539, objc_msgSend((id)objc_opt_class(), "timebaseDictionary")), a3);
          break;
        case 1540:
          -[DYGuestAppClient invalidateSavePointerMap:](self, "invalidateSavePointerMap:", a3);
          break;
        case 1545:
          -[DYGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 0);
          break;
        case 1546:
          -[DYGuestAppClient unlockGraphics](self, "unlockGraphics");
          break;
        default:
          if (v5 == 1795)
            GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_defaultFbufStream);
          break;
      }
      break;
  }
}

uint64_t __35__DYGuestAppClient_processMessage___block_invoke(uint64_t a1)
{
  _QWORD *v2;

  v2 = *(_QWORD **)(a1 + 32);
  if (v2[19] == 3)
    objc_msgSend(v2, "stopCapture");
  else
    objc_msgSend(v2, "invalidateCapture");
  return objc_msgSend(*(id *)(a1 + 32), "unlockGraphics");
}

- (void)sendMessage:(id)a3 inReplyTo:(id)a4
{
  -[DYTransport send:inReplyTo:error:](self->_transport, "send:inReplyTo:error:", a3, a4, 0);
}

- (void)sendMessage:(id)a3
{
  -[DYGuestAppClient sendMessage:inReplyTo:](self, "sendMessage:inReplyTo:", a3, 0);
}

- (void)sendCaptureData:(id)a3 name:(id)a4 inReplyTo:(id)a5
{
  id v9;
  void *v10;
  DYTransportMessage *v11;

  v9 = objc_alloc(MEMORY[0x24BDBCE70]);
  v10 = (void *)objc_msgSend(v9, "initWithObjectsAndKeys:", a4, CFSTR("buffer name"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId")), CFSTR("capture serial"), 0);
  v11 = -[DYTransportMessage initWithKind:attributes:payload:]([DYTransportMessage alloc], "initWithKind:attributes:payload:", 258, v10, a3);
  -[DYGuestAppClient sendMessage:inReplyTo:](self, "sendMessage:inReplyTo:", v11, a5);

}

- (void)sendTimebaseUpdate
{
  -[DYGuestAppClient sendMessage:inReplyTo:](self, "sendMessage:inReplyTo:", +[DYTransportMessage messageWithKind:attributes:](DYTransportMessage, "messageWithKind:attributes:", 1539, objc_msgSend((id)objc_opt_class(), "timebaseDictionary")), 0);
}

- (void)resetPointerToUrlAssociation:(const void *)a3
{
  -[NSMutableDictionary removeObjectForKey:](self->_ptrUrlInfoDict, "removeObjectForKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a3));
}

- (void)invalidateSavePointerMap:(id)a3
{
  id v5;
  NSObject *saveptrQueue;
  DYTransportMessage *v7;
  _QWORD block[5];

  v5 = a3;
  saveptrQueue = self->_saveptrQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__DYGuestAppClient_invalidateSavePointerMap___block_invoke;
  block[3] = &unk_250D62318;
  block[4] = self;
  dispatch_sync(saveptrQueue, block);
  if (a3)
  {
    v7 = -[DYTransportMessage initWithKind:attributes:payload:]([DYTransportMessage alloc], "initWithKind:attributes:payload:", 1540, 0, 0);
    -[DYGuestAppClient sendMessage:inReplyTo:](self, "sendMessage:inReplyTo:", v7, a3);

  }
}

uint64_t __45__DYGuestAppClient_invalidateSavePointerMap___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeAllObjects");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeAllObjects");
}

- (void)notifyAllCaptureDataSent
{
  DYCaptureDescriptor *activeCaptureDescriptor;
  NSObject *v4;
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[8];
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  activeCaptureDescriptor = self->_activeCaptureDescriptor;
  if (activeCaptureDescriptor && !-[DYCaptureDescriptor localFilePathURL](activeCaptureDescriptor, "localFilePathURL"))
  {
    if (self->_state != 4)
      __assert_rtn("-[DYGuestAppClient notifyAllCaptureDataSent]", ", 0, "_state == DYCaptureManagerStateFinishingCapture");
    v4 = g_signpostLog;
    if (os_signpost_enabled((os_log_t)g_signpostLog))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_23C6D4000, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CaptureSentAllData", ", buf, 2u);
    }
    v5 = -[DYGuestAppClient _buildLibraryLinkTimeVersionsDictionary](self, "_buildLibraryLinkTimeVersionsDictionary");
    v6 = -[DYGuestAppClient _buildQueueThreadLabelsDictionary](self, "_buildQueueThreadLabelsDictionary");
    v7 = (void *)MEMORY[0x24BDBCED8];
    v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames"));
    v9 = objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("captured frames counter"), v5, CFSTR("library link-time versions"), v6, CFSTR("queue/thread labels"), objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", _CFExecutableLinkedOnOrAfter() != 0), CFSTR("LinkedOnApexOrLater"), 0);
    -[DYGuestAppClient _appendToAllCaptureDataSentMessagePayload:](self, "_appendToAllCaptureDataSentMessagePayload:", v9);
    v11 = CFSTR("capture serial");
    v12[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
    -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:objectPayload:](DYTransportMessage, "messageWithKind:attributes:objectPayload:", 263, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1), v9));
  }
}

- (void)notifyUsedDataSentWithDictionary:(id)a3
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  uint8_t buf[8];
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (self->_state != 4)
    __assert_rtn("-[DYGuestAppClient notifyUsedDataSentWithDictionary:]", ", 0, "_state == DYCaptureManagerStateFinishingCapture");
  v5 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23C6D4000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CaptureSentUsedData", ", buf, 2u);
  }
  v6 = -[DYGuestAppClient _buildLibraryLinkTimeVersionsDictionary](self, "_buildLibraryLinkTimeVersionsDictionary");
  v7 = -[DYGuestAppClient _buildQueueThreadLabelsDictionary](self, "_buildQueueThreadLabelsDictionary");
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", -[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames")), CFSTR("captured frames counter"), v6, CFSTR("library link-time versions"), v7, CFSTR("queue/thread labels"), 0);
  objc_msgSend(v8, "addEntriesFromDictionary:", a3);
  -[DYGuestAppClient _appendToAllCaptureDataSentMessagePayload:](self, "_appendToAllCaptureDataSentMessagePayload:", v8);
  v10 = CFSTR("capture serial");
  v11[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
  -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:objectPayload:](DYTransportMessage, "messageWithKind:attributes:objectPayload:", 266, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1), v8));
}

- (void)notifyAllCaptureMetadataSent
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_state != 4)
    __assert_rtn("-[DYGuestAppClient notifyAllCaptureMetadataSent]", ", 0, "_state == DYCaptureManagerStateFinishingCapture");
  v3 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_23C6D4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "CaptureSentAllMetadata", ", v4, 2u);
  }
  -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:](DYTransportMessage, "messageWithKind:", 267));
}

- (void)lockGraphicsAndWaitForThreads:(BOOL)a3
{
  _BOOL4 v3;
  int *p_waitOnGraphicsSemaphoreAssertions;
  unsigned int v6;

  v3 = a3;
  dispatch_suspend((dispatch_object_t)self->_graphicsLockWaitQueue);
  p_waitOnGraphicsSemaphoreAssertions = &self->_waitOnGraphicsSemaphoreAssertions;
  do
    v6 = __ldaxr((unsigned int *)p_waitOnGraphicsSemaphoreAssertions);
  while (__stlxr(v6 + 1, (unsigned int *)p_waitOnGraphicsSemaphoreAssertions));
  if (v3)
    -[DYGuestAppClient _waitForGraphicsThreads](self, "_waitForGraphicsThreads");
}

- (void)unlockGraphics
{
  int *p_waitOnGraphicsSemaphoreAssertions;
  unsigned int v3;

  p_waitOnGraphicsSemaphoreAssertions = &self->_waitOnGraphicsSemaphoreAssertions;
  if (self->_waitOnGraphicsSemaphoreAssertions)
  {
    do
      v3 = __ldaxr((unsigned int *)p_waitOnGraphicsSemaphoreAssertions);
    while (__stlxr(v3 - 1, (unsigned int *)p_waitOnGraphicsSemaphoreAssertions));
    dispatch_resume((dispatch_object_t)self->_graphicsLockWaitQueue);
  }
}

- (void)incrementCapturedFramesCounter
{
  DYCaptureState *activeCaptureState;

  activeCaptureState = self->_activeCaptureState;
  objc_sync_enter(activeCaptureState);
  -[DYCaptureState setCapturedFrames:](self->_activeCaptureState, "setCapturedFrames:", -[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames") + 1);
  -[DYGuestAppClient _handleFrameEnd:](self, "_handleFrameEnd:", -[DYCaptureState capturedFrames](self->_activeCaptureState, "capturedFrames"));
  objc_sync_exit(activeCaptureState);
}

- (id)_buildQueueThreadLabelsDictionary
{
  void *v3;
  void *v4;
  _QWORD *i;
  void *v6;
  id v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  _QWORD *j;
  void *v12;
  id v13;
  _QWORD *v14;
  void *v15;

  -[DYGuestAppClient _populateQueueAndThreadLabelMaps](self, "_populateQueueAndThreadLabelMaps");
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("queues"));

  for (i = self->_activeCaptureState->_dispatchQueueLabelMap.__table_.__p1_.__value_.__next_; i; i = (_QWORD *)*i)
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", i[2]);
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = i + 3;
    if (*((char *)i + 47) < 0)
      v8 = (_QWORD *)*v8;
    v9 = (void *)objc_msgSend(v7, "initWithUTF8String:", v8);
    objc_msgSend(v4, "setObject:forKey:", v9, v6);

  }
  v10 = (void *)objc_opt_new();
  objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("threads"));

  for (j = self->_activeCaptureState->_threadLabelMap.__table_.__p1_.__value_.__next_; j; j = (_QWORD *)*j)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLongLong:", j[2]);
    v13 = objc_alloc(MEMORY[0x24BDD17C8]);
    v14 = j + 3;
    if (*((char *)j + 47) < 0)
      v14 = (_QWORD *)*v14;
    v15 = (void *)objc_msgSend(v13, "initWithUTF8String:", v14);
    objc_msgSend(v10, "setObject:forKey:", v15, v12);

  }
  return v3;
}

- (id)_buildLibraryLinkTimeVersionsDictionary
{
  void *v3;
  uint64_t i;

  v3 = (void *)objc_opt_new();
  for (i = 0; i != 5; ++i)
    -[DYGuestAppClient _appendLinkTimeLibrary:toVersionsDictionary:](self, "_appendLinkTimeLibrary:toVersionsDictionary:", -[DYGuestAppClient _buildLibraryLinkTimeVersionsDictionary]::commonLibraries[i], v3);
  -[DYGuestAppClient _appendLinkTimeLibrariesToVersionsDictionary:](self, "_appendLinkTimeLibrariesToVersionsDictionary:", v3);
  return v3;
}

- (void)_sendBufferUsageCounters
{
  id v3;
  NSObject *saveptrQueue;
  _QWORD block[6];
  const __CFString *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  if (!-[DYCaptureDescriptor localFilePathURL](self->_activeCaptureDescriptor, "localFilePathURL"))
  {
    v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
    saveptrQueue = self->_saveptrQueue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke;
    block[3] = &unk_250D622A0;
    block[4] = self;
    block[5] = v3;
    dispatch_sync(saveptrQueue, block);
    v6 = CFSTR("capture serial");
    v7[0] = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
    -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 262, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1), v3));
  }
}

uint64_t __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  _QWORD v4[5];

  v1 = *(_QWORD *)(a1 + 40);
  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke_2;
  v4[3] = &unk_250D638E0;
  v4[4] = v1;
  return objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", v4);
}

void __44__DYGuestAppClient__sendBufferUsageCounters__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v4 = *(void **)(a1 + 32);
  v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithUnsignedLong:", objc_msgSend(a3, "usage"));
  objc_msgSend(v4, "setObject:forKey:", v5, a2);

}

- (void)_resetBufferUsageCounters
{
  NSObject *saveptrQueue;
  _QWORD block[5];

  saveptrQueue = self->_saveptrQueue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__DYGuestAppClient__resetBufferUsageCounters__block_invoke;
  block[3] = &unk_250D62318;
  block[4] = self;
  dispatch_sync(saveptrQueue, block);
}

uint64_t __45__DYGuestAppClient__resetBufferUsageCounters__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "enumerateKeysAndObjectsWithOptions:usingBlock:", 1, &__block_literal_global_134);
}

uint64_t __45__DYGuestAppClient__resetBufferUsageCounters__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "resetUsage");
}

- (void)_appendLinkTimeLibrary:(const char *)a3 toVersionsDictionary:(id)a4
{
  uint64_t v6;
  void *v7;
  id v8;

  v6 = NSVersionOfLinkTimeLibrary(a3);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3, strlen(a3), 1, 0);
  v8 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDD16E0]), "initWithInt:", v6);
  objc_msgSend(a4, "setObject:forKey:", v8, v7);

}

- (void)_startCapture
{
  DYCaptureDescriptor *activeCaptureDescriptor;
  void *v4;

  if (!self->_state)
  {
    activeCaptureDescriptor = self->_activeCaptureDescriptor;
    if (activeCaptureDescriptor)
    {
      if (self->_activeCaptureState)
      {
        ++self->_lastSessionSerial;
        -[DYCaptureDescriptor setSessionId:](activeCaptureDescriptor, "setSessionId:");
        if (-[DYCaptureDescriptor triggerFrame](self->_activeCaptureDescriptor, "triggerFrame") == 0xFFFFFFFF)
          -[DYCaptureDescriptor setTriggerFrame:](self->_activeCaptureDescriptor, "setTriggerFrame:", self->_globalFrameCounter);
        self->_state = 2;
        if (-[DYCaptureDescriptor localFilePathURL](self->_activeCaptureDescriptor, "localFilePathURL"))
        {
          -[DYCaptureDescriptor setSuspendAfterCapture:](self->_activeCaptureDescriptor, "setSuspendAfterCapture:", 0);
          -[DYCaptureDescriptor setLockGraphicsAfterCapture:](self->_activeCaptureDescriptor, "setLockGraphicsAfterCapture:", 0);
          if (-[DYCaptureDescriptor armPreparedCapture](self->_activeCaptureDescriptor, "armPreparedCapture"))
            self->_state = 1;
          else
            -[DYGuestAppClient _turnOnCapturing](self, "_turnOnCapturing");
        }
        else
        {
          v4 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_lastSessionSerial), CFSTR("Serial"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0), CFSTR("TriggerFrame"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 0), CFSTR("FrameLimit"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), CFSTR("TriggerOnNextGLCommand"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), CFSTR("LockOpenGLAfterCompletion"));
          objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1), CFSTR("SuspendAfterCompletion"));
          -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:plistPayload:](DYTransportMessage, "messageWithKind:attributes:plistPayload:", 264, objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", self->_lastSessionSerial), CFSTR("capture serial")), v4));
          -[DYGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 1);
        }
      }
    }
  }
}

- (void)_armCapture
{
  DYCaptureDescriptor *activeCaptureDescriptor;

  if (!self->_state)
  {
    activeCaptureDescriptor = self->_activeCaptureDescriptor;
    if (activeCaptureDescriptor)
    {
      if (-[DYCaptureDescriptor sessionId](activeCaptureDescriptor, "sessionId"))
      {
        -[DYGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 1);
        if (!-[DYCaptureDescriptor triggerFrame](self->_activeCaptureDescriptor, "triggerFrame"))
          -[DYGuestAppClient _turnOnCapturing](self, "_turnOnCapturing");
        self->_state = 1;
        -[DYGuestAppClient unlockGraphics](self, "unlockGraphics");
      }
    }
  }
}

- (void)_turnOnCapturing
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[16];

  v3 = g_signpostLog;
  if (os_signpost_enabled((os_log_t)g_signpostLog))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_23C6D4000, v3, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StartCapture", ", buf, 2u);
  }
  -[DYGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 1);
  if (!self->_localActiveArchive)
  {
    v4 = DYGetInterposeVersion();
    v6 = v5;
    v7 = (void *)MEMORY[0x24BDBCE70];
    v8 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"));
    v9 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 18);
    v10 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[DYCaptureDescriptor isBoundaryLess](self->_activeCaptureDescriptor, "isBoundaryLess"));
    v11 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
    -[DYGuestAppClient sendMessage:](self, "sendMessage:", +[DYTransportMessage messageWithKind:attributes:](DYTransportMessage, "messageWithKind:attributes:", 257, objc_msgSend(v7, "dictionaryWithObjectsAndKeys:", v8, CFSTR("capture serial"), v9, CFSTR("version"), &unk_250D6E368, CFSTR("nativePointerSize"), v10, CFSTR("BoundaryLess"), v11, CFSTR("interpose-feature-version"),
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v6),
          CFSTR("interpose-patch-version"),
          0)));
  }
  -[DYGuestAppClient _handleTurnOnCapture](self, "_handleTurnOnCapture");
  -[DYGuestAppClient _resetBufferUsageCounters](self, "_resetBufferUsageCounters");
  GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_defaultFbufStream);
  GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_startup0Stream);
  GPUTools::FB::Stream::Open((GPUTools::FB::Stream *)self->_startup1Stream, (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-1-%@"), CFSTR("startup"), CFSTR("platform")));
  -[DYGuestAppClient setTraceMode:](self, "setTraceMode:", 5);
  GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_startup1Stream);
  GPUTools::FB::Stream::Close((GPUTools::FB::Stream *)self->_startup1Stream);
  GPUTools::FB::Stream::Close((GPUTools::FB::Stream *)self->_defaultFbufStream);
  GPUTools::FB::Stream::Open((GPUTools::FB::Stream *)self->_defaultFbufStream, CFSTR("capture"));
  -[DYGuestAppClient _handleCaptureStreamCreated](self, "_handleCaptureStreamCreated");
  self->_state = 3;
  -[DYGuestAppClient unlockGraphics](self, "unlockGraphics");
}

- (void)_handleActivateCaptureMessage:(id)a3
{
  unint64_t state;
  void *v5;
  int v6;

  state = self->_state;
  if (state)
  {
    if (state == 2)
    {
      v5 = (void *)objc_msgSend(a3, "plistPayload");
      v6 = objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("Serial")), "unsignedIntValue");
      if (-[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId") != v6)
        __assert_rtn("-[DYGuestAppClient _handleActivateCaptureMessage:]", ", 0, "_activeCaptureDescriptor.sessionId == serial");
      -[DYCaptureDescriptor setSuspendAfterCapture:](self->_activeCaptureDescriptor, "setSuspendAfterCapture:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("SuspendAfterCompletion")), "BOOLValue"));
      -[DYCaptureDescriptor setLockGraphicsAfterCapture:](self->_activeCaptureDescriptor, "setLockGraphicsAfterCapture:", objc_msgSend((id)objc_msgSend(v5, "objectForKey:", CFSTR("LockOpenGLAfterCompletion")), "BOOLValue"));
      if (-[DYCaptureDescriptor armPreparedCapture](self->_activeCaptureDescriptor, "armPreparedCapture"))
        self->_state = 1;
      else
        -[DYGuestAppClient _turnOnCapturing](self, "_turnOnCapturing");
      if (-[DYCaptureDescriptor unlockGraphicThreadsOnActivateCapture](self->_activeCaptureDescriptor, "unlockGraphicThreadsOnActivateCapture"))
      {
        -[DYGuestAppClient unlockGraphics](self, "unlockGraphics");
      }
    }
  }
  else
  {
    -[DYGuestAppClient _armCaptureWithTransportMessage:](self, "_armCaptureWithTransportMessage:", a3);
  }
}

- (void)_turnOffCapturing
{
  BOOL v3;

  -[DYGuestAppClient lockGraphicsAndWaitForThreads:](self, "lockGraphicsAndWaitForThreads:", 1);
  if (-[DYCaptureDescriptor sessionId](self->_activeCaptureDescriptor, "sessionId"))
  {
    GPUTools::FB::Stream::Flush((GPUTools::FB::Stream *)self->_defaultFbufStream);
    -[DYGuestAppClient _sendBufferUsageCounters](self, "_sendBufferUsageCounters");
    -[DYGuestAppClient _handleTurnOffCapture](self, "_handleTurnOffCapture");
    -[DYGuestAppClient notifyAllCaptureDataSent](self, "notifyAllCaptureDataSent");
    v3 = -[DYCaptureDescriptor suspendAfterCapture](self->_activeCaptureDescriptor, "suspendAfterCapture")
      || -[DYCaptureDescriptor lockGraphicsAfterCapture](self->_activeCaptureDescriptor, "lockGraphicsAfterCapture");
  }
  else
  {
    v3 = 0;
  }
  if (-[DYGuestAppClient traceMode](self, "traceMode") == 5)
  {
    -[DYGuestAppClient invalidateSavePointerMap:](self, "invalidateSavePointerMap:", 0);
    -[DYGuestAppClient setTraceMode:](self, "setTraceMode:", self->_previousTraceMode);
    GPUTools::FB::Stream::Close((GPUTools::FB::Stream *)self->_defaultFbufStream);
    GPUTools::FB::Stream::Open((GPUTools::FB::Stream *)self->_defaultFbufStream, CFSTR("live"));
  }
  if (!v3)
    -[DYGuestAppClient unlockGraphics](self, "unlockGraphics");
  self->_state = 5;
}

- (void)invalidateCapture
{
  if (self->_state == 3)
    -[DYGuestAppClient stopCapture](self, "stopCapture");
  if (-[DYCaptureState allDataReceivedAck](self->_activeCaptureState, "allDataReceivedAck"))
  {
    if (-[DYCaptureDescriptor suspendAfterCapture](self->_activeCaptureDescriptor, "suspendAfterCapture"))
    {
      task_suspend(*MEMORY[0x24BDAEC58]);
      if (!-[DYCaptureDescriptor lockGraphicsAfterCapture](self->_activeCaptureDescriptor, "lockGraphicsAfterCapture"))
        -[DYGuestAppClient unlockGraphics](self, "unlockGraphics");
    }
  }

  self->_activeCaptureDescriptor = 0;
  self->_activeCaptureState = 0;
  self->_state = 0;
}

- (void)_armCaptureWithTransportMessage:(id)a3
{
  dy_abort("_armCaptureWithTransportMessage: must be implemented in subclass", a2, a3);
}

- (BOOL)armCaptureWithDescriptor:(id)a3
{
  dy_abort("armCaptureWithDescriptor: must be implemented in subclass", a2, a3);
}

- (BOOL)triggerArmedCapture
{
  unint64_t state;

  state = self->_state;
  if (state == 1)
    -[DYGuestAppClient handleCaptureModeTransition:](self, "handleCaptureModeTransition:", 1);
  return state == 1;
}

- (BOOL)startCaptureWithDescriptor:(id)a3
{
  dy_abort("startCaptureWithDescriptor: must be implemented in subclass", a2, a3);
}

- (void)stopCapture
{
  if (self->_state == 3)
    -[DYGuestAppClient handleCaptureModeTransition:](self, "handleCaptureModeTransition:", 0);
}

- (void)_populateQueueAndThreadLabelMaps
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_appendToAllCaptureDataSentMessagePayload:(id)a3
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)_appendLinkTimeLibrariesToVersionsDictionary:(id)a3
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (BOOL)_canTriggerCaptureOnNextGraphicsCommand
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (void)_waitForGraphicsThreads
{
  -[DYGuestAppClient doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
}

- (void)setLiveDebugging:(BOOL)a3
{
  self->_liveDebugging = a3;
  self->_liveDebuggingCaptureData = (NSMutableDictionary *)objc_opt_new();
}

- (Stream)defaultFbufStream
{
  return self->_defaultFbufStream;
}

- (Stream)startup0Stream
{
  return self->_startup0Stream;
}

- (int)traceMode
{
  return self->_traceMode;
}

- (int)previousTraceMode
{
  return self->_previousTraceMode;
}

- (void)setPreviousTraceMode:(int)a3
{
  self->_previousTraceMode = a3;
}

- (unsigned)globalFrameCounter
{
  return self->_globalFrameCounter;
}

- (BOOL)boundaryLessCaptureMode
{
  return self->_boundaryLessCaptureMode;
}

- (void)setBoundaryLessCaptureMode:(BOOL)a3
{
  self->_boundaryLessCaptureMode = a3;
}

- (unsigned)overrideFlags
{
  return self->_overrideFlags;
}

- (void)setOverrideFlags:(unsigned int)a3
{
  self->_overrideFlags = a3;
}

- (unint64_t)xcodeOverrideFlags
{
  return self->_xcodeOverrideFlags;
}

- (void)setXcodeOverrideFlags:(unint64_t)a3
{
  self->_xcodeOverrideFlags = a3;
}

- (double)xcodeOverrideScaleTessFactor
{
  return self->_xcodeOverrideScaleTessFactor;
}

- (void)setXcodeOverrideScaleTessFactor:(double)a3
{
  self->_xcodeOverrideScaleTessFactor = a3;
}

- (NSMutableDictionary)saveptrPtrInfoDict
{
  return self->_saveptrPtrInfoDict;
}

- (NSMutableDictionary)ptrUrlInfoDict
{
  return self->_ptrUrlInfoDict;
}

- (OS_dispatch_queue)globalSyncQueue
{
  return self->_globalSyncQueue;
}

- (OS_dispatch_queue)saveptrQueue
{
  return self->_saveptrQueue;
}

- (int)waitOnGraphicsSemaphoreAssertions
{
  return self->_waitOnGraphicsSemaphoreAssertions;
}

- (OS_dispatch_semaphore)graphicsSemaphore
{
  return self->_graphicsSemaphore;
}

- (OS_dispatch_queue)graphicsLockWaitQueue
{
  return self->_graphicsLockWaitQueue;
}

- (unint64_t)state
{
  return self->_state;
}

- (DYCaptureDescriptor)activeCaptureDescriptor
{
  return self->_activeCaptureDescriptor;
}

- (DYCaptureState)activeCaptureState
{
  return self->_activeCaptureState;
}

- (BOOL)liveDebugging
{
  return self->_liveDebugging;
}

- (NSMutableDictionary)liveDebuggingCaptureData
{
  return self->_liveDebuggingCaptureData;
}

- (Stream)startup1Stream
{
  return self->_startup1Stream;
}

- (DYCaptureArchive)localActiveArchive
{
  return self->_localActiveArchive;
}

@end
