@implementation HMEDelegatingEventRouter

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4
{
  id v6;
  id v7;
  os_log_t v8;
  HMEDelegatingEventRouter *v9;

  v6 = a4;
  v7 = a3;
  v8 = os_log_create("com.apple.HomeKitEventRouter", "Router.Delegating");
  v9 = -[HMEDelegatingEventRouter initWithQueue:dataSource:logger:](self, "initWithQueue:dataSource:logger:", v7, v6, v8);

  return v9;
}

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 storeReadHandle:(id)a5 logCategory:(const char *)a6 identifier:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  os_log_t v16;
  HMEDelegatingEventRouter *v17;

  v12 = a7;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = os_log_create("com.apple.HomeKitEventRouter", a6);
  v17 = -[HMEDelegatingEventRouter initWithQueue:dataSource:storeReadHandle:logger:identifier:](self, "initWithQueue:dataSource:storeReadHandle:logger:identifier:", v15, v14, v13, v16, v12);

  return v17;
}

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 logger:(id)a5
{
  return -[HMEDelegatingEventRouter initWithQueue:dataSource:storeReadHandle:logger:identifier:](self, "initWithQueue:dataSource:storeReadHandle:logger:identifier:", a3, a4, 0, a5, 0);
}

- (HMEDelegatingEventRouter)initWithQueue:(id)a3 dataSource:(id)a4 storeReadHandle:(id)a5 logger:(id)a6 identifier:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  HMEDelegatingEventRouter *v18;
  HMEDelegatingEventRouter *v19;
  uint64_t v20;
  NSMutableSet *subRouters;
  HMETopicRouter *v22;
  HMETopicRouter *topicRouter;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)HMEDelegatingEventRouter;
  v18 = -[HMEDelegatingEventRouter init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_queue, a3);
    objc_storeWeak((id *)&v19->_dataSource, v14);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v20 = objc_claimAutoreleasedReturnValue();
    subRouters = v19->_subRouters;
    v19->_subRouters = (NSMutableSet *)v20;

    objc_storeStrong((id *)&v19->_eventStoreReadHandle, a5);
    objc_storeStrong((id *)&v19->_logger, a6);
    v22 = -[HMETopicRouter initWithDelegate:logger:]([HMETopicRouter alloc], "initWithDelegate:logger:", v19, v16);
    topicRouter = v19->_topicRouter;
    v19->_topicRouter = v22;

    objc_storeStrong((id *)&v19->_identifier, a7);
  }

  return v19;
}

- (NSString)description
{
  void *v3;
  const char *v4;
  void *v5;
  id Property;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMEDelegatingEventRouter identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self)
    Property = objc_getProperty(self, v4, 40, 1);
  else
    Property = 0;
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[<HMEDelegatingEventRouter %p> %@: subRouters: %@]"), self, v5, Property);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)registerSubRouter:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[4];
  id v9;
  HMEDelegatingEventRouter *v10;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke;
  v8[3] = &unk_1E3B311C8;
  v9 = v5;
  v10 = self;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)unregisterSubRouter:(id)a3
{
  const char *v4;
  id v5;
  NSObject *Property;
  id v7;
  _QWORD v8[5];
  id v9;

  v5 = a3;
  if (self)
    Property = objc_getProperty(self, v4, 24, 1);
  else
    Property = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__HMEDelegatingEventRouter_unregisterSubRouter___block_invoke;
  v8[3] = &unk_1E3B311C8;
  v8[4] = self;
  v9 = v5;
  v7 = v5;
  dispatch_async(Property, v8);

}

- (void)changeRegistrationsForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  id v14;
  NSObject *Property;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = a6;
  if (self)
    Property = objc_getProperty(self, v13, 24, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __111__HMEDelegatingEventRouter_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
  block[3] = &unk_1E3B31218;
  block[4] = self;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v14;
  v16 = v14;
  v17 = v12;
  v18 = v11;
  v19 = v10;
  dispatch_async(Property, block);

}

- (void)registerConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  -[HMEDelegatingEventRouter changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:](self, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", a3, a4, MEMORY[0x1E0C9AA60], a5);
}

