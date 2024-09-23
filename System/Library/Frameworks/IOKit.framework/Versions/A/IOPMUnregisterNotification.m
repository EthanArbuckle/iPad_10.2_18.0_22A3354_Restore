@implementation IOPMUnregisterNotification

void __IOPMUnregisterNotification_block_invoke(uint64_t a1)
{
  xpc_connection_t *v1;
  CFNumberRef v2;
  const __CFDictionary *UserActiveValidDict;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  xpc_connection_t *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = *(xpc_connection_t **)(a1 + 32);
  if (!v1 || !v1[6])
    return;
  v2 = CFNumberCreate(0, kCFNumberSInt64Type, v1);
  UserActiveValidDict = (const __CFDictionary *)getUserActiveValidDict();
  if (!CFDictionaryGetValue(UserActiveValidDict, v2))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __IOPMUnregisterNotification_block_invoke_cold_1((uint64_t)v1, v4, v5, v6, v7, v8, v9, v10);
      if (!v2)
        return;
    }
    else if (!v2)
    {
      return;
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 134217984;
    v12 = v1;
    _os_log_impl(&dword_18AAAF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "IOPMUnregisterNotification: cancelling connection 0x%lx\n", (uint8_t *)&v11, 0xCu);
  }
  xpc_connection_cancel(v1[6]);
  if (v2)
LABEL_10:
    CFRelease(v2);
}

void __IOPMUnregisterNotification_block_invoke_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "IOPMUnregisterNotification: no valid ref for 0x%lx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

@end
