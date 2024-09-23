@implementation SCNDisplayLink

- (SCNDisplayLink)initWithQueue:(id)a3 screen:(id)a4 policy:(unint64_t)a5 block:(id)a6
{
  SCNDisplayLink *v10;
  SCNDisplayLink *v11;
  id v12;
  CADisplayLink *v13;
  CADisplayLink *caDisplayLink;
  uint64_t v15;
  NSObject *coalescingSource;
  _QWORD v18[4];
  id v19;
  id location;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SCNDisplayLink;
  v10 = -[SCNDisplayLink init](&v21, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_preferredFrameRate = 0.0;
    v10->_paused = 1;
    v10->_queue = (OS_dispatch_queue *)a3;
    dispatch_retain((dispatch_object_t)a3);
    atomic_store(0, (unsigned int *)&v11->_queuedFrameCount);
    v11->_block = (id)objc_msgSend(a6, "copy");
    v11->_lastFrameTime = 0.0;
    v11->_runningLock = objc_alloc_init(SCNRecursiveLock);
    if (a4)
      v12 = a4;
    else
      v12 = (id)MEMORY[0x1E0CD2730];
    v13 = (CADisplayLink *)(id)objc_msgSend(v12, "displayLinkWithTarget:selector:", v11, sel__caDisplayLinkCallback);
    v11->_caDisplayLink = v13;
    -[CADisplayLink setPaused:](v13, "setPaused:", 1);
    caDisplayLink = v11->_caDisplayLink;
    v15 = objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
    -[CADisplayLink addToRunLoop:forMode:](caDisplayLink, "addToRunLoop:forMode:", v15, *MEMORY[0x1E0C99860]);
    if (a5 == 1)
    {
      v11->_coalescingSource = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E0C80D70], 0, 0, (dispatch_queue_t)v11->_queue);
      objc_initWeak(&location, v11);
      coalescingSource = v11->_coalescingSource;
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __52__SCNDisplayLink_initWithQueue_screen_policy_block___block_invoke;
      v18[3] = &unk_1EA5A2FE8;
      objc_copyWeak(&v19, &location);
      dispatch_source_set_event_handler(coalescingSource, v18);
      dispatch_resume((dispatch_object_t)v11->_coalescingSource);
      objc_destroyWeak(&v19);
      objc_destroyWeak(&location);
    }
  }
  return v11;
}

- (void)setPreferredFrameRate:(float)a3
{
  if (self->_preferredFrameRate != a3)
  {
    self->_preferredFrameRate = a3;
    -[CADisplayLink setPreferredFramesPerSecond:](self->_caDisplayLink, "setPreferredFramesPerSecond:", (uint64_t)a3);
  }
}

- (SCNDisplayLink)init
{

  return 0;
}

void __52__SCNDisplayLink_initWithQueue_screen_policy_block___block_invoke(uint64_t a1)
{
  id Weak;

  Weak = objc_loadWeak((id *)(a1 + 32));
  -[SCNDisplayLink _displayLinkCallbackReturningImmediately]((uint64_t)Weak);
}

- (void)_displayLinkCallbackReturningImmediately
{
  unsigned int *v2;
  int v3;
  unsigned int v4;
  void *v5;
  double v6;
  unsigned int v7;

  if (a1 && (objc_msgSend((id)a1, "isPaused") & 1) == 0 && (objc_msgSend((id)a1, "_isInvalidated") & 1) == 0)
  {
    v2 = (unsigned int *)(a1 + 88);
    do
      v3 = __ldaxr(v2);
    while (__stlxr(v3 + 1, v2));
    if (v3 < 4)
    {
      v5 = (void *)MEMORY[0x1DF0D4CF4]();
      if ((objc_msgSend((id)a1, "isPaused") & 1) == 0 && !*(_BYTE *)(a1 + 57))
      {
        v6 = COERCE_DOUBLE(atomic_load((unint64_t *)(a1 + 16)));
        (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6);
      }
      do
        v7 = __ldaxr(v2);
      while (__stlxr(v7 - 1, v2));
      objc_autoreleasePoolPop(v5);
    }
    else
    {
      do
        v4 = __ldaxr(v2);
      while (__stlxr(v4 - 1, v2));
    }
  }
}

- (void)dealloc
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1DCCB8000, log, OS_LOG_TYPE_FAULT, "Unreachable code: -[SCNDisplayLink invalidate] must be called before -[SCNDisplayLink dealloc]", v1, 2u);
}

- (BOOL)isPaused
{
  BOOL paused;

  objc_sync_enter(self);
  paused = self->_paused;
  objc_sync_exit(self);
  return paused;
}

- (void)setPaused:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  objc_sync_enter(self);
  if (-[SCNDisplayLink isPaused](self, "isPaused") != v3)
  {
    self->_paused = v3;
    if (v3)
      self->_lastFrameTime = 0.0;
    -[CADisplayLink setPaused:](self->_caDisplayLink, "setPaused:", v3);
  }
  objc_sync_exit(self);
}

