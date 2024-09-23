void MSMediaStreamInitialize()
{
  if (MSMediaStreamInitialize_once != -1)
    dispatch_once(&MSMediaStreamInitialize_once, &__block_literal_global_194);
}

void _notificationCallBack(void *key, uint64_t a2)
{
  const __CFDictionary *Mutable;
  const __CFDictionary *v5;
  void *v6;
  id v7;

  Mutable = (const __CFDictionary *)_notificationToInfo_dict;
  if (!_notificationToInfo_dict)
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    _notificationToInfo_dict = (uint64_t)Mutable;
  }
  if (CFDictionaryContainsKey(Mutable, key))
  {
    v5 = (const __CFDictionary *)_notificationToInfo_dict;
    if (!_notificationToInfo_dict)
    {
      v5 = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
      _notificationToInfo_dict = (uint64_t)v5;
    }
    CFDictionaryGetValue(v5, key);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "owner");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_userDidRespondToNotification:info:responseFlags:", key, v7, a2);

  }
}

void sub_1D51C3144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D51C3358(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  uint64_t v26;

  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1D51C3818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1D51C47A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _MSSetDaemon(void *a1)
{
  id v2;
  id v3;

  v2 = a1;
  if ((id)_theDaemon != v2)
  {
    v3 = v2;
    objc_storeStrong((id *)&_theDaemon, a1);
    v2 = v3;
  }

}

id MSMSLocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = MSMSLocalizedString_once;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&MSMSLocalizedString_once, &__block_literal_global_230);
  objc_msgSend((id)MSMSLocalizedString_bundle, "localizedStringForKey:value:table:", v2, v2, CFSTR("MediaStream"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void *BatteryStateChanged(void *result, uint64_t a2, int a3)
{
  void *v4;

  if (a3 == -536723200)
  {
    v4 = result;
    objc_msgSend(result, "updateBatteryLevelWithBatteryEntry:", a2);
    return (void *)objc_msgSend(v4, "updateBatteryConnectedStateWithBatteryEntry:", a2);
  }
  return result;
}

id _timerPingQueue()
{
  if (_timerPingQueue_onceToken != -1)
    dispatch_once(&_timerPingQueue_onceToken, &__block_literal_global_215);
  return (id)_timerPingQueue_queue;
}

void ___timerPingQueue_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;

  v0 = dispatch_queue_create("MSASConnection timer ping queue", 0);
  v1 = (void *)_timerPingQueue_queue;
  _timerPingQueue_queue = (uint64_t)v0;

}

void ___initializePlatform_block_invoke()
{
  void *v0;

  +[MSMSPlatform thePlatform](MSMSPlatform, "thePlatform");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  MSCoreMediaStreamInitialize();

  if (MSAlbumSharingInitialize_once != -1)
    dispatch_once(&MSAlbumSharingInitialize_once, &__block_literal_global_131);
}

void sub_1D51CC6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51CC8C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51CCA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51CCCF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51CCDB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D51CCE70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _throttledIndicatorFilePath()
{
  if (_throttledIndicatorFilePath_onceToken != -1)
    dispatch_once(&_throttledIndicatorFilePath_onceToken, &__block_literal_global_134);
  return (id)_throttledIndicatorFilePath_path;
}

uint64_t _availableDiskBlocks()
{
  id v0;
  int v1;
  uint64_t f_bavail;
  int *v4;
  char *v5;
  int v6;
  uint64_t v7;
  statfs v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  memset(&v8, 0, 512);
  MSPathAlbumSharingDir();
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = statfs((const char *)objc_msgSend(v0, "fileSystemRepresentation"), &v8);

  if (v1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      v4 = __error();
      v5 = strerror(*v4);
      v6 = 136315138;
      v7 = (uint64_t)v5;
      _os_log_error_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Cannot check disk space remaining: %s", (uint8_t *)&v6, 0xCu);
    }
    return 0;
  }
  else
  {
    f_bavail = v8.f_bavail;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = f_bavail;
      _os_log_impl(&dword_1D51BF000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Checked disk space remaining: %lld blocks.", (uint8_t *)&v6, 0xCu);
    }
  }
  return f_bavail;
}

void ___throttledIndicatorFilePath_block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  NSTemporaryDirectory();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("com.apple.mediastream.mstreamd.disk-throttled"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_throttledIndicatorFilePath_path;
  _throttledIndicatorFilePath_path = v0;

}

void _MSASSetDaemon(id obj)
{
  objc_storeStrong((id *)&_daemon, obj);
}

void MSAlbumSharingInitialize()
{
  if (MSAlbumSharingInitialize_once != -1)
    dispatch_once(&MSAlbumSharingInitialize_once, &__block_literal_global_131);
}

void sub_1D51D01D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1D51D16C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _XPCShouldLog()
{
  uint64_t result;

  result = _shouldLogBlock;
  if (_shouldLogBlock)
    return (*(uint64_t (**)(void))(_shouldLogBlock + 16))();
  return result;
}