- (void)unregisterConsumer:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__HMEDelegatingEventRouter_unregisterConsumer_completion___block_invoke;
  block[3] = &unk_1E3B31268;
  block[4] = self;
  v13 = v6;
  v14 = v8;
  v10 = v8;
  v11 = v6;
  dispatch_async(Property, block);

}

- (void)unregisterConsumer:(id)a3 topicFilters:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __71__HMEDelegatingEventRouter_unregisterConsumer_topicFilters_completion___block_invoke;
  v10[3] = &unk_1E3B30EF8;
  v11 = v8;
  v9 = v8;
  -[HMEDelegatingEventRouter changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:](self, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", a3, MEMORY[0x1E0C9AA60], a4, v10);

}

- (void)changeRegistrationsSyncForConsumer:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  const char *v13;
  void (**v14)(id, void *, _QWORD);
  NSObject *Property;
  NSObject *logger;
  NSObject *v17;
  const char *v18;
  id v19;
  SEL v20;
  const char *v21;
  void *v22;
  int v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v14 = (void (**)(id, void *, _QWORD))a6;
  if (self)
    Property = objc_getProperty(self, v13, 24, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v17 = logger;
    v23 = 138412802;
    v24 = v10;
    v25 = 2048;
    v26 = objc_msgSend(v11, "count");
    v27 = 2048;
    v28 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_19B524000, v17, OS_LOG_TYPE_DEFAULT, "Delegating router changing registrations for consumer: %@, topicFilterAdditions: %ld, topicFilterRemovals: %ld", (uint8_t *)&v23, 0x20u);

    logger = self->_logger;
  }
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    v23 = 138412802;
    v24 = v10;
    v25 = 2112;
    v26 = (uint64_t)v11;
    v27 = 2112;
    v28 = (uint64_t)v12;
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Delegating router changing registrations for consumer: %@, topicFilterAdditions: %@, topicFilterRemovals: %@", (uint8_t *)&v23, 0x20u);
  }
  objc_msgSend(objc_getProperty(self, v18, 32, 1), "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", v10, v11, v12);
  if (v14)
  {
    v19 = v11;
    if (objc_getProperty(self, v20, 56, 1))
    {
      objc_msgSend(objc_getProperty(self, v21, 56, 1), "eventsForTopicFilters:", v19);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = (void *)MEMORY[0x1E0C9AA70];
    }

    v14[2](v14, v22, 0);
  }

}

- (void)unregisterConsumerSync:(id)a3 completion:(id)a4
{
  id v6;
  const char *v7;
  void (**v8)(id, _QWORD);
  NSObject *Property;
  NSObject *logger;
  const char *v11;
  int v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = (void (**)(id, _QWORD))a4;
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v6;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Unregistering consumer: %@", (uint8_t *)&v12, 0xCu);
  }
  objc_msgSend(objc_getProperty(self, v11, 32, 1), "unregisterConsumer:", v6);
  v8[2](v8, 0);

}

- (void)didReceiveEvent:(id)a3 topic:(id)a4
{
  id v6;
  const char *v7;
  id v8;
  NSObject *Property;
  NSObject *logger;
  const char *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t v22[128];
  uint8_t buf[4];
  id v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v8 = a4;
  if (self)
    Property = objc_getProperty(self, v7, 24, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v24 = v8;
    v25 = 2112;
    v26 = v6;
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Received event for topic %@, event: %@", buf, 0x16u);
  }
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(objc_getProperty(self, v11, 32, 1), "consumersForTopic:", v8, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v19 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        if (v17)
          objc_msgSend(v17, "didReceiveEvent:topic:", v6, v8);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v14);
  }

}

- (void)didReceiveCachedEvent:(id)a3 topic:(id)a4 source:(id)a5
{
  id v8;
  id v9;
  const char *v10;
  id v11;
  NSObject *Property;
  NSObject *logger;
  const char *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v11 = a5;
  if (self)
    Property = objc_getProperty(self, v10, 24, 1);
  else
    Property = 0;
  dispatch_assert_queue_V2(Property);
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v9;
    v28 = 2112;
    v29 = v8;
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Received cached event for topic %@, event: %@", buf, 0x16u);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  objc_msgSend(objc_getProperty(self, v14, 32, 1), "consumersForTopic:", v9, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        if (v20 && (objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v20, "didReceiveCachedEvent:topic:source:", v8, v9, v11);
      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v17);
  }

}

