@implementation MTDeviceCreateMultitouchDispatchSource

void __MTDeviceCreateMultitouchDispatchSource_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  unsigned int v3;
  mach_msg_header_t *i;
  mach_port_t Port;
  mach_msg_return_t v6;
  mach_msg_return_t v7;
  __int128 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  NSObject *v15;
  CFMachPortContext v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  CFRetain(*(CFTypeRef *)(a1 + 32));
  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = 92;
  for (i = (mach_msg_header_t *)CFAllocatorAllocate((CFAllocatorRef)*MEMORY[0x24BDBD240], 92, 0);
        ;
        i = (mach_msg_header_t *)CFAllocatorReallocate(v2, i, v3, 0))
  {
    i->msgh_bits = 0;
    i->msgh_size = v3;
    Port = CFMachPortGetPort(*(CFMachPortRef *)(*(_QWORD *)(a1 + 32) + 2016));
    i->msgh_remote_port = 0;
    i->msgh_local_port = Port;
    i->msgh_id = 0;
    v6 = mach_msg(i, 117440774, 0, i->msgh_size, Port, 0x3E8u, 0);
    if (v6 != 268451844)
      break;
    v3 = (i->msgh_size + 71) & 0xFFFFFFFC;
  }
  v7 = v6;
  if (!v6)
  {
    v16.copyDescription = (CFStringRef (__cdecl *)(const void *))0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.version = v8;
    *(_OWORD *)&v16.retain = v8;
    CFMachPortGetContext(*(CFMachPortRef *)(*(_QWORD *)(a1 + 32) + 2016), &v16);
    mt_DequeueMultitouchDataMachPortCallBack(*(CFMachPortRef *)(*(_QWORD *)(a1 + 32) + 2016), 0, 0, (uint64_t)v16.info);
    goto LABEL_12;
  }
  v9 = *(_QWORD *)(a1 + 32);
  if (!v9)
  {
    v15 = MTLoggingFramework();
    if (!os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
      goto LABEL_12;
    LODWORD(v16.version) = 67109120;
    HIDWORD(v16.version) = v7;
    v12 = "mach_msg failed: 0x%08x";
    v13 = v15;
    v14 = 8;
    goto LABEL_11;
  }
  if (*(_BYTE *)(v9 + 133))
    mt_CachePropertiesForDevice(v9);
  v10 = MTLoggingFramework();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
  {
    v11 = *(void **)(*(_QWORD *)(a1 + 32) + 64);
    LODWORD(v16.version) = 67109376;
    HIDWORD(v16.version) = v7;
    LOWORD(v16.info) = 2048;
    *(void **)((char *)&v16.info + 2) = v11;
    v12 = "mach_msg failed: 0x%08x (deviceID 0x%llX)";
    v13 = v10;
    v14 = 18;
LABEL_11:
    _os_log_impl(&dword_21A1DE000, v13, OS_LOG_TYPE_FAULT, v12, (uint8_t *)&v16, v14);
  }
LABEL_12:
  CFAllocatorDeallocate(v2, i);
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end
