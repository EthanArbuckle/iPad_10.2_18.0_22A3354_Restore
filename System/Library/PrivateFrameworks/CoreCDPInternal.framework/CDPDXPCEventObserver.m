@implementation CDPDXPCEventObserver

+ (id)sharedObserver
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __38__CDPDXPCEventObserver_sharedObserver__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedObserver_onceToken != -1)
    dispatch_once(&sharedObserver_onceToken, block);
  return (id)sharedObserver_observer;
}

void __38__CDPDXPCEventObserver_sharedObserver__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedObserver_observer;
  sharedObserver_observer = (uint64_t)v1;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(sharedObserver_observer + 8);
  *(_QWORD *)(sharedObserver_observer + 8) = v3;

}

- (void)registerListener:(id)a3
{
  -[NSMutableArray addObject:](self->_eventListeners, "addObject:", a3);
}

- (void)start
{
  NSObject *v3;
  uint8_t v4[16];

  _CDPLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DB2C000, v3, OS_LOG_TYPE_DEFAULT, "\"Starting to listen for XPC events...\", v4, 2u);
  }

  -[CDPDXPCEventObserver _setupDarwinListener](self, "_setupDarwinListener");
  -[CDPDXPCEventObserver _setupDistributedListener](self, "_setupDistributedListener");
}

- (void)_setupDarwinListener
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke;
  handler[3] = &unk_24C81D4C0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", MEMORY[0x24BDAC9B8], handler);
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke(uint64_t a1, xpc_object_t xdict)
{
  const char *string;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD v21[6];
  uint64_t state64;
  int out_token;
  uint8_t buf[4];
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(xdict, (const char *)*MEMORY[0x24BDACF50]);
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v25 = (uint64_t)string;
    _os_log_impl(&dword_20DB2C000, v4, OS_LOG_TYPE_DEFAULT, "\"Darwin XPC event stream handler called: %s\", buf, 0xCu);
  }

  out_token = -1;
  if (notify_register_check(string, &out_token))
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_3((uint64_t)string, v5, v6, v7, v8, v9, v10, v11);
LABEL_6:

    return;
  }
  if (out_token == -1)
  {
    _CDPLogSystem();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_1((uint64_t)string, v5, v13, v14, v15, v16, v17, v18);
    goto LABEL_6;
  }
  state64 = 0;
  if (notify_get_state(out_token, &state64))
  {
    _CDPLogSystem();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_2(v12);

  }
  else
  {
    if (out_token != -1)
      notify_cancel(out_token);
    _CDPLogSystem();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v25 = state64;
      _os_log_impl(&dword_20DB2C000, v19, OS_LOG_TYPE_DEFAULT, "\"XPC event value is: %llu\", buf, 0xCu);
    }

    v20 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2;
    v21[3] = &__block_descriptor_48_e15_v32__0_8Q16_B24l;
    v21[4] = string;
    v21[5] = state64;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v21);
  }
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2_cold_1();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "eventReceived:eventValue:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_setupDistributedListener
{
  _QWORD handler[5];

  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke;
  handler[3] = &unk_24C81D4C0;
  handler[4] = self;
  xpc_set_event_stream_handler("com.apple.distnoted.matching", MEMORY[0x24BDAC9B8], handler);
}

void __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke(uint64_t a1, void *a2)
{
  const char *v3;
  id v4;
  const char *string;
  NSObject *v6;
  void *v7;
  char *v8;
  NSObject *v9;
  void *v10;
  char *v11;
  _QWORD v12[4];
  char *v13;
  const char *v14;
  uint8_t buf[4];
  const char *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = (const char *)*MEMORY[0x24BDACF50];
  v4 = a2;
  string = xpc_dictionary_get_string(v4, v3);
  _CDPLogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = string;
    _os_log_impl(&dword_20DB2C000, v6, OS_LOG_TYPE_DEFAULT, "\"Distributed XPC event stream handler called: %s\", buf, 0xCu);
  }

  xpc_dictionary_get_value(v4, "UserInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    v8 = (char *)_CFXPCCreateCFObjectFromXPCObject();
  else
    v8 = 0;
  _CDPLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_20DB2C000, v9, OS_LOG_TYPE_DEFAULT, "\"User Info: %@\", buf, 0xCu);
  }

  v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8;
  v12[3] = &unk_24C81D4E8;
  v13 = v8;
  v14 = string;
  v11 = v8;
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v12);

}

void __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  _CDPLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8_cold_1();

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "eventReceived:eventInfo:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventListeners, 0);
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Cannot get the state using invalid token for event - %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_20DB2C000, log, OS_LOG_TYPE_ERROR, "\"Error during notify_get_state for token\", v1, 2u);
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20DB2C000, a2, a3, "\"Error during notify_register_check for event - %s\", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __44__CDPDXPCEventObserver__setupDarwinListener__block_invoke_2_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6(&dword_20DB2C000, v0, v1, "\"Notifying listener %@ of %s\");
  OUTLINED_FUNCTION_4();
}

void __49__CDPDXPCEventObserver__setupDistributedListener__block_invoke_8_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_5();
  OUTLINED_FUNCTION_0_6(&dword_20DB2C000, v0, v1, "\"Notifying listener %@ of %s\");
  OUTLINED_FUNCTION_4();
}

@end
