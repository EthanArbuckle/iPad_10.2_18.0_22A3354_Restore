@implementation HCServer

- (HCServer)init
{
  HCServer *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HCServer;
  v2 = -[HCServer init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INITIATED, 0);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("heard_xpc_queue", v3);

    -[HCServer setConnectionQueue:](v2, "setConnectionQueue:", v4);
  }
  return v2;
}

- (void)setConnectionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_connectionQueue, a3);
}

void __49__HCServer_sendMessageWithPayload_andIdentifier___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;

  objc_msgSend(*(id *)(a1 + 32), "setupServerIfNecessary");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    xpc_connection_send_message(v2, *(xpc_object_t *)(a1 + 40));
    v2 = v3;
  }

}

- (id)setupServerIfNecessary
{
  NSObject *v3;
  _xpc_connection_s *mach_service;
  NSObject *v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  id location;
  uint8_t buf[4];
  HCServer *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[HCServer connectionQueue](self, "connectionQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  -[HCServer xpcConnection](self, "xpcConnection");
  mach_service = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (!mach_service)
  {
    if (-[HCServer deadConnection](self, "deadConnection"))
    {
      mach_service = 0;
    }
    else
    {
      mach_service = xpc_connection_create_mach_service((const char *)objc_msgSend(CFSTR("com.apple.accessibility.heard"), "UTF8String"), v3, 0);
      xpc_connection_set_target_queue(mach_service, v3);
      objc_initWeak(&location, self);
      v7 = MEMORY[0x1E0C809B0];
      v8 = 3221225472;
      v9 = __34__HCServer_setupServerIfNecessary__block_invoke;
      v10 = &unk_1E66CFC90;
      objc_copyWeak(&v11, &location);
      xpc_connection_set_event_handler(mach_service, &v7);
      xpc_connection_activate(mach_service);
      -[HCServer setXpcConnection:](self, "setXpcConnection:", mach_service, v7, v8, v9, v10);
      HCLogHearingXPC();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v14 = self;
        _os_log_impl(&dword_1B3CA7000, v5, OS_LOG_TYPE_DEFAULT, "Set new xpc connection: %@", buf, 0xCu);
      }

      objc_destroyWeak(&v11);
      objc_destroyWeak(&location);
    }
  }

  return mach_service;
}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)sendMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0CF3A10];
  +[HCUtilities messagePayloadFromDictionary:andIdentifier:](HCUtilities, "messagePayloadFromDictionary:andIdentifier:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = (void *)objc_msgSend(v5, "copyXPCMessageFromDictionary:inReplyToXPCMessage:error:", v6, 0, &v13);
  v8 = v13;

  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    -[HCServer connectionQueue](self, "connectionQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __49__HCServer_sendMessageWithPayload_andIdentifier___block_invoke;
    block[3] = &unk_1E66CFCB8;
    block[4] = self;
    v12 = v7;
    dispatch_async(v10, block);

  }
}

- (OS_dispatch_queue)connectionQueue
{
  return self->_connectionQueue;
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (BOOL)deadConnection
{
  return self->_deadConnection;
}

void __34__HCServer_setupServerIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "handleReply:", v3);

}

