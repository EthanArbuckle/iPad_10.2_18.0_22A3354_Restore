@implementation _CDXPCEventPublisher

+ (_CDXPCEventPublisher)eventPublisherWithStreamName:(const char *)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6 os_variant_diagnostic_subsystem:(const char *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v14, "initWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", v15, v13, v12, v11, a7);

  objc_msgSend(v16, "activatePublisherWithStreamName:", a3);
  return (_CDXPCEventPublisher *)v16;
}

+ (_CDXPCEventPublisher)eventPublisherWithStreamName:(const char *)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = objc_alloc((Class)objc_opt_class());
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithStreamName:delegate:queue:log:os_variant_diagnostic_subsystem:", v13, v11, v10, v9, 0);

  objc_msgSend(v14, "activatePublisherWithStreamName:", a3);
  return (_CDXPCEventPublisher *)v14;
}

- (_CDXPCEventPublisher)initWithStreamName:(id)a3 delegate:(id)a4 queue:(id)a5 log:(id)a6 os_variant_diagnostic_subsystem:(const char *)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  _CDXPCEventPublisher *v17;
  uint64_t v18;
  NSMutableArray *pendingSendEvents;
  const char *v20;
  objc_super v22;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v22.receiver = self;
  v22.super_class = (Class)_CDXPCEventPublisher;
  v17 = -[_CDXPCEventPublisher init](&v22, sel_init);
  if (v17)
  {
    v18 = objc_opt_new();
    pendingSendEvents = v17->_pendingSendEvents;
    v17->_pendingSendEvents = (NSMutableArray *)v18;

    objc_storeStrong((id *)&v17->_streamName, a3);
    objc_storeStrong((id *)&v17->_delegate, a4);
    objc_storeStrong((id *)&v17->_queue, a5);
    objc_storeStrong((id *)&v17->_log, a6);
    v20 = "com.apple.CoreDuet";
    if (!a7)
      v20 = 0;
    v17->_os_variant_diagnostic_subsystem = v20;
  }

  return v17;
}

- (void)activatePublisherWithStreamName:(const char *)a3
{
  OS_xpc_event_publisher *v5;
  OS_xpc_event_publisher *publisher;
  void *v7;
  NSObject *log;
  _QWORD v9[4];
  id v10;
  id location;

  xpc_event_publisher_create();
  v5 = (OS_xpc_event_publisher *)objc_claimAutoreleasedReturnValue();
  publisher = self->_publisher;
  self->_publisher = v5;

  if (self->_publisher)
  {
    objc_initWeak(&location, self);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __56___CDXPCEventPublisher_activatePublisherWithStreamName___block_invoke;
    v9[3] = &unk_1E26E5F98;
    objc_copyWeak(&v10, &location);
    v7 = (void *)MEMORY[0x193FEEAF4](v9);
    xpc_event_publisher_set_handler();
    xpc_event_publisher_set_error_handler();
    xpc_event_publisher_activate();

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
  }
  else
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      -[_CDXPCEventPublisher activatePublisherWithStreamName:].cold.1((uint64_t)a3, log);
  }
}

