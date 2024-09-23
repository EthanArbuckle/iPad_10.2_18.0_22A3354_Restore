@implementation DYXPCTransport

- (DYXPCTransport)initWithAMDIdentifier:(id)a3
{
  id v4;
  DYXPCTransport *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)DYXPCTransport;
  v5 = -[DYTransport init](&v8, sel_init);
  if (v5)
  {
    v6 = objc_retainAutorelease(v4);
    objc_msgSend(v6, "UTF8String");
    objc_storeStrong((id *)&v5->_amdIdentifier, v6);
  }

  return v5;
}

- (id)connect
{
  DYFuture *v3;
  DYFuture *future;
  DYFuture *v5;
  DYFuture *v6;
  OS_xpc_object *v7;
  OS_xpc_object *connection;
  OS_xpc_object *v9;
  uint64_t v10;
  _xpc_connection_s *v11;
  xpc_endpoint_t v12;
  xpc_object_t empty;
  OS_xpc_object *v14;
  NSString *amdIdentifier;
  OS_xpc_object *v16;
  NSObject *queue;
  DYFuture *v18;
  DYFuture *v19;
  _QWORD v21[5];
  _QWORD handler[5];

  if (-[DYXPCTransport connected](self, "connected"))
  {
    +[DYFuture future](DYFuture, "future");
    v3 = (DYFuture *)objc_claimAutoreleasedReturnValue();
    -[DYFuture setResult:](v3, "setResult:", MEMORY[0x24BDBD1C8]);
  }
  else
  {
    future = self->_future;
    if (future)
    {
      v3 = future;
    }
    else
    {
      v5 = (DYFuture *)objc_opt_new();
      v6 = self->_future;
      self->_future = v5;

      v7 = xpc_connection_create("com.apple.gputools.GPUToolsCompatService", (dispatch_queue_t)self->super._queue);
      connection = self->_connection;
      self->_connection = v7;

      xpc_connection_set_target_queue(self->_connection, (dispatch_queue_t)self->super._queue);
      v9 = self->_connection;
      v10 = MEMORY[0x24BDAC760];
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 3221225472;
      handler[2] = __25__DYXPCTransport_connect__block_invoke;
      handler[3] = &unk_250D63398;
      handler[4] = self;
      xpc_connection_set_event_handler(v9, handler);
      xpc_connection_activate(self->_connection);
      v11 = xpc_connection_create("com.apple.gputools.GPUToolsAgentService", (dispatch_queue_t)self->super._queue);
      xpc_connection_set_event_handler(v11, &__block_literal_global_9);
      xpc_connection_activate(v11);
      v12 = xpc_endpoint_create(v11);
      empty = xpc_dictionary_create_empty();
      xpc_dictionary_set_value(empty, "main_agent_endpoint", v12);
      v14 = self->_connection;
      if (v14)
      {
        xpc_connection_send_message(v14, empty);

        v11 = (_xpc_connection_s *)xpc_dictionary_create_empty();
        xpc_dictionary_set_string(v11, "_cmd", "connect");
        amdIdentifier = self->_amdIdentifier;
        if (amdIdentifier)
          xpc_dictionary_set_string(v11, "amdIdentifier", -[NSString UTF8String](amdIdentifier, "UTF8String"));
        v16 = self->_connection;
        if (v16)
        {
          queue = self->super._queue;
          v21[0] = v10;
          v21[1] = 3221225472;
          v21[2] = __25__DYXPCTransport_connect__block_invoke_3;
          v21[3] = &unk_250D63398;
          v21[4] = self;
          xpc_connection_send_message_with_reply(v16, v11, queue, v21);
          v3 = self->_future;
        }
        else
        {
          v19 = self->_future;
          self->_future = 0;

          +[DYFuture future](DYFuture, "future");
          v3 = (DYFuture *)objc_claimAutoreleasedReturnValue();
          -[DYFuture setResult:](v3, "setResult:", MEMORY[0x24BDBD1C0]);
        }
      }
      else
      {
        v18 = self->_future;
        self->_future = 0;

        +[DYFuture future](DYFuture, "future");
        v3 = (DYFuture *)objc_claimAutoreleasedReturnValue();
        -[DYFuture setResult:](v3, "setResult:", MEMORY[0x24BDBD1C0]);

      }
    }
  }
  return v3;
}

uint64_t __25__DYXPCTransport_connect__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "process_message_from_compat_daemon:", a2);
}

void __25__DYXPCTransport_connect__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *nserror;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(a1 + 32) + 128))
  {
    v12 = v3;
    v4 = MEMORY[0x242623868]();
    if (v4 != MEMORY[0x24BDACFB8] && v4 == MEMORY[0x24BDACFA0])
    {
      nserror = (void *)xpc_dictionary_get_nserror(v12, "_error");
      v8 = *(_QWORD *)(a1 + 32);
      if (nserror)
        *(_BYTE *)(v8 + 128) = 0;
      else
        *(_BYTE *)(v8 + 128) = 1;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setResult:", v9);

      v10 = *(_QWORD *)(a1 + 32);
      v11 = *(void **)(v10 + 120);
      *(_QWORD *)(v10 + 120) = 0;

    }
    else
    {
      *(_BYTE *)(*(_QWORD *)(a1 + 32) + 128) = 0;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 128));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setResult:", v5);

      v6 = *(_QWORD *)(a1 + 32);
      nserror = *(void **)(v6 + 120);
      *(_QWORD *)(v6 + 120) = 0;
    }

    v3 = v12;
  }

}

- (BOOL)connected
{
  return self->_connected;
}

