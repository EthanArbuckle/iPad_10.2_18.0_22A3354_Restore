void _removalCallback(uint64_t a1, uint64_t a2, char *a3)
{
  int *v3;
  uint64_t v4;
  void (*v5)(uint64_t);
  char *v6;

  v3 = (int *)MEMORY[0x1E0CBBA40];
  v4 = *(_QWORD *)&a3[*MEMORY[0x1E0CBBA40] + 112];
  if (v4)
  {
    v5 = *(void (**)(uint64_t))(v4 + 16);
    v6 = a3;
    v5(v4);
    _Block_release(*(const void **)&v6[*v3 + 112]);
    *(_QWORD *)&v6[*v3 + 112] = 0;

  }
}

uint64_t __HIDVirtualServiceCopyEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v9 = a1;
  objc_msgSend(v9, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, CFSTR("EventType"));

    objc_msgSend(v11, "setObject:forKeyedSubscript:", a5, CFSTR("MatchingEvent"));
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v13, CFSTR("MatchingEventOptions"));

    v14 = objc_msgSend(v10, "copyEventMatching:forService:", v11, v9);
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __HIDVirtualServiceNotifyCallback(void *a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5)
{
  void *v7;
  void *v8;
  id v9;

  v9 = a1;
  objc_msgSend(v9, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && (a4 - 3) <= 2)
    objc_msgSend(v7, "notification:withProperty:forService:", qword_1D3232CA0[a4 - 3], a5, v9);

}

void sub_1D322A908(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __HIDVirtualServiceSetPropertyCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v7 = a1;
  objc_msgSend(v7, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
    v10 = objc_msgSend(v8, "setProperty:forKey:forService:", a5, a4, v7);
  else
    v10 = 0;

  return v10;
}

uint64_t __HIDVirtualServiceCopyPropertyCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "propertyForKey:forService:", a4, v5);
    v8 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t _eventCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
}

uint64_t _serviceCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __HIDVirtualServiceSetOutputEvent(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    if (objc_msgSend(v6, "setOutputEvent:forService:", a4, v5))
      v8 = 0;
    else
      v8 = 3758097084;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t __HIDVirtualServiceClientCopyMatchingEventCallback(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "copyEventMatching:forService:", a4, v5);
  else
    v8 = 0;

  return v8;
}

uint64_t OUTLINED_FUNCTION_0()
{
  return _os_log_send_and_compose_impl();
}

BOOL OUTLINED_FUNCTION_1()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void inputValueCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  _QWORD *v6;
  uint64_t v7;
  id v8;

  v6 = a1;
  IOHIDValueGetElement(a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValueRef:", a4);
  v7 = v6[2];

  (*(void (**)(uint64_t, uint64_t, id))(v7 + 16))(v7, a3, v8);
}

uint64_t deviceAddedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
}

uint64_t deviceRemovedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
}

void inputReportCallback(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  objc_class *v14;
  _QWORD *v15;
  uint64_t v16;
  id v17;

  v14 = (objc_class *)MEMORY[0x1E0C99D50];
  v15 = a1;
  v17 = (id)objc_msgSend([v14 alloc], "initWithBytesNoCopy:length:freeWhenDone:", a6, a7, 0);
  v16 = v15[4];

  (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD, _QWORD, id))(v16 + 16))(v16, a3, a8, a4, a5, v17);
}

double OUTLINED_FUNCTION_2(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return _os_crash_msg();
}

void asyncReportCallback(const void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int a5, uint64_t a6, uint64_t a7)
{
  void (**v12)(id, uint64_t, uint64_t, uint64_t, _QWORD);

  v12 = (void (**)(id, uint64_t, uint64_t, uint64_t, _QWORD))_Block_copy(a1);
  v12[2](v12, a2, a6, a7, a5);
  _Block_release(a1);

}

