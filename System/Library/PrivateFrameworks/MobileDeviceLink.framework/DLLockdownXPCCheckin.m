@implementation DLLockdownXPCCheckin

void __DLLockdownXPCCheckin_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned __int8 v5;
  uint64_t securecontext;
  int socket;
  uint64_t v8;
  const char *v9;
  CFNumberRef v10;
  CFNumberRef v11;
  int valuePtr;
  uint64_t v13;
  uint8_t buf[4];
  uint64_t v15;
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v13 = a2;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = a3;
    _os_log_impl(&dword_229EB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "lockdown_checkin_xpc connection handler called: %@", buf, 0xCu);
  }
  do
    v5 = __ldaxr(DLLockdownXPCCheckin_sCheckInDone);
  while (__stlxr(1u, DLLockdownXPCCheckin_sCheckInDone));
  if ((v5 & 1) == 0)
  {
    securecontext = lockdown_get_securecontext();
    socket = lockdown_get_socket();
    valuePtr = socket;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      v8 = DLGetProcessName();
      v9 = "";
      *(_DWORD *)buf = 138543874;
      v15 = v8;
      if (!securecontext)
        v9 = "out";
      v16 = 1024;
      v17 = socket;
      v18 = 2080;
      v19 = v9;
      _os_log_impl(&dword_229EB4000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "%{public}@ launched from lockdown on socket %d with%s SSL", buf, 0x1Cu);
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("DLInfoStreamTypeKey"), CFSTR("DLInfoStreamTypeTCP"));
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("DLInfoLockdownAccept"), (const void *)*MEMORY[0x24BDBD270]);
    v10 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("DLInfoSocketKey"), v10);
    if (v10)
      CFRelease(v10);
    v11 = CFNumberCreate(0, kCFNumberNSIntegerType, &v13);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 32), CFSTR("DLInfoLockdownConnection"), v11);
    if (v11)
      CFRelease(v11);
    CFRelease(*(CFTypeRef *)(a1 + 32));
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    dispatch_release(*(dispatch_object_t *)(a1 + 40));
  }
}

@end
