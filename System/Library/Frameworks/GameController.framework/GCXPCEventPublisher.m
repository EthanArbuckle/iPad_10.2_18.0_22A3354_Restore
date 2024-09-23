@implementation GCXPCEventPublisher

- (GCXPCEventPublisher)initWithStreamName:(id)a3
{
  return -[GCXPCEventPublisher initWithStreamName:isStatefulEventPublisher:](self, "initWithStreamName:isStatefulEventPublisher:", a3, 0);
}

- (GCXPCEventPublisher)initWithStreamName:(id)a3 isStatefulEventPublisher:(BOOL)a4
{
  id v7;
  GCXPCEventPublisher *v8;
  GCXPCEventPublisher *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  OS_dispatch_queue *queue;
  id v13;
  uint64_t v14;
  OS_xpc_event_publisher *publisher;
  uint64_t v16;
  NSMutableSet *tokens;
  uint64_t v18;
  NSMutableArray *pendingSendEvents;
  void *v20;
  id v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v7 = a3;
  v26.receiver = self;
  v26.super_class = (Class)GCXPCEventPublisher;
  v8 = -[GCXPCEventPublisher init](&v26, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_streamName, a3);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = dispatch_queue_create(-[NSString UTF8String](v9->_streamName, "UTF8String"), v10);
    queue = v9->_queue;
    v9->_queue = (OS_dispatch_queue *)v11;

    v13 = objc_retainAutorelease(v7);
    objc_msgSend(v13, "UTF8String");
    xpc_event_publisher_create();
    v14 = objc_claimAutoreleasedReturnValue();
    publisher = v9->_publisher;
    v9->_publisher = (OS_xpc_event_publisher *)v14;

    +[NSMutableSet set](&off_254DEBF30, "set");
    v16 = objc_claimAutoreleasedReturnValue();
    tokens = v9->_tokens;
    v9->_tokens = (NSMutableSet *)v16;

    v9->_statefulEventPublisher = a4;
    if (!a4)
    {
      +[NSMutableArray array](&off_254DEBB20, "array");
      v18 = objc_claimAutoreleasedReturnValue();
      pendingSendEvents = v9->_pendingSendEvents;
      v9->_pendingSendEvents = (NSMutableArray *)v18;

    }
    if (v9->_publisher)
    {
      objc_initWeak(&location, v9);
      v23[0] = MEMORY[0x24BDAC760];
      v23[1] = 3221225472;
      v23[2] = __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke;
      v23[3] = &unk_24D2B4890;
      objc_copyWeak(&v24, &location);
      v20 = (void *)MEMORY[0x2199DEBB0](v23);
      xpc_event_publisher_set_handler();
      v22 = v13;
      xpc_event_publisher_set_error_handler();
      xpc_event_publisher_activate();

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }

  }
  return v9;
}

void __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id *v6;
  id v7;
  id WeakRetained;

  v6 = (id *)(a1 + 32);
  v7 = a4;
  WeakRetained = objc_loadWeakRetained(v6);
  objc_msgSend(WeakRetained, "handleEventWithAction:token:descriptor:", a2, a3, v7);

}

void __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;

  if (gc_isInternalBuild())
  {
    getGCLogger();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke_2_cold_1(a1, a2, v4);

  }
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  NSMutableSet *v11;
  void *v12;
  OS_xpc_object *stateEvent;
  id v14;
  NSMutableSet *tokens;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  NSObject *v21;
  NSString *streamName;
  NSObject *v23;
  NSString *v24;
  NSObject *v25;
  NSString *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  unsigned int v35;
  __int16 v36;
  unint64_t v37;
  __int16 v38;
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a5;
  v9 = v8;
  if (v8)
  {
    v10 = (void *)MEMORY[0x2199DEF34](v8);
    if (!gc_isInternalBuild())
    {
      if (!v10)
        goto LABEL_6;
      goto LABEL_4;
    }
    getGCLogger();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      streamName = self->_streamName;
      *(_DWORD *)buf = 138544130;
      v33 = streamName;
      v34 = 1024;
      v35 = a3;
      v36 = 2048;
      v37 = a4;
      v38 = 2080;
      v39 = v10;
      _os_log_impl(&dword_215181000, v21, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu: %s", buf, 0x26u);
    }

    if (v10)
LABEL_4:
      free(v10);
  }
  else if (gc_isInternalBuild())
  {
    getGCLogger();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      v24 = self->_streamName;
      *(_DWORD *)buf = 138543874;
      v33 = v24;
      v34 = 1024;
      v35 = a3;
      v36 = 2048;
      v37 = a4;
      _os_log_impl(&dword_215181000, v23, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ received xpc event with action %d and token %llu", buf, 0x1Cu);
    }

  }