void inputValueCallback_0(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  void *v5;
  unint64_t v7;
  char *v8;

  v8 = a1;
  IOHIDValueGetElement(a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValueRef:", a4);
  if (atomic_load((unint64_t *)&v8[*MEMORY[0x1E0CBBA30] + 312]))
  {
    v7 = atomic_load((unint64_t *)&v8[*MEMORY[0x1E0CBBA30] + 312]);
    (*(void (**)(unint64_t, void *))(v7 + 16))(v7, v5);
  }

}

void batchInputValueCallback(void *a1, uint64_t a2, uint64_t a3, __IOHIDValue *a4)
{
  void *v5;
  int *v6;
  id v7;
  unint64_t v9;
  char *v10;

  v10 = a1;
  IOHIDValueGetElement(a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setValueRef:", a4);
  v6 = (int *)MEMORY[0x1E0CBBA30];
  os_unfair_recursive_lock_lock_with_options();
  v7 = *(id *)&v10[*v6 + 280];
  if (objc_msgSend(v5, "type") == 5)
  {
    if (atomic_load((unint64_t *)&v10[*v6 + 312]))
    {
      v9 = atomic_load((unint64_t *)&v10[*v6 + 312]);
      (*(void (**)(unint64_t, id))(v9 + 16))(v9, v7);
    }
    objc_msgSend(v7, "removeAllObjects");
  }
  else
  {
    objc_msgSend(v7, "addObject:", v5);
  }
  os_unfair_recursive_lock_unlock();

}

void removalCallback(char *a1)
{
  int *v1;
  unint64_t v3;
  void (*v4)(unint64_t);
  const void *v5;
  char *v6;
  char *v7;

  v1 = (int *)MEMORY[0x1E0CBBA30];
  if (atomic_load((unint64_t *)&a1[*MEMORY[0x1E0CBBA30] + 320]))
  {
    v3 = atomic_load((unint64_t *)&a1[*MEMORY[0x1E0CBBA30] + 320]);
    v4 = *(void (**)(unint64_t))(v3 + 16);
    v7 = a1;
    v4(v3);
    v5 = (const void *)atomic_load((unint64_t *)&v7[*v1 + 320]);
    _Block_release(v5);
    v6 = v7;
    atomic_store(0, (unint64_t *)&v7[*v1 + 320]);

  }
}

void inputReportCallback_0(void *a1, uint64_t a2, uint64_t a3, unsigned int a4, unsigned int a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  void *v14;
  unint64_t v16;
  char *v17;

  v17 = a1;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D50]), "initWithBytesNoCopy:length:freeWhenDone:", a6, a7, 0);
  if (atomic_load((unint64_t *)&v17[*MEMORY[0x1E0CBBA30] + 328]))
  {
    v16 = atomic_load((unint64_t *)&v17[*MEMORY[0x1E0CBBA30] + 328]);
    (*(void (**)(unint64_t, uint64_t, uint64_t, _QWORD, _QWORD, void *))(v16 + 16))(v16, a3, a8, a4, a5, v14);
  }

}

uint64_t _resetCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
}

uint64_t _eventFilterCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t _propertiesChangedCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

void asyncCommitCallback(const void *a1, uint64_t a2)
{
  void (**v4)(id, _QWORD);

  v4 = (void (**)(id, _QWORD))_Block_copy(a1);
  v4[2](v4, a2);
  _Block_release(a1);

}

uint64_t getReportCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v8 = *a5;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 16) + 16))();
  v7 = *a5;
  if (*a5 >= v8)
    v7 = v8;
  *a5 = v7;
  return result;
}

uint64_t setReportCallback(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 24) + 16))();
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

void IOHIDDeviceActivate(IOHIDDeviceRef device)
{
  MEMORY[0x1E0CBAE50](device);
}

void IOHIDDeviceCancel(IOHIDDeviceRef device)
{
  MEMORY[0x1E0CBAE58](device);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAE60](device, *(_QWORD *)&options);
}

Boolean IOHIDDeviceConformsTo(IOHIDDeviceRef device, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x1E0CBAE68](device, *(_QWORD *)&usagePage, *(_QWORD *)&usage);
}

CFArrayRef IOHIDDeviceCopyMatchingElements(IOHIDDeviceRef device, CFDictionaryRef matching, IOOptionBits options)
{
  return (CFArrayRef)MEMORY[0x1E0CBAE70](device, matching, *(_QWORD *)&options);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x1E0CBAE78](allocator, *(_QWORD *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBAE88](device, key);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x1E0CBAE90](device, *(_QWORD *)&reportType, reportID, report, pReportLength);
}

IOReturn IOHIDDeviceGetReportWithCallback(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x1E0CBAE98](device, *(_QWORD *)&reportType, reportID, report, pReportLength, callback, context, timeout);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return MEMORY[0x1E0CBAEA0](device);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAEB8](device, *(_QWORD *)&options);
}