- (void)didChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  const char *v6;
  uint64_t v7;
  const char *v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  NSObject *logger;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  __int128 v32;
  id obj;
  id WeakRetained;
  id v35;
  id v36;
  _QWORD v37[6];
  _QWORD v38[4];
  id v39;
  HMEDelegatingEventRouter *v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v35 = a4;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      obj = objc_getProperty(self, v6, 40, 1);
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
      if (!v7)
        goto LABEL_18;
      v10 = v7;
      v11 = *(_QWORD *)v43;
      *(_QWORD *)&v9 = 138412802;
      v32 = v9;
      while (1)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v43 != v11)
            objc_enumerationMutation(obj);
          v13 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
          objc_msgSend(objc_getProperty(self, v8, 32, 1), "allRegisteredTopicFilters");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v38[0] = MEMORY[0x1E0C809B0];
          v38[1] = 3221225472;
          v38[2] = __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
          v38[3] = &unk_1E3B30F20;
          v39 = WeakRetained;
          v40 = self;
          v41 = v13;
          +[HMETopicRouter forwardingTopicsForAdditions:removals:current:indexProvider:](HMETopicRouter, "forwardingTopicsForAdditions:removals:current:indexProvider:", v36, v35, v14, v38);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "count"))
          {

          }
          else
          {
            objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "count");

            if (!v18)
              goto LABEL_16;
          }
          logger = self->_logger;
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
          {
            v20 = logger;
            objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "count");
            objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "count");
            *(_DWORD *)buf = v32;
            v47 = v13;
            v48 = 2048;
            v49 = v22;
            v50 = 2048;
            v51 = v24;
            _os_log_impl(&dword_19B524000, v20, OS_LOG_TYPE_DEFAULT, "Delegating registrations to subRouter: %@, topicFilterAdditions: %lu, topicFilterRemovals: %lu", buf, 0x20u);

            logger = self->_logger;
          }
          if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
          {
            v29 = logger;
            objc_msgSend(v15, "objectAtIndexedSubscript:", 0);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v32;
            v47 = v13;
            v48 = 2112;
            v49 = (uint64_t)v30;
            v50 = 2112;
            v51 = (uint64_t)v31;
            _os_log_debug_impl(&dword_19B524000, v29, OS_LOG_TYPE_DEBUG, "Delegating registrations to subRouter: %@, topicFilterAdditions: %@, topicFilterRemovals: %@", buf, 0x20u);

          }
          objc_msgSend(v15, "objectAtIndexedSubscript:", 0, v32);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "allObjects");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "objectAtIndexedSubscript:", 1);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v27, "allObjects");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v37[0] = MEMORY[0x1E0C809B0];
          v37[1] = 3221225472;
          v37[2] = __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_12;
          v37[3] = &unk_1E3B30ED0;
          v37[4] = self;
          v37[5] = v13;
          objc_msgSend(v13, "changeRegistrationsSyncForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", self, v26, v28, v37);

LABEL_16:
        }
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v52, 16);
        if (!v10)
        {
LABEL_18:

          break;
        }
      }
    }
  }

}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;

  v4 = a3;
  if (self)
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
  else
    WeakRetained = 0;
  objc_msgSend(WeakRetained, "delegatingRouter:upstreamTopicsFor:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)cachedEventsForTopicFilters:(id)a3 cachedEventCollection:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  const char *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_dataSource);
    if (WeakRetained)
    {
      v10 = WeakRetained;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = objc_getProperty(self, v9, 40, 1);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v19 != v14)
              objc_enumerationMutation(v11);
            v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
            objc_msgSend(v10, "delegatingRouter:filteredTopics:forRouter:", self, v6, v16, (_QWORD)v18);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v17, "count"))
            {
              objc_msgSend(v7, "willAddAdditionalEvents");
              objc_msgSend(v16, "cachedEventsForTopicFilters:cachedEventCollection:", v6, v7);
              objc_msgSend(v10, "delegatingRouter:fetchCachedEventsForTopics:forRouter:cachedEventCollection:", self, v17, v16, v7);
              objc_msgSend(v7, "didFinishAddingAdditionalEvents");
            }

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
        }
        while (v13);
      }

    }
  }

}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventStoreReadHandle, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_subRouters, 0);
  objc_storeStrong((id *)&self->_topicRouter, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_logger, 0);
}

