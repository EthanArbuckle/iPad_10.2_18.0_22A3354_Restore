void sub_1DA9C7C7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void wifidDidBecomeAlive(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __wifidDidBecomeAlive_block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a3;
  v3[5] = a2;
  if (wifidDidBecomeAlive_onceToken != -1)
    dispatch_once(&wifidDidBecomeAlive_onceToken, v3);
}

void sub_1DA9C7E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_1DA9C800C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t scanComplete(uint64_t a1, uint64_t a2, int a3, void *a4)
{
  return objc_msgSend(a4, "_scanComplete:error:", a2, a3 != 0);
}

void sub_1DA9C844C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1DA9C8540(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t MobileWiFiLibrary()
{
  uint64_t v0;
  void *v2;

  if (!MobileWiFiLibraryCore_frameworkLibrary)
    MobileWiFiLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = MobileWiFiLibraryCore_frameworkLibrary;
  if (!MobileWiFiLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t __wifidDidBecomeAlive_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_scanWifiListWithDevice:", *(_QWORD *)(a1 + 40));
}

void ISEnumerateKnownUrduSequencesInString(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v7 = a4;
  if (_knownUrduWords___onceToken != -1)
    dispatch_once(&_knownUrduWords___onceToken, &__block_literal_global_0);
  v8 = (id)_knownUrduWords___knownWords;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __ISEnumerateKnownUrduSequencesInString_block_invoke;
  v11[3] = &unk_1EA14D830;
  v12 = v8;
  v13 = v7;
  v9 = v7;
  v10 = v8;
  objc_msgSend(a1, "enumerateSubstringsInRange:options:usingBlock:", a2, a3, 3, v11);

}

void ___knownUrduWords_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1EA16AA68);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_knownUrduWords___knownWords;
  _knownUrduWords___knownWords = v0;

}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
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

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
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

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

uint64_t os_eligibility_get_domain_answer()
{
  return MEMORY[0x1E0C84678]();
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t ualoc_getAppleParent()
{
  return MEMORY[0x1E0DE5B60]();
}

uint64_t ualoc_getLanguagesForRegion()
{
  return MEMORY[0x1E0DE5B68]();
}

uint64_t ualoc_getRegionsForLanguage()
{
  return MEMORY[0x1E0DE5B70]();
}

uint64_t uenum_close()
{
  return MEMORY[0x1E0DE6240]();
}

uint64_t uenum_next()
{
  return MEMORY[0x1E0DE6250]();
}

void uidna_close(UIDNA *idna)
{
  MEMORY[0x1E0DE62B0](idna);
}

int32_t uidna_labelToASCII(const UIDNA *idna, const UChar *label, int32_t length, UChar *dest, int32_t capacity, UIDNAInfo *pInfo, UErrorCode *pErrorCode)
{
  return MEMORY[0x1E0DE62B8](idna, label, *(_QWORD *)&length, dest, *(_QWORD *)&capacity, pInfo, pErrorCode);
}

UIDNA *__cdecl uidna_openUTS46(uint32_t options, UErrorCode *pErrorCode)
{
  return (UIDNA *)MEMORY[0x1E0DE62E0](*(_QWORD *)&options, pErrorCode);
}

uint64_t uldn_close()
{
  return MEMORY[0x1E0DE6300]();
}

uint64_t uldn_localeDisplayName()
{
  return MEMORY[0x1E0DE6318]();
}

uint64_t uldn_openForContext()
{
  return MEMORY[0x1E0DE6328]();
}

uint64_t uldn_regionDisplayName()
{
  return MEMORY[0x1E0DE6330]();
}

uint64_t uloc_addLikelySubtags()
{
  return MEMORY[0x1E0DE6388]();
}

uint64_t uloc_minimizeSubtags()
{
  return MEMORY[0x1E0DE6458]();
}

uint64_t unumsys_close()
{
  return MEMORY[0x1E0DE6678]();
}

uint64_t unumsys_getName()
{
  return MEMORY[0x1E0DE6688]();
}

uint64_t unumsys_getRadix()
{
  return MEMORY[0x1E0DE6690]();
}

uint64_t unumsys_isAlgorithmic()
{
  return MEMORY[0x1E0DE6698]();
}

uint64_t unumsys_open()
{
  return MEMORY[0x1E0DE66A0]();
}

uint64_t uregion_getAvailable()
{
  return MEMORY[0x1E0DE67E8]();
}

uint64_t uregion_getContainingRegion()
{
  return MEMORY[0x1E0DE67F8]();
}

uint64_t uregion_getContainingRegionOfType()
{
  return MEMORY[0x1E0DE6800]();
}

uint64_t uregion_getRegionCode()
{
  return MEMORY[0x1E0DE6808]();
}

uint64_t uregion_getRegionFromCode()
{
  return MEMORY[0x1E0DE6810]();
}

