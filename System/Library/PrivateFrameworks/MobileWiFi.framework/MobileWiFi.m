uint64_t WiFiDeviceClientGetInterfaceName(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

BOOL WiFiDeviceClientGetPower(uint64_t a1)
{
  mach_port_t v2;
  const UInt8 *BytePtr;
  int Length;
  int v6;

  v6 = 0;
  v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_get_power(v2, (uint64_t)BytePtr, Length, &v6);
  return v6 == 1;
}

uint64_t wifi_device_get_power(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x1106E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69842)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

BOOL WiFiNetworkIsCaptive(uint64_t a1)
{
  return MEMORY[0x1E0D0D1B8]
      && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E0D0D290]) == (const void *)*MEMORY[0x1E0C9AE50];
}

void WiFiManagerClientSetType(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  *(_DWORD *)(a1 + 16) = a2;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_client_type(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t wifi_manager_set_client_type(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69730;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

void __WiFiManagerClientRelease(uint64_t a1)
{
  __CFMachPort *v2;
  const void *v3;
  const void *v4;
  int v5;
  uint64_t v6;
  unsigned int Port;
  mach_port_name_t v8;
  const void *v9;
  const void *v10;

  v2 = *(__CFMachPort **)(a1 + 96);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    v3 = *(const void **)(a1 + 96);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 96) = 0;
    }
  }
  v4 = *(const void **)(a1 + 104);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 104) = 0;
  }
  v5 = *(_DWORD *)(a1 + 88);
  if (v5)
  {
    notify_cancel(v5);
    *(_DWORD *)(a1 + 88) = 0;
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
  {
    wifi_manager_close(*(_DWORD *)(v6 + 4));
    WiFiSendRightRelease(*(unsigned int **)(a1 + 32));
    *(_QWORD *)(a1 + 32) = 0;
  }
  Port = WiFiMIGMachPortGetPort(*(_QWORD *)(a1 + 40));
  WiFiPortCacheRemove(Port);
  v8 = WiFiMIGMachPortGetPort(*(_QWORD *)(a1 + 40));
  v9 = *(const void **)(a1 + 40);
  if (v9)
  {
    CFRelease(v9);
    *(_QWORD *)(a1 + 40) = 0;
  }
  mach_port_mod_refs(*MEMORY[0x1E0C83DA0], v8, 1u, -1);
  v10 = *(const void **)(a1 + 64);
  if (v10)
  {
    CFRelease(v10);
    *(_QWORD *)(a1 + 64) = 0;
  }
  objc_msgSend(*(id *)(a1 + 344), "invalidate");

  *(_QWORD *)(a1 + 344) = 0;
}

void __WiFiDeviceClientRelease(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[3];
  if (v2)
  {
    CFRelease(v2);
    a1[3] = 0;
  }
  v3 = (const void *)a1[6];
  if (v3)
  {
    CFRelease(v3);
    a1[6] = 0;
  }
  v4 = (const void *)a1[9];
  if (v4)
  {
    CFRelease(v4);
    a1[9] = 0;
  }
}

CFPropertyListRef WiFiManagerClientCopyProperty(uint64_t a1, const void *a2)
{
  unsigned int *v4;
  unsigned int *v5;
  uint64_t RootDevice;
  CFPropertyListRef v7;
  const __CFData *BinaryData;
  const __CFData *v10;
  const UInt8 *BytePtr;
  int v12;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v4 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v4)
    return 0;
  v5 = v4;
  if (CFEqual(a2, CFSTR("SignalStrengthThreshold"))
    || CFEqual(a2, CFSTR("deviceCapabilities"))
    || CFEqual(a2, CFSTR("deviceSupportsWoW")))
  {
    RootDevice = __WiFiManagerClientGetRootDevice(a1);
    if (RootDevice)
      v7 = WiFiDeviceClientCopyProperty(RootDevice, a2);
    else
      v7 = 0;
  }
  else
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v10 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      v12 = CFDataGetLength(v10);
    }
    else
    {
      BytePtr = 0;
      v12 = 0;
    }
    wifi_manager_copy_property(v5[1], (uint64_t)BytePtr, v12, &length[1], length);
    v7 = 0;
    if (*(_QWORD *)&length[1] && length[0])
      v7 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    if (v10)
      CFRelease(v10);
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v5);
  return v7;
}

uint64_t wifi_manager_copy_property(int a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  __int128 v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[24];
  uint64_t v16;
  int v17;
  int v18;
  _BYTE v19[20];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_name = v8;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  *(_QWORD *)v19 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v19[8] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v14 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x1103E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69794)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_24;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

__CFArray *WiFiManagerClientCopyDevices(uint64_t a1)
{
  const __CFDictionary *v2;
  CFIndex Count;
  uint64_t v4;
  size_t v5;
  const void **v6;
  __CFArray *Mutable;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && (Count = CFDictionaryGetCount(v2)) != 0)
  {
    v4 = Count;
    MEMORY[0x1E0C80A78]();
    v6 = (const void **)((char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0, v6);
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    if (v4 >= 1)
    {
      do
      {
        if (!WiFiDeviceClientGetInterfaceRoleIndex((uint64_t)*v6))
          CFArrayAppendValue(Mutable, *v6);
        ++v6;
        --v4;
      }
      while (v4);
    }
  }
  else
  {
    Mutable = 0;
  }
  os_unfair_recursive_lock_unlock();
  return Mutable;
}

uint64_t WiFiDeviceClientGetInterfaceRoleIndex(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

BOOL MobileWiFiContainsRadio()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  io_service_t MatchingService;
  io_object_t v3;
  const __CFAllocator *v4;
  const __CFData *v5;
  const __CFData *v6;
  UInt8 v7;
  _BOOL8 v8;
  const __CFData *v9;
  const __CFData *v10;
  UInt8 v12[4];
  UInt8 buffer[4];
  CFRange v14;
  CFRange v15;

  v0 = *MEMORY[0x1E0CBBAB8];
  v1 = IOServiceMatching("IOPlatformExpertDevice");
  MatchingService = IOServiceGetMatchingService(v0, v1);
  if (MatchingService)
  {
    v3 = MatchingService;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = (const __CFData *)IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", CFSTR("software-behavior"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1u);
    if (v5)
    {
      v6 = v5;
      *(_DWORD *)buffer = -1431655766;
      v14.location = 0;
      v14.length = 4;
      CFDataGetBytes(v5, v14, buffer);
      v7 = buffer[0];
      CFRelease(v6);
      if ((v7 & 0x20) != 0)
      {
        v8 = 0;
LABEL_10:
        IOObjectRelease(v3);
        goto LABEL_11;
      }
    }
    else
    {
      SCLog();
    }
    SCLog();
    v9 = (const __CFData *)IORegistryEntrySearchCFProperty(v3, "IODeviceTree", CFSTR("no-sdio-devices"), v4, 1u);
    if (v9)
    {
      v10 = v9;
      *(_DWORD *)v12 = -1431655766;
      v15.location = 0;
      v15.length = 4;
      CFDataGetBytes(v9, v15, v12);
      v8 = *(_DWORD *)v12 == 0;
      CFRelease(v10);
    }
    else
    {
      v8 = 1;
      SCLog();
    }
    goto LABEL_10;
  }
  v8 = 1;
  SCLog();
LABEL_11:
  SCLog();
  return v8;
}

uint64_t wifi_device_set_event_mask(int a1, uint64_t a2, int a3, uint64_t a4)
{
  unint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  v8 = a2;
  v9 = 27918592;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = a4;
  v5 = 0xAAAAAAAA80000013;
  v6 = a1;
  v7 = xmmword_1B9BCF320;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t _WiFiDeviceClientSendEventMaskToServer(uint64_t a1)
{
  int v2;
  const UInt8 *BytePtr;
  int Length;

  v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  return wifi_device_set_event_mask(v2, (uint64_t)BytePtr, Length, *(_QWORD *)(a1 + 64));
}

CFPropertyListRef WiFiDeviceClientCopyProperty(uint64_t a1, const void *a2)
{
  CFPropertyListRef v2;
  const __CFData *BinaryData;
  const __CFData *v5;
  const UInt8 *BytePtr;
  int v7;
  mach_port_t v8;
  const UInt8 *v9;
  int v10;
  _DWORD length[3];

  v2 = 0;
  memset(length, 0, sizeof(length));
  if (a1 && a2)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v5 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      v7 = CFDataGetLength(v5);
    }
    else
    {
      BytePtr = 0;
      v7 = 0;
    }
    v8 = *(_DWORD *)(a1 + 16);
    v9 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v10 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_copy_property(v8, (uint64_t)v9, v10, (uint64_t)BytePtr, v7, &length[1], length);
    v2 = 0;
    if (*(_QWORD *)&length[1] && length[0])
      v2 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    if (v5)
      CFRelease(v5);
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v2;
}

uint64_t wifi_device_copy_property(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_msg_header_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;

  v16 = 2;
  v17 = a2;
  v18 = 27918592;
  v19 = a3;
  v20 = a4;
  v21 = 27918592;
  v22 = a5;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v15.msgh_bits = 0xAAAAAAAA80001513;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(_QWORD *)&v15.msgh_voucher_port = 0x1106B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v15);
    special_reply_port = v15.msgh_local_port;
  }
  v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v15.msgh_id == 69839)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port)
                v12 = 4294966996;
              else
                v12 = HIDWORD(v17);
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_23;
        }
        v12 = 4294966996;
        if (v16 == 1 && *(_QWORD *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          v13 = v19;
          if (v19 == v21)
          {
            v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t WiFiDeviceClientScanAsync(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4)
{
  double v8;
  const __CFData *BinaryData;
  const __CFData *v10;
  const UInt8 *BytePtr;
  int Length;
  mach_port_t v13;
  const UInt8 *v14;
  int v15;
  mach_port_t v17;
  const UInt8 *v18;
  int v19;
  unsigned int v20;

  if (!a2)
    return 4294963396;
  v20 = -1431655766;
  if (!WiFiManagerClientIsUserInteractive(*(_QWORD *)(a1 + 56)))
  {
    v8 = vabdd_f64(CFAbsoluteTimeGetCurrent(), *(double *)&WiFiDeviceClientScanAsync_timeBetweenCalls);
    if (v8 < 0.02)
    {
      NSLog(CFSTR("%s called %0.2fs ago, rejecting, min time between successive calls is %0.2fs"), "WiFiDeviceClientScanAsync", *(_QWORD *)&v8, 0x3F947AE147AE147BLL);
      return 4294963366;
    }
    WiFiDeviceClientScanAsync_timeBetweenCalls = CFAbsoluteTimeGetCurrent();
  }
  *(_QWORD *)(a1 + 160) = a3;
  *(_QWORD *)(a1 + 168) = a4;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (BinaryData)
  {
    v10 = BinaryData;
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v10);
    v13 = *(_DWORD *)(a1 + 16);
    v14 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v15 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_scan_async(v13, (uint64_t)v14, v15, (uint64_t)BytePtr, Length, (int *)&v20);
    CFRelease(v10);
  }
  else
  {
    v17 = *(_DWORD *)(a1 + 16);
    v18 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v19 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_scan_async(v17, (uint64_t)v18, v19, 0, 0, (int *)&v20);
  }
  return v20;
}

uint64_t wifi_device_scan_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  mach_port_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t msg;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = 2;
  v15 = a2;
  v16 = 27918592;
  v17 = a3;
  v18 = a4;
  v19 = 27918592;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a3;
  v23 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1107300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 69847)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v11 = 1;
            else
              v11 = HIDWORD(v15) == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = HIDWORD(v15);
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

BOOL WiFiManagerClientIsUserInteractive(_BOOL8 result)
{
  if (result)
    return *(_BYTE *)(result + 81) != 0;
  return result;
}

uint64_t WiFiNetworkIsApplePersonalHotspot(uint64_t a1)
{
  const void *v2;
  CFTypeID v3;
  const void *Value;
  uint64_t result;
  const __CFData *v6;
  CFTypeID v7;
  unsigned __int8 *v8;
  CFIndex Length;
  uint64_t v10;
  uint64_t v12;

  if (!a1)
    goto LABEL_20;
  v2 = *(const void **)(a1 + 16);
  if (!v2)
    goto LABEL_20;
  v3 = CFGetTypeID(v2);
  if (v3 != CFDictionaryGetTypeID())
    goto LABEL_20;
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IsPersonalHotspot"));
  if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
    return 1;
  result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IE"));
  if (result)
  {
    v6 = (const __CFData *)result;
    v7 = CFGetTypeID((CFTypeRef)result);
    if (v7 == CFDataGetTypeID())
    {
      result = (uint64_t)CFDataGetBytePtr(v6);
      if (!result)
        return result;
      v8 = (unsigned __int8 *)result;
      Length = CFDataGetLength(v6);
      if (Length << 32 >= 1)
      {
        v10 = 0;
        while (*v8 != 221 || v8[1] != 10 || *(_DWORD *)(v8 + 2) != 116528896 || *(_DWORD *)(v8 + 5) != 50397446)
        {
          v12 = v8[1] + 2;
          v10 += v12;
          v8 += v12;
          if (v10 >= (int)Length)
            return 0;
        }
        return 1;
      }
      return 0;
    }
LABEL_20:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

void __WiFiNetworkRelease(_QWORD *a1)
{
  CFTypeID v2;
  uint64_t v3;
  const void *v4;

  if (a1)
  {
    v2 = CFGetTypeID(a1);
    v3 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      v3 = __kWiFiNetworkTypeID;
    }
    if (v2 == v3)
    {
      v4 = (const void *)a1[2];
      if (v4)
      {
        CFRelease(v4);
        a1[2] = 0;
      }
    }
  }
}

void WiFiManagerClientScheduleWithRunLoop(uint64_t a1, __CFRunLoop *a2, const __CFString *a3)
{
  unsigned int *v6;
  const __CFAllocator *v7;
  __CFMachPort *v8;
  __CFRunLoopSource *RunLoopSource;
  mach_port_t notify_port;

  v6 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  *(_QWORD *)(a1 + 48) = a2;
  *(_QWORD *)(a1 + 56) = a3;
  WiFiMIGMachPortScheduleWithRunLoop(*(_QWORD *)(a1 + 40), a2, a3);
  if (!v6)
  {
    notify_port = -1431655766;
    if (!notify_register_mach_port("com.apple.wifi.manager.available", &notify_port, 0, (int *)(a1 + 88)))
    {
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v8 = (__CFMachPort *)_CFMachPortCreateWithPort();
      *(_QWORD *)(a1 + 96) = v8;
      if (v8)
      {
        RunLoopSource = CFMachPortCreateRunLoopSource(v7, v8, 0);
        *(_QWORD *)(a1 + 104) = RunLoopSource;
        if (RunLoopSource)
          CFRunLoopAddSource(a2, RunLoopSource, a3);
      }
    }
  }
  WiFiSendRightRelease(v6);
}

uint64_t WiFiManagerClientCreate(uint64_t a1, int a2)
{
  uint64_t v3;
  _OWORD *Instance;
  uint64_t v5;
  const __CFAllocator *v6;
  CFMutableDictionaryRef Mutable;
  _QWORD *v8;
  mach_port_name_t Port;
  uint64_t v10;
  unsigned int v11;
  unsigned int *v12;
  CFArrayRef ArrayBySeparatingStrings;
  const char *v14;
  CFStringEncoding SystemEncoding;
  CFStringRef v16;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _BOOL8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BOOL8 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  mach_port_name_t name;
  integer_t port_info_out;
  mach_msg_type_number_t port_info_outCnt;
  CFRange v53;

  v3 = *MEMORY[0x1E0C83DA0];
  port_info_outCnt = 1;
  if (!__wiFiManagerTypeID)
    pthread_once(&__wiFiManagerTypeInit, (void (*)(void))__WiFiManagerClientRegister);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v5 = (uint64_t)Instance;
  if (!Instance)
    return v5;
  name = -1431655766;
  port_info_out = -1431655766;
  Instance[1] = 0u;
  Instance[2] = 0u;
  Instance[3] = 0u;
  Instance[4] = 0u;
  Instance[5] = 0u;
  Instance[6] = 0u;
  Instance[7] = 0u;
  Instance[8] = 0u;
  Instance[9] = 0u;
  Instance[10] = 0u;
  Instance[11] = 0u;
  Instance[12] = 0u;
  Instance[13] = 0u;
  Instance[14] = 0u;
  Instance[15] = 0u;
  Instance[16] = 0u;
  Instance[17] = 0u;
  Instance[18] = 0u;
  Instance[19] = 0u;
  Instance[20] = 0u;
  Instance[21] = 0u;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  *(_QWORD *)(v5 + 64) = Mutable;
  if (!Mutable)
  {
    v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v18)
      WiFiManagerClientCreate_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_21;
  }
  *(_DWORD *)(v5 + 20) = 0;
  *(_DWORD *)(v5 + 24) = 0;
  mach_port_allocate(v3, 1u, &name);
  v8 = WiFiMIGMachPortCreate((uint64_t)v6, 36, name, 1);
  *(_QWORD *)(v5 + 40) = v8;
  if (!v8)
  {
    v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v26)
      WiFiManagerClientCreate_cold_2(v26, v27, v28, v29, v30, v31, v32, v33);
    goto LABEL_21;
  }
  Port = WiFiMIGMachPortGetPort((uint64_t)v8);
  if (mach_port_get_attributes(v3, Port, 1, &port_info_out, &port_info_outCnt))
  {
    v34 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v34)
      WiFiManagerClientCreate_cold_4(v34, v35, v36, v37, v38, v39, v40, v41);
    goto LABEL_21;
  }
  port_info_out = 32;
  v10 = WiFiMIGMachPortGetPort(*(_QWORD *)(v5 + 40));
  if (MEMORY[0x1BCCCAFBC](v3, v10, 1, &port_info_out, port_info_outCnt))
  {
    v42 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v42)
      WiFiManagerClientCreate_cold_3(v42, v43, v44, v45, v46, v47, v48, v49);
LABEL_21:
    ArrayBySeparatingStrings = (CFArrayRef)v5;
    v5 = 0;
LABEL_11:
    CFRelease(ArrayBySeparatingStrings);
    return v5;
  }
  WiFiMIGMachPortRegisterDemuxCallback(*(_QWORD *)(v5 + 40), (uint64_t)__WiFiManagerClientMIGDemuxCallback, v5);
  WiFiMIGMachPortRegisterTerminationCallback(*(_QWORD *)(v5 + 40), (uint64_t)__WiFiManagerClientServerTerminationCallback, v5);
  v11 = WiFiMIGMachPortGetPort(*(_QWORD *)(v5 + 40));
  WiFiPortCacheAdd(v11, (const void *)v5);
  *(_DWORD *)(v5 + 16) = a2;
  v12 = __WiFiManagerClientGetOrReconnectServerPort(v5, 1);
  WiFiSendRightRelease(v12);
  *(_BYTE *)(v5 + 80) = 0;
  ArrayBySeparatingStrings = CFStringCreateArrayBySeparatingStrings(v6, CFSTR("Preferences SpringBoard Carousel WiFiPickerExtens Setup budd sharingd demod BundledIntentHandler SiriViewService assistantd assistant_service Siri SettingsIntentExtension NanoSettings PineBoard TVSettings SoundBoard RealityControlCenter MuseBuddyApp mobilewifitool WirelessStress coreautomationd wifiutil NanoWiFiViewService ATKWiFiFramework WiFiViewService hQT XCTestInternalAngel HPSetup AirPlaySenderUIApp TVSetup deviceaccessd AccessorySetupUI"), CFSTR(" "));
  v14 = getprogname();
  SystemEncoding = CFStringGetSystemEncoding();
  v16 = CFStringCreateWithCString(v6, v14, SystemEncoding);
  v53.length = CFArrayGetCount(ArrayBySeparatingStrings);
  v53.location = 0;
  *(_BYTE *)(v5 + 81) = CFArrayContainsValue(ArrayBySeparatingStrings, v53, v16) != 0;
  *(_DWORD *)(v5 + 336) = 0;
  if (v16)
    CFRelease(v16);
  if (ArrayBySeparatingStrings)
    goto LABEL_11;
  return v5;
}

uint64_t WiFiMIGMachPortGetPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

void __WiFiManagerClientOrEventMask(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  unsigned int *v4;

  *(_QWORD *)(a1 + 72) |= a2;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v4 = v3;
  if (v3)
    wifi_manager_set_event_mask(v3[1], *(_QWORD *)(a1 + 72));
  WiFiSendRightRelease(v4);
}

uint64_t __WiFiManagerClientAddDevice(uint64_t a1, const void *a2, uint64_t a3, __CFArray *a4)
{
  uint64_t v8;
  const void *Value;
  uint64_t v10;
  int ServerPort;
  int v12;
  const void *v14;
  const void *v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;
  const char *v20;
  __int16 v21;
  const void *v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (!a2 || !*(_QWORD *)(a1 + 64))
    return 0;
  os_unfair_recursive_lock_lock_with_options();
  v8 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v8)
  {
LABEL_10:
    WiFiSendRightRelease((unsigned int *)v8);
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 64), a2))
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
    if (Value)
    {
      v10 = (uint64_t)Value;
      ServerPort = _WiFiDeviceClientGetServerPort((uint64_t)Value);
      v12 = *(_DWORD *)(v8 + 4);
      if (ServerPort != v12)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          v17 = _WiFiDeviceClientGetServerPort(v10);
          v18 = *(_DWORD *)(v8 + 4);
          v19 = 136315906;
          v20 = "__WiFiManagerClientAddDevice";
          v21 = 2112;
          v22 = a2;
          v23 = 1024;
          v24 = v17;
          v25 = 1024;
          v26 = v18;
          _os_log_error_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: for device [%@] updating server port from [%d] to [%d]", (uint8_t *)&v19, 0x22u);
          v12 = *(_DWORD *)(v8 + 4);
        }
        _WiFiDeviceClientSetServerPort(v10, v12);
        _WiFiDeviceClientSendEventMaskToServer(v10);
        _WiFiDeviceClientDispatchAssociationResult(v10, 0, 0, 5);
      }
    }
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __WiFiManagerClientAddDevice_cold_2();
  v14 = (const void *)_WiFiDeviceClientCreate(*MEMORY[0x1E0C9AE00], a1, *(_DWORD *)(v8 + 4), a2, a3);
  if (!v14)
    goto LABEL_10;
  v15 = v14;
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 64), a2, v14);
  if ((*(_BYTE *)(a1 + 72) & 4) != 0)
  {
    v16 = *(_QWORD *)(a1 + 128);
    WiFiSendRightRelease((unsigned int *)v8);
    os_unfair_recursive_lock_unlock();
    if (!a3 && v16)
    {
      if (a4)
      {
        CFArrayAppendValue(a4, v15);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
          __WiFiManagerClientAddDevice_cold_1();
      }
      else
      {
        (*(void (**)(uint64_t, const void *, _QWORD))(a1 + 128))(a1, v15, *(_QWORD *)(a1 + 136));
      }
    }
  }
  else
  {
    WiFiSendRightRelease((unsigned int *)v8);
    os_unfair_recursive_lock_unlock();
  }
  CFRelease(v15);
  return 1;
}

void WiFiSendRightRelease(unsigned int *a1)
{
  unsigned int v2;
  unsigned int v3;

  if (a1)
  {
    do
    {
      v2 = __ldxr(a1);
      v3 = v2 - 1;
    }
    while (__stxr(v3, a1));
    if (!v3)
    {
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], a1[1]);
      free(a1);
    }
  }
}

unsigned int *__WiFiManagerClientGetOrReconnectServerPort(uint64_t a1, int a2)
{
  unsigned int *v4;
  const __CFAllocator *v5;
  __SecTask *v6;
  __SecTask *v7;
  CFTypeRef v8;
  CFTypeID TypeID;
  _BOOL4 v10;
  mach_port_name_t Port;
  ipc_space_t *v12;
  mach_port_t v13;
  int v14;
  pid_t v15;
  mach_port_t v16;
  __CFArray *Mutable;
  const __CFArray *v18;
  const __CFArray *v19;
  CFIndex Count;
  CFIndex v21;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v24;
  const void *Value;
  const __CFNumber *v26;
  unsigned int v27;
  CFIndex v28;
  NSObject *v29;
  const void *v30;
  unsigned int v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  _BOOL8 v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _BOOL8 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  _BOOL8 v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  _BOOL8 v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  _BOOL8 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  mach_port_t previous;
  int v82;
  mach_port_t v83;
  mach_port_t sp;
  _DWORD length[3];
  CFErrorRef error[4];

  error[3] = *(CFErrorRef *)MEMORY[0x1E0C80C00];
  v83 = 0;
  sp = 0;
  previous = -1431655766;
  v82 = -1431655766;
  os_unfair_recursive_lock_lock_with_options();
  v4 = *(unsigned int **)(a1 + 32);
  if (a2)
  {
    WiFiSendRightRelease(*(unsigned int **)(a1 + 32));
    *(_QWORD *)(a1 + 32) = 0;
  }
  else if (v4)
  {
    do
      v32 = __ldxr(v4);
    while (__stxr(v32 + 1, v4));
    os_unfair_recursive_lock_unlock();
    return v4;
  }
  error[0] = 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v6 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
  if (!v6)
    goto LABEL_42;
  v7 = v6;
  v8 = SecTaskCopyValueForEntitlement(v6, CFSTR("com.apple.wifi.manager-access"), error);
  v10 = 1;
  if (v8)
  {
    TypeID = CFBooleanGetTypeID();
    if (TypeID == CFGetTypeID(v8))
    {
      if (CFEqual(v8, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
        v10 = 0;
    }
  }
  if (error[0])
  {
    CFRelease(error[0]);
    error[0] = 0;
  }
  if (v8)
    CFRelease(v8);
  CFRelease(v7);
  if (v10)
  {
LABEL_42:
    v33 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v33)
      __WiFiManagerClientGetOrReconnectServerPort_cold_1(v33, v34, v35, v36, v37, v38, v39, v40);
    goto LABEL_54;
  }
  if (bootstrap_look_up(*MEMORY[0x1E0C81720], "com.apple.wifi.manager", &sp))
  {
    v41 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v41)
      __WiFiManagerClientGetOrReconnectServerPort_cold_7(v41, v42, v43, v44, v45, v46, v47, v48);
    goto LABEL_54;
  }
  if (!sp)
  {
    v49 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v49)
      __WiFiManagerClientGetOrReconnectServerPort_cold_2(v49, v50, v51, v52, v53, v54, v55, v56);
    goto LABEL_54;
  }
  Port = WiFiMIGMachPortGetPort(*(_QWORD *)(a1 + 40));
  v12 = (ipc_space_t *)MEMORY[0x1E0C83DA0];
  mach_port_insert_right(*MEMORY[0x1E0C83DA0], Port, Port, 0x14u);
  if (mach_port_request_notification(*v12, Port, 70, 0, Port, 0x15u, &previous))
  {
    v57 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v57)
      __WiFiManagerClientGetOrReconnectServerPort_cold_6(v57, v58, v59, v60, v61, v62, v63, v64);
    goto LABEL_54;
  }
  v13 = sp;
  v14 = *(_DWORD *)(a1 + 16);
  v15 = getpid();
  wifi_manager_open(v13, v14, v15, Port, &v83, &v82);
  mach_port_deallocate(*v12, sp);
  if (v82 == 1)
  {
    v65 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v65)
      __WiFiManagerClientGetOrReconnectServerPort_cold_3(v65, v66, v67, v68, v69, v70, v71, v72);
    goto LABEL_54;
  }
  v16 = v83;
  if (!v83)
  {
    v73 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v73)
      __WiFiManagerClientGetOrReconnectServerPort_cold_4(v73, v74, v75, v76, v77, v78, v79, v80);
LABEL_54:
    os_unfair_recursive_lock_unlock();
    return 0;
  }
  v4 = (unsigned int *)malloc_type_malloc(8uLL, 0x100004000313F17uLL);
  *v4 = 1;
  v4[1] = v16;
  *(_QWORD *)(a1 + 32) = v4;
  wifi_manager_set_event_mask(v83, *(_QWORD *)(a1 + 72));
  Mutable = CFArrayCreateMutable(v5, 0, MEMORY[0x1E0C9B378]);
  memset(length, 0, sizeof(length));
  wifi_manager_copy_devices(v83, &length[1], length);
  if (*(_QWORD *)&length[1])
  {
    if (length[0])
    {
      v18 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      if (v18)
      {
        v19 = v18;
        error[0] = 0;
        Count = CFArrayGetCount(v18);
        if (Count >= 1)
        {
          v21 = Count;
          for (i = 0; i != v21; ++i)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v19, i);
            if (ValueAtIndex)
            {
              v24 = ValueAtIndex;
              Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("VIRT_IF_NAME"));
              v26 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("VIRT_IF_ROLE"));
              CFNumberGetValue(v26, kCFNumberLongType, error);
              if (Value)
                __WiFiManagerClientAddDevice(a1, Value, (uint64_t)error[0], Mutable);
            }
          }
        }
        CFRelease(v19);
      }
    }
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  do
    v27 = __ldxr(v4);
  while (__stxr(v27 + 1, v4));
  os_unfair_recursive_lock_unlock();
  if (Mutable)
  {
    if (CFArrayGetCount(Mutable) >= 1)
    {
      v28 = 0;
      v29 = MEMORY[0x1E0C81028];
      do
      {
        v30 = CFArrayGetValueAtIndex(Mutable, v28);
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          __WiFiManagerClientGetOrReconnectServerPort_cold_5((uint8_t *)error, (CFErrorRef *)((char *)error + 4));
        (*(void (**)(uint64_t, const void *, _QWORD))(a1 + 128))(a1, v30, *(_QWORD *)(a1 + 136));
        ++v28;
      }
      while (CFArrayGetCount(Mutable) > v28);
    }
    CFRelease(Mutable);
  }
  return v4;
}

void __WiFiManagerClientAddDevice_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x1Cu);
  OUTLINED_FUNCTION_6();
}

uint64_t _WiFiDeviceClientCreate(uint64_t a1, uint64_t a2, int a3, const void *a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t Instance;
  CFTypeRef v11;
  CFTypeRef BinaryData;

  v5 = 0;
  if (a3 && a4)
  {
    if (!__wiFiDeviceTypeID)
      pthread_once(&__wiFiDeviceTypeInit, (void (*)(void))__WiFiDeviceClientRegister);
    Instance = _CFRuntimeCreateInstance();
    v5 = Instance;
    if (Instance)
    {
      bzero((void *)(Instance + 16), 0x290uLL);
      *(_QWORD *)(v5 + 56) = a2;
      *(_DWORD *)(v5 + 16) = a3;
      v11 = CFRetain(a4);
      *(_QWORD *)(v5 + 24) = v11;
      BinaryData = _CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11);
      *(_QWORD *)(v5 + 48) = BinaryData;
      if (BinaryData)
      {
        *(_QWORD *)(v5 + 40) = a5;
      }
      else
      {
        CFRelease((CFTypeRef)v5);
        return 0;
      }
    }
  }
  return v5;
}

uint64_t wifi_manager_set_event_mask(mach_port_t a1, uint64_t a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  uint64_t v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69731;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_open(int a1, int a2, int a3, int a4, _DWORD *a5, _DWORD *a6)
{
  __int128 v9;
  mach_port_name_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  _BYTE msg[36];
  __int128 v16;
  unint64_t v17;

  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v9;
  v16 = v9;
  v17 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[4] = v9;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a4;
  LODWORD(v16) = 1157802;
  *(_QWORD *)((char *)&v16 + 4) = *MEMORY[0x1E0C804E8];
  HIDWORD(v16) = a2;
  LODWORD(v17) = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = -2147478253;
  *(_QWORD *)&msg[16] = 0x1103A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v11 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x38u, 0x3Cu, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v12 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69790)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v12 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v12 = 4294966996;
              else
                v12 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_23;
        }
        v12 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 52 && !*(_DWORD *)&msg[8] && WORD1(v16) << 16 == 1114112)
        {
          v12 = 0;
          v13 = HIDWORD(v16);
          *a5 = *(_DWORD *)&msg[28];
          *a6 = v13;
          return v12;
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_copy_devices(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1103C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69792)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t WiFiPortCacheAdd(unsigned int a1, const void *a2)
{
  pthread_mutex_lock(&__wifiPortCacheLock);
  if (__wifiPortCache)
    CFDictionarySetValue((CFMutableDictionaryRef)__wifiPortCache, (const void *)a1, a2);
  return pthread_mutex_unlock(&__wifiPortCacheLock);
}

void WiFiMIGMachPortScheduleWithRunLoop(uint64_t a1, CFRunLoopRef rl, CFRunLoopMode mode)
{
  __CFRunLoopSource *RunLoopSource;

  *(_QWORD *)(a1 + 32) = rl;
  *(_QWORD *)(a1 + 40) = mode;
  RunLoopSource = *(__CFRunLoopSource **)(a1 + 48);
  if (RunLoopSource
    || (RunLoopSource = CFMachPortCreateRunLoopSource((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFMachPortRef *)(a1 + 56), 1), (*(_QWORD *)(a1 + 48) = RunLoopSource) != 0))
  {
    CFRunLoopAddSource(rl, RunLoopSource, mode);
  }
}

uint64_t WiFiMIGMachPortRegisterTerminationCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 96) = a2;
  *(_QWORD *)(result + 104) = a3;
  return result;
}

uint64_t WiFiMIGMachPortRegisterDemuxCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 80) = a2;
  *(_QWORD *)(result + 88) = a3;
  return result;
}

_QWORD *WiFiMIGMachPortCreate(uint64_t a1, uint64_t a2, int a3, int a4)
{
  _OWORD *Instance;
  _QWORD *v8;
  uint64_t v9;
  CFMachPortContext v11;

  if (a2 < 1)
    return 0;
  if (!__WiFiMIGMachPortTypeID)
    pthread_once(&__WiFiMIGMachPortTypeInit, (void (*)(void))__WiFiMIGMachPortRegister);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v8 = Instance;
  if (Instance)
  {
    Instance[5] = 0u;
    Instance[6] = 0u;
    Instance[3] = 0u;
    Instance[4] = 0u;
    Instance[1] = 0u;
    Instance[2] = 0u;
    *((_DWORD *)Instance + 4) = a3;
    if (!a4
      || ((v11.version = 0, memset(&v11.retain, 0, 24), v11.info = Instance, !a3)
        ? (v9 = (uint64_t)CFMachPortCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFMachPortCallBack)__WiFiMIGMachPortCFPortCallback, &v11, 0)): (v9 = _CFMachPortCreateWithPort()), (v8[7] = v9) != 0))
    {
      v8[3] = a2;
      return v8;
    }
    CFRelease(v8);
    return 0;
  }
  return v8;
}

uint64_t _CFMachPortCreateWithPort()
{
  return _SC_CFMachPortCreateWithPort();
}

const __CFNumber *WiFiNetworkIsAdHoc(uint64_t a1)
{
  const __CFNumber *result;
  __int16 valuePtr;

  result = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("AP_MODE"));
  if (result)
  {
    valuePtr = -21846;
    result = (const __CFNumber *)CFNumberGetValue(result, kCFNumberSInt16Type, &valuePtr);
    if ((_DWORD)result)
      return (const __CFNumber *)(valuePtr == 1);
  }
  return result;
}

const __CFNumber *WiFiNetworkGetPhyMode(uint64_t a1)
{
  const __CFNumber *Property;

  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("PHY_MODE"));
  return _CFTypeGetIntValue(Property);
}

const void *WiFiNetworkGetProperty(uint64_t a1, void *key)
{
  const __CFDictionary *v3;
  const __CFArray *v5;
  int v6;
  const __CFDictionary *Value;
  CFRange v9;

  if (a1 && (v3 = *(const __CFDictionary **)(a1 + 16)) != 0)
  {
    v5 = (const __CFArray *)__eapKeys;
    if (!__eapKeys)
      return CFDictionaryGetValue(v3, key);
    v9.length = CFArrayGetCount((CFArrayRef)__eapKeys);
    v9.location = 0;
    v6 = CFArrayContainsValue(v5, v9, key);
    v3 = *(const __CFDictionary **)(a1 + 16);
    if (!v6)
      return CFDictionaryGetValue(v3, key);
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, CFSTR("EnterpriseProfile"));
    if (Value)
    {
      v3 = (const __CFDictionary *)CFDictionaryGetValue(Value, CFSTR("EAPClientConfiguration"));
      if (v3)
        return CFDictionaryGetValue(v3, key);
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  return 0;
}

const __CFNumber *_CFTypeGetIntValue(const __CFNumber *result)
{
  const __CFNumber *v1;
  CFTypeID v2;
  CFTypeID v3;
  uint64_t valuePtr;

  valuePtr = 0;
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFNumberGetTypeID())
    {
      CFNumberGetValue(v1, kCFNumberCFIndexType, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }
    else
    {
      v3 = CFGetTypeID(v1);
      if (v3 == CFBooleanGetTypeID())
        return (const __CFNumber *)(*MEMORY[0x1E0C9AE50] == (_QWORD)v1);
      else
        return 0;
    }
  }
  return result;
}

void __WiFiMIGMachPortCFPortCallback(int a1, mach_msg_header_t *a2, int a3, CFIndex *cf)
{
  mach_msg_header_t *v6;
  mach_msg_header_t *v7;
  mach_port_t msgh_remote_port;
  mach_port_t *p_msgh_remote_port;
  void (*v10)(CFIndex *, CFIndex);
  uint64_t v11;
  void (*v12)(CFIndex *, mach_msg_header_t *, mach_msg_header_t *, CFIndex);
  mach_msg_option_t v13;

  if (cf)
  {
    CFRetain(cf);
    v6 = (mach_msg_header_t *)CFAllocatorAllocate(0, cf[3], 0);
    if (!v6)
    {
LABEL_19:
      CFRelease(cf);
      return;
    }
    v7 = v6;
    msgh_remote_port = a2->msgh_remote_port;
    v6->msgh_bits = a2->msgh_bits & 0x1F;
    v6->msgh_size = 36;
    *(_QWORD *)&v6->msgh_remote_port = msgh_remote_port;
    v6->msgh_id = a2->msgh_id + 100;
    if (a2->msgh_id == 70)
    {
      v6->msgh_bits = 0;
      v6->msgh_remote_port = 0;
      v6[1].msgh_remote_port = 0;
      p_msgh_remote_port = &v6[1].msgh_remote_port;
      v10 = (void (*)(CFIndex *, CFIndex))cf[12];
      if (v10)
        v10(cf, cf[13]);
    }
    else
    {
      v11 = *MEMORY[0x1E0C804E8];
      v6[1].msgh_remote_port = -303;
      p_msgh_remote_port = &v6[1].msgh_remote_port;
      *(_QWORD *)&v6[1].msgh_bits = v11;
      v12 = (void (*)(CFIndex *, mach_msg_header_t *, mach_msg_header_t *, CFIndex))cf[10];
      if (v12)
        v12(cf, a2, v6, cf[11]);
    }
    if ((v7->msgh_bits & 0x80000000) == 0 && *p_msgh_remote_port)
    {
      if (*p_msgh_remote_port == -305)
        goto LABEL_18;
      a2->msgh_remote_port = 0;
      mach_msg_destroy(a2);
    }
    if (v7->msgh_remote_port)
    {
      if ((v7->msgh_bits & 0x1F) == 0x12)
        v13 = 1;
      else
        v13 = 17;
      if ((mach_msg(v7, v13, v7->msgh_size, 0, 0, 0, 0) - 268435459) > 1)
        goto LABEL_18;
    }
    else if ((v7->msgh_bits & 0x80000000) == 0)
    {
      goto LABEL_18;
    }
    mach_msg_destroy(v7);
LABEL_18:
    CFAllocatorDeallocate(0, v7);
    goto LABEL_19;
  }
}

uint64_t __WiFiManagerClientMIGDemuxCallback(uint64_t a1, _DWORD *a2, uint64_t a3)
{
  int v3;
  uint64_t result;

  v3 = a2[5];
  if (v3 >= 96960 && v3 < 96974)
    LOBYTE(result) = wifi_manager_client_server(a2, a3);
  else
    LOBYTE(result) = 0;
  return result;
}

uint64_t wifi_manager_client_server(_DWORD *a1, uint64_t a2)
{
  int v2;
  int v3;
  int v4;
  void (*v5)(void);
  uint64_t result;

  v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  v3 = a1[5] + 100;
  *(_DWORD *)(a2 + 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  v4 = a1[5];
  if ((v4 - 96974) >= 0xFFFFFFF2
    && (v5 = (void (*)(void))*(&_wifi_manager_client_subsystem + 5 * (v4 - 96960) + 5)) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    result = 0;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_event(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 84)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 80))
        {
          result = _wifi_manager_client_dispatch_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_QWORD *)(result + 72), *(UInt8 **)(result + 44), v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    v5 = -300;
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t WiFiDeviceClientSetCoexParameters(uint64_t a1, const void *a2, const void *a3)
{
  const __CFAllocator *v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v10;
  const __CFData *v11;
  const UInt8 *v12;
  int v13;
  mach_port_t v14;
  const UInt8 *v15;
  int v16;
  unsigned int v18;

  v18 = -3902;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v7 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v7);
  }
  else
  {
    BytePtr = 0;
    Length = 0;
  }
  v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a3);
  v11 = v10;
  if (v10)
  {
    v12 = CFDataGetBytePtr(v10);
    v13 = CFDataGetLength(v11);
  }
  else
  {
    v12 = 0;
    v13 = 0;
  }
  v14 = *(_DWORD *)(a1 + 16);
  v15 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v16 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_coex_parameters(v14, (uint64_t)v15, v16, (uint64_t)BytePtr, Length, (uint64_t)v12, v13, (int *)&v18);
  if (v7)
    CFRelease(v7);
  if (v11)
    CFRelease(v11);
  return v18;
}

CFTypeRef _CFPropertyListCreateBinaryData(CFAllocatorRef bufferAllocator, const void *a2)
{
  __CFWriteStream *v3;
  __CFWriteStream *v4;
  CFTypeRef v5;
  CFErrorRef error;

  v3 = CFWriteStreamCreateWithAllocatedBuffers(bufferAllocator, bufferAllocator);
  if (!v3)
    return 0;
  v4 = v3;
  if (CFWriteStreamOpen(v3))
  {
    error = 0;
    CFPropertyListWrite(a2, v4, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    CFWriteStreamClose(v4);
    if (error)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        _CFPropertyListCreateBinaryData_cold_1();
      CFRelease(error);
    }
    v5 = CFWriteStreamCopyProperty(v4, (CFStreamPropertyKey)*MEMORY[0x1E0C9B2A8]);
  }
  else
  {
    v5 = 0;
  }
  CFRelease(v4);
  return v5;
}

uint64_t _wifi_manager_client_dispatch_event(unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4, UInt8 *a5, unsigned int a6)
{
  _QWORD *v11;
  _QWORD *v12;
  const __CFString *v13;
  _QWORD *Device;
  const __CFDictionary *v15;
  const __CFArray *v16;
  _QWORD *v17;
  const __CFString *v18;
  int v19;
  const void *v20;
  void (*v21)(_QWORD *, const void *, _QWORD, uint64_t);
  const void *v22;
  __CFArray *NetworksFromRecords;
  _WORD *v24;
  uint64_t v25;
  const __CFArray *v26;
  int v27;
  const void *v28;
  const void *v29;
  void (*v30)(_QWORD *, const void *, const __CFArray *, _QWORD);
  _BOOL8 v31;
  uint64_t v33;
  uint64_t valuePtr;

  v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    v12 = v11;
    v13 = (const __CFString *)_WiFiCopyUnserialized(a2, a3);
    if (v13)
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
    else
      Device = 0;
    v15 = (const __CFDictionary *)_WiFiCopyUnserialized(a5, a6);
    v16 = v15;
    switch(a4)
    {
      case 0:
        if (Device)
          _WiFiDeviceClientDispatchPowerEvent((uint64_t)Device);
        goto LABEL_80;
      case 1:
        if (Device)
          _WiFiDeviceClientDispatchLinkEvent((uint64_t)Device, v15);
        goto LABEL_80;
      case 2:
        v17 = v12;
        v18 = v13;
        v19 = 0;
        goto LABEL_33;
      case 3:
        if (Device)
          _WiFiDeviceClientDispatchRemovalEvent(Device);
        goto LABEL_80;
      case 4:
        goto LABEL_80;
      case 6:
        if (Device)
          _WiFiDeviceClientDispatchScanCacheUpdateEvent(Device, v15);
        goto LABEL_80;
      case 7:
      case 8:
        if (Device)
          _WiFiDeviceClientDispatchScanUpdateEvent((uint64_t)Device, v15);
        goto LABEL_80;
      case 9:
        v20 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        v21 = (void (*)(_QWORD *, const void *, _QWORD, uint64_t))v12[20];
        if (!v21)
          goto LABEL_80;
        v22 = v20;
        if (v16)
        {
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v16);
          ((void (*)(_QWORD *, const void *, __CFArray *, _QWORD))v12[20])(v12, v22, NetworksFromRecords, v12[21]);
          goto LABEL_42;
        }
        v33 = v12[21];
        goto LABEL_88;
      case 10:
        if (Device)
        {
          v24 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v15);
          _WiFiDeviceClientDispatchBssidEvent((uint64_t)Device, (uint64_t)v24);
          if (v24)
            CFRelease(v24);
        }
        goto LABEL_80;
      case 11:
        if (Device)
          _WiFiDeviceClientDispatchResumeScanEvent((uint64_t)Device);
        goto LABEL_80;
      case 12:
        if (Device)
        {
          valuePtr = 0;
          CFNumberGetValue(v15, kCFNumberCFIndexType, &valuePtr);
          _WiFiDeviceClientDispatchBgScanSuspendResumeEvent((uint64_t)Device, valuePtr == 1);
        }
        goto LABEL_80;
      case 14:
        if (Device)
          _WiFiDeviceClientDispatchLQMEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 15:
        if (Device)
          _WiFiDeviceClientDispatchDiagnosticsStartEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 17:
        v17 = v12;
        v18 = (const __CFString *)v16;
        v19 = 1;
LABEL_33:
        WiFiManagerClientDispatchAttachmentEvent(v17, v18, v19);
        goto LABEL_80;
      case 18:
        v25 = (uint64_t)v12;
        v26 = v16;
        v27 = 0;
        goto LABEL_75;
      case 19:
        if (Device)
          _WiFiDeviceClientDispatchHostApStateChangedEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 20:
        if (Device)
          _WiFiDeviceClientDispatchDeviceAvailableEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 21:
        v28 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        v21 = (void (*)(_QWORD *, const void *, _QWORD, uint64_t))v12[22];
        if (!v21)
          goto LABEL_80;
        v22 = v28;
        if (v16)
        {
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v16);
          ((void (*)(_QWORD *, const void *, __CFArray *, _QWORD))v12[22])(v12, v22, NetworksFromRecords, v12[23]);
LABEL_42:
          if (NetworksFromRecords)
            CFRelease(NetworksFromRecords);
LABEL_81:
          CFRelease(v16);
LABEL_82:
          if (v13)
LABEL_83:
            CFRelease(v13);
        }
        else
        {
          v33 = v12[23];
LABEL_88:
          v21(v12, v22, 0, v33);
          if (v13)
            goto LABEL_83;
        }
        CFRelease(v12);
        break;
      case 22:
        if (Device)
          _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent((uint64_t)Device, v15);
        goto LABEL_80;
      case 23:
        if (Device)
          _WiFiDeviceClientDispatchAutoJoinNotification((uint64_t)Device, v15);
        goto LABEL_80;
      case 24:
        if (Device)
          _WiFiDeviceClientDispatchRangingReportEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 25:
        v29 = WiFiManagerClientGetDevice((uint64_t)v12, v13);
        v30 = (void (*)(_QWORD *, const void *, const __CFArray *, _QWORD))v12[24];
        if (v30)
          v30(v12, v29, v16, v12[25]);
        goto LABEL_80;
      case 30:
        if (Device)
          _WiFiDeviceClientDispatchRoamStatusEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 31:
        if (Device)
          _WiFiDeviceClientDispatchWeightAvgLQMEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 34:
        if (Device)
          _WiFiDeviceClientDispatchUserJoinNotification((uint64_t)Device, v15);
        goto LABEL_80;
      case 35:
        if (Device)
          _WiFiDeviceClientDispatchBTScanIntervalRelaxEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 37:
        if (Device)
        {
          LODWORD(valuePtr) = -1;
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          _WiFiDeviceClientDispatchCarPlayNetworkTypeChangeEvent((uint64_t)Device, valuePtr);
        }
        goto LABEL_80;
      case 38:
        if (Device)
        {
          v31 = CFBooleanGetValue(v15) != 0;
          _WiFiDeviceClientDispatch24GHzNetworkInCriticalStateEvent((uint64_t)Device, v31);
        }
        goto LABEL_80;
      case 39:
        if (Device)
        {
          LODWORD(valuePtr) = 0;
          CFNumberGetValue(v15, kCFNumberSInt32Type, &valuePtr);
          _WiFiDeviceClientDispatchM1M4Handshake24GHzCountEvent((uint64_t)Device, valuePtr);
        }
        goto LABEL_80;
      case 40:
        if (Device)
          _WiFiDeviceClientDispatchCatsUpdateEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 41:
        if (Device)
          _WiFiDeviceClientDispatchP2pThreadCoexEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 42:
        if (Device)
          _WiFiDeviceClientDispatchBTCoexStatsEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 43:
        if (Device)
          _WiFiDeviceClientDispatchBSPEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 44:
        v25 = (uint64_t)v12;
        v26 = v16;
        v27 = 1;
LABEL_75:
        WiFiManagerClientRemoveDevice(v25, v26, 1, v27);
        goto LABEL_80;
      case 45:
        if (Device)
          _WiFiDeviceClientDispatchUCMEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      case 46:
        if (Device)
          _WiFiDeviceClientDispatchTdConfirmedEvent((uint64_t)Device, (uint64_t)v15);
        goto LABEL_80;
      default:
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_80:
        if (v16)
          goto LABEL_81;
        goto LABEL_82;
    }
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a5, a6);
  return 0;
}

CFPropertyListRef _WiFiCopyUnserialized(UInt8 *bytes, CFIndex length)
{
  const __CFAllocator *v2;
  const __CFData *v3;
  const __CFData *v4;
  CFPropertyListRef v5;
  _BOOL4 v6;
  BOOL v7;
  CFErrorRef error;

  if (!bytes || !length)
  {
    v6 = bytes != 0;
    if (length)
    {
      v6 = 0;
      v7 = bytes == 0;
    }
    else
    {
      v7 = 0;
    }
    if ((v7 || v6) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _WiFiCopyUnserialized_cold_2();
    return 0;
  }
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFDataCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
  if (!v3)
    return 0;
  v4 = v3;
  error = 0;
  v5 = CFPropertyListCreateWithData(v2, v3, 1uLL, 0, &error);
  if (error)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _WiFiCopyUnserialized_cold_1();
    CFRelease(error);
  }
  CFRelease(v4);
  return v5;
}

uint64_t _WiFiVMDealloc(uint64_t result, uint64_t a2)
{
  if (result)
  {
    if (a2)
      JUMPOUT(0x1BCCCB178);
  }
  return result;
}

const void *WiFiPortCacheCopy(unsigned int a1)
{
  const void *Value;
  const void *v3;

  pthread_mutex_lock(&__wifiPortCacheLock);
  if (__wifiPortCache)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)__wifiPortCache, (const void *)a1);
    v3 = Value;
    if (Value)
      CFRetain(Value);
  }
  else
  {
    v3 = 0;
  }
  pthread_mutex_unlock(&__wifiPortCacheLock);
  return v3;
}

const void *WiFiManagerClientGetDevice(uint64_t a1, const void *a2)
{
  const void *Value;

  os_unfair_recursive_lock_lock_with_options();
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 64), a2);
  if (!Value && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    WiFiManagerClientGetDevice_cold_1();
  os_unfair_recursive_lock_unlock();
  return Value;
}

uint64_t _WiFiDeviceClientDispatchLQMEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 304);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 312));
  return result;
}

uint64_t wifi_device_set_coex_parameters(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = 3;
  v17 = a2;
  v18 = 27918592;
  v19 = a3;
  v20 = a4;
  v21 = 27918592;
  v22 = a5;
  v23 = a6;
  v24 = 27918592;
  v25 = a7;
  v26 = *MEMORY[0x1E0C804E8];
  v27 = a3;
  v28 = a5;
  v29 = a7;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1106D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (msg.msgh_id == 69841)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v13 = 1;
            else
              v13 = HIDWORD(v17) == 0;
            if (v13)
              v12 = 4294966996;
            else
              v12 = HIDWORD(v17);
            goto LABEL_22;
          }
        }
        v12 = 4294966996;
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

void _WiFiDeviceClientDispatchCatsUpdateEvent(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 352);
  if (v2)
    v2(a1, a2, *(_QWORD *)(a1 + 360));
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

void _WiFiDeviceClientDispatchScanUpdateEvent(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  CFTypeID v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFTypeID v9;
  __CFArray *NetworksFromRecords;
  void (*v11)(uint64_t, const void *, __CFArray *, _QWORD, _QWORD);

  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("scanRequest"));
    if (Value
      && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFDictionaryGetTypeID())
      && (v7 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("scanResults"))) != 0
      && (v8 = v7, v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
    {
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v8);
      v11 = *(void (**)(uint64_t, const void *, __CFArray *, _QWORD, _QWORD))(a1 + 256);
      if (v11)
        v11(a1, v5, NetworksFromRecords, 0, *(_QWORD *)(a1 + 264));
      if (NetworksFromRecords)
        CFRelease(NetworksFromRecords);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
}

__CFArray *_WiFiCreateNetworksFromRecordsWithRSSIBounds(const __CFArray *a1, int a2, int a3)
{
  uint64_t v6;
  CFMutableArrayRef Mutable;
  __CFArray *v8;
  CFIndex Count;
  CFIndex v10;
  CFIndex i;
  const void *ValueAtIndex;
  _WORD *v13;
  const void *v14;
  float v15;
  float v16;
  double v17;

  v6 = *MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v8 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        v10 = Count;
        for (i = 0; i != v10; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            v13 = WiFiNetworkCreate(v6, ValueAtIndex);
            if (v13)
            {
              v14 = v13;
              if (a2 != a3)
              {
                v15 = (float)(int)WiFiNetworkGetIntProperty((uint64_t)v13, CFSTR("RSSI")) + 77.5;
                v16 = fabsf(sqrtf((float)(v15 * v15) + 450.0));
                v17 = (float)((float)(v15 / (float)(v16 + v16)) + 0.5);
                WiFiNetworkSetFloatProperty((uint64_t)v14, CFSTR("ScaledRSSI"), v17);
                WiFiNetworkSetFloatProperty((uint64_t)v14, CFSTR("ScaledRate"), 1.0);
                WiFiNetworkSetFloatProperty((uint64_t)v14, CFSTR("Strength"), v17);
              }
              CFArrayAppendValue(v8, v14);
              CFRelease(v14);
            }
          }
        }
      }
    }
  }
  return v8;
}

_WORD *WiFiDeviceClientCopyCurrentNetwork(uint64_t a1)
{
  const char *v2;
  int v3;
  const UInt8 *BytePtr;
  int v5;
  CFPropertyListRef v6;
  const void *v7;
  _WORD *v8;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v2 = getprogname();
  if (!strncmp("SpringBoard", v2, 0xBuLL) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    WiFiDeviceClientCopyCurrentNetwork_cold_1(a1);
  v3 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v5 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_current_network(v3, (uint64_t)BytePtr, v5, &length[1], length);
  v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (v6)
  {
    v7 = v6;
    v8 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v6);
    CFRelease(v7);
  }
  else
  {
    v8 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v8;
}

_WORD *WiFiNetworkCreate(int a1, CFTypeRef cf)
{
  CFTypeID v3;
  const __CFString *Value;
  CFTypeID TypeID;
  const void *v6;
  const void *v7;
  CFTypeID v8;
  uint64_t Instance;
  _WORD *v10;
  CFMutableDictionaryRef *v11;
  const __CFAllocator *v12;
  const __CFDictionary *MutableCopy;
  const void *v14;
  BOOL v15;
  const void *v16;

  if (cf)
  {
    v3 = CFGetTypeID(cf);
    if (v3 != CFDictionaryGetTypeID())
      goto LABEL_25;
    Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("SSID_STR"));
    if (Value)
    {
      TypeID = CFStringGetTypeID();
      if (TypeID != CFGetTypeID(Value))
        return 0;
    }
    if (!WiFiNetworkIsSSIDLengthValid(Value) && !CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("DomainName")))
    {
LABEL_25:
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      return 0;
    }
    v6 = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("SSID"));
    if (v6)
    {
      v7 = v6;
      v8 = CFDataGetTypeID();
      if (v8 != CFGetTypeID(v7))
        return 0;
    }
  }
  if (!__kWiFiNetworkTypeID)
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
  Instance = _CFRuntimeCreateInstance();
  v10 = (_WORD *)Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    v11 = (CFMutableDictionaryRef *)(Instance + 16);
    v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (cf)
      MutableCopy = CFDictionaryCreateMutableCopy(v12, 0, (CFDictionaryRef)cf);
    else
      MutableCopy = CFDictionaryCreateMutable(v12, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    *v11 = MutableCopy;
    if (MutableCopy)
    {
      v14 = CFDictionaryGetValue(MutableCopy, CFSTR("HIDDEN_NETWORK"));
      if (v14)
        v15 = v14 == (const void *)*MEMORY[0x1E0C9AE50];
      else
        v15 = 0;
      if (v15)
      {
        v16 = v14;
        CFDictionaryRemoveValue(*v11, CFSTR("HIDDEN_NETWORK"));
        CFDictionarySetValue(*v11, CFSTR("UserDirected"), v16);
      }
      v10[12] = -1;
      return v10;
    }
    CFRelease(v10);
    return 0;
  }
  return v10;
}

BOOL WiFiNetworkIsSSIDLengthValid(const __CFString *a1)
{
  if (!a1)
    return 1;
  if (CFEqual(a1, CFSTR("_AppleWi-FiInternetTetheringSSID_")))
    return 1;
  return CFStringGetLength(a1) < 33;
}

uint64_t wifi_device_copy_current_network(int a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  __int128 v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[24];
  uint64_t v16;
  int v17;
  int v18;
  _BYTE v19[20];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_name = v8;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  *(_QWORD *)v19 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v19[8] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v14 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x1107000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69844)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_24;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

__CFArray *_WiFiCreateNetworksFromRecords(const __CFArray *a1)
{
  return _WiFiCreateNetworksFromRecordsWithRSSIBounds(a1, 0, 0);
}

uint64_t _Xwifi_manager_client_dispatch_scan_results(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          result = _wifi_manager_client_dispatch_scan_results(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    v5 = -300;
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _wifi_manager_client_dispatch_scan_results(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  const void *v11;
  const void *v12;
  CFPropertyListRef v13;
  const void *v14;
  const void *Device;
  uint64_t v16;
  const __CFArray *v17;
  const __CFArray *v18;
  CFTypeID v19;
  __CFArray *NetworksFromRecords;

  v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    v12 = v11;
    v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        v16 = (uint64_t)Device;
        v17 = (const __CFArray *)_WiFiCopyUnserialized(a4, a5);
        if (v17)
        {
          v18 = v17;
          v19 = CFGetTypeID(v17);
          if (v19 == CFArrayGetTypeID())
          {
            NetworksFromRecords = _WiFiCreateNetworksFromRecords(v18);
            _WiFiDeviceClientDispatchScanResults(v16, (uint64_t)NetworksFromRecords, a6);
            if (NetworksFromRecords)
              CFRelease(NetworksFromRecords);
          }
          else
          {
            objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
            _WiFiDeviceClientDispatchScanResults(v16, 0, a6);
          }
          CFRelease(v18);
        }
        else
        {
          _WiFiDeviceClientDispatchScanResults(v16, 0, a6);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0;
}

uint64_t _WiFiDeviceClientDispatchScanResults(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, _QWORD);

  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 160);
  if (v3)
    return v3(result, a2, a3, *(_QWORD *)(result + 168));
  return result;
}

uint64_t WiFiDeviceClientRegisterScanUpdateCallback(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;

  *(_QWORD *)(a1 + 256) = a2;
  *(_QWORD *)(a1 + 264) = a4;
  v4 = 128;
  if (a3 == 1)
    v4 = 256;
  if (a2)
    v5 = *(_QWORD *)(a1 + 64) | v4;
  else
    v5 = *(_QWORD *)(a1 + 64) & ~v4;
  *(_QWORD *)(a1 + 64) = v5;
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void WiFiManagerClientRegisterDeviceAttachmentCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 128) = a2;
  *(_QWORD *)(a1 + 136) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 4);
  else
    __WiFiManagerClientAndEventMask(a1, -5);
}

_QWORD *WiFiManagerClientRegisterServerRestartCallback(_QWORD *result, uint64_t a2, uint64_t a3)
{
  result[28] = a2;
  result[29] = a3;
  result[9] = result[9] & 0xFFFFFFFFFFFEFFFFLL | ((unint64_t)(a2 != 0) << 16);
  return result;
}

uint64_t WiFiDeviceClientRegisterPowerCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 144) = a2;
  *(_QWORD *)(a1 + 152) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFFELL | (a2 != 0);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiNetworkGetTypeID()
{
  uint64_t result;

  result = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    return __kWiFiNetworkTypeID;
  }
  return result;
}

uint64_t WiFiDeviceClientRegisterLQMCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 304) = a2;
  *(_QWORD *)(a1 + 312) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFBFFFLL | ((unint64_t)(a2 != 0) << 14);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t wifi_manager_is_wpa3_personal_supported(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110A700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69899)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_wpa3_enterprise_supported(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110A900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69901)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_restriction_policy_active(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1108E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69874)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_power_modification_disabled(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110B700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69915)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_mfp_capable_device(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110AA00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69902)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_managed_apple_id(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110B800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69916)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_close(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69691;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t __WiFiManagerClientRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __wiFiManagerTypeID = result;
  return result;
}

void __WiFiManagerClientAndEventMask(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  unsigned int *v4;

  *(_QWORD *)(a1 + 72) &= a2;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v4 = v3;
  if (v3)
    wifi_manager_set_event_mask(v3[1], *(_QWORD *)(a1 + 72));
  WiFiSendRightRelease(v4);
}

void __WiFiMIGMachPortRelease(uint64_t a1)
{
  __CFMachPort *v2;
  const void *v3;
  const void *v4;

  v2 = *(__CFMachPort **)(a1 + 56);
  if (v2)
  {
    CFMachPortInvalidate(v2);
    v3 = *(const void **)(a1 + 56);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 56) = 0;
    }
  }
  v4 = *(const void **)(a1 + 48);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 48) = 0;
  }
}

CFMutableDictionaryRef __WiFiMIGMachPortRegister()
{
  CFMutableDictionaryRef result;

  __WiFiMIGMachPortTypeID = _CFRuntimeRegisterClass();
  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  __wifiPortCache = (uint64_t)result;
  return result;
}

uint64_t __WiFiDeviceClientRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __wiFiDeviceTypeID = result;
  return result;
}

uint64_t _WiFiDeviceClientDispatchWeightAvgLQMEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 320);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 328));
  return result;
}

uint64_t WiFiPortCacheRemove(unsigned int a1)
{
  pthread_mutex_lock(&__wifiPortCacheLock);
  if (__wifiPortCache)
    CFDictionaryRemoveValue((CFMutableDictionaryRef)__wifiPortCache, (const void *)a1);
  return pthread_mutex_unlock(&__wifiPortCacheLock);
}

void WiFiManagerClientUnscheduleFromRunLoop(uint64_t a1)
{
  __CFRunLoop *v1;
  _QWORD *v2;
  const __CFString *v4;
  __CFRunLoopSource *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v2 = (_QWORD *)(a1 + 48);
  v1 = *(__CFRunLoop **)(a1 + 48);
  if (v1 && (v4 = *(const __CFString **)(a1 + 56)) != 0)
  {
    WiFiMIGMachPortUnscheduleFromRunLoop(*(_QWORD *)(a1 + 40), v1, v4);
    v5 = *(__CFRunLoopSource **)(a1 + 104);
    if (v5)
    {
      if (*(_QWORD *)(a1 + 96))
        CFRunLoopRemoveSource(*(CFRunLoopRef *)(a1 + 48), v5, *(CFRunLoopMode *)(a1 + 56));
    }
    *v2 = 0;
    v2[1] = 0;
  }
  else
  {
    v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v6)
      WiFiManagerClientUnscheduleFromRunLoop_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
  }
}

void WiFiManagerClientRegisterPreferredNetworksChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 288) = a2;
  *(_QWORD *)(a1 + 296) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 0x20000000);
  else
    __WiFiManagerClientAndEventMask(a1, -536870913);
}

void WiFiManagerClientRegisterNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 112) = a2;
  *(_QWORD *)(a1 + 120) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 32);
  else
    __WiFiManagerClientAndEventMask(a1, -33);
}

void WiFiManagerClientRegisterManagedAppleIDStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 304) = a2;
  *(_QWORD *)(a1 + 312) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 0x100000000);
  else
    __WiFiManagerClientAndEventMask(a1, 0xFFFFFFFEFFFFFFFFLL);
}

uint64_t WiFiManagerClientIsWPA3PersonalSupported(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_wpa3_personal_supported(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsWPA3EnterpriseSupported(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_wpa3_enterprise_supported(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsRestrictionPolicyActive(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_restriction_policy_active(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsPowerModificationDisabled(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_power_modification_disabled(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsMfpCapableDevice(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_mfp_capable_device(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsManagedAppleID(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_managed_apple_id(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiMIGMachPortUnscheduleFromRunLoop(uint64_t a1, __CFRunLoop *cf1, const __CFString *a3)
{
  const void *v6;
  _QWORD *v7;
  __CFRunLoopSource *v8;
  const void *v9;

  if (cf1)
  {
    if (a3)
    {
      v7 = (_QWORD *)(a1 + 32);
      v6 = *(const void **)(a1 + 32);
      if (v6)
      {
        if (*(_QWORD *)(a1 + 40))
        {
          if (CFEqual(cf1, v6))
          {
            if (CFEqual(a3, *(CFTypeRef *)(a1 + 40)))
            {
              *v7 = 0;
              v7[1] = 0;
              v8 = *(__CFRunLoopSource **)(a1 + 48);
              if (v8)
              {
                CFRunLoopRemoveSource(cf1, v8, a3);
                v9 = *(const void **)(a1 + 48);
                if (v9)
                {
                  CFRelease(v9);
                  *(_QWORD *)(a1 + 48) = 0;
                }
              }
            }
          }
        }
      }
    }
  }
}

uint64_t WiFiDeviceClientScanCancel(uint64_t result)
{
  *(_QWORD *)(result + 160) = 0;
  *(_QWORD *)(result + 168) = 0;
  return result;
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 496) = a2;
  *(_QWORD *)(a1 + 504) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFF7FFFFLL | ((unint64_t)(a2 != 0) << 19);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterCarPlayNetworkTypeChangeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 416) = a2;
  *(_QWORD *)(a1 + 424) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFDFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 37);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBssidChangeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 272) = a2;
  *(_QWORD *)(a1 + 280) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFBFFLL | ((unint64_t)(a2 != 0) << 10);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiPolicyGetTypeID()
{
  uint64_t result;

  result = __kWiFiPolicyTypeID;
  if (!__kWiFiPolicyTypeID)
  {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
    return __kWiFiPolicyTypeID;
  }
  return result;
}

uint64_t __WiFiPolicyRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kWiFiPolicyTypeID = result;
  return result;
}

_QWORD *WiFiPolicyCreate(const __CFAllocator *a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  CFTypeID TypeID;
  uint64_t Instance;
  _QWORD *v8;
  CFMutableDictionaryRef v9;

  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("PolicyType"));
    if (Value)
    {
      v5 = Value;
      TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v5))
        return 0;
    }
  }
  if (!__kWiFiPolicyTypeID)
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
  Instance = _CFRuntimeCreateInstance();
  v8 = (_QWORD *)Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    v9 = theDict
       ? CFDictionaryCreateMutableCopy(a1, 0, theDict)
       : CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    v8[2] = v9;
    if (!v9)
    {
      CFRelease(v8);
      return 0;
    }
  }
  return v8;
}

_QWORD *WiFiPolicyCreateExtended(const __CFAllocator *a1, const void *a2, const void *a3, const void *a4)
{
  __CFDictionary *Mutable;
  __CFDictionary *v9;
  const __CFUUID *v10;
  CFStringRef v11;
  _QWORD *v12;
  const __CFUUID *v14;

  if (!a2)
    return 0;
  Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 0;
  v9 = Mutable;
  CFDictionaryAddValue(Mutable, CFSTR("PolicyType"), a2);
  if (a3)
  {
    CFDictionaryAddValue(v9, CFSTR("PolicyUUID"), a3);
    v10 = 0;
    v11 = 0;
    if (!a4)
    {
LABEL_6:
      v12 = WiFiPolicyCreate(a1, v9);
      if (v11)
        CFRelease(v11);
      if (v10)
        CFRelease(v10);
      goto LABEL_10;
    }
LABEL_5:
    CFDictionaryAddValue(v9, CFSTR("PolicyProperties"), a4);
    goto LABEL_6;
  }
  v14 = CFUUIDCreate(a1);
  if (v14)
  {
    v10 = v14;
    v11 = CFUUIDCreateString(a1, v14);
    CFDictionaryAddValue(v9, CFSTR("PolicyUUID"), v11);
    if (!a4)
      goto LABEL_6;
    goto LABEL_5;
  }
  v12 = 0;
LABEL_10:
  CFRelease(v9);
  return v12;
}

void WiFiPolicySetUUID(uint64_t a1, void *value)
{
  if (a1)
  {
    if (value)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("PolicyUUID"), value);
  }
}

const void *WiFiPolicyGetUUID(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("PolicyUUID"));
}

void WiFiPolicySetType(uint64_t a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (v3)
  {
    v4 = v3;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("PolicyType"), v3);
    CFRelease(v4);
  }
}

uint64_t WiFiPolicyGetType(uint64_t a1)
{
  uint64_t v1;
  const __CFNumber *Value;
  unsigned int valuePtr;

  v1 = 0xFFFFFFFFLL;
  valuePtr = -1;
  Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("PolicyType"));
  if (Value)
  {
    CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v1;
}

void WiFiPolicySetProperty(uint64_t a1, const void *a2, const void *a3)
{
  __CFDictionary *Value;

  Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("PolicyProperties"));
  if (Value)
  {
    if (a3)
      CFDictionarySetValue(Value, a2, a3);
    else
      CFDictionaryRemoveValue(Value, a2);
  }
}

const __CFDictionary *WiFiPolicyGetProperty(uint64_t a1, const void *a2)
{
  const __CFDictionary *result;

  result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("PolicyProperties"));
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, a2);
  return result;
}

CFDictionaryRef WiFiPolicyCopyRecord(uint64_t a1)
{
  return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFDictionaryRef *)(a1 + 16));
}

__CFArray *WiFiCreatePoliciesFromRecords(const __CFArray *a1)
{
  const __CFAllocator *v2;
  CFMutableArrayRef Mutable;
  __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  _QWORD *v9;
  const void *v10;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v4 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        v6 = Count;
        for (i = 0; i != v6; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            v9 = WiFiPolicyCreate(v2, ValueAtIndex);
            if (v9)
            {
              v10 = v9;
              CFArrayAppendValue(v4, v9);
              CFRelease(v10);
            }
          }
        }
      }
    }
  }
  return v4;
}

__CFArray *WiFiCreateRecordsFromPolicies(const __CFArray *a1)
{
  const __CFAllocator *v2;
  CFMutableArrayRef Mutable;
  __CFArray *v4;
  CFIndex Count;
  CFIndex v6;
  CFIndex i;
  CFDictionaryRef *ValueAtIndex;
  CFDictionaryRef Copy;
  CFDictionaryRef v10;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v4 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        v6 = Count;
        for (i = 0; i != v6; ++i)
        {
          ValueAtIndex = (CFDictionaryRef *)CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            Copy = CFDictionaryCreateCopy(v2, ValueAtIndex[2]);
            if (Copy)
            {
              v10 = Copy;
              CFArrayAppendValue(v4, Copy);
              CFRelease(v10);
            }
          }
        }
      }
    }
  }
  return v4;
}

void __WiFiPolicyRelease(_QWORD *a1)
{
  CFTypeID v2;
  uint64_t v3;
  const void *v4;

  if (!a1)
    __WiFiPolicyRelease_cold_1();
  v2 = CFGetTypeID(a1);
  v3 = __kWiFiPolicyTypeID;
  if (!__kWiFiPolicyTypeID)
  {
    pthread_once(&__gWiFiPolicyTypeInit, (void (*)(void))__WiFiPolicyRegister);
    v3 = __kWiFiPolicyTypeID;
  }
  if (v2 != v3)
    __WiFiPolicyRelease_cold_2();
  v4 = (const void *)a1[2];
  if (v4)
  {
    CFRelease(v4);
    a1[2] = 0;
  }
}

BOOL __WiFiPolicyEqual(uint64_t a1, uint64_t a2)
{
  const __CFString *Value;
  const __CFString *v4;
  BOOL v5;

  Value = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("PolicyUUID"));
  v4 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), CFSTR("PolicyUUID"));
  if (Value)
    v5 = v4 == 0;
  else
    v5 = 1;
  return !v5 && CFStringCompare(Value, v4, 0) == kCFCompareEqualTo;
}

CFStringRef __WiFiPolicyCopyFormattingDesc(uint64_t a1, const __CFDictionary *a2)
{
  const __CFAllocator *v4;
  uint64_t Type;
  const void *Value;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Type = WiFiPolicyGetType(a1);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("PolicyUUID"));
  return CFStringCreateWithFormat(v4, a2, CFSTR("%d %@"), Type, Value);
}

CFStringRef __WiFiPolicyCopyDebugDesc(uint64_t a1)
{
  const __CFAllocator *v2;
  uint64_t Type;
  const void *Value;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Type = WiFiPolicyGetType(a1);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("PolicyUUID"));
  return CFStringCreateWithFormat(v2, 0, CFSTR("%d %@"), Type, Value);
}

uint64_t _WiFiPreferenceLockSetDispatchQueue(uint64_t result)
{
  _queue = result;
  return result;
}

const __SCPreferences *_WiFiPreferencesLock(const __SCPreferences *prefs)
{
  const __SCPreferences *v1;
  int v2;
  const char *v3;

  if (prefs)
  {
    v1 = prefs;
    if (_queue)
      dispatch_assert_queue_V2((dispatch_queue_t)_queue);
    prefs = (const __SCPreferences *)SCPreferencesLock(v1, 1u);
    if (!(_DWORD)prefs)
    {
      SCPreferencesSynchronize(v1);
      prefs = (const __SCPreferences *)SCPreferencesLock(v1, 1u);
      if (!(_DWORD)prefs)
      {
        v2 = SCError();
        v3 = SCErrorString(v2);
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v3));
        return 0;
      }
    }
  }
  return prefs;
}

uint64_t _WiFiPreferencesUnlock(SCPreferencesRef prefs, int a2)
{
  int v4;
  const char *v5;
  uint64_t v6;
  int v7;
  const char *v8;

  if (_queue)
    dispatch_assert_queue_V2((dispatch_queue_t)_queue);
  if (a2 && (!SCPreferencesCommitChanges(prefs) || !SCPreferencesApplyChanges(prefs)))
  {
    v4 = SCError();
    v5 = SCErrorString(v4);
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v5));
  }
  v6 = SCPreferencesUnlock(prefs);
  if (!(_DWORD)v6)
  {
    v7 = SCError();
    v8 = SCErrorString(v7);
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v8));
  }
  return v6;
}

__CFArray *_WiFiCreateRecordsFromNetworks(const __CFArray *a1)
{
  return _WiFiCreateRecordsFromNetworksWithType(a1, 0);
}

__CFArray *_WiFiCreateRecordsFromNetworksWithType(const __CFArray *a1, int a2)
{
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  const __CFDictionary *v10;
  const __CFDictionary *v11;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v5 = Mutable;
  if (a1)
  {
    if (Mutable)
    {
      Count = CFArrayGetCount(a1);
      if (Count >= 1)
      {
        v7 = Count;
        for (i = 0; v7 != i; ++i)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
          if (ValueAtIndex)
          {
            if (a2 == 1)
            {
              v10 = WiFiNetworkCopyFilteredRecord((uint64_t)ValueAtIndex);
LABEL_10:
              v11 = v10;
              if (v10)
              {
                CFArrayAppendValue(v5, v10);
                CFRelease(v11);
              }
              continue;
            }
            if (!a2)
            {
              v10 = WiFiNetworkCopyRecord((uint64_t)ValueAtIndex);
              goto LABEL_10;
            }
          }
        }
      }
    }
  }
  return v5;
}

float _WiFiScaleRSSI(int a1)
{
  float v1;
  float v2;

  v1 = (float)a1 + 77.5;
  v2 = fabsf(sqrtf((float)(v1 * v1) + 450.0));
  return (float)(v1 / (float)(v2 + v2)) + 0.5;
}

__CFArray *_WiFiCopyEnabledNetworks(const __CFArray *a1)
{
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v7;

  if (!a1)
    return 0;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    Count = CFArrayGetCount(a1);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(a1, i);
        if (ValueAtIndex)
        {
          v7 = ValueAtIndex;
          if (WiFiNetworkIsEnabled((uint64_t)ValueAtIndex))
            CFArrayAppendValue(Mutable, v7);
        }
      }
    }
    if (!CFArrayGetCount(Mutable))
    {
      CFRelease(Mutable);
      return 0;
    }
  }
  return Mutable;
}

void _WiFiSerialize(const void *a1, vm_offset_t *a2, mach_msg_type_number_t *a3)
{
  const __CFData *BinaryData;
  const __CFData *v6;
  vm_map_read_t v7;
  const UInt8 *BytePtr;
  kern_return_t v9;
  mach_msg_type_number_t dataCnt;

  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a1);
  if (BinaryData)
  {
    v6 = BinaryData;
    dataCnt = -1431655766;
    *a3 = CFDataGetLength(BinaryData);
    v7 = *MEMORY[0x1E0C83DA0];
    BytePtr = CFDataGetBytePtr(v6);
    v9 = vm_read(v7, (vm_address_t)BytePtr, *a3, a2, &dataCnt);
    CFRelease(v6);
    if (v9)
      *a2 = 0;
    *a3 = dataCnt;
  }
}

CFMutableArrayRef _CFArrayCreateMutableCopyOfCFDictionary(const __CFDictionary *a1)
{
  CFMutableArrayRef Mutable;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
    CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)__CFArrayCreateMutableCopyOfCFDictionaryApplier, Mutable);
  return Mutable;
}

void __CFArrayCreateMutableCopyOfCFDictionaryApplier(int a1, const void *a2, CFMutableArrayRef theArray)
{
  CFArrayAppendValue(theArray, a2);
}

CFMutableArrayRef _CFArrayCreateMutableCopyOfCFSet(const __CFSet *a1)
{
  CFMutableArrayRef Mutable;

  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
    CFSetApplyFunction(a1, (CFSetApplierFunction)__CFArrayCreateMutableCopyOfCFSetApplier, Mutable);
  return Mutable;
}

void __CFArrayCreateMutableCopyOfCFSetApplier(void *value, CFMutableArrayRef theArray)
{
  CFArrayAppendValue(theArray, value);
}

CFMutableSetRef _CFSetCreateMutableCopyOfCFArray(const __CFArray *a1)
{
  CFMutableSetRef Mutable;
  CFRange v4;

  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B3B0]);
  if (Mutable)
  {
    v4.length = CFArrayGetCount(a1);
    v4.location = 0;
    CFArrayApplyFunction(a1, v4, (CFArrayApplierFunction)__CFSetCreateMutableCopyOfCFArrayApplier, Mutable);
  }
  return Mutable;
}

void __CFSetCreateMutableCopyOfCFArrayApplier(void *value, CFMutableSetRef theSet)
{
  CFSetAddValue(theSet, value);
}

float _WiFiScale(uint64_t a1, uint64_t a2, uint64_t a3)
{
  float result;

  result = (float)(a1 - a2) / (float)(a3 - a2);
  if (result > 1.0)
    result = 1.0;
  if (result < 0.0)
    return 0.0;
  return result;
}

double _CFTypeGetFloatValue(const void *a1)
{
  double v1;
  CFTypeID v3;
  double valuePtr;

  valuePtr = 0.0;
  v1 = 0.0;
  if (a1)
  {
    v3 = CFGetTypeID(a1);
    if (v3 == CFNumberGetTypeID())
    {
      CFNumberGetValue((CFNumberRef)a1, kCFNumberDoubleType, &valuePtr);
      return valuePtr;
    }
  }
  return v1;
}

void _CFDictionarySetIntValue(__CFDictionary *a1, const void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

void _CFDictinoarySetFloatValue(__CFDictionary *a1, const void *a2, double a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  double valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    CFDictionarySetValue(a1, a2, v5);
    CFRelease(v6);
  }
}

BOOL _CFValidateType(uint64_t a1, CFTypeRef cf)
{
  return cf && CFGetTypeID(cf) == a1;
}

const char *powerStateToString(unsigned int a1)
{
  if (a1 > 4)
    return "UNKNOWN";
  else
    return off_1E713B718[a1];
}

double getEpochTimeInMicroseconds()
{
  timeval v1;

  v1.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v1.tv_usec = 0xAAAAAAAAAAAAAAAALL;
  gettimeofday(&v1, 0);
  return (double)v1.tv_usec + (double)v1.tv_sec * 1000000.0;
}

uint64_t isAppleOUI(unsigned __int16 *a1)
{
  uint64_t v1;

  v1 = 0;
  while (*(unsigned __int16 *)&algn_1B9BCED6B[v1] != *a1 || algn_1B9BCED6B[v1 + 2] != *((_BYTE *)a1 + 2))
  {
    v1 += 3;
    if (v1 == 33)
      return 0;
  }
  return 1;
}

void *WiFiCopyTomorrowDateFromComponents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v8 = (void *)MEMORY[0x1BCCCB058]();
  v9 = objc_alloc_init(MEMORY[0x1E0CB34A8]);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "setHour:", a2);
  objc_msgSend(v10, "setMinute:", a3);
  objc_msgSend(v10, "setSecond:", a4);
  v11 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar"), "nextDateAfterDate:matchingComponents:options:", a1, v10, 1024);
  v12 = v11;
  if (v11)
    v13 = v11;

  objc_msgSend(v9, "drain");
  objc_autoreleasePoolPop(v8);
  return v12;
}

void *_WiFiReallocArray(void *a1, unint64_t a2, unint64_t a3)
{
  if (is_mul_ok(a2, a3))
    return malloc_type_realloc(a1, a2 * a3, 0x939E6BCFuLL);
  *__error() = 12;
  return 0;
}

uint64_t WiFiCreateOSTransactionWithFunctionName(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  v2 = (void *)MEMORY[0x1BCCCB058]();
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.wifid.%s"), a1), "UTF8String");
  v3 = os_transaction_create();
  objc_autoreleasePoolPop(v2);
  return v3;
}

const __CFString *WiFiGetLinkChangeReasonString(int a1)
{
  const __CFString *result;
  int v2;

  switch(a1)
  {
    case 1000:
      result = CFSTR("Trigger Disconnect");
      break;
    case 1001:
      result = CFSTR("Client Disconnect");
      break;
    case 1002:
      result = CFSTR("Temporarily Disabled");
      break;
    case 1003:
      result = CFSTR("Network Changed");
      break;
    case 1004:
      result = CFSTR("Decryption Failure");
      break;
    case 1005:
      result = CFSTR("Not Primary Interface");
      break;
    case 1006:
      result = CFSTR("CLTM");
      break;
    case 1007:
      result = CFSTR("Internet Sharing");
      break;
    case 1008:
      result = CFSTR("User Preference");
      break;
    case 1009:
      result = CFSTR("Misc.");
      break;
    case 1010:
      result = CFSTR("EAP Restart");
      break;
    case 1011:
      result = CFSTR("Control Center/3rd Party Client");
      break;
    case 1012:
      result = CFSTR("802.1X Failure");
      break;
    case 1013:
      result = CFSTR("Network Transition");
      break;
    case 1014:
      result = CFSTR("Auto Unlock");
      break;
    case 1015:
      result = CFSTR("Captive");
      break;
    case 1016:
      result = CFSTR("Banner Association");
      break;
    case 1017:
      result = CFSTR("BSS Steering");
      break;
    case 1018:
      result = CFSTR("Auto Hotspot Association");
      break;
    case 1019:
      result = CFSTR("Auto Hotspot Transition");
      break;
    case 1020:
      result = CFSTR("Perf Roam");
      break;
    case 1021:
      result = CFSTR("CarPlay Disabled");
      break;
    case 1022:
      result = CFSTR("Battery Save Mode Enabled");
      break;
    case 1023:
      result = CFSTR("AirPlay Started");
      break;
    case 1024:
      result = CFSTR("Prefer 6E Off");
      break;
    case 1025:
      result = CFSTR("Prefer 6E On");
      break;
    default:
      v2 = a1 - 1;
      result = CFSTR("Deauth");
      switch(v2)
      {
        case 0:
          return result;
        case 1:
          result = CFSTR("Beacon Lost");
          break;
        case 2:
          result = CFSTR("Internal Error");
          break;
        case 3:
          result = CFSTR("System Sleep");
          break;
        case 4:
          result = CFSTR("Powered Off");
          break;
        case 5:
          result = CFSTR("Join Failure");
          break;
        case 6:
          result = CFSTR("Colocated scope transition");
          break;
        case 7:
          result = CFSTR("Disassociate");
          break;
        case 8:
          result = CFSTR("Invalid SSID");
          break;
        default:
          result = CFSTR("Unknown");
          break;
      }
      break;
  }
  return result;
}

const __CFString *WiFiGetConcurrencyStateString(unsigned int a1)
{
  const __CFString *v1;

  if (a1 < 9 && ((0x117u >> a1) & 1) != 0)
    return off_1E713B740[a1];
  v1 = CFSTR("Unknown");
  if ((~a1 & 3) == 0)
    v1 = CFSTR("STA + AWDL");
  if ((~a1 & 5) == 0)
    v1 = CFSTR("STA + SoftAP");
  if ((~a1 & 6) == 0)
    v1 = CFSTR("AWDL + SoftAP");
  if ((~a1 & 7) == 0)
    v1 = CFSTR("STA + AWDL + SoftAP");
  if ((~a1 & 0xC) == 0)
    v1 = CFSTR("SoftAp + NanPh");
  if ((~a1 & 0xE) != 0)
    return v1;
  else
    return CFSTR("AWDL + SoftAp + NanPh");
}

const __CFString *WiFiGetRoamEnvironmentTypeString(unsigned int a1)
{
  if (a1 > 6)
    return CFSTR("Unknown");
  else
    return off_1E713B788[a1];
}

const __CFString *WiFiGetRoamProfileOffsetString(unsigned int a1)
{
  if (a1 > 3)
    return CFSTR("Unknown");
  else
    return off_1E713B7C0[a1];
}

const __CFString *WiFiGetNOIHomeStateString(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 2)
    v1 = CFSTR("Not Home");
  if (a1 == 1)
    return CFSTR("Home");
  else
    return v1;
}

const __CFString *WiFiGetNOIWorkStateString(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 2)
    v1 = CFSTR("Not Work");
  if (a1 == 1)
    return CFSTR("Work");
  else
    return v1;
}

const __CFString *WiFiGetLowDataModeString(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E713B7E0[a1];
}

const __CFString *WiFiGetLOITypeString(int a1)
{
  if ((a1 - 1) > 4)
    return CFSTR("Unknown");
  else
    return off_1E713B7F8[a1 - 1];
}

const __CFString *WiFiGetAutoInstantHotspotModeString(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E713B820[a1];
}

const __CFString *WiFiGetClientDisconnectReasonString(int a1)
{
  const __CFString *v1;

  v1 = CFSTR("Unknown");
  if (a1 == 2)
    v1 = CFSTR("Captive");
  if (a1 == 1)
    return CFSTR("Control Center");
  else
    return v1;
}

const __CFString *WiFiGetUINotificationTypeString(unsigned int a1)
{
  if (a1 > 0xD)
    return CFSTR("Unknown");
  else
    return off_1E713B838[a1];
}

BOOL WiFiGetRtTrafficType(const __CFString *a1)
{
  return CFStringFind(a1, CFSTR("facetime"), 1uLL).length != 0;
}

const __CFString *WiFiGetAssocTypeString(unsigned int a1)
{
  if (a1 > 2)
    return CFSTR("Unknown");
  else
    return off_1E713B8A8[a1];
}

const __CFData *WiFiIsPrivateMacAddress(const __CFData *result)
{
  const __CFData *v1;
  CFTypeID TypeID;

  if (result)
  {
    v1 = result;
    TypeID = CFDataGetTypeID();
    if (TypeID == CFGetTypeID(v1))
      return (const __CFData *)((*CFDataGetBytePtr(v1) >> 1) & 1);
    else
      return 0;
  }
  return result;
}

uint64_t WiFiIsInterfaceExpensive()
{
  return 0;
}

BOOL WiFiIsSystemWokenByWiFi()
{
  size_t v1;
  char __big[16];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)__big = 0u;
  v3 = 0u;
  v1 = 255;
  sysctlbyname("kern.wakereason", __big, &v1, 0, 0);
  if (!__big[0])
    return 0;
  if (strcasestr(__big, "wlan"))
    return 1;
  return strcasestr(__big, "wifibt") != 0;
}

uint64_t WiFiExtractPerCoreValues(const __CFArray *a1, void *a2, void *a3)
{
  const __CFNumber *ValueAtIndex;
  const __CFNumber *v7;
  unsigned int v8;

  if (a1 && CFArrayGetCount(a1) == 2)
  {
    ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(a1, 0);
    v7 = (const __CFNumber *)CFArrayGetValueAtIndex(a1, 1);
    if (ValueAtIndex)
      CFNumberGetValue(ValueAtIndex, kCFNumberNSIntegerType, a2);
    if (v7)
    {
      CFNumberGetValue(v7, kCFNumberNSIntegerType, a3);
      v8 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    ValueAtIndex = 0;
  }
  v8 = 0;
LABEL_9:
  if (ValueAtIndex)
    return 1;
  else
    return v8;
}

const __CFNumber *WiFiPrivateMacAddressType(const __CFNumber *result)
{
  const __CFNumber *v1;
  CFTypeID TypeID;
  unsigned int valuePtr;

  if (result)
  {
    v1 = result;
    valuePtr = 0;
    TypeID = CFNumberGetTypeID();
    if (TypeID == CFGetTypeID(v1))
    {
      CFNumberGetValue(v1, kCFNumberIntType, &valuePtr);
      return (const __CFNumber *)valuePtr;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

CFNumberRef WiFiCreatePrivateMacAddressType(int a1)
{
  int valuePtr;

  valuePtr = a1;
  return CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t WiFiMIGMachPortGetTypeID()
{
  uint64_t result;

  result = __WiFiMIGMachPortTypeID;
  if (!__WiFiMIGMachPortTypeID)
  {
    pthread_once(&__WiFiMIGMachPortTypeInit, (void (*)(void))__WiFiMIGMachPortRegister);
    return __WiFiMIGMachPortTypeID;
  }
  return result;
}

uint64_t WiFiMIGMachPortScheduleWithQueue(uint64_t a1)
{
  uint64_t result;

  result = dispatch_mach_create_f();
  *(_QWORD *)(a1 + 72) = result;
  if (result)
    return dispatch_mach_connect();
  return result;
}

void __WiFiMIGMachPortDispatchPortCallback(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t, _QWORD);
  uint64_t msg;
  mach_msg_header_t *v5;

  switch(a2)
  {
    case 8:
      dispatch_release(*(dispatch_object_t *)(a1 + 72));
      CFRelease((CFTypeRef)a1);
      break;
    case 7:
      msg = dispatch_mach_msg_get_msg();
      mach_port_mod_refs(*MEMORY[0x1E0C83DA0], *(_DWORD *)(msg + 12), 1u, -1);
      break;
    case 2:
      if (*(_DWORD *)(dispatch_mach_msg_get_msg() + 20) == 70)
      {
        v3 = *(void (**)(uint64_t, _QWORD))(a1 + 96);
        if (v3)
          v3(a1, *(_QWORD *)(a1 + 104));
      }
      else if ((dispatch_mach_mig_demux() & 1) == 0)
      {
        v5 = (mach_msg_header_t *)dispatch_mach_msg_get_msg();
        mach_msg_destroy(v5);
      }
      break;
  }
}

uint64_t WiFiMIGMachPortUnscheduleFromQueue(uint64_t result)
{
  if (result)
  {
    result = *(_QWORD *)(result + 72);
    if (result)
      return dispatch_mach_cancel();
  }
  return result;
}

const void *WiFiPortCacheCopyWithType(unsigned int a1, uint64_t a2)
{
  const void *v3;
  const void *v4;

  v3 = WiFiPortCacheCopy(a1);
  v4 = v3;
  if (v3 && CFGetTypeID(v3) != a2)
  {
    CFRelease(v4);
    return 0;
  }
  return v4;
}

uint64_t WiFiManagerClientGetTypeID()
{
  uint64_t result;

  result = __wiFiManagerTypeID;
  if (!__wiFiManagerTypeID)
  {
    pthread_once(&__wiFiManagerTypeInit, (void (*)(void))__WiFiManagerClientRegister);
    return __wiFiManagerTypeID;
  }
  return result;
}

void __WiFiManagerClientServerTerminationCallback(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  unsigned int *v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int *v7;
  const __CFAllocator *v8;
  __CFMachPort *v9;
  __CFRunLoopSource *RunLoopSource;
  mach_port_t notify_port;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a2, 0);
  *(_DWORD *)(a2 + 336) = 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    __WiFiManagerClientServerTerminationCallback_cold_1();
  WiFiSendRightRelease(v3);
  v4 = __WiFiManagerClientGetOrReconnectServerPort(a2, 1);
  v7 = v4;
  if (v4)
  {
    __WiFiManagerClientAvailableCallback((uint64_t)v4, v5, v6, a2);
LABEL_12:
    WiFiSendRightRelease(v7);
    return;
  }
  if (*(_QWORD *)(a2 + 104) || !*(_QWORD *)(a2 + 48) || !*(_QWORD *)(a2 + 56))
    goto LABEL_12;
  notify_port = -1431655766;
  if (!notify_register_mach_port("com.apple.wifi.manager.available", &notify_port, 0, (int *)(a2 + 88)))
  {
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v9 = (__CFMachPort *)_CFMachPortCreateWithPort();
    *(_QWORD *)(a2 + 96) = v9;
    if (v9)
    {
      RunLoopSource = CFMachPortCreateRunLoopSource(v8, v9, 0);
      *(_QWORD *)(a2 + 104) = RunLoopSource;
      if (RunLoopSource)
      {
        CFRunLoopAddSource(*(CFRunLoopRef *)(a2 + 48), RunLoopSource, *(CFRunLoopMode *)(a2 + 56));
        goto LABEL_12;
      }
    }
  }
}

void WiFiManagerClientDispatchNotificationResponse(uint64_t a1, int a2, int a3, const void *a4)
{
  unsigned int *v7;
  unsigned int *v8;
  const __CFData *BinaryData;
  const __CFData *v10;
  const UInt8 *BytePtr;
  int Length;

  v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    v8 = v7;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4);
    if (BinaryData)
    {
      v10 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v10);
      wifi_manager_dispatch_notification_response(v8[1], a2, a3, (uint64_t)BytePtr, Length);
      WiFiSendRightRelease(v8);
      CFRelease(v10);
    }
    else
    {
      wifi_manager_dispatch_notification_response(v8[1], a2, a3, 0, 0);
      WiFiSendRightRelease(v8);
    }
  }
}

uint64_t WiFiManagerClientIndicateCarPlayHIDEventReceived(uint64_t a1, int a2, int a3, const void *a4)
{
  unsigned int *v7;
  unsigned int *v8;
  const __CFData *BinaryData;
  const __CFData *v10;
  const UInt8 *BytePtr;
  int Length;

  v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    v8 = v7;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a4);
    if (BinaryData)
    {
      v10 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v10);
      wifi_manager_indicate_carplay_hid_event_received(v8[1], a2, a3, (uint64_t)BytePtr, Length);
      WiFiSendRightRelease(v8);
      CFRelease(v10);
    }
    else
    {
      wifi_manager_indicate_carplay_hid_event_received(v8[1], a2, a3, 0, 0);
      WiFiSendRightRelease(v8);
    }
  }
  return 0;
}

unsigned int *WiFiManagerClientSetProperty(uint64_t a1, const void *a2, const __CFData *a3)
{
  unsigned int *result;
  unsigned int *v6;
  const __CFAllocator *v7;
  const __CFData *BinaryData;
  const __CFData *v9;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v12;
  const UInt8 *v13;
  int v14;
  int v15;

  v15 = -3902;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!result)
    return result;
  v6 = result;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v9 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v9);
    if (!a3)
      goto LABEL_8;
  }
  else
  {
    BytePtr = 0;
    Length = 0;
    if (!a3)
    {
LABEL_8:
      v13 = 0;
      v14 = 0;
      goto LABEL_9;
    }
  }
  v12 = (const __CFData *)_CFPropertyListCreateBinaryData(v7, a3);
  a3 = v12;
  if (!v12)
    goto LABEL_8;
  v13 = CFDataGetBytePtr(v12);
  v14 = CFDataGetLength(a3);
LABEL_9:
  wifi_manager_set_property(v6[1], (uint64_t)BytePtr, Length, (uint64_t)v13, v14, &v15);
  WiFiSendRightRelease(v6);
  if (a3)
    CFRelease(a3);
  if (v9)
    CFRelease(v9);
  return (unsigned int *)(v15 == 0);
}

uint64_t __WiFiManagerClientGetRootDevice(uint64_t a1)
{
  const __CFDictionary *v2;
  size_t v3;
  uint64_t *v4;
  uint64_t v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && CFDictionaryGetCount(v2))
  {
    MEMORY[0x1E0C80A78]();
    v4 = (_QWORD *)((char *)v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0));
    memset(v4, 170, v3);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0, (const void **)v4);
    v5 = *v4;
  }
  else
  {
    v5 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v5;
}

uint64_t _WiFiManagerClientGetRunLoop(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t _WiFiManagerClientGetRunLoopMode(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t WiFiManagerClientGetType(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t WiFiManagerClientRegisterVirtInterfaceChangeCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 144) = a2;
  *(_QWORD *)(result + 152) = a3;
  return result;
}

void WiFiManagerClientRegisterWowStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 208) = a2;
  *(_QWORD *)(a1 + 216) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 0x2000);
  else
    __WiFiManagerClientAndEventMask(a1, -8193);
}

void WiFiManagerClientRegisterBackgroundScanCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 160) = a2;
  *(_QWORD *)(a1 + 168) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 512);
  else
    __WiFiManagerClientAndEventMask(a1, -513);
}

void WiFiManagerClientRegisterBackgroundScanCacheCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 176) = a2;
  *(_QWORD *)(a1 + 184) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 0x200000);
  else
    __WiFiManagerClientAndEventMask(a1, -2097153);
}

void WiFiManagerClientRegisterScanBackoffReportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int *v5;
  unsigned int *v6;
  int v7;

  *(_QWORD *)(a1 + 192) = a2;
  *(_QWORD *)(a1 + 200) = a3;
  v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    v6 = v5;
    if (a2)
    {
      __WiFiManagerClientOrEventMask(a1, 0x2000000);
      v7 = 1;
    }
    else
    {
      __WiFiManagerClientAndEventMask(a1, -33554433);
      v7 = 0;
    }
    wifi_manager_set_scan_backoff_report(v6[1], v7);
    WiFiSendRightRelease(v6);
  }
}

void WiFiManagerClientSetAssociationMode(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_association_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetAssociationMode(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v4;

  v4 = 1;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_association_mode(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetAskToJoinPreference(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_asktojoin_preference(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetAskToJoinPreference(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v4;

  v4 = 1;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_asktojoin_preference(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientEnable(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_set_enable_state(v1[1], 1);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientDisable(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_set_enable_state(v1[1], 0);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientSetPower(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_power(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

BOOL WiFiManagerClientGetPower(uint64_t a1)
{
  return WiFiManagerClientGetPowerExt(a1) == 2;
}

unsigned int *WiFiManagerClientGetPowerExt(uint64_t a1)
{
  unsigned int *result;
  unsigned int *v2;
  int v3;

  v3 = 0;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v2 = result;
    wifi_manager_get_power(result[1], &v3);
    WiFiSendRightRelease(v2);
    if (v3 == 4)
      return (unsigned int *)1;
    else
      return (unsigned int *)(2 * (v3 == 1));
  }
  return result;
}

void WiFiManagerClientSetPowerExt(uint64_t a1, unsigned int a2)
{
  int v2;
  unsigned int *v3;
  unsigned int *v4;

  if (a2 > 2)
    v2 = 1;
  else
    v2 = dword_1B9BCEDE4[a2];
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_power_ext(v3[1], v2);
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientSetMISState(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_mis_state(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

unsigned int *WiFiManagerClientGetMISState(uint64_t a1)
{
  unsigned int *result;
  unsigned int *v2;
  int v3;

  v3 = 0;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v2 = result;
    wifi_manager_get_mis_state(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (unsigned int *)(v3 != 0);
  }
  return result;
}

void WiFiManagerClientSetMISDiscoveryState(uint64_t a1, int a2, int a3)
{
  unsigned int *v5;
  unsigned int *v6;
  const char *v7;
  _BOOL4 v8;

  v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    v6 = v5;
    v7 = getprogname();
    v8 = strncmp("sharingd", v7, 8uLL) == 0;
    wifi_manager_set_mis_discovery_state(v6[1], a2, a3, v8, 0, 0, 0, 0, 0, 0);
    WiFiSendRightRelease(v6);
  }
}

void WiFiManagerClientSetMISDiscoveryStateExt(uint64_t a1, const __CFDictionary *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const void *Value;
  CFTypeRef *v6;
  const void *v7;
  const void *v8;
  _BOOL4 v9;
  const void *v10;
  _BOOL4 v11;
  const void *v12;
  CFAllocatorRef *v13;
  const __CFData *BinaryData;
  const __CFData *v15;
  const UInt8 *BytePtr;
  int Length;
  const void *v18;
  const __CFData *v19;
  const __CFData *v20;
  const UInt8 *v21;
  int v22;
  const __CFNumber *v23;
  const char *v24;
  int v25;
  _BOOL4 v26;
  _BOOL4 v27;
  unsigned __int16 valuePtr;

  valuePtr = 0;
  if (!a2)
    return;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3)
    return;
  v4 = v3;
  Value = CFDictionaryGetValue(a2, CFSTR("SOFTAP_ENABLE"));
  v6 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
  if (Value)
    v27 = CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
  else
    v27 = 0;
  v7 = CFDictionaryGetValue(a2, CFSTR("SOFTAP_IMMEDIATE_DISABLE"));
  if (v7)
    v26 = CFEqual(v7, *v6) != 0;
  else
    v26 = 0;
  v8 = CFDictionaryGetValue(a2, CFSTR("SOFTAP_FORCE_2_4G_CHANNEL"));
  if (v8)
    v9 = CFEqual(v8, *v6) != 0;
  else
    v9 = 0;
  v10 = CFDictionaryGetValue(a2, CFSTR("SOFTAP_SOFTAP_HIDDEN_NETWORK"));
  if (v10)
    v11 = CFEqual(v10, *v6) != 0;
  else
    v11 = 0;
  v12 = CFDictionaryGetValue(a2, CFSTR("SOFTAP_SOFTAP_CAP_MODEL"));
  v13 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (v12)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12);
    v15 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v15);
      goto LABEL_20;
    }
  }
  else
  {
    v15 = 0;
  }
  BytePtr = 0;
  Length = 0;
LABEL_20:
  v18 = CFDictionaryGetValue(a2, CFSTR("SOFTAP_SOFTAP_OS_VER"));
  if (!v18)
  {
    v20 = 0;
    goto LABEL_24;
  }
  v19 = (const __CFData *)_CFPropertyListCreateBinaryData(*v13, v18);
  v20 = v19;
  if (!v19)
  {
LABEL_24:
    v21 = 0;
    v22 = 0;
    goto LABEL_25;
  }
  v21 = CFDataGetBytePtr(v19);
  v22 = CFDataGetLength(v20);
LABEL_25:
  v23 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("SOFTAP_BRINGUP_METHOD"));
  if (v23)
    CFNumberGetValue(v23, kCFNumberSInt16Type, &valuePtr);
  v24 = getprogname();
  v25 = !strncmp("sharingd", v24, 8uLL) || v11;
  wifi_manager_set_mis_discovery_state(v4[1], v27, v26, v25, v9, (uint64_t)BytePtr, Length, (uint64_t)v21, v22, valuePtr);
  WiFiSendRightRelease(v4);
  if (v15)
    CFRelease(v15);
  if (v20)
    CFRelease(v20);
}

unsigned int *WiFiManagerClientGetMISDiscoveryState(uint64_t a1)
{
  unsigned int *result;
  unsigned int *v2;
  int v3;

  v3 = 0;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v2 = result;
    wifi_manager_get_mis_discovery_state(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (unsigned int *)(v3 != 0);
  }
  return result;
}

void WiFiManagerClientSetWoWState(uint64_t a1, int a2)
{
  unsigned int *v4;
  unsigned int *v5;

  v4 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v4)
  {
    v5 = v4;
    *(_BYTE *)(a1 + 80) = a2;
    wifi_manager_set_wow_state(v4[1], a2);
    WiFiSendRightRelease(v5);
  }
}

BOOL WiFiManagerClientGetWoWState(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  BOOL v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  _BOOL8 v6;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1
    && ((wifi_manager_copy_wow_state(v1[1], &length[1], length), *(_QWORD *)&length[1])
      ? (v3 = length[0] == 0)
      : (v3 = 1),
        !v3 && (v4 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    v5 = v4;
    v6 = CFDictionaryGetValue(v4, CFSTR("WoWEnabled")) == (const void *)*MEMORY[0x1E0C9AE50];
    CFRelease(v5);
  }
  else
  {
    v6 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v6;
}

CFPropertyListRef WiFiManagerClientCopyWoWState(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  BOOL v4;
  CFPropertyListRef v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_wow_state(v1[1], &length[1], length);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
  if (*(_QWORD *)&length[1])
    v4 = length[0] == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_9;
  v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

uint64_t WiFiManagerClientGetWoWCapability(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_wow_capability(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

BOOL WiFiManagerClientQuiesceWiFi(uint64_t a1, int a2)
{
  return WiFiManagerClienSetQuiesceState(a1, a2) == 0;
}

uint64_t WiFiManagerClienSetQuiesceState(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;
  unsigned int v6;

  v6 = 0;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3)
    return 4294963394;
  v4 = v3;
  wifi_manager_set_quiesce_state(v3[1], a2, &v6);
  WiFiSendRightRelease(v4);
  return v6;
}

BOOL WiFiManagerClientGetQuiesceState(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_quiesce_state(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientIsTetheringSupported(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_tethering_supported(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

CFPropertyListRef WiFiManagerClientCopyMISStats(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  BOOL v4;
  CFPropertyListRef v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_mis_stats(v1[1], &length[1], length);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
  if (*(_QWORD *)&length[1])
    v4 = length[0] == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_9;
  v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

void WiFiManagerClientResetMISStats(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_reset_mis_stats(v1[1]);
  WiFiSendRightRelease(v2);
}

unsigned int *WiFiManagerClientIsNanPhsNetworkAssociated(uint64_t a1)
{
  unsigned int *result;
  unsigned int *v2;
  int v3;

  v3 = 0;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v2 = result;
    wifi_manager_get_nanclient_assoc_status(result[1], &v3);
    WiFiSendRightRelease(v2);
    return (unsigned int *)(v3 != 0);
  }
  return result;
}

void WiFiManagerClientSetNANOffHeadConnectionExpiry(uint64_t a1, double a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_nan_off_head_connection_expiry(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

double WiFiManagerClientGetNANOffHeadConnectionExpiry(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  double v4;

  v4 = 0.0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0.0;
  v2 = v1;
  wifi_manager_get_nan_off_head_connection_expiry(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsAlwaysOnWiFiSupported(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_always_on_wifi_supported(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientIsWiFiAlwaysOnSupported()
{
  uint64_t v0;
  uint64_t v1;
  _BOOL4 v5;
  uint64_t v6;
  const char *v7;
  int v9;
  const char *v10;
  __int16 v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v0 = MGGetProductType();
  v1 = 0;
  v5 = v0 == 1302273958 || v0 == 761631964 || v0 == 262180327 || v0 == 2445473385;
  if (v0 > 1302273957)
  {
    if (v0 == 1302273958)
      goto LABEL_20;
    v6 = 2445473385;
  }
  else
  {
    if (v0 == 262180327)
      goto LABEL_20;
    v6 = 761631964;
  }
  if (v0 != v6)
    v1 = 1;
LABEL_20:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = "supported";
    if (v5)
      v7 = "not supported";
    v9 = 136315394;
    v10 = "WiFiManagerClientIsWiFiAlwaysOnSupported";
    v11 = 2080;
    v12 = v7;
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: always on wifi %s", (uint8_t *)&v9, 0x16u);
  }
  return v1;
}

CFPropertyListRef WiFiManagerClientCopyLocaleStats(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  BOOL v3;
  CFPropertyListRef v4;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  wifi_manager_copy_locale_stats(v1[1], &length[1], length);
  if (*(_QWORD *)&length[1])
    v3 = length[0] == 0;
  else
    v3 = 1;
  if (v3 || (v4 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v4 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v4;
}

unsigned int *WiFiManagerClientMergeKnownNetworks(uint64_t a1, const void *a2)
{
  unsigned int *result;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;
  int v9;

  v9 = 0;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v4 = result;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    if (BinaryData)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_merge_known_networks(v4[1], (uint64_t)BytePtr, Length, &v9);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_merge_known_networks(v4[1], 0, 0, &v9);
    }
    WiFiSendRightRelease(v4);
    return (unsigned int *)(v9 != 0);
  }
  return result;
}

unsigned int *WiFiManagerClientSetMisPassword(uint64_t a1, const void *a2)
{
  unsigned int *result;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;
  int v9;

  v9 = -3902;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v4 = result;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    if (BinaryData)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_mis_set_password(v4[1], (uint64_t)BytePtr, Length, &v9);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_mis_set_password(v4[1], 0, 0, &v9);
    }
    WiFiSendRightRelease(v4);
    return (unsigned int *)(v9 == 0);
  }
  return result;
}

CFPropertyListRef WiFiManagerClientCopyMisPassword(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  CFPropertyListRef v6;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  wifi_manager_mis_copy_password(v1[1], &length[1], length);
  v3 = *(_QWORD *)&length[1];
  v4 = length[0];
  if (*(_QWORD *)&length[1])
    v5 = length[0] == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    v3 = *(_QWORD *)&length[1];
    v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

void WiFiManagerClientSetRetryIntervalCap(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_retry_cap(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetRetryIntervalCap(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_retry_cap(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetBackgroundScanNetworks(uint64_t a1, const __CFArray *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  __CFArray *RecordsFromNetworks;
  __CFArray *v6;
  const __CFData *BinaryData;
  const __CFData *v8;
  int v9;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v4 = v3;
  if (a2)
  {
    if (v3)
    {
      RecordsFromNetworks = _WiFiCreateRecordsFromNetworks(a2);
      if (RecordsFromNetworks)
      {
        v6 = RecordsFromNetworks;
        BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], RecordsFromNetworks);
        if (BinaryData)
        {
          v8 = BinaryData;
          v9 = v4[1];
          BytePtr = CFDataGetBytePtr(BinaryData);
          Length = CFDataGetLength(v8);
          wifi_manager_set_background_scan_networks(v9, (uint64_t)BytePtr, Length);
          CFRelease(v8);
        }
        CFRelease(v6);
      }
    }
  }
  WiFiSendRightRelease(v4);
}

void WiFiManagerClientSetBGScanCacheState(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2)) != 0)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_set_bgscan_cache_state(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_bgscan_cache_state(v4[1], 0, 0);
    }
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientAddNetwork(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  int v8;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3 && (v4 = WiFiNetworkCopyRecord(a2)) != 0)
  {
    v5 = v4;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
    if (BinaryData)
    {
      v7 = BinaryData;
      v8 = v3[1];
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v7);
      wifi_manager_add_network(v8, (uint64_t)BytePtr, Length);
      CFRelease(v7);
    }
    WiFiSendRightRelease(v3);
    CFRelease(v5);
  }
  else
  {
    WiFiSendRightRelease(v3);
  }
}

uint64_t WiFiManagerClientAddNetworkAsync(uint64_t a1, uint64_t a2, CFTypeRef BinaryData, uint64_t a4, uint64_t a5)
{
  unsigned int *v10;
  CFDictionaryRef v11;
  CFDictionaryRef v12;
  const __CFAllocator *v13;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v16;
  const __CFData *v17;
  int v18;
  const UInt8 *v19;
  int v20;
  uint64_t v21;

  if (!a1)
  {
    v10 = 0;
    goto LABEL_16;
  }
  v10 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v10)
  {
LABEL_16:
    v21 = 74;
    goto LABEL_13;
  }
  v11 = WiFiNetworkCopyRecord(a2);
  if (!v11)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v21 = 72;
    goto LABEL_13;
  }
  v12 = v11;
  if (*(_QWORD *)(a1 + 256) || *(_QWORD *)(a1 + 264))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v21 = 37;
    goto LABEL_12;
  }
  *(_QWORD *)(a1 + 256) = a4;
  *(_QWORD *)(a1 + 264) = a5;
  v13 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (BinaryData)
  {
    BinaryData = _CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], BinaryData);
    BytePtr = CFDataGetBytePtr((CFDataRef)BinaryData);
    Length = CFDataGetLength((CFDataRef)BinaryData);
  }
  else
  {
    BytePtr = 0;
    Length = 0;
  }
  v16 = (const __CFData *)_CFPropertyListCreateBinaryData(v13, v12);
  if (!v16)
  {
    v21 = 72;
    if (!BinaryData)
      goto LABEL_12;
    goto LABEL_11;
  }
  v17 = v16;
  v18 = v10[1];
  v19 = CFDataGetBytePtr(v16);
  v20 = CFDataGetLength(v17);
  wifi_manager_add_network_async(v18, (uint64_t)v19, v20, (uint64_t)BytePtr, Length);
  CFRelease(v17);
  v21 = 0;
  if (BinaryData)
LABEL_11:
    CFRelease(BinaryData);
LABEL_12:
  CFRelease(v12);
LABEL_13:
  WiFiSendRightRelease(v10);
  return v21;
}

void WiFiManagerClientUpdateNetwork(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  int v8;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
      if (BinaryData)
      {
        v7 = BinaryData;
        v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v7);
        wifi_manager_update_network(v8, (uint64_t)BytePtr, Length);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }
  WiFiSendRightRelease(v3);
}

void WiFiManagerClientRemoveNetwork(uint64_t a1, const void *a2)
{
  const __CFAllocator *v4;
  const char *v5;
  CFStringEncoding SystemEncoding;
  CFStringRef v7;
  CFStringRef v8;
  uint64_t v9;
  const void *v10;
  int v11;
  int v12;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = getprogname();
  SystemEncoding = CFStringGetSystemEncoding();
  v7 = CFStringCreateWithCString(v4, v5, SystemEncoding);
  if (v7)
  {
    v8 = v7;
    if (CFEqual(v7, CFSTR("mobilewifitool")))
    {
      v9 = a1;
      v10 = a2;
      v11 = 24;
    }
    else
    {
      if (*(_BYTE *)(a1 + 81))
        v11 = 2;
      else
        v11 = 22;
      v9 = a1;
      v10 = a2;
    }
    WiFiManagerClientRemoveNetworkWithReason(v9, v10, v11);
    CFRelease(v8);
  }
  else
  {
    if (*(_BYTE *)(a1 + 81))
      v12 = 2;
    else
      v12 = 22;
    WiFiManagerClientRemoveNetworkWithReason(a1, a2, v12);
  }
}

void WiFiManagerClientRemoveNetworkWithReason(uint64_t a1, const void *a2, int a3)
{
  unsigned int *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  const __CFData *BinaryData;
  const __CFData *v9;
  int v10;
  const UInt8 *BytePtr;
  int Length;
  int Type;
  const void *SSID;
  uint64_t v15;

  if (a2)
  {
    v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    if (v5)
    {
      v6 = WiFiNetworkCopyRecord((uint64_t)a2);
      if (v6)
      {
        v7 = v6;
        BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
        if (BinaryData)
        {
          v9 = BinaryData;
          v10 = v5[1];
          BytePtr = CFDataGetBytePtr(BinaryData);
          Length = CFDataGetLength(v9);
          wifi_manager_remove_network(v10, (uint64_t)BytePtr, Length, a3);
          CFRelease(v9);
        }
        Type = WiFiNetworkGetType((uint64_t)a2);
        SSID = WiFiNetworkGetSSID(a2);
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](SSID));
        if (Type != 2)
        {
          if ((a3 & 0xFFFFFFFE) == 0xC)
          {
            objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
            v15 = WiFiNetworkSetPasswordSyncable();
          }
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v15));
          WiFiNetworkRemovePassword(a2);
        }
        if (MEMORY[0x1E0D1DAC8])
        {
          if (WiFiNetworkIsEAP((uint64_t)a2))
          {
            WiFiNetworkGetSSID(a2);
            EAPTLSRemoveTrustExceptionsBindings();
          }
        }
        CFRelease(v7);
      }
    }
    WiFiSendRightRelease(v5);
  }
}

void WiFiManagerClientRemoveNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  const __CFData *BinaryData;
  const __CFData *v5;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    if (a2)
    {
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
      if (BinaryData)
      {
        v5 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v5);
        wifi_manager_remove_networks_with_bundle_identifier(v3[1], (uint64_t)BytePtr, Length);
        CFRelease(v5);
      }
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  WiFiSendRightRelease(v3);
}

void WiFiManagerClientEnableNetwork(uint64_t a1, uint64_t a2)
{
  __WiFiManagerClientSetNetworkState(a1, a2, 1, 0);
}

void __WiFiManagerClientSetNetworkState(uint64_t a1, uint64_t a2, int a3, int a4)
{
  unsigned int *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  const __CFData *BinaryData;
  const __CFData *v11;
  int v12;
  const UInt8 *BytePtr;
  int Length;

  v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    v8 = WiFiNetworkCopyRecord(a2);
    if (v8)
    {
      v9 = v8;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
      if (BinaryData)
      {
        v11 = BinaryData;
        v12 = v7[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v11);
        wifi_manager_set_network_state(v12, (uint64_t)BytePtr, Length, a3, a4);
        CFRelease(v11);
      }
      CFRelease(v9);
    }
  }
  WiFiSendRightRelease(v7);
}

void WiFiManagerClientDisableNetwork(uint64_t a1, uint64_t a2)
{
  __WiFiManagerClientSetNetworkState(a1, a2, 0, 0);
}

void WiFiManagerClientEnableNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
  __WiFiManagerClientSetNetworksStateWithBundleIdentifier(a1, a2, 1);
}

void __WiFiManagerClientSetNetworksStateWithBundleIdentifier(uint64_t a1, const void *a2, int a3)
{
  unsigned int *v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  const UInt8 *BytePtr;
  int Length;

  v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    if (a2)
    {
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
      if (BinaryData)
      {
        v7 = BinaryData;
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v7);
        wifi_manager_set_networks_state_with_bundle_identifier(v5[1], (uint64_t)BytePtr, Length, a3);
        CFRelease(v7);
      }
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  WiFiSendRightRelease(v5);
}

void WiFiManagerClientDisableNetworksWithBundleIdentifier(uint64_t a1, const void *a2)
{
  __WiFiManagerClientSetNetworksStateWithBundleIdentifier(a1, a2, 0);
}

void WiFiManagerClientTemporarilyDisableNetwork(uint64_t a1, uint64_t a2)
{
  __WiFiManagerClientSetNetworkState(a1, a2, 0, 1);
}

unsigned int *WiFiManagerClientIsNetworkEnabled(uint64_t a1, uint64_t a2)
{
  unsigned int *result;
  unsigned int *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  const __CFData *BinaryData;
  const __CFData *v8;
  mach_port_t v9;
  const UInt8 *BytePtr;
  int Length;
  int v12;

  v12 = 0;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v4 = result;
    v5 = WiFiNetworkCopyRecord(a2);
    if (v5)
    {
      v6 = v5;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5);
      if (BinaryData)
      {
        v8 = BinaryData;
        v9 = v4[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v8);
        wifi_manager_get_network_state(v9, (uint64_t)BytePtr, Length, &v12);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    WiFiSendRightRelease(v4);
    return (unsigned int *)(v12 != 0);
  }
  return result;
}

__CFArray *WiFiManagerClientCopyNetworks(uint64_t a1)
{
  return __WiFiManagerClientCopyNetworks(a1, 0);
}

__CFArray *__WiFiManagerClientCopyNetworks(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;
  BOOL v5;
  const __CFArray *v6;
  const __CFArray *v7;
  __CFArray *NetworksFromRecords;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v4 = v3;
  if (v3
    && ((wifi_manager_copy_networks(v3[1], a2, &length[1], length), *(_QWORD *)&length[1])
      ? (v5 = length[0] == 0)
      : (v5 = 1),
        !v5 && (v6 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    v7 = v6;
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(v6);
    CFRelease(v7);
  }
  else
  {
    NetworksFromRecords = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v4);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyEnabledNetworks(uint64_t a1)
{
  return __WiFiManagerClientCopyNetworks(a1, 1);
}

__CFArray *WiFiManagerClientCopyMutableNetworks(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  BOOL v3;
  const __CFArray *v4;
  const __CFArray *v5;
  __CFArray *NetworksFromRecords;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1
    && ((wifi_manager_copy_networks(v1[1], 0, &length[1], length), *(_QWORD *)&length[1])
      ? (v3 = length[0] == 0)
      : (v3 = 1),
        !v3 && (v4 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    v5 = v4;
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(v4);
    CFRelease(v5);
  }
  else
  {
    NetworksFromRecords = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyNetworksWithBundleIdentifier(uint64_t a1, const __CFString *a2)
{
  __CFArray *v3;
  const __CFArray *v4;
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v7;
  CFIndex i;
  const void *ValueAtIndex;
  const void *v10;
  const __CFString *BundleIdentifier;

  if (!a2)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  v3 = __WiFiManagerClientCopyNetworks(a1, 0);
  if (!v3)
    return 0;
  v4 = v3;
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    Count = CFArrayGetCount(v4);
    if (Count >= 1)
    {
      v7 = Count;
      for (i = 0; i != v7; ++i)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v4, i);
        if (ValueAtIndex)
        {
          v10 = ValueAtIndex;
          BundleIdentifier = (const __CFString *)WiFiNetworkGetBundleIdentifier((uint64_t)ValueAtIndex);
          if (BundleIdentifier)
          {
            if (CFStringCompare(BundleIdentifier, a2, 0) == kCFCompareEqualTo)
              CFArrayAppendValue(Mutable, v10);
          }
        }
      }
    }
    if (!CFArrayGetCount(Mutable))
    {
      CFRelease(Mutable);
      Mutable = 0;
    }
  }
  CFRelease(v4);
  return Mutable;
}

uint64_t WiFiManagerClientGetAskToJoinState(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v5;

  v5 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
  {
    wifi_manager_get_ask_to_join_state(v1[1], &v5);
    v3 = v5;
  }
  else
  {
    v3 = 0;
  }
  WiFiSendRightRelease(v2);
  return v3;
}

CFPropertyListRef WiFiManagerClientCopyVersionInfo(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  CFPropertyListRef v6;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  wifi_manager_copy_version_info(v1[1], &length[1], length);
  v3 = *(_QWORD *)&length[1];
  v4 = length[0];
  if (*(_QWORD *)&length[1])
    v5 = length[0] == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    v3 = *(_QWORD *)&length[1];
    v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

CFPropertyListRef WiFiManagerClientCopyClientNames(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  CFPropertyListRef v6;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  wifi_manager_copy_client_names(v1[1], &length[1], length);
  v3 = *(_QWORD *)&length[1];
  v4 = length[0];
  if (*(_QWORD *)&length[1])
    v5 = length[0] == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    v3 = *(_QWORD *)&length[1];
    v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

CFArrayRef WiFiManagerClientCopyInterfaces(uint64_t a1)
{
  const __CFDictionary *v2;
  CFIndex Count;
  CFIndex v4;
  size_t v5;
  char *v6;
  CFArrayRef v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  os_unfair_recursive_lock_lock_with_options();
  v2 = *(const __CFDictionary **)(a1 + 64);
  if (v2 && (Count = CFDictionaryGetCount(v2)) != 0)
  {
    v4 = Count;
    MEMORY[0x1E0C80A78]();
    v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    memset(v6, 170, v5);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 64), 0, (const void **)v6);
    v7 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)v6, v4, MEMORY[0x1E0C9B378]);
  }
  else
  {
    v7 = 0;
  }
  os_unfair_recursive_lock_unlock();
  return v7;
}

uint64_t WiFiManagerClientAddDevice(uint64_t a1, const void *a2, uint64_t a3)
{
  return __WiFiManagerClientAddDevice(a1, a2, a3, 0);
}

void WiFiManagerClientRemoveDevice(uint64_t a1, const void *a2, int a3, int a4)
{
  const void *Device;
  const void *v9;
  void (*v10)(uint64_t, const void *, const void *, _QWORD, _QWORD);
  int v11;
  const char *v12;
  __int16 v13;
  const void *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "WiFiManagerClientRemoveDevice";
    v13 = 2112;
    v14 = a2;
    v15 = 2112;
    v16 = a1;
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: removed %@ (manager %@)", (uint8_t *)&v11, 0x20u);
  }
  if (a2)
  {
    os_unfair_recursive_lock_lock_with_options();
    if (a3)
    {
      if (*(_QWORD *)(a1 + 144))
      {
        Device = WiFiManagerClientGetDevice(a1, a2);
        v9 = Device;
        if (Device)
          CFRetain(Device);
        if (!a4)
          CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 64), a2);
      }
      else
      {
        v9 = 0;
      }
      os_unfair_recursive_lock_unlock();
      if (!a4)
      {
        v10 = *(void (**)(uint64_t, const void *, const void *, _QWORD, _QWORD))(a1 + 144);
        if (v10)
          v10(a1, v9, a2, 0, *(_QWORD *)(a1 + 152));
      }
      if (v9)
        CFRelease(v9);
    }
    else
    {
      os_unfair_recursive_lock_unlock();
    }
  }
}

void WiFiManagerClientDispatchAttachmentEvent(_QWORD *a1, CFStringRef theString, int a3)
{
  uint64_t v6;
  const void *Device;
  void (*v8)(_QWORD *, const void *, CFStringRef, uint64_t, _QWORD);
  void (*v9)(_QWORD *, const void *, _QWORD);
  int v10;
  const char *v11;
  __int16 v12;
  CFStringRef v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _QWORD *v17;
  __int16 v18;
  const void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (a3)
    v6 = 6;
  else
    v6 = 0;
  if (theString && a3 && CFStringHasPrefix(theString, CFSTR("ap")))
    v6 = 7;
  if (__WiFiManagerClientAddDevice((uint64_t)a1, theString, v6, 0))
  {
    Device = WiFiManagerClientGetDevice((uint64_t)a1, theString);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v10 = 136316162;
      v11 = "WiFiManagerClientDispatchAttachmentEvent";
      v12 = 2112;
      v13 = theString;
      v14 = 1024;
      v15 = a3;
      v16 = 2112;
      v17 = a1;
      v18 = 2112;
      v19 = Device;
      _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: attached %@ (isVirtual %d manager %@ deviceClient %@)", (uint8_t *)&v10, 0x30u);
    }
    if (a3)
    {
      v8 = (void (*)(_QWORD *, const void *, CFStringRef, uint64_t, _QWORD))a1[18];
      if (v8)
        v8(a1, Device, theString, 1, a1[19]);
    }
    else
    {
      v9 = (void (*)(_QWORD *, const void *, _QWORD))a1[16];
      if (v9)
        v9(a1, Device, a1[17]);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    WiFiManagerClientDispatchAttachmentEvent_cold_1();
  }
}

void WiFiManagerClientDumpLogs(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2)) != 0)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_dump_logs(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_dump_logs(v4[1], 0, 0);
    }
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientSetTestParams(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2)) != 0)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_set_test_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_test_params(v4[1], 0, 0);
    }
    WiFiSendRightRelease(v4);
  }
}

CFPropertyListRef WiFiManagerClientSetTestParamsAndCopyResponse(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  const __CFData *BinaryData;
  const __CFData *v5;
  const UInt8 *BytePtr;
  int v7;
  CFPropertyListRef v8;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (!v3)
    goto LABEL_13;
  if (!a2)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_13:
    v8 = 0;
    goto LABEL_11;
  }
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v5 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    v7 = CFDataGetLength(v5);
  }
  else
  {
    BytePtr = 0;
    v7 = 0;
  }
  wifi_manager_copy_test_params(v3[1], (uint64_t)BytePtr, v7, &length[1], length);
  v8 = 0;
  if (*(_QWORD *)&length[1] && length[0])
    v8 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (v5)
    CFRelease(v5);
LABEL_11:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v3);
  return v8;
}

void __WiFiManagerClientAvailableCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  void (*v14)(uint64_t, _QWORD, uint64_t, _QWORD);
  _BOOL8 v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, _QWORD);

  v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  if (v5)
    __WiFiManagerClientAvailableCallback_cold_3(v5, v6, v7, v8, v9, v10, v11, v12);
  v13 = __WiFiManagerClientGetOrReconnectServerPort(a4, 0);
  if (*(_DWORD *)(a4 + 336) >= 2u)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __WiFiManagerClientAvailableCallback_cold_2();
    WiFiSendRightRelease(v13);
    v13 = __WiFiManagerClientGetOrReconnectServerPort(a4, 1);
  }
  *(_DWORD *)(a4 + 336) = 2;
  v14 = *(void (**)(uint64_t, _QWORD, uint64_t, _QWORD))(a4 + 256);
  if (v14)
  {
    v14(a4, 0, 74, *(_QWORD *)(a4 + 264));
    *(_QWORD *)(a4 + 256) = 0;
    *(_QWORD *)(a4 + 264) = 0;
  }
  if (v13)
  {
    wifi_manager_set_wow_state(v13[1], *(unsigned __int8 *)(a4 + 80));
    wifi_manager_set_client_type(v13[1], *(_DWORD *)(a4 + 16));
  }
  else
  {
    v15 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v15)
      __WiFiManagerClientAvailableCallback_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
  }
  if ((*(_BYTE *)(a4 + 74) & 1) != 0)
  {
    v23 = *(void (**)(uint64_t, _QWORD))(a4 + 224);
    if (v23)
      v23(a4, *(_QWORD *)(a4 + 232));
  }
  WiFiSendRightRelease(v13);
}

uint64_t _wifi_manager_client_dispatch_notification(unsigned int a1, UInt8 *a2, unsigned int a3, unsigned int a4, unsigned int a5, UInt8 *a6, unsigned int a7, UInt8 *a8, unsigned int a9)
{
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  CFPropertyListRef v20;
  CFPropertyListRef v21;
  CFPropertyListRef v22;
  const void *v23;
  CFTypeID v24;
  _WORD *v25;
  CFPropertyListRef v26;
  const void *v27;
  UInt8 *v28;
  CFTypeID v29;
  BOOL v30;
  void (*v31)(_QWORD *, const void *, _QWORD, _QWORD, _WORD *, const void *, _QWORD);
  const void *Device;
  unsigned int v34;
  unsigned int v35;
  CFTypeRef v36;

  v16 = a9;
  v17 = WiFiPortCacheCopy(a1);
  v18 = a3;
  if (v17)
  {
    v19 = v17;
    v34 = a4;
    v35 = a5;
    v20 = _WiFiCopyUnserialized(a2, a3);
    if (!v20)
    {
LABEL_19:
      CFRelease(v19);
      goto LABEL_20;
    }
    v21 = v20;
    Device = WiFiManagerClientGetDevice((uint64_t)v19, v20);
    v22 = _WiFiCopyUnserialized(a6, a7);
    v23 = v22;
    v36 = v21;
    if (v22)
    {
      v24 = CFGetTypeID(v22);
      if (v24 != CFDictionaryGetTypeID())
      {
        v25 = 0;
        v27 = 0;
LABEL_13:
        CFRelease(v23);
LABEL_14:
        if (v27)
          CFRelease(v27);
        if (v25)
          CFRelease(v25);
        CFRelease(v36);
        goto LABEL_19;
      }
      v25 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v23);
    }
    else
    {
      v25 = 0;
    }
    v26 = _WiFiCopyUnserialized(a8, a9);
    v27 = v26;
    if (!v26 || (v28 = a8, v29 = CFGetTypeID(v26), v30 = v29 == CFDictionaryGetTypeID(), a8 = v28, v16 = a9, v30))
    {
      v31 = (void (*)(_QWORD *, const void *, _QWORD, _QWORD, _WORD *, const void *, _QWORD))v19[14];
      if (v31)
        v31(v19, Device, v34, v35, v25, v27, v19[15]);
    }
    if (!v23)
      goto LABEL_14;
    goto LABEL_13;
  }
LABEL_20:
  _WiFiVMDealloc((uint64_t)a2, v18);
  _WiFiVMDealloc((uint64_t)a6, a7);
  _WiFiVMDealloc((uint64_t)a8, v16);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_wow_state_change(unsigned int a1, unsigned __int8 a2)
{
  const void *v3;
  const void *v4;
  void (*v5)(const void *, _QWORD, _QWORD);

  v3 = WiFiPortCacheCopy(a1);
  if (v3)
  {
    v4 = v3;
    if ((*((_BYTE *)v3 + 73) & 0x20) != 0)
    {
      v5 = (void (*)(const void *, _QWORD, _QWORD))*((_QWORD *)v3 + 26);
      if (v5)
        v5(v3, a2, *((_QWORD *)v3 + 27));
    }
    CFRelease(v4);
  }
  return 0;
}

uint64_t _wifi_manager_client_dispatch_association_result(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, UInt8 *a6, unsigned int a7, unsigned int a8)
{
  const void *v15;
  uint64_t v16;
  const void *v17;
  CFPropertyListRef v18;
  const void *v19;
  const void *Device;
  uint64_t v21;
  CFPropertyListRef v22;
  const void *v23;
  _WORD *v24;
  const void *v25;
  uint64_t v26;
  UInt8 *v27;
  unsigned int v28;
  UInt8 *v29;
  unsigned int v30;
  CFIndex v31;
  UInt8 *v32;
  CFPropertyListRef v33;
  const void *v35;
  const void *v36;
  unsigned int v37;

  v15 = WiFiPortCacheCopy(a1);
  v16 = a3;
  if (v15)
  {
    v17 = v15;
    v18 = _WiFiCopyUnserialized(a2, a3);
    if (v18)
    {
      v19 = v18;
      Device = WiFiManagerClientGetDevice((uint64_t)v17, v18);
      if (Device)
      {
        v21 = (uint64_t)Device;
        v37 = a8;
        v22 = _WiFiCopyUnserialized(a4, a5);
        if (v22)
        {
          v23 = v22;
          v36 = v19;
          v24 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v22);
          if (v24)
          {
            v25 = v24;
            v35 = v17;
            v26 = v16;
            v27 = a2;
            v28 = a5;
            v29 = a4;
            v30 = a7;
            v31 = a7;
            v32 = a6;
            v33 = _WiFiCopyUnserialized(a6, v31);
            _WiFiDeviceClientDispatchAssociationResult(v21, (uint64_t)v25, (uint64_t)v33, v37);
            if (v33)
              CFRelease(v33);
            CFRelease(v25);
            a6 = v32;
            a7 = v30;
            a4 = v29;
            a5 = v28;
            a2 = v27;
            v16 = v26;
            v17 = v35;
          }
          else
          {
            _WiFiDeviceClientDispatchAssociationResult(v21, 0, 0, v37);
          }
          CFRelease(v23);
          v19 = v36;
        }
        else
        {
          _WiFiDeviceClientDispatchAssociationResult(v21, 0, 0, a8);
        }
      }
      CFRelease(v19);
    }
    CFRelease(v17);
  }
  _WiFiVMDealloc((uint64_t)a2, v16);
  _WiFiVMDealloc((uint64_t)a4, a5);
  _WiFiVMDealloc((uint64_t)a6, a7);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_start_network_result(unsigned int a1, UInt8 *a2, unsigned int a3, unsigned int a4, UInt8 *a5, unsigned int a6, UInt8 *a7, unsigned int a8)
{
  const void *v14;
  uint64_t v15;
  const void *v16;
  CFPropertyListRef v17;
  const void *v18;
  const void *Device;
  uint64_t v20;
  const void *v21;
  _WORD *v22;
  CFPropertyListRef v23;
  UInt8 *v24;
  UInt8 *v25;
  unsigned int v26;
  unsigned int v27;
  CFPropertyListRef v28;
  const void *v29;
  uint64_t v32;
  const void *v33;

  v14 = WiFiPortCacheCopy(a1);
  v15 = a3;
  if (v14)
  {
    v16 = v14;
    v17 = _WiFiCopyUnserialized(a2, a3);
    if (!v17)
    {
LABEL_17:
      CFRelease(v16);
      goto LABEL_18;
    }
    v18 = v17;
    v33 = v16;
    Device = WiFiManagerClientGetDevice((uint64_t)v16, v17);
    if (Device)
    {
      v20 = (uint64_t)Device;
      v21 = 0;
      v22 = 0;
      if (!a5 || !a6)
      {
LABEL_8:
        v32 = v15;
        if (a7 && a8)
        {
          v24 = a5;
          v25 = a2;
          v26 = a6;
          v27 = a8;
          v28 = _WiFiCopyUnserialized(a7, a8);
          if (v28)
          {
            v29 = v28;
            _WiFiDeviceClientDispatchStartNetworkResult(v20, a4, (uint64_t)v22, (uint64_t)v28);
            CFRelease(v29);
          }
          if (!v22)
            goto LABEL_14;
        }
        else
        {
          v24 = a5;
          v25 = a2;
          v26 = a6;
          v27 = a8;
          _WiFiDeviceClientDispatchStartNetworkResult(v20, a4, (uint64_t)v22, 0);
          if (!v22)
          {
LABEL_14:
            a8 = v27;
            a6 = v26;
            a2 = v25;
            a5 = v24;
            v15 = v32;
            if (v21)
              CFRelease(v21);
            goto LABEL_16;
          }
        }
        CFRelease(v22);
        goto LABEL_14;
      }
      v23 = _WiFiCopyUnserialized(a5, a6);
      if (v23)
      {
        v21 = v23;
        v22 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v23);
        goto LABEL_8;
      }
    }
LABEL_16:
    CFRelease(v18);
    v16 = v33;
    goto LABEL_17;
  }
LABEL_18:
  _WiFiVMDealloc((uint64_t)a2, v15);
  _WiFiVMDealloc((uint64_t)a5, a6);
  _WiFiVMDealloc((uint64_t)a7, a8);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_stop_network_result(unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4, UInt8 *a5, unsigned int a6)
{
  const void *v11;
  const void *v12;
  CFPropertyListRef v13;
  const void *v14;
  const void *Device;
  uint64_t v16;
  CFPropertyListRef v17;
  const void *v18;

  v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    v12 = v11;
    v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        v16 = (uint64_t)Device;
        if (a5 && a6)
        {
          v17 = _WiFiCopyUnserialized(a5, a6);
          if (v17)
          {
            v18 = v17;
            _WiFiDeviceClientDispatchStopNetworkResult(v16, a4, (uint64_t)v17);
            CFRelease(v18);
          }
        }
        else
        {
          _WiFiDeviceClientDispatchStopNetworkResult((uint64_t)Device, a4, 0);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a5, a6);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_gas_results(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  const void *v11;
  const void *v12;
  CFPropertyListRef v13;
  const void *v14;
  const void *Device;
  uint64_t v16;
  const __CFArray *v17;
  const __CFArray *v18;
  __CFArray *NetworksFromRecords;

  v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    v12 = v11;
    v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        v16 = (uint64_t)Device;
        v17 = (const __CFArray *)_WiFiCopyUnserialized(a4, a5);
        if (v17)
        {
          v18 = v17;
          NetworksFromRecords = _WiFiCreateNetworksFromRecords(v17);
          _WiFiDeviceClientDispatchGasResults(v16, (uint64_t)NetworksFromRecords, a6);
          if (NetworksFromRecords)
            CFRelease(NetworksFromRecords);
          CFRelease(v18);
        }
        else
        {
          _WiFiDeviceClientDispatchGasResults(v16, 0, a6);
        }
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_ranging_result(unsigned int a1, UInt8 *a2, unsigned int a3, UInt8 *a4, unsigned int a5, uint64_t a6)
{
  const void *v11;
  const void *v12;
  CFPropertyListRef v13;
  const void *v14;
  const void *Device;
  uint64_t v16;
  CFPropertyListRef v17;

  v11 = WiFiPortCacheCopy(a1);
  if (v11)
  {
    v12 = v11;
    v13 = _WiFiCopyUnserialized(a2, a3);
    if (v13)
    {
      v14 = v13;
      Device = WiFiManagerClientGetDevice((uint64_t)v12, v13);
      if (Device)
      {
        v16 = (uint64_t)Device;
        v17 = _WiFiCopyUnserialized(a4, a5);
        _WiFiDeviceClientDispatchRangingResult(v16, (uint64_t)v17, a6);
        if (v17)
          CFRelease(v17);
      }
      CFRelease(v14);
    }
    CFRelease(v12);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  _WiFiVMDealloc((uint64_t)a4, a5);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_add_network_async(unsigned int a1, UInt8 *a2, unsigned int a3, uint64_t a4)
{
  _QWORD *v7;
  _QWORD *v8;
  const void *v9;
  _WORD *v10;
  CFPropertyListRef v11;
  void (*v12)(_QWORD *, _WORD *, uint64_t, _QWORD);

  v7 = WiFiPortCacheCopy(a1);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = 0;
    if (!a2 || !a3)
      goto LABEL_6;
    v11 = _WiFiCopyUnserialized(a2, a3);
    if (!v11)
    {
LABEL_12:
      CFRelease(v8);
      goto LABEL_13;
    }
    v9 = v11;
    v10 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v11);
    if (v10)
    {
LABEL_6:
      v12 = (void (*)(_QWORD *, _WORD *, uint64_t, _QWORD))v8[32];
      if (v12)
      {
        v12(v8, v10, a4, v8[33]);
        v8[32] = 0;
        v8[33] = 0;
      }
      if (v10)
        CFRelease(v10);
      if (!v9)
        goto LABEL_12;
    }
    CFRelease(v9);
    goto LABEL_12;
  }
LABEL_13:
  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0;
}

void WiFiManagerClientAddPolicy(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  int v8;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = WiFiPolicyCopyRecord(a2);
    if (v4)
    {
      v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
      if (BinaryData)
      {
        v7 = BinaryData;
        v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v7);
        wifi_manager_add_policy(v8, (uint64_t)BytePtr, Length, 0);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }
  WiFiSendRightRelease(v3);
}

void WiFiManagerClientRemovePolicy(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  uint64_t TypeID;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  const __CFData *BinaryData;
  int v8;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3)
    goto LABEL_10;
  TypeID = WiFiPolicyGetTypeID();
  if (TypeID == CFGetTypeID(a2))
  {
    v5 = WiFiPolicyCopyRecord((uint64_t)a2);
    if (!v5)
      goto LABEL_10;
    v6 = v5;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5);
    if (!BinaryData)
      goto LABEL_8;
  }
  else
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v6 = 0;
    if (!BinaryData)
      goto LABEL_8;
  }
  v8 = v3[1];
  BytePtr = CFDataGetBytePtr(BinaryData);
  Length = CFDataGetLength(BinaryData);
  wifi_manager_remove_policy(v8, (uint64_t)BytePtr, Length, 0);
  CFRelease(BinaryData);
LABEL_8:
  if (v6)
    CFRelease(v6);
LABEL_10:
  WiFiSendRightRelease(v3);
}

__CFArray *WiFiManagerClientCopyPolicies(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  BOOL v3;
  const __CFArray *v4;
  const __CFArray *v5;
  const __CFAllocator *v6;
  __CFArray *Mutable;
  CFIndex Count;
  CFIndex v9;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  _QWORD *v12;
  const void *v13;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1
    && ((wifi_manager_copy_policies(v1[1], &length[1], length), *(_QWORD *)&length[1])
      ? (v3 = length[0] == 0)
      : (v3 = 1),
        !v3 && (v4 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    v5 = v4;
    v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    if (Mutable)
    {
      Count = CFArrayGetCount(v5);
      if (Count >= 1)
      {
        v9 = Count;
        for (i = 0; i != v9; ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, i);
          if (ValueAtIndex)
          {
            v12 = WiFiPolicyCreate(v6, ValueAtIndex);
            if (v12)
            {
              v13 = v12;
              CFArrayAppendValue(Mutable, v12);
              CFRelease(v13);
            }
          }
        }
      }
    }
    CFRelease(v5);
  }
  else
  {
    Mutable = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return Mutable;
}

void WiFiManagerClientSetInCarState(uint64_t a1, int a2, const __CFData *a3)
{
  uint64_t v6;
  unsigned int *v7;
  unsigned int *v8;
  const __CFData *BinaryData;
  const UInt8 *BytePtr;
  int Length;

  v6 = kdebug_trace();
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v6));
  v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v7)
  {
    v8 = v7;
    if (a3
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3),
          (a3 = BinaryData) != 0))
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(a3);
    }
    else
    {
      BytePtr = 0;
      Length = 0;
    }
    wifi_manager_set_incar_state(v8[1], a2, (uint64_t)BytePtr, Length);
    if (a3)
      CFRelease(a3);
    WiFiSendRightRelease(v8);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void WiFiManagerClientSetThermalIndex(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_thermal_index(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetThermalIndex(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v4;

  v4 = 100;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_thermal_index(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

CFPropertyListRef WiFiManagerClientCopyLeechedLocation(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  BOOL v4;
  CFPropertyListRef v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_leeched_location(v1[1], &length[1], length);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
  if (*(_QWORD *)&length[1])
    v4 = length[0] == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_9;
  v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

CFPropertyListRef WiFiManagerClientCopyGeoTagsForNetwork(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  int v8;
  const UInt8 *BytePtr;
  int v10;
  CFPropertyListRef v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v13 = 0;
    v12 = 0;
    v3 = 0;
    goto LABEL_14;
  }
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3 || (v4 = WiFiNetworkCopyRecord(a2)) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v13 = 0;
    v12 = 0;
LABEL_14:
    v11 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
  if (BinaryData)
  {
    v7 = BinaryData;
    v8 = v3[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    v10 = CFDataGetLength(v7);
    wifi_manager_copy_geotags_for_network(v8, (uint64_t)BytePtr, v10, &length[1], length);
    if (!*(_QWORD *)&length[1] || !length[0] || (v11 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v11 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v11 = 0;
  }
  CFRelease(v5);
  v12 = *(_QWORD *)&length[1];
  v13 = length[0];
LABEL_10:
  _WiFiVMDealloc(v12, v13);
  WiFiSendRightRelease(v3);
  return v11;
}

uint64_t WiFiManagerClientSetGeoTagForNetwork(uint64_t a1, uint64_t a2, double a3, double a4)
{
  unsigned int *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  const __CFData *BinaryData;
  const __CFData *v11;
  int v12;
  const UInt8 *BytePtr;
  int Length;
  uint64_t v15;

  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v7 = 0;
    goto LABEL_10;
  }
  v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7 || (v8 = WiFiNetworkCopyRecord(a2)) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_10:
    v15 = 74;
    goto LABEL_7;
  }
  v9 = v8;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
  if (BinaryData)
  {
    v11 = BinaryData;
    v12 = v7[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v11);
    wifi_manager_set_geotag_for_network(v12, (uint64_t)BytePtr, Length, a3, a4);
    CFRelease(v11);
    v15 = 0;
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v15 = 74;
  }
  CFRelease(v9);
LABEL_7:
  WiFiSendRightRelease(v7);
  return v15;
}

__CFArray *WiFiManagerClientCopyKnownNetworksNearLocation(uint64_t a1, double a2, double a3)
{
  unsigned int *v5;
  unsigned int *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  __CFArray *NetworksFromRecords;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  if (a1)
  {
    v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    v6 = v5;
    if (v5
      && (wifi_manager_copy_networks_at_location(v5[1], 0, &length[1], length, a2, a3), *(_QWORD *)&length[1])
      && length[0]
      && (v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0)
    {
      v8 = v7;
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
      if (!NetworksFromRecords)
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      CFRelease(v8);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      NetworksFromRecords = 0;
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    NetworksFromRecords = 0;
    v6 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v6);
  return NetworksFromRecords;
}

__CFArray *WiFiManagerClientCopyScoreSortedKnownNetworksNearLocation(uint64_t a1, double a2, double a3)
{
  unsigned int *v5;
  unsigned int *v6;
  const __CFArray *v7;
  const __CFArray *v8;
  __CFArray *NetworksFromRecords;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  if (a1)
  {
    v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
    v6 = v5;
    if (v5
      && (wifi_manager_copy_networks_at_location(v5[1], 1, &length[1], length, a2, a3), *(_QWORD *)&length[1])
      && length[0]
      && (v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0)
    {
      v8 = v7;
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
      if (!NetworksFromRecords)
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      CFRelease(v8);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      NetworksFromRecords = 0;
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    NetworksFromRecords = 0;
    v6 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v6);
  return NetworksFromRecords;
}

CFPropertyListRef WiFiManagerClientCopyScoreForNetwork(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  int v8;
  const UInt8 *BytePtr;
  int v10;
  CFPropertyListRef v11;
  uint64_t v12;
  uint64_t v13;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v13 = 0;
    v12 = 0;
    v3 = 0;
    goto LABEL_14;
  }
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v3 || (v4 = WiFiNetworkCopyRecord(a2)) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v13 = 0;
    v12 = 0;
LABEL_14:
    v11 = 0;
    goto LABEL_10;
  }
  v5 = v4;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
  if (BinaryData)
  {
    v7 = BinaryData;
    v8 = v3[1];
    BytePtr = CFDataGetBytePtr(BinaryData);
    v10 = CFDataGetLength(v7);
    wifi_manager_copy_score_for_network(v8, (uint64_t)BytePtr, v10, &length[1], length);
    if (!*(_QWORD *)&length[1] || !length[0] || (v11 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) == 0)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v11 = 0;
    }
    CFRelease(v7);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v11 = 0;
  }
  CFRelease(v5);
  v12 = *(_QWORD *)&length[1];
  v13 = length[0];
LABEL_10:
  _WiFiVMDealloc(v12, v13);
  WiFiSendRightRelease(v3);
  return v11;
}

CFPropertyListRef WiFiManagerClientCopySoftErrorCounters(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  BOOL v4;
  CFPropertyListRef v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_copy_softerror_counters(v1[1], &length[1], length);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
  if (*(_QWORD *)&length[1])
    v4 = length[0] == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_9;
  v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

BOOL WiFiManagerClientGetAirplaneModePowerPreference(uint64_t a1)
{
  CFPropertyListRef v1;
  const void *v2;
  CFTypeID TypeID;
  _BOOL8 v4;

  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  v1 = WiFiManagerClientCopyProperty(a1, CFSTR("KeepWiFiPoweredAirplaneMode"));
  if (!v1)
    return 0;
  v2 = v1;
  TypeID = CFBooleanGetTypeID();
  v4 = TypeID == CFGetTypeID(v2) && CFBooleanGetValue((CFBooleanRef)v2) != 0;
  CFRelease(v2);
  return v4;
}

void WiFiManagerClientSetAirplaneModePowerPreference(uint64_t a1, int a2)
{
  const __CFData **v2;

  if (a1)
  {
    v2 = (const __CFData **)MEMORY[0x1E0C9AE50];
    if (!a2)
      v2 = (const __CFData **)MEMORY[0x1E0C9AE40];
    WiFiManagerClientSetProperty(a1, CFSTR("KeepWiFiPoweredAirplaneMode"), *v2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

_WORD *WiFiManagerClientCopyCurrentSessionBasedNetwork(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  CFPropertyListRef v3;
  const void *v4;
  _WORD *v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1
    && (wifi_manager_copy_current_session_based_network(v1[1], &length[1], length),
        (v3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0])) != 0))
  {
    v4 = v3;
    v5 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v3);
    CFRelease(v4);
  }
  else
  {
    v5 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v5;
}

uint64_t WiFiManagerClientGetUserAutoJoinState(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_user_auto_join_state(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientEnableUserAutoJoin(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_set_user_auto_join_state(v1[1], 1);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientDisableUserAutoJoin(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_set_user_auto_join_state(v1[1], 0);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientRegisterUserAutoJoinStateChangedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 272) = a2;
  *(_QWORD *)(a1 + 280) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 0x4000000);
  else
    __WiFiManagerClientAndEventMask(a1, -67108865);
}

uint64_t _wifi_manager_client_dispatch_auto_join_state_change(unsigned int a1, unsigned __int8 a2, UInt8 *a3, unsigned int a4)
{
  _QWORD *v7;
  _QWORD *v8;
  CFPropertyListRef v9;
  void (*v10)(_QWORD *, _QWORD, CFPropertyListRef, _QWORD);

  v7 = WiFiPortCacheCopy(a1);
  if (v7)
  {
    v8 = v7;
    v9 = _WiFiCopyUnserialized(a3, a4);
    if ((*((_BYTE *)v8 + 75) & 4) != 0)
    {
      v10 = (void (*)(_QWORD *, _QWORD, CFPropertyListRef, _QWORD))v8[34];
      if (v10)
        v10(v8, a2, v9, v8[35]);
    }
    CFRelease(v8);
    if (v9)
      CFRelease(v9);
  }
  _WiFiVMDealloc((uint64_t)a3, a4);
  return 0;
}

uint64_t _wifi_manager_client_dispatch_managed_apple_id_state_change(unsigned int a1, unsigned __int8 a2)
{
  const void *v3;
  const void *v4;
  void (*v5)(const void *, _QWORD, _QWORD);

  v3 = WiFiPortCacheCopy(a1);
  if (v3)
  {
    v4 = v3;
    if ((*((_BYTE *)v3 + 76) & 1) != 0)
    {
      v5 = (void (*)(const void *, _QWORD, _QWORD))*((_QWORD *)v3 + 38);
      if (v5)
        v5(v3, a2, *((_QWORD *)v3 + 39));
    }
    CFRelease(v4);
  }
  return 0;
}

void WiFiManagerClientRemoveOrphanedSCNetworkSets(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_remove_orphaned_sc_network_sets(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientMigrateList(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_migrate_list(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientRemoveUnusedNetworkGeotags(uint64_t a1, double a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_remove_unused_network_geotags(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientScheduleUnusedNetworkGeotagsRemovalTest(uint64_t a1, int a2, double a3)
{
  unsigned int *v5;
  unsigned int *v6;

  v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    v6 = v5;
    wifi_manager_schedule_unused_network_geotags_removal_test(v5[1], a2, a3);
    WiFiSendRightRelease(v6);
  }
}

void WiFiManagerClientUnScheduleUnusedNetworkGeotagsRemovalTest(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_unschedule_unused_network_geotags_removal_test(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

uint64_t _wifi_manager_client_dispatch_preferred_networks_change(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  _QWORD *v5;
  _QWORD *v6;
  CFPropertyListRef v7;
  const void *v8;
  void (*v9)(_QWORD *, CFPropertyListRef, _QWORD);

  v5 = WiFiPortCacheCopy(a1);
  if (v5)
  {
    v6 = v5;
    v7 = _WiFiCopyUnserialized(a2, a3);
    if (v7)
    {
      v8 = v7;
      if ((*((_BYTE *)v6 + 75) & 0x20) != 0)
      {
        v9 = (void (*)(_QWORD *, CFPropertyListRef, _QWORD))v6[36];
        if (v9)
          v9(v6, v7, v6[37]);
      }
      CFRelease(v6);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v8 = v6;
    }
    CFRelease(v8);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0;
}

uint64_t WiFiManagerClientSimulateNotification(uint64_t a1, CFDictionaryRef a2, int a3, const __CFData *a4)
{
  unsigned int *v7;
  CFAllocatorRef *v8;
  CFDictionaryRef v9;
  const __CFData *BinaryData;
  const __CFData *v11;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v14;
  const UInt8 *v15;
  int v16;
  uint64_t v17;

  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v7 = 0;
    goto LABEL_20;
  }
  v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7)
    goto LABEL_18;
  v8 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (!a2)
  {
    v11 = 0;
    BytePtr = 0;
    Length = 0;
    if (a4)
      goto LABEL_7;
LABEL_10:
    v15 = 0;
    v16 = 0;
LABEL_11:
    wifi_manager_simulate_notification(v7[1], (uint64_t)BytePtr, Length, a3, (uint64_t)v15, v16);
    v17 = 0;
    if (!v11)
      goto LABEL_13;
    goto LABEL_12;
  }
  v9 = WiFiNetworkCopyRecord((uint64_t)a2);
  if (!v9)
  {
LABEL_18:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_20:
    v17 = 74;
    goto LABEL_17;
  }
  a2 = v9;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData(*v8, v9);
  if (!BinaryData)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v17 = 74;
LABEL_16:
    CFRelease(a2);
    goto LABEL_17;
  }
  v11 = BinaryData;
  BytePtr = CFDataGetBytePtr(BinaryData);
  Length = CFDataGetLength(v11);
  if (!a4)
    goto LABEL_10;
LABEL_7:
  v14 = (const __CFData *)_CFPropertyListCreateBinaryData(*v8, a4);
  a4 = v14;
  if (v14)
  {
    v15 = CFDataGetBytePtr(v14);
    v16 = CFDataGetLength(a4);
    goto LABEL_11;
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  v17 = 74;
  if (v11)
LABEL_12:
    CFRelease(v11);
LABEL_13:
  if (a4)
    CFRelease(a4);
  if (a2)
    goto LABEL_16;
LABEL_17:
  WiFiSendRightRelease(v7);
  return v17;
}

void WiFiManagerClientSetAutoInstantHotspotMode(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_auto_instant_hotspot_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetAutoInstantHotspotMode(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v4;

  v4 = 1;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_auto_instant_hotspot_mode(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetShareMyPersonalHotspotMode(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_share_personal_hotspot_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetShareMyPersonalHotspotMode(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v4;

  v4 = 1;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_get_share_personal_hotspot_mode(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientSetAutoInstantHotspotTestMode(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_auto_instant_hotspot_test_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientSetAutoInstantHotspotTriggerInterval(uint64_t a1, double a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_auto_instant_hotspot_trigger_interval(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientTriggerGizmoSyncPasswordCheck(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0xFFFFFFFFLL;
  v2 = v1;
  wifi_manager_tigger_gizmo_sync_password_check(v1[1]);
  WiFiSendRightRelease(v2);
  return 0;
}

CFPropertyListRef WiFiManagerClientCopySSIDRepresentingMostUsedNetworkGeoTaggedToCurrentDeviceLocation(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  CFPropertyListRef v6;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  wifi_manager_copy_ssid_most_used_geo_tagged_to_current_location(v1[1], &length[1], length);
  v3 = *(_QWORD *)&length[1];
  v4 = length[0];
  if (*(_QWORD *)&length[1])
    v5 = length[0] == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    v3 = *(_QWORD *)&length[1];
    v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

uint64_t WiFiManagerClientIsHotspotWPA3PersonalSupported(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_hotspot_wpa3_personal_supported(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

BOOL WiFiManagerClientIsInfraAllowed(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_infra_allowed(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientIsP2PAllowed(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_p2p_allowed(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4 != 0;
}

BOOL WiFiManagerClientSetNetworkProperty(uint64_t a1, uint64_t a2, const void *a3, const void *a4)
{
  unsigned int *v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  const __CFAllocator *v10;
  const __CFData *BinaryData;
  const __CFData *v12;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v15;
  const __CFData *v16;
  const UInt8 *v17;
  int v18;
  const __CFData *v19;
  const __CFData *v20;
  const UInt8 *v21;
  int v22;
  int v24;

  v24 = -3902;
  v7 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v7)
    goto LABEL_18;
  v8 = WiFiNetworkCopyRecord(a2);
  if (!v8)
    goto LABEL_18;
  v9 = v8;
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
  v12 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v12);
  }
  else
  {
    BytePtr = 0;
    Length = 0;
  }
  v15 = (const __CFData *)_CFPropertyListCreateBinaryData(v10, a3);
  v16 = v15;
  if (v15)
  {
    v17 = CFDataGetBytePtr(v15);
    v18 = CFDataGetLength(v16);
    if (!a4)
      goto LABEL_13;
  }
  else
  {
    v17 = 0;
    v18 = 0;
    if (!a4)
      goto LABEL_13;
  }
  v19 = (const __CFData *)_CFPropertyListCreateBinaryData(v10, a4);
  if (v19)
  {
    v20 = v19;
    v21 = CFDataGetBytePtr(v19);
    v22 = CFDataGetLength(v20);
    wifi_manager_set_network_property(v7[1], (uint64_t)BytePtr, Length, (uint64_t)v17, v18, (uint64_t)v21, v22, &v24);
    CFRelease(v20);
    if (!v16)
      goto LABEL_15;
    goto LABEL_14;
  }
LABEL_13:
  wifi_manager_set_network_property(v7[1], (uint64_t)BytePtr, Length, (uint64_t)v17, v18, 0, 0, &v24);
  if (v16)
LABEL_14:
    CFRelease(v16);
LABEL_15:
  if (v12)
    CFRelease(v12);
  CFRelease(v9);
LABEL_18:
  WiFiSendRightRelease(v7);
  return v24 == 0;
}

unsigned int *WiFiManagerClientSetFamilyHotspotPreferences(uint64_t a1, const void *a2)
{
  unsigned int *result;
  unsigned int *v4;
  const __CFAllocator *v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v10;
  const __CFData *v11;
  const UInt8 *v12;
  int v13;
  int v14;

  v14 = -3902;
  result = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (result)
  {
    v4 = result;
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], CFSTR("FamilyHotspotPreferences"));
    v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v7);
      if (!a2)
        goto LABEL_9;
    }
    else
    {
      BytePtr = 0;
      Length = 0;
      if (!a2)
        goto LABEL_9;
    }
    v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a2);
    if (v10)
    {
      v11 = v10;
      v12 = CFDataGetBytePtr(v10);
      v13 = CFDataGetLength(v11);
      wifi_manager_set_property(v4[1], (uint64_t)BytePtr, Length, (uint64_t)v12, v13, &v14);
      CFRelease(v11);
      if (!v7)
        goto LABEL_11;
      goto LABEL_10;
    }
LABEL_9:
    wifi_manager_set_property(v4[1], (uint64_t)BytePtr, Length, 0, 0, &v14);
    if (!v7)
    {
LABEL_11:
      WiFiSendRightRelease(v4);
      return (unsigned int *)(v14 == 0);
    }
LABEL_10:
    CFRelease(v7);
    goto LABEL_11;
  }
  return result;
}

CFPropertyListRef WiFiManagerClientCopyFamilyHotspotPreferences(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  unsigned int v4;
  BOOL v5;
  CFPropertyListRef v6;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!v1)
    return 0;
  v2 = v1;
  wifi_manager_copy_family_hotspot_preferences(v1[1], &length[1], length);
  v3 = *(_QWORD *)&length[1];
  v4 = length[0];
  if (*(_QWORD *)&length[1])
    v5 = length[0] == 0;
  else
    v5 = 1;
  if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    v3 = *(_QWORD *)&length[1];
    v4 = length[0];
  }
  _WiFiVMDealloc(v3, v4);
  WiFiSendRightRelease(v2);
  return v6;
}

void WiFiManagerClientSetBuiltInReceiver(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_built_in_receiver(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientIsPersonalHotspotModificationDisabled(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_personal_hotspot_modification_disabled(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

void WiFiManagerClientRegisterUIEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 320) = a2;
  *(_QWORD *)(a1 + 328) = a3;
  if (a2)
    __WiFiManagerClientOrEventMask(a1, 0x200000000);
  else
    __WiFiManagerClientAndEventMask(a1, 0xFFFFFFFDFFFFFFFFLL);
}

void WiFiManagerClientSetAdaptiveRoamingParams(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2)) != 0)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_set_adaptive_roam_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_adaptive_roam_params(v4[1], 0, 0);
    }
    WiFiSendRightRelease(v4);
  }
}

uint64_t _wifi_manager_client_dispatch_ui_event(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  _QWORD *v5;
  _QWORD *v6;
  CFPropertyListRef v7;
  const void *v8;
  void (*v9)(_QWORD *, CFPropertyListRef, _QWORD);

  v5 = WiFiPortCacheCopy(a1);
  if (v5)
  {
    v6 = v5;
    v7 = _WiFiCopyUnserialized(a2, a3);
    if (v7)
    {
      v8 = v7;
      if ((*((_BYTE *)v6 + 76) & 2) != 0)
      {
        v9 = (void (*)(_QWORD *, CFPropertyListRef, _QWORD))v6[40];
        if (v9)
          v9(v6, v7, v6[41]);
      }
      CFRelease(v6);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v8 = v6;
    }
    CFRelease(v8);
  }
  _WiFiVMDealloc((uint64_t)a2, a3);
  return 0;
}

CFPropertyListRef WiFiManagerClientCopyMacRandomisationParameters(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  unsigned int v3;
  BOOL v4;
  CFPropertyListRef v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (!v1)
  {
    v3 = 0;
LABEL_9:
    v5 = 0;
    goto LABEL_7;
  }
  wifi_manager_get_mac_randomisation_parameters(v1[1], &length[1], length);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
  if (*(_QWORD *)&length[1])
    v4 = length[0] == 0;
  else
    v4 = 1;
  if (v4)
    goto LABEL_9;
  v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  v1 = *(unsigned int **)&length[1];
  v3 = length[0];
LABEL_7:
  _WiFiVMDealloc((uint64_t)v1, v3);
  WiFiSendRightRelease(v2);
  return v5;
}

const __CFData *WiFiManagerClientGetPrivateMacNetworkSwitchState(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *result;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;
  unsigned int v9;

  v9 = 0;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (!a2)
    return 0;
  v4 = v3;
  result = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (result)
  {
    v6 = result;
    BytePtr = CFDataGetBytePtr(result);
    Length = CFDataGetLength(v6);
    if (v4)
    {
      wifi_manager_get_privatemac_network_switch_state(v4[1], (uint64_t)BytePtr, Length, (int *)&v9);
      WiFiSendRightRelease(v4);
    }
    CFRelease(v6);
    return (const __CFData *)v9;
  }
  return result;
}

void WiFiManagerClientSetUserInteractionOverride(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v4 = 0;
    goto LABEL_7;
  }
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  if (!a2)
  {
    wifi_manager_set_user_interaction_override(v3[1], 0, 0);
    goto LABEL_7;
  }
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (!BinaryData)
  {
LABEL_8:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    goto LABEL_7;
  }
  v6 = BinaryData;
  BytePtr = CFDataGetBytePtr(BinaryData);
  Length = CFDataGetLength(v6);
  wifi_manager_set_user_interaction_override(v4[1], (uint64_t)BytePtr, Length);
  CFRelease(v6);
LABEL_7:
  WiFiSendRightRelease(v4);
}

void WiFiManagerClientSetUserInteractionNwOverride(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v4 = 0;
    goto LABEL_7;
  }
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v4 = v3;
  if (!v3)
    goto LABEL_8;
  if (!a2)
  {
    wifi_manager_set_user_interaction_nw_override(v3[1], 0, 0);
    goto LABEL_7;
  }
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (!BinaryData)
  {
LABEL_8:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    goto LABEL_7;
  }
  v6 = BinaryData;
  BytePtr = CFDataGetBytePtr(BinaryData);
  Length = CFDataGetLength(v6);
  wifi_manager_set_user_interaction_nw_override(v4[1], (uint64_t)BytePtr, Length);
  CFRelease(v6);
LABEL_7:
  WiFiSendRightRelease(v4);
}

BOOL WiFiManagerClientSetPrivateMacPrefForScanRecord(uint64_t a1, const void *a2, const void *a3, int a4)
{
  const __CFAllocator *v7;
  const __CFData *BinaryData;
  const __CFData *v9;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v12;
  const __CFData *v13;
  const UInt8 *v14;
  int v15;
  unsigned int *v16;
  unsigned int *v17;
  int v19;

  v19 = 0;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v9 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v9);
  }
  else
  {
    BytePtr = 0;
    Length = 0;
  }
  v12 = (const __CFData *)_CFPropertyListCreateBinaryData(v7, a3);
  v13 = v12;
  if (v12)
  {
    v14 = CFDataGetBytePtr(v12);
    v15 = CFDataGetLength(v13);
  }
  else
  {
    v14 = 0;
    v15 = 0;
  }
  v16 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v16)
  {
    v17 = v16;
    wifi_manager_set_private_mac_pref(v16[1], (uint64_t)BytePtr, Length, a4, (uint64_t)v14, v15, &v19);
    WiFiSendRightRelease(v17);
  }
  if (v13)
    CFRelease(v13);
  if (v9)
    CFRelease(v9);
  return v19 == 0;
}

CFDataRef WiFiManagerClientCreatePrivateMacAddress(int a1, const __CFData *a2, const __CFData *a3, const __CFData *a4, CFStringRef theString)
{
  return WiFiNetworkCreatePrivateMacAddress(a2, a3, a4, theString);
}

void WiFiManagerClientSetMacRandomisationParams(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2)) != 0)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_set_mac_randomisation_params(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_set_mac_randomisation_params(v4[1], 0, 0);
    }
    WiFiSendRightRelease(v4);
  }
}

void WiFiManagerClientUpdatePrivateMacNetwork(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  int v8;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
      if (BinaryData)
      {
        v7 = BinaryData;
        v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v7);
        wifi_manager_update_privateMac_network(v8, (uint64_t)BytePtr, Length);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }
  WiFiSendRightRelease(v3);
}

BOOL WiFiManagerClientPrivateMacIsQuickProbeRequired(uint64_t a1, uint64_t a2)
{
  unsigned int *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  mach_port_t v8;
  const UInt8 *BytePtr;
  int Length;
  int v12;

  v12 = 0;
  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = WiFiNetworkCopyRecord(a2);
    if (v4)
    {
      v5 = v4;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v4);
      if (BinaryData)
      {
        v7 = BinaryData;
        v8 = v3[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v7);
        wifi_manager_private_mac_is_quick_probe_required(v8, (uint64_t)BytePtr, Length, &v12);
        CFRelease(v7);
      }
      CFRelease(v5);
    }
  }
  WiFiSendRightRelease(v3);
  return v12 != 0;
}

void WiFiManagerClientPrivateMacReportProbeResult(uint64_t a1, uint64_t a2, int a3)
{
  unsigned int *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  const __CFData *BinaryData;
  const __CFData *v9;
  mach_port_t v10;
  const UInt8 *BytePtr;
  int Length;

  v5 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v5)
  {
    v6 = WiFiNetworkCopyRecord(a2);
    if (v6)
    {
      v7 = v6;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
      if (BinaryData)
      {
        v9 = BinaryData;
        v10 = v5[1];
        BytePtr = CFDataGetBytePtr(BinaryData);
        Length = CFDataGetLength(v9);
        wifi_manager_private_mac_probe_result(v10, a3, (uint64_t)BytePtr, Length);
        CFRelease(v9);
      }
      CFRelease(v7);
    }
  }
  WiFiSendRightRelease(v5);
}

uint64_t WiFiManagerClientIsMultiBand(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v4;

  v4 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_is_multi_band(v1[1], &v4);
  WiFiSendRightRelease(v2);
  return v4;
}

uint64_t WiFiManagerClientGetHardwareFailure(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  uint64_t v3;
  int v5;

  v5 = -1;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
  {
    wifi_manager_get_hardware_failure(v1[1], &v5);
    if (v5 == 1)
      v3 = 1;
    else
      v3 = 2 * (v5 == 2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v3 = 0;
  }
  WiFiSendRightRelease(v2);
  return v3;
}

void WiFiManagerClientResetNetworkSettings(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_reset_network_settings(v1[1]);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  WiFiSendRightRelease(v2);
}

void WiFiManagerClientPurgeExpiredKnownNetworks(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (v1)
    wifi_manager_purge_expired_known_networks(v1[1]);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  WiFiSendRightRelease(v2);
}

void WiFiManagerClientCleanupLogBufferFiles(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;

  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_cleanup_log_buffer_files(v1[1]);
    WiFiSendRightRelease(v2);
  }
}

void WiFiManagerClientWiFiCallHandoverNotification(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v4 = v3;
  if (v3)
    wifi_manager_wificall_handover_notification(v3[1], a2);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  WiFiSendRightRelease(v4);
}

uint64_t WiFiManagerClientSetAWDLMacAddressInUse(uint64_t a1, int a2)
{
  void *v3;

  v3 = (void *)objc_msgSend(MEMORY[0x1E0DD9A10], "shared");
  if (a2)
    return objc_msgSend(v3, "beginTransaction:completionHandler:", 15, 0);
  else
    return objc_msgSend(v3, "endTransaction:", 15);
}

CFPropertyListRef WiFiManagerClientCopyMovementStates(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  CFPropertyListRef v3;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v2 = 0;
    goto LABEL_10;
  }
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  v2 = v1;
  if (!v1 || (wifi_manager_copy_movement_states(v1[1], &length[1], length), !*(_QWORD *)&length[1]) || !length[0])
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_10:
    v3 = 0;
    goto LABEL_7;
  }
  v3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (!v3)
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_7:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  WiFiSendRightRelease(v2);
  return v3;
}

void WiFiManagerClientSetSimulatedMovementStates(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  const __CFData *BinaryData;
  const __CFData *v5;
  mach_port_t v6;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    if (BinaryData)
    {
      v5 = BinaryData;
      v6 = v3[1];
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v5);
      wifi_manager_set_simulated_movement_states(v6, (uint64_t)BytePtr, Length);
      CFRelease(v5);
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  WiFiSendRightRelease(v3);
}

void WiFiManagerClientSetBatterySaveMode(uint64_t a1, int a2)
{
  unsigned int *v3;
  unsigned int *v4;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    wifi_manager_set_battery_save_mode(v3[1], a2);
    WiFiSendRightRelease(v4);
  }
}

uint64_t WiFiManagerClientGetBatterySaveMode(uint64_t a1)
{
  unsigned int *v1;
  unsigned int *v2;
  int v5;

  v5 = 0;
  v1 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v1)
  {
    v2 = v1;
    wifi_manager_get_battery_save_mode(v1[1], &v5);
    WiFiSendRightRelease(v2);
    return v5;
  }
  else
  {
    return 0;
  }
}

void WiFiManagerClientInitiateColocatedNetworkTransition(uint64_t a1, const void *a2)
{
  unsigned int *v3;
  unsigned int *v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;

  v3 = __WiFiManagerClientGetOrReconnectServerPort(a1, 0);
  if (v3)
  {
    v4 = v3;
    if (a2
      && (BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2)) != 0)
    {
      v6 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      wifi_manager_initiate_network_transition(v4[1], (uint64_t)BytePtr, Length);
      CFRelease(v6);
    }
    else
    {
      wifi_manager_initiate_network_transition(v4[1], 0, 0);
    }
    WiFiSendRightRelease(v4);
  }
}

uint64_t _WiFiManagerClientGetCoreWiFiInterface(uint64_t a1)
{
  void *v2;
  _QWORD v4[5];

  if (!*(_QWORD *)(a1 + 344))
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D1BA48]), "initWithServiceType:", 7);
    *(_QWORD *)(a1 + 344) = v2;
    if (v2)
    {
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = ___WiFiManagerClientGetCoreWiFiInterface_block_invoke;
      v4[3] = &__block_descriptor_40_e5_v8__0l;
      v4[4] = a1;
      objc_msgSend(v2, "setInvalidationHandler:", v4);
      objc_msgSend(*(id *)(a1 + 344), "activate");
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  return *(_QWORD *)(a1 + 344);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t WiFiDeviceClientGetTypeID()
{
  uint64_t result;

  result = __wiFiDeviceTypeID;
  if (!__wiFiDeviceTypeID)
  {
    pthread_once(&__wiFiDeviceTypeInit, (void (*)(void))__WiFiDeviceClientRegister);
    return __wiFiDeviceTypeID;
  }
  return result;
}

uint64_t _WiFiDeviceClientGetServerPort(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t _WiFiDeviceClientSetServerPort(uint64_t result, int a2)
{
  *(_DWORD *)(result + 16) = a2;
  return result;
}

void WiFiDeviceClientSetProperty(uint64_t a1, const void *a2, const void *a3)
{
  const __CFAllocator *v5;
  const __CFData *BinaryData;
  const __CFData *v7;
  const UInt8 *BytePtr;
  int Length;
  const __CFData *v10;
  const __CFData *v11;
  const UInt8 *v12;
  int v13;
  int v14;
  const UInt8 *v15;
  int v16;

  if (a1 && a2)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v7);
    }
    else
    {
      BytePtr = 0;
      Length = 0;
    }
    v10 = (const __CFData *)_CFPropertyListCreateBinaryData(v5, a3);
    v11 = v10;
    if (v10)
    {
      v12 = CFDataGetBytePtr(v10);
      v13 = CFDataGetLength(v11);
    }
    else
    {
      v12 = 0;
      v13 = 0;
    }
    v14 = *(_DWORD *)(a1 + 16);
    v15 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v16 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_property(v14, (uint64_t)v15, v16, (uint64_t)BytePtr, Length, (uint64_t)v12, v13);
    if (v7)
      CFRelease(v7);
    if (v11)
      CFRelease(v11);
  }
}

uint64_t WiFiDeviceClientRegisterRemovalCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 80) = a2;
  *(_QWORD *)(a1 + 88) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFF7 | (8 * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterScanCacheUpdateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 224) = a2;
  *(_QWORD *)(a1 + 232) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(a2 != 0) << 6);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterScanCacheUpdateCallback2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 240) = a2;
  *(_QWORD *)(a1 + 248) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFBFLL | ((unint64_t)(a2 != 0) << 6);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterLinkCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 96) = a2;
  *(_QWORD *)(a1 + 104) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFFDLL | (2 * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 448) = a2;
  *(_QWORD *)(a1 + 456) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFFFFDLL | (2 * (a2 != 0));
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterAutoJoinNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 464) = a2;
  *(_QWORD *)(a1 + 472) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFF7FFFFFLL | ((unint64_t)(a2 != 0) << 23);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterUserJoinNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 480) = a2;
  *(_QWORD *)(a1 + 488) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFBFFFFFFFFLL | ((unint64_t)(a2 != 0) << 34);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDecryptionCallback(uint64_t result, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(result + 112) = a2;
  *(_QWORD *)(result + 120) = a3;
  return result;
}

uint64_t WiFiDeviceClientRegisterResumeScanCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 128) = a2;
  *(_QWORD *)(a1 + 136) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFF7FFLL | ((unint64_t)(a2 != 0) << 11);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBgScanSuspendResumeCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 288) = a2;
  *(_QWORD *)(a1 + 296) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFFEFFFLL | ((unint64_t)(a2 != 0) << 12);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterWeightAvgLQMCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 320) = a2;
  *(_QWORD *)(a1 + 328) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFF7FFFFFFFLL | ((unint64_t)(a2 != 0) << 31);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBTCoexStatsCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 336) = a2;
  *(_QWORD *)(a1 + 344) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFBFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 42);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBSPEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 624) = a2;
  *(_QWORD *)(a1 + 632) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFF7FFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 43);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterUCMEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 640) = a2;
  *(_QWORD *)(a1 + 648) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFDFFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 45);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterCatsUpdateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 352) = a2;
  *(_QWORD *)(a1 + 360) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFEFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 40);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterBTScanIntervalRelaxCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 368) = a2;
  *(_QWORD *)(a1 + 376) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFF7FFFFFFFFLL | ((unint64_t)(a2 != 0) << 35);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegister24GHzNetworkInCriticalStateCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 384) = a2;
  *(_QWORD *)(a1 + 392) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFBFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 38);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterM1M4Handshake24GHzCountCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 400) = a2;
  *(_QWORD *)(a1 + 408) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFF7FFFFFFFFFLL | ((unint64_t)(a2 != 0) << 39);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDiagnosticsCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 432) = a2;
  *(_QWORD *)(a1 + 440) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFFF7FFFLL | ((unint64_t)(a2 != 0) << 15);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterDeviceAvailableCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 528) = a2;
  *(_QWORD *)(a1 + 536) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFFEFFFFFLL | ((unint64_t)(a2 != 0) << 20);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientRegisterTdConfirmedCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 656) = a2;
  *(_QWORD *)(a1 + 664) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFBFFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 46);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientCopyCurrentNetworkAsync(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  _QWORD *v9;
  _QWORD *v10;
  NSObject *v11;

  if (!a1)
    return 4294963396;
  result = 4294963396;
  if (a2 && *(_QWORD *)(a1 + 56))
  {
    v9 = malloc_type_malloc(0x20uLL, 0xA0040069AE433uLL);
    if (v9)
    {
      v10 = v9;
      *v9 = a4;
      v9[1] = a1;
      v9[2] = a3;
      dispatch_retain(a2);
      v10[3] = a2;
      v11 = dispatch_queue_create("com.apple.wifid.queue", 0);
      dispatch_async_f(v11, v10, (dispatch_function_t)_dispatchCopyCurrentNetwork);
      dispatch_release(v11);
      return 0;
    }
    else
    {
      return 4294963395;
    }
  }
  return result;
}

void _dispatchCopyCurrentNetwork(uint64_t a1)
{
  _WORD *v2;
  NSObject *v3;
  _QWORD v4[6];

  if (a1)
  {
    v2 = WiFiDeviceClientCopyCurrentNetwork(*(_QWORD *)(a1 + 8));
    v3 = *(NSObject **)(a1 + 24);
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = ___dispatchCopyCurrentNetwork_block_invoke;
    v4[3] = &__block_descriptor_48_e5_v8__0l;
    v4[4] = a1;
    v4[5] = v2;
    dispatch_async(v3, v4);
  }
}

BOOL WiFiDeviceClientIsInterfaceAWDL(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == 6;
}

BOOL WiFiDeviceClientIsInterfaceHostAp(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) == 7;
}

uint64_t WiFiDeviceClientSetPower(uint64_t a1, int a2)
{
  mach_port_t v4;
  const UInt8 *BytePtr;
  int Length;
  int v8;

  v8 = -3902;
  v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_power(v4, (uint64_t)BytePtr, Length, a2, &v8);
  if (v8)
    return 4294963394;
  else
    return 0;
}

uint64_t WiFiDeviceClientAssociateAsync(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  const __CFData *BinaryData;
  const __CFData *v9;
  mach_port_t v10;
  const UInt8 *BytePtr;
  int Length;
  const UInt8 *v13;
  int v14;
  int v16;

  v5 = 4294963394;
  v16 = -3902;
  *(_QWORD *)(a1 + 176) = a3;
  *(_QWORD *)(a1 + 184) = a4;
  v6 = WiFiNetworkCopyRecord(a2);
  if (v6)
  {
    v7 = v6;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v6);
    if (BinaryData)
    {
      v9 = BinaryData;
      v10 = *(_DWORD *)(a1 + 16);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      v13 = CFDataGetBytePtr(v9);
      v14 = CFDataGetLength(v9);
      wifi_device_assoc_async(v10, (uint64_t)BytePtr, Length, (uint64_t)v13, v14, &v16);
      CFRelease(v9);
    }
    CFRelease(v7);
    if (v16)
      return 4294963394;
    else
      return 0;
  }
  return v5;
}

uint64_t WiFiDeviceClientAssociateCancel(uint64_t result)
{
  *(_QWORD *)(result + 176) = 0;
  *(_QWORD *)(result + 184) = 0;
  return result;
}

uint64_t WiFiDeviceClientDisassociate(uint64_t a1)
{
  int v2;
  const UInt8 *BytePtr;
  int Length;

  v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_disassociate(v2, (uint64_t)BytePtr, Length);
  return 0;
}

uint64_t WiFiDeviceClientDisassociateWithReason(uint64_t a1, uint64_t a2, int a3)
{
  int v5;
  const UInt8 *BytePtr;
  int Length;

  if (a1)
  {
    v5 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_disassociate_with_reason(v5, (uint64_t)BytePtr, Length, a3);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  return 0;
}

uint64_t WiFiDeviceClientStartNetwork(uint64_t a1, int a2, const void *a3, uint64_t a4, uint64_t a5)
{
  const __CFData *BinaryData;
  uint64_t v10;
  mach_port_t v11;
  const UInt8 *BytePtr;
  int Length;
  const UInt8 *v14;
  int v15;
  unsigned int v17;

  v17 = 0;
  if ((a2 - 1) >= 4 || a2 != 4 && !a3 || !a4)
    goto LABEL_7;
  if (a3)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
    if (!BinaryData)
    {
LABEL_7:
      v10 = 22;
      v17 = 22;
LABEL_13:
      NSLog(CFSTR("%s Start network failed %d"), "WiFiDeviceClientStartNetwork", v10);
      return v17;
    }
  }
  else
  {
    BinaryData = 0;
  }
  *(_QWORD *)(a1 + 192) = a4;
  *(_QWORD *)(a1 + 200) = a5;
  NSLog(CFSTR("%s Starting network"), "WiFiDeviceClientStartNetwork");
  v11 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  if (BinaryData)
  {
    v14 = CFDataGetBytePtr(BinaryData);
    v15 = CFDataGetLength(BinaryData);
    wifi_device_start_network(v11, (uint64_t)BytePtr, Length, a2, (uint64_t)v14, v15, (int *)&v17);
    CFRelease(BinaryData);
  }
  else
  {
    wifi_device_start_network(v11, (uint64_t)BytePtr, Length, a2, 0, 0, (int *)&v17);
  }
  v10 = v17;
  if (v17)
    goto LABEL_13;
  return 0;
}

uint64_t WiFiDeviceClientStopNetwork(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  const __CFData *BinaryData;
  const __CFData *v11;
  mach_port_t v12;
  const UInt8 *BytePtr;
  int Length;
  const UInt8 *v15;
  int v16;
  unsigned int v17;

  v17 = 0;
  result = 22;
  if (a2 && a3)
  {
    v8 = WiFiNetworkCopyRecord(a2);
    if (v8)
    {
      v9 = v8;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
      if (BinaryData)
      {
        v11 = BinaryData;
        *(_QWORD *)(a1 + 208) = a3;
        *(_QWORD *)(a1 + 216) = a4;
        v12 = *(_DWORD *)(a1 + 16);
        BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
        Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
        v15 = CFDataGetBytePtr(v11);
        v16 = CFDataGetLength(v11);
        wifi_device_stop_network(v12, (uint64_t)BytePtr, Length, (uint64_t)v15, v16, (int *)&v17);
        CFRelease(v11);
      }
      else
      {
        v17 = 22;
      }
      CFRelease(v9);
      return v17;
    }
    else
    {
      return 22;
    }
  }
  return result;
}

uint64_t WiFiDeviceClientRegisterRangingReportCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 576) = a2;
  *(_QWORD *)(a1 + 584) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFFEFFFFFFLL | ((unint64_t)(a2 != 0) << 24);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  __CFRunLoop *RunLoop;
  const void *RunLoopMode;
  BOOL v7;
  _QWORD block[5];

  a1[68] = a2;
  a1[69] = a3;
  v4 = a1[8];
  if (a2)
  {
    a1[8] = v4 | 0x400000;
    _WiFiDeviceClientSendEventMaskToServer((uint64_t)a1);
    RunLoop = (__CFRunLoop *)_WiFiManagerClientGetRunLoop(a1[7]);
    RunLoopMode = (const void *)_WiFiManagerClientGetRunLoopMode(a1[7]);
    if (RunLoop)
      v7 = RunLoopMode == 0;
    else
      v7 = 1;
    if (!v7)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      CFRunLoopPerformBlock(RunLoop, RunLoopMode, block);
      CFRunLoopWakeUp(RunLoop);
    }
  }
  else
  {
    a1[8] = v4 & 0xFFFFFFFFFFBFFFFFLL;
    _WiFiDeviceClientSendEventMaskToServer((uint64_t)a1);
  }
}

uint64_t WiFiDeviceClientCopyInterfaceStateInfo(uint64_t a1, _QWORD *a2)
{
  mach_port_t v4;
  const UInt8 *BytePtr;
  unsigned int v6;
  CFPropertyListRef v7;
  int v9;
  unsigned int length[4];
  unsigned int v11;

  v11 = 0;
  *(_QWORD *)&length[1] = 0;
  length[0] = 0;
  if (*a2)
  {
    v9 = 22;
    goto LABEL_11;
  }
  v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v6 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_interface_state_info(v4, (uint64_t)BytePtr, v6, 0, &length[1], length, &v11);
  if (!v11)
  {
    if (*(_QWORD *)&length[1] && length[0])
    {
      v7 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      if (v7)
      {
        *a2 = v7;
        goto LABEL_7;
      }
      v9 = 94;
    }
    else
    {
      v9 = 5;
    }
LABEL_11:
    v11 = v9;
  }
LABEL_7:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v11;
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent(uint64_t a1, CFTypeRef cf)
{
  CFTypeID v4;
  void *v5;
  const void *Value;
  const void *v7;
  const void *v8;
  CFTypeID v9;
  uint64_t v10;
  const void *v11;
  _WORD *v12;
  const void *v13;
  const __CFArray *v14;
  const __CFArray *v15;
  CFIndex v16;
  NSObject *v17;
  const __CFDictionary *ValueAtIndex;
  const __CFData *v19;
  const ether_addr *BytePtr;
  char *v21;
  CFIndex Count;
  void (*v23)(uint64_t, CFTypeRef, _QWORD);
  CFTypeRef v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  CFTypeRef cfa;
  uint8_t buf[4];
  CFIndex v34;
  __int16 v35;
  CFIndex v36;
  __int16 v37;
  char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  cfa = 0;
  if (!a1)
    return;
  if (!cf)
    goto LABEL_24;
  v4 = CFGetTypeID(cf);
  if (v4 != CFDictionaryGetTypeID())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_2((uint64_t)cf, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_24;
  }
  v5 = (void *)CFRetain(cf);
  cfa = v5;
  Value = CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("WiFiHostApStateIdentifier"));
  if (Value && CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
    goto LABEL_15;
  v7 = CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("LINK_CHANGED_IS_LINKDOWN"));
  if (v7)
  {
    v8 = v7;
    v9 = CFGetTypeID(v7);
    if (v9 != CFBooleanGetTypeID())
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      {
        _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_1(v8);
        if (!v5)
        {
LABEL_11:
          v10 = WiFiDeviceClientCopyInterfaceStateInfo(a1, &cfa);
          v5 = (void *)cfa;
          if (!cfa)
          {
            objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v10));
            return;
          }
          goto LABEL_12;
        }
      }
      else if (!v5)
      {
        goto LABEL_11;
      }
      CFRelease(v5);
      cfa = 0;
      goto LABEL_11;
    }
  }
LABEL_12:
  v11 = CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("LINK_CHANGED_NETWORK"));
  if (v11)
  {
    v12 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v11);
    if (v12)
    {
      v13 = v12;
      CFDictionaryReplaceValue((CFMutableDictionaryRef)v5, CFSTR("LINK_CHANGED_NETWORK"), v12);
      CFRelease(v13);
    }
LABEL_15:
    v14 = (const __CFArray *)CFDictionaryGetValue((CFDictionaryRef)v5, CFSTR("LINK_CHANGED_PEER_LIST"));
    if (*(_QWORD *)(a1 + 544))
    {
      v15 = v14;
      if (v14)
      {
        if (CFArrayGetCount(v14) >= 1)
        {
          v16 = 0;
          v17 = MEMORY[0x1E0C81028];
          do
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v15, v16);
            if (ValueAtIndex)
            {
              v19 = (const __CFData *)CFDictionaryGetValue(ValueAtIndex, CFSTR("STATION_MAC"));
              if (v19)
              {
                BytePtr = (const ether_addr *)CFDataGetBytePtr(v19);
                v21 = ether_ntoa(BytePtr);
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  Count = CFArrayGetCount(v15);
                  *(_DWORD *)buf = 134218498;
                  v34 = v16 + 1;
                  v35 = 2048;
                  v36 = Count;
                  v37 = 2080;
                  v38 = v21;
                  _os_log_impl(&dword_1B9B9D000, v17, OS_LOG_TYPE_INFO, "Peer %ld of %ld: MAC:%s", buf, 0x20u);
                }
              }
            }
            ++v16;
          }
          while (v16 < CFArrayGetCount(v15));
        }
      }
    }
  }
LABEL_24:
  v23 = *(void (**)(uint64_t, CFTypeRef, _QWORD))(a1 + 544);
  v24 = cfa;
  if (v23)
    v23(a1, cfa, *(_QWORD *)(a1 + 552));
  if (v24)
    CFRelease(v24);
}

uint64_t WiFiDeviceClientRegisterRoamStatusEventCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 592) = a2;
  *(_QWORD *)(a1 + 600) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFFFFBFFFFFFFLL | ((unint64_t)(a2 != 0) << 30);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

uint64_t WiFiDeviceClientCopyHostedNetworks(uint64_t a1, __CFArray **a2)
{
  mach_port_t v4;
  const UInt8 *BytePtr;
  unsigned int v6;
  const __CFArray *v7;
  const __CFArray *v8;
  __CFArray *NetworksFromRecords;
  int v11;
  unsigned int length[4];
  unsigned int v13;

  v13 = 0;
  *(_QWORD *)&length[1] = 0;
  length[0] = 0;
  if (*a2)
  {
    v11 = 22;
LABEL_13:
    v13 = v11;
    goto LABEL_9;
  }
  v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v6 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_networks(v4, (uint64_t)BytePtr, v6, 0, &length[1], length, &v13);
  if (v13)
    goto LABEL_9;
  if (!*(_QWORD *)&length[1] || !length[0])
  {
    v11 = 5;
    goto LABEL_13;
  }
  v7 = (const __CFArray *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  if (!v7)
  {
    v11 = 94;
    goto LABEL_13;
  }
  v8 = v7;
  NetworksFromRecords = _WiFiCreateNetworksFromRecords(v7);
  if (NetworksFromRecords)
    *a2 = NetworksFromRecords;
  else
    v13 = 5;
  CFRelease(v8);
LABEL_9:
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientSetWiFiDirect(uint64_t a1, int a2)
{
  mach_port_t v4;
  const UInt8 *BytePtr;
  int Length;
  unsigned int v8;

  v8 = 0;
  if (!a1)
    WiFiDeviceClientSetWiFiDirect_cold_1();
  v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_wifi_direct_state(v4, (uint64_t)BytePtr, Length, a2, (int *)&v8);
  return v8;
}

uint64_t _WiFiDeviceClientDispatchAssociationResult(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  _QWORD *v5;

  v5 = (_QWORD *)(result + 176);
  v4 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(result + 176);
  if (v4)
  {
    result = v4(result, a2, a3, a4, *(_QWORD *)(result + 184));
    *v5 = 0;
    v5[1] = 0;
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchStartNetworkResult(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t result;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  const char *v19;
  __int16 v20;
  int v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 192);
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v18 = 136315906;
      v19 = "_WiFiDeviceClientDispatchStartNetworkResult";
      v20 = 1024;
      v21 = a2;
      v22 = 2112;
      v23 = a4;
      v24 = 2112;
      v25 = a3;
      _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: dispatching callback (error=%d) with response %@ and network %@", (uint8_t *)&v18, 0x26u);
      v4 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 192);
    }
    v4(a1, a2, a3, a4, *(_QWORD *)(a1 + 200));
    result = 0;
    *(_QWORD *)(a1 + 192) = 0;
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v10)
      _WiFiDeviceClientDispatchStartNetworkResult_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    return 2;
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchStopNetworkResult(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v3)(uint64_t, uint64_t, uint64_t, _QWORD);
  uint64_t result;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 208);
  if (v3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v16 = 136315650;
      v17 = "_WiFiDeviceClientDispatchStopNetworkResult";
      v18 = 1024;
      v19 = a2;
      v20 = 2112;
      v21 = a3;
      _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: dispatching callback (error=%d) with response %@", (uint8_t *)&v16, 0x1Cu);
      v3 = *(void (**)(uint64_t, uint64_t, uint64_t, _QWORD))(a1 + 208);
    }
    v3(a1, a2, a3, *(_QWORD *)(a1 + 216));
    result = 0;
    *(_QWORD *)(a1 + 208) = 0;
  }
  else
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v8)
      _WiFiDeviceClientDispatchStopNetworkResult_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    return 2;
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchPowerEvent(uint64_t result)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  v1 = *(uint64_t (**)(uint64_t, _QWORD))(result + 144);
  if (v1)
    return v1(result, *(_QWORD *)(result + 152));
  return result;
}

uint64_t _WiFiDeviceClientDispatchBssidEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 272);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 280));
  return result;
}

void _WiFiDeviceClientDispatchScanCacheUpdateEvent(_QWORD *a1, CFDictionaryRef theDict)
{
  const void *Value;
  const void *v5;
  CFTypeID v6;
  const __CFArray *v7;
  const __CFArray *v8;
  CFTypeID v9;
  __CFArray *NetworksFromRecords;
  void (*v11)(_QWORD *, __CFArray *, _QWORD, _QWORD);
  void (*v12)(_QWORD *, const void *, __CFArray *, _QWORD, _QWORD);

  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("scanRequest"));
    if (Value
      && (v5 = Value, v6 = CFGetTypeID(Value), v6 == CFDictionaryGetTypeID())
      && (v7 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("scanResults"))) != 0
      && (v8 = v7, v9 = CFGetTypeID(v7), v9 == CFArrayGetTypeID()))
    {
      NetworksFromRecords = _WiFiCreateNetworksFromRecords(v8);
      v11 = (void (*)(_QWORD *, __CFArray *, _QWORD, _QWORD))a1[28];
      if (v11)
        v11(a1, NetworksFromRecords, 0, a1[29]);
      v12 = (void (*)(_QWORD *, const void *, __CFArray *, _QWORD, _QWORD))a1[30];
      if (v12)
        v12(a1, v5, NetworksFromRecords, 0, a1[31]);
      if (NetworksFromRecords)
        CFRelease(NetworksFromRecords);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
}

uint64_t _WiFiDeviceClientDispatchLinkEvent(uint64_t result, CFDictionaryRef theDict)
{
  uint64_t v3;
  uint64_t (*v4)(uint64_t, _QWORD);
  const void *Value;
  _WORD *v6;
  const void *v7;

  v3 = result;
  v4 = *(uint64_t (**)(uint64_t, _QWORD))(result + 96);
  if (v4)
    result = v4(result, *(_QWORD *)(result + 104));
  if (*(_QWORD *)(v3 + 448))
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("LINK_CHANGED_NETWORK"));
    if (Value)
    {
      v6 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], Value);
      if (v6)
      {
        v7 = v6;
        CFDictionaryReplaceValue(theDict, CFSTR("LINK_CHANGED_NETWORK"), v6);
        CFRelease(v7);
      }
    }
    return (*(uint64_t (**)(uint64_t, CFDictionaryRef, _QWORD))(v3 + 448))(v3, theDict, *(_QWORD *)(v3 + 456));
  }
  return result;
}

void _WiFiDeviceClientDispatchAutoJoinNotification(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  _WORD *v5;
  void (*v6)(uint64_t, CFDictionaryRef, _QWORD);
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("autoJoinNetwork"));
    if (Value)
    {
      v5 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], Value);
      CFDictionaryReplaceValue(theDict, CFSTR("autoJoinNetwork"), v5);
      if (v5)
        CFRelease(v5);
    }
    v6 = *(void (**)(uint64_t, CFDictionaryRef, _QWORD))(a1 + 464);
    if (v6)
      v6(a1, theDict, *(_QWORD *)(a1 + 472));
  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
      _WiFiDeviceClientDispatchAutoJoinNotification_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
  }
}

void _WiFiDeviceClientDispatchUserJoinNotification(uint64_t a1, CFDictionaryRef theDict)
{
  const void *Value;
  _WORD *v5;
  const void *v6;
  const void *v7;
  _BOOL8 v8;
  void (*v9)(uint64_t, _BOOL8, CFDictionaryRef, _QWORD);
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (theDict)
  {
    Value = CFDictionaryGetValue(theDict, CFSTR("userJoinNetwork"));
    if (Value)
    {
      v5 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], Value);
      CFDictionaryReplaceValue(theDict, CFSTR("userJoinNetwork"), v5);
      if (v5)
        CFRelease(v5);
    }
    v6 = CFDictionaryGetValue(theDict, CFSTR("userJoinStatus"));
    if (v6)
    {
      v7 = v6;
      v8 = CFEqual(v6, CFSTR("userJoinStarted"))
        || CFEqual(v7, CFSTR("userJoinScanning"))
        || CFEqual(v7, CFSTR("userJoinAssociating"))
        || CFEqual(v7, CFSTR("userJoinWaiting")) != 0;
    }
    else
    {
      v8 = 0;
    }
    v9 = *(void (**)(uint64_t, _BOOL8, CFDictionaryRef, _QWORD))(a1 + 480);
    if (v9)
      v9(a1, v8, theDict, *(_QWORD *)(a1 + 488));
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v10)
      _WiFiDeviceClientDispatchUserJoinNotification_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

uint64_t _WiFiDeviceClientDispatchResumeScanEvent(uint64_t result)
{
  uint64_t (*v1)(uint64_t, _QWORD);

  v1 = *(uint64_t (**)(uint64_t, _QWORD))(result + 128);
  if (v1)
    return v1(result, *(_QWORD *)(result + 136));
  return result;
}

uint64_t _WiFiDeviceClientDispatchBgScanSuspendResumeEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 288);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 296));
  return result;
}

uint64_t _WiFiDeviceClientDispatchBTCoexStatsEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 336);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 344));
  return result;
}

uint64_t _WiFiDeviceClientDispatchBSPEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 624);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 632));
  return result;
}

uint64_t _WiFiDeviceClientDispatchUCMEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 640);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 648));
  return result;
}

void _WiFiDeviceClientDispatchBTScanIntervalRelaxEvent(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 368);
  if (v2)
    v2(a1, a2, *(_QWORD *)(a1 + 376));
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

void _WiFiDeviceClientDispatch24GHzNetworkInCriticalStateEvent(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 384);
  if (v2)
    v2(a1, a2, *(_QWORD *)(a1 + 392));
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

void _WiFiDeviceClientDispatchM1M4Handshake24GHzCountEvent(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 400);
  if (v2)
    v2(a1, a2, *(_QWORD *)(a1 + 408));
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

void _WiFiDeviceClientDispatchCarPlayNetworkTypeChangeEvent(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 416);
  if (v2)
    v2(a1, a2, *(_QWORD *)(a1 + 424));
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

uint64_t _WiFiDeviceClientDispatchDiagnosticsStartEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 432);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 440));
  return result;
}

uint64_t _WiFiDeviceClientDispatchHostApStateChangedEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 496);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 504));
  return result;
}

uint64_t _WiFiDeviceClientDispatchGasResults(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, _QWORD);

  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 512);
  if (v3)
    return v3(result, a2, a3, *(_QWORD *)(result + 520));
  return result;
}

uint64_t _WiFiDeviceClientDispatchRangingResult(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t (*v3)(uint64_t, uint64_t, uint64_t, _QWORD);

  v3 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(result + 560);
  if (v3)
    return v3(result, a2, a3, *(_QWORD *)(result + 568));
  return result;
}

uint64_t _WiFiDeviceClientDispatchRangingReportEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  if (result)
  {
    v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 576);
    if (v2)
      return v2(result, a2, *(_QWORD *)(result + 584));
  }
  return result;
}

uint64_t _WiFiDeviceClientDispatchDeviceAvailableEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 528);
  if (v2)
    return v2(result, a2, *(_QWORD *)(result + 536));
  return result;
}

uint64_t _WiFiDeviceClientDispatchRoamStatusEvent(uint64_t result, uint64_t a2)
{
  uint64_t (*v2)(uint64_t, uint64_t, _QWORD);

  if (result)
  {
    v2 = *(uint64_t (**)(uint64_t, uint64_t, _QWORD))(result + 592);
    if (v2)
      return v2(result, a2, *(_QWORD *)(result + 600));
  }
  return result;
}

uint64_t WiFiDeviceClientGasStartAsync(uint64_t a1, const __CFArray *a2, const void *a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;
  const __CFAllocator *v8;
  const __CFData *BinaryData;
  const __CFData *v10;
  const UInt8 *BytePtr;
  int Length;
  __CFArray *RecordsFromNetworks;
  const __CFData *v14;
  const __CFData *v15;
  const UInt8 *v16;
  int v17;
  mach_port_t v18;
  const UInt8 *v19;
  int v20;
  unsigned int v21;

  result = 4294963396;
  if (a2 && a3)
  {
    *(_QWORD *)(a1 + 512) = a4;
    *(_QWORD *)(a1 + 520) = a5;
    v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
    v10 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v10);
    }
    else
    {
      BytePtr = 0;
      Length = 0;
    }
    RecordsFromNetworks = _WiFiCreateRecordsFromNetworks(a2);
    if (RecordsFromNetworks)
    {
      v14 = (const __CFData *)_CFPropertyListCreateBinaryData(v8, RecordsFromNetworks);
      v15 = v14;
      if (v14)
      {
        v16 = CFDataGetBytePtr(v14);
        v17 = CFDataGetLength(v15);
      }
      else
      {
        v16 = 0;
        v17 = 0;
      }
    }
    else
    {
      v16 = 0;
      v17 = 0;
      v15 = 0;
    }
    v21 = -1431655766;
    v18 = *(_DWORD *)(a1 + 16);
    v19 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v20 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_gas_start_async(v18, (uint64_t)v19, v20, (uint64_t)v16, v17, (uint64_t)BytePtr, Length, (int *)&v21);
    if (RecordsFromNetworks)
      CFRelease(RecordsFromNetworks);
    if (v15)
      CFRelease(v15);
    if (v10)
      CFRelease(v10);
    return v21;
  }
  return result;
}

uint64_t WiFiDeviceClientSetRangeable(uint64_t a1, int a2, const void *a3)
{
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int Length;
  mach_port_t v9;
  const UInt8 *v10;
  int v11;
  int v13;

  if (a3)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a3);
    v6 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v6);
      goto LABEL_6;
    }
  }
  else
  {
    v6 = 0;
  }
  BytePtr = 0;
  Length = 0;
LABEL_6:
  v13 = -1431655766;
  v9 = *(_DWORD *)(a1 + 16);
  v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_rangeable(v9, (uint64_t)v10, v11, a2, (uint64_t)BytePtr, Length, &v13);
  if (v6)
    CFRelease(v6);
  if (v13)
    return 4294963394;
  else
    return 0;
}

uint64_t WiFiDeviceClientSetRangingIdentifier(uint64_t a1, const void *a2)
{
  const __CFData *BinaryData;
  const __CFData *v4;
  const UInt8 *BytePtr;
  int Length;
  int v7;
  mach_port_t v8;
  const UInt8 *v9;
  int v10;
  int v12;

  if (a2)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v4 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v4);
    }
    else
    {
      BytePtr = 0;
      Length = 0;
    }
    v7 = 1;
  }
  else
  {
    BytePtr = 0;
    Length = 0;
    v4 = 0;
    v7 = 0;
  }
  v12 = -1431655766;
  v8 = *(_DWORD *)(a1 + 16);
  v9 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v10 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_ranging_identifier(v8, (uint64_t)v9, v10, v7, (uint64_t)BytePtr, Length, &v12);
  if (v4)
    CFRelease(v4);
  if (v12)
    return 4294963394;
  else
    return 0;
}

uint64_t WiFiDeviceClientRangingStartAsync(uint64_t a1, const void *a2, uint64_t a3, uint64_t a4, double a5)
{
  const __CFData *BinaryData;
  const __CFData *v8;
  const UInt8 *BytePtr;
  int Length;
  mach_port_t v12;
  const UInt8 *v13;
  int v14;
  unsigned int v15;

  if (!a2)
    return 4294963396;
  *(_QWORD *)(a1 + 560) = a3;
  *(_QWORD *)(a1 + 568) = a4;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v8 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v8);
  }
  else
  {
    BytePtr = 0;
    Length = 0;
  }
  v15 = -1431655766;
  v12 = *(_DWORD *)(a1 + 16);
  v13 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v14 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_ranging_start_async(v12, (uint64_t)v13, v14, (uint64_t)BytePtr, Length, (int)a5, (int *)&v15);
  if (v8)
    CFRelease(v8);
  return v15;
}

uint64_t WiFiDeviceClientDebugCommand(uint64_t a1, const void *a2, CFPropertyListRef *a3)
{
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int v8;
  mach_port_t v9;
  const UInt8 *v10;
  int v11;
  unsigned int v13;
  _DWORD length[3];

  v13 = -1431655766;
  memset(length, 0, sizeof(length));
  if (a2)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v6 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      v8 = CFDataGetLength(v6);
    }
    else
    {
      BytePtr = 0;
      v8 = 0;
    }
    v9 = *(_DWORD *)(a1 + 16);
    v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_debug_command(v9, (uint64_t)v10, v11, (uint64_t)BytePtr, v8, &length[1], length, &v13);
    if (a3)
      *a3 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    if (v6)
      CFRelease(v6);
  }
  else
  {
    v13 = -3900;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

CFPropertyListRef WiFiDeviceClientCopyRoamStats(uint64_t a1)
{
  int v2;
  const UInt8 *BytePtr;
  int v4;
  CFPropertyListRef v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v4 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_roam_stats(v2, (uint64_t)BytePtr, v4, &length[1], length);
  v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v5;
}

uint64_t WiFiDeviceClientSetTrgDiscParams(uint64_t a1, const void *a2)
{
  const __CFData *BinaryData;
  const __CFData *v4;
  const UInt8 *BytePtr;
  int Length;
  mach_port_t v7;
  const UInt8 *v8;
  int v9;
  mach_port_t v11;
  const UInt8 *v12;
  int v13;
  unsigned int v14;

  if (!a2)
    return 4294963396;
  v14 = -1431655766;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  if (BinaryData)
  {
    v4 = BinaryData;
    BytePtr = CFDataGetBytePtr(BinaryData);
    Length = CFDataGetLength(v4);
    v7 = *(_DWORD *)(a1 + 16);
    v8 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v9 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_trgdisc_params(v7, (uint64_t)v8, v9, (uint64_t)BytePtr, Length, (int *)&v14);
    CFRelease(v4);
  }
  else
  {
    v11 = *(_DWORD *)(a1 + 16);
    v12 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v13 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_set_trgdisc_params(v11, (uint64_t)v12, v13, 0, 0, (int *)&v14);
  }
  return v14;
}

uint64_t WiFiDeviceClientTrafficRegistration(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t result;
  id v7;
  char v8;

  if (!a2)
    return 4294963396;
  v8 = 0;
  v7 = 0;
  v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DD99D0]), "initWithDictionary:isActive:", a2, &v8);
  if (!v3)
    return 4294963396;
  v4 = (void *)v3;
  v5 = *(id *)(a1 + 72);
  if (!v5)
  {
    v5 = objc_alloc_init(MEMORY[0x1E0DD99C0]);
    *(_QWORD *)(a1 + 72) = v5;
  }
  if (v8)
    objc_msgSend(v5, "setTrafficRegistration:error:", v4, &v7);
  else
    objc_msgSend(v5, "clearTrafficRegistration:error:", v4, &v7);

  result = (uint64_t)v7;
  if (v7)
    return objc_msgSend(v7, "code");
  return result;
}

CFPropertyListRef WiFiDeviceClientSendWoWBlacklistCommandAndCopyResponse(uint64_t a1, const void *a2, _DWORD *a3)
{
  const __CFData *BinaryData;
  const __CFData *v7;
  const UInt8 *BytePtr;
  int v9;
  mach_port_t v10;
  const UInt8 *v11;
  int v12;
  CFPropertyListRef v13;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (a2)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    v7 = BinaryData;
    if (BinaryData)
    {
      BytePtr = CFDataGetBytePtr(BinaryData);
      v9 = CFDataGetLength(v7);
    }
    else
    {
      BytePtr = 0;
      v9 = 0;
    }
    v10 = *(_DWORD *)(a1 + 16);
    v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_wowblacklist_command(v10, (uint64_t)v11, v12, (uint64_t)BytePtr, v9, &length[1], length, a3);
    v13 = 0;
    if (*(_QWORD *)&length[1] && length[0])
      v13 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    if (v7)
      CFRelease(v7);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v13 = 0;
  }
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientNotifySoftError(uint64_t a1, const void *a2)
{
  const __CFData *BinaryData;
  const __CFData *v4;
  const UInt8 *BytePtr;
  int Length;
  mach_port_t v7;
  const UInt8 *v8;
  int v9;
  mach_port_t v10;
  const UInt8 *v11;
  int v12;
  int v14;

  v14 = -3900;
  if (a2)
  {
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
    if (BinaryData)
    {
      v4 = BinaryData;
      BytePtr = CFDataGetBytePtr(BinaryData);
      Length = CFDataGetLength(v4);
      v7 = *(_DWORD *)(a1 + 16);
      v8 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      v9 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      wifi_device_soft_error_notification(v7, (uint64_t)v8, v9, (uint64_t)BytePtr, Length, &v14);
      CFRelease(v4);
    }
    else
    {
      v10 = *(_DWORD *)(a1 + 16);
      v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      wifi_device_soft_error_notification(v10, (uint64_t)v11, v12, 0, 0, &v14);
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  if (v14)
    return 4294963394;
  else
    return 0;
}

const __CFDictionary *WiFiDeviceClientAutoJoinBlacklistCommand(uint64_t a1, const void *a2, _DWORD *a3)
{
  const __CFData *BinaryData;
  const __CFData *v7;
  const UInt8 *BytePtr;
  int v9;
  mach_port_t v10;
  const UInt8 *v11;
  int v12;
  const __CFDictionary *v13;
  const __CFArray *Value;
  __CFArray *NetworksFromRecords;
  __CFArray *v16;
  _DWORD length[3];

  length[0] = 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v7 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    v9 = CFDataGetLength(v7);
  }
  else
  {
    BytePtr = 0;
    v9 = 0;
  }
  *(_QWORD *)&length[1] = 0xAAAAAAAAAAAAAAAALL;
  v10 = *(_DWORD *)(a1 + 16);
  v11 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v12 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_autojoinblacklist_command(v10, (uint64_t)v11, v12, (uint64_t)BytePtr, v9, &length[1], length);
  v13 = 0;
  if (*(_QWORD *)&length[1] && length[0])
  {
    v13 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    Value = (const __CFArray *)CFDictionaryGetValue(v13, CFSTR("networks"));
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(Value);
    if (NetworksFromRecords)
    {
      v16 = NetworksFromRecords;
      CFDictionarySetValue(v13, CFSTR("networks"), NetworksFromRecords);
      CFRelease(v16);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  *a3 = 0;
  if (v7)
    CFRelease(v7);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v13;
}

uint64_t WiFiDeviceClientDestroyEAPTrustExceptionsForCurrentNetwork(uint64_t a1, int *a2)
{
  mach_port_t v4;
  const UInt8 *BytePtr;
  int Length;

  if (a1)
  {
    v4 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_destroy_eap_trust_current_network(v4, (uint64_t)BytePtr, Length, a2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  if (a2)
    return 4294963394;
  else
    return 0;
}

uint64_t WiFiDeviceClientGetLQMEventInterval(uint64_t a1)
{
  mach_port_t v2;
  const UInt8 *BytePtr;
  int Length;
  unsigned int v6;

  v6 = 0;
  v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_get_event_interval(v2, (uint64_t)BytePtr, Length, 14, (int *)&v6);
  return v6;
}

uint64_t WiFiDeviceClientSetLQMEventInterval(uint64_t a1, int a2)
{
  mach_port_t v4;
  const UInt8 *BytePtr;
  int Length;
  int v8;

  v8 = -3902;
  v4 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_set_event_interval(v4, (uint64_t)BytePtr, Length, 14, a2, &v8);
  if (v8)
    return 4294963394;
  else
    return 0;
}

CFPropertyListRef WiFiDeviceClientCopyNetworkRecommendations(uint64_t a1)
{
  int v2;
  const UInt8 *BytePtr;
  int v4;
  CFPropertyListRef v5;
  _DWORD length[3];

  memset(length, 0, sizeof(length));
  v2 = *(_DWORD *)(a1 + 16);
  BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v4 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_copy_network_recommendations(v2, (uint64_t)BytePtr, v4, &length[1], length);
  v5 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v5;
}

void WiFiDeviceClientResetAvailabilityEngine(uint64_t a1)
{
  int v2;
  const UInt8 *BytePtr;
  int Length;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_reset_availability_engine(v2, (uint64_t)BytePtr, Length);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

const __CFDictionary *WiFiDeviceClientBssBlacklistCommandAndCopyResponse(uint64_t a1, const void *a2, _DWORD *a3)
{
  const __CFData *BinaryData;
  const __CFData *v6;
  const UInt8 *BytePtr;
  int v8;
  mach_port_t v9;
  const UInt8 *v10;
  int v11;
  const __CFDictionary *v12;
  const __CFArray *Value;
  __CFArray *NetworksFromRecords;
  __CFArray *v15;
  _DWORD length[3];

  length[0] = 0;
  BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2);
  v6 = BinaryData;
  if (BinaryData)
  {
    BytePtr = CFDataGetBytePtr(BinaryData);
    v8 = CFDataGetLength(v6);
  }
  else
  {
    BytePtr = 0;
    v8 = 0;
  }
  *(_QWORD *)&length[1] = 0xAAAAAAAAAAAAAAAALL;
  v9 = *(_DWORD *)(a1 + 16);
  v10 = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
  v11 = CFDataGetLength(*(CFDataRef *)(a1 + 48));
  wifi_device_bssblacklist_command(v9, (uint64_t)v10, v11, (uint64_t)BytePtr, v8, &length[1], length);
  v12 = 0;
  if (*(_QWORD *)&length[1] && length[0])
  {
    v12 = (const __CFDictionary *)_WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
    Value = (const __CFArray *)CFDictionaryGetValue(v12, CFSTR("networks"));
    NetworksFromRecords = _WiFiCreateNetworksFromRecords(Value);
    if (NetworksFromRecords)
    {
      v15 = NetworksFromRecords;
      CFDictionarySetValue(v12, CFSTR("networks"), NetworksFromRecords);
      CFRelease(v15);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  *a3 = 0;
  if (v6)
    CFRelease(v6);
  _WiFiVMDealloc(*(uint64_t *)&length[1], length[0]);
  return v12;
}

uint64_t WiFiDeviceClientCopyAirplayStatistics()
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

CFPropertyListRef WiFiDeviceClientCopyMimoStatus(CFNumberRef a1)
{
  CFPropertyListRef v1;
  const __CFAllocator *v2;
  CFNumberRef v3;
  const __CFData *BinaryData;
  const __CFData *v5;
  const UInt8 *BytePtr;
  int v7;
  mach_port_t v8;
  const UInt8 *v9;
  int v10;
  uint64_t v11;
  int v13;
  _DWORD length[3];

  v1 = a1;
  v13 = 375;
  memset(length, 0, sizeof(length));
  if (a1)
  {
    v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    a1 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &v13);
    if (a1)
    {
      v3 = a1;
      BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData(v2, a1);
      v5 = BinaryData;
      if (BinaryData)
      {
        BytePtr = CFDataGetBytePtr(BinaryData);
        v7 = CFDataGetLength(v5);
      }
      else
      {
        BytePtr = 0;
        v7 = 0;
      }
      v8 = *((_DWORD *)v1 + 4);
      v9 = CFDataGetBytePtr(*((CFDataRef *)v1 + 6));
      v10 = CFDataGetLength(*((CFDataRef *)v1 + 6));
      wifi_device_copy_property(v8, (uint64_t)v9, v10, (uint64_t)BytePtr, v7, &length[1], length);
      v1 = 0;
      if (*(_QWORD *)&length[1] && length[0])
        v1 = _WiFiCopyUnserialized(*(UInt8 **)&length[1], length[0]);
      if (v5)
        CFRelease(v5);
      CFRelease(v3);
      a1 = *(CFNumberRef *)&length[1];
      v11 = length[0];
    }
    else
    {
      v11 = 0;
      v1 = 0;
    }
  }
  else
  {
    v11 = 0;
  }
  _WiFiVMDealloc((uint64_t)a1, v11);
  return v1;
}

BOOL WiFiDeviceClientGetAppState(_BOOL8 result)
{
  uint64_t v1;
  mach_port_t v2;
  const UInt8 *BytePtr;
  int Length;
  int v5;

  v5 = 0;
  if (result)
  {
    v1 = result;
    v2 = *(_DWORD *)(result + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(result + 48));
    Length = CFDataGetLength(*(CFDataRef *)(v1 + 48));
    wifi_device_get_app_state(v2, (uint64_t)BytePtr, Length, &v5);
    return v5 != 0;
  }
  return result;
}

uint64_t WiFiDeviceClientRegisterP2pThreadCoexCallback(uint64_t a1, uint64_t a2, uint64_t a3)
{
  *(_QWORD *)(a1 + 608) = a2;
  *(_QWORD *)(a1 + 616) = a3;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a1 + 64) & 0xFFFFFDFFFFFFFFFFLL | ((unint64_t)(a2 != 0) << 41);
  return _WiFiDeviceClientSendEventMaskToServer(a1);
}

void _WiFiDeviceClientDispatchP2pThreadCoexEvent(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 608);
  if (v2)
    v2(a1, a2, *(_QWORD *)(a1 + 616));
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

void WiFiDeviceClientInsertMissingNetworkService(uint64_t a1)
{
  int v2;
  const UInt8 *BytePtr;
  int Length;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 16);
    BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
    Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
    wifi_device_insert_missing_network_service(v2, (uint64_t)BytePtr, Length);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void WiFiDeviceClientSet6GDisablementParams(uint64_t a1, uint64_t a2)
{
  CFDictionaryRef v3;
  CFDictionaryRef v4;
  const __CFData *BinaryData;
  const __CFData *v6;
  int v7;
  const UInt8 *BytePtr;
  int Length;
  const UInt8 *v10;
  int v11;

  v3 = WiFiNetworkCopyRecord(a2);
  if (v3)
  {
    v4 = v3;
    BinaryData = (const __CFData *)_CFPropertyListCreateBinaryData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3);
    if (BinaryData)
    {
      v6 = BinaryData;
      v7 = *(_DWORD *)(a1 + 16);
      BytePtr = CFDataGetBytePtr(*(CFDataRef *)(a1 + 48));
      Length = CFDataGetLength(*(CFDataRef *)(a1 + 48));
      v10 = CFDataGetBytePtr(v6);
      v11 = CFDataGetLength(v6);
      wifi_device_update_network_property(v7, (uint64_t)BytePtr, Length, (uint64_t)v10, v11);
      CFRelease(v6);
    }
    CFRelease(v4);
  }
}

void _WiFiDeviceClientDispatchTdConfirmedEvent(uint64_t a1, uint64_t a2)
{
  void (*v2)(uint64_t, uint64_t, _QWORD);

  v2 = *(void (**)(uint64_t, uint64_t, _QWORD))(a1 + 656);
  if (v2)
    v2(a1, a2, *(_QWORD *)(a1 + 664));
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

void ___dispatchCopyCurrentNetwork_block_invoke(uint64_t a1)
{
  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), **(_QWORD **)(a1 + 32));
  dispatch_release(*(dispatch_object_t *)(*(_QWORD *)(a1 + 32) + 24));
  free(*(void **)(a1 + 32));
}

CFSetRef __WiFiNetworkRegister()
{
  const __CFAllocator *v0;
  CFSetRef result;
  _OWORD v2[2];
  void *values[2];
  __int128 v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  __kWiFiNetworkTypeID = _CFRuntimeRegisterClass();
  *(_OWORD *)values = xmmword_1E713B900;
  v4 = *(_OWORD *)&off_1E713B910;
  v5 = CFSTR("AcceptEAPTypes");
  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  __eapKeys = (uint64_t)CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)values, 5, MEMORY[0x1E0C9B378]);
  v2[0] = xmmword_1E713B928;
  v2[1] = *(_OWORD *)off_1E713B938;
  result = CFSetCreate(v0, (const void **)v2, 4, MEMORY[0x1E0C9B3B0]);
  __internalSSIDs = (uint64_t)result;
  return result;
}

_WORD *WiFiNetworkCreateWithSsid(const __CFString *a1)
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  CFDataRef ExternalRepresentation;
  CFDataRef v6;
  CFNumberRef v7;
  CFNumberRef v8;
  _WORD *v9;
  __int16 valuePtr;

  if (a1
    && (v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
        (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0])) != 0))
  {
    v4 = Mutable;
    CFDictionarySetValue(Mutable, CFSTR("SSID_STR"), a1);
    ExternalRepresentation = CFStringCreateExternalRepresentation(v2, a1, 0x8000100u, 0);
    if (ExternalRepresentation)
    {
      v6 = ExternalRepresentation;
      CFDictionarySetValue(v4, CFSTR("SSID"), ExternalRepresentation);
      CFRelease(v6);
    }
    valuePtr = 2;
    v7 = CFNumberCreate(v2, kCFNumberSInt16Type, &valuePtr);
    if (v7)
    {
      v8 = v7;
      CFDictionarySetValue(v4, CFSTR("AP_MODE"), v7);
      CFRelease(v8);
    }
    v9 = WiFiNetworkCreate((int)v2, v4);
    CFRelease(v4);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return v9;
}

_WORD *WiFiNetworkCreateCopy(uint64_t a1, uint64_t a2)
{
  _WORD *result;

  result = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], *(CFTypeRef *)(a2 + 16));
  result[12] = *(_WORD *)(a2 + 24);
  return result;
}

CFMutableDictionaryRef WiFiNetworkCopyMutableRecord(uint64_t a1)
{
  return CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(a1 + 16));
}

CFDictionaryRef WiFiNetworkCopyRecord(uint64_t a1)
{
  return CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFDictionaryRef *)(a1 + 16));
}

const __CFDictionary *WiFiNetworkCopyFilteredRecord(uint64_t a1)
{
  const __CFAllocator *v1;
  const __CFDictionary *MutableCopy;
  const __CFDictionary *v3;
  const __CFDictionary *Value;
  const __CFDictionary *v5;
  const __CFDictionary *v6;
  const __CFDictionary *v7;
  __CFDictionary *v8;
  __CFDictionary *v9;

  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, *(CFDictionaryRef *)(a1 + 16));
  v3 = MutableCopy;
  if (MutableCopy)
  {
    if (!CFDictionaryGetValue(MutableCopy, CFSTR("SSID_STR")))
    {
      v6 = v3;
      v3 = 0;
LABEL_10:
      CFRelease(v6);
      return v3;
    }
    Value = (const __CFDictionary *)CFDictionaryGetValue(v3, CFSTR("EnterpriseProfile"));
    if (Value)
    {
      v5 = CFDictionaryCreateMutableCopy(v1, 0, Value);
      if (v5)
      {
        v6 = v5;
        v7 = (const __CFDictionary *)CFDictionaryGetValue(v5, CFSTR("EAPClientConfiguration"));
        if (v7)
        {
          v8 = CFDictionaryCreateMutableCopy(v1, 0, v7);
          if (v8)
          {
            v9 = v8;
            CFDictionaryRemoveValue(v8, CFSTR("UserPassword"));
            CFDictionaryRemoveValue(v9, CFSTR("TLSSaveTrustExceptions"));
            CFDictionaryRemoveValue(v9, CFSTR("TLSUserTrustProceedCertificateChain"));
            CFDictionarySetValue(v6, CFSTR("EAPClientConfiguration"), v9);
            CFRelease(v9);
          }
        }
        CFDictionarySetValue(v3, CFSTR("EnterpriseProfile"), v6);
        goto LABEL_10;
      }
    }
  }
  return v3;
}

const __CFDictionary *WiFiNetworkCopyPreparedEAPProfile(CFDictionaryRef *a1, const void *a2)
{
  const __CFDictionary *Property;
  const __CFAllocator *v5;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v7;
  const __CFDictionary *Value;
  __CFDictionary *v9;
  __CFDictionary *v10;
  CFStringRef v11;

  Property = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("EnterpriseProfile"));
  if (!Property)
    return 0;
  v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, Property);
  v7 = MutableCopy;
  if (MutableCopy)
  {
    CFDictionarySetValue(MutableCopy, CFSTR("EnableUserInterface"), (const void *)*MEMORY[0x1E0C9AE40]);
    Value = (const __CFDictionary *)CFDictionaryGetValue(v7, CFSTR("EAPClientConfiguration"));
    if (Value)
    {
      v9 = CFDictionaryCreateMutableCopy(v5, 0, Value);
      if (v9)
      {
        v10 = v9;
        if (a2)
        {
          CFDictionarySetValue(v9, CFSTR("UserPassword"), a2);
LABEL_15:
          CFDictionarySetValue(v7, CFSTR("EAPClientConfiguration"), v10);
          CFRelease(v10);
          return v7;
        }
        if (WiFiNetworkIsHotspot20((_BOOL8)a1))
        {
          v11 = __WiFiNetworkCopyPasswordForAccount((uint64_t)a1);
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
          if (!v11)
          {
            v11 = WiFiNetworkCopyPassword(a1);
            if (!v11)
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
              v11 = __WiFiNetworkCopyPasswordByDomainName((uint64_t)a1);
              if (!v11)
              {
                objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
                goto LABEL_15;
              }
            }
          }
        }
        else
        {
          v11 = WiFiNetworkCopyPassword(a1);
          if (!v11)
            goto LABEL_15;
        }
        CFDictionarySetValue(v10, CFSTR("UserPassword"), v11);
        CFRelease(v11);
        goto LABEL_15;
      }
    }
  }
  return v7;
}

BOOL WiFiNetworkIsHotspot20(_BOOL8 result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), CFSTR("HOTSPOT20_IE"))
        || CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), CFSTR("DomainName")) != 0;
  }
  return result;
}

CFStringRef __WiFiNetworkCopyPasswordForAccount(uint64_t a1)
{
  __CFString *Property;

  Property = (__CFString *)WiFiNetworkGetProperty(a1, CFSTR("HS20AccountName"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (Property)
    return WiFiSecurityCopyPassword(Property);
  else
    return 0;
}

CFStringRef WiFiNetworkCopyPassword(CFDictionaryRef *a1)
{
  const __CFString *v2;
  CFStringRef result;
  __CFString *v4;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *AccountForNetwork;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "WiFiNetworkCopyPassword";
    v7 = 2112;
    AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Copy password for Network %@", (uint8_t *)&v5, 0x16u);
  }
  if (!a1
    || !CFDictionaryContainsKey(a1[2], CFSTR("PayloadUUID"))
    || (v2 = WiFiNetworkGetAccountForNetwork(a1), (result = WiFiSecurityCopyNonSyncablePassword(v2)) == 0))
  {
    v4 = (__CFString *)WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPassword(v4);
  }
  return result;
}

__CFString *__WiFiNetworkCopyPasswordByDomainName(uint64_t a1)
{
  __CFString *result;

  result = (__CFString *)WiFiNetworkGetProperty(a1, CFSTR("DomainName"));
  if (result)
    return (__CFString *)WiFiSecurityCopyPassword(result);
  return result;
}

void WiFiNetworkMergeForAssociation(uint64_t a1, uint64_t a2)
{
  const void *Property;
  const void *v5;
  const void *v6;
  const void *SSID;
  const void *v8;
  void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  void *v13;
  const void *v14;
  const void *v15;
  int v16;

  if (a1)
  {
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("WEP")) == (const void *)*MEMORY[0x1E0C9AE50])
    {
      Property = WiFiNetworkGetProperty(a2, CFSTR("WEP_AUTH_Flags"));
      if (Property)
        WiFiNetworkSetProperty(a1, CFSTR("WEP_AUTH_Flags"), Property);
    }
  }
  if (WiFiNetworkIsEAP(a2))
  {
    v5 = WiFiNetworkGetProperty(a2, CFSTR("EnterpriseProfile"));
    if (v5)
      WiFiNetworkSetProperty(a1, CFSTR("EnterpriseProfile"), v5);
  }
  if (a2 && CFDictionaryGetValue(*(CFDictionaryRef *)(a2 + 16), CFSTR("DomainName")) && WiFiNetworkIsHotspot20(a1))
  {
    v6 = WiFiNetworkGetProperty(a2, CFSTR("DisplayedOperatorName"));
    if (v6)
      WiFiNetworkSetProperty(a1, CFSTR("HS2NetworkBadge"), v6);
    SSID = WiFiNetworkGetProperty(a2, CFSTR("HS20AccountName"));
    if (SSID || (SSID = WiFiNetworkGetSSID((const void *)a2)) != 0)
    {
      WiFiNetworkSetProperty(a1, CFSTR("HS20AccountName"), SSID);
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  v8 = WiFiNetworkGetProperty(a2, CFSTR("TransitionDisabledFlags"));
  if (v8)
    WiFiNetworkSetProperty(a1, CFSTR("TransitionDisabledFlags"), v8);
  v9 = (void *)*MEMORY[0x1E0D1B9E8];
  v10 = WiFiNetworkGetProperty(a2, (void *)*MEMORY[0x1E0D1B9E8]);
  if (v10)
    WiFiNetworkSetProperty(a1, v9, v10);
  v11 = WiFiNetworkGetProperty(a2, CFSTR("PolicyUUID"));
  if (v11)
    WiFiNetworkSetProperty(a1, CFSTR("PolicyUUID"), v11);
  v12 = WiFiNetworkGetProperty(a2, CFSTR("PayloadUUID"));
  if (v12)
    WiFiNetworkSetProperty(a1, CFSTR("PayloadUUID"), v12);
  WiFiNetworkMergeAutoJoinProperties(a1, a2);
  if (MEMORY[0x1E0D0D1B8])
  {
    v13 = (void *)*MEMORY[0x1E0D0D290];
    v14 = WiFiNetworkGetProperty(a2, (void *)*MEMORY[0x1E0D0D290]);
    WiFiNetworkSetProperty(a1, v13, v14);
  }
  v15 = WiFiNetworkGetProperty(a2, CFSTR("WiFiNetworkUserAcceptedRecommendationAt"));
  WiFiNetworkSetProperty(a1, CFSTR("WiFiNetworkUserAcceptedRecommendationAt"), v15);
  if (*(__int16 *)(a1 + 24) == -1)
  {
    v16 = *(unsigned __int16 *)(a2 + 24);
    if (v16 != 0xFFFF)
      *(_WORD *)(a1 + 24) = v16;
  }
}

BOOL WiFiNetworkIsWEP(_BOOL8 result)
{
  if (result)
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), CFSTR("WEP")) == (const void *)*MEMORY[0x1E0C9AE50];
  return result;
}

void WiFiNetworkSetProperty(uint64_t a1, void *key, const void *a3)
{
  const __CFDictionary *v4;
  const __CFArray *v7;
  int v8;
  const __CFDictionary *Value;
  const __CFDictionary *v10;
  const __CFAllocator *v11;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v13;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  __CFDictionary *v16;
  const void *v17;
  const void *v18;
  const void *v19;
  __CFDictionary *v20;
  _BOOL4 v21;
  unsigned int v22;
  int IsWPAWPA2PSK;
  const __CFAllocator *v24;
  CFAbsoluteTime Current;
  CFDateRef v26;
  CFDateRef v27;
  char v28;
  CFRange v29;

  if (!a1 || (v4 = *(const __CFDictionary **)(a1 + 16)) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return;
  }
  v7 = (const __CFArray *)__eapKeys;
  if (__eapKeys
    && (v29.length = CFArrayGetCount((CFArrayRef)__eapKeys),
        v29.location = 0,
        v8 = CFArrayContainsValue(v7, v29, key),
        v4 = *(const __CFDictionary **)(a1 + 16),
        v8))
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v4, CFSTR("EnterpriseProfile"));
    if (!Value
      || (v10 = Value,
          v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
          (MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, Value)) == 0))
    {
      v21 = 0;
      v18 = 0;
      goto LABEL_28;
    }
    v13 = MutableCopy;
    v14 = (const __CFDictionary *)CFDictionaryGetValue(v10, CFSTR("EAPClientConfiguration"));
    if (v14 && (v15 = CFDictionaryCreateMutableCopy(v11, 0, v14)) != 0)
    {
      v16 = v15;
      v17 = CFDictionaryGetValue(v15, key);
      v18 = v17;
      if (v17)
        CFRetain(v17);
      CFDictionarySetValue(v16, key, a3);
      CFDictionarySetValue(v13, CFSTR("EAPClientConfiguration"), v16);
      CFRelease(v16);
    }
    else
    {
      v18 = 0;
    }
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("EnterpriseProfile"), v13);
    CFRelease(v13);
  }
  else
  {
    v19 = CFDictionaryGetValue(v4, key);
    v18 = v19;
    if (v19)
      CFRetain(v19);
    v20 = *(__CFDictionary **)(a1 + 16);
    if (a3)
      CFDictionarySetValue(v20, key, a3);
    else
      CFDictionaryRemoveValue(v20, key);
    if (CFEqual(key, CFSTR("EnterpriseProfile")) && !__WiFiNetworkIsWPAEAP(*(const __CFDictionary **)(a1 + 16)))
    {
      v22 = __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16));
      IsWPAWPA2PSK = WiFiNetworkIsWPAWPA2PSK(a1);
      if (v22)
        WiFiNetworkSetSAE(a1, 1, IsWPAWPA2PSK);
      else
        WiFiNetworkSetWPA(a1, IsWPAWPA2PSK);
    }
  }
  v21 = v18 != 0;
  if (!a3 && v18)
  {
LABEL_27:
    v21 = 1;
    goto LABEL_30;
  }
LABEL_28:
  if (!a3 || v18)
  {
    v28 = !v21;
    if (!a3)
      v28 = 1;
    if ((v28 & 1) != 0)
      goto LABEL_38;
    if (CFEqual(a3, v18))
      goto LABEL_39;
    goto LABEL_27;
  }
LABEL_30:
  v24 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Current = CFAbsoluteTimeGetCurrent();
  v26 = CFDateCreate(v24, Current);
  if (v26)
  {
    v27 = v26;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("lastUpdated"), v26);
    CFRelease(v27);
    if (!v21)
      return;
LABEL_39:
    CFRelease(v18);
    return;
  }
LABEL_38:
  if (v21)
    goto LABEL_39;
}

BOOL WiFiNetworkIsEAP(uint64_t a1)
{
  return a1 && !WiFiNetworkIsWAPI(a1) && __WiFiNetworkIsEAP(*(const __CFDictionary **)(a1 + 16));
}

BOOL WiFiNetworkIsHS20Account(_BOOL8 result)
{
  if (result)
    return CFDictionaryGetValue(*(CFDictionaryRef *)(result + 16), CFSTR("DomainName")) != 0;
  return result;
}

void WiFiNetworkSetHS2NetworkBadge(uint64_t a1, const void *a2)
{
  WiFiNetworkSetProperty(a1, CFSTR("HS2NetworkBadge"), a2);
}

const void *WiFiNetworkGetSSID(const void *result)
{
  uint64_t v1;
  const __CFData *Property;
  const __CFAllocator *v3;
  const __CFData *v4;
  CFStringRef v5;

  if (result)
  {
    v1 = (uint64_t)result;
    result = WiFiNetworkGetProperty((uint64_t)result, CFSTR("SSID_STR"));
    if (!result)
    {
      Property = (const __CFData *)WiFiNetworkGetProperty(v1, CFSTR("SSID"));
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (Property
        && ((v4 = Property,
             (v5 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Property, 0x8000100u)) != 0)
         || (v5 = CFStringCreateFromExternalRepresentation(v3, v4, 0)) != 0)
        || (v5 = CFStringCreateWithCString(v3, "", 0x8000100u)) != 0)
      {
        WiFiNetworkSetProperty(v1, CFSTR("SSID_STR"), v5);
        CFRelease(v5);
      }
      return WiFiNetworkGetProperty(v1, CFSTR("SSID_STR"));
    }
  }
  return result;
}

const __CFString *WiFiNetworkGetAccountForNetwork(const void *a1)
{
  const __CFString *SSID;
  const __CFString *v3;
  const void *Property;

  if (!a1)
    return 0;
  SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
  v3 = SSID;
  if ((!SSID || !CFStringGetLength(SSID)) && WiFiNetworkIsHotspot20((_BOOL8)a1))
  {
    Property = WiFiNetworkGetProperty((uint64_t)a1, CFSTR("DomainName"));
    if (Property)
      return (const __CFString *)Property;
  }
  return v3;
}

void WiFiNetworkMergeAutoJoinProperties(uint64_t a1, uint64_t a2)
{
  _BOOL4 IsEnabled;
  const void *Property;
  const void *v6;
  const void *v7;
  const void *v8;

  if (!a1 || !a2)
    goto LABEL_7;
  WiFiNetworkRemoveAutoJoinProperties(a1);
  IsEnabled = WiFiNetworkIsEnabled(a2);
  WiFiNetworkSetState(a1, IsEnabled);
  if (!IsEnabled)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    Property = WiFiNetworkGetProperty(a2, CFSTR("networkDisabledClientName"));
    WiFiNetworkSetProperty(a1, CFSTR("networkDisabledClientName"), Property);
    v6 = WiFiNetworkGetProperty(a2, CFSTR("networkDisabledReason"));
    WiFiNetworkSetProperty(a1, CFSTR("networkDisabledReason"), v6);
    v7 = WiFiNetworkGetProperty(a2, CFSTR("networkDisabledTimestamp"));
    WiFiNetworkSetProperty(a1, CFSTR("networkDisabledTimestamp"), v7);
    v8 = WiFiNetworkGetProperty(a2, CFSTR("WiFiNetworkDisabledUntilDate"));
    if (v8)
    {
      WiFiNetworkSetProperty(a1, CFSTR("WiFiNetworkDisabledUntilDate"), v8);
LABEL_7:
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
}

void WiFiNetworkMerge(uint64_t a1, uint64_t a2)
{
  int v4;

  if (a2)
  {
    WiFiNetworkMergeProperties(a1, *(CFDictionaryRef *)(a2 + 16));
    if (*(__int16 *)(a1 + 24) == -1)
    {
      v4 = *(unsigned __int16 *)(a2 + 24);
      if (v4 != 0xFFFF)
        *(_WORD *)(a1 + 24) = v4;
    }
  }
}

void WiFiNetworkMergeProperties(uint64_t a1, CFDictionaryRef theDict)
{
  uint64_t v3;
  unsigned int Count;
  uint64_t v5;
  size_t v6;
  const void **v7;
  uint64_t v8;
  int v9;
  const __CFString *v10;
  const __CFNumber *v11;
  const __CFDictionary *Property;
  const __CFDictionary *Mutable;
  const __CFDictionary *v14;
  const __CFDictionary *v15;
  const __CFDictionary *v16;
  void *v17;
  void *v18;
  CFDictionaryRef v19;
  const __CFAllocator *Default;
  __CFDictionary *MutableCopy;
  const __CFDictionary *v22;
  const __CFArray *v23;
  const __CFArray *v24;
  CFIndex v25;
  CFIndex v26;
  CFIndex v27;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v29;
  const __CFString *v30;
  const __CFString *v31;
  const __CFString *v32;
  const __CFString *v33;
  CFIndex v34;
  const __CFDictionary *v35;
  uint64_t v36;
  const __CFAllocator *allocator;
  uint64_t v38;
  __CFArray *v39;
  const void **v40;
  CFIndex v41;
  const __CFArray *theArray;
  char v43;
  void *value;
  const __CFDictionary *valuePtr;

  if (!a1)
    return;
  if (!theDict)
    return;
  v3 = a1;
  Count = CFDictionaryGetCount(theDict);
  v5 = Count;
  if (!Count)
    return;
  v6 = 8 * Count;
  v7 = (const void **)malloc_type_malloc(v6, 0x6004044C4A2DFuLL);
  v40 = (const void **)malloc_type_malloc(v6, 0xC0040B8AA526DuLL);
  CFDictionaryGetKeysAndValues(theDict, v7, v40);
  v8 = 0;
  v9 = 0;
  v43 = 0;
  v10 = CFSTR("LEAKY_AP_LEARNED_DATA");
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v38 = v5;
  do
  {
    if (CFStringCompare(v10, (CFStringRef)v7[v8], 0) == kCFCompareEqualTo)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v43 = 1;
    }
    if (WiFiNetworkIsHotspot20(v3)
      && (CFStringCompare(CFSTR("SSID_STR"), (CFStringRef)v7[v8], 0) == kCFCompareEqualTo
       || CFStringCompare(CFSTR("SSID"), (CFStringRef)v7[v8], 0) == kCFCompareEqualTo))
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      goto LABEL_42;
    }
    if (CFStringCompare(CFSTR("PRIVATE_MAC_ADDRESS"), (CFStringRef)v7[v8], 0) == kCFCompareEqualTo)
      goto LABEL_42;
    if (CFStringCompare(CFSTR("EnterpriseProfile"), (CFStringRef)v7[v8], 0) == kCFCompareEqualTo)
    {
      Property = (const __CFDictionary *)WiFiNetworkGetProperty(v3, CFSTR("EnterpriseProfile"));
      Mutable = Property;
      if (!Property)
        Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v14 = (const __CFDictionary *)v40[v8];
      v15 = _copyDictionaryAddingMissingValuesFromSource(Mutable, v14);
      value = 0;
      valuePtr = 0;
      CFDictionaryGetValueIfPresent(v14, CFSTR("EAPClientConfiguration"), (const void **)&valuePtr);
      CFDictionaryGetValueIfPresent(Mutable, CFSTR("EAPClientConfiguration"), (const void **)&value);
      v16 = valuePtr;
      if (valuePtr)
      {
        v17 = value;
        v18 = value;
        if (!value)
        {
          v18 = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          value = v18;
          v16 = valuePtr;
        }
        v19 = _copyDictionaryAddingMissingValuesFromSource((CFDictionaryRef)v18, v16);
        Default = CFAllocatorGetDefault();
        MutableCopy = CFDictionaryCreateMutableCopy(Default, 0, v15);
        CFDictionarySetValue(MutableCopy, CFSTR("EAPClientConfiguration"), v19);
        WiFiNetworkSetProperty(v3, CFSTR("EnterpriseProfile"), MutableCopy);
        if (MutableCopy)
          CFRelease(MutableCopy);
        if (v19)
          CFRelease(v19);
        if (!v17 && value)
        {
          CFRelease(value);
          value = 0;
        }
        if (!v15)
        {
LABEL_37:
          if (!Property && Mutable)
          {
            v22 = Mutable;
            goto LABEL_40;
          }
LABEL_41:
          v9 = 1;
          v5 = v38;
          goto LABEL_42;
        }
      }
      else
      {
        WiFiNetworkSetProperty(v3, CFSTR("EnterpriseProfile"), v15);
        if (!v15)
          goto LABEL_37;
      }
      CFRelease(v15);
      goto LABEL_37;
    }
    if (CFStringCompare(CFSTR("HomePropertyFromMobilewifitool"), (CFStringRef)v7[v8], 0)
      && CFStringCompare(CFSTR("COLOCATED_NETWORK_SCOPE_ID"), (CFStringRef)v7[v8], 0))
    {
      if (CFStringCompare(CFSTR("NetworkOfInterestHomeState"), (CFStringRef)v7[v8], 0) == kCFCompareEqualTo)
      {
        v11 = (const __CFNumber *)v40[v8];
        LODWORD(valuePtr) = 0;
        if (WiFiNetworkGetNetworkOfInterestHomeType(v3))
        {
          if (v11)
            CFNumberGetValue(v11, kCFNumberSInt32Type, &valuePtr);
        }
      }
      if (CFStringCompare(CFSTR("networkKnownBSSListKey"), (CFStringRef)v7[v8], 0) == kCFCompareEqualTo)
      {
        v23 = (const __CFArray *)WiFiNetworkGetProperty(v3, CFSTR("networkKnownBSSListKey"));
        theArray = (const __CFArray *)v40[v8];
        if (theArray)
        {
          v24 = v23;
          if (v23)
          {
            v36 = v3;
            v25 = CFArrayGetCount(theArray);
            v26 = CFArrayGetCount(v24);
            v39 = CFArrayCreateMutableCopy(allocator, 0, v24);
            v41 = v25;
            if (v25 >= 1)
            {
              v27 = 0;
              do
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(theArray, v27);
                if (ValueAtIndex)
                {
                  v29 = ValueAtIndex;
                  v30 = v10;
                  v31 = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
                  if (v26 < 1)
                  {
LABEL_59:
                    CFArrayAppendValue(v39, v29);
                  }
                  else
                  {
                    v32 = v31;
                    v33 = 0;
                    v34 = 0;
                    while (1)
                    {
                      v35 = (const __CFDictionary *)CFArrayGetValueAtIndex(v24, v34);
                      if (v35)
                        v33 = (const __CFString *)CFDictionaryGetValue(v35, CFSTR("BSSID"));
                      if (v33 && v32 && CFStringCompare(v33, v32, 1uLL) == kCFCompareEqualTo)
                        break;
                      if (v26 == ++v34)
                        goto LABEL_59;
                    }
                    CFArraySetValueAtIndex(v39, v34, v29);
                  }
                  v10 = v30;
                }
                ++v27;
              }
              while (v27 != v41);
            }
            v3 = v36;
            WiFiNetworkSetProperty(v36, CFSTR("networkKnownBSSListKey"), v39);
            if (v39)
            {
              v22 = v39;
LABEL_40:
              CFRelease(v22);
            }
            goto LABEL_41;
          }
        }
      }
      if (CFStringCompare(CFSTR("lastUpdated"), (CFStringRef)v7[v8], 0) || v9 != 1)
      {
        CFRetain(v40[v8]);
        CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 16), v7[v8], v40[v8]);
        CFRelease(v40[v8]);
      }
    }
LABEL_42:
    ++v8;
  }
  while (v8 != v5);
  if ((v43 & 1) == 0)
  {
    if (WiFiNetworkGetProperty(v3, CFSTR("LEAKY_AP_LEARNED_DATA")))
    {
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(v3 + 16), CFSTR("LEAKY_AP_LEARNED_DATA"));
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  free(v40);
  free(v7);
}

CFDictionaryRef _copyDictionaryAddingMissingValuesFromSource(CFDictionaryRef result, CFDictionaryRef theDict)
{
  const __CFDictionary *v3;
  unsigned int Count;
  uint64_t v5;
  size_t v6;
  const void **v7;
  const void **v8;
  const __CFAllocator *Default;
  const __CFDictionary *MutableCopy;
  unint64_t v11;
  uint64_t v12;
  const __CFAllocator *v13;
  CFDictionaryRef Copy;
  const __CFAllocator *v15;

  if (result)
  {
    v3 = result;
    if (theDict && (Count = CFDictionaryGetCount(theDict), (v5 = Count) != 0))
    {
      v6 = 8 * Count;
      v7 = (const void **)malloc_type_malloc(v6, 0x6004044C4A2DFuLL);
      v8 = (const void **)malloc_type_malloc(v6, 0xC0040B8AA526DuLL);
      Default = CFAllocatorGetDefault();
      MutableCopy = CFDictionaryCreateMutableCopy(Default, 0, v3);
      CFDictionaryGetKeysAndValues(theDict, v7, v8);
      v11 = 0;
      v12 = 8 * v5;
      do
      {
        CFDictionaryGetValueIfPresent(MutableCopy, v7[v11 / 8], 0);
        CFDictionaryAddValue(MutableCopy, v7[v11 / 8], v8[v11 / 8]);
        v11 += 8;
      }
      while (v12 != v11);
      free(v8);
      free(v7);
      v13 = CFAllocatorGetDefault();
      Copy = CFDictionaryCreateCopy(v13, MutableCopy);
      CFRelease(MutableCopy);
      return Copy;
    }
    else
    {
      v15 = CFAllocatorGetDefault();
      return CFDictionaryCreateCopy(v15, v3);
    }
  }
  return result;
}

const __CFNumber *WiFiNetworkGetNetworkOfInterestHomeType(uint64_t a1)
{
  const __CFNumber *result;
  int Value;
  unsigned int valuePtr;

  valuePtr = 0;
  if (a1)
  {
    result = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("NetworkOfInterestHomeState"));
    if (result)
    {
      Value = CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr - 3 >= 0xFFFFFFFE || Value == 0)
        return (const __CFNumber *)valuePtr;
      else
        return 0;
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

const void *WiFiNetworkGetKnownBssList(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
}

const __CFDictionary *WiFiNetworkRecordGetSSID(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  const __CFData *Value;
  const __CFAllocator *v3;
  const __CFData *v4;
  CFStringRef v5;

  if (result)
  {
    v1 = result;
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("SSID_STR"));
    if (!result)
    {
      Value = (const __CFData *)CFDictionaryGetValue(v1, CFSTR("SSID"));
      v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      if (Value
        && ((v4 = Value,
             (v5 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Value, 0x8000100u)) != 0)
         || (v5 = CFStringCreateFromExternalRepresentation(v3, v4, 0)) != 0)
        || (v5 = CFStringCreateWithCString(v3, "", 0x8000100u)) != 0)
      {
        CFDictionarySetValue(v1, CFSTR("SSID_STR"), v5);
        CFRelease(v5);
      }
      return (const __CFDictionary *)CFDictionaryGetValue(v1, CFSTR("SSID_STR"));
    }
  }
  return result;
}

const __CFString *WiFiNetworkGetSSIDData(const void *a1)
{
  const __CFString *result;
  const __CFString *v3;

  result = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("SSID"));
  if (!result)
  {
    result = (const __CFString *)WiFiNetworkGetSSID(a1);
    if (result)
    {
      result = (const __CFString *)CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], result, 0x8000100u, 0);
      if (result)
      {
        v3 = result;
        WiFiNetworkSetProperty((uint64_t)a1, CFSTR("SSID"), result);
        CFRelease(v3);
        return (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("SSID"));
      }
    }
  }
  return result;
}

CFDataRef WiFiNetworkCopyBSSIDData(uint64_t a1)
{
  CFDataRef result;
  const __CFString *v2;
  CFTypeID v3;
  uint64_t v4;
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  result = (CFDataRef)WiFiNetworkGetProperty(a1, CFSTR("BSSID"));
  if (result)
  {
    v2 = (const __CFString *)result;
    v3 = CFGetTypeID(result);
    if (v3 == CFStringGetTypeID()
      && (v4 = 0, v5[0] = 0, *(_DWORD *)((char *)v5 + 7) = 0, CFStringGetCString(v2, (char *)&v4, 19, 0x8000100u)))
    {
      result = (CFDataRef)ether_aton((const char *)&v4);
      if (result)
        return CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)result, 6);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

const __CFArray *WiFiNetworkGetLastBSSID(const __CFArray *result)
{
  uint64_t v1;
  const __CFArray *v2;
  CFIndex Count;

  if (result)
  {
    v1 = (uint64_t)result;
    result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("BSSID"));
    if (!result)
    {
      result = (const __CFArray *)WiFiNetworkGetProperty(v1, CFSTR("networkKnownBSSListKey"));
      if (result)
      {
        v2 = result;
        result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          Count = CFArrayGetCount(v2);
          result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result)
            return (const __CFArray *)CFDictionaryGetValue(result, CFSTR("BSSID"));
        }
      }
    }
  }
  return result;
}

const void *WiFiNetworkGetBSSIDList(const void *result)
{
  if (result)
    return WiFiNetworkGetProperty((uint64_t)result, CFSTR("SCAN_BSSID_LIST"));
  return result;
}

const __CFArray *WiFiNetworkGetLastChannel(const __CFArray *result)
{
  uint64_t v1;
  const __CFArray *v2;
  CFIndex Count;

  if (result)
  {
    v1 = (uint64_t)result;
    result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("CHANNEL"));
    if (!result)
    {
      result = (const __CFArray *)WiFiNetworkGetProperty(v1, CFSTR("networkKnownBSSListKey"));
      if (result)
      {
        v2 = result;
        result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          Count = CFArrayGetCount(v2);
          result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result)
            return (const __CFArray *)CFDictionaryGetValue(result, CFSTR("CHANNEL"));
        }
      }
    }
  }
  return result;
}

const void *WiFiNetworkGetChannel(uint64_t a1, uint64_t a2)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("CHANNEL"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](0, a2));
  return 0;
}

const __CFArray *WiFiNetworkGetBandHistory(const __CFArray *result)
{
  uint64_t v1;
  const __CFArray *v2;
  CFIndex Count;

  if (result)
  {
    v1 = (uint64_t)result;
    result = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("CHANNEL"));
    if (!result)
    {
      result = (const __CFArray *)WiFiNetworkGetProperty(v1, CFSTR("networkKnownBSSListKey"));
      if (result)
      {
        v2 = result;
        result = (const __CFArray *)CFArrayGetCount(result);
        if (result)
        {
          Count = CFArrayGetCount(v2);
          result = (const __CFArray *)CFArrayGetValueAtIndex(v2, Count - 1);
          if (result)
            return (const __CFArray *)CFDictionaryGetValue(result, CFSTR("CHANNEL"));
        }
      }
    }
  }
  return result;
}

uint64_t WiFiNetworkGetRateBounds(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  uint64_t result;
  const __CFArray *v6;
  uint64_t v7;
  CFIndex i;
  const void *v9;
  CFTypeID TypeID;
  uint64_t v11;
  int valuePtr;

  *a3 = 0xFFFFFFFF80000000;
  *a2 = 37;
  result = (uint64_t)WiFiNetworkGetProperty(a1, CFSTR("RATES"));
  if (result)
  {
    v6 = (const __CFArray *)result;
    result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      v7 = result;
      for (i = 0; i != v7; ++i)
      {
        result = (uint64_t)CFArrayGetValueAtIndex(v6, i);
        valuePtr = -1431655766;
        if (result)
        {
          v9 = (const void *)result;
          TypeID = CFNumberGetTypeID();
          result = CFGetTypeID(v9);
          if (TypeID == result)
          {
            result = CFNumberGetValue((CFNumberRef)v9, kCFNumberIntType, &valuePtr);
            v11 = valuePtr;
            if (*a3 < valuePtr)
              *a3 = valuePtr;
            if (*a2 > v11)
              *a2 = v11;
          }
        }
      }
    }
  }
  return result;
}

const __CFNumber *WiFiNetworkGetRSSI(const __CFNumber *result)
{
  const __CFNumber *Property;

  if (result)
  {
    Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("RSSI"));
    return _CFTypeGetIntValue(Property);
  }
  return result;
}

const __CFNumber *WiFiNetworkGetIntProperty(uint64_t a1, void *a2)
{
  const __CFNumber *Property;

  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, a2);
  return _CFTypeGetIntValue(Property);
}

BOOL __WiFiNetworkIsWPAEAP(const __CFDictionary *a1)
{
  const __CFDictionary *Value;
  const __CFDictionary *v3;
  CFTypeID TypeID;
  _BOOL8 v5;

  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("WPA_IE"));
  v3 = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("RSN_IE"));
  if (Value && (TypeID = CFDictionaryGetTypeID(), _CFValidateType(TypeID, Value)))
  {
    v5 = 1;
    if (!__WiFiNetworkContainsAuthSelector(Value, 1))
      v5 = __WiFiNetworkContainsAuthSelector(Value, 0) != 0;
  }
  else
  {
    v5 = 0;
  }
  if (!v5)
  {
    if (v3)
    {
      v5 = 1;
      if (!__WiFiNetworkContainsAuthSelector(v3, 1)
        && !__WiFiNetworkContainsAuthSelector(v3, 0)
        && !__WiFiNetworkContainsAuthSelector(v3, 3)
        && !__WiFiNetworkContainsAuthSelector(v3, 5)
        && !__WiFiNetworkContainsAuthSelector(v3, 12))
      {
        return __WiFiNetworkContainsAuthSelector(v3, 13) != 0;
      }
    }
  }
  return v5;
}

const __CFDictionary *WiFiNetworkIsSAE(const __CFDictionary *result)
{
  if (result)
    return __WiFiNetworkIsSAE(*((const __CFDictionary **)result + 2));
  return result;
}

void WiFiNetworkSetSAE(int a1, int a2, int a3)
{
  const __CFAllocator *v5;
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  CFNumberRef v8;
  CFNumberRef v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFDictionaryRef v12;
  CFDictionaryRef v13;
  void *keys;
  uint64_t valuePtr;
  void *values;

  if (a2)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    values = Mutable;
    if (Mutable)
    {
      v7 = Mutable;
      valuePtr = 8;
      v8 = CFNumberCreate(v5, kCFNumberCFIndexType, &valuePtr);
      if (v8)
      {
        v9 = v8;
        CFArrayAppendValue(v7, v8);
        CFRelease(v9);
      }
      if (a3)
      {
        valuePtr = 2;
        v10 = CFNumberCreate(v5, kCFNumberCFIndexType, &valuePtr);
        if (v10)
        {
          v11 = v10;
          CFArrayAppendValue(v7, v10);
          CFRelease(v11);
        }
      }
      else
      {
        WiFiNetworkSetProperty(a1, CFSTR("ALLOW_WPA2_PSK"));
      }
      keys = CFSTR("IE_KEY_RSN_AUTHSELS");
      v12 = CFDictionaryCreate(v5, (const void **)&keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (v12)
      {
        v13 = v12;
        WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"));
        CFRelease(v13);
      }
      CFRelease(values);
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"));
  }
}

uint64_t WiFiNetworkIsWPAWPA2PSK(uint64_t result)
{
  const __CFDictionary *v1;

  if (result)
  {
    v1 = *(const __CFDictionary **)(result + 16);
    if (__WiFiNetworkSupportsWPA(v1))
      return 1;
    else
      return __WiFiNetworkSupportsWPA2(v1);
  }
  return result;
}

void WiFiNetworkSetWPA(uint64_t a1, int a2)
{
  int v2;
  uint64_t v3;
  const __CFAllocator *v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  const __CFString *v9;
  CFTypeRef cf;
  uint64_t valuePtr;
  void *values;

  v2 = a1;
  if (a2)
  {
    v3 = 2 * (WiFiNetworkGetProperty(a1, CFSTR("EnterpriseProfile")) == 0);
    valuePtr = v3;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      cf = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      if (cf)
      {
        v9 = CFSTR("IE_KEY_RSN_AUTHSELS");
        v5 = CFDictionaryCreate(v4, (const void **)&v9, &cf, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (v5)
        {
          v6 = v5;
          WiFiNetworkSetProperty(v2, CFSTR("RSN_IE"));
          CFRelease(v6);
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
      }
      if (values)
      {
        CFRelease(values);
        values = 0;
      }
    }
    valuePtr = v3;
    values = CFNumberCreate(v4, kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      cf = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      if (cf)
      {
        v9 = CFSTR("IE_KEY_WPA_AUTHSELS");
        v7 = CFDictionaryCreate(v4, (const void **)&v9, &cf, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (v7)
        {
          v8 = v7;
          WiFiNetworkSetProperty(v2, CFSTR("WPA_IE"));
          CFRelease(v8);
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
      }
      if (values)
        CFRelease(values);
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"));
    WiFiNetworkSetProperty(v2, CFSTR("WPA_IE"));
  }
}

void WiFiNetworkSetIntProperty(uint64_t a1, void *a2, uint64_t a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  uint64_t valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    WiFiNetworkSetProperty(a1, a2, v5);
    CFRelease(v6);
  }
}

double WiFiNetworkGetFloatProperty(uint64_t a1, void *a2)
{
  const void *Property;

  Property = WiFiNetworkGetProperty(a1, a2);
  return _CFTypeGetFloatValue(Property);
}

void WiFiNetworkSetFloatProperty(uint64_t a1, void *a2, double a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  double valuePtr;

  valuePtr = a3;
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    WiFiNetworkSetProperty(a1, a2, v5);
    CFRelease(v6);
  }
}

uint64_t WiFiNetworkIsHidden(const void *a1)
{
  const __CFNumber *Property;
  unsigned int IntValue;
  unsigned int v4;
  const __CFNumber *v5;

  Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("HIDDEN_NETWORK"));
  IntValue = _CFTypeGetIntValue(Property);
  if (IntValue)
    goto LABEL_2;
  v5 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("scanWasDirected"));
  if (!_CFTypeGetIntValue(v5))
  {
    IntValue = WiFiNetworkIsHiddenSSID(a1);
LABEL_2:
    v4 = 0;
    goto LABEL_5;
  }
  IntValue = 0;
  v4 = 1;
LABEL_5:
  if (IntValue)
    return 1;
  else
    return v4;
}

BOOL WiFiNetworkIsHiddenSSID(const void *a1)
{
  const void *SSID;
  const void *v2;

  SSID = WiFiNetworkGetSSID(a1);
  if (SSID && (v2 = SSID, !CFEqual(SSID, &stru_1E713D868)))
    return CFEqual(v2, CFSTR(" ")) != 0;
  else
    return 1;
}

BOOL WiFiNetworkIsSSIDAmbiguous(uint64_t a1)
{
  const void *Property;

  Property = WiFiNetworkGetProperty(a1, CFSTR("AmbiguousSSIDs"));
  return Property && Property == (const void *)*MEMORY[0x1E0C9AE50];
}

BOOL WiFiNetworkIsSSIDUnmappable(const void *a1)
{
  const __CFString *SSID;

  SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
  return SSID && CFStringHasSuffix(SSID, CFSTR("_nomap"));
}

uint64_t WiFiNetworkGetDirectedState(const void *a1)
{
  const __CFNumber *Property;
  uint64_t IntValue;
  unsigned int v4;

  Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("UserDirected"));
  IntValue = _CFTypeGetIntValue(Property);
  if (IntValue || !WiFiNetworkIsHidden(a1))
  {
    v4 = 0;
  }
  else
  {
    WiFiNetworkSetProperty((uint64_t)a1, CFSTR("UserDirected"), (const void *)*MEMORY[0x1E0C9AE50]);
    v4 = 1;
  }
  if (IntValue)
    return 1;
  else
    return v4;
}

void WiFiNetworkSetDirectedState(uint64_t a1, int a2)
{
  const void **v2;

  v2 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v2 = (const void **)MEMORY[0x1E0C9AE40];
  WiFiNetworkSetProperty(a1, CFSTR("UserDirected"), *v2);
}

BOOL WiFiNetworkWasCaptive(uint64_t a1)
{
  return MEMORY[0x1E0D0D1B8]
      && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E0D0D2D8]) == (const void *)*MEMORY[0x1E0C9AE50];
}

const void *WiFiNetworkGetAPEnv(uint64_t a1)
{
  const __CFDictionary *v1;

  if (a1 && (v1 = *(const __CFDictionary **)(a1 + 16)) != 0)
    return CFDictionaryGetValue(v1, CFSTR("DiagnosticsBssEnv"));
  else
    return 0;
}

uint64_t WiFiNetworkGetCaptiveStatus(uint64_t a1)
{
  int ValueIfPresent;
  unsigned int v2;
  void *value;

  if (!MEMORY[0x1E0D0D1B8])
    return 0;
  value = 0;
  ValueIfPresent = CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E0D0D290], (const void **)&value);
  if (value == (void *)*MEMORY[0x1E0C9AE50])
    v2 = 2;
  else
    v2 = 1;
  if (ValueIfPresent)
    return v2;
  else
    return 0;
}

BOOL WiFiNetworkIsWoWAllowed(uint64_t a1)
{
  const void *v2;
  CFTypeID v3;
  const __CFData *Value;
  const __CFData *v5;
  CFTypeID v6;
  const UInt8 *BytePtr;
  const UInt8 *v8;
  CFIndex Length;
  uint64_t v10;
  uint64_t v12;

  if (!a1)
    goto LABEL_17;
  v2 = *(const void **)(a1 + 16);
  if (!v2)
    goto LABEL_17;
  v3 = CFGetTypeID(v2);
  if (v3 != CFDictionaryGetTypeID())
    goto LABEL_17;
  Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IE"));
  if (!Value)
    return 1;
  v5 = Value;
  v6 = CFGetTypeID(Value);
  if (v6 != CFDataGetTypeID())
  {
LABEL_17:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 1;
  }
  BytePtr = CFDataGetBytePtr(v5);
  if (!BytePtr)
    return 1;
  v8 = BytePtr;
  Length = CFDataGetLength(v5);
  if (Length << 32 < 1)
    return 1;
  v10 = 0;
  while (*v8 != 221 || v8[1] != 10 || *(_DWORD *)(v8 + 2) != 116528896 || *(_DWORD *)(v8 + 5) != 50397446)
  {
    v12 = v8[1] + 2;
    v10 += v12;
    v8 += v12;
    if (v10 >= (int)Length)
      return 1;
  }
  return (v8[9] & 3) != 1;
}

const __CFData *WiFiNetworkFoundNanIe(uint64_t a1)
{
  const void *v2;
  CFTypeID v3;
  const __CFData *result;
  const __CFData *v5;
  unsigned __int8 *v6;
  CFIndex Length;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  uint64_t v12;
  uint64_t v14;
  unsigned __int8 *v16;

  if (!a1 || (v2 = *(const void **)(a1 + 16)) == 0 || (v3 = CFGetTypeID(v2), v3 != CFDictionaryGetTypeID()))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  result = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IE"));
  if (!result)
    return result;
  v5 = result;
  result = (const __CFData *)CFDataGetBytePtr(result);
  if (!result)
    return result;
  v6 = (unsigned __int8 *)result;
  Length = CFDataGetLength(v5);
  if (Length << 32 < 1)
    return 0;
  v8 = 0;
  v9 = (unint64_t)&v6[(int)Length];
  while (1)
  {
    v10 = v6 + 6;
    if (*v6 == 221
      && (unint64_t)v10 <= v9
      && *(_DWORD *)(v6 + 2) == 116528896
      && (unint64_t)(v6 + 9) <= v9)
    {
      break;
    }
LABEL_13:
    v12 = v6[1] + 2;
    v8 += v12;
    v6 += v12;
    if (v8 >= (int)Length)
      return 0;
  }
  while (1)
  {
    v14 = v10[2];
    if (*(_WORD *)v10 == 260 && (_DWORD)v14 == 18)
      return (const __CFData *)1;
    v16 = &v10[v14];
    v10 = v16 + 3;
    if ((unint64_t)(v16 + 6) > v9)
      goto LABEL_13;
  }
}

uint64_t WiFiNetworkIsNanPH(uint64_t a1)
{
  uint64_t result;

  if (a1)
  {
    result = WiFiNetworkIsApplePersonalHotspot(a1);
    if ((_DWORD)result)
    {
      result = (uint64_t)WiFiNetworkFoundNanIe(a1);
      if ((_DWORD)result)
        return WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkNANServiceID")) != 0;
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

const __CFData *WiFiNetworkGetBtMacFromIe(uint64_t a1, uint64_t a2)
{
  const __CFData *result;
  const __CFData *v4;
  unsigned __int8 *v5;
  CFIndex Length;
  uint64_t v7;
  uint64_t v9;
  int v10;

  result = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IE"));
  if (result)
  {
    v4 = result;
    result = (const __CFData *)CFDataGetBytePtr(result);
    if (result)
    {
      v5 = (unsigned __int8 *)result;
      Length = CFDataGetLength(v4);
      if (Length << 32 < 1)
      {
        return 0;
      }
      else
      {
        v7 = 0;
        while (*v5 != 221 || v5[1] != 13 || *(_DWORD *)(v5 + 2) != 116528896 || *(_DWORD *)(v5 + 5) != 100729350)
        {
          v9 = v5[1] + 2;
          v7 += v9;
          v5 += v9;
          if (v7 >= (int)Length)
            return 0;
        }
        v10 = *(_DWORD *)(v5 + 9);
        *(_WORD *)(a2 + 4) = *(_WORD *)(v5 + 13);
        *(_DWORD *)a2 = v10;
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        return (const __CFData *)1;
      }
    }
  }
  return result;
}

const UInt8 *WiFiNetworkCopyNanPHSServiceNameFromIe(uint64_t a1)
{
  _BYTE *v2;
  const __CFData *Value;
  const __CFData *v4;
  const UInt8 *BytePtr;
  CFIndex Length;
  uint64_t v7;
  unint64_t v8;
  unsigned __int16 *v9;
  uint64_t v11;
  uint64_t v13;
  char *v15;
  __int128 v16;

  v2 = malloc_type_malloc(0x11uLL, 0xC32A05B9uLL);
  Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IE"));
  if (!Value)
    goto LABEL_23;
  v4 = Value;
  BytePtr = CFDataGetBytePtr(Value);
  if (!BytePtr)
    goto LABEL_24;
  Length = CFDataGetLength(v4);
  if (Length << 32 < 1)
  {
LABEL_23:
    BytePtr = 0;
    goto LABEL_24;
  }
  v7 = 0;
  v8 = (unint64_t)&BytePtr[(int)Length];
  while (1)
  {
    v9 = (unsigned __int16 *)(BytePtr + 6);
    if (*BytePtr == 221
      && (unint64_t)v9 <= v8
      && *(_DWORD *)(BytePtr + 2) == 116528896
      && (unint64_t)(BytePtr + 9) <= v8)
    {
      break;
    }
LABEL_10:
    v11 = BytePtr[1] + 2;
    v7 += v11;
    BytePtr += v11;
    if (v7 >= (int)Length)
      goto LABEL_23;
  }
  while (1)
  {
    v13 = *((unsigned __int8 *)v9 + 2);
    if (!(*v9 ^ 0x104 | v13 ^ 0x12) && (unint64_t)v9 + 21 <= v8)
      break;
    v15 = (char *)v9 + v13;
    v9 = (unsigned __int16 *)(v15 + 3);
    if ((unint64_t)(v15 + 6) > v8)
      goto LABEL_10;
  }
  v16 = *(_OWORD *)(v9 + 2);
  v2[16] = *((_BYTE *)v9 + 20);
  *(_OWORD *)v2 = v16;
  BytePtr = (const UInt8 *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s"), v2);
LABEL_24:
  free(v2);
  return BytePtr;
}

const UInt8 *WiFiNetworkGet11dCountryCodeFromIe(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  const __CFData *Value;
  const __CFData *v7;
  const UInt8 *result;
  const UInt8 *v9;
  CFIndex Length;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  __int16 v15;

  Value = (const __CFData *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IE"));
  if (*a3 < 3u || Value == 0)
    return 0;
  v7 = Value;
  result = CFDataGetBytePtr(Value);
  if (!result)
    return result;
  v9 = result;
  Length = CFDataGetLength(v7);
  if (Length << 32 < 1)
    return 0;
  v11 = 0;
  while (1)
  {
    v12 = v9[1];
    if (*v9 == 7 && v12 >= 3)
      break;
    v14 = v12 + 2;
    v11 += v14;
    v9 += v14;
    if (v11 >= (int)Length)
      return 0;
  }
  v15 = *((_WORD *)v9 + 1);
  *(_BYTE *)(a2 + 2) = v9[4];
  *(_WORD *)a2 = v15;
  *a3 = 3;
  return (const UInt8 *)1;
}

BOOL WiFiNetworkIsWPA(_BOOL8 result)
{
  uint64_t v1;
  const __CFDictionary *v2;

  if (result)
  {
    v1 = result;
    v2 = *(const __CFDictionary **)(result + 16);
    return __WiFiNetworkSupportsWPA(v2)
        || __WiFiNetworkSupportsWPA2(v2)
        || __WiFiNetworkIsSAE(*(const __CFDictionary **)(v1 + 16)) != 0;
  }
  return result;
}

const __CFDictionary *__WiFiNetworkIsSAE(const __CFDictionary *a1)
{
  const __CFDictionary *result;
  const __CFDictionary *v2;
  int v3;
  int v4;
  int v5;

  result = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("RSN_IE"));
  if (result)
  {
    v2 = result;
    v3 = __WiFiNetworkContainsAuthSelector(result, 8);
    v4 = __WiFiNetworkContainsAuthSelector(v2, 9) | v3;
    v5 = __WiFiNetworkContainsAuthSelector(v2, 24);
    return (const __CFDictionary *)(v4 | v5 | __WiFiNetworkContainsAuthSelector(v2, 25));
  }
  return result;
}

uint64_t WiFiNetworkSupportsWPA(uint64_t result)
{
  if (result)
    return __WiFiNetworkSupportsWPA(*(const __CFDictionary **)(result + 16));
  return result;
}

uint64_t __WiFiNetworkSupportsWPA(const __CFDictionary *a1)
{
  const __CFDictionary *Value;
  const __CFDictionary *v2;
  CFTypeID TypeID;

  Value = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("WPA_IE"));
  if (Value && (v2 = Value, TypeID = CFDictionaryGetTypeID(), _CFValidateType(TypeID, v2)))
    return __WiFiNetworkContainsAuthSelector(v2, 2);
  else
    return 0;
}

uint64_t WiFiNetworkSupportsWPA2(uint64_t result)
{
  if (result)
    return __WiFiNetworkSupportsWPA2(*(const __CFDictionary **)(result + 16));
  return result;
}

uint64_t __WiFiNetworkSupportsWPA2(const __CFDictionary *a1)
{
  uint64_t result;
  const __CFNumber *Value;

  if (__WiFiNetworkContainsWPA2Auth(a1))
  {
    LOBYTE(result) = 1;
  }
  else
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("ALLOW_WPA2_PSK"));
    LOBYTE(result) = _CFTypeGetIntValue(Value);
  }
  return result;
}

const __CFDictionary *WiFiNetworkContainsWPA2Auth(const __CFDictionary *result)
{
  if (result)
    return __WiFiNetworkContainsWPA2Auth(*((const __CFDictionary **)result + 2));
  return result;
}

const __CFDictionary *__WiFiNetworkContainsWPA2Auth(const __CFDictionary *result)
{
  const __CFDictionary *v1;

  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("RSN_IE"));
    if (result)
    {
      v1 = result;
      if (__WiFiNetworkContainsAuthSelector(result, 2)
        || __WiFiNetworkContainsAuthSelector(v1, 4))
      {
        return (const __CFDictionary *)1;
      }
      else
      {
        return (const __CFDictionary *)(__WiFiNetworkContainsAuthSelector(v1, 6) != 0);
      }
    }
  }
  return result;
}

const __CFDictionary *WiFiNetworkSupportsWPA3(const __CFDictionary *result)
{
  if (result)
    return __WiFiNetworkIsSAE(*((const __CFDictionary **)result + 2));
  return result;
}

void *WiFiNetworkIsBcnProtCapable(void *result)
{
  const __CFDictionary *v1;
  const __CFDictionary *v2;
  int valuePtr;
  void *value;

  if (result)
  {
    v1 = (const __CFDictionary *)*((_QWORD *)result + 2);
    value = 0;
    valuePtr = 0;
    v2 = (const __CFDictionary *)CFDictionaryGetValue(v1, CFSTR("EXT_CAPS"));
    result = 0;
    if (v2)
    {
      result = (void *)CFDictionaryGetValueIfPresent(v2, CFSTR("BEACON_PROTECTION"), (const void **)&value);
      if ((_DWORD)result)
      {
        result = value;
        if (value)
        {
          CFNumberGetValue((CFNumberRef)value, kCFNumberIntType, &valuePtr);
          return (void *)(valuePtr == 1);
        }
      }
    }
  }
  return result;
}

CFDictionaryRef *WiFiNetworkIsOCVCapable(CFDictionaryRef *result)
{
  if (result)
  {
    result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], CFSTR("RSN_IE"));
    if (result)
    {
      result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("IE_KEY_RSN_CAPS"));
      if (result)
      {
        result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("OCV"));
        if (result)
          return (CFDictionaryRef *)(CFBooleanGetValue((CFBooleanRef)result) == 1);
      }
    }
  }
  return result;
}

const __CFDictionary *WiFiNetworkIsSAEPK(const __CFDictionary *result)
{
  if (result)
    return __WiFiNetworkIsSAEPK(*((const __CFDictionary **)result + 2));
  return result;
}

const __CFDictionary *__WiFiNetworkIsSAEPK(const __CFDictionary *a1)
{
  const __CFDictionary *result;
  const __CFBoolean *Value;

  result = __WiFiNetworkIsSAE(a1);
  if ((_DWORD)result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("RSN_XE"));
    if (result)
    {
      result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("IE_KEY_RSNXE_CAPS"));
      if (result)
      {
        Value = (const __CFBoolean *)CFDictionaryGetValue(result, CFSTR("RSNXE_SAE_PK"));
        return (const __CFDictionary *)(CFBooleanGetValue(Value) == 1);
      }
    }
  }
  return result;
}

const __CFDictionary *WiFiNetworkIsSAEPKPasswordUsed(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  int valuePtr;
  void *value;

  if (result)
  {
    v1 = (const __CFDictionary *)*((_QWORD *)result + 2);
    value = 0;
    result = __WiFiNetworkIsSAE(v1);
    if ((_DWORD)result)
    {
      result = __WiFiNetworkIsSAEPK(v1);
      if ((_DWORD)result)
      {
        result = (const __CFDictionary *)CFDictionaryGetValue(v1, CFSTR("EXT_CAPS"));
        if (result)
        {
          valuePtr = -1431655766;
          result = (const __CFDictionary *)CFDictionaryGetValueIfPresent(result, CFSTR("SAE_PK_PASSWD_USED"), (const void **)&value);
          if ((_DWORD)result)
            return (const __CFDictionary *)(CFNumberGetValue((CFNumberRef)value, kCFNumberSInt32Type, &valuePtr)
                                         && valuePtr == 1);
        }
      }
    }
  }
  return result;
}

BOOL WiFiNetworkIsWAPIPSK(_BOOL8 result)
{
  if (result)
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 7) == 0;
  return result;
}

const __CFNumber *__WiFiNetworkGetWAPIPolicy(const __CFDictionary *a1)
{
  const __CFNumber *result;
  unsigned int valuePtr;

  valuePtr = 0;
  result = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("WAPI"));
  if (result)
  {
    CFNumberGetValue(result, kCFNumberIntType, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

BOOL WiFiNetworkIsWAPICERT(_BOOL8 result)
{
  if (result)
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 0xB) == 0;
  return result;
}

BOOL WiFiNetworkIsWAPI(_BOOL8 result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(result + 16)) & 0xB) == 0
        || (~__WiFiNetworkGetWAPIPolicy(*(const __CFDictionary **)(v1 + 16)) & 7) == 0;
  }
  return result;
}

uint64_t WiFiNetworkIsOWETransition(uint64_t result)
{
  const __CFDictionary *v1;
  const __CFNumber *Value;
  const __CFNumber *v3;

  if (result)
  {
    v1 = *(const __CFDictionary **)(result + 16);
    Value = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("SCAN_RESULT_OWE_MULTI_SSID"));
    LOBYTE(result) = _CFTypeGetIntValue(Value);
    if (!(_BYTE)result)
    {
      v3 = (const __CFNumber *)CFDictionaryGetValue(v1, CFSTR("ALLOW_OWE_TSN"));
      LOBYTE(result) = _CFTypeGetIntValue(v3);
    }
  }
  return result;
}

const __CFDictionary *WiFiNetworkIsOWEOnly(const __CFDictionary *result)
{
  if (result)
    return __WiFiNetworkIsOWEOnly(*((const __CFDictionary **)result + 2));
  return result;
}

const __CFDictionary *__WiFiNetworkIsOWEOnly(const __CFDictionary *a1)
{
  const __CFDictionary *result;
  const __CFNumber *Value;
  const __CFNumber *v4;

  result = (const __CFDictionary *)CFDictionaryGetValue(a1, CFSTR("RSN_IE"));
  if (result)
  {
    result = (const __CFDictionary *)__WiFiNetworkContainsAuthSelector(result, 18);
    if ((_DWORD)result)
    {
      Value = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("SCAN_RESULT_OWE_MULTI_SSID"));
      if (_CFTypeGetIntValue(Value))
      {
        return 0;
      }
      else
      {
        v4 = (const __CFNumber *)CFDictionaryGetValue(a1, CFSTR("ALLOW_OWE_TSN"));
        return (const __CFDictionary *)(_CFTypeGetIntValue(v4) == 0);
      }
    }
  }
  return result;
}

BOOL __WiFiNetworkIsEAP(const __CFDictionary *a1)
{
  return __WiFiNetworkIsWPAEAP(a1) || CFDictionaryGetValue(a1, CFSTR("EnterpriseProfile")) != 0;
}

BOOL WiFiNetworkAllowsPasswordBasedEAPType(_BOOL8 result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    result = WiFiNetworkIsEAP(result);
    if (result)
      return __WiFiNetworkIsEAPWithType(v1, 17)
          || __WiFiNetworkIsEAPWithType(v1, 21)
          || __WiFiNetworkIsEAPWithType(v1, 25)
          || __WiFiNetworkIsEAPWithType(v1, 26)
          || __WiFiNetworkIsEAPWithType(v1, 43) != 0;
  }
  return result;
}

const __CFArray *__WiFiNetworkIsEAPWithType(uint64_t a1, int a2)
{
  const __CFArray *result;
  const __CFArray *v4;
  const void *v5;
  CFIndex FirstIndexOfValue;
  int valuePtr;
  CFRange v8;

  valuePtr = a2;
  result = (const __CFArray *)WiFiNetworkIsEAP(a1);
  if ((_DWORD)result)
  {
    result = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("AcceptEAPTypes"));
    if (result)
    {
      v4 = result;
      result = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
      if (result)
      {
        v5 = result;
        v8.length = CFArrayGetCount(v4);
        v8.location = 0;
        FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v8, v5);
        CFRelease(v5);
        return (const __CFArray *)(FirstIndexOfValue != -1);
      }
    }
  }
  return result;
}

BOOL WiFiNetworkIsProfileBased(uint64_t a1)
{
  return a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("PayloadUUID"));
}

BOOL WiFiNetworkIsShareble(uint64_t a1)
{
  const __CFNumber *Value;
  int valuePtr;

  valuePtr = 0;
  if (!a1)
    return 1;
  Value = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IsWiFiNetworkShareble"));
  if (!Value)
    return 1;
  CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
  return valuePtr != 0;
}

BOOL WiFiNetworkIsAppBased(uint64_t a1)
{
  return a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("BundleIdentifier"));
}

void WiFiNetworkGetTimeToExpire(uint64_t a1)
{
  if (WiFiNetworkGetExpireDate(a1) != 0.0)
    CFAbsoluteTimeGetCurrent();
}

double WiFiNetworkGetExpireDate(uint64_t a1)
{
  const __CFNumber *Property;
  double valuePtr;

  valuePtr = 0.0;
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0.0;
  }
  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkExpirationDate"));
  if (!Property)
    return 0.0;
  CFNumberGetValue(Property, kCFNumberDoubleType, &valuePtr);
  return valuePtr;
}

void WiFiNetworkSetExpireDate(uint64_t a1, uint64_t a2)
{
  double v3;

  if (a1)
  {
    if (a2)
    {
      v3 = MEMORY[0x1BCCCA950](a2);
      WiFiNetworkSetFloatProperty(a1, CFSTR("WiFiNetworkExpirationDate"), v3);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      WiFiNetworkSetProperty(a1, CFSTR("WiFiNetworkExpirationDate"), 0);
    }
  }
}

BOOL WiFiNetworkIsExpirable(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkExpirationDate")) != 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

void WiFiNetworkSetWEP(uint64_t a1, int a2)
{
  const void **v2;

  v2 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v2 = (const void **)MEMORY[0x1E0C9AE40];
  WiFiNetworkSetProperty(a1, CFSTR("WEP"), *v2);
}

void WiFiNetworkSetOWE(uint64_t a1, int a2)
{
  const __CFAllocator *v3;
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFDictionaryRef v8;
  CFDictionaryRef v9;
  void *keys;
  uint64_t valuePtr;
  void *values;

  if (a2)
  {
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    values = Mutable;
    if (Mutable)
    {
      v5 = Mutable;
      valuePtr = 18;
      v6 = CFNumberCreate(v3, kCFNumberCFIndexType, &valuePtr);
      if (v6)
      {
        v7 = v6;
        CFArrayAppendValue(v5, v6);
        CFRelease(v7);
      }
      keys = CFSTR("IE_KEY_RSN_AUTHSELS");
      v8 = CFDictionaryCreate(v3, (const void **)&keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (v8)
      {
        v9 = v8;
        WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"), v8);
        CFRelease(v9);
      }
      CFRelease(values);
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"), 0);
  }
}

void WiFiNetworkSetEAP(uint64_t a1, int a2)
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  const __CFString *v8;
  CFTypeRef cf;
  uint64_t valuePtr;
  void *values;

  if (a2)
  {
    valuePtr = 1;
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      cf = CFArrayCreate(v3, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      if (cf)
      {
        v8 = CFSTR("IE_KEY_RSN_AUTHSELS");
        v4 = CFDictionaryCreate(v3, (const void **)&v8, &cf, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (v4)
        {
          v5 = v4;
          WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"), v4);
          CFRelease(v5);
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
      }
      if (values)
      {
        CFRelease(values);
        values = 0;
      }
    }
    valuePtr = 1;
    values = CFNumberCreate(v3, kCFNumberCFIndexType, &valuePtr);
    if (values)
    {
      cf = CFArrayCreate(v3, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
      if (cf)
      {
        v8 = CFSTR("IE_KEY_WPA_AUTHSELS");
        v6 = CFDictionaryCreate(v3, (const void **)&v8, &cf, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (v6)
        {
          v7 = v6;
          WiFiNetworkSetProperty(a1, CFSTR("WPA_IE"), v6);
          CFRelease(v7);
        }
        if (cf)
        {
          CFRelease(cf);
          cf = 0;
        }
      }
      if (values)
        CFRelease(values);
    }
  }
  else
  {
    WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"), 0);
    WiFiNetworkSetProperty(a1, CFSTR("WPA_IE"), 0);
    WiFiNetworkSetProperty(a1, CFSTR("EnterpriseProfile"), 0);
  }
}

BOOL WiFiNetworkRequiresPassword(uint64_t a1)
{
  _BOOL8 result;

  if (!WiFiNetworkIsEAP(a1))
  {
    if (!WiFiNetworkIsWPAWPA2PSK(a1))
    {
      if (a1)
      {
        if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("WEP")) != (const void *)*MEMORY[0x1E0C9AE50]
          && !WiFiNetworkIsWAPI(a1))
        {
          return __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16)) != 0;
        }
      }
      else
      {
        result = WiFiNetworkIsWAPI(0);
        if (!result)
          return result;
      }
    }
    return 1;
  }
  return !WiFiNetworkRequiresIdentity(a1)
      && !__WiFiNetworkIsEAPWithType(a1, 18)
      && __WiFiNetworkIsEAPWithType(a1, 23) == 0;
}

const __CFArray *WiFiNetworkRequiresIdentity(uint64_t a1)
{
  const __CFArray *Property;
  CFNumberRef v3;
  CFNumberRef v4;
  int valuePtr;
  CFRange v7;

  if (!WiFiNetworkIsEAP(a1))
    return 0;
  Property = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("AcceptEAPTypes"));
  if (Property)
  {
    valuePtr = 13;
    v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    if (v3)
    {
      v4 = v3;
      v7.length = CFArrayGetCount(Property);
      v7.location = 0;
      Property = (const __CFArray *)(CFArrayGetFirstIndexOfValue(Property, v7, v4) != -1);
      CFRelease(v4);
      return Property;
    }
    return 0;
  }
  return Property;
}

BOOL WiFiNetworkRequiresUsername(uint64_t a1)
{
  _BOOL8 result;
  const __CFArray *Property;
  const __CFArray *v4;
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFNumberRef v7;
  CFIndex FirstIndexOfValue;
  CFNumberRef v9;
  CFNumberRef v10;
  CFIndex v11;
  int v12;
  int valuePtr;
  CFRange v14;
  CFRange v15;

  v12 = 18;
  valuePtr = 13;
  result = WiFiNetworkIsEAP(a1);
  if (result)
  {
    Property = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("AcceptEAPTypes"));
    if (Property
      && (v4 = Property,
          v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
          (v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr)) != 0))
    {
      v7 = v6;
      v14.length = CFArrayGetCount(v4);
      v14.location = 0;
      FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v4, v14, v7);
      CFRelease(v7);
      v9 = CFNumberCreate(v5, kCFNumberIntType, &v12);
      if (v9)
      {
        v10 = v9;
        v15.length = CFArrayGetCount(v4);
        v15.location = 0;
        v11 = CFArrayGetFirstIndexOfValue(v4, v15, v10);
        CFRelease(v10);
      }
      else
      {
        v11 = -1;
      }
      if (FirstIndexOfValue != -1)
        return 0;
    }
    else
    {
      v11 = -1;
    }
    return v11 == -1;
  }
  return result;
}

const void *WiFiNetworkRequiresOneTimePassword(const void *result)
{
  if (result)
  {
    result = WiFiNetworkGetProperty((uint64_t)result, CFSTR("OneTimeUserPassword"));
    if (result)
      return (const void *)(CFEqual(result, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0);
  }
  return result;
}

uint64_t WiFiNetworkGetAuthFlags(uint64_t a1)
{
  return __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16));
}

uint64_t __WiFiNetworkGetAuthFlags(const __CFDictionary *a1)
{
  int v2;
  unsigned int v3;

  if (__WiFiNetworkSupportsWPA(a1))
    v2 = 2;
  else
    v2 = 2 * (__WiFiNetworkSupportsWPA2(a1) != 0);
  if (__WiFiNetworkIsEAP(a1))
    v2 |= 8u;
  v3 = v2 | (CFDictionaryGetValue(a1, CFSTR("WEP")) == (const void *)*MEMORY[0x1E0C9AE50]);
  if (__WiFiNetworkIsSAE(a1))
    v3 |= 4u;
  if (__WiFiNetworkIsSAEPK(a1))
    return v3 | 0x10;
  else
    return v3;
}

uint64_t WiFiNetworkCompareAuthFlags(unsigned int a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v8;

  if ((a1 & a2 & 4) == 0 || ((a2 ^ a1) & 8) != 0)
  {
    if (a1 >= a2)
      v8 = 0;
    else
      v8 = -1;
    if (a1 <= a2)
      return v8;
    else
      return 1;
  }
  else
  {
    v2 = a1 & 0xFFFFFFFB;
    v3 = a2 & 0xFFFFFFFB;
    if ((a1 & 0xFFFFFFFB) > (a2 & 0xFFFFFFFB))
      v4 = 1;
    else
      v4 = -1;
    if (v3)
      v5 = v4;
    else
      v5 = -1;
    if (v2)
      v6 = v5;
    else
      v6 = 1;
    if (v2 == v3)
      return 0;
    else
      return v6;
  }
}

uint64_t WiFiNetworkIsSameSecurity(const __CFDictionary **cf, const __CFDictionary **a2)
{
  uint64_t result;
  CFTypeID v5;
  uint64_t v6;
  CFTypeID v7;
  uint64_t v8;
  int AuthFlags;
  int v10;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  int v13;
  unint64_t Value;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  int v18;
  int v19;
  unint64_t v20;
  _BOOL4 v21;
  const void *v22;
  int v23;
  BOOL v24;
  int OperatingBand;
  int v26;
  _BOOL4 v27;
  int v28;
  int v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  int v33;

  result = 0;
  if (cf && a2)
  {
    v5 = CFGetTypeID(cf);
    v6 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      v6 = __kWiFiNetworkTypeID;
    }
    if (v5 != v6)
      return 0;
    v7 = CFGetTypeID(a2);
    v8 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      v8 = __kWiFiNetworkTypeID;
    }
    if (v7 != v8)
      return 0;
    AuthFlags = __WiFiNetworkGetAuthFlags(cf[2]);
    v10 = __WiFiNetworkGetAuthFlags(a2[2]);
    v33 = __WiFiNetworkIsSAE(cf[2])
       && (v11 = cf[2], !__WiFiNetworkSupportsWPA(v11))
       && __WiFiNetworkSupportsWPA2(v11) == 0;
    v30 = v10;
    v13 = __WiFiNetworkIsSAE(a2[2])
       && (v12 = a2[2], !__WiFiNetworkSupportsWPA(v12))
       && __WiFiNetworkSupportsWPA2(v12) == 0;
    v31 = __WiFiNetworkIsOWEOnly(cf[2]);
    v32 = __WiFiNetworkIsOWEOnly(a2[2]);
    Value = (unint64_t)CFDictionaryGetValue(cf[2], CFSTR("ALLOW_WPA2_PSK"));
    v15 = (unint64_t)CFDictionaryGetValue(a2[2], CFSTR("ALLOW_WPA2_PSK"));
    v16 = (unint64_t)CFDictionaryGetValue(cf[2], CFSTR("ALLOW_OWE_TSN"));
    v17 = (unint64_t)CFDictionaryGetValue(a2[2], CFSTR("ALLOW_OWE_TSN"));
    v18 = (Value | v16) == 0;
    v19 = (v15 | v17) == 0;
    if (v18 != v19)
    {
      v20 = v17;
      v29 = AuthFlags;
      if (v33)
      {
        v21 = WiFiNetworkGetOperatingBand((uint64_t)cf) != 3;
        if ((v13 & 1) == 0)
        {
LABEL_20:
          v22 = (const void *)*MEMORY[0x1E0C9AE50];
LABEL_31:
          if ((const void *)v15 == v22 && v21)
            return 0;
          AuthFlags = v29;
          if ((v18 & v33) == 1 && WiFiNetworkGetOperatingBand((uint64_t)cf) == 3)
            AuthFlags = v29 | 2;
          if ((v19 & v13) == 1)
          {
            OperatingBand = WiFiNetworkGetOperatingBand((uint64_t)a2);
            v26 = v30;
            if (OperatingBand == 3)
              v26 = v30 | 2;
            v30 = v26;
          }
          v27 = v31 && WiFiNetworkGetOperatingBand((uint64_t)cf) != 3;
          if (v32)
          {
            v28 = WiFiNetworkGetOperatingBand((uint64_t)a2);
            if ((const void *)v16 == v22 && v28 != 3)
              return 0;
          }
          if ((const void *)v20 == v22 && v27)
            return 0;
LABEL_23:
          if (!AuthFlags || !v30 || (v30 & AuthFlags) != 0)
            return (AuthFlags == 0) ^ (v30 != 0);
          return 0;
        }
      }
      else
      {
        v21 = 0;
        if ((v13 & 1) == 0)
          goto LABEL_20;
      }
      v23 = WiFiNetworkGetOperatingBand((uint64_t)a2);
      v24 = Value == *MEMORY[0x1E0C9AE50];
      v22 = (const void *)*MEMORY[0x1E0C9AE50];
      if (v24 && v23 != 3)
        return 0;
      goto LABEL_31;
    }
    result = 0;
    if (v33 == v13 && v31 == v32)
      goto LABEL_23;
  }
  return result;
}

uint64_t WiFiNetworkGetOperatingBand(uint64_t result)
{
  const void *v1;
  CFTypeID v2;
  uint64_t v3;
  const void *Property;
  const __CFNumber *v5;
  CFTypeID v6;
  uint64_t v7;
  int valuePtr;
  int v9;

  v9 = 0;
  if (result)
  {
    v1 = (const void *)result;
    v2 = CFGetTypeID((CFTypeRef)result);
    v3 = __kWiFiNetworkTypeID;
    if (!__kWiFiNetworkTypeID)
    {
      pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
      v3 = __kWiFiNetworkTypeID;
    }
    if (v2 == v3)
    {
      Property = WiFiNetworkGetProperty((uint64_t)v1, CFSTR("CHANNEL"));
      v5 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v1, CFSTR("CHANNEL_FLAGS"));
      if (v5)
      {
        valuePtr = 0;
        CFNumberGetValue(v5, kCFNumberIntType, &valuePtr);
        if ((valuePtr & 8) != 0)
          return 1;
        if ((valuePtr & 0x10) != 0)
          return 2;
        if ((valuePtr & 0x2000) != 0)
          return 3;
      }
      v1 = Property;
      if (!Property)
        return 0;
    }
    else
    {
      v6 = CFGetTypeID(v1);
      if (v6 != CFNumberGetTypeID())
        return 0;
    }
    CFNumberGetValue((CFNumberRef)v1, kCFNumberIntType, &v9);
    if (v9)
    {
      if (v9 < 15)
        return 1;
      v7 = 0;
      while (v9 != channels5Ghz[v7])
      {
        if (++v7 == 33)
          return 0;
      }
      return 2;
    }
    return 0;
  }
  return result;
}

uint64_t WiFiNetworkCompareNoSecurity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = 0;
  if (a1 && a2)
  {
    result = __WiFiCompareSSIDorBSSID(*(const void **)(a1 + 16), *(const __CFDictionary **)(a2 + 16));
    if ((_DWORD)result)
      return __WiFiCompareDictionaryValues(*(CFTypeRef *)(a1 + 16), *(const __CFDictionary **)(a1 + 16), CFSTR("AP_MODE")) != 0;
  }
  return result;
}

uint64_t __WiFiCompareSSIDorBSSID(const void *a1, const __CFDictionary *a2)
{
  uint64_t v3;
  uint64_t v4;
  const __CFString *Value;

  v3 = __WiFiCompareDictionaryValues(a1, a2, CFSTR("SSID_STR"));
  v4 = v3;
  if (a1)
  {
    if ((_DWORD)v3)
    {
      Value = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("SSID_STR"));
      if (Value)
      {
        if (!CFStringGetLength(Value))
          return 0;
      }
    }
  }
  return v4;
}

uint64_t __WiFiCompareDictionaryValues(CFTypeRef cf, const __CFDictionary *a2, const void *a3)
{
  uint64_t result;
  CFTypeID v7;
  CFTypeID v8;
  const __CFDictionary *v9;
  const __CFDictionary *Value;
  const __CFDictionary *v11;
  const __CFDictionary *v12;

  result = 0;
  if (cf && a2)
  {
    v7 = CFGetTypeID(cf);
    if (v7 == CFGetTypeID(a2))
    {
      v8 = CFGetTypeID(cf);
      if (v8 == CFDictionaryGetTypeID())
      {
        v9 = (const __CFDictionary *)cf;
        if (!a3)
        {
          v12 = a2;
          return CFEqual(v9, v12);
        }
        Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)cf, a3);
        v11 = (const __CFDictionary *)CFDictionaryGetValue(a2, a3);
        if (Value == v11)
          return 1;
        v12 = v11;
        if ((Value != 0) != (v11 == 0))
        {
          v9 = Value;
          return CFEqual(v9, v12);
        }
      }
    }
    return 0;
  }
  return result;
}

uint64_t WiFiNetworkCompareNetworksForHS20Equivalency(uint64_t a1, uint64_t a2)
{
  if (a1 && a2)
    return __WiFiHS20NetworksHaveSameDomain(a1, a2);
  else
    return 0;
}

uint64_t __WiFiHS20NetworksHaveSameDomain(uint64_t a1, uint64_t a2)
{
  if (a1 && a2 && WiFiNetworkIsHotspot20(a1) && WiFiNetworkIsHotspot20(a2))
    return __WiFiCompareDictionaryValues(*(CFTypeRef *)(a1 + 16), *(const __CFDictionary **)(a2 + 16), CFSTR("DomainName"));
  else
    return 0;
}

BOOL WiFiNetworkCompareSSIDOnly(uint64_t a1, uint64_t a2)
{
  _BOOL8 result;

  result = 0;
  if (a1)
  {
    if (a2)
      return __WiFiCompareDictionaryValues(*(CFTypeRef *)(a1 + 16), *(const __CFDictionary **)(a2 + 16), CFSTR("SSID_STR")) != 0;
  }
  return result;
}

uint64_t WiFiNetworkComparePriority(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  _BOOL4 IsLegacyHotspot;
  _BOOL4 v7;
  _BOOL4 IsHotspot20;
  _BOOL4 v9;
  unsigned int AuthFlags;
  unsigned int v11;
  int v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  float v15;
  _BOOL4 v16;
  const void *Property;
  const void *v18;
  const void *v19;
  uint64_t valuePtr;

  if (a1 | a2)
    v3 = -1;
  else
    v3 = 0;
  if (a2)
    result = 1;
  else
    result = v3;
  if (!a1 || !a2)
    return result;
  IsLegacyHotspot = WiFiNetworkIsLegacyHotspot(a1);
  v7 = WiFiNetworkIsLegacyHotspot(a2);
  IsHotspot20 = WiFiNetworkIsHotspot20(a1);
  v9 = WiFiNetworkIsHotspot20(a2);
  if (IsLegacyHotspot || IsHotspot20 || v7 || v9)
  {
    v16 = !IsLegacyHotspot && !IsHotspot20;
    if (!v16 && !v7 && !v9)
      return 1;
    if (v16 && (v7 || v9))
      return -1;
    if (IsLegacyHotspot && v9)
      return 1;
    if (IsHotspot20 && v7)
      return -1;
    if (IsHotspot20 && v9)
    {
      Property = WiFiNetworkGetProperty(a1, CFSTR("HS20HomeOperatorNetwork"));
      v18 = (const void *)*MEMORY[0x1E0C9AE50];
      v19 = WiFiNetworkGetProperty(a2, CFSTR("HS20HomeOperatorNetwork"));
      if (Property == v18 && v19 != v18)
        return -1;
      if (Property != v18 && v19 == v18)
        return 1;
    }
  }
  AuthFlags = __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16));
  v11 = __WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a2 + 16));
  v12 = WiFiNetworkCompareAuthFlags(AuthFlags, v11);
  if (v12 == 1)
    return -1;
  if (v12 == -1)
    return 1;
  valuePtr = 0;
  v13 = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("Strength"));
  if (v13)
    CFNumberGetValue(v13, kCFNumberFloatType, (char *)&valuePtr + 4);
  v14 = (const __CFNumber *)WiFiNetworkGetProperty(a2, CFSTR("Strength"));
  if (v14)
  {
    CFNumberGetValue(v14, kCFNumberFloatType, &valuePtr);
    v15 = *(float *)&valuePtr;
  }
  else
  {
    v15 = 0.0;
  }
  if (*((float *)&valuePtr + 1) <= v15)
    return *((float *)&valuePtr + 1) < v15;
  else
    return -1;
}

BOOL WiFiNetworkIsLegacyHotspot(uint64_t a1)
{
  const void *v3;

  if (WiFiNetworkGetProperty(a1, CFSTR("DomainName")))
    return 0;
  if (WiFiNetworkGetProperty(a1, CFSTR("IsHotspot")) == (const void *)*MEMORY[0x1E0C9AE50])
    return 1;
  if (MEMORY[0x1E0D0D1B8])
  {
    v3 = (const void *)*MEMORY[0x1E0C9AE50];
    if (CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E0D0D290]) == v3)
      return 1;
  }
  if (__WiFiNetworkIsEAPWithType(a1, 18) || __WiFiNetworkIsEAPWithType(a1, 23))
    return 1;
  return WiFiNetworkIsPublicHotspot(a1) != 0;
}

BOOL WiFiNetworkIsHS20HomeOperatorNetwork(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, CFSTR("HS20HomeOperatorNetwork")) == (const void *)*MEMORY[0x1E0C9AE50];
}

__CFString *WiFiNetworkCopyShareablePassword(CFDictionaryRef *a1)
{
  const __CFString *v2;
  const __CFData *SSIDData;
  __CFString *v4;

  if (WiFiNetworkGetShareMode((uint64_t)a1) < 2)
    return 0;
  v2 = WiFiNetworkCopyPassword(a1);
  if (v2 && !WiFiNetworkGetProperty((uint64_t)a1, CFSTR("RSN_IE")))
  {
    SSIDData = (const __CFData *)WiFiNetworkGetSSIDData(a1);
    v4 = WiFiSecurityCopyHashedWPAPassword(v2, SSIDData);
    CFRelease(v2);
    return v4;
  }
  return (__CFString *)v2;
}

uint64_t WiFiNetworkGetShareMode(uint64_t a1)
{
  const __CFNumber *Property;
  _BOOL4 v3;
  _BOOL4 IsEAP;
  int IsWPAWPA2PSK;
  _BOOL4 v6;
  _BOOL4 v7;
  unsigned int valuePtr;

  valuePtr = 3;
  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("ShareMode"));
  if (Property)
    CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
  v3 = a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("PayloadUUID"));
  IsEAP = WiFiNetworkIsEAP(a1);
  IsWPAWPA2PSK = WiFiNetworkIsWPAWPA2PSK(a1);
  if (a1)
  {
    v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("WEP")) == (const void *)*MEMORY[0x1E0C9AE50];
    v7 = __WiFiNetworkIsSAE(*(const __CFDictionary **)(a1 + 16)) == 0;
  }
  else
  {
    v6 = 0;
    v7 = 1;
  }
  if (IsWPAWPA2PSK)
    v7 = 0;
  if (IsEAP)
    v7 = 1;
  if (v3 || v6 || v7)
    return 1;
  else
    return valuePtr;
}

__CFString *WiFiNetworkCopyHashedWPAPassword(const void *a1, const __CFString *a2)
{
  const __CFData *SSIDData;

  SSIDData = (const __CFData *)WiFiNetworkGetSSIDData(a1);
  return WiFiSecurityCopyHashedWPAPassword(a2, SSIDData);
}

uint64_t WiFiNetworkCopyPasswordWithTimeout(CFDictionaryRef *a1, BOOL *a2, double a3)
{
  const __CFString *v6;
  uint64_t result;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *AccountForNetwork;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "WiFiNetworkCopyPasswordWithTimeout";
    v11 = 2112;
    AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Copy password for Network/account %@", (uint8_t *)&v9, 0x16u);
  }
  if (!a1
    || !CFDictionaryContainsKey(a1[2], CFSTR("PayloadUUID"))
    || (v6 = WiFiNetworkGetAccountForNetwork(a1),
        (result = WiFiSecurityCopyNonSyncablePasswordWithTimeout(v6, a2, a3)) == 0))
  {
    v8 = WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPasswordWithTimeout(v8, a2, a3);
  }
  return result;
}

BOOL WiFiNetworkSetPasswordWithTimeout(const void *a1, const __CFString *a2, BOOL *a3, double a4)
{
  const __CFString *AccountForNetwork;

  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecuritySetPasswordWithTimeout(AccountForNetwork, a2, a3, a4);
}

CFStringRef WiFiNetworkCopyLegacyPassword(const void *a1)
{
  const __CFString *AccountForNetwork;

  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityCopyLegacyPassword(AccountForNetwork);
}

CFStringRef WiFiNetworkCopyNonSyncablePassword(const void *a1)
{
  const __CFString *AccountForNetwork;

  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityCopyNonSyncablePassword(AccountForNetwork);
}

uint64_t WiFiNetworkCopyNonSyncablePasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  const __CFString *AccountForNetwork;

  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityCopyNonSyncablePasswordWithTimeout(AccountForNetwork, a2, a3);
}

BOOL WiFiNetworkSetPassword(const void *a1, const __CFString *a2)
{
  const __CFString *AccountForNetwork;
  int v5;
  const char *v6;
  __int16 v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315394;
    v6 = "WiFiNetworkSetPassword";
    v7 = 2112;
    v8 = AccountForNetwork;
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Set password for Network/account %@", (uint8_t *)&v5, 0x16u);
  }
  return WiFiSecuritySetPassword((_BOOL8)AccountForNetwork, a2);
}

BOOL WiFiNetworkSetLegacyPassword(const void *a1, const __CFString *a2)
{
  const __CFString *AccountForNetwork;

  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecuritySetLegacyPassword((_BOOL8)AccountForNetwork, a2);
}

uint64_t WiFiNetworkRemovePassword(const void *a1)
{
  const __CFString *v2;
  int v4;
  const char *v5;
  __int16 v6;
  const __CFString *AccountForNetwork;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315394;
    v5 = "WiFiNetworkRemovePassword";
    v6 = 2112;
    AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: Remove password for Network/account %@", (uint8_t *)&v4, 0x16u);
  }
  v2 = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityRemovePassword(v2);
}

uint64_t WiFiNetworkRemoveLegacyPassword(const void *a1)
{
  const __CFString *AccountForNetwork;

  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityRemoveLegacyPassword(AccountForNetwork);
}

CFStringRef WiFiNetworkIsPasswordAvailable(CFDictionaryRef *a1)
{
  CFStringRef result;

  result = WiFiNetworkCopyPassword(a1);
  if (result)
  {
    CFRelease(result);
    return (CFStringRef)1;
  }
  return result;
}

uint64_t WiFiNetworkIsPasswordAvailableForHS20Account(void *a1)
{
  uint64_t result;
  const void *SSID;
  const void *Property;

  if (!WiFiNetworkRequiresPassword((uint64_t)a1))
    return 1;
  result = (uint64_t)__WiFiNetworkCopyPasswordForAccount((uint64_t)a1);
  if (result)
  {
LABEL_3:
    CFRelease((CFTypeRef)result);
    return 1;
  }
  SSID = WiFiNetworkGetSSID(a1);
  Property = WiFiNetworkGetProperty((uint64_t)a1, CFSTR("HS20AccountName"));
  if (!SSID || Property && CFEqual(SSID, Property))
    return 0;
  result = (uint64_t)WiFiNetworkCopyPassword((CFDictionaryRef *)a1);
  if (result)
    goto LABEL_3;
  return result;
}

uint64_t WiFiNetworkSetPasswordSyncable()
{
  return 1;
}

uint64_t WiFiNetworkIsPasswordSyncing(const void *a1)
{
  const __CFString *AccountForNetwork;

  AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
  return WiFiSecurityIsPasswordSyncing(AccountForNetwork);
}

void WiFiNetworkSetState(uint64_t a1, int a2)
{
  const void **v4;
  __CFDictionary *v5;
  __CFDictionary *v6;
  const __CFString *v7;

  if (a1)
  {
    v4 = (const void **)MEMORY[0x1E0C9AE50];
    v5 = *(__CFDictionary **)(a1 + 16);
    if (!a2)
      v4 = (const void **)MEMORY[0x1E0C9AE40];
    CFDictionarySetValue(v5, CFSTR("enabled"), *v4);
    if (a2)
    {
      WiFiNetworkSetDisabledUntilDate(a1, 0);
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("networkDisabledTimestamp"));
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("networkDisabledReason"));
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("networkDisabledClientName"));
      v6 = *(__CFDictionary **)(a1 + 16);
      v7 = CFSTR("prevJoined");
    }
    else
    {
      v6 = *(__CFDictionary **)(a1 + 16);
      v7 = CFSTR("WiFiNetworkUserAcceptedRecommendationAt");
    }
    CFDictionaryRemoveValue(v6, v7);
  }
}

void WiFiNetworkSetDisabledUntilDate(uint64_t a1, const void *a2)
{
  const void *v2;
  uint64_t v3;

  if (a1)
  {
    v2 = a2;
    v3 = a1;
    if (!a2)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      a1 = v3;
      v2 = 0;
    }
    WiFiNetworkSetProperty(a1, CFSTR("WiFiNetworkDisabledUntilDate"), v2);
  }
}

void WiFiNetworkSetStateWithReason(CFMutableDictionaryRef *a1, int a2, const void *a3)
{
  CFTypeID TypeID;
  _BOOL4 IsEnabled;
  const __CFAllocator *v8;
  CFAbsoluteTime Current;
  CFDateRef v10;
  CFDateRef v11;

  if (a1)
  {
    if (a3)
    {
      TypeID = CFStringGetTypeID();
      if (TypeID == CFGetTypeID(a3))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          WiFiNetworkSetStateWithReason_cold_1(a1, a2, (uint64_t)a3);
        IsEnabled = WiFiNetworkIsEnabled((uint64_t)a1);
        if (!a2 && IsEnabled)
        {
          WiFiNetworkSetProperty((uint64_t)a1, CFSTR("networkDisabledReason"), a3);
          v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
          Current = CFAbsoluteTimeGetCurrent();
          v10 = CFDateCreate(v8, Current);
          if (v10)
          {
            v11 = v10;
            CFDictionarySetValue(a1[2], CFSTR("networkDisabledTimestamp"), v10);
            CFRelease(v11);
          }
        }
      }
    }
  }
  WiFiNetworkSetState((uint64_t)a1, a2);
}

BOOL WiFiNetworkIsEnabled(uint64_t a1)
{
  const void *Value;

  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("enabled"));
  return !Value || CFEqual(Value, (CFTypeRef)*MEMORY[0x1E0C9AE40]) == 0;
}

BOOL WiFiNetworkHasAutoJoinPreference(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("enabled")) != 0;
}

void WiFiNetworkSetAssociationDate(uint64_t a1, int a2, const void *a3)
{
  const void *LastAssociationDate;
  __CFString *v7;

  LastAssociationDate = (const void *)WiFiNetworkGetLastAssociationDate(a1);
  if (LastAssociationDate)
    WiFiNetworkSetProperty(a1, CFSTR("prevJoined"), LastAssociationDate);
  if (a2)
    v7 = CFSTR("lastJoined");
  else
    v7 = CFSTR("lastAutoJoined");
  WiFiNetworkSetProperty(a1, v7, a3);
}

unint64_t WiFiNetworkGetLastAssociationDate(uint64_t a1)
{
  unint64_t Property;
  unint64_t result;
  const __CFDate *v4;

  Property = (unint64_t)WiFiNetworkGetProperty(a1, CFSTR("lastJoined"));
  result = (unint64_t)WiFiNetworkGetProperty(a1, CFSTR("lastAutoJoined"));
  if (Property | result)
  {
    v4 = (const __CFDate *)result;
    if (!result)
      result = Property;
    if (Property && v4)
    {
      if (CFDateCompare((CFDateRef)Property, v4, 0) == kCFCompareGreaterThan)
        return Property;
      else
        return (unint64_t)v4;
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

const void *WiFiNetworkGetAssociationDate(uint64_t a1, int a2)
{
  __CFString *v2;

  if (a2)
    v2 = CFSTR("lastJoined");
  else
    v2 = CFSTR("lastAutoJoined");
  return WiFiNetworkGetProperty(a1, v2);
}

double WiFiNetworkGetTimeIntervalSinceLastAssociation(uint64_t a1)
{
  const __CFDate *LastAssociationDate;
  const __CFDate *Property;
  double result;

  LastAssociationDate = (const __CFDate *)WiFiNetworkGetLastAssociationDate(a1);
  Property = (const __CFDate *)WiFiNetworkGetProperty(a1, CFSTR("prevJoined"));
  if (LastAssociationDate && Property)
    return CFDateGetTimeIntervalSinceDate(LastAssociationDate, Property);
  result = -1.0;
  if (LastAssociationDate)
    return 0.0;
  return result;
}

double WiFiNetworkGetNetworkUsage(uint64_t a1)
{
  const void *Property;

  Property = WiFiNetworkGetProperty(a1, CFSTR("networkUsage"));
  return _CFTypeGetFloatValue(Property);
}

void WiFiNetworkSetNetworkUsage(uint64_t a1, double a2)
{
  WiFiNetworkSetFloatProperty(a1, CFSTR("networkUsage"), a2);
}

const void *WiFiNetworkGetChannelFlags(uint64_t a1, uint64_t a2)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("CHANNEL_FLAGS"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](0, a2));
  return 0;
}

uint64_t WiFiNetworkGetChannelWidthInMHz(uint64_t a1)
{
  const __CFNumber *Property;
  unsigned __int16 valuePtr;

  valuePtr = 0;
  if (a1 && (Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("CHANNEL_WIDTH"))) != 0)
  {
    CFNumberGetValue(Property, kCFNumberSInt16Type, &valuePtr);
    return valuePtr;
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
}

uint64_t WiFiNetworkGetChannelFreqBand(int a1)
{
  uint64_t v2;

  if (a1 < 1)
    return 0;
  if (a1 < 0xF)
    return 1;
  v2 = 0;
  while (channels5Ghz[v2] != a1)
  {
    if (++v2 == 33)
      return 0;
  }
  return 2;
}

void WiFiNetworkPrepareKnownBssList(uint64_t a1)
{
  const __CFAllocator *v2;
  CFAbsoluteTime Current;
  CFDateRef v4;
  CFDateRef v5;
  const void *Property;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const __CFArray *v12;
  const __CFArray *v13;
  const __CFDictionary *v14;
  CFIndex v15;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v17;
  const void *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v20;
  const __CFNumber *v21;
  const __CFArray *v22;
  const __CFArray *v23;
  CFIndex v24;
  const __CFNumber *v25;
  const void *v26;
  const __CFNumber *v27;
  const void *v28;
  const __CFDictionary *v29;
  const __CFDictionary *v30;
  const void *v31;
  const __CFNumber *v32;
  const __CFNumber *v33;
  const void *v34;
  const __CFDate *v35;
  uint64_t v36;
  __CFArray *theArray;
  int v38;
  int valuePtr;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Current = CFAbsoluteTimeGetCurrent();
  v4 = CFDateCreate(v2, Current);
  v5 = v4;
  if (!a1 || !v4)
    goto LABEL_45;
  Property = WiFiNetworkGetProperty(a1, CFSTR("CHANNEL"));
  if (Property)
  {
    v7 = Property;
    v8 = WiFiNetworkGetProperty(a1, CFSTR("CHANNEL_FLAGS"));
    if (v8)
    {
      v9 = v8;
      v10 = WiFiNetworkGetProperty(a1, CFSTR("BSSID"));
      if (v10)
      {
        v11 = v10;
        theArray = CFArrayCreateMutable(v2, 0, MEMORY[0x1E0C9B378]);
        if (theArray)
        {
          v12 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
          v36 = a1;
          if (!v12)
            goto LABEL_20;
          v13 = v12;
          if (CFArrayGetCount(v12) < 1)
          {
            v14 = 0;
          }
          else
          {
            v14 = 0;
            v15 = 0;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v15);
              if (ValueAtIndex)
              {
                v17 = ValueAtIndex;
                Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
                if (Value)
                {
                  if (CFEqual(Value, v11))
                    v14 = v17;
                  else
                    CFArrayAppendValue(theArray, v17);
                }
              }
              ++v15;
            }
            while (v15 < CFArrayGetCount(v13));
          }
          a1 = v36;
          if (v14)
            MutableCopy = CFDictionaryCreateMutableCopy(v2, 0, v14);
          else
LABEL_20:
            MutableCopy = CFDictionaryCreateMutable(v2, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
          v20 = MutableCopy;
          if (MutableCopy)
          {
            CFDictionarySetValue(MutableCopy, CFSTR("BSSID"), v11);
            CFDictionarySetValue(v20, CFSTR("CHANNEL"), v7);
            CFDictionarySetValue(v20, CFSTR("CHANNEL_FLAGS"), v9);
            CFDictionarySetValue(v20, CFSTR("lastRoamed"), v5);
            v21 = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("CHANNEL_FLAGS"));
            if (v21)
            {
              valuePtr = 0;
              CFNumberGetValue(v21, kCFNumberSInt32Type, &valuePtr);
              if ((valuePtr & 0x2000) != 0)
              {
                v22 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("ORIG_RNR_CHANNEL_LIST"));
                if (v22)
                {
                  v23 = v22;
                  if (CFArrayGetCount(v22) >= 1)
                  {
                    v35 = v5;
                    v24 = 0;
                    v25 = 0;
                    v26 = 0;
                    v27 = 0;
                    v28 = 0;
                    while (!v28 || !v26)
                    {
                      v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(v23, v24);
                      if (v29)
                      {
                        v30 = v29;
                        v31 = CFDictionaryGetValue(v29, CFSTR("CHANNEL"));
                        v32 = (const __CFNumber *)CFDictionaryGetValue(v30, CFSTR("CHANNEL_FLAGS"));
                        if (v31)
                        {
                          v33 = v32;
                          if (v32)
                          {
                            v38 = 0;
                            CFNumberGetValue(v32, kCFNumberSInt32Type, &v38);
                            if ((v38 & 8) != 0)
                            {
                              v28 = v31;
                              v27 = v33;
                            }
                            else if ((v38 & 0x10) != 0)
                            {
                              v26 = v31;
                              v25 = v33;
                            }
                          }
                        }
                      }
                      if (CFArrayGetCount(v23) <= ++v24)
                      {
                        if (!v26)
                          goto LABEL_39;
                        break;
                      }
                    }
                    CFDictionarySetValue(v20, CFSTR("colocated5GHzRNRChannel"), v26);
                    CFDictionarySetValue(v20, CFSTR("colocated5GHzRNRChannelFlags"), v25);
LABEL_39:
                    v5 = v35;
                    a1 = v36;
                    if (v28)
                    {
                      CFDictionarySetValue(v20, CFSTR("colocated2GHzRNRChannel"), v28);
                      CFDictionarySetValue(v20, CFSTR("colocated2GHzRNRChannelFlags"), v27);
                    }
                  }
                }
              }
            }
            v34 = WiFiNetworkGetProperty(a1, CFSTR("LEAKY_AP_LEARNED_DATA"));
            if (v34)
            {
              CFDictionarySetValue(v20, CFSTR("LEAKY_AP_LEARNED_DATA"), v34);
              WiFiNetworkSetProperty(a1, CFSTR("LEAKY_AP_LEARNED_DATA"), 0);
              objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
            }
            CFArrayAppendValue(theArray, v20);
            WiFiNetworkSetProperty(a1, CFSTR("networkKnownBSSListKey"), theArray);
            objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
            CFRelease(theArray);
          }
          else
          {
            v20 = theArray;
          }
          CFRelease(v20);
LABEL_45:
          if (!v5)
            return;
        }
      }
    }
  }
  CFRelease(v5);
}

void WiFiNetworkRemoveBssFromKnownList(uint64_t a1, CFArrayRef theArray)
{
  const __CFArray *Property;
  const __CFArray *v5;
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v10;
  const void *Value;
  const void *v12;
  CFRange v13;

  if (a1)
  {
    if (theArray)
    {
      if (CFArrayGetCount(theArray) >= 1)
      {
        Property = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
        if (Property)
        {
          v5 = Property;
          Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
          if (Mutable)
          {
            v7 = Mutable;
            if (CFArrayGetCount(v5) >= 1)
            {
              v8 = 0;
              do
              {
                ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v5, v8);
                if (ValueAtIndex)
                {
                  v10 = ValueAtIndex;
                  Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
                  if (Value)
                  {
                    v12 = Value;
                    v13.length = CFArrayGetCount(theArray);
                    v13.location = 0;
                    if (CFArrayGetFirstIndexOfValue(theArray, v13, v12) == -1)
                      CFArrayAppendValue(v7, v10);
                    else
                      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
                  }
                }
                ++v8;
              }
              while (v8 < CFArrayGetCount(v5));
            }
            objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
            WiFiNetworkSetProperty(a1, CFSTR("networkKnownBSSListKey"), v7);
            CFRelease(v7);
          }
        }
      }
    }
  }
}

void WiFiNetworkSetKnownBssUsageData(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v4;
  CFAbsoluteTime Current;
  CFDateRef v6;
  const void *Property;
  const void *v8;
  const void *v9;
  const void *v10;
  CFMutableArrayRef Mutable;
  __CFArray *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  const __CFDictionary *v15;
  CFIndex v16;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v18;
  const void *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v21;
  const __CFDate *v22;
  const void *v23;

  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Current = CFAbsoluteTimeGetCurrent();
  v6 = CFDateCreate(v4, Current);
  if (!a1 || !a2)
    goto LABEL_24;
  Property = WiFiNetworkGetProperty(a2, CFSTR("CHANNEL"));
  v8 = WiFiNetworkGetProperty(a2, CFSTR("CHANNEL_FLAGS"));
  v9 = WiFiNetworkGetProperty(a2, CFSTR("BSSID"));
  if (v9)
  {
    v10 = v9;
    Mutable = CFArrayCreateMutable(v4, 0, MEMORY[0x1E0C9B378]);
    if (Mutable)
    {
      v12 = Mutable;
      v23 = v8;
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v13 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
      if (!v13)
        goto LABEL_18;
      v14 = v13;
      v22 = v6;
      if (CFArrayGetCount(v13) < 1)
      {
        v15 = 0;
      }
      else
      {
        v15 = 0;
        v16 = 0;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v14, v16);
          if (ValueAtIndex)
          {
            v18 = ValueAtIndex;
            Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
            if (Value)
            {
              if (CFEqual(Value, v10))
                v15 = v18;
              else
                CFArrayAppendValue(v12, v18);
            }
          }
          ++v16;
        }
        while (v16 < CFArrayGetCount(v14));
      }
      v6 = v22;
      if (v15)
        MutableCopy = CFDictionaryCreateMutableCopy(v4, 0, v15);
      else
LABEL_18:
        MutableCopy = CFDictionaryCreateMutable(v4, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      v21 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, CFSTR("BSSID"), v10);
        CFDictionarySetValue(v21, CFSTR("CHANNEL"), Property);
        CFDictionarySetValue(v21, CFSTR("CHANNEL_FLAGS"), v23);
        CFDictionarySetValue(v21, CFSTR("lastRoamed"), v6);
        CFArrayAppendValue(v12, v21);
        if (CFArrayGetCount(v12) >= 21)
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
          CFArrayRemoveValueAtIndex(v12, 0);
        }
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        WiFiNetworkSetProperty(a2, CFSTR("networkKnownBSSListKey"), v12);
        WiFiNetworkSetProperty(a1, CFSTR("networkKnownBSSListKey"), v12);
        CFRelease(v21);
      }
      CFRelease(v12);
    }
LABEL_24:
    if (!v6)
      return;
    goto LABEL_25;
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (v6)
LABEL_25:
    CFRelease(v6);
}

void WiFiNetworkSetBSSLocation(uint64_t a1, const void *a2, double a3, double a4, double a5)
{
  const void *Property;
  const void *v11;
  const __CFAllocator *v12;
  CFMutableArrayRef Mutable;
  __CFArray *v14;
  const __CFArray *v15;
  const __CFArray *v16;
  const __CFDictionary *v17;
  CFIndex v18;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v20;
  const void *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v23;

  if (a1 && a2)
  {
    Property = WiFiNetworkGetProperty(a1, CFSTR("BSSID"));
    if (Property)
    {
      v11 = Property;
      v12 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
        v14 = Mutable;
        v15 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
        if (v15)
        {
          v16 = v15;
          if (CFArrayGetCount(v15) >= 1)
          {
            v17 = 0;
            v18 = 0;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v16, v18);
              if (ValueAtIndex)
              {
                v20 = ValueAtIndex;
                Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
                if (Value)
                {
                  if (CFEqual(Value, v11))
                    v17 = v20;
                  else
                    CFArrayAppendValue(v14, v20);
                }
              }
              ++v18;
            }
            while (v18 < CFArrayGetCount(v16));
            if (v17)
            {
              MutableCopy = CFDictionaryCreateMutableCopy(v12, 0, v17);
              if (MutableCopy)
              {
                v23 = MutableCopy;
                CFDictionarySetValue(MutableCopy, CFSTR("networkLocnLat"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3));
                CFDictionarySetValue(v23, CFSTR("networkLocnLong"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4));
                CFDictionarySetValue(v23, CFSTR("networkLocnAccuracy"), (const void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5));
                CFDictionarySetValue(v23, CFSTR("networkLocnTimestamp"), a2);
                CFArrayAppendValue(v14, v23);
                WiFiNetworkSetProperty(a1, CFSTR("networkKnownBSSListKey"), v14);
                CFRelease(v23);
              }
            }
          }
        }
        CFRelease(v14);
      }
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
}

void WiFiNetworkSetBSSProperty(const void *a1, const __CFString *a2, uint64_t a3)
{
  const void *SSID;
  const __CFAllocator *v7;
  CFMutableArrayRef Mutable;
  __CFArray *v9;
  const __CFArray *Property;
  const __CFArray *v11;
  CFIndex v12;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v14;
  const __CFString *Value;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v17;

  if (a1 && a3)
  {
    SSID = WiFiNetworkGetSSID(a1);
    if (a2)
    {
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
        v9 = Mutable;
        Property = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("networkKnownBSSListKey"));
        if (Property)
        {
          v11 = Property;
          if (CFArrayGetCount(Property) >= 1)
          {
            v12 = 0;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v11, v12);
              if (ValueAtIndex)
              {
                v14 = ValueAtIndex;
                Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
                if (Value)
                {
                  if (CFStringCompare(Value, a2, 1uLL))
                  {
                    CFArrayAppendValue(v9, v14);
                  }
                  else
                  {
                    MutableCopy = CFDictionaryCreateMutableCopy(v7, 0, v14);
                    if (MutableCopy)
                    {
                      v17 = MutableCopy;
                      (*(void (**)(uint64_t, CFMutableDictionaryRef))(a3 + 16))(a3, MutableCopy);
                      CFArrayAppendValue(v9, v17);
                      CFRelease(v17);
                    }
                  }
                }
              }
              ++v12;
            }
            while (v12 < CFArrayGetCount(v11));
          }
        }
        WiFiNetworkSetProperty((uint64_t)a1, CFSTR("networkKnownBSSListKey"), v9);
        CFRelease(v9);
      }
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](SSID));
    }
  }
}

void WiFiNetworkSetBSSAWDLRealTimeModeTimestamp(uint64_t a1, const void *a2)
{
  const void *Property;
  const void *v5;
  const __CFAllocator *v6;
  CFMutableArrayRef Mutable;
  __CFArray *v8;
  const __CFArray *v9;
  const __CFArray *v10;
  const __CFDictionary *v11;
  CFIndex v12;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v14;
  const void *Value;
  __CFDictionary *MutableCopy;
  __CFDictionary *v17;

  if (a1 && a2)
  {
    Property = WiFiNetworkGetProperty(a1, CFSTR("BSSID"));
    if (Property)
    {
      v5 = Property;
      v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
      if (Mutable)
      {
        v8 = Mutable;
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        v9 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
        if (v9)
        {
          v10 = v9;
          if (CFArrayGetCount(v9) >= 1)
          {
            v11 = 0;
            v12 = 0;
            do
            {
              ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v10, v12);
              if (ValueAtIndex)
              {
                v14 = ValueAtIndex;
                Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
                if (Value)
                {
                  if (CFEqual(Value, v5))
                    v11 = v14;
                  else
                    CFArrayAppendValue(v8, v14);
                }
              }
              ++v12;
            }
            while (v12 < CFArrayGetCount(v10));
            if (v11)
            {
              MutableCopy = CFDictionaryCreateMutableCopy(v6, 0, v11);
              if (MutableCopy)
              {
                v17 = MutableCopy;
                CFDictionarySetValue(MutableCopy, CFSTR("AWDLRealTimeModeTimestamp"), a2);
                CFArrayAppendValue(v8, v17);
                WiFiNetworkSetProperty(a1, CFSTR("networkKnownBSSListKey"), v8);
                CFRelease(v17);
              }
            }
          }
        }
        CFRelease(v8);
      }
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
}

void WiFiNetworkSetBssLateRoamInfo(uint64_t a1, uint64_t a2, int a3, int a4)
{
  const void *Property;
  const void *v9;
  const __CFAllocator *v10;
  __CFArray *Mutable;
  const __CFArray *v12;
  const __CFArray *v13;
  const __CFDictionary *v14;
  CFIndex v15;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v17;
  const void *Value;
  int v19;
  CFMutableDictionaryRef MutableCopy;
  CFMutableDictionaryRef v21;
  const __CFDictionary *v22;
  const __CFDictionary *v23;
  const __CFDictionary *v24;
  const __CFDictionary *v25;
  const __CFNumber *v26;
  CFNumberRef v27;
  CFNumberRef v28;
  const __CFNumber *v29;
  CFNumberRef v30;
  int v31;
  int valuePtr;
  int v33;
  int v34;

  v33 = a4;
  v34 = a3;
  if (a1 && a2)
  {
    Property = WiFiNetworkGetProperty(a2, CFSTR("BSSID"));
    if (!Property)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      return;
    }
    v9 = Property;
    v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    if (Mutable)
    {
      v12 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
      if (!v12)
        goto LABEL_40;
      v13 = v12;
      v31 = a3;
      if (CFArrayGetCount(v12) < 1)
      {
        v14 = 0;
      }
      else
      {
        v14 = 0;
        v15 = 0;
        do
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v13, v15);
          if (ValueAtIndex)
          {
            v17 = ValueAtIndex;
            Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
            if (Value)
            {
              if (CFEqual(Value, v9))
                v14 = v17;
              else
                CFArrayAppendValue(Mutable, v17);
            }
          }
          ++v15;
        }
        while (v15 < CFArrayGetCount(v13));
      }
      v19 = a4;
      if (!v14)
        goto LABEL_40;
      MutableCopy = CFDictionaryCreateMutableCopy(v10, 0, v14);
      if (!MutableCopy)
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        goto LABEL_40;
      }
      v21 = MutableCopy;
      v22 = (const __CFDictionary *)CFDictionaryGetValue(v14, CFSTR("lateRoamInfo"));
      if (v22)
      {
        v23 = v22;
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        v24 = CFDictionaryCreateMutableCopy(v10, 0, v23);
      }
      else
      {
        v24 = CFDictionaryCreateMutable(v10, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      }
      v25 = v24;
      if (!v24)
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        goto LABEL_39;
      }
      v26 = (const __CFNumber *)CFDictionaryGetValue(v24, CFSTR("lateRoamMinDelta"));
      if (v26 && (valuePtr = 0, CFNumberGetValue(v26, kCFNumberIntType, &valuePtr)) && valuePtr <= v31)
      {
        v27 = 0;
      }
      else
      {
        v28 = CFNumberCreate(v10, kCFNumberIntType, &v34);
        if (!v28)
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_38:
          CFRelease(v25);
LABEL_39:
          CFRelease(v21);
LABEL_40:
          CFRelease(Mutable);
          return;
        }
        v27 = v28;
        CFDictionarySetValue(v25, CFSTR("lateRoamMinDelta"), v28);
      }
      v29 = (const __CFNumber *)CFDictionaryGetValue(v25, CFSTR("lateRoamMaxDelta"));
      if (v29 && (valuePtr = 0, CFNumberGetValue(v29, kCFNumberIntType, &valuePtr)) && valuePtr >= v19)
      {
        v30 = 0;
      }
      else
      {
        v30 = CFNumberCreate(v10, kCFNumberIntType, &v33);
        if (!v30)
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
          if (!v27)
          {
LABEL_36:
            if (v30)
              CFRelease(v30);
            goto LABEL_38;
          }
LABEL_35:
          CFRelease(v27);
          goto LABEL_36;
        }
        CFDictionarySetValue(v25, CFSTR("lateRoamMaxDelta"), v30);
      }
      CFDictionarySetValue(v21, CFSTR("lateRoamInfo"), v25);
      CFArrayAppendValue(Mutable, v21);
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      WiFiNetworkSetProperty(a2, CFSTR("networkKnownBSSListKey"), Mutable);
      WiFiNetworkSetProperty(a1, CFSTR("networkKnownBSSListKey"), Mutable);
      if (!v27)
        goto LABEL_36;
      goto LABEL_35;
    }
  }
}

void WiFiNetworkSetBssDisconnectReason(uint64_t a1, const __CFString *a2, int a3)
{
  double Current;
  int v7;
  CFAbsoluteTime v8;
  const void *Property;
  const __CFAllocator *v10;
  CFDateRef v11;
  double v12;
  int v13;
  char v14;
  char v15;
  const __CFArray *v16;
  CFMutableArrayRef Mutable;
  __CFArray *v18;
  CFIndex v19;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v21;
  const __CFString *Value;
  const __CFString *v23;
  const __CFNumber *v24;
  int v25;
  const __CFNumber *v26;
  int v27;
  int v28;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v30;
  CFNumberRef v31;
  CFNumberRef v32;
  CFNumberRef v33;
  CFNumberRef v34;
  CFDateRef cf;
  uint64_t v36;
  int v37;
  char v38;
  int valuePtr;
  uint64_t v40;

  Current = CFAbsoluteTimeGetCurrent();
  v40 = 0;
  valuePtr = 0;
  if (!a1 || !a2)
    return;
  v7 = a3 - 3;
  if ((a3 - 3) >= 3)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](Current));
    return;
  }
  v8 = Current;
  LODWORD(v36) = dword_1B9BCEED4[v7];
  HIDWORD(v36) = dword_1B9BCEEC8[v7];
  Property = WiFiNetworkGetProperty(a1, CFSTR("knownBSSUpdatedDate"));
  v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v11 = CFDateCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v8);
  if (!Property)
  {
    v13 = 1;
    goto LABEL_10;
  }
  v12 = v8 - MEMORY[0x1BCCCA950](Property);
  if (v12 > 2592000.0)
  {
    v13 = 0;
    LOBYTE(Property) = 1;
LABEL_10:
    WiFiNetworkSetProperty(a1, CFSTR("knownBSSUpdatedDate"), v11);
    v14 = v13;
    v15 = (char)Property;
    goto LABEL_11;
  }
  LOBYTE(Property) = 0;
  v14 = 0;
  v13 = 1;
  v15 = 1;
  if (v12 > 1296000.0)
    goto LABEL_10;
LABEL_11:
  v37 = v13;
  cf = v11;
  v16 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
  Mutable = CFArrayCreateMutable(v10, 0, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v18 = Mutable;
    if (v16 && CFArrayGetCount(v16) >= 1)
    {
      v19 = 0;
      v38 = v14 | Property;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v16, v19);
        if (!ValueAtIndex)
          goto LABEL_42;
        v21 = ValueAtIndex;
        Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
        if (!Value)
          goto LABEL_42;
        v23 = Value;
        if (CFStringCompare(Value, a2, 0))
        {
          v40 = 0;
          if ((v38 & 1) == 0)
          {
            CFArrayAppendValue(v18, v21);
            goto LABEL_42;
          }
        }
        else
        {
          v40 = v36;
        }
        v24 = (const __CFNumber *)CFDictionaryGetValue(v21, CFSTR("beaconLossCount"));
        if (v24)
        {
          CFNumberGetValue(v24, kCFNumberIntType, &valuePtr);
          if ((v15 & 1) != 0)
          {
            if (!v37)
              goto LABEL_27;
            v25 = valuePtr & 0xFF00 | (BYTE4(v40) + valuePtr);
          }
          else
          {
            v25 = BYTE4(v40) | (valuePtr << 8);
          }
          HIDWORD(v40) = v25;
        }
LABEL_27:
        v26 = (const __CFNumber *)CFDictionaryGetValue(v21, CFSTR("trigDisconnectCount"));
        if (!v26)
          goto LABEL_33;
        CFNumberGetValue(v26, kCFNumberIntType, &valuePtr);
        if ((v15 & 1) != 0)
        {
          if (!v37)
            goto LABEL_33;
          v27 = valuePtr & 0xFF00 | (v40 + valuePtr);
        }
        else
        {
          v27 = v40 | (valuePtr << 8);
        }
        LODWORD(v40) = v27;
LABEL_33:
        v28 = CFEqual(v23, a2);
        if (a3 == 5 && v28)
          v40 = 0;
        MutableCopy = CFDictionaryCreateMutableCopy(v10, 0, v21);
        if (!MutableCopy)
          goto LABEL_44;
        v30 = MutableCopy;
        v31 = CFNumberCreate(v10, kCFNumberIntType, (char *)&v40 + 4);
        if (v31)
        {
          v32 = v31;
          CFDictionarySetValue(v30, CFSTR("beaconLossCount"), v31);
          CFRelease(v32);
        }
        v33 = CFNumberCreate(v10, kCFNumberIntType, &v40);
        if (v33)
        {
          v34 = v33;
          CFDictionarySetValue(v30, CFSTR("trigDisconnectCount"), v33);
          CFRelease(v34);
        }
        CFArrayInsertValueAtIndex(v18, v19, v30);
        CFRelease(v30);
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
LABEL_42:
        ++v19;
      }
      while (v19 < CFArrayGetCount(v16));
    }
    WiFiNetworkSetProperty(a1, CFSTR("networkKnownBSSListKey"), v18);
LABEL_44:
    CFRelease(v18);
  }
  if (cf)
    CFRelease(cf);
}

__CFDictionary *WiFiNetworkCopyNetworkChannelList(uint64_t a1)
{
  const __CFArray *Property;
  const __CFArray *v2;
  const __CFAllocator *v3;
  __CFDictionary *Mutable;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v7;
  const void *Value;
  const void *v9;
  __CFString *v10;
  __CFString *v11;

  Property = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
  if (!Property)
    return 0;
  v2 = Property;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable && CFArrayGetCount(v2) >= 1)
  {
    v5 = 0;
    do
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v5);
      if (ValueAtIndex)
      {
        v7 = ValueAtIndex;
        Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("CHANNEL"));
        if (Value)
        {
          v9 = Value;
          v10 = CFStringCreateMutable(v3, 0);
          if (v10)
          {
            v11 = v10;
            CFStringAppendFormat(v10, 0, CFSTR("%@"), v9);
            CFDictionarySetValue(Mutable, v11, v7);
            CFRelease(v11);
          }
        }
      }
      ++v5;
    }
    while (v5 < CFArrayGetCount(v2));
  }
  return Mutable;
}

uint64_t WiFiNetworkIsEdgeBss(uint64_t a1, const void *a2)
{
  uint64_t v2;
  const __CFArray *Property;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v7;
  const void *Value;
  const __CFNumber *v10;
  const __CFNumber *v11;
  _BOOL4 v12;
  uint64_t valuePtr;

  v2 = 0;
  valuePtr = 0;
  if (a1 && a2)
  {
    Property = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
    v2 = (uint64_t)Property;
    if (Property)
    {
      if (CFArrayGetCount(Property) < 1)
      {
LABEL_10:
        v2 = 0;
      }
      else
      {
        v5 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v2, v5);
          if (ValueAtIndex)
          {
            v7 = ValueAtIndex;
            Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
            if (Value)
            {
              if (CFEqual(Value, a2))
                break;
            }
          }
          if (++v5 >= CFArrayGetCount((CFArrayRef)v2))
            goto LABEL_10;
        }
        v10 = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("beaconLossCount"));
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberIntType, (char *)&valuePtr + 4);
          HIDWORD(valuePtr) = BYTE5(valuePtr) + BYTE4(valuePtr);
        }
        v11 = (const __CFNumber *)CFDictionaryGetValue(v7, CFSTR("trigDisconnectCount"));
        if (v11)
        {
          CFNumberGetValue(v11, kCFNumberIntType, &valuePtr);
          LODWORD(valuePtr) = BYTE1(valuePtr) + valuePtr;
          v12 = valuePtr > 2;
        }
        else
        {
          v12 = 0;
        }
        v2 = SHIDWORD(valuePtr) > 5 || v12;
      }
    }
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  return v2;
}

uint64_t WiFiNetworkSortNetworksByUsageTime(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  const void *Property;
  double FloatValue;
  const void *v8;
  double v9;

  if (a1 | a2)
    v3 = -1;
  else
    v3 = 0;
  if (a2)
    result = 1;
  else
    result = v3;
  if (a1 && a2)
  {
    Property = WiFiNetworkGetProperty(a1, CFSTR("networkUsage"));
    FloatValue = _CFTypeGetFloatValue(Property);
    v8 = WiFiNetworkGetProperty(a2, CFSTR("networkUsage"));
    v9 = _CFTypeGetFloatValue(v8);
    if (FloatValue >= v9)
    {
      if (FloatValue <= v9)
        return WiFiNetworkSortNetworksByLastUsedDate(a1, a2);
      else
        return -1;
    }
    else
    {
      return 1;
    }
  }
  return result;
}

uint64_t WiFiNetworkSortNetworksByLastUsedDate(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;
  const __CFDate *Property;
  const __CFDate *v7;
  const __CFDate *v8;
  CFComparisonResult v9;
  const __CFDate *v10;
  const __CFDate *v11;
  const __CFDate *v12;
  const __CFDate *v13;
  CFComparisonResult v14;
  _BOOL4 v15;
  _BOOL4 v16;
  CFComparisonResult v17;

  if (a1 | a2)
    v3 = -1;
  else
    v3 = 0;
  if (a2)
    result = 1;
  else
    result = v3;
  if (a1 && a2)
  {
    Property = (const __CFDate *)WiFiNetworkGetProperty(a1, CFSTR("lastAutoJoined"));
    v7 = (const __CFDate *)WiFiNetworkGetProperty(a1, CFSTR("lastJoined"));
    v8 = v7;
    if (Property && v7)
    {
      v9 = CFDateCompare(Property, v7, 0);
      if (v9 == kCFCompareGreaterThan)
        v10 = Property;
      else
        v10 = 0;
      if (v9 == kCFCompareEqualTo)
        v10 = v8;
      if (v9 == kCFCompareLessThan)
        Property = v8;
      else
        Property = v10;
    }
    else if (!Property)
    {
      Property = v7;
    }
    v11 = (const __CFDate *)WiFiNetworkGetProperty(a2, CFSTR("lastAutoJoined"));
    v12 = (const __CFDate *)WiFiNetworkGetProperty(a2, CFSTR("lastJoined"));
    v13 = v12;
    if (v11 && v12)
    {
      v14 = CFDateCompare(v11, v12, 0);
      if (v14 != kCFCompareLessThan)
      {
        if (v14)
        {
          v13 = v11;
          if (v14 != kCFCompareGreaterThan)
          {
            v15 = 0;
            v16 = Property != 0;
LABEL_34:
            if (v16)
              return -1;
            else
              return v15;
          }
        }
      }
    }
    else if (v11)
    {
      v13 = v11;
    }
    v16 = Property != 0;
    v15 = v13 != 0;
    if (!Property || !v13)
      goto LABEL_34;
    v17 = CFDateCompare(Property, v13, 0);
    if (v17 == kCFCompareGreaterThan)
      return -1;
    else
      return v17 == kCFCompareLessThan;
  }
  return result;
}

BOOL WiFiNetworkSortNetworksBySignalStrength(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const __CFNumber *Property;
  const __CFNumber *v5;
  float v6;
  uint64_t valuePtr;

  valuePtr = 0;
  if (a1 | a2)
    v2 = -1;
  else
    v2 = 0;
  if (a2)
    v2 = 1;
  if (a1 && a2)
  {
    Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("Strength"));
    if (Property)
      CFNumberGetValue(Property, kCFNumberFloatType, (char *)&valuePtr + 4);
    v5 = (const __CFNumber *)WiFiNetworkGetProperty(a2, CFSTR("Strength"));
    if (v5)
    {
      CFNumberGetValue(v5, kCFNumberFloatType, &valuePtr);
      v6 = *(float *)&valuePtr;
    }
    else
    {
      v6 = 0.0;
    }
    v2 = -1;
    if (*((float *)&valuePtr + 1) <= v6)
      return *((float *)&valuePtr + 1) < v6;
  }
  return v2;
}

const __CFArray *WiFiNetworkIsMultiAPEnvironment(uint64_t a1)
{
  const __CFArray *result;
  const __CFArray *v2;
  CFIndex Count;
  CFIndex v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFIndex v8;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v10;
  const __CFNumber *Value;
  const __CFNumber *v12;
  const __CFNumber *v13;
  int valuePtr;
  unsigned int v17;

  valuePtr = 0;
  result = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
  if (result)
  {
    v2 = result;
    Count = CFArrayGetCount(result);
    if (Count >= 2)
    {
      v4 = Count;
      v5 = 0;
      v6 = 0;
      v7 = 0;
      v8 = 0;
      v17 = -1431655766;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v8);
        if (ValueAtIndex)
        {
          v10 = ValueAtIndex;
          Value = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("CHANNEL"));
          v12 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("CHANNEL_FLAGS"));
          if (Value)
          {
            v13 = v12;
            if (v12)
            {
              CFNumberGetValue(Value, kCFNumberSInt32Type, &valuePtr);
              CFNumberGetValue(v13, kCFNumberSInt32Type, &v17);
              if (valuePtr)
              {
                if (v17)
                {
                  if ((v17 & 8) != 0)
                  {
                    ++v7;
                  }
                  else if ((v17 & 0x10) != 0)
                  {
                    ++v6;
                  }
                  else
                  {
                    v5 += ((unint64_t)v17 >> 13) & 1;
                  }
                }
              }
            }
          }
        }
        ++v8;
      }
      while (v4 != v8);
      return (const __CFArray *)(v6 > 1 || v7 > 1 || v5 > 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t WiFiNetworkCompareHomeState(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  int ForcedHomeFix;
  int v7;
  uint64_t result;
  int v9;
  _BOOL4 v10;
  unsigned int NetworkOfInterestHomeType;
  const __CFDate *Property;
  int v13;
  unsigned int v14;
  int v15;
  const __CFDate *v16;
  const __CFDate *v17;
  const __CFDate *v18;
  CFComparisonResult v19;
  BOOL v20;
  uint64_t v21;
  const __CFDate *v22;
  uint64_t v23;
  const __CFDate *v24;
  CFComparisonResult v25;
  uint64_t v26;
  BOOL v27;
  const __CFDate *v28;

  if (!(a1 | a2))
    return 0;
  if (a1)
  {
    ForcedHomeFix = WiFiNetworkGetForcedHomeFix(a1);
    if (ForcedHomeFix == 1)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
    NetworkOfInterestHomeType = WiFiNetworkGetNetworkOfInterestHomeType(a1);
    if (NetworkOfInterestHomeType == 1)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v9 = 1;
    }
    else
    {
      v9 = 0;
    }
    v10 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("PayloadUUID")) != 0;
    Property = (const __CFDate *)WiFiNetworkGetProperty(a1, CFSTR("addedAt"));
    if (!a2)
    {
      result = -1;
      if (ForcedHomeFix != 1 && NetworkOfInterestHomeType != 1)
        return 0;
      return result;
    }
    v28 = Property;
  }
  else
  {
    if (!a2)
      return 0;
    v9 = 0;
    v7 = 0;
    v10 = 0;
    v28 = 0;
  }
  v13 = WiFiNetworkGetForcedHomeFix(a2);
  if (v13 == 1)
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  v14 = WiFiNetworkGetNetworkOfInterestHomeType(a2);
  if (v14 == 1)
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  v15 = CFDictionaryContainsKey(*(CFDictionaryRef *)(a2 + 16), CFSTR("PayloadUUID"));
  v16 = (const __CFDate *)WiFiNetworkGetProperty(a2, CFSTR("addedAt"));
  if (a1 && a2)
  {
    v17 = v16;
    if (v7 && v13 == 1)
    {
      v18 = (const __CFDate *)WiFiNetworkGetProperty(a1, CFSTR("kWiFiNetworkLastHomeForceFixDateKey"));
      v17 = (const __CFDate *)WiFiNetworkGetProperty(a2, CFSTR("kWiFiNetworkLastHomeForceFixDateKey"));
      v16 = v18;
LABEL_23:
      v19 = CFDateCompare(v16, v17, 0);
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v20 = v19 == kCFCompareLessThan;
      goto LABEL_50;
    }
    if (v7 && v15 || v10 && v13 == 1)
    {
      if (v7)
        v21 = a1;
      else
        v21 = a2;
      v22 = (const __CFDate *)WiFiNetworkGetProperty(v21, CFSTR("kWiFiNetworkLastHomeForceFixDateKey"));
      if (v10)
        v23 = a1;
      else
        v23 = a2;
      v24 = (const __CFDate *)WiFiNetworkGetProperty(v23, CFSTR("addedAt"));
      v25 = CFDateCompare(v22, v24, 0);
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      if (v25 == kCFCompareLessThan)
      {
        v20 = v7 == 0;
        v26 = -1;
LABEL_51:
        if (v20)
          return v26;
        else
          return -v26;
      }
      v20 = v7 == 0;
LABEL_50:
      v26 = 1;
      goto LABEL_51;
    }
    if (v7)
      v27 = v13 == 1;
    else
      v27 = 1;
    if (!v27)
      goto LABEL_65;
    if (!v7 && v13 == 1)
      goto LABEL_62;
    if (v10 && !v15)
    {
LABEL_65:
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v16, v17));
      return -1;
    }
    if (!v10 && v15)
    {
LABEL_62:
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      return 1;
    }
    if (v10 && v15)
    {
      v16 = v28;
      if (v28)
      {
        if (v17)
          goto LABEL_23;
        goto LABEL_65;
      }
      goto LABEL_62;
    }
    if (v9 && v14 != 1)
      goto LABEL_65;
    if (!v9 && v14 == 1)
      goto LABEL_62;
    if (a3)
      *a3 = v9;
    return 0;
  }
  if (v7)
    result = -1;
  else
    result = 1;
  if (!v7 && v13 != 1)
  {
    result = v9 ? -1 : 1;
    if (!v9 && v14 != 1)
      return 0;
  }
  return result;
}

uint64_t WiFiNetworkGetForcedHomeFix(uint64_t a1)
{
  const __CFBoolean *Property;
  const __CFBoolean *v2;
  CFTypeID v3;

  if (!a1)
  {
LABEL_5:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  Property = (const __CFBoolean *)WiFiNetworkGetProperty(a1, CFSTR("NetworkForcedHomeFix"));
  if (Property)
  {
    v2 = Property;
    v3 = CFGetTypeID(Property);
    if (v3 == CFBooleanGetTypeID())
      return CFBooleanGetValue(v2);
    goto LABEL_5;
  }
  return 0;
}

const void *WiFiNetworkGetLastHomeForceFixDate(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("kWiFiNetworkLastHomeForceFixDateKey"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

const __CFDictionary *WiFiNetworkIsPublicHotspot(uint64_t a1)
{
  const __CFDictionary *result;
  char valuePtr;

  valuePtr = 0;
  result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("11U_INTERWORKING_IE"));
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("INTERWORKING_ACCESS_NETWORK_TYPE"));
    if (result)
    {
      CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      return (const __CFDictionary *)((valuePtr & 0xFE) == 2);
    }
  }
  return result;
}

BOOL WiFiNetworkIsHotspot(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("IsHotspot")) == (const void *)*MEMORY[0x1E0C9AE50]
      || WiFiNetworkIsLegacyHotspot(a1)
      || WiFiNetworkIsHotspot20(a1);
}

void WiFiNetworkDumpHS20AccountInfo(uint64_t a1, __CFString *a2)
{
  const __CFString *v4;
  const __CFString *v5;
  const __CFArray *v6;
  const __CFArray *v7;
  CFIndex Count;
  uint64_t v9;
  CFIndex i;
  const __CFString *ValueAtIndex;
  const __CFArray *v12;
  const __CFArray *v13;
  CFIndex v14;
  uint64_t v15;
  CFIndex j;
  const __CFString *v17;
  const __CFArray *v18;
  const __CFArray *v19;
  CFIndex v20;
  uint64_t v21;
  CFIndex k;
  const __CFString *v23;
  const __CFString *v24;
  const __CFString *v25;
  const __CFString *v26;
  void *value;

  value = (void *)*MEMORY[0x1E0C9AE40];
  if (a2)
  {
    v4 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("DomainName"));
    if (v4)
    {
      v5 = v4;
      CFStringAppend(a2, CFSTR("\nDomain name "));
      CFStringAppend(a2, v5);
    }
    v6 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("RoamingConsortiumOIs"));
    if (v6)
    {
      v7 = v6;
      Count = CFArrayGetCount(v6);
      if (Count)
      {
        v9 = Count;
        CFStringAppend(a2, CFSTR("\nRoaming Consortium OI "));
        if (v9 >= 1)
        {
          for (i = 0; i != v9; ++i)
          {
            ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex(v7, i);
            CFStringAppend(a2, ValueAtIndex);
            CFStringAppend(a2, CFSTR(" "));
          }
        }
      }
    }
    v12 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("NaiRealmName"));
    if (v12)
    {
      v13 = v12;
      v14 = CFArrayGetCount(v12);
      if (v14)
      {
        v15 = v14;
        CFStringAppend(a2, CFSTR("\nNAI Realm Name "));
        if (v15 >= 1)
        {
          for (j = 0; j != v15; ++j)
          {
            v17 = (const __CFString *)CFArrayGetValueAtIndex(v13, j);
            CFStringAppend(a2, v17);
            CFStringAppend(a2, CFSTR(" "));
          }
        }
      }
    }
    v18 = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("MCCandMNC"));
    if (v18)
    {
      v19 = v18;
      v20 = CFArrayGetCount(v18);
      if (v20)
      {
        v21 = v20;
        CFStringAppend(a2, CFSTR("\n3GPP MCC&MNC "));
        if (v21 >= 1)
        {
          for (k = 0; k != v21; ++k)
          {
            v23 = (const __CFString *)CFArrayGetValueAtIndex(v19, k);
            CFStringAppend(a2, v23);
            CFStringAppend(a2, CFSTR(" "));
          }
        }
      }
    }
    v24 = (const __CFString *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("DisplayedOperatorName"));
    if (v24)
    {
      v25 = v24;
      CFStringAppend(a2, CFSTR("\nFriendly Operator Name "));
      CFStringAppend(a2, v25);
    }
    if (CFDictionaryGetValueIfPresent(*(CFDictionaryRef *)(a1 + 16), CFSTR("SPRoaming"), (const void **)&value))
    {
      CFStringAppend(a2, CFSTR("\nRoaming set to: "));
      if (value)
        v26 = CFSTR("true");
      else
        v26 = CFSTR("false");
      CFStringAppend(a2, v26);
    }
  }
}

__CFDictionary *WiFiNetworkCopyHS20Account(uint64_t a1)
{
  __CFDictionary *Mutable;
  const void *Value;
  const void *v4;
  const void *v5;
  const void *v6;
  const void *v7;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("DomainName"));
    if (Value)
      CFDictionaryAddValue(Mutable, CFSTR("DomainName"), Value);
    v4 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("DisplayedOperatorName"));
    if (v4)
      CFDictionaryAddValue(Mutable, CFSTR("DisplayedOperatorName"), v4);
    v5 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("RoamingConsortiumOIs"));
    if (v5)
      CFDictionaryAddValue(Mutable, CFSTR("RoamingConsortiumOIs"), v5);
    v6 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("NaiRealmName"));
    if (v6)
      CFDictionaryAddValue(Mutable, CFSTR("NaiRealmName"), v6);
    v7 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("MCCandMNC"));
    if (v7)
      CFDictionaryAddValue(Mutable, CFSTR("MCCandMNC"), v7);
  }
  return Mutable;
}

void WiFiNetworkSetProvisionedHS20Network(uint64_t a1, int a2)
{
  const void **v2;

  v2 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v2 = (const void **)MEMORY[0x1E0C9AE40];
  WiFiNetworkSetProperty(a1, CFSTR("HS20ProvisionedNetwork"), *v2);
}

BOOL WiFiNetworkIsProvisionedHS20Network(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, CFSTR("HS20ProvisionedNetwork")) == (const void *)*MEMORY[0x1E0C9AE50];
}

void WiFiNetworkSetHS20HomeOperatorNetwork(uint64_t a1, int a2)
{
  const void **v2;

  v2 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v2 = (const void **)MEMORY[0x1E0C9AE40];
  WiFiNetworkSetProperty(a1, CFSTR("HS20HomeOperatorNetwork"), *v2);
}

const void *WiFiNetworkGetHS2NetworkBadge(uint64_t a1)
{
  const void *result;

  result = WiFiNetworkGetProperty(a1, CFSTR("HS2NetworkBadge"));
  if (!result)
    return WiFiNetworkGetHS20OperatorFriendlyName(a1);
  return result;
}

const void *WiFiNetworkGetHS20OperatorFriendlyName(uint64_t a1)
{
  const __CFDictionary *Property;
  const __CFArray *Value;
  const __CFArray *v3;
  const __CFDictionary *ValueAtIndex;

  Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("HS20GasResponse"));
  if (Property
    && (Value = (const __CFArray *)CFDictionaryGetValue(Property, CFSTR("ANQP_OPERATOR_NAMES_LIST"))) != 0
    && (v3 = Value, CFArrayGetCount(Value) >= 1)
    && (ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v3, 0)) != 0)
  {
    return CFDictionaryGetValue(ValueAtIndex, CFSTR("ANQP_OPERATOR_NAME"));
  }
  else
  {
    return 0;
  }
}

const void *WiFiNetworkGetGasResponse(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, CFSTR("HS20GasResponse"));
}

const void *WiFiNetworkGetHS20DomainName(uint64_t a1)
{
  const __CFDictionary *Property;
  const __CFArray *Value;
  const __CFArray *v4;

  Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("HS20GasResponse"));
  if (!Property)
    return WiFiNetworkGetProperty(a1, CFSTR("DomainName"));
  Value = (const __CFArray *)CFDictionaryGetValue(Property, CFSTR("ANQP_DOMAIN_NAME_LIST"));
  if (Value && (v4 = Value, CFArrayGetCount(Value) >= 1))
    return CFArrayGetValueAtIndex(v4, 0);
  else
    return 0;
}

void WiFiNetworkSetGasResponse(uint64_t a1, const void *a2)
{
  if (WiFiNetworkGetProperty(a1, CFSTR("HS20GasResponse")))
    WiFiNetworkSetProperty(a1, CFSTR("HS20GasResponse"), 0);
  WiFiNetworkSetProperty(a1, CFSTR("HS20GasResponse"), a2);
}

uint64_t WiFiNetworkIsScannedNetworkMatchingHS20Account(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  const __CFDictionary *Property;
  const __CFDictionary *v5;
  const void *v6;
  const __CFArray *Value;
  const __CFArray *v8;
  CFIndex v9;
  const void *ValueAtIndex;
  char v11;
  const void *v12;
  const __CFArray *v13;
  const __CFArray *v14;
  CFIndex Count;
  char v16;
  CFIndex v17;
  const void *v18;
  const void *v19;
  const __CFArray *v20;
  const __CFArray *v21;
  const __CFArray *v22;
  const __CFArray *v23;
  CFIndex v24;
  CFIndex v25;
  const __CFArray *v26;
  const __CFArray *v27;
  CFIndex v28;
  const __CFDictionary *v29;
  const void *v30;
  int v31;
  CFIndex v32;
  const __CFArray *v33;
  const __CFArray *v34;
  CFIndex v35;
  CFIndex v36;
  const __CFArray *v37;
  const __CFArray *v38;
  CFIndex v39;
  const __CFString *v40;
  int v41;
  CFIndex v42;
  CFRange v44;

  v2 = 0;
  if (a1 && a2)
  {
    Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("HS20GasResponse"));
    if (Property)
    {
      v5 = Property;
      v6 = WiFiNetworkGetProperty(a2, CFSTR("DomainName"));
      Value = (const __CFArray *)CFDictionaryGetValue(v5, CFSTR("ANQP_DOMAIN_NAME_LIST"));
      if (Value && (v8 = Value, CFArrayGetCount(Value) >= 1))
      {
        v9 = 0;
        while (1)
        {
          ValueAtIndex = CFArrayGetValueAtIndex(v8, v9);
          if (ValueAtIndex)
          {
            if (v6 && CFEqual(ValueAtIndex, v6))
              break;
          }
          if (++v9 >= CFArrayGetCount(v8))
            goto LABEL_11;
        }
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        v11 = 0;
        v2 = 1;
      }
      else
      {
LABEL_11:
        v2 = 0;
        v11 = 1;
      }
      v12 = WiFiNetworkGetProperty(a2, CFSTR("SPRoaming"));
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v12));
      v13 = (const __CFArray *)WiFiNetworkGetProperty(a2, CFSTR("MCCandMNC"));
      if (v13)
      {
        v14 = v13;
        Count = CFArrayGetCount(v13);
        v16 = v11 ^ 1;
        if (Count < 1)
          v16 = 1;
        if ((v16 & 1) == 0)
        {
          v17 = 0;
          while (1)
          {
            v18 = CFArrayGetValueAtIndex(v14, v17);
            if (v18)
            {
              v19 = v18;
              objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
              v20 = (const __CFArray *)CFDictionaryGetValue(v5, CFSTR("ANQP_CELL_NETWORK_INFO"));
              if (v20)
              {
                v21 = v20;
                objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
                v44.length = CFArrayGetCount(v21);
                v44.location = 0;
                if (CFArrayContainsValue(v21, v44, v19))
                  break;
              }
            }
            if (++v17 >= CFArrayGetCount(v14))
            {
              v2 = 0;
              goto LABEL_24;
            }
          }
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
          v2 = 1;
        }
      }
LABEL_24:
      v22 = (const __CFArray *)WiFiNetworkGetProperty(a2, CFSTR("NaiRealmName"));
      if (v22)
      {
        v23 = v22;
        v24 = CFArrayGetCount(v22);
        if (!(_DWORD)v2 && v24 >= 1)
        {
          v25 = 0;
          while (1)
          {
            v2 = (uint64_t)CFArrayGetValueAtIndex(v23, v25);
            if (v2)
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
              v26 = (const __CFArray *)CFDictionaryGetValue(v5, CFSTR("ANQP_NAI_REALM_LIST"));
              if (v26)
              {
                v27 = v26;
                objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
                if (CFArrayGetCount(v27) >= 1)
                {
                  v28 = 0;
                  while (1)
                  {
                    v29 = (const __CFDictionary *)CFArrayGetValueAtIndex(v27, v28);
                    if (v29)
                    {
                      v30 = CFDictionaryGetValue(v29, CFSTR("ANQP_NAI_REALM_NAME"));
                      if (v30)
                      {
                        if (CFEqual(v30, (CFTypeRef)v2))
                          break;
                      }
                    }
                    if (++v28 >= CFArrayGetCount(v27))
                      goto LABEL_36;
                  }
                  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
                  v31 = 0;
                  v2 = 1;
                  goto LABEL_38;
                }
              }
LABEL_36:
              v2 = 0;
            }
            v31 = 1;
LABEL_38:
            v32 = CFArrayGetCount(v23);
            if (v31)
            {
              if (++v25 < v32)
                continue;
            }
            break;
          }
        }
      }
      v33 = (const __CFArray *)WiFiNetworkGetProperty(a2, CFSTR("RoamingConsortiumOIs"));
      if (v33)
      {
        v34 = v33;
        v35 = CFArrayGetCount(v33);
        if (!(_DWORD)v2 && v35 >= 1)
        {
          v36 = 0;
          while (1)
          {
            v2 = (uint64_t)CFArrayGetValueAtIndex(v34, v36);
            if (v2)
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
              v37 = (const __CFArray *)CFDictionaryGetValue(v5, CFSTR("ANQP_ROAMING_CONSORTIUM_OI_LIST"));
              if (v37)
              {
                v38 = v37;
                objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
                if (CFArrayGetCount(v38) >= 1)
                {
                  v39 = 0;
                  while (1)
                  {
                    v40 = (const __CFString *)CFArrayGetValueAtIndex(v38, v39);
                    if (v40)
                    {
                      if (CFStringCompare(v40, (CFStringRef)v2, 1uLL) == kCFCompareEqualTo)
                        break;
                    }
                    if (++v39 >= CFArrayGetCount(v38))
                      goto LABEL_53;
                  }
                  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
                  v41 = 0;
                  v2 = 1;
                  goto LABEL_55;
                }
              }
LABEL_53:
              v2 = 0;
            }
            v41 = 1;
LABEL_55:
            v42 = CFArrayGetCount(v34);
            if (v41)
            {
              if (++v36 < v42)
                continue;
            }
            return v2;
          }
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return v2;
}

CFDictionaryRef *WiFiNetworkIsFullyLoaded(CFDictionaryRef *result)
{
  CFDictionaryRef *v1;
  const __CFDictionary *v2;
  __int16 v3;
  __int16 valuePtr;

  valuePtr = 0;
  v3 = 0;
  if (result)
  {
    v1 = result;
    result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], CFSTR("EXT_CAPS"));
    if (result)
    {
      result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("BSS_TRANS_MGMT"));
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        if ((_BYTE)valuePtr)
        {
          result = (CFDictionaryRef *)CFDictionaryGetValue(v1[2], CFSTR("QBSS_LOAD_IE"));
          if (result)
          {
            v2 = (const __CFDictionary *)result;
            result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("QBSS_CHAN_UTIL"));
            if (result)
            {
              CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, (char *)&valuePtr + 1);
              result = (CFDictionaryRef *)CFDictionaryGetValue(v2, CFSTR("QBSS_STA_COUNT"));
              if (result)
              {
                CFNumberGetValue((CFNumberRef)result, kCFNumberSInt16Type, &v3);
                return (CFDictionaryRef *)(v3 == -1);
              }
            }
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

void WiFiNetworkSetPasswordModificationDate(const void *a1, const void *a2)
{
  const void *SSID;

  if (a1 && a2)
  {
    SSID = WiFiNetworkGetSSID(a1);
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    if (SSID)
      WiFiNetworkSetProperty((uint64_t)a1, CFSTR("WiFiNetworkPasswordModificationDate"), a2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

const void *WiFiNetworkGetPasswordModificationDate(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkPasswordModificationDate"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

CFTypeRef WiFiNetworkCopyKeychainModDate(const void *a1)
{
  const __CFString *AccountForNetwork;

  if (a1)
  {
    AccountForNetwork = WiFiNetworkGetAccountForNetwork(a1);
    return WiFiSecurityCopyPasswordModificationDate(AccountForNetwork);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
}

const __CFDictionary *WiFiNetworkIsFullyQualifiedCarPlayNetwork(uint64_t a1)
{
  const __CFDictionary *result;
  const void *Value;

  result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("APPLE_DEVICE_IE"));
  if (result)
  {
    Value = CFDictionaryGetValue(result, CFSTR("APPLE_DEVICE_IE_FEATURE_SUPPORTS_CARPLAY"));
    return (const __CFDictionary *)(Value && Value == (const void *)*MEMORY[0x1E0C9AE50]);
  }
  return result;
}

uint64_t WiFiNetworkIsCarPlay(uint64_t a1)
{
  const __CFDictionary *v2;
  const __CFDictionary *Value;
  CFTypeRef *v4;
  CFTypeRef v5;
  BOOL v6;
  uint64_t v7;
  const void *v8;

  if (a1 && (v2 = *(const __CFDictionary **)(a1 + 16)) != 0)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v2, CFSTR("APPLE_DEVICE_IE"));
    v4 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
    if (Value)
    {
      v5 = CFDictionaryGetValue(Value, CFSTR("APPLE_DEVICE_IE_FEATURE_SUPPORTS_CARPLAY"));
      if (v5)
        v6 = v5 == *v4;
      else
        v6 = 0;
      v7 = v6;
    }
    else
    {
      v7 = 0;
    }
    v8 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("CARPLAY_NETWORK"));
    if (v8)
    {
      if (CFEqual(v8, *v4))
        return 1;
      else
        return v7;
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return v7;
}

BOOL WiFiNetworkIs24GHzNetwork(uint64_t a1)
{
  const __CFNumber *Property;
  const __CFNumber *v3;
  uint64_t Value;
  unsigned int valuePtr;
  int v7;

  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("CHANNEL"));
  v7 = -1431655766;
  v3 = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("CHANNEL_FLAGS"));
  if (v3)
  {
    valuePtr = 0;
    CFNumberGetValue(v3, kCFNumberIntType, &valuePtr);
    return (valuePtr >> 3) & 1;
  }
  else
  {
    Value = CFNumberGetValue(Property, kCFNumberSInt32Type, &v7);
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](Value));
    return (v7 - 1) < 0xE;
  }
}

uint64_t WiFiNetworkGetType(uint64_t a1)
{
  const void *Property;
  unsigned int v3;

  Property = WiFiNetworkGetProperty(a1, CFSTR("CARPLAY_NETWORK"));
  if (Property && CFEqual(Property, (CFTypeRef)*MEMORY[0x1E0C9AE50]))
  {
    if (WiFiNetworkGetProperty(a1, CFSTR("lastJoined"))
      || a1 && CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("PayloadUUID")))
    {
      v3 = 2;
    }
    else
    {
      v3 = 1;
    }
  }
  else
  {
    v3 = 0;
  }
  if (WiFiNetworkIsHotspot20(a1))
    return 3;
  else
    return v3;
}

CFIndex WiFiNetworkDumpRecords(CFIndex result)
{
  const __CFArray *v1;
  CFIndex i;

  if (result)
  {
    v1 = (const __CFArray *)result;
    result = CFArrayGetCount((CFArrayRef)result);
    if (result >= 1)
    {
      for (i = 0; i < result; ++i)
      {
        if (CFArrayGetValueAtIndex(v1, i))
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        result = CFArrayGetCount(v1);
      }
    }
  }
  return result;
}

void WiFiNetworkRemoveCarPlaySettings(uint64_t a1)
{
  WiFiNetworkSetProperty(a1, CFSTR("CARPLAY_NETWORK"), 0);
  WiFiNetworkSetProperty(a1, CFSTR("CARPLAY_UUID"), 0);
}

const void *WiFiNetworkCopyLeakyStatus(uint64_t a1, const __CFString *a2)
{
  const __CFString *Property;
  const __CFArray *v5;
  const __CFArray *v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  const __CFString *Value;
  const void *result;

  if (!a1)
    goto LABEL_18;
  if (!a2)
    goto LABEL_18;
  Property = (const __CFString *)WiFiNetworkGetProperty(a1, CFSTR("BSSID"));
  if (!Property)
    goto LABEL_18;
  if (CFStringCompare(a2, Property, 0) == kCFCompareEqualTo)
  {
    result = WiFiNetworkGetProperty(a1, CFSTR("LEAKY_AP_LEARNED_DATA"));
    if (!result)
      return result;
    goto LABEL_14;
  }
  v5 = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("networkKnownBSSListKey"));
  if (!v5 || (v6 = v5, (Count = CFArrayGetCount(v5)) == 0))
  {
LABEL_18:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  v8 = Count;
  if (Count < 1)
    return 0;
  v9 = 0;
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v6, v9);
    if (ValueAtIndex)
    {
      v11 = ValueAtIndex;
      Value = (const __CFString *)CFDictionaryGetValue(ValueAtIndex, CFSTR("BSSID"));
      if (CFStringCompare(a2, Value, 0) == kCFCompareEqualTo)
        break;
    }
    if (v8 == ++v9)
      return 0;
  }
  result = CFDictionaryGetValue(v11, CFSTR("LEAKY_AP_LEARNED_DATA"));
  if (result)
  {
LABEL_14:
    Apple80211CopyLeakyAPStatus();
    return 0;
  }
  return result;
}

BOOL WiFiNetworkIsAPLeaky(uint64_t a1, const __CFString *a2)
{
  const __CFNumber *v2;
  const __CFNumber *v3;
  _BOOL8 v4;
  char valuePtr;

  v2 = (const __CFNumber *)WiFiNetworkCopyLeakyStatus(a1, a2);
  if (v2)
  {
    v3 = v2;
    valuePtr = -86;
    CFNumberGetValue(v2, kCFNumberSInt8Type, &valuePtr);
    v4 = valuePtr == 2;
    CFRelease(v3);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return v4;
}

const __CFDictionary *WiFiNetworkIsChargeablePublicNetwork(uint64_t a1)
{
  const __CFDictionary *result;
  char valuePtr;

  result = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("11U_INTERWORKING_IE"));
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("INTERWORKING_ACCESS_NETWORK_TYPE"));
    if (result)
    {
      valuePtr = 0;
      CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      return (const __CFDictionary *)(valuePtr == 2);
    }
  }
  return result;
}

BOOL WiFiNetworkIsMetered(uint64_t a1)
{
  unsigned int v2;

  if (WiFiNetworkIsHotspot20(a1)
    || MEMORY[0x1E0D0D1B8]
    && CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E0D0D290]) == (const void *)*MEMORY[0x1E0C9AE50])
  {
    v2 = WiFiNetworkIsChargeablePublicNetwork(a1);
  }
  else
  {
    v2 = 0;
  }
  return WiFiNetworkIsApplePersonalHotspot(a1) || WiFiNetworkIsCarPlay(a1) || v2;
}

uint64_t WiFiNetworkIsInSaveDataMode(uint64_t a1)
{
  const __CFNumber *Property;
  _BOOL8 v3;
  int valuePtr;

  valuePtr = 0;
  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("SaveDataMode"));
  if (Property)
  {
    CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr);
    v3 = valuePtr == 1;
    if (valuePtr)
      return v3;
  }
  else
  {
    v3 = 0;
  }
  if (WiFiNetworkIsApplePersonalHotspot(a1)
    || WiFiNetworkFoundNanIe(a1)
    || WiFiNetworkIsCarPlay(a1))
  {
    return 1;
  }
  return v3;
}

const __CFNumber *WiFiNetworkGetSaveDataMode(uint64_t a1)
{
  const __CFNumber *result;
  unsigned int valuePtr;

  valuePtr = 0;
  result = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("SaveDataMode"));
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

double WiFiNetworkGetNetworkQualityResponsiveness(uint64_t a1)
{
  const __CFNumber *Property;
  double valuePtr;

  valuePtr = 0.0;
  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("NetworkQualityResponsiveness"));
  if (Property)
    Property = (const __CFNumber *)CFNumberGetValue(Property, kCFNumberDoubleType, &valuePtr);
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](Property));
  return valuePtr;
}

const void *WiFiNetworkGetNetworkQualityDate(uint64_t a1)
{
  const void *Property;

  Property = WiFiNetworkGetProperty(a1, CFSTR("NetworkQualityDate"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return Property;
}

void WiFiNetworkSetNetworkQuality(uint64_t a1, const void *a2, double a3)
{
  CFNumberRef v5;
  CFNumberRef v6;
  double valuePtr;

  valuePtr = a3;
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberDoubleType, &valuePtr);
  if (v5)
  {
    v6 = v5;
    WiFiNetworkSetProperty(a1, CFSTR("NetworkQualityResponsiveness"), v5);
    WiFiNetworkSetProperty(a1, CFSTR("NetworkQualityDate"), a2);
    CFRelease(v6);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void WiFiNetworkDisableAutoJoinUntilFirstUserJoin(uint64_t a1, int a2)
{
  const void **v4;

  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (a1)
  {
    v4 = (const void **)MEMORY[0x1E0C9AE50];
    if (!a2)
      v4 = (const void **)MEMORY[0x1E0C9AE40];
    WiFiNetworkSetProperty(a1, CFSTR("DisableWiFiAutoJoinUntilFirstUserJoin"), *v4);
  }
}

uint64_t WiFiNetworkIsAutoJoinDisabledUntilFirstUserJoin(uint64_t a1)
{
  const __CFBoolean *Property;
  const __CFBoolean *v2;
  CFTypeID v3;

  if (!a1)
  {
LABEL_5:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  Property = (const __CFBoolean *)WiFiNetworkGetProperty(a1, CFSTR("DisableWiFiAutoJoinUntilFirstUserJoin"));
  if (Property)
  {
    v2 = Property;
    v3 = CFGetTypeID(Property);
    if (v3 == CFBooleanGetTypeID())
      return CFBooleanGetValue(v2);
    goto LABEL_5;
  }
  return 0;
}

const __CFBoolean *WiFiNetworkIsInfrequentlyJoinedPublicNetwork(uint64_t a1)
{
  const __CFBoolean *result;
  const __CFBoolean *v3;
  CFTypeID v4;

  if (!a1)
    goto LABEL_8;
  if (__WiFiNetworkGetAuthFlags(*(const __CFDictionary **)(a1 + 16)))
    return 0;
  result = (const __CFBoolean *)WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkAttributeIsPublic"));
  if (!result)
    return result;
  v3 = result;
  v4 = CFGetTypeID(result);
  if (v4 != CFBooleanGetTypeID())
  {
LABEL_8:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  result = (const __CFBoolean *)CFBooleanGetValue(v3);
  if ((_DWORD)result)
    return (const __CFBoolean *)(WiFiNetworkGetTimeIntervalSinceLastAssociation(a1) > 1209600.0);
  return result;
}

BOOL WiFiNetworkIsBypassCaptiveEnabled(uint64_t a1)
{
  const void *Property;

  Property = WiFiNetworkGetProperty(a1, CFSTR("CaptiveBypass"));
  return Property && Property == (const void *)*MEMORY[0x1E0C9AE50];
}

void WiFiNetworkAddBundleIdentifier(uint64_t a1, const void *a2)
{
  if (a1)
    WiFiNetworkSetProperty(a1, CFSTR("BundleIdentifier"), a2);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

const void *WiFiNetworkGetBundleIdentifier(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("BundleIdentifier"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

void WiFiNetworkAddOriginator(uint64_t a1, unsigned int a2)
{
  if (a1)
    WiFiNetworkSetIntProperty(a1, CFSTR("NetworkOriginator"), a2);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

void WiFiNetworkSetOriginatorName(uint64_t a1, const void *a2)
{
  if (a1)
    WiFiNetworkSetProperty(a1, CFSTR("NetworkOriginatorName"), a2);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

const __CFNumber *WiFiNetworkGetOriginator(uint64_t a1)
{
  const __CFNumber *Property;

  if (a1)
  {
    Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("NetworkOriginator"));
    return _CFTypeGetIntValue(Property);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
}

uint64_t WiFiNetworkGetUserRole(uint64_t a1)
{
  uint64_t v1;
  const __CFNumber *Property;
  unsigned int valuePtr;

  v1 = 1;
  valuePtr = 1;
  Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("UserRole"));
  if (Property)
  {
    CFNumberGetValue(Property, kCFNumberIntType, &valuePtr);
    return valuePtr;
  }
  return v1;
}

uint64_t WiFiNetworkGetFirstIndexMatchingSSIDNetwork(const __CFArray *a1, uint64_t a2)
{
  CFIndex v2;
  CFTypeRef *ValueAtIndex;
  CFTypeRef *v6;
  CFTypeID v7;
  uint64_t v8;

  v2 = -1;
  if (a1 && a2 && CFArrayGetCount(a1) >= 1)
  {
    v2 = 0;
    while (1)
    {
      ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(a1, v2);
      if (ValueAtIndex)
      {
        v6 = ValueAtIndex;
        v7 = CFGetTypeID(ValueAtIndex);
        v8 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          v8 = __kWiFiNetworkTypeID;
        }
        if (v7 == v8
          && __WiFiCompareDictionaryValues(v6[2], *(const __CFDictionary **)(a2 + 16), CFSTR("SSID_STR")))
        {
          break;
        }
      }
      if (++v2 >= CFArrayGetCount(a1))
        return -1;
    }
  }
  return v2;
}

BOOL WiFiNetworkIsCarrierBundleBased(uint64_t a1)
{
  const __CFNumber *Property;

  if (a1)
  {
    Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("NetworkOriginator"));
    return _CFTypeGetIntValue(Property) == 2;
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
}

const void *WiFiNetworkGetDisabledUntilDate(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkDisabledUntilDate"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

const __CFArray *WiFiNetworkCanExposeIMSI(uint64_t a1)
{
  const __CFArray *result;
  const __CFDictionary *Property;
  const void *Value;
  CFTypeID v5;
  const __CFNumber *v6;

  if (!a1)
    goto LABEL_10;
  if (__WiFiNetworkIsEAPWithType(a1, 18)
    || __WiFiNetworkIsEAPWithType(a1, 23)
    || (result = __WiFiNetworkIsEAPWithType(a1, 50), (_DWORD)result))
  {
    Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("EnterpriseProfile"));
    if (Property)
    {
      Value = CFDictionaryGetValue(Property, CFSTR("EAPClientConfiguration"));
      v5 = CFGetTypeID(Value);
      if (v5 == CFDictionaryGetTypeID())
      {
        if (CFDictionaryContainsKey((CFDictionaryRef)Value, CFSTR("EAPSIMAKAEncryptedIdentityEnabled")))
        {
          v6 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("EAPSIMAKAEncryptedIdentityEnabled"));
          return (const __CFArray *)(_CFTypeGetIntValue(v6) == 0);
        }
        else
        {
          objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
          return (const __CFArray *)1;
        }
      }
    }
LABEL_10:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

void WiFiNetworkRemoveInternalProperties(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("enabled")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("enabled"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("lastAutoJoined")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("lastAutoJoined"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("lastJoined")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("lastJoined"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("prevJoined")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("prevJoined"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("lastRoamed")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("lastRoamed"));
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

CFDictionaryRef *WiFiNetworkInterworkingIsOutdoorNetwork(CFDictionaryRef *result)
{
  char valuePtr;

  valuePtr = -1;
  if (result)
  {
    result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], CFSTR("11U_INTERWORKING_IE"));
    if (result)
    {
      result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("INTERWORKING_ACCESS_VENTURE_GRP"));
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        return (CFDictionaryRef *)(valuePtr == 11);
      }
    }
  }
  return result;
}

CFDictionaryRef *WiFiNetworkInterworkingIsVehicularNetwork(CFDictionaryRef *result)
{
  char valuePtr;

  valuePtr = -1;
  if (result)
  {
    result = (CFDictionaryRef *)CFDictionaryGetValue(result[2], CFSTR("11U_INTERWORKING_IE"));
    if (result)
    {
      result = (CFDictionaryRef *)CFDictionaryGetValue((CFDictionaryRef)result, CFSTR("INTERWORKING_ACCESS_VENTURE_GRP"));
      if (result)
      {
        CFNumberGetValue((CFNumberRef)result, kCFNumberSInt8Type, &valuePtr);
        return (CFDictionaryRef *)(valuePtr == 10);
      }
    }
  }
  return result;
}

const __CFDictionary *WiFiNetworkGetAdvertisedNetworkType(uint64_t a1)
{
  const __CFDictionary *result;
  uint64_t Value;
  char v3;
  char valuePtr;

  valuePtr = -1;
  result = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("11U_INTERWORKING_IE"));
  if (result)
  {
    result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("INTERWORKING_ACCESS_NETWORK_TYPE"));
    if (result)
    {
      Value = CFNumberGetValue(result, kCFNumberSInt8Type, &valuePtr);
      v3 = valuePtr + 1;
      if ((valuePtr + 1) < 0x13u && ((0x6007Fu >> v3) & 1) != 0)
      {
        return (const __CFDictionary *)dword_1B9BCEEE0[v3];
      }
      else
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](Value));
        return 0;
      }
    }
  }
  return result;
}

uint64_t WiFiNetworkArchiveToPath(uint64_t a1, void *a2)
{
  uint64_t v4;
  CFDictionaryRef Copy;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v9 = 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  v4 = objc_msgSend(a2, "stringByDeletingLastPathComponent");
  if ((objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "fileExistsAtPath:", v4) & 1) == 0
    && !objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 0, 0, &v9))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFDictionaryRef *)(a1 + 16));
  v6 = objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", Copy, 200, 0, 0);
  if (v6
    && (objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "createFileAtPath:contents:attributes:", a2, v6, 0) & 1) != 0)
  {
    v7 = 1;
    if (!Copy)
      return v7;
    goto LABEL_8;
  }
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  v7 = 0;
  if (Copy)
LABEL_8:
    CFRelease(Copy);
  return v7;
}

_WORD *WiFiNetworkCreateFromPath(uint64_t a1)
{
  uint64_t v1;
  _WORD *result;

  if (!a1
    || (v1 = objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "contentsAtPath:", a1)) == 0
    || (result = WiFiNetworkCreate(0, (CFTypeRef)objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, 0, 0))) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

uint64_t WiFiNetworkSetUsageRank(uint64_t result, __int16 a2)
{
  *(_WORD *)(result + 24) = a2;
  return result;
}

uint64_t WiFiNetworkGetUsageRank(uint64_t a1)
{
  return *(unsigned __int16 *)(a1 + 24);
}

void WiFiNetworkSetNetworkOfInterestWorkType(uint64_t a1, int a2)
{
  CFNumberRef v3;
  int valuePtr;

  valuePtr = a2;
  if (a1)
  {
    if ((a2 - 1) > 1)
    {
      valuePtr = 0;
      v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    }
    WiFiNetworkSetProperty(a1, CFSTR("NetworkOfInterestWorkState"), v3);
    if (v3)
      CFRelease(v3);
  }
}

const __CFNumber *WiFiNetworkGetNetworkOfInterestWorkType(uint64_t a1)
{
  const __CFNumber *result;
  int Value;
  unsigned int valuePtr;

  valuePtr = 0;
  if (a1)
  {
    result = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("NetworkOfInterestWorkState"));
    if (result)
    {
      Value = CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
      if (valuePtr - 3 >= 0xFFFFFFFE || Value == 0)
        return (const __CFNumber *)valuePtr;
      else
        return 0;
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

void WiFiNetworkSetNetworkOfInterestHomeType(uint64_t a1, int a2)
{
  CFNumberRef v3;
  int valuePtr;

  valuePtr = a2;
  if (a1)
  {
    if ((a2 - 1) > 1)
    {
      valuePtr = 0;
      v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    }
    WiFiNetworkSetProperty(a1, CFSTR("NetworkOfInterestHomeState"), v3);
    if (v3)
      CFRelease(v3);
  }
}

void WiFiNetworkSetForcedHomeFix(const void *a1, int a2)
{
  const void **v4;
  const __CFAllocator *v5;
  CFAbsoluteTime Current;
  CFDateRef v7;

  if (a1)
  {
    v4 = (const void **)MEMORY[0x1E0C9AE40];
    if (a2)
      v4 = (const void **)MEMORY[0x1E0C9AE50];
    WiFiNetworkSetProperty((uint64_t)a1, CFSTR("NetworkForcedHomeFix"), *v4);
    if (a2)
    {
      v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      Current = CFAbsoluteTimeGetCurrent();
      v7 = CFDateCreate(v5, Current);
      WiFiNetworkSetLastHomeForceFixDate(a1, v7);
      if (v7)
        CFRelease(v7);
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void WiFiNetworkSetLastHomeForceFixDate(const void *a1, const void *a2)
{
  const void *SSID;

  if (a1 && a2)
  {
    SSID = WiFiNetworkGetSSID(a1);
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    if (SSID)
      WiFiNetworkSetProperty((uint64_t)a1, CFSTR("kWiFiNetworkLastHomeForceFixDateKey"), a2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

uint64_t WiFiNetworkGetLOIType(uint64_t a1)
{
  const __CFNumber *Property;
  unsigned int valuePtr;

  valuePtr = 0;
  if (!a1
    || (Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("NetworkAtLocationOfInterestType"))) == 0
    || !CFNumberGetValue(Property, kCFNumberSInt32Type, &valuePtr))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  return valuePtr;
}

void WiFiNetworkSetLOIType(uint64_t a1, int a2)
{
  CFNumberRef v3;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (v3)
  {
    WiFiNetworkSetProperty(a1, CFSTR("NetworkAtLocationOfInterestType"), v3);
    CFRelease(v3);
  }
}

BOOL WiFiNetworkIsInternalNetwork(const void *a1)
{
  const void *SSID;
  BOOL v2;

  SSID = WiFiNetworkGetSSID(a1);
  if (__internalSSIDs)
    v2 = SSID == 0;
  else
    v2 = 1;
  return !v2 && CFSetContainsValue((CFSetRef)__internalSSIDs, SSID);
}

const __CFNumber *WiFiNetworkGetShareableStatus(const __CFNumber *result)
{
  const __CFNumber *Property;

  if (result)
  {
    if (*((_QWORD *)result + 2))
    {
      Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("ShareableStatus"));
      return _CFTypeGetIntValue(Property);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

void WiFiNetworkSetWalletIdentifier(uint64_t a1, const void *a2)
{
  if (a1)
    WiFiNetworkSetProperty(a1, CFSTR("WalletIdentifier"), a2);
}

const void *WiFiNetworkGetWalletIdentifier(const void *result)
{
  if (result)
    return WiFiNetworkGetProperty((uint64_t)result, CFSTR("WalletIdentifier"));
  return result;
}

void WiFiNetworkUpdateWPARSNAuthType(uint64_t a1, uint64_t a2)
{
  const __CFAllocator *v3;
  CFArrayRef v4;
  CFArrayRef v5;
  const __CFDictionary *Property;
  const __CFDictionary *v7;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v9;
  const __CFArray *Value;
  __CFString *v11;
  const __CFDictionary *v12;
  CFMutableDictionaryRef v13;
  __CFDictionary *v14;
  const __CFArray *v15;
  const void *v16;
  const void *v17;
  CFTypeID TypeID;
  CFMutableDictionaryRef v19;
  const __CFArray *v20;
  CFTypeRef cf;
  uint64_t valuePtr;

  valuePtr = a2;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  cf = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberCFIndexType, &valuePtr);
  if (!cf)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return;
  }
  v4 = CFArrayCreate(v3, &cf, 1, MEMORY[0x1E0C9B378]);
  if (!v4)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    goto LABEL_30;
  }
  v5 = v4;
  if ((unint64_t)(valuePtr - 1) >= 2)
  {
    if (valuePtr != 8 && valuePtr != 12)
      goto LABEL_29;
    Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("RSN_IE"));
    if (Property)
    {
      v7 = Property;
      MutableCopy = CFDictionaryCreateMutableCopy(v3, 0, Property);
      if (MutableCopy)
      {
        v9 = MutableCopy;
        Value = (const __CFArray *)CFDictionaryGetValue(v7, CFSTR("IE_KEY_RSN_AUTHSELS"));
        if (Value && CFArrayGetCount(Value) < 2)
          goto LABEL_27;
        CFDictionaryReplaceValue(v9, CFSTR("IE_KEY_RSN_AUTHSELS"), v5);
        v11 = CFSTR("RSN_IE");
LABEL_26:
        WiFiNetworkSetProperty(a1, v11, v9);
LABEL_27:
        CFRelease(v9);
        goto LABEL_29;
      }
      goto LABEL_29;
    }
LABEL_28:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    goto LABEL_29;
  }
  v12 = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("RSN_IE"));
  if (v12)
  {
    v13 = CFDictionaryCreateMutableCopy(v3, 0, v12);
    if (v13)
    {
      v14 = v13;
      v15 = (const __CFArray *)CFDictionaryGetValue(v12, CFSTR("IE_KEY_RSN_AUTHSELS"));
      if (!v15 || CFArrayGetCount(v15) >= 2)
      {
        CFDictionaryReplaceValue(v14, CFSTR("IE_KEY_RSN_AUTHSELS"), v5);
        WiFiNetworkSetProperty(a1, CFSTR("RSN_IE"), v14);
      }
      CFRelease(v14);
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  v16 = WiFiNetworkGetProperty(a1, CFSTR("WPA_IE"));
  if (!v16)
    goto LABEL_28;
  v17 = v16;
  TypeID = CFDictionaryGetTypeID();
  if (!_CFValidateType(TypeID, v17))
    goto LABEL_28;
  v19 = CFDictionaryCreateMutableCopy(v3, 0, (CFDictionaryRef)v17);
  if (v19)
  {
    v9 = v19;
    v20 = (const __CFArray *)CFDictionaryGetValue(v12, CFSTR("IE_KEY_WPA_AUTHSELS"));
    if (v20 && CFArrayGetCount(v20) < 2)
      goto LABEL_27;
    CFDictionaryReplaceValue(v9, CFSTR("IE_KEY_WPA_AUTHSELS"), v5);
    v11 = CFSTR("WPA_IE");
    goto LABEL_26;
  }
LABEL_29:
  CFRelease(v5);
LABEL_30:
  if (cf)
    CFRelease(cf);
}

uint64_t WiFiNetworkGetHarvestSSIDStatus(uint64_t a1)
{
  const __CFNumber *Property;
  uint64_t result;
  const void *v4;

  if (a1)
  {
    Property = (const __CFNumber *)WiFiNetworkGetProperty(a1, CFSTR("kWiFiNetworkSSIDHarvestStatusKey"));
    result = (uint64_t)_CFTypeGetIntValue(Property);
    if (!(_DWORD)result)
    {
      v4 = WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkAttributeHighPopularity"));
      if (v4 == (const void *)*MEMORY[0x1E0C9AE50])
      {
        if (WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkAttributeIsPublic")) == v4)
          return 3;
        else
          return 0;
      }
      else
      {
        return 0;
      }
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 1;
  }
  return result;
}

void WiFiNetworkRemoveAutoJoinProperties(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("enabled")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("enabled"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("WiFiNetworkDisabledUntilDate")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("WiFiNetworkDisabledUntilDate"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("networkDisabledClientName")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("networkDisabledClientName"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("networkDisabledReason")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("networkDisabledReason"));
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("networkDisabledTimestamp")))
      CFDictionaryRemoveValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("networkDisabledTimestamp"));
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void *WiFiNetworkCreateCoreWiFiNetworkProfile(CFDictionaryRef *a1)
{
  id v2;
  _BOOL4 IsWAPI;
  const void **v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int SaveDataMode;
  uint64_t v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  const void *v26;
  const __CFArray *v27;
  const __CFArray *v28;
  uint64_t i;
  void *v30;
  objc_class *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  objc_class *v42;
  id v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  void *v54;
  uint64_t v55;
  void *v56;
  id v57;
  void *v58;
  uint64_t v59;
  void *v60;
  id v61;
  void *v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t j;
  void *v67;
  void *v68;
  const void *v69;
  uint64_t v70;
  const void *v71;
  uint64_t v72;
  void *v73;
  void *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t k;
  void *v78;
  void *Property;
  void *v81;
  char v82;
  char v83;
  void *context;
  CFTypeRef cf2;
  void *v86;
  const __CFArray *obj;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  void *v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  uint64_t v104;
  uint64_t v105;
  Class (*v106)(uint64_t);
  void *v107;
  uint64_t *v108;
  uint64_t v109;
  uint64_t *v110;
  uint64_t v111;
  void (*v112)(uint64_t, uint64_t);
  void (*v113)(uint64_t);
  uint64_t v114;
  _BYTE v115[128];
  _BYTE v116[128];
  _BYTE v117[128];
  uint64_t v118;

  v118 = *MEMORY[0x1E0C80C00];
  context = (void *)MEMORY[0x1BCCCB058]();
  if (!a1 || !getCWFNetworkProfileClass())
  {
    v86 = 0;
    goto LABEL_141;
  }
  v2 = objc_alloc_init((Class)getCWFNetworkProfileClass());
  objc_msgSend(v2, "setSSID:", WiFiNetworkGetSSIDData(a1), context);
  WiFiNetworkIsHotspot20((_BOOL8)a1);
  objc_msgSend(v2, "setSupportedSecurityTypes:", 0);
  IsWAPI = WiFiNetworkIsWAPI((_BOOL8)a1);
  v4 = (const void **)MEMORY[0x1E0C9AE50];
  v86 = v2;
  if (!IsWAPI)
  {
    if (WiFiNetworkIsOWETransition((uint64_t)a1))
    {
      v8 = v2;
      v9 = 768;
    }
    else
    {
      if (!__WiFiNetworkIsOWEOnly(a1[2]))
      {
        if (CFDictionaryGetValue(a1[2], CFSTR("WEP")) == *v4)
        {
          objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v2, "supportedSecurityTypes") | 1);
          if (WiFiNetworkIsEAP((uint64_t)a1))
          {
            v23 = v2;
            v24 = 5;
          }
          else
          {
            Property = (void *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WEP_AUTH_Flags"));
            if (!Property)
              goto LABEL_14;
            v81 = Property;
            v82 = objc_msgSend(Property, "intValue");
            objc_msgSend(v81, "intValue");
            v83 = objc_msgSend(v81, "intValue");
            if ((v82 & 1) != 0)
            {
              if ((v83 & 4) == 0)
                goto LABEL_14;
              v23 = v86;
              v24 = 3;
            }
            else
            {
              if ((v83 & 4) == 0)
                goto LABEL_14;
              v23 = v86;
              v24 = 4;
            }
          }
          objc_msgSend(v23, "setWEPSubtype:", v24);
        }
        goto LABEL_14;
      }
      v9 = objc_msgSend(v2, "supportedSecurityTypes") | 0x100;
      v8 = v2;
    }
    objc_msgSend(v8, "setSupportedSecurityTypes:", v9);
    goto LABEL_14;
  }
  objc_msgSend(v2, "setSupportedSecurityTypes:", objc_msgSend(v2, "supportedSecurityTypes") | 2);
  v5 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WAPI")), "intValue");
  if ((~v5 & 0xB) == 0)
  {
    v6 = v2;
    v7 = 2;
LABEL_10:
    objc_msgSend(v6, "setWAPISubtype:", v7);
    goto LABEL_14;
  }
  if ((~v5 & 7) == 0)
  {
    v6 = v2;
    v7 = 1;
    goto LABEL_10;
  }
LABEL_14:
  v10 = (void *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("RSN_IE"));
  if (v10)
  {
    v11 = (void *)objc_msgSend(v10, "objectForKey:", CFSTR("IE_KEY_RSN_AUTHSELS"));
    if ((objc_msgSend(v11, "containsObject:", &unk_1E7142338) & 1) != 0
      || objc_msgSend(v11, "containsObject:", &unk_1E7142350))
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x80);
    }
    if ((objc_msgSend(v11, "containsObject:", &unk_1E7142368) & 1) != 0
      || (objc_msgSend(v11, "containsObject:", &unk_1E7142380) & 1) != 0
      || (objc_msgSend(v11, "containsObject:", &unk_1E7142398) & 1) != 0
      || objc_msgSend(v11, "containsObject:", &unk_1E71423B0))
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x20);
    }
    if ((objc_msgSend(v11, "containsObject:", &unk_1E71423C8) & 1) != 0
      || (objc_msgSend(v11, "containsObject:", &unk_1E71423E0) & 1) != 0
      || (objc_msgSend(v11, "containsObject:", &unk_1E71423F8) & 1) != 0
      || objc_msgSend(v11, "containsObject:", &unk_1E7142410))
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x40);
      if (__WiFiNetworkSupportsWPA2(a1[2]))
        objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x10);
    }
    if ((objc_msgSend(v11, "containsObject:", &unk_1E7142428) & 1) != 0
      || (objc_msgSend(v11, "containsObject:", &unk_1E7142440) & 1) != 0
      || objc_msgSend(v11, "containsObject:", &unk_1E7142458))
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 0x10);
    }
  }
  v12 = (void *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WPA_IE"));
  if (v12)
  {
    v13 = (void *)objc_msgSend(v12, "objectForKey:", CFSTR("IE_KEY_WPA_AUTHSELS"));
    if ((objc_msgSend(v13, "containsObject:", &unk_1E7142368) & 1) != 0
      || objc_msgSend(v13, "containsObject:", &unk_1E7142380))
    {
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 8);
    }
    if (objc_msgSend(v13, "containsObject:", &unk_1E7142428))
      objc_msgSend(v86, "setSupportedSecurityTypes:", objc_msgSend(v86, "supportedSecurityTypes") | 4);
  }
  if (!objc_msgSend(v86, "supportedSecurityTypes"))
    objc_msgSend(v86, "setSupportedSecurityTypes:", 512);
  if (MEMORY[0x1E0D0D1B8])
  {
    v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D290]), *MEMORY[0x1E0D0D290]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2A0]), *MEMORY[0x1E0D0D2A0]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2B8]), *MEMORY[0x1E0D0D2B8]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2C0]), *MEMORY[0x1E0D0D2C0]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2A8]), *MEMORY[0x1E0D0D2A8]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2B0]), *MEMORY[0x1E0D0D2B0]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2D8]), *MEMORY[0x1E0D0D2D8]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2C8]), *MEMORY[0x1E0D0D2C8]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D288]), *MEMORY[0x1E0D0D288]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2D0]), *MEMORY[0x1E0D0D2D0]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D2E0]), *MEMORY[0x1E0D0D2E0]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D278]), *MEMORY[0x1E0D0D278]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D280]), *MEMORY[0x1E0D0D280]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D0D298]), *MEMORY[0x1E0D0D298]);
    objc_msgSend(v14, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("DisabledByCaptiveReason")), CFSTR("DisabledByCaptiveReason"));
    if (objc_msgSend(v14, "count"))
      v15 = v14;
    else
      v15 = 0;
    objc_msgSend(v86, "setCaptiveProfile:", v15);
  }
  if (WiFiNetworkGetDirectedState(a1))
    v16 = 1;
  else
    v16 = 2;
  objc_msgSend(v86, "setHiddenState:", v16);
  if (WiFiNetworkGetShareMode((uint64_t)a1) == 2)
    objc_msgSend(v86, "setPasswordSharingDisabled:", 1);
  objc_msgSend(v86, "setPayloadUUID:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("PayloadUUID")));
  objc_msgSend(v86, "setAutoJoinDisabled:", !WiFiNetworkIsEnabled((uint64_t)a1));
  SaveDataMode = WiFiNetworkGetSaveDataMode((uint64_t)a1);
  if (SaveDataMode == 1)
    v18 = 1;
  else
    v18 = 2 * (SaveDataMode == 2);
  objc_msgSend(v86, "setLowDataMode:", v18);
  objc_msgSend(v86, "setBundleID:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("BundleIdentifier")));
  objc_msgSend(v86, "setLastJoinedBySystemAt:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("lastAutoJoined")));
  objc_msgSend(v86, "setLastJoinedByUserAt:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("lastJoined")));
  v19 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiManagerKnownNetworksEventType")), "intValue");
  v20 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkAttributeSource")), "intValue");
  v21 = objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("NetworkOriginator")), "intValue");
  v22 = 10;
  switch(v21)
  {
    case 0:
      if (!objc_msgSend(v86, "bundleID", 10))
        goto LABEL_58;
      v22 = 14;
      break;
    case 1:
    case 6:
      v22 = 15;
      break;
    case 2:
      break;
    default:
LABEL_58:
      v22 = 17;
      if (v21 != 3 && v20 != 1)
      {
        if (v21 == 4)
        {
          v22 = 7;
        }
        else if (v21 == 5)
        {
          v22 = 12;
        }
        else if (objc_msgSend(v86, "payloadUUID", 17))
        {
LABEL_69:
          v22 = 9;
        }
        else
        {
          v22 = 16;
          if (v19 != 14 && v20 != 2)
          {
            v22 = 5;
            switch(v19)
            {
              case 1:
                goto LABEL_70;
              case 2:
              case 4:
              case 7:
              case 8:
              case 9:
              case 10:
                goto LABEL_154;
              case 3:
                v22 = 8;
                break;
              case 5:
                v22 = 13;
                break;
              case 6:
                v22 = 6;
                break;
              case 11:
                v22 = 11;
                break;
              default:
                if (v19 == 17)
                  goto LABEL_69;
LABEL_154:
                v22 = 0;
                break;
            }
          }
        }
      }
      break;
  }
LABEL_70:
  objc_msgSend(v86, "setAddReason:", v22);
  objc_msgSend(v86, "setAddedAt:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("addedAt")));
  objc_msgSend(v86, "setUpdatedAt:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("lastUpdated")));
  objc_msgSend(v86, "setEAPProfile:", objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("EnterpriseProfile")), "objectForKeyedSubscript:", CFSTR("EAPClientConfiguration")));
  objc_msgSend(v86, "setDomainName:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("DomainName")));
  objc_msgSend(v86, "setDisplayedOperatorName:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("DisplayedOperatorName")));
  objc_msgSend(v86, "setServiceProviderRoamingEnabled:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("SPRoaming")) != (const void *)*MEMORY[0x1E0C9AE40]);
  objc_msgSend(v86, "setCellularNetworkInfo:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("MCCandMNC")));
  objc_msgSend(v86, "setNAIRealmNameList:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("NaiRealmName")));
  objc_msgSend(v86, "setRoamingConsortiumList:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("RoamingConsortiumOIs")));
  objc_msgSend(v86, "setUserPreferredNetworkNames:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("userPreferredNetworkNames")));
  objc_msgSend(v86, "setUserPreferredPasspointDomains:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("userPreferredPasspointDomains")));
  objc_msgSend(v86, "setNetworkGroupID:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("networkGroupID")));
  objc_msgSend(v86, "setNetworkGroupPriority:", objc_msgSend((id)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("networkGroupPriority")), "unsignedIntegerValue"));
  objc_msgSend(v86, "setLastDiscoveredAt:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("discoveredAt")));
  v25 = (void *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("TransitionDisabledFlags"));
  if (v25)
    objc_msgSend(v86, "setTransitionDisabledFlags:", objc_msgSend(v25, "unsignedIntegerValue"));
  v26 = WiFiNetworkGetProperty((uint64_t)a1, CFSTR("Standalone"));
  cf2 = *v4;
  objc_msgSend(v86, "setStandalone6G:", v26 == *v4);
  v27 = (const __CFArray *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("networkKnownBSSListKey"));
  if (v27)
  {
    v28 = v27;
    if (CFArrayGetCount(v27))
    {
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      obj = v28;
      v90 = -[__CFArray countByEnumeratingWithState:objects:count:](v28, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
      if (v90)
      {
        v91 = 0;
        v89 = *(_QWORD *)v101;
        v88 = *MEMORY[0x1E0D1B9E8];
        do
        {
          for (i = 0; i != v90; ++i)
          {
            if (*(_QWORD *)v101 != v89)
              objc_enumerationMutation(obj);
            v30 = *(void **)(*((_QWORD *)&v100 + 1) + 8 * i);
            v109 = 0;
            v110 = &v109;
            v111 = 0x3052000000;
            v112 = __Block_byref_object_copy_;
            v113 = __Block_byref_object_dispose_;
            v31 = (objc_class *)getCWFBSSClass_softClass;
            v114 = getCWFBSSClass_softClass;
            if (!getCWFBSSClass_softClass)
            {
              v104 = MEMORY[0x1E0C809B0];
              v105 = 3221225472;
              v106 = __getCWFBSSClass_block_invoke;
              v107 = &unk_1E713B950;
              v108 = &v109;
              __getCWFBSSClass_block_invoke((uint64_t)&v104);
              v31 = (objc_class *)v110[5];
            }
            _Block_object_dispose(&v109, 8);
            v32 = objc_alloc_init(v31);
            objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("BSSID"));
            objc_msgSend(v32, "setBSSID:", CWFCorrectEthernetAddressString());
            v33 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("CHANNEL"));
            v34 = objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("CHANNEL_FLAGS"));
            if (v33)
            {
              v35 = (void *)v34;
              if (v34)
              {
                v36 = objc_alloc_init((Class)getCWFChannelClass());
                objc_msgSend(v36, "setChannel:", objc_msgSend(v33, "integerValue"));
                objc_msgSend(v36, "setFlags:", objc_msgSend(v35, "unsignedIntegerValue"));
                objc_msgSend(v32, "setChannel:", v36);
              }
            }
            if (objc_msgSend(v32, "BSSID") && objc_msgSend(v32, "channel"))
            {
              objc_msgSend(v32, "setLastAssociatedAt:", objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("lastRoamed")));
              v37 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("networkLocnLat"));
              v38 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("networkLocnLong"));
              v39 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("networkLocnAccuracy"));
              v40 = objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("networkLocnTimestamp"));
              if (v37)
              {
                if (v38)
                {
                  if (v39)
                  {
                    v41 = v40;
                    if (v40)
                    {
                      v109 = 0;
                      v110 = &v109;
                      v111 = 0x3052000000;
                      v112 = __Block_byref_object_copy_;
                      v113 = __Block_byref_object_dispose_;
                      v42 = (objc_class *)getCLLocationClass_softClass;
                      v114 = getCLLocationClass_softClass;
                      if (!getCLLocationClass_softClass)
                      {
                        v104 = MEMORY[0x1E0C809B0];
                        v105 = 3221225472;
                        v106 = __getCLLocationClass_block_invoke;
                        v107 = &unk_1E713B950;
                        v108 = &v109;
                        __getCLLocationClass_block_invoke((uint64_t)&v104);
                        v42 = (objc_class *)v110[5];
                      }
                      _Block_object_dispose(&v109, 8);
                      v43 = [v42 alloc];
                      objc_msgSend(v37, "doubleValue");
                      v45 = v44;
                      objc_msgSend(v38, "doubleValue");
                      v47 = v46;
                      v109 = 0;
                      v110 = &v109;
                      v111 = 0x2020000000;
                      v48 = getCLLocationCoordinate2DMakeSymbolLoc_ptr;
                      v112 = (void (*)(uint64_t, uint64_t))getCLLocationCoordinate2DMakeSymbolLoc_ptr;
                      if (!getCLLocationCoordinate2DMakeSymbolLoc_ptr)
                      {
                        v49 = (void *)CoreLocationLibrary();
                        v48 = dlsym(v49, "CLLocationCoordinate2DMake");
                        v110[3] = (uint64_t)v48;
                        getCLLocationCoordinate2DMakeSymbolLoc_ptr = v48;
                      }
                      _Block_object_dispose(&v109, 8);
                      if (!v48)
                        WiFiNetworkCreateCoreWiFiNetworkProfile_cold_1();
                      v50 = ((double (*)(double, double))v48)(v45, v47);
                      v52 = v51;
                      objc_msgSend(v39, "doubleValue");
                      objc_msgSend(v32, "setLocation:", (id)objc_msgSend(v43, "initWithCoordinate:altitude:horizontalAccuracy:verticalAccuracy:timestamp:", v41, v50, v52, 0.0, v53, 0.0));
                    }
                  }
                }
              }
              v54 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("colocated2GHzRNRChannel"));
              v55 = objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("colocated2GHzRNRChannelFlags"));
              if (v54)
              {
                v56 = (void *)v55;
                if (v55)
                {
                  v57 = objc_alloc_init((Class)getCWFChannelClass());
                  objc_msgSend(v57, "setChannel:", objc_msgSend(v54, "integerValue"));
                  objc_msgSend(v57, "setFlags:", objc_msgSend(v56, "unsignedIntegerValue"));
                  objc_msgSend(v32, "setColocated2GHzRNRChannel:", v57);
                }
              }
              v58 = (void *)objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("colocated5GHzRNRChannel"));
              v59 = objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("colocated5GHzRNRChannelFlags"));
              if (v58)
              {
                v60 = (void *)v59;
                if (v59)
                {
                  v61 = objc_alloc_init((Class)getCWFChannelClass());
                  objc_msgSend(v61, "setChannel:", objc_msgSend(v58, "integerValue"));
                  objc_msgSend(v61, "setFlags:", objc_msgSend(v60, "unsignedIntegerValue"));
                  objc_msgSend(v32, "setColocated5GHzRNRChannel:", v61);
                }
              }
              objc_msgSend(v32, "setAWDLRealTimeModeTimestamp:", objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("AWDLRealTimeModeTimestamp")));
              objc_msgSend(v32, "setIPv4NetworkSignature:", objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("IPv4NetworkSignature")));
              objc_msgSend(v32, "setIPv6NetworkSignature:", objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("IPv6NetworkSignature")));
              objc_msgSend(v32, "setDHCPServerID:", objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("DHCPServerID")));
              objc_msgSend(v32, "setDHCPv6ServerID:", objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("DHCPv6ServerID")));
              v62 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
              v98 = 0u;
              v99 = 0u;
              v96 = 0u;
              v97 = 0u;
              v63 = (void *)objc_msgSend(MEMORY[0x1E0D1BA40], "supportedOSSpecificKeys");
              v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
              if (v64)
              {
                v65 = *(_QWORD *)v97;
                do
                {
                  for (j = 0; j != v64; ++j)
                  {
                    if (*(_QWORD *)v97 != v65)
                      objc_enumerationMutation(v63);
                    objc_msgSend(v62, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, *(void **)(*((_QWORD *)&v96 + 1) + 8 * j)), *(_QWORD *)(*((_QWORD *)&v96 + 1) + 8 * j));
                  }
                  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v96, v116, 16);
                }
                while (v64);
              }
              if (objc_msgSend(v62, "count"))
                v67 = v62;
              else
                v67 = 0;
              objc_msgSend(v32, "setOSSpecificAttributes:", v67);
              objc_msgSend(v32, "setCoreWiFiSpecificAttributes:", objc_msgSend(v30, "objectForKeyedSubscript:", v88));
              v68 = v91;
              if (!v91)
                v68 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
              v91 = v68;
              objc_msgSend(v68, "addObject:", v32);
            }
          }
          v90 = -[__CFArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v100, v117, 16);
        }
        while (v90);
      }
      else
      {
        v91 = 0;
      }
      objc_msgSend(v86, "setBSSList:", v91);
    }
  }
  objc_msgSend(v86, "setPrivacyProxyEnabled:", WiFiNetworkGetPrivacyProxyEnabled((uint64_t)a1));
  objc_msgSend(v86, "setPrivacyProxyBlockedReason:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("PrivacyProxyBlockedReason")));
  if (WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkAttributeIsMoving")))
  {
    v69 = WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkAttributeIsMoving"));
    if (CFEqual(v69, cf2))
      v70 = 1;
    else
      v70 = 2;
  }
  else
  {
    v70 = 0;
  }
  objc_msgSend(v86, "setMovingAttribute:", v70);
  if (WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkAttributeIsPublic")))
  {
    v71 = WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkAttributeIsPublic"));
    if (CFEqual(v71, cf2))
      v72 = 1;
    else
      v72 = 2;
  }
  else
  {
    v72 = 0;
  }
  objc_msgSend(v86, "setPublicAttribute:", v72);
  objc_msgSend(v86, "setCarplayUUID:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("CARPLAY_UUID")));
  objc_msgSend(v86, "setCarplayNetwork:", WiFiNetworkIsCarPlay((uint64_t)a1) != 0);
  objc_msgSend(v86, "setPersonalHotspot:", WiFiNetworkIsApplePersonalHotspot((uint64_t)a1) != 0);
  objc_msgSend(v86, "setNANServiceID:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkNANServiceID")));
  objc_msgSend(v86, "setPublicAirPlayNetwork:", WiFiNetworkIsPublicAirPlayNetwork((uint64_t)a1) != 0);
  objc_msgSend(v86, "setDNSHeuristicsFilteredNetwork:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("FilteredNetwork")) == cf2);
  objc_msgSend(v86, "setDNSHeuristicsFailureStateInfo:", WiFiNetworkGetProperty((uint64_t)a1, CFSTR("DNSFailures")));
  v73 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v94 = 0u;
  v95 = 0u;
  v92 = 0u;
  v93 = 0u;
  v74 = (void *)objc_msgSend(MEMORY[0x1E0D1BA58], "supportedOSSpecificKeys");
  v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
  if (v75)
  {
    v76 = *(_QWORD *)v93;
    do
    {
      for (k = 0; k != v75; ++k)
      {
        if (*(_QWORD *)v93 != v76)
          objc_enumerationMutation(v74);
        objc_msgSend(v73, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty((uint64_t)a1, *(void **)(*((_QWORD *)&v92 + 1) + 8 * k)), *(_QWORD *)(*((_QWORD *)&v92 + 1) + 8 * k));
      }
      v75 = objc_msgSend(v74, "countByEnumeratingWithState:objects:count:", &v92, v115, 16);
    }
    while (v75);
  }
  if (objc_msgSend(v73, "count"))
    v78 = v73;
  else
    v78 = 0;
  objc_msgSend(v86, "setOSSpecificAttributes:", v78);
  objc_msgSend(v86, "setCoreWiFiSpecificAttributes:", WiFiNetworkGetProperty((uint64_t)a1, (void *)*MEMORY[0x1E0D1B9E8]));
LABEL_141:
  objc_autoreleasePoolPop(context);
  return v86;
}

void sub_1B9BB76B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

uint64_t getCWFNetworkProfileClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v0 = getCWFNetworkProfileClass_softClass;
  v8 = getCWFNetworkProfileClass_softClass;
  if (!getCWFNetworkProfileClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getCWFNetworkProfileClass_block_invoke;
    v2[3] = &unk_1E713B950;
    v2[4] = &v3;
    __getCWFNetworkProfileClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B9BB7788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getCWFChannelClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v0 = getCWFChannelClass_softClass;
  v8 = getCWFChannelClass_softClass;
  if (!getCWFChannelClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getCWFChannelClass_block_invoke;
    v2[3] = &unk_1E713B950;
    v2[4] = &v3;
    __getCWFChannelClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B9BB7850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL WiFiNetworkGetPrivacyProxyEnabled(uint64_t a1)
{
  if (a1)
  {
    if (CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("PrivacyProxyEnabled")))
      return WiFiNetworkGetProperty(a1, CFSTR("PrivacyProxyEnabled")) == (const void *)*MEMORY[0x1E0C9AE50];
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
  return 1;
}

const void *WiFiNetworkGetPrivacyProxyBlockedReason(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("PrivacyProxyBlockedReason"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

uint64_t WiFiNetworkIsPublicAirPlayNetwork(uint64_t a1)
{
  uint64_t result;

  if (a1)
  {
    result = CFDictionaryContainsKey(*(CFDictionaryRef *)(a1 + 16), CFSTR("PublicAirPlayNetwork"));
    if ((_DWORD)result)
      return WiFiNetworkGetProperty(a1, CFSTR("PublicAirPlayNetwork")) == (const void *)*MEMORY[0x1E0C9AE50];
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

_WORD *WiFiNetworkCreateFromCoreWiFiNetworkProfile(void *a1, void *a2)
{
  void *v4;
  uint64_t CWFNetworkProfileClass;
  _WORD *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  __int16 v10;
  __int16 v11;
  __int16 v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  char v42;
  void *v43;
  const __CFString *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  unint64_t v56;
  uint64_t i;
  void *v58;
  void *v59;
  const char *v60;
  ether_addr *v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  double v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  _BYTE v93[128];
  const __CFString *v94;
  _QWORD v95[3];

  v95[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1BCCCB058]();
  CWFNetworkProfileClass = getCWFNetworkProfileClass();
  v6 = 0;
  if (a1 && CWFNetworkProfileClass)
  {
    getCWFNetworkProfileClass();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v6 = 0;
      goto LABEL_223;
    }
    v7 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (!a2 || objc_msgSend(a2, "containsObject:", &unk_1E7142470))
    {
      objc_msgSend(v7, "addEntriesFromDictionary:", objc_msgSend(a1, "OSSpecificAttributes"));
      if (!objc_msgSend(v7, "objectForKey:", CFSTR("AP_MODE")))
        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7142428, CFSTR("AP_MODE"));
    }
    v8 = objc_msgSend(a1, "coreWiFiSpecificAttributes");
    v88 = *MEMORY[0x1E0D1B9E8];
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8);
    v9 = MEMORY[0x1E0C9AAA0];
    v86 = v4;
    if (a2)
    {
      if (objc_msgSend(a2, "containsObject:", &unk_1E7142488))
      {
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "SSID"), CFSTR("SSID"));
        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkName"), CFSTR("SSID_STR"));
      }
      if ((objc_msgSend(a2, "containsObject:", &unk_1E71424A0) & 1) == 0)
      {
LABEL_61:
        if (!objc_msgSend(a2, "containsObject:", &unk_1E7142518))
        {
LABEL_65:
          if (!objc_msgSend(a2, "containsObject:", &unk_1E7142530))
            goto LABEL_72;
LABEL_66:
          if (objc_msgSend(a1, "hiddenState") == 1)
          {
            v33 = MEMORY[0x1E0C9AAB0];
          }
          else
          {
            if (objc_msgSend(a1, "hiddenState") != 2)
              goto LABEL_71;
            v33 = MEMORY[0x1E0C9AAA0];
          }
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v33, CFSTR("UserDirected"));
LABEL_71:
          if (!a2)
          {
LABEL_73:
            if (objc_msgSend(a1, "isPasswordSharingDisabled"))
              objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7142428, CFSTR("ShareMode"));
            if (!a2)
            {
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "payloadUUID"), CFSTR("PayloadUUID"));
LABEL_81:
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "bundleID"), CFSTR("BundleIdentifier"));
              if (!a2)
              {
                if (objc_msgSend(a1, "isAutoJoinDisabled"))
                  v35 = v9;
                else
                  v35 = MEMORY[0x1E0C9AAB0];
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v35, CFSTR("enabled"));
LABEL_93:
                v36 = objc_msgSend(a1, "lowDataMode");
                v37 = &unk_1E7142368;
                if (v36 == 2)
                  v37 = &unk_1E7142428;
                if (v36 == 1)
                  v38 = &unk_1E7142380;
                else
                  v38 = v37;
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v38, CFSTR("SaveDataMode"));
                if (!a2)
                {
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastJoinedByUserAt"), CFSTR("lastJoined"));
LABEL_104:
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastJoinedBySystemAt"), CFSTR("lastAutoJoined"));
                  if (!a2)
                  {
LABEL_106:
                    v39 = objc_msgSend(a1, "addReason");
                    v40 = 0;
                    v41 = &unk_1E71423C8;
                    v42 = 1;
                    v43 = &unk_1E7142380;
                    switch(v39)
                    {
                      case 2:
                      case 3:
                      case 4:
                      case 5:
                        goto LABEL_107;
                      case 6:
                        v43 = &unk_1E7142458;
                        goto LABEL_107;
                      case 7:
                        v40 = 0;
                        v41 = &unk_1E7142380;
                        v43 = &unk_1E7142440;
                        goto LABEL_119;
                      case 8:
                        v43 = &unk_1E7142398;
                        goto LABEL_107;
                      case 9:
                        v43 = &unk_1E7142620;
                        goto LABEL_107;
                      case 10:
                        v40 = 0;
                        v43 = &unk_1E7142428;
                        goto LABEL_119;
                      case 11:
                        v43 = &unk_1E71424D0;
                        goto LABEL_107;
                      case 12:
                        v40 = 0;
                        v41 = &unk_1E7142380;
                        v43 = &unk_1E71423B0;
                        goto LABEL_119;
                      case 13:
                        v43 = &unk_1E71423B0;
LABEL_107:
                        v44 = CFSTR("WiFiManagerKnownNetworksEventType");
                        v45 = v7;
                        v46 = v43;
                        goto LABEL_121;
                      case 14:
                        v40 = 0;
                        v43 = &unk_1E7142368;
                        goto LABEL_119;
                      case 15:
                        goto LABEL_119;
                      case 16:
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", &unk_1E7142608, CFSTR("WiFiManagerKnownNetworksEventType"));
                        v40 = &unk_1E71424A0;
                        goto LABEL_120;
                      case 17:
                        v42 = 0;
                        v40 = &unk_1E7142488;
                        v41 = &unk_1E7142608;
                        v43 = &unk_1E7142398;
LABEL_119:
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", v41, CFSTR("WiFiManagerKnownNetworksEventType"));
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", v43, CFSTR("NetworkOriginator"));
                        if ((v42 & 1) == 0)
                        {
LABEL_120:
                          v44 = CFSTR("WiFiNetworkAttributeSource");
                          v45 = v7;
                          v46 = v40;
LABEL_121:
                          objc_msgSend(v45, "setObject:forKeyedSubscript:", v46, v44);
                        }
                        break;
                      default:
                        break;
                    }
                    if (!a2)
                    {
                      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "addedAt", v41), CFSTR("addedAt"));
LABEL_128:
                      v47 = objc_msgSend(a1, "EAPProfile");
                      if (v47)
                      {
                        v94 = CFSTR("EAPClientConfiguration");
                        v95[0] = v47;
                        v48 = objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, &v94, 1);
                      }
                      else
                      {
                        v48 = 0;
                      }
                      objc_msgSend(v7, "setObject:forKeyedSubscript:", v48, CFSTR("EnterpriseProfile"));
                      if (!a2)
                      {
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "domainName"), CFSTR("DomainName"));
LABEL_137:
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "displayedOperatorName"), CFSTR("DisplayedOperatorName"));
                        if (!a2)
                        {
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isServiceProviderRoamingEnabled")), CFSTR("SPRoaming"));
LABEL_143:
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "cellularNetworkInfo"), CFSTR("MCCandMNC"));
                          if (!a2)
                          {
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "NAIRealmNameList"), CFSTR("NaiRealmName"));
LABEL_149:
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "roamingConsortiumList"), CFSTR("RoamingConsortiumOIs"));
                            if (!a2)
                            {
                              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "userPreferredNetworkNames"), CFSTR("userPreferredNetworkNames"));
LABEL_155:
                              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "userPreferredPasspointDomains"), CFSTR("userPreferredPasspointDomains"));
                              if (!a2)
                              {
                                objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkGroupID"), CFSTR("networkGroupID"));
LABEL_161:
                                objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkGroupPriority"), CFSTR("networkGroupPriority"));
                                if (!a2)
                                {
                                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastDiscoveredAt"), CFSTR("discoveredAt"));
LABEL_167:
                                  v49 = (void *)objc_msgSend(MEMORY[0x1E0C99E20], "set");
                                  v50 = (void *)objc_msgSend(a1, "BSSList");
                                  if (v50)
                                  {
                                    v51 = v50;
                                    v83 = a2;
                                    v84 = v7;
                                    v85 = a1;
                                    v91 = 0u;
                                    v92 = 0u;
                                    v89 = 0u;
                                    v90 = 0u;
                                    v52 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
                                    if (v52)
                                    {
                                      v53 = v52;
                                      v54 = 0;
                                      v55 = *(_QWORD *)v90;
                                      v56 = 0x1E0CB3000uLL;
                                      v87 = v51;
                                      do
                                      {
                                        for (i = 0; i != v53; ++i)
                                        {
                                          if (*(_QWORD *)v90 != v55)
                                            objc_enumerationMutation(v51);
                                          v58 = *(void **)(*((_QWORD *)&v89 + 1) + 8 * i);
                                          v59 = (void *)objc_msgSend(v58, "BSSID");
                                          if (v59)
                                          {
                                            v60 = (const char *)objc_msgSend(v59, "UTF8String");
                                            if (v60)
                                            {
                                              v61 = ether_aton(v60);
                                              if (v61)
                                              {
                                                v62 = ether_ntoa(v61);
                                                if (v62)
                                                {
                                                  v63 = objc_msgSend(*(id *)(v56 + 2368), "stringWithUTF8String:", v62);
                                                  if (v63)
                                                  {
                                                    v64 = v63;
                                                    if ((objc_msgSend(v49, "containsObject:", v63) & 1) == 0)
                                                    {
                                                      objc_msgSend(v49, "addObject:", v64);
                                                      v65 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                                                      objc_msgSend(v65, "addEntriesFromDictionary:", objc_msgSend(v58, "OSSpecificAttributes"));
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", v64, CFSTR("BSSID"));
                                                      v66 = (void *)objc_msgSend(v58, "channel");
                                                      if (v66)
                                                      {
                                                        v67 = v66;
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v66, "channel")), CFSTR("CHANNEL"));
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v67, "flags")), CFSTR("CHANNEL_FLAGS"));
                                                      }
                                                      v68 = (void *)objc_msgSend(v58, "location");
                                                      if (v68)
                                                      {
                                                        v69 = v68;
                                                        v70 = (void *)MEMORY[0x1E0CB37E8];
                                                        objc_msgSend(v68, "coordinate");
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v70, "numberWithDouble:"), CFSTR("networkLocnLat"));
                                                        v71 = (void *)MEMORY[0x1E0CB37E8];
                                                        objc_msgSend(v69, "coordinate");
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v71, "numberWithDouble:", v72), CFSTR("networkLocnLong"));
                                                        v73 = (void *)MEMORY[0x1E0CB37E8];
                                                        objc_msgSend(v69, "horizontalAccuracy");
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v73, "numberWithDouble:"), CFSTR("networkLocnAccuracy"));
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v69, "timestamp"), CFSTR("networkLocnTimestamp"));
                                                      }
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "lastAssociatedAt"), CFSTR("lastRoamed"));
                                                      v74 = (void *)objc_msgSend(v58, "colocated2GHzRNRChannel");
                                                      if (v74)
                                                      {
                                                        v75 = v74;
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v74, "channel")), CFSTR("colocated2GHzRNRChannel"));
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v75, "flags")), CFSTR("colocated2GHzRNRChannelFlags"));
                                                      }
                                                      v76 = (void *)objc_msgSend(v58, "colocated5GHzRNRChannel");
                                                      if (v76)
                                                      {
                                                        v77 = v76;
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v76, "channel")), CFSTR("colocated5GHzRNRChannel"));
                                                        objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(v77, "flags")), CFSTR("colocated5GHzRNRChannelFlags"));
                                                      }
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "AWDLRealTimeModeTimestamp"), CFSTR("AWDLRealTimeModeTimestamp"));
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "IPv4NetworkSignature"), CFSTR("IPv4NetworkSignature"));
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "IPv6NetworkSignature"), CFSTR("IPv6NetworkSignature"));
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "DHCPServerID"), CFSTR("DHCPServerID"));
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "DHCPv6ServerID"), CFSTR("DHCPv6ServerID"));
                                                      objc_msgSend(v65, "setObject:forKeyedSubscript:", objc_msgSend(v58, "coreWiFiSpecificAttributes"), v88);
                                                      if (!v54)
                                                        v54 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                                                      objc_msgSend(v54, "addObject:", v65);
                                                      v51 = v87;
                                                      v56 = 0x1E0CB3000;
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                        v53 = objc_msgSend(v51, "countByEnumeratingWithState:objects:count:", &v89, v93, 16);
                                      }
                                      while (v53);
                                    }
                                    else
                                    {
                                      v54 = 0;
                                    }
                                    v7 = v84;
                                    objc_msgSend(v84, "setObject:forKeyedSubscript:", v54, CFSTR("networkKnownBSSListKey"));
                                    a1 = v85;
                                    v4 = v86;
                                    a2 = v83;
                                  }
                                  if (!a2)
                                  {
                                    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isPrivacyProxyEnabled")), CFSTR("PrivacyProxyEnabled"));
                                    goto LABEL_201;
                                  }
LABEL_196:
                                  if (objc_msgSend(a2, "containsObject:", &unk_1E7142788))
                                    objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isPrivacyProxyEnabled")), CFSTR("PrivacyProxyEnabled"));
                                  if ((objc_msgSend(a2, "containsObject:", &unk_1E71427A0) & 1) == 0)
                                  {
LABEL_202:
                                    if (!objc_msgSend(a2, "containsObject:", &unk_1E71427B8))
                                    {
LABEL_209:
                                      if (!objc_msgSend(a2, "containsObject:", &unk_1E71427D0))
                                        goto LABEL_216;
LABEL_210:
                                      v80 = objc_msgSend(a1, "publicAttribute");
                                      if (v80 == 1)
                                      {
                                        v81 = MEMORY[0x1E0C9AAB0];
                                      }
                                      else
                                      {
                                        if (v80 != 2)
                                          goto LABEL_215;
                                        v81 = MEMORY[0x1E0C9AAA0];
                                      }
                                      objc_msgSend(v7, "setObject:forKeyedSubscript:", v81, CFSTR("WiFiNetworkAttributeIsPublic"));
LABEL_215:
                                      if (!a2)
                                      {
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "transitionDisabledFlags")), CFSTR("TransitionDisabledFlags"));
LABEL_221:
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isStandalone6G")), CFSTR("Standalone"));
LABEL_222:
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "carplayUUID"), CFSTR("CARPLAY_UUID"));
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isPersonalHotspot")), CFSTR("IsPersonalHotspot"));
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "NANServiceID"), CFSTR("WiFiNetworkNANServiceID"));
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isPublicAirPlayNetwork")), CFSTR("PublicAirPlayNetwork"));
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isDNSHeuristicsFilteredNetwork")), CFSTR("FilteredNetwork"));
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "DNSHeuristicsFailureStateInfo"), CFSTR("DNSFailures"));
                                        v6 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v7);
                                        goto LABEL_223;
                                      }
LABEL_216:
                                      if (objc_msgSend(a2, "containsObject:", &unk_1E71427E8))
                                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", objc_msgSend(a1, "transitionDisabledFlags")), CFSTR("TransitionDisabledFlags"));
                                      if ((objc_msgSend(a2, "containsObject:", &unk_1E7142800) & 1) == 0)
                                        goto LABEL_222;
                                      goto LABEL_221;
                                    }
LABEL_203:
                                    v78 = objc_msgSend(a1, "movingAttribute");
                                    if (v78 == 1)
                                    {
                                      v79 = MEMORY[0x1E0C9AAB0];
                                    }
                                    else
                                    {
                                      if (v78 != 2)
                                        goto LABEL_208;
                                      v79 = MEMORY[0x1E0C9AAA0];
                                    }
                                    objc_msgSend(v7, "setObject:forKeyedSubscript:", v79, CFSTR("WiFiNetworkAttributeIsMoving"));
LABEL_208:
                                    if (!a2)
                                      goto LABEL_210;
                                    goto LABEL_209;
                                  }
LABEL_201:
                                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "privacyProxyBlockedReason"), CFSTR("PrivacyProxyBlockedReason"));
                                  if (!a2)
                                    goto LABEL_203;
                                  goto LABEL_202;
                                }
LABEL_162:
                                if (objc_msgSend(a2, "containsObject:", &unk_1E7142758))
                                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastDiscoveredAt"), CFSTR("discoveredAt"));
                                if ((objc_msgSend(a2, "containsObject:", &unk_1E7142770) & 1) == 0)
                                  goto LABEL_196;
                                goto LABEL_167;
                              }
LABEL_156:
                              if (objc_msgSend(a2, "containsObject:", &unk_1E7142728))
                                objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkGroupID"), CFSTR("networkGroupID"));
                              if ((objc_msgSend(a2, "containsObject:", &unk_1E7142740) & 1) == 0)
                                goto LABEL_162;
                              goto LABEL_161;
                            }
LABEL_150:
                            if (objc_msgSend(a2, "containsObject:", &unk_1E71426F8))
                              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "userPreferredNetworkNames"), CFSTR("userPreferredNetworkNames"));
                            if ((objc_msgSend(a2, "containsObject:", &unk_1E7142710) & 1) == 0)
                              goto LABEL_156;
                            goto LABEL_155;
                          }
LABEL_144:
                          if (objc_msgSend(a2, "containsObject:", &unk_1E71426C8))
                            objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "NAIRealmNameList"), CFSTR("NaiRealmName"));
                          if ((objc_msgSend(a2, "containsObject:", &unk_1E71426E0) & 1) == 0)
                            goto LABEL_150;
                          goto LABEL_149;
                        }
LABEL_138:
                        if (objc_msgSend(a2, "containsObject:", &unk_1E7142698))
                          objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "isServiceProviderRoamingEnabled")), CFSTR("SPRoaming"));
                        if ((objc_msgSend(a2, "containsObject:", &unk_1E71426B0) & 1) == 0)
                          goto LABEL_144;
                        goto LABEL_143;
                      }
LABEL_132:
                      if (objc_msgSend(a2, "containsObject:", &unk_1E7142668))
                        objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "domainName"), CFSTR("DomainName"));
                      if ((objc_msgSend(a2, "containsObject:", &unk_1E7142680) & 1) == 0)
                        goto LABEL_138;
                      goto LABEL_137;
                    }
LABEL_123:
                    if (objc_msgSend(a2, "containsObject:", &unk_1E7142638))
                      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "addedAt"), CFSTR("addedAt"));
                    if ((objc_msgSend(a2, "containsObject:", &unk_1E7142650) & 1) == 0)
                      goto LABEL_132;
                    goto LABEL_128;
                  }
LABEL_105:
                  if (!objc_msgSend(a2, "containsObject:", &unk_1E71425F0))
                    goto LABEL_123;
                  goto LABEL_106;
                }
LABEL_99:
                if (objc_msgSend(a2, "containsObject:", &unk_1E71425C0))
                  objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "lastJoinedByUserAt"), CFSTR("lastJoined"));
                if ((objc_msgSend(a2, "containsObject:", &unk_1E71425D8) & 1) == 0)
                  goto LABEL_105;
                goto LABEL_104;
              }
LABEL_82:
              if (objc_msgSend(a2, "containsObject:", &unk_1E7142590))
              {
                if (objc_msgSend(a1, "isAutoJoinDisabled"))
                  v34 = v9;
                else
                  v34 = MEMORY[0x1E0C9AAB0];
                objc_msgSend(v7, "setObject:forKeyedSubscript:", v34, CFSTR("enabled"));
              }
              if ((objc_msgSend(a2, "containsObject:", &unk_1E71425A8) & 1) == 0)
                goto LABEL_99;
              goto LABEL_93;
            }
LABEL_76:
            if (objc_msgSend(a2, "containsObject:", &unk_1E7142560))
              objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "payloadUUID"), CFSTR("PayloadUUID"));
            if ((objc_msgSend(a2, "containsObject:", &unk_1E7142578) & 1) == 0)
              goto LABEL_82;
            goto LABEL_81;
          }
LABEL_72:
          if (!objc_msgSend(a2, "containsObject:", &unk_1E7142548))
            goto LABEL_76;
          goto LABEL_73;
        }
LABEL_62:
        v32 = objc_msgSend(a1, "captiveProfile");
        if (v32)
          objc_msgSend(v7, "addEntriesFromDictionary:", v32);
        if (!a2)
          goto LABEL_66;
        goto LABEL_65;
      }
      v10 = objc_msgSend(a1, "supportedSecurityTypes");
      v11 = v10;
      if ((v10 & 2) == 0)
      {
        if ((v10 & 1) == 0
          || (objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WEP")),
              !objc_msgSend(a2, "containsObject:", &unk_1E7142500)))
        {
LABEL_31:
          if ((v11 & 0xC) != 0)
          {
            v19 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
            objc_msgSend(v19, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1), CFSTR("IE_KEY_WPA_VERSION"));
            objc_msgSend(v19, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2), CFSTR("IE_KEY_WPA_MCIPHER"));
            v20 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            objc_msgSend(v20, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2));
            objc_msgSend(v19, "setObject:forKey:", v20, CFSTR("IE_KEY_WPA_UCIPHERS"));
            v21 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            if ((v11 & 8) != 0)
              v22 = 1;
            else
              v22 = 2;
            objc_msgSend(v21, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v22));
            objc_msgSend(v19, "setObject:forKey:", v21, CFSTR("IE_KEY_WPA_AUTHSELS"));
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v19, CFSTR("WPA_IE"));
          }
          v23 = v11 & 0x300;
          if ((v11 & 0xF0) == 0 && v23 != 256)
          {
LABEL_52:
            if (v23 == 768)
              objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("SCAN_RESULT_OWE_MULTI_SSID"));
            v28 = objc_msgSend(a1, "isWPA2");
            v29 = MEMORY[0x1E0C9AAB0];
            if (v28)
              v30 = MEMORY[0x1E0C9AAB0];
            else
              v30 = v9;
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v30, CFSTR("ALLOW_WPA2_PSK"));
            if (objc_msgSend(a1, "isOpen"))
              v31 = v29;
            else
              v31 = v9;
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v31, CFSTR("ALLOW_OWE_TSN"));
            v4 = v86;
            if (!a2)
              goto LABEL_62;
            goto LABEL_61;
          }
          v24 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v24, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", 1), CFSTR("IE_KEY_RSN_VERSION"));
          objc_msgSend(v24, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4), CFSTR("IE_KEY_RSN_MCIPHER"));
          v25 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          objc_msgSend(v25, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 4));
          objc_msgSend(v24, "setObject:forKey:", v25, CFSTR("IE_KEY_RSN_UCIPHERS"));
          v26 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "array");
          if ((v11 & 0x80) != 0)
          {
            objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 12));
            if ((v11 & 0x20) == 0)
            {
LABEL_40:
              if ((v11 & 0x40) == 0)
                goto LABEL_47;
              goto LABEL_44;
            }
          }
          else if ((v11 & 0x20) == 0)
          {
            goto LABEL_40;
          }
          objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 1));
          if ((v11 & 0x40) == 0)
          {
LABEL_47:
            if (v23 == 256)
              objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 18));
            if ((v11 & 0x10) != 0)
              objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 2));
            objc_msgSend(v24, "setObject:forKey:", v26, CFSTR("IE_KEY_RSN_AUTHSELS"));
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v24, CFSTR("RSN_IE"));
            goto LABEL_52;
          }
LABEL_44:
          objc_msgSend(v26, "addObject:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 8));
          v27 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          objc_msgSend(v27, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("MFP_CAPABLE"));
          if ((v11 & 0x10) == 0)
            objc_msgSend(v27, "setObject:forKey:", MEMORY[0x1E0C9AAB0], CFSTR("MFP_REQUIRED"));
          objc_msgSend(v24, "setObject:forKey:", v27, CFSTR("IE_KEY_RSN_CAPS"));
          goto LABEL_47;
        }
        goto LABEL_19;
      }
      if (!objc_msgSend(a2, "containsObject:", &unk_1E71424B8))
        goto LABEL_31;
    }
    else
    {
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "SSID"), CFSTR("SSID"));
      objc_msgSend(v7, "setObject:forKeyedSubscript:", objc_msgSend(a1, "networkName"), CFSTR("SSID_STR"));
      v12 = objc_msgSend(a1, "supportedSecurityTypes");
      v11 = v12;
      if ((v12 & 2) == 0)
      {
        if ((v12 & 1) == 0)
          goto LABEL_31;
        objc_msgSend(v7, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("WEP"));
LABEL_19:
        v13 = objc_msgSend(a1, "WEPSubtype") - 1;
        if (v13 > 3)
          v14 = 0;
        else
          v14 = dword_1B9BCEF30[v13];
        v17 = (void *)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
        v18 = CFSTR("WEP_AUTH_Flags");
LABEL_30:
        objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v18);
        goto LABEL_31;
      }
    }
    v15 = objc_msgSend(a1, "WAPISubtype");
    v16 = &unk_1E71424E8;
    if (v15 != 1)
      v16 = 0;
    if (v15 == 2)
      v17 = &unk_1E71424D0;
    else
      v17 = v16;
    v18 = CFSTR("WAPI");
    goto LABEL_30;
  }
LABEL_223:
  objc_autoreleasePoolPop(v4);
  return v6;
}

uint64_t WiFiNetworkCreateCoreWiFiScanResult(uint64_t a1)
{
  void *v2;
  uint64_t CWFScanResultPropertyOSSpecificAttributesKey;
  CFDictionaryRef Copy;
  CFDictionaryRef v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  _QWORD v34[2];
  _QWORD v35[77];

  v35[75] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCCB058]();
  if (getCWFScanResultClass()
    && (CWFScanResultPropertyOSSpecificAttributesKey = getCWFScanResultPropertyOSSpecificAttributesKey(), a1)
    && CWFScanResultPropertyOSSpecificAttributesKey
    && (Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(CFDictionaryRef *)(a1 + 16))) != 0)
  {
    v5 = Copy;
    v23 = v2;
    v6 = (id)objc_msgSend((id)WiFiNetworkGetProperty(a1, CFSTR("HS20GasResponse")), "mutableCopy");
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("ANQP_STATUS"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("BSSID"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("CHANNEL"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("CHANNEL_FLAGS"));
    v7 = (id)-[__CFDictionary mutableCopy](v5, "mutableCopy");
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, CFSTR("ANQP_PARSED"));
    v8 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v9 = (void *)objc_msgSend(MEMORY[0x1E0D1BA60], "supportedOSSpecificKeys");
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v29 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", WiFiNetworkGetProperty(a1, *(void **)(*((_QWORD *)&v28 + 1) + 8 * i)), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v11);
    }
    if (objc_msgSend(v8, "count"))
      v14 = v8;
    else
      v14 = 0;
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v14, getCWFScanResultPropertyOSSpecificAttributesKey());
    v35[0] = CFSTR("IsWiFiNetworkShareble");
    v35[1] = CFSTR("NetworkOriginator");
    v35[2] = CFSTR("CaptiveBypass");
    v35[3] = CFSTR("DiagnosticsBssEnv");
    v35[4] = CFSTR("DisableWiFiAutoJoinUntilFirstUserJoin");
    v35[5] = CFSTR("DisplayedOperatorName");
    v35[6] = CFSTR("DomainName");
    v35[7] = CFSTR("HS20GasResponse");
    v35[8] = CFSTR("HS20HomeOperatorNetwork");
    v35[9] = CFSTR("HS20ProvisionedNetwork");
    v35[10] = CFSTR("HS2NetworkBadge");
    v35[11] = CFSTR("HS20AccountName");
    v35[12] = CFSTR("MCCandMNC");
    v35[13] = CFSTR("NaiRealmName");
    v35[14] = CFSTR("NetworkAtLocationOfInterestType");
    v35[15] = CFSTR("WiFiNetworkAttributeHighPopularity");
    v35[16] = CFSTR("WiFiNetworkAttributeHighQuality");
    v35[17] = CFSTR("WiFiNetworkAttributeIsMoving");
    v35[18] = CFSTR("WiFiNetworkAttributeIsPotentiallyCaptive");
    v35[19] = CFSTR("WiFiNetworkAttributeIsPotentiallyMoving");
    v35[20] = CFSTR("WiFiNetworkAttributeIsSuspicious");
    v35[21] = CFSTR("WiFiNetworkAttributeIsTCPGood");
    v35[22] = CFSTR("WiFiNetworkAttributeLowPopularity");
    v35[23] = CFSTR("WiFiNetworkAttributeLowQuality");
    v35[24] = CFSTR("WiFiNetworkAttributePopularityScore");
    v35[25] = CFSTR("WiFiNetworkAttributeProminentDisplay");
    v35[26] = CFSTR("WiFiNetworkAttributeQualityScore");
    v35[27] = CFSTR("WiFiNetworkAttributeSource");
    v35[28] = CFSTR("BundleIdentifier");
    v35[29] = CFSTR("SIMIdentifiers");
    v35[30] = CFSTR("WiFiNetworkDisabledUntilDate");
    v35[31] = CFSTR("EnterpriseProfile");
    v35[32] = CFSTR("WiFiNetworkExpirationDate");
    v35[33] = CFSTR("NetworkForcedHomeFix");
    v35[34] = CFSTR("kWiFiNetworkLastHomeForceFixDateKey");
    v35[35] = CFSTR("NetworkOfInterestHomeState");
    v35[36] = CFSTR("NetworkOfInterestWorkState");
    v35[37] = CFSTR("WiFiNetworkPasswordModificationDate");
    v35[38] = CFSTR("PayloadUUID");
    v35[39] = CFSTR("SaveDataMode");
    v35[40] = CFSTR("NetworkQualityResponsiveness");
    v35[41] = CFSTR("NetworkQualityDate");
    v35[42] = CFSTR("ShareableEAPConfig");
    v35[43] = CFSTR("ShareableEAPTrustExceptions");
    v35[44] = CFSTR("ShareableStatus");
    v35[45] = CFSTR("ShareMode");
    v35[46] = CFSTR("kWiFiNetworkSSIDHarvestStatusKey");
    v35[47] = CFSTR("UserRole");
    v35[48] = CFSTR("WalletIdentifier");
    v35[49] = CFSTR("addedAt");
    v35[50] = CFSTR("knownBSSUpdatedDate");
    v35[51] = CFSTR("lastAutoJoined");
    v35[52] = CFSTR("lastJoined");
    v35[53] = CFSTR("lastRoamed");
    v35[54] = CFSTR("lastUpdated");
    v35[55] = CFSTR("WiFiManagerKnownNetworksEventType");
    v35[56] = CFSTR("networkDisabledClientName");
    v35[57] = CFSTR("networkDisabledReason");
    v35[58] = CFSTR("networkDisabledTimestamp");
    v35[59] = CFSTR("enabled");
    v35[60] = CFSTR("networkKnownBSSListKey");
    v35[61] = CFSTR("scanWasDirected");
    v35[62] = CFSTR("prevJoined");
    v35[63] = CFSTR("UserDirected");
    v35[64] = CFSTR("networkUsage");
    v35[65] = CFSTR("RoamingConsortiumOIs");
    v35[66] = CFSTR("SPRoaming");
    v35[67] = CFSTR("PolicyUUID");
    v35[68] = CFSTR("PrivacyProxyEnabled");
    v35[69] = CFSTR("TransitionDisabledFlags");
    v35[70] = CFSTR("Standalone");
    v35[71] = CFSTR("PublicAirPlayNetwork");
    v35[72] = CFSTR("PrivacyProxyBlockedReason");
    v35[73] = CFSTR("FilteredNetwork");
    v35[74] = CFSTR("DNSFailures");
    v15 = (void *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 75);
    if (MEMORY[0x1E0D0D1B8])
    {
      v16 = *MEMORY[0x1E0D0D2D8];
      v34[0] = *MEMORY[0x1E0D0D290];
      v34[1] = v16;
      v15 = (void *)objc_msgSend(v15, "arrayByAddingObjectsFromArray:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 2));
    }
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v25;
      do
      {
        for (j = 0; j != v18; ++j)
        {
          if (*(_QWORD *)v25 != v19)
            objc_enumerationMutation(v15);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * j));
        }
        v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v18);
    }
    v21 = objc_msgSend(objc_alloc((Class)getCWFScanResultClass()), "initWithScanRecord:includeProperties:", v7, 0);
    objc_autoreleasePoolPop(v23);
    CFRelease(v5);
  }
  else
  {
    objc_autoreleasePoolPop(v2);
    return 0;
  }
  return v21;
}

uint64_t getCWFScanResultClass()
{
  uint64_t v0;
  _QWORD v2[5];
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t);
  void (*v7)(uint64_t);
  uint64_t v8;

  v3 = 0;
  v4 = &v3;
  v5 = 0x3052000000;
  v6 = __Block_byref_object_copy_;
  v7 = __Block_byref_object_dispose_;
  v0 = getCWFScanResultClass_softClass;
  v8 = getCWFScanResultClass_softClass;
  if (!getCWFScanResultClass_softClass)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __getCWFScanResultClass_block_invoke;
    v2[3] = &unk_1E713B950;
    v2[4] = &v3;
    __getCWFScanResultClass_block_invoke((uint64_t)v2);
    v0 = v4[5];
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B9BB9704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getCWFScanResultPropertyOSSpecificAttributesKey()
{
  void *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (void *)getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr;
  v6 = getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr;
  if (!getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr)
  {
    v1 = (void *)CoreWiFiLibrary();
    v0 = dlsym(v1, "CWFScanResultPropertyOSSpecificAttributesKey");
    v4[3] = (uint64_t)v0;
    getCWFScanResultPropertyOSSpecificAttributesKeySymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getCWFScanResultPropertyOSSpecificAttributesKey_cold_1();
  return *(_QWORD *)v0;
}

void sub_1B9BB97A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t WiFiNetworkCompareWithKnownNetwork(const __CFDictionary **a1, const __CFDictionary **a2)
{
  const void *Property;
  const void *v5;
  BOOL v6;
  uint64_t result;
  int HaveSameDomain;

  Property = WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkNANServiceID"));
  v5 = WiFiNetworkGetProperty((uint64_t)a2, CFSTR("WiFiNetworkNANServiceID"));
  if (Property)
    v6 = v5 == 0;
  else
    v6 = 1;
  if (!v6 && CFEqual(Property, v5))
    return 1;
  result = 0;
  if (a1 && a2)
  {
    if (__WiFiCompareSSIDorBSSID(a1[2], a2[2]))
    {
      if (WiFiNetworkIsHotspot20((_BOOL8)a1) && !WiFiNetworkIsHotspot20((_BOOL8)a2)
        || !WiFiNetworkIsHotspot20((_BOOL8)a1) && WiFiNetworkIsHotspot20((_BOOL8)a2))
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        return 0;
      }
      result = __WiFiCompareBGScanParams(a1[2], a2[2]);
      if (!(_DWORD)result)
        return result;
      HaveSameDomain = __WiFiCompareDictionaryValues(a1[2], a2[2], CFSTR("AP_MODE"));
      return HaveSameDomain != 0;
    }
    if (!__WiFiIsSameHS20Account(a1, a2, 0))
    {
      HaveSameDomain = __WiFiHS20NetworksHaveSameDomain((uint64_t)a1, (uint64_t)a2);
      return HaveSameDomain != 0;
    }
    return 1;
  }
  return result;
}

void *WiFiNetworkCreateFromCoreWiFiScanResult(void *a1)
{
  void *v2;
  uint64_t CWFScanResultClass;
  id v4;
  void *v5;
  const __CFAllocator *v6;
  _WORD *v7;
  const void *v8;
  void *v9;
  CFDictionaryRef *v10;
  CFDictionaryRef *v11;
  CFDictionaryRef Copy;
  CFDictionaryRef v13;
  id v14;
  void *v15;
  const void *Property;
  const void *v17;
  const void *v18;
  const void *v19;

  v2 = (void *)MEMORY[0x1BCCCB058]();
  CWFScanResultClass = getCWFScanResultClass();
  if (a1
    && CWFScanResultClass
    && (getCWFScanResultClass(), objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && (v4 = (id)objc_msgSend((id)objc_msgSend(a1, "scanRecord"), "mutableCopy")) != 0
    && (v5 = v4,
        objc_msgSend(v4, "addEntriesFromDictionary:", objc_msgSend(a1, "OSSpecificAttributes")),
        v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00],
        (v7 = WiFiNetworkCreate(*MEMORY[0x1E0C9AE00], v5)) != 0))
  {
    v8 = v7;
    v9 = (void *)objc_msgSend(a1, "matchingKnownNetworkProfile");
    if (v9)
    {
      v10 = (CFDictionaryRef *)WiFiNetworkCreateFromCoreWiFiNetworkProfile(v9, 0);
      v11 = v10;
      if (v10 && (Copy = CFDictionaryCreateCopy(v6, v10[2])) != 0)
      {
        v13 = Copy;
        v14 = (id)objc_msgSend(v5, "copy");
        objc_msgSend(v5, "setDictionary:", v13);
        objc_msgSend(v5, "addEntriesFromDictionary:", v14);
        v15 = WiFiNetworkCreate((int)v6, v5);
        CFRelease(v13);
      }
      else
      {
        v15 = 0;
      }
    }
    else
    {
      v15 = (void *)CFRetain(v8);
      v11 = 0;
    }
    Property = WiFiNetworkGetProperty((uint64_t)v11, CFSTR("WPA_IE"));
    v17 = WiFiNetworkGetProperty((uint64_t)v8, CFSTR("WPA_IE"));
    v18 = WiFiNetworkGetProperty((uint64_t)v11, CFSTR("RSN_IE"));
    v19 = WiFiNetworkGetProperty((uint64_t)v8, CFSTR("RSN_IE"));
    if (v18 && Property && v19 && !v17)
      WiFiNetworkSetProperty((uint64_t)v15, CFSTR("WPA_IE"), 0);
    if (!WiFiNetworkGetProperty((uint64_t)v8, CFSTR("BSSID")))
      WiFiNetworkSetProperty((uint64_t)v15, CFSTR("BSSID"), 0);
    objc_autoreleasePoolPop(v2);
    if (v11)
      CFRelease(v11);
    CFRelease(v8);
  }
  else
  {
    objc_autoreleasePoolPop(v2);
    return 0;
  }
  return v15;
}

const __CFDictionary *WiFiNetworkGetApManufacturerName(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  CFTypeID TypeID;

  if (result)
  {
    result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("WPS_PROB_RESP_IE"));
    if (result)
    {
      result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("IE_KEY_WPS_MANUFACTURER"));
      if (result)
      {
        v1 = result;
        TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1))
          return v1;
        else
          return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *WiFiNetworkGetApModelName(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  CFTypeID TypeID;

  if (result)
  {
    result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("WPS_PROB_RESP_IE"));
    if (result)
    {
      result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("IE_KEY_WPS_MODEL_NAME"));
      if (result)
      {
        v1 = result;
        TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1))
          return v1;
        else
          return 0;
      }
    }
  }
  return result;
}

const __CFDictionary *WiFiNetworkGetApModelNumber(const __CFDictionary *result)
{
  const __CFDictionary *v1;
  CFTypeID TypeID;

  if (result)
  {
    result = (const __CFDictionary *)WiFiNetworkGetProperty((uint64_t)result, CFSTR("WPS_PROB_RESP_IE"));
    if (result)
    {
      result = (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("IE_KEY_WPS_MODEL_NUM"));
      if (result)
      {
        v1 = result;
        TypeID = CFStringGetTypeID();
        if (TypeID == CFGetTypeID(v1))
          return v1;
        else
          return 0;
      }
    }
  }
  return result;
}

uint64_t WiFiNetworkGetApDeviceVersion(uint64_t a1)
{
  if (a1)
    WiFiNetworkGetProperty(a1, CFSTR("WPS_PROB_RESP_IE"));
  return 0;
}

CFDataRef WiFiNetworkCreatePrivateMacAddress(const __CFData *a1, const __CFData *a2, const __CFData *a3, CFStringRef theString)
{
  CFDataRef v4;
  __int128 v5;
  const __CFAllocator *v9;
  CFDataRef ExternalRepresentation;
  const __CFData *v11;
  __CFData *Mutable;
  const UInt8 *BytePtr;
  const UInt8 *v14;
  const UInt8 *v15;
  const UInt8 *v16;
  CFIndex Length;
  CFIndex v18;
  CFIndex v19;
  CFIndex v20;
  CFIndex v21;
  UInt8 *MutableBytePtr;
  __int128 v23;
  CC_SHA256_CTX v25;
  _OWORD bytes[2];
  unsigned __int8 md[16];
  __int128 v28;
  uint64_t v29;

  v4 = 0;
  v29 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)md = 0u;
  v28 = 0u;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  bytes[0] = v5;
  bytes[1] = v5;
  if (a1 && a3)
  {
    if (theString)
    {
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, 0x8000100u, 0);
    }
    else
    {
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, bytes))
        return 0;
      v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      ExternalRepresentation = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)bytes, 32);
    }
    v11 = ExternalRepresentation;
    Mutable = CFDataCreateMutable(v9, 0);
    if (Mutable)
    {
      BytePtr = CFDataGetBytePtr(v11);
      v14 = CFDataGetBytePtr(a1);
      v15 = CFDataGetBytePtr(a3);
      if (a2)
        v16 = CFDataGetBytePtr(a2);
      else
        v16 = 0;
      Length = CFDataGetLength(a1);
      CFDataAppendBytes(Mutable, v14, Length);
      CFDataAppendBytes(Mutable, v15, 6);
      v18 = CFDataGetLength(v11);
      CFDataAppendBytes(Mutable, BytePtr, v18);
      if (a2 && v16)
      {
        v19 = CFDataGetLength(a2);
        CFDataAppendBytes(Mutable, v16, v19);
      }
      v20 = CFDataGetLength(a1);
      v21 = v20 + CFDataGetLength(v11) + 6;
      if (a2)
        LODWORD(v21) = CFDataGetLength(a2) + v21;
      MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
      *(_QWORD *)&v25.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
      *(_QWORD *)&v23 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v23 + 1) = 0xAAAAAAAAAAAAAAAALL;
      *(_OWORD *)&v25.wbuf[6] = v23;
      *(_OWORD *)&v25.wbuf[10] = v23;
      *(_OWORD *)&v25.hash[6] = v23;
      *(_OWORD *)&v25.wbuf[2] = v23;
      *(_OWORD *)v25.count = v23;
      *(_OWORD *)&v25.hash[2] = v23;
      CC_SHA256_Init(&v25);
      CC_SHA256_Update(&v25, MutableBytePtr, v21);
      CC_SHA256_Final(md, &v25);
    }
    v25.count[0] = *(_DWORD *)md;
    LOWORD(v25.count[1]) = *(_WORD *)&md[4];
    LOBYTE(v25.count[0]) = md[0] & 0xFC | 2;
    v4 = CFDataCreate(v9, (const UInt8 *)&v25, 6);
    if (Mutable)
      CFRelease(Mutable);
    if (v11)
      CFRelease(v11);
  }
  return v4;
}

CFDataRef WiFiNetworkCreateForceNewPrivateMacAddress(const __CFData *a1, const __CFData *a2, CFStringRef theString)
{
  CFDataRef v3;
  __int128 v4;
  const __CFAllocator *v7;
  const __CFData *ExternalRepresentation;
  const __SecRandom *v9;
  __CFData *Mutable;
  const UInt8 *BytePtr;
  const UInt8 *v12;
  const UInt8 *v13;
  CFIndex Length;
  CFIndex v15;
  int v16;
  UInt8 *MutableBytePtr;
  __int128 v18;
  CC_SHA256_CTX v20;
  UInt8 v21[4];
  __int16 v22;
  UInt8 v23[16];
  __int128 v24;
  _OWORD bytes[2];
  unsigned __int8 md[16];
  __int128 v27;
  uint64_t v28;

  v3 = 0;
  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  *(_DWORD *)v21 = 0;
  *(_OWORD *)md = 0u;
  v27 = 0u;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  bytes[0] = v4;
  bytes[1] = v4;
  *(_OWORD *)v23 = v4;
  v24 = v4;
  if (a1 && a2)
  {
    if (theString)
    {
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, 0x8000100u, 0);
      v9 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
    }
    else
    {
      v9 = (const __SecRandom *)*MEMORY[0x1E0CD7000];
      if (SecRandomCopyBytes((SecRandomRef)*MEMORY[0x1E0CD7000], 0x20uLL, v23))
        return 0;
      v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      ExternalRepresentation = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v23, 32);
    }
    if (SecRandomCopyBytes(v9, 0x20uLL, bytes))
    {
      v3 = 0;
    }
    else
    {
      Mutable = CFDataCreateMutable(v7, 0);
      if (Mutable)
      {
        BytePtr = CFDataGetBytePtr(ExternalRepresentation);
        v12 = CFDataGetBytePtr(a1);
        v13 = CFDataGetBytePtr(a2);
        Length = CFDataGetLength(a1);
        CFDataAppendBytes(Mutable, v12, Length);
        CFDataAppendBytes(Mutable, v13, 6);
        v15 = CFDataGetLength(ExternalRepresentation);
        CFDataAppendBytes(Mutable, BytePtr, v15);
        CFDataAppendBytes(Mutable, (const UInt8 *)bytes, 32);
        v16 = CFDataGetLength(a1);
        LODWORD(v13) = v16 + CFDataGetLength(ExternalRepresentation);
        MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
        *(_QWORD *)&v20.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
        *(_QWORD *)&v18 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v18 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&v20.wbuf[6] = v18;
        *(_OWORD *)&v20.wbuf[10] = v18;
        *(_OWORD *)&v20.hash[6] = v18;
        *(_OWORD *)&v20.wbuf[2] = v18;
        *(_OWORD *)v20.count = v18;
        *(_OWORD *)&v20.hash[2] = v18;
        CC_SHA256_Init(&v20);
        CC_SHA256_Update(&v20, MutableBytePtr, (_DWORD)v13 + 38);
        CC_SHA256_Final(md, &v20);
      }
      *(_DWORD *)v21 = *(_DWORD *)md;
      v22 = *(_WORD *)&md[4];
      v21[0] = md[0] & 0xFC | 2;
      v3 = CFDataCreate(v7, v21, 6);
      if (Mutable)
        CFRelease(Mutable);
    }
    if (ExternalRepresentation)
      CFRelease(ExternalRepresentation);
  }
  return v3;
}

CFDataRef WiFiNetworkCreateNetworkID(const __CFData *a1, const __CFString *a2)
{
  CFDataRef v2;
  __int128 v3;
  const __CFAllocator *v5;
  const __CFData *ExternalRepresentation;
  CFMutableDataRef Mutable;
  __CFData *v8;
  const UInt8 *BytePtr;
  const UInt8 *v10;
  CFIndex Length;
  int v12;
  UInt8 *MutableBytePtr;
  __int128 v14;
  CC_SHA256_CTX v16;
  unsigned __int8 md[16];
  __int128 v18;
  UInt8 bytes[16];
  __int128 v20;
  uint64_t v21;

  v2 = 0;
  v21 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)bytes = v3;
  v20 = v3;
  *(_OWORD *)md = 0u;
  v18 = 0u;
  if (a1 && a2)
  {
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0x8000100u, 0);
    Mutable = CFDataCreateMutable(v5, 0);
    if (!Mutable)
    {
      *(_OWORD *)bytes = 0u;
      v20 = 0u;
      v2 = CFDataCreate(v5, bytes, 32);
      if (!ExternalRepresentation)
        return v2;
      goto LABEL_5;
    }
    v8 = Mutable;
    BytePtr = CFDataGetBytePtr(ExternalRepresentation);
    v10 = CFDataGetBytePtr(a1);
    CFDataAppendBytes(v8, v10, 6);
    Length = CFDataGetLength(ExternalRepresentation);
    CFDataAppendBytes(v8, BytePtr, Length);
    v12 = CFDataGetLength(ExternalRepresentation);
    MutableBytePtr = CFDataGetMutableBytePtr(v8);
    *(_QWORD *)&v16.wbuf[14] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v14 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v14 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)&v16.wbuf[6] = v14;
    *(_OWORD *)&v16.wbuf[10] = v14;
    *(_OWORD *)&v16.hash[6] = v14;
    *(_OWORD *)&v16.wbuf[2] = v14;
    *(_OWORD *)v16.count = v14;
    *(_OWORD *)&v16.hash[2] = v14;
    CC_SHA256_Init(&v16);
    CC_SHA256_Update(&v16, MutableBytePtr, v12 + 6);
    CC_SHA256_Final(md, &v16);
    *(_OWORD *)bytes = *(_OWORD *)md;
    v20 = v18;
    v2 = CFDataCreate(v5, bytes, 32);
    CFRelease(v8);
    if (ExternalRepresentation)
LABEL_5:
      CFRelease(ExternalRepresentation);
  }
  return v2;
}

uint64_t WiFiNetworkIsOpen(uint64_t result)
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    return !WiFiNetworkIsEAP(result)
        && CFDictionaryGetValue(*(CFDictionaryRef *)(v1 + 16), CFSTR("WEP")) != (const void *)*MEMORY[0x1E0C9AE50]
        && !WiFiNetworkIsWPAWPA2PSK(v1)
        && !WiFiNetworkIsWAPI(v1)
        && !__WiFiNetworkIsSAE(*(const __CFDictionary **)(v1 + 16))
        && __WiFiNetworkIsOWEOnly(*(const __CFDictionary **)(v1 + 16)) == 0;
  }
  return result;
}

const void *WiFiPrivateMacNetworkGetMatchingNetwork(const __CFArray *a1, const __CFDictionary **a2)
{
  const void *result;
  uint64_t v4;
  CFIndex idx;

  result = 0;
  v4 = 0;
  idx = -1;
  if (a1 && a2)
  {
    WiFiGetPrivateMacNetworkIndices(a1, a2, &idx, &v4);
    if (idx == -1)
      return 0;
    else
      return CFArrayGetValueAtIndex(a1, idx);
  }
  return result;
}

void WiFiGetPrivateMacNetworkIndices(const __CFArray *a1, const __CFDictionary **a2, CFIndex *a3, _QWORD *a4)
{
  CFIndex Count;
  uint64_t v9;
  CFTypeID v10;
  uint64_t v11;
  CFIndex v12;
  CFTypeRef *ValueAtIndex;

  if (!a1)
    goto LABEL_12;
  Count = CFArrayGetCount(a1);
  if (!Count)
    goto LABEL_12;
  if (!a2)
    goto LABEL_18;
  v9 = Count;
  v10 = CFGetTypeID(a2);
  v11 = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    v11 = __kWiFiNetworkTypeID;
  }
  if (v10 != v11)
  {
LABEL_18:
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    goto LABEL_12;
  }
  if (v9 < 1)
  {
LABEL_12:
    v12 = -1;
    goto LABEL_13;
  }
  v12 = 0;
  while (1)
  {
    ValueAtIndex = (CFTypeRef *)CFArrayGetValueAtIndex(a1, v12);
    if (ValueAtIndex)
    {
      if (__WiFiCompareDictionaryValues(ValueAtIndex[2], a2[2], CFSTR("SSID_STR")))
        break;
    }
    if (v9 == ++v12)
      goto LABEL_12;
  }
LABEL_13:
  if (a4)
    *a4 = 0;
  if (a3)
    *a3 = v12;
}

uint64_t WiFiNetworkPrivateMacIsNetworkTrustworthy(uint64_t a1)
{
  if (a1)
    return WiFiNetworkIsPublicAirPlayNetwork(a1) ^ 1;
  else
    return 1;
}

BOOL WiFiNetworkPrivateMacNetworkType(CFDictionaryRef *a1)
{
  void *CoreWiFiNetworkProfile;
  void *CoreWiFiScanResult;
  int v4;
  char v5;
  BOOL v6;
  _BOOL8 result;
  char v8;

  CoreWiFiNetworkProfile = WiFiNetworkCreateCoreWiFiNetworkProfile(a1);
  CoreWiFiScanResult = (void *)WiFiNetworkCreateCoreWiFiScanResult((uint64_t)a1);
  if (objc_msgSend(CoreWiFiNetworkProfile, "isAllowedInLockdownMode"))
    v4 = objc_msgSend(CoreWiFiScanResult, "isAllowedInLockdownMode") ^ 1;
  else
    LOBYTE(v4) = 1;
  v5 = objc_msgSend(CoreWiFiNetworkProfile, "supportedSecurityTypes");
  if (CoreWiFiNetworkProfile)
    CFRelease(CoreWiFiNetworkProfile);
  if (CoreWiFiScanResult)
    CFRelease(CoreWiFiScanResult);
  v6 = WiFiNetworkIsCarPlay((uint64_t)a1) == 0;
  result = v6;
  if (v6)
    v8 = v4;
  else
    v8 = 1;
  if ((v8 & 1) == 0)
    return WiFiNetworkIsLegacyHotspot((uint64_t)a1)
        || WiFiNetworkIsHotspot20((_BOOL8)a1)
        || WiFiNetworkIsHotspot((uint64_t)a1)
        || WiFiNetworkIsPublicHotspot((uint64_t)a1)
        || a1 && CFDictionaryGetValue(a1[2], CFSTR("DomainName"))
        || WiFiNetworkGetBundleIdentifier((uint64_t)a1)
        || WiFiNetworkIsCarrierBundleBased((uint64_t)a1)
        || a1 && WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WalletIdentifier"))
        || WiFiNetworkIsPublicAirPlayNetwork((uint64_t)a1)
        || WiFiNetworkIsApplePersonalHotspot((uint64_t)a1)
        || ((unint64_t)WiFiNetworkGetAccessoryIdentifier((uint64_t)a1) | v5 & 4 | v5 & 8) != 0;
  return result;
}

BOOL WiFiNetworkIsAccessoryNetwork(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) != 0;
}

uint64_t WiFiNetworkGetAuthTypes(uint64_t a1, __int32 *a2)
{
  const __CFDictionary *v4;
  const __CFDictionary *Value;
  const __CFDictionary *v6;
  _BOOL4 v7;
  int v8;
  int v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int v16;
  unsigned int v17;
  int8x8_t v18;
  int8x8_t v19;
  int8x8_t v20;
  int8x8_t v21;
  int8x8_t v22;
  int8x8_t v23;
  int8x8_t v24;
  int8x8_t v25;
  int8x8_t v26;
  __int32 v27;
  int8x8_t v28;
  int8x8_t v29;
  int8x8_t v30;
  __int32 v31;
  uint64_t v32;
  unsigned int v34;
  int8x8_t v35;

  v4 = *(const __CFDictionary **)(a1 + 16);
  if (v4)
  {
    Value = (const __CFDictionary *)CFDictionaryGetValue(v4, CFSTR("RSN_IE"));
    v6 = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("WPA_IE"));
    if (Value)
    {
      v7 = __WiFiNetworkContainsAuthSelector(Value, 2) != 0;
      v8 = __WiFiNetworkContainsAuthSelector(Value, 1);
      if (v8)
        v9 = (8 * v7) | 4;
      else
        v9 = 8 * v7;
      v35.i32[0] = v9;
      v35.i32[1] = v8 | (2 * v7);
      v34 = __WiFiNetworkContainsAuthSelector(Value, 3) == 0;
      v10 = __WiFiNetworkContainsAuthSelector(Value, 4) == 0;
      v11 = __WiFiNetworkContainsAuthSelector(Value, 5) == 0;
      v12 = __WiFiNetworkContainsAuthSelector(Value, 6) == 0;
      v13 = __WiFiNetworkContainsAuthSelector(Value, 8) == 0;
      v14 = __WiFiNetworkContainsAuthSelector(Value, 9) == 0;
      v15 = __WiFiNetworkContainsAuthSelector(Value, 24) == 0;
      v16 = __WiFiNetworkContainsAuthSelector(Value, 25) == 0;
      v17 = __WiFiNetworkContainsAuthSelector(Value, 12) == 0;
      v18 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v34), 0x1FuLL)), v35, vorr_s8(v35, (int8x8_t)0x400000080));
      v19 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v10), 0x1FuLL)), v18, vorr_s8(v18, (int8x8_t)0x800000010));
      v20 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v11), 0x1FuLL)), v19, vorr_s8(v19, (int8x8_t)0x1000000800));
      v21 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v12), 0x1FuLL)), v20, vorr_s8(v20, (int8x8_t)0x2000000400));
      v22 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v13), 0x1FuLL)), v21, vorr_s8(v21, (int8x8_t)0x8000001000));
      v23 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v14), 0x1FuLL)), v22, vorr_s8(v22, (int8x8_t)0x10000002000));
      v24 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v15), 0x1FuLL)), v23, vorr_s8(v23, (int8x8_t)0x80000000010000));
      v25 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v16), 0x1FuLL)), v24, vorr_s8(v24, (int8x8_t)0x100000000020000));
      v26 = vbsl_s8((int8x8_t)vcltz_s32(vshl_n_s32(vdup_n_s32(v17), 0x1FuLL)), v25, vorr_s8(v25, (int8x8_t)0x80000004000));
      v27 = __WiFiNetworkContainsAuthSelector(Value, 13);
      v28.i32[0] = 0;
      v29.i32[0] = v27;
      v30 = vbsl_s8(vdup_lane_s8(vceq_s8(v29, v28), 0), v26, vorr_s8(v26, (int8x8_t)0x100000008000));
    }
    else
    {
      v30 = 0;
    }
    v32 = v30.u32[0];
    v31 = v30.i32[1];
    if (v6)
    {
      if (__WiFiNetworkContainsAuthSelector(v6, 2))
        LODWORD(v32) = v32 | 2;
      v32 = v32 | __WiFiNetworkContainsAuthSelector(v6, 1);
    }
  }
  else
  {
    v31 = 0;
    v32 = 0xFFFFLL;
  }
  if (a2)
    *a2 = v31;
  return v32;
}

uint64_t __WiFiNetworkContainsAuthSelector(const __CFDictionary *a1, int a2)
{
  const __CFArray *Value;
  uint64_t result;
  CFIndex Count;
  CFIndex v7;
  CFIndex v8;
  const __CFNumber *ValueAtIndex;
  int valuePtr;

  Value = (const __CFArray *)CFDictionaryGetValue(a1, CFSTR("IE_KEY_RSN_AUTHSELS"));
  if (Value
    || (result = (uint64_t)CFDictionaryGetValue(a1, CFSTR("IE_KEY_WPA_AUTHSELS")),
        (Value = (const __CFArray *)result) != 0))
  {
    Count = CFArrayGetCount(Value);
    if (Count < 1)
    {
      return 0;
    }
    else
    {
      v7 = Count;
      v8 = 0;
      while (1)
      {
        valuePtr = -1431655766;
        ValueAtIndex = (const __CFNumber *)CFArrayGetValueAtIndex(Value, v8);
        if (CFNumberGetValue(ValueAtIndex, kCFNumberSInt32Type, &valuePtr))
        {
          if (valuePtr == a2)
            break;
        }
        if (v7 == ++v8)
          return 0;
      }
      return 1;
    }
  }
  return result;
}

uint64_t WiFiNetworkIsProblematicForEncryptedDNS(const void *a1)
{
  unint64_t v2;
  char *v3;
  NSObject *v4;
  const __CFData *v5;
  const __CFData *v6;
  const void *SSID;
  uint64_t v8;
  UInt8 buffer[8];
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const void *v14;
  __int16 v15;
  const __CFData *v16;
  uint64_t v17;
  CFRange v18;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  v2 = 0;
  v3 = &byte_1B9BCEEB0;
  v4 = MEMORY[0x1E0C81028];
  do
  {
    v5 = WiFiNetworkCopyBSSIDData((uint64_t)a1);
    if (v5)
    {
      v6 = v5;
      memset(buffer, 170, 6);
      v18.location = 0;
      v18.length = 6;
      CFDataGetBytes(v5, v18, buffer);
      if (buffer[0] == *(v3 - 2)
        && buffer[1] == *(v3 - 1)
        && buffer[2] == *v3)
      {
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          SSID = WiFiNetworkGetSSID(a1);
          *(_DWORD *)buf = 136315650;
          v12 = "WiFiNetworkIsProblematicForEncryptedDNS";
          v13 = 2112;
          v14 = SSID;
          v15 = 2112;
          v16 = v6;
          _os_log_impl(&dword_1B9B9D000, v4, OS_LOG_TYPE_DEFAULT, "%s: network %@ (%@) is known to be problematic for DoT/DoH", buf, 0x20u);
        }
        v8 = 1;
      }
      else
      {
        v8 = 0;
      }
      CFRelease(v6);
    }
    else
    {
      v8 = 0;
    }
    if (v2 > 1)
      break;
    ++v2;
    v3 += 3;
  }
  while (!(_DWORD)v8);
  return v8;
}

void WiFiNetworkAddSIMIdentifier(uint64_t a1, const void *a2)
{
  const __CFArray *Property;
  const __CFAllocator *v5;
  const __CFArray *MutableCopy;
  __CFArray *v7;
  CFRange v8;

  if (a1 && a2)
  {
    Property = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("SIMIdentifiers"));
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (Property)
      MutableCopy = CFArrayCreateMutableCopy(v5, 0, Property);
    else
      MutableCopy = CFArrayCreateMutable(v5, 0, MEMORY[0x1E0C9B378]);
    v7 = MutableCopy;
    v8.length = CFArrayGetCount(MutableCopy);
    v8.location = 0;
    if (CFArrayGetFirstIndexOfValue(v7, v8, a2) == -1)
      CFArrayAppendValue(v7, a2);
    WiFiNetworkSetProperty(a1, CFSTR("SIMIdentifiers"), v7);
    if (v7)
      CFRelease(v7);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void WiFiNetworkRemoveSIMIdentifier(uint64_t a1, const void *a2)
{
  const __CFArray *Property;
  const __CFAllocator *v5;
  const __CFArray *MutableCopy;
  const __CFArray *v7;
  CFIndex FirstIndexOfValue;
  const __CFArray *v9;
  CFRange v10;

  if (a1 && a2)
  {
    Property = (const __CFArray *)WiFiNetworkGetProperty(a1, CFSTR("SIMIdentifiers"));
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (Property)
      MutableCopy = CFArrayCreateMutableCopy(v5, 0, Property);
    else
      MutableCopy = CFArrayCreateMutable(v5, 0, MEMORY[0x1E0C9B378]);
    v7 = MutableCopy;
    v10.length = CFArrayGetCount(MutableCopy);
    v10.location = 0;
    FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v7, v10, a2);
    if (FirstIndexOfValue != -1)
      CFArrayRemoveValueAtIndex(v7, FirstIndexOfValue);
    if (CFArrayGetCount(v7))
      v9 = v7;
    else
      v9 = 0;
    WiFiNetworkSetProperty(a1, CFSTR("SIMIdentifiers"), v9);
    if (v7)
      CFRelease(v7);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void WiFiNetworkSetUserPreferredNetwork(uint64_t a1, CFDictionaryRef *a2, const void *a3)
{
  const void *HS20DomainName;
  const void *v7;
  const __CFDictionary *Property;
  const __CFAllocator *v9;
  __CFDictionary *v10;
  const void *SSID;
  const void *v12;
  const __CFDictionary *v13;
  const __CFAllocator *v14;
  __CFDictionary *v15;
  const __CFDictionary *v16;
  CFIndex Count;
  __CFString *v18;
  uint64_t v19;
  const __CFDictionary *v20;
  CFIndex v21;

  if (a1 && a2)
  {
    if (CFDictionaryGetValue(a2[2], CFSTR("DomainName")))
    {
      HS20DomainName = WiFiNetworkGetHS20DomainName((uint64_t)a2);
      if (HS20DomainName)
      {
        v7 = HS20DomainName;
        Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("userPreferredPasspointDomains"));
        v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v10 = Property
            ? CFDictionaryCreateMutableCopy(v9, 0, Property)
            : CFDictionaryCreateMutable(v9, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v16 = v10;
        if (v10)
        {
          if (a3)
            CFDictionaryAddValue(v10, v7, a3);
          else
            CFDictionaryRemoveValue(v10, v7);
          Count = CFDictionaryGetCount(v16);
          v18 = CFSTR("userPreferredPasspointDomains");
          if (Count)
          {
LABEL_16:
            v19 = a1;
            v20 = v16;
LABEL_25:
            WiFiNetworkSetProperty(v19, v18, v20);
            CFRelease(v16);
            return;
          }
LABEL_24:
          v19 = a1;
          v20 = 0;
          goto LABEL_25;
        }
      }
    }
    else
    {
      SSID = WiFiNetworkGetSSID(a2);
      if (SSID)
      {
        v12 = SSID;
        v13 = (const __CFDictionary *)WiFiNetworkGetProperty(a1, CFSTR("userPreferredNetworkNames"));
        v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v15 = v13
            ? CFDictionaryCreateMutableCopy(v14, 0, v13)
            : CFDictionaryCreateMutable(v14, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        v16 = v15;
        if (v15)
        {
          if (a3)
            CFDictionarySetValue(v15, v12, a3);
          else
            CFDictionaryRemoveValue(v15, v12);
          v21 = CFDictionaryGetCount(v16);
          v18 = CFSTR("userPreferredNetworkNames");
          if (v21)
            goto LABEL_16;
          goto LABEL_24;
        }
      }
    }
  }
}

const void *WiFiNetworkGetUserPreferredTimestamp(uint64_t a1, CFDictionaryRef *a2)
{
  const void *HS20DomainName;
  const void *v5;
  __CFString *v6;
  const void *SSID;
  const __CFDictionary *Property;

  if (!a1 || !a2)
    return 0;
  if (CFDictionaryGetValue(a2[2], CFSTR("DomainName")))
  {
    HS20DomainName = WiFiNetworkGetHS20DomainName((uint64_t)a2);
    if (!HS20DomainName)
      return 0;
    v5 = HS20DomainName;
    v6 = CFSTR("userPreferredPasspointDomains");
  }
  else
  {
    SSID = WiFiNetworkGetSSID(a2);
    if (!SSID)
      return 0;
    v5 = SSID;
    v6 = CFSTR("userPreferredNetworkNames");
  }
  Property = (const __CFDictionary *)WiFiNetworkGetProperty(a1, v6);
  if (Property)
    return CFDictionaryGetValue(Property, v5);
  return 0;
}

void WiFiNetworkSetPrivacyProxyEnabled(uint64_t a1, int a2)
{
  const void **v2;

  if (a1)
  {
    v2 = (const void **)MEMORY[0x1E0C9AE50];
    if (!a2)
      v2 = (const void **)MEMORY[0x1E0C9AE40];
    WiFiNetworkSetProperty(a1, CFSTR("PrivacyProxyEnabled"), *v2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void WiFiNetworkSetPrivacyProxyBlockedReason(uint64_t a1, const void *a2)
{
  if (a1)
    WiFiNetworkSetProperty(a1, CFSTR("PrivacyProxyBlockedReason"), a2);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

BOOL WiFiNetworkIsPriorityNetwork(uint64_t a1)
{
  const __CFAllocator *v2;
  CFAbsoluteTime Current;
  const __CFDate *v4;
  const __CFDate *Property;
  double TimeIntervalSinceDate;
  _BOOL8 v7;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Current = CFAbsoluteTimeGetCurrent();
  v4 = CFDateCreate(v2, Current);
  Property = (const __CFDate *)WiFiNetworkGetProperty(a1, CFSTR("lastJoined"));
  TimeIntervalSinceDate = CFDateGetTimeIntervalSinceDate(v4, Property);
  if (WiFiNetworkGetNetworkOfInterestWorkType(a1) == 1
    || WiFiNetworkGetNetworkOfInterestHomeType(a1) == 1
    || (!MEMORY[0x1E0D0D1B8]
     || CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), (const void *)*MEMORY[0x1E0D0D290]) != (const void *)*MEMORY[0x1E0C9AE50])
    && !WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkAttributeIsPublic"))
    && !WiFiNetworkIsCarrierBundleBased(a1))
  {
    v7 = 1;
    if (!v4)
      return v7;
LABEL_4:
    CFRelease(v4);
    return v7;
  }
  v7 = TimeIntervalSinceDate < 86400.0 && TimeIntervalSinceDate > -1.0;
  if (v4)
    goto LABEL_4;
  return v7;
}

BOOL WiFiNetworkIsPriorityNetworkWrapper(uint64_t a1)
{
  return !_os_feature_enabled_impl() || WiFiNetworkIsPriorityNetwork(a1);
}

uint64_t WiFiNetworkIsPublicNetwork(CFDictionaryRef *a1)
{
  uint64_t result;

  if (WiFiNetworkGetProperty((uint64_t)a1, CFSTR("WiFiNetworkAttributeIsPublic")))
    return 1;
  result = (uint64_t)WiFiNetworkInterworkingIsOutdoorNetwork(a1);
  if ((_DWORD)result)
    return 1;
  return result;
}

BOOL WiFiNetworkIsLowQualityNetwork(uint64_t a1)
{
  return WiFiNetworkGetProperty(a1, CFSTR("WiFiNetworkAttributeIsLowQuality")) != 0;
}

void WiFiNetworkSetPublicAirPlayNetwork(uint64_t a1, int a2)
{
  const void **v2;

  if (a1)
  {
    v2 = (const void **)MEMORY[0x1E0C9AE50];
    if (!a2)
      v2 = (const void **)MEMORY[0x1E0C9AE40];
    WiFiNetworkSetProperty(a1, CFSTR("PublicAirPlayNetwork"), *v2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  }
}

void *WiFiNetworkIs6EModeOff(uint64_t a1)
{
  void *result;

  if (a1)
  {
    result = (void *)WiFiNetworkGetProperty(a1, (void *)*MEMORY[0x1E0D1B9E8]);
    if (result)
      return (void *)(objc_msgSend((id)objc_msgSend(result, "objectForKey:", *MEMORY[0x1E0D1BA18]), "integerValue") == 2);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return result;
}

void WiFiNetworkSetDisplayFriendlyName(uint64_t a1, const void *a2)
{
  if (a1)
    WiFiNetworkSetProperty(a1, CFSTR("DisplayFriendlyName"), a2);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

const void *WiFiNetworkGetDisplayFriendlyName(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("DisplayFriendlyName"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

void WiFiNetworkSetAccessoryIdentifier(uint64_t a1, const void *a2)
{
  if (a1)
    WiFiNetworkSetProperty(a1, CFSTR("AccessoryIdentifier"), a2);
  else
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
}

const void *WiFiNetworkGetAccessoryIdentifier(uint64_t a1)
{
  if (a1)
    return WiFiNetworkGetProperty(a1, CFSTR("AccessoryIdentifier"));
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return 0;
}

BOOL WiFiNetworkSupportsSlowWiFiRecovery(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) == 0;
}

BOOL WiFiNetworkSupportsDPSRecovery(uint64_t a1)
{
  return WiFiNetworkGetAccessoryIdentifier(a1) == 0;
}

BOOL __WiFiNetworkEqual(_QWORD *a1, _QWORD *a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  CFTypeID v5;
  uint64_t v6;
  const void *v7;
  CFTypeID v8;
  uint64_t v9;
  const void *v10;
  CFTypeID TypeID;
  uint64_t v12;
  CFTypeID v13;
  uint64_t v14;
  int v15;
  const __CFNumber *Property;
  unsigned int IntValue;
  const __CFNumber *v18;
  unsigned int v19;
  BOOL v20;
  const __CFString *SSID;
  const __CFString *v22;
  int v24;
  unint64_t Value;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  int v29;
  int v30;
  unint64_t v31;
  _BOOL4 v32;
  int OperatingBand;
  const void *v34;
  int v35;
  int v36;
  int v37;
  int v38;
  _BOOL4 v39;
  int v40;
  _BOOL4 v41;
  int v42;
  int AuthFlags;
  unsigned int v44;
  unsigned int v45;

  v2 = 0;
  if (a1)
  {
    v3 = a2;
    if (a2)
    {
      v4 = a1;
      v5 = CFGetTypeID(a1);
      v6 = __kWiFiNetworkTypeID;
      if (!__kWiFiNetworkTypeID)
      {
        pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
        v6 = __kWiFiNetworkTypeID;
      }
      if (v5 == v6)
        v7 = v4;
      else
        v7 = 0;
      v8 = CFGetTypeID(v3);
      v9 = __kWiFiNetworkTypeID;
      if (!__kWiFiNetworkTypeID)
      {
        pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
        v9 = __kWiFiNetworkTypeID;
      }
      if (v8 == v9)
        v10 = v3;
      else
        v10 = 0;
      TypeID = CFDictionaryGetTypeID();
      if (TypeID != CFGetTypeID(v4))
      {
        v12 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          v12 = __kWiFiNetworkTypeID;
        }
        if (v12 == CFGetTypeID(v4))
          v4 = (_QWORD *)v4[2];
        else
          v4 = 0;
      }
      v13 = CFDictionaryGetTypeID();
      if (v13 != CFGetTypeID(v3))
      {
        v14 = __kWiFiNetworkTypeID;
        if (!__kWiFiNetworkTypeID)
        {
          pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
          v14 = __kWiFiNetworkTypeID;
        }
        if (v14 != CFGetTypeID(v3))
          return 0;
        v3 = (_QWORD *)v3[2];
      }
      v2 = 0;
      if (v4)
      {
        if (v3)
        {
          if (__WiFiCompareSSIDorBSSID(v4, (const __CFDictionary *)v3))
          {
            if (WiFiNetworkIsHotspot20((_BOOL8)v7) && !WiFiNetworkIsHotspot20((_BOOL8)v10)
              || !WiFiNetworkIsHotspot20((_BOOL8)v7) && WiFiNetworkIsHotspot20((_BOOL8)v10))
            {
              objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
              return 0;
            }
            if (!__WiFiCompareBGScanParams((const __CFDictionary *)v4, (const __CFDictionary *)v3)
              || !__WiFiCompareDictionaryValues(v4, (const __CFDictionary *)v3, CFSTR("AP_MODE")))
            {
              return 0;
            }
            AuthFlags = __WiFiNetworkGetAuthFlags((const __CFDictionary *)v4);
            v42 = __WiFiNetworkGetAuthFlags((const __CFDictionary *)v3);
            v15 = __WiFiNetworkIsSAE((const __CFDictionary *)v4)
               && !__WiFiNetworkSupportsWPA((const __CFDictionary *)v4)
               && __WiFiNetworkSupportsWPA2((const __CFDictionary *)v4) == 0;
            v24 = __WiFiNetworkIsSAE((const __CFDictionary *)v3)
               && !__WiFiNetworkSupportsWPA((const __CFDictionary *)v3)
               && __WiFiNetworkSupportsWPA2((const __CFDictionary *)v3) == 0;
            v44 = __WiFiNetworkIsOWEOnly((const __CFDictionary *)v4);
            v45 = __WiFiNetworkIsOWEOnly((const __CFDictionary *)v3);
            Value = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v4, CFSTR("ALLOW_WPA2_PSK"));
            v26 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v3, CFSTR("ALLOW_WPA2_PSK"));
            v27 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v4, CFSTR("ALLOW_OWE_TSN"));
            v28 = (unint64_t)CFDictionaryGetValue((CFDictionaryRef)v3, CFSTR("ALLOW_OWE_TSN"));
            v29 = (Value | v27) == 0;
            v30 = (v26 | v28) == 0;
            if (v29 != v30)
            {
              v31 = v28;
              if (v15)
                v32 = WiFiNetworkGetOperatingBand((uint64_t)v7) != 3;
              else
                v32 = 0;
              if ((v24 & 1) != 0)
              {
                v41 = v32;
                OperatingBand = WiFiNetworkGetOperatingBand((uint64_t)v10);
                v20 = Value == *MEMORY[0x1E0C9AE50];
                v34 = (const void *)*MEMORY[0x1E0C9AE50];
                if (v20)
                {
                  v32 = v41;
                  if (OperatingBand != 3)
                    return 0;
                }
                else
                {
                  v32 = v41;
                }
              }
              else
              {
                v34 = (const void *)*MEMORY[0x1E0C9AE50];
              }
              if ((const void *)v26 == v34 && v32)
                return 0;
              if ((v29 & v15) == 1)
              {
                v35 = WiFiNetworkGetOperatingBand((uint64_t)v7);
                v36 = AuthFlags;
                if (v35 == 3)
                  v36 = AuthFlags | 2;
                AuthFlags = v36;
              }
              if ((v30 & v24) == 1)
              {
                v37 = WiFiNetworkGetOperatingBand((uint64_t)v10);
                v38 = v42;
                if (v37 == 3)
                  v38 = v42 | 2;
                v42 = v38;
              }
              v39 = v44 && WiFiNetworkGetOperatingBand((uint64_t)v7) != 3;
              if (v45)
              {
                v40 = WiFiNetworkGetOperatingBand((uint64_t)v10);
                if ((const void *)v27 == v34 && v40 != 3)
                  return 0;
              }
              if ((const void *)v31 == v34 && v39)
                return 0;
LABEL_59:
              if (!AuthFlags || !v42 || (v42 & AuthFlags) != 0)
                return (AuthFlags == 0) ^ (v42 != 0);
              return 0;
            }
            v2 = 0;
            if (v15 == v24 && v44 == v45)
              goto LABEL_59;
          }
          else
          {
            Property = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v7, CFSTR("networkRole"));
            IntValue = _CFTypeGetIntValue(Property);
            v18 = (const __CFNumber *)WiFiNetworkGetProperty((uint64_t)v10, CFSTR("networkRole"));
            v19 = _CFTypeGetIntValue(v18);
            v20 = (IntValue & 0xFFFFFFFE) == 2 || IntValue == 4;
            if (v20 || v19 - 2 <= 2)
            {
              return IntValue == v19;
            }
            else
            {
              v2 = 1;
              if (!__WiFiIsSameHS20Account(v7, v10, 1))
              {
                SSID = (const __CFString *)WiFiNetworkGetSSID(v7);
                if (CFStringGetLength(SSID))
                  return 0;
                v22 = (const __CFString *)WiFiNetworkGetSSID(v10);
                if (CFStringGetLength(v22))
                  return 0;
                return __WiFiHS20NetworksHaveSameDomain((uint64_t)v7, (uint64_t)v10) != 0;
              }
            }
          }
        }
      }
    }
  }
  return v2;
}

CFHashCode __WiFiNetworkHash(const void *a1)
{
  const void *SSID;

  if (a1 && (SSID = WiFiNetworkGetSSID(a1)) != 0)
    return CFHash(SSID);
  else
    return 0;
}

CFStringRef __WiFiNetworkCopyDesc(const __CFDictionary **cf)
{
  uint64_t v2;
  uint64_t v3;
  const __CFNumber *Channel;
  const void *v5;
  const void *v6;
  unsigned int NetworkOfInterestHomeType;
  const __CFString *v8;
  const __CFString *v9;
  unsigned int ForcedHomeFix;
  const void *v11;
  unsigned int v12;
  unsigned int IsApplePersonalHotspot;
  unsigned int IsPublicAirPlayNetwork;
  unsigned int v15;
  _BOOL4 IsHotspot20;
  const void *v18;
  const void *Property;
  uint64_t Type;
  const __CFNumber *WAPIPolicy;
  _BOOL8 v22;
  _BOOL8 v23;
  unsigned int v24;
  _BOOL4 IsEAP;
  unsigned int DirectedState;
  const void *SSID;
  const __CFAllocator *v28;
  _DWORD valuePtr[3];

  valuePtr[0] = 0;
  if (!cf)
    return CFSTR("Invalid network ref");
  v2 = __kWiFiNetworkTypeID;
  if (!__kWiFiNetworkTypeID)
  {
    pthread_once(&__wifiNetworkTypeInit, (void (*)(void))__WiFiNetworkRegister);
    v2 = __kWiFiNetworkTypeID;
  }
  if (v2 != CFGetTypeID(cf))
    return CFSTR("Invalid network ref");
  Channel = (const __CFNumber *)WiFiNetworkGetChannel((uint64_t)cf, v3);
  if (Channel)
    CFNumberGetValue(Channel, kCFNumberSInt32Type, valuePtr);
  v28 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  SSID = WiFiNetworkGetSSID(cf);
  DirectedState = WiFiNetworkGetDirectedState(cf);
  IsEAP = WiFiNetworkIsEAP((uint64_t)cf);
  v24 = __WiFiNetworkIsSAE(cf[2]);
  v23 = WiFiNetworkIsWPAWPA2PSK((uint64_t)cf) != 0;
  v22 = CFDictionaryGetValue(cf[2], CFSTR("WEP")) == (const void *)*MEMORY[0x1E0C9AE50];
  WAPIPolicy = __WiFiNetworkGetWAPIPolicy(cf[2]);
  Type = WiFiNetworkGetType((uint64_t)cf);
  Property = WiFiNetworkGetProperty((uint64_t)cf, CFSTR("enabled"));
  v18 = WiFiNetworkGetProperty((uint64_t)cf, CFSTR("SaveDataMode"));
  v5 = WiFiNetworkGetProperty((uint64_t)cf, CFSTR("NetworkQualityResponsiveness"));
  v6 = WiFiNetworkGetProperty((uint64_t)cf, CFSTR("NetworkQualityDate"));
  NetworkOfInterestHomeType = WiFiNetworkGetNetworkOfInterestHomeType((uint64_t)cf);
  v8 = CFSTR("Unknown");
  if (NetworkOfInterestHomeType == 1)
    v8 = CFSTR("Home");
  if (NetworkOfInterestHomeType == 2)
    v9 = CFSTR("Not Home");
  else
    v9 = v8;
  ForcedHomeFix = WiFiNetworkGetForcedHomeFix((uint64_t)cf);
  v11 = WiFiNetworkGetProperty((uint64_t)cf, CFSTR("TransitionDisabledFlags"));
  v12 = WiFiNetworkFoundNanIe((uint64_t)cf);
  IsApplePersonalHotspot = WiFiNetworkIsApplePersonalHotspot((uint64_t)cf);
  IsPublicAirPlayNetwork = WiFiNetworkIsPublicAirPlayNetwork((uint64_t)cf);
  v15 = WiFiNetworkIs6EModeOff((uint64_t)cf);
  IsHotspot20 = WiFiNetworkIsHotspot20((_BOOL8)cf);
  return CFStringCreateWithFormat(v28, 0, CFSTR("%@: isHidden=%d, isEAP=%d, isSAE=%d, isWPA=%d, isWEP=%d, WAPI=%d, type=%d, enabled=%@, saveData=%@, responsiveness=%@ (%@) isHome=%@, isForceFixed=%d, transitionDisabledFlags=%@, foundNanIe=%d, isPH=%d, isPublicAirPlayNetwork=%d, is6EDisabled=%d, hs20=%d, Channel=%d"), SSID, DirectedState, IsEAP, v24, v23, v22, WAPIPolicy, Type, Property, v18, v5, v6, v9, ForcedHomeFix, v11, v12,
           IsApplePersonalHotspot,
           IsPublicAirPlayNetwork,
           v15,
           IsHotspot20,
           valuePtr[0]);
}

uint64_t __WiFiIsSameHS20Account(const void *a1, const void *a2, int a3)
{
  uint64_t v3;
  const __CFString *SSID;
  const __CFString *v8;
  const __CFString *Property;
  const __CFString *v10;
  const __CFString *HS20DomainName;
  const __CFString *v12;

  v3 = 0;
  if (a1 && a2)
  {
    if (WiFiNetworkIsHotspot20((_BOOL8)a1) && WiFiNetworkIsHotspot20((_BOOL8)a2))
    {
      SSID = (const __CFString *)WiFiNetworkGetSSID(a1);
      v8 = (const __CFString *)WiFiNetworkGetSSID(a2);
      Property = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a1, CFSTR("HS20AccountName"));
      v10 = (const __CFString *)WiFiNetworkGetProperty((uint64_t)a2, CFSTR("HS20AccountName"));
      HS20DomainName = (const __CFString *)WiFiNetworkGetHS20DomainName((uint64_t)a1);
      v12 = (const __CFString *)WiFiNetworkGetHS20DomainName((uint64_t)a2);
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      if (SSID && v10 && CFStringCompare(SSID, v10, 0) == kCFCompareEqualTo
        || v8 && Property && CFStringCompare(v8, Property, 0) == kCFCompareEqualTo)
      {
        return 1;
      }
      if (Property && v10 && HS20DomainName && v12 && CFStringCompare(HS20DomainName, v12, 0) == kCFCompareEqualTo)
        goto LABEL_19;
      if (!a3)
      {
        v3 = 0;
        goto LABEL_23;
      }
      if (WiFiNetworkIsScannedNetworkMatchingHS20Account((uint64_t)a1, (uint64_t)a2)
        || WiFiNetworkIsScannedNetworkMatchingHS20Account((uint64_t)a2, (uint64_t)a1))
      {
LABEL_19:
        v3 = 1;
LABEL_23:
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        return v3;
      }
    }
    return 0;
  }
  return v3;
}

uint64_t __WiFiCompareBGScanParams(const __CFDictionary *a1, const __CFDictionary *a2)
{
  const void *v4;
  uint64_t result;

  if (CFDictionaryGetValue(a1, CFSTR("forceBGScanParamsCompare")) != (const void *)*MEMORY[0x1E0C9AE50])
  {
    v4 = (const void *)*MEMORY[0x1E0C9AE50];
    if (CFDictionaryGetValue(a2, CFSTR("forceBGScanParamsCompare")) != v4)
      return 1;
  }
  result = __WiFiCompareDictionaryValues(a1, a2, CFSTR("BSSID"));
  if ((_DWORD)result)
  {
    result = __WiFiCompareDictionaryValues(a1, a2, CFSTR("ENTRY_NETWORK"));
    if ((_DWORD)result)
      return __WiFiCompareDictionaryValues(a1, a2, CFSTR("EXIT_NETWORK"));
  }
  return result;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getCWFNetworkProfileClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreWiFiLibrary();
  result = objc_getClass("CWFNetworkProfile");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getCWFNetworkProfileClass_block_invoke_cold_1();
  getCWFNetworkProfileClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t CoreWiFiLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreWiFiLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E713B970;
    v3 = 0;
    CoreWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreWiFiLibraryCore_frameworkLibrary)
    CoreWiFiLibrary_cold_1(&v1);
  return CoreWiFiLibraryCore_frameworkLibrary;
}

Class __getCWFBSSClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreWiFiLibrary();
  result = objc_getClass("CWFBSS");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getCWFBSSClass_block_invoke_cold_1();
  getCWFBSSClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getCWFChannelClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreWiFiLibrary();
  result = objc_getClass("CWFChannel");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getCWFChannelClass_block_invoke_cold_1();
  getCWFChannelClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

Class __getCLLocationClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreLocationLibrary();
  result = objc_getClass("CLLocation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getCLLocationClass_block_invoke_cold_1();
  getCLLocationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t CoreLocationLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = 0;
  if (!CoreLocationLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_1E713B988;
    v3 = 0;
    CoreLocationLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreLocationLibraryCore_frameworkLibrary)
    CoreLocationLibrary_cold_1(&v1);
  return CoreLocationLibraryCore_frameworkLibrary;
}

Class __getCWFScanResultClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreWiFiLibrary();
  result = objc_getClass("CWFScanResult");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getCWFScanResultClass_block_invoke_cold_1();
  getCWFScanResultClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t WiFiSecurityCopyPasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  NSObject *v6;
  NSObject *global_queue;
  dispatch_time_t v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
    else
    {
      v6 = dispatch_semaphore_create(0);
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 0;
      CFRetain(a1);
      global_queue = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __WiFiSecurityCopyPasswordWithTimeout_block_invoke;
      v13[3] = &unk_1E713B9A8;
      v13[6] = &v14;
      v13[7] = a1;
      v13[4] = v6;
      v13[5] = &v18;
      dispatch_async(global_queue, v13);
      v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      v9 = dispatch_semaphore_wait(v6, v8) != 0;
      v10 = v15;
      *((_BYTE *)v15 + 24) = v9;
      *a2 = v9;
      if (*((_BYTE *)v10 + 24))
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      dispatch_release(v6);
      _Block_object_dispose(&v14, 8);
    }
  }
  v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_1B9BBC178(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

__CFDictionary *__WiFiSecurityCreateQuery(const void *a1, const void *a2, const void *a3, int a4, int a5, int a6)
{
  __CFDictionary *Mutable;
  __CFDictionary *v13;
  const void **v14;

  if (a1)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
    v13 = Mutable;
    if (Mutable)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD68F8], a1);
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("AirPort"));
      CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0CD6B88]);
      if (a2)
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD6A90], a2);
      if (a3)
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD69A0], a3);
      v14 = (const void **)MEMORY[0x1E0C9AE50];
      if (a6)
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD70C0], (const void *)*MEMORY[0x1E0C9AE50]);
      if (!a4)
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD7018], *v14);
      if (a5)
        CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD7010], *v14);
    }
    else
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return v13;
}

CFStringRef WiFiSecurityCopyPassword(__CFString *a1)
{
  CFStringRef result;
  const char *v3;
  const char *v4;
  const char *v5;

  result = __WiFiSecurityCopyPassword(a1, 1);
  if (!result)
  {
    v3 = getprogname();
    if (!strncmp("sharingd", v3, 8uLL))
      return WiFiSecurityCopyPasswordFromPasswordBackup(a1);
    v4 = getprogname();
    if (!strncmp("HPSetup", v4, 7uLL))
      return WiFiSecurityCopyPasswordFromPasswordBackup(a1);
    v5 = getprogname();
    if (!strncmp("HDSViewService", v5, 0xEuLL))
      return WiFiSecurityCopyPasswordFromPasswordBackup(a1);
    else
      return 0;
  }
  return result;
}

CFStringRef __WiFiSecurityCopyPassword(const __CFString *a1, int a2)
{
  CFStringRef v2;
  __CFDictionary *Query;
  __CFDictionary *v5;
  CFTypeRef result;

  v2 = a1;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      return 0;
    }
    else
    {
      Query = __WiFiSecurityCreateQuery(v2, 0, 0, 0, 0, a2);
      v5 = Query;
      result = 0;
      if (Query && !SecItemCopyMatching(Query, &result) && result)
      {
        v2 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDataRef)result, 0x8000100u);
      }
      else
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        v2 = 0;
      }
      if (result)
      {
        CFRelease(result);
        result = 0;
      }
      if (v5)
        CFRelease(v5);
    }
  }
  return v2;
}

CFStringRef WiFiSecurityCopyPasswordFromPasswordBackup(void *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  OSStatus v6;
  CFStringRef v7;
  NSObject *v8;
  const char *v9;
  uint32_t v10;
  NSObject *v12;
  const char *v13;
  CFTypeRef result;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCCB058]();
  result = 0;
  if (a1)
  {
    if (objc_msgSend(a1, "length"))
    {
      v3 = WiFiSecurityCopySSIDHashForPasswordBackup(a1);
      v4 = v3;
      if (v3 && objc_msgSend(v3, "length"))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136315650;
          v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
          v17 = 2112;
          v18 = a1;
          v19 = 2112;
          v20 = v4;
          _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: ssid %@ (%@)", buf, 0x20u);
        }
        v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        objc_msgSend(v5, "setObject:forKey:", *MEMORY[0x1E0CD6CA8], *MEMORY[0x1E0CD6C98]);
        objc_msgSend(v5, "setObject:forKey:", v4, *MEMORY[0x1E0CD68F8]);
        objc_msgSend(v5, "setObject:forKey:", CFSTR("AirPort"), *MEMORY[0x1E0CD6B58]);
        objc_msgSend(v5, "setObject:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CD7018]);
        v6 = SecItemCopyMatching((CFDictionaryRef)v5, &result);
        if (!v6 && result)
        {
          v7 = CFStringCreateFromExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (CFDataRef)result, 0x8000100u);
          goto LABEL_14;
        }
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        *(_DWORD *)buf = 136315650;
        v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
        v17 = 2112;
        v18 = v4;
        v19 = 1024;
        LODWORD(v20) = v6;
        v8 = MEMORY[0x1E0C81028];
        v9 = "%s:[%@] error result %d \n";
        v10 = 28;
      }
      else
      {
        if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
          goto LABEL_13;
        *(_DWORD *)buf = 136315138;
        v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
        v8 = MEMORY[0x1E0C81028];
        v9 = "%s: error: empty ssid hash";
        v10 = 12;
      }
      _os_log_impl(&dword_1B9B9D000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, v10);
LABEL_13:
      v7 = 0;
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
      v12 = MEMORY[0x1E0C81028];
      v13 = "%s: error: empty ssid";
      goto LABEL_23;
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v16 = "WiFiSecurityCopyPasswordFromPasswordBackup";
    v12 = MEMORY[0x1E0C81028];
    v13 = "%s: null ssid";
LABEL_23:
    _os_log_impl(&dword_1B9B9D000, v12, OS_LOG_TYPE_DEFAULT, v13, buf, 0xCu);
  }
  v7 = 0;
  v4 = 0;
LABEL_14:

  if (result)
    CFRelease(result);
  objc_autoreleasePoolPop(v2);
  return v7;
}

CFStringRef WiFiSecurityCopyLegacyPassword(const __CFString *a1)
{
  return __WiFiSecurityCopyPassword(a1, 0);
}

CFTypeRef WiFiSecurityCopyPasswordModificationDate(const void *a1)
{
  __CFDictionary *Query;
  __CFDictionary *v3;
  const void *Value;
  CFTypeRef v5;
  CFTypeRef result;

  result = 0;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v5 = 0;
      v3 = 0;
    }
    else
    {
      Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 1, 1);
      v3 = Query;
      if (Query && !SecItemCopyMatching(Query, &result) && result)
      {
        Value = CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E0CD6A98]);
        v5 = CFRetain(Value);
      }
      else
      {
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
        v5 = 0;
      }
    }
    if (result)
    {
      CFRelease(result);
      result = 0;
    }
    if (v3)
      CFRelease(v3);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  return v5;
}

BOOL WiFiSecuritySetPasswordWithTimeout(const void *a1, const __CFString *a2, BOOL *a3, double a4)
{
  const __CFAllocator *v8;
  CFDataRef ExternalRepresentation;
  const __CFString *v10;
  const __CFString *v11;
  BOOL v12;
  _BOOL8 v13;
  __CFDictionary *Query;
  const __CFDictionary *v15;
  __CFDictionary *Mutable;
  uint64_t v17;
  int v18;
  __CFDictionary *v19;
  unint64_t v21;
  BOOL v22;

  v22 = 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (!a1 || !a2 || !CFStringGetLength(a2))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, 0x8000100u, 0);
  v10 = (const __CFString *)WiFiSecurityCopyPasswordWithTimeout(a1, &v22, a4);
  v11 = v10;
  v12 = v22;
  if (v22)
  {
    *a3 = 1;
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v13 = 0;
    if (!v11)
      goto LABEL_21;
LABEL_20:
    CFRelease(v11);
    goto LABEL_21;
  }
  if (v10)
  {
    if (CFStringCompare(a2, v10, 0) == kCFCompareEqualTo)
    {
      *a3 = v12;
      v13 = 1;
      goto LABEL_20;
    }
    Query = __WiFiSecurityCreateQuery(a1, 0, 0, 1, 0, 1);
    if (!Query)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v13 = 0;
      goto LABEL_20;
    }
    v15 = Query;
    Mutable = CFDictionaryCreateMutable(v8, 0, 0, 0);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], ExternalRepresentation);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6A90], a1);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD69A0], CFSTR("AirPort network password"));
    v17 = SecItemUpdate(v15, Mutable);
    v18 = v17;
    if (Mutable)
      CFRelease(Mutable);
  }
  else
  {
    v19 = __WiFiSecurityCreateQuery(a1, a1, CFSTR("AirPort network password"), 1, 0, 1);
    if (!v19)
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v13 = 0;
      if (!ExternalRepresentation)
        return v13;
      goto LABEL_22;
    }
    v15 = v19;
    v21 = 0xAAAAAAAAAAAAAAAALL;
    CFDictionarySetValue(v19, (const void *)*MEMORY[0x1E0CD70D8], ExternalRepresentation);
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68A8]);
    CFDictionarySetValue(v15, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
    v17 = SecItemAdd(v15, (CFTypeRef *)&v21);
    v18 = v17;
  }
  *a3 = v12;
  v13 = v18 == 0;
  if (v18)
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](v17));
  else
    notify_post("com.apple.wifid.WiFiPasswordChanged");
  CFRelease(v15);
  if (v11)
    goto LABEL_20;
LABEL_21:
  if (ExternalRepresentation)
LABEL_22:
    CFRelease(ExternalRepresentation);
  return v13;
}

BOOL WiFiSecuritySetPassword(_BOOL8 a1, const __CFString *a2)
{
  return __WiFiSecuritySetPassword(a1, a2, 1);
}

BOOL __WiFiSecuritySetPassword(_BOOL8 a1, CFStringRef theString, int a3)
{
  _BOOL8 v3;
  const __CFAllocator *v6;
  CFDataRef ExternalRepresentation;
  const __CFString *v8;
  __CFDictionary *Query;
  const __CFDictionary *v10;
  __CFDictionary *Mutable;
  OSStatus v12;
  __CFDictionary *v13;
  CFTypeRef result;

  v3 = a1;
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058](0, theString));
    return v3;
  }
  if (!theString || !CFStringGetLength(theString))
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  ExternalRepresentation = CFStringCreateExternalRepresentation((CFAllocatorRef)*MEMORY[0x1E0C9AE00], theString, 0x8000100u, 0);
  v8 = WiFiSecurityCopyPassword((__CFString *)v3);
  if (v8)
  {
    if (CFStringCompare(theString, v8, 0))
    {
      Query = __WiFiSecurityCreateQuery((const void *)v3, 0, 0, 1, 0, a3);
      if (Query)
      {
        v10 = Query;
        Mutable = CFDictionaryCreateMutable(v6, 0, 0, 0);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], ExternalRepresentation);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6A90], (const void *)v3);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD69A0], CFSTR("AirPort network password"));
        v12 = SecItemUpdate(v10, Mutable);
        if (Mutable)
          CFRelease(Mutable);
        goto LABEL_11;
      }
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      v3 = 0;
    }
    else
    {
      v3 = 1;
    }
LABEL_17:
    CFRelease(v8);
    goto LABEL_18;
  }
  v13 = __WiFiSecurityCreateQuery((const void *)v3, (const void *)v3, CFSTR("AirPort network password"), 1, 0, a3);
  if (!v13)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v3 = 0;
    if (!ExternalRepresentation)
      return v3;
    goto LABEL_19;
  }
  v10 = v13;
  result = (CFTypeRef)0xAAAAAAAAAAAAAAAALL;
  CFDictionarySetValue(v13, (const void *)*MEMORY[0x1E0CD70D8], ExternalRepresentation);
  CFDictionarySetValue(v10, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68A8]);
  CFDictionarySetValue(v10, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0C9AE50]);
  v12 = SecItemAdd(v10, &result);
LABEL_11:
  v3 = v12 == 0;
  if (v12)
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  else
    notify_post("com.apple.wifid.WiFiPasswordChanged");
  CFRelease(v10);
  if (v8)
    goto LABEL_17;
LABEL_18:
  if (ExternalRepresentation)
LABEL_19:
    CFRelease(ExternalRepresentation);
  return v3;
}

BOOL WiFiSecuritySetLegacyPassword(_BOOL8 a1, const __CFString *a2)
{
  return __WiFiSecuritySetPassword(a1, a2, 0);
}

uint64_t WiFiSecurityRemovePassword(const void *a1)
{
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  return __WiFiSecurityRemovePassword(a1, 1);
}

uint64_t __WiFiSecurityRemovePassword(const void *a1, int a2)
{
  __CFDictionary *Query;
  __CFDictionary *v3;
  OSStatus v4;

  if (a1
    && (Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 0, a2)) != 0
    && (v3 = Query, v4 = SecItemDelete(Query), CFRelease(v3), !v4))
  {
    notify_post("com.apple.wifid.WiFiPasswordChanged");
    return 1;
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
}

uint64_t WiFiSecurityRemoveLegacyPassword(const void *a1)
{
  return __WiFiSecurityRemovePassword(a1, 0);
}

uint64_t WiFiSecurityIsPasswordSyncing(const void *a1)
{
  __CFDictionary *Query;
  __CFDictionary *v3;
  const __CFBoolean *Value;
  uint64_t v5;
  CFTypeRef result;

  result = 0;
  if (!a1)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v5 = 0;
    v3 = 0;
    goto LABEL_11;
  }
  Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 1, 1);
  v3 = Query;
  if (!Query || SecItemCopyMatching(Query, &result) || !result)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    goto LABEL_10;
  }
  Value = (const __CFBoolean *)CFDictionaryGetValue((CFDictionaryRef)result, (const void *)*MEMORY[0x1E0CD6B80]);
  if (!Value)
  {
LABEL_10:
    v5 = 0;
    goto LABEL_11;
  }
  v5 = CFBooleanGetValue(Value);
LABEL_11:
  if (result)
  {
    CFRelease(result);
    result = 0;
  }
  if (v3)
    CFRelease(v3);
  return v5;
}

BOOL WiFiSecuritySetPasswordSyncable(__CFString *a1, int a2)
{
  CFStringRef v4;
  CFStringRef v5;
  __CFDictionary *Query;
  __CFDictionary *v7;
  __CFDictionary *Mutable;
  const __CFDictionary *v9;
  const void **v10;
  OSStatus v11;
  _BOOL8 v12;

  if (!a1 || (v4 = WiFiSecurityCopyPassword(a1)) == 0)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
  v5 = v4;
  Query = __WiFiSecurityCreateQuery(a1, 0, 0, 0, 0, 1);
  if (!Query)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    CFRelease(v5);
    return 0;
  }
  v7 = Query;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  if (Mutable)
  {
    v9 = Mutable;
    v10 = (const void **)MEMORY[0x1E0C9AE40];
    if (a2)
      v10 = (const void **)MEMORY[0x1E0C9AE50];
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6B80], *v10);
    CFDictionaryRemoveValue(v7, (const void *)*MEMORY[0x1E0CD7018]);
    v11 = SecItemUpdate(v7, v9);
    v12 = v11 == 0;
    if (v11)
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    CFRelease(v9);
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v12 = 0;
  }
  CFRelease(v5);
  CFRelease(v7);
  return v12;
}

__CFString *WiFiSecurityCopyHashedWPAPassword(const __CFString *a1, const __CFData *a2)
{
  __CFString *Mutable;
  const __CFAllocator *v4;
  const __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  uint64_t i;
  UInt8 bytes[16];
  __int128 v11;
  uint64_t v12;

  Mutable = 0;
  v12 = *MEMORY[0x1E0C80C00];
  if (a1 && a2)
  {
    *(_OWORD *)bytes = 0u;
    v11 = 0u;
    CFStringGetCStringPtr(a1, 0x8000100u);
    CFDataGetBytePtr(a2);
    CFDataGetLength(a2);
    if (Apple80211ParseWPAPassword())
      return 0;
    v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, 32);
    if (!v5)
    {
      return 0;
    }
    else
    {
      v6 = v5;
      BytePtr = CFDataGetBytePtr(v5);
      if (CFDataGetLength(v6) == 32)
      {
        Mutable = CFStringCreateMutable(v4, 64);
        for (i = 0; i != 32; ++i)
          CFStringAppendFormat(Mutable, 0, CFSTR("%02x"), BytePtr[i]);
      }
      else
      {
        Mutable = 0;
      }
      CFRelease(v6);
    }
  }
  return Mutable;
}

CFTypeRef WiFiSecurityCopyAttributesForAllAirPortEntries()
{
  __CFDictionary *Mutable;
  __CFDictionary *v1;
  const void *v2;
  CFTypeRef result;

  result = 0;
  if ((MKBGetDeviceLockState() != 1 || MKBUserUnlockedSinceBoot())
    && (Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0)) != 0)
  {
    v1 = Mutable;
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E0CD6F30], (const void *)*MEMORY[0x1E0CD6F38]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("AirPort"));
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E0CD6B80], (const void *)*MEMORY[0x1E0CD6B88]);
    v2 = (const void *)*MEMORY[0x1E0C9AE50];
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E0CD7010], (const void *)*MEMORY[0x1E0C9AE50]);
    CFDictionarySetValue(v1, (const void *)*MEMORY[0x1E0CD70C0], v2);
    if (SecItemCopyMatching(v1, &result))
    {
      if (result)
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
    CFRelease(v1);
    return result;
  }
  else
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    return 0;
  }
}

CFStringRef WiFiSecurityCopyNonSyncablePassword(const void *a1)
{
  const __CFAllocator *v2;
  __CFDictionary *Mutable;
  __CFDictionary *v4;
  const void *v5;
  BOOL v6;
  CFStringRef v7;
  CFTypeRef result;

  result = 0;
  if (!a1)
    return 0;
  objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
  if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    v4 = 0;
    goto LABEL_13;
  }
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, 0);
  v4 = Mutable;
  if (!Mutable)
  {
LABEL_13:
    v7 = 0;
    goto LABEL_14;
  }
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD68F8], a1);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD6B58], CFSTR("AirPort"));
  v5 = (const void *)*MEMORY[0x1E0C9AE50];
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD70C0], (const void *)*MEMORY[0x1E0C9AE50]);
  CFDictionarySetValue(v4, (const void *)*MEMORY[0x1E0CD7018], v5);
  if (SecItemCopyMatching(v4, &result))
    v6 = 1;
  else
    v6 = result == 0;
  if (v6)
  {
    objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    goto LABEL_13;
  }
  v7 = CFStringCreateFromExternalRepresentation(v2, (CFDataRef)result, 0x8000100u);
LABEL_14:
  if (result)
  {
    CFRelease(result);
    result = 0;
  }
  if (v4)
    CFRelease(v4);
  return v7;
}

uint64_t WiFiSecurityCopyNonSyncablePasswordWithTimeout(const void *a1, BOOL *a2, double a3)
{
  NSObject *v6;
  NSObject *global_queue;
  dispatch_time_t v8;
  BOOL v9;
  uint64_t *v10;
  uint64_t v11;
  _QWORD v13[8];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  if (a1)
  {
    if (MKBGetDeviceLockState() == 1 && !MKBUserUnlockedSinceBoot())
    {
      objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
    }
    else
    {
      v6 = dispatch_semaphore_create(0);
      v14 = 0;
      v15 = &v14;
      v16 = 0x2020000000;
      v17 = 0;
      CFRetain(a1);
      global_queue = dispatch_get_global_queue(0, 0);
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __WiFiSecurityCopyNonSyncablePasswordWithTimeout_block_invoke;
      v13[3] = &unk_1E713B9A8;
      v13[6] = &v14;
      v13[7] = a1;
      v13[4] = v6;
      v13[5] = &v18;
      dispatch_async(global_queue, v13);
      v8 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
      v9 = dispatch_semaphore_wait(v6, v8) != 0;
      v10 = v15;
      *((_BYTE *)v15 + 24) = v9;
      *a2 = v9;
      if (*((_BYTE *)v10 + 24))
        objc_autoreleasePoolPop((void *)MEMORY[0x1BCCCB058]());
      dispatch_release(v6);
      _Block_object_dispose(&v14, 8);
    }
  }
  v11 = v19[3];
  _Block_object_dispose(&v18, 8);
  return v11;
}

void sub_1B9BBD754(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void *WiFiSecurityCopySSIDHashForPasswordBackup(void *a1)
{
  void *v2;
  __int128 v3;
  const char *v4;
  size_t v5;
  void *v6;
  uint64_t i;
  _OWORD macOut[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCCB058]();
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  macOut[0] = v3;
  macOut[1] = v3;
  v4 = (const char *)objc_msgSend(a1, "cStringUsingEncoding:", 4);
  v5 = strlen(v4);
  CCHmac(2u, "CURRENT_NETWORK", 0xFuLL, v4, v5, macOut);
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37A0]), "initWithCapacity:", 64);
  for (i = 0; i != 32; ++i)
    objc_msgSend(v6, "appendFormat:", CFSTR("%02x"), *((unsigned __int8 *)macOut + i));
  objc_autoreleasePoolPop(v2);
  return v6;
}

BOOL WiFiSecuritySavePasswordForPasswordBackup(uint64_t a1, uint64_t a2)
{
  void *v4;
  NSObject *v5;
  dispatch_time_t v6;
  intptr_t v7;
  _BOOL4 v8;
  _BOOL8 v9;
  _QWORD v11[8];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  int v15;
  uint8_t buf[4];
  const char *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1BCCCB058]();
  v5 = dispatch_semaphore_create(0);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __WiFiSecuritySavePasswordForPasswordBackup_block_invoke;
  v11[3] = &unk_1E713B9D0;
  v11[4] = a1;
  v11[5] = a2;
  v11[6] = v5;
  v11[7] = &v12;
  dispatch_async(MEMORY[0x1E0C80D38], v11);
  v6 = dispatch_time(0, 1000000000);
  v7 = dispatch_semaphore_wait(v5, v6);
  v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "WiFiSecuritySavePasswordForPasswordBackup";
      v18 = 2112;
      v19 = a1;
      _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s:[%@] timed out\n", buf, 0x16u);
    }
    v9 = 0;
  }
  else
  {
    if (v8)
    {
      *(_DWORD *)buf = 136315394;
      v17 = "WiFiSecuritySavePasswordForPasswordBackup";
      v18 = 2112;
      v19 = a1;
      _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s:[%@] completed\n", buf, 0x16u);
    }
    v9 = *((_DWORD *)v13 + 6) == 0;
  }
  dispatch_release(v5);
  _Block_object_dispose(&v12, 8);
  objc_autoreleasePoolPop(v4);
  return v9;
}

BOOL WiFiSecurityRemovePasswordFromPasswordBackup(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  dispatch_time_t v4;
  intptr_t v5;
  _BOOL4 v6;
  _BOOL8 v7;
  _QWORD block[7];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1BCCCB058]();
  v3 = dispatch_semaphore_create(0);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __WiFiSecurityRemovePasswordFromPasswordBackup_block_invoke;
  block[3] = &unk_1E713B9F8;
  block[5] = v3;
  block[6] = &v10;
  block[4] = a1;
  dispatch_async(MEMORY[0x1E0C80D38], block);
  v4 = dispatch_time(0, 1000000000);
  v5 = dispatch_semaphore_wait(v3, v4);
  v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v15 = "WiFiSecurityRemovePasswordFromPasswordBackup";
      v16 = 2112;
      v17 = a1;
      _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s:[%@] timed out\n", buf, 0x16u);
    }
    v7 = 0;
  }
  else
  {
    if (v6)
    {
      *(_DWORD *)buf = 136315394;
      v15 = "WiFiSecurityRemovePasswordFromPasswordBackup";
      v16 = 2112;
      v17 = a1;
      _os_log_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s:[%@] completed\n", buf, 0x16u);
    }
    v7 = *((_DWORD *)v11 + 6) == 0;
  }
  dispatch_release(v3);
  _Block_object_dispose(&v10, 8);
  objc_autoreleasePoolPop(v2);
  return v7;
}

uint64_t MobileWiFiContainsDriver()
{
  mach_port_t v0;
  const __CFDictionary *v1;
  uint64_t result;
  kern_return_t v3;

  v0 = MobileWiFiContainsDriver_masterPort;
  if (!MobileWiFiContainsDriver_masterPort)
  {
    v3 = IOMasterPort(0, (mach_port_t *)&MobileWiFiContainsDriver_masterPort);
    result = 0;
    if (v3)
      return result;
    v0 = MobileWiFiContainsDriver_masterPort;
  }
  v1 = IOServiceMatching("IO80211Controller");
  result = IOServiceGetMatchingService(v0, v1);
  if ((_DWORD)result)
  {
    IOObjectRelease(result);
    return 1;
  }
  return result;
}

void sub_1B9BBE6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__0(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

Class __getSFPasswordSharingServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!SharingLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E713C730;
    v5 = 0;
    SharingLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SharingLibraryCore_frameworkLibrary)
    __getSFPasswordSharingServiceClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SFPasswordSharingService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40))
    __getSFPasswordSharingServiceClass_block_invoke_cold_2();
  getSFPasswordSharingServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  return result;
}

uint64_t wifi_manager_client_server_routine(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 96974) >= 0xFFFFFFF2)
    return (uint64_t)*(&_wifi_manager_client_subsystem + 5 * (v1 - 96960) + 5);
  else
    return 0;
}

uint64_t _Xwifi_manager_client_dispatch_notification(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 104)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1 && *(_BYTE *)(result + 71) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 96))
        {
          v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 100))
          {
            result = _wifi_manager_client_dispatch_notification(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 88), *(_DWORD *)(result + 92), *(UInt8 **)(result + 44), v4, *(UInt8 **)(result + 60), v5);
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }
    v6 = -300;
  }
  else
  {
    v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_association_result(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 100)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1 && *(_BYTE *)(result + 71) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 88))
        {
          v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 92))
          {
            result = _wifi_manager_client_dispatch_association_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(UInt8 **)(result + 60), v5, *(_DWORD *)(result + 96));
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }
    v6 = -300;
  }
  else
  {
    v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_start_network_result(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  int v6;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 3 && *(_DWORD *)(result + 4) == 100)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1 && *(_BYTE *)(result + 71) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 84))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 92))
        {
          v5 = *(_DWORD *)(result + 72);
          if (v5 == *(_DWORD *)(result + 96))
          {
            result = _wifi_manager_client_dispatch_start_network_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 88), *(UInt8 **)(result + 44), v4, *(UInt8 **)(result + 60), v5);
            *(_DWORD *)(a2 + 32) = result;
            return result;
          }
        }
      }
    }
    v6 = -300;
  }
  else
  {
    v6 = -304;
  }
  *(_DWORD *)(a2 + 32) = v6;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_stop_network_result(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 76))
        {
          result = _wifi_manager_client_dispatch_stop_network_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(unsigned int *)(result + 72), *(UInt8 **)(result + 44), v4);
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    v5 = -300;
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_Xwifi_manager_client_dispatch_wow_state_change(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_wifi_manager_client_dispatch_wow_state_change(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_gas_results(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          result = _wifi_manager_client_dispatch_gas_results(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    v5 = -300;
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_ranging_result(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 2 && *(_DWORD *)(result + 4) == 80)
  {
    if (*(_BYTE *)(result + 39) == 1 && *(_BYTE *)(result + 55) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 68))
      {
        v4 = *(_DWORD *)(result + 56);
        if (v4 == *(_DWORD *)(result + 72))
        {
          result = _wifi_manager_client_dispatch_ranging_result(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, *(unsigned int *)(result + 76));
          *(_DWORD *)(a2 + 32) = result;
          return result;
        }
      }
    }
    v5 = -300;
  }
  else
  {
    v5 = -304;
  }
  *(_DWORD *)(a2 + 32) = v5;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_add_network_async(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  int v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        result = _wifi_manager_client_dispatch_add_network_async(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(unsigned int *)(result + 56));
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    v4 = -300;
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_auto_join_state_change(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  int v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 60)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 56))
      {
        result = _wifi_manager_client_dispatch_auto_join_state_change(*(_DWORD *)(result + 12), *(_DWORD *)(result + 52), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    v4 = -300;
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_preferred_networks_change(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  int v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        result = _wifi_manager_client_dispatch_preferred_networks_change(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    v4 = -300;
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

_DWORD *_Xwifi_manager_client_dispatch_managed_apple_id_state_change(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_wifi_manager_client_dispatch_managed_apple_id_state_change(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t _Xwifi_manager_client_dispatch_ui_event(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  int v4;

  if ((*(_DWORD *)result & 0x80000000) != 0 && *(_DWORD *)(result + 24) == 1 && *(_DWORD *)(result + 4) == 56)
  {
    if (*(_BYTE *)(result + 39) == 1)
    {
      v3 = *(_DWORD *)(result + 40);
      if (v3 == *(_DWORD *)(result + 52))
      {
        result = _wifi_manager_client_dispatch_ui_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
        *(_DWORD *)(a2 + 32) = result;
        return result;
      }
    }
    v4 = -300;
  }
  else
  {
    v4 = -304;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t wifi_manager_copy_networks(int a1, int a2, _QWORD *a3, _DWORD *a4)
{
  __int128 v7;
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  _BYTE v14[28];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v7;
  *(_OWORD *)&v14[12] = v7;
  *(_OWORD *)v14 = v7;
  *(_OWORD *)&msg[4] = v7;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1103D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x40u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69793)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v10 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v10 = 4294966996;
              else
                v10 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v10 = 4294966996;
          }
          goto LABEL_24;
        }
        v10 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v14[3] == 1)
        {
          v11 = *(_DWORD *)&v14[4];
          if (*(_DWORD *)&v14[4] == *(_DWORD *)&v14[16])
          {
            v10 = 0;
            *a3 = *(_QWORD *)&msg[28];
            *a4 = v11;
            return v10;
          }
        }
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_set_property(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  mach_port_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t msg;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = 2;
  v15 = a2;
  v16 = 27918592;
  v17 = a3;
  v18 = a4;
  v19 = 27918592;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a3;
  v23 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1103F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 69795)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v11 = 1;
            else
              v11 = HIDWORD(v15) == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = HIDWORD(v15);
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_add_network(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF260;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_add_network_async(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  unint64_t v6;
  int v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v9 = a2;
  v10 = 27918592;
  v11 = a3;
  v12 = a4;
  v13 = 27918592;
  v14 = a5;
  v15 = *MEMORY[0x1E0C804E8];
  v16 = a3;
  v17 = a5;
  v6 = 0xAAAAAAAA80000013;
  v7 = a1;
  v8 = xmmword_1B9BCF270;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x4Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_update_network(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF280;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_network(int a1, uint64_t a2, int a3, int a4)
{
  unint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v8 = a2;
  v9 = 27918592;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = a4;
  v5 = 0xAAAAAAAA80000013;
  v6 = a1;
  v7 = xmmword_1B9BCF290;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_networks_with_bundle_identifier(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF2A0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_networks_state_with_bundle_identifier(int a1, uint64_t a2, int a3, int a4)
{
  unint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v8 = a2;
  v9 = 27918592;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = a4;
  v5 = 0xAAAAAAAA80000013;
  v6 = a1;
  v7 = xmmword_1B9BCF2B0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_network_state(int a1, uint64_t a2, int a3, int a4, int a5)
{
  unint64_t v6;
  int v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;

  v9 = a2;
  v10 = 27918592;
  v11 = a3;
  v12 = *MEMORY[0x1E0C804E8];
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v6 = 0xAAAAAAAA80000013;
  v7 = a1;
  v8 = xmmword_1B9BCF2C0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_network_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x1104700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69803)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_dispatch_notification_response(int a1, int a2, int a3, uint64_t a4, int a5)
{
  unint64_t v6;
  int v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;

  v9 = a4;
  v10 = 27918592;
  v11 = a5;
  v12 = *MEMORY[0x1E0C804E8];
  v13 = a2;
  v14 = a3;
  v15 = a5;
  v6 = 0xAAAAAAAA80000013;
  v7 = a1;
  v8 = xmmword_1B9BCF2D0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_indicate_carplay_hid_event_received(int a1, int a2, int a3, uint64_t a4, int a5)
{
  unint64_t v6;
  int v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;

  v9 = a4;
  v10 = 27918592;
  v11 = a5;
  v12 = *MEMORY[0x1E0C804E8];
  v13 = a2;
  v14 = a3;
  v15 = a5;
  v6 = 0xAAAAAAAA80000013;
  v7 = a1;
  v8 = xmmword_1B9BCF2E0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x40u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_enable_state(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69706;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_power(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69707;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_power(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1104C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69808)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_power_ext(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69709;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_ask_to_join_state(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1104E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69810)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_mis_state(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69711;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_mis_state(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69812)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_mis_discovery_state(mach_port_t a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7, uint64_t a8, int a9, int a10)
{
  mach_port_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v16 = 2;
  v17 = a6;
  v18 = 27918592;
  v19 = a7;
  v20 = a8;
  v21 = 27918592;
  v22 = a9;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a2;
  v25 = a3;
  v26 = a4;
  v27 = a5;
  v28 = a7;
  v29 = a9;
  v30 = a10;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1105100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 3162115, 0x60u, 0x2Cu, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v12)
    {
      mig_dealloc_special_reply_port();
      return v13;
    }
    if (msg.msgh_id == 71)
    {
      v13 = 4294966988;
    }
    else if (msg.msgh_id == 69813)
    {
      v13 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        v13 = HIDWORD(v17);
        if (!HIDWORD(v17))
          return v13;
      }
    }
    else
    {
      v13 = 4294966995;
    }
    mach_msg_destroy(&msg);
  }
  return v13;
}

uint64_t wifi_manager_get_mis_discovery_state(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69814)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_wow_state(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69715;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_wow_state(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1105400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69816)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_quiesce_state(int a1, int a2, _DWORD *a3)
{
  __int128 v5;
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE rcv_name[44];

  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name[16] = v5;
  *(_OWORD *)&rcv_name[28] = v5;
  *(_OWORD *)rcv_name = v5;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v11 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x1105500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v7 = mach_msg((mach_msg_header_t *)&v11, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69817)
      {
        if ((v11 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v8 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v9 = 1;
            else
              v9 = *(_DWORD *)&rcv_name[28] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&rcv_name[28];
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_get_quiesce_state(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69818)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_wow_capability(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69819)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_bgscancache_state(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69820)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_retry_cap(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69721;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_retry_cap(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69822)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_association_mode(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69723;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_association_mode(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69824)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_nanclient_assoc_status(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1105D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69825)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_nan_off_head_connection_expiry(mach_port_t a1, double a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  double v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69726;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_nan_off_head_connection_expiry(int a1, _QWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  _BYTE msg[36];
  __int128 v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v11 = v4;
  *(_OWORD *)&msg[20] = v4;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1105F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v6 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69827)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v7 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a2 = v11;
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v8 = 1;
            else
              v8 = *(_DWORD *)&msg[32] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&msg[32];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_asktojoin_preference(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69728;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_asktojoin_preference(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1106100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69829)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_tethering_supported(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1106400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69832)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_copy_mis_stats(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1106500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69833)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_reset_mis_stats(int a1)
{
  __int128 v2;
  mach_port_name_t special_reply_port;
  uint64_t v4;
  uint64_t v5;
  _BYTE msg[36];
  unint64_t v8;

  v8 = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v2;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1106600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x2Cu, special_reply_port, 0, 0);
  v5 = v4;
  if ((v4 - 268435458) > 0xE || ((1 << (v4 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v4)
    {
      mig_dealloc_special_reply_port();
      return v5;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v5 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 69834)
    {
      v5 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        v5 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32])
          return v5;
      }
    }
    else
    {
      v5 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v5;
}

uint64_t wifi_manager_is_always_on_wifi_supported(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1106700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69835)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_copy_locale_stats(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1106800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69836)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_mis_set_password(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x1106900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69837)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_mis_copy_password(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1106A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69838)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_device_set_property(int a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7)
{
  unint64_t v8;
  int v9;
  __int128 v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  int v23;

  v11 = a2;
  v12 = 27918592;
  v13 = a3;
  v14 = a4;
  v15 = 27918592;
  v16 = a5;
  v17 = a6;
  v18 = 27918592;
  v19 = a7;
  v20 = *MEMORY[0x1E0C804E8];
  v21 = a3;
  v22 = a5;
  v23 = a7;
  v8 = 0xAAAAAAAA80000013;
  v9 = a1;
  v10 = xmmword_1B9BCF2F0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v8);
  return mach_msg((mach_msg_header_t *)&v8, 2097153, 0x60u, 0, 0, 0, 0);
}

uint64_t wifi_device_set_power(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  mach_port_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_msg_header_t msg;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 1;
  v14 = a2;
  v15 = 27918592;
  v16 = a3;
  v17 = *MEMORY[0x1E0C804E8];
  v18 = a3;
  v19 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1106F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        v9 = 4294966988;
      }
      else if (msg.msgh_id == 69843)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v10 = 1;
            else
              v10 = HIDWORD(v14) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = HIDWORD(v14);
            goto LABEL_22;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_device_disassociate(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF300;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_disassociate_with_reason(int a1, uint64_t a2, int a3, int a4)
{
  unint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v8 = a2;
  v9 = 27918592;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = a4;
  v5 = 0xAAAAAAAA80000013;
  v6 = a1;
  v7 = xmmword_1B9BCF310;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_device_assoc_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  mach_port_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t msg;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = 2;
  v15 = a2;
  v16 = 27918592;
  v17 = a3;
  v18 = a4;
  v19 = 27918592;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a3;
  v23 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1107400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 69848)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v11 = 1;
            else
              v11 = HIDWORD(v15) == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = HIDWORD(v15);
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_device_start_network(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  mach_port_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  mach_msg_header_t msg;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 2;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  v19 = a5;
  v20 = 27918592;
  v21 = a6;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = a3;
  v24 = a4;
  v25 = a6;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1107500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (msg.msgh_id == 69849)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v12 = 1;
            else
              v12 = HIDWORD(v16) == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = HIDWORD(v16);
            goto LABEL_22;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_stop_network(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  mach_port_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t msg;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = 2;
  v15 = a2;
  v16 = 27918592;
  v17 = a3;
  v18 = a4;
  v19 = 27918592;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a3;
  v23 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1107600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 69850)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v11 = 1;
            else
              v11 = HIDWORD(v15) == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = HIDWORD(v15);
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_device_copy_networks(mach_port_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _QWORD *a5, unsigned int *a6, _DWORD *a7)
{
  __int128 v11;
  mach_port_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unint64_t v22;
  __int128 v23;

  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  msg.msgh_id = -1431655766;
  v22 = 0xAAAAAAAAAAAAAAAALL;
  v23 = v11;
  *(_OWORD *)&msg.msgh_size = v11;
  v18 = 1;
  v19 = a2;
  v20 = 27918592;
  v21 = a3;
  v22 = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&v23 = __PAIR64__(a4, a3);
  special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1107700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v13 = mach_msg(&msg, 3162115, 0x3Cu, 0x44u, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (msg.msgh_id == 69851)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port)
                v14 = 4294966996;
              else
                v14 = HIDWORD(v19);
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_24;
        }
        v14 = 4294966996;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          v15 = v21;
          if (v21 == (_DWORD)v23)
          {
            v14 = 0;
            *a5 = v19;
            *a6 = v15;
            *a7 = DWORD1(v23);
            return v14;
          }
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_device_set_wifi_direct_state(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  mach_port_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_msg_header_t msg;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 1;
  v14 = a2;
  v15 = 27918592;
  v16 = a3;
  v17 = *MEMORY[0x1E0C804E8];
  v18 = a3;
  v19 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1107800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        v9 = 4294966988;
      }
      else if (msg.msgh_id == 69852)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v10 = 1;
            else
              v10 = HIDWORD(v14) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = HIDWORD(v14);
            goto LABEL_22;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_background_scan_networks(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF330;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_bgscan_cache_state(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF340;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_scan_backoff_report(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69756;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_test_params(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF350;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_test_params(int a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  __int128 v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[24];
  uint64_t v16;
  int v17;
  int v18;
  _BYTE v19[20];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_name = v8;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  *(_QWORD *)v19 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v19[8] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v14 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x1107E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69858)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_24;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_manager_copy_version_info(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1107F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69859)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_copy_client_names(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1108000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69860)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_merge_known_networks(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x1108100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69861)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_device_gas_start_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = 3;
  v17 = a2;
  v18 = 27918592;
  v19 = a3;
  v20 = a4;
  v21 = 27918592;
  v22 = a5;
  v23 = a6;
  v24 = 27918592;
  v25 = a7;
  v26 = *MEMORY[0x1E0C804E8];
  v27 = a3;
  v28 = a5;
  v29 = a7;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1108200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (msg.msgh_id == 69862)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v13 = 1;
            else
              v13 = HIDWORD(v17) == 0;
            if (v13)
              v12 = 4294966996;
            else
              v12 = HIDWORD(v17);
            goto LABEL_22;
          }
        }
        v12 = 4294966996;
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_device_set_rangeable(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  mach_port_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  mach_msg_header_t msg;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 2;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  v19 = a5;
  v20 = 27918592;
  v21 = a6;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = a3;
  v24 = a4;
  v25 = a6;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1108300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (msg.msgh_id == 69863)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v12 = 1;
            else
              v12 = HIDWORD(v16) == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = HIDWORD(v16);
            goto LABEL_22;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_set_ranging_identifier(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  mach_port_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  mach_msg_header_t msg;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 2;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  v19 = a5;
  v20 = 27918592;
  v21 = a6;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = a3;
  v24 = a4;
  v25 = a6;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1108400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (msg.msgh_id == 69864)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v12 = 1;
            else
              v12 = HIDWORD(v16) == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = HIDWORD(v16);
            goto LABEL_22;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_ranging_start_async(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int a6, int *a7)
{
  mach_port_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  mach_msg_header_t msg;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 2;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  v19 = a4;
  v20 = 27918592;
  v21 = a5;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = a3;
  v24 = a5;
  v25 = a6;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1108500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (msg.msgh_id == 69865)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v12 = 1;
            else
              v12 = HIDWORD(v16) == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = HIDWORD(v16);
            goto LABEL_22;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_debug_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7, _DWORD *a8)
{
  mach_port_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;

  v18 = 2;
  v19 = a2;
  v20 = 27918592;
  v21 = a3;
  v22 = a4;
  v23 = 27918592;
  v24 = a5;
  v25 = *MEMORY[0x1E0C804E8];
  v26 = a3;
  v27 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v17.msgh_bits = 0xAAAAAAAA80001513;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(_QWORD *)&v17.msgh_voucher_port = 0x1108600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v17);
    special_reply_port = v17.msgh_local_port;
  }
  v13 = mach_msg(&v17, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (v17.msgh_id == 69866)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 36)
          {
            v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (v17.msgh_remote_port)
                v14 = 4294966996;
              else
                v14 = HIDWORD(v19);
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_23;
        }
        v14 = 4294966996;
        if (v18 == 1 && *(_QWORD *)&v17.msgh_size == 60 && HIBYTE(v20) == 1)
        {
          v15 = v21;
          if (v21 == v23)
          {
            v14 = 0;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_device_copy_roam_stats(int a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  __int128 v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[24];
  uint64_t v16;
  int v17;
  int v18;
  _BYTE v19[20];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_name = v8;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  *(_QWORD *)v19 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v19[8] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v14 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x1108700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69867)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_24;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_set_trgdisc_params(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  mach_port_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t msg;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = 2;
  v15 = a2;
  v16 = 27918592;
  v17 = a3;
  v18 = a4;
  v19 = 27918592;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a3;
  v23 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1108800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 69868)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v11 = 1;
            else
              v11 = HIDWORD(v15) == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = HIDWORD(v15);
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_device_copy_interface_state_info(mach_port_t a1, uint64_t a2, unsigned int a3, unsigned int a4, _QWORD *a5, unsigned int *a6, _DWORD *a7)
{
  __int128 v11;
  mach_port_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  mach_msg_header_t msg;
  int v18;
  uint64_t v19;
  int v20;
  unsigned int v21;
  unint64_t v22;
  __int128 v23;

  *(_QWORD *)&v11 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v11 + 1) = 0xAAAAAAAAAAAAAAAALL;
  msg.msgh_id = -1431655766;
  v22 = 0xAAAAAAAAAAAAAAAALL;
  v23 = v11;
  *(_OWORD *)&msg.msgh_size = v11;
  v18 = 1;
  v19 = a2;
  v20 = 27918592;
  v21 = a3;
  v22 = *MEMORY[0x1E0C804E8];
  *(_QWORD *)&v23 = __PAIR64__(a4, a3);
  special_reply_port = mig_get_special_reply_port();
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  msg.msgh_bits = -2147478253;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1108900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v13 = mach_msg(&msg, 3162115, 0x3Cu, 0x44u, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (msg.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (msg.msgh_id == 69869)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 36)
          {
            v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (msg.msgh_remote_port)
                v14 = 4294966996;
              else
                v14 = HIDWORD(v19);
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_24;
        }
        v14 = 4294966996;
        if (v18 == 1 && msg.msgh_size == 60 && !msg.msgh_remote_port && HIBYTE(v20) == 1)
        {
          v15 = v21;
          if (v21 == (_DWORD)v23)
          {
            v14 = 0;
            *a5 = v19;
            *a6 = v15;
            *a7 = DWORD1(v23);
            return v14;
          }
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy(&msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_manager_dump_logs(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF360;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_add_policy(int a1, uint64_t a2, int a3, int a4)
{
  unint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v8 = a2;
  v9 = 27918592;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = a4;
  v5 = 0xAAAAAAAA80000013;
  v6 = a1;
  v7 = xmmword_1B9BCF370;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_policy(int a1, uint64_t a2, int a3, int a4)
{
  unint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v8 = a2;
  v9 = 27918592;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = a4;
  v5 = 0xAAAAAAAA80000013;
  v6 = a1;
  v7 = xmmword_1B9BCF380;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_policies(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1108D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69873)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_incar_state(int a1, int a2, uint64_t a3, int a4)
{
  unint64_t v5;
  int v6;
  __int128 v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v8 = a3;
  v9 = 27918592;
  v10 = a4;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a2;
  v13 = a4;
  v5 = 0xAAAAAAAA80000013;
  v6 = a1;
  v7 = xmmword_1B9BCF390;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v5);
  return mach_msg((mach_msg_header_t *)&v5, 2097153, 0x3Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_thermal_index(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69776;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_thermal_index(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1109100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69877)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_device_wowblacklist_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7, _DWORD *a8)
{
  mach_port_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  mach_msg_header_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  uint64_t v25;
  int v26;
  int v27;

  v18 = 2;
  v19 = a2;
  v20 = 27918592;
  v21 = a3;
  v22 = a4;
  v23 = 27918592;
  v24 = a5;
  v25 = *MEMORY[0x1E0C804E8];
  v26 = a3;
  v27 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v17.msgh_bits = 0xAAAAAAAA80001513;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(_QWORD *)&v17.msgh_voucher_port = 0x1109200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v17);
    special_reply_port = v17.msgh_local_port;
  }
  v13 = mach_msg(&v17, 3162115, 0x4Cu, 0x44u, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (v17.msgh_id == 71)
      {
        v14 = 4294966988;
      }
      else if (v17.msgh_id == 69878)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 36)
          {
            v14 = 4294966996;
            if (HIDWORD(v19))
            {
              if (v17.msgh_remote_port)
                v14 = 4294966996;
              else
                v14 = HIDWORD(v19);
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_23;
        }
        v14 = 4294966996;
        if (v18 == 1 && *(_QWORD *)&v17.msgh_size == 60 && HIBYTE(v20) == 1)
        {
          v15 = v21;
          if (v21 == v23)
          {
            v14 = 0;
            *a6 = v19;
            *a7 = v15;
            *a8 = v24;
            return v14;
          }
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t wifi_manager_copy_leeched_location(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1109300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69879)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_copy_geotags_for_network(int a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  __int128 v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[24];
  uint64_t v16;
  int v17;
  int v18;
  _BYTE v19[20];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_name = v8;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  *(_QWORD *)v19 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v19[8] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v14 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x1109400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69880)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_24;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_manager_set_geotag_for_network(int a1, uint64_t a2, int a3, double a4, double a5)
{
  _BYTE msg[28];
  uint64_t v7;
  int v8;
  int v9;
  uint64_t v10;
  int v11;
  double v12;
  double v13;

  *(_QWORD *)msg = 0xAAAAAAAAAAAAAAAALL;
  v7 = a2;
  v8 = 27918592;
  v9 = a3;
  v10 = *MEMORY[0x1E0C804E8];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  *(_DWORD *)msg = -2147483629;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF3A0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x48u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_networks_at_location(int a1, int a2, _QWORD *a3, _DWORD *a4, double a5, double a6)
{
  __int128 v9;
  mach_port_name_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v15;
  _BYTE rcv_name[60];

  *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name[16] = v9;
  *(_OWORD *)&rcv_name[32] = v9;
  *(_OWORD *)&rcv_name[44] = v9;
  *(_OWORD *)rcv_name = v9;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(double *)&rcv_name[28] = a5;
  *(double *)&rcv_name[36] = a6;
  *(_DWORD *)&rcv_name[44] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v15 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x1109600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v15);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v11 = mach_msg((mach_msg_header_t *)&v15, 3162115, 0x34u, 0x40u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v12 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69882)
      {
        if ((v15 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v12 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4])
                v12 = 4294966996;
              else
                v12 = *(unsigned int *)&rcv_name[28];
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_24;
        }
        v12 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && rcv_name[35] == 1)
        {
          v13 = *(_DWORD *)&rcv_name[36];
          if (*(_DWORD *)&rcv_name[36] == *(_DWORD *)&rcv_name[48])
          {
            v12 = 0;
            *a3 = *(_QWORD *)&rcv_name[24];
            *a4 = v13;
            return v12;
          }
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_copy_score_for_network(int a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  __int128 v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[24];
  uint64_t v16;
  int v17;
  int v18;
  _BYTE v19[20];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_name = v8;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  *(_QWORD *)v19 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v19[8] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v14 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x1109700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69883)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_24;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_soft_error_notification(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  mach_port_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t msg;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v14 = 2;
  v15 = a2;
  v16 = 27918592;
  v17 = a3;
  v18 = a4;
  v19 = 27918592;
  v20 = a5;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a3;
  v23 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1109800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x4Cu, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 69884)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v11 = 1;
            else
              v11 = HIDWORD(v15) == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = HIDWORD(v15);
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_copy_softerror_counters(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1109900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69885)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_copy_current_session_based_network(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x1109A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69886)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_user_auto_join_state(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69787;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_user_auto_join_state(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x1109C00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69888)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_remove_orphaned_sc_network_sets(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69789;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_migrate_list(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69790;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_remove_unused_network_geotags(mach_port_t a1, double a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  double v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69791;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_manager_schedule_unused_network_geotags_removal_test(mach_port_t a1, int a2, double a3)
{
  mach_msg_header_t v4;
  uint64_t v5;
  double v6;
  int v7;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a3;
  v7 = a2;
  *(_QWORD *)&v4.msgh_bits = 0xAAAAAAAA00000013;
  v4.msgh_voucher_port = 0;
  v4.msgh_id = 69792;
  v4.msgh_remote_port = a1;
  v4.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&v4);
  return mach_msg(&v4, 2097153, 0x2Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_unschedule_unused_network_geotags_removal_test(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69793;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_device_autojoinblacklist_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_msg_header_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;

  v16 = 2;
  v17 = a2;
  v18 = 27918592;
  v19 = a3;
  v20 = a4;
  v21 = 27918592;
  v22 = a5;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v15.msgh_bits = 0xAAAAAAAA80001513;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(_QWORD *)&v15.msgh_voucher_port = 0x110A200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v15);
    special_reply_port = v15.msgh_local_port;
  }
  v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v15.msgh_id == 69894)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port)
                v12 = 4294966996;
              else
                v12 = HIDWORD(v17);
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_23;
        }
        v12 = 4294966996;
        if (v16 == 1 && *(_QWORD *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          v13 = v19;
          if (v19 == v21)
          {
            v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_simulate_notification(int a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6)
{
  unint64_t v7;
  int v8;
  __int128 v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  int v19;

  v10 = a2;
  v11 = 27918592;
  v12 = a3;
  v13 = a5;
  v14 = 27918592;
  v15 = a6;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  v18 = a4;
  v19 = a6;
  v7 = 0xAAAAAAAA80000013;
  v8 = a1;
  v9 = xmmword_1B9BCF3B0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v7);
  return mach_msg((mach_msg_header_t *)&v7, 2097153, 0x50u, 0, 0, 0, 0);
}

uint64_t wifi_device_destroy_eap_trust_current_network(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x110A400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69896)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_tigger_gizmo_sync_password_check(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69797;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_ssid_most_used_geo_tagged_to_current_location(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x110A600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69898)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_is_hotspot_wpa3_personal_supported(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110A800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69900)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_auto_instant_hotspot_mode(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69803;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_auto_instant_hotspot_mode(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110AC00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69904)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_share_personal_hotspot_mode(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69805;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_share_personal_hotspot_mode(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110AE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69906)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_auto_instant_hotspot_test_mode(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69807;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_auto_instant_hotspot_trigger_interval(mach_port_t a1, double a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  double v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69808;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x28u, 0, 0, 0, 0);
}

uint64_t wifi_device_get_event_interval(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
{
  mach_port_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  mach_msg_header_t msg;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 1;
  v14 = a2;
  v15 = 27918592;
  v16 = a3;
  v17 = *MEMORY[0x1E0C804E8];
  v18 = a3;
  v19 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x110B100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v8 = mach_msg(&msg, 3162115, 0x3Cu, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (msg.msgh_id == 71)
      {
        v9 = 4294966988;
      }
      else if (msg.msgh_id == 69909)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v9 = HIDWORD(v14);
              if (!HIDWORD(v14))
              {
                *a5 = v15;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v10 = 1;
            else
              v10 = HIDWORD(v14) == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = HIDWORD(v14);
            goto LABEL_22;
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_device_set_event_interval(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6)
{
  mach_port_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  mach_msg_header_t v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 1;
  v15 = a2;
  v16 = 27918592;
  v17 = a3;
  v18 = *MEMORY[0x1E0C804E8];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v13.msgh_bits = 0xAAAAAAAA80001513;
  v13.msgh_remote_port = a1;
  v13.msgh_local_port = special_reply_port;
  *(_QWORD *)&v13.msgh_voucher_port = 0x110B200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v13);
    special_reply_port = v13.msgh_local_port;
  }
  v9 = mach_msg(&v13, 3162115, 0x44u, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (v13.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (v13.msgh_id == 69910)
      {
        if ((v13.msgh_bits & 0x80000000) == 0)
        {
          if (v13.msgh_size == 40)
          {
            if (!v13.msgh_remote_port)
            {
              v10 = HIDWORD(v15);
              if (!HIDWORD(v15))
              {
                *a6 = v16;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (v13.msgh_size == 36)
          {
            if (v13.msgh_remote_port)
              v11 = 1;
            else
              v11 = HIDWORD(v15) == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = HIDWORD(v15);
            goto LABEL_22;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v13);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t wifi_manager_is_infra_allowed(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110B300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69911)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_is_p2p_allowed(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110B400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69912)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_set_network_property(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, uint64_t a6, int a7, int *a8)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  mach_msg_header_t msg;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;
  uint64_t v26;
  int v27;
  int v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v16 = 3;
  v17 = a2;
  v18 = 27918592;
  v19 = a3;
  v20 = a4;
  v21 = 27918592;
  v22 = a5;
  v23 = a6;
  v24 = 27918592;
  v25 = a7;
  v26 = *MEMORY[0x1E0C804E8];
  v27 = a3;
  v28 = a5;
  v29 = a7;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x110B500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3162115, 0x60u, 0x30u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (msg.msgh_id == 69913)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v12 = HIDWORD(v17);
              if (!HIDWORD(v17))
              {
                *a8 = v18;
                return v12;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v13 = 1;
            else
              v13 = HIDWORD(v17) == 0;
            if (v13)
              v12 = 4294966996;
            else
              v12 = HIDWORD(v17);
            goto LABEL_22;
          }
        }
        v12 = 4294966996;
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_copy_family_hotspot_preferences(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x110B600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69914)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_built_in_receiver(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69817;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_is_personal_hotspot_modification_disabled(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110BA00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69918)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_device_copy_network_recommendations(int a1, uint64_t a2, int a3, _QWORD *a4, _DWORD *a5)
{
  __int128 v8;
  mach_port_name_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  int v14;
  _BYTE rcv_name[24];
  uint64_t v16;
  int v17;
  int v18;
  _BYTE v19[20];

  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&rcv_name[16] = 0x1AAAAAAAALL;
  *(_DWORD *)v19 = -1431655766;
  *(_OWORD *)&v19[4] = v8;
  *(_OWORD *)rcv_name = v8;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  *(_QWORD *)v19 = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&v19[8] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v14 = -2147478253;
  *(_QWORD *)&rcv_name[12] = 0x110BB00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v10 = mach_msg((mach_msg_header_t *)&v14, 3162115, 0x38u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 69919)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (*(_DWORD *)&rcv_name[4])
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_24;
        }
        v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1 && *(_DWORD *)rcv_name == 56 && !*(_DWORD *)&rcv_name[4] && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == *(_DWORD *)&v19[8])
          {
            v11 = 0;
            *a4 = v16;
            *a5 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_device_reset_availability_engine(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF3C0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_user_interaction_override(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF3D0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_set_user_interaction_nw_override(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF3E0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_bssblacklist_command(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7)
{
  mach_port_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  int v13;
  mach_msg_header_t v15;
  int v16;
  uint64_t v17;
  int v18;
  int v19;
  uint64_t v20;
  int v21;
  int v22;
  uint64_t v23;
  int v24;
  int v25;

  v16 = 2;
  v17 = a2;
  v18 = 27918592;
  v19 = a3;
  v20 = a4;
  v21 = 27918592;
  v22 = a5;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v15.msgh_bits = 0xAAAAAAAA80001513;
  v15.msgh_remote_port = a1;
  v15.msgh_local_port = special_reply_port;
  *(_QWORD *)&v15.msgh_voucher_port = 0x110BF00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v15);
    special_reply_port = v15.msgh_local_port;
  }
  v11 = mach_msg(&v15, 3162115, 0x4Cu, 0x40u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (v15.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (v15.msgh_id == 69923)
      {
        if ((v15.msgh_bits & 0x80000000) == 0)
        {
          if (v15.msgh_size == 36)
          {
            v12 = 4294966996;
            if (HIDWORD(v17))
            {
              if (v15.msgh_remote_port)
                v12 = 4294966996;
              else
                v12 = HIDWORD(v17);
            }
          }
          else
          {
            v12 = 4294966996;
          }
          goto LABEL_23;
        }
        v12 = 4294966996;
        if (v16 == 1 && *(_QWORD *)&v15.msgh_size == 56 && HIBYTE(v18) == 1)
        {
          v13 = v19;
          if (v19 == v21)
          {
            v12 = 0;
            *a6 = v17;
            *a7 = v13;
            return v12;
          }
        }
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_23:
      mach_msg_destroy(&v15);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t wifi_manager_set_private_mac_pref(mach_port_t a1, uint64_t a2, int a3, int a4, uint64_t a5, int a6, int *a7)
{
  mach_port_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  mach_msg_header_t msg;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v15 = 2;
  v16 = a2;
  v17 = 27918592;
  v18 = a3;
  v19 = a5;
  v20 = 27918592;
  v21 = a6;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = a3;
  v24 = a4;
  v25 = a6;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x110C000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3162115, 0x50u, 0x30u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (msg.msgh_id == 69924)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 40)
          {
            if (!msg.msgh_remote_port)
            {
              v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v12 = 1;
            else
              v12 = HIDWORD(v16) == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = HIDWORD(v16);
            goto LABEL_22;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  return v11;
}

uint64_t wifi_manager_set_mac_randomisation_params(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF3F0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_device_update_network_property(int a1, uint64_t a2, int a3, uint64_t a4, int a5)
{
  unint64_t v6;
  int v7;
  __int128 v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  int v17;

  v9 = a2;
  v10 = 27918592;
  v11 = a3;
  v12 = a4;
  v13 = 27918592;
  v14 = a5;
  v15 = *MEMORY[0x1E0C804E8];
  v16 = a3;
  v17 = a5;
  v6 = 0xAAAAAAAA80000013;
  v7 = a1;
  v8 = xmmword_1B9BCF400;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)&v6);
  return mach_msg((mach_msg_header_t *)&v6, 2097153, 0x4Cu, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_mac_randomisation_parameters(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x110C300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69927)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_get_privatemac_network_switch_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x110C400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69928)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_update_privateMac_network(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF410;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_private_mac_is_quick_probe_required(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x110C600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69930)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_private_mac_probe_result(mach_port_t a1, int a2, uint64_t a3, int a4)
{
  mach_port_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  mach_msg_header_t msg;
  int v10;
  uint64_t v11;
  int v12;
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 1;
  v11 = a3;
  v12 = 27918592;
  v13 = a4;
  v14 = *MEMORY[0x1E0C804E8];
  v15 = a2;
  v16 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA80001513;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x110C700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v6 = mach_msg(&msg, 3162115, 0x3Cu, 0x2Cu, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v6)
    {
      mig_dealloc_special_reply_port();
      return v7;
    }
    if (msg.msgh_id == 71)
    {
      v7 = 4294966988;
    }
    else if (msg.msgh_id == 69931)
    {
      v7 = 4294966996;
      if ((msg.msgh_bits & 0x80000000) == 0 && msg.msgh_size == 36 && !msg.msgh_remote_port)
      {
        v7 = HIDWORD(v11);
        if (!HIDWORD(v11))
          return v7;
      }
    }
    else
    {
      v7 = 4294966995;
    }
    mach_msg_destroy(&msg);
  }
  return v7;
}

uint64_t wifi_manager_set_adaptive_roam_params(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF420;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_is_multi_band(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110C900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69933)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_get_hardware_failure(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110CA00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69934)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_reset_network_settings(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69835;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_purge_expired_known_networks(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69836;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_manager_cleanup_log_buffer_files(mach_port_t a1)
{
  mach_msg_header_t msg;

  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69837;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x18u, 0, 0, 0, 0);
}

uint64_t wifi_device_get_app_state(mach_port_t a1, uint64_t a2, int a3, int *a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  mach_msg_header_t v11;
  int v12;
  uint64_t v13;
  int v14;
  int v15;
  uint64_t v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v12 = 1;
  v13 = a2;
  v14 = 27918592;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 0xAAAAAAAA80001513;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x110CE00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v11);
    special_reply_port = v11.msgh_local_port;
  }
  v7 = mach_msg(&v11, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (v11.msgh_id == 71)
      {
        v8 = 4294966988;
      }
      else if (v11.msgh_id == 69938)
      {
        if ((v11.msgh_bits & 0x80000000) == 0)
        {
          if (v11.msgh_size == 40)
          {
            if (!v11.msgh_remote_port)
            {
              v8 = HIDWORD(v13);
              if (!HIDWORD(v13))
              {
                *a4 = v14;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (v11.msgh_size == 36)
          {
            if (v11.msgh_remote_port)
              v9 = 1;
            else
              v9 = HIDWORD(v13) == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = HIDWORD(v13);
            goto LABEL_22;
          }
        }
        v8 = 4294966996;
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v11);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t wifi_manager_wificall_handover_notification(int a1, int a2)
{
  __int128 v3;
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  _BYTE msg[36];
  unint64_t v9;

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[20] = v3;
  v9 = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&msg[4] = v3;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x110CF00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v5 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_special_reply_port();
      return v6;
    }
    if (*(_DWORD *)&msg[20] == 71)
    {
      v6 = 4294966988;
    }
    else if (*(_DWORD *)&msg[20] == 69939)
    {
      v6 = 4294966996;
      if ((*(_DWORD *)msg & 0x80000000) == 0 && *(_DWORD *)&msg[4] == 36 && !*(_DWORD *)&msg[8])
      {
        v6 = *(unsigned int *)&msg[32];
        if (!*(_DWORD *)&msg[32])
          return v6;
      }
    }
    else
    {
      v6 = 4294966995;
    }
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v6;
}

uint64_t wifi_device_insert_missing_network_service(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF430;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

uint64_t wifi_manager_copy_movement_states(int a1, _QWORD *a2, _DWORD *a3)
{
  __int128 v6;
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _BYTE msg[36];
  _BYTE v13[28];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&v13[12] = v6;
  *(_OWORD *)v13 = v6;
  *(_OWORD *)&msg[20] = v6;
  *(_DWORD *)&msg[4] = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x110D100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 69941)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v9 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v9 = 4294966996;
              else
                v9 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v9 = 4294966996;
          }
          goto LABEL_24;
        }
        v9 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 56 && !*(_DWORD *)&msg[8] && v13[3] == 1)
        {
          v10 = *(_DWORD *)&v13[4];
          if (*(_DWORD *)&v13[4] == *(_DWORD *)&v13[16])
          {
            v9 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v10;
            return v9;
          }
        }
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t wifi_manager_set_simulated_movement_states(mach_port_t a1, uint64_t a2, int a3)
{
  mach_port_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  mach_msg_header_t v8;
  int v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v9 = 1;
  v10 = a2;
  v11 = 27918592;
  v12 = a3;
  v13 = *MEMORY[0x1E0C804E8];
  v14 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v8.msgh_bits = 0xAAAAAAAA80001513;
  v8.msgh_remote_port = a1;
  v8.msgh_local_port = special_reply_port;
  *(_QWORD *)&v8.msgh_voucher_port = 0x110D200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v8);
    special_reply_port = v8.msgh_local_port;
  }
  v5 = mach_msg(&v8, 3162115, 0x38u, 0x2Cu, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v5)
    {
      mig_dealloc_special_reply_port();
      return v6;
    }
    if (v8.msgh_id == 71)
    {
      v6 = 4294966988;
    }
    else if (v8.msgh_id == 69942)
    {
      v6 = 4294966996;
      if ((v8.msgh_bits & 0x80000000) == 0 && *(_QWORD *)&v8.msgh_size == 36)
      {
        v6 = HIDWORD(v10);
        if (!HIDWORD(v10))
          return v6;
      }
    }
    else
    {
      v6 = 4294966995;
    }
    mach_msg_destroy(&v8);
  }
  return v6;
}

uint64_t wifi_manager_set_battery_save_mode(mach_port_t a1, int a2)
{
  mach_msg_header_t msg;
  uint64_t v4;
  int v5;

  v4 = *MEMORY[0x1E0C804E8];
  v5 = a2;
  *(_QWORD *)&msg.msgh_bits = 0xAAAAAAAA00000013;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 69843;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  return mach_msg(&msg, 2097153, 0x24u, 0, 0, 0, 0);
}

uint64_t wifi_manager_get_battery_save_mode(int a1, _DWORD *a2)
{
  __int128 v4;
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)&rcv_name_12[16] = v4;
  *(_OWORD *)&rcv_name_12[4] = v4;
  rcv_name = -1431655766;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v10 = 5395;
  *(_QWORD *)rcv_name_12 = 0x110D400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = rcv_name_8;
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 69944)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v7 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v7 = 4294966996;
      }
      else
      {
        v7 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v10);
      return v7;
    }
    mig_dealloc_special_reply_port();
  }
  return v7;
}

uint64_t wifi_manager_initiate_network_transition(int a1, uint64_t a2, int a3)
{
  _BYTE msg[28];
  uint64_t v5;
  int v6;
  int v7;
  uint64_t v8;
  int v9;

  v5 = a2;
  v6 = 27918592;
  v7 = a3;
  v8 = *MEMORY[0x1E0C804E8];
  v9 = a3;
  *(_QWORD *)msg = 0xAAAAAAAA80000013;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_1B9BCF440;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  return mach_msg((mach_msg_header_t *)msg, 2097153, 0x38u, 0, 0, 0, 0);
}

void __WiFiPolicyRelease_cold_1()
{
  __assert_rtn("__WiFiPolicyRelease", "WiFiPolicy.c", 199, "object");
}

void __WiFiPolicyRelease_cold_2()
{
  __assert_rtn("__WiFiPolicyRelease", "WiFiPolicy.c", 200, "CFGetTypeID(object) == WiFiPolicyGetTypeID()");
}

void _WiFiCopyUnserialized_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], v0, "%s: CFPropertyListCreateWithData returned with error %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void _WiFiCopyUnserialized_cold_2()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136315138;
  v1 = "_WiFiCopyUnserialized";
  _os_log_error_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Invalid buffer/buffersize.", (uint8_t *)&v0, 0xCu);
  OUTLINED_FUNCTION_2();
}

void _CFPropertyListCreateBinaryData_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], v0, "%s: CFPropertyListWrite returned with error %@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_2();
}

void WiFiManagerClientCreate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Failed create device backing store", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void WiFiManagerClientCreate_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Failed to allocate reply port", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void WiFiManagerClientCreate_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Unable to allocate set client reply port attributes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void WiFiManagerClientCreate_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Unable to allocate acquire client reply port attributes", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __WiFiManagerClientServerTerminationCallback_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

void WiFiManagerClientGetDevice_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x20u);
  OUTLINED_FUNCTION_6();
}

void __WiFiManagerClientAddDevice_cold_1()
{
  int v0[6];
  uint64_t v1;

  v1 = *MEMORY[0x1E0C80C00];
  v0[0] = 136315394;
  OUTLINED_FUNCTION_4();
  _os_log_debug_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s: delaying attach callback for %@", (uint8_t *)v0, 0x16u);
  OUTLINED_FUNCTION_2();
}

void WiFiManagerClientDispatchAttachmentEvent_cold_1()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x26u);
  OUTLINED_FUNCTION_6();
}

void __WiFiManagerClientAvailableCallback_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: Failed to acquire connection port to WiFi Manager", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __WiFiManagerClientAvailableCallback_cold_2()
{
  void *v0;
  os_log_t v1;
  os_log_type_t v2;
  const char *v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_7();
  OUTLINED_FUNCTION_5();
  _os_log_error_impl(v0, v1, v2, v3, v4, 0x18u);
  OUTLINED_FUNCTION_2();
}

void __WiFiManagerClientAvailableCallback_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: WiFiManager now available", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void WiFiManagerClientUnscheduleFromRunLoop_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: Null runLoop parameters", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Missing com.apple.wifi.manager-access entitlement", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "WiFiManager server port is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Failed to open connection to WiFi Manager (EPERM), missing com.apple.wifi.manager-access entitlement", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Failed to acquire connection port to WiFi Manager", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_5(uint8_t *buf, _QWORD *a2)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "__WiFiManagerClientGetOrReconnectServerPort";
  _os_log_debug_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "%s: invoking delayed attach callback", buf, 0xCu);
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "Failed to request MACH_NOTIFY_NO_SENDERS", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void __WiFiManagerClientGetOrReconnectServerPort_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "bootstrap_look_up of WiFiManager server failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1_0();
}

void WiFiDeviceClientCopyCurrentNetwork_cold_1(uint64_t a1)
{
  int v1;
  int v2;
  const char *v3;
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
    v1 = *(_DWORD *)(a1 + 16);
  else
    v1 = -1;
  v2 = 136315394;
  v3 = "__WiFiDeviceClientCopyCurrentNetworkLegacy";
  v4 = 1024;
  v5 = v1;
  _os_log_error_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: server port [%d]", (uint8_t *)&v2, 0x12u);
  OUTLINED_FUNCTION_2();
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_1(const void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  CFGetTypeID(a1);
  OUTLINED_FUNCTION_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], v1, "%s: bad type %ld detected for APPLE80211KEY_STATE_CHANGED_IS_LINKDOWN", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void _WiFiDeviceClientDispatchVirtInterfaceStateChangeEvent_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: unexpected type for payload %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void WiFiDeviceClientSetWiFiDirect_cold_1()
{
  __assert_rtn("WiFiDeviceClientSetWiFiDirect", "WiFiDeviceClient.c", 1376, "device");
}

void _WiFiDeviceClientDispatchStartNetworkResult_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: null callback.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void _WiFiDeviceClientDispatchStopNetworkResult_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: null callback.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void _WiFiDeviceClientDispatchAutoJoinNotification_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: null notification dictionary.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void _WiFiDeviceClientDispatchUserJoinNotification_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1B9B9D000, MEMORY[0x1E0C81028], a3, "%s: null notification dictionary.", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void WiFiNetworkSetStateWithReason_cold_1(const void *a1, char a2, uint64_t a3)
{
  const void *SSID;
  const char *v6;
  int v7;
  const char *v8;
  __int16 v9;
  const void *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SSID = WiFiNetworkGetSSID(a1);
  v6 = "enabled";
  v7 = 136315906;
  v8 = "WiFiNetworkSetStateWithReason";
  v10 = SSID;
  v9 = 2112;
  v11 = 2080;
  if (!a2)
    v6 = "disabled";
  v12 = v6;
  v13 = 2112;
  v14 = a3;
  _os_log_error_impl(&dword_1B9B9D000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%s: Network '%@' %s for auto-join due to %@", (uint8_t *)&v7, 0x2Au);
}

void WiFiNetworkCreateCoreWiFiNetworkProfile_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CLLocationCoordinate2D soft_CLLocationCoordinate2DMake(CLLocationDegrees, CLLocationDegrees)"), CFSTR("WiFiNetwork.c"), 51, CFSTR("%s"), dlerror());
  __break(1u);
}

void getCWFScanResultPropertyOSSpecificAttributesKey_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *getCWFScanResultPropertyOSSpecificAttributesKey(void)"), CFSTR("WiFiNetwork.c"), 39, CFSTR("%s"), dlerror());
  __break(1u);
}

void __getCWFNetworkProfileClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCWFNetworkProfileClass(void)_block_invoke"), CFSTR("WiFiNetwork.c"), 35, CFSTR("Unable to find class %s"), "CWFNetworkProfile");
  __break(1u);
}

void CoreWiFiLibrary_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreWiFiLibrary(void)"), CFSTR("WiFiNetwork.c"), 34, CFSTR("%s"), *a1);
  __break(1u);
}

void __getCWFBSSClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCWFBSSClass(void)_block_invoke"), CFSTR("WiFiNetwork.c"), 43, CFSTR("Unable to find class %s"), "CWFBSS");
  __break(1u);
}

void __getCWFChannelClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCWFChannelClass(void)_block_invoke"), CFSTR("WiFiNetwork.c"), 41, CFSTR("Unable to find class %s"), "CWFChannel");
  __break(1u);
}

void __getCLLocationClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCLLocationClass(void)_block_invoke"), CFSTR("WiFiNetwork.c"), 47, CFSTR("Unable to find class %s"), "CLLocation");
  __break(1u);
}

void CoreLocationLibrary_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *CoreLocationLibrary(void)"), CFSTR("WiFiNetwork.c"), 46, CFSTR("%s"), *a1);
  __break(1u);
}

void __getCWFScanResultClass_block_invoke_cold_1()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getCWFScanResultClass(void)_block_invoke"), CFSTR("WiFiNetwork.c"), 37, CFSTR("Unable to find class %s"), "CWFScanResult");
  __break(1u);
}

void __getSFPasswordSharingServiceClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SharingLibrary(void)"), CFSTR("WiFiPasswordSharingSimulator.m"), 13, CFSTR("%s"), *a1);
  __break(1u);
}

void __getSFPasswordSharingServiceClass_block_invoke_cold_2()
{
  void *v0;

  v0 = (void *)objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSFPasswordSharingServiceClass(void)_block_invoke"), CFSTR("WiFiPasswordSharingSimulator.m"), 14, CFSTR("Unable to find class %s"), "SFPasswordSharingService");
  __break(1u);
  Apple80211CopyLeakyAPStatus();
}

uint64_t Apple80211CopyLeakyAPStatus()
{
  return MEMORY[0x1E0D39D08]();
}

uint64_t Apple80211ParseWPAPassword()
{
  return MEMORY[0x1E0D39D68]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x1E0C801D8](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

Boolean CFArrayContainsValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D10](theArray, range.location, range.length, value);
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D50](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D78](theArray, range.location, range.length, value);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFDataRef CFDataCreateWithBytesNoCopy(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFDataRef)MEMORY[0x1E0C983C8](allocator, bytes, length, bytesDeallocator);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x1E0C98418]();
}

CFComparisonResult CFDateCompare(CFDateRef theDate, CFDateRef otherDate, void *context)
{
  return MEMORY[0x1E0C98440](theDate, otherDate, context);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTimeInterval CFDateGetTimeIntervalSinceDate(CFDateRef theDate, CFDateRef otherDate)
{
  CFTimeInterval result;

  MEMORY[0x1E0C984E0](theDate, otherDate);
  return result;
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98508](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionaryReplaceValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C985F8](theDict, key, value);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98810](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFIndex CFPropertyListWrite(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return MEMORY[0x1E0C98AF8](propertyList, stream, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

void CFSetAddValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98D70](theSet, value);
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
  MEMORY[0x1E0C98D78](theSet, applier, context);
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x1E0C98D80](theSet, value);
}

CFSetRef CFSetCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFSetCallBacks *callBacks)
{
  return (CFSetRef)MEMORY[0x1E0C98D88](allocator, values, numValues, callBacks);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x1E0C98F58](alloc, theString, separatorString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateFromExternalRepresentation(CFAllocatorRef alloc, CFDataRef data, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98F88](alloc, data, *(_QWORD *)&encoding);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFRange CFStringFind(CFStringRef theString, CFStringRef stringToFind, CFStringCompareFlags compareOptions)
{
  CFIndex v3;
  CFIndex v4;
  CFRange result;

  v3 = MEMORY[0x1E0C99050](theString, stringToFind, compareOptions);
  result.length = v4;
  result.location = v3;
  return result;
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringEncoding CFStringGetSystemEncoding(void)
{
  return MEMORY[0x1E0C99168]();
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

Boolean CFStringHasPrefix(CFStringRef theString, CFStringRef prefix)
{
  return MEMORY[0x1E0C99180](theString, prefix);
}

Boolean CFStringHasSuffix(CFStringRef theString, CFStringRef suffix)
{
  return MEMORY[0x1E0C99190](theString, suffix);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

void CFWriteStreamClose(CFWriteStreamRef stream)
{
  MEMORY[0x1E0C99600](stream);
}

CFTypeRef CFWriteStreamCopyProperty(CFWriteStreamRef stream, CFStreamPropertyKey propertyName)
{
  return (CFTypeRef)MEMORY[0x1E0C99610](stream, propertyName);
}

CFWriteStreamRef CFWriteStreamCreateWithAllocatedBuffers(CFAllocatorRef alloc, CFAllocatorRef bufferAllocator)
{
  return (CFWriteStreamRef)MEMORY[0x1E0C99620](alloc, bufferAllocator);
}

Boolean CFWriteStreamOpen(CFWriteStreamRef stream)
{
  return MEMORY[0x1E0C99650](stream);
}

uint64_t CWFCorrectEthernetAddressString()
{
  return MEMORY[0x1E0D1B9F0]();
}

uint64_t EAPTLSRemoveTrustExceptionsBindings()
{
  return MEMORY[0x1E0D1DAC8]();
}

kern_return_t IOMasterPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x1E0CBB690](*(_QWORD *)&bootstrapPort, mainPort);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGGetProductType()
{
  return MEMORY[0x1E0DE2B68]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E588]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

int SCError(void)
{
  return MEMORY[0x1E0CE87E0]();
}

const char *__cdecl SCErrorString(int status)
{
  return (const char *)MEMORY[0x1E0CE87E8](*(_QWORD *)&status);
}

uint64_t SCLog()
{
  return MEMORY[0x1E0CE87F0]();
}

Boolean SCPreferencesApplyChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89B8](prefs);
}

Boolean SCPreferencesCommitChanges(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE89C0](prefs);
}

Boolean SCPreferencesLock(SCPreferencesRef prefs, Boolean wait)
{
  return MEMORY[0x1E0CE89E8](prefs, wait);
}

void SCPreferencesSynchronize(SCPreferencesRef prefs)
{
  MEMORY[0x1E0CE8A30](prefs);
}

Boolean SCPreferencesUnlock(SCPreferencesRef prefs)
{
  return MEMORY[0x1E0CE8A38](prefs);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x1E0C80940](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _SC_CFMachPortCreateWithPort()
{
  return MEMORY[0x1E0CE8B00]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C81708](*(_QWORD *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_f(dispatch_queue_t queue, void *context, dispatch_function_t work)
{
  MEMORY[0x1E0C82C18](queue, context, work);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

uint64_t dispatch_mach_cancel()
{
  return MEMORY[0x1E0C82DB8]();
}

uint64_t dispatch_mach_connect()
{
  return MEMORY[0x1E0C82DC0]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1E0C82DD0]();
}

uint64_t dispatch_mach_mig_demux()
{
  return MEMORY[0x1E0C82DD8]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C82DE8]();
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

ether_addr *__cdecl ether_aton(const char *a1)
{
  return (ether_addr *)MEMORY[0x1E0C83218](a1);
}

char *__cdecl ether_ntoa(const ether_addr *a1)
{
  return (char *)MEMORY[0x1E0C83228](a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
  MEMORY[0x1E0C83CC0](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x1E0C83CE0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_get_attributes(ipc_space_read_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info_out, mach_msg_type_number_t *port_info_outCnt)
{
  return MEMORY[0x1E0C83D20](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info_out, port_info_outCnt);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x1E0C83D48](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x1E0C83D58](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, *(_QWORD *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x1E0C83D70](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&msgid, *(_QWORD *)&sync, *(_QWORD *)&notify, *(_QWORD *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x1E0C83D78](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&flavor, port_info, *(_QWORD *)&port_infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1E0C840F0]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1E0C84108]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x1E0C84410](name, notify_port, *(_QWORD *)&flags, out_token);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

char *__cdecl strcasestr(const char *__big, const char *__little)
{
  return (char *)MEMORY[0x1E0C85508](__big, __little);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t vm_deallocate(vm_map_t target_task, vm_address_t address, vm_size_t size)
{
  return MEMORY[0x1E0C85A98](*(_QWORD *)&target_task, address, size);
}

kern_return_t vm_read(vm_map_read_t target_task, vm_address_t address, vm_size_t size, vm_offset_t *data, mach_msg_type_number_t *dataCnt)
{
  return MEMORY[0x1E0C85AF0](*(_QWORD *)&target_task, address, size, data, dataCnt);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x1E0C85B60](msg);
}

