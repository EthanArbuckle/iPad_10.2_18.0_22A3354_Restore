@implementation HMEMessageDatagramClient

- (HMEMessageDatagramClient)initWithQueue:(id)a3 timerProvider:(id)a4 keepAliveInterval:(double)a5 dormantFetchTimerInterval:(double)a6 retryIntervalProvider:(id)a7
{
  return -[HMEMessageDatagramClient initWithQueue:timerProvider:keepAliveInterval:dormantFetchTimerInterval:retryIntervalProvider:storeReadHandle:storeWriteHandle:logCategory:](self, "initWithQueue:timerProvider:keepAliveInterval:dormantFetchTimerInterval:retryIntervalProvider:storeReadHandle:storeWriteHandle:logCategory:", a3, a4, a7, 0, 0, "MessageDatagramClient", a5, a6);
}

- (HMEMessageDatagramClient)initWithQueue:(id)a3 timerProvider:(id)a4 keepAliveInterval:(double)a5 dormantFetchTimerInterval:(double)a6 retryIntervalProvider:(id)a7 storeReadHandle:(id)a8 storeWriteHandle:(id)a9 logCategory:(const char *)a10
{
  id v19;
  id v20;
  id v21;
  OS_os_log *v22;
  OS_os_log *logger;
  OS_os_log *v24;
  HMEMessageDatagramClient *v25;
  HMEPendingTopicsCombiner *v26;
  HMEPendingTopicsCombiner *pendingTopicsCombiner;
  id v29;
  id v30;
  objc_super v31;

  v30 = a4;
  v29 = a7;
  v19 = a9;
  v20 = a8;
  v21 = a3;
  v22 = (OS_os_log *)os_log_create("com.apple.HomeKitEventRouter", a10);
  logger = self->_logger;
  self->_logger = v22;

  v24 = v22;
  v31.receiver = self;
  v31.super_class = (Class)HMEMessageDatagramClient;
  v25 = -[HMERouterClient initWithQueue:storeReadHandle:storeWriteHandle:logger:](&v31, sel_initWithQueue_storeReadHandle_storeWriteHandle_logger_, v21, v20, v19, v24);

  if (v25)
  {
    objc_storeStrong((id *)&v25->_logger, v22);
    v26 = objc_alloc_init(HMEPendingTopicsCombiner);
    pendingTopicsCombiner = v25->_pendingTopicsCombiner;
    v25->_pendingTopicsCombiner = v26;

    objc_storeStrong((id *)&v25->_timerProvider, a4);
    v25->_keepAliveInterval = a5;
    v25->_dormatFetchTimerInterval = a6;
    objc_storeStrong((id *)&v25->_connectionRetryIntervalProvider, a7);
    v25->_isConnected = 0;
    v25->_hasPendingRequest = 0;
    v25->_connectionMode = 1;
    v25->_isWaitingForFetchConditionsWhenDormant = 0;
    v25->_dormantFetchConditionsMet = 0;
  }

  return v25;
}

- (void)didReceiveMessageWithEvents:(id)a3 serverIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, void *);
  NSObject *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *logger;
  void *v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  objc_super v22;
  uint8_t buf[4];
  id v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, void *))a5;
  -[HMERouterClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Did not expect events when not connected.", buf, 2u);
    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 2;
    goto LABEL_10;
  }
  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v9);

  if ((v14 & 1) == 0)
  {
    v18 = self->_logger;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      v20 = v18;
      -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v24 = v9;
      v25 = 2112;
      v26 = v21;
      _os_log_error_impl(&dword_19B524000, v20, OS_LOG_TYPE_ERROR, "Event's from server %@ not from expected server %@.", buf, 0x16u);

    }
    v16 = (void *)MEMORY[0x1E0CB35C8];
    v17 = 3;
LABEL_10:
    objc_msgSend(v16, "errorWithDomain:code:userInfo:", CFSTR("HMEErrorDomain"), v17, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v10[2](v10, v19);

    goto LABEL_11;
  }
  v22.receiver = self;
  v22.super_class = (Class)HMEMessageDatagramClient;
  -[HMERouterClient processReceivedEvents:](&v22, sel_processReceivedEvents_, v8);
  v10[2](v10, 0);
LABEL_11:

}

- (void)didReceiveMessageWithCachedEvents:(id)a3 serverIdentifier:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  uint64_t v35;
  NSObject *logger;
  NSObject *v37;
  void *v38;
  id v39;
  objc_super v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t v45[128];
  uint8_t buf[4];
  id v47;
  __int16 v48;
  void *v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  -[HMERouterClient queue](self, "queue");
  v11 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v11);

  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else
  {
    -[HMEMessageDatagramClient connectingServerIdentifier](self, "connectingServerIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
    {
      logger = self->_logger;
      if (os_log_type_enabled(logger, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19B524000, logger, OS_LOG_TYPE_ERROR, "Did not expect cached events when not connected.", buf, 2u);
      }
      v34 = (void *)MEMORY[0x1E0CB35C8];
      v35 = 2;
      goto LABEL_26;
    }
  }
  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v14, "isEqual:", v9))
  {
    -[HMEMessageDatagramClient connectingServerIdentifier](self, "connectingServerIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "isEqual:", v9);

    if ((v16 & 1) != 0)
      goto LABEL_7;
    v33 = self->_logger;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      v37 = v33;
      -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v9;
      v48 = 2112;
      v49 = v38;
      _os_log_error_impl(&dword_19B524000, v37, OS_LOG_TYPE_ERROR, "Cached event's from server %@ not from expected server %@.", buf, 0x16u);

    }
    v34 = (void *)MEMORY[0x1E0CB35C8];
    v35 = 3;
LABEL_26:
    objc_msgSend(v34, "errorWithDomain:code:userInfo:", CFSTR("HMEErrorDomain"), v35, 0);
    v32 = objc_claimAutoreleasedReturnValue();
    v21 = (id)v32;
    goto LABEL_27;
  }