void IOHIDDeviceRegisterInputReportWithTimeStampCallback(IOHIDDeviceRef device, uint8_t *report, CFIndex reportLength, IOHIDReportWithTimeStampCallback callback, void *context)
{
  MEMORY[0x1E0CBAEC8](device, report, reportLength, callback, context);
}

void IOHIDDeviceRegisterInputValueCallback(IOHIDDeviceRef device, IOHIDValueCallback callback, void *context)
{
  MEMORY[0x1E0CBAED0](device, callback, context);
}

void IOHIDDeviceRegisterRemovalCallback(IOHIDDeviceRef device, IOHIDCallback callback, void *context)
{
  MEMORY[0x1E0CBAED8](device, callback, context);
}

void IOHIDDeviceSetCancelHandler(IOHIDDeviceRef device, dispatch_block_t handler)
{
  MEMORY[0x1E0CBAEE8](device, handler);
}

void IOHIDDeviceSetDispatchQueue(IOHIDDeviceRef device, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBAEF0](device, queue);
}

void IOHIDDeviceSetInputValueMatching(IOHIDDeviceRef device, CFDictionaryRef matching)
{
  MEMORY[0x1E0CBAEF8](device, matching);
}

void IOHIDDeviceSetInputValueMatchingMultiple(IOHIDDeviceRef device, CFArrayRef multiple)
{
  MEMORY[0x1E0CBAF00](device, multiple);
}

Boolean IOHIDDeviceSetProperty(IOHIDDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1E0CBAF08](device, key, property);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1E0CBAF10](device, *(_QWORD *)&reportType, reportID, report, reportLength);
}

IOReturn IOHIDDeviceSetReportWithCallback(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength, CFTimeInterval timeout, IOHIDReportCallback callback, void *context)
{
  return MEMORY[0x1E0CBAF20](device, *(_QWORD *)&reportType, reportID, report, reportLength, callback, context, timeout);
}

CFArrayRef IOHIDElementGetChildren(IOHIDElementRef element)
{
  return (CFArrayRef)MEMORY[0x1E0CBAF30](element);
}

IOHIDElementCookie IOHIDElementGetCookie(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF40](element);
}

CFIndex IOHIDElementGetLogicalMax(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF50](element);
}

CFIndex IOHIDElementGetLogicalMin(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF58](element);
}

IOHIDElementRef IOHIDElementGetParent(IOHIDElementRef element)
{
  return (IOHIDElementRef)MEMORY[0x1E0CBAF68](element);
}

CFIndex IOHIDElementGetPhysicalMax(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF70](element);
}

CFIndex IOHIDElementGetPhysicalMin(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF78](element);
}

uint32_t IOHIDElementGetReportID(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF90](element);
}

uint32_t IOHIDElementGetReportSize(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAF98](element);
}

IOHIDElementType IOHIDElementGetType(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFA0](element);
}

uint32_t IOHIDElementGetUnit(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFB0](element);
}

uint32_t IOHIDElementGetUnitExponent(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFB8](element);
}

uint32_t IOHIDElementGetUsage(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFC0](element);
}

uint32_t IOHIDElementGetUsagePage(IOHIDElementRef element)
{
  return MEMORY[0x1E0CBAFC8](element);
}

uint64_t IOHIDEventAppendEvent()
{
  return MEMORY[0x1E0CBB008]();
}

uint64_t IOHIDEventConformsTo()
{
  return MEMORY[0x1E0CBB010]();
}

uint64_t IOHIDEventCreate()
{
  return MEMORY[0x1E0CBB018]();
}

uint64_t IOHIDEventCreateCopy()
{
  return MEMORY[0x1E0CBB030]();
}

uint64_t IOHIDEventCreateData()
{
  return MEMORY[0x1E0CBB038]();
}

uint64_t IOHIDEventCreateWithBytes()
{
  return MEMORY[0x1E0CBB0D8]();
}

uint64_t IOHIDEventCreateWithData()
{
  return MEMORY[0x1E0CBB0E0]();
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1E0CBB0F8]();
}

uint64_t IOHIDEventGetDataValue()
{
  return MEMORY[0x1E0CBB100]();
}

uint64_t IOHIDEventGetDoubleValue()
{
  return MEMORY[0x1E0CBB108]();
}

uint64_t IOHIDEventGetEventFlags()
{
  return MEMORY[0x1E0CBB118]();
}

