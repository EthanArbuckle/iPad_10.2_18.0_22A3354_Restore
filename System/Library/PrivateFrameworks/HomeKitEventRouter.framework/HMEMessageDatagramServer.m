@implementation HMEMessageDatagramServer

- (HMEMessageDatagramServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5
{
  return -[HMEMessageDatagramServer initWithQueue:provider:registrationEventRouter:storeReadHandle:logCategory:](self, "initWithQueue:provider:registrationEventRouter:storeReadHandle:logCategory:", a3, a4, a5, 0, "HMEMessageDatagramServer");
}

- (HMEMessageDatagramServer)initWithQueue:(id)a3 provider:(id)a4 registrationEventRouter:(id)a5 storeReadHandle:(id)a6 logCategory:(const char *)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  os_log_t v16;
  HMEMessageDatagramServer *v17;
  uint64_t v18;
  NSMutableArray *connectionInfoItems;
  objc_super v21;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = os_log_create("com.apple.HomeKitEventRouter", a7);
  v21.receiver = self;
  v21.super_class = (Class)HMEMessageDatagramServer;
  v17 = -[HMERouterServer initWithQueue:provider:registrationEventRouter:storeReadHandle:logger:](&v21, sel_initWithQueue_provider_registrationEventRouter_storeReadHandle_logger_, v15, v14, v13, v12, v16);

  if (v17)
  {
    objc_storeStrong((id *)&v17->_logger, v16);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v18 = objc_claimAutoreleasedReturnValue();
    connectionInfoItems = v17->_connectionInfoItems;
    v17->_connectionInfoItems = (NSMutableArray *)v18;

  }
  return v17;
}

- (void)handleEvent:(id)a3 topic:(id)a4
{
  id v6;
  NSObject *v7;
  NSObject *logger;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  __int128 v13;
  uint64_t v14;
  id v15;
  char v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  __int128 v28;
  HMEEventInfo *v29;
  id v30;
  void *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  void *v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v30 = a3;
  v6 = a4;
  -[HMERouterServer queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v7);

  -[HMEMessageDatagramServer dataSource](self, "dataSource");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v37 = v6;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Handling event for topic %@", buf, 0xCu);
  }
  v29 = -[HMEEventInfo initWithEvent:topic:]([HMEEventInfo alloc], "initWithEvent:topic:", v30, v6);
  -[HMERouterServer topicRouter](self, "topicRouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "consumersForTopic:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v10;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
  if (v12)
  {
    v14 = v12;
    v15 = v6;
    v16 = 0;
    v17 = *(_QWORD *)v33;
    *(_QWORD *)&v13 = 138412546;
    v28 = v13;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(v11);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v31, "server:shouldProcessEventsForConnection:shouldLogState:", self, v19, 0, v28))
        {
          -[HMEMessageDatagramServer delegate](self, "delegate");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v20, "shouldAllowEvent:topic:connection:", v30, v15, v19))
          {
            -[HMEMessageDatagramServer _connectionItemForConnection:](self, v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = self->_logger;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v28;
              v37 = v15;
              v38 = 2112;
              v39 = v19;
              _os_log_impl(&dword_19B524000, v22, OS_LOG_TYPE_DEFAULT, "Adding pending event topic: %@ to connection: %@", buf, 0x16u);
            }
            objc_msgSend(v21, "pendingEventItems");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "addEventInfo:", v29);

            objc_msgSend(v20, "server:logMetricsForEventTopic:eventSize:isCached:", self, v15, -[HMEMessageDatagramServer _eventSize:]((uint64_t)self, v30), 0);
            objc_msgSend(v21, "debounceStartTime");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v24)
            {
              objc_msgSend(v31, "serverTimerProvider:", self);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "currentDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setDebounceStartTime:", v26);

            }
            v16 = 1;
          }
          else
          {
            v27 = self->_logger;
            if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = v28;
              v37 = v15;
              v38 = 2112;
              v39 = v19;
              _os_log_debug_impl(&dword_19B524000, v27, OS_LOG_TYPE_DEBUG, "Delegate did not allow event %@ to %@", buf, 0x16u);
            }
          }

        }
      }
      v14 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v40, 16);
    }
    while (v14);

    v6 = v15;
    if ((v16 & 1) != 0)
      -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](self);
  }
  else
  {

  }
}

