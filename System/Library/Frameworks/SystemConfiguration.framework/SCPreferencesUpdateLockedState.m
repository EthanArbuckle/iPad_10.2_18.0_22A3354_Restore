@implementation SCPreferencesUpdateLockedState

uint64_t ____SCPreferencesUpdateLockedState_block_invoke()
{
  __SCPreferencesUpdateLockedState_lockedQueue = (uint64_t)dispatch_queue_create("SCPreferences locked state queue", 0);
  __SCPreferencesUpdateLockedState_lockedState = (uint64_t)CFDictionaryCreateMutable(0, 0, 0, MEMORY[0x1E0C9B3A0]);
  return os_state_add_handler();
}

_DWORD *____SCPreferencesUpdateLockedState_block_invoke_2()
{
  CFMutableStringRef Mutable;
  _BOOL4 v1;
  int64_t v2;
  size_t v3;
  CFIndex Length;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  const UInt8 *BytePtr;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  CFDataRef v32[2];

  v32[1] = *(CFDataRef *)MEMORY[0x1E0C80C00];
  v32[0] = 0;
  if (!CFDictionaryGetCount((CFDictionaryRef)__SCPreferencesUpdateLockedState_lockedState))
    return 0;
  Mutable = CFStringCreateMutable(0, 0);
  CFDictionaryApplyFunction((CFDictionaryRef)__SCPreferencesUpdateLockedState_lockedState, (CFDictionaryApplierFunction)appendLockedPreferences, Mutable);
  v1 = _SCSerialize(Mutable, v32, 0, 0);
  CFRelease(Mutable);
  v2 = 0;
  v3 = 200;
  if (v1 && v32[0])
  {
    Length = CFDataGetLength(v32[0]);
    v3 = Length + 200;
    if ((unint64_t)(Length + 200) > 0x8000)
    {
      v5 = __log_SCPreferences_log;
      if (!__log_SCPreferences_log)
      {
        v5 = os_log_create("com.apple.SystemConfiguration", "SCPreferences");
        __log_SCPreferences_log = (uint64_t)v5;
      }
      v6 = _SC_syslog_os_log_mapping(3);
      if (__SC_log_enabled(3, v5, (os_log_type_t)v6))
      {
        v7 = _os_log_pack_size();
        v15 = (char *)v32 - ((MEMORY[0x1E0C80A78](v7, v8, v9, v10, v11, v12, v13, v14) + 15) & 0xFFFFFFFFFFFFFFF0);
        __error();
        v16 = _os_log_pack_fill();
        *(_DWORD *)v16 = 134218240;
        *(_QWORD *)(v16 + 4) = v3;
        *(_WORD *)(v16 + 12) = 2048;
        *(_QWORD *)(v16 + 14) = 0x8000;
        __SC_log_send(3, (uint64_t)v5, v6, v15);
      }
      goto LABEL_18;
    }
    v2 = Length;
  }
  v18 = malloc_type_calloc(1uLL, v3, 0x9468350CuLL);
  if (v18)
  {
    v17 = v18;
    *v18 = 1;
    v18[1] = v2;
    __strlcpy_chk();
    if (v2 >= 1)
    {
      BytePtr = CFDataGetBytePtr(v32[0]);
      memcpy(v17 + 50, BytePtr, v2);
    }
    goto LABEL_19;
  }
  v20 = __log_SCPreferences_log;
  if (!__log_SCPreferences_log)
  {
    v20 = os_log_create("com.apple.SystemConfiguration", "SCPreferences");
    __log_SCPreferences_log = (uint64_t)v20;
  }
  v21 = _SC_syslog_os_log_mapping(3);
  if (__SC_log_enabled(3, v20, (os_log_type_t)v21))
  {
    v22 = _os_log_pack_size();
    v30 = (char *)v32 - ((MEMORY[0x1E0C80A78](v22, v23, v24, v25, v26, v27, v28, v29) + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    *(_WORD *)_os_log_pack_fill() = 0;
    __SC_log_send(3, (uint64_t)v20, v21, v30);
  }
LABEL_18:
  v17 = 0;
LABEL_19:
  if (v32[0])
    CFRelease(v32[0]);
  return v17;
}

void ____SCPreferencesUpdateLockedState_block_invoke_32(uint64_t a1)
{
  CFStringRef v2;

  if (*(_BYTE *)(a1 + 40))
  {
    v2 = CFCopyDescription(*(CFTypeRef *)(a1 + 32));
    CFDictionarySetValue((CFMutableDictionaryRef)__SCPreferencesUpdateLockedState_lockedState, *(const void **)(a1 + 32), v2);
    CFRelease(v2);
  }
  else
  {
    CFDictionaryRemoveValue((CFMutableDictionaryRef)__SCPreferencesUpdateLockedState_lockedState, *(const void **)(a1 + 32));
  }
}

@end