LABEL_6:
  if (a3)
  {
    if (a3 == 1)
    {
      tokens = self->_tokens;
      +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", a4);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      -[NSMutableSet removeObject:](tokens, "removeObject:", v14);
      goto LABEL_25;
    }
    if (a3 == 2)
    {
      if (gc_isInternalBuild())
      {
        getGCLogger();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = self->_streamName;
          *(_DWORD *)buf = 138543362;
          v33 = v26;
          _os_log_impl(&dword_215181000, v25, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ received initial barrier", buf, 0xCu);
        }

      }
      self->_receivedInitialBarrier = 1;
      if (self->_statefulEventPublisher && self->_stateEvent)
      {
        -[GCXPCEventPublisher sendEvent:](self, "sendEvent:");
        goto LABEL_26;
      }
      v16 = (void *)-[NSMutableArray copy](self->_pendingSendEvents, "copy");
      -[NSMutableArray removeAllObjects](self->_pendingSendEvents, "removeAllObjects");
      v29 = 0u;
      v30 = 0u;
      v27 = 0u;
      v28 = 0u;
      v14 = v16;
      v17 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v28;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v28 != v19)
              objc_enumerationMutation(v14);
            -[GCXPCEventPublisher sendEvent:](self, "sendEvent:", *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i), (_QWORD)v27);
          }
          v18 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        }
        while (v18);
      }

LABEL_25:
    }
  }
  else
  {
    v11 = self->_tokens;
    +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet addObject:](v11, "addObject:", v12);

    if (self->_statefulEventPublisher)
    {
      stateEvent = self->_stateEvent;
      if (stateEvent)
      {
        +[NSNumber numberWithUnsignedLongLong:](&off_254DED908, "numberWithUnsignedLongLong:", a4);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        -[GCXPCEventPublisher sendEvent:toSubscriber:](self, "sendEvent:toSubscriber:", stateEvent, v14);
        goto LABEL_25;
      }
    }
  }
LABEL_26:

}

- (void)sendEvent:(id)a3
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
  v7[2] = __33__GCXPCEventPublisher_sendEvent___block_invoke;
  v7[3] = &unk_24D2B2B48;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

void __33__GCXPCEventPublisher_sendEvent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  int isInternalBuild;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  int v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  uint64_t v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 8))
  {
    objc_storeStrong((id *)(v2 + 48), *(id *)(a1 + 40));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v3 = *(unsigned __int8 *)(v2 + 9);
  isInternalBuild = gc_isInternalBuild();
  if (v3)
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = *(_QWORD *)(a1 + 32);
        v17 = *(void **)(a1 + 40);
        v18 = *(_QWORD *)(v16 + 24);
        v19 = objc_msgSend(*(id *)(v16 + 56), "count");
        *(_DWORD *)buf = 138543874;
        v28 = v18;
        v29 = 2114;
        v30 = v17;
        v31 = 1024;
        LODWORD(v32) = v19;
        _os_log_impl(&dword_215181000, v15, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ sending xpc event %{public}@ to %u clients", buf, 0x1Cu);
      }

    }
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 56);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v24;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v24 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * v9);
          objc_msgSend(v10, "unsignedLongLongValue");
          if (xpc_event_publisher_fire() && gc_isInternalBuild())
          {
            getGCLogger();
            v11 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
            {
              v22 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
              v12 = xpc_strerror();
              *(_DWORD *)buf = 138543874;
              v28 = v22;
              v29 = 2112;
              v30 = v10;
              v31 = 2080;
              v32 = v12;
              _os_log_error_impl(&dword_215181000, v11, OS_LOG_TYPE_ERROR, "Failed to send event to XPC event stream %{public}@ for token %@: %s", buf, 0x20u);
            }

          }
          ++v9;
        }
        while (v7 != v9);
        v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v23, v33, 16);
        v7 = v13;
      }
      while (v13);
    }

  }
  else
  {
    if (isInternalBuild)
    {
      getGCLogger();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        v21 = *(_QWORD *)(a1 + 40);
        *(_DWORD *)buf = 138412290;
        v28 = v21;
        _os_log_impl(&dword_215181000, v20, OS_LOG_TYPE_INFO, "Have not received initial barrier; not sending %@",
          buf,
          0xCu);
      }

    }
    v14 = *(_QWORD *)(a1 + 32);
    if (!*(_BYTE *)(v14 + 8))
      objc_msgSend(*(id *)(v14 + 40), "addObject:", *(_QWORD *)(a1 + 40));
  }
}

