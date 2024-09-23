@implementation IMEventListener

+ (id)_mutableListenerDictionary
{
  if (qword_1EE503880 != -1)
    dispatch_once(&qword_1EE503880, &unk_1E3FB3288);
  return (id)qword_1EE503888;
}

+ (id)allListeners
{
  void *v2;
  void *v3;

  +[IMEventListener _mutableListenerDictionary](IMEventListener, "_mutableListenerDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)eventListener
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (void)_removeFromListeners
{
  void *v3;
  id v4;

  if (self->_timeListeningStarted != 0.0)
  {
    +[IMEventListener _mutableListenerDictionary](IMEventListener, "_mutableListenerDictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeListeningStarted);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObjectForKey:", v3);

  }
}

- (void)_addToListeners
{
  void *v3;
  id v4;

  if (self->_timeListeningStarted != 0.0)
  {
    +[IMEventListener _mutableListenerDictionary](IMEventListener, "_mutableListenerDictionary");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_timeListeningStarted);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setObject:forKey:", self, v3);

  }
}

- (id)createResult:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v7;
  id v8;
  IMEventListenerResponse *v9;

  v6 = a3;
  v7 = a5;
  v8 = a4;
  v9 = -[IMEventListenerResponse initWithSuccess:userInfo:error:]([IMEventListenerResponse alloc], "initWithSuccess:userInfo:error:", v6, v8, v7);

  return v9;
}

- (void)_invokeCompletion:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  _BOOL8 v6;
  id v8;
  id WeakRetained;
  uint64_t v10;
  void *v11;
  void (**v12)(_QWORD, _QWORD, _QWORD, _QWORD);
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;

  v6 = a3;
  v16 = a4;
  v8 = a5;
  -[IMEventListener _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
  WeakRetained = objc_loadWeakRetained(&self->_target);
  if (WeakRetained)
  {
    -[IMEventListener willInvokeCompletion](self, "willInvokeCompletion");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      (*(void (**)(uint64_t, id, IMEventListener *))(v10 + 16))(v10, WeakRetained, self);
    -[IMEventListener completionBlock](self, "completionBlock");
    v12 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[IMEventListener _stopListening](self, "_stopListening");
    if (v12)
    {
      -[IMEventListener createResult:userInfo:error:](self, "createResult:userInfo:error:", v6, v16, v8);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, id, IMEventListener *, void *))v12)[2](v12, WeakRetained, self, v13);

    }
    -[IMEventListener didInvokeCompletion](self, "didInvokeCompletion");
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)v14;
    if (v14)
      (*(void (**)(uint64_t, id, IMEventListener *))(v14 + 16))(v14, WeakRetained, self);

  }
}

- (void)_handleTimeout:(id)a3
{
  id v4;
  IMEventListener *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)MEMORY[0x1E0CB35C8];
  v9 = *MEMORY[0x1E0CB2D50];
  v10[0] = CFSTR("Event timed out");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "errorWithDomain:code:userInfo:", CFSTR("IMEventListenerErrorDomain"), 1, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[IMEventListener _invokeCompletion:userInfo:error:](v5, "_invokeCompletion:userInfo:error:", 0, 0, v8);

  objc_sync_exit(v5);
}

- (void)_startListening
{
  OS_dispatch_semaphore *v3;
  OS_dispatch_semaphore *semaphore;
  double v5;

  -[IMEventListener _stopListening](self, "_stopListening");
  self->_eventCount = 0;
  v3 = (OS_dispatch_semaphore *)dispatch_semaphore_create(0);
  semaphore = self->_semaphore;
  self->_semaphore = v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  self->_timeListeningStarted = v5;
  self->_timeListeningStopped = 0.0;
  self->_timeLastEventReceived = 0.0;
  -[IMEventListener willStartListening](self, "willStartListening");
  -[IMEventListener _addToListeners](self, "_addToListeners");
  -[IMEventListener _startTimeoutTimerIfNeeded](self, "_startTimeoutTimerIfNeeded");
}

- (void)_stopListening
{
  double v3;
  NSObject *semaphore;
  OS_dispatch_semaphore *v5;

  if (self->_timeListeningStarted != 0.0)
  {
    -[IMEventListener _removeFromListeners](self, "_removeFromListeners");
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    self->_timeListeningStopped = v3;
  }
  -[IMEventListener willStopListening](self, "willStopListening");
  semaphore = self->_semaphore;
  if (semaphore)
  {
    dispatch_semaphore_signal(semaphore);
    v5 = self->_semaphore;
    self->_semaphore = 0;

  }
  -[IMEventListener _cancelTimeoutTimer](self, "_cancelTimeoutTimer");
}

