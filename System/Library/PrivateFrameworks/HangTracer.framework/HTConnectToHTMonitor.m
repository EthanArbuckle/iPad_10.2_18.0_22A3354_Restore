@implementation HTConnectToHTMonitor

void __HTConnectToHTMonitor_block_invoke(uint64_t a1)
{
  xpc_object_t v2;
  NSObject *v3;
  _xpc_connection_s *mach_service;
  NSObject *v5;
  uint64_t i;
  _QWORD barrier[4];
  _xpc_connection_s *v8;
  uint8_t buf[4];
  _xpc_connection_s *v10;
  xpc_object_t values[4];
  char *keys[2];
  __int128 v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E5FAAF78;
  v13 = *(_OWORD *)off_1E5FAAF88;
  values[0] = xpc_int64_create(1);
  values[1] = xpc_string_create((const char *)(*(_QWORD *)(a1 + 32) + 52));
  values[2] = xpc_string_create((const char *)(*(_QWORD *)(a1 + 32) + 116));
  values[3] = xpc_shmem_create(*(void **)(a1 + 40), 0x1028uLL);
  v2 = xpc_dictionary_create((const char *const *)keys, values, 4uLL);
  dispatch_get_global_queue(0, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  mach_service = xpc_connection_create_mach_service("com.apple.hangtracermonitor", v3, 0);

  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_33);
    xpc_connection_resume(mach_service);
  }
  shared_ht_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v10 = mach_service;
    _os_log_impl(&dword_1AF62F000, v5, OS_LOG_TYPE_INFO, "HTConnectToHTMonitor: htMonitor Connection %@", buf, 0xCu);
  }

  if (mach_service)
  {
    xpc_connection_send_message(mach_service, v2);
    barrier[0] = MEMORY[0x1E0C809B0];
    barrier[1] = 3221225472;
    barrier[2] = __HTConnectToHTMonitor_block_invoke_22;
    barrier[3] = &unk_1E5FAA390;
    v8 = mach_service;
    xpc_connection_send_barrier(v8, barrier);

  }
  for (i = 3; i != -1; --i)

}

void __HTConnectToHTMonitor_block_invoke_22(uint64_t a1)
{
  NSObject *v2;
  uint8_t v3[16];

  shared_ht_log_handle();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_1AF62F000, v2, OS_LOG_TYPE_INFO, "HTConnectToHTMonitor: htMonitor message is sent", v3, 2u);
  }

  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

@end
