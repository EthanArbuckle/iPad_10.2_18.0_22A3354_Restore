@implementation BWIOSurfacePoller

+ (void)trackSurface:(__IOSurface *)a3 useCountIsZeroHandler:(id)a4
{
  uint64_t v6;

  v6 = +[BWIOSurfacePoller defaultPoller]();
  -[BWIOSurfacePoller trackSurface:useCountIsZeroHandler:](v6, (uint64_t)a3, (uint64_t)a4);
}

+ (uint64_t)defaultPoller
{
  objc_opt_self();
  if (defaultPoller_sOnceToken != -1)
    dispatch_once(&defaultPoller_sOnceToken, &__block_literal_global_111);
  return defaultPoller_sDefaultPoller;
}

- (void)trackSurface:(uint64_t)a3 useCountIsZeroHandler:
{
  uint64_t v4;
  BWTrackedSurface *v5;

  if (a1)
  {
    v5 = -[BWTrackedSurface initWithSurface:handler:]([BWTrackedSurface alloc], "initWithSurface:handler:", a2, a3);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 16));
    v4 = objc_msgSend(*(id *)(a1 + 24), "count");
    objc_msgSend(*(id *)(a1 + 24), "addObject:", v5);
    if (!v4)
      -[BWIOSurfacePoller _startPolling](a1);
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 16));

  }
}

BWIOSurfacePoller *__34__BWIOSurfacePoller_defaultPoller__block_invoke()
{
  BWIOSurfacePoller *result;

  result = objc_alloc_init(BWIOSurfacePoller);
  defaultPoller_sDefaultPoller = (uint64_t)result;
  return result;
}

- (BWIOSurfacePoller)init
{
  BWIOSurfacePoller *v2;
  BWIOSurfacePoller *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BWIOSurfacePoller;
  v2 = -[BWIOSurfacePoller init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_trackedSurfacesLock._os_unfair_lock_opaque = 0;
    v2->_trackedSurfaces = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BWIOSurfacePoller;
  -[BWIOSurfacePoller dealloc](&v3, sel_dealloc);
}

- (void)_startPolling
{
  NSObject *v2;
  NSObject *v3;
  dispatch_time_t v4;
  _QWORD handler[5];

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 8))
    {
      v2 = FigDispatchQueueCreateWithPriority();
      v3 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 1uLL, v2);

      v4 = dispatch_time(0, 7500000);
      dispatch_source_set_timer(v3, v4, 0x7270E0uLL, 0xB71AFuLL);
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 3221225472;
      handler[2] = __34__BWIOSurfacePoller__startPolling__block_invoke;
      handler[3] = &unk_1E491E720;
      handler[4] = a1;
      dispatch_source_set_event_handler(v3, handler);
      *(_QWORD *)(a1 + 8) = v3;
      dispatch_activate(v3);
    }
  }
}

os_unfair_lock_s *__34__BWIOSurfacePoller__startPolling__block_invoke(uint64_t a1)
{
  return -[BWIOSurfacePoller _pollingTimerFired](*(os_unfair_lock_s **)(a1 + 32));
}

- (os_unfair_lock_s)_pollingTimerFired
{
  uint64_t v1;
  os_unfair_lock_s *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  os_unfair_lock_s *v11;
  uint64_t v12;
  os_unfair_lock_s *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (uint64_t)result;
    v2 = result + 4;
    os_unfair_lock_lock(result + 4);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v3 = *(void **)(v1 + 24);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (!v4)
      goto LABEL_16;
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v3);
        if (!IOSurfaceIsInUse((IOSurfaceRef)objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * i), "surface")))
        {
          if (!v7)
            v7 = (void *)objc_msgSend(MEMORY[0x1E0CB3788], "indexSet");
          objc_msgSend(v7, "addIndex:", v6 + i);
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      v6 += i;
    }
    while (v5);
    if (v7)
    {
      v10 = (void *)objc_msgSend(*(id *)(v1 + 24), "objectsAtIndexes:", v7);
      objc_msgSend(*(id *)(v1 + 24), "removeObjectsAtIndexes:", v7);
      if (!objc_msgSend(*(id *)(v1 + 24), "count"))
        -[BWIOSurfacePoller _stopPolling](v1);
    }
    else
    {
LABEL_16:
      v10 = 0;
    }
    os_unfair_lock_unlock(v2);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    result = (os_unfair_lock_s *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    if (result)
    {
      v11 = result;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v10);
          (*(void (**)(void))(objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "handler") + 16))();
          v13 = (os_unfair_lock_s *)((char *)v13 + 1);
        }
        while (v11 != v13);
        result = (os_unfair_lock_s *)objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
        v11 = result;
      }
      while (result);
    }
  }
  return result;
}

- (void)_stopPolling
{
  NSObject *v2;

  if (a1)
  {
    v2 = *(NSObject **)(a1 + 8);
    if (v2)
    {
      dispatch_source_cancel(v2);

      *(_QWORD *)(a1 + 8) = 0;
    }
  }
}

@end