LABEL_7:
  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v9;
  if (v17)
  {

  }
  else
  {
    -[HMEMessageDatagramClient connectingServerIdentifier](self, "connectingServerIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isEqual:", v9);

    if (v19)
    {
      v20 = self->_logger;
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B524000, v20, OS_LOG_TYPE_DEFAULT, "Accepting cached events from pending connection.", buf, 2u);
      }
    }
  }
  v21 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v22 = v8;
  v23 = v8;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v42 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        objc_msgSend(v28, "event");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "topic");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKeyedSubscript:", v29, v30);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    }
    while (v25);
  }

  v40.receiver = self;
  v40.super_class = (Class)HMEMessageDatagramClient;
  v31 = -[HMERouterClient processReceivedCachedEvents:](&v40, sel_processReceivedCachedEvents_, v21);
  v32 = 0;
  v8 = v22;
  v9 = v39;
LABEL_27:
  v10[2](v10, v32);

}

- (id)didReceiveFetchResponseWithCachedEvents:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  objc_super v8;

  v4 = a3;
  -[HMERouterClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v8.receiver = self;
  v8.super_class = (Class)HMEMessageDatagramClient;
  -[HMERouterClient processReceivedCachedEvents:](&v8, sel_processReceivedCachedEvents_, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)serverDidChangeWithServerIdentifier:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char v7;
  NSObject *logger;
  void *v9;
  void *v10;
  char v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[HMERouterClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", v4);

  if ((v7 & 1) == 0)
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Server identifier changed and removing reconnection timer", (uint8_t *)&v16, 2u);
    }
    -[HMEMessageDatagramClient _removeReconnectionTimerAndResetInterval](self);
  }
  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isEqual:", v4);

    if ((v11 & 1) != 0)
      goto LABEL_14;
    v12 = self->_logger;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v4;
      v18 = 2112;
      v19 = v14;
      _os_log_impl(&dword_19B524000, v13, OS_LOG_TYPE_DEFAULT, "Server identifier changed to %@. Currently connected to %@", (uint8_t *)&v16, 0x16u);

    }
  }
  else
  {
    if (-[HMEMessageDatagramClient hasPendingServerChangeRequest](self, "hasPendingServerChangeRequest"))
      goto LABEL_14;
    v15 = self->_logger;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v4;
      _os_log_impl(&dword_19B524000, v15, OS_LOG_TYPE_DEFAULT, "Server identifier changed to %@. Currently disconnected.", (uint8_t *)&v16, 0xCu);
    }
  }
  -[HMEMessageDatagramClient setHasPendingServerChangeRequest:](self, "setHasPendingServerChangeRequest:", 1);
  if (!-[HMEMessageDatagramClient hasPendingRequest](self, "hasPendingRequest"))
    -[HMEMessageDatagramClient _performNextOperation](self);
LABEL_14:

}

- (void)connectionCapabilityDidChange
{
  NSObject *logger;
  uint8_t v4[16];

  logger = self->_logger;
  if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Connection capability changed.", v4, 2u);
  }
  -[HMEMessageDatagramClient _performNextOperation](self);
}

- (void)updateConnectionMode:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HMERouterClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__HMEMessageDatagramClient_updateConnectionMode_completion___block_invoke;
  block[3] = &unk_1E3B30F48;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)updateDormantFetchCondition:(int64_t)a3 completion:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  int64_t v11;

  v6 = a4;
  -[HMERouterClient queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__HMEMessageDatagramClient_updateDormantFetchCondition_completion___block_invoke;
  block[3] = &unk_1E3B30F48;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

- (void)resetReconnectTimerToInitialState
{
  NSObject *v3;

  -[HMERouterClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMEMessageDatagramClient _removeReconnectionTimerAndResetInterval](self);
  if (!-[HMEMessageDatagramClient hasPendingRequest](self, "hasPendingRequest"))
    -[HMEMessageDatagramClient _performNextOperation](self);
}

- (BOOL)handleChangeRegistrationsWithTopicFilterAdditions:(id)a3 removals:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v17[5];

  v6 = a4;
  v7 = a3;
  -[HMERouterClient topicRouter](self, "topicRouter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allRegisteredTopicFilters");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__HMEMessageDatagramClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke;
  v17[3] = &unk_1E3B31060;
  v17[4] = self;
  +[HMETopicRouter forwardingTopicsForAdditions:removals:current:indexProvider:](HMETopicRouter, "forwardingTopicsForAdditions:removals:current:indexProvider:", v7, v6, v9, v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HMEMessageDatagramClient pendingTopicsCombiner](self, "pendingTopicsCombiner");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "allObjects");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "combineWithAdditions:removals:", v13, v15);

  -[HMEMessageDatagramClient _performNextOperation](self);
  return 1;
}

- (id)upstreamTopicsForTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[HMEMessageDatagramClient dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client:upstreamTopicsForTopic:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)forwardingTopicsForTopics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMEMessageDatagramClient dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "client:forwardingTopicsForTopics:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