- (void)handleEventWithAction:(unsigned int)a3 token:(unint64_t)a4 descriptor:(id)a5
{
  id v8;
  NSObject *log;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _CDXPCEventPublisher *v13;
  NSMutableArray *pendingSendEvents;
  NSMutableArray *v15;
  NSMutableArray *v16;
  NSMutableArray *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  NSObject *v22;
  NSObject *v23;
  NSString *streamName;
  NSString *v25;
  NSString *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  NSString *v33;
  __int16 v34;
  _BYTE v35[24];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
  {
    if (v8)
    {
      v10 = (void *)MEMORY[0x193FEEEB4](v8);
      v11 = self->_log;
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        if (!v10)
          goto LABEL_7;
        goto LABEL_5;
      }
      streamName = self->_streamName;
      *(_DWORD *)buf = 138544130;
      v33 = streamName;
      v34 = 1024;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(_QWORD *)&v35[6] = a4;
      *(_WORD *)&v35[14] = 2080;
      *(_QWORD *)&v35[16] = v10;
      _os_log_debug_impl(&dword_18DDBE000, v11, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received xpc event with action %d and token %llu: %s", buf, 0x26u);
      if (v10)
LABEL_5:
        free(v10);
    }
    else
    {
      v26 = self->_streamName;
      *(_DWORD *)buf = 138543874;
      v33 = v26;
      v34 = 1024;
      *(_DWORD *)v35 = a3;
      *(_WORD *)&v35[4] = 2048;
      *(_QWORD *)&v35[6] = a4;
      _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received xpc event with action %d and token %llu", buf, 0x1Cu);
    }
  }
LABEL_7:
  if (a3)
  {
    if (a3 == 1)
    {
      v23 = self->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        -[_CDXPCEventPublisher handleEventWithAction:token:descriptor:].cold.2((uint64_t)self, a4, v23);
      -[_CDXPCEventPublisher removeToken:](self, "removeToken:", a4);
    }
    else if (a3 == 2)
    {
      v12 = self->_log;
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[_CDXPCEventPublisher handleEventWithAction:token:descriptor:].cold.1((uint64_t)self, v12);
      v13 = self;
      objc_sync_enter(v13);
      pendingSendEvents = v13->_pendingSendEvents;
      if (pendingSendEvents)
      {
        v15 = pendingSendEvents;
        v16 = v13->_pendingSendEvents;
        v13->_pendingSendEvents = 0;

        v29 = 0u;
        v30 = 0u;
        v27 = 0u;
        v28 = 0u;
        v17 = v15;
        v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
        if (v18)
        {
          v19 = *(_QWORD *)v28;
          do
          {
            for (i = 0; i != v18; ++i)
            {
              if (*(_QWORD *)v28 != v19)
                objc_enumerationMutation(v17);
              (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i));
            }
            v18 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
          }
          while (v18);
        }

      }
      objc_sync_exit(v13);

    }
  }
  else
  {
    v21 = getuid();
    v22 = self->_log;
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      v25 = self->_streamName;
      *(_DWORD *)buf = 138543874;
      v33 = v25;
      v34 = 2048;
      *(_QWORD *)v35 = v21;
      *(_WORD *)&v35[8] = 2048;
      *(_QWORD *)&v35[10] = a4;
      _os_log_debug_impl(&dword_18DDBE000, v22, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received new subscription for uid %lld with token %llu", buf, 0x20u);
    }
    -[_CDXPCEventPublisher addToken:descriptor:userID:](self, "addToken:descriptor:userID:", a4, v8, v21);
  }

}

- (void)sendEvent:(id)a3 toSubscriber:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CDXPCEventPublisher *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  NSMutableArray *pendingSendEvents;
  void *v17;
  void *v18;
  NSObject *log;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSString *streamName;
  NSObject *v24;
  NSString *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint8_t buf[4];
  const __CFString *v36;
  __int16 v37;
  id v38;
  __int16 v39;
  int count;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_pendingSendEvents)
  {
    v12 = v11->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      +[_CDXPCCodecs messageTypeFromEvent:](_CDXPCCodecs, "messageTypeFromEvent:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      *(_DWORD *)buf = 138412290;
      v36 = v15;
      _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_INFO, "Pending %@ sendEvent until barrier is received.", buf, 0xCu);

    }
    objc_initWeak((id *)buf, v11);
    pendingSendEvents = v11->_pendingSendEvents;
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __55___CDXPCEventPublisher_sendEvent_toSubscriber_handler___block_invoke;
    v30 = &unk_1E26E3088;
    objc_copyWeak(&v34, (id *)buf);
    v31 = v8;
    v32 = v9;
    v33 = v10;
    v17 = (void *)MEMORY[0x193FEEAF4](&v27);
    -[NSMutableArray addObject:](pendingSendEvents, "addObject:", v17, v27, v28, v29, v30);

    objc_destroyWeak(&v34);
    objc_destroyWeak((id *)buf);
    objc_sync_exit(v11);

  }
  else
  {
    objc_sync_exit(v11);

    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG))
    {
      if (os_variant_has_internal_diagnostics())
      {
        v18 = (void *)MEMORY[0x193FEEEB4](v8);
        log = v11->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          streamName = v11->_streamName;
          v24 = log;
          *(_DWORD *)buf = 138544130;
          v36 = (const __CFString *)streamName;
          v37 = 2114;
          v38 = v9;
          v39 = 1024;
          count = xpc_dictionary_get_count(v8);
          v41 = 2080;
          v42 = v18;
          _os_log_debug_impl(&dword_18DDBE000, v24, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys: %s", buf, 0x26u);

        }
        if (v18)
          free(v18);
      }
      else
      {
        v20 = v11->_log;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v25 = v11->_streamName;
          v26 = v20;
          *(_DWORD *)buf = 138543874;
          v36 = (const __CFString *)v25;
          v37 = 2114;
          v38 = v9;
          v39 = 1024;
          count = xpc_dictionary_get_count(v8);
          _os_log_debug_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys", buf, 0x1Cu);

        }
      }
    }
    objc_msgSend(v9, "token");
    if (xpc_event_publisher_fire())
    {
      v21 = v11->_log;
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        -[_CDXPCEventPublisher sendEvent:toSubscriber:handler:].cold.1((uint64_t)v11, v21);
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 3, 0);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v10 + 2))(v10, v22);

    }
    else
    {
      (*((void (**)(id, _QWORD))v10 + 2))(v10, 0);
    }
  }

}