- (void)handleCachedEvent:(id)a3 topic:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[HMERouterServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v8);

  -[HMERouterServer topicRouter](self, "topicRouter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "consumersForTopic:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = v6;
  v13[0] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMEMessageDatagramServer _addCachedEvents:connections:]((os_log_t *)self, v11, v10);
}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMEMessageDatagramServer dataSource](self, "dataSource");
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
  -[HMEMessageDatagramServer dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "server:expandedTopicsForTopics:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)refreshConnection:(id)a3
{
  id v4;
  NSObject *logger;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v11 = v4;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Refresh connection: %@", buf, 0xCu);
  }
  -[HMERouterServer queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __46__HMEMessageDatagramServer_refreshConnection___block_invoke;
  v8[3] = &unk_1E3B311C8;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

- (void)connectWithConnection:(id)a3 connectEvent:(id)a4 unregisterEvent:(id)a5 topicFilterAdditions:(id)a6 completion:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void (**v16)(id, _QWORD, void *);
  NSObject *v17;
  NSObject *logger;
  NSObject *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  uint64_t v29;
  HMEConnectionInfoItem *v30;
  NSObject *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t i;
  uint64_t v47;
  void *v48;
  int v49;
  void *v50;
  NSObject *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id v56;
  void (**v57)(id, _QWORD, void *);
  void *v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _QWORD block[5];
  id v64;
  id v65;
  uint8_t v66[128];
  uint8_t buf[4];
  id v68;
  __int16 v69;
  uint64_t v70;
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = (void (**)(id, _QWORD, void *))a7;
  -[HMERouterServer queue](self, "queue");
  v17 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v17);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    v19 = logger;
    *(_DWORD *)buf = 138412546;
    v68 = v12;
    v69 = 2048;
    v70 = objc_msgSend(v15, "count");
    _os_log_impl(&dword_19B524000, v19, OS_LOG_TYPE_DEFAULT, "Received connect request for connection: %@ with additions: %ld", buf, 0x16u);

    logger = self->_logger;
  }
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412546;
    v68 = v12;
    v69 = 2112;
    v70 = (uint64_t)v15;
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Received connect request for connection: %@ with additions: %@", buf, 0x16u);
  }
  -[HMEMessageDatagramServer dataSource](self, "dataSource");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEMessageDatagramServer delegate](self, "delegate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = v20;
  if ((objc_msgSend(v20, "server:shouldProcessEventsForConnection:shouldLogState:", self, v12, 1) & 1) != 0)
  {
    v56 = v14;
    v57 = v16;
    v55 = v15;
    v22 = v12;
    -[HMERouterServer queue](self, "queue");
    v23 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v23);

    -[HMEMessageDatagramServer dataSource](self, "dataSource");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "server:timeoutIntervalForConnection:", self, v22);
    v26 = v25;
    objc_msgSend(v24, "serverTimerProvider:", self);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "dateWithTimeIntervalSinceNow:", v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMEMessageDatagramServer _expiryItemForConnection:](self, v22);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v29)
    {
      v30 = (HMEConnectionInfoItem *)v29;
      v31 = self->_logger;
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v68 = v22;
        v69 = 2112;
        v70 = (uint64_t)v28;
        _os_log_impl(&dword_19B524000, v31, OS_LOG_TYPE_DEFAULT, "Updated connection %@ expiry to %@", buf, 0x16u);
      }
      -[HMEConnectionInfoItem setExpiry:](v30, "setExpiry:", v28);
    }
    else
    {
      v30 = -[HMEConnectionInfoItem initWithConnection:expiry:]([HMEConnectionInfoItem alloc], "initWithConnection:expiry:", v22, v28);
      -[HMEMessageDatagramServer connectionInfoItems](self, "connectionInfoItems");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "addObject:", v30);

      v35 = self->_logger;
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v68 = v22;
        v69 = 2112;
        v70 = (uint64_t)v28;
        _os_log_impl(&dword_19B524000, v35, OS_LOG_TYPE_DEFAULT, "Added connection %@ with expiry %@", buf, 0x16u);
      }
    }
    -[HMEMessageDatagramServer _setupAndStartExpiryTimer](self);

    v14 = v56;
    -[HMERouterServer didConnectConnection:connectEvent:unregisterEvent:](self, "didConnectConnection:connectEvent:unregisterEvent:", v22, v13, v56);
    objc_msgSend(v21, "server:connectionDidConnect:", self, v22);
    v15 = v55;
    v16 = v57;
    if (objc_msgSend(v55, "count"))
    {
      v36 = self->_logger;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        v37 = v36;
        v38 = objc_msgSend(v55, "count");
        *(_DWORD *)buf = 138412546;
        v68 = v22;
        v69 = 2048;
        v70 = v38;
        _os_log_impl(&dword_19B524000, v37, OS_LOG_TYPE_DEFAULT, "Registering connection: %@ to topics: %ld", buf, 0x16u);

        v36 = self->_logger;
      }
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412546;
        v68 = v22;
        v69 = 2112;
        v70 = (uint64_t)v55;
        _os_log_debug_impl(&dword_19B524000, v36, OS_LOG_TYPE_DEBUG, "Registering connection: %@ to topics: %@", buf, 0x16u);
      }
      -[HMERouterServer topicRouter](self, "topicRouter");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", v22, v55, MEMORY[0x1E0C9AA60]);

    }
    if (v57)
    {
      if (objc_msgSend(v58, "serverSupportFragmentCachedEvents:", self))
      {
        -[HMERouterServer queue](self, "queue");
        v40 = objc_claimAutoreleasedReturnValue();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __111__HMEMessageDatagramServer_connectWithConnection_connectEvent_unregisterEvent_topicFilterAdditions_completion___block_invoke;
        block[3] = &unk_1E3B311A0;
        block[4] = self;
        v64 = v55;
        v65 = v22;
        dispatch_async(v40, block);

        v57[2](v57, MEMORY[0x1E0C9AA70], 0);
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v58, "server:shouldProcessEventsForConnection:shouldLogState:", self, v22, 0))
        {
          v53 = v13;
          v54 = v12;
          -[HMERouterServer cachedEventsForExpandedTopics:](self, "cachedEventsForExpandedTopics:", v55);
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = 0u;
          v60 = 0u;
          v61 = 0u;
          v62 = 0u;
          v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
          if (v43)
          {
            v44 = v43;
            v45 = *(_QWORD *)v60;
            do
            {
              for (i = 0; i != v44; ++i)
              {
                if (*(_QWORD *)v60 != v45)
                  objc_enumerationMutation(v42);
                v47 = *(_QWORD *)(*((_QWORD *)&v59 + 1) + 8 * i);
                objc_msgSend(v42, "objectForKeyedSubscript:", v47);
                v48 = (void *)objc_claimAutoreleasedReturnValue();
                v49 = objc_msgSend(v21, "shouldAllowEvent:topic:connection:", v48, v47, v22);

                if (v49)
                {
                  objc_msgSend(v42, "objectForKeyedSubscript:", v47);
                  v50 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "setObject:forKeyedSubscript:", v50, v47);

                }
              }
              v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v59, v66, 16);
            }
            while (v44);
          }

          v13 = v53;
          v12 = v54;
          v15 = v55;
          v14 = v56;
        }
        else
        {
          v51 = self->_logger;
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v68 = v22;
            _os_log_error_impl(&dword_19B524000, v51, OS_LOG_TYPE_ERROR, "Will not process events for connection %@", buf, 0xCu);
          }
        }
        v52 = (void *)objc_msgSend(v41, "copy");
        ((void (**)(id, void *, void *))v57)[2](v57, v52, 0);

        v16 = v57;
      }
    }
  }
  else
  {
    v32 = self->_logger;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v68 = v12;
      _os_log_error_impl(&dword_19B524000, v32, OS_LOG_TYPE_ERROR, "Connect not allowed in current state for connection: %@", buf, 0xCu);
    }
    objc_msgSend(v21, "server:connectionDidFail:", self, v12);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMEErrorDomain"), 4, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v16[2](v16, MEMORY[0x1E0C9AA70], v33);

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