- (id)dumpStateDescription
{
  void *v3;
  int64_t v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  objc_super v14;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = -[HMEMessageDatagramClient connectionMode](self, "connectionMode");
  v5 = -[HMEMessageDatagramClient isConnected](self, "isConnected");
  -[HMEMessageDatagramClient connectedServerIdentifier](self, "connectedServerIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEMessageDatagramClient connectionRetryTimer](self, "connectionRetryTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "timeInterval");
  v9 = v8;
  v10 = -[HMEMessageDatagramClient dormantFetchConditionsMet](self, "dormantFetchConditionsMet");
  v14.receiver = self;
  v14.super_class = (Class)HMEMessageDatagramClient;
  -[HMERouterClient dumpStateDescription](&v14, sel_dumpStateDescription);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMEMessageDatagramClient connection mode: %ld, connected: %d, connected server UUID: %@, connection retry timer interval: %f, dormant fetch conditions met: %d, \n\t event router client: %@]"), v4, v5, v6, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (HMEMessageDatagramClientDataSource)dataSource
{
  return (HMEMessageDatagramClientDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (HMETimerIntervalProvider)connectionRetryIntervalProvider
{
  return (HMETimerIntervalProvider *)objc_getProperty(self, a2, 80, 1);
}

- (HMETimerProvider)timerProvider
{
  return (HMETimerProvider *)objc_getProperty(self, a2, 88, 1);
}

- (HMEPendingTopicsCombiner)pendingTopicsCombiner
{
  return (HMEPendingTopicsCombiner *)objc_getProperty(self, a2, 96, 1);
}

- (BOOL)isConnected
{
  return self->_isConnected;
}

- (void)setIsConnected:(BOOL)a3
{
  self->_isConnected = a3;
}

- (BOOL)hasPendingRequest
{
  return self->_hasPendingRequest;
}

- (void)setHasPendingRequest:(BOOL)a3
{
  self->_hasPendingRequest = a3;
}

- (BOOL)hasPendingServerChangeRequest
{
  return self->_hasPendingServerChangeRequest;
}

- (void)setHasPendingServerChangeRequest:(BOOL)a3
{
  self->_hasPendingServerChangeRequest = a3;
}

- (double)keepAliveInterval
{
  return self->_keepAliveInterval;
}

- (HMETimer)keepAliveTimer
{
  return self->_keepAliveTimer;
}

- (void)setKeepAliveTimer:(id)a3
{
  objc_storeStrong((id *)&self->_keepAliveTimer, a3);
}

- (HMETimer)connectionRetryTimer
{
  return self->_connectionRetryTimer;
}

- (void)setConnectionRetryTimer:(id)a3
{
  objc_storeStrong((id *)&self->_connectionRetryTimer, a3);
}

- (NSUUID)connectedServerIdentifier
{
  return self->_connectedServerIdentifier;
}

- (void)setConnectedServerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_connectedServerIdentifier, a3);
}

- (NSUUID)connectingServerIdentifier
{
  return self->_connectingServerIdentifier;
}

- (void)setConnectingServerIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_connectingServerIdentifier, a3);
}

- (int64_t)connectionMode
{
  return self->_connectionMode;
}

- (void)setConnectionMode:(int64_t)a3
{
  self->_connectionMode = a3;
}

- (double)dormatFetchTimerInterval
{
  return self->_dormatFetchTimerInterval;
}

- (HMETimer)dormantFetchTimer
{
  return self->_dormantFetchTimer;
}

- (void)setDormantFetchTimer:(id)a3
{
  objc_storeStrong((id *)&self->_dormantFetchTimer, a3);
}

- (BOOL)dormantFetchConditionsMet
{
  return self->_dormantFetchConditionsMet;
}

- (void)setDormantFetchConditionsMet:(BOOL)a3
{
  self->_dormantFetchConditionsMet = a3;
}

- (BOOL)isWaitingForFetchConditionsWhenDormant
{
  return self->_isWaitingForFetchConditionsWhenDormant;
}

- (void)setIsWaitingForFetchConditionsWhenDormant:(BOOL)a3
{
  self->_isWaitingForFetchConditionsWhenDormant = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dormantFetchTimer, 0);
  objc_storeStrong((id *)&self->_connectingServerIdentifier, 0);
  objc_storeStrong((id *)&self->_connectedServerIdentifier, 0);
  objc_storeStrong((id *)&self->_connectionRetryTimer, 0);
  objc_storeStrong((id *)&self->_keepAliveTimer, 0);
  objc_storeStrong((id *)&self->_pendingTopicsCombiner, 0);
  objc_storeStrong((id *)&self->_timerProvider, 0);
  objc_storeStrong((id *)&self->_connectionRetryIntervalProvider, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_logger, 0);
}

uint64_t __87__HMEMessageDatagramClient_handleChangeRegistrationsWithTopicFilterAdditions_removals___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "forwardingTopicsForTopics:", a2);
}