- (void)_cancelTimeoutTimer
{
  self->_timerStart = 0.0;
}

- (void)_reset
{
  id completionBlock;
  id didInvokeCompletion;
  id willInvokeCompletion;

  -[IMEventListener _stopListening](self, "_stopListening");
  self->_timeout = 0.0;
  completionBlock = self->_completionBlock;
  self->_completionBlock = 0;

  didInvokeCompletion = self->_didInvokeCompletion;
  self->_didInvokeCompletion = 0;

  willInvokeCompletion = self->_willInvokeCompletion;
  self->_willInvokeCompletion = 0;

  self->_timeListeningStarted = 0.0;
  self->_timeListeningStopped = 0.0;
  self->_timeLastEventReceived = 0.0;
  objc_storeWeak(&self->_target, 0);
  self->_eventCount = 0;
  MEMORY[0x1E0DE7D20](self, sel_willReset);
}

- (void)_startTimeoutTimerIfNeeded
{
  double v3;
  double v4;
  dispatch_time_t v5;
  _QWORD block[4];
  id v7[2];
  id location;

  if (self->_timeout > 0.0)
  {
    location = 0;
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v4 = v3;
    self->_timerStart = v3;
    v5 = dispatch_time(0, (uint64_t)(self->_timeout * 1000000000.0));
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = sub_19E259C60;
    block[3] = &unk_1E3FB4E90;
    objc_copyWeak(v7, &location);
    v7[1] = *(id *)&v4;
    dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    objc_destroyWeak(v7);
    objc_destroyWeak(&location);
  }
}

- (void)_dispatchStartEventBlock:(id)a3
{
  if (a3)
    dispatch_async(MEMORY[0x1E0C80D38], a3);
}

- (void)waitForCompletion
{
  void *v3;
  void *v4;

  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    if (-[IMEventListener isListening](self, "isListening"))
    {
      do
      {
        objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", 0.1);
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "runUntilDate:", v4);

      }
      while (-[IMEventListener isListening](self, "isListening"));
    }
  }
  else
  {
    dispatch_semaphore_wait((dispatch_semaphore_t)self->_semaphore, 0xFFFFFFFFFFFFFFFFLL);
  }
}

- (void)startListeningForEventTarget:(id)a3 sendStartingEvent:(id)a4 completion:(id)a5
{
  void (**v8)(id, id, IMEventListener *);
  id v9;
  IMEventListener *v10;
  uint64_t v11;
  id completionBlock;
  id obj;

  obj = a3;
  v8 = (void (**)(id, id, IMEventListener *))a4;
  v9 = a5;
  v10 = self;
  objc_sync_enter(v10);
  -[IMEventListener _stopListening](v10, "_stopListening");
  objc_storeWeak(&v10->_target, obj);
  v11 = objc_msgSend(v9, "copy");
  completionBlock = v10->_completionBlock;
  v10->_completionBlock = (id)v11;

  -[IMEventListener _startListening](v10, "_startListening");
  if (v8)
    v8[2](v8, obj, v10);
  objc_sync_exit(v10);

}

- (void)startListeningForEventTarget:(id)a3 completion:(id)a4
{
  MEMORY[0x1E0DE7D20](self, sel_startListeningForEventTarget_sendStartingEvent_completion_);
}

- (BOOL)isListening
{
  return 0;
}

- (void)stopListening
{
  IMEventListener *obj;

  obj = self;
  objc_sync_enter(obj);
  -[IMEventListener _stopListening](obj, "_stopListening");
  objc_sync_exit(obj);

}

- (void)startListening
{
  IMEventListener *obj;

  obj = self;
  objc_sync_enter(obj);
  -[IMEventListener _startListening](obj, "_startListening");
  objc_sync_exit(obj);

}

- (double)timeListeningStarted
{
  IMEventListener *v2;
  double timeListeningStarted;

  v2 = self;
  objc_sync_enter(v2);
  timeListeningStarted = v2->_timeListeningStarted;
  objc_sync_exit(v2);

  return timeListeningStarted;
}

- (double)timeListeningStopped
{
  IMEventListener *v2;
  double timeListeningStopped;

  v2 = self;
  objc_sync_enter(v2);
  timeListeningStopped = v2->_timeListeningStopped;
  objc_sync_exit(v2);

  return timeListeningStopped;
}