- (void)changeRegistrationsForConnection:(id)a3 topicFilterAdditions:(id)a4 topicFilterRemovals:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, void *);
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *logger;
  void *v24;
  uint64_t v25;
  void *v26;
  _QWORD block[5];
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  uint64_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, void *))a6;
  -[HMERouterServer queue](self, "queue");
  v14 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v14);

  -[HMEMessageDatagramServer dataSource](self, "dataSource");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEMessageDatagramServer _expiryItemForConnection:](self, v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v16)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Did not find item for connection: %@", buf, 0xCu);
    }
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = 2;
    goto LABEL_18;
  }
  v17 = objc_msgSend(v15, "server:shouldProcessEventsForConnection:shouldLogState:", self, v10, 1);
  v18 = self->_logger;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_error_impl(&dword_19B524000, v18, OS_LOG_TYPE_ERROR, "Change registrations not allowed in current state for connection: %@", buf, 0xCu);
    }
    v24 = (void *)MEMORY[0x1E0CB35C8];
    v25 = 4;
LABEL_18:
    objc_msgSend(v24, "errorWithDomain:code:userInfo:", CFSTR("HMEErrorDomain"), v25, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, MEMORY[0x1E0C9AA70], v26);
    goto LABEL_19;
  }
  if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_DEFAULT))
  {
    v19 = v18;
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    v32 = 2048;
    v33 = objc_msgSend(v11, "count");
    v34 = 2048;
    v35 = objc_msgSend(v12, "count");
    _os_log_impl(&dword_19B524000, v19, OS_LOG_TYPE_DEFAULT, "Processing request to change registrations for connection: %@ with addedTopics: %ld removedTopics: %ld", buf, 0x20u);

    v18 = self->_logger;
  }
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v31 = v10;
    v32 = 2112;
    v33 = (uint64_t)v11;
    v34 = 2112;
    v35 = (uint64_t)v12;
    _os_log_debug_impl(&dword_19B524000, v18, OS_LOG_TYPE_DEBUG, "Processing request to change registrations for connection: %@ with addedTopics: %@ removedTopics: %@", buf, 0x20u);
  }
  -[HMERouterServer topicRouter](self, "topicRouter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "changeRegistrationsForConsumer:topicFilterAdditions:topicFilterRemovals:", v10, v11, v12);

  if (!-[HMEMessageDatagramServer _updateConnectionExpiryForConnection:reason:](self, v10, CFSTR("change-registration")))
  {
    v21 = self->_logger;
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v31 = v10;
      _os_log_error_impl(&dword_19B524000, v21, OS_LOG_TYPE_ERROR, "Update connection expiry failed for connection %@", buf, 0xCu);
      if (!v13)
        goto LABEL_20;
      goto LABEL_10;
    }
  }
  if (v13)
  {
LABEL_10:
    if (objc_msgSend(v15, "serverSupportFragmentCachedEvents:", self))
    {
      -[HMERouterServer queue](self, "queue");
      v22 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __113__HMEMessageDatagramServer_changeRegistrationsForConnection_topicFilterAdditions_topicFilterRemovals_completion___block_invoke;
      block[3] = &unk_1E3B311A0;
      block[4] = self;
      v28 = v11;
      v29 = v10;
      dispatch_async(v22, block);

      v13[2](v13, MEMORY[0x1E0C9AA70], 0);
      goto LABEL_20;
    }
    -[HMERouterServer cachedEventsForExpandedTopics:](self, "cachedEventsForExpandedTopics:", v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, void *, void *))v13)[2](v13, v26, 0);
LABEL_19:

  }
LABEL_20:

}

- (void)keepAliveConnection:(id)a3 completion:(id)a4
{
  void (**v6)(id, void *);
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *logger;
  uint8_t v11[16];

  v6 = (void (**)(id, void *))a4;
  v7 = a3;
  -[HMERouterServer queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2((dispatch_queue_t)v8);

  LOBYTE(v8) = -[HMEMessageDatagramServer _updateConnectionExpiryForConnection:reason:](self, v7, CFSTR("keep-alive"));
  if ((v8 & 1) != 0)
  {
    v9 = 0;
    if (!v6)
      goto LABEL_8;
    goto LABEL_7;
  }
  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v11 = 0;
    _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Did not find connection keep-alive was received for.", v11, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMEErrorDomain"), 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
LABEL_7:
    v6[2](v6, v9);
LABEL_8:

}

- (BOOL)fetchCachedEventsForTopics:(id)a3 isMultiHop:(BOOL)a4 connection:(id)a5 cachedEventCollection:(id)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  void *v16;
  char v17;
  BOOL v18;
  NSObject *logger;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  uint64_t v25;
  void *v26;
  HMEEventInfo *v27;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  _BOOL4 v33;
  void *v34;
  BOOL v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v10 = a4;
  v46 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a6;
  -[HMERouterServer queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v15);

  -[HMEMessageDatagramServer dataSource](self, "dataSource");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "server:shouldProcessEventsForConnection:shouldLogState:", self, v13, 1);
  v18 = v17;
  logger = self->_logger;
  if ((v17 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)self->_logger, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v42 = v13;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Fetch not allowed in current state for connection: %@", buf, 0xCu);
      if (!a7)
        goto LABEL_23;
    }
    else if (!a7)
    {
      goto LABEL_23;
    }
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("HMEErrorDomain"), 4, 0);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_23;
  }
  v33 = v10;
  v34 = v16;
  v35 = v17;
  v36 = v13;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v42 = v12;
    _os_log_debug_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEBUG, "Returning cached events for topics:%@", buf, 0xCu);
  }
  objc_msgSend(v14, "willAddAdditionalEvents");
  -[HMERouterServer cachedEventsForExpandedTopics:](self, "cachedEventsForExpandedTopics:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v22; ++i)
      {
        if (*(_QWORD *)v38 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v20, "objectForKeyedSubscript:", v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v27 = -[HMEEventInfo initWithEvent:topic:]([HMEEventInfo alloc], "initWithEvent:topic:", v26, v25);
          objc_msgSend(v14, "addEventInfo:", v27);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    }
    while (v22);
  }
  v13 = v36;
  v18 = v35;
  if (v33)
  {
    v28 = self->_logger;
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      v29 = v28;
      v30 = objc_msgSend(v12, "count");
      *(_DWORD *)buf = 138412546;
      v42 = v36;
      v43 = 2048;
      v44 = v30;
      _os_log_impl(&dword_19B524000, v29, OS_LOG_TYPE_DEFAULT, "Processing fetch request for connection: %@ with topics: %ld ", buf, 0x16u);

      v28 = self->_logger;
    }
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v42 = v36;
      v43 = 2112;
      v44 = (uint64_t)v12;
      _os_log_debug_impl(&dword_19B524000, v28, OS_LOG_TYPE_DEBUG, "Processing fetch request for connection: %@ with topics: %@", buf, 0x16u);
    }
    -[HMERouterServer topicRouter](self, "topicRouter");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "fetchCachedEventsForConsumer:topicFilters:cachedEventCollection:", v36, v12, v14);

  }
  objc_msgSend(v14, "didFinishAddingAdditionalEvents");

  v16 = v34;