uint64_t IOHIDEventGetFloatValue()
{
  return MEMORY[0x1E0CBB128]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetParent()
{
  return MEMORY[0x1E0CBB140]();
}

uint64_t IOHIDEventGetSenderID()
{
  return MEMORY[0x1E0CBB150]();
}

uint64_t IOHIDEventGetTimeStamp()
{
  return MEMORY[0x1E0CBB158]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventRemoveEvent()
{
  return MEMORY[0x1E0CBB188]();
}

uint64_t IOHIDEventSetDoubleValue()
{
  return MEMORY[0x1E0CBB198]();
}

uint64_t IOHIDEventSetEventFlags()
{
  return MEMORY[0x1E0CBB1A0]();
}

uint64_t IOHIDEventSetFloatValue()
{
  return MEMORY[0x1E0CBB1A8]();
}

uint64_t IOHIDEventSetIntegerValue()
{
  return MEMORY[0x1E0CBB1B0]();
}

uint64_t IOHIDEventSetSenderID()
{
  return MEMORY[0x1E0CBB1C0]();
}

uint64_t IOHIDEventSetTimeStamp()
{
  return MEMORY[0x1E0CBB1C8]();
}

uint64_t IOHIDEventSystemClientActivate()
{
  return MEMORY[0x1E0CBB1D0]();
}

uint64_t IOHIDEventSystemClientCancel()
{
  return MEMORY[0x1E0CBB1D8]();
}

CFTypeRef IOHIDEventSystemClientCopyProperty(IOHIDEventSystemClientRef client, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB1E0](client, key);
}

CFArrayRef IOHIDEventSystemClientCopyServices(IOHIDEventSystemClientRef client)
{
  return (CFArrayRef)MEMORY[0x1E0CBB1E8](client);
}

uint64_t IOHIDEventSystemClientCreateWithType()
{
  return MEMORY[0x1E0CBB1F8]();
}

uint64_t IOHIDEventSystemClientRegisterDeviceMatchingCallback()
{
  return MEMORY[0x1E0CBB210]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1E0CBB220]();
}

uint64_t IOHIDEventSystemClientRegisterEventFilterCallback()
{
  return MEMORY[0x1E0CBB228]();
}

uint64_t IOHIDEventSystemClientRegisterPropertyChangedCallback()
{
  return MEMORY[0x1E0CBB238]();
}

uint64_t IOHIDEventSystemClientRegisterResetCallback()
{
  return MEMORY[0x1E0CBB240]();
}

uint64_t IOHIDEventSystemClientSetCancelHandler()
{
  return MEMORY[0x1E0CBB258]();
}

uint64_t IOHIDEventSystemClientSetDispatchQueue()
{
  return MEMORY[0x1E0CBB260]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1E0CBB268]();
}

uint64_t IOHIDEventSystemClientSetMatchingMultiple()
{
  return MEMORY[0x1E0CBB270]();
}

Boolean IOHIDEventSystemClientSetProperty(IOHIDEventSystemClientRef client, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1E0CBB278](client, key, property);
}

uint64_t IOHIDEventSystemConnectionGetAuditToken()
{
  return MEMORY[0x1E0CBB2D8]();
}

uint64_t IOHIDEventSystemConnectionGetUUID()
{
  return MEMORY[0x1E0CBB2E8]();
}

void IOHIDManagerActivate(IOHIDManagerRef manager)
{
  MEMORY[0x1E0CBB368](manager);
}

void IOHIDManagerCancel(IOHIDManagerRef manager)
{
  MEMORY[0x1E0CBB370](manager);
}

IOReturn IOHIDManagerClose(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1E0CBB380](manager, *(_QWORD *)&options);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1E0CBB388](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1E0CBB3A0](allocator, *(_QWORD *)&options);
}

CFTypeRef IOHIDManagerGetProperty(IOHIDManagerRef manager, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB3A8](manager, key);
}

IOReturn IOHIDManagerOpen(IOHIDManagerRef manager, IOOptionBits options)
{
  return MEMORY[0x1E0CBB3B8](manager, *(_QWORD *)&options);
}

void IOHIDManagerRegisterDeviceMatchingCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x1E0CBB3C0](manager, callback, context);
}

void IOHIDManagerRegisterDeviceRemovalCallback(IOHIDManagerRef manager, IOHIDDeviceCallback callback, void *context)
{
  MEMORY[0x1E0CBB3C8](manager, callback, context);
}

void IOHIDManagerRegisterInputReportWithTimeStampCallback(IOHIDManagerRef manager, IOHIDReportWithTimeStampCallback callback, void *context)
{
  MEMORY[0x1E0CBB3D0](manager, callback, context);
}

