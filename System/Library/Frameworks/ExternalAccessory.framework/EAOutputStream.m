@implementation EAOutputStream

- (EAOutputStream)initWithAccessory:(id)a3 forSession:(id)a4 socket:(int)a5
{
  EAOutputStream *v8;
  EAOutputStream *v9;
  __CFSocket *v10;
  CFOptionFlags SocketFlags;
  CFSocketContext v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)EAOutputStream;
  v8 = -[EAOutputStream init](&v14, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_streamStatus = 0;
    v8->_delegate = v8;
    v8->_accessory = (EAAccessory *)a3;
    v9->_session = (EASession *)a4;
    v9->_sock = a5;
    v9->_useSocket = 1;
    v13.version = 0;
    memset(&v13.retain, 0, 24);
    v13.info = v9;
    v10 = CFSocketCreateWithNative(0, a5, 8uLL, (CFSocketCallBack)__outputSocketCallback, &v13);
    v9->_cfSocket = v10;
    SocketFlags = CFSocketGetSocketFlags(v10);
    CFSocketSetSocketFlags(v9->_cfSocket, SocketFlags & 0xFFFFFFFFFFFFFF7FLL);
    v9->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v9->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v9, sel__accessoryDidDisconnect_, CFSTR("EAAccessoryDidDisconnectNotification"), 0);
  }
  return v9;
}

- (EAOutputStream)initWithAccessoryWithoutSocket:(id)a3 forSession:(id)a4
{
  EAOutputStream *v6;
  EAOutputStream *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)EAOutputStream;
  v6 = -[EAOutputStream init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    v6->_streamStatus = 0;
    v6->_delegate = v6;
    v6->_accessory = (EAAccessory *)a3;
    v7->_session = (EASession *)a4;
    v7->_sock = -1;
    v7->_useSocket = 0;
    v7->_cfSocket = 0;
    v7->_socketRunLoopSource = 0;
    v7->_statusLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    v7->_runloopLock = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E0CB38E0]);
    objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "addObserver:selector:name:object:", v7, sel__accessoryDidDisconnect_, CFSTR("EAAccessoryDidDisconnectNotification"), 0);
  }
  return v7;
}

- (void)dealloc
{
  __CFSocket *cfSocket;
  objc_super v4;

  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:name:object:", self, CFSTR("EAAccessoryDidDisconnectNotification"), 0);
  -[EAOutputStream close](self, "close");

  cfSocket = self->_cfSocket;
  if (cfSocket)
  {
    CFSocketInvalidate(cfSocket);
    CFRelease(self->_cfSocket);
    self->_cfSocket = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)EAOutputStream;
  -[EAOutputStream dealloc](&v4, sel_dealloc);
}

