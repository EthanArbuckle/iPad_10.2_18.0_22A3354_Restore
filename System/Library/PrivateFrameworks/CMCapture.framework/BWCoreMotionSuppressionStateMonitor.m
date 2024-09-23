@implementation BWCoreMotionSuppressionStateMonitor

+ (void)initialize
{
  objc_opt_class();
}

- (BWCoreMotionSuppressionStateMonitor)initWithSuppressionStateChangeHandler:(id)a3
{
  BWCoreMotionSuppressionStateMonitor *v4;
  uint64_t v5;
  uint64_t v6;
  NSOperationQueue *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)BWCoreMotionSuppressionStateMonitor;
  v4 = -[BWCoreMotionSuppressionStateMonitor init](&v9, sel_init);
  if (v4)
  {
    if ((objc_msgSend(MEMORY[0x1E0CA56D8], "isAvailable") & 1) != 0
      && (!objc_msgSend(MEMORY[0x1E0CA56D0], "instancesRespondToSelector:", sel_facedownState)
        ? (v5 = 8)
        : (v5 = 24),
          (objc_msgSend(MEMORY[0x1E0CA56D8], "isSourceAvailable:", v5) & 1) != 0
       && (v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CA56D8]), "initWithClientType:", 5),
           (v4->_suppressionManager = (CMSuppressionManager *)v6) != 0)))
    {
      v4->_suppressionState = 0;
      v7 = (NSOperationQueue *)objc_alloc_init(MEMORY[0x1E0CB3828]);
      v4->_eventQueue = v7;
      -[NSOperationQueue setMaxConcurrentOperationCount:](v7, "setMaxConcurrentOperationCount:", 1);
      v4->_handler = (id)objc_msgSend(a3, "copy");
    }
    else
    {
      fig_log_get_emitter();
      FigDebugAssert3();

      return 0;
    }
  }
  return v4;
}

- (void)start
{
  os_unfair_lock_s *p_monitoringStateLock;
  uint64_t v4;
  CMSuppressionManager *suppressionManager;
  NSOperationQueue *eventQueue;
  _QWORD v7[5];

  p_monitoringStateLock = &self->_monitoringStateLock;
  os_unfair_lock_lock(&self->_monitoringStateLock);
  if (objc_msgSend(MEMORY[0x1E0CA56D0], "instancesRespondToSelector:", sel_facedownState))
    v4 = 24;
  else
    v4 = 8;
  suppressionManager = self->_suppressionManager;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __44__BWCoreMotionSuppressionStateMonitor_start__block_invoke;
  v7[3] = &unk_1E4923818;
  v7[4] = self;
  -[CMSuppressionManager startSuppressionUpdatesToQueue:withOptions:withHandler:](suppressionManager, "startSuppressionUpdatesToQueue:withOptions:withHandler:", eventQueue, v4, v7);
  self->_isMonitoring = 1;
  os_unfair_lock_unlock(p_monitoringStateLock);
}

uint64_t __44__BWCoreMotionSuppressionStateMonitor_start__block_invoke(uint64_t result, void *a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  double v6;
  double v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  if (a2 && !a3)
  {
    v4 = result;
    v5 = *(_DWORD *)(*(_QWORD *)(result + 32) + 16);
    objc_msgSend(a2, "timestamp");
    v7 = v6;
    v8 = objc_msgSend(a2, "type");
    if (v8 < 3)
      v5 = v8;
    v9 = *(_DWORD *)(*(_QWORD *)(v4 + 32) + 20);
    result = objc_msgSend(MEMORY[0x1E0CA56D0], "instancesRespondToSelector:", sel_facedownState);
    if ((_DWORD)result)
    {
      result = objc_msgSend(a2, "facedownState");
      if ((unint64_t)(result - 1) <= 2)
        v9 = result;
      else
        v9 = 0;
    }
    v10 = *(_QWORD *)(v4 + 32);
    if (v5 != *(_DWORD *)(v10 + 16) || v9 != *(_DWORD *)(v10 + 20))
    {
      *(_DWORD *)(v10 + 16) = v5;
      *(_DWORD *)(*(_QWORD *)(v4 + 32) + 20) = v9;
      v11 = *(_QWORD *)(v4 + 32);
      result = *(_QWORD *)(v11 + 32);
      if (result)
        return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD, double))(result + 16))(result, *(unsigned int *)(v11 + 16), *(unsigned int *)(v11 + 20), v7);
    }
  }
  return result;
}

- (void)_doStop
{
  os_unfair_lock_s *v2;

  if (a1)
  {
    v2 = (os_unfair_lock_s *)(a1 + 40);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 40));
    if (*(_BYTE *)(a1 + 44))
    {
      objc_msgSend(*(id *)(a1 + 8), "stopSuppressionUpdates");
      objc_msgSend(*(id *)(a1 + 24), "cancelAllOperations");
      objc_msgSend(*(id *)(a1 + 24), "waitUntilAllOperationsAreFinished");
      *(_BYTE *)(a1 + 44) = 0;
    }
    os_unfair_lock_unlock(v2);
  }
}

- (void)dealloc
{
  objc_super v3;

  -[BWCoreMotionSuppressionStateMonitor _doStop]((uint64_t)self);

  v3.receiver = self;
  v3.super_class = (Class)BWCoreMotionSuppressionStateMonitor;
  -[BWCoreMotionSuppressionStateMonitor dealloc](&v3, sel_dealloc);
}

@end
