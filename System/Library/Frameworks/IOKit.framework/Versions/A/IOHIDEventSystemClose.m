@implementation IOHIDEventSystemClose

void __IOHIDEventSystemClose_block_invoke(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  v2 = _IOHIDLogCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AAAF000, v2, OS_LOG_TYPE_DEFAULT, "All actions on server queue completed.", buf, 2u);
  }
  v3 = _IOHIDLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_18AAAF000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventSystem - service queue termination", (const char *)&unk_18AB567C9, v4, 2u);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void __IOHIDEventSystemClose_block_invoke_16(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  uint8_t v4[16];
  uint8_t buf[16];

  v2 = _IOHIDLogCategory(0);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_18AAAF000, v2, OS_LOG_TYPE_DEFAULT, "All actions on enumeration queue completed.", buf, 2u);
  }
  v3 = _IOHIDLog();
  if (os_signpost_enabled(v3))
  {
    *(_WORD *)v4 = 0;
    _os_signpost_emit_with_name_impl(&dword_18AAAF000, v3, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventSystem - enumeration queue termination", (const char *)&unk_18AB567C9, v4, 2u);
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
