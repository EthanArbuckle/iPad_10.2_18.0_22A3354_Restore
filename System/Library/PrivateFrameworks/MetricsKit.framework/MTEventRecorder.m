@implementation MTEventRecorder

id __76__MTEventRecorder__compositePromiseWithPromises_resolvingResultFromPromise___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (void)setDelegate:(id)a3
{
  MTEventRecorderDelegate **p_delegate;
  id v5;
  char isKindOfClass;
  void *v7;
  id WeakRetained;
  id v9;

  p_delegate = &self->_delegate;
  v9 = a3;
  v5 = objc_storeWeak((id *)p_delegate, v9);
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    -[MTObject metricsKit](self, "metricsKit");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)p_delegate);
    objc_msgSend(WeakRetained, "setMetricsKit:", v7);

  }
}

- (id)recordEvent:(id)a3 shouldSkipValidation:(BOOL)a4
{
  void *v6;
  MTFinalValidationFilter *v7;
  void *v8;
  MTFinalValidationFilter *v9;
  uint64_t v10;
  void *v11;
  _QWORD v13[5];

  +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a4)
  {
    v7 = [MTFinalValidationFilter alloc];
    -[MTObject metricsKit](self, "metricsKit");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MTObject initWithMetricsKit:](v7, "initWithMetricsKit:", v8);

    -[MTFinalValidationFilter apply:](v9, "apply:", v6);
    v10 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v10;
  }
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke;
  v13[3] = &unk_24C7A03D0;
  v13[4] = self;
  objc_msgSend(v6, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  uint64_t v16;
  id v17;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_recordEvent:usingRecorder:", v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "eventListeners");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke_2;
  v15 = &unk_24C7A0858;
  v16 = *(_QWORD *)(a1 + 32);
  v17 = v3;
  v8 = v3;
  objc_msgSend(v7, "mt_map:", &v12);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEventRecorder _compositePromiseWithPromises:resolvingResultFromPromise:](MTEventRecorder, "_compositePromiseWithPromises:resolvingResultFromPromise:", v9, v6, v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)flushUnreportedEvents
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[5];

  -[MTEventRecorder delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventRecorder _flushUnreportedEventsUsingRecorder:](self, "_flushUnreportedEventsUsingRecorder:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTEventRecorder eventListeners](self, "eventListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __40__MTEventRecorder_flushUnreportedEvents__block_invoke;
  v9[3] = &unk_24C7A0808;
  v9[4] = self;
  objc_msgSend(v5, "mt_map:", v9);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEventRecorder _compositePromiseWithPromises:resolvingResultFromPromise:](MTEventRecorder, "_compositePromiseWithPromises:resolvingResultFromPromise:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (NSMutableArray)eventListeners
{
  NSMutableArray *eventListeners;
  NSMutableArray *v4;
  NSMutableArray *v5;

  eventListeners = self->_eventListeners;
  if (!eventListeners)
  {
    v4 = (NSMutableArray *)objc_opt_new();
    v5 = self->_eventListeners;
    self->_eventListeners = v4;

    eventListeners = self->_eventListeners;
  }
  return eventListeners;
}

- (MTEventRecorderDelegate)delegate
{
  return (MTEventRecorderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

+ (id)_compositePromiseWithPromises:(id)a3 resolvingResultFromPromise:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  v15[0] = v5;
  v15[1] = a3;
  v6 = (void *)MEMORY[0x24BDBCE30];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", v15, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTPromise promiseWithComposition:](MTPromise, "promiseWithComposition:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __76__MTEventRecorder__compositePromiseWithPromises_resolvingResultFromPromise___block_invoke;
  v13[3] = &unk_24C7A03D0;
  v14 = v5;
  v10 = v5;
  objc_msgSend(v9, "thenWithBlock:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_recordEvent:(id)a3 toTopic:(id)a4 usingRecorder:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0 && !objc_msgSend(v9, "shouldRecordEvent:", v7))
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", v16);
      v17 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      +[MTEventRecorder _metricsDataApplyingAllowlisting:usingRecorder:](MTEventRecorder, "_metricsDataApplyingAllowlisting:usingRecorder:", v7, v9);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "recordEvent:toTopic:", v16, v8);
      v17 = objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    MTConfigurationError(101, CFSTR("Required method 'recordEvent:toTopic' is not implemented on recorder '%@'"), v10, v11, v12, v13, v14, v15, (uint64_t)v9);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v16);
    v17 = objc_claimAutoreleasedReturnValue();
  }
  v18 = (void *)v17;

  return v18;
}

- (id)_recordEvent:(id)a3 usingRecorder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;

  v6 = a3;
  v7 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && (objc_msgSend(v7, "shouldRecordEvent:", v6) & 1) == 0)
  {
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", &unk_24C7B8220);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[MTEventRecorder _metricsDataApplyingAllowlisting:usingRecorder:](MTEventRecorder, "_metricsDataApplyingAllowlisting:usingRecorder:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "recordEvent:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[MTObject metricsKit](self, "metricsKit");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "topic");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTEventRecorder _recordEvent:toTopic:usingRecorder:](self, "_recordEvent:toTopic:usingRecorder:", v8, v11, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

    }
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __46__MTEventRecorder__recordEvent_usingRecorder___block_invoke;
    v14[3] = &unk_24C7A02E0;
    v15 = v6;
    objc_msgSend(v9, "catchWithBlock:", v14);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

