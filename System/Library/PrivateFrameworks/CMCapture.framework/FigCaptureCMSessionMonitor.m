@implementation FigCaptureCMSessionMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (id)_initWithFigCaptureCMSession:(id)a3 clientPID:(int)a4 observer:(id)a5
{
  uint64_t v6;
  FigCaptureCMSessionMonitor *v8;
  FigCaptureCMSession *v9;
  objc_super v11;

  v6 = *(_QWORD *)&a4;
  v11.receiver = self;
  v11.super_class = (Class)FigCaptureCMSessionMonitor;
  v8 = -[FigCaptureCMSessionMonitor init](&v11, sel_init);
  if (v8)
  {
    v8->_lock = (OpaqueFigSimpleMutex *)FigSimpleMutexCreate();
    v9 = (FigCaptureCMSession *)a3;
    v8->_session = v9;
    v8->_clientPID = v6;
    if (-[FigCaptureCMSession setProperty:value:](v9, "setProperty:value:", *MEMORY[0x1E0D495D8], objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("FigCaptureClient-%d"), v6))|| -[FigCaptureCMSession setProperty:value:](v8->_session, "setProperty:value:", *MEMORY[0x1E0D495E8], objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v8->_clientPID)))
    {
      FigDebugAssert3();

      return 0;
    }
    else
    {
      v8->_observer = (FigCaptureCMSessionObserver *)a5;
      -[FigCaptureCMSessionMonitor _beginMonitoring]((uint64_t)v8);
    }
  }
  return v8;
}

- (uint64_t)_beginMonitoring
{
  uint64_t v1;
  id v2;
  void *v3;
  void *v4;
  _QWORD v5[5];

  if (result)
  {
    v1 = result;
    v2 = +[FigWeakReference weakReferenceToObject:](FigWeakReference, "weakReferenceToObject:", result);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __46__FigCaptureCMSessionMonitor__beginMonitoring__block_invoke;
    v5[3] = &unk_1E491EAC8;
    v5[4] = v2;
    v3 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    *(_QWORD *)(v1 + 40) = objc_msgSend(v3, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D49368], objc_msgSend(*(id *)(v1 + 16), "cmsession"), 0, v5);
    -[FigCaptureCMSessionMonitor _updateApplicationState](v1);
    v4 = (void *)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    result = objc_msgSend(v4, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0D493E0], objc_msgSend(*(id *)(v1 + 16), "cmsession"), 0, v5);
    *(_QWORD *)(v1 + 48) = result;
  }
  return result;
}

- (FigCaptureCMSessionMonitor)initWithCMSession:(opaqueCMSession *)a3 clientPID:(int)a4 observer:(id)a5
{
  uint64_t v6;
  FigCaptureCMSession *v9;
  char v10;

  v6 = *(_QWORD *)&a4;
  if (!a3 && CMSessionCreate())
  {
    FigDebugAssert3();
    v10 = 0;
  }
  else
  {
    v9 = -[FigCaptureCMSession initWithCMSession:]([FigCaptureCMSession alloc], "initWithCMSession:", a3);
    self = -[FigCaptureCMSessionMonitor _initWithFigCaptureCMSession:clientPID:observer:](self, "_initWithFigCaptureCMSession:clientPID:observer:", v9, v6, a5);

    if (a3)
      return self;
    v10 = 1;
  }
  if (a3)
    CFRelease(a3);
  if ((v10 & 1) == 0)
  {

    return 0;
  }
  return self;
}

- (void)invalidate
{
  pthread_mutex_lock((pthread_mutex_t *)self->_lock);
  if (!self->_invalidated)
  {
    -[FigCaptureCMSessionMonitor _endMonitoring]((uint64_t)self);
    self->_invalidated = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)self->_lock);
}

