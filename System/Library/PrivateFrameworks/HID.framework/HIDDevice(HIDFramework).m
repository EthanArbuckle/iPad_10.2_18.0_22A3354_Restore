@implementation HIDDevice(HIDFramework)

- (IOHIDDeviceRef)initWithService:()HIDFramework
{
  IOHIDDeviceRef v4;

  v4 = IOHIDDeviceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], service);

  return v4;
}

- (CFTypeRef)propertyForKey:()HIDFramework
{
  return IOHIDDeviceGetProperty(a1, key);
}

- (BOOL)setProperty:()HIDFramework forKey:
{
  return IOHIDDeviceSetProperty(a1, key, a3) != 0;
}

- (BOOL)conformsToUsagePage:()HIDFramework usage:
{
  return IOHIDDeviceConformsTo(a1, usagePage, usage) != 0;
}

- (CFArrayRef)elementsMatching:()HIDFramework
{
  return IOHIDDeviceCopyMatchingElements(a1, matching, 0);
}

- (uint64_t)setReport:()HIDFramework reportLength:withIdentifier:forType:error:
{
  return objc_msgSend(a1, "setReport:reportLength:withIdentifier:forType:error:timeout:callback:", a3, a4, a5, a6, a7, 0, 0);
}

- (BOOL)setReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:
{
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  int v20;

  v16 = a9;
  v17 = v16;
  if (v16)
  {
    v18 = _Block_copy(v16);
    v19 = IOHIDDeviceSetReportWithCallback(a1, a6, a5, a3, a4, (double)a8, (IOHIDReportCallback)asyncReportCallback, v18);
  }
  else
  {
    v19 = IOHIDDeviceSetReport(a1, a6, a5, a3, a4);
  }
  v20 = v19;
  if (a7)
  {
    if ((_DWORD)v19)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithIOReturn:", v19);
      *a7 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
        _Block_release(v17);
    }
  }

  return v20 == 0;
}

- (uint64_t)getReport:()HIDFramework reportLength:withIdentifier:forType:error:
{
  return objc_msgSend(a1, "getReport:reportLength:withIdentifier:forType:error:timeout:callback:", a3, a4, a5, a6, a7, 0, 0);
}

- (BOOL)getReport:()HIDFramework reportLength:withIdentifier:forType:error:timeout:callback:
{
  id v16;
  void *v17;
  void *v18;
  uint64_t ReportWithCallback;
  CFIndex pReportLength;

  v16 = a9;
  v17 = v16;
  pReportLength = *a4;
  if (v16)
  {
    v18 = _Block_copy(v16);
    ReportWithCallback = IOHIDDeviceGetReportWithCallback(a1, a6, a5, a3, &pReportLength, (double)a8, (IOHIDReportCallback)asyncReportCallback, v18);
    if (!a7)
      goto LABEL_8;
  }
  else
  {
    ReportWithCallback = IOHIDDeviceGetReport(a1, a6, a5, a3, &pReportLength);
    *a4 = pReportLength;
    if (!a7)
      goto LABEL_8;
  }
  if ((_DWORD)ReportWithCallback)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithIOReturn:", ReportWithCallback);
    *a7 = (id)objc_claimAutoreleasedReturnValue();
    if (v17)
      _Block_release(v17);
  }
LABEL_8:

  return (_DWORD)ReportWithCallback == 0;
}

- (uint64_t)commitElements:()HIDFramework direction:error:
{
  return objc_msgSend(a1, "commitElements:direction:error:timeout:callback:", a3, a4, a5, 0, 0);
}

- (uint64_t)commitElements:()HIDFramework direction:error:timeout:callback:
{
  id v12;
  id v13;
  uint64_t v14;
  HIDTransaction *v15;
  HIDTransaction *v16;
  uint64_t v17;
  uint64_t v18;

  v12 = a3;
  v13 = a7;
  v14 = a1 + (int)*MEMORY[0x1E0CBBA30];
  os_unfair_recursive_lock_lock_with_options();
  v15 = *(HIDTransaction **)(v14 + 256);
  if (!v15)
  {
    v15 = -[HIDTransaction initWithDevice:]([HIDTransaction alloc], "initWithDevice:", a1);
    *(_QWORD *)(v14 + 256) = v15;
  }
  v16 = v15;
  -[HIDTransaction setDirection:](v16, "setDirection:", a4 != 0);
  if (v13)
    v17 = -[HIDTransaction commitElements:error:timeout:callback:](v16, "commitElements:error:timeout:callback:", v12, a5, a6, v13);
  else
    v17 = -[HIDTransaction commitElements:error:](v16, "commitElements:error:", v12, a5);
  v18 = v17;
  os_unfair_recursive_lock_unlock();

  return v18;
}

- (void)setInputElementMatching:()HIDFramework
{
  __IOHIDDevice *v4;
  const __CFDictionary *v5;
  __IOHIDDevice *v6;
  const __CFArray *v7;
  const __CFDictionary *v8;
  uint64_t v9;
  _OWORD v10[5];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[HIDDevice(HIDFramework) setInputElementMatching:].cold.1(&v9, v10);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[__CFDictionary count](v8, "count"))
    {
      v4 = a1;
      v5 = v8;
    }
    else
    {
      v4 = a1;
      v5 = 0;
    }
    IOHIDDeviceSetInputValueMatching(v4, v5);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFDictionary count](v8, "count"))
      {
        v6 = a1;
        v7 = v8;
      }
      else
      {
        v6 = a1;
        v7 = 0;
      }
      IOHIDDeviceSetInputValueMatchingMultiple(v6, v7);
    }
  }

}

