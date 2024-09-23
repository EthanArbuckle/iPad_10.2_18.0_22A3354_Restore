@implementation EAInputStream

- (EAInputStream)initWithAccessory:(id)a3 forSession:(id)a4 socket:(int)a5
{
  EAInputStream *v8;
  EAInputStream *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)EAInputStream;
  v8 = -[EAInputStream init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_streamStatus = 0;
    v8->_delegate = v8;
    v8->_accessory = (EAAccessory *)a3;
    v9->_session = (EASession *)a4;
    v9->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v9->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v9->_inputFromAccBuffer = 0;
    v9->_useSocket = 1;
    v9->_sockListenSource = 0;
    v9->_sock = a5;
    v9->_zeroBytesReadCount = 0;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v9, sel__accessoryDidDisconnect_, CFSTR("EAAccessoryDidDisconnectNotification"), 0);
  }
  return v9;
}

- (EAInputStream)initWithAccessoryWithoutSocket:(id)a3 forSession:(id)a4
{
  EAInputStream *v6;
  EAInputStream *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EAInputStream;
  v6 = -[EAInputStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_streamStatus = 0;
    v6->_delegate = v6;
    v6->_accessory = (EAAccessory *)a3;
    v7->_session = (EASession *)a4;
    v7->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v7->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v7->_inputFromAccBuffer = 0;
    v7->_useSocket = 0;
    v7->_sockListenSource = 0;
    v7->_sock = -1;
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v7, sel__accessoryDidDisconnect_, CFSTR("EAAccessoryDidDisconnectNotification"), 0);
  }
  return v7;
}

- (void)dealloc
{
  char *inputFromAccBuffer;
  NSObject *inputFromAccQueue;
  objc_super v5;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("EAAccessoryDidDisconnectNotification"), 0);
  -[EAInputStream close](self, "close");

  inputFromAccBuffer = self->_inputFromAccBuffer;
  if (inputFromAccBuffer)
    free(inputFromAccBuffer);
  self->_inputFromAccBuffer = 0;
  if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
    NSLog(CFSTR("[#ExternalAccessory] %s:%s-%d releasing _inputFromAccBuffer and _inputFromAccQueue"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAInputStream.m", "-[EAInputStream dealloc]", 113);
  inputFromAccQueue = self->_inputFromAccQueue;
  if (inputFromAccQueue)
    dispatch_release(inputFromAccQueue);
  v5.receiver = self;
  v5.super_class = (Class)EAInputStream;
  -[EAInputStream dealloc](&v5, sel_dealloc);
}

- (void)open
{
  id v3;
  void *v4;
  OS_dispatch_queue *v5;
  NSObject *sockListenSource;
  _QWORD handler[5];
  char __str[256];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (!self->_streamStatus)
  {
    self->_inputFromAccData = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", 0x20000);
    self->_inputFromAccCondition = (NSCondition *)objc_alloc_init(MEMORY[0x1E0CB3530]);
    v3 = -[EAAccessory _protocolIDForProtocolString:](self->_accessory, "_protocolIDForProtocolString:", -[EASession protocolString](self->_session, "protocolString"));
    if (v3)
    {
      v4 = v3;
      if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
        NSLog(CFSTR("[#ExternalAccessory] success opening read stream for connectionID=%u and sessionID=%u"), -[EAAccessory _internalConnectionID](self->_accessory, "_internalConnectionID"), -[EASession _sessionID](self->_session, "_sessionID"));
      snprintf(__str, 0x100uLL, "com.apple.%d.%d.%d.listenQueue", -[EAAccessory connectionID](self->_accessory, "connectionID"), objc_msgSend(v4, "unsignedIntValue"), -[EASession _sessionID](self->_session, "_sessionID"));
      v5 = (OS_dispatch_queue *)dispatch_queue_create(__str, 0);
      self->_inputFromAccQueue = v5;
      if (self->_useSocket)
      {
        self->_sockListenSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DB8], self->_sock, 0, (dispatch_queue_t)v5);
        self->_inputFromAccBuffer = (char *)malloc_type_malloc(0x2000uLL, 0x8185FFF3uLL);
        sockListenSource = self->_sockListenSource;
        handler[0] = MEMORY[0x1E0C809B0];
        handler[1] = 3221225472;
        handler[2] = __21__EAInputStream_open__block_invoke;
        handler[3] = &unk_1E6B077D8;
        handler[4] = self;
        dispatch_source_set_event_handler(sockListenSource, handler);
        dispatch_resume((dispatch_object_t)self->_sockListenSource);
        if (-[EAAccessory createdByCoreAccessories](self->_accessory, "createdByCoreAccessories"))
        {
          -[EAAccessoryManager openSessionFromAccessoryToApp:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "openSessionFromAccessoryToApp:", -[EASession EASessionUUID](self->_session, "EASessionUUID"));
        }
        else
        {
          -[EAAccessory _internalConnectionID](self->_accessory, "_internalConnectionID");
          objc_msgSend(v4, "unsignedIntValue");
          -[EASession _sessionID](self->_session, "_sessionID");
          IAPAppOpenSessionFromAccessoryToApp();
        }
      }
      self->_streamStatus = 1;
      -[EAInputStream openCompleted](self, "openCompleted");
    }
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

uint64_t __21__EAInputStream_open__block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "lock");
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_DWORD *)(v2 + 160) == -1)
    return objc_msgSend(*(id *)(v2 + 176), "unlock");
  while (1)
  {
    if ((unint64_t)(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "length") - 122881) > 0xFFFFFFFFFFFDFFFELL)
    {
      v3 = 0x2000;
    }
    else
    {
      v3 = 0x20000 - objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "length");
      if (v3 < 1)
        goto LABEL_13;
    }
    v4 = recv(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 160), *(void **)(*(_QWORD *)(a1 + 32) + 216), v3, 0);
    v5 = v4;
    v6 = *(_QWORD *)(a1 + 32);
    if (v4)
    {
      *(_DWORD *)(v6 + 256) = 0;
      if (v4 == -1)
        goto LABEL_13;
      v7 = *(_QWORD *)(a1 + 32);
      goto LABEL_10;
    }
    ++*(_DWORD *)(v6 + 256);
    v7 = *(_QWORD *)(a1 + 32);
    if (*(int *)(v7 + 256) >= 16)
      break;
