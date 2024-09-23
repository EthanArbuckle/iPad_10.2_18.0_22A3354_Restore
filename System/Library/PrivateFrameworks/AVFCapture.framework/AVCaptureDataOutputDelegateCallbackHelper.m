@implementation AVCaptureDataOutputDelegateCallbackHelper

- (id)activeDelegate
{
  id v3;

  MEMORY[0x1A1AF1298](self->_stateMutex, a2);
  v3 = -[AVCaptureDataOutputDelegateCallbackHelper _activeDelegate](self, "_activeDelegate");
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  return v3;
}

- (id)_activeDelegate
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[AVWeakReferencingDelegateStorage delegate](self->_delegateOverrideStorage, "delegate");
  v4 = 40;
  if (!v3)
    v4 = 32;
  return (id)objc_msgSend(*(id *)((char *)&self->super.isa + v4), "delegate");
}

- (id)delegateOverride
{
  void *v3;

  MEMORY[0x1A1AF1298](self->_stateMutex, a2);
  v3 = (void *)-[AVWeakReferencingDelegateStorage delegate](self->_delegateOverrideStorage, "delegate");
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  return v3;
}

- (AVCaptureDataOutputDelegateCallbackHelper)initWithQueueName:(id)a3 canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd:(BOOL)a4
{
  AVCaptureDataOutputDelegateCallbackHelper *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AVCaptureDataOutputDelegateCallbackHelper;
  v6 = -[AVCaptureDataOutputDelegateCallbackHelper init](&v8, sel_init);
  if (v6)
  {
    v6->_defaultCallbackQueueName = (NSString *)a3;
    v6->_canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd = a4;
    v6->_stateMutex = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v6->_delegateStorage = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E0CF2D58]);
  }
  return v6;
}

- (void)updateRemoteQueueReceiver:(remoteQueueReceiverOpaque *)a3 handler:(id)a4
{
  remoteQueueReceiverOpaque *remoteQueueReceiver;
  id remoteQueueHandler;
  void *v9;

  MEMORY[0x1A1AF1298](self->_stateMutex);
  if (!self->_localQueue)
  {
    if (self->_remoteQueueReceiver)
    {
      FigRemoteQueueReceiverUnsetHandler();
      remoteQueueReceiver = self->_remoteQueueReceiver;
    }
    else
    {
      remoteQueueReceiver = 0;
    }
    self->_remoteQueueReceiver = a3;
    if (a3)
      CFRetain(a3);
    if (remoteQueueReceiver)
      CFRelease(remoteQueueReceiver);
    remoteQueueHandler = self->_remoteQueueHandler;
    self->_remoteQueueHandler = a4;

    if (self->_remoteQueueReceiver && self->_remoteQueueHandler)
    {
      -[AVCaptureDataOutputDelegateCallbackHelper _activeCallbackQueue](self, "_activeCallbackQueue");
      FigRemoteQueueReceiverSetHandler();
    }
    JUMPOUT(0x1A1AF12A4);
  }
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  if (a3)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    objc_exception_throw(v9);
  }
}

- (id)_activeCallbackQueue
{
  AVWeakReferencingDelegateStorage *delegateOverrideStorage;
  id result;
  NSString *defaultCallbackQueueName;
  const char *v6;

  if (AVCaptureIsRunningInMediaserverd()
    && !self->_canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd)
  {
    return 0;
  }
  delegateOverrideStorage = self->_delegateOverrideStorage;
  if (!delegateOverrideStorage)
    delegateOverrideStorage = self->_delegateStorage;
  result = (id)-[AVWeakReferencingDelegateStorage delegateQueue](delegateOverrideStorage, "delegateQueue");
  if (!result)
  {
    result = self->_defaultCallbackQueue;
    if (!result)
    {
      defaultCallbackQueueName = self->_defaultCallbackQueueName;
      if (defaultCallbackQueueName)
        v6 = -[NSString UTF8String](defaultCallbackQueueName, "UTF8String");
      else
        v6 = "com.apple.avfoundation.dataoutput.delegate_callback_queue";
      result = dispatch_queue_create(v6, 0);
      self->_defaultCallbackQueue = (OS_dispatch_queue *)result;
    }
  }
  return result;
}

- (BOOL)setClientDelegate:(id)a3 clientCallbackQueue:(id)a4 exceptionReason:(id *)a5
{
  id v7;
  _BOOL4 v8;

  if (a3)
  {
    v7 = a4;
    v8 = -[AVCaptureDataOutputDelegateCallbackHelper _validateCallbackQueue:exceptionReason:](self, "_validateCallbackQueue:exceptionReason:", a4, a5);
    if (!v8)
      return v8;
  }
  else
  {
    v7 = 0;
  }
  MEMORY[0x1A1AF1298](self->_stateMutex);
  -[AVWeakReferencingDelegateStorage setDelegate:queue:](self->_delegateStorage, "setDelegate:queue:", a3, v7);
  if (!self->_delegateOverrideStorage && self->_remoteQueueReceiver)
  {
    -[AVCaptureDataOutputDelegateCallbackHelper _activeCallbackQueue](self, "_activeCallbackQueue");
    FigRemoteQueueReceiverSetHandler();
  }
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  LOBYTE(v8) = 1;
  return v8;
}

- (BOOL)_validateCallbackQueue:(id)a3 exceptionReason:(id *)a4
{
  BOOL result;
  __CFString *v8;

  if (AVCaptureIsRunningInMediaserverd()
    && !self->_canSetClientDelegateCallbackQueueWhenRunningInsideMediaserverd)
  {
    if (!a3)
      return 1;
    if (a4)
    {
      v8 = CFSTR("A callback queue can not be used in conjunction with a local queue");
      goto LABEL_10;
    }
  }
  else
  {
    if (a3)
      return 1;
    if (a4)
    {
      v8 = CFSTR("NULL queue passed");
LABEL_10:
      result = 0;
      *a4 = v8;
      return result;
    }
  }
  return 0;
}

