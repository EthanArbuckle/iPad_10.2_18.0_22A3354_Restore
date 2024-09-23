@implementation HDXPCEventPublisher

- (HDXPCEventPublisher)initWithStream:(const char *)a3 entitlement:(const char *)a4
{
  HDXPCEventPublisher *v5;
  uint64_t v6;
  OS_dispatch_queue *queue;
  NSMutableArray *v8;
  NSMutableArray *pendingEvents;
  NSMutableArray *v10;
  NSMutableArray *pendingSubscribers;
  NSMutableDictionary *v12;
  NSMutableDictionary *subscribers;
  uint64_t v14;
  OS_xpc_event_publisher *publisher;
  id v17;
  id location;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)HDXPCEventPublisher;
  v5 = -[HDXPCEventPublisher init](&v19, sel_init);
  if (v5)
  {
    HKCreateSerialDispatchQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    queue = v5->_queue;
    v5->_queue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingEvents = v5->_pendingEvents;
    v5->_pendingEvents = v8;

    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    pendingSubscribers = v5->_pendingSubscribers;
    v5->_pendingSubscribers = v10;

    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    subscribers = v5->_subscribers;
    v5->_subscribers = v12;

    v5->_requiredEntitlement = a4;
    if ((HDIsUnitTesting() & 1) == 0)
    {
      xpc_event_publisher_create();
      v14 = objc_claimAutoreleasedReturnValue();
      publisher = v5->_publisher;
      v5->_publisher = (OS_xpc_event_publisher *)v14;

      objc_initWeak(&location, v5);
      objc_copyWeak(&v17, &location);
      xpc_event_publisher_set_handler();
      xpc_event_publisher_set_error_handler();
      xpc_event_publisher_activate();
      objc_destroyWeak(&v17);
      objc_destroyWeak(&location);
    }
  }
  return v5;
}

void __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  -[HDXPCEventPublisher _handleEventAction:token:descriptor:]((uint64_t)WeakRetained, a2, a3, v7);

}

- (void)_handleEventAction:(uint64_t)a3 token:(void *)a4 descriptor:
{
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  uint64_t v14;
  int v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  if (a1)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);

    if (v9)
    {
      HKLogInfrastructure();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138543874;
        v17 = a1;
        v18 = 1024;
        v19 = a2;
        v20 = 2048;
        v21 = a3;
        _os_log_impl(&dword_210F9A000, v10, OS_LOG_TYPE_INFO, "%{public}@: Handling XPC event action %d for %llu", buf, 0x1Cu);
      }

    }
    v11 = *(NSObject **)(a1 + 8);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __59__HDXPCEventPublisher__handleEventAction_token_descriptor___block_invoke;
    v12[3] = &unk_24CB18578;
    v15 = a2;
    v12[4] = a1;
    v14 = a3;
    v13 = v7;
    dispatch_async(v11, v12);

  }
}

void __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke_2(uint64_t a1, int a2)
{
  NSObject *v3;

  _HKInitializeLogging();
  HKLogInfrastructure();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke_2_cold_1(a2, v3);

}

void __59__HDXPCEventPublisher__handleEventAction_token_descriptor___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  int v4;
  uint64_t v5;
  _DWORD v6[2];
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = *(_DWORD *)(a1 + 56);
  if (v2 == 2)
  {
    -[HDXPCEventPublisher _queue_sendPendingEvents](*(_QWORD *)(a1 + 32));
  }
  else if (v2 == 1)
  {
    -[HDXPCEventPublisher _queue_removeSubscriberForToken:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
  }
  else if (v2)
  {
    _HKInitializeLogging();
    HKLogInfrastructure();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_DWORD *)(a1 + 56);
      v5 = *(_QWORD *)(a1 + 48);
      v6[0] = 67109376;
      v6[1] = v4;
      v7 = 2048;
      v8 = v5;
      _os_log_impl(&dword_210F9A000, v3, OS_LOG_TYPE_DEFAULT, "Unexpected XPC event action %d from %llu", (uint8_t *)v6, 0x12u);
    }

  }
  else
  {
    -[HDXPCEventPublisher _queue_addSubscriberForToken:descriptor:](*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(void **)(a1 + 40));
  }
}

