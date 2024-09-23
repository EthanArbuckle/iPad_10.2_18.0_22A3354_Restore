@implementation HKXPCEventObserver

+ (void)setAuthorizationStreamEventHandler:(id)a3
{
  id v5;
  unsigned __int8 v6;
  void *v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a3;
  do
    v6 = __ldaxr(_hasRegisteredAuthorizationHandler);
  while (__stlxr(1u, _hasRegisteredAuthorizationHandler));
  if ((v6 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKXPCEventObserver.m"), 30, CFSTR("This method can only be called once during the lifetime of a process"));

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__HKXPCEventObserver_setAuthorizationStreamEventHandler___block_invoke;
  v10[3] = &unk_1E37F3750;
  v11 = v5;
  v8 = HKAuthorizationEventStream;
  v9 = v5;
  +[HKXPCEventObserver _registerEventHandler:forStream:](HKXPCEventObserver, "_registerEventHandler:forStream:", v10, v8);

}

uint64_t __57__HKXPCEventObserver_setAuthorizationStreamEventHandler___block_invoke(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_get_string(xdict, (const char *)HKAuthorizationEventBundleIdentifierKey);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)subscribeToAuthorizationStreamWithIdentifier:(const char *)a3
{
  unsigned __int8 v4;
  void *v7;

  v4 = atomic_load(_hasRegisteredAuthorizationHandler);
  if ((v4 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HKXPCEventObserver.m"), 42, CFSTR("This method may not be called until a handler block is registered"));

  }
  +[HKXPCEventObserver _subscribeToStream:clientIdentifier:](HKXPCEventObserver, "_subscribeToStream:clientIdentifier:", HKAuthorizationEventStream, a3);
}

+ (void)unsubscribeFromAuthorizationStreamWithIdentifier:(const char *)a3
{
  +[HKXPCEventObserver _unsubscribeFromStream:clientIdentifier:](HKXPCEventObserver, "_unsubscribeFromStream:clientIdentifier:", HKAuthorizationEventStream, a3);
}

+ (void)_registerEventHandler:(id)a3 forStream:(const char *)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  const char *v11;

  v6 = a3;
  HKCreateSerialDispatchQueue(a1, CFSTR("eventQueue"));
  v7 = objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke;
  v9[3] = &unk_1E37F3778;
  v10 = v6;
  v11 = a4;
  v8 = v6;
  xpc_set_event_stream_handler(a4, v7, v9);

}

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  const _xpc_type_s *v9;
  const _xpc_type_s *v10;
  NSObject *reply;
  _BOOL4 v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _HKInitializeLogging();
  HKLogInfrastructure();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

  if (v5)
  {
    HKLogInfrastructure();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = *(_QWORD *)(a1 + 40);
      v16 = 136315138;
      v17 = v7;
      _os_log_impl(&dword_19A0E6000, v6, OS_LOG_TYPE_INFO, "Received XPC event for %s", (uint8_t *)&v16, 0xCu);
    }

  }
  v8 = MEMORY[0x19AEC822C](v3);
  if (v8 != MEMORY[0x1E0C812F8])
  {
    v9 = (const _xpc_type_s *)v8;
    v10 = (const _xpc_type_s *)MEMORY[0x1E0C81310];
    _HKInitializeLogging();
    HKLogInfrastructure();
    reply = objc_claimAutoreleasedReturnValue();
    v12 = os_log_type_enabled(reply, OS_LOG_TYPE_ERROR);
    if (v9 == v10)
    {
      if (v12)
        __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(v3, reply);
    }
    else if (v12)
    {
      __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_3(v9, reply);
    }
LABEL_18:

    goto LABEL_19;
  }
  if (!xpc_dictionary_get_BOOL(v3, (const char *)HKXPCEventSendToClientKey))
  {
    reply = xpc_dictionary_create_reply(v3);
    if (reply)
    {
      xpc_dictionary_send_reply();
    }
    else
    {
      v13 = (void *)MEMORY[0x19AEC81E4](v3);
      _HKInitializeLogging();
      HKLogInfrastructure();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1((uint64_t)v13, v14, v15);

      free(v13);
    }
    goto LABEL_18;
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
LABEL_19:

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

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = a1;
  OUTLINED_FUNCTION_0_15(&dword_19A0E6000, a2, a3, "Failed to create reply for XPC event: %s", (uint8_t *)&v3);
}

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_2(void *a1, NSObject *a2)
{
  const char *string;
  uint64_t v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  v5 = 136315138;
  v6 = string;
  OUTLINED_FUNCTION_0_15(&dword_19A0E6000, a2, v4, "XPC events subscriber received error: %s", (uint8_t *)&v5);
  OUTLINED_FUNCTION_1_0();
}

void __54__HKXPCEventObserver__registerEventHandler_forStream___block_invoke_cold_3(const _xpc_type_s *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  const char *name;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 136315138;
  name = xpc_type_get_name(a1);
  OUTLINED_FUNCTION_0_15(&dword_19A0E6000, a2, v3, "XPC events subscriber received event of unexpected type %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

@end
