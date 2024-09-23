@implementation HMEMemoryEventBus

- (HMEMemoryEventBus)initWithQueue:(id)a3
{
  return -[HMEMemoryEventBus initWithQueue:storeReadHandle:storeWriteHandle:logCategory:](self, "initWithQueue:storeReadHandle:storeWriteHandle:logCategory:", a3, 0, 0, "MemoryEventBus");
}

- (HMEMemoryEventBus)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logCategory:(const char *)a6
{
  id v11;
  id v12;
  id v13;
  HMEMemoryEventBus *v14;
  os_log_t v15;
  OS_os_log *logger;
  HMETopicRouter *v17;
  HMETopicRouter *topicRouter;
  objc_super v20;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v20.receiver = self;
  v20.super_class = (Class)HMEMemoryEventBus;
  v14 = -[HMEMemoryEventBus init](&v20, sel_init);
  if (v14)
  {
    v15 = os_log_create("com.apple.HomeKitEventRouter", a6);
    logger = v14->_logger;
    v14->_logger = (OS_os_log *)v15;

    v17 = -[HMETopicRouter initWithDelegate:logger:]([HMETopicRouter alloc], "initWithDelegate:logger:", v14, v14->_logger);
    topicRouter = v14->_topicRouter;
    v14->_topicRouter = v17;

    objc_storeStrong((id *)&v14->_queue, a3);
    objc_storeStrong((id *)&v14->_eventStoreReadHandle, a4);
    objc_storeStrong((id *)&v14->_eventStoreWriteHandle, a5);
  }

  return v14;
}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD block[5];
  id v20;
  id v21;
  id v22;
  id v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  -[HMEMemoryEventBus queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __104__HMEMemoryEventBus_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
  block[3] = &unk_1E3B31218;
  block[4] = self;
  v20 = v10;
  v21 = v11;
  v22 = v12;
  v23 = v13;
  v15 = v13;
  v16 = v12;
  v17 = v11;
  v18 = v10;
  dispatch_async(v14, block);

}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMEMemoryEventBus queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __62__HMEMemoryEventBus_registerConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E3B31240;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)unregisterConsumer:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HMEMemoryEventBus queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __51__HMEMemoryEventBus_unregisterConsumer_completion___block_invoke;
  block[3] = &unk_1E3B31268;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMEMemoryEventBus queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __64__HMEMemoryEventBus_unregisterConsumer_topicFilters_completion___block_invoke;
  v15[3] = &unk_1E3B31240;
  v15[4] = self;
  v16 = v8;
  v17 = v9;
  v18 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  dispatch_async(v11, v15);

}

- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *, _QWORD);
  NSObject *v14;
  NSObject *logger;
  NSObject *v16;
  void *v17;
  void *v18;
  int v19;
  id v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *, _QWORD))a6;
  -[HMEMemoryEventBus queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v16 = logger;
    v19 = 138412802;
    v20 = v10;
    v21 = 2048;
    v22 = objc_msgSend(v11, "count");
    v23 = 2048;
    v24 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_19B524000, v16, OS_LOG_TYPE_DEFAULT, "Changing registrations for consumer: %@, topicFilterAdditions: %ld, topicFilterRemovals: %ld", (uint8_t *)&v19, 0x20u);

    logger = self->_logger;
  }
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    v19 = 138412802;
    v20 = v10;
    v21 = 2112;
    v22 = (uint64_t)v11;
    v23 = 2112;
    v24 = (uint64_t)v12;
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Changing registrations for consumer: %@, topicFilterAdditions: %@, topicFilterRemovals: %@", (uint8_t *)&v19, 0x20u);
  }
  -[HMEMemoryEventBus topicRouter](self, "topicRouter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", v10, v11, v12);

  if (v13)
  {
    -[HMEMemoryEventBus _cachedEventsForTopics:](self, v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v18, 0);

  }
}

- (void)unregisterConsumerSync:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD);
  NSObject *v8;
  NSObject *logger;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[HMEMemoryEventBus queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Unregistering consumer: %@", (uint8_t *)&v11, 0xCu);
  }
  -[HMEMemoryEventBus topicRouter](self, "topicRouter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "unregisterConsumer:", v6);

  if (v7)
    v7[2](v7, 0);

}

