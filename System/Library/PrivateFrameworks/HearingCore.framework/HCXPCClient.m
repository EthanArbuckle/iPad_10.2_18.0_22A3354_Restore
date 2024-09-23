@implementation HCXPCClient

+ (HCXPCClient)clientWithConnection:(id)a3
{
  id v3;
  HCXPCClient *v4;

  v3 = a3;
  v4 = -[HCXPCClient initWithConnection:]([HCXPCClient alloc], "initWithConnection:", v3);

  return v4;
}

- (BOOL)sendMessage:(id)a3 errorBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[HCXPCClient xpcQueue](self, "xpcQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[HCXPCClient xpcQueue](self, "xpcQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __38__HCXPCClient_sendMessage_errorBlock___block_invoke;
    block[3] = &unk_1E66CFBA0;
    block[4] = self;
    v12 = v6;
    v13 = v7;
    dispatch_async(v9, block);

  }
  return 1;
}

- (OS_dispatch_queue)xpcQueue
{
  return self->_xpcQueue;
}

- (HCXPCClient)initWithConnection:(id)a3
{
  _xpc_connection_s *v4;
  id v5;
  objc_class *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  objc_super v14;

  v4 = (_xpc_connection_s *)a3;
  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)HCXPCClient;
    self = -[HCXPCClient init](&v14, sel_init);
    if (self)
    {
      v5 = objc_alloc(MEMORY[0x1E0CB3940]);
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "UUIDString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v5, "initWithFormat:", CFSTR("%@.%@.%@-%p"), CFSTR("com.apple.accessibility.heard"), v7, v9, v4);

      v11 = objc_retainAutorelease(v10);
      v12 = dispatch_queue_create((const char *)objc_msgSend(v11, "UTF8String"), 0);
      xpc_connection_set_target_queue(v4, v12);
      -[HCXPCClient setXpcQueue:](self, "setXpcQueue:", v12);
      -[HCXPCClient setXpcConnection:](self, "setXpcConnection:", v4);

    }
  }

  return self;
}

- (void)setXpcQueue:(id)a3
{
  objc_storeStrong((id *)&self->_xpcQueue, a3);
}

- (void)setXpcConnection:(id)a3
{
  objc_storeStrong((id *)&self->_xpcConnection, a3);
}

- (id)description
{
  void *v3;
  _xpc_connection_s *v4;
  uint64_t pid;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  -[HCXPCClient xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HCXPCClient xpcConnection](self, "xpcConnection");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    pid = xpc_connection_get_pid(v4);

  }
  else
  {
    pid = 0xFFFFFFFFLL;
  }

  v6 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)HCXPCClient;
  -[HCXPCClient description](&v10, sel_description);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("%@ [%d]"), v7, pid);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void __38__HCXPCClient_sendMessage_errorBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  _xpc_connection_s *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint8_t buf[4];
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    v8 = 0;
    goto LABEL_17;
  }
  v3 = (void *)MEMORY[0x1E0CF3A10];
  objc_msgSend(*(id *)(a1 + 40), "payload");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "xpcMessage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v6 = (void *)objc_msgSend(v3, "copyXPCMessageFromDictionary:inReplyToXPCMessage:error:", v4, v5, &v26);
  v7 = v26;

  if (v6)
  {
    v8 = v7;
  }
  else
  {
    v9 = (void *)MEMORY[0x1E0CF3A10];
    objc_msgSend(*(id *)(a1 + 40), "payload");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v7;
    v6 = (void *)objc_msgSend(v9, "copyXPCMessageFromDictionary:inReplyToXPCMessage:error:", v10, 0, &v25);
    v8 = v25;

    if (!v6)
    {
      v15 = 0;
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = 1;
      goto LABEL_10;
    }
  }
  v11 = MEMORY[0x1B5E2E988](v6);
  v12 = MEMORY[0x1E0C812F8];
  if (v11 != MEMORY[0x1E0C812F8])
  {
    v13 = (void *)MEMORY[0x1E0CB3940];
    v14 = MEMORY[0x1B5E2E988](v6) == v12;
    v15 = 1;
LABEL_10:
    objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringWithFormat:", CFSTR("Not sending %d, %d, %d = %@ ==== %@"), v15, v14, v17 != 0, v8, *(_QWORD *)(a1 + 40));
    v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();

    HAInitializeLogging();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s:%d %@"), "-[HCXPCClient sendMessage:errorBlock:]_block_invoke", 107, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)HAEngineeringLog;
    if (os_log_type_enabled((os_log_t)HAEngineeringLog, OS_LOG_TYPE_DEFAULT))
    {
      v21 = objc_retainAutorelease(v19);
      v22 = v20;
      v23 = objc_msgSend(v21, "UTF8String");
      *(_DWORD *)buf = 136446210;
      v28 = v23;
      _os_log_impl(&dword_1B3CA7000, v22, OS_LOG_TYPE_DEFAULT, "%{public}s", buf, 0xCu);

    }
    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "ax_errorWithDomain:description:", CFSTR("Send message error"), CFSTR("%@"), v16);
      v8 = (id)objc_claimAutoreleasedReturnValue();
    }
    goto LABEL_14;
  }
  objc_msgSend(*(id *)(a1 + 32), "xpcConnection");
  v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  xpc_connection_send_message(v16, v6);
