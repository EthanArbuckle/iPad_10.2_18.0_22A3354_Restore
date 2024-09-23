@implementation IPXPCEventStateUpdateStreamSink

- (IPXPCEventStateUpdateStreamSink)initWithQueue:(id)a3 streamName:(id)a4
{
  id v7;
  id v8;
  IPXPCEventStateUpdateStreamSink *v9;
  uint64_t v10;
  NSString *streamName;
  uint64_t v12;
  OS_xpc_event_publisher *publisher;
  NSMutableDictionary *v14;
  NSMutableDictionary *subscribers;
  id v17;
  id location;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)IPXPCEventStateUpdateStreamSink;
  v9 = -[IPXPCEventStateUpdateStreamSink init](&v19, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    streamName = v9->_streamName;
    v9->_streamName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_queue, a3);
    objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
    xpc_event_publisher_create();
    v12 = objc_claimAutoreleasedReturnValue();
    publisher = v9->_publisher;
    v9->_publisher = (OS_xpc_event_publisher *)v12;

    objc_initWeak(&location, v9);
    v14 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    subscribers = v9->_subscribers;
    v9->_subscribers = v14;

    objc_copyWeak(&v17, &location);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    objc_destroyWeak(&v17);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_queue_processPublisherEventAction:token:descriptor:", a2, a3, v7);

}

void __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;

  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke_2_cold_1(a2, v3);

}

- (void)_queue_processPublisherEventAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8;
  NSObject *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSMutableDictionary *v15;
  void *v16;
  IPXPCEventStateUpdateStreamSubscriber *v17;
  NSMutableDictionary *v18;
  void *v19;
  NSMutableDictionary *subscribers;
  int v21;
  uint64_t v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  _IPServerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)IPXPCCopyDescription((uint64_t)v8);
    v21 = 134218498;
    v22 = a3;
    v23 = 2048;
    v24 = a4;
    v25 = 2112;
    v26 = v10;
    _os_log_impl(&dword_23F108000, v9, OS_LOG_TYPE_DEFAULT, "event action: %lld token: %llu descriptor: %@", (uint8_t *)&v21, 0x20u);

  }
  if (a3 == 1)
  {
    subscribers = self->_subscribers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v17 = (IPXPCEventStateUpdateStreamSubscriber *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](subscribers, "setObject:forKeyedSubscript:", 0, v17);
LABEL_11:

    goto LABEL_12;
  }
  if (!a3)
  {
    v11 = self->_subscribers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _IPServerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        -[IPXPCEventStateUpdateStreamSink _queue_processPublisherEventAction:token:descriptor:].cold.1(a4, v14);

      v15 = self->_subscribers;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableDictionary setObject:forKeyedSubscript:](v15, "setObject:forKeyedSubscript:", 0, v16);

    }
    v17 = -[IPXPCEventStateUpdateStreamSubscriber initWithToken:]([IPXPCEventStateUpdateStreamSubscriber alloc], "initWithToken:", a4);
    -[IPXPCEventStateUpdateStreamSubscriber setDelegate:](v17, "setDelegate:", self);
    v18 = self->_subscribers;
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a4);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v18, "setObject:forKeyedSubscript:", v17, v19);

    -[IPXPCEventStateUpdateStreamSubscriber beginHandshake](v17, "beginHandshake");
    goto LABEL_11;
  }
LABEL_12:

}

- (void)resume
{
  NSObject *v3;
  NSString *streamName;
  int v5;
  NSString *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  self->_resumed = 1;
  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    streamName = self->_streamName;
    v5 = 138412290;
    v6 = streamName;
    _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "Activating publisher for %@", (uint8_t *)&v5, 0xCu);
  }

  xpc_event_publisher_activate();
}

- (void)sendUpdateMessage:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __53__IPXPCEventStateUpdateStreamSink_sendUpdateMessage___block_invoke;
  v7[3] = &unk_250FA3B50;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __53__IPXPCEventStateUpdateStreamSink_sendUpdateMessage___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "allValues", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "sendOrEnqueueUpdateMessage:", *(_QWORD *)(a1 + 40));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)subscriber:(id)a3 firePayload:(id)a4 withReply:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = a4;
  objc_msgSend(a3, "token");
  xpc_event_publisher_fire_with_reply();

}

- (void)subscriber:(id)a3 firePayload:(id)a4
{
  id v5;

  v5 = a4;
  objc_msgSend(a3, "token");
  xpc_event_publisher_fire();

}

- (void)subscriberFailedHandshake:(id)a3
{
  id v4;
  NSObject *v5;
  NSMutableDictionary *subscribers;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _IPServerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = objc_msgSend(v4, "token");
    _os_log_impl(&dword_23F108000, v5, OS_LOG_TYPE_DEFAULT, "Subscriber for token %llu failed handshake! Removing tracking.", (uint8_t *)&v8, 0xCu);
  }

  subscribers = self->_subscribers;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", objc_msgSend(v4, "token"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](subscribers, "setObject:forKeyedSubscript:", 0, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
}

void __60__IPXPCEventStateUpdateStreamSink_initWithQueue_streamName___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_23F108000, a2, OS_LOG_TYPE_FAULT, "Error on XPC event publisher! %{darwin.errno}d", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_2();
}

- (void)_queue_processPublisherEventAction:(uint64_t)a1 token:(NSObject *)a2 descriptor:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl(&dword_23F108000, a2, OS_LOG_TYPE_FAULT, "already have a client with token %llu!", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_1_0();
}

@end
