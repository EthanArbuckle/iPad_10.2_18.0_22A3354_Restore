@implementation CMIMetalEventSynchronizer

+ (id)getSharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__CMIMetalEventSynchronizer_getSharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (getSharedInstance_onceToken != -1)
    dispatch_once(&getSharedInstance_onceToken, block);
  return (id)getSharedInstance_sharedInstance;
}

void __46__CMIMetalEventSynchronizer_getSharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc((Class)objc_opt_class()), "_init");
  v1 = (void *)getSharedInstance_sharedInstance;
  getSharedInstance_sharedInstance = v0;

}

- (id)_init
{
  CMIMetalEventSynchronizer *v2;
  uint64_t v3;
  NSMapTable *events;
  uint64_t v5;
  NSMapTable *signals;
  CMIMetalEventSynchronizer *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CMIMetalEventSynchronizer;
  v2 = -[CMIMetalEventSynchronizer init](&v9, sel_init);
  if (!v2)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  events = v2->_events;
  v2->_events = (NSMapTable *)v3;

  if (!v2->_events)
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 517, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  signals = v2->_signals;
  v2->_signals = (NSMapTable *)v5;

  if (v2->_signals)
  {
    atomic_store(1uLL, &v2->_currentSignal);
    v7 = v2;
  }
  else
  {
LABEL_6:
    fig_log_get_emitter();
    FigDebugAssert3();
    v7 = 0;
  }

  return v7;
}

- (void)signalEventOnCommandBuffer:(id)a3 forResource:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  cmimes_resourceId(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CMIMetalEventSynchronizer _signalEventOnCommandBuffer:forKey:]((id *)&self->super.isa, v6, v7);

}

- (void)_signalEventOnCommandBuffer:(void *)a3 forKey:
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  unint64_t *v14;
  void *v15;
  id v16;
  id v17;
  EventAndSignal *v18;
  _QWORD v19[4];
  id v20;
  id v21[2];
  id location;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_initWeak(&location, a1);
    v7 = a1[2];
    objc_sync_enter(v7);
    v8 = a1[2];
    objc_msgSend(v5, "commandQueue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(v5, "device");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v11, "newEvent");

      v12 = a1[2];
      objc_msgSend(v5, "commandQueue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", v10, v13);

    }
    objc_sync_exit(v7);

    v14 = (unint64_t *)(a1 + 3);
    do
      v15 = (void *)__ldaxr(v14);
    while (__stlxr((unint64_t)v15 + 1, v14));
    objc_msgSend(v5, "encodeSignalEvent:value:", v10, v15);
    v16 = a1[1];
    objc_sync_enter(v16);
    v17 = a1[1];
    v18 = -[EventAndSignal initWithEvent:andSignal:]([EventAndSignal alloc], "initWithEvent:andSignal:", v10, v15);
    objc_msgSend(v17, "setObject:forKey:", v18, v6);

    objc_sync_exit(v16);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __64__CMIMetalEventSynchronizer__signalEventOnCommandBuffer_forKey___block_invoke;
    v19[3] = &unk_1E94EAFD8;
    objc_copyWeak(v21, &location);
    v20 = v6;
    v21[1] = v15;
    objc_msgSend(v5, "addScheduledHandler:", v19);

    objc_destroyWeak(v21);
    objc_destroyWeak(&location);
  }

}

void __64__CMIMetalEventSynchronizer__signalEventOnCommandBuffer_forKey___block_invoke(uint64_t a1, void *a2)
{
  id *WeakRetained;
  id *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    v5 = WeakRetained[1];
    objc_sync_enter(v5);
    objc_msgSend(v4[1], "objectForKey:", *(_QWORD *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "signal");
    v8 = *(_QWORD *)(a1 + 48);

    if (v7 == v8)
      objc_msgSend(v4[1], "removeObjectForKey:", *(_QWORD *)(a1 + 32));
    objc_sync_exit(v5);

  }
}

- (void)waitForEventOnCommandBuffer:(id)a3 forResource:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  cmimes_resourceId(a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[CMIMetalEventSynchronizer _waitForEventOnCommandBuffer:forKey:]((uint64_t)self, v6, v7);

}

- (void)_waitForEventOnCommandBuffer:(void *)a3 forKey:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  v5 = a3;
  if (a1)
  {
    v6 = *(id *)(a1 + 8);
    objc_sync_enter(v6);
    objc_msgSend(*(id *)(a1 + 8), "objectForKey:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      objc_msgSend(v7, "event");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "encodeWaitForEvent:value:", v9, objc_msgSend(v8, "signal"));

    }
    objc_sync_exit(v6);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_events, 0);
  objc_storeStrong((id *)&self->_signals, 0);
}

@end
