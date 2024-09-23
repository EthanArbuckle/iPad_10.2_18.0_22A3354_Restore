@implementation BackgroundTaskAgentInit

void __BackgroundTaskAgentInit_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  xpc_object_t value;
  void *v15;
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *string_ptr;

  v4 = MEMORY[0x212BAC4F0](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __BackgroundTaskAgentInit_block_invoke_cold_1(a2);
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    if (xpc_dictionary_get_BOOL(a2, "BackgroundTaskAgentMessage"))
    {
      xpc_dictionary_set_value(a2, "BackgroundTaskAgentMessage", 0);
      v13 = (const char *)*MEMORY[0x24BDACF50];
      value = xpc_dictionary_get_value(a2, (const char *)*MEMORY[0x24BDACF50]);
      if (value)
      {
        v15 = value;
        if (MEMORY[0x212BAC4F0]() == MEMORY[0x24BDACFF0])
        {
          string_ptr = xpc_string_get_string_ptr(v15);
          xpc_retain(v15);
          xpc_dictionary_set_value(a2, v13, 0);
          if (xpc_dictionary_get_int64(a2, "BackgroundTaskAgentJobStatusKey") == 1
            || xpc_dictionary_get_BOOL(a2, "BackgroundTaskAgentJobExpiredKey"))
          {
            BackgroundTaskAgentRemoveJob((uint64_t)string_ptr);
          }
        }
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        xpc_release(v15);
      }
      else
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      }
    }
    else
    {
      v16 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
      if (v16)
        __BackgroundTaskAgentInit_block_invoke_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v5)
      __BackgroundTaskAgentInit_block_invoke_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

void __BackgroundTaskAgentInit_block_invoke_cold_1(void *a1)
{
  const char *string;
  int v2;
  const char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v2 = 136315138;
  v3 = string;
  _os_log_error_impl(&dword_20D963000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BackgroundTaskAgent XPC Event Handler - Error: %s", (uint8_t *)&v2, 0xCu);
}

void __BackgroundTaskAgentInit_block_invoke_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgent XPC Event Handler - Event Type = XPC_TYPE_DICTIONARY, Not a BACKGROUND_TASK_AGENT_MESSAGE", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

void __BackgroundTaskAgentInit_block_invoke_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_20D963000, MEMORY[0x24BDACB70], a3, "BackgroundTaskAgent XPC Event Handler: Unknown Event Type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2();
}

@end
