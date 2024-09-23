uint64_t NFSeedBuild()
{
  return 0;
}

void __zalgo_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.news.promises.zalgo", v2);
  v1 = (void *)zalgo_queue;
  zalgo_queue = (uint64_t)v0;

}

void __zalgoIfMain_block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.news.promises.zalgoIfMain", v2);
  v1 = (void *)zalgoIfMain_queue;
  zalgoIfMain_queue = (uint64_t)v0;

}

uint64_t NFDeviceHasExtendedColorDisplay()
{
  if (NFDeviceHasExtendedColorDisplay_onceToken != -1)
    dispatch_once(&NFDeviceHasExtendedColorDisplay_onceToken, &__block_literal_global_35);
  return NFDeviceHasExtendedColorDisplay_hasExtendedColorDisplay;
}

const __CFString *NFGeneralDeviceString()
{
  void *v0;
  const __CFString *v1;

  v0 = (void *)MGCopyAnswer();
  v1 = CFSTR("iPhone");
  if ((objc_msgSend(v0, "hasPrefix:", CFSTR("iPhone")) & 1) == 0)
  {
    v1 = CFSTR("iPad");
    if ((objc_msgSend(v0, "hasPrefix:", CFSTR("iPad")) & 1) == 0)
    {
      v1 = CFSTR("iPod");
      if ((objc_msgSend(v0, "hasPrefix:", CFSTR("iPod")) & 1) == 0)
      {
        if ((objc_msgSend(v0, "hasPrefix:", CFSTR("Apple Watch")) & 1) != 0)
        {
          v1 = CFSTR("Watch");
        }
        else if ((objc_msgSend(v0, "hasPrefix:", CFSTR("Apple TV")) & 1) != 0)
        {
          v1 = CFSTR("TV");
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
            NFGeneralDeviceString_cold_1((uint64_t)v0);
          v1 = 0;
        }
      }
    }
  }

  return v1;
}

uint64_t NFStoreDemoMode()
{
  if (NFStoreDemoMode_onceToken != -1)
    dispatch_once(&NFStoreDemoMode_onceToken, &__block_literal_global_2);
  return NFStoreDemoMode_storeDemoMode;
}

void sub_212A0CB94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NFInternalBuild()
{
  if (NFInternalBuild_onceToken != -1)
    dispatch_once(&NFInternalBuild_onceToken, &__block_literal_global);
  return NFInternalBuild_internalBuild;
}

void NFPromiseInvokeOnQueue(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;

  v7 = a1;
  v3 = a2;
  zalgo();
  v4 = objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
    goto LABEL_4;
  zalgoIfMain();
  v5 = objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 != v7)
  {
LABEL_6:
    dispatch_async(v6, v3);
    goto LABEL_7;
  }
  if (!objc_msgSend(MEMORY[0x24BDD17F0], "isMainThread"))
  {
    v6 = MEMORY[0x24BDAC9B8];
    goto LABEL_6;
  }
LABEL_4:
  v3[2](v3);
LABEL_7:

}

id zalgo()
{
  if (zalgo_token != -1)
    dispatch_once(&zalgo_token, &__block_literal_global_0);
  return (id)zalgo_queue;
}

void sub_212A0EB20(void *a1, int a2)
{
  uint64_t v2;
  id v4;
  void *v5;

  v4 = objc_begin_catch(a1);
  if (a2 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", kNFPromiseErrorDomain, kNFPromiseSealingErrorCode, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(v2 + 48) + 16))();

    objc_end_catch();
    JUMPOUT(0x212A0EB04);
  }
  objc_exception_throw(objc_retainAutorelease(v4));
}

void sub_212A0EB8C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id zalgoIfMain()
{
  if (zalgoIfMain_token != -1)
    dispatch_once(&zalgoIfMain_token, &__block_literal_global_3);
  return (id)zalgoIfMain_queue;
}

void sub_212A0F124(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id NFDevicePlatform()
{
  if (NFDevicePlatform_onceToken != -1)
    dispatch_once(&NFDevicePlatform_onceToken, &__block_literal_global_7);
  return (id)NFDevicePlatform_s_platformString;
}

id NFDeviceOSVersion()
{
  return (id)MGCopyAnswer();
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void NFArchiverCopyFileFinishedHandler(uint64_t a1, const char *a2)
{
  void *v3;
  void *v4;
  id v5;

  BOMCopierUserData();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFileSystemRepresentation:length:", a2, strlen(a2));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addObject:", v4);
}

void NFLockSync(void *a1, void *a2)
{
  void (**v3)(_QWORD);
  id v4;

  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "lock");
  v3[2](v3);

  objc_msgSend(v4, "unlock");
}

