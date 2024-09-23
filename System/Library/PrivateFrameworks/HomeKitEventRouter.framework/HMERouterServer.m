@implementation HMERouterServer

- (HMERouterServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5
{
  id v8;
  id v9;
  id v10;
  os_log_t v11;
  HMERouterServer *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = os_log_create("com.apple.HomeKitEventRouter", "HMERouterServer");
  v12 = -[HMERouterServer initWithQueue:provider:registrationEventRouter:storeReadHandle:logger:](self, "initWithQueue:provider:registrationEventRouter:storeReadHandle:logger:", v10, v9, v8, 0, v11);

  return v12;
}

- (HMERouterServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logger:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  HMERouterServer *v17;
  HMERouterServer *v18;
  HMETopicRouter *v19;
  HMETopicRouter *topicRouter;
  uint64_t v21;
  NSMapTable *unregisterEvents;
  id v24;
  objc_super v25;

  v24 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMERouterServer;
  v17 = -[HMERouterServer init](&v25, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, a7);
    objc_storeStrong((id *)&v18->_queue, a3);
    v19 = -[HMETopicRouter initWithDelegate:logger:]([HMETopicRouter alloc], "initWithDelegate:logger:", v18, v16);
    topicRouter = v18->_topicRouter;
    v18->_topicRouter = v19;

    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v21 = objc_claimAutoreleasedReturnValue();
    unregisterEvents = v18->_unregisterEvents;
    v18->_unregisterEvents = (NSMapTable *)v21;

    objc_storeStrong((id *)&v18->_subscriptionProvider, a4);
    objc_storeStrong((id *)&v18->_localEventForwarder, a5);
    objc_storeStrong((id *)&v18->_eventStoreReadHandle, a6);
  }

  return v18;
}

- (id)dumpStateDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMERouterServer topicRouter](self, "topicRouter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dumpStateDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ topicRouter: %@]"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;

  v6 = a4;
  v8 = a3;
  -[HMERouterServer queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMERouterServer handleEvent:topic:](self, "handleEvent:topic:", v8, v6);
}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = a5;
  -[HMERouterServer queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v10);

  LOBYTE(v10) = objc_msgSend(v9, "isCachedEventSourceCurrentProcess");
  if ((v10 & 1) == 0)
    -[HMERouterServer handleCachedEvent:topic:](self, "handleCachedEvent:topic:", v11, v8);

}

- (void)didConnectConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *logger;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v18[5];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v9)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v12 = logger;
      objc_msgSend(v9, "event");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v20 = v13;
      v21 = 2112;
      v22 = v8;
      _os_log_impl(&dword_19B524000, v12, OS_LOG_TYPE_DEFAULT, "Posting connect event %@ on connection %@ register", buf, 0x16u);

    }
    -[HMERouterServer localEventForwarder](self, "localEventForwarder");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "event");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topic");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __69__HMERouterServer_didConnectConnection_connectEvent_unregisterEvent___block_invoke;
    v18[3] = &unk_1E3B31088;
    v18[4] = self;
    objc_msgSend(v14, "forwardEvent:topic:completion:", v15, v16, v18);

  }
  if (v10)
  {
    -[HMERouterServer unregisterEvents](self, "unregisterEvents");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKey:", v10, v8);

  }
}

- (void)didRemoveConnection:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *logger;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[5];
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMERouterServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMERouterServer topicRouter](self, "topicRouter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterConsumer:", v4);

  -[HMERouterServer unregisterEvents](self, "unregisterEvents");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      v10 = logger;
      objc_msgSend(v8, "event");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v17 = v11;
      v18 = 2112;
      v19 = v4;
      _os_log_impl(&dword_19B524000, v10, OS_LOG_TYPE_DEFAULT, "Posting unregister event %@ on connection %@ unregister", buf, 0x16u);

    }
    -[HMERouterServer localEventForwarder](self, "localEventForwarder");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "event");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topic");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __39__HMERouterServer_didRemoveConnection___block_invoke;
    v15[3] = &unk_1E3B31088;
    v15[4] = self;
    objc_msgSend(v12, "forwardEvent:topic:completion:", v13, v14, v15);

  }
}

