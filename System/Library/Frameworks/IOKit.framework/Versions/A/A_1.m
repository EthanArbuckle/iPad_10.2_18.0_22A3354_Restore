void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

char *OUTLINED_FUNCTION_2_2(int a1, mach_error_t error_value, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  return mach_error_string(error_value);
}

void OUTLINED_FUNCTION_8_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x20u);
}

uint64_t IOHIDEventServerGetTypeID()
{
  uint64_t result;

  result = __kIOHIDEventServerTypeID;
  if (!__kIOHIDEventServerTypeID)
  {
    pthread_once(&__serviceTypeInit, (void (*)(void))__IOHIDEventServerRegister);
    return __kIOHIDEventServerTypeID;
  }
  return result;
}

uint64_t __IOHIDEventServerRegister()
{
  uint64_t result;

  notify_register_check("com.apple.iohideventsystem.available", (int *)&__hidSystemToken);
  result = _CFRuntimeRegisterClass();
  __kIOHIDEventServerTypeID = result;
  return result;
}

_QWORD *IOHIDEventServerCreate(uint64_t a1, uint64_t a2)
{
  _QWORD *Instance;
  _QWORD *v4;

  if (!__kIOHIDEventServerTypeID)
    pthread_once(&__serviceTypeInit, (void (*)(void))__IOHIDEventServerRegister);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
  {
    Instance[3] = 0;
    Instance[4] = 0;
    Instance[2] = a2;
    __whiteListSet = (uint64_t)CFSetCreate(0, (const void **)__whiteList, 30, MEMORY[0x1E0C9B3B0]);
  }
  return v4;
}

uint64_t IOHIDEventServerScheduleWithDispatchQueue(uint64_t result, NSObject *a2)
{
  uint64_t *v3;
  const __CFAllocator *v4;
  unsigned int Port;
  mach_port_t sp;

  *(_QWORD *)(result + 32) = a2;
  if (a2)
  {
    v3 = (uint64_t *)result;
    result = *(_QWORD *)(result + 24);
    if (result)
      return IOMIGMachPortScheduleWithDispatchQueue(result, a2);
    sp = 0;
    result = bootstrap_check_in(*MEMORY[0x1E0C81720], "com.apple.iohideventsystem", &sp);
    if (!(_DWORD)result)
    {
      v4 = CFGetAllocator(v3);
      result = (uint64_t)IOMIGMachPortCreate(v4, 76, sp);
      v3[3] = result;
      if (result)
      {
        IOMIGMachPortRegisterDemuxCallback(result, (uint64_t)__IOHIDEventServerDemuxCallback, (uint64_t)v3);
        Port = IOMIGMachPortGetPort(v3[3]);
        IOMIGMachPortCacheAdd(Port, v3);
        notify_post("com.apple.iohideventsystem.available");
        result = v3[3];
        if (result)
          return IOMIGMachPortScheduleWithDispatchQueue(result, a2);
      }
    }
  }
  return result;
}

void IOHIDEventServerUnscheduleFromDispatchQueue(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v5;
  NSObject *v6;
  uint64_t i;
  const __CFArray *v8;
  const __CFArray *v9;
  const void *v10;
  NSObject *v11;
  _QWORD block[5];
  uint8_t buf[16];
  CFRange v14;

  if (a2)
  {
    v3 = *(_QWORD *)(a1 + 32);
    if (v3 && v3 == a2)
    {
      v5 = _IOHIDLog();
      if (os_signpost_enabled(v5))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18AAAF000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventServerUnschedule", (const char *)&unk_18AB567C9, buf, 2u);
      }
      dispatch_assert_queue_not_V2(*(dispatch_queue_t *)(a1 + 32));
      v6 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 0x40000000;
      block[2] = __IOHIDEventServerUnscheduleFromDispatchQueue_block_invoke;
      block[3] = &__block_descriptor_tmp_23;
      block[4] = a1;
      dispatch_async_and_wait(v6, block);
      for (i = 0; i != 5; ++i)
      {
        v8 = IOHIDEventSystemCopyConnections(*(CFSetRef **)(a1 + 16), i);
        if (v8)
        {
          v9 = v8;
          v14.length = CFArrayGetCount(v8);
          v14.location = 0;
          CFArrayApplyFunction(v9, v14, (CFArrayApplierFunction)__IOHIDEventServerKillClientFunction, (void *)a1);
          CFRelease(v9);
        }
      }
      v10 = *(const void **)(a1 + 24);
      if (v10)
      {
        CFRelease(v10);
        *(_QWORD *)(a1 + 24) = 0;
      }
      *(_QWORD *)(a1 + 32) = 0;
      v11 = _IOHIDLog();
      if (os_signpost_enabled(v11))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_18AAAF000, v11, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "IOHIDEventServerUnschedule", (const char *)&unk_18AB567C9, buf, 2u);
      }
    }
  }
}

void __IOHIDEventServerKillClientFunction(const void *a1, uint64_t a2)
{
  NSObject *DispatchQueue;
  _QWORD v5[6];

  CFRetain(*(CFTypeRef *)(a2 + 16));
  CFRetain(a1);
  DispatchQueue = _IOHIDEventSystemConnectionGetDispatchQueue((uint64_t)a1);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 0x40000000;
  v5[2] = ____IOHIDEventServerKillClientFunction_block_invoke;
  v5[3] = &__block_descriptor_tmp_69;
  v5[4] = a2;
  v5[5] = a1;
  dispatch_async_and_wait(DispatchQueue, v5);
}

uint64_t _io_hideventsystem_dispatch_event(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  mach_vm_size_t v5;
  CFTypeID TypeID;
  const void *v7;
  const void *v8;
  _QWORD *v9;
  _QWORD *v10;
  CFTypeID v11;
  uint64_t System;
  uint64_t v13;
  CFAllocatorRef v14;
  uint64_t v15;
  const void *v16;
  NSObject *v18;

  v5 = a3;
  TypeID = CFDataGetTypeID();
  v7 = _IOHIDUnserializeAndVMDeallocWithTypeID(a2, v5, TypeID);
  if (v7)
  {
    v8 = v7;
    v9 = IOMIGMachPortCacheCopy(a1);
    if (v9)
    {
      v10 = v9;
      v11 = CFGetTypeID(v9);
      if (v11 == IOHIDEventSystemConnectionGetTypeID())
      {
        if (IOHIDEventSystemConnectionGetType((uint64_t)v10)
          && (*(_BYTE *)IOHIDEventSystemConnectionGetEntitlements((uint64_t)v10) & 8) == 0)
        {
          v18 = _IOHIDLogCategory(0);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            _io_hideventsystem_dispatch_event_cold_1((uint64_t)v10);
        }
        else
        {
          System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v10);
          if (System)
          {
            v13 = System;
            v14 = CFGetAllocator(v10);
            v15 = IOHIDEventCreateWithDataInternal(v14, v8);
            if (v15)
            {
              v16 = (const void *)v15;
              _IOHIDEventSystemConnectionLogEvent(v10, v15);
              _IOHIDEventSystemDispatchEvent(v13, v16);
              CFRelease(v16);
            }
          }
        }
      }
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  return 0;
}

uint64_t _io_hideventsystem_do_client_refresh(unsigned int a1, vm_offset_t *a2, _DWORD *a3)
{
  CFSetRef *v5;
  CFSetRef *v6;
  CFTypeID v7;
  const __CFSet *v8;
  const __CFSet *v9;
  CFIndex Count;
  const void **v11;
  const void **v12;
  const __CFArray *v13;
  CFSetRef *v14;
  const __CFArray *v15;
  const __CFArray *v16;

  *a3 = 0;
  v5 = (CFSetRef *)IOMIGMachPortCacheCopy(a1);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 != IOHIDEventSystemConnectionGetTypeID())
      goto LABEL_10;
    if (!_IOHIDEventSystemConnectionGetSystem((uint64_t)v6))
      goto LABEL_10;
    v8 = _IOHIDEventSystemConnectionCopyServices(v6);
    if (!v8)
      goto LABEL_10;
    v9 = v8;
    Count = CFSetGetCount(v8);
    v11 = (const void **)malloc_type_calloc(Count, 8uLL, 0xC0040B8AA526DuLL);
    if (v11)
    {
      v12 = v11;
      CFSetGetValues(v9, v11);
      v13 = CFArrayCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v12, Count, MEMORY[0x1E0C9B378]);
      v14 = (CFSetRef *)v13;
      if (v13 && (v15 = _IOHIDCopyServiceClientInfo(v13)) != 0)
      {
        v16 = v15;
        *a3 = _IOHIDSerialize(v15, a2);
        free(v12);
        CFRelease(v16);
      }
      else
      {
        free(v12);
      }
    }
    else
    {
      v14 = 0;
    }
    CFRelease(v9);
    CFRelease(v6);
    v6 = v14;
    if (v14)
LABEL_10:
      CFRelease(v6);
  }
  return 0;
}

uint64_t _io_hideventsystem_service_conforms_to(unsigned int a1, UInt8 *bytes, CFIndex length, int a4, int a5, _DWORD *a6)
{
  CFPropertyListRef v10;
  const void *v11;
  const void *v12;
  const void *v13;
  CFTypeID v14;
  uint64_t System;
  const void *v16;
  const void *v17;

  *a6 = 0;
  v10 = _IOHIDUnserializeAndVMDealloc(bytes, length);
  if (v10)
  {
    v11 = v10;
    v12 = IOMIGMachPortCacheCopy(a1);
    if (v12)
    {
      v13 = v12;
      v14 = CFGetTypeID(v12);
      if (v14 == IOHIDEventSystemConnectionGetTypeID())
      {
        System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v13);
        if (System)
        {
          v16 = IOHIDEventSystemCopyService(System, v11);
          if (v16)
          {
            v17 = v16;
            *a6 = IOHIDServiceConformsTo((uint64_t)v16, a4, a5);
            CFRelease(v17);
          }
        }
      }
      CFRelease(v11);
    }
    else
    {
      v13 = v11;
    }
    CFRelease(v13);
  }
  return 0;
}

uint64_t _io_hideventsystem_copy_matching_event_for_service(unsigned int a1, uint64_t a2, UInt8 *a3, unsigned int a4, vm_offset_t *a5, _DWORD *a6)
{
  mach_vm_size_t v10;
  CFTypeID TypeID;
  const __CFDictionary *v12;
  CFNumberRef v13;
  const void *v14;
  const void *v15;
  CFTypeID v16;
  uint64_t System;
  const void *v18;
  const void *v19;
  uint64_t v20;
  const void *v21;
  const __CFAllocator *v22;
  __CFData *DataInternal;
  __CFData *v24;
  uint64_t valuePtr;

  valuePtr = a2;
  *a6 = 0;
  v10 = a4;
  TypeID = CFDictionaryGetTypeID();
  v12 = (const __CFDictionary *)_IOHIDUnserializeAndVMDeallocWithTypeID(a3, v10, TypeID);
  v13 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt64Type, &valuePtr);
  if (v13)
  {
    v14 = IOMIGMachPortCacheCopy(a1);
    v15 = v14;
    if (v14)
    {
      v16 = CFGetTypeID(v14);
      if (v16 == IOHIDEventSystemConnectionGetTypeID()
        && IOHIDEventSystemConnectionGetType((uint64_t)v15) != 2
        && IOHIDEventSystemConnectionGetType((uint64_t)v15) != 4)
      {
        System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v15);
        if (System)
        {
          v18 = IOHIDEventSystemCopyService(System, v13);
          v19 = v18;
          if (v18)
          {
            v20 = IOHIDServiceCopyMatchingEvent((uint64_t)v18, v12, v15);
            if (v20)
            {
              v21 = (const void *)v20;
              v22 = CFGetAllocator(v15);
              DataInternal = IOHIDEventCreateDataInternal(v22, (uint64_t)v21);
              if (DataInternal)
              {
                v24 = DataInternal;
                *a6 = _IOHIDSerialize(DataInternal, a5);
                CFRelease(v24);
              }
              CFRelease(v21);
            }
          }
          if (v12)
            goto LABEL_13;
          goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v15 = 0;
  }
  v19 = 0;
  if (v12)
LABEL_13:
    CFRelease(v12);
LABEL_14:
  if (v19)
    CFRelease(v19);
  if (v13)
    CFRelease(v13);
  if (v15)
    CFRelease(v15);
  return 0;
}

uint64_t _io_hideventsystem_set_element_value_for_service(unsigned int a1, UInt8 *bytes, CFIndex length, int a4, char a5, int a6, int *a7)
{
  int v12;
  CFPropertyListRef v13;
  const void *v14;
  const void *v15;
  const void *v16;
  CFTypeID v17;
  uint64_t System;
  const void *v19;
  const void *v20;

  v12 = -536870212;
  v13 = _IOHIDUnserializeAndVMDealloc(bytes, length);
  if (v13)
  {
    v14 = v13;
    v15 = IOMIGMachPortCacheCopy(a1);
    if (v15)
    {
      v16 = v15;
      v17 = CFGetTypeID(v15);
      if (v17 == IOHIDEventSystemConnectionGetTypeID())
      {
        System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v16);
        if (System)
        {
          v19 = IOHIDEventSystemCopyService(System, v14);
          if (v19)
          {
            v20 = v19;
            v12 = IOHIDServiceSetElementValue((uint64_t)v19, a4, a5, a6);
            CFRelease(v20);
          }
        }
      }
      CFRelease(v14);
    }
    else
    {
      v16 = v14;
    }
    CFRelease(v16);
  }
  *a7 = v12;
  return 0;
}

uint64_t _io_hideventsystem_copy_properties_for_service(unsigned int a1, UInt8 *bytes, CFIndex length, UInt8 *a4, unsigned int a5, vm_offset_t *a6, _DWORD *a7, int *a8)
{
  int v14;
  CFPropertyListRef v15;
  CFTypeID TypeID;
  const __CFArray *v17;
  const __CFArray *v18;
  const void *v19;
  const void *v20;
  CFTypeID v21;
  uint64_t v22;
  uint64_t System;
  const void *v24;
  const void *v25;
  CFMutableDictionaryRef v26;

  *a7 = 0;
  v14 = -536870206;
  v15 = _IOHIDUnserializeAndVMDealloc(bytes, length);
  TypeID = CFArrayGetTypeID();
  v17 = (const __CFArray *)_IOHIDUnserializeAndVMDeallocWithTypeID(a4, a5, TypeID);
  v18 = v17;
  if (v17 && v15)
  {
    v19 = IOMIGMachPortCacheCopy(a1);
    v20 = v19;
    if (v19)
    {
      v21 = CFGetTypeID(v19);
      v22 = IOHIDEventSystemConnectionGetTypeID();
      if (a6)
      {
        if (v21 == v22)
        {
          System = _IOHIDEventSystemConnectionGetSystem((uint64_t)v20);
          if (System)
          {
            v24 = IOHIDEventSystemCopyService(System, v15);
            if (v24)
            {
              v25 = v24;
              v26 = _IOHIDServiceCopyPropertiesForClient((uint64_t)v24, v18, (uint64_t)v20);
              *a7 = _IOHIDSerialize(v26, a6);
              if (v26)
                CFRelease(v26);
              CFRelease(v18);
              CFRelease(v25);
              v14 = 0;
              goto LABEL_11;
            }
            v14 = -536870160;
          }
          else
          {
            v14 = -536870185;
          }
        }
      }
    }
    goto LABEL_19;
  }
  v20 = 0;
  if (v17)
LABEL_19:
    CFRelease(v18);
  if (v15)
LABEL_11:
    CFRelease(v15);
  if (v20)
    CFRelease(v20);
  *a8 = v14;
  return 0;
}

uint64_t _io_hideventsystem_register_property_changed_notification(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  mach_vm_size_t v5;
  CFTypeID TypeID;
  const void *v7;
  const void *v8;
  _QWORD *v9;
  _QWORD *v10;
  CFTypeID v11;

  v5 = a3;
  TypeID = CFStringGetTypeID();
  v7 = _IOHIDUnserializeAndVMDeallocWithTypeID(a2, v5, TypeID);
  if (v7)
  {
    v8 = v7;
    v9 = IOMIGMachPortCacheCopy(a1);
    if (v9)
    {
      v10 = v9;
      v11 = CFGetTypeID(v9);
      if (v11 == IOHIDEventSystemConnectionGetTypeID())
        _IOHIDEventSystemConnectionRegisterPropertyChangedNotification(v10, v8);
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_property_changed_notification(unsigned int a1, UInt8 *a2, unsigned int a3)
{
  mach_vm_size_t v5;
  CFTypeID TypeID;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  CFTypeID v11;

  v5 = a3;
  TypeID = CFStringGetTypeID();
  v7 = _IOHIDUnserializeAndVMDeallocWithTypeID(a2, v5, TypeID);
  if (v7)
  {
    v8 = v7;
    v9 = IOMIGMachPortCacheCopy(a1);
    if (v9)
    {
      v10 = v9;
      v11 = CFGetTypeID(v9);
      if (v11 == IOHIDEventSystemConnectionGetTypeID())
        _IOHIDEventSystemConnectionUnregisterPropertyChangedNotification((uint64_t)v10, v8);
      CFRelease(v10);
    }
    CFRelease(v8);
  }
  return 0;
}

uint64_t _io_hideventsystem_register_event_filter(unsigned int a1, int a2)
{
  const void *v3;
  const void *v4;
  CFTypeID v5;
  NSObject *v7;

  v3 = IOMIGMachPortCacheCopy(a1);
  if (v3)
  {
    v4 = v3;
    v5 = CFGetTypeID(v3);
    if (v5 == IOHIDEventSystemConnectionGetTypeID())
    {
      if (IOHIDEventSystemConnectionGetType((uint64_t)v4)
        && (*(_BYTE *)IOHIDEventSystemConnectionGetEntitlements((uint64_t)v4) & 4) == 0)
      {
        v7 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          _io_hideventsystem_register_event_filter_cold_1((uint64_t)v4);
      }
      else
      {
        _IOHIDEventSystemConnectionRegisterEventFilter((uint64_t)v4, a2);
      }
    }
    CFRelease(v4);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_event_filter(unsigned int a1)
{
  _QWORD *v1;
  _QWORD *v2;
  CFTypeID v3;

  v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID())
      _IOHIDEventSystemConnectionUnregisterEventFilter(v2);
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_register_record_client_changed_notification(unsigned int a1)
{
  _QWORD *v1;
  _QWORD *v2;
  CFTypeID v3;
  NSObject *v5;

  v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID())
    {
      if (IOHIDEventSystemConnectionGetType((uint64_t)v2))
      {
        v5 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          _io_hideventsystem_register_record_client_changed_notification_cold_1((uint64_t)v2);
      }
      else
      {
        _IOHIDEventSystemConnectionRegisterRecordClientChanged(v2);
      }
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_record_client_changed_notification(unsigned int a1)
{
  _QWORD *v1;
  _QWORD *v2;
  CFTypeID v3;

  v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID())
      _IOHIDEventSystemConnectionUnregisterRecordClientChanged(v2);
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_register_record_service_changed_notification(unsigned int a1)
{
  _QWORD *v1;
  _QWORD *v2;
  CFTypeID v3;
  NSObject *v5;

  v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID())
    {
      if (IOHIDEventSystemConnectionGetType((uint64_t)v2))
      {
        v5 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
          _io_hideventsystem_register_record_client_changed_notification_cold_1((uint64_t)v2);
      }
      else
      {
        _IOHIDEventSystemConnectionRegisterRecordServiceChanged(v2);
      }
    }
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_unregister_record_service_changed_notification(unsigned int a1)
{
  _QWORD *v1;
  _QWORD *v2;
  CFTypeID v3;

  v1 = IOMIGMachPortCacheCopy(a1);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 == IOHIDEventSystemConnectionGetTypeID())
      _IOHIDEventSystemConnectionUnregisterRecordServiceChanged(v2);
    CFRelease(v2);
  }
  return 0;
}

uint64_t _io_hideventsystem_remove_virtual_service(unsigned int a1, const void *a2)
{
  uint64_t v3;
  const void *v4;
  const void *v5;
  CFTypeID v6;

  v3 = 3758097090;
  v4 = IOMIGMachPortCacheCopy(a1);
  if (v4)
  {
    v5 = v4;
    v6 = CFGetTypeID(v4);
    if (v6 == IOHIDEventSystemConnectionGetTypeID())
    {
      _IOHIDEventSystemConnectionRemoveVirtualService((uint64_t)v5, a2);
      v3 = 0;
    }
    CFRelease(v5);
  }
  return v3;
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void checkFeatureEnabled()
{
  if (checkFeatureEnabled_onceToken != -1)
    dispatch_once(&checkFeatureEnabled_onceToken, &__block_literal_global_14);
}

void __checkFeatureEnabled_block_invoke()
{
  NSObject *PMQueue;

  PMQueue = getPMQueue();
  dispatch_sync(PMQueue, &__block_literal_global_2);
}

void __checkFeatureEnabled_block_invoke_2()
{
  xpc_connection_t mach_service;
  _xpc_connection_s *v1;
  NSObject *PMQueue;
  xpc_object_t v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1E0C80D38], 0);
  if (mach_service)
  {
    v1 = mach_service;
    PMQueue = getPMQueue();
    xpc_connection_set_target_queue(v1, PMQueue);
    xpc_connection_set_event_handler(v1, &__block_literal_global_7);
    xpc_connection_resume(v1);
    v3 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v3, "assertionFeatureSupported", 1);
    v4 = getPMQueue();
    xpc_connection_send_message_with_reply(v1, v3, v4, &__block_literal_global_11);
    if (v3)
      xpc_release(v3);
    xpc_release(v1);
  }
  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
      __checkFeatureEnabled_block_invoke_2_cold_2();
  }
  else
  {
    v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v5)
      __checkFeatureEnabled_block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
  }
}

void __checkFeatureEnabled_block_invoke_2_9(uint64_t a1, void *a2)
{
  _BOOL4 v3;
  uint64_t v4;
  NSObject *v5;
  int v6;
  _BOOL4 v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (MEMORY[0x18D773128](a2) == MEMORY[0x1E0C812F8])
  {
    v3 = xpc_dictionary_get_BOOL(a2, "assertionFeatureSupported");
    v4 = assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        v6 = 67109120;
        v7 = v3;
        v5 = v4;
LABEL_7:
        _os_log_impl(&dword_18AAAF000, v5, OS_LOG_TYPE_DEFAULT, "Assertion feature: setting gAsyncMode to %d", (uint8_t *)&v6, 8u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v6 = 67109120;
      v7 = v3;
      v5 = MEMORY[0x1E0C81028];
      goto LABEL_7;
    }
    gAsyncMode = v3;
  }
}

uint64_t IOPMEnableAsyncAssertions()
{
  gAsyncMode = 1;
  return 0;
}

uint64_t IOPMDisableAsyncAssertions()
{
  gAsyncMode = 0;
  return 0;
}

void setupLogging()
{
  if (setupLogging_onceToken != -1)
    dispatch_once(&setupLogging_onceToken, &__block_literal_global_13);
}

os_log_t __setupLogging_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.iokit", "assertions");
  assertions_log = (uint64_t)result;
  return result;
}

void handleAsyncAssertionDisableOverride(int a1)
{
  uint64_t v1;
  uint8_t *v2;
  NSObject *v3;
  _BOOL4 v4;
  char v5;
  uint8_t *v6;
  NSObject *v7;
  _BOOL4 v8;
  __int16 v9;
  __int16 v10;
  uint8_t buf[2];
  __int16 v12;

  v1 = assertions_log;
  if (a1)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 0;
        v2 = (uint8_t *)&v12;
        v3 = v1;
LABEL_10:
        _os_log_impl(&dword_18AAAF000, v3, OS_LOG_TYPE_DEFAULT, "gAsyncModeDisableOverride: enable", v2, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v3 = MEMORY[0x1E0C81028];
      v2 = buf;
      goto LABEL_10;
    }
    v5 = 1;
    goto LABEL_15;
  }
  if (!assertions_log)
  {
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT);
    v5 = 0;
    if (!v8)
      goto LABEL_15;
    v9 = 0;
    v7 = MEMORY[0x1E0C81028];
    v6 = (uint8_t *)&v9;
LABEL_14:
    _os_log_impl(&dword_18AAAF000, v7, OS_LOG_TYPE_DEFAULT, "gAsyncModeDisableOverride: disable", v6, 2u);
    v5 = 0;
    goto LABEL_15;
  }
  v4 = os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT);
  v5 = 0;
  if (v4)
  {
    v10 = 0;
    v6 = (uint8_t *)&v10;
    v7 = v1;
    goto LABEL_14;
  }
LABEL_15:
  gAsyncModeDisableOverride = v5;
}

void __initialSetup_block_invoke(uint64_t a1, int token)
{
  notify_get_state(token, (uint64_t *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
  handleAsyncAssertionDisableOverride(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24));
}

void __initialSetup_block_invoke_20()
{
  uint64_t v0;
  uint8_t *v1;
  NSObject *v2;
  __int16 v3;
  __int16 v4;

  v0 = assertions_log;
  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
    {
      v4 = 0;
      v1 = (uint8_t *)&v4;
      v2 = v0;
LABEL_6:
      _os_log_impl(&dword_18AAAF000, v2, OS_LOG_TYPE_DEFAULT, "Re-syncing assertions", v1, 2u);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = 0;
    v2 = MEMORY[0x1E0C81028];
    v1 = (uint8_t *)&v3;
    goto LABEL_6;
  }
  offloadAssertions(1);
}

void __initialSetup_block_invoke_23(uint64_t a1, void *a2)
{
  processRemoteMsg(a2);
}

void __initialSetup_block_invoke_27()
{
  offloadAssertions(0);
}

void __initialSetup_block_invoke_2()
{
  dispatch_release((dispatch_object_t)gAssertionsOffloader);
  gAssertionsOffloader = 0;
}

BOOL multipleActiveAssertionsExist()
{
  return (int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) > 1;
}

BOOL activeAssertions()
{
  return (int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) > 0;
}

void clearAssertionLogBuffer()
{
  gAsyncAssertionActivityLog_2 = 0;
  gAsyncAssertionActivityLog_0 = 0;
  if (gAsyncAssertionActivityLog_1)
    CFArrayRemoveAllValues((CFMutableArrayRef)gAsyncAssertionActivityLog_1);
}

void processCheckAssertionsMsg(void *a1)
{
  NSObject *PMQueue;
  unsigned int v3;
  xpc_object_t reply;
  void *v5;
  uint64_t uint64;
  uint64_t v7;
  NSObject *v8;
  _xpc_connection_s *remote_connection;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  unsigned int v19;
  __int16 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if ((int)CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) < 1)
  {
    v3 = 0;
  }
  else
  {
    PMQueue = getPMQueue();
    dispatch_async(PMQueue, &__block_literal_global_68_0);
    v3 = 1;
  }
  reply = xpc_dictionary_create_reply(a1);
  if (reply)
  {
    v5 = reply;
    uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
    xpc_dictionary_set_uint64(v5, "assertionCheckToken", uint64);
    xpc_dictionary_set_uint64(v5, "assertionCheckCount", v3);
    v7 = assertions_log;
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      {
        v18 = 67109376;
        v19 = v3;
        v20 = 2048;
        v21 = uint64;
        v8 = v7;
LABEL_13:
        _os_log_impl(&dword_18AAAF000, v8, OS_LOG_TYPE_DEFAULT, "Replying to assertion check message with count %d token:%llu\n", (uint8_t *)&v18, 0x12u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v18 = 67109376;
      v19 = v3;
      v20 = 2048;
      v21 = uint64;
      v8 = MEMORY[0x1E0C81028];
      goto LABEL_13;
    }
    remote_connection = xpc_dictionary_get_remote_connection(a1);
    xpc_connection_send_message(remote_connection, v5);
    xpc_release(v5);
    return;
  }
  if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
      processCheckAssertionsMsg_cold_2();
  }
  else
  {
    v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v10)
      processCheckAssertionsMsg_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void __processCheckAssertionsMsg_block_invoke()
{
  if (gCurrentRemoteAssertion)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
        __processCheckAssertionsMsg_block_invoke_cold_2();
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      __processCheckAssertionsMsg_block_invoke_cold_1();
    }
  }
  offloadAssertions(1);
}

void processCurrentActiveAssertions(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  xpc_object_t reply;
  void *v5;
  uint64_t uint64;
  __CFArray *Mutable;
  char *v8;
  NSObject *v9;
  const void *v10;
  CFTypeID TypeID;
  NSObject *v12;
  void *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t buf[8];
  uint8_t v31[4];
  int v32[3];
  uint8_t v33[4];
  int v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v2 = assertions_log;
  if (assertions_log)
  {
    if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = v2;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_7;
    *(_WORD *)buf = 0;
    v3 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_18AAAF000, v3, OS_LOG_TYPE_DEFAULT, "Powerd has requested active assertions update", buf, 2u);
LABEL_7:
  if (gAssertionConnection)
  {
    reply = xpc_dictionary_create_reply(a1);
    if (reply)
    {
      v5 = reply;
      uint64 = xpc_dictionary_get_uint64(a1, "assertionCheckToken");
      xpc_dictionary_set_uint64(v5, "assertionCheckToken", uint64);
      if (gActiveAssertionsDict && CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) >= 1)
      {
        Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
        v8 = 0;
        v9 = MEMORY[0x1E0C81028];
        do
        {
          *(_QWORD *)buf = 0;
          if (CFDictionaryGetValueIfPresent((CFDictionaryRef)gActiveAssertionsDict, v8, (const void **)buf))
          {
            v10 = *(const void **)buf;
            TypeID = CFDictionaryGetTypeID();
            if (v10 && CFGetTypeID(v10) == TypeID)
            {
              CFArrayAppendValue(Mutable, *(const void **)buf);
            }
            else
            {
              v12 = assertions_log;
              if (assertions_log)
              {
                if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)v33 = 67109120;
                  v34 = (int)v8;
                  _os_log_error_impl(&dword_18AAAF000, v12, OS_LOG_TYPE_ERROR, "Not a dictianary for 0x%x", v33, 8u);
                }
              }
              else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
              {
                processCurrentActiveAssertions_cold_5(v31, (int)v8, v32);
              }
            }
          }
          ++v8;
        }
        while (v8 != (char *)128);
        v13 = (void *)_CFXPCCreateXPCObjectFromCFObject();
        xpc_dictionary_set_value(v5, "assertionUpdateActives", v13);
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v5);
        if (v13)
          xpc_release(v13);
        xpc_release(v5);
        if (Mutable)
          CFRelease(Mutable);
      }
      else
      {
        xpc_connection_send_message((xpc_connection_t)gAssertionConnection, v5);
        xpc_release(v5);
      }
    }
    else if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
        processAssertionUpdateActivity_cold_4();
    }
    else
    {
      v22 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v22)
        processAssertionUpdateActivity_cold_3(v22, v23, v24, v25, v26, v27, v28, v29);
    }
  }
  else if (assertions_log)
  {
    if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
      processCurrentActiveAssertions_cold_2();
  }
  else
  {
    v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v14)
      processCurrentActiveAssertions_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
  }
}

void __insertIntoTimedList_block_invoke_2()
{
  dispatch_release((dispatch_object_t)gAssertionTimer);
  gAssertionTimer = 0;
}

uint64_t IOPMGetCurrentAsyncActiveAssertions()
{
  if (!gAssertionsDict)
    return 0;
  if (CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict) <= 0)
    return 0;
  return gActiveAssertionsDict;
}

uint64_t IOPMGetCurrentAsyncReleasedAssertions()
{
  uint64_t result;

  result = gReleasedAssertionsList;
  if (gReleasedAssertionsList)
  {
    if (CFArrayGetCount((CFArrayRef)gReleasedAssertionsList) <= 0)
      return 0;
    else
      return gReleasedAssertionsList;
  }
  return result;
}

uint64_t IOPMGetCurrentAsyncInactiveAssertions()
{
  uint64_t result;

  result = gInactiveAssertionsDict;
  if (gInactiveAssertionsDict)
  {
    if (CFDictionaryGetCount((CFDictionaryRef)gInactiveAssertionsDict) <= 0)
      return 0;
    else
      return gInactiveAssertionsDict;
  }
  return result;
}

uint64_t IOPMGetCurrentAsyncTimedAssertions()
{
  uint64_t result;

  result = gTimedAssertionsList;
  if (gTimedAssertionsList)
  {
    if (CFArrayGetCount((CFArrayRef)gTimedAssertionsList) <= 0)
      return 0;
    else
      return gTimedAssertionsList;
  }
  return result;
}

const void *IOPMGetCurrentAsycnRemoteAssertion()
{
  const void *result;

  if (!gCurrentAssertion)
    return 0;
  result = CFDictionaryGetValue((CFDictionaryRef)gAssertionsDict, (const void *)(((unint64_t)gCurrentAssertion >> 16) & 0x7FFF));
  if (!result)
    return 0;
  return result;
}

uint64_t IOPMCopyActiveAsyncAssertionsByProcess()
{
  xpc_connection_t mach_service;
  _xpc_connection_s *v1;
  NSObject *PMQueue;
  xpc_object_t v3;
  void *v4;
  xpc_object_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL8 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BOOL8 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BOOL8 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v42;
  uint64_t v43;
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", MEMORY[0x1E0C80D38], 0);
  if (!mach_service)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
        IOPMCopyActiveAsyncAssertionsByProcess_cold_2();
    }
    else
    {
      v9 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v9)
        IOPSGaugingMitigationGetState_cold_1(v9, v10, v11, v12, v13, v14, v15, v16);
    }
    return 0;
  }
  v1 = mach_service;
  PMQueue = getPMQueue();
  xpc_connection_set_target_queue(v1, PMQueue);
  xpc_connection_set_event_handler(v1, &__block_literal_global_121);
  xpc_connection_resume(v1);
  v3 = xpc_dictionary_create(0, 0, 0);
  if (!v3)
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
        IOPMCopyActiveAsyncAssertionsByProcess_cold_4();
    }
    else
    {
      v25 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v25)
        IOPMCopyActiveAsyncAssertionsByProcess_cold_3(v25, v26, v27, v28, v29, v30, v31, v32);
    }
    return 0;
  }
  v4 = v3;
  xpc_dictionary_set_BOOL(v3, "assertionActiveAsyncByProcess", 1);
  v5 = xpc_connection_send_message_with_reply_sync(v1, v4);
  if (MEMORY[0x18D773128]() != MEMORY[0x1E0C812F8])
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
        IOPMCopyActiveAsyncAssertionsByProcess_cold_8();
    }
    else
    {
      v17 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v17)
        IOPMCopyActiveAsyncAssertionsByProcess_cold_7(v17, v18, v19, v20, v21, v22, v23, v24);
    }
LABEL_32:
    v6 = 0;
    goto LABEL_33;
  }
  if (!xpc_dictionary_get_value(v5, "assertionActiveAsyncByProcess"))
  {
    if (assertions_log)
    {
      if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
        IOPMCopyActiveAsyncAssertionsByProcess_cold_6();
    }
    else
    {
      v33 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v33)
        IOPMCopyActiveAsyncAssertionsByProcess_cold_5(v33, v34, v35, v36, v37, v38, v39, v40);
    }
    goto LABEL_32;
  }
  v6 = _CFXPCCreateCFObjectFromXPCObject();
  v7 = assertions_log;
  if (assertions_log)
  {
    if (!os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    v42 = 138412290;
    v43 = v6;
    v8 = v7;
  }
  else
  {
    if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      goto LABEL_33;
    v42 = 138412290;
    v43 = v6;
    v8 = MEMORY[0x1E0C81028];
  }
  _os_log_impl(&dword_18AAAF000, v8, OS_LOG_TYPE_DEFAULT, "Received active assertions from powerd %@", (uint8_t *)&v42, 0xCu);
LABEL_33:
  xpc_release(v4);
  if (v5)
    xpc_release(v5);
  return v6;
}

IOReturn IOPMAssertionCreate(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, IOPMAssertionID *AssertionID)
{
  return IOPMAssertionCreateWithName(AssertionType, AssertionLevel, CFSTR("Nameless (via IOPMAssertionCreate)"), AssertionID);
}

uint64_t IOPMAssertionCreateWithAutoTimeout(const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, IOPMAssertionID *a7, double a8)
{
  uint64_t result;
  __CFDictionary *AssertionDescription;
  const __CFDictionary *v12;
  uint64_t v13;

  result = 3758097090;
  if (a1 && a2 && a7)
  {
    AssertionDescription = createAssertionDescription(a1, a2, a3, a4, a5, a6, a8);
    if (AssertionDescription)
    {
      v12 = AssertionDescription;
      CFDictionarySetValue(AssertionDescription, CFSTR("AutoTimesout"), (const void *)*MEMORY[0x1E0C9AE50]);
      v13 = IOPMAssertionCreateWithProperties(v12, a7);
      CFRelease(v12);
      return v13;
    }
    else
    {
      return 3758097084;
    }
  }
  return result;
}

uint64_t IOPMAssertionCreateWithResourceList(const void *a1, const void *a2, const void *a3, const void *a4, const void *a5, const void *a6, const void *a7, IOPMAssertionID *a8, double a9)
{
  uint64_t v9;
  CFTypeID TypeID;
  __CFDictionary *AssertionDescription;
  const __CFDictionary *v21;
  uint64_t v22;

  v9 = 3758097090;
  if (a1)
  {
    if (a2)
    {
      if (a8)
      {
        TypeID = CFArrayGetTypeID();
        if (a7)
        {
          if (CFGetTypeID(a7) == TypeID)
          {
            AssertionDescription = createAssertionDescription(a1, a2, a3, a4, a5, a6, a9);
            if (AssertionDescription)
            {
              v21 = AssertionDescription;
              CFDictionarySetValue(AssertionDescription, CFSTR("ResourcesUsed"), a7);
              v22 = IOPMAssertionCreateWithProperties(v21, a8);
              CFRelease(v21);
              return v22;
            }
            return 3758097084;
          }
        }
      }
    }
  }
  return v9;
}

void saveBackTrace(__CFDictionary *a1)
{
  int v2;
  char **v3;
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  CFIndex i;
  CFStringRef v7;
  CFStringRef v8;
  _OWORD v9[4];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, sizeof(v9));
  v2 = backtrace((void **)v9, 8);
  v3 = backtrace_symbols((void *const *)v9, v2);
  Mutable = CFArrayCreateMutable(0, v2, MEMORY[0x1E0C9B378]);
  v5 = Mutable;
  if (v3 && Mutable)
  {
    if (v2 >= 1)
    {
      for (i = 0; i != v2; ++i)
      {
        v7 = CFStringCreateWithCString(0, v3[i], 0);
        if (v7)
        {
          v8 = v7;
          CFArrayInsertValueAtIndex(v5, i, v7);
          CFRelease(v8);
        }
        else
        {
          CFArrayInsertValueAtIndex(v5, i, CFSTR(" "));
        }
      }
    }
    CFDictionarySetValue(a1, CFSTR("CreatorBacktrace"), v5);
  }
  if (v5)
    CFRelease(v5);
  if (v3)
    free(v3);
}

uint64_t IOPMPerformBlockWithAssertion(CFDictionaryRef AssertionProperties, uint64_t a2)
{
  uint64_t result;
  IOPMAssertionID AssertionID;

  AssertionID = 0;
  result = 3758097090;
  if (AssertionProperties)
  {
    if (a2)
    {
      result = IOPMAssertionCreateWithProperties(AssertionProperties, &AssertionID);
      if (!(_DWORD)result)
      {
        (*(void (**)(uint64_t))(a2 + 16))(a2);
        result = AssertionID;
        if (AssertionID)
        {
          IOPMAssertionRelease(AssertionID);
          return 0;
        }
      }
    }
  }
  return result;
}

void IOPMAssertionRetain(IOPMAssertionID theAssertion)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v13 = -536870212;
  v12 = 0;
  v11 = 0;
  v10 = 0;
  if (theAssertion)
  {
    if (pm_connect_init(&v12))
      goto LABEL_3;
    if (theAssertion >= 0x10000 && gAssertionsDict)
    {
      if (assertions_log)
      {
        if (os_log_type_enabled((os_log_t)assertions_log, OS_LOG_TYPE_ERROR))
          IOPMAssertionRetain_cold_2();
      }
      else
      {
        v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
        if (v2)
          IOPMAssertionRetain_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
      }
      goto LABEL_3;
    }
    if (io_pm_assertion_retain_release(v12, theAssertion, 1, &v10, (_DWORD *)&v11 + 1, &v11, &v13))
    {
LABEL_3:
      v13 = -536870199;
      goto LABEL_5;
    }
    entr_act_modify();
  }
  else
  {
    v13 = -536870206;
  }
LABEL_5:
  if (v12)
    _pm_disconnect();
}

uint64_t IOPMAssertionSetProcessState(int a1, unsigned int a2)
{
  uint64_t v4;
  NSObject *global_queue;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  void *v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v4 = 3758097084;
  global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.iokit.powerdxpc", global_queue, 0);
  if (mach_service)
  {
    v7 = mach_service;
    xpc_connection_set_target_queue(mach_service, global_queue);
    xpc_connection_set_event_handler(v7, &__block_literal_global_136_0);
    v8 = xpc_dictionary_create(0, 0, 0);
    if (v8)
    {
      v9 = v8;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        IOPMAssertionSetProcessState_cold_2();
      xpc_dictionary_set_uint64(v9, "pid", a1);
      xpc_dictionary_set_uint64(v9, "assertionSetState", a2);
      xpc_connection_resume(v7);
      xpc_connection_send_message(v7, v9);
      xpc_release(v9);
      xpc_release(v7);
      return 0;
    }
    else
    {
      xpc_release(v7);
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v10)
        sendAsyncReleaseMsg_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  return v4;
}

uint64_t IOPMAssertionSetTimeout(IOPMAssertionID a1, double a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t v5;
  int valuePtr;

  valuePtr = (int)a2;
  v3 = CFNumberCreate(0, kCFNumberIntType, &valuePtr);
  if (!v3)
    return 3758097084;
  v4 = v3;
  v5 = IOPMAssertionSetProperty(a1, CFSTR("TimeoutSeconds"), v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOPMAssertionDeclareNotificationEvent(const __CFString *a1, IOPMAssertionID *a2, CFTimeInterval a3)
{
  uint64_t v6;
  io_registry_entry_t PMRootDomainRef;
  io_registry_entry_t v8;
  const __CFAllocator *v9;
  CFTypeRef CFProperty;
  CFTypeRef v11;
  const void *v12;
  IOPMAssertionID AssertionID;

  v6 = 3758097097;
  AssertionID = 0;
  PMRootDomainRef = getPMRootDomainRef();
  if (!PMRootDomainRef)
    return v6;
  v8 = PMRootDomainRef;
  v9 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  CFProperty = IORegistryEntryCreateCFProperty(PMRootDomainRef, CFSTR("DesktopMode"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v11 = IORegistryEntryCreateCFProperty(v8, CFSTR("AppleClamshellState"), v9, 0);
  v12 = v11;
  if ((CFTypeRef)*MEMORY[0x1E0C9AE50] != v11 || *MEMORY[0x1E0C9AE40] != (_QWORD)CFProperty)
  {
    v6 = IOPMAssertionCreateWithDescription(CFSTR("DisplayWake"), a1, 0, 0, 0, a3, CFSTR("TimeoutActionRelease"), &AssertionID);
    if (a2)
      *a2 = AssertionID;
    if (!v12)
      goto LABEL_10;
    goto LABEL_9;
  }
  v6 = 3758097112;
  if (v11)
LABEL_9:
    CFRelease(v12);
LABEL_10:
  if (CFProperty)
    CFRelease(CFProperty);
  return v6;
}

IOReturn IOPMAssertionDeclareUserActivity(CFStringRef AssertionName, IOPMUserActiveType userType, IOPMAssertionID *AssertionID)
{
  __CFDictionary *Mutable;
  const __CFData *Data;
  const __CFData *v9;
  mach_port_t v10;
  const UInt8 *BytePtr;
  int Length;
  int v13;
  mach_port_t v14;
  IOReturn v15;

  v14 = 0;
  v15 = -536870212;
  v13 = 0;
  if (!AssertionName || !AssertionID)
  {
    v15 = -536870206;
    goto LABEL_6;
  }
  if (pm_connect_init(&v14))
  {
    v15 = -536870199;
    goto LABEL_6;
  }
  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("AssertName"), AssertionName);
  if (collectBackTrace)
    saveBackTrace(Mutable);
  Data = CFPropertyListCreateData(0, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    v15 = -536870206;
    if (!Mutable)
      goto LABEL_6;
    goto LABEL_17;
  }
  v9 = Data;
  v10 = v14;
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(v9);
  if (io_pm_declare_user_active(v10, userType, (uint64_t)BytePtr, Length, (int *)AssertionID, &v13, &v15))
    v15 = -536870199;
  CFRelease(v9);
  if (Mutable)
LABEL_17:
    CFRelease(Mutable);
LABEL_6:
  if (v14)
    _pm_disconnect();
  return v15;
}

IOReturn IOPMDeclareNetworkClientActivity(CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  __CFDictionary *Mutable;
  const __CFData *Data;
  const __CFData *v7;
  mach_port_t v8;
  const UInt8 *BytePtr;
  int Length;
  int v11;
  mach_port_t v12;
  IOReturn v13;

  v12 = 0;
  v13 = -536870212;
  v11 = 0;
  if (!AssertionName || !AssertionID)
  {
    v13 = -536870206;
    goto LABEL_6;
  }
  if (pm_connect_init(&v12))
  {
    v13 = -536870199;
    goto LABEL_6;
  }
  Mutable = CFDictionaryCreateMutable(0, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, CFSTR("AssertName"), AssertionName);
  if (collectBackTrace)
    saveBackTrace(Mutable);
  Data = CFPropertyListCreateData(0, Mutable, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (!Data)
  {
    v13 = -536870206;
    if (!Mutable)
      goto LABEL_6;
    goto LABEL_17;
  }
  v7 = Data;
  v8 = v12;
  BytePtr = CFDataGetBytePtr(Data);
  Length = CFDataGetLength(v7);
  if (io_pm_declare_network_client_active(v8, (uint64_t)BytePtr, Length, (int *)AssertionID, &v11, &v13))
    v13 = -536870199;
  CFRelease(v7);
  if (Mutable)
LABEL_17:
    CFRelease(Mutable);
LABEL_6:
  if (v12)
    _pm_disconnect();
  return v13;
}

uint64_t IOPMSetReservePowerMode(int a1)
{
  uint64_t result;
  unsigned int v3;
  uint64_t v4;

  v4 = 0;
  result = _pm_connect((_DWORD *)&v4 + 1);
  if (!(_DWORD)result)
  {
    if (HIDWORD(v4))
    {
      v3 = io_pm_set_value_int(SHIDWORD(v4), 9, a1, &v4);
      _pm_disconnect();
      if ((_DWORD)v4)
        return v4;
      else
        return v3;
    }
    else
    {
      return 3758097112;
    }
  }
  return result;
}

uint64_t IOPMCopyAssertionsByProcessWithAllocator(CFDictionaryRef *a1, const __CFAllocator *a2)
{
  return _copyAssertionsByProcess(2u, a1, a2);
}

uint64_t _copyAssertionsByProcess(unsigned int a1, CFDictionaryRef *a2, const __CFAllocator *a3)
{
  uint64_t v3;
  CFTypeRef v6;
  int Count;
  int v8;
  const void **v9;
  const void **v10;
  const void **v11;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v14;
  CFTypeRef cf;

  v3 = 3758097090;
  cf = 0;
  if (a2 && (a1 == 7 || a1 == 2))
  {
    v3 = _copyPMServerObject(a1, 0, 0, &cf);
    v6 = cf;
    if ((_DWORD)v3)
    {
      if (cf)
LABEL_6:
        CFRelease(v6);
    }
    else
    {
      if (!cf)
        return 0;
      Count = CFArrayGetCount((CFArrayRef)cf);
      v8 = Count;
      if (!Count)
      {
        v3 = 0;
        goto LABEL_6;
      }
      v9 = (const void **)malloc_type_malloc(8 * Count, 0x6004044C4A2DFuLL);
      v10 = (const void **)malloc_type_malloc(8 * v8, 0x6004044C4A2DFuLL);
      v11 = v10;
      if (v9 && v10)
      {
        if (v8 >= 1)
        {
          for (i = 0; i != v8; ++i)
          {
            ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex((CFArrayRef)v6, i);
            if (ValueAtIndex)
            {
              v14 = ValueAtIndex;
              v9[i] = CFDictionaryGetValue(ValueAtIndex, CFSTR("AssertPID"));
              v11[i] = CFDictionaryGetValue(v14, CFSTR("PerTaskAssertions"));
            }
          }
        }
        *a2 = CFDictionaryCreate(a3, v9, v11, v8, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      }
      if (v9)
        free(v9);
      if (v11)
        free(v11);
      v3 = 0;
      if (v6)
        goto LABEL_6;
    }
  }
  return v3;
}

IOReturn IOPMCopyAssertionsByProcess(CFDictionaryRef *AssertionsByPID)
{
  return _copyAssertionsByProcess(2u, AssertionsByPID, (const __CFAllocator *)*MEMORY[0x1E0C9AE00]);
}

uint64_t IOPMCopyAssertionsByType(const __CFData *a1, CFPropertyListRef *a2)
{
  if (a2)
    return _copyPMServerObject(6u, 0, a1, a2);
  else
    return 3758097090;
}

uint64_t IOPMCopyInactiveAssertionsByProcess(CFDictionaryRef *a1)
{
  return _copyAssertionsByProcess(7u, a1, (const __CFAllocator *)*MEMORY[0x1E0C9AE00]);
}

CFDictionaryRef IOPMAssertionCopyProperties(IOPMAssertionID theAssertion)
{
  const __CFDictionary *v2;

  v2 = 0;
  _copyPMServerObject(1u, theAssertion, 0, (CFPropertyListRef *)&v2);
  return v2;
}

IOReturn IOPMCopyAssertionsStatus(CFDictionaryRef *AssertionsStatus)
{
  if (AssertionsStatus)
    return _copyPMServerObject(3u, 0, 0, (CFPropertyListRef *)AssertionsStatus);
  else
    return -536870206;
}

uint64_t IOPMCopyDeviceRestartPreventers(__CFArray **a1)
{
  uint64_t v2;
  __CFArray *Mutable;
  char v4;
  const CFArrayCallBacks *v5;
  char v6;
  uint64_t result;
  const __CFArray *v8;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFBoolean *Value;
  CFArrayRef theArray;

  v2 = 0;
  Mutable = 0;
  v4 = 1;
  v5 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  while (1)
  {
    v6 = v4;
    theArray = 0;
    result = _copyPMServerObject(6u, 0, (const __CFData *)off_1E2003C10[v2], (CFPropertyListRef *)&theArray);
    if ((_DWORD)result)
      break;
    v8 = theArray;
    if (theArray)
    {
      if (CFArrayGetCount(theArray) >= 1)
      {
        for (i = 0; i < CFArrayGetCount(v8); ++i)
        {
          ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v8, i);
          Value = (const __CFBoolean *)CFDictionaryGetValue(ValueAtIndex, CFSTR("AllowsDeviceRestart"));
          if (!Value || !CFBooleanGetValue(Value))
          {
            if (!Mutable)
            {
              Mutable = CFArrayCreateMutable(0, 0, v5);
              if (!Mutable)
              {
                CFRelease(v8);
                goto LABEL_16;
              }
            }
            CFArrayAppendValue(Mutable, ValueAtIndex);
          }
        }
      }
      CFRelease(v8);
    }
    v4 = 0;
    v2 = 1;
    if ((v6 & 1) == 0)
    {
LABEL_16:
      result = 0;
      break;
    }
  }
  *a1 = Mutable;
  return result;
}

uint64_t IOPMCopyAssertionActivityLogWithAllocator(CFPropertyListRef *a1, BOOL *a2, const __CFAllocator *a3)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, &IOPMCopyAssertionActivityLogWithAllocator_refCnt, a3);
}

uint64_t IOPMCopyAssertionActivityUpdateWithAllocator(CFPropertyListRef *a1, BOOL *a2, _DWORD *a3, const __CFAllocator *a4)
{
  uint64_t result;
  BOOL v9;
  const __CFData *v11;
  const __CFData *v12;
  CFIndex length;
  UInt8 *bytes;
  unsigned int v15;
  int v16;

  v15 = -536870199;
  v16 = 0;
  length = 0;
  bytes = 0;
  *a1 = 0;
  _pm_connect((_DWORD *)&length + 1);
  result = HIDWORD(length);
  if (HIDWORD(length))
  {
    if (io_pm_assertion_activity_log(SHIDWORD(length), &bytes, &length, a3, &v16, &v15))
      v9 = 0;
    else
      v9 = v15 == 0;
    if (v9 && (_DWORD)length != 0)
    {
      v11 = CFDataCreateWithBytesNoCopy(0, bytes, length, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      if (v11)
      {
        v12 = v11;
        *a1 = CFPropertyListCreateWithData(a4, v11, 1uLL, 0, 0);
        CFRelease(v12);
      }
      if (a2)
        *a2 = v16 != 0;
    }
    if (bytes && (_DWORD)length)
      mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)bytes, length);
    if (HIDWORD(length))
      _pm_disconnect();
    return v15;
  }
  return result;
}

uint64_t IOPMCopyAssertionActivityLog(CFPropertyListRef *a1, BOOL *a2)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, &IOPMCopyAssertionActivityLog_refCnt, (const __CFAllocator *)*MEMORY[0x1E0C9AE00]);
}

uint64_t IOPMCopyAssertionActivityUpdate(CFPropertyListRef *a1, BOOL *a2, _DWORD *a3)
{
  return IOPMCopyAssertionActivityUpdateWithAllocator(a1, a2, a3, (const __CFAllocator *)*MEMORY[0x1E0C9AE00]);
}

uint64_t IOPMSetAssertionActivityLog(int a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  v2 = _pm_connect((_DWORD *)&v4 + 1);
  if (!(_DWORD)v2)
  {
    if (HIDWORD(v4))
    {
      v2 = io_pm_set_value_int(SHIDWORD(v4), 7, a1, &v4);
      _pm_disconnect();
    }
    else
    {
      return 3758097112;
    }
  }
  return v2;
}

uint64_t IOPMSetAssertionActivityAggregate(int a1)
{
  uint64_t v2;
  uint64_t v4;

  v4 = 0;
  v2 = _pm_connect((_DWORD *)&v4 + 1);
  if (!(_DWORD)v2)
  {
    if (HIDWORD(v4))
    {
      v2 = io_pm_set_value_int(SHIDWORD(v4), 8, a1, &v4);
      _pm_disconnect();
    }
    else
    {
      return 3758097112;
    }
  }
  return v2;
}

CFPropertyListRef IOPMCopyAssertionActivityAggregateWithAllocator(const __CFAllocator *a1)
{
  int v2;
  const __CFData *v3;
  const __CFData *v4;
  CFPropertyListRef v5;
  _DWORD length[3];
  int v8;
  int v9;

  v9 = -536870199;
  v8 = 0;
  memset(length, 0, sizeof(length));
  _pm_connect(&v8);
  if (!v8)
    return 0;
  v2 = io_pm_assertion_activity_aggregate(v8, &length[1], length, &v9);
  if (v2 | v9
    || (v3 = CFDataCreateWithBytesNoCopy(0, *(const UInt8 **)&length[1], length[0], (CFAllocatorRef)*MEMORY[0x1E0C9AE20])) == 0)
  {
    v5 = 0;
  }
  else
  {
    v4 = v3;
    v5 = CFPropertyListCreateWithData(a1, v3, 1uLL, 0, 0);
    CFRelease(v4);
  }
  if (*(_QWORD *)&length[1] && length[0])
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], *(mach_vm_address_t *)&length[1], length[0]);
  if (v8)
    _pm_disconnect();
  return v5;
}

CFPropertyListRef IOPMCopyAssertionActivityAggregate()
{
  return IOPMCopyAssertionActivityAggregateWithAllocator((const __CFAllocator *)*MEMORY[0x1E0C9AE00]);
}

uint64_t IOPMAssertionSetBTCollection(unsigned int a1)
{
  int out_token;

  out_token = 0;
  notify_register_check("com.apple.powermanagement.collectbt", &out_token);
  notify_set_state(out_token, a1);
  notify_post("com.apple.powermanagement.collectbt");
  return notify_cancel(out_token);
}

uint64_t IOPMSetAssertionExceptionLimits(const void *a1)
{
  uint64_t v2;
  CFTypeID TypeID;
  const __CFData *Data;
  const __CFData *v5;
  mach_port_t v6;
  const UInt8 *BytePtr;
  int Length;
  mach_port_t v10;
  unsigned int v11;

  v2 = 3758097090;
  v10 = 0;
  v11 = -536870212;
  TypeID = CFDictionaryGetTypeID();
  if (a1 && CFGetTypeID(a1) == TypeID)
  {
    if (pm_connect_init(&v10))
    {
      v11 = -536870199;
    }
    else
    {
      Data = CFPropertyListCreateData(0, a1, kCFPropertyListBinaryFormat_v1_0, 0, 0);
      if (Data)
      {
        v5 = Data;
        v6 = v10;
        BytePtr = CFDataGetBytePtr(Data);
        Length = CFDataGetLength(v5);
        if (io_pm_set_exception_limits(v6, (uint64_t)BytePtr, Length, (int *)&v11))
          v11 = -536870199;
        CFRelease(v5);
      }
      else
      {
        v11 = -536870206;
      }
    }
    if (v10)
      _pm_disconnect();
    return v11;
  }
  return v2;
}

void *IOPMScheduleAssertionExceptionNotification(NSObject *a1, uint64_t a2)
{
  void *v4;
  _QWORD handler[5];

  v4 = malloc_type_calloc(1uLL, 4uLL, 0x100004052888210uLL);
  if (v4)
  {
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __IOPMScheduleAssertionExceptionNotification_block_invoke;
    handler[3] = &unk_1E2003CB8;
    handler[4] = a2;
    if (notify_register_dispatch("com.apple.powermanagement.assertionexception", (int *)v4, a1, handler))
    {
      free(v4);
      return 0;
    }
  }
  return v4;
}

void IOPMUnregisterExceptionNotification(int *a1)
{
  int v2;

  if (a1)
  {
    v2 = *a1;
    if (v2)
      notify_cancel(v2);
    *a1 = 0;
    free(a1);
  }
}

uint64_t __pm_connect_init_block_invoke(int a1, int token)
{
  return notify_get_state(token, (uint64_t *)&collectBackTrace);
}

void OUTLINED_FUNCTION_5_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_11_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xEu);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_17(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x1Cu);
}

void OUTLINED_FUNCTION_25(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x22u);
}

void OUTLINED_FUNCTION_28(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xEu);
}

uint64_t __IOHIDPlugInInstanceRetain(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(*(_QWORD *)a2 + 16))(a2);
  return a2;
}

uint64_t __IOHIDPlugInInstanceRelease(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t))(*(_QWORD *)a2 + 24))(a2);
}

__CFArray *__IOHIDPlugInLoadBundles(const __CFArray *a1)
{
  const __CFAllocator *v2;
  __CFArray *Mutable;
  CFIndex v4;
  const void *ValueAtIndex;
  const __CFString *v6;
  const __CFURL *v7;
  CFArrayRef BundlesFromDirectory;
  const __CFArray *v9;
  NSObject *v10;
  CFIndex Count;
  uint8_t buf[4];
  CFIndex v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  const __CFArray *v18;
  uint64_t v19;
  CFRange v20;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  if (CFArrayGetCount(a1) >= 1)
  {
    v4 = 0;
    do
    {
      ValueAtIndex = CFArrayGetValueAtIndex(a1, v4);
      v6 = CFStringCreateWithFormat(0, 0, CFSTR("%@%@"), &stru_1E2005170, ValueAtIndex);
      v7 = CFURLCreateWithFileSystemPath(v2, v6, kCFURLPOSIXPathStyle, 1u);
      BundlesFromDirectory = CFBundleCreateBundlesFromDirectory(v2, v7, CFSTR("plugin"));
      if (BundlesFromDirectory)
      {
        v9 = BundlesFromDirectory;
        v10 = _IOHIDLogCategory(0);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          Count = CFArrayGetCount(v9);
          *(_DWORD *)buf = 134218498;
          v14 = Count;
          v15 = 2112;
          v16 = v6;
          v17 = 2112;
          v18 = v9;
          _os_log_impl(&dword_18AAAF000, v10, OS_LOG_TYPE_DEFAULT, "Loaded %ld HID plugins (%@) %@", buf, 0x20u);
        }
        v20.length = CFArrayGetCount(v9);
        v20.location = 0;
        CFArrayAppendArray(Mutable, v9, v20);
        CFRelease(v9);
      }
      CFRelease(v6);
      CFRelease(v7);
      ++v4;
    }
    while (v4 < CFArrayGetCount(a1));
  }
  CFRelease(&stru_1E2005170);
  return Mutable;
}

uint64_t _IOHIDLoadSessionFilterBundles()
{
  if (_IOHIDLoadSessionFilterBundles_onceToken != -1)
    dispatch_once(&_IOHIDLoadSessionFilterBundles_onceToken, &__block_literal_global_9);
  return __hidSessionFilterBundles;
}

uint64_t _IOHIDLoadServicePluginBundles()
{
  if (_IOHIDLoadServicePluginBundles_onceToken != -1)
    dispatch_once(&_IOHIDLoadServicePluginBundles_onceToken, &__block_literal_global_31_0);
  return __hidServicePluginBundles;
}

BOOL _IOHIDPlugInInstanceCacheIsEmpty()
{
  return !__hidPlugInInstanceCache || CFDictionaryGetCount((CFDictionaryRef)__hidPlugInInstanceCache) == 0;
}

uint64_t IODPControllerGetTypeID()
{
  uint64_t result;

  result = __kIODPControllerTypeID;
  if (!__kIODPControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_0, (void (*)(void))__IODPControllerRegister);
    return __kIODPControllerTypeID;
  }
  return result;
}

uint64_t __IODPControllerRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIODPControllerTypeID = result;
  return result;
}

uint64_t IODPControllerCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPController", (uint64_t (*)(_QWORD, uint64_t))IODPControllerCreateWithService, 0, 0, -1);
  else
    return 0;
}

uint64_t IODPControllerCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPController", (uint64_t (*)(_QWORD, uint64_t))IODPControllerCreateWithService, 0, a2, -1);
  else
    return 0;
}

uint64_t IODPControllerCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  uint64_t Instance;
  uint64_t v5;
  io_connect_t *v6;
  CFTypeRef v7;
  const void *v8;
  const __CFNumber *v9;
  const __CFNumber *v10;
  CFTypeID TypeID;
  const __CFNumber *v12;
  const __CFNumber *v13;
  CFTypeID v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeID v17;
  const __CFNumber *v18;
  const __CFNumber *v19;
  CFTypeID v20;
  int valuePtr;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IODPController"))
    return 0;
  if (!__kIODPControllerTypeID)
    pthread_once(&__controllerTypeInit_0, (void (*)(void))__IODPControllerRegister);
  Instance = _CFRuntimeCreateInstance();
  v5 = Instance;
  if (Instance)
  {
    *(_OWORD *)(Instance + 16) = 0u;
    *(_OWORD *)(Instance + 32) = 0u;
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*(_DWORD *)(v5 + 16), *MEMORY[0x1E0C83DA0], 0x44504354u, (io_connect_t *)(v5 + 20)))
    {
      v6 = IOAVControllerCreateWithService(a1, a2);
      *(_QWORD *)(v5 + 24) = v6;
      if (v6)
      {
        valuePtr = 0;
        v7 = IOAVControllerCopyProperty((uint64_t)v6, CFSTR("Location"));
        if (v7)
        {
          v8 = v7;
          if (CFEqual(v7, CFSTR("Embedded")))
            *(_DWORD *)(v5 + 32) = 1;
          CFRelease(v8);
        }
        v9 = (const __CFNumber *)IOAVControllerCopyProperty(*(_QWORD *)(v5 + 24), CFSTR("MinLaneCount"));
        if (v9)
        {
          v10 = v9;
          TypeID = CFNumberGetTypeID();
          if (TypeID == CFGetTypeID(v10))
            CFNumberGetValue(v10, kCFNumberIntType, (void *)(v5 + 40));
          CFRelease(v10);
        }
        v12 = (const __CFNumber *)IOAVControllerCopyProperty(*(_QWORD *)(v5 + 24), CFSTR("MaxLaneCount"));
        if (v12)
        {
          v13 = v12;
          v14 = CFNumberGetTypeID();
          if (v14 == CFGetTypeID(v13))
            CFNumberGetValue(v13, kCFNumberIntType, (void *)(v5 + 44));
          CFRelease(v13);
        }
        v15 = (const __CFNumber *)IOAVControllerCopyProperty(*(_QWORD *)(v5 + 24), CFSTR("MinLinkRate"));
        if (v15)
        {
          v16 = v15;
          v17 = CFNumberGetTypeID();
          if (v17 == CFGetTypeID(v16))
          {
            CFNumberGetValue(v16, kCFNumberIntType, &valuePtr);
            *(_BYTE *)(v5 + 36) = valuePtr;
          }
          CFRelease(v16);
        }
        v18 = (const __CFNumber *)IOAVControllerCopyProperty(*(_QWORD *)(v5 + 24), CFSTR("MaxLinkRate"));
        if (v18)
        {
          v19 = v18;
          v20 = CFNumberGetTypeID();
          if (v20 == CFGetTypeID(v19))
          {
            CFNumberGetValue(v19, kCFNumberIntType, &valuePtr);
            *(_BYTE *)(v5 + 37) = valuePtr;
          }
          CFRelease(v19);
        }
      }
      return v5;
    }
    CFRelease((CFTypeRef)v5);
    return 0;
  }
  return v5;
}

uint64_t IODPControllerGetAVController(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t IODPControllerSetScramblingInhibited(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetSupportsEnhancedMode(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 1u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetSupportsDownspread(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetLaneCount(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerGetMinLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t IODPControllerSetMinLaneCount(uint64_t a1, unsigned int a2)
{
  mach_port_t v4;
  uint64_t result;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  result = IOConnectCallMethod(v4, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!(_DWORD)result)
    *(_DWORD *)(a1 + 40) = a2;
  return result;
}

uint64_t IODPControllerGetMaxLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t IODPControllerSetMaxLaneCount(uint64_t a1, unsigned int a2)
{
  mach_port_t v4;
  uint64_t result;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  result = IOConnectCallMethod(v4, 5u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!(_DWORD)result)
    *(_DWORD *)(a1 + 44) = a2;
  return result;
}

uint64_t IODPControllerSetLinkRate(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 6u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerGetMinLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 36);
}

uint64_t IODPControllerSetMinLinkRate(uint64_t a1, unsigned int a2)
{
  char v2;
  mach_port_t v4;
  uint64_t result;
  uint64_t input[2];

  v2 = a2;
  input[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  result = IOConnectCallMethod(v4, 7u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!(_DWORD)result)
    *(_BYTE *)(a1 + 36) = v2;
  return result;
}

uint64_t IODPControllerGetMaxLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 37);
}

uint64_t IODPControllerSetMaxLinkRate(uint64_t a1, unsigned int a2)
{
  char v2;
  mach_port_t v4;
  uint64_t result;
  uint64_t input[2];

  v2 = a2;
  input[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  result = IOConnectCallMethod(v4, 8u, input, 1u, 0, 0, 0, 0, 0, 0);
  if (!(_DWORD)result)
    *(_BYTE *)(a1 + 37) = v2;
  return result;
}

uint64_t IODPControllerSetDriveSettings(uint64_t a1, unsigned int a2, unsigned int a3, unsigned int a4)
{
  uint64_t input[4];

  input[3] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, input, 3u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetQualityPattern(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 9u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPControllerSetSecureAuxFilter(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xBu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t __IODPControllerFree(uint64_t a1)
{
  const void *v2;
  io_connect_t v3;
  uint64_t result;

  v2 = *(const void **)(a1 + 24);
  if (v2)
    CFRelease(v2);
  v3 = *(_DWORD *)(a1 + 20);
  if (v3)
    IOServiceClose(v3);
  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
    return IOObjectRelease(result);
  return result;
}

uint64_t IODPDeviceGetTypeID()
{
  uint64_t result;

  result = __kIODPDeviceTypeID;
  if (!__kIODPDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit_0, (void (*)(void))__IODPDeviceRegister);
    return __kIODPDeviceTypeID;
  }
  return result;
}

uint64_t __IODPDeviceRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIODPDeviceTypeID = result;
  return result;
}

uint64_t IODPDeviceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPDevice", (uint64_t (*)(_QWORD, uint64_t))IODPDeviceCreateWithService, 0, 0, -1);
  else
    return 0;
}

uint64_t IODPDeviceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPDevice", (uint64_t (*)(_QWORD, uint64_t))IODPDeviceCreateWithService, 0, a2, -1);
  else
    return 0;
}

_OWORD *IODPDeviceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  _OWORD *Instance;
  _OWORD *v5;
  io_connect_t *v6;
  CFTypeRef v7;
  const void *v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const __CFNumber *Value;
  const __CFNumber *v12;
  const __CFNumber *v13;
  const __CFNumber *v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeRef v17;
  CFTypeRef *v18;
  const void *v19;
  CFTypeRef v20;
  const void *v21;
  int valuePtr;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IODPDevice"))
    return 0;
  if (!__kIODPDeviceTypeID)
    pthread_once(&__deviceTypeInit_0, (void (*)(void))__IODPDeviceRegister);
  Instance = (_OWORD *)_CFRuntimeCreateInstance();
  v5 = Instance;
  if (Instance)
  {
    Instance[2] = 0u;
    Instance[3] = 0u;
    Instance[1] = 0u;
    *((_DWORD *)Instance + 4) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*((_DWORD *)v5 + 4), *MEMORY[0x1E0C83DA0], 0x44504456u, (io_connect_t *)v5 + 5))
    {
      v6 = IOAVDeviceCreateWithService(a1, *((_DWORD *)v5 + 4));
      *((_QWORD *)v5 + 3) = v6;
      if (v6)
      {
        valuePtr = 0;
        v7 = IOAVDeviceCopyProperty((uint64_t)v6, CFSTR("Location"));
        if (v7)
        {
          v8 = v7;
          if (CFEqual(v7, CFSTR("Embedded")))
            *((_DWORD *)v5 + 8) = 1;
          CFRelease(v8);
        }
        v9 = (const __CFDictionary *)IOAVDeviceCopyProperty(*((_QWORD *)v5 + 3), CFSTR("Revision"));
        if (v9)
        {
          v10 = v9;
          Value = (const __CFNumber *)CFDictionaryGetValue(v9, CFSTR("Major"));
          if (Value)
            CFNumberGetValue(Value, kCFNumberIntType, (char *)v5 + 36);
          v12 = (const __CFNumber *)CFDictionaryGetValue(v10, CFSTR("Minor"));
          if (v12)
            CFNumberGetValue(v12, kCFNumberIntType, (char *)v5 + 40);
          CFRelease(v10);
        }
        v13 = (const __CFNumber *)IOAVDeviceCopyProperty(*((_QWORD *)v5 + 3), CFSTR("MaxLaneCount"));
        if (v13)
        {
          v14 = v13;
          CFNumberGetValue(v13, kCFNumberIntType, (char *)v5 + 44);
          CFRelease(v14);
        }
        v15 = (const __CFNumber *)IOAVDeviceCopyProperty(*((_QWORD *)v5 + 3), CFSTR("MaxLinkRate"));
        if (v15)
        {
          v16 = v15;
          CFNumberGetValue(v15, kCFNumberIntType, &valuePtr);
          *((_BYTE *)v5 + 48) = valuePtr;
          CFRelease(v16);
        }
        v17 = IOAVDeviceCopyProperty(*((_QWORD *)v5 + 3), CFSTR("SupportsEnhancedMode"));
        v18 = (CFTypeRef *)MEMORY[0x1E0C9AE50];
        if (v17)
        {
          v19 = v17;
          *((_BYTE *)v5 + 49) = CFEqual(v17, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
          CFRelease(v19);
        }
        v20 = IOAVDeviceCopyProperty(*((_QWORD *)v5 + 3), CFSTR("SupportsDownspread"));
        if (v20)
        {
          v21 = v20;
          *((_BYTE *)v5 + 50) = CFEqual(v20, *v18) != 0;
          CFRelease(v21);
        }
      }
      return v5;
    }
    CFRelease(v5);
    return 0;
  }
  return v5;
}

uint64_t IODPDeviceGetController(uint64_t a1)
{
  uint64_t result;
  io_registry_entry_t parent;

  result = *(_QWORD *)(a1 + 56);
  if (!result)
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      result = IODPControllerCreateWithService(*MEMORY[0x1E0C9AE00], parent);
      *(_QWORD *)(a1 + 56) = result;
    }
    else
    {
      return *(_QWORD *)(a1 + 56);
    }
  }
  return result;
}

uint64_t IODPDeviceGetAVDevice(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t IODPDeviceGetRevisionMajor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 36);
}

uint64_t IODPDeviceGetRevisionMinor(uint64_t a1)
{
  return *(unsigned int *)(a1 + 40);
}

uint64_t IODPDeviceGetMaxLaneCount(uint64_t a1)
{
  return *(unsigned int *)(a1 + 44);
}

uint64_t IODPDeviceGetMaxLinkRate(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 48);
}

uint64_t IODPDeviceGetSupportsEnhancedMode(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 49);
}

uint64_t IODPDeviceGetSupportsDownspread(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 50);
}

uint64_t IODPDeviceReadDPCD(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  size_t v4;
  size_t v6;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  if (a4 >= 0x1000)
    v4 = 4096;
  else
    v4 = a4;
  v6 = v4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, input, 1u, 0, 0, 0, 0, outputStruct, &v6);
}

uint64_t IODPDeviceWriteDPCD(uint64_t a1, unsigned int a2, void *inputStruct, unsigned int a4)
{
  size_t v4;
  mach_port_t v5;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  if (a4 >= 0x1000)
    v4 = 4096;
  else
    v4 = a4;
  v5 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v5, 1u, input, 1u, inputStruct, v4, 0, 0, 0, 0);
}

uint64_t IODPDeviceGetLinkTrainingData(uint64_t a1, void *outputStruct)
{
  size_t v3;

  v3 = 116;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IODPDeviceGetSymbolErrorCount(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  output = 0;
  input[0] = a2;
  outputCnt = 1;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 3u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a3 = output;
  return result;
}

uint64_t IODPDeviceSetUpdateMode(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPDeviceSetUpdated(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 5u, input, 1u, 0, 0, 0, 0, 0, 0);
}

void __IODPDeviceFree(uint64_t a1)
{
  const void *v2;
  io_connect_t v3;
  io_object_t v4;
  const void *v5;

  v2 = *(const void **)(a1 + 24);
  if (v2)
    CFRelease(v2);
  v3 = *(_DWORD *)(a1 + 20);
  if (v3)
    IOServiceClose(v3);
  v4 = *(_DWORD *)(a1 + 16);
  if (v4)
    IOObjectRelease(v4);
  v5 = *(const void **)(a1 + 56);
  if (v5)
    CFRelease(v5);
}

uint64_t IODPServiceGetTypeID()
{
  uint64_t result;

  result = __kIODPServiceTypeID;
  if (!__kIODPServiceTypeID)
  {
    pthread_once(&__serviceTypeInit_0, (void (*)(void))__IODPServiceRegister);
    return __kIODPServiceTypeID;
  }
  return result;
}

uint64_t __IODPServiceRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIODPServiceTypeID = result;
  return result;
}

uint64_t IODPServiceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPService", (uint64_t (*)(_QWORD, uint64_t))IODPServiceCreateWithService, 0, 0, -1);
  else
    return 0;
}

uint64_t IODPServiceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IODPService", (uint64_t (*)(_QWORD, uint64_t))IODPServiceCreateWithService, 0, a2, -1);
  else
    return 0;
}

_QWORD *IODPServiceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  _QWORD *Instance;
  _QWORD *v5;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IODPService"))
    return 0;
  if (!__kIODPServiceTypeID)
    pthread_once(&__serviceTypeInit_0, (void (*)(void))__IODPServiceRegister);
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  v5 = Instance;
  if (Instance)
  {
    Instance[2] = 0;
    Instance[3] = 0;
    Instance[4] = 0;
    *((_DWORD *)Instance + 4) = a2;
    IOObjectRetain(a2);
    if (!IOServiceOpen(*((_DWORD *)v5 + 4), *MEMORY[0x1E0C83DA0], 0x44505356u, (io_connect_t *)v5 + 5))
    {
      v5[3] = IOAVServiceCreateWithService(a1, *((_DWORD *)v5 + 4));
      return v5;
    }
    CFRelease(v5);
    return 0;
  }
  return v5;
}

_OWORD *IODPServiceGetDevice(uint64_t a1)
{
  _OWORD *result;
  io_registry_entry_t parent;

  result = *(_OWORD **)(a1 + 32);
  if (!result)
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      return *(_OWORD **)(a1 + 32);
    }
    else
    {
      result = IODPDeviceCreateWithService(*MEMORY[0x1E0C9AE00], parent);
      *(_QWORD *)(a1 + 32) = result;
    }
  }
  return result;
}

uint64_t IODPServiceGetAVService(uint64_t a1)
{
  return *(_QWORD *)(a1 + 24);
}

uint64_t IODPServiceGetSinkCount(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a2 = output[0];
  return result;
}

uint64_t IODPServiceRetrainLink(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IODPServiceGetSymbolErrorCount(uint64_t a1, unsigned int a2, _DWORD *a3)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  output = 0;
  input[0] = a2;
  outputCnt = 1;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 1u, 0, 0, &output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a3 = output;
  return result;
}

void __IODPServiceFree(uint64_t a1)
{
  const void *v2;
  io_connect_t v3;
  io_object_t v4;
  const void *v5;

  v2 = *(const void **)(a1 + 24);
  if (v2)
    CFRelease(v2);
  v3 = *(_DWORD *)(a1 + 20);
  if (v3)
    IOServiceClose(v3);
  v4 = *(_DWORD *)(a1 + 16);
  if (v4)
    IOObjectRelease(v4);
  v5 = *(const void **)(a1 + 32);
  if (v5)
    CFRelease(v5);
}

__CFString *IODPCreateStringWithLinkTrainingData(const __CFAllocator *a1, uint64_t a2, int a3)
{
  __CFString *Mutable;
  __CFString *v6;
  int v7;
  uint64_t v8;
  const char *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  unint64_t v14;
  int v15;
  unsigned int *v16;
  unsigned int v17;
  int v19;

  Mutable = CFStringCreateMutable(a1, 0);
  v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("Link Training Data:\n\n"));
    v19 = a3;
    v7 = a3 + 1;
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, CFSTR("Lane Count:    %d\n"), *(unsigned int *)(a2 + 8));
    v8 = IODPLinkRateScalar(*(unsigned __int8 *)(a2 + 12));
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, CFSTR("Link Rate:     %llu bps\n"), v8);
    if (*(_BYTE *)(a2 + 1))
      v9 = "YES";
    else
      v9 = "NO";
    _IOAVStringAppendIndendationAndFormat(v6, v7, CFSTR("Enhanced Mode: %s\n"), v9);
    if (*(_BYTE *)(a2 + 2))
      v10 = "YES";
    else
      v10 = "NO";
    _IOAVStringAppendIndendationAndFormat(v6, v7, CFSTR("Downspread:    %s\n"), v10);
    if (*(_BYTE *)(a2 + 3))
      v11 = "YES";
    else
      v11 = "NO";
    _IOAVStringAppendIndendationAndFormat(v6, v7, CFSTR("Fast:          %s\n"), v11);
    if (*(_BYTE *)(a2 + 5))
      v12 = "YES";
    else
      v12 = "NO";
    _IOAVStringAppendIndendationAndFormat(v6, v7, CFSTR("FEC:           %s\n"), v12);
    if (*(_BYTE *)(a2 + 6))
      v13 = "YES";
    else
      v13 = "NO";
    _IOAVStringAppendIndendationAndFormat(v6, v7, CFSTR("PSR:           %s\n"), v13);
    if (*(_DWORD *)(a2 + 8))
    {
      v14 = 0;
      v15 = a3 + 2;
      v16 = (unsigned int *)(a2 + 28);
      do
      {
        _IOAVStringAppendIndendationAndFormat(v6, v7, CFSTR("Lane %d:\n\n"), v14);
        _IOAVStringAppendIndendationAndFormat(v6, v15, CFSTR("Swing Voltage: %d\n"), *(v16 - 1));
        v17 = *v16;
        v16 += 3;
        _IOAVStringAppendIndendationAndFormat(v6, v15, CFSTR("Pre-emphasis:  %d\n"), v17);
        _IOAVStringAppendIndendationAndFormat(v6, v7, CFSTR("\n"));
        ++v14;
      }
      while (v14 < *(unsigned int *)(a2 + 8));
    }
    _IOAVStringAppendIndendationAndFormat(v6, v19, CFSTR("\n"));
  }
  return v6;
}

uint64_t IOAVAudioInterfaceGetTypeID()
{
  uint64_t result;

  result = __kIOAVAudioInterfaceTypeID;
  if (!__kIOAVAudioInterfaceTypeID)
  {
    pthread_once(&__interfaceTypeInit_0, (void (*)(void))__IOAVAudioInterfaceRegister);
    return __kIOAVAudioInterfaceTypeID;
  }
  return result;
}

uint64_t __IOAVAudioInterfaceRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOAVAudioInterfaceTypeID = result;
  return result;
}

uint64_t IOAVAudioInterfaceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVAudioInterface", (uint64_t (*)(_QWORD, uint64_t))IOAVAudioInterfaceCreateWithService, 0, 2u, -1);
  else
    return 0;
}

io_connect_t *IOAVAudioInterfaceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  io_connect_t *Instance;
  io_connect_t *v4;
  io_service_t *v5;
  io_connect_t *CFProperty;
  io_connect_t *v7;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVAudioInterface"))
    return 0;
  if (!__kIOAVAudioInterfaceTypeID)
    pthread_once(&__interfaceTypeInit_0, (void (*)(void))__IOAVAudioInterfaceRegister);
  Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
  {
    *((_QWORD *)Instance + 2) = 0;
    *((_QWORD *)Instance + 3) = 0;
    v5 = Instance + 4;
    *((_QWORD *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E0C83DA0], 0, v4 + 5))
    {
      v7 = v4;
      v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, CFSTR("Location"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      if (CFEqual(CFProperty, CFSTR("Embedded")))
        v4[6] = 1;
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVAudioInterfaceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

io_connect_t *IOAVAudioInterfaceGetService(uint64_t a1)
{
  io_connect_t *result;
  io_registry_entry_t parent;

  result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      result = IOAVServiceCreateWithService(*MEMORY[0x1E0C9AE00], parent);
      *(_QWORD *)(a1 + 32) = result;
    }
    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }
  return result;
}

uint64_t IOAVAudioInterfaceSetLogLevel(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

CFArrayRef IOAVAudioInterfaceCopyProperties(uint64_t a1)
{
  const __CFAllocator *v1;
  CFArrayRef v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0))
    return 0;
  v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVAudioInterfaceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVAudioInterfaceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFTypeRef IOAVAudioInterfaceCopyElements(uint64_t a1)
{
  int v1;
  CFTypeRef result;
  BOOL v3;
  CFTypeID v4;
  CFTypeRef cf;

  cf = 0;
  v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 5u, &cf);
  result = 0;
  if (v1)
    v3 = 1;
  else
    v3 = cf == 0;
  if (!v3)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID())
      return cf;
    else
      return 0;
  }
  return result;
}

CFTypeRef IOAVAudioInterfaceCopyChannelLayoutElements(uint64_t a1)
{
  int v1;
  CFTypeRef result;
  BOOL v3;
  CFTypeID v4;
  CFTypeRef cf;

  cf = 0;
  v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 6u, &cf);
  result = 0;
  if (v1)
    v3 = 1;
  else
    v3 = cf == 0;
  if (!v3)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID())
      return cf;
    else
      return 0;
  }
  return result;
}

uint64_t IOAVAudioInterfaceGetLinkData(uint64_t a1, void *outputStruct)
{
  size_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = 0;
  v3 = 32;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVAudioInterfaceGetLinkDataWithSource(uint64_t a1, void *outputStruct, unsigned int a3)
{
  size_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a3;
  v4 = 32;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVAudioInterfaceStartLink(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 3u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceStopLink(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 4u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 3u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 4u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVAudioInterfaceCopyDiagnosticsString()
{
  return 0;
}

void __IOAVAudioInterfaceFree(uint64_t a1)
{
  io_connect_t v2;
  io_object_t v3;
  const void *v4;

  v2 = *(_DWORD *)(a1 + 20);
  if (v2)
    IOServiceClose(v2);
  v3 = *(_DWORD *)(a1 + 16);
  if (v3)
    IOObjectRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

uint64_t IOAVControllerGetTypeID()
{
  uint64_t result;

  result = __kIOAVControllerTypeID;
  if (!__kIOAVControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_1, (void (*)(void))__IOAVControllerRegister);
    return __kIOAVControllerTypeID;
  }
  return result;
}

uint64_t __IOAVControllerRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOAVControllerTypeID = result;
  return result;
}

uint64_t IOAVControllerCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVController", (uint64_t (*)(_QWORD, uint64_t))IOAVControllerCreateWithService, 0, 0, -1);
  else
    return 0;
}

uint64_t IOAVControllerCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVController", (uint64_t (*)(_QWORD, uint64_t))IOAVControllerCreateWithService, 0, a2, -1);
  else
    return 0;
}

io_connect_t *IOAVControllerCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  uint64_t Instance;
  io_connect_t *v4;
  io_service_t *v5;
  io_connect_t *CFProperty;
  io_connect_t *v7;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVController"))
    return 0;
  if (!__kIOAVControllerTypeID)
    pthread_once(&__controllerTypeInit_1, (void (*)(void))__IOAVControllerRegister);
  Instance = _CFRuntimeCreateInstance();
  v4 = (io_connect_t *)Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    v5 = (io_service_t *)(Instance + 16);
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E0C83DA0], 0, v4 + 5))
    {
      v7 = v4;
      v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, CFSTR("Location"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      if (CFEqual(CFProperty, CFSTR("Embedded")))
        v4[6] = 1;
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVControllerCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

CFArrayRef IOAVControllerCopyProperties(uint64_t a1)
{
  const __CFAllocator *v1;
  CFArrayRef v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0))
    return 0;
  v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVControllerSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVControllerGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVControllerGetPower(uint64_t a1, BOOL *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  if (!a2)
    return 3758097090;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xBu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a2 = output[0] != 0;
  return result;
}

uint64_t IOAVControllerSetPower(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 6u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetLogLevel(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetEventLogSize(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSetProtectionType()
{
  return 3758097095;
}

uint64_t IOAVControllerForceHotPlugDetect(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerCopyDiagnosticsString()
{
  return 0;
}

uint64_t IOAVControllerSetVirtualDeviceMode(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 8u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerWakeDisplay(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerSleepDisplay(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVControllerGetCRCData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  size_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  v4 = 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xCu, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t __IOAVControllerFree(uint64_t a1)
{
  io_connect_t v2;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 20);
  if (v2)
    IOServiceClose(v2);
  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
    return IOObjectRelease(result);
  return result;
}

uint64_t IOAVDeviceGetTypeID()
{
  uint64_t result;

  result = __kIOAVDeviceTypeID;
  if (!__kIOAVDeviceTypeID)
  {
    pthread_once(&__deviceTypeInit_1, (void (*)(void))__IOAVDeviceRegister);
    return __kIOAVDeviceTypeID;
  }
  return result;
}

uint64_t __IOAVDeviceRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOAVDeviceTypeID = result;
  return result;
}

uint64_t IOAVDeviceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVDevice", (uint64_t (*)(_QWORD, uint64_t))IOAVDeviceCreateWithService, 0, 0, -1);
  else
    return 0;
}

uint64_t IOAVDeviceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVDevice", (uint64_t (*)(_QWORD, uint64_t))IOAVDeviceCreateWithService, 0, a2, -1);
  else
    return 0;
}

io_connect_t *IOAVDeviceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  io_connect_t *Instance;
  io_connect_t *v4;
  io_service_t *v5;
  io_connect_t *CFProperty;
  io_connect_t *v7;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVDevice"))
    return 0;
  if (!__kIOAVDeviceTypeID)
    pthread_once(&__deviceTypeInit_1, (void (*)(void))__IOAVDeviceRegister);
  Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
  {
    *((_QWORD *)Instance + 2) = 0;
    *((_QWORD *)Instance + 3) = 0;
    v5 = Instance + 4;
    *((_QWORD *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E0C83DA0], 0, v4 + 5))
    {
      v7 = v4;
      v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, CFSTR("Location"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      if (CFEqual(CFProperty, CFSTR("Embedded")))
        v4[6] = 1;
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVDeviceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

io_connect_t *IOAVDeviceGetController(uint64_t a1)
{
  io_connect_t *result;
  io_registry_entry_t parent;

  result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      result = IOAVControllerCreateWithService(*MEMORY[0x1E0C9AE00], parent);
      *(_QWORD *)(a1 + 32) = result;
    }
    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }
  return result;
}

uint64_t IOAVDeviceSetLogLevel(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceSetEventLogSize(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVDeviceClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
}

CFArrayRef IOAVDeviceCopyProperties(uint64_t a1)
{
  const __CFAllocator *v1;
  CFArrayRef v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0))
    return 0;
  v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVDeviceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVDeviceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVDeviceReadI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct, unsigned int a5)
{
  size_t v6;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  v6 = a5;
  if (a5 <= 0x1000)
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0, 0, 0, 0, outputStruct, &v6);
  else
    return 3758097090;
}

uint64_t IOAVDeviceWriteI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *inputStruct, size_t inputStructCnt)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  if (inputStructCnt <= 0x1000)
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, input, 2u, inputStruct, inputStructCnt, 0, 0, 0, 0);
  else
    return 3758097090;
}

uint64_t IOAVDeviceGetLinkData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  size_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  v4 = 272;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 8u, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVDeviceGetProtectionStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xAu, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a2 = output[0];
  return result;
}

uint64_t IOAVDeviceCopyDiagnosticsString()
{
  return 0;
}

void __IOAVDeviceFree(uint64_t a1)
{
  io_connect_t v2;
  io_object_t v3;
  const void *v4;

  v2 = *(_DWORD *)(a1 + 20);
  if (v2)
    IOServiceClose(v2);
  v3 = *(_DWORD *)(a1 + 16);
  if (v3)
    IOObjectRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

uint64_t IOAVDisplayMemoryGetTypeID()
{
  uint64_t result;

  result = __kIOAVDisplayMemoryTypeID;
  if (!__kIOAVDisplayMemoryTypeID)
  {
    pthread_once(&__serviceTypeInit_1, (void (*)(void))__IOAVDisplayMemoryRegister);
    return __kIOAVDisplayMemoryTypeID;
  }
  return result;
}

uint64_t __IOAVDisplayMemoryRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOAVDisplayMemoryTypeID = result;
  return result;
}

io_service_t *IOAVDisplayMemoryCreateWithName(uint64_t a1, const void *a2)
{
  __CFDictionary *v4;
  const __CFDictionary *v5;
  io_registry_entry_t MatchingService;
  io_object_t v7;
  io_service_t *v8;

  v4 = IOServiceMatching("IOAVDisplayMemory");
  if (!v4)
    return 0;
  v5 = v4;
  CFDictionarySetValue(v4, CFSTR("IONameMatch"), a2);
  MatchingService = IOServiceGetMatchingService(0, v5);
  if (!MatchingService)
    return 0;
  v7 = MatchingService;
  v8 = IOAVDisplayMemoryCreateWithService(a1, MatchingService);
  IOObjectRelease(v7);
  return v8;
}

io_service_t *IOAVDisplayMemoryCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  uint64_t Instance;
  io_service_t *v4;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVDisplayMemory"))
    return 0;
  if (!__kIOAVDisplayMemoryTypeID)
    pthread_once(&__serviceTypeInit_1, (void (*)(void))__IOAVDisplayMemoryRegister);
  Instance = _CFRuntimeCreateInstance();
  v4 = (io_service_t *)Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    *(_DWORD *)(Instance + 16) = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(v4[4], *MEMORY[0x1E0C83DA0], 0, v4 + 5))
    {
      CFRelease(v4);
      return 0;
    }
  }
  return v4;
}

uint64_t IOAVDisplayMemoryRead(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  size_t v5;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  v5 = a4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0, input, 1u, 0, 0, 0, 0, outputStruct, &v5);
}

uint64_t IOAVDisplayMemoryWrite(uint64_t a1, unsigned int a2, void *inputStruct, size_t inputStructCnt)
{
  mach_port_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v4, 1u, input, 1u, inputStruct, inputStructCnt, 0, 0, 0, 0);
}

uint64_t __IOAVDisplayMemoryFree(uint64_t a1)
{
  io_connect_t v2;
  uint64_t result;

  v2 = *(_DWORD *)(a1 + 20);
  if (v2)
    IOServiceClose(v2);
  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
    return IOObjectRelease(result);
  return result;
}

void _IOAVStringAppendIndendationAndFormat(CFMutableStringRef theString, int a2, CFStringRef format, ...)
{
  int v5;
  va_list va;

  va_start(va, format);
  if (a2)
  {
    v5 = a2;
    do
    {
      CFStringAppend(theString, CFSTR("    "));
      --v5;
    }
    while (v5);
  }
  CFStringAppendFormatAndArguments(theString, 0, format, va);
}

__CFString *IOAVCreateDiagnosticsString(const __CFAllocator *a1)
{
  return IOAVCreateDiagnosticsStringWithLocation(a1, 0);
}

__CFString *IOAVCreateDiagnosticsStringWithLocation(const __CFAllocator *a1, unsigned int a2)
{
  __CFString *Mutable;
  uint64_t v5;
  const void *v6;
  const __CFString *v7;
  const __CFString *v8;
  uint64_t v9;
  const void *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;
  const void *v14;
  const __CFString *v15;
  const __CFString *v16;
  uint64_t v17;
  const void *v18;
  const __CFString *v19;
  const __CFString *v20;
  uint64_t v21;
  const void *v22;
  const __CFString *v23;
  const __CFString *v24;

  Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    v5 = IOAVControllerCreateWithLocation((uint64_t)a1, a2);
    if (v5)
    {
      v6 = (const void *)v5;
      v7 = (const __CFString *)IOAVControllerCopyDiagnosticsString();
      if (v7)
      {
        v8 = v7;
        CFStringAppend(Mutable, v7);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    v9 = IOAVDeviceCreateWithLocation((uint64_t)a1, a2);
    if (v9)
    {
      v10 = (const void *)v9;
      v11 = (const __CFString *)IOAVDeviceCopyDiagnosticsString();
      if (v11)
      {
        v12 = v11;
        CFStringAppend(Mutable, v11);
        CFRelease(v12);
      }
      CFRelease(v10);
    }
    v13 = IOAVServiceCreate((uint64_t)a1);
    if (v13)
    {
      v14 = (const void *)v13;
      v15 = (const __CFString *)IOAVServiceCopyDiagnosticsString();
      if (v15)
      {
        v16 = v15;
        CFStringAppend(Mutable, v15);
        CFRelease(v16);
      }
      CFRelease(v14);
    }
    v17 = IOAVAudioInterfaceCreate((uint64_t)a1);
    if (v17)
    {
      v18 = (const void *)v17;
      v19 = (const __CFString *)IOAVAudioInterfaceCopyDiagnosticsString();
      if (v19)
      {
        v20 = v19;
        CFStringAppend(Mutable, v19);
        CFRelease(v20);
      }
      CFRelease(v18);
    }
    v21 = IOAVVideoInterfaceCreate((uint64_t)a1);
    if (v21)
    {
      v22 = (const void *)v21;
      v23 = (const __CFString *)IOAVVideoInterfaceCopyDiagnosticsString();
      if (v23)
      {
        v24 = v23;
        CFStringAppend(Mutable, v23);
        CFRelease(v24);
      }
      CFRelease(v22);
    }
  }
  return Mutable;
}

__CFDictionary *IOAVCreateDiagnosticsReference(const __CFAllocator *a1)
{
  return IOAVCreateDiagnosticsReferenceWithLocation(a1, 0);
}

__CFDictionary *IOAVCreateDiagnosticsReferenceWithLocation(const __CFAllocator *a1, unsigned int a2)
{
  __CFDictionary *Mutable;
  uint64_t v5;
  const void *v6;
  CFArrayRef v7;
  CFArrayRef v8;
  uint64_t v9;
  const void *v10;
  CFArrayRef v11;
  CFArrayRef v12;
  uint64_t v13;
  const void *v14;
  CFArrayRef v15;
  CFArrayRef v16;
  uint64_t v17;
  const void *v18;
  CFArrayRef v19;
  CFArrayRef v20;
  uint64_t v21;
  const void *v22;
  CFArrayRef v23;
  CFArrayRef v24;
  uint64_t v25;
  const void *v26;
  CFArrayRef v27;
  CFArrayRef v28;

  Mutable = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (Mutable)
  {
    v5 = IOAVControllerCreateWithLocation((uint64_t)a1, a2);
    if (v5)
    {
      v6 = (const void *)v5;
      v7 = IOAVControllerCopyProperties(v5);
      if (v7)
      {
        v8 = v7;
        CFDictionarySetValue(Mutable, CFSTR("IOAVController"), v7);
        CFRelease(v8);
      }
      CFRelease(v6);
    }
    v9 = IOAVDeviceCreateWithLocation((uint64_t)a1, a2);
    if (v9)
    {
      v10 = (const void *)v9;
      v11 = IOAVDeviceCopyProperties(v9);
      if (v11)
      {
        v12 = v11;
        CFDictionarySetValue(Mutable, CFSTR("IOAVDevice"), v11);
        CFRelease(v12);
      }
      CFRelease(v10);
    }
    v13 = IOAVServiceCreate((uint64_t)a1);
    if (v13)
    {
      v14 = (const void *)v13;
      v15 = IOAVServiceCopyProperties(v13);
      if (v15)
      {
        v16 = v15;
        CFDictionarySetValue(Mutable, CFSTR("IOAVService"), v15);
        CFRelease(v16);
      }
      CFRelease(v14);
    }
    v17 = IOAVAudioInterfaceCreate((uint64_t)a1);
    if (v17)
    {
      v18 = (const void *)v17;
      v19 = IOAVAudioInterfaceCopyProperties(v17);
      if (v19)
      {
        v20 = v19;
        CFDictionarySetValue(Mutable, CFSTR("IOAVAudioInterface"), v19);
        CFRelease(v20);
      }
      CFRelease(v18);
    }
    v21 = IOAVVideoInterfaceCreate((uint64_t)a1);
    if (v21)
    {
      v22 = (const void *)v21;
      v23 = IOAVVideoInterfaceCopyProperties(v21);
      if (v23)
      {
        v24 = v23;
        CFDictionarySetValue(Mutable, CFSTR("IOAVVideoInterface"), v23);
        CFRelease(v24);
      }
      CFRelease(v22);
    }
    v25 = IOAVControlInterfaceCreate((uint64_t)a1);
    if (v25)
    {
      v26 = (const void *)v25;
      v27 = IOAVControlInterfaceCopyProperties(v25);
      if (v27)
      {
        v28 = v27;
        CFDictionarySetValue(Mutable, CFSTR("IOAVControlInterface"), v27);
        CFRelease(v28);
      }
      CFRelease(v26);
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithVideoLinkData(const __CFAllocator *a1, unsigned __int8 *a2, int a3, char a4)
{
  __CFString *Mutable;
  __CFString *v9;
  int v10;
  double v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  unint64_t v18;
  const __CFString *v19;
  __CFString *v20;
  __CFString *v21;
  __CFString *v22;
  unint64_t v23;
  __CFString *v24;
  const __CFString *v25;
  const char *v26;
  const char *v28;
  const char *v29;

  Mutable = CFStringCreateMutable(a1, 0);
  v9 = Mutable;
  if (Mutable)
  {
    if ((a4 & 1) != 0)
    {
      v10 = *((_DWORD *)a2 + 10);
      v11 = (double)*((int *)a2 + 24) * 0.0000152587891;
      v12 = *((unsigned int *)a2 + 12);
      v13 = *((unsigned int *)a2 + 20);
      v14 = *((unsigned int *)a2 + 2);
      v15 = IOAVVideoColorDynamicRangeString(*((_DWORD *)a2 + 4));
      v16 = IOAVVideoPixelEncodingString(*((_DWORD *)a2 + 3));
      v28 = IOAVVideoColorimetryString(*((_DWORD *)a2 + 5));
      v29 = IOAVVideoColorEOTFString(*((_DWORD *)a2 + 6));
      v17 = 105;
      if ((v10 & 1) == 0)
        v17 = 112;
      CFStringAppendFormat(v9, 0, CFSTR("%dx%d%c %.3f Hz, %dbpc %s Range %s, %s colorimetry, %s EOTF"), v12, v13, v17, *(_QWORD *)&v11, v14, v15, v16, v28, v29);
      if ((*(_WORD *)(a2 + 1) & 1) != 0)
      {
        if ((*((_WORD *)a2 + 63) & 1) != 0)
          v19 = CFSTR(", DSC (%f bpp, passthrough)");
        else
          v19 = CFSTR(", DSC (%f bpp, decompress)");
        LOWORD(v18) = *((_WORD *)a2 + 62);
        CFStringAppendFormat(v9, 0, v19, (double)v18 * 0.0625);
      }
    }
    else
    {
      _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("Video Link Data:\n\n"));
      v20 = IOAVCreateStringWithVideoTimingData(a1, (_DWORD *)a2 + 10, a3 + 1);
      if (v20)
      {
        v21 = v20;
        CFStringAppend(v9, v20);
        CFRelease(v21);
      }
      v22 = IOAVCreateStringWithVideoColorData(a1, (unsigned int *)a2 + 2, a3 + 1);
      if (v22)
      {
        v24 = v22;
        CFStringAppend(v9, v22);
        CFRelease(v24);
      }
      if ((*(_WORD *)(a2 + 1) & 1) != 0)
      {
        if ((*((_WORD *)a2 + 63) & 1) != 0)
          v25 = CFSTR("DSC:          YES (%f bpp, passthrough)\n");
        else
          v25 = CFSTR("DSC:          YES (%f bpp, decompress)\n");
        LOWORD(v23) = *((_WORD *)a2 + 62);
        _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, v25, (double)v23 * 0.0625);
      }
      else
      {
        _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, CFSTR("DSC:          NO\n"));
      }
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, CFSTR("Link ID:      %u\n"), *((_DWORD *)a2 + 30) & 0xFFF);
      v26 = IOAVVideoLinkModeString(*a2);
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, CFSTR("Link Mode:    %s\n"), v26);
      _IOAVStringAppendIndendationAndFormat(v9, a3 + 1, CFSTR("Test Mode:    %d\n"), *((unsigned int *)a2 + 1));
      _IOAVStringAppendIndendationAndFormat(v9, a3, CFSTR("\n"));
    }
  }
  return v9;
}

__CFString *IOAVCreateStringWithVideoTimingData(const __CFAllocator *a1, _DWORD *a2, int a3)
{
  __CFString *Mutable;
  uint64_t PixelClock;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;

  Mutable = CFStringCreateMutable(a1, 0);
  PixelClock = IOAVVideoTimingGetPixelClock(a2, 0);
  if (Mutable)
  {
    v7 = PixelClock;
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("Timing Attributes:\n"));
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("Horizontal:    Total: %5u Active: %5u FrontPorch: %4u SyncWidth: %3u BackPorch: %3u SyncPolarity: %u PixelRepetition: %u SyncRate: %10.6f kHz\n"), a2[1], a2[2], a2[5], a2[3], a2[4], a2[7], a2[8], (double)(int)a2[6] * 0.0000152587891);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("Vertical:      Total: %5u Active: %5u FrontPorch: %4u SyncWidth: %3u BackPorch: %3u SyncPolarity: %u PixelRepetition: %u SyncRate: %10.6f Hz\n"), a2[9], a2[10], a2[13], a2[11], a2[12], a2[15], a2[16], (double)(int)a2[14] * 0.0000152587891);
    if ((*a2 & 1) != 0)
      v8 = "YES";
    else
      v8 = "NO";
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("Interlaced:    %s\n"), v8);
    if ((*a2 & 2) != 0)
      v9 = "YES";
    else
      v9 = "NO";
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("Split:         %s\n"), v9);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("Pixel Clock:   %f Mhz (%u Hz)\n"), (double)v7 / 1000000.0, v7);
    v10 = IOAVVideoScanInformationString(a2[19]);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("Scan Type:     %s\n"), v10);
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("\n"));
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithVideoColorData(const __CFAllocator *a1, unsigned int *a2, int a3)
{
  __CFString *Mutable;
  __CFString *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;

  Mutable = CFStringCreateMutable(a1, 0);
  v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("Color Attributes:\n"));
    v7 = *a2;
    v8 = IOAVVideoPixelEncodingString(a2[1]);
    v9 = IOAVVideoColorDynamicRangeString(a2[2]);
    v10 = IOAVVideoColorimetryString(a2[3]);
    v11 = IOAVVideoColorEOTFString(a2[4]);
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, CFSTR("Depth: [%d bpc] Encoding: [%s] Range: [%s] Colorimetry: [%s] EOTF: [%s] DSC: [%s]\n"), v7, v8, v9, v10, v11, IOAVCreateStringWithVideoColorData_dscMethods[a2[5] & 3]);
    _IOAVStringAppendIndendationAndFormat(v6, a3, CFSTR("\n"));
  }
  return v6;
}

__CFString *IOAVCreateStringWithAudioLinkData(const __CFAllocator *a1, unsigned int *a2, int a3, char a4)
{
  return __IOAVCreateStringWithAudioLinkData(a1, a2, a3, 1, a4);
}

__CFString *__IOAVCreateStringWithAudioLinkData(const __CFAllocator *a1, unsigned int *a2, int a3, int a4, char a5)
{
  __CFString *Mutable;
  unint64_t v10;
  __CFString *v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  double v15;
  const char *v16;
  const char *v17;
  unint64_t v18;
  const char *v19;
  __n128 v21;
  uint64_t v22;

  Mutable = CFStringCreateMutable(a1, 0);
  v11 = Mutable;
  if (Mutable)
  {
    if ((a5 & 1) != 0)
    {
      LODWORD(v10) = a2[3];
      v12 = *a2;
      v13 = a2[1];
      v14 = a2[2];
      v15 = (double)v10 / 1000.0;
      v16 = IOAVAudioFormatString(v12);
      CFStringAppendFormat(v11, 0, CFSTR("%g kHz %dch %d-bit %s"), *(_QWORD *)&v15, v13, v14, v16);
    }
    else
    {
      v22 = 0;
      memset(&v21, 0, 32);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("Audio Link Data:\n"));
      v17 = IOAVAudioFormatString(*a2);
      _IOAVStringAppendIndendationAndFormat(v11, a3 + 1, CFSTR("Format: %s Channels: %d SampleSize: %d SampleRate: %d hz\n"), v17, a2[1], a2[2], a2[3]);
      if (a4)
      {
        _IOAVStringAppendIndendationAndFormat(v11, a3 + 1, CFSTR("Layout:\n"));
        IOAVAudioGetChannelLayoutData(a2[5], &v21);
        if (v21.n128_u32[0])
        {
          v18 = 0;
          do
          {
            v19 = IOAVAudioSpeakerString(v21.n128_u32[v18 + 2]);
            _IOAVStringAppendIndendationAndFormat(v11, a3 + 2, CFSTR("Channel %d: %s\n"), v18++, v19);
          }
          while (v18 < v21.n128_u32[0]);
        }
      }
      _IOAVStringAppendIndendationAndFormat(v11, a3, CFSTR("\n"));
    }
  }
  return v11;
}

__CFString *IOAVCreateStringWithAudioChannelLayoutData(const __CFAllocator *a1, unsigned int *a2, int a3)
{
  __CFString *Mutable;
  __CFString *v6;
  unint64_t v7;
  const char *v8;

  Mutable = CFStringCreateMutable(a1, 0);
  v6 = Mutable;
  if (Mutable)
  {
    _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("Audio Channel Layout Data:\n\n"));
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, CFSTR("Total Channels: %d Active Channels: %d\n"), *a2, a2[1]);
    _IOAVStringAppendIndendationAndFormat(v6, a3 + 1, CFSTR("Layout:\n"));
    if (*a2)
    {
      v7 = 0;
      do
      {
        v8 = IOAVAudioSpeakerString(a2[v7 + 2]);
        _IOAVStringAppendIndendationAndFormat(v6, a3 + 2, CFSTR("Channel %d: %s\n"), v7++, v8);
      }
      while (v7 < *a2);
    }
    _IOAVStringAppendIndendationAndFormat(v6, a3, CFSTR("\n"));
  }
  return v6;
}

const __CFDictionary *_IOAVElementListGetElementIDAtIndex(const __CFArray *a1, CFIndex a2)
{
  const __CFDictionary *result;

  result = (const __CFDictionary *)CFArrayGetValueAtIndex(a1, a2);
  if (result)
    return (const __CFDictionary *)CFDictionaryGetValue(result, CFSTR("ID"));
  return result;
}

__CFString *_IOAVCreateStringOfColorIDs(const __CFAllocator *a1, CFDictionaryRef theDict, void *key, int a4, uint64_t (*a5)(const __CFArray *, uint64_t))
{
  const __CFArray *Value;
  const __CFArray *v11;
  __CFString *Mutable;
  CFIndex Count;
  uint64_t v14;
  const __CFArray *v15;
  CFIndex v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  const __CFNumber *v20;
  const __CFNumber *v21;
  CFTypeID v22;
  uint64_t v23;
  uint64_t v24;
  const __CFArray *theArray;
  uint64_t valuePtr;
  CFRange v28;

  Value = (const __CFArray *)CFDictionaryGetValue(theDict, key);
  if (!Value)
    return 0;
  v11 = Value;
  Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    Count = CFArrayGetCount(v11);
    if (Count)
    {
      v14 = Count;
      v15 = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("UnsafeColorElementIDs"));
      theArray = v15;
      if (v15)
        v16 = CFArrayGetCount(v15);
      else
        v16 = 0;
      _IOAVStringAppendIndendationAndFormat(Mutable, a4, CFSTR("%@:"), key);
      if (v14 >= 1)
      {
        v17 = 0;
        v18 = a4 + 1;
        do
        {
          valuePtr = 0;
          v19 = v17 + 1;
          if ((v17 & 0xF) == 0 && v19 < v14)
          {
            CFStringAppend(Mutable, CFSTR("\n"));
            _IOAVStringAppendIndendationAndFormat(Mutable, v18, &stru_1E2005170);
          }
          v20 = (const __CFNumber *)a5(v11, v17);
          if (v20)
          {
            v21 = v20;
            v22 = CFGetTypeID(v20);
            if (v22 == CFNumberGetTypeID())
            {
              CFNumberGetValue(v21, kCFNumberSInt64Type, &valuePtr);
              v23 = valuePtr;
              if (v16)
              {
                v28.location = 0;
                v28.length = v16;
                if (CFArrayContainsValue(theArray, v28, v21))
                  v24 = 42;
                else
                  v24 = 32;
              }
              else
              {
                v24 = 32;
              }
              CFStringAppendFormat(Mutable, 0, CFSTR("%3lld%c "), v23, v24);
            }
          }
          v17 = v19;
        }
        while (v14 != v19);
      }
      CFStringAppend(Mutable, CFSTR("\n"));
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithElement(const __CFAllocator *a1, const __CFDictionary *a2, int a3)
{
  __CFString *Mutable;
  const __CFNumber *Value;
  uint64_t v8;
  const char *v9;
  const __CFNumber *v10;
  const __CFNumber *v11;
  const void *v12;
  const void **v13;
  const char *v14;
  const void *v15;
  const char *v16;
  const void *v17;
  const char *v18;
  const __CFData *v19;
  __CFString *v20;
  const __CFNumber *v21;
  const char *v22;
  const __CFNumber *v23;
  const char *v24;
  const __CFNumber *v25;
  const char *v26;
  const __CFNumber *v27;
  const __CFNumber *v28;
  const char *v29;
  const __CFNumber *v30;
  uint64_t v31;
  const __CFNumber *v32;
  unsigned int v33;
  int v34;
  const char *v35;
  __CFString *v36;
  __CFString *v37;
  __CFString *v38;
  __CFString *v39;
  const void *v40;
  const void *v41;
  const __CFString *v42;
  const __CFString *v43;
  const void *v44;
  const void *v45;
  const char *v46;
  const __CFNumber *v47;
  const char *v48;
  const __CFData *v49;
  __CFString *v50;
  __CFString *v51;
  const void *v52;
  __CFString *v53;
  const __CFData *v54;
  __CFString *v55;
  const __CFArray *v56;
  const __CFArray *v57;
  CFIndex Count;
  uint64_t v59;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFNumber *v62;
  const __CFNumber *v63;
  const __CFNumber *v64;
  const char *v65;
  const __CFData *v66;
  uint64_t v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int valuePtr;
  UInt8 buffer[16];
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint64_t v77;
  CFRange v78;
  CFRange v79;
  CFRange v80;
  CFRange v81;

  v77 = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    Value = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("ElementType"));
    if (Value)
    {
      valuePtr = 0;
      CFNumberGetValue(Value, kCFNumberIntType, &valuePtr);
      v8 = (a3 + 1);
      v9 = IOAVElementTypeString(valuePtr);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s Element\n"), v9);
      _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("------------------------\n"));
      if (a2)
      {
        *(_QWORD *)buffer = 0;
        v10 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("ID"));
        if (v10)
        {
          CFNumberGetValue(v10, kCFNumberSInt64Type, buffer);
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %lld\n"), "ID", *(_QWORD *)buffer);
        }
        *(_QWORD *)buffer = 0;
        v11 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("Score"));
        if (v11)
        {
          CFNumberGetValue(v11, kCFNumberSInt64Type, buffer);
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %lld\n"), "Score", *(_QWORD *)buffer);
        }
        v12 = CFDictionaryGetValue(a2, CFSTR("IsVirtual"));
        v13 = (const void **)MEMORY[0x1E0C9AE50];
        if (v12)
        {
          if (v12 == (const void *)*MEMORY[0x1E0C9AE50])
            v14 = "YES";
          else
            v14 = "NO";
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "IsVirtual", v14);
        }
        v15 = CFDictionaryGetValue(a2, CFSTR("IsPreferred"));
        if (v15)
        {
          if (v15 == *v13)
            v16 = "YES";
          else
            v16 = "NO";
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "IsPreferred", v16);
        }
        v17 = CFDictionaryGetValue(a2, CFSTR("IsPromoted"));
        if (v17)
        {
          if (v17 == *v13)
            v18 = "YES";
          else
            v18 = "NO";
          _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "IsPromoted", v18);
        }
      }
      switch(valuePtr)
      {
        case 0u:
          v75 = 0u;
          v76 = 0u;
          v73 = 0u;
          v74 = 0u;
          *(_OWORD *)buffer = 0u;
          v19 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("ElementData"));
          if (v19)
          {
            v78.location = 0;
            v78.length = 80;
            CFDataGetBytes(v19, v78, buffer);
            v20 = IOAVCreateStringWithVideoTimingData(a1, buffer, a3 + 1);
            if (a2)
            {
              LODWORD(v68) = 0;
              v21 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("StandardType"));
              if (v21)
              {
                CFNumberGetValue(v21, kCFNumberSInt32Type, &v68);
                v22 = IOAVStandardTypeString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "StandardType", v22);
              }
              LODWORD(v68) = 0;
              v23 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("TimingType"));
              if (v23)
              {
                CFNumberGetValue(v23, kCFNumberSInt32Type, &v68);
                v24 = IOAVVideoTimingTypeString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "TimingType", v24);
              }
              LODWORD(v68) = 0;
              v25 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("TimingStandard"));
              if (v25)
              {
                CFNumberGetValue(v25, kCFNumberSInt32Type, &v68);
                v26 = IOAVVideoTimingStandardString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "TimingStandard", v26);
              }
              v68 = 0;
              v27 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("CEAShortID"));
              if (v27)
              {
                CFNumberGetValue(v27, kCFNumberSInt64Type, &v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %lld\n"), "CEAShortID", v68);
              }
              LODWORD(v68) = 0;
              v28 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("AspectRatio"));
              if (v28)
              {
                CFNumberGetValue(v28, kCFNumberSInt32Type, &v68);
                v29 = IOAVVideoAspectRatioString(v68);
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "AspectRatio", v29);
              }
              v68 = 0;
              v30 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("PreciseAspectRatio"));
              if (v30)
              {
                CFNumberGetValue(v30, kCFNumberSInt64Type, &v68);
                LOWORD(v31) = v68;
                if (v68 < 0)
                  v31 = -v68;
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %lld.%0*lld\n"), "PreciseAspectRatio", v68 / 0x10000, 3, (1000 * (unint64_t)(unsigned __int16)v31) >> 16);
              }
            }
            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s:\n"), "ValidPixelEncodings");
            v32 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("ValidPixelEncodings"));
            if (v32)
            {
              LODWORD(v68) = 0;
              CFNumberGetValue(v32, kCFNumberIntType, &v68);
              v33 = 0;
              v34 = a3 + 2;
              do
              {
                if (((v68 >> v33) & 1) != 0)
                {
                  v35 = IOAVVideoPixelEncodingString(v33);
                  _IOAVStringAppendIndendationAndFormat(Mutable, v34, CFSTR("%s\n"), v35);
                }
                ++v33;
              }
              while (v33 != 15);
            }
            v36 = _IOAVCreateStringOfColorIDs(a1, a2, CFSTR("ColorModes"), v8, (uint64_t (*)(const __CFArray *, uint64_t))_IOAVElementListGetElementIDAtIndex);
            if (v36)
            {
              v37 = v36;
              CFStringAppend(Mutable, v36);
              CFRelease(v37);
            }
            v38 = _IOAVCreateStringOfColorIDs(a1, a2, CFSTR("DSCRequiredColorElementIDs"), v8, (uint64_t (*)(const __CFArray *, uint64_t))MEMORY[0x1E0C97D98]);
            if (v38)
            {
              v39 = v38;
              CFStringAppend(Mutable, v38);
              CFRelease(v39);
            }
            if (v20)
            {
              CFStringAppend(Mutable, v20);
              CFRelease(v20);
            }
            v40 = CFDictionaryGetValue(a2, CFSTR("DownstreamFormat"));
            if (v40)
            {
              v41 = v40;
              _IOAVStringAppendIndendationAndFormat(Mutable, v8, CFSTR("%s:\n\n"), "DownstreamFormat");
              v42 = (const __CFString *)IOAVCreateStringWithElement(a1, v41, v8);
              if (v42)
              {
                v43 = v42;
                CFStringAppend(Mutable, v42);
                CFRelease(v43);
              }
            }
            v44 = CFDictionaryGetValue(a2, CFSTR("UpstreamFormat"));
            if (v44)
            {
              v45 = v44;
              v46 = "UpstreamFormat";
              goto LABEL_63;
            }
          }
          break;
        case 1u:
          *(_OWORD *)buffer = 0u;
          v73 = 0u;
          if (a2)
          {
            LODWORD(v68) = 0;
            v47 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("StandardType"));
            if (v47)
            {
              CFNumberGetValue(v47, kCFNumberSInt32Type, &v68);
              v48 = IOAVStandardTypeString(v68);
              _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: %s\n"), "StandardType", v48);
            }
          }
          v49 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("ElementData"));
          if (v49)
          {
            v79.location = 0;
            v79.length = 32;
            CFDataGetBytes(v49, v79, buffer);
            v50 = IOAVCreateStringWithVideoColorData(a1, (unsigned int *)buffer, a3 + 1);
            if (v50)
            {
              v51 = v50;
              CFStringAppend(Mutable, v50);
              CFRelease(v51);
              v52 = CFDictionaryGetValue(a2, CFSTR("DownstreamFormat"));
              if (v52)
              {
                v45 = v52;
                v46 = "DownstreamFormat";
LABEL_63:
                _IOAVStringAppendIndendationAndFormat(Mutable, v8, CFSTR("%s:\n\n"), v46);
                v53 = (__CFString *)IOAVCreateStringWithElement(a1, v45, v8);
                goto LABEL_82;
              }
            }
          }
          break;
        case 2u:
          *(_OWORD *)buffer = 0u;
          v73 = 0u;
          v69 = 0;
          v70 = 0;
          v54 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("ElementData"));
          if (v54)
          {
            v80.location = 0;
            v80.length = 32;
            CFDataGetBytes(v54, v80, buffer);
            v55 = __IOAVCreateStringWithAudioLinkData(a1, (unsigned int *)buffer, a3 + 1, 0, 0);
            v56 = (const __CFArray *)CFDictionaryGetValue(a2, CFSTR("AudioChannelLayoutElements"));
            if (v56)
            {
              v57 = v56;
              Count = CFArrayGetCount(v56);
              if (Count)
              {
                v59 = Count;
                _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("%s: "), "AudioChannelLayoutElements");
                if (v59 >= 1)
                {
                  for (i = 0; i != v59; ++i)
                  {
                    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v57, i);
                    v68 = 0;
                    if (ValueAtIndex)
                    {
                      v62 = (const __CFNumber *)CFDictionaryGetValue(ValueAtIndex, CFSTR("ID"));
                      if (v62)
                      {
                        CFNumberGetValue(v62, kCFNumberSInt64Type, &v68);
                        _IOAVStringAppendIndendationAndFormat(Mutable, 1, CFSTR("%lld "), v68);
                      }
                    }
                  }
                }
                CFStringAppend(Mutable, CFSTR("\n"));
              }
            }
            v63 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("StreamSampleRate"));
            if (v63)
              CFNumberGetValue(v63, kCFNumberIntType, &v70);
            v64 = (const __CFNumber *)CFDictionaryGetValue(a2, CFSTR("MaxChannelCount"));
            if (v64)
              CFNumberGetValue(v64, kCFNumberIntType, &v69);
            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 1, CFSTR("Audio Stream Data:\n"));
            v65 = IOAVAudioFormatString(*(unsigned int *)buffer);
            _IOAVStringAppendIndendationAndFormat(Mutable, a3 + 2, CFSTR("Format: %s Channels: %d SampleSize: %d SampleRate: %d hz\n"), v65, v69, *(unsigned int *)&buffer[8], v70);
            if (v55)
              goto LABEL_86;
          }
          break;
        case 3u:
          *(_QWORD *)&v74 = 0;
          *(_OWORD *)buffer = 0u;
          v73 = 0u;
          v66 = (const __CFData *)CFDictionaryGetValue(a2, CFSTR("ElementData"));
          if (v66)
          {
            v81.location = 0;
            v81.length = 40;
            CFDataGetBytes(v66, v81, buffer);
            v53 = IOAVCreateStringWithAudioChannelLayoutData(a1, (unsigned int *)buffer, a3 + 1);
LABEL_82:
            v55 = v53;
            if (v53)
            {
LABEL_86:
              CFStringAppend(Mutable, v55);
              CFStringAppend(Mutable, CFSTR("\n"));
              CFRelease(v55);
            }
          }
          break;
        default:
          CFShow(a2);
          break;
      }
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithElements(const __CFAllocator *a1, const __CFArray *a2, int a3)
{
  __CFString *Mutable;
  CFIndex Count;
  CFIndex v8;
  CFIndex i;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  CFTypeID v12;
  __CFString *v13;
  __CFString *v14;

  Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    Count = CFArrayGetCount(a2);
    if (Count >= 1)
    {
      v8 = Count;
      for (i = 0; i != v8; ++i)
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(a2, i);
        if (ValueAtIndex)
        {
          v11 = ValueAtIndex;
          v12 = CFGetTypeID(ValueAtIndex);
          if (v12 == CFDictionaryGetTypeID())
          {
            v13 = IOAVCreateStringWithElement(a1, v11, a3);
            if (v13)
            {
              v14 = v13;
              CFStringAppend(Mutable, v13);
              CFRelease(v14);
            }
          }
        }
      }
    }
  }
  return Mutable;
}

__CFString *IOAVCreateStringWithData(const __CFAllocator *a1, const __CFData *a2, int a3)
{
  __CFString *Mutable;
  unsigned int Length;
  unsigned int v7;
  uint64_t v8;
  unsigned int v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  const UInt8 *BytePtr;

  Mutable = CFStringCreateMutable(a1, 0);
  if (Mutable)
  {
    Length = CFDataGetLength(a2);
    v7 = Length;
    if (Length)
    {
      v8 = 0;
      v9 = Length;
      do
      {
        if (v9 >= 0x10uLL)
          v10 = 16;
        else
          v10 = v9;
        v11 = v8;
        if (v7 - v8 >= 0x10)
          v12 = 16;
        else
          v12 = v7 - v8;
        _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("%08x: "), v8);
        if (v12)
        {
          v13 = v11;
          do
          {
            BytePtr = CFDataGetBytePtr(a2);
            _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("%02x "), BytePtr[v13++]);
            --v10;
          }
          while (v10);
        }
        _IOAVStringAppendIndendationAndFormat(Mutable, a3, CFSTR("\n"));
        v8 = (v11 + 16);
        v9 -= 16;
      }
      while (v8 < v7);
    }
  }
  return Mutable;
}

CFArrayRef IOAVPropertyListCreateWithCFProperties(const __CFAllocator *a1, const void *a2)
{
  CFTypeID v4;
  const void **v10;
  unint64_t Count;
  CFIndex v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  const __CFArray *v16;
  _BYTE *v17;
  const void **v18;
  unint64_t v19;
  CFIndex v20;
  _BYTE *v21;
  const void **v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  const __CFArray *v26;
  CFArrayRef v27;
  const void **v28;
  const void *v29;
  unint64_t v30;
  CFIndex v31;
  uint64_t v32;
  uint64_t v33;
  const void **v34;
  const void *v35;
  uint64_t i;
  const void **v37;
  const void *v38;
  uint64_t j;
  const void **v40;
  uint64_t k;
  _BYTE v42[1024];
  _BYTE v43[1024];
  uint64_t v44;
  CFRange v45;

  v44 = *MEMORY[0x1E0C80C00];
  if (!a2)
    return 0;
  if (IOAVPropertyListCreateWithCFProperties_onceToken != -1)
    dispatch_once(&IOAVPropertyListCreateWithCFProperties_onceToken, &__block_literal_global_16);
  v4 = CFGetTypeID(a2);
  if (v4 == IOAVPropertyListCreateWithCFProperties_BOOLeanTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_numberTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_stringTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_dateTypeID
    || v4 == IOAVPropertyListCreateWithCFProperties_dataTypeID)
  {
    return (CFArrayRef)CFRetain(a2);
  }
  if (v4 == IOAVPropertyListCreateWithCFProperties_arrayTypeID)
  {
    v10 = (const void **)v43;
    bzero(v43, 0x400uLL);
    Count = CFArrayGetCount((CFArrayRef)a2);
    v12 = Count;
    if (Count < 0x81 || (v10 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL)) != 0)
    {
      v45.location = 0;
      v45.length = v12;
      CFArrayGetValues((CFArrayRef)a2, v45, v10);
      if (v12 < 1)
      {
LABEL_39:
        v16 = (const __CFArray *)CFRetain(a2);
      }
      else
      {
        v13 = 0;
        v14 = 0;
        do
        {
          v15 = IOAVPropertyListCreateWithCFProperties(a1, v10[v13]);
          if (!v15)
          {
            if (v13)
            {
              for (i = 0; i != v13; ++i)
                CFRelease(v10[i]);
            }
            goto LABEL_76;
          }
          v14 |= v15 != (_QWORD)v10[v13];
          v10[v13++] = (const void *)v15;
        }
        while (v12 != v13);
        if ((v14 & 1) == 0)
          goto LABEL_39;
        v16 = CFArrayCreate(a1, v10, v12, MEMORY[0x1E0C9B378]);
      }
      v27 = v16;
      if (v12 >= 1)
      {
        v28 = v10;
        do
        {
          v29 = *v28++;
          CFRelease(v29);
          --v12;
        }
        while (v12);
      }
      goto LABEL_77;
    }
    return 0;
  }
  if (v4 == IOAVPropertyListCreateWithCFProperties_dictionaryTypeID)
  {
    v17 = v43;
    bzero(v43, 0x400uLL);
    v18 = (const void **)v42;
    bzero(v42, 0x400uLL);
    v19 = CFDictionaryGetCount((CFDictionaryRef)a2);
    v20 = v19;
    if (v19 >= 0x81)
    {
      v21 = malloc_type_malloc(8 * v19, 0xC0040B8AA526DuLL);
      if (!v21)
        return 0;
      v17 = v21;
      v22 = (const void **)malloc_type_malloc(8 * v20, 0xC0040B8AA526DuLL);
      if (!v22)
      {
        free(v17);
        return 0;
      }
      v18 = v22;
    }
    CFDictionaryGetKeysAndValues((CFDictionaryRef)a2, (const void **)v17, v18);
    if (v20 < 1)
    {
LABEL_58:
      v26 = (const __CFArray *)CFRetain(a2);
LABEL_59:
      v27 = v26;
      if (v20 >= 1)
      {
        v37 = v18;
        do
        {
          v38 = *v37++;
          CFRelease(v38);
          --v20;
        }
        while (v20);
      }
      if (v17 != v43)
        free(v17);
      if (v18 == (const void **)v42)
        return v27;
LABEL_71:
      v40 = v18;
      goto LABEL_79;
    }
    v23 = 0;
    v24 = 0;
    while (1)
    {
      v25 = IOAVPropertyListCreateWithCFProperties(a1, v18[v23]);
      if (!v25)
        break;
      v24 |= v25 != (_QWORD)v18[v23];
      v18[v23++] = (const void *)v25;
      if (v20 == v23)
      {
        if ((v24 & 1) == 0)
          goto LABEL_58;
        v26 = CFDictionaryCreate(a1, (const void **)v17, v18, v20, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        goto LABEL_59;
      }
    }
    if (v23)
    {
      for (j = 0; j != v23; ++j)
        CFRelease(v18[j]);
    }
    if (v18 != (const void **)v42)
    {
      free(v17);
      v27 = 0;
      goto LABEL_71;
    }
    return 0;
  }
  if (v4 != IOAVPropertyListCreateWithCFProperties_setTypeID)
    return 0;
  v10 = (const void **)v43;
  bzero(v43, 0x400uLL);
  v30 = CFSetGetCount((CFSetRef)a2);
  v31 = v30;
  if (v30 >= 0x81)
  {
    v10 = (const void **)malloc_type_malloc(8 * v30, 0x80040B8603338uLL);
    if (!v10)
      return 0;
  }
  CFSetGetValues((CFSetRef)a2, v10);
  if (v31 < 1)
  {
    v27 = CFArrayCreate(a1, v10, v31, MEMORY[0x1E0C9B378]);
  }
  else
  {
    v32 = 0;
    while (1)
    {
      v33 = IOAVPropertyListCreateWithCFProperties(a1, v10[v32]);
      if (!v33)
        break;
      v10[v32++] = (const void *)v33;
      if (v31 == v32)
      {
        v27 = CFArrayCreate(a1, v10, v31, MEMORY[0x1E0C9B378]);
        v34 = v10;
        do
        {
          v35 = *v34++;
          CFRelease(v35);
          --v31;
        }
        while (v31);
        goto LABEL_77;
      }
    }
    if (v32)
    {
      for (k = 0; k != v32; ++k)
        CFRelease(v10[k]);
    }
LABEL_76:
    v27 = 0;
  }
LABEL_77:
  if (v10 != (const void **)v43)
  {
    v40 = v10;
LABEL_79:
    free(v40);
  }
  return v27;
}

BOOL IOAVObjectConformsTo(io_registry_entry_t a1, uint64_t a2)
{
  const __CFAllocator *v3;
  const __CFString *v4;
  const __CFString *v5;
  CFTypeRef CFProperty;
  _BOOL8 v7;

  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v4 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, CFSTR("%s%s"), a2, "UserInterfaceSupported");
  if (!v4)
    return 0;
  v5 = v4;
  CFProperty = IORegistryEntryCreateCFProperty(a1, v4, v3, 0);
  if (CFProperty)
  {
    v7 = CFProperty == (CFTypeRef)*MEMORY[0x1E0C9AE50];
    CFRelease(CFProperty);
  }
  else
  {
    v7 = 0;
  }
  CFRelease(v5);
  return v7;
}

uint64_t IOAVConnectCallCopyMethod(mach_port_t a1, uint32_t a2, CFTypeRef *a3)
{
  uint64_t result;
  size_t v5;
  const char *outputStruct;

  v5 = -3;
  outputStruct = 0;
  if (!a3)
    return 3758097090;
  result = IOConnectCallMethod(a1, a2, 0, 0, 0, 0, 0, 0, &outputStruct, &v5);
  if ((_DWORD)result)
  {
    *a3 = 0;
  }
  else
  {
    *a3 = IOCFUnserializeBinary(outputStruct, v5, 0, 0, 0);
    mach_vm_deallocate(*MEMORY[0x1E0C83DA0], (mach_vm_address_t)outputStruct, v5);
    if (*a3)
      return 0;
    else
      return 3758097085;
  }
  return result;
}

uint64_t IOAVConnectCallSetMethod(mach_port_t a1, uint32_t a2, CFTypeRef object)
{
  const __CFData *v5;
  const __CFData *v6;
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t v9;

  v5 = IOCFSerialize(object, 1uLL);
  if (!v5)
    return 3758097090;
  v6 = v5;
  BytePtr = CFDataGetBytePtr(v5);
  Length = CFDataGetLength(v6);
  v9 = IOConnectCallMethod(a1, a2, 0, 0, BytePtr, Length, 0, 0, 0, 0);
  CFRelease(v6);
  return v9;
}

uint64_t IOAVServiceGetTypeID()
{
  uint64_t result;

  result = __kIOAVServiceTypeID;
  if (!__kIOAVServiceTypeID)
  {
    pthread_once(&__serviceTypeInit_2, (void (*)(void))__IOAVServiceRegister);
    return __kIOAVServiceTypeID;
  }
  return result;
}

uint64_t __IOAVServiceRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOAVServiceTypeID = result;
  return result;
}

uint64_t IOAVServiceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVService", (uint64_t (*)(_QWORD, uint64_t))IOAVServiceCreateWithService, 0, 0, -1);
  else
    return 0;
}

uint64_t IOAVServiceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVService", (uint64_t (*)(_QWORD, uint64_t))IOAVServiceCreateWithService, 0, a2, -1);
  else
    return 0;
}

io_connect_t *IOAVServiceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  io_connect_t *Instance;
  io_connect_t *v4;
  io_service_t *v5;
  io_connect_t *CFProperty;
  io_connect_t *v7;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVService"))
    return 0;
  if (!__kIOAVServiceTypeID)
    pthread_once(&__serviceTypeInit_2, (void (*)(void))__IOAVServiceRegister);
  Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
  {
    *((_QWORD *)Instance + 2) = 0;
    *((_QWORD *)Instance + 3) = 0;
    v5 = Instance + 4;
    *((_QWORD *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E0C83DA0], 0, v4 + 5))
    {
      v7 = v4;
      v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, CFSTR("Location"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      if (CFEqual(CFProperty, CFSTR("Embedded")))
        v4[6] = 1;
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVServiceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

io_connect_t *IOAVServiceGetDevice(uint64_t a1)
{
  io_connect_t *result;
  io_registry_entry_t parent;

  result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      return *(io_connect_t **)(a1 + 32);
    }
    else
    {
      result = IOAVDeviceCreateWithService(*MEMORY[0x1E0C9AE00], parent);
      *(_QWORD *)(a1 + 32) = result;
    }
  }
  return result;
}

uint64_t IOAVServiceSetLogLevel(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetEventLogCommandMask(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 3u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetEventLogEventMask(uint64_t a1, uint64_t a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 4u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetEventLogSize(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 2u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceClearEventLog(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, 0, 0, 0, 0, 0, 0, 0, 0);
}

CFArrayRef IOAVServiceCopyProperties(uint64_t a1)
{
  const __CFAllocator *v1;
  CFArrayRef v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0))
    return 0;
  v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVServiceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVServiceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

uint64_t IOAVServiceGetPower(uint64_t a1, BOOL *a2)
{
  uint64_t v2;
  CFTypeRef CFProperty;
  const void *v5;

  v2 = 3758097084;
  if (!a2)
    return 3758097090;
  CFProperty = IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), CFSTR("Power"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    *a2 = CFEqual(CFProperty, (CFTypeRef)*MEMORY[0x1E0C9AE50]) != 0;
    CFRelease(v5);
    return 0;
  }
  return v2;
}

uint64_t IOAVServiceSetVirtualEDIDMode(uint64_t a1, unsigned int a2, CFDataRef theData)
{
  const UInt8 *BytePtr;
  size_t Length;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  if (theData)
  {
    BytePtr = CFDataGetBytePtr(theData);
    Length = CFDataGetLength(theData);
  }
  else
  {
    BytePtr = 0;
    Length = 0;
  }
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x17u, input, 1u, BytePtr, Length, 0, 0, 0, 0);
}

uint64_t IOAVServiceCopyEDID(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v3;
  CFTypeID v4;
  CFTypeRef v5;
  CFTypeRef cf;

  if (!a2)
    return 3758097090;
  cf = 0;
  v3 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0x1Au, &cf);
  if (!cf || (v4 = CFGetTypeID(cf), v4 != CFDataGetTypeID()))
  {
    *a2 = 0;
    return 3758097097;
  }
  v5 = cf;
  *a2 = cf;
  if (!v5)
    return 3758097097;
  return v3;
}

uint64_t IOAVServiceCopyPhysicalAddress(uint64_t a1, CFTypeRef *a2)
{
  uint64_t v3;
  CFTypeID v4;
  CFTypeRef v5;
  CFTypeRef cf;

  if (!a2)
    return 3758097090;
  cf = 0;
  v3 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0x1Fu, &cf);
  if (!cf || (v4 = CFGetTypeID(cf), v4 != CFDataGetTypeID()))
  {
    *a2 = 0;
    return 3758097097;
  }
  v5 = cf;
  *a2 = cf;
  if (!v5)
    return 3758097097;
  return v3;
}

uint64_t IOAVServiceGetLinkData(uint64_t a1, unsigned int a2, void *outputStruct)
{
  size_t v4;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = 0;
  v4 = 272;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVServiceGetLinkDataWithSource(uint64_t a1, unsigned int a2, void *outputStruct, unsigned int a4)
{
  size_t v5;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a4;
  v5 = 272;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, input, 2u, 0, 0, 0, 0, outputStruct, &v5);
}

uint64_t IOAVServiceGetFRLLinkData(uint64_t a1, void *outputStruct)
{
  size_t v3;

  v3 = 8;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 7u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetFRLCharacterErrorCounts(uint64_t a1, void *outputStruct)
{
  size_t v3;

  v3 = 16;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 8u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceRetrainFRL(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetFRLMaxRate(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xAu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetFRLMinRate(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xBu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceGetFRLMaxRate(uint64_t a1, void *outputStruct)
{
  size_t v3;

  v3 = 4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xCu, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetFRLMinRate(uint64_t a1, void *outputStruct)
{
  size_t v3;

  v3 = 4;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0xDu, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceSetFRLRecovery(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0xEu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartLink(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0xFu, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0xFu, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopLink(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0x10u, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x10u, input, 1u, inputStruct, 0x110uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartInfoFrame(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0x11u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStartInfoFrameWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x11u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopInfoFrame(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 0x12u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceStopInfoFrameWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0x12u, input, 1u, inputStruct, 0x20uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetHDRStaticMetadata(uint64_t a1, const void *a2)
{
  const void *v2;

  if (a2)
    v2 = a2;
  else
    v2 = (const void *)*MEMORY[0x1E0C9AE40];
  return IOAVConnectCallSetMethod(*(_DWORD *)(a1 + 20), 0x1Eu, v2);
}

uint64_t IOAVServiceGetContentProtectionCapabilities(uint64_t a1, void *outputStruct)
{
  size_t v3;

  v3 = 8;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x13u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetChosenContentProtection(uint64_t a1, void *outputStruct)
{
  size_t v3;

  v3 = 8;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x14u, 0, 0, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVServiceGetProtectionStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x15u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a2 = output[0];
  return result;
}

uint64_t IOAVServiceGetEncryptionStatus(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x20u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a2 = output[0];
  return result;
}

uint64_t IOAVServiceSetContentProtectionCapabilities(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x1Cu, 0, 0, inputStruct, 8uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetContentProtectionPolicyOptions(uint64_t a1, void *inputStruct)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x1Du, 0, 0, inputStruct, 4uLL, 0, 0, 0, 0);
}

uint64_t IOAVServiceSetContentProtectionSupportEnabled(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0x1Bu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVServiceGetHDCPAuthenticatedContentType(uint64_t a1, _DWORD *a2)
{
  uint64_t result;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  result = IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x16u, 0, 0, 0, 0, output, &outputCnt, 0, 0);
  if (!(_DWORD)result)
    *a2 = output[0];
  return result;
}

uint64_t IOAVServiceCopyDiagnosticsString()
{
  return 0;
}

uint64_t IOAVServiceReadI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *outputStruct, unsigned int a5)
{
  size_t v6;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  v6 = a5;
  if (a5 <= 0x1000)
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x18u, input, 2u, 0, 0, 0, 0, outputStruct, &v6);
  else
    return 3758097090;
}

uint64_t IOAVServiceWriteI2C(uint64_t a1, unsigned int a2, unsigned int a3, void *inputStruct, size_t inputStructCnt)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  if (inputStructCnt <= 0x1000)
    return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 0x19u, input, 2u, inputStruct, inputStructCnt, 0, 0, 0, 0);
  else
    return 3758097090;
}

void __IOAVServiceFree(uint64_t a1)
{
  io_connect_t v2;
  io_object_t v3;
  const void *v4;

  v2 = *(_DWORD *)(a1 + 20);
  if (v2)
    IOServiceClose(v2);
  v3 = *(_DWORD *)(a1 + 16);
  if (v3)
    IOObjectRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

uint64_t IOAVVideoInterfaceGetTypeID()
{
  uint64_t result;

  result = __kIOAVVideoInterfaceTypeID;
  if (!__kIOAVVideoInterfaceTypeID)
  {
    pthread_once(&__interfaceTypeInit_1, (void (*)(void))__IOAVVideoInterfaceRegister);
    return __kIOAVVideoInterfaceTypeID;
  }
  return result;
}

uint64_t __IOAVVideoInterfaceRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOAVVideoInterfaceTypeID = result;
  return result;
}

uint64_t IOAVVideoInterfaceCreate(uint64_t a1)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVVideoInterface", (uint64_t (*)(_QWORD, uint64_t))IOAVVideoInterfaceCreateWithService, 0, 0, -1);
  else
    return 0;
}

uint64_t IOAVVideoInterfaceCreateWithLocation(uint64_t a1, unsigned int a2)
{
  if (*MEMORY[0x1E0C9AE00] == a1)
    return __IOAVCopyFirstMatchingIOAVObjectOfType((uint64_t)"IOAVVideoInterface", (uint64_t (*)(_QWORD, uint64_t))IOAVVideoInterfaceCreateWithService, 0, a2, -1);
  else
    return 0;
}

io_connect_t *IOAVVideoInterfaceCreateWithService(uint64_t a1, io_registry_entry_t a2)
{
  io_connect_t *Instance;
  io_connect_t *v4;
  io_service_t *v5;
  io_connect_t *CFProperty;
  io_connect_t *v7;

  if (!a2 || !IOAVObjectConformsTo(a2, (uint64_t)"IOAVVideoInterface"))
    return 0;
  if (!__kIOAVVideoInterfaceTypeID)
    pthread_once(&__interfaceTypeInit_1, (void (*)(void))__IOAVVideoInterfaceRegister);
  Instance = (io_connect_t *)_CFRuntimeCreateInstance();
  v4 = Instance;
  if (Instance)
  {
    *((_QWORD *)Instance + 2) = 0;
    *((_QWORD *)Instance + 3) = 0;
    v5 = Instance + 4;
    *((_QWORD *)Instance + 4) = 0;
    Instance[4] = a2;
    IOObjectRetain(a2);
    if (IOServiceOpen(*v5, *MEMORY[0x1E0C83DA0], 0, v4 + 5))
    {
      v7 = v4;
      v4 = 0;
LABEL_10:
      CFRelease(v7);
      return v4;
    }
    CFProperty = (io_connect_t *)IORegistryEntryCreateCFProperty(*v5, CFSTR("Location"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
    if (CFProperty)
    {
      v7 = CFProperty;
      if (CFEqual(CFProperty, CFSTR("Embedded")))
        v4[6] = 1;
      goto LABEL_10;
    }
  }
  return v4;
}

CFTypeRef IOAVVideoInterfaceCopyProperty(uint64_t a1, const __CFString *a2)
{
  return IORegistryEntryCreateCFProperty(*(_DWORD *)(a1 + 16), a2, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
}

io_connect_t *IOAVVideoInterfaceGetService(uint64_t a1)
{
  io_connect_t *result;
  io_registry_entry_t parent;

  result = *(io_connect_t **)(a1 + 32);
  if (!result)
  {
    parent = 0;
    if (IORegistryEntryGetParentEntry(*(_DWORD *)(a1 + 16), "IOService", &parent))
    {
      result = IOAVServiceCreateWithService(*MEMORY[0x1E0C9AE00], parent);
      *(_QWORD *)(a1 + 32) = result;
    }
    else
    {
      return *(io_connect_t **)(a1 + 32);
    }
  }
  return result;
}

CFTypeRef IOAVVideoInterfaceCopyDisplayAttributes(uint64_t a1)
{
  int v1;
  CFTypeRef result;
  BOOL v3;
  CFTypeID v4;
  CFTypeRef cf;

  cf = 0;
  v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0xDu, &cf);
  result = 0;
  if (v1)
    v3 = 1;
  else
    v3 = cf == 0;
  if (!v3)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFDictionaryGetTypeID())
      return cf;
    else
      return 0;
  }
  return result;
}

CFArrayRef IOAVVideoInterfaceCopyProperties(uint64_t a1)
{
  const __CFAllocator *v1;
  CFArrayRef v2;
  CFMutableDictionaryRef properties;

  properties = 0;
  v1 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  if (IORegistryEntryCreateCFProperties(*(_DWORD *)(a1 + 16), &properties, (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0))
    return 0;
  v2 = IOAVPropertyListCreateWithCFProperties(v1, properties);
  CFRelease(properties);
  return v2;
}

uint64_t IOAVVideoInterfaceSetProperty(uint64_t a1, const __CFString *a2, const void *a3)
{
  return IORegistryEntrySetCFProperty(*(_DWORD *)(a1 + 16), a2, a3);
}

uint64_t IOAVVideoInterfaceGetLocation(uint64_t a1)
{
  return *(unsigned int *)(a1 + 24);
}

CFTypeRef IOAVVideoInterfaceCopyTimingElements(uint64_t a1)
{
  int v1;
  CFTypeRef result;
  BOOL v3;
  CFTypeID v4;
  CFTypeRef cf;

  cf = 0;
  v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0xBu, &cf);
  result = 0;
  if (v1)
    v3 = 1;
  else
    v3 = cf == 0;
  if (!v3)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID())
      return cf;
    else
      return 0;
  }
  return result;
}

CFTypeRef IOAVVideoInterfaceCopyColorElements(uint64_t a1)
{
  int v1;
  CFTypeRef result;
  BOOL v3;
  CFTypeID v4;
  CFTypeRef cf;

  cf = 0;
  v1 = IOAVConnectCallCopyMethod(*(_DWORD *)(a1 + 20), 0xCu, &cf);
  result = 0;
  if (v1)
    v3 = 1;
  else
    v3 = cf == 0;
  if (!v3)
  {
    v4 = CFGetTypeID(cf);
    if (v4 == CFArrayGetTypeID())
      return cf;
    else
      return 0;
  }
  return result;
}

uint64_t IOAVVideoInterfaceSetLogLevel(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 0, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetLogLevelMask(uint64_t a1, unsigned int a2, unsigned int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 1u, input, 2u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceGetLinkData(uint64_t a1, void *outputStruct)
{
  size_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = 0;
  v3 = 256;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v3);
}

uint64_t IOAVVideoInterfaceGetLinkDataWithSource(uint64_t a1, void *outputStruct, unsigned int a3)
{
  size_t v4;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  input[0] = a3;
  v4 = 256;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 2u, input, 1u, 0, 0, 0, 0, outputStruct, &v4);
}

uint64_t IOAVVideoInterfaceStartLink(uint64_t a1, void *inputStruct)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = 0;
  return IOConnectCallMethod(v2, 3u, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStartLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 3u, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStartLinkWithModes(uint64_t a1, unsigned int a2, unsigned int a3, uint64_t a4, uint64_t a5)
{
  uint64_t input[5];

  input[4] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  input[2] = a4;
  input[3] = a5;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 5u, input, 4u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStopLink(uint64_t a1)
{
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 6u, 0, 0, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceStopLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 4u, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceUpdateLinkWithSource(uint64_t a1, void *inputStruct, unsigned int a3)
{
  mach_port_t v3;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_DWORD *)(a1 + 20);
  input[0] = a3;
  return IOConnectCallMethod(v3, 0xEu, input, 1u, inputStruct, 0x100uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetRotation(uint64_t a1, float a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = (int)(float)((float)(a2 * 65536.0) + 0.5);
  return IOConnectCallMethod(v2, 7u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetColorDitherRemoval(uint64_t a1, unsigned int a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = a2;
  return IOConnectCallMethod(v2, 8u, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetBounds(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD inputStruct[2];

  inputStruct[0] = a2;
  inputStruct[1] = a3;
  return IOConnectCallMethod(*(_DWORD *)(a1 + 20), 9u, 0, 0, inputStruct, 0x10uLL, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceSetScreenVirtualTemperature(uint64_t a1, float a2)
{
  mach_port_t v2;
  uint64_t input[2];

  input[1] = *MEMORY[0x1E0C80C00];
  v2 = *(_DWORD *)(a1 + 20);
  input[0] = (int)(float)((float)(a2 * 65536.0) + 0.5);
  return IOConnectCallMethod(v2, 0xAu, input, 1u, 0, 0, 0, 0, 0, 0);
}

uint64_t IOAVVideoInterfaceCopyDiagnosticsString()
{
  return 0;
}

void __IOAVVideoInterfaceFree(uint64_t a1)
{
  io_connect_t v2;
  io_object_t v3;
  const void *v4;

  v2 = *(_DWORD *)(a1 + 20);
  if (v2)
    IOServiceClose(v2);
  v3 = *(_DWORD *)(a1 + 16);
  if (v3)
    IOObjectRelease(v3);
  v4 = *(const void **)(a1 + 32);
  if (v4)
    CFRelease(v4);
}

uint64_t __IOUSBDeviceDescriptionRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOUSBDeviceDescriptionTypeID = result;
  return result;
}

uint64_t IOUSBDevicDeviceDescriptionGetTypeID()
{
  uint64_t result;

  result = __kIOUSBDeviceDescriptionTypeID;
  if (!__kIOUSBDeviceDescriptionTypeID)
  {
    pthread_once(&__deviceDescriptionTypeInit, (void (*)(void))__IOUSBDeviceDescriptionRegister);
    return __kIOUSBDeviceDescriptionTypeID;
  }
  return result;
}

uint64_t IOUSBDeviceDescriptionCreate(const __CFAllocator *a1)
{
  uint64_t Instance;
  uint64_t v3;
  CFMutableArrayRef Mutable;

  if (!__kIOUSBDeviceDescriptionTypeID)
    pthread_once(&__deviceDescriptionTypeInit, (void (*)(void))__IOUSBDeviceDescriptionRegister);
  Instance = _CFRuntimeCreateInstance();
  v3 = Instance;
  if (Instance)
  {
    *(_QWORD *)(Instance + 16) = 0;
    *(_QWORD *)(Instance + 24) = 0;
    *(_QWORD *)(Instance + 16) = CFDictionaryCreateMutable(a1, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    *(_QWORD *)(v3 + 24) = a1;
    Mutable = CFArrayCreateMutable(a1, 0, MEMORY[0x1E0C9B378]);
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(v3 + 16), CFSTR("ConfigurationDescriptors"), Mutable);
    CFRelease(Mutable);
  }
  return v3;
}

CFTypeRef IOUSBDeviceDescriptionCreateFromController(const __CFAllocator *a1, uint64_t a2)
{
  io_registry_entry_t Service;
  CFTypeRef result;
  const void *v5;
  uint64_t v6;

  Service = IOUSBDeviceControllerGetService(a2);
  result = IORegistryEntryCreateCFProperty(Service, CFSTR("DeviceDescription"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  if (result)
  {
    v5 = result;
    v6 = __IOUSBDeviceDescriptionCreateFromDictionary(a1, result);
    CFRelease(v5);
    return (CFTypeRef)v6;
  }
  return result;
}

uint64_t __IOUSBDeviceDescriptionCreateFromDictionary(const __CFAllocator *a1, const void *a2)
{
  uint64_t v3;
  uint64_t v4;
  const void *v5;

  v3 = IOUSBDeviceDescriptionCreate(a1);
  v4 = v3;
  if (v3)
  {
    v5 = *(const void **)(v3 + 16);
    if (v5 != a2)
    {
      CFRelease(v5);
      *(_QWORD *)(v4 + 16) = CFRetain(a2);
    }
  }
  return v4;
}

uint64_t IOUSBDeviceDescriptionCreateFromDefaults(const __CFAllocator *a1)
{
  uint64_t v2;
  BOOL v3;
  io_registry_entry_t Service;
  CFTypeRef cf;

  cf = 0;
  v2 = 0;
  if (IOUSBDeviceControllerCreate(*MEMORY[0x1E0C9AE00], (uint64_t *)&cf))
    v3 = 1;
  else
    v3 = cf == 0;
  if (!v3)
  {
    Service = IOUSBDeviceControllerGetService((uint64_t)cf);
    v2 = __IOUSBDeviceDescriptionCreate(a1, Service, 0);
    CFRelease(cf);
  }
  return v2;
}

uint64_t IOUSBDeviceDescriptionCreateFromDefaultsAndController(const __CFAllocator *a1, uint64_t a2)
{
  io_registry_entry_t Service;

  Service = IOUSBDeviceControllerGetService(a2);
  return __IOUSBDeviceDescriptionCreate(a1, Service, 0);
}

uint64_t __IOUSBDeviceDescriptionCreate(const __CFAllocator *a1, io_registry_entry_t a2, const void *a3)
{
  uint64_t result;

  result = __IOUSBDeviceDescriptionCreateFromFile(a1, CFSTR("/System/Library/AppleUSBDevice/USBDeviceConfigurationOverride.plist"), a2, a3);
  if (!result)
    return __IOUSBDeviceDescriptionCreateFromFile(a1, CFSTR("/System/Library/AppleUSBDevice/USBDeviceConfiguration.plist"), a2, a3);
  return result;
}

uint64_t IOUSBDeviceDescriptionCreateWithType(const __CFAllocator *a1, const void *a2)
{
  uint64_t v4;
  BOOL v5;
  CFTypeRef cf;

  cf = 0;
  v4 = 0;
  if (IOUSBDeviceControllerCreate(*MEMORY[0x1E0C9AE00], (uint64_t *)&cf))
    v5 = 1;
  else
    v5 = cf == 0;
  if (!v5)
  {
    v4 = __IOUSBDeviceDescriptionCreate(a1, (io_registry_entry_t)cf, a2);
    CFRelease(cf);
  }
  return v4;
}

uint64_t _IOUSBDeviceDescriptionGetInfo(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

uint64_t IOUSBDeviceDescriptionGetClass(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, CFSTR("deviceClass"));
}

const __CFNumber *__IOUSBDeviceGetIntProperty(uint64_t a1, const void *a2)
{
  const __CFNumber *result;
  unsigned int valuePtr;

  valuePtr = 0;
  result = (const __CFNumber *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), a2);
  if (result)
  {
    CFNumberGetValue(result, kCFNumberSInt32Type, &valuePtr);
    return (const __CFNumber *)valuePtr;
  }
  return result;
}

void IOUSBDeviceDescriptionSetClass(uint64_t a1, char a2)
{
  CFNumberRef v3;
  char valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("deviceClass"), v3);
  CFRelease(v3);
}

void IOUSBDeviceDescriptionSetSubClass(uint64_t a1, char a2)
{
  CFNumberRef v3;
  char valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("deviceSubClass"), v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetSubClass(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, CFSTR("deviceSubClass"));
}

void IOUSBDeviceDescriptionSetProtocol(uint64_t a1, char a2)
{
  CFNumberRef v3;
  char valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("deviceProtocol"), v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetProtocol(uint64_t a1)
{
  return __IOUSBDeviceGetIntProperty(a1, CFSTR("deviceProtocol"));
}

uint64_t IOUSBDeviceDescriptionGetVendorID(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, CFSTR("vendorID"));
}

void IOUSBDeviceDescriptionSetVendorID(uint64_t a1, __int16 a2)
{
  CFNumberRef v3;
  __int16 valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberShortType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("vendorID"), v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetProductID(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, CFSTR("productID"));
}

void IOUSBDeviceDescriptionSetProductID(uint64_t a1, __int16 a2)
{
  CFNumberRef v3;
  __int16 valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberShortType, &valuePtr);
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("productID"), v3);
  CFRelease(v3);
}

uint64_t IOUSBDeviceDescriptionGetVersion(uint64_t a1)
{
  return (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, CFSTR("deviceID"));
}

const void *IOUSBDeviceDescriptionGetManufacturerString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("manufacturerString"));
}

const void *IOUSBDeviceDescriptionGetProductString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("productString"));
}

const void *IOUSBDeviceDescriptionGetSerialString(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("serialNumber"));
}

void IOUSBDeviceDescriptionSetSerialString(uint64_t a1, void *value)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("serialNumber"), value);
}

void IOUSBDeviceDescriptionRemoveAllConfigurations(uint64_t a1)
{
  __CFArray *Value;

  Value = (__CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("ConfigurationDescriptors"));
  CFArrayRemoveAllValues(Value);
}

uint64_t IOUSBDeviceDescriptionGetMatchingConfiguration(uint64_t a1, const __CFArray *a2)
{
  uint64_t result;
  const __CFArray *v4;
  uint64_t v5;
  uint64_t v6;
  CFIndex v7;
  const void *v8;
  const __CFString *v9;
  const __CFDictionary *ValueAtIndex;
  const __CFDictionary *v11;
  const __CFArray *Value;
  const __CFArray *v13;
  CFIndex Count;
  CFIndex v15;
  CFIndex v16;
  CFIndex v17;
  const __CFString *v18;
  const void *v19;
  CFIndex v20;
  const void *v21;
  const void *v22;
  CFRange v23;
  CFRange v24;

  result = (uint64_t)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("ConfigurationDescriptors"));
  if (!result)
    return result;
  v4 = (const __CFArray *)result;
  result = CFArrayGetCount((CFArrayRef)result);
  if (!result)
    return result;
  v5 = result;
  if (result < 1)
    return 0;
  v6 = 0;
  v7 = 0;
  v8 = (const void *)*MEMORY[0x1E0C9AE50];
  v9 = CFSTR("DefaultConfiguration");
  v22 = (const void *)*MEMORY[0x1E0C9AE50];
  while (1)
  {
    ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v4, v7);
    if (!ValueAtIndex)
      goto LABEL_20;
    v11 = ValueAtIndex;
    v6 = CFDictionaryGetValue(ValueAtIndex, v9) == v8 ? (v7 + 1) : v6;
    Value = (const __CFArray *)CFDictionaryGetValue(v11, CFSTR("Interfaces"));
    if (!Value)
      goto LABEL_20;
    v13 = Value;
    Count = CFArrayGetCount(Value);
    if (!a2)
      goto LABEL_20;
    v15 = Count;
    if (!Count)
      goto LABEL_20;
    v16 = CFArrayGetCount(a2);
    if (!v16)
      goto LABEL_20;
    v17 = v16;
    if (v16 < 1)
      goto LABEL_23;
    v18 = v9;
    v19 = CFArrayGetValueAtIndex(a2, 0);
    v23.location = 0;
    v23.length = v15;
    if (CFArrayGetFirstIndexOfValue(v13, v23, v19) != -1)
      break;
LABEL_19:
    v9 = v18;
    v8 = v22;
LABEL_20:
    if (++v7 == v5)
      return v6;
  }
  v20 = 1;
  while (v17 != v20)
  {
    v21 = CFArrayGetValueAtIndex(a2, v20);
    v24.location = 0;
    v24.length = v15;
    ++v20;
    if (CFArrayGetFirstIndexOfValue(v13, v24, v21) == -1)
    {
      if (v20 - 1 >= v17)
        break;
      goto LABEL_19;
    }
  }
LABEL_23:
  result = (v7 + 1);
  if ((_DWORD)v7 == -1)
    return v6;
  return result;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(uint64_t a1, const void *a2)
{
  __CFArray *Value;
  __CFDictionary *Mutable;
  CFMutableArrayRef v6;

  Value = (__CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("ConfigurationDescriptors"));
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("AllowMultipleCreates"), (const void *)*MEMORY[0x1E0C9AE50]);
  Mutable = CFDictionaryCreateMutable(*(CFAllocatorRef *)(a1 + 24), 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v6 = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 24), 0, MEMORY[0x1E0C9B378]);
  CFDictionaryAddValue(Mutable, CFSTR("Interfaces"), v6);
  CFRelease(v6);
  if (a2)
    CFDictionaryAddValue(Mutable, CFSTR("Description"), a2);
  CFArrayAppendValue(Value, Mutable);
  CFRelease(Mutable);
  return CFArrayGetCount(Value) - 1;
}

void IOUSBDeviceDescriptionSetAllowOverride(uint64_t a1, int a2)
{
  __CFDictionary *v2;
  const void **v3;

  v2 = *(__CFDictionary **)(a1 + 16);
  v3 = (const void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v3 = (const void **)MEMORY[0x1E0C9AE40];
  CFDictionarySetValue(v2, CFSTR("AllowMultipleCreates"), *v3);
}

uint64_t IOUSBDeviceDescriptionAppendConfiguration(uint64_t a1, const void *a2, char a3, char a4)
{
  const __CFArray *Value;
  uint64_t appended;
  __CFDictionary *ValueAtIndex;
  CFNumberRef v9;
  CFNumberRef v10;
  char v12;
  char valuePtr;

  valuePtr = a3;
  v12 = a4;
  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("ConfigurationDescriptors"));
  appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, a2);
  ValueAtIndex = (__CFDictionary *)CFArrayGetValueAtIndex(Value, (int)appended);
  v9 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &valuePtr);
  CFDictionaryAddValue(ValueAtIndex, CFSTR("Attributes"), v9);
  CFRelease(v9);
  v10 = CFNumberCreate(*(CFAllocatorRef *)(a1 + 24), kCFNumberCharType, &v12);
  CFDictionaryAddValue(ValueAtIndex, CFSTR("MaxPower"), v10);
  CFRelease(v10);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithInterface(uint64_t a1, const void *a2)
{
  uint64_t appended;

  appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, a2);
  IOUSBDeviceDescriptionAppendInterfaceToConfiguration(a1, appended, a2);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendInterfaceToConfiguration(uint64_t a1, int a2, const void *a3)
{
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  __CFArray *v7;

  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("ConfigurationDescriptors"));
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, a2);
  if (!ValueAtIndex)
    return 0xFFFFFFFFLL;
  v7 = (__CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Interfaces"));
  CFArrayAppendValue(v7, a3);
  return CFArrayGetCount(v7) - 1;
}

uint64_t IOUSBDeviceDescriptionAppendConfigurationWithInterfaces(uint64_t a1, const __CFArray *a2)
{
  CFStringRef v4;
  CFStringRef v5;
  uint64_t appended;

  v4 = CFStringCreateByCombiningStrings((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, CFSTR("+"));
  if (!v4)
    return 0xFFFFFFFFLL;
  v5 = v4;
  appended = IOUSBDeviceDescriptionAppendConfigurationWithoutAttributes(a1, v4);
  IOUSBDeviceDescriptionAppendInterfacesToConfiguration(a1, appended, a2);
  CFRelease(v5);
  return appended;
}

uint64_t IOUSBDeviceDescriptionAppendInterfacesToConfiguration(uint64_t a1, int a2, const __CFArray *a3)
{
  const __CFArray *Value;
  const __CFDictionary *ValueAtIndex;
  __CFArray *v7;
  CFRange v9;

  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("ConfigurationDescriptors"));
  ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, a2);
  if (!ValueAtIndex)
    return 0xFFFFFFFFLL;
  v7 = (__CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Interfaces"));
  v9.length = CFArrayGetCount(a3);
  v9.location = 0;
  CFArrayAppendArray(v7, a3, v9);
  return CFArrayGetCount(v7) - 1;
}

uint64_t IOUSBDeviceDescriptionCreateWithConfigurationInterfaces(const __CFAllocator *a1, const __CFArray *a2)
{
  uint64_t v3;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFArray *ValueAtIndex;

  v3 = IOUSBDeviceDescriptionCreate(a1);
  Count = CFArrayGetCount(a2);
  if (v3)
  {
    v5 = Count;
    if (Count >= 1)
    {
      v6 = 0;
      do
      {
        ValueAtIndex = (const __CFArray *)CFArrayGetValueAtIndex(a2, v6);
        IOUSBDeviceDescriptionAppendConfigurationWithInterfaces(v3, ValueAtIndex);
        ++v6;
      }
      while (v5 != v6);
    }
  }
  return v3;
}

__CFArray *IOUSBDeviceDescriptionCopyInterfaces(uint64_t a1)
{
  const __CFArray *Value;
  uint64_t Count;
  __CFArray *Mutable;
  CFIndex v5;
  const __CFDictionary *ValueAtIndex;
  const __CFArray *v7;
  CFArrayRef Copy;
  CFArrayRef v9;

  Value = (const __CFArray *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("ConfigurationDescriptors"));
  Count = CFArrayGetCount(Value);
  Mutable = CFArrayCreateMutable(*(CFAllocatorRef *)(a1 + 24), Count, MEMORY[0x1E0C9B378]);
  if (Mutable && Count >= 1)
  {
    v5 = 0;
    while (1)
    {
      ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(Value, v5);
      v7 = (const __CFArray *)CFDictionaryGetValue(ValueAtIndex, CFSTR("Interfaces"));
      Copy = CFArrayCreateCopy(*(CFAllocatorRef *)(a1 + 24), v7);
      if (!Copy)
        break;
      v9 = Copy;
      CFArrayAppendValue(Mutable, Copy);
      CFRelease(v9);
      if (Count == ++v5)
        return Mutable;
    }
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

BOOL IOUSBDeviceDescriptionGetAllowOverride(uint64_t a1)
{
  return CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("AllowMultipleCreates")) == (const void *)*MEMORY[0x1E0C9AE50];
}

void IOUSBDeviceDescriptionSetUDIDString(uint64_t a1, void *value)
{
  CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 16), CFSTR("uniqueDeviceID"), value);
}

void __IOUSBDeviceDescriptionRelease(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 16);
  if (v1)
    CFRelease(v1);
}

CFStringRef __IOUSBDeviceDescriptionSerializeDebug(uint64_t a1)
{
  uint64_t IntProperty;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const void *Value;
  const void *v9;
  const void *v10;

  IntProperty = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, CFSTR("productID"));
  v3 = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, CFSTR("vendorID"));
  v4 = (unsigned __int16)__IOUSBDeviceGetIntProperty(a1, CFSTR("deviceID"));
  v5 = __IOUSBDeviceGetIntProperty(a1, CFSTR("deviceClass"));
  v6 = __IOUSBDeviceGetIntProperty(a1, CFSTR("deviceSubClass"));
  v7 = __IOUSBDeviceGetIntProperty(a1, CFSTR("deviceProtocol"));
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("manufacturerString"));
  v9 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("productString"));
  v10 = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 16), CFSTR("serialNumber"));
  return CFStringCreateWithFormat(0, 0, CFSTR("IOUSBDeviceDescription: pid/vid/ver=%04x/%04x/%d class/sub/prot=%d/%d/%d Mfg:%@ Prod:%@ Ser:%@\n%@"), IntProperty, v3, v4, v5, v6, v7, Value, v9, v10, *(_QWORD *)(a1 + 16));
}

uint64_t __IOUSBDeviceDescriptionCreateFromFile(const __CFAllocator *a1, const __CFString *a2, io_registry_entry_t a3, const void *a4)
{
  const __CFURL *v7;
  const __CFURL *v8;
  CFPropertyListRef v9;
  const void *v10;
  const __CFAllocator *v11;
  __CFDictionary *v12;
  CFMutableDictionaryRef v13;
  uint64_t v14;
  CFMutableDictionaryRef Mutable;
  CFTypeRef CFProperty;
  const __CFDictionary *Value;
  const void *v18;
  SInt32 errorCode;
  CFDataRef resourceData;

  v7 = CFURLCreateWithFileSystemPath(a1, a2, kCFURLPOSIXPathStyle, 0);
  if (v7)
  {
    v8 = v7;
    resourceData = 0;
    errorCode = 0;
    CFURLCreateDataAndPropertiesFromResource(a1, v7, &resourceData, 0, 0, &errorCode);
    if (!resourceData)
    {
      v14 = 0;
LABEL_25:
      CFRelease(v8);
      return v14;
    }
    v9 = CFPropertyListCreateFromXMLData(a1, resourceData, 2uLL, 0);
    if (!v9)
    {
      v14 = 0;
LABEL_24:
      CFRelease(resourceData);
      goto LABEL_25;
    }
    v10 = v9;
    v11 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    if (a3
      && (v12 = (__CFDictionary *)IORegistryEntryCreateCFProperty(a3, CFSTR("DefaultDeviceDescription"), (CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0)) != 0)
    {
      v13 = v12;
      if (!a4)
      {
LABEL_16:
        CFProperty = IORegistryEntryCreateCFProperty(a3, CFSTR("ConfigurationType"), v11, 0);
        if (CFProperty)
        {
          a4 = CFProperty;
          goto LABEL_18;
        }
LABEL_27:
        v14 = 0;
LABEL_22:
        CFRelease(v13);
        goto LABEL_23;
      }
    }
    else
    {
      Mutable = CFDictionaryCreateMutable(v11, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      if (!Mutable)
      {
        v14 = 0;
LABEL_23:
        CFRelease(v10);
        goto LABEL_24;
      }
      v13 = Mutable;
      if (!a4)
      {
        if (!a3)
          goto LABEL_27;
        goto LABEL_16;
      }
    }
    CFRetain(a4);
LABEL_18:
    Value = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)v10, CFSTR("configurations"));
    v18 = CFDictionaryGetValue(Value, a4);
    if (v18)
    {
      CFDictionarySetValue(v13, CFSTR("ConfigurationDescriptors"), v18);
      v14 = __IOUSBDeviceDescriptionCreateFromDictionary(0, v13);
    }
    else
    {
      v14 = 0;
    }
    CFRelease(a4);
    goto LABEL_22;
  }
  return 0;
}

uint64_t IOUSBDeviceControllerGetTypeID()
{
  uint64_t result;

  result = __kIOUSBDeviceControllerTypeID;
  if (!__kIOUSBDeviceControllerTypeID)
  {
    pthread_once(&__controllerTypeInit_2, (void (*)(void))__IOUSBDeviceControllerRegister);
    return __kIOUSBDeviceControllerTypeID;
  }
  return result;
}

uint64_t __IOUSBDeviceControllerRegister()
{
  uint64_t result;

  result = _CFRuntimeRegisterClass();
  __kIOUSBDeviceControllerTypeID = result;
  return result;
}

uint64_t IOUSBDeviceControllerCreate(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  int v5;
  const __CFDictionary *v6;
  io_service_t MatchingService;
  io_object_t v9;

  v4 = 3758097085;
  v5 = -60;
  while (1)
  {
    v6 = IOServiceMatching("IOUSBDeviceController");
    if (!v6)
      break;
    MatchingService = IOServiceGetMatchingService(0, v6);
    if (MatchingService)
    {
      v9 = MatchingService;
      v4 = IOUSBDeviceControllerCreateWithService(a1, MatchingService, a2);
      IOObjectRelease(v9);
      return v4;
    }
    usleep(0x7A120u);
    if (__CFADD__(v5++, 1))
      return 3758097136;
  }
  return v4;
}

uint64_t IOUSBDeviceControllerCreateWithService(uint64_t a1, io_object_t a2, uint64_t *a3)
{
  uint64_t Instance;
  uint64_t v6;
  uint64_t result;

  if (!__kIOUSBDeviceControllerTypeID)
    pthread_once(&__controllerTypeInit_2, (void (*)(void))__IOUSBDeviceControllerRegister);
  Instance = _CFRuntimeCreateInstance();
  if (!Instance)
    return 3758097085;
  v6 = Instance;
  *(_QWORD *)(Instance + 16) = 0;
  *(_DWORD *)(Instance + 16) = a2;
  IOObjectRetain(a2);
  result = 0;
  *a3 = v6;
  return result;
}

uint64_t IOUSBDeviceControllerGoOffAndOnBus(uint64_t a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t v5;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
  if (!v3)
    return 3758097085;
  v4 = v3;
  v5 = IOUSBDeviceControllerSendCommand(a1, CFSTR("GoOffAndOnBus"), v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOUSBDeviceControllerSendCommand(uint64_t a1, const void *a2, const void *a3)
{
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  uint64_t v8;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 3758097085;
  v7 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("USBDeviceCommand"), a2);
  if (a3)
    CFDictionarySetValue(v7, CFSTR("USBDeviceCommandParameter"), a3);
  v8 = IORegistryEntrySetCFProperties(*(_DWORD *)(a1 + 16), v7);
  CFRelease(v7);
  return v8;
}

uint64_t IOUSBDeviceControllerForceOffBus(uint64_t a1, int a2)
{
  const __CFString *v2;

  if (a2)
    v2 = CFSTR("ForceOffBusEnable");
  else
    v2 = CFSTR("ForceOffBusDisable");
  return IOUSBDeviceControllerSendCommand(a1, v2, 0);
}

uint64_t IOUSBDeviceControllerSetPreferredConfiguration(uint64_t a1, int a2)
{
  CFNumberRef v3;
  CFNumberRef v4;
  uint64_t v5;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  if (!v3)
    return 3758097090;
  v4 = v3;
  v5 = IOUSBDeviceControllerSendCommand(a1, CFSTR("SetDevicePreferredConfiguration"), v3);
  CFRelease(v4);
  return v5;
}

uint64_t IOUSBDeviceControllerCreateDefaultDescription(uint64_t a1, const __CFAllocator *a2)
{
  return IOUSBDeviceDescriptionCreateFromDefaultsAndController(a2, a1);
}

uint64_t IOUSBDeviceControllerGetService(uint64_t a1)
{
  return *(unsigned int *)(a1 + 16);
}

uint64_t IOUSBDeviceControllerSetDescription(uint64_t a1, uint64_t a2)
{
  const void *Info;

  Info = (const void *)_IOUSBDeviceDescriptionGetInfo(a2);
  return IOUSBDeviceControllerSendCommand(a1, CFSTR("SetDeviceDescription"), Info);
}

uint64_t __IOUSBDeviceControllerRelease(uint64_t a1)
{
  uint64_t result;

  result = *(unsigned int *)(a1 + 16);
  if ((_DWORD)result)
    result = IOObjectRelease(result);
  *(_DWORD *)(a1 + 16) = 0;
  return result;
}

uint64_t IOHIDAnalyticsEventSetStringValueForField()
{
  uint64_t result;

  if (setStringValueForFieldFuncPtr)
    return setStringValueForFieldFuncPtr();
  return result;
}

uint64_t IOHIDAnalyticsEventAddField()
{
  uint64_t result;

  if (addFieldFuncPtr)
    return addFieldFuncPtr();
  return result;
}

void *____loadFramework_block_invoke_0()
{
  void *result;
  uint64_t (*v1)(void);
  void *v2;

  result = dlopen("/System/Library/PrivateFrameworks/HIDAnalytics.framework/HIDAnalytics", 1);
  __loadFramework_haHandle_0 = (uint64_t)result;
  if (result)
  {
    createEventFuncPtr = (uint64_t (*)(_QWORD, _QWORD))dlsym(result, "HIDAnalyticsEventCreate");
    if (__loadFramework_haHandle_0)
    {
      addHistogramFieldFuncPtr = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventAddHistogramField");
      if (__loadFramework_haHandle_0)
      {
        addFieldFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventAddField");
        if (__loadFramework_haHandle_0)
        {
          setIntegerValueForFieldFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventSetIntegerValueForField");
          if (__loadFramework_haHandle_0)
          {
            setStringValueForFieldFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventSetStringValueForField");
            if (__loadFramework_haHandle_0)
            {
              activateEventFuncPtr = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventActivate");
              if (__loadFramework_haHandle_0)
              {
                v1 = (uint64_t (*)(void))dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsEventCancel");
                result = (void *)__loadFramework_haHandle_0;
                cancelEventFuncPtr = v1;
                if (__loadFramework_haHandle_0)
                {
                  v2 = dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsHistogramEventCreate");
                  result = (void *)__loadFramework_haHandle_0;
                  createHistogramEventFuncPtr = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))v2;
                  if (__loadFramework_haHandle_0)
                    result = dlsym((void *)__loadFramework_haHandle_0, "HIDAnalyticsHistogramEventSetIntegerValue");
                  goto LABEL_18;
                }
LABEL_17:
                createHistogramEventFuncPtr = 0;
LABEL_18:
                setHistogramIntegerValueFuncPtr = (uint64_t (*)(void))result;
                return result;
              }
LABEL_16:
              result = 0;
              cancelEventFuncPtr = 0;
              goto LABEL_17;
            }
LABEL_15:
            activateEventFuncPtr = 0;
            goto LABEL_16;
          }
LABEL_14:
          setStringValueForFieldFuncPtr = 0;
          goto LABEL_15;
        }
LABEL_13:
        setIntegerValueForFieldFuncPtr = 0;
        goto LABEL_14;
      }
    }
    else
    {
      addHistogramFieldFuncPtr = 0;
    }
    addFieldFuncPtr = 0;
    goto LABEL_13;
  }
  return result;
}

uint64_t io_pm_get_value_int(int a1, int a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x11D2800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73100)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name[28];
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

uint64_t io_pm_set_value_int(int a1, int a2, int a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  *(_DWORD *)&rcv_name[32] = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v11 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x11D2900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v11);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v7 = mach_msg((mach_msg_header_t *)&v11, 3162115, 0x28u, 0x30u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73101)
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
                *a4 = *(_DWORD *)&rcv_name[32];
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

uint64_t io_pm_force_active_settings(mach_port_t a1, uint64_t a2, int a3, int *a4)
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
  v14 = 16777472;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x11D2A00000000;
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
      else if (v11.msgh_id == 73102)
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

uint64_t io_pm_schedule_repeat_event(mach_port_t a1, uint64_t a2, int a3, int a4, int *a5)
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
  v15 = 16777472;
  v16 = a3;
  v17 = *MEMORY[0x1E0C804E8];
  v18 = a3;
  v19 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x11D2C00000000;
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
      else if (msg.msgh_id == 73104)
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

uint64_t io_pm_cancel_repeat_events(int a1, _DWORD *a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;
  int v9;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[32];

  memset(&rcv_name_12[4], 0, 28);
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v9 = 5395;
  *(_QWORD *)rcv_name_12 = 0x11D2D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v9);
    special_reply_port = rcv_name_8;
  }
  v5 = mach_msg((mach_msg_header_t *)&v9, 3162115, 0x18u, 0x30u, special_reply_port, 0, 0);
  v6 = v5;
  if ((v5 - 268435458) > 0xE || ((1 << (v5 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v5)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v6 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 73105)
      {
        if ((v9 & 0x80000000) == 0)
        {
          if (rcv_name == 40)
          {
            if (!rcv_name_4)
            {
              v6 = *(unsigned int *)&rcv_name_12[16];
              if (!*(_DWORD *)&rcv_name_12[16])
              {
                *a2 = *(_DWORD *)&rcv_name_12[20];
                return v6;
              }
              goto LABEL_22;
            }
          }
          else if (rcv_name == 36)
          {
            if (rcv_name_4)
              v7 = 1;
            else
              v7 = *(_DWORD *)&rcv_name_12[16] == 0;
            if (v7)
              v6 = 4294966996;
            else
              v6 = *(unsigned int *)&rcv_name_12[16];
            goto LABEL_22;
          }
        }
        v6 = 4294966996;
      }
      else
      {
        v6 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy((mach_msg_header_t *)&v9);
      return v6;
    }
    mig_dealloc_special_reply_port();
  }
  return v6;
}

uint64_t io_pm_last_wake_time(int a1, _QWORD *a2, _DWORD *a3, _QWORD *a4, _DWORD *a5, _DWORD *a6)
{
  mach_port_name_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  int v18;
  int rcv_name;
  int rcv_name_4;
  mach_port_name_t rcv_name_8;
  _BYTE rcv_name_12[20];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  int v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v26 = 0;
  v25 = 0u;
  v24 = 0u;
  v23 = 0u;
  *(_OWORD *)&rcv_name_12[4] = 0u;
  rcv_name = 0;
  special_reply_port = mig_get_special_reply_port();
  rcv_name_4 = a1;
  rcv_name_8 = special_reply_port;
  v18 = 5395;
  *(_QWORD *)rcv_name_12 = 0x11D2E00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v18);
    special_reply_port = rcv_name_8;
  }
  v13 = mach_msg((mach_msg_header_t *)&v18, 3162115, 0x18u, 0x58u, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (*(_DWORD *)&rcv_name_12[4] == 71)
      {
        v14 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name_12[4] == 73106)
      {
        if ((v18 & 0x80000000) == 0)
        {
          if (rcv_name == 36)
          {
            v14 = 4294966996;
            if (*(_DWORD *)&rcv_name_12[16])
            {
              if (rcv_name_4)
                v14 = 4294966996;
              else
                v14 = *(unsigned int *)&rcv_name_12[16];
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_26;
        }
        v14 = 4294966996;
        if (*(_DWORD *)&rcv_name_12[8] == 2 && rcv_name == 80 && !rcv_name_4 && BYTE3(v23) == 1 && BYTE3(v24) == 1)
        {
          v15 = DWORD1(v23);
          if (DWORD1(v23) == (_DWORD)v25)
          {
            v16 = DWORD1(v24);
            if (DWORD1(v24) == DWORD1(v25))
            {
              v14 = 0;
              *a2 = *(_QWORD *)&rcv_name_12[12];
              *a3 = v15;
              *a4 = *((_QWORD *)&v23 + 1);
              *a5 = v16;
              *a6 = DWORD2(v25);
              return v14;
            }
          }
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v18);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t io_pm_declare_user_active(mach_port_t a1, int a2, uint64_t a3, int a4, int *a5, _DWORD *a6, _DWORD *a7)
{
  mach_port_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v16;
  mach_msg_header_t msg;
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
  v18 = 1;
  v19 = a3;
  v20 = 16777472;
  v21 = a4;
  v22 = *MEMORY[0x1E0C804E8];
  v23 = a2;
  v24 = a4;
  v25 = *a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x11D3400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v12 = mach_msg(&msg, 3162115, 0x40u, 0x38u, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (msg.msgh_id == 71)
      {
        v13 = 4294966988;
      }
      else if (msg.msgh_id == 73112)
      {
        if ((msg.msgh_bits & 0x80000000) == 0)
        {
          if (msg.msgh_size == 48)
          {
            if (!msg.msgh_remote_port)
            {
              v13 = HIDWORD(v19);
              if (!HIDWORD(v19))
              {
                v16 = v21;
                *a5 = v20;
                *a6 = v16;
                *a7 = v22;
                return v13;
              }
              goto LABEL_22;
            }
          }
          else if (msg.msgh_size == 36)
          {
            if (msg.msgh_remote_port)
              v14 = 1;
            else
              v14 = HIDWORD(v19) == 0;
            if (v14)
              v13 = 4294966996;
            else
              v13 = HIDWORD(v19);
            goto LABEL_22;
          }
        }
        v13 = 4294966996;
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&msg);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  return v13;
}

uint64_t io_pm_declare_network_client_active(mach_port_t a1, uint64_t a2, int a3, int *a4, _DWORD *a5, _DWORD *a6)
{
  int v10;
  mach_port_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  BOOL v14;
  int v16;
  mach_msg_header_t v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  uint64_t v22;
  int v23;
  int v24;

  v18 = 1;
  v19 = a2;
  v20 = 16777472;
  v21 = a3;
  v22 = *MEMORY[0x1E0C804E8];
  v10 = *a4;
  v23 = a3;
  v24 = v10;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v17.msgh_bits = 2147489043;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(_QWORD *)&v17.msgh_voucher_port = 0x11D3500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v17);
    special_reply_port = v17.msgh_local_port;
  }
  v12 = mach_msg(&v17, 3162115, 0x3Cu, 0x38u, special_reply_port, 0, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (v17.msgh_id == 71)
      {
        v13 = 4294966988;
      }
      else if (v17.msgh_id == 73113)
      {
        if ((v17.msgh_bits & 0x80000000) == 0)
        {
          if (v17.msgh_size == 48)
          {
            if (!v17.msgh_remote_port)
            {
              v13 = HIDWORD(v19);
              if (!HIDWORD(v19))
              {
                v16 = v21;
                *a4 = v20;
                *a5 = v16;
                *a6 = v22;
                return v13;
              }
              goto LABEL_22;
            }
          }
          else if (v17.msgh_size == 36)
          {
            if (v17.msgh_remote_port)
              v14 = 1;
            else
              v14 = HIDWORD(v19) == 0;
            if (v14)
              v13 = 4294966996;
            else
              v13 = HIDWORD(v19);
            goto LABEL_22;
          }
        }
        v13 = 4294966996;
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_22:
      mach_msg_destroy(&v17);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  return v13;
}

uint64_t io_pm_get_uuid(int a1, int a2, char *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  unsigned int v13;
  _BYTE *v14;
  int v15;
  _BYTE rcv_name[32];
  _OWORD v17[65];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, 476);
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v15 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x11D3600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v15);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v8 = mach_msg((mach_msg_header_t *)&v15, 3162115, 0x24u, 0x438u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73114)
      {
        if ((v15 & 0x80000000) == 0)
        {
          if ((*(_DWORD *)rcv_name - 1073) <= 0xFFFFFBFE)
          {
            if (*(_DWORD *)&rcv_name[4])
              v10 = 1;
            else
              v10 = *(_DWORD *)&rcv_name[28] == 0;
            if (!v10 && *(_DWORD *)rcv_name == 36)
              v9 = *(unsigned int *)&rcv_name[28];
            else
              v9 = 4294966996;
            goto LABEL_24;
          }
          if (!*(_DWORD *)&rcv_name[4])
          {
            v9 = *(unsigned int *)&rcv_name[28];
            if (*(_DWORD *)&rcv_name[28])
              goto LABEL_24;
            if (DWORD1(v17[0]) <= 0x400)
            {
              v9 = 4294966996;
              if ((*(_DWORD *)rcv_name - 48) >= DWORD1(v17[0]))
              {
                v13 = (DWORD1(v17[0]) + 3) & 0xFFFFFFFC;
                if (*(_DWORD *)rcv_name == v13 + 48)
                {
                  v14 = &rcv_name[v13 - 4];
                  mig_strncpy(a3, (const char *)v17 + 8, 1024);
                  v9 = 0;
                  *a4 = *((_DWORD *)v14 + 11);
                  return v9;
                }
              }
              goto LABEL_24;
            }
          }
        }
        v9 = 4294966996;
      }
      else
      {
        v9 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)&v15);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_connection_create(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4, _DWORD *a5)
{
  int v9;
  uint64_t v10;
  mach_msg_size_t v11;
  mach_port_name_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  BOOL v15;
  int v17;
  mach_port_name_t rcv_name[4];
  __int128 v19;
  _OWORD v20[65];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  memset(v20, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v19 = 0u;
  *((_QWORD *)&v19 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v9 = mig_strncpy_zerofill((char *)v20 + 8, a2, 1024);
  else
    v9 = mig_strncpy((char *)v20 + 8, a2, 1024);
  LODWORD(v20[0]) = 0;
  DWORD1(v20[0]) = v9;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v10 + 44;
  *(_DWORD *)((char *)v20 + v10 + 8) = a3;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v19 = 0x11D3700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v13 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v11, 0x34u, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (DWORD1(v19) == 71)
      {
        v14 = 4294966988;
      }
      else if (DWORD1(v19) == 73115)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 44)
          {
            if (!rcv_name[2])
            {
              v14 = LODWORD(v20[0]);
              if (!LODWORD(v20[0]))
              {
                v17 = DWORD2(v20[0]);
                *a4 = DWORD1(v20[0]);
                *a5 = v17;
                return v14;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v15 = 1;
            else
              v15 = LODWORD(v20[0]) == 0;
            if (v15)
              v14 = 4294966996;
            else
              v14 = LODWORD(v20[0]);
            goto LABEL_25;
          }
        }
        v14 = 4294966996;
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t io_pm_connection_schedule_notification(int a1, int a2, int a3, int a4, int *a5)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  _BYTE msg[36];
  int v13;
  uint64_t v14;
  int v15;
  int v16;

  *(_OWORD *)&msg[20] = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_DWORD *)&msg[24] = 1;
  *(_DWORD *)&msg[28] = a3;
  v13 = 1245184;
  v14 = *MEMORY[0x1E0C804E8];
  v15 = a2;
  v16 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = -2147478253;
  *(_QWORD *)&msg[16] = 0x11D3800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x38u, 0x30u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73116)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 40)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v9 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                *a5 = v13;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v10 = 1;
            else
              v10 = *(_DWORD *)&msg[32] == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = *(unsigned int *)&msg[32];
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
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_connection_release(int a1, int a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x11D3900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73117)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name[28];
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

uint64_t io_pm_connection_acknowledge_event(mach_port_t a1, int a2, int a3, uint64_t a4, int a5, int *a6)
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
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 1;
  v15 = a4;
  v16 = 16777472;
  v17 = a5;
  v18 = *MEMORY[0x1E0C804E8];
  v19 = a2;
  v20 = a3;
  v21 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x11D3A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 73118)
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

uint64_t io_ps_new_pspowersource(int a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE msg[36];
  __int128 v13;

  *(_OWORD *)&msg[20] = 0u;
  v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D3B00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73119)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v11 = DWORD1(v13);
                *a2 = v13;
                *a3 = v11;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v9 = 1;
            else
              v9 = *(_DWORD *)&msg[32] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&msg[32];
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
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t io_ps_update_pspowersource(mach_port_t a1, int a2, uint64_t a3, int a4, int *a5)
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
  v14 = a3;
  v15 = 16777472;
  v16 = a4;
  v17 = *MEMORY[0x1E0C804E8];
  v18 = a2;
  v19 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x11D3C00000000;
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
      else if (msg.msgh_id == 73120)
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

uint64_t io_ps_release_pspowersource(int a1, int a2)
{
  mach_port_name_t special_reply_port;
  uint64_t v4;
  uint64_t v5;
  _BYTE msg[36];
  uint64_t v8;

  *(_OWORD *)&msg[20] = 0u;
  v8 = 0;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D3D00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v4 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x2Cu, special_reply_port, 0, 0);
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
    else if (*(_DWORD *)&msg[20] == 73121)
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

uint64_t io_pm_hid_event_report_activity(int a1, int a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x11D3F00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73123)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name[28];
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

uint64_t io_pm_hid_event_copy_history(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D4000000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73124)
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
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
        {
          v11 = DWORD1(v14);
          if (DWORD1(v14) == (_DWORD)v15)
          {
            v10 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v11;
            *a4 = DWORD1(v15);
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

uint64_t io_pm_set_debug_flags(int a1, int a2, int a3, _DWORD *a4, _DWORD *a5)
{
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  int v13;
  _BYTE msg[36];
  __int128 v15;

  *(_OWORD *)&msg[20] = 0u;
  v15 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  LODWORD(v15) = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D4100000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x28u, 0x34u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73125)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v10 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v13 = DWORD1(v15);
                *a4 = v15;
                *a5 = v13;
                return v10;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v11 = 1;
            else
              v11 = *(_DWORD *)&msg[32] == 0;
            if (v11)
              v10 = 4294966996;
            else
              v10 = *(unsigned int *)&msg[32];
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
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  return v10;
}

uint64_t io_pm_set_bt_wake_interval(int a1, int a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int v12;
  _BYTE msg[36];
  __int128 v14;

  *(_OWORD *)&msg[20] = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D4200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73126)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v9 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v12 = DWORD1(v14);
                *a3 = v14;
                *a4 = v12;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v10 = 1;
            else
              v10 = *(_DWORD *)&msg[32] == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = *(unsigned int *)&msg[32];
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
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_set_dw_linger_interval(int a1, int a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x11D4300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73127)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name[28];
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

uint64_t io_pm_change_sa_assertion_behavior(int a1, int a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  int v12;
  _BYTE msg[36];
  __int128 v14;

  *(_OWORD *)&msg[20] = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D4400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v8 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x34u, special_reply_port, 0, 0);
  v9 = v8;
  if ((v8 - 268435458) > 0xE || ((1 << (v8 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v8)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v9 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73128)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v9 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v12 = DWORD1(v14);
                *a3 = v14;
                *a4 = v12;
                return v9;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v10 = 1;
            else
              v10 = *(_DWORD *)&msg[32] == 0;
            if (v10)
              v9 = 4294966996;
            else
              v9 = *(unsigned int *)&msg[32];
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
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v9;
    }
    mig_dealloc_special_reply_port();
  }
  return v9;
}

uint64_t io_pm_set_sleepservice_wake_time_cap(int a1, int a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  int v10;
  _BYTE rcv_name[44];

  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)rcv_name = 0u;
  *(_QWORD *)&rcv_name[20] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&rcv_name[28] = a2;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = special_reply_port;
  v10 = 5395;
  *(_QWORD *)&rcv_name[12] = 0x11D4500000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v10);
    special_reply_port = *(_DWORD *)&rcv_name[8];
  }
  v6 = mach_msg((mach_msg_header_t *)&v10, 3162115, 0x24u, 0x30u, special_reply_port, 0, 0);
  v7 = v6;
  if ((v6 - 268435458) > 0xE || ((1 << (v6 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v6)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        v7 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 73129)
      {
        if ((v10 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              v7 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a3 = *(_DWORD *)&rcv_name[32];
                return v7;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4])
              v8 = 1;
            else
              v8 = *(_DWORD *)&rcv_name[28] == 0;
            if (v8)
              v7 = 4294966996;
            else
              v7 = *(unsigned int *)&rcv_name[28];
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

uint64_t io_pm_get_capability_bits(int a1, _DWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  int v11;
  _BYTE msg[36];
  __int128 v13;

  *(_OWORD *)&msg[20] = 0u;
  v13 = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D4600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v7 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x34u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73130)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 44)
          {
            if (!*(_DWORD *)&msg[8])
            {
              v8 = *(unsigned int *)&msg[32];
              if (!*(_DWORD *)&msg[32])
              {
                v11 = DWORD1(v13);
                *a2 = v13;
                *a3 = v11;
                return v8;
              }
              goto LABEL_22;
            }
          }
          else if (*(_DWORD *)&msg[4] == 36)
          {
            if (*(_DWORD *)&msg[8])
              v9 = 1;
            else
              v9 = *(_DWORD *)&msg[32] == 0;
            if (v9)
              v8 = 4294966996;
            else
              v8 = *(unsigned int *)&msg[32];
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
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  return v8;
}

uint64_t io_pm_ctl_assertion_type(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4)
{
  int v7;
  uint64_t v8;
  mach_msg_size_t v9;
  mach_port_name_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  mach_port_name_t rcv_name[4];
  __int128 v16;
  _OWORD v17[65];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v16 = 0u;
  *((_QWORD *)&v16 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v17 + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)v17 + 8, a2, 1024);
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 44;
  *(_DWORD *)((char *)v17 + v8 + 8) = a3;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v16 = 0x11D4700000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v11 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v9, 0x30u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (DWORD1(v16) == 71)
      {
        v12 = 4294966988;
      }
      else if (DWORD1(v16) == 73131)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v12 = LODWORD(v17[0]);
              if (!LODWORD(v17[0]))
              {
                *a4 = DWORD1(v17[0]);
                return v12;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v13 = 1;
            else
              v13 = LODWORD(v17[0]) == 0;
            if (v13)
              v12 = 4294966996;
            else
              v12 = LODWORD(v17[0]);
            goto LABEL_25;
          }
        }
        v12 = 4294966996;
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t io_pm_assertion_notify(mach_port_name_t a1, const char *a2, int a3, _DWORD *a4)
{
  int v7;
  uint64_t v8;
  mach_msg_size_t v9;
  mach_port_name_t special_reply_port;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  mach_port_name_t rcv_name[4];
  __int128 v16;
  _OWORD v17[65];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  memset(v17, 0, 480);
  *(_OWORD *)rcv_name = 0u;
  v16 = 0u;
  *((_QWORD *)&v16 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v17 + 8, a2, 1024);
  else
    v7 = mig_strncpy((char *)v17 + 8, a2, 1024);
  LODWORD(v17[0]) = 0;
  DWORD1(v17[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 44;
  *(_DWORD *)((char *)v17 + v8 + 8) = a3;
  special_reply_port = mig_get_special_reply_port();
  rcv_name[2] = a1;
  rcv_name[3] = special_reply_port;
  rcv_name[0] = 5395;
  *(_QWORD *)&v16 = 0x11D4800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)rcv_name);
    special_reply_port = rcv_name[3];
  }
  v11 = mach_msg((mach_msg_header_t *)rcv_name, 3162115, v9, 0x30u, special_reply_port, 0, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (DWORD1(v16) == 71)
      {
        v12 = 4294966988;
      }
      else if (DWORD1(v16) == 73132)
      {
        if ((rcv_name[0] & 0x80000000) == 0)
        {
          if (rcv_name[1] == 40)
          {
            if (!rcv_name[2])
            {
              v12 = LODWORD(v17[0]);
              if (!LODWORD(v17[0]))
              {
                *a4 = DWORD1(v17[0]);
                return v12;
              }
              goto LABEL_25;
            }
          }
          else if (rcv_name[1] == 36)
          {
            if (rcv_name[2])
              v13 = 1;
            else
              v13 = LODWORD(v17[0]) == 0;
            if (v13)
              v12 = 4294966996;
            else
              v12 = LODWORD(v17[0]);
            goto LABEL_25;
          }
        }
        v12 = 4294966996;
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy((mach_msg_header_t *)rcv_name);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  return v12;
}

uint64_t io_pm_assertion_activity_log(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _DWORD *a6)
{
  mach_port_name_t special_reply_port;
  uint64_t v13;
  uint64_t v14;
  int v15;
  int v16;
  _BYTE msg[36];
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)&msg[20] = 0u;
  v19 = 0u;
  v21 = 0;
  v20 = 0u;
  *(_OWORD *)&msg[4] = 0u;
  *(_QWORD *)&msg[24] = *MEMORY[0x1E0C804E8];
  *(_DWORD *)&msg[32] = *a4;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D4900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v13 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x24u, 0x4Cu, special_reply_port, 0, 0);
  v14 = v13;
  if ((v13 - 268435458) > 0xE || ((1 << (v13 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v13)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v14 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73133)
      {
        if ((*(_DWORD *)msg & 0x80000000) == 0)
        {
          if (*(_DWORD *)&msg[4] == 36)
          {
            v14 = 4294966996;
            if (*(_DWORD *)&msg[32])
            {
              if (*(_DWORD *)&msg[8])
                v14 = 4294966996;
              else
                v14 = *(unsigned int *)&msg[32];
            }
          }
          else
          {
            v14 = 4294966996;
          }
          goto LABEL_24;
        }
        v14 = 4294966996;
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 68 && !*(_DWORD *)&msg[8] && BYTE3(v19) == 1)
        {
          v15 = DWORD1(v19);
          if (DWORD1(v19) == (_DWORD)v20)
          {
            v14 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v15;
            v16 = DWORD2(v20);
            *a4 = DWORD1(v20);
            *a5 = v16;
            *a6 = HIDWORD(v20);
            return v14;
          }
        }
      }
      else
      {
        v14 = 4294966995;
      }
LABEL_24:
      mach_msg_destroy((mach_msg_header_t *)msg);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  return v14;
}

uint64_t io_pm_assertion_activity_aggregate(int a1, _QWORD *a2, _DWORD *a3, _DWORD *a4)
{
  mach_port_name_t special_reply_port;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BYTE msg[36];
  __int128 v14;
  __int128 v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v14 = 0u;
  *(_OWORD *)&msg[20] = 0u;
  *(_DWORD *)&msg[4] = 0;
  special_reply_port = mig_get_special_reply_port();
  *(_DWORD *)&msg[8] = a1;
  *(_DWORD *)&msg[12] = special_reply_port;
  *(_DWORD *)msg = 5395;
  *(_QWORD *)&msg[16] = 0x11D4A00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)msg);
    special_reply_port = *(_DWORD *)&msg[12];
  }
  v9 = mach_msg((mach_msg_header_t *)msg, 3162115, 0x18u, 0x44u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (*(_DWORD *)&msg[20] == 71)
      {
        v10 = 4294966988;
      }
      else if (*(_DWORD *)&msg[20] == 73134)
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
        if (*(_DWORD *)&msg[24] == 1 && *(_DWORD *)&msg[4] == 60 && !*(_DWORD *)&msg[8] && BYTE3(v14) == 1)
        {
          v11 = DWORD1(v14);
          if (DWORD1(v14) == (_DWORD)v15)
          {
            v10 = 0;
            *a2 = *(_QWORD *)&msg[28];
            *a3 = v11;
            *a4 = DWORD1(v15);
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

uint64_t io_pm_set_exception_limits(mach_port_t a1, uint64_t a2, int a3, int *a4)
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
  v14 = 16777472;
  v15 = a3;
  v16 = *MEMORY[0x1E0C804E8];
  v17 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v11.msgh_bits = 2147489043;
  v11.msgh_remote_port = a1;
  v11.msgh_local_port = special_reply_port;
  *(_QWORD *)&v11.msgh_voucher_port = 0x11D4B00000000;
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
      else if (v11.msgh_id == 73135)
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

uint64_t io_hideventsystem_do_client_refresh(int a1, _QWORD *a2, _DWORD *a3)
{
  mach_port_name_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int msg;
  int msg_4;
  int msg_8;
  mach_port_name_t msg_12;
  _BYTE msg_16[48];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  memset(&msg_16[4], 0, 44);
  msg_4 = 0;
  special_reply_port = mig_get_special_reply_port();
  msg_8 = a1;
  msg_12 = special_reply_port;
  msg = 5395;
  *(_QWORD *)msg_16 = 0x1117400000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&msg);
    special_reply_port = msg_12;
  }
  v7 = mach_msg((mach_msg_header_t *)&msg, 3162115, 0x18u, 0x40u, special_reply_port, 0, 0);
  v8 = v7;
  if ((v7 - 268435458) > 0xE || ((1 << (v7 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v7)
    {
      if (*(_DWORD *)&msg_16[4] == 71)
      {
        v8 = 4294966988;
      }
      else if (*(_DWORD *)&msg_16[4] == 70104)
      {
        if ((msg & 0x80000000) == 0)
        {
          if (msg_4 == 36)
          {
            v8 = 4294966996;
            if (*(_DWORD *)&msg_16[16])
            {
              if (msg_8)
                v8 = 4294966996;
              else
                v8 = *(unsigned int *)&msg_16[16];
            }
          }
          else
          {
            v8 = 4294966996;
          }
          goto LABEL_27;
        }
        v8 = 4294966996;
        if (*(_DWORD *)&msg_16[8] == 1 && msg_4 == 56 && !msg_8 && msg_16[23] == 1)
        {
          v9 = *(_DWORD *)&msg_16[24];
          if (*(_DWORD *)&msg_16[24] == *(_DWORD *)&msg_16[36])
          {
            v8 = 0;
            *a2 = *(_QWORD *)&msg_16[12];
            *a3 = v9;
            return v8;
          }
        }
      }
      else
      {
        v8 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&msg);
      return v8;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v8 - 268435459) <= 1)
  {
    if ((msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg_12);
    goto LABEL_27;
  }
  return v8;
}

uint64_t io_hideventsystem_dispatch_event(int a1, uint64_t a2, int a3, mach_msg_timeout_t timeout)
{
  uint64_t v5;
  _BYTE msg[28];
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v8 = a2;
  v9 = 16777472;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AB47730;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v5 = mach_msg((mach_msg_header_t *)msg, 17, 0x38u, 0, 0, timeout, 0);
  if ((v5 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v5;
}

uint64_t io_hideventsystem_service_conforms_to(mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int *a6)
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
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v14 = 1;
  v15 = a2;
  v16 = 16777472;
  v17 = a3;
  v18 = *MEMORY[0x1E0C804E8];
  v19 = a3;
  v20 = a4;
  v21 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1117600000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v9 = mach_msg(&msg, 3162115, 0x40u, 0x30u, special_reply_port, 0, 0);
  v10 = v9;
  if ((v9 - 268435458) > 0xE || ((1 << (v9 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v9)
    {
      if (msg.msgh_id == 71)
      {
        v10 = 4294966988;
      }
      else if (msg.msgh_id == 70106)
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
              goto LABEL_25;
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
            goto LABEL_25;
          }
        }
        v10 = 4294966996;
      }
      else
      {
        v10 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&msg);
      return v10;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v10 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_25;
  }
  return v10;
}

uint64_t io_hideventsystem_copy_matching_event_for_service(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, _QWORD *a5, _DWORD *a6)
{
  mach_port_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  int v12;
  mach_msg_header_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  int v21;

  v15 = 1;
  v16 = a3;
  v17 = 16777472;
  v18 = a4;
  v19 = *MEMORY[0x1E0C804E8];
  v20 = a2;
  v21 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v14.msgh_bits = 2147489043;
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = special_reply_port;
  *(_QWORD *)&v14.msgh_voucher_port = 0x1117800000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v14);
    special_reply_port = v14.msgh_local_port;
  }
  v10 = mach_msg(&v14, 3162115, 0x40u, 0x40u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (v14.msgh_id == 70108)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 36)
          {
            v11 = 4294966996;
            if (HIDWORD(v16))
            {
              if (v14.msgh_remote_port)
                v11 = 4294966996;
              else
                v11 = HIDWORD(v16);
            }
          }
          else
          {
            v11 = 4294966996;
          }
          goto LABEL_26;
        }
        v11 = 4294966996;
        if (v15 == 1 && *(_QWORD *)&v14.msgh_size == 56 && HIBYTE(v17) == 1)
        {
          v12 = v18;
          if (v18 == (_DWORD)v20)
          {
            v11 = 0;
            *a5 = v16;
            *a6 = v12;
            return v11;
          }
        }
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v14.msgh_local_port);
    goto LABEL_26;
  }
  return v11;
}

uint64_t io_hideventsystem_set_element_value_for_service(mach_port_t a1, uint64_t a2, int a3, int a4, int a5, int a6, int *a7)
{
  mach_port_t special_reply_port;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  mach_msg_header_t v14;
  int v15;
  uint64_t v16;
  int v17;
  int v18;
  uint64_t v19;
  int v20;
  int v21;
  int v22;
  int v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v15 = 1;
  v16 = a2;
  v17 = 16777472;
  v18 = a3;
  v19 = *MEMORY[0x1E0C804E8];
  v20 = a3;
  v21 = a4;
  v22 = a5;
  v23 = a6;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v14.msgh_bits = 2147489043;
  v14.msgh_remote_port = a1;
  v14.msgh_local_port = special_reply_port;
  *(_QWORD *)&v14.msgh_voucher_port = 0x1117900000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v14);
    special_reply_port = v14.msgh_local_port;
  }
  v10 = mach_msg(&v14, 3162115, 0x44u, 0x30u, special_reply_port, 0, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (v14.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (v14.msgh_id == 70109)
      {
        if ((v14.msgh_bits & 0x80000000) == 0)
        {
          if (v14.msgh_size == 40)
          {
            if (!v14.msgh_remote_port)
            {
              v11 = HIDWORD(v16);
              if (!HIDWORD(v16))
              {
                *a7 = v17;
                return v11;
              }
              goto LABEL_25;
            }
          }
          else if (v14.msgh_size == 36)
          {
            if (v14.msgh_remote_port)
              v12 = 1;
            else
              v12 = HIDWORD(v16) == 0;
            if (v12)
              v11 = 4294966996;
            else
              v11 = HIDWORD(v16);
            goto LABEL_25;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&v14);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v14.msgh_local_port);
    goto LABEL_25;
  }
  return v11;
}

uint64_t io_hideventsystem_copy_properties_for_service(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, _QWORD *a6, _DWORD *a7, _DWORD *a8)
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
  v20 = 16777472;
  v21 = a3;
  v22 = a4;
  v23 = 16777472;
  v24 = a5;
  v25 = *MEMORY[0x1E0C804E8];
  v26 = a3;
  v27 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v17.msgh_bits = 2147489043;
  v17.msgh_remote_port = a1;
  v17.msgh_local_port = special_reply_port;
  *(_QWORD *)&v17.msgh_voucher_port = 0x1117C00000000;
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
      else if (v17.msgh_id == 70112)
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
          goto LABEL_26;
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
LABEL_26:
      mach_msg_destroy(&v17);
      return v14;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v14 - 268435459) <= 1)
  {
    if ((v17.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v17.msgh_local_port);
    goto LABEL_26;
  }
  return v14;
}

uint64_t io_hideventsystem_register_property_changed_notification(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AB47740;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t io_hideventsystem_unregister_property_changed_notification(int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  _BYTE msg[28];
  uint64_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v6 = a2;
  v7 = 16777472;
  v8 = a3;
  v9 = *MEMORY[0x1E0C804E8];
  v10 = a3;
  *(_QWORD *)msg = 2147483667;
  *(_DWORD *)&msg[8] = a1;
  *(_OWORD *)&msg[12] = xmmword_18AB47750;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set((mach_msg_header_t *)msg);
  v3 = mach_msg((mach_msg_header_t *)msg, 1, 0x38u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((*(_WORD *)msg & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], *(mach_port_name_t *)&msg[12]);
    mach_msg_destroy((mach_msg_header_t *)msg);
  }
  return v3;
}

uint64_t io_hideventsystem_register_event_filter(mach_port_t a1, int a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  int v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70020;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x24u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t io_hideventsystem_unregister_event_filter(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1118500000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_register_record_client_changed_notification(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1118600000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_unregister_record_client_changed_notification(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1118700000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_register_record_service_changed_notification(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1118800000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_unregister_record_service_changed_notification(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1118900000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 1, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t io_hideventsystem_remove_virtual_service(mach_port_t a1, uint64_t a2)
{
  uint64_t v2;
  mach_msg_header_t msg;
  uint64_t v5;
  uint64_t v6;

  v5 = *MEMORY[0x1E0C804E8];
  v6 = a2;
  *(_QWORD *)&msg.msgh_bits = 19;
  msg.msgh_voucher_port = 0;
  msg.msgh_id = 70027;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v2 = mach_msg(&msg, 1, 0x28u, 0, 0, 0, 0);
  if ((v2 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v2;
}

uint64_t iohideventsystem_server_routine(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 70029) >= 0xFFFFFFE3)
    return (uint64_t)*(&_iohideventsystem_subsystem + 5 * (v1 - 70000) + 5);
  else
    return 0;
}

_DWORD *_Xio_hideventsystem_do_client_refresh(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    goto LABEL_6;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = (_DWORD *)_io_hideventsystem_do_client_refresh(result[3], (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
LABEL_6:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_dispatch_event(uint64_t result, uint64_t a2)
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
        result = _io_hideventsystem_dispatch_event(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
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

uint64_t _Xio_hideventsystem_service_conforms_to(uint64_t result, uint64_t a2)
{
  CFIndex v3;
  uint64_t v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    v5 = -300;
    goto LABEL_9;
  }
  result = _io_hideventsystem_service_conforms_to(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 56), *(_DWORD *)(result + 60), (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _Xio_hideventsystem_copy_matching_event_for_service(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    v3 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = _io_hideventsystem_copy_matching_event_for_service(*(_DWORD *)(result + 12), *(_QWORD *)(result + 52), *(UInt8 **)(result + 28), *(_DWORD *)(result + 40), (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_set_element_value_for_service(uint64_t result, uint64_t a2)
{
  CFIndex v3;
  uint64_t v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 68)
  {
    v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    v5 = -300;
    goto LABEL_9;
  }
  result = _io_hideventsystem_set_element_value_for_service(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(_DWORD *)(result + 56), *(_DWORD *)(result + 60), *(_DWORD *)(result + 64), (int *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

uint64_t _Xio_hideventsystem_copy_properties_for_service(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    v3 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_12;
  }
  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 68)
    || *(_DWORD *)(result + 56) != *(_DWORD *)(result + 72))
  {
    v3 = -300;
    goto LABEL_11;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = _io_hideventsystem_copy_properties_for_service(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), *(unsigned int *)(result + 40), *(UInt8 **)(result + 44), *(_DWORD *)(result + 56), (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52), (int *)(a2 + 56));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_12:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 60;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xio_hideventsystem_register_property_changed_notification(uint64_t result, uint64_t a2)
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
        result = _io_hideventsystem_register_property_changed_notification(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
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

uint64_t _Xio_hideventsystem_unregister_property_changed_notification(uint64_t result, uint64_t a2)
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
        result = _io_hideventsystem_unregister_property_changed_notification(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
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

_DWORD *_Xio_hideventsystem_register_event_filter(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_io_hideventsystem_register_event_filter(result[3], result[8]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_unregister_event_filter(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_io_hideventsystem_unregister_event_filter(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_register_record_client_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_io_hideventsystem_register_record_client_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_unregister_record_client_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_io_hideventsystem_unregister_record_client_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_register_record_service_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_io_hideventsystem_register_record_service_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xio_hideventsystem_unregister_record_service_changed_notification(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_io_hideventsystem_unregister_record_service_changed_notification(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t _Xio_hideventsystem_remove_virtual_service(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = _io_hideventsystem_remove_virtual_service(*(_DWORD *)(result + 12), *(const void **)(result + 32));
    *(_DWORD *)(a2 + 32) = result;
  }
  return result;
}

uint64_t iohideventsystem_client_dispatch_properties_changed(mach_port_t a1, uint64_t a2, int a3, mach_msg_timeout_t a4)
{
  mach_port_t special_reply_port;
  uint64_t v7;
  uint64_t v8;
  mach_msg_header_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v11 = 1;
  v12 = a2;
  v13 = 16777472;
  v14 = a3;
  v15 = *MEMORY[0x1E0C804E8];
  v16 = a3;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v10.msgh_bits = 2147489043;
  v10.msgh_remote_port = a1;
  v10.msgh_local_port = special_reply_port;
  *(_QWORD *)&v10.msgh_voucher_port = 0x124FA00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v10);
    special_reply_port = v10.msgh_local_port;
  }
  v7 = mach_msg(&v10, 3162515, 0x38u, 0x2Cu, special_reply_port, a4, 0);
  v8 = v7;
  if ((v7 - 268435458) <= 0xE && ((1 << (v7 - 2)) & 0x4003) != 0)
    goto LABEL_13;
  if ((_DWORD)v7)
  {
    mig_dealloc_special_reply_port();
LABEL_13:
    if ((v8 - 268435459) > 1)
      return v8;
    if ((v10.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v10.msgh_local_port);
LABEL_18:
    mach_msg_destroy(&v10);
    return v8;
  }
  if (v10.msgh_id == 71)
  {
    v8 = 4294966988;
    goto LABEL_18;
  }
  if (v10.msgh_id != 75102)
  {
    v8 = 4294966995;
    goto LABEL_18;
  }
  v8 = 4294966996;
  if ((v10.msgh_bits & 0x80000000) != 0)
    goto LABEL_18;
  if (*(_QWORD *)&v10.msgh_size != 36)
    goto LABEL_18;
  v8 = HIDWORD(v12);
  if (HIDWORD(v12))
    goto LABEL_18;
  return v8;
}

uint64_t iohideventsystem_client_dispatch_event_filter(mach_port_t a1, uint64_t a2, int a3, uint64_t a4, int a5, int *a6, mach_msg_timeout_t a7)
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

  v26 = *MEMORY[0x1E0C80C00];
  v16 = 2;
  v17 = a2;
  v18 = 16777472;
  v19 = a3;
  v20 = a4;
  v21 = 16777472;
  v22 = a5;
  v23 = *MEMORY[0x1E0C804E8];
  v24 = a3;
  v25 = a5;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x124FB00000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v11 = mach_msg(&msg, 3162515, 0x4Cu, 0x30u, special_reply_port, a7, 0);
  v12 = v11;
  if ((v11 - 268435458) > 0xE || ((1 << (v11 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v11)
    {
      if (msg.msgh_id == 71)
      {
        v12 = 4294966988;
      }
      else if (msg.msgh_id == 75103)
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
                *a6 = v18;
                return v12;
              }
              goto LABEL_25;
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
            goto LABEL_25;
          }
        }
        v12 = 4294966996;
      }
      else
      {
        v12 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&msg);
      return v12;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v12 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_25;
  }
  return v12;
}

uint64_t iohideventsystem_client_dispatch_client_records_changed(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x124FC00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 129, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t iohideventsystem_client_dispatch_service_records_changed(mach_port_t a1)
{
  uint64_t v1;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x124FD00000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v1 = mach_msg(&msg, 129, 0x18u, 0, 0, 0, 0);
  if ((v1 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v1;
}

uint64_t iohideventsystem_copy_matching_event_from_virtual_service(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, _QWORD *a5, _DWORD *a6, mach_msg_timeout_t a7)
{
  mach_port_t special_reply_port;
  uint64_t v12;
  uint64_t v13;
  int v14;
  mach_msg_header_t v16;
  int v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  int v23;

  v17 = 1;
  v18 = a3;
  v19 = 16777472;
  v20 = a4;
  v21 = *MEMORY[0x1E0C804E8];
  v22 = a2;
  v23 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&v16.msgh_bits = 2147489043;
  v16.msgh_remote_port = a1;
  v16.msgh_local_port = special_reply_port;
  *(_QWORD *)&v16.msgh_voucher_port = 0x1250200000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&v16);
    special_reply_port = v16.msgh_local_port;
  }
  v12 = mach_msg(&v16, 3162515, 0x40u, 0x40u, special_reply_port, a7, 0);
  v13 = v12;
  if ((v12 - 268435458) > 0xE || ((1 << (v12 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v12)
    {
      if (v16.msgh_id == 71)
      {
        v13 = 4294966988;
      }
      else if (v16.msgh_id == 75110)
      {
        if ((v16.msgh_bits & 0x80000000) == 0)
        {
          if (v16.msgh_size == 36)
          {
            v13 = 4294966996;
            if (HIDWORD(v18))
            {
              if (v16.msgh_remote_port)
                v13 = 4294966996;
              else
                v13 = HIDWORD(v18);
            }
          }
          else
          {
            v13 = 4294966996;
          }
          goto LABEL_26;
        }
        v13 = 4294966996;
        if (v17 == 1 && *(_QWORD *)&v16.msgh_size == 56 && HIBYTE(v19) == 1)
        {
          v14 = v20;
          if (v20 == (_DWORD)v22)
          {
            v13 = 0;
            *a5 = v18;
            *a6 = v14;
            return v13;
          }
        }
      }
      else
      {
        v13 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy(&v16);
      return v13;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v13 - 268435459) <= 1)
  {
    if ((v16.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], v16.msgh_local_port);
    goto LABEL_26;
  }
  return v13;
}

uint64_t iohideventsystem_output_event_to_virtual_service(mach_port_t a1, uint64_t a2, uint64_t a3, int a4, int *a5, mach_msg_timeout_t a6)
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
  uint64_t v20;
  int v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 1;
  v16 = a3;
  v17 = 16777472;
  v18 = a4;
  v19 = *MEMORY[0x1E0C804E8];
  v20 = a2;
  v21 = a4;
  special_reply_port = mig_get_special_reply_port();
  *(_QWORD *)&msg.msgh_bits = 2147489043;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = special_reply_port;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1250300000000;
  if (MEMORY[0x1E0C85B60])
  {
    voucher_mach_msg_set(&msg);
    special_reply_port = msg.msgh_local_port;
  }
  v10 = mach_msg(&msg, 3162515, 0x40u, 0x30u, special_reply_port, a6, 0);
  v11 = v10;
  if ((v10 - 268435458) > 0xE || ((1 << (v10 - 2)) & 0x4003) == 0)
  {
    if (!(_DWORD)v10)
    {
      if (msg.msgh_id == 71)
      {
        v11 = 4294966988;
      }
      else if (msg.msgh_id == 75111)
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
                *a5 = v17;
                return v11;
              }
              goto LABEL_25;
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
            goto LABEL_25;
          }
        }
        v11 = 4294966996;
      }
      else
      {
        v11 = 4294966995;
      }
LABEL_25:
      mach_msg_destroy(&msg);
      return v11;
    }
    mig_dealloc_special_reply_port();
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    goto LABEL_25;
  }
  return v11;
}

uint64_t iohideventsystem_client_refresh(mach_port_t a1, int a2)
{
  uint64_t v3;
  mach_msg_header_t msg;

  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(_QWORD *)&msg.msgh_voucher_port = 0x1250400000000;
  if (MEMORY[0x1E0C85B60])
    voucher_mach_msg_set(&msg);
  v3 = mach_msg(&msg, a2 | 1, 0x18u, 0, 0, 0, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100)
      mach_port_deallocate(*MEMORY[0x1E0C83DA0], msg.msgh_local_port);
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t iohideventsystem_client_server_routine(uint64_t a1)
{
  int v1;

  v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 75013) >= 0xFFFFFFF3)
    return (uint64_t)*(&_iohideventsystem_client_subsystem + 5 * (v1 - 75000) + 5);
  else
    return 0;
}

uint64_t _Xiohideventsystem_client_dispatch_properties_changed(uint64_t result, uint64_t a2)
{
  CFIndex v3;
  int v4;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 56)
  {
    v4 = -304;
LABEL_8:
    *(_DWORD *)(a2 + 32) = v4;
    goto LABEL_9;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(unsigned int *)(result + 40), (_DWORD)v3 != *(_DWORD *)(result + 52)))
  {
    v4 = -300;
    goto LABEL_8;
  }
  result = _iohideventsystem_client_dispatch_properties_changed(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3);
  *(_DWORD *)(a2 + 32) = result;
LABEL_9:
  *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  return result;
}

uint64_t _Xiohideventsystem_client_dispatch_event_filter(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  int v6;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 2 || *(_DWORD *)(result + 4) != 76)
  {
    v6 = -304;
LABEL_11:
    *(_DWORD *)(a2 + 32) = v6;
    v5 = *MEMORY[0x1E0C804E8];
    goto LABEL_12;
  }
  if (*(_BYTE *)(result + 39) != 1
    || *(_BYTE *)(result + 55) != 1
    || (v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 68))
    || (v4 = *(_DWORD *)(result + 56), v4 != *(_DWORD *)(result + 72)))
  {
    v6 = -300;
    goto LABEL_11;
  }
  result = _iohideventsystem_client_dispatch_event_filter(*(_DWORD *)(result + 12), *(UInt8 **)(result + 28), v3, *(UInt8 **)(result + 44), v4, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v5 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v5;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_12:
  *(_QWORD *)(a2 + 24) = v5;
  return result;
}

_DWORD *_Xiohideventsystem_client_dispatch_client_records_changed(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_iohideventsystem_client_dispatch_client_records_changed(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

_DWORD *_Xiohideventsystem_client_dispatch_service_records_changed(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_iohideventsystem_client_dispatch_service_records_changed(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t _Xiohideventsystem_copy_matching_event_from_virtual_service(uint64_t result, uint64_t a2)
{
  int v3;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    v3 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || *(_DWORD *)(result + 40) != *(_DWORD *)(result + 60))
  {
    v3 = -300;
    goto LABEL_9;
  }
  *(_DWORD *)(a2 + 36) = 16777473;
  result = _iohideventsystem_copy_matching_event_from_virtual_service(*(_DWORD *)(result + 12), *(const void **)(result + 52), *(UInt8 **)(result + 28), *(_DWORD *)(result + 40), (vm_offset_t *)(a2 + 28), (_DWORD *)(a2 + 52));
  if ((_DWORD)result)
  {
    *(_DWORD *)(a2 + 32) = result;
LABEL_10:
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
    return result;
  }
  *(_DWORD *)(a2 + 40) = *(_DWORD *)(a2 + 52);
  *(_QWORD *)(a2 + 44) = *MEMORY[0x1E0C804E8];
  *(_DWORD *)a2 |= 0x80000000;
  *(_DWORD *)(a2 + 4) = 56;
  *(_DWORD *)(a2 + 24) = 1;
  return result;
}

uint64_t _Xiohideventsystem_output_event_to_virtual_service(uint64_t result, uint64_t a2)
{
  unsigned int v3;
  uint64_t v4;
  int v5;

  if ((*(_DWORD *)result & 0x80000000) == 0 || *(_DWORD *)(result + 24) != 1 || *(_DWORD *)(result + 4) != 64)
  {
    v5 = -304;
LABEL_9:
    *(_DWORD *)(a2 + 32) = v5;
    v4 = *MEMORY[0x1E0C804E8];
    goto LABEL_10;
  }
  if (*(_BYTE *)(result + 39) != 1 || (v3 = *(_DWORD *)(result + 40), v3 != *(_DWORD *)(result + 60)))
  {
    v5 = -300;
    goto LABEL_9;
  }
  result = _iohideventsystem_output_event_to_virtual_service(*(_DWORD *)(result + 12), *(const void **)(result + 52), *(UInt8 **)(result + 28), v3, (_DWORD *)(a2 + 36));
  *(_DWORD *)(a2 + 32) = result;
  v4 = *MEMORY[0x1E0C804E8];
  if (!(_DWORD)result)
  {
    *(_QWORD *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_10:
  *(_QWORD *)(a2 + 24) = v4;
  return result;
}

_DWORD *_Xiohideventsystem_client_refresh(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 24)
  {
    *(_DWORD *)(a2 + 32) = -304;
    *(_QWORD *)(a2 + 24) = *MEMORY[0x1E0C804E8];
  }
  else
  {
    result = (_DWORD *)_iohideventsystem_client_refresh(result[3]);
    *(_DWORD *)(a2 + 32) = (_DWORD)result;
  }
  return result;
}

uint64_t io_iterator_reset(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xAF300000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_matching_services(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xAF400000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_property(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xAF500000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_iterator_enter_entry(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xAF700000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_iterator_exit_entry(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xAF800000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_properties(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xAFB00000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_property_bytes(uint64_t a1, uint64_t a2)
{
  unsigned int v2;
  const char *v3;
  int *v4;
  int *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  int v9;
  uint64_t v10;
  mach_port_t v11;
  char *v12;
  int v13;
  mach_port_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  int v20;
  size_t v21;
  mach_port_t reply_port[4];
  __int128 v23;
  size_t __n[2];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;

  v2 = MEMORY[0x1E0C80A78](a1, a2);
  v5 = v4;
  v7 = v6;
  v8 = v2;
  v54 = *MEMORY[0x1E0C80C00];
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  *(_OWORD *)__n = 0u;
  v25 = 0u;
  *(_OWORD *)reply_port = 0u;
  v23 = 0u;
  *((_QWORD *)&v23 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v9 = mig_strncpy_zerofill((char *)&__n[1], v3, 128);
  else
    v9 = mig_strncpy((char *)&__n[1], v3, 128);
  LODWORD(__n[0]) = 0;
  HIDWORD(__n[0]) = v9;
  v10 = (v9 + 3) & 0xFFFFFFFC;
  v11 = v10 + 44;
  v12 = (char *)reply_port + v10;
  v13 = *v5;
  if (*v5 >= 0x1000)
    v13 = 4096;
  *((_DWORD *)v12 + 10) = v13;
  v14 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v11;
  *(_QWORD *)&reply_port[2] = __PAIR64__(v14, v8);
  *(_QWORD *)&v23 = 0xAFC00000000;
  v15 = mach_msg2_internal();
  v16 = v15;
  if ((v15 - 268435458) <= 0xE && ((1 << (v15 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
    return v16;
  }
  if ((_DWORD)v15)
  {
    mig_dealloc_reply_port(reply_port[3]);
    return v16;
  }
  if (DWORD1(v23) == 71)
  {
    v16 = 4294966988;
LABEL_28:
    mach_msg_destroy((mach_msg_header_t *)reply_port);
    return v16;
  }
  if (DWORD1(v23) != 2912)
  {
    v16 = 4294966995;
    goto LABEL_28;
  }
  if ((reply_port[0] & 0x80000000) != 0)
    goto LABEL_27;
  if (reply_port[1] - 4137 <= 0xFFFFEFFE)
  {
    if (reply_port[2])
      v17 = 1;
    else
      v17 = LODWORD(__n[0]) == 0;
    if (!v17 && reply_port[1] == 36)
      v16 = LODWORD(__n[0]);
    else
      v16 = 4294966996;
    goto LABEL_28;
  }
  if (reply_port[2])
  {
LABEL_27:
    v16 = 4294966996;
    goto LABEL_28;
  }
  v16 = LODWORD(__n[0]);
  if (LODWORD(__n[0]))
    goto LABEL_28;
  v20 = HIDWORD(__n[0]);
  v16 = 4294966996;
  if (HIDWORD(__n[0]) > 0x1000
    || reply_port[1] - 40 < HIDWORD(__n[0])
    || reply_port[1] != ((HIDWORD(__n[0]) + 3) & 0xFFFFFFFC) + 40)
  {
    goto LABEL_28;
  }
  v21 = *v5;
  if (HIDWORD(__n[0]) <= v21)
  {
    memcpy(v7, &__n[1], HIDWORD(__n[0]));
    v16 = 0;
    *v5 = v20;
  }
  else
  {
    memcpy(v7, &__n[1], v21);
    *v5 = v20;
    return 4294966989;
  }
  return v16;
}

uint64_t io_connect_add_client(unsigned int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t v6;
  int v7;
  int v8;
  uint64_t v9;
  int v10;

  v9 = 0x13000000000000;
  v7 = 1;
  v8 = a2;
  v10 = 0;
  *(_QWORD *)&v6.msgh_bits = 0x2880001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB0400000000;
  v2 = mach_msg2_internal();
  v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_in_plane(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB0D00000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_object_get_retain_count(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB0E00000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_busy_state(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB0F00000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_wait_quiet(unsigned int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v9 = 0;
  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  *(_QWORD *)&v6.msgh_bits = 0x2800001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB1000000000;
  v2 = mach_msg2_internal();
  v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_create_iterator(unsigned int a1, const char *a2, int a3, _DWORD *a4)
{
  int v7;
  uint64_t v8;
  mach_port_t v9;
  mach_port_t v10;
  uint64_t v11;
  uint64_t v12;
  mach_port_t reply_port[4];
  __int128 v15;
  _OWORD v16[9];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  memset(v16, 0, 140);
  *(_OWORD *)reply_port = 0u;
  v15 = 0u;
  *((_QWORD *)&v15 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v7 = mig_strncpy_zerofill((char *)v16 + 8, a2, 128);
  else
    v7 = mig_strncpy((char *)v16 + 8, a2, 128);
  LODWORD(v16[0]) = 0;
  DWORD1(v16[0]) = v7;
  v8 = (v7 + 3) & 0xFFFFFFFC;
  v9 = v8 + 44;
  *(_DWORD *)((char *)v16 + v8 + 8) = a3;
  v10 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v9;
  *(_QWORD *)&reply_port[2] = __PAIR64__(v10, a1);
  *(_QWORD *)&v15 = 0xB1100000000;
  v11 = mach_msg2_internal();
  v12 = v11;
  if ((v11 - 268435458) <= 0xE && ((1 << (v11 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!(_DWORD)v11)
    {
      if (DWORD1(v15) == 71)
      {
        v12 = 4294966988;
      }
      else if (DWORD1(v15) == 2933)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          v12 = 4294966996;
          if (DWORD2(v15) == 1 && reply_port[1] == 40 && !reply_port[2] && WORD3(v16[0]) << 16 == 1114112)
          {
            v12 = 0;
            *a4 = HIDWORD(v15);
            return v12;
          }
        }
        else if (reply_port[1] == 36)
        {
          v12 = 4294966996;
          if (LODWORD(v16[0]))
          {
            if (reply_port[2])
              v12 = 4294966996;
            else
              v12 = LODWORD(v16[0]);
          }
        }
        else
        {
          v12 = 4294966996;
        }
      }
      else
      {
        v12 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v12;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v12;
}

uint64_t io_iterator_is_valid(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB1200000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_catalog_send_data(unsigned int a1, int a2, uint64_t a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  mach_msg_header_t v7;
  int v8;
  uint64_t v9;
  int v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v8 = 1;
  v9 = a3;
  v10 = 16777472;
  v11 = a4;
  v12 = *MEMORY[0x1E0C804E8];
  v13 = a2;
  v14 = a4;
  *(_QWORD *)&v7.msgh_bits = 0x3C80001513;
  *(_QWORD *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v7.msgh_voucher_port = 0xB1400000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(v7.msgh_local_port);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy(&v7);
  }
  return v5;
}

uint64_t io_catalog_terminate(unsigned int a1, int a2, char *src)
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  mach_port_t reply_port[4];
  __int128 v9;
  _OWORD v10[9];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  memset(v10, 0, 140);
  *(_OWORD *)reply_port = 0u;
  v9 = 0u;
  *((_QWORD *)&v9 + 1) = *MEMORY[0x1E0C804E8];
  LODWORD(v10[0]) = a2;
  if (MEMORY[0x1E0C84128])
    v4 = mig_strncpy_zerofill((char *)v10 + 12, src, 128);
  else
    v4 = mig_strncpy((char *)v10 + 12, src, 128);
  DWORD1(v10[0]) = 0;
  DWORD2(v10[0]) = v4;
  reply_port[0] = 5395;
  reply_port[1] = ((v4 + 3) & 0xFFFFFFFC) + 44;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v9 = 0xB1500000000;
  v5 = mach_msg2_internal();
  v6 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v5)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v6 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v6;
}

uint64_t io_catalog_get_data(unsigned int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v9 = 0;
  v8 = 0;
  v11 = 0;
  v10 = 0;
  v6 = *MEMORY[0x1E0C804E8];
  v7 = a2;
  *(_QWORD *)&v5.msgh_bits = 0x2400001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB1600000000;
  v2 = mach_msg2_internal();
  v3 = v2;
  if ((v2 - 268435458) <= 0xE && ((1 << (v2 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  else if ((_DWORD)v2)
  {
    mig_dealloc_reply_port(v5.msgh_local_port);
  }
  else
  {
    v3 = 4294966995;
    mach_msg_destroy(&v5);
  }
  return v3;
}

uint64_t io_catalog_get_gen_count(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = 0;
  v7 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB1700000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_catalog_module_loaded(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB1800000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_catalog_reset(unsigned int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v9 = 0;
  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  *(_QWORD *)&v6.msgh_bits = 0x2400001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB1900000000;
  v2 = mach_msg2_internal();
  v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_service_request_probe(unsigned int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;

  v9 = 0;
  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  *(_QWORD *)&v6.msgh_bits = 0x2400001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB1A00000000;
  v2 = mach_msg2_internal();
  v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_name_in_plane(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[9];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB1B00000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_match_property_table(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB1C00000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_connect_get_notification_semaphore(unsigned int a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  int v10;

  v10 = 0;
  v9 = 0;
  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  *(_QWORD *)&v6.msgh_bits = 0x2400001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB2400000000;
  v2 = mach_msg2_internal();
  v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_location_in_plane(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[9];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB2600000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_registry_entry_get_property_recursively(unsigned int a1, const char *a2, const char *a3, int a4, _QWORD *a5, _DWORD *a6)
{
  uint64_t (*v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  uint64_t v13;
  int v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t v19;
  mach_port_t v20;
  mach_port_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  mach_port_t reply_port[4];
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  memset(v27, 0, sizeof(v27));
  *(_OWORD *)reply_port = 0u;
  *((_QWORD *)&v27[0] + 1) = *MEMORY[0x1E0C804E8];
  v11 = MEMORY[0x1E0C84128];
  if (MEMORY[0x1E0C84128])
    v12 = mig_strncpy_zerofill((char *)&v27[1] + 8, a2, 128);
  else
    v12 = mig_strncpy((char *)&v27[1] + 8, a2, 128);
  LODWORD(v27[1]) = 0;
  DWORD1(v27[1]) = v12;
  v13 = (v12 + 3) & 0xFFFFFFFC;
  v14 = v13 + 52;
  v15 = (char *)reply_port + v13;
  v16 = v15 - 128;
  v17 = v15 + 48;
  if (v11)
    v18 = mig_strncpy_zerofill(v17, a3, 128);
  else
    v18 = mig_strncpy(v17, a3, 128);
  *((_DWORD *)v16 + 42) = 0;
  *((_DWORD *)v16 + 43) = v18;
  v19 = (v18 + 3) & 0xFFFFFFFC;
  v20 = v14 + v19;
  *(_DWORD *)&v16[v19 + 176] = a4;
  v21 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v20;
  *(_QWORD *)&reply_port[2] = __PAIR64__(v21, a1);
  *(_QWORD *)&v27[0] = 0xB2700000000;
  v22 = mach_msg2_internal();
  v23 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!(_DWORD)v22)
    {
      if (DWORD1(v27[0]) == 71)
      {
        v23 = 4294966988;
      }
      else if (DWORD1(v27[0]) == 2955)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          v23 = 4294966996;
          if (DWORD2(v27[0]) == 1 && reply_port[1] == 56 && !reply_port[2] && BYTE7(v27[1]) == 1)
          {
            v24 = DWORD2(v27[1]);
            if (DWORD2(v27[1]) == DWORD1(v28))
            {
              v23 = 0;
              *a5 = *(_QWORD *)((char *)v27 + 12);
              *a6 = v24;
              return v23;
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          v23 = 4294966996;
          if (LODWORD(v27[1]))
          {
            if (reply_port[2])
              v23 = 4294966996;
            else
              v23 = LODWORD(v27[1]);
          }
        }
        else
        {
          v23 = 4294966996;
        }
      }
      else
      {
        v23 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v23;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v23;
}

uint64_t io_service_get_state(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB2800000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_get_matching_services_ool(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  mach_msg_header_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v7 = 1;
  v8 = a2;
  v9 = 0x1000000;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = 0;
  *(_QWORD *)&v6.msgh_bits = 0x3880001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB2900000000;
  v3 = mach_msg2_internal();
  v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_service_match_property_table_ool(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  mach_msg_header_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;

  v7 = 1;
  v8 = a2;
  v9 = 0x1000000;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  *(_QWORD *)&v6.msgh_bits = 0x3880001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB2A00000000;
  v3 = mach_msg2_internal();
  v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_object_get_superclass(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[9];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB2C00000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_object_get_bundle_identifier(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[9];
  int v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v8 = 0u;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB2D00000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_add_notification(unsigned int a1, const char *a2, const char *a3, int a4, const void *a5, unsigned int a6, _DWORD *a7)
{
  uint64_t (*v12)(_QWORD, _QWORD, _QWORD);
  int v13;
  uint64_t v14;
  char *v15;
  char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  mach_port_t v20;
  uint64_t v21;
  mach_msg_header_t reply_port;
  int v24;
  int v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[44];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  memset(v28, 0, 448);
  v26 = 0u;
  v27 = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  v24 = 1;
  v25 = a4;
  DWORD1(v26) = 1310720;
  *((_QWORD *)&v26 + 1) = *MEMORY[0x1E0C804E8];
  v12 = MEMORY[0x1E0C84128];
  if (MEMORY[0x1E0C84128])
    v13 = mig_strncpy_zerofill((char *)&v27 + 8, a2, 128);
  else
    v13 = mig_strncpy((char *)&v27 + 8, a2, 128);
  LODWORD(v27) = 0;
  DWORD1(v27) = v13;
  v14 = (v13 + 3) & 0xFFFFFFFC;
  v15 = (char *)&reply_port + v14 - 128;
  v16 = (char *)v28 + v14;
  if (v12)
    v17 = mig_strncpy_zerofill(v16, a3, 512);
  else
    v17 = mig_strncpy(v16, a3, 512);
  *((_DWORD *)v15 + 46) = 0;
  *((_DWORD *)v15 + 47) = v17;
  if (a6 > 8)
    return 4294966989;
  v19 = (v17 + 3) & 0xFFFFFFFC;
  memcpy(&v15[v19 + 196], a5, 8 * a6);
  *(_DWORD *)&v15[v19 + 192] = a6;
  v20 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.msgh_size = v14 + 8 * a6 + v19 + 68;
  *(_QWORD *)&reply_port.msgh_remote_port = __PAIR64__(v20, a1);
  *(_QWORD *)&reply_port.msgh_voucher_port = 0xB3400000000;
  v21 = mach_msg2_internal();
  v18 = v21;
  if ((v21 - 268435458) <= 0xE && ((1 << (v21 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v21)
    {
      if (reply_port.msgh_id == 71)
      {
        v18 = 4294966988;
      }
      else if (reply_port.msgh_id == 2968)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          v18 = 4294966996;
          if (v24 == 1 && reply_port.msgh_size == 40 && !reply_port.msgh_remote_port && WORD3(v26) << 16 == 1114112)
          {
            v18 = 0;
            *a7 = v25;
            return v18;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          v18 = 4294966996;
          if ((_DWORD)v26)
          {
            if (reply_port.msgh_remote_port)
              v18 = 4294966996;
            else
              v18 = v26;
          }
        }
        else
        {
          v18 = 4294966996;
        }
      }
      else
      {
        v18 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v18;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v18;
}

uint64_t io_service_add_notification_ool(unsigned int a1, const char *a2, uint64_t a3, int a4, int a5, const void *a6, unsigned int a7, _DWORD *a8, _DWORD *a9)
{
  int v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  mach_port_t v19;
  uint64_t v20;
  int v21;
  mach_msg_header_t reply_port;
  int v24;
  uint64_t v25;
  int v26;
  int v27;
  int v28;
  __int128 v29;
  _OWORD v30[13];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v29 = 0u;
  memset(v30, 0, sizeof(v30));
  memset(&reply_port, 0, sizeof(reply_port));
  v24 = 2;
  v25 = a3;
  v26 = 0x1000000;
  v27 = a4;
  v28 = a5;
  DWORD1(v29) = 1310720;
  *((_QWORD *)&v29 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v14 = mig_strncpy_zerofill((char *)v30 + 8, a2, 128);
  else
    v14 = mig_strncpy((char *)v30 + 8, a2, 128);
  LODWORD(v30[0]) = 0;
  DWORD1(v30[0]) = v14;
  v15 = (v14 + 3) & 0xFFFFFFFC;
  v16 = (char *)&reply_port + v15;
  *(_DWORD *)((char *)v30 + v15 + 8) = a4;
  if (a7 > 8)
    return 4294966989;
  v18 = v16 - 128;
  memcpy(v16 + 80, a6, 8 * a7);
  *((_DWORD *)v18 + 51) = a7;
  v19 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.msgh_size = v15 + 8 * a7 + 80;
  *(_QWORD *)&reply_port.msgh_remote_port = __PAIR64__(v19, a1);
  *(_QWORD *)&reply_port.msgh_voucher_port = 0xB3600000000;
  v20 = mach_msg2_internal();
  v17 = v20;
  if ((v20 - 268435458) <= 0xE && ((1 << (v20 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v20)
    {
      if (reply_port.msgh_id == 71)
      {
        v17 = 4294966988;
      }
      else if (reply_port.msgh_id == 2970)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          v17 = 4294966996;
          if (v24 == 1 && reply_port.msgh_size == 52 && !reply_port.msgh_remote_port && HIWORD(v26) << 16 == 1114112)
          {
            v17 = 0;
            v21 = v25;
            *a8 = v29;
            *a9 = v21;
            return v17;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          v17 = 4294966996;
          if (HIDWORD(v25))
          {
            if (reply_port.msgh_remote_port)
              v17 = 4294966996;
            else
              v17 = HIDWORD(v25);
          }
        }
        else
        {
          v17 = 4294966996;
        }
      }
      else
      {
        v17 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v17;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v17;
}

uint64_t io_service_get_matching_service(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[32];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  memset(v9, 0, 480);
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 512);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 512);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB3900000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_get_matching_service_ool(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  mach_msg_header_t v6;
  int v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  int v12;
  int v13;

  v7 = 1;
  v8 = a2;
  v9 = 0x1000000;
  v10 = a3;
  v11 = *MEMORY[0x1E0C804E8];
  v12 = a3;
  v13 = 0;
  *(_QWORD *)&v6.msgh_bits = 0x3880001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB3A00000000;
  v3 = mach_msg2_internal();
  v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(v6.msgh_local_port);
  }
  else
  {
    v4 = 4294966995;
    mach_msg_destroy(&v6);
  }
  return v4;
}

uint64_t io_service_get_authorization_id(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v6 = 0;
  v7 = 0;
  v9 = 0;
  v8 = 0;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB3B00000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_service_set_authorization_id(unsigned int a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  mach_msg_header_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;

  v9 = 0;
  v7 = *MEMORY[0x1E0C804E8];
  v8 = a2;
  *(_QWORD *)&v6.msgh_bits = 0x2800001513;
  *(_QWORD *)&v6.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v6.msgh_voucher_port = 0xB3C00000000;
  v2 = mach_msg2_internal();
  v3 = v2;
  if ((v2 - 268435458) > 0xE || ((1 << (v2 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v2)
    {
      mig_dealloc_reply_port(v6.msgh_local_port);
    }
    else
    {
      v3 = 4294966995;
      mach_msg_destroy(&v6);
    }
  }
  else
  {
    mig_put_reply_port(v6.msgh_local_port);
  }
  return v3;
}

uint64_t io_registry_entry_get_properties_bin(unsigned int a1)
{
  uint64_t v1;
  uint64_t v2;
  mach_msg_header_t v5;
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v6 = 0u;
  v7 = 0u;
  *(_QWORD *)&v5.msgh_bits = 0x1800001513;
  *(_QWORD *)&v5.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v5.msgh_voucher_port = 0xB3E00000000;
  v1 = mach_msg2_internal();
  v2 = v1;
  if ((v1 - 268435458) > 0xE || ((1 << (v1 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v1)
    {
      mig_dealloc_reply_port(v5.msgh_local_port);
    }
    else
    {
      v2 = 4294966995;
      mach_msg_destroy(&v5);
    }
  }
  else
  {
    mig_put_reply_port(v5.msgh_local_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_property_bin(unsigned int a1, const char *a2, const char *a3, int a4, _QWORD *a5, _DWORD *a6)
{
  uint64_t (*v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  uint64_t v13;
  int v14;
  char *v15;
  char *v16;
  char *v17;
  int v18;
  uint64_t v19;
  mach_port_t v20;
  mach_port_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  mach_port_t reply_port[4];
  _OWORD v27[2];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  int v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v44 = 0;
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  memset(v27, 0, sizeof(v27));
  *(_OWORD *)reply_port = 0u;
  *((_QWORD *)&v27[0] + 1) = *MEMORY[0x1E0C804E8];
  v11 = MEMORY[0x1E0C84128];
  if (MEMORY[0x1E0C84128])
    v12 = mig_strncpy_zerofill((char *)&v27[1] + 8, a2, 128);
  else
    v12 = mig_strncpy((char *)&v27[1] + 8, a2, 128);
  LODWORD(v27[1]) = 0;
  DWORD1(v27[1]) = v12;
  v13 = (v12 + 3) & 0xFFFFFFFC;
  v14 = v13 + 52;
  v15 = (char *)reply_port + v13;
  v16 = v15 - 128;
  v17 = v15 + 48;
  if (v11)
    v18 = mig_strncpy_zerofill(v17, a3, 128);
  else
    v18 = mig_strncpy(v17, a3, 128);
  *((_DWORD *)v16 + 42) = 0;
  *((_DWORD *)v16 + 43) = v18;
  v19 = (v18 + 3) & 0xFFFFFFFC;
  v20 = v14 + v19;
  *(_DWORD *)&v16[v19 + 176] = a4;
  v21 = mig_get_reply_port();
  reply_port[0] = 5395;
  reply_port[1] = v20;
  *(_QWORD *)&reply_port[2] = __PAIR64__(v21, a1);
  *(_QWORD *)&v27[0] = 0xB3F00000000;
  v22 = mach_msg2_internal();
  v23 = v22;
  if ((v22 - 268435458) <= 0xE && ((1 << (v22 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else
  {
    if (!(_DWORD)v22)
    {
      if (DWORD1(v27[0]) == 71)
      {
        v23 = 4294966988;
      }
      else if (DWORD1(v27[0]) == 2979)
      {
        if ((reply_port[0] & 0x80000000) != 0)
        {
          v23 = 4294966996;
          if (DWORD2(v27[0]) == 1 && reply_port[1] == 56 && !reply_port[2] && BYTE7(v27[1]) == 1)
          {
            v24 = DWORD2(v27[1]);
            if (DWORD2(v27[1]) == DWORD1(v28))
            {
              v23 = 0;
              *a5 = *(_QWORD *)((char *)v27 + 12);
              *a6 = v24;
              return v23;
            }
          }
        }
        else if (reply_port[1] == 36)
        {
          v23 = 4294966996;
          if (LODWORD(v27[1]))
          {
            if (reply_port[2])
              v23 = 4294966996;
            else
              v23 = LODWORD(v27[1]);
          }
        }
        else
        {
          v23 = 4294966996;
        }
      }
      else
      {
        v23 = 4294966995;
      }
      mach_msg_destroy((mach_msg_header_t *)reply_port);
      return v23;
    }
    mig_dealloc_reply_port(reply_port[3]);
  }
  return v23;
}

uint64_t io_service_match_property_table_bin()
{
  unsigned int v0;
  unsigned int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  uint64_t v5;
  mach_port_t reply_port[4];
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
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;

  v0 = MEMORY[0x1E0C80A78]();
  v39 = *MEMORY[0x1E0C80C00];
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (v1 > 0x1000)
    return 4294966989;
  v3 = v1;
  v4 = v0;
  __memcpy_chk();
  LODWORD(v9) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 36;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v4);
  *(_QWORD *)&v8 = 0xB4200000000;
  v5 = mach_msg2_internal();
  v2 = v5;
  if ((v5 - 268435458) <= 0xE && ((1 << (v5 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v5)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v2 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v2;
}

uint64_t io_registry_entry_get_path_ool()
{
  const char *v0;
  unsigned int v1;
  int v2;
  uint64_t v3;
  uint64_t v4;
  mach_port_t reply_port[4];
  __int128 v7;
  _OWORD v8[258];
  uint64_t v9;

  v1 = MEMORY[0x1E0C80A78]();
  v9 = *MEMORY[0x1E0C80C00];
  memset(v8, 0, 480);
  *(_OWORD *)reply_port = 0u;
  v7 = 0u;
  *((_QWORD *)&v7 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v2 = mig_strncpy_zerofill((char *)v8 + 8, v0, 128);
  else
    v2 = mig_strncpy((char *)v8 + 8, v0, 128);
  LODWORD(v8[0]) = 0;
  DWORD1(v8[0]) = v2;
  reply_port[0] = 5395;
  reply_port[1] = ((v2 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), v1);
  *(_QWORD *)&v7 = 0xB4500000000;
  v3 = mach_msg2_internal();
  v4 = v3;
  if ((v3 - 268435458) <= 0xE && ((1 << (v3 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v3)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v4 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v4;
}

uint64_t io_registry_entry_from_path_ool()
{
  unsigned int v0;
  const char *v1;
  _DWORD *v2;
  _DWORD *v3;
  _DWORD *v4;
  _DWORD *v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  mach_msg_size_t v12;
  mach_port_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  mach_msg_header_t reply_port;
  int v19;
  uint64_t v20;
  int v21;
  _BYTE v22[24];
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t v51;

  v0 = MEMORY[0x1E0C80A78]();
  v3 = v2;
  v5 = v4;
  v7 = v6;
  v8 = v0;
  v51 = *MEMORY[0x1E0C80C00];
  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  *(_OWORD *)&v22[8] = 0u;
  memset(&reply_port, 0, sizeof(reply_port));
  v19 = 1;
  v20 = v9;
  v21 = 0x1000000;
  *(_QWORD *)v22 = v6;
  *(_QWORD *)&v22[4] = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v10 = mig_strncpy_zerofill(&v22[20], v1, 4096);
  else
    v10 = mig_strncpy(&v22[20], v1, 4096);
  *(_DWORD *)&v22[12] = 0;
  *(_DWORD *)&v22[16] = v10;
  v11 = (v10 + 3) & 0xFFFFFFFC;
  v12 = v11 + 64;
  *(_DWORD *)&v22[v11 + 20] = v7;
  v13 = mig_get_reply_port();
  reply_port.msgh_bits = -2147478253;
  reply_port.msgh_size = v12;
  *(_QWORD *)&reply_port.msgh_remote_port = __PAIR64__(v13, v8);
  *(_QWORD *)&reply_port.msgh_voucher_port = 0xB4600000000;
  v14 = mach_msg2_internal();
  v15 = v14;
  if ((v14 - 268435458) <= 0xE && ((1 << (v14 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port.msgh_local_port);
  }
  else
  {
    if (!(_DWORD)v14)
    {
      if (reply_port.msgh_id == 71)
      {
        v15 = 4294966988;
      }
      else if (reply_port.msgh_id == 2986)
      {
        if ((reply_port.msgh_bits & 0x80000000) != 0)
        {
          v15 = 4294966996;
          if (v19 == 1 && reply_port.msgh_size == 52 && !reply_port.msgh_remote_port && HIWORD(v21) << 16 == 1114112)
          {
            v15 = 0;
            v16 = v20;
            *v5 = *(_DWORD *)&v22[8];
            *v3 = v16;
            return v15;
          }
        }
        else if (reply_port.msgh_size == 36)
        {
          v15 = 4294966996;
          if (HIDWORD(v20))
          {
            if (reply_port.msgh_remote_port)
              v15 = 4294966996;
            else
              v15 = HIDWORD(v20);
          }
        }
        else
        {
          v15 = 4294966996;
        }
      }
      else
      {
        v15 = 4294966995;
      }
      mach_msg_destroy(&reply_port);
      return v15;
    }
    mig_dealloc_reply_port(reply_port.msgh_local_port);
  }
  return v15;
}

uint64_t io_device_tree_entry_exists_with_name(unsigned int a1, const char *a2)
{
  int v3;
  uint64_t v4;
  uint64_t v5;
  mach_port_t reply_port[4];
  __int128 v8;
  _OWORD v9[8];
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  memset(v9, 0, sizeof(v9));
  *(_OWORD *)reply_port = 0u;
  v8 = 0u;
  *((_QWORD *)&v8 + 1) = *MEMORY[0x1E0C804E8];
  if (MEMORY[0x1E0C84128])
    v3 = mig_strncpy_zerofill((char *)v9 + 8, a2, 128);
  else
    v3 = mig_strncpy((char *)v9 + 8, a2, 128);
  LODWORD(v9[0]) = 0;
  DWORD1(v9[0]) = v3;
  reply_port[0] = 5395;
  reply_port[1] = ((v3 + 3) & 0xFFFFFFFC) + 40;
  *(_QWORD *)&reply_port[2] = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v8 = 0xB4700000000;
  v4 = mach_msg2_internal();
  v5 = v4;
  if ((v4 - 268435458) <= 0xE && ((1 << (v4 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(reply_port[3]);
  }
  else if ((_DWORD)v4)
  {
    mig_dealloc_reply_port(reply_port[3]);
  }
  else
  {
    v5 = 4294966995;
    mach_msg_destroy((mach_msg_header_t *)reply_port);
  }
  return v5;
}

uint64_t io_service_wait_quiet_with_options(unsigned int a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  mach_msg_header_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;

  v8 = *MEMORY[0x1E0C804E8];
  v9 = a2;
  v10 = a3;
  *(_QWORD *)&v7.msgh_bits = 0x2C00001513;
  *(_QWORD *)&v7.msgh_remote_port = __PAIR64__(mig_get_reply_port(), a1);
  *(_QWORD *)&v7.msgh_voucher_port = 0xB4A00000000;
  v3 = mach_msg2_internal();
  v4 = v3;
  if ((v3 - 268435458) > 0xE || ((1 << (v3 - 2)) & 0x4003) == 0)
  {
    if ((_DWORD)v3)
    {
      mig_dealloc_reply_port(v7.msgh_local_port);
    }
    else
    {
      v4 = 4294966995;
      mach_msg_destroy(&v7);
    }
  }
  else
  {
    mig_put_reply_port(v7.msgh_local_port);
  }
  return v4;
}

uint64_t DisplayID::checksum(DisplayID *this, unint64_t a2)
{
  uint64_t v2;
  unsigned __int8 v3;

  if (a2)
  {
    v2 = 0;
    v3 = 0;
    do
      v3 += *((_BYTE *)this + v2++);
    while (a2 > v2);
  }
  else
  {
    return 0;
  }
  return v3;
}

BOOL IOAVRecoverableError(int a1)
{
  return a1 != -536870208 && a1 != -536870173 && a1 != 0;
}

const char *IOAVCommandString(int a1)
{
  if ((a1 - 1) > 0x11)
    return "Unknown";
  else
    return off_1E2003F80[a1 - 1];
}

const char *IOAVEventLogEventTypeString(unsigned int a1)
{
  if (a1 > 9)
    return "Unknown";
  else
    return off_1E2004010[a1];
}

const char *IOAVAudioFormatString(unsigned int a1)
{
  if (a1 > 0x14)
    return "Unknown";
  else
    return off_1E2004060[a1];
}

uint64_t IOAVAudioSampleSizeEnum(int a1)
{
  int v1;
  unsigned int v2;

  if (a1 == 20)
    v1 = 2;
  else
    v1 = 0;
  if (a1 == 24)
    v2 = 3;
  else
    v2 = v1;
  if (a1 == 16)
    return 1;
  else
    return v2;
}

uint64_t IOAVAudioSampleSizeScalar(int a1)
{
  if ((a1 - 1) >= 3)
    return 0;
  else
    return (4 * (a1 - 1) + 16);
}

uint64_t IOAVAudioSampleRateEnum(int a1)
{
  if (a1 > 255999)
  {
    if (a1 <= 705599)
    {
      if (a1 > 383999)
      {
        if (a1 == 384000)
          return 12;
        if (a1 == 512000)
          return 13;
      }
      else
      {
        if (a1 == 256000)
          return 10;
        if (a1 == 352800)
          return 11;
      }
    }
    else if (a1 < 1024000)
    {
      if (a1 == 705600)
        return 14;
      if (a1 == 768000)
        return 15;
    }
    else
    {
      switch(a1)
      {
        case 1024000:
          return 16;
        case 1411200:
          return 17;
        case 1536000:
          return 18;
      }
    }
  }
  else if (a1 <= 88199)
  {
    if (a1 > 47999)
    {
      if (a1 == 48000)
        return 3;
      if (a1 == 64000)
        return 4;
    }
    else
    {
      if (a1 == 32000)
        return 1;
      if (a1 == 44100)
        return 2;
    }
  }
  else if (a1 <= 127999)
  {
    if (a1 == 88200)
      return 5;
    if (a1 == 96000)
      return 6;
  }
  else
  {
    switch(a1)
    {
      case 128000:
        return 7;
      case 176400:
        return 8;
      case 192000:
        return 9;
    }
  }
  return 0;
}

uint64_t IOAVAudioSampleRateScalar(unsigned int a1)
{
  if (a1 > 0x12)
    return 0;
  else
    return IOAVAudioSampleRateScalar::s_scalar_rates[a1];
}

uint64_t IOAVAudioLinkSampleRateForFormat(int a1, unsigned int a2)
{
  uint64_t v2;

  if ((a1 - 16) >= 5)
  {
    if ((a1 - 13) <= 2)
      return 4 * a2;
    else
      return a2;
  }
  else
  {
    v2 = (int)IOAVAudioSampleRateEnum(a2) - 2;
    if (v2 > 7)
      return 0;
    else
      return dword_18AB553C8[v2];
  }
}

uint64_t IOAVHDMIAudioClockRegenerationDataForLink(uint64_t a1, uint64_t a2)
{
  unsigned int v3;
  unsigned int v4;
  int v5;
  unint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t i;

  v3 = IOAVAudioSampleRateEnum(*(_DWORD *)(a2 + 12));
  v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    v5 = *(_DWORD *)(a1 + 72);
    v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5)
      LODWORD(v6) = v6 / (v5 + 1);
    v4 = v6 >> (*(_BYTE *)(a1 + 40) & 1);
  }
  v7 = 0;
  v8 = (char *)&IOAVHDMIAudioClockRegenerationDataForLink::s_acr_table + 16 * v3;
  while (*(_DWORD *)(a1 + 8) != IOAVHDMIAudioClockRegenerationDataForLink::s_depth_table[v7])
  {
    ++v7;
    v8 += 4320;
    if (v7 == 4)
      return 0;
  }
  if ((v7 & 0xFFFFFFFC) != 0)
    return 0;
  for (i = 0; i != 14; ++i)
  {
    if (v4 == IOAVHDMIAudioClockRegenerationDataForLink::s_pixel_clock_table[i])
      break;
  }
  return *(_QWORD *)&v8[288 * i - 16];
}

uint64_t IOAVVideoTimingGetPixelClock(_DWORD *a1, unsigned int *a2)
{
  uint64_t result;
  int v4;
  int v5;
  unint64_t v6;

  result = a1[17];
  if ((_DWORD)result)
  {
    if (!a2)
      return result;
    goto LABEL_3;
  }
  v4 = *a1 & 1;
  v5 = a1[8];
  v6 = (a1[9] * (unint64_t)a1[1] * (int)a1[14]) >> 16;
  if (v5)
    LODWORD(v6) = v6 / (v5 + 1);
  result = v6 >> v4;
  if (a2)
LABEL_3:
    *a2 = result / 0xC8;
  return result;
}

const char *IOAVAudioSpeakerString(unsigned int a1)
{
  if (a1 > 0x11)
    return "Unknown";
  else
    return off_1E2004108[a1];
}

uint64_t IOAVAudioGetSpeakerAllocationMask(unsigned int a1)
{
  if (a1 > 0x31)
    return 0;
  else
    return IOAVAudioGetSpeakerAllocationMask::sSpeakerAllocations[a1];
}

__n128 IOAVAudioGetChannelLayoutData(unsigned int a1, __n128 *a2)
{
  __n128 *v2;
  __n128 result;

  if (a1 <= 0x31)
  {
    v2 = (__n128 *)((char *)&IOAVAudioGetChannelLayoutData::sChannelMap + 40 * a1);
    *a2 = *v2;
    result = v2[1];
    a2[1] = result;
    a2[2].n128_u64[0] = v2[2].n128_u64[0];
  }
  return result;
}

uint64_t IOAVAudioGetChannelAllocationDefault(int a1)
{
  if ((a1 - 9) >= 0xFFFFFFF9)
    return dword_18AB4C840[a1 - 2];
  else
    return 0xFFFFFFFFLL;
}

uint64_t IOAVAudioGetChannelAllocation(void *__s2)
{
  uint64_t v2;
  __int128 *i;
  __int128 v4;
  _OWORD v6[2];
  uint64_t v7;

  v2 = 0;
  for (i = &IOAVAudioGetChannelLayoutData::sChannelMap; ; i = (__int128 *)((char *)i + 40))
  {
    v4 = i[1];
    v6[0] = *i;
    v6[1] = v4;
    v7 = *((_QWORD *)i + 4);
    if (!memcmp(v6, __s2, 0x28uLL))
      break;
    if (++v2 == 50)
      return 0xFFFFFFFFLL;
  }
  return v2;
}

uint64_t IOAVAudioLinkGetBitRate(_DWORD *a1)
{
  return (a1[2] * a1[3] * a1[1]);
}

uint64_t IOAVAudioLinkIsIEC61937(_DWORD *a1)
{
  return (*a1 < 0x15u) & (0x1FF5FCu >> *a1);
}

uint64_t IOAVAudioLinkGetHDMIAudioPacketType(int *a1)
{
  int v1;
  BOOL v2;

  v1 = *a1;
  v2 = *a1 > 0x14 || ((1 << *a1) & 0x1FF5FC) == 0;
  if (!v2 && (a1[2] * a1[3] * a1[1]) > 0x5DC000)
    return 1;
  if (v1 == 9)
    return 3;
  return 4 * (v1 == 11);
}

uint64_t IOAVAudioLinkGetMaxStreamChannelCount(int *a1)
{
  int v1;

  v1 = *a1;
  if ((*a1 - 13) < 8)
    return 8;
  if (v1 == 1)
    return a1[1];
  if (v1 == 2)
    return 6;
  return 0;
}

uint64_t IOAVAudioLinkGetMaxStreamSampleRate(_DWORD *a1)
{
  unsigned int v1;

  v1 = a1[3];
  if ((*a1 - 13) >= 8)
    return v1;
  else
    return v1 >> 2;
}

const char *IOAVVideoAspectRatioString(int a1)
{
  if ((a1 - 1) > 0x10)
    return "Unknown";
  else
    return off_1E2004198[a1 - 1];
}

const char *IOAVVideoLinkModeString(unsigned int a1)
{
  if (a1 > 3)
    return "Unknown";
  else
    return off_1E2004220[(char)a1];
}

uint64_t IOAVVideoColorBitDepth(int a1)
{
  if ((a1 - 6) > 0xA)
    return 1;
  else
    return dword_18AB553E8[a1 - 6];
}

uint64_t IOAVVideoColorBitDepthScalar(unsigned int a1)
{
  if (a1 > 5)
    return 0;
  else
    return dword_18AB55414[a1];
}

uint64_t IOAVVideoColorBitDepthMinimumForEOTF(int a1)
{
  return 2 * ((a1 & 0xFFFFFFFE) == 2);
}

BOOL IOAVVideoColorBitDepthIsSupported(unsigned int a1, int a2)
{
  _BOOL4 v2;

  v2 = a1 < 6;
  if (a2 != 1)
    v2 = 0;
  if (a2)
    return v2;
  else
    return a1 < 5;
}

const char *IOAVVideoAxisString(int a1)
{
  const char *v1;

  v1 = "Unknown";
  if (a1 == 1)
    v1 = "Vertical";
  if (a1)
    return v1;
  else
    return "Horizontal";
}

const char *IOAVVideoPixelEncodingString(unsigned int a1)
{
  if (a1 > 0xE)
    return "Unknown";
  else
    return off_1E2004240[a1];
}

const char *IOAVVideoColorDynamicRangeString(int a1)
{
  const char *v1;

  v1 = "Unknown";
  if (a1 == 1)
    v1 = "Limited";
  if (a1)
    return v1;
  else
    return "Full";
}

const char *IOAVVideoColorEOTFString(unsigned int a1)
{
  if (a1 > 3)
    return "Unknown";
  else
    return off_1E20042B8[a1];
}

const char *IOAVVideoColorimetryString(unsigned int a1)
{
  if (a1 > 0x10)
    return "Unknown";
  else
    return off_1E20042D8[a1];
}

BOOL IOAVVideoColorimetryIsValid(unsigned int a1, int a2, int a3)
{
  BOOL v4;
  _BOOL8 result;
  BOOL v6;

  if (a1 <= 9 && ((1 << a1) & 0x2C0) != 0 && a3 < 2)
    return 0;
  switch(a2)
  {
    case 0:
      v4 = a1 - 9 >= 8;
      return !v4;
    case 1:
    case 2:
    case 3:
    case 6:
    case 7:
      v4 = a1 >= 8;
      return !v4;
    case 4:
    case 5:
      if (a1 >= 0xF)
        return 0;
      else
        return (0x4102u >> a1) & 1;
    case 8:
    case 9:
    case 10:
    case 11:
      v6 = a1 == 7;
      goto LABEL_18;
    case 12:
      v6 = a1 == 9;
LABEL_18:
      result = v6;
      break;
    default:
      return 0;
  }
  return result;
}

const char *IOAVLocationString(int a1)
{
  const char *v1;

  v1 = "Unknown";
  if (a1 == 1)
    v1 = "Embedded";
  if (a1)
    return v1;
  else
    return "External";
}

const char *IOAVLinkTypeString(int a1)
{
  const char *v1;

  v1 = "Unknown";
  if (!a1)
    v1 = "Audio";
  if (a1 == 1)
    return "Video";
  else
    return v1;
}

const char *IOAVLinkSourceString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown";
  else
    return off_1E2004360[(char)a1];
}

const char *IOAVInfoFrameTypeString(char a1)
{
  unint64_t v1;

  v1 = a1 ^ 0xFFFFFFFFFFFFFF80;
  if (v1 > 7)
    return "Unknown";
  else
    return off_1E2004388[v1];
}

const char *IOAVElementTypeString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown";
  else
    return off_1E20043C8[a1];
}

const char *IOAVVideoTimingStandardString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown";
  else
    return off_1E20043F0[a1];
}

const char *IOAVVideoScanInformationString(unsigned int a1)
{
  if (a1 > 3)
    return "Unknown";
  else
    return off_1E2004418[a1];
}

const char *IOAVStandardTypeString(int a1)
{
  if (a1 > 2)
    return "Unknown";
  else
    return IOAVStandardTypeString::sStrings[a1];
}

const char *IOAVVideoTimingTypeString(unsigned int a1)
{
  if (a1 > 4)
    return "Unknown";
  else
    return IOAVVideoTimingTypeString::sStrings[a1];
}

const char *IOAVTransportString(unsigned int a1)
{
  if (a1 > 4)
    return "Other";
  else
    return IOAVTransportString::sStrings[a1];
}

const char *IOAVProtectionStatusString(unsigned int a1)
{
  if (a1 > 2)
    return "Unknown";
  else
    return IOAVProtectionStatusString::sStrings[a1];
}

const char *IOAVEncryptionStatusString(unsigned int a1)
{
  if (a1 > 2)
    return "Unknown";
  else
    return IOAVEncryptionStatusString::sStrings[a1];
}

const char *IOAVContentProtectionTypeString(unsigned int a1)
{
  if (a1 > 2)
    return "Unknown";
  else
    return IOAVContentProtectionTypeString::sStrings[a1];
}

const char *IOAVContentProtectionProtocolString(uint64_t a1)
{
  const char *v1;
  const char *v2;

  v1 = "Unknown";
  if (HIDWORD(a1) == 2)
    v1 = "HDCP2";
  if (HIDWORD(a1) == 1)
    v1 = "HDCP1";
  v2 = "Unknown";
  if ((_DWORD)a1 == 2)
    v2 = "DPCP";
  if ((_DWORD)a1 != 1)
    v1 = v2;
  if ((_DWORD)a1)
    return v1;
  else
    return "None";
}

uint64_t IOAVGetVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  if (IOAVGetCEAVideoTimingData(a1, a2, a3, a4, a5)
    || (__IOAVGetStandardVideoTimingData(1, a1, a2, a3, a4, a5, 1) & 1) != 0
    || (__IOAVGetStandardVideoTimingData(3, a1, a2, a3, a4, a5, 1) & 1) != 0)
  {
    return 1;
  }
  else
  {
    return __IOAVGetStandardVideoTimingData(2, a1, a2, a3, a4, a5, 1);
  }
}

BOOL IOAVGetCEAVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  unsigned int v6;
  __int128 *v7;

  v6 = IOAVGetCEAVideoShortID(a1, a2, a3, a4);
  if (v6 <= 0x7E
    && (v7 = &IOAVGetVideoTimingTable::sCEATimingData[5 * v6],
        *(_OWORD *)a5 = *v7,
        *(_OWORD *)(a5 + 16) = v7[1],
        *(_OWORD *)(a5 + 32) = v7[2],
        *(_OWORD *)(a5 + 48) = v7[3],
        *(_OWORD *)(a5 + 64) = v7[4],
        *(_DWORD *)(a5 + 4))
    && *(_DWORD *)(a5 + 36))
  {
    return *(_DWORD *)(a5 + 56) != 0;
  }
  else
  {
    return 0;
  }
}

uint64_t IOAVGetDMTVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  return __IOAVGetStandardVideoTimingData(1, a1, a2, a3, a4, a6, a5);
}

uint64_t IOAVGetCVTVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6)
{
  return __IOAVGetStandardVideoTimingData(3, a1, a2, a3, a4, a6, a5);
}

uint64_t IOAVGetGTFVideoTimingData(int a1, int a2, int a3, int a4, uint64_t a5)
{
  return __IOAVGetStandardVideoTimingData(2, a1, a2, a3, a4, a5, 1);
}

uint64_t IOAVGetVideoTimingTable(signed int a1, _DWORD *a2)
{
  int v2;
  uint64_t result;

  if (a1 > 4)
  {
    v2 = 0;
    result = 0;
  }
  else
  {
    v2 = dword_18AB5542C[a1];
    result = *((_QWORD *)&off_1E2004438 + a1);
  }
  *a2 = v2;
  return result;
}

uint64_t IOAVVideoTimingGetSyncRateRounded(uint64_t a1, unsigned int a2)
{
  return (*(_DWORD *)(a1 + 32 * a2 + 24) + 0x8000) & 0xFFFF0000;
}

BOOL IOAVVideoTimingIsVideoOptimized(uint64_t a1)
{
  int v1;
  BOOL v2;
  unsigned int v3;
  unsigned int v4;

  v1 = (*(_DWORD *)(a1 + 56) + 0x8000) % 392823;
  v3 = v1 - 0x8000;
  v2 = v1 - 0x8000 < 0;
  v4 = 0x8000 - v1;
  if (!v2)
    v4 = v3;
  return v4 < 0x28F;
}

uint64_t IOAVVideoTimingVideoOptimizedDelta(uint64_t a1)
{
  int v1;
  unsigned int v2;
  int v3;
  BOOL v4;
  int v5;
  unsigned int v6;

  v1 = *(_DWORD *)(a1 + 56) + 0x8000;
  v2 = 0x8000 - v1 % 392823;
  if (v1 % 392823 - 0x8000 >= 0)
    v2 = v1 % 392823 - 0x8000;
  v3 = v1 % 393216;
  v5 = v3 - 0x8000;
  v4 = v3 - 0x8000 < 0;
  v6 = 0x8000 - v3;
  if (!v4)
    v6 = v5;
  if (v2 >= v6)
    return v6;
  else
    return v2;
}

uint64_t IOAVGetVideoTimingDataByID(int a1, unsigned int a2, __int128 *a3)
{
  __int128 *v5;
  unsigned int v6;
  __int128 *v7;
  uint64_t result;
  _BYTE v9[80];

  if (a1 == 1)
  {
    v5 = &IOAVGetVideoTimingTable::sDMTTimingData;
    v6 = 89;
  }
  else
  {
    if (a1 != 4)
      return 0;
    v5 = IOAVGetVideoTimingTable::sCEATimingData;
    v6 = 127;
  }
  if (v6 <= a2)
    return 0;
  bzero(v9, 0x50uLL);
  v7 = &v5[5 * a2];
  result = memcmp(v9, v7, 0x50uLL);
  if ((_DWORD)result)
  {
    a3[1] = v7[1];
    a3[2] = v7[2];
    a3[3] = v7[3];
    a3[4] = v7[4];
    *a3 = *v7;
    return 1;
  }
  return result;
}

uint64_t __IOAVGetStandardVideoTimingData(int a1, int a2, int a3, int a4, int a5, uint64_t a6, int a7)
{
  __int128 *v13;
  int v14;
  unsigned int v15;
  uint64_t result;
  unsigned int v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  v13 = &IOAVGetVideoTimingTable::sNonstandardDetailedTimingData;
  v14 = 1;
  v15 = 57;
  switch(a1)
  {
    case 0:
      break;
    case 1:
      v13 = &IOAVGetVideoTimingTable::sDMTTimingData;
      v15 = 89;
      break;
    case 2:
      v13 = &IOAVGetVideoTimingTable::sGTFTimingData;
      v15 = 50;
      break;
    case 3:
      v13 = &IOAVGetVideoTimingTable::sCVTTimingData;
      v15 = 114;
      break;
    case 4:
      v13 = IOAVGetVideoTimingTable::sCEATimingData;
      v15 = 127;
      break;
    default:
      v15 = 0;
      v14 = 0;
      v13 = 0;
      break;
  }
  result = 0;
  if (a2 && a3 && a4 && a7 && v14)
  {
    v17 = (a4 + 0x8000) & 0xFFFF0000;
    if (v15 <= 1)
      v18 = 1;
    else
      v18 = v15;
    while (((*(_BYTE *)v13 & 1) == 0) == a5
         || *((_DWORD *)v13 + 2) != a2
         || *((_DWORD *)v13 + 10) != a3
         || *((_DWORD *)v13 + 14) != v17
         || a7 != -1 && IOAVVideoTimingGetBlankingStyle((uint64_t)v13) != a7)
    {
      v13 += 5;
      if (!--v18)
        return 0;
    }
    v19 = v13[1];
    v20 = v13[2];
    v21 = v13[4];
    *(_OWORD *)(a6 + 48) = v13[3];
    v22 = *v13;
    *(_OWORD *)(a6 + 64) = v21;
    *(_OWORD *)(a6 + 16) = v19;
    *(_OWORD *)(a6 + 32) = v20;
    *(_OWORD *)a6 = v22;
    *(_DWORD *)(a6 + 56) = a4;
    return 1;
  }
  return result;
}

uint64_t IOAVVideoTimingGetBlankingStyle(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  int v5;

  v1 = *(_DWORD *)(a1 + 28);
  v2 = *(_DWORD *)(a1 + 60);
  if ((v1 != 0) == (v2 != 0))
    return 1;
  v3 = *(unsigned __int16 *)(a1 + 44);
  if (!v1)
  {
    v5 = v3 & 0xFFF8;
    return v2 && v5 == 0;
  }
  if (v2)
    return 0;
  if (v3 < 3)
    return 1;
  if (v3 != 3 && v3 < 8)
    return 2;
  if (v3 != 8)
    return 0;
  return 3;
}

BOOL IOAVGetCEAVideoTimingDataWithShortID(unsigned int a1, int a2, uint64_t a3)
{
  __int128 *v3;
  int v4;
  _BOOL8 result;
  int v6;
  unsigned int v7;

  if (a1 > 0x7E)
    return 0;
  v3 = &IOAVGetVideoTimingTable::sCEATimingData[5 * a1];
  *(_OWORD *)a3 = *v3;
  *(_OWORD *)(a3 + 16) = v3[1];
  *(_OWORD *)(a3 + 32) = v3[2];
  *(_OWORD *)(a3 + 48) = v3[3];
  *(_OWORD *)(a3 + 64) = v3[4];
  if (!*(_DWORD *)(a3 + 4) || !*(_DWORD *)(a3 + 36))
    return 0;
  v4 = *(_DWORD *)(a3 + 56);
  result = v4 != 0;
  if (v4 && a2)
  {
    v6 = v4 + 0x8000;
    v7 = 0x8000 - v6 % 392823;
    if (v6 % 392823 - 0x8000 >= 0)
      v7 = v6 % 392823 - 0x8000;
    if (v7 <= 0x28E)
    {
      *(_DWORD *)(a3 + 56) = v6 & 0xFFFF0000;
      *(_DWORD *)(a3 + 68) = ((1001 * (unint64_t)*(unsigned int *)(a3 + 68) + 500)
                            * (unsigned __int128)0x4189374BC6A7F0uLL) >> 64;
    }
    return 1;
  }
  return result;
}

uint64_t IOAVGetCEAVideoShortID(int a1, int a2, int a3, int a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int *v7;
  int v8;
  unsigned int v9;
  int v10;
  int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[28];

  v4 = 0;
  v13 = 0u;
  v15 = 0u;
  memset(v16, 0, sizeof(v16));
  DWORD1(v13) = a1;
  DWORD1(v15) = a2;
  *(_DWORD *)&v16[4] = a3;
  v12 = a4;
  v5 = 17;
  v14 = 0u;
  v6 = ((uint64_t)(a1 << 16) << 16) / (a2 << 16);
  v7 = IOAVVideoActiveFormatAspectRatio::arRef;
  do
  {
    v8 = *v7;
    v7 += 2;
    v9 = v8 - v6;
    if (v8 - (int)v6 < 0)
      v9 = -v9;
    v10 = IOAVVideoActiveFormatAspectRatio::arRef[2 * v5] - v6;
    if (v10 < 0)
      v10 = v6 - IOAVVideoActiveFormatAspectRatio::arRef[2 * v5];
    if (v9 < v10)
      v5 = v4;
    ++v4;
  }
  while (v4 != 18);
  *(_DWORD *)&v16[20] = IOAVVideoActiveFormatAspectRatio::arRef[2 * v5 + 1];
  return __IOAVGetCEAVideoShortIDWithData(&v12, 1);
}

uint64_t IOAVGetCEAVideoShortIDWithData(_DWORD *a1)
{
  return __IOAVGetCEAVideoShortIDWithData(a1, 0);
}

uint64_t __IOAVGetCEAVideoShortIDWithData(_DWORD *__s2, int a2)
{
  uint64_t v4;
  __int128 *v5;
  __int128 v6;
  __int128 v7;
  _OWORD v9[2];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = 0;
  v5 = IOAVGetVideoTimingTable::sCEATimingData;
  do
  {
    v6 = v5[3];
    v10 = v5[2];
    v11 = v6;
    v7 = v5[1];
    v9[0] = *v5;
    v9[1] = v7;
    v12 = v5[4];
    if (DWORD1(v9[0]) && DWORD1(v10) && DWORD2(v11))
    {
      if (a2)
      {
        if (((LODWORD(v9[0]) ^ *__s2) & 1) == 0
          && __s2[18] == DWORD2(v12)
          && __s2[2] == DWORD2(v9[0])
          && __s2[10] == DWORD2(v10)
          && ((DWORD2(v11) + 0x8000) ^ (__s2[14] + 0x8000)) < 0x10000)
        {
          return v4;
        }
      }
      else if (!memcmp(v9, __s2, 0x50uLL))
      {
        return v4;
      }
    }
    ++v4;
    v5 += 5;
  }
  while (v4 != 127);
  return 0;
}

uint64_t IOAVGetCEAVideoShortIDWithDataActive(_DWORD *a1)
{
  return __IOAVGetCEAVideoShortIDWithData(a1, 1);
}

uint64_t IOAVVideoActiveFormatAspectRatio(int a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v3;
  int v4;
  unsigned int v5;
  int v6;

  v1 = 0;
  v2 = 17;
  v3 = IOAVVideoActiveFormatAspectRatio::arRef;
  do
  {
    v4 = *v3;
    v3 += 2;
    v5 = v4 - a1;
    if (v4 - a1 < 0)
      v5 = -v5;
    v6 = IOAVVideoActiveFormatAspectRatio::arRef[2 * v2] - a1;
    if (v6 < 0)
      v6 = a1 - IOAVVideoActiveFormatAspectRatio::arRef[2 * v2];
    if (v5 < v6)
      v2 = v1;
    ++v1;
  }
  while (v1 != 18);
  return IOAVVideoActiveFormatAspectRatio::arRef[2 * v2 + 1];
}

BOOL IOAVTransportSupportsCEA(int a1)
{
  return !a1 || a1 == 3;
}

BOOL IOAVTransportSupportsRGBOnly(int a1)
{
  BOOL v1;

  if (a1)
    v1 = a1 == 3;
  else
    v1 = 1;
  return !v1;
}

uint64_t IOAVVideoTimingGetITSource(uint64_t a1)
{
  uint64_t v1;

  v1 = 0;
  while (*(_DWORD *)(a1 + 40) != IOAVVideoTimingGetITSource::sITResolutions[v1 + 1]
       || *(_DWORD *)(a1 + 8) != IOAVVideoTimingGetITSource::sITResolutions[v1])
  {
    v1 += 3;
    if (v1 == 147)
      return 0;
  }
  return IOAVVideoTimingGetITSource::sITResolutions[v1 + 2];
}

BOOL IOAVEDIDIsStandard(_QWORD *a1)
{
  return *a1 == IOAVEDIDIsStandard::sEDIDStandardHeader;
}

uint64_t IOAVInfoFrameGetChecksum(_BYTE *a1)
{
  unint64_t v1;
  char v2;

  v1 = a1[2];
  v2 = a1[1] + *a1 + v1 + a1[3];
  return (v2 + DisplayID::checksum((DisplayID *)(a1 + 4), v1));
}

uint64_t IOAVGetSPDInfoFrame@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t result;

  *(_QWORD *)(a2 + 11) = 0;
  *(_QWORD *)(a2 + 3) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 19) = 0;
  *(_WORD *)a2 = 387;
  *(_BYTE *)(a2 + 2) = 25;
  *(_QWORD *)(a2 + 4) = *(_QWORD *)a1;
  *(_OWORD *)(a2 + 12) = *(_OWORD *)(a1 + 8);
  *(_BYTE *)(a2 + 28) = *(_DWORD *)(a1 + 24);
  result = DisplayID::checksum((DisplayID *)(a2 + 4), 0x19uLL);
  *(_BYTE *)(a2 + 3) = 99 - result;
  return result;
}

uint64_t IOAVVideoTimingGetActivePixelClock(_DWORD *a1)
{
  int v1;
  unint64_t v2;

  v1 = a1[8];
  v2 = (a1[10] * (unint64_t)a1[2] * (int)a1[14]) >> 16;
  if (v1)
    LODWORD(v2) = v2 / (v1 + 1);
  return v2 >> (*a1 & 1);
}

unint64_t IOAVVideoGetPixelClockTolerance(unsigned int a1)
{
  return a1 / 0xC8uLL;
}

uint64_t IOAVVideoColorBitsPerPixel(_DWORD *a1, unsigned int a2, const char *a3, const char *a4)
{
  int v4;
  uint64_t result;

  v4 = a1[1];
  result = 24;
  switch(v4)
  {
    case 0:
    case 3:
    case 11:
    case 12:
      result = (3 * *a1);
      break;
    case 1:
      result = (3 * *a1) >> 1;
      break;
    case 2:
      result = (2 * *a1);
      break;
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
    case 10:
    case 13:
    case 14:
      return result;
    default:
      __IOAVAbort((const char *)0x18, a2, a3, a4);
  }
  return result;
}

void __IOAVAbort(const char *a1, unsigned int a2, const char *a3, const char *a4)
{
  warnx("%s:%u: %s(): %s", "/Library/Caches/com.apple.xbs/Sources/IOAVFamily_user/IOAV.cpp", 2755, "IOAVVideoColorBitsPerPixel", "invalid pixel encoding");
  abort();
}

uint64_t IOAVVideoColorMinimumBitsPerPixelDSC(uint64_t a1)
{
  uint64_t v1;

  v1 = *(int *)(a1 + 4);
  if (v1 > 0xC)
    return 0xFFFFLL;
  else
    return word_18AB55440[v1];
}

uint64_t IOAVDSCModeForPixelEncoding(unsigned int a1)
{
  if (a1 > 0xC)
    return 0;
  else
    return dword_18AB5545C[a1];
}

uint64_t IOAVDSCCapabilitiesGetMaxSlicesPerLine(uint64_t a1)
{
  uint64_t v1;

  if (*(_WORD *)(a1 + 10) && (v1 = __clz(*(unsigned __int16 *)(a1 + 10)) ^ 0x1FLL, v1 <= 9))
    return byte_18AB55490[v1];
  else
    return 0;
}

uint64_t IOAVDSCSlicesPerLineScalar(unsigned int a1)
{
  if (a1 > 9)
    return 0;
  else
    return byte_18AB55490[(char)a1];
}

uint64_t IOAVDSCCapabilitiesGetPeakPixelRateForMode(uint64_t a1, int a2)
{
  unsigned int *v2;

  if ((a2 - 3) < 2)
  {
    v2 = (unsigned int *)(a1 + 20);
    return *v2;
  }
  if ((a2 - 1) <= 1)
  {
    v2 = (unsigned int *)(a1 + 16);
    return *v2;
  }
  return 0;
}

BOOL IOAVVideoLinkIsDolbyVision(uint64_t a1)
{
  int v1;
  unsigned int v2;
  unsigned int v3;

  v1 = *(_DWORD *)(a1 + 12);
  v2 = v1 & 0xFFFFFFFE;
  v3 = v1 - 8;
  return v2 == 4 || v3 < 5;
}

BOOL IOAVVideoPixelEncodingIsDolbyVision(int a1)
{
  return (a1 & 0xFFFFFFFE) == 4 || (a1 - 8) < 5;
}

BOOL IOAVVideoPixelEncodingIsLLDolbyVision(int a1)
{
  return (a1 - 8) < 5;
}

BOOL IOAVVideoLinkRequiresHDMIScrambling(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  return IOAVHDMICharacterRate(a1, a2, a3, a4) > 0x1443FD00;
}

unint64_t IOAVHDMICharacterRate(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  unsigned int v4;
  int v5;
  unint64_t v6;
  __int128 v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    v5 = *(_DWORD *)(a1 + 72);
    v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5)
      LODWORD(v6) = v6 / (v5 + 1);
    v4 = v6 >> (*(_BYTE *)(a1 + 40) & 1);
  }
  v7 = *(_OWORD *)(a1 + 24);
  v9[0] = *(_OWORD *)(a1 + 8);
  v9[1] = v7;
  return IOAVVideoColorBitsPerPixel(v9, a2, a3, a4) * (unint64_t)v4 / 0x18;
}

uint64_t IOAVHDMIClockRate(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  unsigned int v5;
  unsigned int v6;

  v5 = IOAVHDMICharacterRate(a1, a2, a3, a4);
  if (v5 <= 0x1443FD00)
    v6 = 1;
  else
    v6 = 4;
  if (v6 >= a2)
    v6 = a2;
  return v5 / v6;
}

unint64_t IOAVVideoLinkBandwidth(uint64_t a1, unsigned int a2, const char *a3, const char *a4)
{
  unsigned int v4;
  int v5;
  unint64_t v6;
  __int128 v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = *(_DWORD *)(a1 + 108);
  if (!v4)
  {
    v5 = *(_DWORD *)(a1 + 72);
    v6 = (*(unsigned int *)(a1 + 76) * (unint64_t)*(unsigned int *)(a1 + 44) * *(int *)(a1 + 96)) >> 16;
    if (v5)
      LODWORD(v6) = v6 / (v5 + 1);
    v4 = v6 >> (*(_BYTE *)(a1 + 40) & 1);
  }
  v7 = *(_OWORD *)(a1 + 24);
  v9[0] = *(_OWORD *)(a1 + 8);
  v9[1] = v7;
  return IOAVVideoColorBitsPerPixel(v9, a2, a3, a4) * (unint64_t)v4;
}

uint64_t IOAVHDMIFRLBandwidth(unsigned int a1)
{
  if (a1 > 6)
    return 0;
  else
    return qword_18AB554A0[a1];
}

uint64_t IOAVHDMIFRLBitRateScalar(unsigned int a1)
{
  if (a1 > 6)
    return 0;
  else
    return qword_18AB554D8[a1];
}

uint64_t IOAVHDMIFRLCharacterRate(unsigned int a1)
{
  if (a1 > 6)
    return 0;
  else
    return dword_18AB55510[a1];
}

const char *IOAVHDMIFRLRateString(unsigned int a1)
{
  if (a1 > 6)
    return "? Gbps (Unknown FRL rate)";
  else
    return (&off_1E2004460)[a1];
}

const char *IODPCommandString(int a1)
{
  if (a1 == 32)
    return "TrainLink";
  if (a1 == 33)
    return "RetrainLink";
  return IOAVCommandString(a1);
}

const char *IODPEventLogEventTypeString(unsigned int a1)
{
  if (a1 == 32)
    return "Link Training Command";
  else
    return IOAVEventLogEventTypeString(a1);
}

const char *IODPTrainingPatternName(unsigned int a1)
{
  if (a1 > 7)
    return "Unknown";
  else
    return (&off_1E20044B0)[a1];
}

const char *IODPQualityPatternName(unsigned int a1)
{
  if (a1 > 7)
    return "Unknown";
  else
    return (&off_1E20044F0)[a1];
}

uint64_t IODPLinkRateIsStandard(unsigned int a1)
{
  return (a1 < 0x1F) & (0x40100440u >> a1);
}

uint64_t IODPLinkRateIsUHBR(char a1)
{
  return ((a1 + 127) < 4u) & (0xBu >> ((a1 + 127) & 0xF));
}

uint64_t IODPLinkBitRateIsUHBR(uint64_t a1)
{
  _BOOL4 v1;

  v1 = a1 == 13500000000 || a1 == 20000000000;
  return a1 == 10000000000 || v1;
}

uint64_t IODPTrainingPatternLength(int a1)
{
  if ((a1 - 1) > 6)
    return 0;
  else
    return dword_18AB5558C[a1 - 1];
}

uint64_t IODPLinkSymbolRate(unsigned int a1)
{
  uint64_t v1;

  v1 = 27000000 * a1;
  if (a1 == 29)
    v1 = 799200000;
  if (a1 == 21)
    return 568800000;
  else
    return v1;
}

unint64_t IODPLinkSymbolClockForLinkBitRate(unint64_t a1)
{
  if (a1 == 10000000000 || a1 == 20000000000 || a1 == 13500000000)
    return a1 >> 5;
  else
    return a1 / 0xA;
}

uint64_t IODPLinkBitRateForLinkSymbolClock(uint64_t a1)
{
  return 10 * a1;
}

uint64_t IODPLinkRateScalar(int a1)
{
  if (a1 <= 128)
  {
    if (a1 == 21)
      return 5688000000;
    if (a1 == 29)
      return 7992000000;
  }
  else
  {
    switch(a1)
    {
      case 129:
        return 10000000000;
      case 132:
        return 13500000000;
      case 130:
        return 20000000000;
    }
  }
  return 270000000 * a1;
}

uint64_t IODPLinkRateEnum(uint64_t a1)
{
  uint64_t v1;

  if (a1 <= 0x2540BE3FFLL)
  {
    if (a1 == 5688000000)
    {
      LOBYTE(v1) = 21;
      return v1;
    }
    if (a1 == 7992000000)
    {
      LOBYTE(v1) = 29;
      return v1;
    }
    return ((unint64_t)(((a1 / 0xAuLL + 13500000) * (unsigned __int128)0x13E254E465D72C1BuLL) >> 64) >> 21);
  }
  if (a1 == 10000000000)
  {
    LOBYTE(v1) = -127;
    return v1;
  }
  if (a1 == 13500000000)
  {
    LOBYTE(v1) = -124;
    return v1;
  }
  if (a1 != 20000000000)
    return ((unint64_t)(((a1 / 0xAuLL + 13500000) * (unsigned __int128)0x13E254E465D72C1BuLL) >> 64) >> 21);
  LOBYTE(v1) = -126;
  return v1;
}

BOOL IODPDriveSettingsEqual(uint64_t a1, uint64_t a2, unsigned int a3)
{
  BOOL v3;
  int *v4;
  int *v5;
  unint64_t v6;
  int v7;
  int v8;
  int v9;

  if (a3)
  {
    if (*(_DWORD *)(a1 + 4) == *(_DWORD *)(a2 + 4))
    {
      v3 = 0;
      v4 = (int *)(a2 + 16);
      v5 = (int *)(a1 + 16);
      v6 = 1;
      do
      {
        if (*(v5 - 2) != *(v4 - 2))
          break;
        v3 = v6 >= a3;
        if (a3 == v6)
          break;
        v8 = *v4;
        v4 += 3;
        v7 = v8;
        v9 = *v5;
        v5 += 3;
        ++v6;
      }
      while (v9 == v7);
    }
    else
    {
      return 0;
    }
  }
  else
  {
    return 1;
  }
  return v3;
}

BOOL IODPDriveSettingsAreValid(unint64_t a1, int a2)
{
  return SHIDWORD(a1) <= 3 && a2 <= 3 && IODPDriveSettingsAreValid::sValidAdjustments[4 * HIDWORD(a1) + a2] != 0;
}

unint64_t IODPConstrainedDriveSettings(unint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t result;
  uint64_t v4;
  int v5;

  v2 = HIDWORD(a1);
  if (SHIDWORD(a1) >= 3)
    LODWORD(v2) = 3;
  if ((int)a2 >= 3)
    a2 = 3;
  else
    a2 = a2;
  result = (a1 | ((unint64_t)v2 << 32)) + 0x100000000;
  v4 = 4 * v2;
  do
  {
    result -= 0x100000000;
    if (!v4)
      break;
    v5 = IODPDriveSettingsAreValid::sValidAdjustments[a2 + v4];
    v4 -= 4;
  }
  while (!v5);
  return result;
}

uint64_t IODPConstrainDriveSettings(uint64_t result, unsigned int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;

  if (a2)
  {
    v2 = 0;
    v3 = a2;
    do
    {
      v4 = result + 12 * v2;
      LODWORD(v5) = *(_DWORD *)(v4 + 8);
      v6 = HIDWORD(*(_QWORD *)v4);
      if ((int)v6 >= 3)
        LODWORD(v6) = 3;
      if ((int)v5 >= 3)
        v5 = 3;
      else
        v5 = v5;
      v7 = (*(_QWORD *)v4 | ((unint64_t)v6 << 32)) + 0x100000000;
      v8 = 4 * v6;
      do
      {
        v7 -= 0x100000000;
        if (!v8)
          break;
        v9 = IODPDriveSettingsAreValid::sValidAdjustments[v5 + v8];
        v8 -= 4;
      }
      while (!v9);
      *(_QWORD *)v4 = v7;
      *(_DWORD *)(v4 + 8) = v5;
      ++v2;
    }
    while (v2 != v3);
  }
  return result;
}

uint64_t IODPUnifiedDriveSettings(uint64_t a1, unsigned int a2)
{
  uint64_t v2;
  int32x2_t v3;
  _QWORD *v4;
  int32x2_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  uint64_t v9;
  int v10;

  if (a2)
  {
    v2 = a2;
    v3 = 0;
    v4 = (_QWORD *)(a1 + 4);
    do
    {
      v5 = *(int32x2_t *)v4;
      v4 = (_QWORD *)((char *)v4 + 12);
      v3 = vmax_s32(v5, v3);
      --v2;
    }
    while (v2);
  }
  else
  {
    v3 = 0;
  }
  if (v3.i32[0] >= 3)
    v6 = 3;
  else
    v6 = v3.u32[0];
  if (v3.i32[1] >= 3)
    v7 = 3;
  else
    v7 = v3.u32[1];
  result = (v6 << 32) + 0x100000000;
  v9 = 4 * v6;
  do
  {
    result -= 0x100000000;
    if (!v9)
      break;
    v10 = IODPDriveSettingsAreValid::sValidAdjustments[v7 + v9];
    v9 -= 4;
  }
  while (!v10);
  return result;
}

unint64_t IODPStreamClockHz(unsigned int a1, unsigned int a2, unsigned int a3)
{
  uint64_t v3;
  uint64_t v4;

  if (!a3)
    return 0;
  v3 = 568800000;
  v4 = 27000000 * a1;
  if (a1 == 29)
    v4 = 799200000;
  if (a1 != 21)
    v3 = v4;
  return v3 * (unint64_t)a2 / a3;
}

unint64_t IODPCalculateM(unint64_t result, uint64_t a2, unsigned int a3)
{
  if (result)
    return 10 * a2 * (unint64_t)a3 / result;
  return result;
}

unint64_t IODPLinkBandwidth(unsigned int a1, unint64_t a2)
{
  if (a2 == 10000000000 || a2 == 20000000000 || a2 == 13500000000)
    return 1568768 * a2 * a1 / 0x18C063;
  else
    return 8 * a1 * (a2 / 0xA);
}

unint64_t IODPVideoBandwidth(uint64_t a1)
{
  unsigned int v2;
  const char *v3;
  const char *v4;
  unsigned int PixelClock;
  __int128 v6;
  unsigned __int16 v7;
  _OWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PixelClock = IOAVVideoTimingGetPixelClock((_DWORD *)(a1 + 40), 0);
  if ((*(_WORD *)(a1 + 1) & 1) != 0)
  {
    v7 = *(_WORD *)(a1 + 124);
  }
  else
  {
    v6 = *(_OWORD *)(a1 + 24);
    v9[0] = *(_OWORD *)(a1 + 8);
    v9[1] = v6;
    v7 = 16 * IOAVVideoColorBitsPerPixel(v9, v2, v3, v4);
  }
  return (v7 * (unint64_t)PixelClock + 15) >> 4;
}

unint64_t IODPLinkRateRequiredForVideoBandwidth(uint64_t a1, unsigned int a2)
{
  return (a2 - 1 + 10 * ((unint64_t)(a1 + 7) >> 3)) / a2;
}

uint64_t IODPVideoLinkMainStreamAttributeData@<X0>(uint64_t a1@<X0>, unsigned int a2@<W1>, unsigned int a3@<W2>, char a4@<W3>, int a5@<W4>, BOOL *a6@<X5>, uint64_t a7@<X8>)
{
  unsigned int v14;
  int v15;
  uint64_t result;
  int v17;
  __int16 v18;
  char v19;
  unint64_t v20;
  unint64_t v21;
  unsigned __int16 v22;

  v14 = 0;
  v15 = *(unsigned __int8 *)(a1 + 8);
  *a6 = 0;
  switch(*(_DWORD *)(a1 + 12))
  {
    case 0:
    case 0xC:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0xA:
        case 0x10:
          v14 = 2 * (*(_DWORD *)(a1 + 16) == 1);
          break;
        case 0xB:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 13;
          break;
        case 0xC:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 12;
          break;
        case 0xD:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 3;
          break;
        case 0xE:
        case 0xF:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 14;
          break;
        default:
          goto LABEL_9;
      }
      break;
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          v14 = 6;
          break;
        case 1:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          v14 = 7;
          break;
        case 2:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 4;
          break;
        case 3:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 5;
          break;
        default:
          goto LABEL_9;
      }
      break;
    case 3:
    case 0xB:
      switch(*(_DWORD *)(a1 + 20))
      {
        case 0:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          v14 = 10;
          break;
        case 1:
          *a6 = *(_DWORD *)(a1 + 16) != 1;
          v14 = 11;
          break;
        case 2:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 8;
          break;
        case 3:
          *a6 = *(_DWORD *)(a1 + 16) != 0;
          v14 = 9;
          break;
        default:
LABEL_9:
          v14 = 0;
          *a6 = 1;
          break;
      }
      break;
    case 5:
    case 7:
    case 0xA:
      v14 = 0;
      v15 = 8;
      break;
    default:
      break;
  }
  result = IOAVVideoColorBitDepth(v15);
  v17 = *(_DWORD *)(a1 + 40);
  v18 = (v17 & 1) != 0 && (*(_BYTE *)(a1 + 76) & 1) == 0;
  v19 = v17 & 1;
  if (a5 && *a6)
    v18 |= 0x40u;
  *(int8x8_t *)a7 = vbsl_s8((int8x8_t)0xFF000000FF000000, *(int8x8_t *)a7, (int8x8_t)__PAIR64__(a3, a2));
  v20 = *(unsigned __int16 *)(a1 + 44) | (*(_DWORD *)(a1 + 76) >> v19 << 16) | ((unint64_t)(unsigned __int16)*(_DWORD *)(a1 + 56) << 32) | ((unint64_t)*(unsigned __int16 *)(a1 + 88) << 48);
  v21 = (*(_DWORD *)(a1 + 68) == 0) | ((unint64_t)*(unsigned int *)(a7 + 22) << 48) | (2
                                                                                            * (*(_DWORD *)(a1 + 52) & 0x7FFFLL)) | ((unint64_t)(*(_DWORD *)(a1 + 100) == 0) << 16) | ((unint64_t)(*(_DWORD *)(a1 + 84) & 0x7FFF) << 17) | ((unint64_t)*(unsigned int *)(a1 + 48) << 32);
  v22 = *(_WORD *)(a1 + 80);
  *(_WORD *)(a7 + 24) = (v14 >> 1) & 6 | a4 & 0xE7 | (8 * ((v14 & 2) != 0)) & 0xEF | (16 * (v14 & 1)) | (32 * result) | (v18 << 8);
  *(_QWORD *)(a7 + 8) = v20;
  *(_QWORD *)(a7 + 16) = v21 & 0xFFFFFFFFFFFFLL | ((unint64_t)v22 << 48);
  return result;
}

__n128 IODPInfoFrameSDP@<Q0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  char v3;
  char v4;
  uint64_t v5;
  __n128 result;

  v3 = *(_BYTE *)a2 | 0x80;
  *(_OWORD *)a3 = 0u;
  *(_OWORD *)(a3 + 16) = 0u;
  *(_BYTE *)(a3 + 1) = v3;
  *(_BYTE *)(a3 + 3) = 4 * a1;
  *(_DWORD *)(a3 + 32) = 0;
  if (a1 >= 19)
    v4 = 29;
  else
    v4 = 27;
  *(_BYTE *)(a3 + 2) = v4;
  if (a1 == 19)
  {
    *(_WORD *)(a3 + 4) = *(_WORD *)(a2 + 1);
    v5 = a3 + 6;
  }
  else
  {
    v5 = a3 + 4;
  }
  *(_OWORD *)v5 = *(_OWORD *)(a2 + 4);
  result = *(__n128 *)(a2 + 16);
  *(__n128 *)(v5 + 12) = result;
  return result;
}

_DWORD *IODPVideoLinkVideoStreamConfigurationSDP@<X0>(_DWORD *result@<X0>, uint64_t a2@<X8>)
{
  int v2;
  int v3;
  int v4;
  int v5;
  char v6;
  char v7;
  char v8;
  int v9;
  char v10;
  int v11;

  *(_OWORD *)(a2 + 20) = 0u;
  *(_OWORD *)(a2 + 4) = 0u;
  v3 = result[3];
  v2 = result[4];
  *(_DWORD *)a2 = 319096576;
  v4 = result[2];
  v5 = 0;
  v6 = -127;
  v7 = 1;
  switch(v3)
  {
    case 0:
    case 12:
      switch(result[5])
      {
        case 9:
          v8 = 6;
          goto LABEL_33;
        case 0xA:
          goto LABEL_34;
        case 0xB:
          v8 = 2;
          goto LABEL_33;
        case 0xC:
          v8 = 1;
          goto LABEL_33;
        case 0xD:
          v8 = 3;
          goto LABEL_33;
        case 0xE:
        case 0xF:
          v8 = 4;
          goto LABEL_33;
        default:
          v8 = 5;
          goto LABEL_33;
      }
    case 1:
      *(_BYTE *)(a2 + 20) = 48;
      switch(result[5])
      {
        case 1:
          v8 = 49;
          goto LABEL_33;
        case 2:
          v8 = 50;
          goto LABEL_33;
        case 3:
          v8 = 51;
          goto LABEL_33;
        case 4:
          v8 = 52;
          goto LABEL_33;
        case 5:
          v8 = 53;
          goto LABEL_33;
        case 6:
          v8 = 54;
          goto LABEL_33;
        case 7:
          v8 = 55;
          goto LABEL_33;
        default:
          goto LABEL_34;
      }
    case 2:
    case 4:
    case 6:
    case 8:
    case 9:
    case 13:
    case 14:
      *(_BYTE *)(a2 + 20) = 32;
      switch(result[5])
      {
        case 1:
          v8 = 33;
          goto LABEL_33;
        case 2:
          v8 = 34;
          goto LABEL_33;
        case 3:
          v8 = 35;
          goto LABEL_33;
        case 4:
          v8 = 36;
          goto LABEL_33;
        case 5:
          v8 = 37;
          goto LABEL_33;
        case 6:
          v8 = 38;
          goto LABEL_33;
        case 7:
          v8 = 39;
          goto LABEL_33;
        default:
          goto LABEL_34;
      }
    case 3:
    case 11:
      *(_BYTE *)(a2 + 20) = 16;
      switch(result[5])
      {
        case 1:
          v8 = 17;
          goto LABEL_33;
        case 2:
          v8 = 18;
          goto LABEL_33;
        case 3:
          v8 = 19;
          goto LABEL_33;
        case 4:
          v8 = 20;
          goto LABEL_33;
        case 5:
          v8 = 21;
          goto LABEL_33;
        case 6:
          v8 = 22;
          goto LABEL_33;
        case 7:
          v8 = 23;
LABEL_33:
          *(_BYTE *)(a2 + 20) = v8;
          break;
        default:
          goto LABEL_34;
      }
      break;
    case 5:
    case 7:
    case 10:
LABEL_40:
      *(_BYTE *)(a2 + 21) = v7;
      v10 = v6;
      v2 = v5;
LABEL_41:
      if (v2 == 1)
        *(_BYTE *)(a2 + 21) = v10;
      return result;
    default:
      break;
  }
LABEL_34:
  v9 = v4;
  v10 = 0x80;
  v11 = v9 - 8;
  v6 = -127;
  v7 = 1;
  v5 = v2;
  switch(v11)
  {
    case 0:
      goto LABEL_40;
    case 1:
      v6 = -123;
      v7 = 5;
      goto LABEL_39;
    case 2:
      v6 = -126;
      v7 = 2;
      goto LABEL_39;
    case 4:
      v6 = -125;
      v7 = 3;
      goto LABEL_39;
    case 8:
      v6 = -124;
      v7 = 4;
LABEL_39:
      v5 = v2;
      goto LABEL_40;
    default:
      goto LABEL_41;
  }
}

uint64_t IODPCompareLinkTrainingData(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unsigned int v10;

  v2 = 10000000000;
  v3 = 5688000000;
  v4 = *(unsigned __int8 *)(a1 + 12);
  if (v4 <= 0x80)
  {
    v5 = 5688000000;
    if (v4 == 21)
      goto LABEL_11;
    if (v4 == 29)
    {
      v5 = 7992000000;
      goto LABEL_11;
    }
  }
  else
  {
    v5 = 10000000000;
    switch(v4)
    {
      case 0x81u:
        goto LABEL_11;
      case 0x84u:
        v5 = 13500000000;
        goto LABEL_11;
      case 0x82u:
        v5 = 20000000000;
        goto LABEL_11;
    }
  }
  v5 = 270000000 * *(unsigned __int8 *)(a1 + 12);
LABEL_11:
  v6 = *(unsigned __int8 *)(a2 + 12);
  if (v6 > 0x80)
  {
    switch(v6)
    {
      case 0x81u:
        goto LABEL_22;
      case 0x84u:
        v2 = 13500000000;
        goto LABEL_22;
      case 0x82u:
        v2 = 20000000000;
        goto LABEL_22;
    }
    goto LABEL_20;
  }
  if (v6 != 21)
  {
    if (v6 != 29)
    {
LABEL_20:
      v3 = 270000000 * *(unsigned __int8 *)(a2 + 12);
      goto LABEL_21;
    }
    v3 = 7992000000;
  }
LABEL_21:
  v2 = v3;
LABEL_22:
  v7 = v5 * *(unsigned int *)(a1 + 8);
  v8 = v2 * *(unsigned int *)(a2 + 8);
  v9 = v7 > v8;
  if (v7 >= v8)
    v10 = 0;
  else
    v10 = -1;
  if (v9)
    return 1;
  else
    return v10;
}

const char *IODPDeviceTypeString(unsigned int a1)
{
  if (a1 > 2)
    return "Sink";
  else
    return (&IODPDeviceTypeString::sStrings)[a1];
}

BOOL IODPAudioCodingType(_DWORD *a1)
{
  return IOAVAudioLinkIsIEC61937(a1) && (unint64_t)IOAVAudioLinkGetBitRate(a1) > 0x5DC000;
}

void getTagString_cold_1()
{
  __assert_rtn("getTagString", "IOCFSerialize.c", 87, "object");
}

void IOCFSerialize_cold_1()
{
  __assert_rtn("IOCFSerialize", "IOCFSerialize.c", 743, "state.data");
}

void IOCFSerialize_cold_2()
{
  __assert_rtn("IOCFSerialize", "IOCFSerialize.c", 754, "state.stringIDRefDictionary");
}

void IOCFSerialize_cold_3()
{
  __assert_rtn("IOCFSerialize", "IOCFSerialize.c", 759, "state.numberIDRefDictionary");
}

void IOCFSerialize_cold_4()
{
  __assert_rtn("IOCFSerialize", "IOCFSerialize.c", 764, "state.dataIDRefDictionary");
}

void IOCFSerialize_cold_5()
{
  __assert_rtn("IOCFSerialize", "IOCFSerialize.c", 769, "state.dictionaryIDRefDictionary");
}

void IOCFSerialize_cold_6()
{
  __assert_rtn("IOCFSerialize", "IOCFSerialize.c", 774, "state.arrayIDRefDictionary");
}

void IOCFSerialize_cold_7()
{
  __assert_rtn("IOCFSerialize", "IOCFSerialize.c", 779, "state.setIDRefDictionary");
}

void IOCFSerialize_cold_8()
{
  __assert_rtn("IOCFSerializeBinary", "IOCFSerialize.c", 1140, "state.data");
}

void IOCFSerialize_cold_9()
{
  __assert_rtn("IOCFSerializeBinary", "IOCFSerialize.c", 1152, "state.tags");
}

void DoIdrefScan_cold_1()
{
  __assert_rtn("DoIdrefScan", "IOCFSerialize.c", 626, "object");
}

void DoCFSerialize_cold_1()
{
  __assert_rtn("DoCFSerialize", "IOCFSerialize.c", 693, "object");
}

void IOCFUnserializeBinary_cold_1()
{
  __assert_rtn("IOCFUnserializeBinary", "IOCFSerialize.c", 1401, "!parent");
}

void addStartTag_cold_1()
{
  __assert_rtn("addStartTag", "IOCFSerialize.c", 253, "idRef");
}

void IONotificationPortSetImportanceReceiver_cold_1()
{
  __assert_rtn("IONotificationPortSetImportanceReceiver", "IOKitLib.c", 968, "kr == KERN_SUCCESS");
}

void IOHIDSessionFilterCreateWithClass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDSessionFilterCreateWithClass Failed to initialize filter", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDSessionFilterCreateWithClass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDSessionFilterCreateWithClass Failed to find HIDSessionFilter protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDSessionFilterCreateWithClass_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDSessionFilterCreateWithClass class does not conform to SessionFilter protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDSessionFilterGetPropertyForClient_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "%@ is not serializable", (uint8_t *)&v2, 0xCu);
}

void IOHIDCopyHIDParameterFromEventSystem_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a1, a3, "Fail to get parameter with status 0x%x", a5, a6, a7, a8, 0);
}

void IOHIDSetHIDParameterToEventSystem_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a2, a3, "Fail to set parameter with status 0x%x", a5, a6, a7, a8, 0);
}

void IOHIDSetCursorEnable_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Set cursor enable failed:0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDSetCursorBounds_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Set cursor bounds failed:0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDSetOnScreenCursorBounds_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Set on screen cursor bounds failed:0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _IOHIDSetFixedMouseLocation_cold_1()
{
  os_log_t v0;
  uint8_t v1[8];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_18AAAF000, v0, OS_LOG_TYPE_DEBUG, "Set fixed mouse location failed:0x%x", v1, 8u);
  OUTLINED_FUNCTION_1();
}

void IOHIDSetStateForSelector_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "IORegistryEntrySetCFProperty Failed for kIOHIDActivityUserIdleKey with err : 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDSetStateForSelector_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "IOConnectGetService Failed with err : 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDSetModifierLockState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create event system client", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ____loadTCCFramework_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Could not load TCC", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ____loadTCCFramework_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Could not find TCC symbol \"TCCAccessPreflight\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ____loadTCCFramework_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Could not find TCC symbol \"TCCAccessRequest\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ____loadTCCFramework_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Could not find TCC symbol \"TCCAccessCheckAuditToken\"", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOPSCopyExternalPowerAdapterDetails_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create connection\n", a5, a6, a7, a8, 0);
}

void IOPSCopyExternalPowerAdapterDetails_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create message\n", a5, a6, a7, a8, 0);
}

void IOPSGaugingMitigationGetState_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create connection\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPSGaugingMitigationGetState_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create message\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void getPMQueue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create PM queue\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void getUserActiveValidDict_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create useractiveRefs", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendUserActivityMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create xpc connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendUserActivityMsg_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create xpc objects to send userActivityRegister message\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processUserActivityMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Received termination imminent error for connection 0x%lx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void processUserActivityMsg_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "unregisterNotification: invalid ref to 0x%lx", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void IOPMLogWakeProgress_cold_1()
{
  int v0;
  uint8_t v1[8];
  __int16 v2;
  int v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_0();
  v2 = 1024;
  v3 = v0;
  _os_log_debug_impl(&dword_18AAAF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Wake progress from %d. data: 0x%x\n", v1, 0xEu);
  OUTLINED_FUNCTION_3();
}

void _conveyMachPortToPowerd_cold_1(int *a1, int a2)
{
  int v2;
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3[0] = 67109376;
  v3[1] = v2;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_18AAAF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Failed to send mach port for IOPMConnection id 0x%x. rc:0x%x\n", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_3();
}

void _connectionCreate_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Failed to create IOPMConnection. rc:0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void _connectionCreate_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Failed to send IOPMConnection request. rc:0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void copyBatteryData_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create dictionary to send message\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __copyBatteryData_block_invoke_151_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Received an error in response to copy '%s' data\n", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void _IOHIDDeviceReleasePrivate_cold_1(_QWORD *a1, _OWORD *a2, unsigned int *a3)
{
  OUTLINED_FUNCTION_4_2(a1, a2);
  OUTLINED_FUNCTION_2_0(MEMORY[0x1E0C81028]);
  atomic_load(a3);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void IOHIDDeviceCreate_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a2, a3, "QueryInterface(kIOHIDDeviceDeviceInterfaceID):0x%x", a5, a6, a7, a8, 0);
}

void IOHIDDeviceCreate_cold_2(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = a2;
  v5 = 2048;
  v6 = v3;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "IOCreatePlugInInterfaceForService:0x%x for serviceID:%#llx", (uint8_t *)v4, 0x12u);
}

void IOHIDDeviceCreate_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a2, a3, "IOObjectRetain:0x%x", a5, a6, a7, a8, 0);
}

void __IOHIDDeviceSetupAsyncSupport_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_4_2(a1, a2);
  OUTLINED_FUNCTION_2_0(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __IOHIDDeviceSetupAsyncSupport_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_4_2(a1, a2);
  OUTLINED_FUNCTION_2_0(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void __IOHIDDeviceSetupAsyncSupport_cold_3()
{
  _os_crash();
  __break(1u);
}

void IOHIDDeviceSetCancelHandler_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_4_2(a1, a2);
  OUTLINED_FUNCTION_2_0(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDDeviceRegisterRemovalCallback_cold_1()
{
  _os_crash();
  __break(1u);
}

void _IOHIDLogCategory_cold_1()
{
  __assert_rtn("_IOHIDLogCategory", "IOHIDLibPrivate.c", 82, "category < kIOHIDLogCategoryCount");
}

void _IOHIDObjectRetainCount_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void _IOHIDObjectRetainCount_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDManagerSetDeviceMatching_cold_1()
{
  _os_crash();
  __break(1u);
}

void __IOHIDManagerSetDeviceMatching_cold_1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "IOServiceAddMatchingNotification:0x%x", (uint8_t *)v2, 8u);
}

void IOHIDManagerSetDispatchQueue_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2_0(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDManagerSetCancelHandler_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2_0(MEMORY[0x1E0C81028]);
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void __IOHIDManagerExtRelease_cold_1(_QWORD *a1, _OWORD *a2, unsigned int *a3)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2_0(MEMORY[0x1E0C81028]);
  atomic_load(a3);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void IOHIDQueueScheduleWithRunLoop_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void __IOHIDQueueSetupAsyncSupport_cold_1()
{
  _os_crash();
  __break(1u);
}

void IOHIDQueueSetCancelHandler_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDQueueRegisterValueAvailableCallback_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "called with a NULL callback", a5, a6, a7, a8, 0);
}

void IOHIDQueueRegisterValueAvailableCallback_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "unable to create dictionary", a5, a6, a7, a8, 0);
}

void IOHIDQueueRegisterValueAvailableCallback_cold_3()
{
  _os_crash();
  __break(1u);
}

void __IOHIDQueueExtRelease_cold_1(_QWORD *a1, _OWORD *a2, unsigned int *a3)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  atomic_load(a3);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

void _IOHIDEventSetAttachment_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "Unable to create event attachment storage", a5, a6, a7, a8, 0);
}

void __IOHIDEventCreateWithBytesHelper_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109632;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  v6 = 2048;
  v7 = 16;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "Failed to create event at index=%d , eventDataSize: %u < sizeof(IOHIDEventData): %lu", (uint8_t *)v3, 0x18u);
  OUTLINED_FUNCTION_3();
}

void IOHIDEventGetPolicy_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134217984;
  v3 = a1;
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "unexpected policy request %llu", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

void __IOHIDEventDataAppendEventData_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = 0;
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "insufficient buffer data available, size: %ld, length: %ld", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __IOHIDEventDataAppendEventData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "no event->parent->eventData", a5, a6, a7, a8, 0);
}

void IOHIDConnectionFilterCreate_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "IOHIDConnectionFilterCreate failed to find symbol %@ for bundle %@", (uint8_t *)&v3, 0x16u);
}

void IOHIDConnectionFilterCreate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDConnectionFilterCreate Failed to initialize plugin", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDConnectionFilterCreate_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDConnectionFilterCreate Failed to find HIDConnectionPlugin protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDConnectionFilterCreate_cold_4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDConnectionFilterCreate class does not conform to HIDConnectionPlugin protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemRegister_cold_1()
{
  __assert_rtn("__IOHIDEventSystemRegister", "IOHIDEventSystem.c", 245, "kIOHIDServerConnectionRootQueue = hid_dispatch_pthread_root_queue_create(\"IOHIDEvent Server Connection - Root\", &attribute, NULL, 2)");
}

void __IOHIDEventSystemRegister_cold_2()
{
  __assert_rtn("__IOHIDEventSystemRegister", "IOHIDEventSystem.c", 244, "!hid_pthread_attr_init(&attribute, kIOHIDInterruptThreadPriority, kIOHIDInterruptThreadPolicy)");
}

void IOHIDEventSystemCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18AAAF000, a1, a3, "IOHIDEventSystemCreate error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventSystemOpen_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_18AAAF000, a1, a3, "IOHIDEventSystemOpen error", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventSystemOpen_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "Failed to create server dipatch queue", v1, 2u);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientInitReplyPort_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Unable to allocate client reply port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientInitReplyPort_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Unable to allocate set client reply port attributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientInitReplyPort_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Unable to allocate acquire client reply port attributes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientTerminationCallback_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "IOHIDEventSystemServer died. Reestablishing connection.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventSystemClient_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "API will be deprecated soon.  Please use IOHIDEventSystemClientCreate.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientRefresh_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Unable to open %#x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientRefresh_cold_2(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  mach_error_string(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, a2, v3, "mach_port_deallocate(server_port) %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_3()
{
  __assert_rtn("__IOHIDEventSystemClientRefresh", "IOHIDEventSystemClient.c", 579, "kern_result == KERN_SUCCESS");
}

void __IOHIDEventSystemClientRefresh_cold_4(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  mach_error_string(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, a2, v3, "mach_port_deallocate(bootstrap_port) %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_5(kern_return_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, a2, v3, "bootstrap_look_up2 failed: %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_6(kern_return_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  bootstrap_strerror(a1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, a2, v3, "bootstrap_look_up_per_user failed: %s", v4);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientRefresh_cold_7(int *a1, NSObject *a2)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109378;
  v4[1] = v3;
  v5 = 2080;
  v6 = xpc_strerror();
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "xpc_user_sessions_get_foreground_uid failed: %d - %s", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_8();
}

void __IOHIDEventSystemClientSetupAsyncSupport_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Unable to create event queue via hidd: (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientSetupAsyncSupport_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Failed to register for server availability: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventSystemClientStartQueue_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "io_hideventsystem_queue_start:%#x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventSystemClientSetDispatchQueue_cold_1()
{
  _os_crash();
  __break(1u);
}

void IOHIDEventSystemClientRegisterEventCallback_cold_1()
{
  _os_crash();
  __break(1u);
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Bad arguments", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Invalid type", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Bad matching dict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Bad matching event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "_IOHIDCreateBinaryData fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _IOHIDEventSystemClientCopyMatchingEventForService_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "CFDictionaryCreateMutableCopy fail", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDVirtualServiceClientCreateWithCallbacks_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Client must be scheduled with dispatch queue or runloop", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDVirtualServiceClientCreateWithCallbacks_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "io_hideventsystem_create_virtual_service :%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDVirtualServiceClientRemove_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "io_hideventsystem_remove_virtual_service:%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDVirtualServiceClientDispatchEvent_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Unable to serialize event", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDVirtualServiceClientDispatchEvent_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "io_hideventsystem_dispatch_event_for_virtual_service:%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "HIDVS (id:%llx) invalid parameters", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "HIDVS (id:%llx) client does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _iohideventsystem_client_dispatch_virtual_service_copy_property_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "Virtual service (id: %llx) does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _iohideventsystem_client_dispatch_virtual_service_set_property_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "HIDVS (id:%llx) invalid property key", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _iohideventsystem_client_dispatch_virtual_service_set_property_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "HIDVS (id:%llx) does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _iohideventsystem_output_event_to_virtual_service_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "HIDVS (id: %llx) invalid event data", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _iohideventsystem_output_event_to_virtual_service_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "HIDVS (id: %llx) does not exist", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void IOHIDNotificationInvalidate_cold_1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDNotificationInvalidate_cold_2(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void __IOHIDServiceCreateAndCopyConnectionCache_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __IOHIDServiceCreateAndCopyConnectionCache_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __IOHIDServiceInit_cold_1(CFNumberRef *a1, NSObject *a2)
{
  uint64_t v3;
  _QWORD v4[4];

  v4[3] = *MEMORY[0x1E0C80C00];
  v4[0] = 0;
  CFNumberGetValue(*a1, kCFNumberSInt64Type, v4);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, a2, v3, "[%#llx] Invalid entitlements property, expected Array or String", (uint8_t *)v4);
  OUTLINED_FUNCTION_12();
}

void __IOHIDServiceInit_cold_2()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl(&dword_18AAAF000, v1, OS_LOG_TYPE_ERROR, "0x%llx: IOServiceAddInterestNotification 0x%x", v2, 0x12u);
  OUTLINED_FUNCTION_3();
}

void __IOHIDServiceInit_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __IOHIDServiceInit_cold_4(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void _IOHIDServiceCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "__IOHIDServiceCreateObjcServicePlugin Failed to initialize plugin", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _IOHIDServiceCreate_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "__IOHIDServiceCreateObjcServicePlugin Failed to find HIDServicePlugin protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _IOHIDServiceCreate_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "__IOHIDServiceCreateObjcServicePlugin class does not conform to HIDServicePlugin protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _IOHIDServiceCreate_cold_4(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "Unable to retain service: 0x%x", (uint8_t *)v2, 8u);
  OUTLINED_FUNCTION_1();
}

void _IOHIDServiceOpen_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, v0, v1, "0x%llx: Failed to open service", v2);
  OUTLINED_FUNCTION_3();
}

void __IOHIDServiceHandleCancelTimerTimeout_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  uint8_t v3[12];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  v4 = 2112;
  v5 = v0;
  v6 = 2112;
  v7 = v1;
  _os_log_fault_impl(&dword_18AAAF000, v2, OS_LOG_TYPE_FAULT, "Service plugin %@: %@ never called cancel handler for service: %@", v3, 0x20u);
  OUTLINED_FUNCTION_12();
}

void __IOHIDServiceHandleCancelTimerTimeout_cold_2(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, a2, a3, "Service: %@ cancellation timer timed out", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void IOHIDServiceConformsTo_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_0();
  v3 = 2080;
  v4 = "DeviceUsagePairs";
  v5 = 2112;
  v6 = v0;
  _os_log_error_impl(&dword_18AAAF000, v1, OS_LOG_TYPE_ERROR, "0x%llx: IOHIDService property %s incorrect type: %@", v2, 0x20u);
  OUTLINED_FUNCTION_12();
}

void __IOHIDServiceConformsToFunction_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "DeviceUsagePairs";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "Entry of IOHIDService property %s incorrect type: %@", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __IOHIDServiceQueueWillExecute_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void __IOHIDServiceQueueDidExecute_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void IOHIDSessionCreate_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void IOHIDSessionCreate_cold_2(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void IOHIDSessionCreate_cold_3(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_5(a1, a2);
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_6();
  __break(1u);
}

void _IOHIDSessionCopyPropertyForClient_cold_2(uint8_t *a1, uint64_t a2, uint64_t *a3, NSObject *a4)
{
  uint64_t RegistryID;

  RegistryID = IOHIDServiceGetRegistryID(a2);
  *(_DWORD *)a1 = 138412290;
  *a3 = RegistryID;
  _os_log_error_impl(&dword_18AAAF000, a4, OS_LOG_TYPE_ERROR, "Service record for %@ is not serializable.", a1, 0xCu);
}

void IOHIDEventQueueCreate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "Unable to create analytics description", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventQueueCreate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Unable to map event queue: (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventQueueCreate_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "unable to make mach memory entry. (%08x)", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __IOHIDEventQueueCreatePrivate_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "Unable to allocate queue object via _CFRuntimeCreateInstance", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventQueueCreateWithVM_cold_1(unsigned int a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 134218240;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "Invalid ptr=%p size=%d.", (uint8_t *)&v3, 0x12u);
}

void IOHIDEventQueueNotify_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "IOHIDEventQueueNotify:%#x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOHIDEventQueueDequeueCopy_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a2, a3, "Unable to create IOHIDEvent with length:%d", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDUserDeviceCreateWithOptions_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "0x%llx: IOHIDResource not found", v2, v3, v4, v5, 0);
  OUTLINED_FUNCTION_3();
}

void IOHIDUserDeviceCreateWithOptions_cold_2()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "0x%llx: __IOHIDUserDeviceStartDevice:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void IOHIDUserDeviceCreateWithOptions_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, a2, a3, "0x%llx: Unable to create analytics description", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_3();
}

void IOHIDUserDeviceCreateWithOptions_cold_4()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "0x%llx: IOServiceOpen:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void IOHIDUserDeviceScheduleWithRunLoop_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void __IOHIDUserDeviceSetupAsyncSupport_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "0x%llx: IOConnectMapMemory:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void IOHIDUserDeviceSetCancelHandler_cold_1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_0();
  __break(1u);
}

void IOHIDUserDeviceRegisterGetReportBlock_cold_1()
{
  _os_crash();
  __break(1u);
}

void IOHIDUserDeviceRegisterSetReportBlock_cold_1()
{
  _os_crash();
  __break(1u);
}

void IOHIDUserDeviceHandleReportWithTimeStamp_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint64_t v2;
  int v3;

  OUTLINED_FUNCTION_7(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "0x%llx: kIOHIDResourceDeviceUserClientMethodHandleReport:%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void __IOMIGMachPortRelease_cold_1(mach_error_t a1, NSObject *a2)
{
  int v3;
  char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = mach_error_string(a1);
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "__IOMIGMachPortRelease mach_port_mod_refs:%s", (uint8_t *)&v3, 0xCu);
}

void _IOHIDCreateBinaryData_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_18AAAF000, a2, OS_LOG_TYPE_ERROR, "Unable to serialize CFObject: %@", (uint8_t *)&v3, 0xCu);
}

void IOHIDServiceFilterCreateWithClass_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDServiceFilterCreateWithClass Failed to initialize filter", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDServiceFilterCreateWithClass_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDServiceFilterCreateWithClass Failed to find HIDServiceFilter protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDServiceFilterCreateWithClass_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IOHIDServiceFilterCreateWithClass class does not conform to HIDServiceFilter protocol", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDServiceFilterCopyPropertyForClient_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "%@ is not serializable. result: %@", (uint8_t *)&v3, 0x16u);
}

void IOHIDServiceClientCopyDescription_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "Failed to get DeviceUsagePairs: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void IOHIDServiceClientCopyDescription_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "Invalid BatchInterval: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void IOHIDServiceClientCopyDescription_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "Invalid SampleInterval: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void IOHIDServiceClientCopyDescription_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "Invalid ReportInterval: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void IOHIDServiceClientCopyDescription_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, a2, a3, "Unable to get serviceID for IOHIDServiceClient: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

void IOHIDServiceClientFastPathInit_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "IORegistryEntryIDMatching:NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDServiceClientFastPathInit_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, a1, a3, "Can not locate kernel service", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDServiceClientFastPathInit_cold_3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a2, a3, "QueryInterface:%x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDServiceClientFastPathInit_cold_4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a2, a3, "IOCreatePlugInInterfaceForService:0x%x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOHIDServiceClientFastPathInit_cold_5(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, a2, a3, "IOServiceGetMatchingServices:0x%x", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_1(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_18AAAF000, v8, v9, "%s: mach_port_deallocate(reply_port):%s", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_8();
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_2(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_18AAAF000, v8, v9, "%s: mach_port_deallocate(unusedNotify):%s", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_8();
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_3(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_18AAAF000, v8, v9, "%s: mach_port_allocate(sendPossiblePort):%s", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_8();
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_4(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_18AAAF000, v8, v9, "%s: mach_port_deallocate(notifyPort):%s", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_8();
}

void _IOHIDEventSystemConnectionReleasePrivate_cold_5(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_18AAAF000, v8, v9, "%s: mach_port_request_notification(MACH_PORT_NULL):%s", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_8();
}

void _IOHIDEventSystemConnectionCreate_cold_1(int a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109376;
  v3[1] = a1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "Unknown client type: %d pid:%d", (uint8_t *)v3, 0xEu);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionCreate_cold_2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_18AAAF000, v0, v1, "%s: %@ is missing the '%s' entitlement");
}

void _IOHIDEventSystemConnectionScheduleAsync_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "%s: Unable to create DISPATCH_SOURCE_TYPE_MACH_SEND for reply port", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void IOHIDEventSystemConnectionDispatchEvent_cold_1()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  os_log_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  int v7;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  v1 = *(_DWORD *)(v0 + 300);
  v4 = 136315394;
  v5 = v2;
  v6 = 1024;
  v7 = v1;
  _os_log_error_impl(&dword_18AAAF000, v3, OS_LOG_TYPE_ERROR, "%s: Event enqueue dropped:%d consecutive events", (uint8_t *)&v4, 0x12u);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionQueueStop_cold_1(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_18AAAF000, v8, v9, "%s: mach_port_deallocate(oldNotify):%s", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_8();
}

void _IOHIDEventSystemConnectionQueueStop_cold_2(int a1, mach_error_t a2, int a3, int a4, int a5, int a6, int a7, int a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  OUTLINED_FUNCTION_2_2(a1, a2, a3, a4, a5, a6, a7, a8, v14, v16, v17, v18);
  OUTLINED_FUNCTION_1_6();
  OUTLINED_FUNCTION_0_4(&dword_18AAAF000, v8, v9, "%s: mach_port_request_notification(notify):%s", v10, v11, v12, v13, v15);
  OUTLINED_FUNCTION_8();
}

void _IOHIDEventSystemConnectionFilterEvent_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "%s: iohideventsystem_client_dispatch_event_filter:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionAddServices_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "%s: iohideventsystem_client_dispatch_notification_results:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionRemoveService_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "%s: iohideventsystem_client_dispatch_service_removal:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionPropertyChanged_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "%s: iohideventsystem_client_dispatch_properties_changed:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionRecordClientChanged_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  const char *v2;
  int v3;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_1_1();
  OUTLINED_FUNCTION_0_1(&dword_18AAAF000, v0, v1, "%s: iohideventsystem_client_dispatch_client_records_changed:0x%x", v2, v3);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionSetProperty_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "%s: Unable to create activity timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void _IOHIDEventSystemConnectionSetProperty_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_1_2(&dword_18AAAF000, v0, v1, "%s: Unable create activity notification", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void __IOHIDServiceVirtualCopyPropertyCallback_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_8_1(*MEMORY[0x1E0C80C00]);
  OUTLINED_FUNCTION_8_0();
  OUTLINED_FUNCTION_9(&dword_18AAAF000, v0, v1, "%s: HIDVS ID:%llx Invalid parameters: key:%@");
}

void __IOHIDServiceVirtualCopyMatchingEventCallback_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18AAAF000, log, OS_LOG_TYPE_ERROR, "Unable to serialize matching data", v1, 2u);
}

void _io_hideventsystem_dispatch_event_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_1(a1);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_5(&dword_18AAAF000, v1, v2, "Error: the client with pid %d is missing the '%s' entitlement.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

void _io_hideventsystem_register_event_filter_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_1(a1);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_5(&dword_18AAAF000, v1, v2, "Error: the client with pid %d is missing the '%s' entitlement.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

void _io_hideventsystem_register_record_client_changed_notification_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  OUTLINED_FUNCTION_3_1(a1);
  OUTLINED_FUNCTION_1_7();
  OUTLINED_FUNCTION_0_5(&dword_18AAAF000, v1, v2, "Error: the client with pid %d is missing the '%s' entitlement.", v3, v4, v5, v6, v7);
  OUTLINED_FUNCTION_8();
}

void __checkFeatureEnabled_block_invoke_2_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create gAssertionConnection\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __checkFeatureEnabled_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create gAssertionConnection\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void initialSetup_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create gAssertionsDict", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void initialSetup_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create gAssertionsDict", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void initialSetup_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Failed to register for reconnect with powerd 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void initialSetup_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Failed to register for reconnect with powerd 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void initialSetup_cold_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "com.apple.powerd.assertionoffloadtimer";
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to register for %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void initialSetup_cold_8(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "com.apple.powerd.assertionoffloadtimer";
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, a1, a3, "Failed to register for %s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void offloadAssertions_cold_1(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  OUTLINED_FUNCTION_4_3(&dword_18AAAF000, MEMORY[0x1E0C81028], (uint64_t)a3, "Not a dictinary for 0x%x", a1);
}

void offloadAssertions_cold_2(uint8_t *a1, uint64_t *a2, _QWORD *a3)
{
  uint64_t v3;

  v3 = *a2;
  *(_DWORD *)a1 = 138412290;
  *a3 = v3;
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, MEMORY[0x1E0C81028], (uint64_t)a3, "Failed to create the remoteID to CF for id %@\n", a1);
}

void offloadAssertions_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "offloadAssertions called with gCurrentRemoteAssertion 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void offloadAssertions_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "offloadAssertions called with gCurrentRemoteAssertion 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void offloadAssertions_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "No current assertion. Sending all activity till now", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void offloadAssertions_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "No current assertion. Sending all activity till now", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void offloadAssertions_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "offloadAssertions fired", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void offloadAssertions_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "offloadAssertions fired", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processRemoteMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Unexpected message from async assertions connections\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processRemoteMsg_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Unexpected message from async assertions connections\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processRemoteMsg_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "powerd released our connection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processRemoteMsg_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "powerd released our connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processRemoteMsg_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Irrecoverable error for assertion creation\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processRemoteMsg_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Irrecoverable error for assertion creation\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void activateAsyncAssertion_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Assertion 0x%x not found to activate", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void activateAsyncAssertion_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Assertion 0x%x not found to activate", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void logAsyncAssertionActivity_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "logAsyncAssertionActivity: unable to find assertion with id 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void logAsyncAssertionActivity_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "logAsyncAssertionActivity: unable to find assertion with id 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void insertIntoTimedList_cold_1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_14(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Setting assertion timeout to fire in %d secs for timeout_ts %llu", v1);
  OUTLINED_FUNCTION_3();
}

void insertIntoTimedList_cold_2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_21();
  OUTLINED_FUNCTION_14(&dword_18AAAF000, v0, (uint64_t)v0, "Setting assertion timeout to fire in %d secs for timeout_ts %llu", v1);
  OUTLINED_FUNCTION_3();
}

void insertIntoTimedList_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Suspending timer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void insertIntoTimedList_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "Suspending timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void createAsyncAssertion_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "createAsyncAssertion: async mode disabled due to SmartPowerNap", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void createAsyncAssertion_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "createAsyncAssertion: async mode disabled due to SmartPowerNap", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __createAsyncAssertion_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Assertion index 0x%x already exists", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __createAsyncAssertion_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Assertion index 0x%x already exists", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __createAsyncAssertion_block_invoke_cold_3(int **a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  _DWORD v5[5];
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = **a1;
  CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict);
  v5[0] = 67109634;
  v5[1] = v3;
  OUTLINED_FUNCTION_19();
  v6 = a2;
  OUTLINED_FUNCTION_17(&dword_18AAAF000, MEMORY[0x1E0C81028], v4, "Async assertion created with 0x%x, length %ld, %@\n", (uint8_t *)v5);
  OUTLINED_FUNCTION_29();
}

void __createAsyncAssertion_block_invoke_cold_4(int **a1, uint64_t a2, NSObject *a3)
{
  int v5;
  uint64_t v6;
  _DWORD v7[5];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = **a1;
  CFDictionaryGetCount((CFDictionaryRef)gActiveAssertionsDict);
  v7[0] = 67109634;
  v7[1] = v5;
  OUTLINED_FUNCTION_19();
  v8 = a2;
  OUTLINED_FUNCTION_17(&dword_18AAAF000, a3, v6, "Async assertion created with 0x%x, length %ld, %@\n", (uint8_t *)v7);
  OUTLINED_FUNCTION_20();
}

void __createAsyncAssertion_block_invoke_cold_5()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_14(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Initial level is off for 0x%x: %@", v1);
  OUTLINED_FUNCTION_3();
}

void __createAsyncAssertion_block_invoke_cold_6()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_22();
  OUTLINED_FUNCTION_14(&dword_18AAAF000, v0, (uint64_t)v0, "Initial level is off for 0x%x: %@", v1);
  OUTLINED_FUNCTION_3();
}

void __createAsyncAssertion_block_invoke_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Setting async client assertion id to 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __createAsyncAssertion_block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_23();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "Setting async client assertion id to 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _releaseAsycnAssertion_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "_releaseAsyncAssertion: Failed to get the assertion details for id:0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void _releaseAsycnAssertion_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "_releaseAsyncAssertion: Failed to get the assertion details for id:0x%x\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _releaseAsycnAssertion_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Releasing assertion locally id 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void _releaseAsycnAssertion_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "Releasing assertion locally id 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _releaseAsycnAssertion_cold_5(int a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5[10];
  int v6;
  __int16 v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = gReleasedAssertionsList;
  CFArrayGetCount((CFArrayRef)gReleasedAssertionsList);
  OUTLINED_FUNCTION_26();
  v6 = a1;
  v7 = 2112;
  v8 = v2;
  v9 = 2048;
  v10 = v3;
  OUTLINED_FUNCTION_25(&dword_18AAAF000, MEMORY[0x1E0C81028], v4, "Released assertion id gCurrentRemoteAssertion: 0x%x: 0x%x.Logging everything to powerd %@ %ld", v5);
  OUTLINED_FUNCTION_29();
}

void _releaseAsycnAssertion_cold_6(int a1, NSObject *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7[10];
  int v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = gReleasedAssertionsList;
  CFArrayGetCount((CFArrayRef)gReleasedAssertionsList);
  OUTLINED_FUNCTION_26();
  v8 = a1;
  v9 = 2112;
  v10 = v4;
  v11 = 2048;
  v12 = v5;
  OUTLINED_FUNCTION_25(&dword_18AAAF000, a2, v6, "Released assertion id gCurrentRemoteAssertion: 0x%x: 0x%x.Logging everything to powerd %@ %ld", v7);
  OUTLINED_FUNCTION_20();
}

void removeFromTimedList_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Removing 0x%x from TimedList", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void removeFromTimedList_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "Removing 0x%x from TimedList", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sendAsyncReleaseMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create xpc msg object\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendAsyncReleaseMsg_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create xpc msg object\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sendAsyncReleaseMsg_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "No connection to powerd", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendAsyncReleaseMsg_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "No connection to powerd", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sendAsyncReleaseMsg_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  CFArrayGetCount((CFArrayRef)gAsyncAssertionActivityLog_1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Logging all %ld activity to powerd\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void sendAsyncReleaseMsg_cold_6(NSObject *a1)
{
  uint64_t v2;
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  CFArrayGetCount((CFArrayRef)gAsyncAssertionActivityLog_1);
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_11_0(&dword_18AAAF000, a1, v2, "Logging all %ld activity to powerd\n", v3);
  OUTLINED_FUNCTION_12();
}

void sendAsyncReleaseMsg_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Sending Assertion release message for assertion Id 0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void sendAsyncReleaseMsg_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "Sending Assertion release message for assertion Id 0x%x\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void setAsyncAssertionProperties_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  __int16 v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109634;
  v3[1] = a3;
  v4 = 2112;
  v5 = a1;
  v6 = 2112;
  v7 = a2;
  OUTLINED_FUNCTION_17(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "setAsyncAssertionProperties for 0x%x %@:%@", (uint8_t *)v3);
  OUTLINED_FUNCTION_12();
}

void __setAsyncAssertionProperties_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "setAsyncAssertionProperties: Failed to get the assertion details for id:0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __setAsyncAssertionProperties_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "setAsyncAssertionProperties: Failed to get the assertion details for id:0x%x\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __setAsyncAssertionProperties_block_invoke_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Unexpected data type in gAssertionsDict for id:0x%x\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __setAsyncAssertionProperties_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_27();
  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Unexpected data type in gAssertionsDict for id:0x%x\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __setAsyncAssertionProperties_block_invoke_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "level_change->true through kIOPMAssertionTimeoutKey write on an inactive assertion.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __setAsyncAssertionProperties_block_invoke_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "level_change->true through kIOPMAssertionTimeoutKey write on an inactive assertion.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __setAsyncAssertionProperties_block_invoke_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "level_change through kIOPMAssertionLevelKey write.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void __setAsyncAssertionProperties_block_invoke_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "level_change through kIOPMAssertionLevelKey write.", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void handleAssertionLevel_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "handleAssertionLevel: unable to find assertion with id 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void handleAssertionLevel_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "handleAssertionLevel: unable to find assertion with id 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void handleAssertionLevel_cold_3(int *a1, uint64_t a2, int a3)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4[0] = 67109634;
  v4[1] = a3;
  v5 = 1024;
  v6 = v3;
  v7 = 2112;
  v8 = a2;
  _os_log_debug_impl(&dword_18AAAF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "handleAssertionLevel for 0x%x to %d: %@", (uint8_t *)v4, 0x18u);
  OUTLINED_FUNCTION_3();
}

void handleAssertionLevel_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "handleAssertionTurnOff: Released assertion id 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void handleAssertionLevel_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "handleAssertionTurnOff: Released assertion id 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void handleAssertionLevel_cold_6()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Assertion 0x%x is neither active nor turned off", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void handleAssertionLevel_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Assertion 0x%x is neither active nor turned off", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to convert CF dictionary to xpc object\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to convert CF dictionary to xpc object\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "sendAsyncAssertionMsg failed: powerd xpc connection interrupted", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "sendAsyncAssertionMsg failed: powerd xpc connection interrupted", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "sendAsyncAssertionMsg failed: powerd xpc connection invalid", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "sendAsyncAssertionMsg failed: powerd xpc connection invalid", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_11(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "No assertion dictionary or logging data to send", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void sendAsyncAssertionMsg_cold_12()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "No assertion dictionary or logging data to send", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processCheckAssertionsMsg_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create xpc reply object\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processCheckAssertionsMsg_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create xpc reply object\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __processCheckAssertionsMsg_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Received processCheckAssertionMsg with active assertion 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void __processCheckAssertionsMsg_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, v0, v1, "Received processCheckAssertionMsg with active assertion 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processAssertionTimeout_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Assertion 0x%x has already been released", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void processAssertionTimeout_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "Assertion 0x%x has already been released", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processAssertionTimeout_cold_3()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "processAssertionTimeout: Removing idx:%d id:0x%x", v1);
  OUTLINED_FUNCTION_3();
}

void processAssertionTimeout_cold_4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0(&dword_18AAAF000, v0, (uint64_t)v0, "processAssertionTimeout: Removing idx:%d id:0x%x", v1);
  OUTLINED_FUNCTION_3();
}

void processAssertionTimeout_cold_5()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "processAssertionTimeout: Turning off assertion idx:%d id:0x%x", v1);
  OUTLINED_FUNCTION_3();
}

void processAssertionTimeout_cold_6()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0(&dword_18AAAF000, v0, (uint64_t)v0, "processAssertionTimeout: Turning off assertion idx:%d id:0x%x", v1);
  OUTLINED_FUNCTION_3();
}

void processAssertionTimeout_cold_7()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "processAssertionTimeout: Not found in gActiveAssertionsDict: 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void processAssertionTimeout_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "processAssertionTimeout: Not found in gActiveAssertionsDict: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processAssertionTimeout_cold_9()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "processAssertionTimeout: Removing from gActiveAssertionsDict: 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void processAssertionTimeout_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "processAssertionTimeout: Removing from gActiveAssertionsDict: 0x%x", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processAssertionTimeout_cold_11()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_28(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Received a release not for gCurrentRemoteAssertion:0x%x. Received 0x%x", v1);
  OUTLINED_FUNCTION_3();
}

void processAssertionUpdateActivity_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "processAssertionUpdateActivity: No gAssertionConnection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processAssertionUpdateActivity_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "processAssertionUpdateActivity: No gAssertionConnection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processAssertionUpdateActivity_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create xpc reply object", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processAssertionUpdateActivity_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create xpc reply object", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processAssertionUpdateActivity_cold_5()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "processAssertionUpdateActivity unread-count %d", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void processAssertionUpdateActivity_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_5_2(&dword_18AAAF000, v0, v1, "processAssertionUpdateActivity unread-count %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processCurrentActiveAssertions_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "processCurrentActiveAssertions: No gAssertionConnection", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void processCurrentActiveAssertions_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "processCurrentActiveAssertions: No gAssertionConnection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void processCurrentActiveAssertions_cold_5(uint8_t *a1, int a2, _DWORD *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a3 = a2;
  OUTLINED_FUNCTION_4_3(&dword_18AAAF000, MEMORY[0x1E0C81028], (uint64_t)a3, "Not a dictianary for 0x%x", a1);
}

void handleAssertionTimeout_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "handleAssertionTimeout: Setting assertion timeout to fire in %llu secs", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void handleAssertionTimeout_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, v0, v1, "handleAssertionTimeout: Setting assertion timeout to fire in %llu secs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void handleAssertionTimeout_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Resuming timer", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void handleAssertionTimeout_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3_2(&dword_18AAAF000, v0, v1, "Resuming timer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void handleAssertionTimeout_cold_7(uint8_t *a1, int *a2, _DWORD *a3)
{
  int v3;

  v3 = *a2;
  *(_DWORD *)a1 = 67109120;
  *a3 = v3;
  OUTLINED_FUNCTION_4_3(&dword_18AAAF000, MEMORY[0x1E0C81028], (uint64_t)a3, "Failed to release assertion 0x%x on timeout", a1);
}

void handleAssertionTimeout_cold_8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "handleAssertionTimeout fired %llu", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

void handleAssertionTimeout_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, v0, v1, "handleAssertionTimeout fired %llu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create connection\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Failed to create dictionary to send message", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create dictionary to send message", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "No assertions by process", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "No assertions by process", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_7(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Received an error in response to IOPMCopyActiveAsyncAssertionsByProcess", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMCopyActiveAsyncAssertionsByProcess_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Received an error in response to IOPMCopyActiveAsyncAssertionsByProcess", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionCreateWithName_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "IOPMAssertionCreateWithName: One of the arguments is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionCreateWithProperties_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "IOPMAssertionCreateWithProperties: One of the arguments types is incorrect", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionCreateWithProperties_cold_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 134217984;
  v4 = collectBackTrace;
  OUTLINED_FUNCTION_1_4(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "IOPMAssertionCreateWithProperties: Failure copying assertion properties. Collect backtrace %llu", (uint8_t *)&v3);
  OUTLINED_FUNCTION_3();
}

void IOPMAssertionCreateWithProperties_cold_3()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "IOPMAssertionCreateWithProperties: io_pm_assertion_create failed with error 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionCreateWithProperties_cold_4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "IOPMAssertionCreateWithProperties: Call to io_pm_assertion_create failed with kernel error 0x%x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionCreateWithProperties_cold_5(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "IOPMAssertionCreateWithProperties: pm connection failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionCreateWithProperties_cold_6(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "IOPMAssertionCreateWithProperties: One of the arguments is NULL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionRetain_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_18AAAF000, MEMORY[0x1E0C81028], a3, "Assertion retain not supported in async mode\n", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionRetain_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Assertion retain not supported in async mode\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void IOPMAssertionSetProcessState_cold_2()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_8_2();
  OUTLINED_FUNCTION_12_0(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Setting Assertion State for PID %d to %d\n", v1);
  OUTLINED_FUNCTION_3();
}

void IOPMCopyAssertionActivityUpdateWithCallback_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0(&dword_18AAAF000, v0, v1, "Failed to create connection\n", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFGregorianDate CFAbsoluteTimeGetGregorianDate(CFAbsoluteTime at, CFTimeZoneRef tz)
{
  uint64_t v2;
  double v3;
  CFGregorianDate result;

  v2 = MEMORY[0x1E0C97C88](tz, at);
  result.second = v3;
  result.year = v2;
  result.month = BYTE4(v2);
  result.day = BYTE5(v2);
  result.hour = BYTE6(v2);
  result.minute = HIBYTE(v2);
  return result;
}

void *__cdecl CFAllocatorAllocate(CFAllocatorRef allocator, CFIndex size, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97C98](allocator, size, hint);
}

CFAllocatorRef CFAllocatorCreate(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CA8](allocator, context);
}

void CFAllocatorDeallocate(CFAllocatorRef allocator, void *ptr)
{
  MEMORY[0x1E0C97CB0](allocator, ptr);
}

void CFAllocatorGetContext(CFAllocatorRef allocator, CFAllocatorContext *context)
{
  MEMORY[0x1E0C97CB8](allocator, context);
}

CFAllocatorRef CFAllocatorGetDefault(void)
{
  return (CFAllocatorRef)MEMORY[0x1E0C97CC0]();
}

void *__cdecl CFAllocatorReallocate(CFAllocatorRef allocator, void *ptr, CFIndex newsize, CFOptionFlags hint)
{
  return (void *)MEMORY[0x1E0C97CD8](allocator, ptr, newsize, hint);
}

void CFArrayAppendArray(CFMutableArrayRef theArray, CFArrayRef otherArray, CFRange otherRange)
{
  MEMORY[0x1E0C97CE8](theArray, otherArray, otherRange.location, otherRange.length);
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

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
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

CFIndex CFArrayGetCountOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x1E0C97D70](theArray, range.location, range.length, value);
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

void CFArrayGetValues(CFArrayRef theArray, CFRange range, const void **values)
{
  MEMORY[0x1E0C97DA8](theArray, range.location, range.length, values);
}

void CFArrayInsertValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DB0](theArray, idx, value);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
  MEMORY[0x1E0C97DB8](theArray);
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
  MEMORY[0x1E0C97DC0](theArray, idx);
}

void CFArrayReplaceValues(CFMutableArrayRef theArray, CFRange range, const void **newValues, CFIndex newCount)
{
  MEMORY[0x1E0C97DC8](theArray, range.location, range.length, newValues, newCount);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x1E0C97DD0](theArray, idx, value);
}

void CFArraySortValues(CFMutableArrayRef theArray, CFRange range, CFComparatorFunction comparator, void *context)
{
  MEMORY[0x1E0C97DE0](theArray, range.location, range.length, comparator, context);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBuiltInPlugInsURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C97FF0](bundle);
}

CFURLRef CFBundleCopyExecutableURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98020](bundle);
}

CFURLRef CFBundleCopyResourceURL(CFBundleRef bundle, CFStringRef resourceName, CFStringRef resourceType, CFStringRef subDirName)
{
  return (CFURLRef)MEMORY[0x1E0C98080](bundle, resourceName, resourceType, subDirName);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFArrayRef CFBundleCreateBundlesFromDirectory(CFAllocatorRef allocator, CFURLRef directoryURL, CFStringRef bundleType)
{
  return (CFArrayRef)MEMORY[0x1E0C980E0](allocator, directoryURL, bundleType);
}

void *__cdecl CFBundleGetDataPointerForName(CFBundleRef bundle, CFStringRef symbolName)
{
  return (void *)MEMORY[0x1E0C980F8](bundle, symbolName);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98130](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFPlugInRef CFBundleGetPlugIn(CFBundleRef bundle)
{
  return (CFPlugInRef)MEMORY[0x1E0C98168](bundle);
}

CFCalendarRef CFCalendarCreateWithIdentifier(CFAllocatorRef allocator, CFCalendarIdentifier identifier)
{
  return (CFCalendarRef)MEMORY[0x1E0C98240](allocator, identifier);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
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

void CFDataIncreaseLength(CFMutableDataRef theData, CFIndex extraLength)
{
  MEMORY[0x1E0C98420](theData, extraLength);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFDateFormatterRef CFDateFormatterCreateISO8601Formatter(CFAllocatorRef allocator, CFISO8601DateFormatOptions formatOptions)
{
  return (CFDateFormatterRef)MEMORY[0x1E0C98480](allocator, formatOptions);
}

CFStringRef CFDateFormatterCreateStringWithDate(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFDateRef date)
{
  return (CFStringRef)MEMORY[0x1E0C98490](allocator, formatter, date);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
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

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1E0C98520](theDict, value);
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

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
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

CFAllocatorRef CFGetAllocator(CFTypeRef cf)
{
  return (CFAllocatorRef)MEMORY[0x1E0C98718](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFMachPortRef CFMachPortCreate(CFAllocatorRef allocator, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98810](allocator, callout, context, shouldFreeInfo);
}

CFRunLoopSourceRef CFMachPortCreateRunLoopSource(CFAllocatorRef allocator, CFMachPortRef port, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98818](allocator, port, order);
}

CFMachPortRef CFMachPortCreateWithPort(CFAllocatorRef allocator, mach_port_t portNum, CFMachPortCallBack callout, CFMachPortContext *context, Boolean *shouldFreeInfo)
{
  return (CFMachPortRef)MEMORY[0x1E0C98820](allocator, *(_QWORD *)&portNum, callout, context, shouldFreeInfo);
}

mach_port_t CFMachPortGetPort(CFMachPortRef port)
{
  return MEMORY[0x1E0C98830](port);
}

void CFMachPortInvalidate(CFMachPortRef port)
{
  MEMORY[0x1E0C98840](port);
}

CFTypeID CFNullGetTypeID(void)
{
  return MEMORY[0x1E0C98908]();
}

CFComparisonResult CFNumberCompare(CFNumberRef number, CFNumberRef otherNumber, void *context)
{
  return MEMORY[0x1E0C98910](number, otherNumber, context);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1E0C98990](number);
}

CFNumberType CFNumberGetType(CFNumberRef number)
{
  return MEMORY[0x1E0C989A8](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

CFPlugInRef CFPlugInCreate(CFAllocatorRef allocator, CFURLRef plugInURL)
{
  return (CFPlugInRef)MEMORY[0x1E0C989E8](allocator, plugInURL);
}

CFArrayRef CFPlugInFindFactoriesForPlugInTypeInPlugIn(CFUUIDRef typeUUID, CFPlugInRef plugIn)
{
  return (CFArrayRef)MEMORY[0x1E0C989F0](typeUUID, plugIn);
}

CFBundleRef CFPlugInGetBundle(CFPlugInRef plugIn)
{
  return (CFBundleRef)MEMORY[0x1E0C98A00](plugIn);
}

void *__cdecl CFPlugInInstanceCreate(CFAllocatorRef allocator, CFUUIDRef factoryUUID, CFUUIDRef typeUUID)
{
  return (void *)MEMORY[0x1E0C98A10](allocator, factoryUUID, typeUUID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98A58](keysToFetch, applicationID, userName, hostName);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFPreferencesSetMultiple(CFDictionaryRef keysToSet, CFArrayRef keysToRemove, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A88](keysToSet, keysToRemove, applicationID, userName, hostName);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x1E0C98A90](key, value, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x1E0C98A98](applicationID, userName, hostName);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

CFPropertyListRef CFPropertyListCreateFromStream(CFAllocatorRef allocator, CFReadStreamRef stream, CFIndex streamLength, CFOptionFlags mutabilityOption, CFPropertyListFormat *format, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AC0](allocator, stream, streamLength, mutabilityOption, format, errorString);
}

CFPropertyListRef CFPropertyListCreateFromXMLData(CFAllocatorRef allocator, CFDataRef xmlData, CFOptionFlags mutabilityOption, CFStringRef *errorString)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AC8](allocator, xmlData, mutabilityOption, errorString);
}

CFPropertyListRef CFPropertyListCreateWithData(CFAllocatorRef allocator, CFDataRef data, CFOptionFlags options, CFPropertyListFormat *format, CFErrorRef *error)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98AD0](allocator, data, options, format, error);
}

CFDataRef CFPropertyListCreateXMLData(CFAllocatorRef allocator, CFPropertyListRef propertyList)
{
  return (CFDataRef)MEMORY[0x1E0C98AE8](allocator, propertyList);
}

CFIndex CFPropertyListWriteToStream(CFPropertyListRef propertyList, CFWriteStreamRef stream, CFPropertyListFormat format, CFStringRef *errorString)
{
  return MEMORY[0x1E0C98B00](propertyList, stream, format, errorString);
}

void CFReadStreamClose(CFReadStreamRef stream)
{
  MEMORY[0x1E0C98B10](stream);
}

CFReadStreamRef CFReadStreamCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex length, CFAllocatorRef bytesDeallocator)
{
  return (CFReadStreamRef)MEMORY[0x1E0C98B38](alloc, bytes, length, bytesDeallocator);
}

Boolean CFReadStreamOpen(CFReadStreamRef stream)
{
  return MEMORY[0x1E0C98B80](stream);
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

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C00](rl, timer, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopRemoveTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98CA0](rl, timer, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceGetContext(CFRunLoopSourceRef source, CFRunLoopSourceContext *context)
{
  MEMORY[0x1E0C98CD0](source, context);
}

CFTypeID CFRunLoopSourceGetTypeID(void)
{
  return MEMORY[0x1E0C98CD8]();
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

CFTypeID CFRunLoopTimerGetTypeID(void)
{
  return MEMORY[0x1E0C98D40]();
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

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x1E0C98D90](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

CFMutableSetRef CFSetCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFSetRef theSet)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98DA0](allocator, capacity, theSet);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x1E0C98DA8](theSet);
}

CFTypeID CFSetGetTypeID(void)
{
  return MEMORY[0x1E0C98DB8]();
}

const void *__cdecl CFSetGetValue(CFSetRef theSet, const void *value)
{
  return (const void *)MEMORY[0x1E0C98DC0](theSet, value);
}

void CFSetGetValues(CFSetRef theSet, const void **values)
{
  MEMORY[0x1E0C98DD0](theSet, values);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
  MEMORY[0x1E0C98DD8](theSet);
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DE0](theSet, value);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x1E0C98DF8](obj);
}

CFRunLoopSourceRef CFSocketCreateRunLoopSource(CFAllocatorRef allocator, CFSocketRef s, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98E18](allocator, s, order);
}

CFSocketRef CFSocketCreateWithNative(CFAllocatorRef allocator, CFSocketNativeHandle sock, CFOptionFlags callBackTypes, CFSocketCallBack callout, const CFSocketContext *context)
{
  return (CFSocketRef)MEMORY[0x1E0C98E20](allocator, *(_QWORD *)&sock, callBackTypes, callout, context);
}

void CFSocketInvalidate(CFSocketRef s)
{
  MEMORY[0x1E0C98E50](s);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendCString(CFMutableStringRef theString, const char *cStr, CFStringEncoding encoding)
{
  MEMORY[0x1E0C98EE0](theString, cStr, *(_QWORD *)&encoding);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

void CFStringAppendFormatAndArguments(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  MEMORY[0x1E0C98EF8](theString, formatOptions, format, arguments);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateByCombiningStrings(CFAllocatorRef alloc, CFArrayRef theArray, CFStringRef separatorString)
{
  return (CFStringRef)MEMORY[0x1E0C98F68](alloc, theArray, separatorString);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFMutableStringRef CFStringCreateMutableCopy(CFAllocatorRef alloc, CFIndex maxLength, CFStringRef theString)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F98](alloc, maxLength, theString);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithCStringNoCopy(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FE0](alloc, cStr, *(_QWORD *)&encoding, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

void CFStringDelete(CFMutableStringRef theString, CFRange range)
{
  MEMORY[0x1E0C99038](theString, range.location, range.length);
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

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99118](length, *(_QWORD *)&encoding);
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

CFTimeZoneRef CFTimeZoneCreateWithTimeIntervalFromGMT(CFAllocatorRef allocator, CFTimeInterval ti)
{
  return (CFTimeZoneRef)MEMORY[0x1E0C99290](allocator, ti);
}

CFURLRef CFURLCopyAbsoluteURL(CFURLRef relativeURL)
{
  return (CFURLRef)MEMORY[0x1E0C992C8](relativeURL);
}

CFStringRef CFURLCopyFileSystemPath(CFURLRef anURL, CFURLPathStyle pathStyle)
{
  return (CFStringRef)MEMORY[0x1E0C992D8](anURL, pathStyle);
}

CFStringRef CFURLCopyLastPathComponent(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C992F8](url);
}

CFStringRef CFURLCopyPathExtension(CFURLRef url)
{
  return (CFStringRef)MEMORY[0x1E0C99320](url);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99380](allocator, url, pathComponent, isDirectory);
}

CFURLRef CFURLCreateCopyDeletingLastPathComponent(CFAllocatorRef allocator, CFURLRef url)
{
  return (CFURLRef)MEMORY[0x1E0C99390](allocator, url);
}

Boolean CFURLCreateDataAndPropertiesFromResource(CFAllocatorRef alloc, CFURLRef url, CFDataRef *resourceData, CFDictionaryRef *properties, CFArrayRef desiredProperties, SInt32 *errorCode)
{
  return MEMORY[0x1E0C993B0](alloc, url, resourceData, properties, desiredProperties, errorCode);
}

CFURLRef CFURLCreateFromFileSystemRepresentation(CFAllocatorRef allocator, const UInt8 *buffer, CFIndex bufLen, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C993C8](allocator, buffer, bufLen, isDirectory);
}

CFTypeRef CFURLCreatePropertyFromResource(CFAllocatorRef alloc, CFURLRef url, CFStringRef property, SInt32 *errorCode)
{
  return (CFTypeRef)MEMORY[0x1E0C993E0](alloc, url, property, errorCode);
}

CFURLRef CFURLCreateWithFileSystemPath(CFAllocatorRef allocator, CFStringRef filePath, CFURLPathStyle pathStyle, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x1E0C99420](allocator, filePath, pathStyle, isDirectory);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFStringRef CFURLGetString(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C994A0](anURL);
}

CFTypeID CFURLGetTypeID(void)
{
  return MEMORY[0x1E0C994B8]();
}

Boolean CFURLHasDirectoryPath(CFURLRef anURL)
{
  return MEMORY[0x1E0C994C0](anURL);
}

Boolean CFURLResourceIsReachable(CFURLRef url, CFErrorRef *error)
{
  return MEMORY[0x1E0C994D0](url, error);
}

Boolean CFURLWriteDataAndPropertiesToResource(CFURLRef url, CFDataRef dataToWrite, CFDictionaryRef propertiesToWrite, SInt32 *errorCode)
{
  return MEMORY[0x1E0C99508](url, dataToWrite, propertiesToWrite, errorCode);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x1E0C99520](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return (CFUUIDRef)MEMORY[0x1E0C99558](alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
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

fat_arch *__cdecl NXFindBestFatArch(cpu_type_t cputype, cpu_subtype_t cpusubtype, fat_arch *fat_archs, uint32_t nfat_archs)
{
  return (fat_arch *)MEMORY[0x1E0C805D8](*(_QWORD *)&cputype, *(_QWORD *)&cpusubtype, fat_archs, *(_QWORD *)&nfat_archs);
}

const NXArchInfo *__cdecl NXGetArchInfoFromCpuType(cpu_type_t cputype, cpu_subtype_t cpusubtype)
{
  return (const NXArchInfo *)MEMORY[0x1E0C805E0](*(_QWORD *)&cputype, *(_QWORD *)&cpusubtype);
}

const NXArchInfo *__cdecl NXGetArchInfoFromName(const char *name)
{
  return (const NXArchInfo *)MEMORY[0x1E0C805E8](name);
}

const NXArchInfo *NXGetLocalArchInfo(void)
{
  return (const NXArchInfo *)MEMORY[0x1E0C805F0]();
}

void *__cdecl OSAtomicDequeue(OSQueueHead *__list, size_t a2)
{
  return (void *)MEMORY[0x1E0C80658](__list, a2);
}

void OSAtomicEnqueue(OSQueueHead *__list, void *__new, size_t a3)
{
  MEMORY[0x1E0C80660](__list, __new, a3);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _CFBundleCopyExecutableURLInDirectory()
{
  return MEMORY[0x1E0C99F78]();
}

uint64_t _CFBundleCopyInfoPlistURL()
{
  return MEMORY[0x1E0C99FA8]();
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x1E0C9A498]();
}

uint64_t _CFRuntimeGetClassWithTypeID()
{
  return MEMORY[0x1E0C9A4A0]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x1E0C9A4B0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x1E0C9A818]();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __memmove_chk()
{
  return MEMORY[0x1E0C80B70]();
}

int __snprintf_chk(char *a1, size_t a2, int a3, size_t a4, const char *a5, ...)
{
  return MEMORY[0x1E0C80BE0](a1, a2, *(_QWORD *)&a3, a4, a5);
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _dispatch_pthread_root_queue_create_with_observer_hooks_4IOHID()
{
  return MEMORY[0x1E0C80D48]();
}

uint64_t _dispatch_workloop_set_observer_hooks_4IOHID()
{
  return MEMORY[0x1E0C80E00]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _os_nospin_lock_trylock()
{
  return MEMORY[0x1E0C81088]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1E0C81090]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

int asl_log(asl_object_t client, asl_object_t msg, int level, const char *format, ...)
{
  return MEMORY[0x1E0C815D0](client, msg, *(_QWORD *)&level, format);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x1E0DE40C8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1E0C816D8](a1);
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x1E0C816F8](*(_QWORD *)&bp, service_name, sp);
}

uint64_t bootstrap_look_up2()
{
  return MEMORY[0x1E0C81710]();
}

uint64_t bootstrap_look_up_per_user()
{
  return MEMORY[0x1E0C81718]();
}

const char *__cdecl bootstrap_strerror(kern_return_t r)
{
  return (const char *)MEMORY[0x1E0C81730](*(_QWORD *)&r);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

BOOL class_respondsToSelector(Class cls, SEL sel)
{
  return MEMORY[0x1E0DE7AF8](cls, sel);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int closedir(DIR *a1)
{
  return MEMORY[0x1E0C82698](a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x1E0C826D8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
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

uint64_t dispatch_mach_create()
{
  return MEMORY[0x1E0C82DC8]();
}

uint64_t dispatch_mach_create_f()
{
  return MEMORY[0x1E0C82DD0]();
}

uint64_t dispatch_mach_msg_get_msg()
{
  return MEMORY[0x1E0C82DE8]();
}

uint64_t dispatch_mig_server()
{
  return MEMORY[0x1E0C82DF8]();
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
}

void *__cdecl dispatch_queue_get_specific(dispatch_queue_t queue, const void *key)
{
  return (void *)MEMORY[0x1E0C82E68](queue, key);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x1E0C82EE0](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x1E0C82EE8](object, finalizer);
}

uint64_t dispatch_set_qos_class_fallback()
{
  return MEMORY[0x1E0C82EF8]();
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_cancel_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F50](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_event_handler_f(dispatch_source_t source, dispatch_function_t handler)
{
  MEMORY[0x1E0C82F60](source, handler);
}

void dispatch_source_set_registration_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F70](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_workloop_t dispatch_workloop_create_inactive(const char *label)
{
  return (dispatch_workloop_t)MEMORY[0x1E0C82FE0](label);
}

uint64_t dispatch_workloop_set_scheduler_priority()
{
  return MEMORY[0x1E0C83010]();
}

int dladdr(const void *a1, Dl_info *a2)
{
  return MEMORY[0x1E0C83028](a1, a2);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t entr_act_begin()
{
  return MEMORY[0x1E0DE57F0]();
}

uint64_t entr_act_end()
{
  return MEMORY[0x1E0DE57F8]();
}

uint64_t entr_act_modify()
{
  return MEMORY[0x1E0DE5800]();
}

int fchmod(int a1, mode_t a2)
{
  return MEMORY[0x1E0C832D0](*(_QWORD *)&a1, a2);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

int fputc(int a1, FILE *a2)
{
  return MEMORY[0x1E0C83488](*(_QWORD *)&a1, a2);
}

int fputs(const char *a1, FILE *a2)
{
  return MEMORY[0x1E0C83490](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x1E0C83560](*(_QWORD *)&a1, a2);
}

int fsync(int a1)
{
  return MEMORY[0x1E0C83578](*(_QWORD *)&a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x1E0C83660](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

int gethostuuid(uuid_t a1, const timespec *a2)
{
  return MEMORY[0x1E0C836C0](a1, a2);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

uid_t getuid(void)
{
  return MEMORY[0x1E0C83828]();
}

tm *__cdecl gmtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83860](a1, a2);
}

int gzclose(gzFile file)
{
  return MEMORY[0x1E0DE9310](file);
}

gzFile gzdopen(int fd, const char *mode)
{
  return (gzFile)MEMORY[0x1E0DE9320](*(_QWORD *)&fd, mode);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x1E0DE9390](file, buf, *(_QWORD *)&len);
}

kern_return_t host_get_io_main(host_t host, io_main_t *io_main)
{
  return MEMORY[0x1E0C838A8](*(_QWORD *)&host, io_main);
}

char *__cdecl index(const char *a1, int a2)
{
  return (char *)MEMORY[0x1E0C83948](a1, *(_QWORD *)&a2);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93D0](strm, version, *(_QWORD *)&stream_size);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x1E0C83980](*(_QWORD *)&a1, a2);
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

kern_return_t kext_request(host_priv_t host_priv, uint32_t user_log_flags, vm_offset_t request_data, mach_msg_type_number_t request_dataCnt, vm_offset_t *response_data, mach_msg_type_number_t *response_dataCnt, vm_offset_t *log_data, mach_msg_type_number_t *log_dataCnt, kern_return_t *op_result)
{
  return MEMORY[0x1E0C83A40](*(_QWORD *)&host_priv, *(_QWORD *)&user_log_flags, request_data, *(_QWORD *)&request_dataCnt, response_data, response_dataCnt, log_data, log_dataCnt);
}

tm *__cdecl localtime_r(const time_t *a1, tm *a2)
{
  return (tm *)MEMORY[0x1E0C83BB0](a1, a2);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

kern_return_t mach_make_memory_entry_64(vm_map_t target_task, memory_object_size_t *size, memory_object_offset_t offset, vm_prot_t permission, mach_port_t *object_handle, mem_entry_name_port_t parent_entry)
{
  return MEMORY[0x1E0C83C98](*(_QWORD *)&target_task, size, offset, *(_QWORD *)&permission, object_handle, *(_QWORD *)&parent_entry);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x1E0C83CB0](msg, *(_QWORD *)&option, *(_QWORD *)&send_size, *(_QWORD *)&rcv_size, *(_QWORD *)&rcv_name, *(_QWORD *)&timeout, *(_QWORD *)&notify);
}

uint64_t mach_msg2_internal()
{
  return MEMORY[0x1E0C83CB8]();
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

kern_return_t mach_port_get_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_urefs_t *refs)
{
  return MEMORY[0x1E0C83D30](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&right, refs);
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

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

kern_return_t mach_vm_deallocate(vm_map_t target, mach_vm_address_t address, mach_vm_size_t size)
{
  return MEMORY[0x1E0C83DD0](*(_QWORD *)&target, address, size);
}

kern_return_t mach_vm_map(vm_map_t target_task, mach_vm_address_t *address, mach_vm_size_t size, mach_vm_offset_t mask, int flags, mem_entry_name_port_t object, memory_object_offset_t offset, BOOLean_t copy, vm_prot_t cur_protection, vm_prot_t max_protection, vm_inherit_t inheritance)
{
  return MEMORY[0x1E0C83DD8](*(_QWORD *)&target_task, address, size, mask, *(_QWORD *)&flags, *(_QWORD *)&object, offset, *(_QWORD *)&copy);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C840E8](*(_QWORD *)&reply_port);
}

uint64_t mig_dealloc_special_reply_port()
{
  return MEMORY[0x1E0C840F0]();
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x1E0C84100]();
}

uint64_t mig_get_special_reply_port()
{
  return MEMORY[0x1E0C84108]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
  MEMORY[0x1E0C84110](*(_QWORD *)&reply_port);
}

void mig_reply_setup(mach_msg_header_t *a1, mach_msg_header_t *a2)
{
  MEMORY[0x1E0C84118](a1, a2);
}

int mig_strncpy(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84120](dest, src, *(_QWORD *)&len);
}

int mig_strncpy_zerofill(char *dest, const char *src, int len)
{
  return MEMORY[0x1E0C84128](dest, src, *(_QWORD *)&len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x1E0C841D8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x1E0C84220](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

BOOL notify_is_valid_token(int val)
{
  return MEMORY[0x1E0C843F0](*(_QWORD *)&val);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_register_mach_port(const char *name, mach_port_t *notify_port, int flags, int *out_token)
{
  return MEMORY[0x1E0C84410](name, notify_port, *(_QWORD *)&flags, out_token);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

Protocol *__cdecl objc_getProtocol(const char *name)
{
  return (Protocol *)MEMORY[0x1E0DE7CD8](name);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x1E0C844C0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int pthread_atfork(void (*a1)(void), void (*a2)(void), void (*a3)(void))
{
  return MEMORY[0x1E0C84CA8](a1, a2, a3);
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_getschedparam(const pthread_attr_t *a1, sched_param *a2)
{
  return MEMORY[0x1E0C84CB8](a1, a2);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_attr_setschedparam(pthread_attr_t *a1, const sched_param *a2)
{
  return MEMORY[0x1E0C84CE8](a1, a2);
}

int pthread_attr_setschedpolicy(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CF0](a1, *(_QWORD *)&a2);
}

int pthread_cond_destroy(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D20](a1);
}

int pthread_cond_init(pthread_cond_t *a1, const pthread_condattr_t *a2)
{
  return MEMORY[0x1E0C84D28](a1, a2);
}

int pthread_cond_signal(pthread_cond_t *a1)
{
  return MEMORY[0x1E0C84D30](a1);
}

int pthread_cond_wait(pthread_cond_t *a1, pthread_mutex_t *a2)
{
  return MEMORY[0x1E0C84D48](a1, a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_getschedparam(pthread_t a1, int *a2, sched_param *a3)
{
  return MEMORY[0x1E0C84DB8](a1, a2, a3);
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_destroy(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E40](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

int pthread_once(pthread_once_t *a1, void (*a2)(void))
{
  return MEMORY[0x1E0C84E68](a1, a2);
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int puts(const char *a1)
{
  return MEMORY[0x1E0C84F60](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x1E0C85008](a1);
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

ssize_t recv(int a1, void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C85060](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void rename(const std::__fs::filesystem::path *__from, const std::__fs::filesystem::path *__to, std::error_code *__ec)
{
  MEMORY[0x1E0C85100](__from, __to, __ec);
}

uint64_t rootless_check_trusted()
{
  return MEMORY[0x1E0C85148]();
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80D0](str);
}

ssize_t send(int a1, const void *a2, size_t a3, int a4)
{
  return MEMORY[0x1E0C852F8](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x1E0C85388](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x1E0C85450](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C85518](__s, *(_QWORD *)&__c);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strftime(char *a1, size_t a2, const char *a3, const tm *a4)
{
  return MEMORY[0x1E0C85558](a1, a2, a3, a4);
}

size_t strlcat(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85568](__dst, __source, __size);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x1E0C85570](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

char *__cdecl strrchr(char *__s, int __c)
{
  return (char *)MEMORY[0x1E0C855E8](__s, *(_QWORD *)&__c);
}

char *__cdecl strsep(char **__stringp, const char *__delim)
{
  return (char *)MEMORY[0x1E0C855F0](__stringp, __delim);
}

char *__cdecl strstr(char *__s1, const char *__s2)
{
  return (char *)MEMORY[0x1E0C85610](__s1, __s2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85698](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

void swap_load_command(load_command *lc, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856E8](lc, *(_QWORD *)&target_byte_order);
}

void swap_mach_header(mach_header *mh, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856F0](mh, *(_QWORD *)&target_byte_order);
}

void swap_mach_header_64(mach_header_64 *mh, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C856F8](mh, *(_QWORD *)&target_byte_order);
}

void swap_segment_command(segment_command *sg, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C85700](sg, *(_QWORD *)&target_byte_order);
}

void swap_segment_command_64(segment_command_64 *sg, NXByteOrder target_byte_order)
{
  MEMORY[0x1E0C85708](sg, *(_QWORD *)&target_byte_order);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void syslog(int a1, const char *a2, ...)
{
  MEMORY[0x1E0C857D0](*(_QWORD *)&a1, a2);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x1E0C85828](*(_QWORD *)&task, *(_QWORD *)&which_port, special_port);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1E0C85848](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}

mode_t umask(mode_t a1)
{
  return MEMORY[0x1E0C85998](a1);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

int utimes(const char *a1, const timeval *a2)
{
  return MEMORY[0x1E0C859F8](a1, a2);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

int vasprintf(char **a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A58](a1, a2, a3);
}

int vfprintf(FILE *a1, const char *a2, va_list a3)
{
  return MEMORY[0x1E0C85A68](a1, a2, a3);
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

void warnx(const char *a1, ...)
{
  MEMORY[0x1E0C85BE0](a1);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

uint64_t xpc_copy_entitlement_for_token()
{
  return MEMORY[0x1E0C86120]();
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86218]();
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

int xpc_dictionary_dup_fd(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86230](xdict, key);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

