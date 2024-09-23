uint64_t Mobile_Obliterate(const __CFDictionary *a1)
{
  uint64_t v2;
  NSObject *v3;
  dispatch_block_t v4;
  void *v5;
  dispatch_time_t v6;
  intptr_t v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  __CFDictionary *MutableCopy;
  __CFDictionary *v13;
  pid_t v14;
  const __CFAllocator *v15;
  CFStringRef v16;
  CFStringRef v17;
  __CFDictionary *v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const void *v21;
  const void *v22;
  int *v23;
  _BOOL8 v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  _BOOL4 v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *value;
  char cStr[16];
  char v42;
  __int128 buffer;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v2 = 0xFFFFFFFFLL;
  v3 = dispatch_queue_create("com.apple.obliteration.timeout_block", 0);
  if (v3 && (v4 = dispatch_block_create(DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global)) != 0)
  {
    v5 = v4;
    dispatch_async(v3, v4);
    v6 = dispatch_time(0, 180000000000);
    v7 = dispatch_block_wait(v5, v6);

    if (!v7)
      goto LABEL_7;
  }
  else
  {

  }
  v8 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
  if (v8)
  {
    Mobile_Obliterate_cold_7(v8, v9, v10);
    if (!a1)
      return v2;
    goto LABEL_8;
  }
LABEL_7:
  if (!a1)
    return v2;
LABEL_8:
  value = 0;
  if (CFDictionaryContainsKey(a1, CFSTR("ObliterationCallingProcessName")))
  {
    v11 = (const __CFString *)CFDictionaryGetValue(a1, CFSTR("ObliterationCallingProcessName"));
    if (v11 && CFStringCompare(v11, CFSTR("__Ignore__"), 0) == kCFCompareEqualTo)
    {
      MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a1);
      v13 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionaryRemoveValue(MutableCopy, CFSTR("ObliterationCallingProcessName"));
        a1 = v13;
      }
      goto LABEL_19;
    }
LABEL_18:
    v13 = 0;
    goto LABEL_19;
  }
  v14 = getpid();
  v45 = 0u;
  v46 = 0u;
  buffer = 0u;
  v44 = 0u;
  if (proc_pidinfo(v14, 13, 1uLL, &buffer, 64) != 64)
    goto LABEL_18;
  *(_OWORD *)cStr = v44;
  v42 = 0;
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v16 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
  if (!v16)
    goto LABEL_18;
  v17 = v16;
  v18 = CFDictionaryCreateMutableCopy(v15, 0, a1);
  v13 = v18;
  if (v18)
  {
    CFDictionaryAddValue(v18, CFSTR("ObliterationCallingProcessName"), v17);
    a1 = v13;
  }
  CFRelease(v17);
LABEL_19:
  if (CFDictionaryGetValueIfPresent(a1, CFSTR("returnDictionary"), (const void **)&value))
  {
    if (v13 || (v13 = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a1)) != 0)
      CFDictionaryRemoveValue(v13, CFSTR("returnDictionary"));
  }
  if (!MOXPCTransportOpen())
  {
    v24 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v24)
      Mobile_Obliterate_cold_1(v24, v25, v26);
    goto LABEL_47;
  }
  MOXPCTransportResume();
  if (!MOXPCTransportSendMessage())
  {
    v27 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v27)
      Mobile_Obliterate_cold_6(v27, v28, v29);
    LODWORD(v2) = -1000;
    goto LABEL_46;
  }
  v19 = (const __CFDictionary *)MOXPCTransportReceiveMessage();
  if (!v19)
  {
    LODWORD(v2) = -1000;
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      Mobile_Obliterate_cold_2(&buffer, (_BYTE *)&buffer + 1);
    goto LABEL_46;
  }
  v20 = v19;
  v21 = CFDictionaryGetValue(v19, CFSTR("IPCStatus"));
  if (!v21)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      Mobile_Obliterate_cold_3(&buffer, (_BYTE *)&buffer + 1);