- (void)_performNextOperation
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  char v5;
  uint64_t v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  NSObject *v34;
  void *v35;
  uint8_t v36[16];
  uint8_t buf[8];
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  id location;

  if (a1)
  {
    objc_msgSend(a1, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    if (objc_msgSend(a1, "hasPendingServerChangeRequest"))
    {
      v3 = a1[7];
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Will disconnect due to pending server change request", buf, 2u);
      }
      -[HMEMessageDatagramClient _didDisconnect](a1);
      -[HMEMessageDatagramClient _performNextOperation](a1);
    }
    objc_msgSend(a1, "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "clientIsEnabled:", a1);

    if ((v5 & 1) != 0)
    {
      if ((objc_msgSend(a1, "hasPendingRequest") & 1) == 0)
      {
        v6 = objc_msgSend(a1, "connectionMode");
        if (v6 == 2)
        {
          if (objc_msgSend(a1, "isConnected") && (objc_msgSend(a1, "hasPendingRequest") & 1) == 0)
          {
            v15 = a1[7];
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_19B524000, v15, OS_LOG_TYPE_DEFAULT, "Will disconnect as connection mode is not connectionless", buf, 2u);
            }
            -[HMEMessageDatagramClient _performDisconnectRequest](a1);
          }
          objc_msgSend(a1, "queue");
          v16 = objc_claimAutoreleasedReturnValue();
          dispatch_assert_queue_V2(v16);

          if (objc_msgSend(a1, "connectionMode") == 2)
          {
            objc_msgSend(a1, "dormantFetchTimer");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
            {

            }
            else if ((objc_msgSend(a1, "isWaitingForFetchConditionsWhenDormant") & 1) == 0)
            {
              objc_initWeak(&location, a1);
              objc_msgSend(a1, "timerProvider");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "queue");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "dormatFetchTimerInterval");
              v27 = v26;
              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              v38 = 3221225472;
              v39 = __60__HMEMessageDatagramClient__enableDormantFetchTimerIfNeeded__block_invoke;
              v40 = &unk_1E3B31150;
              objc_copyWeak(&v41, &location);
              objc_msgSend(v24, "timerWithQueue:interval:timerFireHandler:", v25, buf, v27);
              v28 = (void *)objc_claimAutoreleasedReturnValue();

              v29 = a1[7];
              if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)v36 = 0;
                _os_log_impl(&dword_19B524000, v29, OS_LOG_TYPE_DEFAULT, "Starting dormant fetch timer.", v36, 2u);
              }
              objc_msgSend(a1, "setDormantFetchTimer:", v28);
              objc_msgSend(a1, "dormantFetchTimer");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v30, "resume");

              objc_destroyWeak(&v41);
              objc_destroyWeak(&location);
            }
          }
        }
        else if (v6 == 1)
        {
          v7 = objc_msgSend(a1, "isConnected");
          objc_msgSend(a1, "topicRouter");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "allRegisteredTopicFilters");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if ((v7 & 1) != 0)
          {
            v11 = objc_msgSend(v9, "count");

            if (!v11)
            {
              -[HMEMessageDatagramClient _performDisconnectRequest](a1);
              return;
            }
            objc_msgSend(a1, "pendingTopicsCombiner");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v12, "topicFiltersToAdd");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v13, "count"))
            {

LABEL_38:
              objc_msgSend(a1, "queue");
              v34 = objc_claimAutoreleasedReturnValue();
              dispatch_assert_queue_V2(v34);

              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              v38 = 3221225472;
              v39 = __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke;
              v40 = &unk_1E3B30F98;
              v41 = a1;
              -[HMEMessageDatagramClient _performRequestWithBlock:](a1, buf);
              return;
            }
            objc_msgSend(a1, "pendingTopicsCombiner");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "topicFiltersToRemove");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = objc_msgSend(v32, "count");

            if (v33)
              goto LABEL_38;
            objc_msgSend(a1, "connectionRetryTimer");
            v35 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v35)
              -[HMEMessageDatagramClient _enableKeepAliveIfNeeded](a1);
          }
          else
          {

            if (objc_msgSend(v10, "count"))
            {
              v18 = a1[7];
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_19B524000, v18, OS_LOG_TYPE_DEFAULT, "Will perform connect operation", buf, 2u);
              }
              objc_msgSend(a1, "pendingTopicsCombiner");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v19, "reset");

              objc_msgSend(a1, "pendingTopicsCombiner");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(a1, "forwardingTopicsForTopics:", v10);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "allObjects");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "combineWithAdditions:removals:", v22, MEMORY[0x1E0C9AA60]);

              objc_msgSend(a1, "queue");
              v23 = objc_claimAutoreleasedReturnValue();
              dispatch_assert_queue_V2(v23);

              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              v38 = 3221225472;
              v39 = __50__HMEMessageDatagramClient__performConnectRequest__block_invoke;
              v40 = &unk_1E3B30F98;
              v41 = a1;
              -[HMEMessageDatagramClient _performRequestWithBlock:](a1, buf);
            }

          }
        }
      }
    }
    else if (objc_msgSend(a1, "isConnected"))
    {
      v14 = a1[7];
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19B524000, v14, OS_LOG_TYPE_DEFAULT, "Client is not enabled disconnect silently.", buf, 2u);
      }
      -[HMEMessageDatagramClient _didDisconnect](a1);
    }
  }
}

- (void)_didDisconnect
{
  NSObject *v2;
  id v3;

  objc_msgSend(a1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(a1, "setIsConnected:", 0);
  objc_msgSend(a1, "setHasPendingServerChangeRequest:", 0);
  objc_msgSend(a1, "setConnectedServerIdentifier:", 0);
  -[HMEMessageDatagramClient _removeKeepAliveTimer](a1);
  objc_msgSend(a1, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "clientDidDisconnect:", a1);

}

- (void)_performDisconnectRequest
{
  NSObject *v2;
  _QWORD v3[5];

  objc_msgSend(a1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke;
  v3[3] = &unk_1E3B30F98;
  v3[4] = a1;
  -[HMEMessageDatagramClient _performRequestWithBlock:](a1, v3);
}

- (void)_enableKeepAliveIfNeeded
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint8_t v12[16];
  _QWORD v13[4];
  id v14;
  id location;

  objc_msgSend(a1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  if (objc_msgSend(a1, "isConnected"))
  {
    objc_msgSend(a1, "keepAliveTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {

    }
    else
    {
      objc_msgSend(a1, "connectionRetryTimer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        objc_initWeak(&location, a1);
        objc_msgSend(a1, "timerProvider");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "queue");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(a1, "keepAliveInterval");
        v8 = v7;
        v13[0] = MEMORY[0x1E0C809B0];
        v13[1] = 3221225472;
        v13[2] = __52__HMEMessageDatagramClient__enableKeepAliveIfNeeded__block_invoke;
        v13[3] = &unk_1E3B31150;
        objc_copyWeak(&v14, &location);
        objc_msgSend(v5, "timerWithQueue:interval:timerFireHandler:", v6, v13, v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        v10 = a1[7];
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_19B524000, v10, OS_LOG_TYPE_DEFAULT, "Starting keep alive timer.", v12, 2u);
        }
        objc_msgSend(a1, "setKeepAliveTimer:", v9);
        objc_msgSend(a1, "keepAliveTimer");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "resume");

        objc_destroyWeak(&v14);
        objc_destroyWeak(&location);
      }
    }
  }
}

void __60__HMEMessageDatagramClient__enableDormantFetchTimerIfNeeded__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  char v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  _QWORD *v8;
  uint8_t buf[16];
  uint8_t v10[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v8 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    -[HMEMessageDatagramClient _removeDormantFetchTimer](v8);
    if (objc_msgSend(v8, "connectionMode") == 2)
    {
      if ((objc_msgSend(v8, "dormantFetchConditionsMet") & 1) == 0)
      {
        v7 = v8[7];
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_19B524000, v7, OS_LOG_TYPE_DEFAULT, "Conditions to fetch not met will fetch later.", v10, 2u);
        }
        objc_msgSend(v8, "setIsWaitingForFetchConditionsWhenDormant:", 1);
        goto LABEL_11;
      }
      v4 = objc_msgSend(v8, "hasPendingRequest");
      v2 = v8;
      if ((v4 & 1) == 0)
      {
        -[HMEMessageDatagramClient _performSubscriptionFetchRequest](v8);
LABEL_11:
        v2 = v8;
      }
    }
    else
    {
      v5 = v8[7];
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
      v2 = v8;
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19B524000, v5, OS_LOG_TYPE_ERROR, "Unexpected connection mode.", buf, 2u);
        goto LABEL_11;
      }
    }
  }

}

