@implementation AXUIClient

- (AXUIClient)initWithIdentifier:(id)a3 serviceBundleName:(id)a4
{
  id v6;
  id v7;
  AXUIClient *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)AXUIClient;
  v8 = -[AXUIClient init](&v14, sel_init);
  if (v8)
  {
    v9 = (void *)objc_opt_new();
    +[AXUIClientConnection sharedClientConnection](AXUIClientConnection, "sharedClientConnection");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "length");
    if (v7 && v11 && v9 && v10)
    {
      -[AXUIClient setClientIdentifier:](v8, "setClientIdentifier:", v6);
      -[AXUIClient setServiceBundleName:](v8, "setServiceBundleName:", v7);
      -[AXUIClient setMessageSender:](v8, "setMessageSender:", v9);
      -[AXUIClient setClientConnection:](v8, "setClientConnection:", v10);
      -[AXUIClient clientConnection](v8, "clientConnection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "registerConnectionStateObserver:", v8);

      objc_msgSend(v9, "setDelegate:", v8);
    }
    else
    {

      v8 = 0;
    }

  }
  return v8;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  -[AXUIClient _cleanUp](self, "_cleanUp");
  AXLogAssertions();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21416F000, v3, OS_LOG_TYPE_DEFAULT, "AXUIClient dealloc", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)AXUIClient;
  -[AXUIClient dealloc](&v4, sel_dealloc);
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completion:(id)a6
{
  -[AXUIClient sendAsynchronousMessage:withIdentifier:targetAccessQueue:completionRequiresWritingBlock:completion:](self, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completionRequiresWritingBlock:completion:", a3, a4, a5, 1, a6);
}

- (void)sendAsynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 targetAccessQueue:(id)a5 completionRequiresWritingBlock:(BOOL)a6 completion:(id)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  NSObject *v17;
  void *v18;
  int v19;
  AXUIClient *v20;
  __int16 v21;
  unint64_t v22;
  uint64_t v23;

  v8 = a6;
  v23 = *MEMORY[0x24BDAC8D0];
  v12 = a5;
  v13 = a7;
  v14 = a3;
  -[AXUIClient _requestInitializationMessageFromDelegateIfNeeded](self, "_requestInitializationMessageFromDelegateIfNeeded");
  v15 = v12;
  v16 = v15;
  if (!v15)
  {
    v16 = 0;
    if (v13)
    {
      AXLogUI();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v19 = 138543618;
        v20 = self;
        v21 = 2048;
        v22 = a4;
        _os_log_impl(&dword_21416F000, v17, OS_LOG_TYPE_INFO, "%{public}@ sending asynchronous message with identifier %lu and a completion handler but no target access queue; defaulting to the background access queue.",
          (uint8_t *)&v19,
          0x16u);
      }

      objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  -[AXUIClient messageSender](self, "messageSender");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sendAsynchronousMessage:withIdentifier:context:targetAccessQueue:completionRequiresWritingBlock:completion:", v14, a4, 0, v16, v8, v13);

}

- (id)sendSynchronousMessage:(id)a3 withIdentifier:(unint64_t)a4 error:(id *)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a3;
  -[AXUIClient _requestInitializationMessageFromDelegateIfNeeded](self, "_requestInitializationMessageFromDelegateIfNeeded");
  -[AXUIClient messageSender](self, "messageSender");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendSynchronousMessage:withIdentifier:context:error:", v8, a4, 0, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)messageSender:(id)a3 accessLaunchAngelConnectionForMessageWithContext:(void *)a4 usingBlock:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[AXUIClient clientConnection](self, "clientConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performLaunchAngelTask:", v6);

}

- (void)messageSender:(id)a3 extractCustomDataFromXPCReply:(id)a4 numberOfKeyValuePairsForCustomData:(unint64_t *)a5
{
  void *v6;
  void *v7;

  xpc_dictionary_get_value(a4, (const char *)*MEMORY[0x24BDFF960]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a5)
    *a5 = v6 != 0;

  return v7;
}