- (void)sendEvent:(id)a3 toSubscriber:(id)a4 replyHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  _CDXPCEventPublisher *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  NSMutableArray *pendingSendEvents;
  void *v17;
  void *v18;
  NSObject *log;
  NSObject *v20;
  id v21;
  void (**v22)(id, _QWORD, void *);
  NSObject *v23;
  void *v24;
  NSString *v25;
  NSObject *v26;
  uint64_t v27;
  NSString *streamName;
  NSObject *v29;
  NSString *v30;
  NSObject *v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id v35;
  id v36;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  id v40;
  __int16 v41;
  _QWORD v42[5];

  v42[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = self;
  objc_sync_enter(v11);
  if (v11->_pendingSendEvents)
  {
    v12 = v11->_log;
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      +[_CDXPCCodecs messageTypeFromEvent:](_CDXPCCodecs, "messageTypeFromEvent:", v8);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = (void *)v13;
      v15 = CFSTR("unknown");
      if (v13)
        v15 = (const __CFString *)v13;
      *(_DWORD *)buf = 138412290;
      v38 = v15;
      _os_log_impl(&dword_18DDBE000, v12, OS_LOG_TYPE_DEFAULT, "Pending %@ sendEvent until barrier is received.", buf, 0xCu);

    }
    objc_initWeak((id *)buf, v11);
    pendingSendEvents = v11->_pendingSendEvents;
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __60___CDXPCEventPublisher_sendEvent_toSubscriber_replyHandler___block_invoke;
    v32[3] = &unk_1E26E3088;
    objc_copyWeak(&v36, (id *)buf);
    v33 = v8;
    v34 = v9;
    v35 = v10;
    v17 = (void *)MEMORY[0x193FEEAF4](v32);
    -[NSMutableArray addObject:](pendingSendEvents, "addObject:", v17);

    objc_destroyWeak(&v36);
    objc_destroyWeak((id *)buf);
    objc_sync_exit(v11);

  }
  else
  {
    objc_sync_exit(v11);

    if (os_log_type_enabled((os_log_t)v11->_log, OS_LOG_TYPE_DEBUG))
    {
      if (os_variant_has_internal_diagnostics())
      {
        v18 = (void *)MEMORY[0x193FEEEB4](v8);
        log = v11->_log;
        if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
        {
          streamName = v11->_streamName;
          v29 = log;
          *(_DWORD *)buf = 138544130;
          v38 = (const __CFString *)streamName;
          v39 = 2114;
          v40 = v9;
          v41 = 1024;
          LODWORD(v42[0]) = xpc_dictionary_get_count(v8);
          WORD2(v42[0]) = 2080;
          *(_QWORD *)((char *)v42 + 6) = v18;
          _os_log_debug_impl(&dword_18DDBE000, v29, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys: %s", buf, 0x26u);

        }
        if (v18)
          free(v18);
      }
      else
      {
        v20 = v11->_log;
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
        {
          v30 = v11->_streamName;
          v31 = v20;
          *(_DWORD *)buf = 138543874;
          v38 = (const __CFString *)v30;
          v39 = 2114;
          v40 = v9;
          v41 = 1024;
          LODWORD(v42[0]) = xpc_dictionary_get_count(v8);
          _os_log_debug_impl(&dword_18DDBE000, v31, OS_LOG_TYPE_DEBUG, "Sending event on stream %{public}@ to subscriber %{public}@ with %d keys", buf, 0x1Cu);

        }
      }
    }
    objc_msgSend(v9, "token");
    v21 = v9;
    v22 = (void (**)(id, _QWORD, void *))v10;
    if (xpc_event_publisher_fire_with_reply())
    {
      v23 = v11->_log;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v25 = v11->_streamName;
        v26 = v23;
        v27 = xpc_strerror();
        *(_DWORD *)buf = 138543874;
        v38 = (const __CFString *)v25;
        v39 = 2112;
        v40 = v21;
        v41 = 2080;
        v42[0] = v27;
        _os_log_error_impl(&dword_18DDBE000, v26, OS_LOG_TYPE_ERROR, "Failed to send event on stream %{public}@ to subscriber %@: %s", buf, 0x20u);

      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.coreduetd"), 3, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v22[2](v22, 0, v24);

    }
  }

}

