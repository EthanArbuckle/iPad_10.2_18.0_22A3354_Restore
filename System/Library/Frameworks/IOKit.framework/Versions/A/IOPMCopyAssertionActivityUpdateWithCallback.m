@implementation IOPMCopyAssertionActivityUpdateWithCallback

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149(uint64_t a1, void *a2)
{
  xpc_object_t value;
  int uint64;
  BOOL v6;
  xpc_object_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  _QWORD v27[7];
  BOOL v28;

  if (MEMORY[0x18D773128](a2) == MEMORY[0x1E0C812F8])
  {
    value = xpc_dictionary_get_value(a2, "assertionActivityUpdateData");
    uint64 = xpc_dictionary_get_uint64(a2, "assertionActivityUpdateRefCnt");
    v6 = xpc_dictionary_get_BOOL(a2, "assertionActivityUpdateOverflow");
    v7 = xpc_dictionary_get_value(a2, "assertionActivityUpdateProcessList");
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG))
      {
        __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_4();
        if (!value)
        {
LABEL_16:
          if (assertions_log)
          {
            if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEBUG))
              __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_2();
          }
          else
          {
            v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
            if (v18)
              __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
          }
          v16 = 0;
          if (!v7)
            goto LABEL_22;
          goto LABEL_14;
        }
LABEL_13:
        v16 = _CFXPCCreateCFObjectFromXPCObject();
        if (!v7)
        {
LABEL_22:
          v17 = 0;
          goto LABEL_23;
        }
LABEL_14:
        v17 = _CFXPCCreateCFObjectFromXPCObject();
LABEL_23:
        v26 = *(NSObject **)(a1 + 48);
        **(_DWORD **)(a1 + 40) = uint64;
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 0x40000000;
        v27[2] = __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_152;
        v27[3] = &unk_1E2003C68;
        v27[4] = *(_QWORD *)(a1 + 32);
        v27[5] = v16;
        v28 = v6;
        v27[6] = v17;
        dispatch_async(v26, v27);
        goto LABEL_24;
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_3();
      if (!value)
        goto LABEL_16;
      goto LABEL_13;
    }
    if (!value)
      goto LABEL_16;
    goto LABEL_13;
  }
  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
      __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_6();
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v8)
      __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_5(v8, v9, v10, v11, v12, v13, v14, v15);
  }
LABEL_24:
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 56));
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_152(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(void))(a1[4] + 16))();
  v2 = (const void *)a1[5];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[6];
  if (v3)
    CFRelease(v3);
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "No AssertionActivity in xpc reply", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "No AssertionActivity in xpc reply", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_3()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_12_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Received assertion activity update refcnt %u overflow %d", v1);
  OUTLINED_FUNCTION_3();
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_18();
  OUTLINED_FUNCTION_12_0(&dword_18AAAF000, v0, (uint64_t)v0, "Received assertion activity update refcnt %u overflow %d", v1);
  OUTLINED_FUNCTION_3();
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Received an error in response to copy assertion activity", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __IOPMCopyAssertionActivityUpdateWithCallback_block_invoke_149_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Received an error in response to copy assertion activity", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end