+ (id)_metricsDataApplyingAllowlisting:(id)a3 usingRecorder:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_2549D62A0) & 1) != 0)
  {
    v7 = v6;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v7, "allowlistedFields");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "mt_removingKeys:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v9 = v5;
    }

  }
  else
  {
    v9 = v5;
  }

  return v9;
}

- (MTEventRecorder)init
{
  MTEventRecorder *v2;
  MTEventRecorder *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTEventRecorder;
  v2 = -[MTEventRecorder init](&v5, sel_init);
  v3 = v2;
  if (v2)
    -[MTEventRecorder maybeSubscribeToFlushNotification](v2, "maybeSubscribeToFlushNotification");
  return v3;
}

- (MTEventRecorder)initWithMetricsKit:(id)a3
{
  MTEventRecorder *v3;
  MTEventRecorder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTEventRecorder;
  v3 = -[MTObject initWithMetricsKit:](&v6, sel_initWithMetricsKit_, a3);
  v4 = v3;
  if (v3)
    -[MTEventRecorder maybeSubscribeToFlushNotification](v3, "maybeSubscribeToFlushNotification");
  return v4;
}

- (void)maybeSubscribeToFlushNotification
{
  void *v3;
  int v4;
  __CFNotificationCenter *DarwinNotifyCenter;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)_MTHandleFlushNotification, CFSTR("MTEventRecorderFlushNotification"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (id)_flushUnreportedEventsUsingRecorder:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "flushUnreportedEvents");
  else
    +[MTPromise promiseWithResult:](MTPromise, "promiseWithResult:", &unk_24C7B8220);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventListeners, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)dealloc
{
  void *v3;
  int v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v6;

  +[MTFrameworkEnvironment sharedEnvironment](MTFrameworkEnvironment, "sharedEnvironment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInternalBuild");

  if (v4)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  }
  v6.receiver = self;
  v6.super_class = (Class)MTEventRecorder;
  -[MTEventRecorder dealloc](&v6, sel_dealloc);
}

- (void)addEventListener:(id)a3
{
  MTEventRecorder *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MTObject metricsKit](v4, "metricsKit");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMetricsKit:", v5);

  }
  -[MTEventRecorder eventListeners](v4, "eventListeners");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  objc_sync_exit(v4);
}

- (void)removeEventListener:(id)a3
{
  MTEventRecorder *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  -[MTEventRecorder eventListeners](v4, "eventListeners");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObject:", v6);

  objc_sync_exit(v4);
}

uint64_t __40__MTEventRecorder_flushUnreportedEvents__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_flushUnreportedEventsUsingRecorder:", a2);
}

- (id)sendMethod
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  -[MTEventRecorder delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) != 0)
  {
    -[MTEventRecorder delegate](self, "delegate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sendMethod");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = MTUndelegatedMethodError((uint64_t)"-[MTEventRecorder sendMethod]", v5, v6, v7, v8, v9, v10, v11);
    v13 = 0;
  }
  return v13;
}

- (id)recordEvent:(id)a3
{
  return -[MTEventRecorder recordEvent:shouldSkipValidation:](self, "recordEvent:shouldSkipValidation:", a3, 0);
}

- (id)recordEvent:(id)a3 toTopic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  id v18;

  v6 = a3;
  v7 = a4;
  -[MTEventRecorder delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTEventRecorder _recordEvent:toTopic:usingRecorder:](self, "_recordEvent:toTopic:usingRecorder:", v6, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[MTEventRecorder eventListeners](self, "eventListeners");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = __39__MTEventRecorder_recordEvent_toTopic___block_invoke;
  v16[3] = &unk_24C7A0830;
  v16[4] = self;
  v17 = v6;
  v18 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "mt_map:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTEventRecorder _compositePromiseWithPromises:resolvingResultFromPromise:](MTEventRecorder, "_compositePromiseWithPromises:resolvingResultFromPromise:", v13, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t __39__MTEventRecorder_recordEvent_toTopic___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recordEvent:toTopic:usingRecorder:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2);
}

uint64_t __52__MTEventRecorder_recordEvent_shouldSkipValidation___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_recordEvent:usingRecorder:", *(_QWORD *)(a1 + 40), a2);
}

id __46__MTEventRecorder__recordEvent_usingRecorder___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x24BDAC8D0];
  v3 = *MEMORY[0x24BDD0FC8];
  v13[0] = CFSTR("The event recorder failed to record the metrics data.");
  v4 = *MEMORY[0x24BDD0FD8];
  v12[0] = v3;
  v12[1] = v4;
  v5 = a2;
  objc_msgSend(v5, "localizedDescription");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = CFSTR("MetricsData");
  v7 = *(_QWORD *)(a1 + 32);
  v13[1] = v6;
  v13[2] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  MTWrappedError(v5, 500, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTPromise promiseWithError:](MTPromise, "promiseWithError:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)setEventListeners:(id)a3
{
  objc_storeStrong((id *)&self->_eventListeners, a3);
}

- (BOOL)monitorsLifecycleEvents
{
  void *v3;
  void *v4;
  char v5;

  -[MTEventRecorder _amsDelegate](self, "_amsDelegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[MTEventRecorder _amsDelegate](self, "_amsDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "monitorsLifecycleEvents");

  }
  else
  {
    v5 = 1;
  }

  return v5;
}

- (void)setMonitorsLifecycleEvents:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[MTEventRecorder _amsDelegate](self, "_amsDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[MTEventRecorder _amsDelegate](self, "_amsDelegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setMonitorsLifecycleEvents:", v3);

  }
}

- (id)_amsDelegate
{
  void *v2;
  id v3;

  -[MTEventRecorder delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;

  return v3;
}

@end