LABEL_23:

  return v18;
}

- (void)resetExistingEvents
{
  NSObject *v3;
  NSObject *logger;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t buf[8];
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  -[HMERouterServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Resetting all events", buf, 2u);
  }
  -[HMEMessageDatagramServer _resetDebounceTimer](self);
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[HMEMessageDatagramServer connectionInfoItems](self, "connectionInfoItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "pendingEventItems");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resetItems");

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v17, 16);
    }
    while (v8);
  }

}

- (void)reset
{
  NSObject *v3;
  NSObject *logger;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint8_t buf[8];
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[HMERouterServer queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Resetting all connections", buf, 2u);
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMEMessageDatagramServer connectionInfoItems](self, "connectionInfoItems", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "connection");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v11)
          -[HMEMessageDatagramServer _removeConnection:](self, v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    }
    while (v8);
  }

  -[HMEMessageDatagramServer connectionInfoItems](self, "connectionInfoItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeAllObjects");

  -[HMEMessageDatagramServer _resetDebounceTimer](self);
}

- (id)dumpStateDescription
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HMEMessageDatagramServer *v19;
  id obj;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "appendFormat:", CFSTR("\n\t{"));
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v19 = self;
  -[HMEMessageDatagramServer connectionInfoItems](self, "connectionInfoItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  obj = v4;
  v23 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v23)
  {
    v21 = *(_QWORD *)v26;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v5);
        if (v6)
        {
          v7 = (void *)MEMORY[0x1E0CB3940];
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v5), "identifier");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "expiry");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "pendingEventItems");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "eventItems");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "pendingCachedEventItems");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "eventItems");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "connection");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "stringWithFormat:", CFSTR("[HMEConnectionInfoItem identifier: %@, expiry: %@, \n\t pendingItems: %@, \n\t pendingCachedEvents: %@, \n\t connection: %@]"), v8, v9, v11, v13, v14);
          v6 = (void *)objc_claimAutoreleasedReturnValue();

        }
        objc_msgSend(v22, "appendFormat:", CFSTR("\n\t\t%@,"), v6);

        ++v5;
      }
      while (v23 != v5);
      v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v23);
  }

  objc_msgSend(v22, "appendFormat:", CFSTR("\n\t}\n"));
  v15 = (void *)MEMORY[0x1E0CB3940];
  v24.receiver = v19;
  v24.super_class = (Class)HMEMessageDatagramServer;
  -[HMERouterServer dumpStateDescription](&v24, sel_dumpStateDescription);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringWithFormat:", CFSTR("[HMEMessageDatagramServer connection info: %@, \n\t event router server: %@]"), v22, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (HMEMessageDatagramServerDelegate)delegate
{
  return (HMEMessageDatagramServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (HMEMessageDatagramServerDataSource)dataSource
{
  return (HMEMessageDatagramServerDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSMutableArray)connectionInfoItems
{
  return self->_connectionInfoItems;
}

- (HMETimer)connectionExpiryTimer
{
  return (HMETimer *)objc_getProperty(self, a2, 96, 1);
}

- (void)setConnectionExpiryTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (HMETimer)connectionDebounceTimer
{
  return (HMETimer *)objc_getProperty(self, a2, 104, 1);
}

- (void)setConnectionDebounceTimer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionDebounceTimer, 0);
  objc_storeStrong((id *)&self->_connectionExpiryTimer, 0);
  objc_storeStrong((id *)&self->_connectionInfoItems, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_logger, 0);
}

- (void)_removeConnection:(_QWORD *)a1
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v5 = a1[8];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138412290;
      v9 = v3;
      _os_log_impl(&dword_19B524000, v5, OS_LOG_TYPE_DEFAULT, "Removing connection %@", (uint8_t *)&v8, 0xCu);
    }
    -[HMEMessageDatagramServer _connectionItemForConnection:](a1, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "connectionInfoItems");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObject:", v6);

    objc_msgSend(a1, "didRemoveConnection:", v3);
  }

}

- (void)_resetDebounceTimer
{
  void *v1;
  void *v2;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "connectionDebounceTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "suspend");

    return (void *)objc_msgSend(v1, "setConnectionDebounceTimer:", 0);
  }
  return result;
}