- (void)handleReply:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  id v20;
  _QWORD block[5];
  id v22;
  _QWORD v23[5];

  v4 = a3;
  v5 = MEMORY[0x1B5E2E988]();
  if (v5 == MEMORY[0x1E0C81310])
  {
    v9 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __24__HCServer_handleReply___block_invoke;
    v23[3] = &unk_1E66CFBF0;
    v23[4] = self;
    v10 = MEMORY[0x1B5E2E7C0](v23);
    v11 = (void *)v10;
    if (v4 == (id)MEMORY[0x1E0C81258])
    {
      dispatch_get_global_queue(21, 0);
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __24__HCServer_handleReply___block_invoke_12;
      block[3] = &unk_1E66CFC68;
      block[4] = self;
      v22 = v11;
      dispatch_async(v12, block);

    }
    else
    {
      (*(void (**)(uint64_t, uint64_t))(v10 + 16))(v10, 1);
    }
    if (v4 == (id)MEMORY[0x1E0C81260])
    {
      HCLogHearingXPC();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        -[HCServer handleReply:].cold.1(v13);

      -[HCServer setDeadConnection:](self, "setDeadConnection:", 1);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Error in client connection event handler: %s"), xpc_dictionary_get_string(v4, (const char *)*MEMORY[0x1E0C81270]));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HCServer handleMessageError:destructive:](self, "handleMessageError:destructive:", v14, 1);

  }
  else if (v5 == MEMORY[0x1E0C812F8])
  {
    v20 = 0;
    objc_msgSend(MEMORY[0x1E0CF3A10], "dictionaryFromXPCMessage:error:", v4, &v20);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v20;
    if (v7)
      goto LABEL_4;
    objc_msgSend(v6, "objectForKey:", CFSTR("axha_payload"));
    v15 = objc_claimAutoreleasedReturnValue();
    if (!v15)
      goto LABEL_4;
    v16 = (void *)v15;
    objc_msgSend(v6, "objectForKey:", CFSTR("axha_messageID"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedLongLongValue");

    if (v18)
    {
      objc_msgSend(v6, "objectForKey:", CFSTR("axha_payload"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("axha_messageID"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HCServer handleMessageWithPayload:forIdentifier:](self, "handleMessageWithPayload:forIdentifier:", v8, objc_msgSend(v19, "unsignedLongLongValue"));

    }
    else
    {
LABEL_4:
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Malformed message: %@"), v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[HCServer handleMessageError:destructive:](self, "handleMessageError:destructive:", v8, 0);
    }

  }
}

- (void)dealloc
{
  objc_super v3;

  -[HCServer terminateConnectionAndNotify:](self, "terminateConnectionAndNotify:", 1);
  v3.receiver = self;
  v3.super_class = (Class)HCServer;
  -[HCServer dealloc](&v3, sel_dealloc);
}

- (void)terminateConnectionAndNotify:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[5];
  BOOL v12;
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection terminated: %@"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HCServer terminateConnectionAndNotify:]", 45, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)HAEngineeringLog;
  if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    v8 = objc_retainAutorelease(v6);
    v9 = v7;
    *(_DWORD *)buf = 136446210;
    v14 = objc_msgSend(v8, "UTF8String");
    _os_log_impl(&dword_1B3CA7000, v9, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HCServer connectionQueue](self, "connectionQueue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __41__HCServer_terminateConnectionAndNotify___block_invoke;
  block[3] = &unk_1E66CFBC8;
  block[4] = self;
  v12 = a3;
  dispatch_async(v10, block);

}

void __41__HCServer_terminateConnectionAndNotify___block_invoke(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "setXpcConnection:", 0);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "delegate");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (void *)v2;
      objc_msgSend(*(id *)(a1 + 32), "delegate");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) != 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "delegate");
        v6 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "hearingServerDidDie:", *(_QWORD *)(a1 + 32));

      }
    }
  }
}

- (void)resetConnection
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t buf[4];
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  HAInitializeLogging();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Connection reset: %@"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HCServer resetConnection]", 58, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)HAEngineeringLog;
  if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_retainAutorelease(v4);
    v7 = v5;
    *(_DWORD *)buf = 136446210;
    v9 = objc_msgSend(v6, "UTF8String");
    _os_log_impl(&dword_1B3CA7000, v7, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

  }
  -[HCServer terminateConnectionAndNotify:](self, "terminateConnectionAndNotify:", 1);
}