LABEL_10:
    objc_msgSend(*(id *)(v7 + 168), "appendBytes:length:", *(_QWORD *)(v7 + 216), v4);
    if (v5 != 0x2000)
      goto LABEL_13;
  }
  NSLog(CFSTR("[#ExternalAccessory] Client read %d bytes from file descriptor, for [_session _sessionID] %d 0x%X, zeroBytesReadCount %d, cancel sockListenSource"), 0, objc_msgSend(*(id *)(v7 + 152), "_sessionID"), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 152), "_sessionID"), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 256));
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 208));
LABEL_13:
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 225) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_scheduleCallback");
  v8 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "length");
  v2 = *(_QWORD *)(a1 + 32);
  if (v8 >= 0x20000)
  {
    objc_msgSend(*(id *)(v2 + 176), "wait");
    v2 = *(_QWORD *)(a1 + 32);
  }
  return objc_msgSend(*(id *)(v2 + 176), "unlock");
}

- (void)close
{
  unint64_t streamStatus;
  BOOL v4;
  uint64_t v5;
  __CFRunLoopSource *runLoopSource;
  __CFRunLoop *runLoop;

  -[NSRecursiveLock lock](self->_statusLock, "lock");
  streamStatus = self->_streamStatus;
  v4 = streamStatus > 5;
  v5 = (1 << streamStatus) & 0x25;
  if (!v4 && v5 != 0)
    self->_streamStatus = 6;
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
  self->_sock = -1;
  -[NSCondition lock](self->_inputFromAccCondition, "lock");
  if (self->_sockListenSource)
  {
    if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
      NSLog(CFSTR("[#ExternalAccessory] canceling _sockListenSource"));
    dispatch_source_cancel((dispatch_source_t)self->_sockListenSource);
    dispatch_release((dispatch_object_t)self->_sockListenSource);
    self->_sockListenSource = 0;
    if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
      NSLog(CFSTR("[#ExternalAccessory] released _sockListenSource"));
  }

  self->_inputFromAccData = 0;
  -[NSCondition signal](self->_inputFromAccCondition, "signal");
  -[NSCondition unlock](self->_inputFromAccCondition, "unlock");

  self->_accessory = 0;
  -[EAAccessoryManager closeInputStreamForEASessionUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "closeInputStreamForEASessionUUID:", -[EASession EASessionUUID](self->_session, "EASessionUUID"));
  -[EASession _streamClosed](self->_session, "_streamClosed");

  self->_session = 0;
  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    self->_runLoopSource = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    CFRelease(runLoop);
    self->_runLoop = 0;
  }
  -[NSRecursiveLock unlock](self->_runloopLock, "unlock");
}

