@implementation HMEPersistentConnectionClient

- (HMEPersistentConnectionClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5
{
  id v8;
  id v9;
  id v10;
  OS_os_log *v11;
  OS_os_log *logger;
  HMEPersistentConnectionClient *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (OS_os_log *)os_log_create("com.apple.HomeKitEventRouter", "PersistentConnectionClient");
  logger = self->_logger;
  self->_logger = v11;

  v13 = -[HMEPersistentConnectionClient initWithQueue:storeReadHandle:storeWriteHandle:logger:](self, "initWithQueue:storeReadHandle:storeWriteHandle:logger:", v10, v9, v8, v11);
  return v13;
}

- (HMEPersistentConnectionClient)initWithQueue:(id)a3 storeReadHandle:(id)a4 storeWriteHandle:(id)a5 logger:(id)a6
{
  id v11;
  HMEPersistentConnectionClient *v12;
  HMEPersistentConnectionClient *v13;
  objc_super v15;

  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)HMEPersistentConnectionClient;
  v12 = -[HMERouterClient initWithQueue:storeReadHandle:storeWriteHandle:logger:](&v15, sel_initWithQueue_storeReadHandle_storeWriteHandle_logger_, a3, a4, a5, v11);
  v13 = v12;
  if (v12)
    objc_storeStrong((id *)&v12->_logger, a6);

  return v13;
}

- (HMEPersistentConnectionClient)initWithQueue:(id)a3
{
  return -[HMEPersistentConnectionClient initWithQueue:storeReadHandle:storeWriteHandle:](self, "initWithQueue:storeReadHandle:storeWriteHandle:", a3, 0, 0);
}

- (void)didReconnect
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *logger;
  void *v9;
  _QWORD v10[5];
  id v11;
  id buf[2];

  -[HMERouterClient queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[HMERouterClient topicRouter](self, "topicRouter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allRegisteredTopicFilters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMEPersistentConnectionClient forwardingTopicsForTopics:](self, "forwardingTopicsForTopics:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allObjects");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    logger = self->_logger;
    if (os_log_type_enabled(logger, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_19B524000, logger, OS_LOG_TYPE_DEFAULT, "Reregistering topics on reconnect.", (uint8_t *)buf, 2u);
    }
    objc_initWeak(buf, self);
    -[HMEPersistentConnectionClient delegate](self, "delegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __45__HMEPersistentConnectionClient_didReconnect__block_invoke;
    v10[3] = &unk_1E3B311F0;
    objc_copyWeak(&v11, buf);
    v10[4] = self;
    objc_msgSend(v9, "sendChangeRegistrationsMessageWithAddedFilters:removedFilters:completion:", v7, MEMORY[0x1E0C9AA60], v10);

    objc_destroyWeak(&v11);
    objc_destroyWeak(buf);
  }

}

- (void)processReceivedEventsFromMessage:(id)a3
{
  id v4;
  NSObject *v5;
  objc_super v6;

  v4 = a3;
  -[HMERouterClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  v6.receiver = self;
  v6.super_class = (Class)HMEPersistentConnectionClient;
  -[HMERouterClient processReceivedEvents:](&v6, sel_processReceivedEvents_, v4);

}

- (void)processReceivedCachedEventsFromMessage:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  objc_super v8;

  v4 = a3;
  -[HMERouterClient queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  +[HMEEventInfo eventsMapFromEventInfos:](HMEEventInfo, "eventsMapFromEventInfos:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8.receiver = self;
  v8.super_class = (Class)HMEPersistentConnectionClient;
  v7 = -[HMERouterClient processReceivedCachedEvents:](&v8, sel_processReceivedCachedEvents_, v6);

}

- (id)forwardingTopicsForTopics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  -[HMEPersistentConnectionClient delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "forwardingTopicsForTopics:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = v4;
  v8 = v6;

  return v8;
}

- (BOOL)isActiveForSaving
{
  void *v2;
  char v3;

  -[HMEPersistentConnectionClient delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isActiveForSaving");

  return v3;
}

- (unint64_t)willWriteToStore
{
  void *v2;
  unint64_t v3;

  -[HMEPersistentConnectionClient delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "willWriteToStore");

  return v3;
}

- (void)finishedWritingToStore:(unint64_t)a3
{
  id v4;

  -[HMEPersistentConnectionClient delegate](self, "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finishedWritingToStore:", a3);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logger, 0);
}

void __45__HMEPersistentConnectionClient_didReconnect__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  NSObject *v6;
  id v7;
  uint64_t v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "queue");
    v6 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __45__HMEPersistentConnectionClient_didReconnect__block_invoke_2;
    v9[3] = &unk_1E3B311C8;
    v7 = v3;
    v8 = *(_QWORD *)(a1 + 32);
    v10 = v7;
    v11 = v8;
    dispatch_async(v6, v9);

  }
}

id __45__HMEPersistentConnectionClient_didReconnect__block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  v1 = *(_QWORD *)(a1 + 32);
  v3.receiver = *(id *)(a1 + 40);
  v3.super_class = (Class)HMEPersistentConnectionClient;
  return objc_msgSendSuper2(&v3, sel_processReceivedCachedEvents_, v1);
}

@end
