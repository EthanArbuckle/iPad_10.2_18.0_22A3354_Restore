@implementation DNDSXPCEventPublisher

- (DNDSXPCEventPublisher)initWithStream:(const char *)a3
{
  DNDSXPCEventPublisher *v3;
  uint64_t Serial;
  OS_dispatch_queue *queue;
  uint64_t v6;
  OS_xpc_event_publisher *publisher;
  NSMutableArray *v8;
  NSMutableArray *pendingEvents;
  NSMutableDictionary *v10;
  NSMutableDictionary *subscribers;
  id v13;
  id location;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)DNDSXPCEventPublisher;
  v3 = -[DNDSXPCEventPublisher init](&v15, sel_init);
  if (v3)
  {
    Serial = BSDispatchQueueCreateSerial();
    queue = v3->_queue;
    v3->_queue = (OS_dispatch_queue *)Serial;

    xpc_event_publisher_create();
    v6 = objc_claimAutoreleasedReturnValue();
    publisher = v3->_publisher;
    v3->_publisher = (OS_xpc_event_publisher *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    pendingEvents = v3->_pendingEvents;
    v3->_pendingEvents = v8;

    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    subscribers = v3->_subscribers;
    v3->_subscribers = v10;

    objc_initWeak(&location, v3);
    objc_copyWeak(&v13, &location);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  return v3;
}

void __40__DNDSXPCEventPublisher_initWithStream___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "_handleEventAction:token:descriptor:", a2, a3, v7);

}

void __40__DNDSXPCEventPublisher_initWithStream___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;

  v3 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_ERROR))
    __40__DNDSXPCEventPublisher_initWithStream___block_invoke_2_cold_1(a2, v3);
}

- (void)_handleEventAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *queue;
  id v11;
  _QWORD v12[5];
  id v13;
  unint64_t v14;
  unsigned int v15;
  uint8_t buf[4];
  DNDSXPCEventPublisher *v17;
  __int16 v18;
  unsigned int v19;
  __int16 v20;
  unint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543874;
    v17 = self;
    v18 = 1024;
    v19 = a3;
    v20 = 2048;
    v21 = a4;
    _os_log_impl(&dword_1CB895000, v9, OS_LOG_TYPE_INFO, "%{public}@: Handling XPC event action %d for %llu", buf, 0x1Cu);
  }
  queue = self->_queue;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __61__DNDSXPCEventPublisher__handleEventAction_token_descriptor___block_invoke;
  v12[3] = &unk_1E86A7868;
  v15 = a3;
  v13 = v8;
  v14 = a4;
  v12[4] = self;
  v11 = v8;
  dispatch_async(queue, v12);

}

void __61__DNDSXPCEventPublisher__handleEventAction_token_descriptor___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_sendPendingEvents");
  }
  else if (v2 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_removeSubscriberForToken:", *(_QWORD *)(a1 + 48));
  }
  else if (v2)
  {
    v3 = DNDSLogXPCEventPublisher;
    if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 48);
      v6[0] = 67109376;
      v6[1] = v4;
      v7 = 2048;
      v8 = v5;
      _os_log_impl(&dword_1CB895000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected XPC event action %d from %llu", (uint8_t *)v6, 0x12u);
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_queue_addSubscriberForToken:descriptor:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 40));
  }
}

- (void)_queue_addSubscriberForToken:(unint64_t)a3 descriptor:(id)a4
{
  id v6;
  void *v7;
  NSMutableDictionary *subscribers;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  int v12;
  unint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  if (!v6 || MEMORY[0x1D17A1094](v6) != MEMORY[0x1E0C812F8])
  {
LABEL_3:
    v7 = 0;
    goto LABEL_4;
  }
  v7 = (void *)_CFXPCCreateCFObjectFromXPCObject();
  if (!v7)
  {
    v11 = DNDSLogXPCEventPublisher;
    if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_ERROR))
      -[DNDSXPCEventPublisher _queue_addSubscriberForToken:descriptor:].cold.1(v11);
    goto LABEL_3;
  }
LABEL_4:
  subscribers = self->_subscribers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](subscribers, "setObject:forKeyedSubscript:", v7, v9);

  v10 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 134217984;
    v13 = a3;
    _os_log_impl(&dword_1CB895000, v10, OS_LOG_TYPE_DEFAULT, "Registered XPC event subscriber %llu", (uint8_t *)&v12, 0xCu);
  }

}

- (void)_queue_removeSubscriberForToken:(unint64_t)a3
{
  NSMutableDictionary *subscribers;
  void *v6;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  subscribers = self->_subscribers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary removeObjectForKey:](subscribers, "removeObjectForKey:", v6);

  v7 = DNDSLogXPCEventPublisher;
  if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = a3;
    _os_log_impl(&dword_1CB895000, v7, OS_LOG_TYPE_DEFAULT, "Removed XPC event subscriber %llu", (uint8_t *)&v8, 0xCu);
  }
}

- (void)_queue_sendPendingEvents
{
  NSMutableArray *v3;
  NSMutableArray *pendingEvents;
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v3 = self->_pendingEvents;
  pendingEvents = self->_pendingEvents;
  self->_pendingEvents = 0;

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v5 = v3;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
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
        -[DNDSXPCEventPublisher _queue_sendEventWithXPCObject:](self, "_queue_sendEventWithXPCObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)_queue_sendEventWithXPCObject:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  int v12;
  void *v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  int v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[NSMutableDictionary allKeys](self->_subscribers, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v6)
  {
    v8 = v6;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v7 = 134218240;
    v19 = v7;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        objc_msgSend(v11, "intValue", v19);
        v12 = xpc_event_publisher_fire();
        v13 = (void *)DNDSLogXPCEventPublisher;
        if (v12)
        {
          v14 = v12;
          if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_ERROR))
          {
            v15 = v13;
            v16 = objc_msgSend(v11, "intValue");
            *(_DWORD *)buf = v19;
            v25 = v16;
            v26 = 1024;
            v27 = v14;
            _os_log_error_impl(&dword_1CB895000, v15, OS_LOG_TYPE_ERROR, "Failed to publish XPC event for %ld with error: %d", buf, 0x12u);

          }
        }
        else if (os_log_type_enabled((os_log_t)DNDSLogXPCEventPublisher, OS_LOG_TYPE_INFO))
        {
          v17 = v13;
          v18 = objc_msgSend(v11, "intValue");
          *(_DWORD *)buf = 134217984;
          v25 = v18;
          _os_log_impl(&dword_1CB895000, v17, OS_LOG_TYPE_INFO, "Published XPC event for %ld", buf, 0xCu);

        }
      }
      v8 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    }
    while (v8);
  }

}

- (void)broadcastEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __40__DNDSXPCEventPublisher_broadcastEvent___block_invoke;
  block[3] = &unk_1E86A59E8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __40__DNDSXPCEventPublisher_broadcastEvent___block_invoke(uint64_t a1)
{
  id *v2;
  uint64_t v3;

  v2 = *(id **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (v2[3])
    return objc_msgSend(v2[3], "addObject:", v3);
  else
    return objc_msgSend(v2, "_queue_sendEventWithXPCObject:", v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __40__DNDSXPCEventPublisher_initWithStream___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_1CB895000, a2, OS_LOG_TYPE_ERROR, "Received XPC event error %d", (uint8_t *)v2, 8u);
}

- (void)_queue_addSubscriberForToken:(os_log_t)log descriptor:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CB895000, log, OS_LOG_TYPE_ERROR, "Failed to convert XPC dictionary to CF dictionary", v1, 2u);
}

@end