void _XPCLog(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;

  v10 = a2;
  if (_logMessageBlock && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    (*(void (**)(uint64_t, uint64_t, id, uint64_t *))(_logMessageBlock + 16))(_logMessageBlock, a1, v10, &a9);

}

void XPCSetLogBlocks(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a2;
  v4 = MEMORY[0x1D826FEFC](a1);
  v5 = (void *)_shouldLogBlock;
  _shouldLogBlock = v4;

  v6 = MEMORY[0x1D826FEFC](v3);
  v7 = (void *)_logMessageBlock;
  _logMessageBlock = v6;

}

uint64_t _insertMessage(void *a1, void *a2, void *a3, _QWORD *a4, size_t *a5)
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  size_t v15;
  void *v16;
  void *v17;
  xpc_object_t v18;
  int *v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v43;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  if (v10)
  {
    v43 = 0;
    objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v43);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v43;
    if (!v12)
    {
      if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
        _XPCLog(3, CFSTR("Cannot serialize object, error: %@"), v28, v29, v30, v31, v32, v33, (uint64_t)v13);

      goto LABEL_23;
    }
    v14 = objc_retainAutorelease(v12);
    xpc_dictionary_set_data(v9, "__nsmsg", (const void *)objc_msgSend(v14, "bytes"), objc_msgSend(v14, "length"));

  }
  if (v11)
  {
    v15 = objc_msgSend(v11, "length");
    v16 = mmap(0, v15, 3, 4099, -1, 0);
    if (v16 != (void *)-1)
    {
      v17 = v16;
      memcpy(v16, (const void *)objc_msgSend(objc_retainAutorelease(v11), "bytes"), v15);
      v18 = xpc_shmem_create(v17, v15);
      xpc_dictionary_set_value(v9, "__nsdata", v18);
      xpc_dictionary_set_uint64(v9, "__nsdsize", v15);
      if (a4)
        *a4 = v18;
      if (a5)
        *a5 = v15;
      if (munmap(v17, v15) && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      {
        v19 = __error();
        v20 = strerror(*v19);
        _XPCLog(3, CFSTR("munmap(2) failed. Error: %s"), v21, v22, v23, v24, v25, v26, (uint64_t)v20);
      }

      goto LABEL_15;
    }
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    {
      v34 = __error();
      v35 = strerror(*v34);
      _XPCLog(3, CFSTR("Cannot create mapped memory region. Error: %s"), v36, v37, v38, v39, v40, v41, (uint64_t)v35);
    }
LABEL_23:
    v27 = 0;
    goto LABEL_24;
  }
LABEL_15:
  v27 = 1;
LABEL_24:

  return v27;
}

uint64_t _unpack(void *a1, _QWORD *a2, _QWORD *a3)
{
  id v5;
  void *v6;
  const void *data;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  size_t v27;
  size_t v28;
  uint64_t uint64;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  id v46;
  size_t length;

  v5 = a1;
  v6 = v5;
  if (!v5)
  {
LABEL_25:
    v18 = 1;
    goto LABEL_26;
  }
  if (!a2)
    goto LABEL_12;
  length = 0;
  data = xpc_dictionary_get_data(v5, "__nsmsg", &length);
  if (!length)
  {
    if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
      _XPCLog(3, CFSTR("Could not interpret serialized message."), v19, v20, v21, v22, v23, v24, v45);
    goto LABEL_12;
  }
  v8 = (void *)MEMORY[0x1E0CB3710];
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", data, length, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  objc_msgSend(v8, "MSSafeUnarchiveObjectWithData:outError:", v9, &v46);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v46;
  *a2 = v10;

  if (!v11)
  {
LABEL_12:
    if (a3)
    {
      xpc_dictionary_get_value(v6, "__nsdata");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = v25;
      if (v25)
      {
        length = 0;
        v27 = xpc_shmem_map(v25, (void **)&length);
        if (v27)
        {
          v28 = v27;
          uint64 = xpc_dictionary_get_uint64(v6, "__nsdsize");
          if (uint64 <= v28)
          {
            objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", length, uint64);
            *a3 = (id)objc_claimAutoreleasedReturnValue();
          }
          else if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
          {
            _XPCLog(3, CFSTR("Could not unpack message due to invalid size."), v30, v31, v32, v33, v34, v35, v45);
          }
          if (munmap((void *)length, v28) && _shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
          {
            v36 = __error();
            v37 = strerror(*v36);
            _XPCLog(3, CFSTR("munmap(2) failed. Error: %s"), v38, v39, v40, v41, v42, v43, (uint64_t)v37);
          }
        }
      }

    }
    goto LABEL_25;
  }
  if (_shouldLogBlock && (*(unsigned int (**)(void))(_shouldLogBlock + 16))())
    _XPCLog(3, CFSTR("Could not interpret serialized message. Error: %@"), v12, v13, v14, v15, v16, v17, (uint64_t)v11);

  v18 = 0;
LABEL_26:

  return v18;
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A78](key, applicationID, keyExistsAndHasValidFormat);
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

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x1E0C98C10](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB6B0](notify);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

uint64_t MSASInitialize()
{
  return MEMORY[0x1E0D16C28]();
}

uint64_t MSASPlatform()
{
  return MEMORY[0x1E0D16C30]();
}

uint64_t MSCoreMediaStreamInitialize()
{
  return MEMORY[0x1E0D16C38]();
}

uint64_t MSPathAlbumSharingDir()
{
  return MEMORY[0x1E0D16C40]();
}

uint64_t MSPlatform()
{
  return MEMORY[0x1E0D16C48]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
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

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
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

int statfs(const char *a1, statfs *a2)
{
  return MEMORY[0x1E0C854E0](a1, a2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
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

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
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

xpc_object_t xpc_shmem_create(void *region, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C866F0](region, length);
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x1E0C86700](xshmem, region);
}

