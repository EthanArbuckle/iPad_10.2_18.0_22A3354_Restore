@implementation HMEPersistentConnectionServer

- (HMEPersistentConnectionServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5
{
  return -[HMEPersistentConnectionServer initWithQueue:provider:registrationEventRouter:storeReadHandle:logCategory:](self, "initWithQueue:provider:registrationEventRouter:storeReadHandle:logCategory:", a3, a4, a5, 0, "HMERouterServer");
}

- (HMEPersistentConnectionServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logCategory:(const char *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  os_log_t v16;
  HMEPersistentConnectionServer *v17;
  objc_super v19;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = os_log_create("com.apple.HomeKitEventRouter", a7);
  v19.receiver = self;
  v19.super_class = (Class)HMEPersistentConnectionServer;
  v17 = -[HMERouterServer initWithQueue:provider:registrationEventRouter:storeReadHandle:logger:](&v19, sel_initWithQueue_provider_registrationEventRouter_storeReadHandle_logger_, v15, v14, v13, v12, v16);

  if (v17)
    objc_storeStrong((id *)&v17->_logger, v16);

  return v17;
}

- (void)handleEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  HMEEventInfo *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  HMEEventInfo *v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMERouterServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  v9 = -[HMEEventInfo initWithEvent:topic:]([HMEEventInfo alloc], "initWithEvent:topic:", v6, v7);
  -[HMERouterServer topicRouter](self, "topicRouter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "consumersForTopic:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMEPersistentConnectionServer delegate](self, "delegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17);
        if (v18
          && objc_msgSend(v12, "shouldAllowEvent:topic:connection:", v6, v7, *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17), (_QWORD)v20))
        {
          v24 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "sendUpdatedEvents:toConnection:", v19, v18);

        }
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v15);
  }

}

- (void)handleCachedEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  void *v8;
  HMEEventInfo *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  HMEEventInfo *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[HMEPersistentConnectionServer delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[HMEEventInfo initWithEvent:topic:]([HMEEventInfo alloc], "initWithEvent:topic:", v6, v7);
  -[HMERouterServer topicRouter](self, "topicRouter");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "consumersForTopic:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v12 = v11;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v12);
        v17 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16);
        if (v17
          && objc_msgSend(v8, "shouldAllowEvent:topic:connection:", v6, v7, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v16), (_QWORD)v19))
        {
          v23 = v9;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v23, 1);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "sendUpdatedCachedEvents:toConnection:", v18, v17);

        }
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v14);
  }

}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMEPersistentConnectionServer dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "server:upstreamTopicsForTopic:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)expandedTopicsForTopics:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMEPersistentConnectionServer dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "server:expandedTopicsForTopics:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)connectWithConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5 completion:(id)a6
{
  void *v10;
  id v11;

  v11 = a6;
  -[HMERouterServer didConnectConnection:connectEvent:unregisterEvent:](self, "didConnectConnection:connectEvent:unregisterEvent:", a3, a4, a5);
  v10 = v11;
  if (v11)
  {
    (*((void (**)(id, _QWORD))v11 + 2))(v11, 0);
    v10 = v11;
  }

}

- (void)disconnectConnection:(id)a3
{
  id v4;
  NSObject *logger;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Removing connection %@ registrations on unregister", (uint8_t *)&v6, 0xCu);
  }
  -[HMERouterServer didRemoveConnection:](self, "didRemoveConnection:", v4);

}

- (void)didInvalidateConnection:(id)a3
{
  id v4;
  NSObject *logger;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Removing connection %@ registrations on invalidation", (uint8_t *)&v6, 0xCu);
  }
  -[HMERouterServer didRemoveConnection:](self, "didRemoveConnection:", v4);

}

- (void)changeRegistrationsForConnection:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
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
  -[HMERouterServer queue](self, "queue");
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
    _os_log_impl(&dword_19B524000, v16, OS_LOG_TYPE_DEFAULT, "Processing request to change registrations for connection: %@  with addedTopics:%ld removedTopics: %ld", (uint8_t *)&v19, 0x20u);

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
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Processing request to change registrations for connection: %@  with addedTopics:%@ removedTopics: %@", (uint8_t *)&v19, 0x20u);
  }
  -[HMERouterServer topicRouter](self, "topicRouter");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", v10, v11, v12);

  if (v13)
  {
    -[HMERouterServer cachedEventsForExpandedTopics:](self, "cachedEventsForExpandedTopics:", v11);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, v18, 0);

  }
}

- (HMEPersistentConnectionServerDelegate)delegate
{
  return (HMEPersistentConnectionServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMEPersistentConnectionServerDataSource)dataSource
{
  return (HMEPersistentConnectionServerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

@end