- (id)_connectionItemForConnection:(void *)a1
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  char v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(a1, "connectionInfoItems", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "copy");

    v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v7)
            objc_enumerationMutation(v5);
          v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v9, "connection");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v10, "isEqual:", v3);

          if ((v11 & 1) != 0)
          {
            v6 = v9;
            goto LABEL_12;
          }
        }
        v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_updateConnectionExpiryForConnection:(void *)a3 reason:
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL8 v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v7);

    objc_msgSend(a1, "dataSource");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "server:timeoutIntervalForConnection:", a1, v5);
    v10 = v9;
    objc_msgSend(v8, "serverTimerProvider:", a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dateWithTimeIntervalSinceNow:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMEMessageDatagramServer _expiryItemForConnection:](a1, v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13 != 0;
    v15 = a1[8];
    if (v13)
    {
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412802;
        v18 = v5;
        v19 = 2112;
        v20 = v12;
        v21 = 2112;
        v22 = v6;
        _os_log_impl(&dword_19B524000, v15, OS_LOG_TYPE_DEFAULT, "Updated connection %@ expiry to %@ with reason %@", (uint8_t *)&v17, 0x20u);
      }
      objc_msgSend(v13, "setExpiry:", v12);
    }
    else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v17) = 0;
      _os_log_error_impl(&dword_19B524000, v15, OS_LOG_TYPE_ERROR, "Did not find connection", (uint8_t *)&v17, 2u);
    }

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)_expiryItemForConnection:(void *)a1
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(a1, "connectionInfoItems", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "copy");

    v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v14;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v6);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "connection");
          v11 = (id)objc_claimAutoreleasedReturnValue();

          if (v11 == v3)
          {
            v7 = v10;
            goto LABEL_12;
          }
        }
        v7 = (id)objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v7)
          continue;
        break;
      }
    }
LABEL_12:

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __113__HMEMessageDatagramServer_changeRegistrationsForConnection_topicFilterAdditions_topicFilterRemovals_completion___block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedEventsForExpandedTopics:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(os_log_t **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEMessageDatagramServer _addCachedEvents:connections:](v3, v2, v4);

}

- (void)_addCachedEvents:(void *)a3 connections:
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  _QWORD v19[6];
  id v20;
  id v21;
  uint64_t *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  char v30;
  uint8_t buf[4];
  id v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v18 = a3;
  if (a1)
  {
    -[os_log_t queue](a1, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    -[os_log_t dataSource](a1, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 0;
    v28 = &v27;
    v29 = 0x2020000000;
    v30 = 0;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v8 = v18;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v24 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
          v13 = objc_msgSend(v7, "server:shouldProcessEventsForConnection:shouldLogState:", a1, v12, 0);
          v14 = a1[8];
          if ((v13 & 1) != 0)
          {
            if (os_log_type_enabled(a1[8], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v12;
              _os_log_impl(&dword_19B524000, v14, OS_LOG_TYPE_DEFAULT, "Processing connection: %@", buf, 0xCu);
            }
            objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v19[0] = MEMORY[0x1E0C809B0];
            v19[1] = 3221225472;
            v19[2] = __57__HMEMessageDatagramServer__addCachedEvents_connections___block_invoke;
            v19[3] = &unk_1E3B31178;
            v19[4] = a1;
            v19[5] = v12;
            v16 = v15;
            v20 = v16;
            v21 = v7;
            v22 = &v27;
            objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v19);
            v17 = a1[8];
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v32 = v16;
              _os_log_impl(&dword_19B524000, v17, OS_LOG_TYPE_INFO, "Added cached events: %@", buf, 0xCu);
            }

          }
          else if (os_log_type_enabled(a1[8], OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            v32 = v12;
            _os_log_debug_impl(&dword_19B524000, v14, OS_LOG_TYPE_DEBUG, "Skip processing for connection %@", buf, 0xCu);
          }
        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
      }
      while (v9);
    }

    if (*((_BYTE *)v28 + 24))
      -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](a1);
    _Block_object_dispose(&v27, 8);

  }
}

void __57__HMEMessageDatagramServer__addCachedEvents_connections___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  HMEEventInfo *v7;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  int v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = -[HMEEventInfo initWithEvent:topic:]([HMEEventInfo alloc], "initWithEvent:topic:", v6, v5);
  v8 = *(_QWORD **)(a1 + 32);
  v9 = v8[8];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v34 = v5;
    _os_log_debug_impl(&dword_19B524000, v9, OS_LOG_TYPE_DEBUG, "Cached event topic %@", buf, 0xCu);
    v8 = *(_QWORD **)(a1 + 32);
  }
  objc_msgSend(v8, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "shouldAllowEvent:topic:connection:", v6, v5, *(_QWORD *)(a1 + 40)))
  {
    -[HMEMessageDatagramServer _connectionItemForConnection:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 64);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v34 = v5;
      _os_log_debug_impl(&dword_19B524000, v11, OS_LOG_TYPE_DEBUG, "Adding cached event topic: %@", buf, 0xCu);
    }
    v31 = 0;
    v32 = 0;
    v30 = 0;
    v12 = HMEEventComponentsFromTopic(v5, &v32, &v31, &v30);
    v13 = v32;
    v14 = v31;
    v15 = v30;
    if (v12)
    {
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v16)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setObject:forKeyedSubscript:", v17, v15);

      }
      objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "objectForKeyedSubscript:", v13);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v15);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v20, v13);

      }
      if (v14)
      {
        objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", v15);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "objectForKeyedSubscript:", v13);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "addObject:", v14);

      }
    }
    v24 = v29;
    objc_msgSend(v29, "pendingCachedEventItems");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addEventInfo:", v7);

    objc_msgSend(v10, "server:logMetricsForEventTopic:eventSize:isCached:", *(_QWORD *)(a1 + 32), v5, -[HMEMessageDatagramServer _eventSize:](*(_QWORD *)(a1 + 32), v6), 1);
    objc_msgSend(v29, "debounceStartTime");
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v26)
    {
      objc_msgSend(*(id *)(a1 + 56), "serverTimerProvider:", *(_QWORD *)(a1 + 32));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "currentDate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setDebounceStartTime:", v28);

      v24 = v29;
    }
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;

  }
}

