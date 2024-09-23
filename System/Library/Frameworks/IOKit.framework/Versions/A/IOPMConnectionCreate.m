@implementation IOPMConnectionCreate

void __IOPMConnectionCreate_block_invoke(uint64_t a1)
{
  _DWORD *v2;
  uint64_t v3;
  int *v4;
  NSObject *PMQueue;
  _QWORD handler[5];

  **(_QWORD **)(a1 + 40) = 0;
  v2 = malloc_type_calloc(1uLL, 0x50uLL, 0x10E0040A93DF132uLL);
  if (v2)
  {
    v3 = (uint64_t)v2;
    v2[5] = -1;
    v4 = v2 + 5;
    CFRetain(*(CFTypeRef *)(a1 + 48));
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(a1 + 48);
    *(_DWORD *)(v3 + 16) = *(_DWORD *)(a1 + 56);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = _connectionCreate(v3);
    if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    {
      CFRelease(*(CFTypeRef *)(a1 + 48));
      free((void *)v3);
    }
    else
    {
      PMQueue = getPMQueue();
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 0x40000000;
      handler[2] = __IOPMConnectionCreate_block_invoke_2;
      handler[3] = &__block_descriptor_tmp_84;
      handler[4] = v3;
      if (notify_register_dispatch("com.apple.system.powermanagement.assertionresync", v4, PMQueue, handler))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          __IOPMConnectionCreate_block_invoke_cold_1();
      }
      **(_QWORD **)(a1 + 40) = v3;
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
  }
  else
  {
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -536870199;
  }
}

uint64_t __IOPMConnectionCreate_block_invoke_2(uint64_t a1)
{
  uint64_t v1;
  int v2;
  int v3;
  uint64_t result;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v2 = *(_DWORD *)v1;
    v5[0] = 67109120;
    v5[1] = v2;
    _os_log_impl(&dword_18AAAF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Recreating IOPMConnection id 0x%x\n", (uint8_t *)v5, 8u);
  }
  _connectionCreate(v1);
  v3 = *(_DWORD *)(v1 + 24);
  if (v3)
    return _conveyMachPortToPowerd((int *)v1, v3, 1);
  result = *(_QWORD *)(v1 + 40);
  if (result)
  {
    result = CFMachPortGetPort((CFMachPortRef)result);
    v3 = result;
    if ((_DWORD)result)
      return _conveyMachPortToPowerd((int *)v1, v3, 1);
  }
  return result;
}

void __IOPMConnectionCreate_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Failed to register for reconnecting with powerd. rc:0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

@end