- (void)_queue_addSubscriberForToken:(void *)a3 descriptor:
{
  id v5;
  void *v6;
  void *v7;
  xpc_object_t v8;
  id v9;

  v5 = a3;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v6 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);

    v8 = xpc_dictionary_create(0, 0, 0);
    v9 = v5;
    xpc_event_publisher_fire_with_reply();

  }
}

- (void)_queue_removeSubscriberForToken:(uint64_t)a1
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v4 = *(void **)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObject:", v5);

    v6 = *(void **)(a1 + 40);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObjectForKey:", v7);

    _HKInitializeLogging();
    HKLogInfrastructure();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = a2;
      _os_log_impl(&dword_210F9A000, v8, OS_LOG_TYPE_DEFAULT, "Removed XPC event subscriber %llu", (uint8_t *)&v9, 0xCu);
    }

  }
}

- (void)_queue_sendPendingEvents
{
  id v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v2 = *(id *)(a1 + 24);
    v3 = *(void **)(a1 + 24);
    *(_QWORD *)(a1 + 24) = 0;

    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[HDXPCEventPublisher _queue_sendEventWithXPCObject:](a1, *(void **)(*((_QWORD *)&v9 + 1) + 8 * v8++));
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const _xpc_type_s *v14;
  const _xpc_type_s *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  uint64_t v27;
  const char *v28;
  NSObject *v29;
  uint64_t v30;
  int v31;
  void *v32;
  __int16 v33;
  uint64_t v34;
  uint8_t buf[16];
  __int128 v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = a1[6];
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v7;
      _os_log_impl(&dword_210F9A000, v6, OS_LOG_TYPE_INFO, "Received XPC event reply from %llu", buf, 0xCu);
    }

  }
  v8 = a1 + 6;
  v9 = *(void **)(a1[4] + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v9, "containsObject:", v10);

  if ((v9 & 1) != 0)
  {
    v11 = *(void **)(a1[4] + 32);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "removeObject:", v12);

    v13 = MEMORY[0x212BD3CFC](v3);
    if (v13 != MEMORY[0x24BDACFA0])
    {
      v14 = (const _xpc_type_s *)v13;
      v15 = (const _xpc_type_s *)MEMORY[0x24BDACFB8];
      _HKInitializeLogging();
      HKLogInfrastructure();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
      if (v14 == v15)
      {
        if (v17)
          __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_2((int)v8, v3, v16);
      }
      else if (v17)
      {
        __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_3((int)v8, v14, v16);
      }
LABEL_19:

      goto LABEL_27;
    }
    *(_OWORD *)buf = 0u;
    v36 = 0u;
    xpc_dictionary_get_audit_token();
    v20 = (void *)xpc_copy_code_signing_identity_for_token();
    v21 = (void *)xpc_copy_entitlement_for_token();
    v22 = v21;
    if (v21)
    {
      if (xpc_BOOL_get_value(v21))
      {
        objc_msgSend(MEMORY[0x24BDBCE70], "hd_dictionaryFromXPCObject:", a1[5]);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = *(void **)(a1[4] + 40);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLongLong:", a1[6]);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setObject:forKeyedSubscript:", v23, v25);

        _HKInitializeLogging();
        HKLogInfrastructure();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          v27 = *v8;
          v31 = 136315394;
          v32 = v20;
          v33 = 2048;
          v34 = v27;
          v28 = "Registered XPC event subscriber %s:%llu";
LABEL_25:
          _os_log_impl(&dword_210F9A000, v26, OS_LOG_TYPE_DEFAULT, v28, (uint8_t *)&v31, 0x16u);
          goto LABEL_26;
        }
        goto LABEL_26;
      }
    }
    else
    {
      _HKInitializeLogging();
      HKLogInfrastructure();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_1((uint64_t)v20, v8, v29);

    }
    _HKInitializeLogging();
    HKLogInfrastructure();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      v30 = *v8;
      v31 = 136315394;
      v32 = v20;
      v33 = 2048;
      v34 = v30;
      v28 = "XPC event client %s:%llu is not entitled for subscription";
      goto LABEL_25;
    }