void IOHIDManagerRegisterInputValueCallback(IOHIDManagerRef manager, IOHIDValueCallback callback, void *context)
{
  MEMORY[0x1E0CBB3D8](manager, callback, context);
}

void IOHIDManagerSetCancelHandler(IOHIDManagerRef manager, dispatch_block_t handler)
{
  MEMORY[0x1E0CBB3E8](manager, handler);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
  MEMORY[0x1E0CBB3F0](manager, matching);
}

void IOHIDManagerSetDeviceMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
  MEMORY[0x1E0CBB3F8](manager, multiple);
}

void IOHIDManagerSetDispatchQueue(IOHIDManagerRef manager, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB408](manager, queue);
}

void IOHIDManagerSetInputValueMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
  MEMORY[0x1E0CBB410](manager, matching);
}

void IOHIDManagerSetInputValueMatchingMultiple(IOHIDManagerRef manager, CFArrayRef multiple)
{
  MEMORY[0x1E0CBB418](manager, multiple);
}

Boolean IOHIDManagerSetProperty(IOHIDManagerRef manager, CFStringRef key, CFTypeRef value)
{
  return MEMORY[0x1E0CBB420](manager, key, value);
}

BOOLean_t IOHIDServiceClientConformsTo(IOHIDServiceClientRef service, uint32_t usagePage, uint32_t usage)
{
  return MEMORY[0x1E0CBB490](service, *(_QWORD *)&usagePage, *(_QWORD *)&usage);
}

uint64_t IOHIDServiceClientCopyMatchingEvent()
{
  return MEMORY[0x1E0CBB4A0]();
}

uint64_t IOHIDServiceClientCopyProperties()
{
  return MEMORY[0x1E0CBB4A8]();
}

CFTypeRef IOHIDServiceClientCopyProperty(IOHIDServiceClientRef service, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4B0](service, key);
}

CFTypeRef IOHIDServiceClientGetRegistryID(IOHIDServiceClientRef service)
{
  return (CFTypeRef)MEMORY[0x1E0CBB4D0](service);
}

uint64_t IOHIDServiceClientRegisterRemovalCallback()
{
  return MEMORY[0x1E0CBB4E8]();
}

Boolean IOHIDServiceClientSetProperty(IOHIDServiceClientRef service, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1E0CBB4F0](service, key, property);
}

uint64_t IOHIDServiceConformsTo()
{
  return MEMORY[0x1E0CBB4F8]();
}

uint64_t IOHIDServiceCopyMatchingEvent()
{
  return MEMORY[0x1E0CBB500]();
}

uint64_t IOHIDServiceCopyProperty()
{
  return MEMORY[0x1E0CBB508]();
}

uint64_t IOHIDServiceGetRegistryID()
{
  return MEMORY[0x1E0CBB528]();
}

uint64_t IOHIDServiceSetProperty()
{
  return MEMORY[0x1E0CBB540]();
}

uint64_t IOHIDSessionGetProperty()
{
  return MEMORY[0x1E0CBB548]();
}

uint64_t IOHIDSessionSetProperty()
{
  return MEMORY[0x1E0CBB550]();
}

void IOHIDTransactionAddElement(IOHIDTransactionRef transaction, IOHIDElementRef element)
{
  MEMORY[0x1E0CBB558](transaction, element);
}

void IOHIDTransactionClear(IOHIDTransactionRef transaction)
{
  MEMORY[0x1E0CBB560](transaction);
}

IOReturn IOHIDTransactionCommit(IOHIDTransactionRef transaction)
{
  return MEMORY[0x1E0CBB568](transaction);
}

IOReturn IOHIDTransactionCommitWithCallback(IOHIDTransactionRef transaction, CFTimeInterval timeout, IOHIDCallback callback, void *context)
{
  return MEMORY[0x1E0CBB570](transaction, callback, context, timeout);
}

IOHIDTransactionRef IOHIDTransactionCreate(CFAllocatorRef allocator, IOHIDDeviceRef device, IOHIDTransactionDirectionType direction, IOOptionBits options)
{
  return (IOHIDTransactionRef)MEMORY[0x1E0CBB578](allocator, device, *(_QWORD *)&direction, *(_QWORD *)&options);
}

IOHIDTransactionDirectionType IOHIDTransactionGetDirection(IOHIDTransactionRef transaction)
{
  return MEMORY[0x1E0CBB580](transaction);
}