- (double)timeLastEventReceived
{
  IMEventListener *v2;
  double timeLastEventReceived;

  v2 = self;
  objc_sync_enter(v2);
  timeLastEventReceived = v2->_timeLastEventReceived;
  objc_sync_exit(v2);

  return timeLastEventReceived;
}

- (double)elapsedWaitingTime
{
  IMEventListener *v2;
  double timeListeningStarted;
  double v4;
  double timeListeningStopped;

  v2 = self;
  objc_sync_enter(v2);
  timeListeningStarted = v2->_timeListeningStarted;
  v4 = 0.0;
  if (timeListeningStarted != 0.0)
  {
    timeListeningStopped = v2->_timeListeningStopped;
    if (timeListeningStopped == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
      timeListeningStarted = v2->_timeListeningStarted;
    }
    v4 = timeListeningStopped - timeListeningStarted;
  }
  objc_sync_exit(v2);

  return v4;
}

- (void)setCompletionBlock:(id)a3
{
  IMEventListener *v4;
  uint64_t v5;
  id completionBlock;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[IMEventListener _stopListening](v4, "_stopListening");
  v5 = objc_msgSend(v7, "copy");
  completionBlock = v4->_completionBlock;
  v4->_completionBlock = (id)v5;

  objc_sync_exit(v4);
}

- (id)completionBlock
{
  IMEventListener *v2;
  void *v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = _Block_copy(v2->_completionBlock);
  objc_sync_exit(v2);

  return v3;
}

- (void)reset
{
  IMEventListener *obj;

  obj = self;
  objc_sync_enter(obj);
  -[IMEventListener _reset](obj, "_reset");
  objc_sync_exit(obj);

}

- (void)setTimeout:(double)a3
{
  IMEventListener *obj;

  obj = self;
  objc_sync_enter(obj);
  -[IMEventListener _cancelTimeoutTimer](obj, "_cancelTimeoutTimer");
  obj->_timeout = a3;
  -[IMEventListener _startTimeoutTimerIfNeeded](obj, "_startTimeoutTimerIfNeeded");
  objc_sync_exit(obj);

}

- (double)timeout
{
  IMEventListener *v2;
  double timeout;

  v2 = self;
  objc_sync_enter(v2);
  timeout = v2->_timeout;
  objc_sync_exit(v2);

  return timeout;
}

- (void)_didReceiveEvent:(BOOL)a3 userInfo:(id)a4 error:(id)a5
{
  id v7;
  id v8;
  IMEventListener *v9;
  double v10;
  _QWORD v11[5];
  id v12;

  v7 = a4;
  v8 = a5;
  v9 = self;
  objc_sync_enter(v9);
  ++v9->_eventCount;
  if (v9->_timeLastEventReceived == 0.0)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
    v9->_timeLastEventReceived = v10;
    -[IMEventListener _cancelTimeoutTimer](v9, "_cancelTimeoutTimer");
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_19E25A310;
    v11[3] = &unk_1E3FB4EF8;
    v11[4] = v9;
    v12 = v7;
    dispatch_async(MEMORY[0x1E0C80D38], v11);

  }
  objc_sync_exit(v9);

}

+ (id)eventListenerWithNotificationName:(id)a3 object:(id)a4
{
  return +[IMNotificationCenterEventListener eventListenerForNotificationName:object:](IMNotificationCenterEventListener, "eventListenerForNotificationName:object:", a3, a4);
}

- (double)timerStart
{
  return self->_timerStart;
}

- (void)setTimerStart:(double)a3
{
  self->_timerStart = a3;
}

- (OS_dispatch_semaphore)semaphore
{
  return self->_semaphore;
}

- (unint64_t)eventCount
{
  return self->_eventCount;
}

- (id)target
{
  return objc_loadWeakRetained(&self->_target);
}

- (void)setTarget:(id)a3
{
  objc_storeWeak(&self->_target, a3);
}

- (id)willInvokeCompletion
{
  return objc_getProperty(self, a2, 88, 1);
}

- (void)setWillInvokeCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 88);
}

- (id)didInvokeCompletion
{
  return objc_getProperty(self, a2, 96, 1);
}

- (void)setDidInvokeCompletion:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (BOOL)willRepeat
{
  return self->_willRepeat;
}

- (void)setWillRepeat:(BOOL)a3
{
  self->_willRepeat = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_didInvokeCompletion, 0);
  objc_storeStrong(&self->_willInvokeCompletion, 0);
  objc_storeStrong(&self->_completionBlock, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_semaphore, 0);
}

@end
