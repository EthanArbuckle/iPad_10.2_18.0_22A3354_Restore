@implementation SCDynamicStoreCreateInternal

void ____SCDynamicStoreCreateInternal_block_invoke(uint64_t a1)
{
  CFIndex Count;
  CFIndex v4;
  CFMutableDictionaryRef Mutable;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  const char *v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  v21[1] = *MEMORY[0x1E0C80C00];
  CFSetAddValue((CFMutableSetRef)_sc_store_sessions, *(const void **)(a1 + 40));
  Count = CFSetGetCount((CFSetRef)_sc_store_sessions);
  if (Count > _sc_store_max && _sc_store_max >= 1)
  {
    v4 = Count;
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFSetApplyFunction((CFSetRef)_sc_store_sessions, (CFSetApplierFunction)addSessionReference, Mutable);
    v6 = __log_SCDynamicStore_log;
    if (!__log_SCDynamicStore_log)
    {
      v6 = os_log_create("com.apple.SystemConfiguration", "SCDynamicStore");
      __log_SCDynamicStore_log = (uint64_t)v6;
    }
    v7 = _SC_syslog_os_log_mapping(3);
    if (__SC_log_enabled(3, v6, (os_log_type_t)v7))
    {
      v8 = _os_log_pack_size();
      v16 = (char *)v21 - ((MEMORY[0x1E0C80A78](v8, v9, v10, v11, v12, v13, v14, v15) + 15) & 0xFFFFFFFFFFFFFFF0);
      __error();
      v17 = _os_log_pack_fill();
      v18 = "now ";
      v19 = _sc_store_max;
      if (v4 == 50)
        v18 = "";
      *(_DWORD *)v17 = 136315394;
      *(_QWORD *)(v17 + 4) = v18;
      *(_WORD *)(v17 + 12) = 2048;
      *(_QWORD *)(v17 + 14) = v19;
      __SC_log_send(3, (uint64_t)v6, v7, v16);
    }
    CFDictionaryApplyFunction(Mutable, (CFDictionaryApplierFunction)logSessionReference, 0);
    CFRelease(Mutable);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    if (_sc_store_max >= 5000)
      v20 = 0;
    else
      v20 = 2 * _sc_store_max;
    _sc_store_max = v20;
  }
}

@end