void IOHIDTransactionSetDirection(IOHIDTransactionRef transaction, IOHIDTransactionDirectionType direction)
{
  MEMORY[0x1E0CBB590](transaction, *(_QWORD *)&direction);
}

void IOHIDUserDeviceActivate(IOHIDUserDeviceRef device)
{
  MEMORY[0x1E0CBB5A0](device);
}

void IOHIDUserDeviceCancel(IOHIDUserDeviceRef device)
{
  MEMORY[0x1E0CBB5A8](device);
}

CFTypeRef IOHIDUserDeviceCopyProperty(IOHIDUserDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0CBB5B0](device, key);
}

uint64_t IOHIDUserDeviceCopyService()
{
  return MEMORY[0x1E0CBB5B8]();
}

uint64_t IOHIDUserDeviceCreateWithOptions()
{
  return MEMORY[0x1E0CBB5C8]();
}

uint64_t IOHIDUserDeviceHandleReport()
{
  return MEMORY[0x1E0CBB5D0]();
}

IOReturn IOHIDUserDeviceHandleReportWithTimeStamp(IOHIDUserDeviceRef device, uint64_t timestamp, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1E0CBB5D8](device, timestamp, report, reportLength);
}

uint64_t IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback()
{
  return MEMORY[0x1E0CBB5E0]();
}

uint64_t IOHIDUserDeviceRegisterSetReportCallback()
{
  return MEMORY[0x1E0CBB5E8]();
}

void IOHIDUserDeviceSetCancelHandler(IOHIDUserDeviceRef device, dispatch_block_t handler)
{
  MEMORY[0x1E0CBB5F0](device, handler);
}

void IOHIDUserDeviceSetDispatchQueue(IOHIDUserDeviceRef device, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB5F8](device, queue);
}

Boolean IOHIDUserDeviceSetProperty(IOHIDUserDeviceRef device, CFStringRef key, CFTypeRef property)
{
  return MEMORY[0x1E0CBB600](device, key, property);
}

IOHIDValueRef IOHIDValueCreateWithBytes(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, const uint8_t *bytes, CFIndex length)
{
  return (IOHIDValueRef)MEMORY[0x1E0CBB608](allocator, element, timeStamp, bytes, length);
}

IOHIDValueRef IOHIDValueCreateWithIntegerValue(CFAllocatorRef allocator, IOHIDElementRef element, uint64_t timeStamp, CFIndex value)
{
  return (IOHIDValueRef)MEMORY[0x1E0CBB610](allocator, element, timeStamp, value);
}

const uint8_t *__cdecl IOHIDValueGetBytePtr(IOHIDValueRef value)
{
  return (const uint8_t *)MEMORY[0x1E0CBB618](value);
}

IOHIDElementRef IOHIDValueGetElement(IOHIDValueRef value)
{
  return (IOHIDElementRef)MEMORY[0x1E0CBB620](value);
}

CFIndex IOHIDValueGetIntegerValue(IOHIDValueRef value)
{
  return MEMORY[0x1E0CBB628](value);
}

CFIndex IOHIDValueGetLength(IOHIDValueRef value)
{
  return MEMORY[0x1E0CBB630](value);
}

double_t IOHIDValueGetScaledValue(IOHIDValueRef value, IOHIDValueScaleType type)
{
  double_t result;

  MEMORY[0x1E0CBB638](value, *(_QWORD *)&type);
  return result;
}

uint64_t IOHIDValueGetTimeStamp(IOHIDValueRef value)
{
  return MEMORY[0x1E0CBB640](value);
}

uint64_t IOHIDVirtualServiceClientCreateWithCallbacks()
{
  return MEMORY[0x1E0CBB648]();
}

uint64_t IOHIDVirtualServiceClientDispatchEvent()
{
  return MEMORY[0x1E0CBB650]();
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _IOHIDElementGetValue()
{
  return MEMORY[0x1E0CBBA60]();
}

uint64_t _IOHIDElementSetValue()
{
  return MEMORY[0x1E0CBBA68]();
}

uint64_t _IOHIDEventCreate()
{
  return MEMORY[0x1E0CBBA78]();
}

uint64_t _IOHIDEventEqual()
{
  return MEMORY[0x1E0CBBA80]();
}

uint64_t _IOHIDServiceDispatchEvent()
{
  return MEMORY[0x1E0CBBA98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
}

uint64_t _os_crash_msg()
{
  return MEMORY[0x1E0C81008]();
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

