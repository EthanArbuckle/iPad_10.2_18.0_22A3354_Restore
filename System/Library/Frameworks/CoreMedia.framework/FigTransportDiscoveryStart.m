@implementation FigTransportDiscoveryStart

void __FigTransportDiscoveryStart_block_invoke(uint64_t a1)
{
  uint64_t v2;
  int v3;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  int v5;
  uint64_t v6;
  unsigned int v7;
  char *v8;
  CFMutableDictionaryRef v9;
  __CFDictionary *v10;
  __CFDictionary *Mutable;
  __CFDictionary *v12;
  IONotificationPort *v13;
  os_log_type_t type;
  int v15[2];
  const char *v16;
  char v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_DWORD *)(v2 + 24);
  if (v3 < 1)
  {
    v15[0] = 0;
    type = OS_LOG_TYPE_DEFAULT;
    os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type(0, 1, v15, &type);
    v5 = v15[0];
    if (os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, type))
      v7 = v5;
    else
      v7 = v5 & 0xFFFFFFFE;
    if (v7)
    {
      v15[1] = 136315138;
      v16 = "ftd_Start";
      v8 = (char *)_os_log_send_and_compose_impl();
      LOBYTE(v5) = v15[0];
    }
    else
    {
      v8 = 0;
    }
    fig_log_call_emit_and_clean_up_after_send_and_compose(0, 1u, 1, v8, v8 != &v17, v5, 0, v6);
    v9 = IOServiceMatching("IOUSBInterface");
    if (v9)
    {
      v10 = v9;
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (!Mutable)
        goto LABEL_15;
      v12 = Mutable;
      CFDictionarySetInt64(Mutable, CFSTR("idVendor"), 1452);
      CFDictionarySetInt64(v12, CFSTR("bInterfaceClass"), 255);
      CFDictionarySetInt64(v12, CFSTR("bInterfaceSubClass"), 42);
      CFDictionarySetInt64(v12, CFSTR("bInterfaceProtocol"), 255);
      CFDictionarySetValue(v10, CFSTR("IOPropertyMatch"), v12);
      CFRelease(v12);
      v13 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
      *(_QWORD *)(v2 + 40) = v13;
      if (v13)
      {
        IONotificationPortSetDispatchQueue(v13, *(dispatch_queue_t *)(v2 + 16));
        if (!IOServiceAddMatchingNotification(*(IONotificationPortRef *)(v2 + 40), "IOServiceFirstMatch", v10, (IOServiceMatchingCallback)ftd_Attached, (void *)v2, (io_iterator_t *)(v2 + 48)))
        {
          CFRetain((CFTypeRef)v2);
          ++*(_DWORD *)(v2 + 24);
          ftd_Attached(v2, *(_DWORD *)(v2 + 48));
          goto LABEL_14;
        }
      }
      else
      {
LABEL_15:
        CFRelease(v10);
      }
    }
    ftd_Stop(v2);
    goto LABEL_14;
  }
  *(_DWORD *)(v2 + 24) = v3 + 1;
LABEL_14:
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
