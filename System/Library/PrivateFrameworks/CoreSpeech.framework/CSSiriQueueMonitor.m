@implementation CSSiriQueueMonitor

- (CSSiriQueueMonitor)init
{
  CSSiriQueueMonitor *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  NSMutableDictionary *v6;
  NSMutableDictionary *observersByIdentifier;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSSiriQueueMonitor;
  v2 = -[CSSiriQueueMonitor init](&v9, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_DEFAULT, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.assistant.queue-monitor", v3);

    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v4;

    v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    observersByIdentifier = v2->_observersByIdentifier;
    v2->_observersByIdentifier = v6;

  }
  return v2;
}

- (void)addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  id v10;
  id v11;
  NSObject *queue;
  id v13;
  id v14;
  _QWORD block[5];
  id v16;
  id v17;
  double v18;
  double v19;

  v10 = a3;
  v11 = a6;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__CSSiriQueueMonitor_addQueue_heartBeatInterval_timeoutInterval_timeoutHandler___block_invoke;
  block[3] = &unk_1E7C27198;
  block[4] = self;
  v16 = v10;
  v18 = a4;
  v19 = a5;
  v17 = v11;
  v13 = v11;
  v14 = v10;
  dispatch_async(queue, block);

}

- (void)removeQueue:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __34__CSSiriQueueMonitor_removeQueue___block_invoke;
  v7[3] = &unk_1E7C292A0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)beginMonitoring
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSiriQueueMonitor beginMonitoring]";
    _os_log_debug_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __37__CSSiriQueueMonitor_beginMonitoring__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)endMonitoring
{
  NSObject *v3;
  NSObject *queue;
  _QWORD block[5];
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *MEMORY[0x1E0CFE6A8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v7 = "-[CSSiriQueueMonitor endMonitoring]";
    _os_log_debug_impl(&dword_1C2614000, v3, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
  }
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __35__CSSiriQueueMonitor_endMonitoring__block_invoke;
  block[3] = &unk_1E7C292C8;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)_addQueue:(id)a3 heartBeatInterval:(double)a4 timeoutInterval:(double)a5 timeoutHandler:(id)a6
{
  NSObject *v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  _CSSiriQueueObserver *v16;
  int v17;
  const char *v18;
  __int16 v19;
  NSObject *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = (objc_class *)MEMORY[0x1E0CB3940];
  v12 = a6;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithUTF8String:", dispatch_queue_get_label(v10));
  -[NSMutableDictionary objectForKey:](self->_observersByIdentifier, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v15 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_ERROR))
    {
      v17 = 136315394;
      v18 = "-[CSSiriQueueMonitor _addQueue:heartBeatInterval:timeoutInterval:timeoutHandler:]";
      v19 = 2112;
      v20 = v10;
      _os_log_error_impl(&dword_1C2614000, v15, OS_LOG_TYPE_ERROR, "%s Queue %@ is already being observed.", (uint8_t *)&v17, 0x16u);
    }
  }
  -[CSSiriQueueMonitor _removeQueue:](self, "_removeQueue:", v10);
  v16 = -[_CSSiriQueueObserver initWithQueue:heartBeatInterval:timeoutInterval:timeoutHandler:]([_CSSiriQueueObserver alloc], "initWithQueue:heartBeatInterval:timeoutInterval:timeoutHandler:", v10, v12, a4, a5);

  -[NSMutableDictionary setObject:forKey:](self->_observersByIdentifier, "setObject:forKey:", v16, v13);
  if (self->_numberOfTransactions >= 1)
    -[_CSSiriQueueObserver startWithQueue:](v16, "startWithQueue:", self->_queue);

}

- (void)_removeQueue:(id)a3
{
  objc_class *v4;
  NSObject *v5;
  id v6;
  const char *label;
  void *v8;
  id v9;

  v4 = (objc_class *)MEMORY[0x1E0CB3940];
  v5 = a3;
  v6 = [v4 alloc];
  label = dispatch_queue_get_label(v5);

  v9 = (id)objc_msgSend(v6, "initWithUTF8String:", label);
  -[NSMutableDictionary objectForKey:](self->_observersByIdentifier, "objectForKey:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_observersByIdentifier, "removeObjectForKey:", v9);
    objc_msgSend(v8, "stop");
  }

}

- (void)_beginMonitoring
{
  int64_t numberOfTransactions;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  numberOfTransactions = self->_numberOfTransactions;
  if (!numberOfTransactions)
  {
    v4 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSSiriQueueMonitor _beginMonitoring]";
      _os_log_debug_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary allValues](self->_observersByIdentifier, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "startWithQueue:", self->_queue);
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    numberOfTransactions = self->_numberOfTransactions;
  }
  self->_numberOfTransactions = numberOfTransactions + 1;
}

- (void)_endMonitoring
{
  int64_t numberOfTransactions;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t v14[128];
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  numberOfTransactions = self->_numberOfTransactions;
  if (numberOfTransactions == 1)
  {
    v4 = *MEMORY[0x1E0CFE6A8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x1E0CFE6A8], OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSSiriQueueMonitor _endMonitoring]";
      _os_log_debug_impl(&dword_1C2614000, v4, OS_LOG_TYPE_DEBUG, "%s ", buf, 0xCu);
    }
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    -[NSMutableDictionary allValues](self->_observersByIdentifier, "allValues", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v11 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "stop");
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v7);
    }

    numberOfTransactions = self->_numberOfTransactions;
  }
  self->_numberOfTransactions = numberOfTransactions - 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observersByIdentifier, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __35__CSSiriQueueMonitor_endMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_endMonitoring");
}

uint64_t __37__CSSiriQueueMonitor_beginMonitoring__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_beginMonitoring");
}

uint64_t __34__CSSiriQueueMonitor_removeQueue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeQueue:", *(_QWORD *)(a1 + 40));
}

uint64_t __80__CSSiriQueueMonitor_addQueue_heartBeatInterval_timeoutInterval_timeoutHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addQueue:heartBeatInterval:timeoutInterval:timeoutHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

+ (id)sharedMonitor
{
  if (sharedMonitor_onceToken_19371 != -1)
    dispatch_once(&sharedMonitor_onceToken_19371, &__block_literal_global_19372);
  return (id)sharedMonitor_sharedMonitor_19373;
}

void __35__CSSiriQueueMonitor_sharedMonitor__block_invoke()
{
  CSSiriQueueMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(CSSiriQueueMonitor);
  v1 = (void *)sharedMonitor_sharedMonitor_19373;
  sharedMonitor_sharedMonitor_19373 = (uint64_t)v0;

}

@end
