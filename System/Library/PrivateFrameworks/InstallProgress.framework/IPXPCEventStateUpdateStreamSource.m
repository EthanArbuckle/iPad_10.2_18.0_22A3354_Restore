@implementation IPXPCEventStateUpdateStreamSource

- (IPXPCEventStateUpdateStreamSource)initWithQueue:(id)a3 streamName:(id)a4
{
  id v7;
  id v8;
  IPXPCEventStateUpdateStreamSource *v9;
  uint64_t v10;
  NSString *streamName;
  objc_super v13;

  v7 = a3;
  v8 = a4;
  v13.receiver = self;
  v13.super_class = (Class)IPXPCEventStateUpdateStreamSource;
  v9 = -[IPXPCEventStateUpdateStreamSource init](&v13, sel_init);
  if (v9)
  {
    v10 = objc_msgSend(v8, "copy");
    streamName = v9->_streamName;
    v9->_streamName = (NSString *)v10;

    objc_storeStrong((id *)&v9->_queue, a3);
  }

  return v9;
}

- (void)resume
{
  NSObject *v3;
  NSString *streamName;
  xpc_object_t v5;
  const char *v6;
  NSObject *queue;
  _QWORD handler[4];
  id v9;
  uint8_t buf[4];
  NSString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  self->_resumed = 1;
  _IPServerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    streamName = self->_streamName;
    *(_DWORD *)buf = 138412290;
    v11 = streamName;
    _os_log_impl(&dword_23F108000, v3, OS_LOG_TYPE_DEFAULT, "Resuming event source for %@, setting handlers", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v5 = xpc_dictionary_create(0, 0, 0);
  -[NSString UTF8String](self->_streamName, "UTF8String");
  xpc_set_event();
  v6 = -[NSString UTF8String](self->_streamName, "UTF8String");
  queue = self->_queue;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __43__IPXPCEventStateUpdateStreamSource_resume__block_invoke;
  handler[3] = &unk_250FA3E58;
  objc_copyWeak(&v9, (id *)buf);
  xpc_set_event_stream_handler(v6, queue, handler);
  objc_destroyWeak(&v9);

  objc_destroyWeak((id *)buf);
}

void __43__IPXPCEventStateUpdateStreamSource_resume__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_queue_handleEvent:", v3);

}

- (void)_queue_handleEvent:(id)a3
{
  id v4;
  NSObject *v5;
  IPStateUpdateMessage *v6;
  NSObject *reply;
  IPStateUpdateMessage *v8;
  NSObject *v9;
  NSObject *WeakRetained;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint8_t buf[4];
  IPStateUpdateMessage *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  _IPClientLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (IPStateUpdateMessage *)IPXPCCopyDescription((uint64_t)v4);
    *(_DWORD *)buf = 138412290;
    v20 = v6;
    _os_log_impl(&dword_23F108000, v5, OS_LOG_TYPE_DEFAULT, "event: %@", buf, 0xCu);

  }
  if (MEMORY[0x242665FDC](v4) == MEMORY[0x24BDACFA0])
  {
    if (xpc_dictionary_get_uint64(v4, (const char *)objc_msgSend(CFSTR("type"), "UTF8String")) == -1)
    {
      reply = xpc_dictionary_create_reply(v4);
      xpc_dictionary_send_reply();
      _IPClientLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_23F108000, v11, OS_LOG_TYPE_DEFAULT, "Sent reply message to ping event.", buf, 2u);
      }

    }
    else
    {
      v18 = 0;
      v8 = -[IPStateUpdateMessage initWithXPCDictionaryRepresentation:error:]([IPStateUpdateMessage alloc], "initWithXPCDictionaryRepresentation:error:", v4, &v18);
      reply = v18;
      _IPClientLog();
      v9 = objc_claimAutoreleasedReturnValue();
      WeakRetained = v9;
      if (v8)
      {
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v8;
          _os_log_impl(&dword_23F108000, WeakRetained, OS_LOG_TYPE_DEFAULT, "handling: %@", buf, 0xCu);
        }

        WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        -[NSObject stateUpdateStreamSource:updateMessageReceived:](WeakRetained, "stateUpdateStreamSource:updateMessageReceived:", self, v8);
      }
      else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        -[IPXPCEventStateUpdateStreamSource _queue_handleEvent:].cold.1((uint64_t)reply, WeakRetained, v12, v13, v14, v15, v16, v17);
      }

    }
  }
  else
  {
    _IPClientLog();
    reply = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(reply, OS_LOG_TYPE_ERROR))
      -[IPXPCEventStateUpdateStreamSource _queue_handleEvent:].cold.2(reply);
  }

}

- (IPStateUpdateStreamSourceDelegate)delegate
{
  return (IPStateUpdateStreamSourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_streamName, 0);
}

- (void)_queue_handleEvent:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_23F108000, a2, a3, "Could not decode IPStateUpdateMessage: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)_queue_handleEvent:(os_log_t)log .cold.2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_23F108000, log, OS_LOG_TYPE_ERROR, "Could not handle event of bogus type.", v1, 2u);
  OUTLINED_FUNCTION_2();
}

@end