- (uint64_t)_endMonitoring
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    if (*(_QWORD *)(result + 40))
    {
      result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(result + 40));
      *(_QWORD *)(v1 + 40) = 0;
    }
    if (*(_QWORD *)(v1 + 48))
    {
      result = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter"), "removeObserver:", *(_QWORD *)(v1 + 48));
      *(_QWORD *)(v1 + 48) = 0;
    }
  }
  return result;
}

- (void)dealloc
{
  objc_super v3;

  -[FigCaptureCMSessionMonitor invalidate](self, "invalidate");

  FigSimpleMutexDestroy();
  v3.receiver = self;
  v3.super_class = (Class)FigCaptureCMSessionMonitor;
  -[FigCaptureCMSessionMonitor dealloc](&v3, sel_dealloc);
}

- (id)debugDescription
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("session: %@, observer: %@"), self->_session, self->_observer);
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p %@>"), NSStringFromClass(v4), self, -[FigCaptureCMSessionMonitor debugDescription](self, "debugDescription"));
}

void __46__FigCaptureCMSessionMonitor__beginMonitoring__block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  id v5;

  v4 = (void *)MEMORY[0x1A858DD40]();
  v5 = (id)objc_msgSend(*(id *)(a1 + 32), "referencedObject");
  -[FigCaptureCMSessionMonitor _handleCMSessionNotification:]((uint64_t)v5, a2);

  objc_autoreleasePoolPop(v4);
}

- (void)_handleCMSessionNotification:(uint64_t)a1
{
  int v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    pthread_mutex_lock(*(pthread_mutex_t **)(a1 + 8));
    v4 = *(unsigned __int8 *)(a1 + 56);
    pthread_mutex_unlock(*(pthread_mutex_t **)(a1 + 8));
    if (!v4)
    {
      v5 = (void *)objc_msgSend(a2, "name");
      if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0D493E0]))
      {
        v6 = (void *)objc_msgSend(a2, "userInfo");
        v7 = (void *)objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D49260]);
        if (v7)
        {
          v8 = objc_msgSend(v7, "intValue");
          if (v8 == 1)
          {
            objc_msgSend(*(id *)(a1 + 32), "cmsessionMonitorDidEndAudioInterruption:", a1);
          }
          else if (!v8)
          {
            objc_msgSend(*(id *)(a1 + 32), "cmsessionMonitorDidBeginAudioInterruption:", a1);
          }
          return;
        }
      }
      else
      {
        v9 = (void *)objc_msgSend(a2, "name");
        if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D49368]))
          return;
        v10 = (void *)objc_msgSend(a2, "userInfo");
        v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0D492C0]);
        if (v11)
        {
          -[FigCaptureCMSessionMonitor _handleBKSApplicationStateChange:](a1, objc_msgSend(v11, "unsignedIntValue"));
          return;
        }
      }
    }
    FigDebugAssert3();
  }
}

- (void)_updateApplicationState
{
  void *v2;
  void *v3;
  int v4;

  if (a1)
  {
    v4 = 0;
    v2 = (void *)objc_msgSend(*(id *)(a1 + 16), "copyProperty:error:", *MEMORY[0x1E0D494E8], &v4);
    v3 = v2;
    if (v4)
      FigDebugAssert3();
    else
      -[FigCaptureCMSessionMonitor _handleBKSApplicationStateChange:](a1, objc_msgSend(v2, "unsignedIntValue"));

  }
}

- (void)_handleBKSApplicationStateChange:(uint64_t)a1
{
  void *v4;
  void *v5;
  int v6;

  if (a1)
  {
    v6 = 0;
    v4 = (void *)objc_msgSend(*(id *)(a1 + 16), "copyProperty:error:", *MEMORY[0x1E0D499F0], &v6);
    v5 = v4;
    if (v6)
      FigDebugAssert3();
    else
      objc_msgSend(*(id *)(a1 + 32), "cmsessionMonitor:didUpdateApplicationState:pidToInheritApplicationStateFrom:", a1, a2, objc_msgSend(v4, "intValue"));

  }
}

@end