- (uint64_t)_removeDormantFetchTimer
{
  NSObject *v2;
  void *v3;

  objc_msgSend(a1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(a1, "dormantFetchTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "suspend");

  return objc_msgSend(a1, "setDormantFetchTimer:", 0);
}

- (void)_performSubscriptionFetchRequest
{
  NSObject *v2;
  _QWORD v3[5];

  objc_msgSend(a1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke;
  v3[3] = &unk_1E3B30F98;
  v3[4] = a1;
  -[HMEMessageDatagramClient _performRequestWithBlock:](a1, v3);
}

void __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  os_log_t *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  void (**v12)(_QWORD);
  id v13;
  id buf[2];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(os_log_t **)(a1 + 32);
  v6 = v5[7];
  if (v4)
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19B524000, v6, OS_LOG_TYPE_DEFAULT, "Sending subscription fetch request", (uint8_t *)buf, 2u);
      v5 = *(os_log_t **)(a1 + 32);
    }
    objc_initWeak(buf, v5);
    v7 = *(void **)(a1 + 32);
    objc_msgSend(v7, "topicRouter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "allRegisteredTopicFilters");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke_27;
    v11[3] = &unk_1E3B31010;
    objc_copyWeak(&v13, buf);
    v12 = v3;
    objc_msgSend(v4, "client:fetchWithFilters:isMultiHop:completion:", v7, v10, 0, v11);

    objc_destroyWeak(&v13);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_19B524000, v6, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)buf, 2u);
    }
    v3[2](v3);
  }

}

- (void)_performRequestWithBlock:(void *)a1
{
  void (**v3)(id, _QWORD *);
  NSObject *v4;
  _QWORD v5[5];

  v3 = a2;
  objc_msgSend(a1, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v4);

  objc_msgSend(a1, "setHasPendingRequest:", 1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __53__HMEMessageDatagramClient__performRequestWithBlock___block_invoke;
  v5[3] = &unk_1E3B310D8;
  v5[4] = a1;
  v3[2](v3, v5);

}

uint64_t __53__HMEMessageDatagramClient__performRequestWithBlock___block_invoke(uint64_t a1)
{
  NSObject *v2;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  return objc_msgSend(*(id *)(a1 + 32), "setHasPendingRequest:", 0);
}

void __60__HMEMessageDatagramClient__performSubscriptionFetchRequest__block_invoke_27(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v3 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v3);

    objc_msgSend(v4, "setIsWaitingForFetchConditionsWhenDormant:", 0);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    -[HMEMessageDatagramClient _performNextOperation](v4);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __52__HMEMessageDatagramClient__enableKeepAliveIfNeeded__block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD *v6;
  uint8_t buf[8];
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  _QWORD *v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v6 = WeakRetained;
    objc_msgSend(WeakRetained, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    v3 = v6[7];
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19B524000, v3, OS_LOG_TYPE_DEFAULT, "Keep-alive timer fired.", buf, 2u);
    }
    if (objc_msgSend(v6, "isConnected") && (objc_msgSend(v6, "hasPendingRequest") & 1) == 0)
    {
      objc_msgSend(v6, "queue");
      v5 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v5);

      *(_QWORD *)buf = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke;
      v10 = &unk_1E3B30F98;
      v11 = v6;
      -[HMEMessageDatagramClient _performRequestWithBlock:](v6, buf);
    }
    else
    {
      v4 = v6[7];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_19B524000, v4, OS_LOG_TYPE_ERROR, "Remove keep-alive, conditions to perform request not met.", buf, 2u);
      }
      -[HMEMessageDatagramClient _removeKeepAliveTimer](v6);
    }
    WeakRetained = v6;
  }

}

- (void)_removeKeepAliveTimer
{
  void *v1;
  NSObject *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(v1, "keepAliveTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suspend");

    return (void *)objc_msgSend(v1, "setKeepAliveTimer:", 0);
  }
  return result;
}

void __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  os_log_t *v5;
  NSObject *v6;
  uint64_t v7;
  _QWORD v8[4];
  void (**v9)(_QWORD);
  id v10;
  id buf[2];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(os_log_t **)(a1 + 32);
  v6 = v5[7];
  if (v4)
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19B524000, v6, OS_LOG_TYPE_DEFAULT, "Sending keep-alive request", (uint8_t *)buf, 2u);
      v5 = *(os_log_t **)(a1 + 32);
    }
    objc_initWeak(buf, v5);
    v7 = *(_QWORD *)(a1 + 32);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke_22;
    v8[3] = &unk_1E3B30FE8;
    objc_copyWeak(&v10, buf);
    v9 = v3;
    objc_msgSend(v4, "sendKeepAliveForClient:completion:", v7, v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak(buf);
  }
  else
  {
    if (os_log_type_enabled(v5[7], OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_19B524000, v6, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)buf, 2u);
    }
    v3[2](v3);
  }

}

