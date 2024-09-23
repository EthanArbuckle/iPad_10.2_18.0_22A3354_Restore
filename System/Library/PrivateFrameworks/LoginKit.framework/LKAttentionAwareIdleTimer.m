@implementation LKAttentionAwareIdleTimer

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_0);
  return (id)sharedInstance_sharedInstance;
}

void __43__LKAttentionAwareIdleTimer_sharedInstance__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

}

- (LKAttentionAwareIdleTimer)init
{
  LKAttentionAwareIdleTimer *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *attentionAwarenessClientQueue;
  uint64_t v5;
  NSMutableDictionary *timeoutDelegateMap;
  dispatch_queue_t v7;
  OS_dispatch_queue *queue;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)LKAttentionAwareIdleTimer;
  v2 = -[LKAttentionAwareIdleTimer init](&v10, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create((const char *)objc_msgSend(CFSTR("LKAttentionAwareIdleTimerQueue"), "UTF8String"), 0);
    attentionAwarenessClientQueue = v2->_attentionAwarenessClientQueue;
    v2->_attentionAwarenessClientQueue = (OS_dispatch_queue *)v3;

    v5 = objc_opt_new();
    timeoutDelegateMap = v2->_timeoutDelegateMap;
    v2->_timeoutDelegateMap = (NSMutableDictionary *)v5;

    v7 = dispatch_queue_create("com.apple.LoginUI.LUIAttentionAwareIdleTimer", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v7;

  }
  return v2;
}

- (void)startMonitoringAttentionAwareIdleWithDelegate:(id)a3 timeout:(double)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  LKAttentionAwareIdleTimer *v11;
  double v12;

  v6 = a3;
  -[LKAttentionAwareIdleTimer queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __83__LKAttentionAwareIdleTimer_startMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke;
  block[3] = &unk_24D59ACD8;
  v12 = a4;
  v10 = v6;
  v11 = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __83__LKAttentionAwareIdleTimer_startMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke(uint64_t a1)
{
  LKAttentionAwareIdleTimerClient *v2;
  double v3;
  uint64_t v4;
  void *v5;
  LKAttentionAwareIdleTimerClient *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v2 = [LKAttentionAwareIdleTimerClient alloc];
  v3 = *(double *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "attentionAwarenessClientQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LKAttentionAwareIdleTimerClient initWithClientDelegate:timeout:queue:](v2, "initWithClientDelegate:timeout:queue:", v4, v5, v3);

  objc_msgSend(*(id *)(a1 + 40), "timeoutDelegateMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "timeoutDelegateMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v10, v12);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend(*(id *)(a1 + 40), "timeoutDelegateMap", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v26;
    while (2)
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v26 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v20, "clientDelegate");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(void **)(a1 + 32);

        if (v21 == v22)
        {
          objc_msgSend(v20, "resume");
          goto LABEL_13;
        }
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v17)
        continue;
      break;
    }
  }

  -[LKAttentionAwareIdleTimerClient resume](v6, "resume");
  objc_msgSend(*(id *)(a1 + 40), "timeoutDelegateMap");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "addObject:", v6);

LABEL_13:
}

- (void)stopMonitoringAttentionAwareIdleWithDelegate:(id)a3 timeout:(double)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  double v11;

  v6 = a3;
  -[LKAttentionAwareIdleTimer queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __82__LKAttentionAwareIdleTimer_stopMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke;
  block[3] = &unk_24D59ACD8;
  v11 = a4;
  block[4] = self;
  v10 = v6;
  v8 = v6;
  dispatch_async(v7, block);

}

void __82__LKAttentionAwareIdleTimer_stopMonitoringAttentionAwareIdleWithDelegate_timeout___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*(id *)(a1 + 32), "timeoutDelegateMap");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    objc_msgSend(*(id *)(a1 + 32), "timeoutDelegateMap", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", *(double *)(a1 + 48));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          objc_msgSend(v12, "clientDelegate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = *(void **)(a1 + 40);

          if (v13 == v14)
          {
            objc_msgSend(v12, "pause");
            goto LABEL_12;
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_12:

  }
}

- (LKAttentionAwareIdleTimerDelegate)delegate
{
  return (LKAttentionAwareIdleTimerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AWAttentionAwarenessConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (AWAttentionAwarenessClient)client
{
  return self->_client;
}

- (void)setClient:(id)a3
{
  objc_storeStrong((id *)&self->_client, a3);
}

- (OS_dispatch_queue)attentionAwarenessClientQueue
{
  return self->_attentionAwarenessClientQueue;
}

- (void)setAttentionAwarenessClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, a3);
}

- (NSMutableDictionary)timeoutDelegateMap
{
  return self->_timeoutDelegateMap;
}

- (void)setTimeoutDelegateMap:(id)a3
{
  objc_storeStrong((id *)&self->_timeoutDelegateMap, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_timeoutDelegateMap, 0);
  objc_storeStrong((id *)&self->_attentionAwarenessClientQueue, 0);
  objc_storeStrong((id *)&self->_client, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