- (void)addToken:(unint64_t)a3 descriptor:(id)a4 userID:(unsigned int)a5
{
  uint64_t v5;
  id v8;
  _CDXPCEventSubscriber *v9;
  NSObject *queue;
  _CDXPCEventSubscriber *v11;
  _QWORD v12[5];
  _CDXPCEventSubscriber *v13;

  if (self->_delegate)
  {
    v5 = *(_QWORD *)&a5;
    v8 = a4;
    v9 = -[_CDXPCEventSubscriber initWithToken:descriptor:userID:streamName:]([_CDXPCEventSubscriber alloc], "initWithToken:descriptor:userID:streamName:", a3, v8, v5, self->_streamName);

    queue = self->_queue;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __51___CDXPCEventPublisher_addToken_descriptor_userID___block_invoke;
    v12[3] = &unk_1E26E3250;
    v12[4] = self;
    v13 = v9;
    v11 = v9;
    dispatch_async(queue, v12);

  }
}

- (void)removeToken:(unint64_t)a3
{
  NSObject *queue;
  _QWORD v4[6];

  if (self->_delegate)
  {
    queue = self->_queue;
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __36___CDXPCEventPublisher_removeToken___block_invoke;
    v4[3] = &unk_1E26E4AA8;
    v4[4] = self;
    v4[5] = a3;
    dispatch_async(queue, v4);
  }
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

- (_CDXPCEventPublisherDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (const)os_variant_diagnostic_subsystem
{
  return self->_os_variant_diagnostic_subsystem;
}

- (void)setOs_variant_diagnostic_subsystem:(const char *)a3
{
  self->_os_variant_diagnostic_subsystem = a3;
}

- (NSMutableArray)pendingSendEvents
{
  return self->_pendingSendEvents;
}

- (void)setPendingSendEvents:(id)a3
{
  objc_storeStrong((id *)&self->_pendingSendEvents, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pendingSendEvents, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
  objc_storeStrong((id *)&self->_publisher, 0);
}

- (void)activatePublisherWithStreamName:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 136446210;
  v3 = a1;
  _os_log_error_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_ERROR, "Failed to create publisher for stream %{public}s", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)handleEventWithAction:(uint64_t)a1 token:(NSObject *)a2 descriptor:.cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 16);
  v3 = 138543362;
  v4 = v2;
  _os_log_debug_impl(&dword_18DDBE000, a2, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ received initial barrier", (uint8_t *)&v3, 0xCu);
  OUTLINED_FUNCTION_5();
}

- (void)handleEventWithAction:(uint64_t)a1 token:(uint64_t)a2 descriptor:(os_log_t)log .cold.2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 16);
  v4 = 138543618;
  v5 = v3;
  v6 = 2048;
  v7 = a2;
  _os_log_debug_impl(&dword_18DDBE000, log, OS_LOG_TYPE_DEBUG, "Publisher for stream %{public}@ removing subscription with token %llu", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_5();
}

- (void)sendEvent:(uint64_t)a1 toSubscriber:(void *)a2 handler:.cold.1(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  xpc_strerror();
  OUTLINED_FUNCTION_0_10();
  OUTLINED_FUNCTION_10(&dword_18DDBE000, v2, v3, "Failed to send event to stream %{public}@: %s", v4);

  OUTLINED_FUNCTION_7();
}

@end
