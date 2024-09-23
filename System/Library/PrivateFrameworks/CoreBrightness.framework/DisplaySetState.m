@implementation DisplaySetState

void __DisplaySetState_block_invoke(uint64_t a1)
{
  const char *v1;
  NSObject *v2;
  NSObject *v3;
  __CFDictionary *theDict;
  uint64_t inited;
  NSObject *v6;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t block;
  int v17;
  int v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  uint64_t v21;
  os_log_type_t v22;
  os_log_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t v26[24];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v25 = a1;
  v24 = a1;
  if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) != *(_DWORD *)(a1 + 40))
  {
    v23 = 0;
    if (_logHandle)
    {
      v6 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v6 = inited;
    }
    v23 = v6;
    v22 = OS_LOG_TYPE_DEFAULT;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      if (*(_DWORD *)(a1 + 40))
        v1 = "ON";
      else
        v1 = "OFF";
      __os_log_helper_16_2_1_8_32((uint64_t)v26, (uint64_t)v1);
      _os_log_impl(&dword_1B5291000, v23, v22, "Notify display state %s....\n", v26, 0xCu);
    }
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 44) = *(_DWORD *)(a1 + 40);
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 144))
    {
      v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
      block = MEMORY[0x1E0C809B0];
      v17 = -1073741824;
      v18 = 0;
      v19 = __DisplaySetState_block_invoke_261;
      v20 = &__block_descriptor_40_e5_v8__0l;
      v21 = *(_QWORD *)(a1 + 32);
      dispatch_async(v2, &block);
    }
    if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 192))
    {
      theDict = *(__CFDictionary **)(*(_QWORD *)(a1 + 32) + 192);
      if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 44))
        CFDictionarySetValue(theDict, CFSTR("DisplayOn"), (const void *)*MEMORY[0x1E0C9AE50]);
      else
        CFDictionarySetValue(theDict, CFSTR("DisplayOn"), (const void *)*MEMORY[0x1E0C9AE40]);
    }
    v15 = 0;
    v15 = *(int *)(a1 + 40);
    v3 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 168);
    v8 = MEMORY[0x1E0C809B0];
    v9 = -1073741824;
    v10 = 0;
    v11 = __DisplaySetState_block_invoke_2;
    v12 = &__block_descriptor_48_e5_v8__0l;
    v13 = *(_QWORD *)(a1 + 32);
    v14 = v15;
    dispatch_async(v3, &v8);
  }
}

uint64_t __DisplaySetState_block_invoke_261(uint64_t result)
{
  uint64_t (*v1)(uint64_t, const __CFString *, _QWORD);
  uint64_t v2;

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 16))
  {
    v1 = *(uint64_t (**)(uint64_t, const __CFString *, _QWORD))(*(_QWORD *)(result + 32) + 16);
    v2 = *(_QWORD *)(*(_QWORD *)(result + 32) + 24);
    if (*(_DWORD *)(*(_QWORD *)(result + 32) + 44))
      return v1(v2, CFSTR("DisplayOn"), *MEMORY[0x1E0C9AE50]);
    else
      return v1(v2, CFSTR("DisplayOn"), *MEMORY[0x1E0C9AE40]);
  }
  return result;
}

uint64_t __DisplaySetState_block_invoke_2(uint64_t a1)
{
  notify_set_state(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 48), *(_QWORD *)(a1 + 40));
  return notify_post("com.apple.iokit.hid.displayStatus");
}

@end