LABEL_40:
    v23 = &kMobileObliterationInternalError;
    goto LABEL_45;
  }
  v22 = v21;
  if (!CFEqual(v21, CFSTR("Complete")))
  {
    v30 = CFEqual(v22, CFSTR("Error"));
    v31 = os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR);
    if (v30)
    {
      if (v31)
        Mobile_Obliterate_cold_5(&buffer, (_BYTE *)&buffer + 1);
      v23 = &kMobileObliterationError;
      goto LABEL_45;
    }
    if (v31)
      Mobile_Obliterate_cold_4(&buffer, (_BYTE *)&buffer + 1);
    goto LABEL_40;
  }
  v23 = &kMobileObliterationSuccess;
LABEL_45:
  LODWORD(v2) = *v23;
  CFRelease(v20);
LABEL_46:
  MOXPCTransportClose();
LABEL_47:
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", *MEMORY[0x24BDD1128], (int)v2, 0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = objc_msgSend(v32, "code");
  objc_msgSend(v32, "userInfo");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = value;

  if (v34 && v35)
  {
    objc_msgSend(v32, "userInfo");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ObliterationResultString"));
    v37 = (void *)objc_claimAutoreleasedReturnValue();

    if (v37)
      CFDictionarySetValue((CFMutableDictionaryRef)value, CFSTR("ObliterationResultString"), v37);
    objc_msgSend(v36, "objectForKeyedSubscript:", CFSTR("ObliterationResultState"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    if (v38)
      CFDictionarySetValue((CFMutableDictionaryRef)value, CFSTR("ObliterationResultState"), v38);

  }
  if (v13)
    CFRelease(v13);

  return v33;
}

uint64_t Mobile_Obliterate_IsSupported()
{
  return 1;
}

void *__delete_all_applets_block_invoke()
{
  void *result;

  result = dlopen("/System/Library/PrivateFrameworks/NearField.framework/NearField", 1);
  if (result)
  {
    result = dlsym(result, "ObliterationDeleteAllApplets");
    if (result)
      return (void *)((uint64_t (*)(void))result)();
  }
  return result;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_1(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void Mobile_Obliterate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_20AEB9000, MEMORY[0x24BDACB70], a3, "Could not create transport connection", v3);
  OUTLINED_FUNCTION_2();
}

void Mobile_Obliterate_cold_2(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_20AEB9000, MEMORY[0x24BDACB70], v2, "Could not receive response from server", v3);
}

void Mobile_Obliterate_cold_3(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_20AEB9000, MEMORY[0x24BDACB70], v2, "Status missing from response", v3);
}

void Mobile_Obliterate_cold_4(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_20AEB9000, MEMORY[0x24BDACB70], v2, "Unrecognized return status", v3);
}

void Mobile_Obliterate_cold_5(_BYTE *a1, _BYTE *a2)
{
  uint64_t v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_1(a1, a2);
  OUTLINED_FUNCTION_0(&dword_20AEB9000, MEMORY[0x24BDACB70], v2, "Error from server", v3);
}

void Mobile_Obliterate_cold_6(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_20AEB9000, MEMORY[0x24BDACB70], a3, "Could not send request through transport", v3);
  OUTLINED_FUNCTION_2();
}

void Mobile_Obliterate_cold_7(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_0(&dword_20AEB9000, MEMORY[0x24BDACB70], a3, "Timed out waiting for ObliterationDeleteAllApplets() to return.", v3);
  OUTLINED_FUNCTION_2();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x24BDBBE38](theDict, key, value);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x24BDBBE48](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

uint64_t MOXPCTransportClose()
{
  return MEMORY[0x24BE67720]();
}

uint64_t MOXPCTransportOpen()
{
  return MEMORY[0x24BE67728]();
}

uint64_t MOXPCTransportReceiveMessage()
{
  return MEMORY[0x24BE67730]();
}

uint64_t MOXPCTransportResume()
{
  return MEMORY[0x24BE67738]();
}

uint64_t MOXPCTransportSendMessage()
{
  return MEMORY[0x24BE67740]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD18](flags, block);
}

intptr_t dispatch_block_wait(dispatch_block_t block, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADD40](block, timeout);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

