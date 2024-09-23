@implementation CSDeviceActivationXPCConnection

- (CSDeviceActivationXPCConnection)initWithConnection:(id)a3
{
  id v5;
  CSDeviceActivationXPCConnection *v6;
  CSDeviceActivationXPCConnection *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *queue;
  NSObject *v10;
  NSObject *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CSDeviceActivationXPCConnection;
  v6 = -[CSDeviceActivationXPCConnection init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = dispatch_queue_create("corespeechd xpc connection client queue", 0);
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = v7->_queue;
    dispatch_get_global_queue(33, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    dispatch_set_target_queue(v10, v11);

    xpc_connection_set_target_queue(v7->_connection, (dispatch_queue_t)v7->_queue);
  }

  return v7;
}

- (void)activateConnection
{
  OS_xpc_object *connection;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  connection = self->_connection;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __53__CSDeviceActivationXPCConnection_activateConnection__block_invoke;
  v4[3] = &unk_1E6881020;
  objc_copyWeak(&v5, &location);
  xpc_connection_set_event_handler(connection, v4);
  xpc_connection_activate(self->_connection);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_handleClientEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  uint64_t v11;
  OS_xpc_object *connection;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  OS_xpc_object *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (v4 && self->_connection)
  {
    v6 = MEMORY[0x1B5E46F84](v4);
    if (v6 == MEMORY[0x1E0C812F8])
    {
      -[CSDeviceActivationXPCConnection _handleClientMessage:client:](self, "_handleClientMessage:client:", v5, self->_connection);
      goto LABEL_12;
    }
    if (v6 == MEMORY[0x1E0C81310])
    {
      -[CSDeviceActivationXPCConnection _handleClientError:client:](self, "_handleClientError:client:", v5, self->_connection);
      goto LABEL_12;
    }
    v7 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      v13 = 136315138;
      v14 = "-[CSDeviceActivationXPCConnection _handleClientEvent:]";
      v8 = "%s ignore unknown types of message";
      v9 = v7;
      v10 = 12;
LABEL_9:
      _os_log_error_impl(&dword_1B502E000, v9, OS_LOG_TYPE_ERROR, v8, (uint8_t *)&v13, v10);
    }
  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      connection = self->_connection;
      v13 = 136315650;
      v14 = "-[CSDeviceActivationXPCConnection _handleClientEvent:]";
      v15 = 2050;
      v16 = v5;
      v17 = 2050;
      v18 = connection;
      v8 = "%s event = %{public}p client = %{public}p cannot handle event";
      v9 = v11;
      v10 = 32;
      goto LABEL_9;
    }
  }
LABEL_12:

}

- (void)_handleClientMessage:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int64_t int64;
  NSObject *v10;
  uint64_t v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  int64_t v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (!v6 || !v7)
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v16 = 136315650;
    v17 = "-[CSDeviceActivationXPCConnection _handleClientMessage:client:]";
    v18 = 2050;
    v19 = (int64_t)v6;
    v20 = 2050;
    v21 = v8;
    v12 = "%s message = %{public}p, client = %{public}p, cannot handle message";
    v13 = v11;
    v14 = 32;
LABEL_12:
    _os_log_error_impl(&dword_1B502E000, v13, OS_LOG_TYPE_ERROR, v12, (uint8_t *)&v16, v14);
    goto LABEL_10;
  }
  int64 = xpc_dictionary_get_int64(v6, "type");
  v10 = CSLogContextFacilityCoreSpeech;
  if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[CSDeviceActivationXPCConnection _handleClientMessage:client:]";
    v18 = 2050;
    v19 = int64;
    _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Message type = %{public}lld", (uint8_t *)&v16, 0x16u);
  }
  if (int64 != 2)
  {
    v15 = CSLogContextFacilityCoreSpeech;
    if (!os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      goto LABEL_10;
    v16 = 136315138;
    v17 = "-[CSDeviceActivationXPCConnection _handleClientMessage:client:]";
    v12 = "%s Cannot handle wrong message type";
    v13 = v15;
    v14 = 12;
    goto LABEL_12;
  }
  -[CSDeviceActivationXPCConnection _handleActivateEventMesssage:client:](self, "_handleActivateEventMesssage:client:", v6, v8);
LABEL_10:

}