- (void)messageSender:(id)a3 processCustomDataFromXPCReply:(void *)a4
{
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[AXUIClient messageSender](self, "messageSender", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "messageSchedulingSerializationQueue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "canWriteInCurrentExecutionThread");

  if ((v8 & 1) == 0)
  {
    AXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      -[AXUIClient messageSender:processCustomDataFromXPCReply:].cold.1(self);

  }
  v10 = a4;
  v11 = v10;
  if (v10 && MEMORY[0x2199CA0AC](v10) == MEMORY[0x24BDACF80] && xpc_BOOL_get_value(v11))
  {
    -[AXUIClient clientConnection](self, "clientConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXUIClient setRegisteredWithServer:](self, "setRegisteredWithServer:", 1);
    -[AXUIClient clientIdentifier](self, "clientIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "registerClient:withIdentifier:", self, v13);

  }
}

- (void)messageSender:(id)a3 willSendXPCMessage:(id)a4 context:(void *)a5
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  const char *v11;
  id v12;
  const char *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  id v19;

  v6 = a4;
  -[AXUIClient messageSender](self, "messageSender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageSchedulingSerializationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "canReadInCurrentExecutionThread");

  if ((v9 & 1) == 0)
  {
    AXLogCommon();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      -[AXUIClient messageSender:willSendXPCMessage:context:].cold.2(self);

  }
  if (!-[AXUIClient isRegisteredWithServer](self, "isRegisteredWithServer"))
  {
    v11 = (const char *)*MEMORY[0x24BDFF990];
    -[AXUIClient serviceBundleName](self, "serviceBundleName");
    v12 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    xpc_dictionary_set_string(v6, v11, (const char *)objc_msgSend(v12, "UTF8String"));

  }
  v13 = (const char *)*MEMORY[0x24BDFF970];
  -[AXUIClient clientIdentifier](self, "clientIdentifier");
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  xpc_dictionary_set_string(v6, v13, (const char *)objc_msgSend(v14, "UTF8String"));

  -[AXUIClient initializationMessage](self, "initializationMessage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    v19 = 0;
    v16 = (void *)objc_msgSend(MEMORY[0x24BDFE500], "copyXPCMessageFromDictionary:inReplyToXPCMessage:error:", v15, 0, &v19);
    v17 = v19;
    if (v16)
    {
      xpc_dictionary_set_value(v6, (const char *)*MEMORY[0x24BDFF978], v16);
      -[AXUIClient setInitializationMessage:](self, "setInitializationMessage:", 0);
    }
    else
    {
      AXLogUI();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[AXUIClient messageSender:willSendXPCMessage:context:].cold.1((uint64_t)v17, v18);

    }
  }

}

- (void)invalidate:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *clientIdentifier;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint8_t buf[4];
  NSString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  AXLogAssertions();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    clientIdentifier = self->_clientIdentifier;
    *(_DWORD *)buf = 138412290;
    v12 = clientIdentifier;
    _os_log_impl(&dword_21416F000, v5, OS_LOG_TYPE_DEFAULT, "AXUIClient sending Clean up message %@", buf, 0xCu);
  }

  v7 = *MEMORY[0x24BDFF958];
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __25__AXUIClient_invalidate___block_invoke;
  v9[3] = &unk_24D167310;
  v9[4] = self;
  v10 = v4;
  v8 = v4;
  -[AXUIClient sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:](self, "sendAsynchronousMessage:withIdentifier:targetAccessQueue:completion:", MEMORY[0x24BDBD1B8], v7, 0, v9);

}

uint64_t __25__AXUIClient_invalidate___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t result;
  uint8_t v4[16];

  objc_msgSend(*(id *)(a1 + 32), "_cleanUp");
  AXLogAssertions();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21416F000, v2, OS_LOG_TYPE_DEFAULT, "AXUIClient Clean up completed", v4, 2u);
  }

  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)_cleanUp
{
  NSObject *v3;
  NSString *clientIdentifier;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t);
  void *v15;
  AXUIClient *v16;
  id v17;
  uint8_t buf[4];
  NSString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (self->_clientIdentifier)
  {
    AXLogAssertions();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      clientIdentifier = self->_clientIdentifier;
      *(_DWORD *)buf = 138412290;
      v19 = clientIdentifier;
      _os_log_impl(&dword_21416F000, v3, OS_LOG_TYPE_DEFAULT, "AXUIClient Clean up %@", buf, 0xCu);
    }

  }
  -[AXUIClient clientConnection](self, "clientConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIClient clientConnection](self, "clientConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unregisterConnectionStateObserver:", self);

  -[AXUIClient messageSender](self, "messageSender");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "messageSchedulingSerializationQueue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v13 = 3221225472;
  v14 = __22__AXUIClient__cleanUp__block_invoke;
  v15 = &unk_24D167338;
  v16 = self;
  v17 = v5;
  v9 = v5;
  objc_msgSend(v8, "performSynchronousWritingBlock:", &v12);

  -[AXUIClient clientConnection](self, "clientConnection", v12, v13, v14, v15, v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "cleanUp");

  -[AXUIClient setClientConnection:](self, "setClientConnection:", 0);
  -[AXUIClient messageSender](self, "messageSender");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setDelegate:", 0);

  -[AXUIClient setMessageSender:](self, "setMessageSender:", 0);
  -[AXUIClient setServiceBundleName:](self, "setServiceBundleName:", 0);
  -[AXUIClient setClientIdentifier:](self, "setClientIdentifier:", 0);
  -[AXUIClient setInitializationMessage:](self, "setInitializationMessage:", 0);

}

uint64_t __22__AXUIClient__cleanUp__block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "isRegisteredWithServer");
  if ((_DWORD)result)
  {
    v4 = *(void **)(a1 + 32);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v4, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterClient:withIdentifier:", v4, v5);

    return objc_msgSend(*(id *)(a1 + 32), "setRegisteredWithServer:", 0);
  }
  return result;
}

- (void)_requestInitializationMessageFromDelegateIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  -[AXUIClient delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    -[AXUIClient messageSender](self, "messageSender");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "messageSchedulingSerializationQueue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x24BDAC760];
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke;
    v10[3] = &unk_24D167360;
    v10[4] = self;
    v10[5] = &v11;
    objc_msgSend(v5, "performSynchronousReadingBlock:", v10);
    if (!*((_BYTE *)v12 + 24))
    {
      v7 = (void *)objc_opt_new();
      objc_msgSend(v3, "userInterfaceClient:willActivateUserInterfaceServiceWithInitializationMessage:", self, v7);
      if (objc_msgSend(v7, "count"))
      {
        v8[0] = v6;
        v8[1] = 3221225472;
        v8[2] = __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke_2;
        v8[3] = &unk_24D167338;
        v8[4] = self;
        v9 = v7;
        objc_msgSend(v5, "performSynchronousWritingBlock:", v8);

      }
    }

    _Block_object_dispose(&v11, 8);
  }

}

uint64_t __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isRegisteredWithServer");
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t __63__AXUIClient__requestInitializationMessageFromDelegateIfNeeded__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setInitializationMessage:", *(_QWORD *)(a1 + 40));
}

- (void)clientConnection:(id)a3 didChangeConnectedState:(BOOL)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  _QWORD v12[5];

  v5 = a3;
  -[AXUIClient clientConnection](self, "clientConnection");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5 && (objc_msgSend(v5, "isConnected") & 1) == 0)
  {
    -[AXUIClient messageSender](self, "messageSender");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "messageSchedulingSerializationQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke;
    v12[3] = &unk_24D167388;
    v12[4] = self;
    objc_msgSend(v8, "performSynchronousWritingBlock:", v12);

    objc_msgSend(MEMORY[0x24BDFE478], "backgroundAccessQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v9;
    v11[1] = 3221225472;
    v11[2] = __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke_2;
    v11[3] = &unk_24D167388;
    v11[4] = self;
    objc_msgSend(v10, "performAsynchronousWritingBlock:", v11);

  }
}

uint64_t __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke(uint64_t a1)
{
  uint64_t result;
  void *v3;
  void *v4;
  void *v5;

  result = objc_msgSend(*(id *)(a1 + 32), "isRegisteredWithServer");
  if ((_DWORD)result)
  {
    objc_msgSend(*(id *)(a1 + 32), "clientConnection");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v4, "clientIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "unregisterClient:withIdentifier:", v4, v5);

    return objc_msgSend(*(id *)(a1 + 32), "setRegisteredWithServer:", 0);
  }
  return result;
}

void __55__AXUIClient_clientConnection_didChangeConnectedState___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "connectionWithServiceWasInterruptedForUserInterfaceClient:", *(_QWORD *)(a1 + 32));

}

- (NSString)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXUIClient clientIdentifier](self, "clientIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p; clientIdentifier = \"%@\">"), v5, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (AXUIClientDelegate)delegate
{
  return (AXUIClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)serviceBundleName
{
  return self->_serviceBundleName;
}

- (void)setServiceBundleName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (AXUIMessageSender)messageSender
{
  return self->_messageSender;
}

- (void)setMessageSender:(id)a3
{
  objc_storeStrong((id *)&self->_messageSender, a3);
}

- (AXUIClientConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
  objc_storeStrong((id *)&self->_clientConnection, a3);
}

- (BOOL)isRegisteredWithServer
{
  return self->_registeredWithServer;
}

- (void)setRegisteredWithServer:(BOOL)a3
{
  self->_registeredWithServer = a3;
}

- (NSString)clientIdentifier
{
  return self->_clientIdentifier;
}

- (void)setClientIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSDictionary)initializationMessage
{
  return self->_initializationMessage;
}

- (void)setInitializationMessage:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_initializationMessage, 0);
  objc_storeStrong((id *)&self->_clientIdentifier, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_messageSender, 0);
  objc_storeStrong((id *)&self->_serviceBundleName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)messageSender:(void *)a1 processCustomDataFromXPCReply:.cold.1(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "messageSender");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "messageSchedulingSerializationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21416F000, v4, v5, "This code must execute in a writing block on AXAccessQueue: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1();
}

- (void)messageSender:(uint64_t)a1 willSendXPCMessage:(NSObject *)a2 context:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21416F000, a2, OS_LOG_TYPE_ERROR, "Failed to convert initialization message to XPC object: %{public}@.", (uint8_t *)&v2, 0xCu);
}

- (void)messageSender:(void *)a1 willSendXPCMessage:context:.cold.2(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  objc_msgSend(a1, "messageSender");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "messageSchedulingSerializationQueue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0(&dword_21416F000, v4, v5, "This code must execute in a reading (or writing) block on AXAccessQueue: %@", v6, v7, v8, v9, 2u);

  OUTLINED_FUNCTION_1();
}

@end