void __52__HMEMessageDatagramClient__performKeepAliveRequest__block_invoke_22(uint64_t a1, void *a2)
{
  __CFString *v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  const __CFString *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_7:
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_14;
  }
  objc_msgSend(WeakRetained, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v6);

  if (v3)
  {
    objc_msgSend(v5, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "client:isConnectionTerminatingError:", v5, v3);

    if (v8)
    {
      v9 = v5[7];
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v13 = 138412290;
        v14 = v3;
        _os_log_error_impl(&dword_19B524000, v9, OS_LOG_TYPE_ERROR, "Keep alive request responded with terminating error: %@", (uint8_t *)&v13, 0xCu);
      }
      -[HMEMessageDatagramClient _didDisconnect](v5);
      -[HMEMessageDatagramClient _enableReconnectTimer](v5);
      goto LABEL_7;
    }
  }
  v10 = v5[7];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR(" with non-terminating error: ");
    v12 = &stru_1E3B31538;
    if (v3)
      v12 = v3;
    else
      v11 = &stru_1E3B31538;
    v13 = 138412546;
    v14 = v11;
    v15 = 2112;
    v16 = v12;
    _os_log_impl(&dword_19B524000, v10, OS_LOG_TYPE_DEFAULT, "Keep alive request responded%@%@", (uint8_t *)&v13, 0x16u);
  }
  -[HMEMessageDatagramClient _removeKeepAliveTimer](v5);
  -[HMEMessageDatagramClient _enableKeepAliveIfNeeded](v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  -[HMEMessageDatagramClient _performNextOperation](v5);
LABEL_14:

}

- (void)_enableReconnectTimer
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14[2];
  id location;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v2);

  objc_msgSend(a1, "dataSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v12, "clientIsEnabled:", a1) & 1) != 0)
  {
    objc_msgSend(a1, "connectionRetryTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(a1, "connectionRetryIntervalProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "nextInterval");
      v6 = v5;

      objc_initWeak(&location, a1);
      objc_msgSend(a1, "timerProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "queue");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __49__HMEMessageDatagramClient__enableReconnectTimer__block_invoke;
      v13[3] = &unk_1E3B31038;
      objc_copyWeak(v14, &location);
      v14[1] = v6;
      objc_msgSend(v7, "timerWithQueue:interval:timerFireHandler:", v8, v13, *(double *)&v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = a1[7];
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        v17 = v6;
        _os_log_impl(&dword_19B524000, v10, OS_LOG_TYPE_DEFAULT, "Starting connection retry timer with interval: %f", buf, 0xCu);
      }
      objc_msgSend(a1, "setConnectionRetryTimer:", v9);
      objc_msgSend(a1, "connectionRetryTimer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "resume");

      objc_destroyWeak(v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {

  }
}

void __49__HMEMessageDatagramClient__enableReconnectTimer__block_invoke(uint64_t a1)
{
  NSObject **WeakRetained;
  NSObject **v3;
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v4 = WeakRetained[7];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(_QWORD *)(a1 + 40);
      v7 = 134217984;
      v8 = v5;
      _os_log_impl(&dword_19B524000, v4, OS_LOG_TYPE_DEFAULT, "Connection retry timer fired: %f", (uint8_t *)&v7, 0xCu);
    }
    objc_msgSend(v3, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    -[HMEMessageDatagramClient _removeReconnectTimer](v3);
    if ((objc_msgSend(v3, "hasPendingRequest") & 1) == 0)
      -[HMEMessageDatagramClient _performNextOperation](v3);
  }

}

- (void)_removeReconnectTimer
{
  void *v1;
  NSObject *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    objc_msgSend(result, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(v1, "connectionRetryTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "suspend");

    return (void *)objc_msgSend(v1, "setConnectionRetryTimer:", 0);
  }
  return result;
}

void __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD *v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  id v15;
  id v16;
  NSObject *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  void (**v21)(_QWORD);
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    -[HMEMessageDatagramClient _removeReconnectTimer](v5);
    objc_msgSend(*(id *)(a1 + 32), "pendingTopicsCombiner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topicFiltersToAdd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pendingTopicsCombiner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topicFiltersToRemove");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pendingTopicsCombiner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "reset");

    v11 = *(_QWORD **)(a1 + 32);
    v12 = v11[7];
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = v12;
      *(_DWORD *)buf = 134218240;
      v24 = objc_msgSend(v7, "count");
      v25 = 2048;
      v26 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_19B524000, v13, OS_LOG_TYPE_DEFAULT, "Sending change registrations request with additions: %ld removals: %ld", buf, 0x16u);

      v11 = *(_QWORD **)(a1 + 32);
      v12 = v11[7];
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      v24 = (uint64_t)v7;
      v25 = 2112;
      v26 = (uint64_t)v9;
      _os_log_debug_impl(&dword_19B524000, v12, OS_LOG_TYPE_DEBUG, "Sending change registrations request with additions: %@ removals: %@", buf, 0x16u);
      v11 = *(_QWORD **)(a1 + 32);
    }
    objc_initWeak((id *)buf, v11);
    v14 = *(_QWORD *)(a1 + 32);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke_18;
    v18[3] = &unk_1E3B30FC0;
    objc_copyWeak(&v22, (id *)buf);
    v21 = v3;
    v15 = v7;
    v19 = v15;
    v16 = v9;
    v20 = v16;
    objc_msgSend(v4, "client:sendChangeRegistrationsWithAddedFilters:removedFilters:completion:", v14, v15, v16, v18);

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    v17 = v5[7];
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_19B524000, v17, OS_LOG_TYPE_ERROR, "No delegate set", buf, 2u);
    }
    v3[2](v3);
  }

}

