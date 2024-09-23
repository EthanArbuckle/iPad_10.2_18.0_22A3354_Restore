id HAENotificationsLog()
{
  if (HAENotificationsLog_once != -1)
    dispatch_once(&HAENotificationsLog_once, &__block_literal_global_11);
  return (id)HAENotificationsLog_haeNotificationsLog;
}

CFPropertyListRef GetDeviceSpecificDefaults(const __CFString *a1)
{
  return (id)CFPreferencesCopyAppValue(a1, (CFStringRef)*MEMORY[0x24BE0A198]);
}

id __copy_helper_block_e8_40n19_8_8_s0_s8_s16_t24w2(uint64_t a1, uint64_t a2)
{
  return __copy_constructor_8_8_s0_s8_s16_t24w2(a1 + 40, a2 + 40);
}

id __copy_constructor_8_8_s0_s8_s16_t24w2(uint64_t a1, uint64_t a2)
{
  id result;

  *(_QWORD *)a1 = *(id *)a2;
  *(_QWORD *)(a1 + 8) = *(id *)(a2 + 8);
  result = *(id *)(a2 + 16);
  *(_QWORD *)(a1 + 16) = result;
  *(_WORD *)(a1 + 24) = *(_WORD *)(a2 + 24);
  return result;
}

void __destroy_helper_block_e8_40n11_8_s0_s8_s16(uint64_t a1)
{
  __destructor_8_s0_s8_s16((id *)(a1 + 40));
}

void __destructor_8_s0_s8_s16(id *a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id HAENLocalizationUtilityGetBundle()
{
  if (HAENLocalizationUtilityGetBundle_once != -1)
    dispatch_once(&HAENLocalizationUtilityGetBundle_once, &__block_literal_global_3);
  return (id)HAENLocalizationUtilityGetBundle__haeNotificationFrameworkBundle;
}

void ReleaseHAENRouteInfo(uint64_t a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  if (a1)
  {
    v2 = *(const void **)a1;
    if (v2)
    {
      CFRelease(v2);
      *(_QWORD *)a1 = 0;
    }
    v3 = *(const void **)(a1 + 8);
    if (v3)
    {
      CFRelease(v3);
      *(_QWORD *)(a1 + 8) = 0;
    }
    v4 = *(const void **)(a1 + 16);
    if (v4)
    {
      CFRelease(v4);
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id NSErrorWithHAENErrorCode(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  if (a2)
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObject:forKey:", a2, *MEMORY[0x24BDD0FC8]);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("HAENotficiationsError"), *(_QWORD *)"pyt!", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void settingsChanged(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 138412290;
    v10 = v3;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "HAENDefaults received notification: %@", (uint8_t *)&v9, 0xCu);
  }

  if (+[HAENDefaults isCurrentProcessMediaserverd](HAENDefaults, "isCurrentProcessMediaserverd")
    && ((objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A178]) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A170])))
  {
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateUserVolumeForVolumeLimit");

  }
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A160]))
  {
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeAllAdapters");
  }
  else if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A180]))
  {
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "wiredDeviceStatusDidChange");
  }
  else
  {
    v7 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A178]);
    +[HAENDefaults sharedInstance](HAENDefaults, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if (v7)
    {
      objc_msgSend(v8, "updateRLSSettings");
    }
    else
    {
      objc_msgSend(v8, "forceReadDefaults");

      +[HAENUnknownDeviceManager sharedInstance](HAENUnknownDeviceManager, "sharedInstance");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "updateWiredDeviceStatus");
    }
  }

}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_2144BCB18(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

id errorForIOKitFailure(unsigned int a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("system=%#x subsystem=%#x code=%#x"), a1 >> 26, (a1 >> 14) & 0xFFF, a1 & 0x3FFF);
  v3 = objc_alloc(MEMORY[0x24BDD1540]);
  v4 = *MEMORY[0x24BDD1010];
  v13 = *MEMORY[0x24BDD0FC8];
  v14[0] = v2;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v3, "initWithDomain:code:userInfo:", v4, (int)a1, v5);

  if (a1 == -536870183)
    v7 = 1;
  else
    v7 = 3;
  v11 = *MEMORY[0x24BDD1398];
  v12 = v6;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  makeError(v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

id errorForBadDeviceInfo(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Bad value for device info %@"), a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDD0FC8];
  v6[0] = v1;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  makeError(v2, 4u);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id makeError(void *a1, unsigned int a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD1540];
  v4 = a1;
  v5 = [v3 alloc];
  v6 = (void *)objc_msgSend(v5, "initWithDomain:code:userInfo:", HAENAccessoryInfoErrorDomain, a2, v4);

  return v6;
}

void GeoLocationDidChange(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  HAENotificationsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v3;
    _os_log_impl(&dword_2144B3000, v4, OS_LOG_TYPE_DEFAULT, "HAENLocationGating Received Darwin Notification: %@", (uint8_t *)&v6, 0xCu);
  }

  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BE0A168]))
  {
    +[HAENLocationGatingHelper sharedInstance](HAENLocationGatingHelper, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    -[NSObject deviceDataDispositionDidChange](v5, "deviceDataDispositionDidChange");
  }
  else
  {
    HAENotificationsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      GeoLocationDidChange_cold_1((uint64_t)v3, v5);
  }

}

uint64_t SyncDeviceSpecificDomain()
{
  return CFPreferencesAppSynchronize((CFStringRef)*MEMORY[0x24BE0A198]);
}

void RemoveDeviceSpecificDefaultsFor(void *a1)
{
  __CFString *v1;
  NSObject *v2;
  int v3;
  __CFString *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  HAENotificationsLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = 138412290;
    v4 = v1;
    _os_log_impl(&dword_2144B3000, v2, OS_LOG_TYPE_DEFAULT, "removing key: %@", (uint8_t *)&v3, 0xCu);
  }

  CFPreferencesSetAppValue(v1, 0, (CFStringRef)*MEMORY[0x24BE0A198]);
}

void SetDeviceSpecificDefaultsFor(__CFString *a1, const void *a2)
{
  if (a2)
    CFPreferencesSetAppValue(a1, a2, (CFStringRef)*MEMORY[0x24BE0A198]);
  else
    RemoveDeviceSpecificDefaultsFor(a1);
}

void GeoLocationDidChange_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_2144B3000, a2, OS_LOG_TYPE_ERROR, "HAENLocationGating action %@ not handled", (uint8_t *)&v2, 0xCu);
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x24BDB6990]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC170](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x24BDBC918](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

uint64_t CMSessionManagerPerformVolumeOperationWithSequenceNumber()
{
  return MEMORY[0x24BE64960]();
}

uint64_t CMSessionMgrCopyDeviceRouteForRouteConfiguration()
{
  return MEMORY[0x24BE64968]();
}

uint64_t IOAccessoryManagerCopyDeviceInfo()
{
  return MEMORY[0x24BED4918]();
}

uint64_t IOAccessoryManagerGetServiceWithPrimaryPort()
{
  return MEMORY[0x24BED4950]();
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x24BDD8668](*(_QWORD *)&iterator);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x24BDD86F8](*(_QWORD *)&object);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x24BDD88A8](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x24BDD8970](*(_QWORD *)&connect);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x24BDD8990](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDD89A8](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x24BDD89B8](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetProductType()
{
  return MEMORY[0x24BED8488]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
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

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
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

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x24BEDD0F8](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

