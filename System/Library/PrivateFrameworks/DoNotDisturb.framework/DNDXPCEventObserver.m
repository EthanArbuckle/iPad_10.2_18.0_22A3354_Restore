@implementation DNDXPCEventObserver

+ (void)setFocusConfigurationStreamEventHandler:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v3 = a3;
  do
    __ldaxr(_hasRegisteredFocusConfigurationHandler);
  while (__stlxr(1u, _hasRegisteredFocusConfigurationHandler));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__DNDXPCEventObserver_setFocusConfigurationStreamEventHandler___block_invoke;
  v6[3] = &unk_1E39B5EB0;
  v7 = v3;
  v4 = DNDFocusConfigurationEventStream;
  v5 = v3;
  +[DNDXPCEventObserver _registerEventHandler:forStream:](DNDXPCEventObserver, "_registerEventHandler:forStream:", v6, v4);

}

uint64_t __63__DNDXPCEventObserver_setFocusConfigurationStreamEventHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_get_string(xdict, (const char *)DNDFocusConfigurationEventBundleIdentifierKey);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)subscribeToFocusConfigurationStreamWithIdentifier:(const char *)a3
{
  atomic_load(_hasRegisteredFocusConfigurationHandler);
  +[DNDXPCEventObserver _subscribeToStream:clientIdentifier:](DNDXPCEventObserver, "_subscribeToStream:clientIdentifier:", DNDFocusConfigurationEventStream, a3);
}

+ (void)unsubscribeFromFocusConfigurationStreamWithIdentifier:(const char *)a3
{
  +[DNDXPCEventObserver _unsubscribeFromStream:clientIdentifier:](DNDXPCEventObserver, "_unsubscribeFromStream:clientIdentifier:", DNDFocusConfigurationEventStream, a3);
}

+ (void)_registerEventHandler:(id)a3 forStream:(const char *)a4
{
  id v5;
  NSObject *Serial;
  id v7;
  _QWORD v8[4];
  id v9;
  const char *v10;

  v5 = a3;
  Serial = BSDispatchQueueCreateSerial();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke;
  v8[3] = &unk_1E39B5ED8;
  v9 = v5;
  v10 = a4;
  v7 = v5;
  xpc_set_event_stream_handler(a4, Serial, v8);

}

void __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  const _xpc_type_s *v7;
  const _xpc_type_s *v8;
  void *v9;
  _BOOL4 v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = DNDLogXPCEventObserver;
  if (os_log_type_enabled((os_log_t)DNDLogXPCEventObserver, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 40);
    v11 = 136315138;
    v12 = v5;
    _os_log_impl(&dword_19ABEB000, v4, OS_LOG_TYPE_INFO, "Received XPC event for %s", (uint8_t *)&v11, 0xCu);
  }
  v6 = MEMORY[0x19AECFA48](v3);
  if (v6 == MEMORY[0x1E0C812F8])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    v7 = (const _xpc_type_s *)v6;
    v8 = (const _xpc_type_s *)MEMORY[0x1E0C81310];
    v9 = (void *)DNDLogXPCEventObserver;
    v10 = os_log_type_enabled((os_log_t)DNDLogXPCEventObserver, OS_LOG_TYPE_ERROR);
    if (v7 == v8)
    {
      if (v10)
        __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1(v9, v3);
    }
    else if (v10)
    {
      __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(v9, v7);
    }
  }

}

+ (void)_subscribeToStream:(const char *)a3 clientIdentifier:(const char *)a4
{
  id v4;

  v4 = xpc_dictionary_create(0, 0, 0);
  xpc_set_event();

}

+ (void)_unsubscribeFromStream:(const char *)a3 clientIdentifier:(const char *)a4
{
  xpc_set_event();
}

void __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1(void *a1, void *a2)
{
  const char *v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  const char *string;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = (const char *)*MEMORY[0x1E0C81270];
  v4 = a1;
  v6 = 136315138;
  string = xpc_dictionary_get_string(a2, v3);
  OUTLINED_FUNCTION_0_2(&dword_19ABEB000, v4, v5, "XPC events subscriber received error: %s", (uint8_t *)&v6);

}

void __55__DNDXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(void *a1, const _xpc_type_s *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  const char *name;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v5 = 136315138;
  name = xpc_type_get_name(a2);
  OUTLINED_FUNCTION_0_2(&dword_19ABEB000, v3, v4, "XPC events subscriber received event of unexpected type %s", (uint8_t *)&v5);

}

@end
