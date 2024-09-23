@implementation NEIPC

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong(&self->_messageHandler, 0);
}

- (void)logMessageType:(int)a1 data:(void *)a2 actionString:(void *)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  int v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  void *v19;
  unsigned __int8 md[20];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (nelog_is_debug_logging_enabled())
  {
    if (objc_msgSend(v5, "length"))
    {
      v7 = objc_retainAutorelease(v5);
      CC_SHA1((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), md);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", md, 20, 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    ne_log_obj();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = objc_msgSend(v5, "length");
      objc_msgSend(v8, "description");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138413058;
      v13 = v6;
      v14 = 1024;
      v15 = a1;
      v16 = 2048;
      v17 = v10;
      v18 = 2112;
      v19 = v11;
      _os_log_debug_impl(&dword_19BD16000, v9, OS_LOG_TYPE_DEBUG, "%@ an IPC message with type %u and length %lu, hash %@", (uint8_t *)&v12, 0x26u);

    }
  }

}

void __35__NEIPC_handleMessage_withHandler___block_invoke(uint64_t a1, void *a2)
{
  xpc_object_t reply;
  id v4;
  _xpc_connection_s *v5;
  id v6;

  v6 = a2;
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  if (isa_nsdata(v6))
  {
    v4 = objc_retainAutorelease(v6);
    xpc_dictionary_set_data(reply, "data", (const void *)objc_msgSend(v4, "bytes"), objc_msgSend(v4, "length"));
  }
  xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 32));
  v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v5, reply);

}

- (void)stop
{
  SEL v1;
  const char *v2;
  _xpc_connection_s *v3;
  SEL v4;
  const char *v5;
  _xpc_connection_s *v6;
  SEL v7;
  id self;

  if (a1)
  {
    self = a1;
    objc_sync_enter(self);
    if (objc_getProperty(self, v1, 16, 1))
    {
      v3 = (_xpc_connection_s *)objc_getProperty(self, v2, 16, 1);
      xpc_connection_cancel(v3);

      objc_setProperty_atomic(self, v4, 0, 16);
    }
    if (objc_getProperty(self, v2, 24, 1))
    {
      v6 = (_xpc_connection_s *)objc_getProperty(self, v5, 24, 1);
      xpc_connection_cancel(v6);

      objc_setProperty_atomic(self, v7, 0, 24);
    }
    objc_setProperty_atomic_copy(self, v5, 0, 8);
    objc_sync_exit(self);

  }
}

- (void)setupMessageHandlingWithQueue:(void *)a1
{
  NSObject *v3;
  SEL v4;
  _xpc_connection_s *Property;
  SEL v6;
  _xpc_connection_s *v7;
  SEL v8;
  _xpc_connection_s *v9;
  _QWORD handler[5];

  if (a1)
  {
    v3 = a2;
    Property = (_xpc_connection_s *)objc_getProperty(a1, v4, 16, 1);
    xpc_connection_set_target_queue(Property, v3);

    v7 = (_xpc_connection_s *)objc_getProperty(a1, v6, 16, 1);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __39__NEIPC_setupMessageHandlingWithQueue___block_invoke;
    handler[3] = &unk_1E3CC4080;
    handler[4] = a1;
    xpc_connection_set_event_handler(v7, handler);
    v9 = (_xpc_connection_s *)objc_getProperty(a1, v8, 16, 1);
    xpc_connection_resume(v9);
  }
}

void __39__NEIPC_setupMessageHandlingWithQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;
  id Property;
  id v9;
  id v10;
  void (**v11)(id, _QWORD, uint64_t, void *, uint8_t *);
  NSObject *v12;
  uint64_t uint64;
  void *data;
  _BOOL4 v15;
  id v16;
  uint8_t buf[8];
  uint64_t v18;
  void (*v19)(uint64_t, void *);
  void *v20;
  id v21;
  size_t length;

  v16 = a2;
  v3 = *(id *)(a1 + 32);
  objc_sync_enter(v3);
  v5 = *(void **)(a1 + 32);
  if (v5 && objc_getProperty(v5, v4, 8, 1))
  {
    v7 = *(void **)(a1 + 32);
    if (v7)
      Property = objc_getProperty(*(id *)(a1 + 32), v6, 8, 1);
    else
      Property = 0;
    v9 = Property;
    v10 = v16;
    v11 = (void (**)(id, _QWORD, uint64_t, void *, uint8_t *))v9;
    if (v7)
    {
      if (v10 && MEMORY[0x1A1ACFDA4](v10) == MEMORY[0x1E0C812F8])
      {
        uint64 = xpc_dictionary_get_uint64(v10, "type");
        length = 0;
        data = (void *)xpc_dictionary_get_data(v10, "data", &length);
        v15 = xpc_dictionary_get_BOOL(v10, "needs-reply");
        if (data)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
          data = (void *)objc_claimAutoreleasedReturnValue();
        }
        -[NEIPC logMessageType:data:actionString:](uint64, data, CFSTR("Received"));
        if (v15)
        {
          *(_QWORD *)buf = MEMORY[0x1E0C809B0];
          v18 = 3221225472;
          v19 = __35__NEIPC_handleMessage_withHandler___block_invoke;
          v20 = &unk_1E3CC1B70;
          v21 = v10;
          v11[2](v11, 0, uint64, data, buf);

        }
        else
        {
          v11[2](v11, 0, uint64, data, 0);
        }

      }
      else
      {
        ne_log_obj();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_19BD16000, v12, OS_LOG_TYPE_INFO, "The IPC connection was closed by the remote end", buf, 2u);
        }

        -[NEIPC stop](v7);
        v11[2](v11, 1, 0, 0, 0);
      }
    }

  }
  objc_sync_exit(v3);

}

void __51__NEIPC_startInListenModeWithQueue_messageHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  id Property;
  _xpc_connection_s *v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  if (v3 && MEMORY[0x1A1ACFDA4](v3) == MEMORY[0x1E0C812E0])
  {
    v5 = *(id *)(a1 + 32);
    objc_sync_enter(v5);
    v7 = *(void **)(a1 + 32);
    if (v7)
      objc_setProperty_atomic(v7, v6, v4, 16);
    ne_log_obj();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      Property = *(id *)(a1 + 32);
      if (Property)
        Property = objc_getProperty(Property, v9, 16, 1);
      v11 = (_xpc_connection_s *)Property;
      v12[0] = 67109120;
      v12[1] = xpc_connection_get_pid(v11);
      _os_log_debug_impl(&dword_19BD16000, v8, OS_LOG_TYPE_DEBUG, "Received a new connection from %d", (uint8_t *)v12, 8u);

    }
    -[NEIPC setupMessageHandlingWithQueue:](*(void **)(a1 + 32), *(void **)(a1 + 40));
    objc_sync_exit(v5);

  }
}

void __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const void *data;
  void *v4;
  size_t length;

  length = 0;
  data = xpc_dictionary_get_data(xdict, "data", &length);
  if (data)
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data, length);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __58__NEIPC_sendMessageWithType_data_replyQueue_replyHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end