void __62__HMEMessageDatagramClient__performChangeRegistrationsRequest__block_invoke_18(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD *WeakRetained;
  _QWORD *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE v25[22];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  v8 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_8:
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
    goto LABEL_16;
  }
  objc_msgSend(WeakRetained, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v9);

  if (v6)
  {
    objc_msgSend(v8, "pendingTopicsCombiner");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "combineOntoPreviousAdditions:removals:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

    v11 = v8[7];
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v25 = 138412290;
      *(_QWORD *)&v25[4] = v6;
      _os_log_error_impl(&dword_19B524000, v11, OS_LOG_TYPE_ERROR, "Unable to process change registrations error %@", v25, 0xCu);
    }
    objc_msgSend(v8, "dataSource");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "client:isConnectionTerminatingError:", v8, v6);

    if (v13)
      -[HMEMessageDatagramClient _didDisconnect](v8);
    -[HMEMessageDatagramClient _enableReconnectTimer](v8);
    goto LABEL_8;
  }
  v14 = v8[7];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v25 = 0;
    _os_log_impl(&dword_19B524000, v14, OS_LOG_TYPE_DEFAULT, "Successfully processed change registrations request", v25, 2u);
    v14 = v8[7];
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    v23 = *(_QWORD *)(a1 + 32);
    v24 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)v25 = 138412546;
    *(_QWORD *)&v25[4] = v23;
    *(_WORD *)&v25[12] = 2112;
    *(_QWORD *)&v25[14] = v24;
    _os_log_debug_impl(&dword_19B524000, v14, OS_LOG_TYPE_DEBUG, "Successfully processed change registrations request with additions: %@ removals: %@", v25, 0x16u);
  }
  v15 = v5;
  objc_msgSend(v8, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  objc_msgSend(v8, "connectionRetryIntervalProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reset");

  v18 = v8[7];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)MEMORY[0x1E0CB37E8];
    v20 = v18;
    objc_msgSend(v19, "numberWithUnsignedInteger:", objc_msgSend(v15, "count"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v25 = 138412290;
    *(_QWORD *)&v25[4] = v21;
    _os_log_impl(&dword_19B524000, v20, OS_LOG_TYPE_INFO, "Received cached events on change registrations %@", v25, 0xCu);

  }
  *(_QWORD *)v25 = v8;
  *(_QWORD *)&v25[8] = HMEMessageDatagramClient;
  v22 = objc_msgSendSuper2((objc_super *)v25, sel_processReceivedCachedEvents_, v15);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  -[HMEMessageDatagramClient _performNextOperation](v8);
LABEL_16:

}

void __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD *v5;
  _QWORD *v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  id v12;
  id buf[2];

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    -[HMEMessageDatagramClient _removeKeepAliveTimer](v5);
    v6 = *(_QWORD **)(a1 + 32);
    v7 = v6[7];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19B524000, v7, OS_LOG_TYPE_DEFAULT, "Sending disconnect request", (uint8_t *)buf, 2u);
      v6 = *(_QWORD **)(a1 + 32);
    }
    objc_initWeak(buf, v6);
    v8 = *(_QWORD *)(a1 + 32);
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke_20;
    v10[3] = &unk_1E3B30FE8;
    objc_copyWeak(&v12, buf);
    v11 = v3;
    objc_msgSend(v4, "sendDisconnectForClient:completion:", v8, v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  else
  {
    v9 = v5[7];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf[0]) = 0;
      _os_log_error_impl(&dword_19B524000, v9, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)buf, 2u);
    }
    v3[2](v3);
  }

}

void __53__HMEMessageDatagramClient__performDisconnectRequest__block_invoke_20(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *WeakRetained;
  _QWORD *v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v6);

    v7 = v5[7];
    if (v3)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v8 = 138412290;
        v9 = v3;
        _os_log_error_impl(&dword_19B524000, v7, OS_LOG_TYPE_ERROR, "Did not disconnect cleanly got error %@", (uint8_t *)&v8, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_19B524000, v7, OS_LOG_TYPE_DEFAULT, "Did disconnect", (uint8_t *)&v8, 2u);
    }
    -[HMEMessageDatagramClient _didDisconnect](v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    -[HMEMessageDatagramClient _performNextOperation](v5);
  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

void __50__HMEMessageDatagramClient__performConnectRequest__block_invoke(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  void *v13;
  NSObject *v14;
  _QWORD v15[4];
  id v16;
  void (**v17)(_QWORD);
  id v18;
  id location[4];

  location[3] = *(id *)MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD **)(a1 + 32);
  if (v4)
  {
    objc_msgSend(v5, "pendingTopicsCombiner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "topicFiltersToAdd");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "pendingTopicsCombiner");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "reset");

    -[HMEMessageDatagramClient _removeReconnectTimer](*(void **)(a1 + 32));
    v9 = *(_QWORD **)(a1 + 32);
    v10 = v9[7];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(location[0]) = 138412290;
      *(id *)((char *)location + 4) = v7;
      _os_log_debug_impl(&dword_19B524000, v10, OS_LOG_TYPE_DEBUG, "Sending connect request with additions %@", (uint8_t *)location, 0xCu);
      v9 = *(_QWORD **)(a1 + 32);
    }
    objc_initWeak(location, v9);
    v11 = *(_QWORD *)(a1 + 32);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __50__HMEMessageDatagramClient__performConnectRequest__block_invoke_15;
    v15[3] = &unk_1E3B30F70;
    objc_copyWeak(&v18, location);
    v17 = v3;
    v12 = v7;
    v16 = v12;
    objc_msgSend(v4, "client:sendConnectWithAddedFilters:completion:", v11, v12, v15);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setConnectingServerIdentifier:", v13);

    objc_destroyWeak(&v18);
    objc_destroyWeak(location);

  }
  else
  {
    v14 = v5[7];
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      LOWORD(location[0]) = 0;
      _os_log_error_impl(&dword_19B524000, v14, OS_LOG_TYPE_ERROR, "No delegate set", (uint8_t *)location, 2u);
    }
    v3[2](v3);
  }

}

