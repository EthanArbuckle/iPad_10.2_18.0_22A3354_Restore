@implementation AVMakeSelectRouteDescriptorOperation

uint64_t __AVMakeSelectRouteDescriptorOperation_block_invoke(uint64_t a1)
{
  const __CFDictionary *MutableCopy;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, const __CFDictionary *);
  uint64_t v7;
  const void *v8;
  const void *v9;
  const void *v10;

  MutableCopy = (const __CFDictionary *)FigCFDictionaryCreateMutableCopy();
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E0D48D98]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E0D48D80]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E0D48D88]);
  CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x1E0D48DB0]);
  CFDictionarySetValue(MutableCopy, (const void *)*MEMORY[0x1E0D48DA0], *(const void **)(a1 + 32));
  if (dword_1EE2B0190)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v5 = *(_QWORD *)(a1 + 48);
  v4 = *(_QWORD *)(a1 + 56);
  v6 = *(uint64_t (**)(uint64_t, uint64_t, const __CFDictionary *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                          + 16);
  if (v6)
    v7 = v6(v4, v5, MutableCopy);
  else
    v7 = 4294954514;
  v8 = *(const void **)(a1 + 56);
  if (v8)
    CFRelease(v8);
  v9 = *(const void **)(a1 + 48);
  if (v9)
    CFRelease(v9);
  v10 = *(const void **)(a1 + 40);
  if (v10)
    CFRelease(v10);
  if (MutableCopy)
    CFRelease(MutableCopy);
  return v7;
}

uint64_t __AVMakeSelectRouteDescriptorOperation_block_invoke_12(_QWORD *a1)
{
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t, uint64_t);
  uint64_t v7;
  const void *v8;
  const void *v9;
  const void *v10;

  if (dword_1EE2B0190)
  {
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
    os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
    fig_log_call_emit_and_clean_up_after_send_and_compose();
  }
  v4 = a1[4];
  v3 = a1[5];
  v5 = a1[6];
  v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
  if (v6)
    v7 = v6(v3, v4, v5);
  else
    v7 = 4294954514;
  v8 = (const void *)a1[5];
  if (v8)
    CFRelease(v8);
  v9 = (const void *)a1[4];
  if (v9)
    CFRelease(v9);
  v10 = (const void *)a1[6];
  if (v10)
    CFRelease(v10);
  return v7;
}

@end