LABEL_14:

  if (v8)
  {
    v24 = *(_QWORD *)(a1 + 48);
    if (v24)
      (*(void (**)(uint64_t, id))(v24 + 16))(v24, v8);
  }
LABEL_17:

}

- (OS_xpc_object)xpcConnection
{
  return self->_xpcConnection;
}

- (void)dealloc
{
  objc_super v3;

  -[HCXPCClient setXpcConnection:](self, "setXpcConnection:", 0);
  -[HCXPCClient setXpcQueue:](self, "setXpcQueue:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HCXPCClient;
  -[HCXPCClient dealloc](&v3, sel_dealloc);
}

- (int)pid
{
  void *v3;
  _xpc_connection_s *v4;
  pid_t pid;

  -[HCXPCClient xpcConnection](self, "xpcConnection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[HCXPCClient xpcConnection](self, "xpcConnection");
    v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    pid = xpc_connection_get_pid(v4);

  }
  else
  {
    pid = -1;
  }

  return pid;
}

- (void)teardownConnection
{
  -[HCXPCClient setXpcConnection:](self, "setXpcConnection:", 0);
  -[HCXPCClient setXpcQueue:](self, "setXpcQueue:", 0);
}

- (void)setWantsUpdates:(BOOL)a3 forIdentifier:(unint64_t)a4
{
  _BOOL4 v5;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  unint64_t v10;
  NSObject *v11;
  void *v12;
  int v13;
  HCXPCClient *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v5 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  v7 = -[HCXPCClient requestedUpdates](self, "requestedUpdates");
  if (v5)
  {
    if ((v7 & a4) != a4)
    {
      HCLogHearingXPC();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        messageIdentifierDescription(a4);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v9;
        _os_log_impl(&dword_1B3CA7000, v8, OS_LOG_TYPE_DEFAULT, "Client %@ wants update for: %@", (uint8_t *)&v13, 0x16u);

      }
    }
    v10 = -[HCXPCClient requestedUpdates](self, "requestedUpdates") | a4;
  }
  else
  {
    if ((v7 & a4) == a4)
    {
      HCLogHearingXPC();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        messageIdentifierDescription(a4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = 138412546;
        v14 = self;
        v15 = 2112;
        v16 = v12;
        _os_log_impl(&dword_1B3CA7000, v11, OS_LOG_TYPE_DEFAULT, "Client %@ doesn't want update for: %@", (uint8_t *)&v13, 0x16u);

      }
    }
    v10 = -[HCXPCClient requestedUpdates](self, "requestedUpdates") & ~a4;
  }
  -[HCXPCClient setRequestedUpdates:](self, "setRequestedUpdates:", v10);
}

- (BOOL)wantsUpdatesForIdentifier:(unint64_t)a3
{
  return (a3 & ~-[HCXPCClient requestedUpdates](self, "requestedUpdates")) == 0;
}

- (unint64_t)requestedUpdates
{
  return self->_requestedUpdates;
}

- (void)setRequestedUpdates:(unint64_t)a3
{
  self->_requestedUpdates = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpcQueue, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
}

@end
