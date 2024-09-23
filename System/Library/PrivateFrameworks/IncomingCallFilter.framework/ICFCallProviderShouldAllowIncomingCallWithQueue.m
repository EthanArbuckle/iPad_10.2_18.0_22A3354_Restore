@implementation ICFCallProviderShouldAllowIncomingCallWithQueue

dispatch_queue_t __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.ICFCallProviderMessageQueue", 0);
  ICFCallProviderShouldAllowIncomingCallWithQueue_connectionRequestQueue = (uint64_t)result;
  return result;
}

void __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_3()
{
  NSObject *v0;
  uint8_t v1[16];

  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_2084A6000, v0, OS_LOG_TYPE_DEFAULT, "[WARN] RemoteConnection died", v1, 2u);
  }
}

void __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_8(uint64_t a1, void *a2)
{
  _BOOL4 v4;
  NSObject *v5;
  const __CFString *v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (MEMORY[0x20BD0A09C](a2) == MEMORY[0x24BDACFB8])
  {
    v7 = ICFDefaultLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_8_cold_1(a2, v7);
  }
  else
  {
    v4 = xpc_dictionary_get_BOOL(a2, "response");
    xpc_dictionary_get_BOOL(a2, "isBlocked");
    v5 = ICFDefaultLog();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("NO");
      if (v4)
        v6 = CFSTR("YES");
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_2084A6000, v5, OS_LOG_TYPE_DEFAULT, "Got result: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_connection_cancel(*(xpc_connection_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
  xpc_release(*(xpc_object_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void __ICFCallProviderShouldAllowIncomingCallWithQueue_block_invoke_8_cold_1(void *a1, NSObject *a2)
{
  const char *string;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v4 = 136315138;
  v5 = string;
  _os_log_error_impl(&dword_2084A6000, a2, OS_LOG_TYPE_ERROR, "Error requesting client: %s", (uint8_t *)&v4, 0xCu);
}

@end
