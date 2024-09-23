void sub_2172DE62C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void __ReachabilityCallback(const __SCNetworkReachability *a1)
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  uint8_t v5[12];
  SCNetworkReachabilityFlags flags;
  uint8_t buf[16];

  AXLogSpeechAssetDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2172DC000, v2, OS_LOG_TYPE_DEFAULT, "Got reachability change", buf, 2u);
  }

  flags = 0;
  if (a1)
  {
    SCNetworkReachabilityGetFlags(a1, &flags);
    if ((flags & 2) != 0)
    {
      AXLogSpeechAssetDownload();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v5 = 0;
        _os_log_impl(&dword_2172DC000, v3, OS_LOG_TYPE_DEFAULT, "Looks like we're reachable, try again", v5, 2u);
      }

      +[AXSpeechAssetMonitorHelper sharedInstance](AXSpeechAssetMonitorHelper, "sharedInstance");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_unregisterForReachabilityNotifications");

    }
  }
}

uint64_t _deviceLockStateChanged(uint64_t a1, void *a2)
{
  uint64_t result;

  if ((deviceHasBeenUnlockedOnce & 1) == 0)
    result = objc_msgSend(a2, "handeDeviceFirstUnlock");
  deviceHasBeenUnlockedOnce = 1;
  return result;
}

Class __getAXAssetsServiceClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!AXAssetLoaderLibraryCore_frameworkLibrary)
  {
    AXAssetLoaderLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AXAssetLoaderLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getAXAssetsServiceClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("AXAssetsService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getAXAssetsServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __ReachabilityCallback_0(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_updateAllowedToDownload");
}

void __getAXAssetsServiceClass_block_invoke_cold_1()
{
  abort_report_np();
  AXColorizeFormatLog();
}

uint64_t AXColorizeFormatLog()
{
  return MEMORY[0x24BDFDF98]();
}

uint64_t AXDeviceIsUnlocked()
{
  return MEMORY[0x24BDFFFC0]();
}

uint64_t AXLanguageCanonicalFormToGeneralLanguage()
{
  return MEMORY[0x24BE001A0]();
}

uint64_t AXLogSpeechAssetDownload()
{
  return MEMORY[0x24BDFE198]();
}

uint64_t AXLogUI()
{
  return MEMORY[0x24BDFE1E0]();
}

uint64_t AXLoggerForFacility()
{
  return MEMORY[0x24BDFE210]();
}

uint64_t AXOSLogLevelFromAXLogLevel()
{
  return MEMORY[0x24BDFE238]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BDFE260]();
}

uint64_t AXkMobileKeyBagLockStatusNotificationID()
{
  return MEMORY[0x24BE00568]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x24BDF5760](allocator, address);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x24BDF5790](target, flags);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x24BDF57A0](target, callout, context);
}

Boolean SCNetworkReachabilitySetDispatchQueue(SCNetworkReachabilityRef target, dispatch_queue_t queue)
{
  return MEMORY[0x24BDF57A8](target, queue);
}

uint64_t TTSPreferencesCopyDefaultOutputLanguageIdentifierForUserPreferences()
{
  return MEMORY[0x24BEB62B0]();
}

uint64_t _AXStringForArgs()
{
  return MEMORY[0x24BDFE548]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
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

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