- (BOOL)setPaused:(BOOL)a3 nextFrameTimeHint:(double)a4 lastUpdate:(double)a5
{
  double v9;
  BOOL v10;
  BOOL v11;
  CFTimeInterval v12;
  dispatch_time_t v13;
  _QWORD block[5];

  v9 = CACurrentMediaTime();
  v10 = v9 - a5 <= 0.25 || a4 - v9 <= 0.25;
  v11 = !a3 || v10;
  if (v11)
  {
    -[SCNDisplayLink setPaused:](self, "setPaused:", 0);
  }
  else
  {
    -[SCNDisplayLink setPaused:](self, "setPaused:", 1);
    if (a4 != INFINITY)
    {
      v12 = CACurrentMediaTime();
      v13 = dispatch_time(0, (uint64_t)((a4 - v12 + -0.01) * 1000000000.0));
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __57__SCNDisplayLink_setPaused_nextFrameTimeHint_lastUpdate___block_invoke;
      block[3] = &unk_1EA59E288;
      block[4] = self;
      dispatch_after(v13, MEMORY[0x1E0C80D38], block);
    }
  }
  return !v11;
}

uint64_t __57__SCNDisplayLink_setPaused_nextFrameTimeHint_lastUpdate___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "_isInvalidated");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "setPaused:", 0);
  return result;
}

- (id)adaptativeFrameRate
{
  return self->_adaptativeFrameDuration;
}

- (void)setAdaptativeFrameRate:(id)a3
{
  id adaptativeFrameDuration;

  adaptativeFrameDuration = self->_adaptativeFrameDuration;
  if (adaptativeFrameDuration != a3)
  {

    self->_adaptativeFrameDuration = (id)objc_msgSend(a3, "copy");
  }
}

- (float)preferredFrameRate
{
  return self->_preferredFrameRate;
}

- (int)queuedFrameCount
{
  return atomic_load((unsigned int *)&self->_queuedFrameCount);
}

- (void)_callbackWithTime:(double)a3
{
  if (self->_coalescingSource)
  {
    kdebug_trace();
    atomic_store(*(unint64_t *)&a3, (unint64_t *)&self->_lastDisplayLinkTime);
    dispatch_source_merge_data((dispatch_source_t)self->_coalescingSource, 1uLL);
  }
  else
  {
    -[SCNDisplayLink _displayLinkCallbackWaitingOnFrameCompletionWithTime:]((uint64_t)self, a3);
  }
}

- (void)_displayLinkCallbackWaitingOnFrameCompletionWithTime:(uint64_t)a1
{
  id v3;
  char v4;
  uint64_t v5;
  char v6;
  unsigned int *v7;
  int v8;
  unsigned int v9;
  void *v10;
  NSObject *v11;
  _QWORD block[6];

  if (a1)
  {
    v3 = (id)a1;
    objc_msgSend(*(id *)(a1 + 80), "lock");
    kdebug_trace();
    v4 = objc_msgSend((id)a1, "isPaused");
    v5 = a1;
    if ((v4 & 1) == 0)
    {
      v6 = objc_msgSend((id)a1, "_isInvalidated");
      v5 = a1;
      if ((v6 & 1) == 0)
      {
        v7 = (unsigned int *)(a1 + 88);
        do
          v8 = __ldaxr(v7);
        while (__stlxr(v8 + 1, v7));
        if (v8 < 4)
        {
          v10 = (void *)MEMORY[0x1DF0D4CF4]();
          v11 = *(NSObject **)(a1 + 48);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 3221225472;
          block[2] = __71__SCNDisplayLink__displayLinkCallbackWaitingOnFrameCompletionWithTime___block_invoke;
          block[3] = &unk_1EA5A3010;
          block[4] = a1;
          *(double *)&block[5] = a2;
          dispatch_sync(v11, block);
          objc_autoreleasePoolPop(v10);
          v5 = a1;
        }
        else
        {
          do
            v9 = __ldaxr(v7);
          while (__stlxr(v9 - 1, v7));
        }
      }
    }
    objc_msgSend(*(id *)(v5 + 80), "unlock");

  }
}

uint64_t __71__SCNDisplayLink__displayLinkCallbackWaitingOnFrameCompletionWithTime___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  unsigned int *v4;
  unsigned int v5;

  result = objc_msgSend(*(id *)(a1 + 32), "isPaused");
  v3 = *(_QWORD *)(a1 + 32);
  if ((result & 1) == 0 && !*(_BYTE *)(v3 + 57))
  {
    result = (*(uint64_t (**)(double))(*(_QWORD *)(v3 + 32) + 16))(*(double *)(a1 + 40));
    v3 = *(_QWORD *)(a1 + 32);
  }
  v4 = (unsigned int *)(v3 + 88);
  do
    v5 = __ldaxr(v4);
  while (__stlxr(v5 - 1, v4));
  return result;
}

- (void)_caDisplayLinkCallback
{
  -[CADisplayLink targetTimestamp](self->_caDisplayLink, "targetTimestamp");
  -[SCNDisplayLink _callbackWithTime:](self, "_callbackWithTime:");
}

- (void)invalidate
{
  if (!self->_invalidated)
  {
    -[SCNRecursiveLock lock](self->_runningLock, "lock");
    self->_invalidated = 1;
    -[CADisplayLink invalidate](self->_caDisplayLink, "invalidate");

    self->_caDisplayLink = 0;
    -[SCNRecursiveLock unlock](self->_runningLock, "unlock");
  }
}

- (void)setNeedsDisplay
{
  -[SCNDisplayLink setPaused:](self, "setPaused:", 0);
}

- (BOOL)_isInvalidated
{
  return self->_invalidated;
}

@end