LABEL_26:

    free(v20);
    goto LABEL_27;
  }
  _HKInitializeLogging();
  HKLogInfrastructure();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG);

  if (v19)
  {
    HKLogInfrastructure();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_4(a1 + 6, v16);
    goto LABEL_19;
  }
LABEL_27:

}

- (void)_queue_sendEventWithXPCObject:(uint64_t)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  _BOOL4 v14;
  int v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  int v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    objc_msgSend(*(id *)(a1 + 40), "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    if (!v5)
      goto LABEL_17;
    v7 = v5;
    v8 = *(_QWORD *)v20;
    *(_QWORD *)&v6 = 134218240;
    v18 = v6;
    while (1)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v9);
        objc_msgSend(v10, "intValue", v18);
        v11 = xpc_event_publisher_fire();
        _HKInitializeLogging();
        HKLogInfrastructure();
        v12 = objc_claimAutoreleasedReturnValue();
        v13 = v12;
        if (v11)
        {
          if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
          {
            v16 = objc_msgSend(v10, "intValue");
            *(_DWORD *)buf = v18;
            v24 = v16;
            v25 = 1024;
            v26 = v11;
            _os_log_error_impl(&dword_210F9A000, v13, OS_LOG_TYPE_ERROR, "Failed to publish XPC event for %ld with error: %d", buf, 0x12u);
          }
LABEL_10:

          goto LABEL_11;
        }
        v14 = os_log_type_enabled(v12, OS_LOG_TYPE_INFO);

        if (v14)
        {
          HKLogInfrastructure();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            v15 = objc_msgSend(v10, "intValue");
            *(_DWORD *)buf = 134217984;
            v24 = v15;
            _os_log_impl(&dword_210F9A000, v13, OS_LOG_TYPE_INFO, "Published XPC event for %ld", buf, 0xCu);
          }
          goto LABEL_10;
        }
LABEL_11:
        ++v9;
      }
      while (v7 != v9);
      v17 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
      v7 = v17;
      if (!v17)
      {
LABEL_17:

        break;
      }
    }
  }

}

- (void)broadcastEvent:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  HDXPCEventPublisher *v9;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__HDXPCEventPublisher_broadcastEvent___block_invoke;
  block[3] = &unk_24CB18410;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_sync(queue, block);

}

void __38__HDXPCEventPublisher_broadcastEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;

  xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 32), (const char *)*MEMORY[0x24BDD3890], 1);
  v2 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v2 + 24))
    objc_msgSend(*(id *)(v2 + 24), "addObject:", *(_QWORD *)(a1 + 32));
  else
    -[HDXPCEventPublisher _queue_sendEventWithXPCObject:](v2, *(void **)(a1 + 32));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_pendingSubscribers, 0);
  objc_storeStrong((id *)&self->_pendingEvents, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

void __50__HDXPCEventPublisher_initWithStream_entitlement___block_invoke_2_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_210F9A000, a2, OS_LOG_TYPE_ERROR, "Received XPC event error %d", (uint8_t *)v2, 8u);
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_1(uint64_t a1, uint64_t *a2, NSObject *a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 136315394;
  v5 = a1;
  v6 = 2048;
  v7 = v3;
  OUTLINED_FUNCTION_0_1(&dword_210F9A000, a3, (uint64_t)a3, "XPC event entitlement not found for %s:%llu", (uint8_t *)&v4);
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_2(int a1, xpc_object_t xdict, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF40]);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_210F9A000, a3, v4, "XPC event client %llu replied with error: %s", v5);
  OUTLINED_FUNCTION_2_0();
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_3(int a1, xpc_type_t type, NSObject *a3)
{
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  xpc_type_get_name(type);
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_210F9A000, a3, v4, "XPC event client %llu replied with unexpected type %s", v5);
  OUTLINED_FUNCTION_2_0();
}

void __63__HDXPCEventPublisher__queue_addSubscriberForToken_descriptor___block_invoke_cold_4(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_debug_impl(&dword_210F9A000, a2, OS_LOG_TYPE_DEBUG, "XPC event client %llu unsubscribed before replying to ping", (uint8_t *)&v3, 0xCu);
}

@end
