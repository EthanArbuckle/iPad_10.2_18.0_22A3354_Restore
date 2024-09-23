@implementation IOPMCopyCurrentScheduledWake

void __IOPMCopyCurrentScheduledWake_block_invoke_126(uint64_t a1, uint64_t a2)
{
  _BOOL8 v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  _QWORD v13[6];

  if (MEMORY[0x18D773128](a2) == MEMORY[0x1E0C812F8])
  {
    v11 = _CFXPCCreateCFObjectFromXPCObject();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 0x40000000;
    v13[2] = __IOPMCopyCurrentScheduledWake_block_invoke_2;
    v13[3] = &unk_1E20022B8;
    v12 = *(NSObject **)(a1 + 40);
    v13[4] = *(_QWORD *)(a1 + 32);
    v13[5] = v11;
    dispatch_async(v12, v13);
  }
  else
  {
    v3 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v3)
      __IOPMCopyCurrentScheduledWake_block_invoke_126_cold_1(v3, v4, v5, v6, v7, v8, v9, v10);
  }
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 48));
}

uint64_t __IOPMCopyCurrentScheduledWake_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

void __IOPMCopyCurrentScheduledWake_block_invoke_126_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Received an error in response to copy scheduled wake data\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end