- (id)cachedEventsForExpandedTopics:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[HMERouterServer queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMERouterServer eventStoreReadHandle](self, "eventStoreReadHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HMERouterServer expandedTopicsForTopics:](self, "expandedTopicsForTopics:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMERouterServer eventStoreReadHandle](self, "eventStoreReadHandle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "eventsForTopicFilters:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = (void *)MEMORY[0x1E0C9AA70];
  }

  return v9;
}

- (void)handleEvent:(id)a3 topic:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Subclass Must implement"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)handleCachedEvent:(id)a3 topic:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Subclass Must implement"), 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v7);
}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  NSObject *logger;
  NSObject *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Will change registrations with subscription provider additions:%@, removals:%@", buf, 0x16u);
  }
  -[HMERouterServer queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  -[HMERouterServer subscriptionProvider](self, "subscriptionProvider");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __75__HMERouterServer_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
  v13[3] = &unk_1E3B310B0;
  v13[4] = self;
  v14 = v6;
  v15 = v7;
  v11 = v7;
  v12 = v6;
  objc_msgSend(v10, "changeRegistrationsSyncForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", self, v12, v11, v13);

}

- (void)cachedEventsForTopicFilters:(id)a3 cachedEventCollection:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[HMERouterServer subscriptionProvider](self, "subscriptionProvider");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cachedEventsForTopicFilters:cachedEventCollection:", v7, v6);

}

- (id)expandedTopicsForTopics:(id)a3
{
  return a3;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  return 0;
}

- (NSMapTable)unregisterEvents
{
  return (NSMapTable *)objc_getProperty(self, a2, 16, 1);
}

- (HMESynchronousSubscriptionProviding)subscriptionProvider
{
  return (HMESynchronousSubscriptionProviding *)objc_getProperty(self, a2, 24, 1);
}

- (HMEEventForwarder)localEventForwarder
{
  return (HMEEventForwarder *)objc_getProperty(self, a2, 32, 1);
}

- (HMELastEventStoreReadHandle)eventStoreReadHandle
{
  return (HMELastEventStoreReadHandle *)objc_getProperty(self, a2, 40, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 48, 1);
}

- (HMETopicRouter)topicRouter
{
  return (HMETopicRouter *)objc_getProperty(self, a2, 56, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_storeStrong((id *)&self->_localEventForwarder, 0);
  objc_storeStrong((id *)&self->_subscriptionProvider, 0);
  objc_storeStrong((id *)&self->_unregisterEvents, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

void __75__HMERouterServer_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(_QWORD *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  int v11;
  id v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = a1[4];
  v8 = *(NSObject **)(v7 + 8);
  if (v6)
  {
    if (os_log_type_enabled(*(os_log_t *)(v7 + 8), OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v6;
      _os_log_error_impl(&dword_19B524000, v8, OS_LOG_TYPE_ERROR, "Error changing subscriptions with local subscription provider %@", (uint8_t *)&v11, 0xCu);
    }
  }
  else if (os_log_type_enabled(*(os_log_t *)(v7 + 8), OS_LOG_TYPE_DEFAULT))
  {
    v9 = (void *)a1[5];
    v10 = a1[6];
    v11 = 138412546;
    v12 = v9;
    v13 = 2112;
    v14 = v10;
    _os_log_impl(&dword_19B524000, v8, OS_LOG_TYPE_DEFAULT, "Successfully changed subscriptions by adding:%@ removing: %@", (uint8_t *)&v11, 0x16u);
  }

}

void __39__HMERouterServer_didRemoveConnection___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19B524000, v4, OS_LOG_TYPE_INFO, "Posted unregister event with result %@", (uint8_t *)&v5, 0xCu);
  }

}

void __69__HMERouterServer_didConnectConnection_connectEvent_unregisterEvent___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_19B524000, v4, OS_LOG_TYPE_INFO, "Posted connect event with result %@", (uint8_t *)&v5, 0xCu);
  }

}

@end
