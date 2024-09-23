id CCSRemoteServiceServerInterface()
{
  if (CCSRemoteServiceServerInterface_onceToken != -1)
    dispatch_once(&CCSRemoteServiceServerInterface_onceToken, &__block_literal_global_4);
  return (id)CCSRemoteServiceServerInterface_remoteServiceServerInterface;
}

void sub_215C162B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t CCSVisibilityPreferenceForBundleRecord(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(a1, "infoDictionary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("SBIconVisibilitySetByAppPreference"), objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisible"), objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisibleInstallTypes"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:ofClass:", CFSTR("SBIconVisibilityDefaultVisiblePlatforms"), objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = _CCSModuleVisibilityPreferenceFromFlagsAndAllowableInstallTypes(v2, v3, v4, v5);

  return v6;
}

uint64_t _CCSModuleVisibilityPreferenceFromFlagsAndAllowableInstallTypes(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  BOOL v12;
  uint64_t v13;
  const __CFString *v14;
  int v15;
  int v16;
  void *v17;
  int v18;
  void *v19;
  int v20;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v11 = (void *)v10;
  if (v7)
  {
    if (v8)
    {
      v12 = objc_msgSend(v8, "BOOLValue") == 0;
    }
    else
    {
      if (!(v9 | v10))
      {
        v13 = 2;
        goto LABEL_21;
      }
      if (v9)
      {
        if ((CCSIsInternalInstall() & 1) != 0)
        {
          v14 = CFSTR("internal");
        }
        else
        {
          objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isCarrierInstall");

          if (v18)
            v14 = CFSTR("carrier");
          else
            v14 = CFSTR("user");
        }
        v16 = objc_msgSend((id)v9, "containsObject:", v14);
        v15 = v16 ^ 1;
      }
      else
      {
        v15 = 0;
        v16 = 0;
      }
      if (v11)
      {
        v19 = (void *)MGGetStringAnswer();
        v20 = objc_msgSend(v11, "containsObject:", v19);
        v15 |= v20 ^ 1;
        v16 |= v20;

      }
      v12 = (v16 & (v15 ^ 1)) == 0;
    }
    if (v12)
      v13 = 2;
    else
      v13 = 1;
  }
  else
  {
    v13 = 0;
  }
LABEL_21:

  return v13;
}

uint64_t CCSIsInternalInstall()
{
  return os_variant_has_internal_content();
}

uint64_t CCSResolveModuleVisibility(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;

  v5 = a1;
  v6 = v5;
  if (a2 == 2)
  {
    if (!v5)
    {
      a3 = 0;
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if (a2 == 1)
  {
    if (!v5)
    {
      a3 = 1;
      goto LABEL_8;
    }
LABEL_6:
    a3 = objc_msgSend(v5, "BOOLValue");
  }
LABEL_8:

  return a3;
}

uint64_t _SBIconVisibilityNotificationRecieved(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_updateAvailableModuleMetadata");
}

void sub_215C17D08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215C18D40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215C195D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

const __CFString *NSStringFromIconElementType(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("unknown");
  else
    return off_24D460920[a1];
}

const __CFString *NSStringFromIconElementRequestIntent(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("unknown");
  else
    return off_24D460900[a1];
}

const __CFString *NSStringFromIconElementRequestErrorCode(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return CFSTR("CCSIconElementRequestErrorCodeUnknown");
  else
    return off_24D4608D0[a1 - 1];
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

const __CFString *NSStringFromCCSModuleSize(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 7)
    return CFSTR("CCSModuleSizeSmall");
  else
    return off_24D460C98[a1 - 1];
}

uint64_t CCSModuleSizeFromNSString(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v4;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeSmall")) & 1) == 0)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeSmallTall")) & 1) != 0)
    {
      v2 = 1;
      goto LABEL_19;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeSmallWide")) & 1) != 0)
    {
      v2 = 2;
      goto LABEL_19;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeSmallExtraWide")) & 1) != 0)
    {
      v2 = 3;
      goto LABEL_19;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeMedium")) & 1) != 0)
    {
      v2 = 4;
      goto LABEL_19;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeMediumWide")) & 1) != 0)
    {
      v2 = 5;
      goto LABEL_19;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeLarge")) & 1) != 0)
    {
      v2 = 6;
      goto LABEL_19;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeLargeTall")) & 1) != 0)
    {
      v2 = 7;
      goto LABEL_19;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("CCSModuleSizeLargeExtraTall")) & 1) != 0)
    {
      v2 = 8;
      goto LABEL_19;
    }
    v4 = CCSLogRemoteService;
    if (os_log_type_enabled((os_log_t)CCSLogRemoteService, OS_LOG_TYPE_ERROR))
      CCSModuleSizeFromNSString_cold_1((uint64_t)v1, v4);
  }
  v2 = 0;
LABEL_19:

  return v2;
}

void CCSRegisterControlCenterLogging()
{
  if (CCSRegisterControlCenterLogging_onceToken != -1)
    dispatch_once(&CCSRegisterControlCenterLogging_onceToken, &__block_literal_global_2);
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

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

const __CFString *CCSModuleVisibilityPreferenceDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("unsupported");
  if (a1 == 1)
    v1 = CFSTR("default visibile");
  if (a1 == 2)
    return CFSTR("default hidden");
  else
    return v1;
}

uint64_t CCSVisibilityPreferenceForBundleInfoDictionary(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v1 = a1;
  objc_msgSend(v1, "bs_safeNumberForKey:", CFSTR("SBIconVisibilitySetByAppPreference"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeNumberForKey:", CFSTR("SBIconVisibilityDefaultVisible"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeArrayForKey:", CFSTR("SBIconVisibilityDefaultVisibleInstallTypes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bs_safeArrayForKey:", CFSTR("SBIconVisibilityDefaultVisiblePlatforms"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = _CCSModuleVisibilityPreferenceFromFlagsAndAllowableInstallTypes(v2, v3, v4, v5);
  return v6;
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

void sub_215C20B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void CCSModuleSizeFromNSString_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_215C14000, a2, OS_LOG_TYPE_ERROR, "No matching module size found for string: %@", (uint8_t *)&v2, 0xCu);
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x24BE0BAD8]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x24BE0BD58]();
}

CFDictionaryRef CFBundleCopyInfoDictionaryInDirectory(CFURLRef bundleURL)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBA50](bundleURL);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

uint64_t MGCancelNotifications()
{
  return MEMORY[0x24BED8438]();
}

uint64_t MGCopyMultipleAnswers()
{
  return MEMORY[0x24BED8460]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x24BED84B0]();
}

uint64_t MGIsQuestionValid()
{
  return MEMORY[0x24BED84D0]();
}

uint64_t MGRegisterForBulkUpdates()
{
  return MEMORY[0x24BED84D8]();
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x24BDD1208](directory, domainMask, expandTilde);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
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

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

void os_activity_apply(os_activity_t activity, os_block_t block)
{
  MEMORY[0x24BDAF290](activity, block);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