- (void)open
{
  id v3;
  void *v4;

  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (!self->_streamStatus)
  {
    v3 = -[EAAccessory _protocolIDForProtocolString:](self->_accessory, "_protocolIDForProtocolString:", -[EASession protocolString](self->_session, "protocolString"));
    if (v3)
    {
      if (self->_useSocket)
      {
        v4 = v3;
        if (-[EAAccessory createdByCoreAccessories](self->_accessory, "createdByCoreAccessories"))
        {
          -[EAAccessoryManager openSessionFromAppToAccessory:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "openSessionFromAppToAccessory:", -[EASession EASessionUUID](self->_session, "EASessionUUID"));
        }
        else
        {
          -[EAAccessory _internalConnectionID](self->_accessory, "_internalConnectionID");
          objc_msgSend(v4, "unsignedIntValue");
          -[EASession _sessionID](self->_session, "_sessionID");
          IAPAppOpenSessionFromAppToAccessory();
        }
      }
      else
      {
        self->_hasSpaceAvailable = 1;
      }
      self->_streamStatus = 1;
      -[EAOutputStream openCompleted](self, "openCompleted");
    }
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

- (void)close
{
  unint64_t streamStatus;
  BOOL v4;
  uint64_t v5;
  __CFRunLoopSource *runLoopSource;
  __CFRunLoopSource *socketRunLoopSource;
  __CFRunLoop *runLoop;
  __CFSocket *cfSocket;

  streamStatus = self->_streamStatus;
  v4 = streamStatus > 5;
  v5 = (1 << streamStatus) & 0x25;
  if (!v4 && v5 != 0)
    self->_streamStatus = 6;
  self->_sock = -1;

  self->_accessory = 0;
  -[EASession _streamClosed](self->_session, "_streamClosed");

  self->_session = 0;
  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceInvalidate(runLoopSource);
    self->_runLoopSource = 0;
  }
  socketRunLoopSource = self->_socketRunLoopSource;
  if (socketRunLoopSource)
  {
    CFRunLoopSourceInvalidate(socketRunLoopSource);
    self->_socketRunLoopSource = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    CFRelease(runLoop);
    self->_runLoop = 0;
  }
  cfSocket = self->_cfSocket;
  if (cfSocket)
  {
    CFSocketInvalidate(cfSocket);
    CFRelease(self->_cfSocket);
    self->_cfSocket = 0;
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
  __CFRunLoopSource *v10;
  CFRunLoopSourceContext v11;

  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  if (!self->_runLoop)
  {
    v8 = (__CFRunLoop *)objc_msgSend(a3, "getCFRunLoop");
    self->_runLoop = v8;
    CFRetain(v8);
  }
  if (!self->_runLoopSource)
  {
    v11.version = 0;
    v11.info = self;
    v11.retain = (const void *(__cdecl *)(const void *))MEMORY[0x1E0C98BD0];
    v11.release = (void (__cdecl *)(const void *))MEMORY[0x1E0C98BC0];
    memset(&v11.copyDescription, 0, 40);
    v11.perform = (void (__cdecl *)(void *))__streamEventTrigger;
    runLoopSource = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &v11);
    self->_runLoopSource = runLoopSource;
    if (!runLoopSource)
    {
      objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("EAOutputStream.m"), 238, CFSTR("should be able to make run loop source"));
      runLoopSource = self->_runLoopSource;
    }
    CFRunLoopAddSource(self->_runLoop, runLoopSource, (CFRunLoopMode)a4);
    CFRelease(self->_runLoopSource);
  }
  if (self->_useSocket && !self->_socketRunLoopSource)
  {
    v10 = CFSocketCreateRunLoopSource(0, self->_cfSocket, 0);
    self->_socketRunLoopSource = v10;
    CFRunLoopAddSource(self->_runLoop, v10, (CFRunLoopMode)a4);
    CFRelease(self->_socketRunLoopSource);
  }
  -[NSRecursiveLock unlock](self->_runloopLock, "unlock");
}