- (id)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  void *v3;

  if (a3)
    v3 = a3;
  else
    v3 = self;
  self->_delegate = v3;
}

- (id)propertyForKey:(id)a3
{
  return 0;
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return 0;
}

- (void)scheduleInRunLoop:(id)a3 forMode:(id)a4
{
  __CFRunLoop *v8;
  __CFRunLoopSource *runLoopSource;
  CFRunLoopSourceContext v10;

  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  if (!self->_runLoopSource)
  {
    v8 = (__CFRunLoop *)objc_msgSend(a3, "getCFRunLoop");
    self->_runLoop = v8;
    CFRetain(v8);
    v10.version = 0;
    memset(&v10.retain, 0, 56);
    v10.info = self;
    v10.perform = (void (__cdecl *)(void *))__streamEventTrigger_0;
    runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v10);
    self->_runLoopSource = runLoopSource;
    if (!runLoopSource)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EAInputStream.m"), 316, CFSTR("should be able to make run loop source"));
      runLoopSource = self->_runLoopSource;
    }
    CFRunLoopAddSource(self->_runLoop, runLoopSource, (CFRunLoopMode)a4);
    CFRelease(self->_runLoopSource);
  }
  -[NSRecursiveLock unlock](self->_runloopLock, "unlock");
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  __CFRunLoop *runLoop;

  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  if (self->_runLoopSource)
  {
    CFRunLoopRemoveSource((CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), self->_runLoopSource, (CFRunLoopMode)a4);
    self->_runLoopSource = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    CFRelease(runLoop);
    self->_runLoop = 0;
  }
  -[NSRecursiveLock unlock](self->_runloopLock, "unlock");
}

- (unint64_t)streamStatus
{
  unint64_t streamStatus;

  -[EAInputStream _performAtEndOfStreamValidation](self, "_performAtEndOfStreamValidation");
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  streamStatus = self->_streamStatus;
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
  return streamStatus;
}

- (id)streamError
{
  return 0;
}

- (int64_t)read:(char *)a3 maxLength:(unint64_t)a4
{
  NSUInteger v7;
  unint64_t v8;

  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus == 2)
  {
    -[NSCondition lock](self->_inputFromAccCondition, "lock");
    v7 = -[NSMutableData length](self->_inputFromAccData, "length");
    if (v7)
    {
      v8 = v7;
      if (v7 < a4)
        a4 = v7;
      -[NSMutableData getBytes:length:](self->_inputFromAccData, "getBytes:length:", a3, a4);
      -[NSMutableData replaceBytesInRange:withBytes:length:](self->_inputFromAccData, "replaceBytesInRange:withBytes:length:", 0, a4, 0, 0);
      if (v8 >= 0x20000 && a4 != 0)
        -[NSCondition signal](self->_inputFromAccCondition, "signal");
    }
    else
    {
      a4 = 0;
    }
    -[NSCondition unlock](self->_inputFromAccCondition, "unlock");
  }
  else
  {
    a4 = 0;
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
  return a4;
}

- (BOOL)getBuffer:(char *)a3 length:(unint64_t *)a4
{
  return 0;
}

- (BOOL)hasBytesAvailable
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus == 2)
  {
    -[NSCondition lock](self->_inputFromAccCondition, "lock");
    v3 = -[NSMutableData length](self->_inputFromAccData, "length") != 0;
    -[NSCondition unlock](self->_inputFromAccCondition, "unlock");
  }
  else
  {
    v3 = 0;
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
  return v3;
}

