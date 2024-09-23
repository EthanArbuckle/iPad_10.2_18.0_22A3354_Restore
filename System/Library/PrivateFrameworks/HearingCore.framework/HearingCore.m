id HCProcessGetName()
{
  if (HCProcessGetName__AXProcessNameOnceToken != -1)
    dispatch_once(&HCProcessGetName__AXProcessNameOnceToken, &__block_literal_global_0);
  return (id)HCProcessGetName__AXProcessName;
}

id HCApplicationGetMainBundleIdentifier()
{
  if (HCApplicationGetMainBundleIdentifier__AXApplicationMainBundleIdentifierOnceToken != -1)
    dispatch_once(&HCApplicationGetMainBundleIdentifier__AXApplicationMainBundleIdentifierOnceToken, &__block_literal_global_20_0);
  return (id)HCApplicationGetMainBundleIdentifier__AXApplicationMainBundleIdentifier;
}

void sub_1B3CA8BFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id HCLogHearingXPC()
{
  if (HCLogHearingXPC_onceToken != -1)
    dispatch_once(&HCLogHearingXPC_onceToken, &__block_literal_global_20);
  return (id)HCLogHearingXPC___logObj;
}

void sub_1B3CA9B30(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void CSInitializeLogging()
{
  if (CSInitializeLogging_CSLoggingOnceToken != -1)
    dispatch_once(&CSInitializeLogging_CSLoggingOnceToken, &__block_literal_global_10);
}

uint64_t _axSettingsHandlePreferenceChanged(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t result;

  objc_opt_class();
  result = objc_opt_isKindOfClass();
  if ((result & 1) != 0)
    return objc_msgSend(a2, "_handlePreferenceChanged:", a3);
  return result;
}

void sub_1B3CAA20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void HAInitializeLogging()
{
  if (HAInitializeLogging_HALoggingOnceToken != -1)
    dispatch_once(&HAInitializeLogging_HALoggingOnceToken, &__block_literal_global_4);
}

void HearingInitializeLogging()
{
  if (HearingInitializeLogging_HearingLoggingOnceToken != -1)
    dispatch_once(&HearingInitializeLogging_HearingLoggingOnceToken, &__block_literal_global);
}

void PAInitializeLogging()
{
  if (PAInitializeLogging_PALoggingOnceToken != -1)
    dispatch_once(&PAInitializeLogging_PALoggingOnceToken, &__block_literal_global_7);
}

void HCHPInitializeLogging()
{
  if (HCHPInitializeLogging_CSLoggingOnceToken != -1)
    dispatch_once(&HCHPInitializeLogging_CSLoggingOnceToken, &__block_literal_global_13);
}

id HCLogSoundMeter()
{
  if (HCLogSoundMeter_onceToken != -1)
    dispatch_once(&HCLogSoundMeter_onceToken, &__block_literal_global_16);
  return (id)HCLogSoundMeter___logObj;
}

id HCLogHearingHandoff()
{
  if (HCLogHearingHandoff_onceToken != -1)
    dispatch_once(&HCLogHearingHandoff_onceToken, &__block_literal_global_18);
  return (id)HCLogHearingHandoff___logObj;
}

id HCLogHearingNearby()
{
  if (HCLogHearingNearby_onceToken != -1)
    dispatch_once(&HCLogHearingNearby_onceToken, &__block_literal_global_22);
  return (id)HCLogHearingNearby___logObj;
}

id HCLogHearingNearbyIDS()
{
  if (HCLogHearingNearbyIDS_onceToken != -1)
    dispatch_once(&HCLogHearingNearbyIDS_onceToken, &__block_literal_global_24);
  return (id)HCLogHearingNearbyIDS___logObj;
}

id HCLogHearingLiveListen()
{
  if (HCLogHearingLiveListen_onceToken != -1)
    dispatch_once(&HCLogHearingLiveListen_onceToken, &__block_literal_global_26);
  return (id)HCLogHearingLiveListen___logObj;
}

uint64_t HCDeviceGetType()
{
  if (HCDeviceGetType__AXCurrentDeviceTypeOnceToken != -1)
    dispatch_once(&HCDeviceGetType__AXCurrentDeviceTypeOnceToken, &__block_literal_global_22_0);
  return HCDeviceGetType__HCDeviceType;
}

void sub_1B3CAC454(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
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

uint64_t OUTLINED_FUNCTION_0()
{
  return objc_opt_class();
}

void HCPerformSafeBlock(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  v1[2]();

}

void sub_1B3CAD05C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, __int128 a9, int a10, __int16 a11, __int16 a12, uint64_t a13)
{
  id v13;
  NSObject *v14;
  id v15;
  id v16;
  void *v17;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(exception_object);
    v14 = (id)HAEngineeringLog;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v13, "name");
      v15 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reason");
      v16 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "callStackSymbols");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(a9) = 138412802;
      *(_QWORD *)((char *)&a9 + 4) = v15;
      WORD6(a9) = 2112;
      *(_QWORD *)((char *)&a9 + 14) = v16;
      a12 = 2112;
      a13 = (uint64_t)v17;
      _os_log_error_impl(&dword_1B3CA7000, v14, OS_LOG_TYPE_ERROR, "Caught exception '%@' while performing safe block; reason: '%@'. Stacktrace: %@.",
        (uint8_t *)&a9,
        0x20u);

    }
    objc_end_catch();
    JUMPOUT(0x1B3CAD024);
  }
  _Unwind_Resume(exception_object);
}