- (void)forwardEvent:(id)a3 topic:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMEMemoryEventBus queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __51__HMEMemoryEventBus_forwardEvent_topic_completion___block_invoke;
  v15[3] = &unk_1E3B31240;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  -[HMEMemoryEventBus forwardEvent:topic:completion:](self, "forwardEvent:topic:completion:", a3, a4, 0);
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  HMEMemoryEventBus *v17;
  id v18;
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[HMEMemoryEventBus queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __56__HMEMemoryEventBus_didReceiveCachedEvent_topic_source___block_invoke;
  v15[3] = &unk_1E3B31290;
  v16 = v10;
  v17 = self;
  v18 = v8;
  v19 = v9;
  v12 = v9;
  v13 = v8;
  v14 = v10;
  dispatch_async(v11, v15);

}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMEMemoryEventBus delegate](self, "delegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "didChangeRegistrationsWithTopicFilterAdditions:removals:", v7, v6);

}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMEMemoryEventBus dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "upstreamTopicsForTopic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (HMEMemoryEventBusDelegate)delegate
{
  return (HMEMemoryEventBusDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMEMemoryEventBusDataSource)dataSource
{
  return (HMEMemoryEventBusDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMETopicRouter)topicRouter
{
  return (HMETopicRouter *)objc_getProperty(self, a2, 32, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 40, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 48, 1);
}

- (HMELastEventStoreWriteHandle)eventStoreWriteHandle
{
  return (HMELastEventStoreWriteHandle *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreWriteHandle, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __56__HMEMemoryEventBus_didReceiveCachedEvent_topic_source___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(a1 + 32), "isCachedEventSourceCurrentProcess") & 1) == 0)
  {
    v2 = *(void **)(a1 + 40);
    v3 = *(void **)(a1 + 56);
    v4 = *(id *)(a1 + 48);
    v5 = v3;
    if (v2)
    {
      objc_msgSend(v2, "queue");
      v6 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v6);

      objc_msgSend(v2, "eventStoreWriteHandle");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v2, "eventStoreWriteHandle");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "writer:saveEventIfDifferent:topic:", v2, v4, v5);

      }
    }

    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "topicRouter", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "consumersForTopic:", *(_QWORD *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v14);
          if (v15)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              objc_msgSend(v15, "didReceiveCachedEvent:topic:source:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 32));
          }
          ++v14;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }

  }
}

uint64_t __51__HMEMemoryEventBus_forwardEvent_topic_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t result;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint64_t v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v27 = v4;
    _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Received event for topic %@", buf, 0xCu);
    v2 = *(_QWORD **)(a1 + 32);
    v3 = v2[1];
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    v19 = *(_QWORD *)(a1 + 40);
    v20 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138412546;
    v27 = v19;
    v28 = 2112;
    v29 = v20;
    _os_log_debug_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEBUG, "Received event for topic %@, event: %@", buf, 0x16u);
    v2 = *(_QWORD **)(a1 + 32);
  }
  v5 = *(void **)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  v7 = v5;
  if (v2)
  {
    objc_msgSend(v2, "queue");
    v8 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v8);

    objc_msgSend(v2, "eventStoreWriteHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v2, "eventStoreWriteHandle");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "writer:saveEventIfAllowed:topic:", v2, v6, v7);

    }
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "topicRouter", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "consumersForTopic:", *(_QWORD *)(a1 + 40));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v17)
          objc_msgSend(v17, "didReceiveEvent:topic:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (id)_cachedEventsForTopics:(void *)a1
{
  id v3;
  void *v4;
  void *v5;

  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "eventStoreReadHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(a1, "eventStoreReadHandle");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventsForTopicFilters:", v3);
      a1 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      a1 = (void *)MEMORY[0x1E0C9AA70];
    }
  }

  return a1;
}

uint64_t __64__HMEMemoryEventBus_unregisterConsumer_topicFilters_completion___block_invoke(_QWORD *a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = (_QWORD *)a1[4];
  v3 = v2[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = a1[5];
    v5 = a1[6];
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Unregistering consumer: %@ from topicFilters: %@", (uint8_t *)&v8, 0x16u);
    v2 = (_QWORD *)a1[4];
  }
  objc_msgSend(v2, "topicRouter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterConsumer:topicFilters:", a1[5], a1[6]);

  return (*(uint64_t (**)(void))(a1[7] + 16))();
}

uint64_t __51__HMEMemoryEventBus_unregisterConsumer_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterConsumerSync:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __62__HMEMemoryEventBus_registerConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  _QWORD *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD **)(a1 + 32);
  v3 = v2[1];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v9 = 138412546;
    v10 = v4;
    v11 = 2112;
    v12 = v5;
    _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Registering consumer: %@ for topicFilters: %@", (uint8_t *)&v9, 0x16u);
    v2 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v2, "topicRouter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "registerConsumer:topicFilters:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v7 = *(_QWORD *)(a1 + 56);
  if (v7)
  {
    -[HMEMemoryEventBus _cachedEventsForTopics:](*(void **)(a1 + 32), *(void **)(a1 + 48));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *, _QWORD))(v7 + 16))(v7, v8, 0);

  }
}

uint64_t __104__HMEMemoryEventBus_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeRegistrationsSyncForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

@end