void __50__HMEMessageDatagramClient__performConnectRequest__block_invoke_15(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  _QWORD *WeakRetained;
  _QWORD *v11;
  NSObject *v12;
  NSObject *v13;
  id v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  id v23;
  void *v24;
  NSObject *v25;
  _BYTE v26[22];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = a4;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  v11 = WeakRetained;
  if (!WeakRetained)
  {
LABEL_12:
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    goto LABEL_13;
  }
  objc_msgSend(WeakRetained, "queue");
  v12 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v12);

  objc_msgSend(v11, "setConnectingServerIdentifier:", 0);
  if (!v7 || v9)
  {
    objc_msgSend(v11, "pendingTopicsCombiner");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "combineOntoPreviousAdditions:removals:", *(_QWORD *)(a1 + 32), MEMORY[0x1E0C9AA60]);

    v25 = v11[7];
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v26 = 138412546;
      *(_QWORD *)&v26[4] = v7;
      *(_WORD *)&v26[12] = 2112;
      *(_QWORD *)&v26[14] = v9;
      _os_log_error_impl(&dword_19B524000, v25, OS_LOG_TYPE_ERROR, "Unable to connect to %@ got error %@", v26, 0x16u);
    }
    -[HMEMessageDatagramClient _didDisconnect](v11);
    -[HMEMessageDatagramClient _enableReconnectTimer](v11);
    goto LABEL_12;
  }
  v13 = v11[7];
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v26 = 138412290;
    *(_QWORD *)&v26[4] = v7;
    _os_log_impl(&dword_19B524000, v13, OS_LOG_TYPE_DEFAULT, "Successfully connected with %@.", v26, 0xCu);
  }
  v14 = v8;
  v15 = v7;
  objc_msgSend(v11, "queue");
  v16 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v16);

  objc_msgSend(v11, "setIsConnected:", 1);
  objc_msgSend(v11, "setConnectedServerIdentifier:", v15);
  objc_msgSend(v11, "connectionRetryIntervalProvider");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "reset");

  -[HMEMessageDatagramClient _enableKeepAliveIfNeeded](v11);
  objc_msgSend(v11, "delegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "clientDidConnect:serverIdentifier:", v11, v15);

  v19 = v11[7];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    v20 = (void *)MEMORY[0x1E0CB37E8];
    v21 = v19;
    objc_msgSend(v20, "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v26 = 138412290;
    *(_QWORD *)&v26[4] = v22;
    _os_log_impl(&dword_19B524000, v21, OS_LOG_TYPE_INFO, "Received cached events on connect %@", v26, 0xCu);

  }
  *(_QWORD *)v26 = v11;
  *(_QWORD *)&v26[8] = HMEMessageDatagramClient;
  v23 = objc_msgSendSuper2((objc_super *)v26, sel_processReceivedCachedEvents_, v14);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  -[HMEMessageDatagramClient _performNextOperation](v11);
LABEL_13:

}

- (void)_removeReconnectionTimerAndResetInterval
{
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (a1)
  {
    objc_msgSend(a1, "queue");
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_assert_queue_V2(v2);

    objc_msgSend(a1, "connectionRetryTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = a1[7];
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_19B524000, v4, OS_LOG_TYPE_DEFAULT, "Removing reconnection timer", v6, 2u);
      }
      -[HMEMessageDatagramClient _removeReconnectTimer](a1);
    }
    objc_msgSend(a1, "connectionRetryIntervalProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reset");

  }
}

uint64_t __67__HMEMessageDatagramClient_updateDormantFetchCondition_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 48);
  if ((v2 == 1) != objc_msgSend(*(id *)(a1 + 32), "dormantFetchConditionsMet"))
  {
    v3 = *(_QWORD **)(a1 + 32);
    v4 = v3[7];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = (void *)MEMORY[0x1E0CB37E8];
      v6 = v4;
      objc_msgSend(v5, "numberWithBool:", v2 == 1);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v7;
      _os_log_impl(&dword_19B524000, v6, OS_LOG_TYPE_DEFAULT, "Updating fetch allowed to %{public}@", (uint8_t *)&v11, 0xCu);

      v3 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v3, "setDormantFetchConditionsMet:", v2 == 1);
    v8 = *(void **)(a1 + 32);
    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v9 = objc_claimAutoreleasedReturnValue();
      dispatch_assert_queue_V2(v9);

      if (objc_msgSend(v8, "connectionMode") == 2
        && objc_msgSend(v8, "isWaitingForFetchConditionsWhenDormant")
        && (objc_msgSend(v8, "hasPendingRequest") & 1) == 0)
      {
        -[HMEMessageDatagramClient _performSubscriptionFetchRequest](v8);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __60__HMEMessageDatagramClient_updateConnectionMode_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  NSObject *v5;
  __CFString *v6;
  __CFString *v7;
  NSObject *v8;
  uint64_t v9;
  _QWORD *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  uint8_t v15[24];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(*(id *)(a1 + 32), "connectionMode");
  v3 = *(_QWORD *)(a1 + 48);
  if (v2 != v3)
  {
    v4 = *(_QWORD **)(a1 + 32);
    v5 = v4[7];
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("Unknown mode");
      if (v3 == 2)
        v6 = CFSTR("connectionless");
      if (v3 == 1)
        v6 = CFSTR("keep-alive");
      v7 = v6;
      *(_DWORD *)v15 = 138412290;
      *(_QWORD *)&v15[4] = v7;
      v8 = v5;
      _os_log_impl(&dword_19B524000, v8, OS_LOG_TYPE_DEFAULT, "Updated connection mode to %@", v15, 0xCu);

      v3 = *(_QWORD *)(a1 + 48);
      v4 = *(_QWORD **)(a1 + 32);
    }
    objc_msgSend(v4, "setConnectionMode:", v3, *(_OWORD *)v15);
    v9 = objc_msgSend(*(id *)(a1 + 32), "connectionMode");
    if (v9 == 2)
    {
      v10 = *(_QWORD **)(a1 + 32);
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "queue");
        v12 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v12);

        objc_msgSend(v10, "queue");
        v13 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v13);

        if (objc_msgSend(v10, "connectionMode") == 2)
        {
          if (objc_msgSend(v10, "isConnected"))
            goto LABEL_12;
        }
      }
    }
    else if (v9 == 1)
    {
      v10 = *(_QWORD **)(a1 + 32);
      if (v10)
      {
        objc_msgSend(*(id *)(a1 + 32), "queue");
        v11 = objc_claimAutoreleasedReturnValue();
        dispatch_assert_queue_V2(v11);

        objc_msgSend(v10, "setIsWaitingForFetchConditionsWhenDormant:", 0);
        -[HMEMessageDatagramClient _removeDormantFetchTimer](v10);
LABEL_12:
        -[HMEMessageDatagramClient _performNextOperation](v10);
      }
    }
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

@end