uint64_t messageIdentifierDescription(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  const __CFString *v3;
  const __CFString *v4;
  const __CFString *v5;
  const __CFString *v6;
  BOOL v7;
  uint64_t v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  BOOL v13;
  const __CFString *v14;
  const __CFString *v15;
  BOOL v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  const __CFString *v22;

  v3 = CFSTR("Unknown");
  if (a1 < 0x40000)
  {
    if (a1 <= 511)
    {
      if (a1 <= 15)
      {
        v4 = CFSTR("RegisterForDevicesUpdates");
        v19 = CFSTR("DevicePropertyWrite");
        if (a1 != 8)
          v19 = CFSTR("Unknown");
        if (a1 != 4)
          v4 = v19;
        if (a1 == 2)
          v3 = CFSTR("RegisterForAvailableDevicesUpdates");
        if (a1 == 0x8000000000000000)
          v3 = CFSTR("ControlMessage");
        v7 = a1 <= 3;
      }
      else
      {
        v4 = CFSTR("DevicePropertyValue");
        v5 = CFSTR("LiveListenStart");
        v6 = CFSTR("LiveListenRegisterForLevelsUpdates");
        if (a1 != 256)
          v6 = CFSTR("Unknown");
        if (a1 != 128)
          v5 = v6;
        if (a1 != 64)
          v4 = v5;
        if (a1 == 32)
          v3 = CFSTR("AvailableDevices");
        if (a1 == 16)
          v3 = CFSTR("DevicePropertyRead");
        v7 = a1 <= 63;
      }
LABEL_77:
      if (v7)
        v4 = v3;
      return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%llu)"), v4, a1, v1, v2);
    }
    if (a1 < 0x2000)
    {
      v4 = CFSTR("AvailableRemoteControllers");
      v21 = CFSTR("ControllerConnected");
      if (a1 != 4096)
        v21 = CFSTR("Unknown");
      if (a1 != 2048)
        v4 = v21;
      if (a1 == 1024)
        v3 = CFSTR("LiveListenListening");
      if (a1 == 512)
        v3 = CFSTR("LiveListenLevels");
      v7 = a1 <= 2047;
      goto LABEL_77;
    }
    v4 = CFSTR("RemoteControllerConnectWithReason");
    v14 = CFSTR("BoostPriority");
    v15 = CFSTR("MessagesPriority");
    if (a1 != 0x20000)
      v15 = CFSTR("Unknown");
    if (a1 != 0x10000)
      v14 = v15;
    if (a1 != 0x8000)
      v4 = v14;
    if (a1 == 0x4000)
      v3 = CFSTR("HearingAidReachability");
    if (a1 == 0x2000)
      v3 = CFSTR("RemoteControllerDisconnect");
    v16 = a1 < 0x8000;
    goto LABEL_65;
  }
  if (a1 <= 0x1FFFFFFFFFLL)
  {
    if (a1 < 0x400000)
    {
      v4 = CFSTR("HeadphoneLevelUpdates");
      v20 = CFSTR("RemoteHeadphoneLevelUpdates");
      if (a1 != 0x200000)
        v20 = CFSTR("Unknown");
      if (a1 != 0x100000)
        v4 = v20;
      if (a1 == 0x80000)
        v3 = CFSTR("ControllerCheckIn");
      if (a1 == 0x40000)
        v3 = CFSTR("EnvironmentalDosimetryUpdates");
      v16 = a1 < 0x100000;
LABEL_65:
      if (v16)
        v4 = v3;
      return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%llu)"), v4, a1, v1, v2);
    }
    v8 = 0xFFFFFFLL;
    v9 = CFSTR("TTYCallTypeActionSheet");
    if (a1 != 0x1000000000)
      v9 = CFSTR("Unknown");
    if (a1 == 0x800000000)
      v10 = CFSTR("TTYDatabaseAction");
    else
      v10 = v9;
    if (a1 == 0x1000000)
      v11 = CFSTR("ComfortSoundsAsset");
    else
      v11 = v10;
    v12 = CFSTR("RemoteHeadphoneLevelChangesUpdates");
    if (a1 == 0x800000)
      v3 = CFSTR("NoiseMeasurementsDisabled");
    v13 = a1 == 0x400000;
    goto LABEL_88;
  }
  if (a1 <= 0x1FFFFFFFFFFLL)
  {
    v8 = 0x7FFFFFFFFFLL;
    v22 = CFSTR("RTTRemoteUpdates");
    if (a1 != 0x10000000000)
      v22 = CFSTR("Unknown");
    if (a1 == 0x8000000000)
      v11 = CFSTR("TTYSuppressIncomingNotification");
    else
      v11 = v22;
    v12 = CFSTR("TTYDictionaryAction");
    if (a1 == 0x4000000000)
      v3 = CFSTR("RTTSettingsAction");
    v13 = a1 == 0x2000000000;
LABEL_88:
    if (v13)
      v3 = v12;
    if (a1 <= v8)
      v4 = v3;
    else
      v4 = v11;
    return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%llu)"), v4, a1, v1, v2);
  }
  if (a1 <= 0x7FFFFFFFFFFLL)
  {
    v17 = 0x20000000000;
    v18 = CFSTR("RTTServiceUpdates");
    if (a1 == 0x40000000000)
      v3 = CFSTR("RTTServerCacheSettingsAction");
  }
  else
  {
    v17 = 0x80000000000;
    v18 = CFSTR("RTTSystemMediaActions");
    if (a1 == 0x200000000000)
      v3 = CFSTR("RTTVoicemailMessage");
    if (a1 == 0x100000000000)
      v3 = CFSTR("RTTViewControllerIsVisible");
  }
  if (a1 == v17)
    v4 = v18;
  else
    v4 = v3;
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ (%llu)"), v4, a1, v1, v2);
}

