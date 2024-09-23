@implementation AXRedirectedEventDetector

- (AXRedirectedEventDetector)init
{
  AXRedirectedEventDetector *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  NSMutableArray *v5;
  NSMutableArray *recentEvents;
  uint64_t v7;
  AXDispatchTimer *flushEventsTimer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)AXRedirectedEventDetector;
  v2 = -[AXRedirectedEventDetector init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("AXRedirectedEventDetector", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    recentEvents = v2->_recentEvents;
    v2->_recentEvents = v5;

    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CF3978]), "initWithTargetSerialQueue:", v2->_queue);
    flushEventsTimer = v2->_flushEventsTimer;
    v2->_flushEventsTimer = (AXDispatchTimer *)v7;

    -[AXDispatchTimer setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:](v2->_flushEventsTimer, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
  }
  return v2;
}

- (void)_flushEventsIfNecessary
{
  void *v2;

  if (AXNeedsEventFlush == 1)
  {
    -[AXRedirectedEventDetector recentEvents](self, "recentEvents");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "removeAllObjects");

    AXNeedsEventFlush = 0;
  }
}

- (void)addEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  if (v4)
  {
    queue = self->_queue;
    block[1] = 3221225472;
    block[2] = __38__AXRedirectedEventDetector_addEvent___block_invoke;
    block[3] = &unk_1E24C5200;
    block[4] = self;
    v6 = v4;
    block[0] = MEMORY[0x1E0C809B0];
    v8 = v4;
    dispatch_sync(queue, block);

    v4 = v6;
  }

}

void __38__AXRedirectedEventDetector_addEvent___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  _QWORD v5[4];
  id v6;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "_flushEventsIfNecessary");
  objc_msgSend(*(id *)(a1 + 32), "recentEvents");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "flushEventsTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(double *)&AXFlushEventsTimerDelay;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __38__AXRedirectedEventDetector_addEvent___block_invoke_2;
  v5[3] = &unk_1E24C58C0;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "afterDelay:processBlock:cancelBlock:", v5, 0, v4);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __38__AXRedirectedEventDetector_addEvent___block_invoke_2(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "recentEvents");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeAllObjects");

}

- (BOOL)isRedirectedEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  BOOL v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __47__AXRedirectedEventDetector_isRedirectedEvent___block_invoke;
    block[3] = &unk_1E24C58E8;
    block[4] = self;
    v10 = v4;
    v11 = &v12;
    dispatch_sync(queue, block);
    v7 = *((_BYTE *)v13 + 24) != 0;

    _Block_object_dispose(&v12, 8);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __47__AXRedirectedEventDetector_isRedirectedEvent___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  double v11;
  double v12;
  void *v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "_flushEventsIfNecessary");
  v2 = objc_msgSend(*(id *)(a1 + 40), "type");
  objc_msgSend(*(id *)(a1 + 40), "clientId");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(*(id *)(a1 + 40), "HIDTime");
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "recentEvents", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "_elapsedTimeFrom:to:", objc_msgSend(v10, "HIDTime"), v4);
        v12 = v11;
        if (objc_msgSend(v10, "type") == v2)
        {
          objc_msgSend(v10, "clientId");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "isEqualToString:", v3);

          if ((v14 & 1) == 0 && v12 < 0.5)
          {
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
            goto LABEL_13;
          }
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (double)_elapsedTimeFrom:(unint64_t)a3 to:(unint64_t)a4
{
  unsigned int v6;

  v6 = dword_1EE0455C8;
  if (!dword_1EE0455C8)
  {
    mach_timebase_info((mach_timebase_info_t)&_elapsedTimeFrom_to___TimebaseInfo);
    v6 = dword_1EE0455C8;
  }
  return (double)((a4 - a3) * _elapsedTimeFrom_to___TimebaseInfo / v6) / 1000000000.0;
}

- (NSMutableArray)recentEvents
{
  return self->_recentEvents;
}

- (void)setRecentEvents:(id)a3
{
  objc_storeStrong((id *)&self->_recentEvents, a3);
}

- (AXDispatchTimer)flushEventsTimer
{
  return self->_flushEventsTimer;
}

- (void)setFlushEventsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_flushEventsTimer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_flushEventsTimer, 0);
  objc_storeStrong((id *)&self->_recentEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

+ (void)flushEvents
{
  AXNeedsEventFlush = 1;
}

+ (void)setFlushEventsTimerDelay:(double)a3
{
  AXFlushEventsTimerDelay = *(_QWORD *)&a3;
}

@end
