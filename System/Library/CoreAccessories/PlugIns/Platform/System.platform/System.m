void *WeakLinkSymbol(const char *a1, unint64_t a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

const void *__HandleForSource(unint64_t a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  void *v4;

  pthread_mutex_lock(&__HandlesLock);
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, (const void *)a1);
  if (!Value)
  {
    if (a1 <= 8
      && ((0x1BFu >> a1) & 1) != 0
      && (v4 = dlopen((const char *)objc_msgSend(*((id *)&off_24D998B90 + a1), "UTF8String"), 1)) != 0)
    {
      Value = v4;
      CFDictionarySetValue((CFMutableDictionaryRef)__Handles, (const void *)a1, v4);
    }
    else
    {
      NSLog(CFSTR("Could not load source: %ld"), a1);
      Value = 0;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

id WeakLinkClass(void *a1, unint64_t a2)
{
  NSString *v3;
  void *v4;

  v3 = a1;
  if (__HandleForSource(a2))
  {
    NSClassFromString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id *WeakLinkStringConstant(const char *a1, unint64_t a2)
{
  id *v3;

  v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    v3 = (id *)dlsym(v3, a1);
    if (v3)
      v3 = (id *)*v3;
  }
  return v3;
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 3, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

void sub_218A8AE10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218A8B544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_218A8B9DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_218A8C564(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void ___getMediaLibraryHelper_block_invoke()
{
  MediaLibraryHelper *v0;
  void *v1;

  v0 = objc_alloc_init(MediaLibraryHelper);
  v1 = (void *)_getMediaLibraryHelper___mediaLibraryHelper;
  _getMediaLibraryHelper___mediaLibraryHelper = (uint64_t)v0;

}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  uint64_t (*__ptr32 *v2)();
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_218A90000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_218A89000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_218A89000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_218A89000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_218A90000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 233);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_218A89000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

uint64_t IsAppVisibleInCurrentMode(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = WeakLinkClass(CFSTR("LSApplicationProxy"), 1uLL);
  v3 = WeakLinkClass(CFSTR("LSApplicationWorkspace"), 1uLL);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(v3, "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "applicationIsInstalled:", v1);

  if (v5)
  {
    objc_msgSend(v2, "applicationProxyForIdentifier:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __IsAppVisibleInCurrentMode_block_invoke;
    v11[3] = &unk_24D998CE0;
    v13 = &v14;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "enumerateBundlesOfType:block:", 4, v11);

  }
  v9 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

void sub_218A8E114(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IsExistAppMusic()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.Music");
}

uint64_t IsExistAppPodcasts()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.podcasts");
}

uint64_t IsExistAppiBooks()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.iBooks");
}

id ACCGetOSVersion()
{
  const void *v0;
  const void *v1;
  BOOL v2;
  id v3;
  CFTypeID v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v0 = (const void *)MGCopyAnswerWithError();
  v1 = v0;
  if (v0)
  {
    v4 = CFGetTypeID(v0);
    if (v4 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ACCGetOSVersion_cold_1();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "ACCGetOSVersion";
        _os_log_impl(&dword_218A89000, v8, OS_LOG_TYPE_DEFAULT, "%s got non-string when querying key", buf, 0xCu);
      }

      v5 = 0;
    }
    goto LABEL_25;
  }
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACCGetOSVersion_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACCGetOSVersion";
    v13 = 1024;
    v14 = 0;
    v15 = 2112;
    v16 = CFSTR("ProductVersion");
    _os_log_impl(&dword_218A89000, v6, OS_LOG_TYPE_DEFAULT, "%s MG error: 0x%08x retrieving key:(%@)", buf, 0x1Cu);
  }

  v5 = 0;
  v7 = 0;
  if (v1)
  {
LABEL_25:
    CFRelease(v1);
    v7 = (void *)v5;
  }
  return v7;
}

void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1)
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  uint64_t (*__ptr32 *v2)();
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &off_218A90000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_218A89000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_218A89000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_218A89000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_218A90000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 233);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_218A89000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_218A89000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void ACCGetOSVersion_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_218A89000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_218A89000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x24BE67140]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x24BE67168]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SBGetScreenLockStatus()
{
  return MEMORY[0x24BEB0B80]();
}

uint64_t SBSCopyDisplayIdentifiersForExternalAccessoryProtocol()
{
  return MEMORY[0x24BEB0BD8]();
}

uint64_t SBSSpringBoardServerPort()
{
  return MEMORY[0x24BEB0D48]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
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

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x24BDAE780](a1, a2);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

time_t time(time_t *a1)
{
  return MEMORY[0x24BDB0240](a1);
}