- (void)shouldRestartOnInterruption:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (BOOL)isConnected
{
  void *v2;
  BOOL v3;

  -[HCServer xpcConnection](self, "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

uint64_t __24__HCServer_handleReply___block_invoke(uint64_t a1, int a2)
{
  NSObject *v3;
  uint8_t v5[16];

  if (!a2)
    return objc_msgSend(*(id *)(a1 + 32), "terminateConnectionAndNotify:", 0);
  HCLogHearingXPC();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1B3CA7000, v3, OS_LOG_TYPE_DEFAULT, "Restarting connection", v5, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "resetConnection");
}

void __24__HCServer_handleReply___block_invoke_12(uint64_t a1)
{
  void *v1;
  _QWORD v2[4];
  id v3;
  id v4;

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __24__HCServer_handleReply___block_invoke_2;
  v2[3] = &unk_1E66CFC40;
  v1 = *(void **)(a1 + 40);
  v3 = *(id *)(a1 + 32);
  v4 = v1;
  objc_msgSend(v3, "shouldRestartOnInterruption:", v2);

}

void __24__HCServer_handleReply___block_invoke_2(uint64_t a1, char a2)
{
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "connectionQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__HCServer_handleReply___block_invoke_3;
  v6[3] = &unk_1E66CFC18;
  v7 = *(id *)(a1 + 40);
  v8 = a2;
  dispatch_async(v4, v6);

  HCLogHearingXPC();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __24__HCServer_handleReply___block_invoke_2_cold_1(a2, v5);

}

uint64_t __24__HCServer_handleReply___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (void)sendSynchronousMessageWithPayload:(id)a3 andIdentifier:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0CF3A10];
  +[HCUtilities messagePayloadFromDictionary:andIdentifier:](HCUtilities, "messagePayloadFromDictionary:andIdentifier:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0;
  v7 = (void *)objc_msgSend(v5, "copyXPCMessageFromDictionary:inReplyToXPCMessage:error:", v6, 0, &v13);
  v8 = v13;

  if (v8)
    v9 = 1;
  else
    v9 = v7 == 0;
  if (!v9)
  {
    -[HCServer connectionQueue](self, "connectionQueue");
    v10 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __60__HCServer_sendSynchronousMessageWithPayload_andIdentifier___block_invoke;
    block[3] = &unk_1E66CFCB8;
    block[4] = self;
    v12 = v7;
    dispatch_async(v10, block);

  }
}

void __60__HCServer_sendSynchronousMessageWithPayload_andIdentifier___block_invoke(uint64_t a1)
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  _xpc_connection_s *v4;

  objc_msgSend(*(id *)(a1 + 32), "setupServerIfNecessary");
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v4 = v2;
    v3 = xpc_connection_send_message_with_reply_sync(v2, *(xpc_object_t *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "handleReply:", v3);

    v2 = v4;
  }

}

- (void)startServerAndBoostPriority
{
  -[HCServer sendMessageWithPayload:andIdentifier:](self, "sendMessageWithPayload:andIdentifier:", &unk_1E66D1B00, 0x10000);
}

- (void)handleMessageWithPayload:(id)a3 forIdentifier:(unint64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a3;
  -[HCServer messageDelegate](self, "messageDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HCServer messageDelegate](self, "messageDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleMessageWithPayload:forIdentifier:", v9, a4);

  }
}

- (void)handleMessageError:(id)a3 destructive:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  char v7;
  void *v8;
  id v9;

  v4 = a4;
  v9 = a3;
  -[HCServer messageDelegate](self, "messageDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[HCServer messageDelegate](self, "messageDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleMessageError:destructive:", v9, v4);

  }
}

- (AXHeardServerDelegate)delegate
{
  return (AXHeardServerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (AXHeardServerMessageDelegate)messageDelegate
{
  return (AXHeardServerMessageDelegate *)objc_loadWeakRetained((id *)&self->_messageDelegate);
}

- (void)setMessageDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_messageDelegate, a3);
}

- (void)setDeadConnection:(BOOL)a3
{
  self->_deadConnection = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_destroyWeak((id *)&self->_messageDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)handleReply:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1B3CA7000, log, OS_LOG_TYPE_ERROR, "Connection dead, restarting connection", v1, 2u);
}

void __24__HCServer_handleReply___block_invoke_2_cold_1(char a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1 & 1;
  _os_log_error_impl(&dword_1B3CA7000, a2, OS_LOG_TYPE_ERROR, "Connection interrupted, restarting: %d", (uint8_t *)v2, 8u);
}

@end