- (void)_handleClientError:(id)a3 client:(id)a4
{
  id v6;
  char *v7;
  char *v8;
  NSObject *v10;
  id WeakRetained;
  void *v12;
  id v13;
  char v14;
  id v15;
  const char *string;
  NSObject *v17;
  int v19;
  const char *v20;
  __int16 v21;
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (char *)a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (v6 == (id)MEMORY[0x1E0C81260] || v6 == (id)MEMORY[0x1E0C81258])
    {
      v10 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_DEFAULT))
      {
        v19 = 136315394;
        v20 = "-[CSDeviceActivationXPCConnection _handleClientError:client:]";
        v21 = 2050;
        v22 = v8;
        _os_log_impl(&dword_1B502E000, v10, OS_LOG_TYPE_DEFAULT, "%s Client %{public}p connection disconnected, noticing xpc listener", (uint8_t *)&v19, 0x16u);
      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if (WeakRetained)
      {
        v12 = WeakRetained;
        v13 = objc_loadWeakRetained((id *)&self->_delegate);
        v14 = objc_opt_respondsToSelector();

        if ((v14 & 1) != 0)
        {
          v15 = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(v15, "CSActivationXPCConnectionReceivedClientError:clientError:client:", self, v6, v8);

        }
      }
    }
    else
    {
      string = xpc_dictionary_get_string(v6, (const char *)*MEMORY[0x1E0C81270]);
      v17 = CSLogContextFacilityCoreSpeech;
      if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
      {
        v19 = 136315394;
        v20 = "-[CSDeviceActivationXPCConnection _handleClientError:client:]";
        v21 = 2082;
        v22 = string;
        _os_log_error_impl(&dword_1B502E000, v17, OS_LOG_TYPE_ERROR, "%s connection error: %{public}s", (uint8_t *)&v19, 0x16u);
      }
    }
  }

}

- (void)_sendReply:(id)a3 client:(id)a4 result:(BOOL)a5 error:(id)a6
{
  id v9;
  xpc_object_t reply;
  void *v11;
  id v12;
  _xpc_connection_s *connection;

  connection = (_xpc_connection_s *)a4;
  v9 = a6;
  reply = xpc_dictionary_create_reply(a3);
  v11 = reply;
  if (reply)
  {
    xpc_dictionary_set_BOOL(reply, "result", a5);
    if (v9)
    {
      objc_msgSend(v9, "domain");
      v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      xpc_dictionary_set_string(v11, "resultErrorDomain", (const char *)objc_msgSend(v12, "UTF8String"));

      xpc_dictionary_set_int64(v11, "resultErrorCode", objc_msgSend(v9, "code"));
    }
    xpc_connection_send_message(connection, v11);
  }

}

- (void)_handleActivateEventMesssage:(id)a3 client:(id)a4
{
  id v6;
  id v7;
  void *v8;
  CSDeviceActivationEvent *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  id v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  xpc_dictionary_get_dictionary(v6, "event");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = -[CSDeviceActivationEvent initWithXPCObject:]([CSDeviceActivationEvent alloc], "initWithXPCObject:", v8);
    +[CSDeviceActivationEventNotificationHandler sharedInstance](CSDeviceActivationEventNotificationHandler, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __71__CSDeviceActivationXPCConnection__handleActivateEventMesssage_client___block_invoke;
    v12[3] = &unk_1E687EFD8;
    v12[4] = self;
    v13 = v6;
    v14 = v7;
    objc_msgSend(v10, "notifyActivationEvent:completion:", v9, v12);

  }
  else
  {
    v11 = CSLogContextFacilityCoreSpeech;
    if (os_log_type_enabled((os_log_t)CSLogContextFacilityCoreSpeech, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "-[CSDeviceActivationXPCConnection _handleActivateEventMesssage:client:]";
      _os_log_error_impl(&dword_1B502E000, v11, OS_LOG_TYPE_ERROR, "%s Cannot handle activateEventMessage since event is nil", buf, 0xCu);
    }
    -[CSDeviceActivationXPCConnection _sendReply:client:result:error:](self, "_sendReply:client:result:error:", v6, v7, 0, 0);
  }

}

- (CSDeviceActivateXPCConnectionDelegate)delegate
{
  return (CSDeviceActivateXPCConnectionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_xpc_object)connection
{
  return self->_connection;
}

- (void)setConnection:(id)a3
{
  objc_storeStrong((id *)&self->_connection, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

uint64_t __71__CSDeviceActivationXPCConnection__handleActivateEventMesssage_client___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_sendReply:client:result:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), a2, a3);
}

void __53__CSDeviceActivationXPCConnection_activateConnection__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_handleClientEvent:", v3);

}

@end