- (void)sendEvent:(id)a3 toSubscriber:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__GCXPCEventPublisher_sendEvent_toSubscriber___block_invoke;
  block[3] = &unk_24D2B3D70;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(queue, block);

}

void __46__GCXPCEventPublisher_sendEvent_toSubscriber___block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1[4] + 9))
  {
    if (gc_isInternalBuild())
    {
      getGCLogger();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        v3 = a1[5];
        v4 = *(_QWORD *)(a1[4] + 24);
        v5 = a1[6];
        *(_DWORD *)buf = 138543874;
        v11 = v4;
        v12 = 2114;
        v13 = v3;
        v14 = 2112;
        v15 = v5;
        _os_log_impl(&dword_215181000, v2, OS_LOG_TYPE_INFO, "XPC event publisher for stream %{public}@ sending xpc event %{public}@ to client %@", buf, 0x20u);
      }

    }
    objc_msgSend((id)a1[6], "unsignedLongLongValue");
    if (xpc_event_publisher_fire() && gc_isInternalBuild())
    {
      getGCLogger();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        v7 = *(_QWORD *)(a1[4] + 24);
        v8 = a1[6];
        v9 = xpc_strerror();
        *(_DWORD *)buf = 138543874;
        v11 = v7;
        v12 = 2112;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_215181000, v6, OS_LOG_TYPE_ERROR, "Failed to send event to XPC event stream %{public}@ for token %@: %s", buf, 0x20u);
      }

    }
  }
}

- (BOOL)isStatefulEventPublisher
{
  return self->_statefulEventPublisher;
}

- (void)setStatefulEventPublisher:(BOOL)a3
{
  self->_statefulEventPublisher = a3;
}

- (OS_xpc_event_publisher)publisher
{
  return self->_publisher;
}

- (void)setPublisher:(id)a3
{
  objc_storeStrong((id *)&self->_publisher, a3);
}

- (NSString)streamName
{
  return self->_streamName;
}

- (void)setStreamName:(id)a3
{
  objc_storeStrong((id *)&self->_streamName, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (NSMutableArray)pendingSendEvents
{
  return self->_pendingSendEvents;
}

- (void)setPendingSendEvents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSendEvents, a3);
}

- (OS_xpc_object)stateEvent
{
  return self->_stateEvent;
}

- (void)setStateEvent:(id)a3
{
  objc_storeStrong((id *)&self->_stateEvent, a3);
}

- (NSMutableSet)tokens
{
  return self->_tokens;
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (BOOL)receivedInitialBarrier
{
  return self->_receivedInitialBarrier;
}

- (void)setReceivedInitialBarrier:(BOOL)a3
{
  self->_receivedInitialBarrier = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong((id *)&self->_stateEvent, 0);
  objc_storeStrong((id *)&self->_pendingSendEvents, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

void __67__GCXPCEventPublisher_initWithStreamName_isStatefulEventPublisher___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = *(_QWORD *)(a1 + 32);
  v5 = 138543618;
  v6 = v4;
  v7 = 2080;
  v8 = xpc_strerror();
  _os_log_error_impl(&dword_215181000, a3, OS_LOG_TYPE_ERROR, "Unexpected error from XPC event publisher for stream %{public}@: %s", (uint8_t *)&v5, 0x16u);
}

@end
