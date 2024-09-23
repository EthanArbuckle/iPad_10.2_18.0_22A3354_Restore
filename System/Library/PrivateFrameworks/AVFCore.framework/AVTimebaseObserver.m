@implementation AVTimebaseObserver

- (AVTimebaseObserver)initWithTimebase:(OpaqueCMTimebase *)a3 queue:(id)a4
{
  AVTimebaseObserver *v7;
  AVTimebaseObserver *v8;
  AVWeakReference *v9;
  NSObject *v10;
  NSObject *timerQueue;
  AVTimebaseObserver *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  _QWORD block[5];
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)AVTimebaseObserver;
  v7 = -[AVTimebaseObserver init](&v21, sel_init);
  v8 = v7;
  if (v7)
  {
    if (!a3)
    {
      timerQueue = v7->_timerQueue;
      if (timerQueue)
      {
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __45__AVTimebaseObserver_initWithTimebase_queue___block_invoke;
        block[3] = &unk_1E302FA10;
        block[4] = v8;
        dispatch_async(timerQueue, block);
      }
      else
      {
        -[AVTimebaseObserver invalidate](v8, "invalidate");
      }
      v13 = v8;
      v19 = (void *)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], AVMethodExceptionReasonWithObjectAndSelector((objc_class *)v8, a2, (uint64_t)CFSTR("invalid parameter not satisfying: %s"), v14, v15, v16, v17, v18, (uint64_t)"timebase"), 0);
      objc_exception_throw(v19);
    }
    v9 = -[AVWeakReference initWithReferencedObject:]([AVWeakReference alloc], "initWithReferencedObject:", v7);
    v10 = MEMORY[0x1E0C80D38];
    if (a4)
      v10 = a4;
    v8->_timerQueue = (OS_dispatch_queue *)v10;
    v8->_weakReference = v9;
    dispatch_retain(v10);
    CFRetain(a3);
    v8->_timebase = a3;
  }
  return v8;
}

- (void)_finishInitializationWithTimerEventHandler:(id)a3
{
  OS_dispatch_source *v5;
  double currentRate;
  NSObject *timerQueue;
  _QWORD block[5];

  v5 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, (dispatch_queue_t)self->_timerQueue);
  self->_timerSource = v5;
  dispatch_source_set_event_handler((dispatch_source_t)v5, a3);
  dispatch_resume((dispatch_object_t)self->_timerSource);
  -[AVTimebaseObserver _attachTimerSourceToTimebase](self, "_attachTimerSourceToTimebase");
  -[AVTimebaseObserver _startObservingTimebaseNotifications](self, "_startObservingTimebaseNotifications");
  currentRate = self->_currentRate;
  if (currentRate != CMTimebaseGetRate(self->_timebase))
  {
    timerQueue = self->_timerQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __65__AVTimebaseObserver__finishInitializationWithTimerEventHandler___block_invoke;
    block[3] = &unk_1E302FA10;
    block[4] = self;
    dispatch_async(timerQueue, block);
  }
}

- (void)_startObservingTimebaseNotifications
{
  id v3;
  AVWeakReference *v4;

  if (self->_timebase)
  {
    v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
    v4 = -[AVTimebaseObserver _weakReference](self, "_weakReference");
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVTimebaseObserver_timebaseNotificationCallback, *MEMORY[0x1E0CA2E88], self->_timebase, 0);
    objc_msgSend(v3, "addListenerWithWeakReference:callback:name:object:flags:", v4, AVTimebaseObserver_timebaseNotificationCallback, *MEMORY[0x1E0CA2E78], self->_timebase, 0);
    self->_isObservingTimebase = 1;
  }
}

- (AVWeakReference)_weakReference
{
  return self->_weakReference;
}

- (void)_attachTimerSourceToTimebase
{
  CMTimebaseAddTimerDispatchSource(self->_timebase, (dispatch_source_t)self->_timerSource);
}

void __AVTimebaseObserver_timebaseNotificationCallback_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1940343FC]();
  if ((objc_msgSend(*(id *)(a1 + 32), "invalidated") & 1) == 0)
  {
    if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E0CA2E88]))
    {
      objc_msgSend(*(id *)(a1 + 32), "_handleTimeDiscontinuity");
    }
    else if (CFEqual(*(CFTypeRef *)(a1 + 40), (CFTypeRef)*MEMORY[0x1E0CA2E78]))
    {
      objc_msgSend(*(id *)(a1 + 32), "_effectiveRateChanged");
    }
  }
  objc_autoreleasePoolPop(v2);
}

