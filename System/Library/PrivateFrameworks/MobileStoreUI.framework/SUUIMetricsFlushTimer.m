@implementation SUUIMetricsFlushTimer

- (SUUIMetricsFlushTimer)init
{
  SUUIMetricsFlushTimer *v2;
  uint64_t v3;
  NSHashTable *metricsControllers;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIMetricsFlushTimer;
  v2 = -[SUUIMetricsFlushTimer init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 514, 0);
    metricsControllers = v2->_metricsControllers;
    v2->_metricsControllers = (NSHashTable *)v3;

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationDidEnterBackgroundNotification_, *MEMORY[0x24BEBDF98], 0);
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel__applicationWillEnterForegroundNotification_, *MEMORY[0x24BEBE008], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *timer;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBDF98], 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x24BEBE008], 0);
  timer = self->_timer;
  if (timer)
    dispatch_source_cancel(timer);

  v5.receiver = self;
  v5.super_class = (Class)SUUIMetricsFlushTimer;
  -[SUUIMetricsFlushTimer dealloc](&v5, sel_dealloc);
}

+ (id)sharedTimer
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)sharedTimer_sTimer;
  if (!sharedTimer_sTimer)
  {
    v4 = objc_alloc_init((Class)a1);
    v5 = (void *)sharedTimer_sTimer;
    sharedTimer_sTimer = (uint64_t)v4;

    v3 = (void *)sharedTimer_sTimer;
  }
  return v3;
}

- (void)addMetricsController:(id)a3
{
  -[NSHashTable addObject:](self->_metricsControllers, "addObject:", a3);
  -[SUUIMetricsFlushTimer reloadFlushInterval](self, "reloadFlushInterval");
}

- (void)reloadFlushInterval
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  uint64_t i;
  double v9;
  NSObject *timer;
  dispatch_time_t v11;
  OS_dispatch_source *v12;
  OS_dispatch_source *v13;
  dispatch_time_t v14;
  NSObject *v15;
  dispatch_time_t v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id location;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  if (!-[NSHashTable count](self->_metricsControllers, "count"))
  {
    -[SUUIMetricsFlushTimer _cancelFlushTimer](self, "_cancelFlushTimer");
    return;
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_metricsControllers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (!v4)
  {

LABEL_17:
    -[SUUIMetricsFlushTimer _cancelFlushTimer](self, "_cancelFlushTimer");
    return;
  }
  v5 = v4;
  v6 = *(_QWORD *)v22;
  v7 = 0.0;
  do
  {
    for (i = 0; i != v5; ++i)
    {
      if (*(_QWORD *)v22 != v6)
        objc_enumerationMutation(v3);
      objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * i), "flushInterval");
      if (v7 < 1.0 || v9 < v7)
        v7 = v9;
    }
    v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  }
  while (v5);

  if (v7 < 1.0)
    goto LABEL_17;
  timer = self->_timer;
  if (timer)
  {
    v11 = dispatch_time(self->_timerStartTime, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(timer, v11, 0, 0);
  }
  else
  {
    v12 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x24BDACA18], 0, 0, MEMORY[0x24BDAC9B8]);
    v13 = self->_timer;
    self->_timer = v12;

    v14 = dispatch_walltime(0, 0);
    self->_timerStartTime = v14;
    v15 = self->_timer;
    v16 = dispatch_time(v14, (uint64_t)(v7 * 1000000000.0));
    dispatch_source_set_timer(v15, v16, 0, 0);
    objc_initWeak(&location, self);
    v17 = self->_timer;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __44__SUUIMetricsFlushTimer_reloadFlushInterval__block_invoke;
    v18[3] = &unk_2511F53F8;
    objc_copyWeak(&v19, &location);
    dispatch_source_set_event_handler(v17, v18);
    dispatch_resume((dispatch_object_t)self->_timer);
    objc_destroyWeak(&v19);
    objc_destroyWeak(&location);
  }
}

void __44__SUUIMetricsFlushTimer_reloadFlushInterval__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_performFlush");

}

- (void)removeMetricsController:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSHashTable count](self->_metricsControllers, "count") == 1
    && -[NSHashTable containsObject:](self->_metricsControllers, "containsObject:", v4))
  {
    objc_msgSend(v4, "flushImmediately");
  }
  -[NSHashTable removeObject:](self->_metricsControllers, "removeObject:", v4);
  -[SUUIMetricsFlushTimer reloadFlushInterval](self, "reloadFlushInterval");

}

- (void)_applicationDidEnterBackgroundNotification:(id)a3
{
  id v4;

  -[NSHashTable anyObject](self->_metricsControllers, "anyObject", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "flushImmediately");
  -[SUUIMetricsFlushTimer _cancelFlushTimer](self, "_cancelFlushTimer");

}

- (void)_cancelFlushTimer
{
  NSObject *timer;
  OS_dispatch_source *v4;

  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v4 = self->_timer;
    self->_timer = 0;

  }
}

- (void)_performFlush
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSObject *timer;
  OS_dispatch_source *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = self->_metricsControllers;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (v6)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "closeImpressionsSession", (_QWORD)v12);
          objc_msgSend(v9, "_waitUntilRecordingComplete");
        }
        else
        {
          v6 = v9;
        }
      }
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  objc_msgSend(v6, "flushImmediately");
  timer = self->_timer;
  if (timer)
  {
    dispatch_source_cancel(timer);
    v11 = self->_timer;
    self->_timer = 0;

  }
  -[SUUIMetricsFlushTimer reloadFlushInterval](self, "reloadFlushInterval", (_QWORD)v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_metricsControllers, 0);
}

@end