void sub_1B3CAD59C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B3CAE168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

uint64_t AXLogSettings()
{
  return MEMORY[0x1E0CF3290]();
}

uint64_t AX_PERFORM_WITH_LOCK()
{
  return MEMORY[0x1E0CF38E8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x1E0D4E478]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1E0D4E580]();
}

uint64_t MKBUserUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E588]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
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

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x1E0C83668]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BE8](__x);
  return result;
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

int seteuid(uid_t a1)
{
  return MEMORY[0x1E0C85330](*(_QWORD *)&a1);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

FFTSetup vDSP_create_fftsetup(vDSP_Length __Log2n, FFTRadix __Radix)
{
  return (FFTSetup)MEMORY[0x1E0C8C060](__Log2n, *(_QWORD *)&__Radix);
}

void vDSP_ctoz(const DSPComplex *__C, vDSP_Stride __IC, const DSPSplitComplex *__Z, vDSP_Stride __IZ, vDSP_Length __N)
{
  MEMORY[0x1E0C8C070](__C, __IC, __Z, __IZ, __N);
}

void vDSP_destroy_fftsetup(FFTSetup __setup)
{
  MEMORY[0x1E0C8C0A0](__setup);
}

void vDSP_fft_zrip(FFTSetup __Setup, const DSPSplitComplex *__C, vDSP_Stride __IC, vDSP_Length __Log2N, FFTDirection __Direction)
{
  MEMORY[0x1E0C8C130](__Setup, __C, __IC, __Log2N, *(_QWORD *)&__Direction);
}

void vDSP_hann_window(float *__C, vDSP_Length __N, int __Flag)
{
  MEMORY[0x1E0C8C160](__C, __N, *(_QWORD *)&__Flag);
}

void vDSP_vdbcon(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N, unsigned int __F)
{
  MEMORY[0x1E0C8C420](__A, __IA, __B, __C, __IC, __N, *(_QWORD *)&__F);
}

void vDSP_vmul(const float *__A, vDSP_Stride __IA, const float *__B, vDSP_Stride __IB, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C740](__A, __IA, __B, __IB, __C, __IC, __N);
}

void vDSP_vsadd(const float *__A, vDSP_Stride __IA, const float *__B, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8C800](__A, __IA, __B, __C, __IC, __N);
}

void vDSP_zvmags(const DSPSplitComplex *__A, vDSP_Stride __IA, float *__C, vDSP_Stride __IC, vDSP_Length __N)
{
  MEMORY[0x1E0C8CAB8](__A, __IA, __C, __IC, __N);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
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

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