- (BOOL)invalidated
{
  return self->_invalid;
}

uint64_t __45__AVTimebaseObserver_initWithTimebase_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

- (void)dealloc
{
  NSObject *timerQueue;
  OpaqueCMTimebase *timebase;
  objc_super v5;

  if (!-[AVTimebaseObserver invalidated](self, "invalidated"))
    objc_exception_throw((id)objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], CFSTR("A time observer token object was released without first being removed from the object it was created from using -removeTimeObserver:"), 0));
  timerQueue = self->_timerQueue;
  if (timerQueue)
  {
    dispatch_release(timerQueue);
    self->_timerQueue = 0;
  }
  timebase = self->_timebase;
  if (timebase)
  {
    CFRelease(timebase);
    self->_timebase = 0;
  }

  v5.receiver = self;
  v5.super_class = (Class)AVTimebaseObserver;
  -[AVTimebaseObserver dealloc](&v5, sel_dealloc);
}

- (OpaqueCMTimebase)timebase
{
  void *timebase;

  timebase = self->_timebase;
  if (timebase)
    timebase = (void *)CFRetain(timebase);
  return (OpaqueCMTimebase *)timebase;
}

- (void)invalidate
{
  NSObject *timerQueue;
  void (*v4[5])(_QWORD);

  timerQueue = self->_timerQueue;
  if (timerQueue)
  {
    v4[0] = (void (*)(_QWORD))MEMORY[0x1E0C809B0];
    v4[1] = (void (*)(_QWORD))3221225472;
    v4[2] = (void (*)(_QWORD))__32__AVTimebaseObserver_invalidate__block_invoke;
    v4[3] = (void (*)(_QWORD))&unk_1E302FA10;
    v4[4] = (void (*)(_QWORD))self;
    AVSerializeOnQueueAsyncIfNecessary(timerQueue, v4);
  }
  else
  {
    -[AVTimebaseObserver _reallyInvalidate](self, "_reallyInvalidate");
  }
}

uint64_t __32__AVTimebaseObserver_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reallyInvalidate");
}

- (void)_reallyInvalidate
{
  OpaqueCMTimebase *timebase;
  NSObject *timerSource;

  if (!self->_invalid)
  {
    self->_invalid = 1;
    -[AVTimebaseObserver _removeTimebaseFromTimerSource](self, "_removeTimebaseFromTimerSource");
    -[AVTimebaseObserver _stopObservingTimebaseNotifications](self, "_stopObservingTimebaseNotifications");
    timebase = self->_timebase;
    if (timebase)
    {
      CFRelease(timebase);
      self->_timebase = 0;
    }
    timerSource = self->_timerSource;
    if (timerSource)
    {
      dispatch_release(timerSource);
      self->_timerSource = 0;
    }
  }
}

uint64_t __65__AVTimebaseObserver__finishInitializationWithTimerEventHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_effectiveRateChanged");
}

- (void)_removeTimebaseFromTimerSource
{
  OpaqueCMTimebase *timebase;
  NSObject *timerSource;
  CMTime v5;

  timebase = self->_timebase;
  if (timebase)
  {
    timerSource = self->_timerSource;
    if (timerSource)
    {
      v5 = *(CMTime *)*(_QWORD *)&MEMORY[0x1E0CA2E18];
      CMTimebaseSetTimerDispatchSourceNextFireTime(timebase, timerSource, &v5, 0);
      CMTimebaseRemoveTimerDispatchSource(self->_timebase, (dispatch_source_t)self->_timerSource);
    }
  }
}

- (void)_stopObservingTimebaseNotifications
{
  id v3;
  AVWeakReference *v4;

  if (self->_timebase)
  {
    if (self->_isObservingTimebase)
    {
      v3 = +[AVCMNotificationDispatcher notificationDispatcherForCMNotificationCenter:](AVCMNotificationDispatcher, "notificationDispatcherForCMNotificationCenter:", CMNotificationCenterGetDefaultLocalCenter());
      v4 = -[AVTimebaseObserver _weakReference](self, "_weakReference");
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVTimebaseObserver_timebaseNotificationCallback, *MEMORY[0x1E0CA2E88], self->_timebase);
      objc_msgSend(v3, "removeListenerWithWeakReference:callback:name:object:", v4, AVTimebaseObserver_timebaseNotificationCallback, *MEMORY[0x1E0CA2E78], self->_timebase);
      self->_isObservingTimebase = 0;
    }
  }
}

@end