- (void)processIncomingAccessoryData:(id)a3
{
  NSObject *inputFromAccQueue;
  _QWORD block[6];

  if (self->_streamStatus - 2 > 2)
  {
    NSLog(CFSTR("[#ExternalAccessory] Getting incoming data, but stream status %lu isn't valid...not saving"), a2, a3, self->_streamStatus);
  }
  else
  {
    inputFromAccQueue = self->_inputFromAccQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __46__EAInputStream_processIncomingAccessoryData___block_invoke;
    block[3] = &unk_1E6B07870;
    block[4] = self;
    block[5] = a3;
    dispatch_async(inputFromAccQueue, block);
  }
}

uint64_t __46__EAInputStream_processIncomingAccessoryData___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "lock");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "appendData:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 225) = 1;
  objc_msgSend(*(id *)(a1 + 32), "_scheduleCallback");
  if ((unint64_t)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "length") >= 0x20000)
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "wait");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 176), "unlock");
}

- (void)openCompleted
{
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus == 1)
  {
    self->_streamStatus = 2;
    -[EAInputStream _scheduleCallback](self, "_scheduleCallback");
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

- (void)endStream
{
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus - 2 <= 2)
  {
    self->_streamStatus = 5;
    -[EAInputStream _scheduleCallback](self, "_scheduleCallback");
    -[EAAccessoryManager closeInputStreamForEASessionUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "closeInputStreamForEASessionUUID:", -[EASession EASessionUUID](self->_session, "EASessionUUID"));
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

- (void)_performAtEndOfStreamValidation
{
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus == 2 && !-[EAAccessory isConnected](self->_accessory, "isConnected"))
  {
    self->_streamStatus = 5;
    -[EAInputStream _scheduleCallback](self, "_scheduleCallback");
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

- (void)_streamEventTrigger
{
  EAInputStream *v3;
  NSCondition *v4;
  NSRecursiveLock *v5;
  _BOOL4 hasNewBytesAvailable;
  id v7;

  v3 = self;
  v7 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v4 = self->_inputFromAccCondition;
  v5 = self->_statusLock;
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (!self->_isOpenCompletedEventSent && self->_streamStatus == 2)
  {
    self->_isOpenCompletedEventSent = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "stream:handleEvent:", self, 1);
  }
  if (!self->_isAtEndEventSent && self->_streamStatus == 5)
  {
    self->_isAtEndEventSent = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "stream:handleEvent:", self, 16);
  }
  -[NSCondition lock](self->_inputFromAccCondition, "lock");
  if (-[NSMutableData length](self->_inputFromAccData, "length"))
  {
    hasNewBytesAvailable = self->_hasNewBytesAvailable;
    self->_hasNewBytesAvailable = 0;
    -[NSCondition unlock](self->_inputFromAccCondition, "unlock");
    if (hasNewBytesAvailable && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "stream:handleEvent:", self, 2);
  }
  else
  {
    self->_hasNewBytesAvailable = 0;
    -[NSCondition unlock](self->_inputFromAccCondition, "unlock");
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");

}

- (void)_scheduleCallback
{
  NSRecursiveLock *v3;
  __CFRunLoopSource *runLoopSource;
  __CFRunLoop *runLoop;

  v3 = self->_runloopLock;
  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceSignal(runLoopSource);
    runLoop = self->_runLoop;
    if (runLoop)
      CFRunLoopWakeUp(runLoop);
    else
      NSLog(CFSTR("[#ExternalAccessory] ERROR - %s:%s - %d can't schedule callback, runloop is NULL"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAInputStream.m", "-[EAInputStream _scheduleCallback]", 529);
  }
  -[NSRecursiveLock unlock](self->_runloopLock, "unlock");

}

- (int)zeroBytesReadCount
{
  return self->_zeroBytesReadCount;
}

- (void)setZeroBytesReadCount:(int)a3
{
  self->_zeroBytesReadCount = a3;
}

@end