- (void)_startDebounceTimerIfNeeded
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  double Debounce;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id buf[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    objc_msgSend(a1, "connectionDebounceTimer");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      objc_msgSend(a1, "dataSource");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = 0u;
      v31 = 0u;
      v28 = 0u;
      v29 = 0u;
      objc_msgSend(a1, "connectionInfoItems");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = (void *)objc_msgSend(v4, "copy");

      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      if (v6)
      {
        v7 = *(_QWORD *)v29;
        while (2)
        {
          for (i = 0; i != v6; ++i)
          {
            if (*(_QWORD *)v29 != v7)
              objc_enumerationMutation(v5);
            v9 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
            v10 = objc_msgSend(v9, "hasPendingRequest");
            if (v9)
              v11 = v10;
            else
              v11 = 1;
            if ((v11 & 1) == 0)
            {
              objc_msgSend(v9, "pendingEventItems");
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "eventItems");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "count") == 0;

              if (!v14)
                goto LABEL_21;
            }
            if (objc_msgSend(v3, "serverSupportFragmentCachedEvents:", a1))
            {
              if (!(objc_msgSend(v9, "hasPendingRequest") & 1 | (v9 == 0)))
              {
                objc_msgSend(v9, "pendingCachedEventItems");
                v15 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v15, "eventItems");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                v17 = objc_msgSend(v16, "count") == 0;

                if (!v17)
                {
                  v18 = a1[8];
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(buf[0]) = 0;
                    _os_log_impl(&dword_19B524000, v18, OS_LOG_TYPE_DEFAULT, "Has cached events to send", (uint8_t *)buf, 2u);
                  }
LABEL_21:

                  v19 = a1[8];
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
                  {
                    LOWORD(buf[0]) = 0;
                    _os_log_impl(&dword_19B524000, v19, OS_LOG_TYPE_DEFAULT, "Creating debounce timer, have events to send.", (uint8_t *)buf, 2u);
                  }
                  objc_initWeak(buf, a1);
                  objc_msgSend(v3, "serverTimerProvider:", a1);
                  v20 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(a1, "queue");
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  Debounce = -[HMEMessageDatagramServer _nextDebounceInterval](a1);
                  v25[0] = MEMORY[0x1E0C809B0];
                  v25[1] = 3221225472;
                  v25[2] = __55__HMEMessageDatagramServer__startDebounceTimerIfNeeded__block_invoke;
                  v25[3] = &unk_1E3B31150;
                  objc_copyWeak(&v26, buf);
                  objc_msgSend(v20, "timerWithQueue:interval:timerFireHandler:", v21, v25, Debounce);
                  v23 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(a1, "setConnectionDebounceTimer:", v23);
                  objc_msgSend(a1, "connectionDebounceTimer");
                  v24 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v24, "resume");

                  objc_destroyWeak(&v26);
                  objc_destroyWeak(buf);
                  goto LABEL_24;
                }
              }
            }
          }
          v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
          if (v6)
            continue;
          break;
        }
      }

LABEL_24:
    }
  }
}

- (double)_nextDebounceInterval
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  objc_msgSend(a1, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "serverDebounceTimeInterval:", a1);
    v5 = v4;
  }
  else
  {
    v5 = 5.0;
  }

  return v5;
}

