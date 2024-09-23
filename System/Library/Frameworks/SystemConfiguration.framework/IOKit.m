@implementation IOKit

void ____wait_for_IOKit_to_quiesce_block_invoke()
{
  SCDynamicStoreRef v0;
  const __SCDynamicStore *v1;
  const __CFArray *v2;
  int v3;
  CFPropertyListRef v4;
  const void *v5;
  CFTypeID TypeID;
  CFArrayRef v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  int v20;
  const char *v21;
  void *values[2];

  values[1] = *(void **)MEMORY[0x1E0C80C00];
  qword_1EE061F00 = (uint64_t)"Waiting for IOKit to quiesce (or timeout)";
  v0 = SCDynamicStoreCreate(0, CFSTR("SCNetworkInterfaceCopyAll"), 0, 0);
  if (!v0)
  {
    qword_1EE061F00 = 0;
    return;
  }
  v1 = v0;
  values[0] = (void *)SCDynamicStoreKeyCreate(0, CFSTR("%@InterfaceNamer"), CFSTR("Plugin:"));
  v2 = CFArrayCreate(0, (const void **)values, 1, MEMORY[0x1E0C9B378]);
  v3 = SCDynamicStoreSetNotificationKeys(v1, v2, 0);
  CFRelease(v2);
  if (v3)
  {
    while (1)
    {
      v4 = SCDynamicStoreCopyValue(v1, (CFStringRef)values[0]);
      if (v4)
      {
        v5 = v4;
        TypeID = CFDictionaryGetTypeID();
        if (CFGetTypeID(v5) == TypeID
          && (CFDictionaryContainsKey((CFDictionaryRef)v5, CFSTR("*QUIET*"))
           || CFDictionaryContainsKey((CFDictionaryRef)v5, CFSTR("*COMPLETE*"))
           || CFDictionaryContainsKey((CFDictionaryRef)v5, CFSTR("*TIMEOUT*"))))
        {
          CFRelease(v5);
          goto LABEL_18;
        }
        CFRelease(v5);
      }
      if (!SCDynamicStoreNotifyWait((mach_port_context_t)v1))
        break;
      v7 = SCDynamicStoreCopyNotifiedKeys(v1);
      if (v7)
        CFRelease(v7);
    }
    v8 = __log_SCNetworkConfiguration();
    v9 = _SC_syslog_os_log_mapping(5);
    if (!__SC_log_enabled(5, v8, (os_log_type_t)v9))
      goto LABEL_18;
    goto LABEL_16;
  }
  v8 = __log_SCNetworkConfiguration();
  v9 = _SC_syslog_os_log_mapping(5);
  if (__SC_log_enabled(5, v8, (os_log_type_t)v9))
  {
LABEL_16:
    v10 = _os_log_pack_size();
    v18 = (char *)values - ((MEMORY[0x1E0C80A78](v10, v11, v12, v13, v14, v15, v16, v17) + 15) & 0xFFFFFFFFFFFFFFF0);
    __error();
    v19 = _os_log_pack_fill();
    v20 = SCError();
    v21 = SCErrorString(v20);
    *(_DWORD *)v19 = 136315138;
    *(_QWORD *)(v19 + 4) = v21;
    __SC_log_send(5, (uint64_t)v8, v9, v18);
  }
LABEL_18:
  qword_1EE061F00 = 0;
  if (values[0])
    CFRelease(values[0]);
  CFRelease(v1);
}

@end