id __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  v4 = (void *)a1[4];
  v5 = a1[5];
  objc_msgSend(a2, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "delegatingRouter:filteredTopics:forRouter:", v5, v6, a1[6]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __84__HMEDelegatingEventRouter_didChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke_12(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19B524000, v2, OS_LOG_TYPE_DEFAULT, "changed registrations on subRouter: %@", (uint8_t *)&v4, 0xCu);
  }
}

uint64_t __71__HMEDelegatingEventRouter_unregisterConsumer_topicFilters_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __58__HMEDelegatingEventRouter_unregisterConsumer_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "unregisterConsumerSync:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

uint64_t __111__HMEDelegatingEventRouter_changeRegistrationsForConsumer_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "changeRegistrationsSyncForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
}

uint64_t __48__HMEDelegatingEventRouter_unregisterSubRouter___block_invoke(uint64_t a1, const char *a2)
{
  id Property;

  Property = *(id *)(a1 + 32);
  if (Property)
    Property = objc_getProperty(Property, a2, 40, 1);
  return objc_msgSend(Property, "removeObject:", *(_QWORD *)(a1 + 40));
}

void __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke(uint64_t a1, const char *a2)
{
  uint64_t v2;
  id Property;
  uint64_t v5;
  id WeakRetained;
  const char *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  uint8_t buf[4];
  uint64_t v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    Property = *(id *)(a1 + 40);
    if (Property)
    {
      Property = objc_getProperty(Property, a2, 40, 1);
      v2 = *(_QWORD *)(a1 + 32);
    }
    objc_msgSend(Property, "addObject:", v2);
    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)(v5 + 48));
      if (WeakRetained)
      {
        v8 = WeakRetained;
        v9 = *(id *)(a1 + 40);
        if (v9)
          v9 = objc_getProperty(v9, v7, 32, 1);
        objc_msgSend(v9, "allRegisteredTopicFilters");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "allObjects");
        v11 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v8, "delegatingRouter:filteredTopics:forRouter:", *(_QWORD *)(a1 + 40), v11, *(_QWORD *)(a1 + 32));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v12, "count"))
          {
            v13 = *(_QWORD *)(a1 + 40);
            v14 = *(NSObject **)(v13 + 8);
            if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
            {
              v15 = *(_QWORD *)(a1 + 32);
              *(_DWORD *)buf = 138412546;
              v20 = v15;
              v21 = 2112;
              v22 = v12;
              _os_log_impl(&dword_19B524000, v14, OS_LOG_TYPE_DEFAULT, "Subscribing to topics on subrouter register, router: %@, topics: %@", buf, 0x16u);
              v13 = *(_QWORD *)(a1 + 40);
            }
            v16 = *(void **)(a1 + 32);
            v17[0] = MEMORY[0x1E0C809B0];
            v17[1] = 3221225472;
            v17[2] = __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke_5;
            v17[3] = &unk_1E3B30ED0;
            v17[4] = v13;
            v18 = v16;
            objc_msgSend(v18, "changeRegistrationsSyncForConsumer:topicFilterAdditions:topicFilterRemovals:completion:", v13, v12, MEMORY[0x1E0C9AA60], v17);

          }
        }

      }
    }
  }
}

void __46__HMEDelegatingEventRouter_registerSubRouter___block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v4 = 138412290;
    v5 = v3;
    _os_log_impl(&dword_19B524000, v2, OS_LOG_TYPE_DEFAULT, "Registered on subRouter: %@", (uint8_t *)&v4, 0xCu);
  }
}

@end