void __55__HMEMessageDatagramServer__startDebounceTimerIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  unint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  NSObject *v51;
  id v52;
  id *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  char v60;
  void *v61;
  id v62;
  _QWORD *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[5];
  uint8_t buf[128];
  __int128 v70;
  void (*v71)(id *, void *);
  void *v72;
  _QWORD *v73;
  id v74;
  id v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v63 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = v63[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Debounce timer fired", buf, 2u);
    }
    -[HMEMessageDatagramServer _pruneExpiredItemsFromConnectionItems](v63);
    -[HMEMessageDatagramServer _resetDebounceTimer](v63);
    objc_msgSend(v63, "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v4);

    objc_msgSend(v63, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "serverTimerProvider:", v63);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "currentDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    objc_msgSend(v63, "connectionInfoItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v8, "copy");

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v65;
      v57 = v9;
      v58 = v7;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v65 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v13);
          if ((objc_msgSend(v14, "hasPendingRequest") & 1) == 0)
          {
            objc_msgSend(v14, "debounceStartTime");
            v15 = (void *)objc_claimAutoreleasedReturnValue();

            if (v15)
            {
              objc_msgSend(v14, "debounceStartTime");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "dateByAddingTimeInterval:", -[HMEMessageDatagramServer _nextDebounceInterval](v63));
              v17 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v17, "timeIntervalSinceReferenceDate");
              v19 = v18;
              objc_msgSend(v7, "timeIntervalSinceReferenceDate");
              if (v19 < v20)
              {
                v21 = v14;
                objc_msgSend(v63, "queue");
                v22 = objc_claimAutoreleasedReturnValue();
                dispatch_assert_queue_V2(v22);

                v23 = (void *)MEMORY[0x1A1AC220C]();
                objc_msgSend(v21, "connection");
                v24 = (void *)objc_claimAutoreleasedReturnValue();
                if (v24)
                {
                  v61 = v23;
                  v25 = v21;
                  v26 = v25;
                  v62 = v21;
                  if (v25
                    && (objc_msgSend(v25, "connection"),
                        v27 = (void *)objc_claimAutoreleasedReturnValue(),
                        v27,
                        v27))
                  {
                    objc_msgSend(v63, "dataSource");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v28, "serverFragmentEventsDataSize:", v63);

                    v68[0] = 0;
                    objc_msgSend(MEMORY[0x1E0C99D20], "array");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x1E0C99D20], "array");
                    v30 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v63, "delegate");
                    v59 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v26, "pendingEventItems");
                    v31 = (void *)objc_claimAutoreleasedReturnValue();
                    v32 = objc_msgSend(v31, "hasEventItem");

                    if (v32)
                    {
                      objc_msgSend(v26, "pendingEventItems");
                      v33 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v33, "popEventItemsUpWithFragments:toSizeInBytes:usedBytes:", v29 != 0, v29, v68);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v29)
                      {
                        objc_msgSend(v26, "pendingEventItems");
                        v35 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v59, "server:logMetricsForMessageDatagramFragmentation:isFragmented:", v63, 0, objc_msgSend(v35, "hasEventItem"));

                      }
                      else
                      {
                        objc_msgSend(v59, "server:logMetricsForMessageDatagramFragmentation:isFragmented:", v63, 0, 0);
                      }
                    }
                    else
                    {
                      v34 = v30;
                    }
                    objc_msgSend(v26, "pendingCachedEventItems");
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v37, "hasEventItem"))
                    {
                      v38 = v68[0];

                      if (v29 - 1 >= v38)
                      {
                        if (v29)
                          v40 = v29 - v68[0];
                        else
                          v40 = 0;
                        objc_msgSend(v26, "pendingCachedEventItems");
                        v41 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v41, "popEventItemsUpWithFragments:toSizeInBytes:usedBytes:", v29 != 0, v40, v68);
                        v39 = (void *)objc_claimAutoreleasedReturnValue();

                        if (v29)
                        {
                          objc_msgSend(v26, "pendingCachedEventItems");
                          v42 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v59, "server:logMetricsForMessageDatagramFragmentation:isFragmented:", v63, 1, objc_msgSend(v42, "hasEventItem"));

                        }
                        else
                        {
                          objc_msgSend(v59, "server:logMetricsForMessageDatagramFragmentation:isFragmented:", v63, 1, 0);
                        }
                      }
                      else
                      {
                        v39 = v56;
                      }
                    }
                    else
                    {

                      v39 = v56;
                    }
                    *(_QWORD *)&v70 = v34;
                    *((_QWORD *)&v70 + 1) = v39;
                    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 2);
                    v36 = (void *)objc_claimAutoreleasedReturnValue();

                  }
                  else
                  {
                    v36 = &unk_1E3B35048;
                  }

                  objc_msgSend(v36, "objectAtIndexedSubscript:", 0);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  if (objc_msgSend(v43, "count"))
                  {

LABEL_35:
                    v46 = v26;
                    v47 = v46;
                    if (v26
                      && (objc_msgSend(v46, "connection"),
                          v48 = (void *)objc_claimAutoreleasedReturnValue(),
                          v48,
                          v48))
                    {
                      objc_msgSend(v47, "pendingEventItems");
                      v49 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v49, "hasEventItem"))
                      {

                        v50 = MEMORY[0x1E0C809B0];
                        goto LABEL_41;
                      }
                      objc_msgSend(v47, "pendingCachedEventItems");
                      v54 = (void *)objc_claimAutoreleasedReturnValue();
                      v60 = objc_msgSend(v54, "hasEventItem");

                      v50 = MEMORY[0x1E0C809B0];
                      if ((v60 & 1) != 0)
                      {
LABEL_41:
                        v51 = v63[8];
                        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
                        {
                          LODWORD(v70) = 138412290;
                          *(_QWORD *)((char *)&v70 + 4) = v24;
                          _os_log_impl(&dword_19B524000, v51, OS_LOG_TYPE_DEFAULT, "Starting request to send events to connection %@", (uint8_t *)&v70, 0xCu);
                        }
                        *(_QWORD *)&v70 = v50;
                        *((_QWORD *)&v70 + 1) = 3221225472;
                        v71 = __44__HMEMessageDatagramServer__performRequest___block_invoke;
                        v72 = &unk_1E3B31128;
                        v73 = v63;
                        v74 = v24;
                        v75 = v36;
                        v52 = v36;
                        if (v26)
                        {
                          v53 = &v70;
                          objc_msgSend(v47, "setHasPendingRequest:", 1);
                          v68[0] = v50;
                          v68[1] = 3221225472;
                          v68[2] = __49__HMEConnectionInfoItem_performRequestWithBlock___block_invoke;
                          v68[3] = &unk_1E3B310D8;
                          v68[4] = v47;
                          v71(v53, v68);

                        }
                        goto LABEL_46;
                      }
                    }
                    else
                    {

                      v50 = MEMORY[0x1E0C809B0];
                    }
                    objc_msgSend(v47, "setDebounceStartTime:", 0);
                    goto LABEL_41;
                  }
                  objc_msgSend(v36, "objectAtIndexedSubscript:", 1);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  v45 = objc_msgSend(v44, "count");

                  if (v45)
                    goto LABEL_35;
LABEL_46:

                  v9 = v57;
                  v7 = v58;
                  v23 = v61;
                  v21 = v62;
                }

                objc_autoreleasePoolPop(v23);
              }

            }
          }
          ++v13;
        }
        while (v11 != v13);
        v55 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v64, buf, 16);
        v11 = v55;
      }
      while (v55);
    }

    -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](v63);
    WeakRetained = v63;
  }

}

- (void)_pruneExpiredItemsFromConnectionItems
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  void *v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(a1, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serverTimerProvider:", a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currentDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  objc_msgSend(a1, "connectionInfoItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v25;
    *(_QWORD *)&v9 = 138412546;
    v23 = v9;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v7);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "connection", v23);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v13, "expiry");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "timeIntervalSinceDate:", v5);
          v17 = v16;

          if (v17 < 0.0)
          {
            objc_msgSend(a1, "delegate");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "server:connectionDidExpire:", a1, v14);

            objc_msgSend(a1, "connectionInfoItems");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "removeObject:", v13);

            v20 = a1[8];
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = v23;
              v29 = v13;
              v30 = 2112;
              v31 = v14;
              _os_log_impl(&dword_19B524000, v20, OS_LOG_TYPE_DEFAULT, "Removed connection item as connection has expired %@, connection: %@", buf, 0x16u);
            }
          }
        }
        else
        {
          v21 = a1[8];
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v29 = v13;
            _os_log_impl(&dword_19B524000, v21, OS_LOG_TYPE_DEFAULT, "Removed connection item as connection was not found %@", buf, 0xCu);
          }
          objc_msgSend(a1, "connectionInfoItems");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "removeObject:", v13);

        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v10);
  }

}

