@implementation HTTelemetryCheckForUpdates

void __HTTelemetryCheckForUpdates_block_invoke(uint64_t a1)
{
  int HasRunThisBoot;
  NSObject *v3;
  NSObject *empty;
  NSObject *v5;
  _xpc_connection_s *mach_service;
  xpc_object_t v7;
  NSObject *v8;
  const char *string;
  int v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  HasRunThisBoot = HTTelemetryHasRunThisBoot();
  shared_ht_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  empty = v3;
  if (HasRunThisBoot)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __HTTelemetryCheckForUpdates_block_invoke_cold_1(empty);
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1AF62F000, empty, OS_LOG_TYPE_INFO, "Updating telemetry", (uint8_t *)&v10, 2u);
    }

    dispatch_get_global_queue(21, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    mach_service = xpc_connection_create_mach_service("com.apple.hangtelemetryd", v5, 0);

    xpc_connection_set_event_handler(mach_service, &__block_literal_global_3);
    xpc_connection_activate(mach_service);
    empty = xpc_dictionary_create_empty();
    xpc_dictionary_set_uint64(empty, "command", 1uLL);
    v7 = xpc_connection_send_message_with_reply_sync(mach_service, empty);
    if (MEMORY[0x1B5DFA0BC]() == MEMORY[0x1E0C81310])
    {
      shared_ht_log_handle();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        string = xpc_dictionary_get_string(v7, (const char *)*MEMORY[0x1E0C81270]);
        v10 = 136315138;
        v11 = string;
        _os_log_impl(&dword_1AF62F000, v8, OS_LOG_TYPE_DEFAULT, "Received error updating telemetry: %s", (uint8_t *)&v10, 0xCu);
      }

    }
    dispatch_sync(*(dispatch_queue_t *)(a1 + 32), &__block_literal_global_7);
  }

}

void __HTTelemetryCheckForUpdates_block_invoke_5()
{
  id v0;

  +[HTPrefs sharedPrefs](HTPrefs, "sharedPrefs");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "refreshHTPrefs");

}

void __HTTelemetryCheckForUpdates_block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1AF62F000, log, OS_LOG_TYPE_DEBUG, "Telemetry is current", v1, 2u);
}

@end
