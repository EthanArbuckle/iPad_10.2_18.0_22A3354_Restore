@implementation DUTriggerMacFileUpdate

+ (unsigned)beMobileUser
{
  passwd *v2;
  passwd *v3;
  int v4;

  if (!getuid())
  {
    v2 = getpwnam("mobile");
    if (!v2)
    {
      puts("Error: failed to get pwInfo Exiting.");
      _exit(7);
    }
    v3 = v2;
    if (!v2->pw_uid)
    {
      puts("Error: got pwInfo for uid=0. Exiting.");
      _exit(8);
    }
    v4 = fileno((FILE *)*MEMORY[0x24BDAC8E8]);
    if (isatty(v4) == 1)
      printf("Dropping root privileges to %s (%i)\n", v3->pw_name, v3->pw_uid);
    if (setuid(v3->pw_uid))
    {
      puts("Error: could not set uid");
      _exit(9);
    }
    if (!getuid())
    {
      puts("Error: failed to setuid to drop privileges. Exiting.");
      _exit(10);
    }
  }
  return getuid();
}

+ (void)sendDUNotification
{
  _xpc_connection_s *v2;
  xpc_object_t v3;
  int v4;
  _xpc_connection_s *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "findDocUConnectionWithUser:", objc_msgSend(a1, "beMobileUser"));
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 138412290;
    v5 = v2;
    _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUndersanding: Simulating DocU connection connection:%@", (uint8_t *)&v4, 0xCu);
  }
  if (v2)
  {
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v3, "event_type", "mds_index_updated");
    xpc_dictionary_set_int64(v3, "num_updates", 1);
    xpc_connection_send_message(v2, v3);

  }
}

+ (id)findDocUConnectionWithUser:(unsigned int)a3
{
  NSObject *v3;
  xpc_connection_t mach_service;
  _xpc_connection_s *v5;
  _QWORD handler[4];
  _xpc_connection_s *v8;

  v3 = dispatch_queue_create("testingDocumentUpdateHandlerQueue", 0);
  mach_service = xpc_connection_create_mach_service("com.apple.TextUnderstanding.DocumentUpdateHandler", v3, 0);
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __53__DUTriggerMacFileUpdate_findDocUConnectionWithUser___block_invoke;
  handler[3] = &unk_250B87FF0;
  v5 = mach_service;
  v8 = v5;
  xpc_connection_set_event_handler(v5, handler);
  xpc_connection_set_target_uid();
  xpc_connection_activate(v5);

  return v5;
}

void __53__DUTriggerMacFileUpdate_findDocUConnectionWithUser___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x23B854284](a2);
  if (v3 == MEMORY[0x24BDACFA0])
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      __53__DUTriggerMacFileUpdate_findDocUConnectionWithUser___block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
  else if (v3 == MEMORY[0x24BDACFB8])
  {
    v13 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v13)
      __53__DUTriggerMacFileUpdate_findDocUConnectionWithUser___block_invoke_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
  }
  else if (v3 == MEMORY[0x24BDACF88] && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v21 = 138412290;
    v22 = v4;
    _os_log_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEFAULT, "DocumentUndersanding: successfully got docUConnection: %@", (uint8_t *)&v21, 0xCu);
  }
}

void __53__DUTriggerMacFileUpdate_findDocUConnectionWithUser___block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_23A6C9000, MEMORY[0x24BDACB70], a3, "DocumentUndersanding: got an unexpected message back from DocumentUpdateHandler", a5, a6, a7, a8, 0);
}

void __53__DUTriggerMacFileUpdate_findDocUConnectionWithUser___block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_1(&dword_23A6C9000, MEMORY[0x24BDACB70], a3, "DocumentUndersanding: got an error back from DocumentUpdateHandler", a5, a6, a7, a8, 0);
}

@end