void __44__HMEMessageDatagramServer__performRequest___block_invoke(id *a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id v14;
  id from;
  id location;

  v3 = a2;
  objc_initWeak(&location, a1[4]);
  objc_initWeak(&from, a1[5]);
  objc_msgSend(a1[4], "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = a1[4];
  objc_msgSend(a1[6], "objectAtIndexedSubscript:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[6], "objectAtIndexedSubscript:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = a1[5];
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__HMEMessageDatagramServer__performRequest___block_invoke_2;
  v10[3] = &unk_1E3B31100;
  objc_copyWeak(&v13, &location);
  objc_copyWeak(&v14, &from);
  v9 = v3;
  v12 = v9;
  v11 = a1[6];
  objc_msgSend(v4, "server:sendEvents:cachedEvents:connection:completion:", v5, v6, v7, v8, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&v13);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __44__HMEMessageDatagramServer__performRequest___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v5 = objc_loadWeakRetained((id *)(a1 + 56));
  if (!WeakRetained)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_20;
  }
  objc_msgSend(WeakRetained, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  v7 = WeakRetained[8];
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v25 = v5;
    v26 = 2112;
    v27 = v3;
    _os_log_impl(&dword_19B524000, v7, OS_LOG_TYPE_DEFAULT, "Sent events to connection: %@ with response %@", buf, 0x16u);
    v7 = WeakRetained[8];
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v22 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    v25 = v22;
    v26 = 2112;
    v27 = v5;
    v28 = 2112;
    v29 = v3;
    _os_log_debug_impl(&dword_19B524000, v7, OS_LOG_TYPE_DEBUG, "Sent events: %@ to connection: %@, response: %@", buf, 0x20u);
    if (v5)
      goto LABEL_6;
  }
  else if (v5)
  {
LABEL_6:
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v3;
    v11 = v8;
    v12 = v9;
    v13 = v5;
    objc_msgSend(WeakRetained, "queue");
    v14 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v14);

    -[HMEMessageDatagramServer _connectionItemForConnection:](WeakRetained, v13);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v15;
    if (v10)
    {
      v23 = v11;
      if (v15)
      {
        if (objc_msgSend(v11, "count"))
        {
          objc_msgSend(v16, "pendingEventItems");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "combinePreviousEvents:", v11);

        }
        if (objc_msgSend(v12, "count"))
        {
          objc_msgSend(v16, "pendingCachedEventItems");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "combinePreviousEvents:", v12);

        }
      }
      objc_msgSend(WeakRetained, "dataSource");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "server:isConnectionTerminatingError:", WeakRetained, v10);

      if (v20)
      {
        v21 = WeakRetained[8];
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v25 = v10;
          _os_log_error_impl(&dword_19B524000, v21, OS_LOG_TYPE_ERROR, "Removing connection on terminal error %@", buf, 0xCu);
        }
        -[HMEMessageDatagramServer _removeConnection:](WeakRetained, v13);
      }
      v11 = v23;
    }

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  -[HMEMessageDatagramServer _startDebounceTimerIfNeeded](WeakRetained);
LABEL_20:

}

- (uint64_t)_eventSize:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1)
  {
    if (v3)
    {
      objc_msgSend(v3, "encodedData");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v6, "length");

      objc_msgSend(v4, "eventMetadata");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        objc_msgSend(v4, "eventMetadata");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "source");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "length");

        v5 += v10 + 24;
      }
    }
  }

  return v5;
}

void __111__HMEMessageDatagramServer_connectWithConnection_connectEvent_unregisterEvent_topicFilterAdditions_completion___block_invoke(uint64_t a1)
{
  void *v2;
  os_log_t *v3;
  void *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "cachedEventsForExpandedTopics:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(os_log_t **)(a1 + 32);
  v5[0] = *(_QWORD *)(a1 + 48);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEMessageDatagramServer _addCachedEvents:connections:](v3, v2, v4);

}

- (void)_setupAndStartExpiryTimer
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  _BOOL4 v16;
  id v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v26[4];
  id v27;
  id location;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "connectionExpiryTimer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {

  }
  else
  {
    objc_msgSend(a1, "connectionInfoItems");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "count");

    if (v3)
    {
      objc_initWeak(&location, a1);
      objc_msgSend(a1, "dataSource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "serverTimerProvider:", a1);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "queue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v32 = 0u;
      objc_msgSend(a1, "connectionInfoItems");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)objc_msgSend(v5, "copy");

      v7 = 0;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v30;
        do
        {
          v10 = 0;
          do
          {
            v11 = v4;
            if (*(_QWORD *)v30 != v9)
              objc_enumerationMutation(v6);
            v12 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * v10);
            if (v7)
            {
              objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v10), "expiry");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v7, "expiry");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "timeIntervalSinceDate:", v14);
              v16 = v15 < 0.0;

              v4 = v11;
              if (v16)
              {
                v17 = v12;

                v7 = v17;
              }
            }
            else
            {
              v7 = v12;
            }
            ++v10;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
        }
        while (v8);
      }

      objc_msgSend(v7, "expiry");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "timeIntervalSinceNow");
      v20 = v19;

      v26[0] = MEMORY[0x1E0C809B0];
      v26[1] = 3221225472;
      v26[2] = __53__HMEMessageDatagramServer__setupAndStartExpiryTimer__block_invoke;
      v26[3] = &unk_1E3B31150;
      objc_copyWeak(&v27, &location);
      objc_msgSend(v23, "timerWithQueue:interval:timerFireHandler:", v4, v26, v20);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(a1, "setConnectionExpiryTimer:", v21);
      objc_msgSend(a1, "connectionExpiryTimer");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "resume");

      objc_destroyWeak(&v27);
      objc_destroyWeak(&location);
    }
  }
}

void __53__HMEMessageDatagramServer__setupAndStartExpiryTimer__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  _QWORD *v4;
  uint8_t buf[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = v4[8];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Connection expiry timer fired", buf, 2u);
    }
    -[HMEMessageDatagramServer _pruneExpiredItemsFromConnectionItems](v4);
    objc_msgSend(v4, "setConnectionExpiryTimer:", 0);
    -[HMEMessageDatagramServer _setupAndStartExpiryTimer](v4);
    WeakRetained = v4;
  }

}

void __46__HMEMessageDatagramServer_refreshConnection___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  os_log_t *v5;
  void *v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "topicRouter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "topicsForConsumer:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "cachedEventsForExpandedTopics:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(os_log_t **)(a1 + 32);
  v7[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEMessageDatagramServer _addCachedEvents:connections:](v5, v4, v6);

}

@end