- (void)removeFromRunLoop:(id)a3 forMode:(id)a4
{
  __CFRunLoopSource *socketRunLoopSource;
  __CFRunLoop *runLoop;

  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  if (self->_runLoopSource)
  {
    CFRunLoopRemoveSource((CFRunLoopRef)objc_msgSend(a3, "getCFRunLoop"), self->_runLoopSource, (CFRunLoopMode)a4);
    self->_runLoopSource = 0;
  }
  socketRunLoopSource = self->_socketRunLoopSource;
  if (socketRunLoopSource)
  {
    CFRunLoopSourceInvalidate(socketRunLoopSource);
    self->_socketRunLoopSource = 0;
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

  -[EAOutputStream _performAtEndOfStreamValidation](self, "_performAtEndOfStreamValidation");
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  streamStatus = self->_streamStatus;
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
  return streamStatus;
}

- (id)streamError
{
  return 0;
}

- (int64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  int v7;
  int *v8;
  void *v9;

  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (-[EAOutputStream hasSpaceAvailable](self, "hasSpaceAvailable"))
  {
    self->_hasSpaceAvailable = 0;
    self->_hasSpaceAvailableEventSent = 0;
    if (self->_useSocket)
    {
      v7 = send(self->_sock, a3, a4, 0);
      if (v7 == -1)
      {
        v8 = __error();
        NSLog(CFSTR("[#ExternalAccessory] ERROR - %s:%s - %d failed to write %lu bytes (wrote %d) with error %d"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAOutputStream.m", "-[EAOutputStream write:maxLength:]", 306, a4, 0xFFFFFFFFLL, *v8);
        if (*__error() == 32)
        {
          if (+[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled"))
            NSLog(CFSTR("[#ExternalAccessory] tx data: failed because of broken pipe, assume success\n"));
          v7 = a4;
        }
        else
        {
          v7 = -1;
        }
      }
      CFSocketEnableCallBacks(self->_cfSocket, 8uLL);
    }
    else
    {
      self->_hasSpaceAvailable = 0;
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytes:length:", a3, a4);
      -[EAAccessoryManager sendOutgoingEAData:forSessionUUID:](+[EAAccessoryManager sharedAccessoryManager](EAAccessoryManager, "sharedAccessoryManager"), "sendOutgoingEAData:forSessionUUID:", v9, -[EASession EASessionUUID](self->_session, "EASessionUUID"));
      v7 = objc_msgSend(v9, "length");

      self->_hasSpaceAvailable = 1;
      -[EAOutputStream _scheduleCallback](self, "_scheduleCallback");
    }
    +[EAAccessoryManager isLoggingEnabled](EAAccessoryManager, "isLoggingEnabled");
  }
  else
  {
    NSLog(CFSTR("[#ExternalAccessory] ERROR - %s:%s - %d failed to write because stream does not have space available"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAOutputStream.m", "-[EAOutputStream write:maxLength:]", 332);
    v7 = 0;
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
  return v7;
}

- (BOOL)hasSpaceAvailable
{
  BOOL v3;

  -[NSRecursiveLock lock](self->_statusLock, "lock");
  v3 = self->_streamStatus == 2 && self->_hasSpaceAvailable;
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
  return v3;
}

- (void)openCompleted
{
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus == 1)
  {
    self->_streamStatus = 2;
    -[EAOutputStream _scheduleCallback](self, "_scheduleCallback");
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

- (void)endStream
{
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus - 2 <= 2)
  {
    self->_streamStatus = 5;
    -[EAOutputStream _scheduleCallback](self, "_scheduleCallback");
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

- (void)_performAtEndOfStreamValidation
{
  -[NSRecursiveLock lock](self->_statusLock, "lock");
  if (self->_streamStatus == 2 && !-[EAAccessory isConnected](self->_accessory, "isConnected"))
  {
    self->_streamStatus = 5;
    -[EAOutputStream _scheduleCallback](self, "_scheduleCallback");
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");
}

- (void)_streamWriteable
{
  self->_hasSpaceAvailable = 1;
  -[EAOutputStream _streamEventTrigger](self, "_streamEventTrigger");
}

- (void)_streamEventTrigger
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
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
  if (!self->_hasSpaceAvailableEventSent && self->_hasSpaceAvailable)
  {
    self->_hasSpaceAvailableEventSent = 1;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(self->_delegate, "stream:handleEvent:", self, 4);
  }
  -[NSRecursiveLock unlock](self->_statusLock, "unlock");

}

- (void)_scheduleCallback
{
  __CFRunLoopSource *runLoopSource;
  __CFRunLoop *runLoop;

  -[NSRecursiveLock lock](self->_runloopLock, "lock");
  runLoopSource = self->_runLoopSource;
  if (runLoopSource)
  {
    CFRunLoopSourceSignal(runLoopSource);
    runLoop = self->_runLoop;
    if (runLoop)
      CFRunLoopWakeUp(runLoop);
    else
      NSLog(CFSTR("[#ExternalAccessory] ERROR - %s:%s - %d can't schedule callback, runloop is NULL"), "/Library/Caches/com.apple.xbs/Sources/ExternalAccessory/EAOutputStream.m", "-[EAOutputStream _scheduleCallback]", 438);
  }
  -[NSRecursiveLock unlock](self->_runloopLock, "unlock");
}

@end
