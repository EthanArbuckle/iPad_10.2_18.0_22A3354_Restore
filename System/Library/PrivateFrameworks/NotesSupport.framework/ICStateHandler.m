@implementation ICStateHandler

+ (void)addStateHandlerWithName:(const char *)a3 stateBlock:(id)a4
{
  objc_msgSend(a1, "addStateHandlerWithName:sysdiagnoseOnly:stateBlock:", a3, 0, a4);
}

+ (void)addStateHandlerWithName:(const char *)a3 sysdiagnoseOnly:(BOOL)a4 stateBlock:(id)a5
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v6 = a5;
  v7 = os_log_create("com.apple.notes", "Application");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    +[ICStateHandler addStateHandlerWithName:sysdiagnoseOnly:stateBlock:].cold.1((uint64_t)a3, v7, v8, v9, v10, v11, v12, v13);

  dispatch_get_global_queue(0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v6;
  os_state_add_handler();

}

_DWORD *__69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  unsigned int v8;
  _DWORD *v9;
  NSObject *v10;
  id v12;

  if (*(_BYTE *)(a1 + 48) && *(_DWORD *)(a2 + 16) != 3)
  {
    v6 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_4();
    v9 = 0;
  }
  else
  {
    v3 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_3();

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v4, 200, 0, &v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v12;
    if (v6)
    {
      v7 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_2();

    }
    if ((unint64_t)objc_msgSend(v5, "length") >> 32)
    {
      v10 = os_log_create("com.apple.notes", "Application");
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_1();

      v9 = 0;
    }
    else
    {
      v8 = objc_msgSend(v5, "length");
      v9 = malloc_type_calloc(1uLL, v8 + 200, 0x7EC54BF5uLL);
      *v9 = 1;
      v9[1] = v8;
      __strlcpy_chk();
      memcpy(v9 + 50, (const void *)objc_msgSend(objc_retainAutorelease(v5), "bytes"), v8);
    }

  }
  return v9;
}

+ (void)addStateHandlerWithName:(uint64_t)a3 sysdiagnoseOnly:(uint64_t)a4 stateBlock:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, a2, a3, "Adding os_state handler: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  _os_log_error_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_ERROR, "Error serializing state data for \"%s\": data size greater than UINT32_MAX", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  v3 = 2112;
  v4 = v0;
  _os_log_error_impl(&dword_1DDAA5000, v1, OS_LOG_TYPE_ERROR, "Error serializing state data for \"%s\": %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Processing os_state handler: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __69__ICStateHandler_addStateHandlerWithName_sysdiagnoseOnly_stateBlock___block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_2(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_0(&dword_1DDAA5000, v0, v1, "Skipped os_state handler: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