+ (void)initialize
{
  objc_opt_class();
}

- (void)dealloc
{
  objc_super v3;

  if (self->_remoteQueueReceiver)
  {
    FigRemoteQueueReceiverUnsetHandler();
    CFRelease(self->_remoteQueueReceiver);
  }

  if (self->_localQueue)
  {
    FigLocalQueueUnsetReceiverHandler();
    CFRelease(self->_localQueue);
  }

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)AVCaptureDataOutputDelegateCallbackHelper;
  -[AVCaptureDataOutputDelegateCallbackHelper dealloc](&v3, sel_dealloc);
}

- (OS_dispatch_queue)activeCallbackQueue
{
  OS_dispatch_queue *v3;

  MEMORY[0x1A1AF1298](self->_stateMutex, a2);
  v3 = -[AVCaptureDataOutputDelegateCallbackHelper _activeCallbackQueue](self, "_activeCallbackQueue");
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  return v3;
}

- (id)clientDelegate
{
  void *v3;

  MEMORY[0x1A1AF1298](self->_stateMutex, a2);
  v3 = (void *)-[AVWeakReferencingDelegateStorage delegate](self->_delegateStorage, "delegate");
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  return v3;
}

- (OS_dispatch_queue)clientCallbackQueue
{
  OS_dispatch_queue *v3;

  MEMORY[0x1A1AF1298](self->_stateMutex, a2);
  v3 = (OS_dispatch_queue *)-[AVWeakReferencingDelegateStorage delegateQueue](self->_delegateStorage, "delegateQueue");
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  return v3;
}

- (BOOL)setDelegateOverride:(id)a3 delegateOverrideCallbackQueue:(id)a4 exceptionReason:(id *)a5
{
  _BOOL4 v8;
  OpaqueFigSimpleMutex **p_stateMutex;
  AVWeakReferencingDelegateStorage *delegateOverrideStorage;

  if (a3)
  {
    v8 = -[AVCaptureDataOutputDelegateCallbackHelper _validateCallbackQueue:exceptionReason:](self, "_validateCallbackQueue:exceptionReason:", a4, a5);
    if (!v8)
      return v8;
    p_stateMutex = &self->_stateMutex;
    MEMORY[0x1A1AF1298](self->_stateMutex);
    delegateOverrideStorage = self->_delegateOverrideStorage;
    if (!delegateOverrideStorage)
    {
      delegateOverrideStorage = (AVWeakReferencingDelegateStorage *)objc_alloc_init(MEMORY[0x1E0CF2D58]);
      self->_delegateOverrideStorage = delegateOverrideStorage;
    }
    -[AVWeakReferencingDelegateStorage setDelegate:queue:](delegateOverrideStorage, "setDelegate:queue:", a3, a4);
  }
  else
  {
    p_stateMutex = &self->_stateMutex;
    MEMORY[0x1A1AF1298](self->_stateMutex, a2, 0, a4, a5);

    self->_delegateOverrideStorage = 0;
  }
  if (self->_remoteQueueReceiver)
  {
    -[AVCaptureDataOutputDelegateCallbackHelper _activeCallbackQueue](self, "_activeCallbackQueue");
    FigRemoteQueueReceiverSetHandler();
  }
  MEMORY[0x1A1AF12A4](*p_stateMutex);
  LOBYTE(v8) = 1;
  return v8;
}

- (OS_dispatch_queue)delegateOverrideCallbackQueue
{
  id v3;

  MEMORY[0x1A1AF1298](self->_stateMutex, a2);
  v3 = (id)-[AVWeakReferencingDelegateStorage delegateQueue](self->_delegateOverrideStorage, "delegateQueue");
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  return (OS_dispatch_queue *)v3;
}

- (void)releaseRemoteQueueReceiver
{
  remoteQueueReceiverOpaque *remoteQueueReceiver;

  MEMORY[0x1A1AF1298](self->_stateMutex, a2);
  if (self->_remoteQueueReceiver)
  {
    FigRemoteQueueReceiverUnsetHandler();
    remoteQueueReceiver = self->_remoteQueueReceiver;
    if (remoteQueueReceiver)
    {
      CFRelease(remoteQueueReceiver);
      self->_remoteQueueReceiver = 0;
    }
  }
  JUMPOUT(0x1A1AF12A4);
}

- (void)updateLocalQueue:(localQueueOpaque *)a3 handler:(id)a4
{
  localQueueOpaque *localQueue;
  void *v8;

  MEMORY[0x1A1AF1298](self->_stateMutex);
  if (!self->_remoteQueueReceiver)
  {
    if (self->_localQueue)
    {
      FigLocalQueueUnsetReceiverHandler();
      localQueue = self->_localQueue;
    }
    else
    {
      localQueue = 0;
    }
    self->_localQueue = a3;
    if (a3)
      CFRetain(a3);
    if (localQueue)
      CFRelease(localQueue);
    if (a4 && self->_localQueue)
    {
      -[AVCaptureDataOutputDelegateCallbackHelper _activeCallbackQueue](self, "_activeCallbackQueue");
      FigLocalQueueSetReceiverHandler();
    }
    JUMPOUT(0x1A1AF12A4);
  }
  MEMORY[0x1A1AF12A4](self->_stateMutex);
  if (a3)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], AVMethodExceptionReasonWithObjectAndSelector(), 0);
    objc_exception_throw(v8);
  }
}

@end