- (void)_invalidate
{
  OS_xpc_object *connection;
  OS_xpc_object *v4;
  DYFuture *future;
  DYFuture *v6;
  objc_super v7;

  connection = self->_connection;
  if (connection)
  {
    xpc_connection_cancel(connection);
    self->_connected = 0;
    v4 = self->_connection;
    self->_connection = 0;

    future = self->_future;
    if (future)
    {
      -[DYFuture setResult:](future, "setResult:", MEMORY[0x24BDBD1C0]);
      v6 = self->_future;
      self->_future = 0;

    }
  }
  v7.receiver = self;
  v7.super_class = (Class)DYXPCTransport;
  -[DYTransport _invalidate](&v7, sel__invalidate);
}

- (BOOL)isNewTransport
{
  return 1;
}

- (BOOL)_packMessage:(id)a3 error:(id *)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  void *v14;
  id v15;

  v5 = a3;
  objc_msgSend(v5, "attributes");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (!v6)
    goto LABEL_4;
  v7 = (void *)MEMORY[0x2426231FC]();
  v8 = (void *)MEMORY[0x24BDD1770];
  objc_msgSend(v5, "attributes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "dataWithPropertyList:format:options:error:", v9, 200, 0, &v15);
  v10 = objc_claimAutoreleasedReturnValue();
  v6 = v15;

  objc_autoreleasePoolPop(v7);
  if (v10)
  {
    objc_msgSend(v5, "setEncodedAttributes:", v10);

    v6 = (id)v10;
LABEL_4:
    v11 = objc_msgSend(v6, "length");
    objc_msgSend(v5, "payload");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    a4 = (id *)(objc_msgSend(v12, "length") + v11);

    objc_msgSend(v5, "_setTransportSize:", a4);
    LOBYTE(a4) = 1;
    goto LABEL_5;
  }
  if (a4)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", v6, *MEMORY[0x24BDD1398]);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[DYError errorWithDomain:code:userInfo:](DYError, "errorWithDomain:code:userInfo:", CFSTR("DYErrorDomain"), 36, v14);
    *a4 = (id)objc_claimAutoreleasedReturnValue();

    LOBYTE(a4) = 0;
  }
LABEL_5:

  return (char)a4;
}

- (int64_t)_sendMessage:(id)a3 error:(id *)a4
{
  id v6;
  xpc_object_t empty;
  const char *Name;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  const void *v21;
  void *v22;
  int64_t v23;
  id v25;

  v6 = a3;
  empty = xpc_dictionary_create_empty();
  Name = sel_getName(a2);
  xpc_dictionary_set_string(empty, "_cmd", Name);
  v9 = empty;
  v10 = v6;
  xpc_dictionary_set_uint64(v9, "kind", objc_msgSend(v10, "kind"));
  xpc_dictionary_set_uint64(v9, "serial", objc_msgSend(v10, "serial"));
  xpc_dictionary_set_uint64(v9, "replySerial", objc_msgSend(v10, "replySerial"));
  objc_msgSend(v10, "attributes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_msgSend(v10, "encodedAttributes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      v14 = v12;
    }
    else
    {
      v15 = (void *)MEMORY[0x24BDD1770];
      objc_msgSend(v10, "attributes");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = 0;
      objc_msgSend(v15, "dataWithPropertyList:format:options:error:", v16, 200, 0, &v25);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v17 = v25;

    }
    v18 = objc_retainAutorelease(v14);
    xpc_dictionary_set_data(v9, "attributes", (const void *)objc_msgSend(v18, "bytes"), objc_msgSend(v18, "length"));

  }
  objc_msgSend(v10, "payload");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v10, "payload");
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v21 = (const void *)objc_msgSend(v20, "bytes");
    objc_msgSend(v10, "payload");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_data(v9, "payload", v21, objc_msgSend(v22, "length"));

  }
  objc_msgSend(v10, "setEncodedAttributes:", 0);
  xpc_connection_send_message(self->_connection, v9);
  v23 = objc_msgSend(v10, "transportSize");

  return v23;
}

- (void)process_message_from_compat_daemon:(id)a3
{
  id v4;
  id v5;
  DYXPCTransport *v6;
  uint64_t uint64;
  void *data;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  size_t length;

  v4 = a3;
  if (MEMORY[0x242623868]() == MEMORY[0x24BDACFA0])
  {
    v5 = v4;
    v6 = self;
    uint64 = xpc_dictionary_get_uint64(v5, "kind");
    length = 0;
    data = (void *)xpc_dictionary_get_data(v5, "attributes", &length);
    if (data)
    {
      v9 = objc_alloc(MEMORY[0x24BDBCE50]);
      v10 = (void *)objc_msgSend(v9, "initWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
      v15 = 0;
      objc_msgSend(MEMORY[0x24BDD1770], "propertyListWithData:options:format:error:", v10, 0, 0, &v15);
      data = (void *)objc_claimAutoreleasedReturnValue();

    }
    length = 0;
    v11 = (void *)xpc_dictionary_get_data(v5, "payload", &length);
    if (v11)
    {
      v12 = objc_alloc(MEMORY[0x24BDBCE50]);
      v11 = (void *)objc_msgSend(v12, "initWithBytes:length:", v11, length);
    }
    +[DYTransportMessage messageWithKind:attributes:payload:](DYTransportMessage, "messageWithKind:attributes:payload:", uint64, data, v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = xpc_dictionary_get_uint64(v5, "serial");
    objc_msgSend(v13, "_setSerial:replySerial:transport:", v14, xpc_dictionary_get_uint64(v5, "replySerial"), v6);

    -[DYTransport _dispatchMessage:](v6, "_dispatchMessage:", v13);
  }
  else
  {
    -[DYTransport invalidate](self, "invalidate");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_future, 0);
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_amdIdentifier, 0);
}

@end
