@implementation ACXPCEventSubscriber

+ (id)sharedSubscriber
{
  if (sharedSubscriber_onceToken != -1)
    dispatch_once(&sharedSubscriber_onceToken, &__block_literal_global_14);
  return (id)sharedSubscriber__sharedSubscriber;
}

void __40__ACXPCEventSubscriber_sharedSubscriber__block_invoke()
{
  ACXPCEventSubscriber *v0;
  void *v1;

  if (!sharedSubscriber__sharedSubscriber)
  {
    v0 = objc_alloc_init(ACXPCEventSubscriber);
    v1 = (void *)sharedSubscriber__sharedSubscriber;
    sharedSubscriber__sharedSubscriber = (uint64_t)v0;

  }
}

- (ACXPCEventSubscriber)init
{
  ACXPCEventSubscriber *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *replyQueue;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ACXPCEventSubscriber;
  v2 = -[ACXPCEventSubscriber init](&v7, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("ACXPCEventHandler", v3);
    replyQueue = v2->_replyQueue;
    v2->_replyQueue = (OS_dispatch_queue *)v4;

  }
  return v2;
}

- (void)registerAccountChangeEventHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *replyQueue;
  id v7;
  _QWORD handler[4];
  id v9;

  v4 = a3;
  _ACLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[ACXPCEventSubscriber registerAccountChangeEventHandler:].cold.1();

  replyQueue = self->_replyQueue;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke;
  handler[3] = &unk_1E48946E8;
  v9 = v4;
  v7 = v4;
  xpc_set_event_stream_handler("com.apple.accounts.changes", replyQueue, handler);

}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  const char *string;
  void *v6;
  NSObject *v7;
  xpc_object_t reply;
  NSObject *v9;
  const void *data;
  void *v11;
  void *v12;
  id v13;
  id v14;
  size_t length;

  v3 = a2;
  _ACLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_3();

  if (MEMORY[0x1A858A290](v3) == MEMORY[0x1E0C812F8])
  {
    string = xpc_dictionary_get_string(v3, "MessageType");
    if (string)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", string);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      _ACLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_2();

      if (objc_msgSend(v6, "isEqualToString:", CFSTR("ping")))
      {
        reply = xpc_dictionary_create_reply(v3);
        if (reply)
          xpc_dictionary_send_reply();

      }
      else if (objc_msgSend(v6, "isEqualToString:", CFSTR("AccountChange")))
      {
        xpc_dictionary_get_uint64(v3, "ChangeType");
        _ACLogSystem();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_1();

        length = 0;
        data = xpc_dictionary_get_data(v3, "AccountData", &length);
        if (data && length)
        {
          objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", data);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = 0;
          objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v11, &v14);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = v14;
          if (v12)
            (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

        }
      }

    }
  }

}

- (OS_dispatch_queue)replyQueue
{
  return self->_replyQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_replyQueue, 0);
}

- (void)registerAccountChangeEventHandler:.cold.1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0x12u);
}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 8u);
}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 0xCu);
}

void __58__ACXPCEventSubscriber_registerAccountChangeEventHandler___block_invoke_cold_3()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_0_4();
  _os_log_debug_impl(v0, v1, v2, v3, v4, 2u);
}

@end
