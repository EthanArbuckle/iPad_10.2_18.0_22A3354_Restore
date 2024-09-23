@implementation CAMTimerCache

- (CAMTimerCache)init
{
  CAMTimerCache *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *timersByType;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CAMTimerCache;
  v2 = -[CAMTimerCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    timersByType = v2->__timersByType;
    v2->__timersByType = v3;

  }
  return v2;
}

- (void)startTimerForKey:(id)a3 duration:(double)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  dispatch_source_t v10;
  double v11;
  dispatch_time_t v12;
  _QWORD v13[4];
  NSObject *v14;
  id v15;
  id v16;
  id location;

  v6 = a3;
  -[CAMTimerCache _timersByType](self, "_timersByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    dispatch_suspend(v8);
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, MEMORY[0x1E0C80D38]);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __43__CAMTimerCache_startTimerForKey_duration___block_invoke;
    v13[3] = &unk_1EA32BE18;
    objc_copyWeak(&v16, &location);
    v9 = v10;
    v14 = v9;
    v15 = v6;
    dispatch_source_set_event_handler(v9, v13);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);
  }
  v11 = a4 * 1000000000.0;
  v12 = dispatch_time(0, (uint64_t)v11);
  dispatch_source_set_timer(v9, v12, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)((double)(uint64_t)v11 * 0.1));
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, v6);
  dispatch_resume(v9);

}

void __43__CAMTimerCache_startTimerForKey_duration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleTimer:forKey:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_handleTimer:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  dispatch_source_t v8;
  NSObject *v9;
  void *v10;
  dispatch_source_t source;

  source = (dispatch_source_t)a3;
  v6 = a4;
  -[CAMTimerCache _timersByType](self, "_timersByType");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v6);
  v8 = (dispatch_source_t)objc_claimAutoreleasedReturnValue();

  v9 = source;
  if (v8 == source)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, v6);
    -[CAMTimerCache delegate](self, "delegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "timerCache:timerDidFireForKey:", self, v6);

    v9 = source;
  }
  dispatch_source_cancel(v9);

}

- (void)cancelTimerForKey:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;

  v7 = a3;
  -[CAMTimerCache _timersByType](self, "_timersByType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v7);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    dispatch_source_cancel(v5);
    objc_msgSend(v4, "setObject:forKeyedSubscript:", 0, v7);
  }

}

- (void)cancelAllTimers
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[CAMTimerCache _timersByType](self, "_timersByType");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v2, "allValues", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        dispatch_source_cancel(*(dispatch_source_t *)(*((_QWORD *)&v8 + 1) + 8 * v7++));
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

  objc_msgSend(v2, "removeAllObjects");
}

- (BOOL)isRunningTimerForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[CAMTimerCache _timersByType](self, "_timersByType");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6 != 0;
}

- (CAMTimerCacheDelegate)delegate
{
  return (CAMTimerCacheDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSMutableDictionary)_timersByType
{
  return self->__timersByType;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__timersByType, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
