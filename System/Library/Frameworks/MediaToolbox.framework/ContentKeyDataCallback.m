@implementation ContentKeyDataCallback

void __playerairplay_ContentKeyDataCallback_block_invoke(uint64_t a1)
{
  uint64_t v2;
  const void *v3;
  const void *v4;
  const void *v5;
  const void *v6;
  CFTypeRef v7;
  uint64_t v8;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;

  FigReadWriteLockLockForRead();
  v2 = *(_QWORD *)(a1 + 32);
  if (!*(_BYTE *)(v2 + 72) && *(_BYTE *)(v2 + 732))
  {
    v6 = *(const void **)(a1 + 40);
    if (v6)
    {
      v7 = CFRetain(v6);
      v8 = *(_QWORD *)(a1 + 40);
    }
    else
    {
      v8 = 0;
      v7 = 0;
    }
    if (!pap_PlaybackSessionGetBooleanPropertySync((uint64_t)v7, v8, *MEMORY[0x1E0CA3F88])
      && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 48), (const void *)*MEMORY[0x1E0CA2E98]))
    {
      os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
      os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
      fig_log_call_emit_and_clean_up_after_send_and_compose();
      itemairplay_postFailNotificationWithError(*(const void **)(a1 + 64), -17224);
    }
    pap_PlaybackSessionPerformRemoteAction(v7, *(const void **)(a1 + 40), 0, 0, (const void *)*MEMORY[0x1E0CA3C08], *(const void **)(a1 + 48), 0, 0);
    if (v7)
      CFRelease(v7);
  }
  FigReadWriteLockUnlockForRead();
  v3 = *(const void **)(a1 + 40);
  if (v3)
    CFRelease(v3);
  v4 = *(const void **)(a1 + 64);
  if (v4)
    CFRelease(v4);
  v5 = *(const void **)(a1 + 48);
  if (v5)
    CFRelease(v5);
}

@end