- (void)setInputElementHandler:()HIDFramework
{
  id v4;
  unint64_t *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v5 = (unint64_t *)((char *)a1 + *MEMORY[0x1E0CBBA30] + 312);
  v8 = v4;
  v6 = _Block_copy(v4);
  do
    v7 = __ldaxr(v5);
  while (__stlxr((unint64_t)v6, v5));
  if (v7)
    -[HIDManager setInputElementHandler:].cold.1();
  IOHIDDeviceRegisterInputValueCallback(a1, (IOHIDValueCallback)inputValueCallback_0, a1);

}

- (void)setBatchInputElementHandler:()HIDFramework
{
  id v4;
  char *v5;
  unint64_t *v6;
  void *v7;
  unint64_t v8;
  id v9;

  v4 = a3;
  v5 = (char *)a1 + (int)*MEMORY[0x1E0CBBA30];
  v6 = (unint64_t *)(v5 + 312);
  v9 = v4;
  v7 = _Block_copy(v4);
  do
    v8 = __ldaxr(v6);
  while (__stlxr((unint64_t)v7, v6));
  if (v8)
    -[HIDManager setInputElementHandler:].cold.1();
  *((_QWORD *)v5 + 35) = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  IOHIDDeviceRegisterInputValueCallback(a1, (IOHIDValueCallback)batchInputValueCallback, a1);

}

- (void)setRemovalHandler:()HIDFramework
{
  id v4;
  unint64_t *v5;
  void *v6;
  unint64_t v7;
  id v8;

  v4 = a3;
  v5 = (unint64_t *)((char *)a1 + *MEMORY[0x1E0CBBA30] + 320);
  v8 = v4;
  v6 = _Block_copy(v4);
  do
    v7 = __ldaxr(v5);
  while (__stlxr((unint64_t)v6, v5));
  if (v7)
    -[HIDServiceClient(HIDFramework) setRemovalHandler:].cold.1();
  IOHIDDeviceRegisterRemovalCallback(a1, (IOHIDCallback)removalCallback, a1);

}

- (void)setInputReportHandler:()HIDFramework
{
  id v4;
  char *v5;
  unint64_t *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  CFIndex v11;
  __CFData *v12;
  __CFData *Mutable;
  UInt8 *MutableBytePtr;
  CFIndex Length;
  id v16;

  v4 = a3;
  v5 = &a1[*MEMORY[0x1E0CBBA30]];
  v6 = (unint64_t *)(v5 + 328);
  v16 = v4;
  v7 = _Block_copy(v4);
  do
    v8 = __ldaxr(v6);
  while (__stlxr((unint64_t)v7, v6));
  if (v8)
    -[HIDManager setInputReportHandler:].cold.1();
  objc_msgSend(a1, "propertyForKey:", CFSTR("MaxInputReportSize"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
    v11 = objc_msgSend(v9, "unsignedIntegerValue");
  else
    v11 = 1;
  v12 = (__CFData *)*((_QWORD *)v5 + 34);
  if (!v12)
  {
    Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v11);
    *((_QWORD *)v5 + 34) = Mutable;
    CFDataSetLength(Mutable, v11);
    v12 = (__CFData *)*((_QWORD *)v5 + 34);
  }
  MutableBytePtr = CFDataGetMutableBytePtr(v12);
  Length = CFDataGetLength(*((CFDataRef *)v5 + 34));
  IOHIDDeviceRegisterInputReportWithTimeStampCallback((IOHIDDeviceRef)a1, MutableBytePtr, Length, (IOHIDReportWithTimeStampCallback)inputReportCallback_0, a1);

}

- (void)setCancelHandler:()HIDFramework
{
  IOHIDDeviceSetCancelHandler(a1, handler);
}

- (void)setDispatchQueue:()HIDFramework
{
  IOHIDDeviceSetDispatchQueue(a1, queue);
}

- (uint64_t)open
{
  return IOHIDDeviceOpen(a1, 0);
}

- (BOOL)openWithOptions:()HIDFramework error:
{
  uint64_t v5;
  int v6;

  v5 = IOHIDDeviceOpen(a1, options);
  v6 = v5;
  if (a4 && (_DWORD)v5)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithIOReturn:", v5);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v6 == 0;
}

- (uint64_t)close
{
  return IOHIDDeviceClose(a1, 0);
}

- (void)activate
{
  char *v2;
  void *v3;

  v2 = &a1[*MEMORY[0x1E0CBBA30]];
  os_unfair_recursive_lock_lock_with_options();
  if (*((_QWORD *)v2 + 35))
  {
    if (*((_QWORD *)v2 + 30))
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:");
    else
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObjects:", &unk_1E94E9948, &unk_1E94E9970, &unk_1E94E9998, &unk_1E94E99C0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", &unk_1E94E99E8);
    os_unfair_recursive_lock_unlock();
    objc_msgSend(a1, "setInputElementMatching:", v3);

  }
  else
  {
    os_unfair_recursive_lock_unlock();
  }
  IOHIDDeviceActivate((IOHIDDeviceRef)a1);
}

- (void)setInputElementMatching:()HIDFramework .cold.1(_QWORD *a1, _OWORD *a2)
{
  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
  _os_log_send_and_compose_impl();
  _os_crash_msg();
  __break(1u);
}

@end