double _UIValueCGRectValue(void *a1)
{
  _OWORD v2[2];

  memset(v2, 0, sizeof(v2));
  _getNSValueBytes(a1, v2);
  return *(double *)v2;
}

__n128 _getNSValueBytes(void *a1, _OWORD *a2)
{
  id v3;
  const char *v4;
  uint64_t v5;
  char *v6;
  __n128 result;
  __int128 v8;
  NSUInteger sizep[2];

  sizep[1] = *MEMORY[0x24BDAC8D0];
  sizep[0] = 0;
  v3 = objc_retainAutorelease(a1);
  v4 = NSGetSizeAndAlignment((const char *)objc_msgSend(v3, "objCType"), sizep, 0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)sizep - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v3, "getValue:", v6);

  result = *(__n128 *)v6;
  v8 = *((_OWORD *)v6 + 1);
  *a2 = *(_OWORD *)v6;
  a2[1] = v8;
  return result;
}

uint64_t NFDeviceIsA7()
{
  if (NFDeviceIsA7_onceToken != -1)
    dispatch_once(&NFDeviceIsA7_onceToken, &__block_literal_global_2);
  return NFDeviceIsA7_result;
}

uint64_t NFDeviceIsA8()
{
  if (NFDeviceIsA8_onceToken != -1)
    dispatch_once(&NFDeviceIsA8_onceToken, &__block_literal_global_1);
  return NFDeviceIsA8_result;
}

id NFDeviceModelString()
{
  return (id)MGCopyAnswer();
}

id NFSystemName()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;

  v0 = (void *)MGCopyAnswer();
  v1 = v0;
  if (v0)
    v2 = v0;
  else
    v2 = (id)MGCopyAnswer();
  v3 = v2;

  return v3;
}

void NFGeneralDeviceString_cold_1(uint64_t a1)
{
  void *v1;
  uint8_t buf[4];
  const char *v3;
  __int16 v4;
  char *v5;
  __int16 v6;
  int v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("Encountered an unknown device model: %@"), a1);
  *(_DWORD *)buf = 136315906;
  v3 = "NSString *NFGeneralDeviceString()";
  v4 = 2080;
  v5 = "NFDevice.m";
  v6 = 1024;
  v7 = 104;
  v8 = 2114;
  v9 = v1;
  _os_log_error_impl(&dword_212A0B000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x24BE0FA58]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x24BE0FA68]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x24BE0FA70]();
}

uint64_t BOMCopierSetCopyFileFinishedHandler()
{
  return MEMORY[0x24BE0FA80]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x24BE0FAA8]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x24BE0FAB0]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC320](data, *(_QWORD *)&len, md);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x24BED84C0]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x24BDBCAA0](typePtr, sizep, alignp);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

BOOL nw_path_is_constrained(nw_path_t path)
{
  return MEMORY[0x24BDE19A0](path);
}

BOOL nw_path_is_equal(nw_path_t path, nw_path_t other_path)
{
  return MEMORY[0x24BDE19B8](path, other_path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x24BDE19C8](path);
}

void nw_path_monitor_cancel(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A08](monitor);
}

nw_path_monitor_t nw_path_monitor_create(void)
{
  return (nw_path_monitor_t)MEMORY[0x24BDE1A10]();
}

void nw_path_monitor_set_queue(nw_path_monitor_t monitor, dispatch_queue_t queue)
{
  MEMORY[0x24BDE1A38](monitor, queue);
}

void nw_path_monitor_set_update_handler(nw_path_monitor_t monitor, nw_path_monitor_update_handler_t update_handler)
{
  MEMORY[0x24BDE1A48](monitor, update_handler);
}

void nw_path_monitor_start(nw_path_monitor_t monitor)
{
  MEMORY[0x24BDE1A50](monitor);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x24BDE1A68](path, *(_QWORD *)&interface_type);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
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

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_assert_not_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF450](lock);
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x24BDAF458](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8C0](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x24BDAF8C8](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x24BDAF8F0](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x24BDAF908](a1, *(_QWORD *)&a2);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x24BDB0100](a1, a2, a3, a4, a5);
}

