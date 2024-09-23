uint64_t ICHashWithHashKeys(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  uint64_t v9;
  uint64_t result;
  uint64_t *v11;
  char *v12;

  v12 = &a9;
  if (!a1)
    return 1;
  v9 = a1;
  result = 1;
  do
  {
    result = v9 - result + 32 * result;
    v11 = (uint64_t *)v12;
    v12 += 8;
    v9 = *v11;
  }
  while (v9);
  return result;
}

uint64_t ICDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a2;
  return 0;
}

uint64_t TSUDeviceRGBColorSpace()
{
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_28);
  return TSUDeviceRGBColorSpace_sDeviceRGBColorSpace;
}

uint64_t ICLaunchConfigurationEnvironmentWithString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PurplePerformanceTesting")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("UserInterfaceTesting")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_1DDAA9188(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

uint64_t ICDebugModeEnabled()
{
  void *v0;
  char v1;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("DebugModeEnabled"));

  if ((v1 & 1) != 0)
    return 1;
  CPSharedResourcesDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", CFSTR("/Library/Notes/"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("DebugModeEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  return v7;
}

uint64_t ICInternalSettingsIsSpotlightSearchSuggestionsEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v0, "BOOLForKey:", CFSTR("SpotlightSearchSuggestions")) & 1) != 0)
    v1 = 1;
  else
    v1 = _os_feature_enabled_impl();

  return v1;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_1DDAAA1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAAA5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

Class __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UserManagementLibrary();
  result = objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUMUserManagerClass_block_invoke_cold_1();
    return __getUMUserManagerClass_block_invoke_0(v3);
  }
  return result;
}

Class __getUMUserManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;
  uint64_t v3;

  UserManagementLibrary_0();
  result = objc_getClass("UMUserManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUMUserManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getUMUserManagerClass_block_invoke_cold_1();
    return (Class)UserManagementLibrary(v3);
  }
  return result;
}

void UserManagementLibrary()
{
  void *v0;

  if (!UserManagementLibraryCore_frameworkLibrary)
    UserManagementLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void UserManagementLibrary_0()
{
  void *v0;

  if (!UserManagementLibraryCore_frameworkLibrary_0)
    UserManagementLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!UserManagementLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

uint64_t ICUseCoreDataCoreSpotlightIntegration()
{
  if (ICUseCoreDataCoreSpotlightIntegration_onceToken != -1)
    dispatch_once(&ICUseCoreDataCoreSpotlightIntegration_onceToken, &__block_literal_global_17);
  return useCoreSpotlightCoreDataIntegration;
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t ICInternalSettingsIsTextKit2Enabled()
{
  if (ICInternalSettingsIsTextKit2Enabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsTextKit2Enabled_onceToken, &__block_literal_global_11);
  return ICInternalSettingsIsTextKit2Enabled_isEnabled;
}

void performBlockOnMainThreadAndWait(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  block = a1;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v1 = block;
    if (block)
    {
      block[2]();
LABEL_6:
      v1 = block;
    }
  }
  else
  {
    v1 = block;
    if (block)
    {
      dispatch_sync(MEMORY[0x1E0C80D38], block);
      goto LABEL_6;
    }
  }

}

void performBlockOnMainThread(void *a1)
{
  void (**v1)(void);
  void (**block)(void);

  block = a1;
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
  {
    v1 = block;
    if (block)
    {
      block[2]();
LABEL_6:
      v1 = block;
    }
  }
  else
  {
    v1 = block;
    if (block)
    {
      dispatch_async(MEMORY[0x1E0C80D38], block);
      goto LABEL_6;
    }
  }

}

const __CFString *ICTestHostBundleIdentifier()
{
  return CFSTR("com.apple.mobilenotes.TestHost");
}

id ICQuickLookExtensionBundleIdentifier()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ICNotesAppBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.QuickLookExtension"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

__CFString *ICInternalPreferencesChangedNotification()
{
  if (ICIsSandboxModeEnabled())
    return CFSTR("com.apple.mobilenotesdebug.internalprefschanged");
  else
    return CFSTR("com.apple.mobilenotes.internalprefschanged");
}

uint64_t ICCheckedDynamicCast(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "src == ((void *)0) || result != ((void *)0)", "id ICCheckedDynamicCast(Class, id<NSObject>)", 1, 0, CFSTR("Unexpected object type in checked dynamic cast %@ expects %@"), objc_opt_class(), a1);
    return 0;
  }
  return v2;
}

__CFString *ICGroupContainerIdentifier()
{
  if (ICIsSandboxModeEnabled())
    return CFSTR("group.com.apple.notesdebug");
  else
    return CFSTR("group.com.apple.notes");
}

__CFString *ICNotesAppBundleIdentifier()
{
  if (ICIsSandboxModeEnabled())
    return CFSTR("com.apple.mobilenotesdebug");
  else
    return CFSTR("com.apple.mobilenotes");
}

uint64_t ICIsSandboxModeEnabled()
{
  if ((_ICDidInquireSandboxModeEnabled & 1) == 0)
    _ICDidInquireSandboxModeEnabled = 1;
  return _ICIsSandboxModeEnabled;
}

void sub_1DDAAD73C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Block_object_dispose((const void *)(v29 - 112), 8);
  _Block_object_dispose((const void *)(v29 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DDAADA34(_Unwind_Exception *a1)
{
  void *v1;

  objc_end_catch();
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAAE1DC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t ICVerboseSearchLogging()
{
  if (ICVerboseSearchLogging_onceToken != -1)
    dispatch_once(&ICVerboseSearchLogging_onceToken, &__block_literal_global_6_0);
  return verboseSearchLogging;
}

void *ICProtocolCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "conformsToProtocol:", a1))
    return a2;
  return 0;
}

void *ICClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t *v11;
  uint64_t *v13;

  v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v13 = &a9;
    if (a3)
    {
      while (1)
      {
        v11 = v13++;
        if ((objc_msgSend(v9, "conformsToProtocol:", *v11) & 1) == 0)
          break;
        if (!--a3)
          return v9;
      }
      return 0;
    }
  }
  return v9;
}

void dispatchMainAfterDelay(void *a1, double a2)
{
  id v3;
  void *v4;
  dispatch_time_t v5;
  dispatch_block_t block;

  v3 = a1;
  v4 = v3;
  if (v3)
  {
    block = v3;
    if (a2 == 0.0)
    {
      dispatch_async(MEMORY[0x1E0C80D38], v3);
    }
    else
    {
      v5 = dispatch_time(0, (uint64_t)(a2 * 1000000000.0));
      dispatch_after(v5, MEMORY[0x1E0C80D38], block);
    }
    v4 = block;
  }

}

const __CFString *ICSharedFrameworkBundleIdentifier()
{
  return CFSTR("com.apple.NotesShared");
}

void sub_1DDAB0790(void *a1, uint64_t a2)
{
  uint64_t v2;

  -[NSObject(IC) ic_removeObserver:forKeyPath:context:].cold.1(a1, a2, v2);
  JUMPOUT(0x1DDAB0778);
}

void sub_1DDAB0CB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDAB0ECC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ICInternalSettingsIsSelectionStateTrackingEnabled()
{
  int v0;
  void *v1;
  uint64_t v2;

  v0 = _os_feature_enabled_impl();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("EnableSelectionStateTracking")) | v0;

  return v2;
}

void OUTLINED_FUNCTION_3_2(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1DDAB1918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DDAB2174(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

uint64_t TSDRectHasNaNComponents()
{
  return 0;
}

uint64_t TSDRectHasInfComponents(double a1, double a2, double a3, double a4)
{
  double v4;
  _BOOL4 v7;

  v4 = fabs(a3);
  if (fabs(a4) == INFINITY || v4 == INFINITY)
    return 1;
  v7 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v7;
}

uint64_t TSDPointHasNaNComponents()
{
  return 0;
}

uint64_t TSDPointHasInfComponents(double a1, double a2)
{
  _BOOL4 v2;

  v2 = fabs(a1) == INFINITY;
  return fabs(a2) == INFINITY || v2;
}

BOOL TSDNearlyEqualRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL8 result;
  _BOOL4 v9;

  result = 0;
  if (vabdd_f64(a1, a5) < 0.01 && vabdd_f64(a2, a6) < 0.01)
  {
    v9 = vabdd_f64(a3, a7) < 0.01;
    return vabdd_f64(a4, a8) < 0.01 && v9;
  }
  return result;
}

id ICKeyPathFromSelectors(const char *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v10;
  void *v11;
  const char **v12;
  void *v13;
  const char **v15;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (const char **)&a9;
  while (a1)
  {
    NSStringFromSelector(a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObject:", v11);
    v12 = v15++;
    a1 = *v12;

  }
  objc_msgSend(v10, "componentsJoinedByString:", CFSTR("."));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t ICInternalSettingsIsBlockQuoteEnabled()
{
  if (ICInternalSettingsIsBlockQuoteEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsBlockQuoteEnabled_onceToken, &__block_literal_global_147);
  return ICInternalSettingsIsBlockQuoteEnabled_isEnabled;
}

BOOL ICInternalSettingsGetBundleBoolSettingValue(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  __CFString *v3;
  const __CFString *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  _BOOL8 v8;

  v1 = a1;
  v2 = ICNotesAppBundleIdentifier();
  CFPreferencesAppSynchronize(v2);
  v3 = ICNotesAppBundleIdentifier();
  v4 = (const __CFString *)NSUserName();
  v5 = (const __CFBoolean *)CFPreferencesCopyValue(v1, v3, v4, (CFStringRef)*MEMORY[0x1E0C9B230]);
  if (v5)
  {
    v6 = v5;
    v7 = CFGetTypeID(v5);
    if (v7 == CFBooleanGetTypeID())
    {
      v8 = CFBooleanGetValue(v6) != 0;
    }
    else
    {
      +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "BOOL ICInternalSettingsGetBundleBoolSettingValue(NSString *__strong)", 1, 0, CFSTR("Unexpected type id for internal setting %@"), v1);
      v8 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t ICInternalSettingsDefaultToPaperKitAttachments()
{
  void *v0;
  uint64_t v1;

  +[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("DefaultToPaperKitAttachments"));

  return v1;
}

void sub_1DDAB2C38(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1DDAB2D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAB2E9C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DDAB32C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDAB3598(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAB36F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id ICStringFromCGColor(CGColor *a1)
{
  void *v2;
  CGColorSpace *ColorSpace;
  __CFString *v4;
  size_t NumberOfComponents;
  const CGFloat *Components;
  const CGFloat *v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  void *v11;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  ColorSpace = CGColorGetColorSpace(a1);
  v4 = (__CFString *)CGColorSpaceCopyName(ColorSpace);
  if (v4)
  {
    objc_msgSend(v2, "addObject:", v4);
    NumberOfComponents = CGColorGetNumberOfComponents(a1);
    Components = CGColorGetComponents(a1);
    if (NumberOfComponents)
    {
      v7 = Components;
      do
      {
        v8 = *(_QWORD *)v7++;
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.10f"), v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "addObject:", v9);

        --NumberOfComponents;
      }
      while (NumberOfComponents);
    }
  }
  else
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ICStringFromCGColor_cold_1();

  }
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "componentsJoinedByString:", CFSTR(";"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

CGColorRef ICCGColorCreateWithString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  __CFString *v4;
  CGColorSpaceRef v5;
  CGColorSpace *v6;
  uint64_t v7;
  CGFloat *v8;
  uint64_t i;
  void *v10;
  CGFloat v11;
  CGColorRef v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;

  v1 = a1;
  objc_msgSend(v1, "componentsSeparatedByString:", CFSTR(";"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v3, "firstObject");
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObjectAtIndex:", 0);
    v5 = CGColorSpaceCreateWithName(v4);
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v3, "count"))
      {
        v7 = CGColorSpaceGetNumberOfComponents(v6) + 1;
        if (objc_msgSend(v3, "count") == v7)
        {
          v8 = (CGFloat *)malloc_type_malloc(8 * v7, 0x100004000313F17uLL);
          if (v7)
          {
            for (i = 0; i != v7; ++i)
            {
              objc_msgSend(v3, "objectAtIndexedSubscript:", i);
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v10, "doubleValue");
              v8[i] = v11;

            }
          }
          v12 = CGColorCreate(v6, v8);
          free(v8);
          goto LABEL_22;
        }
        v15 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          ICCGColorCreateWithString_cold_4(v3, v7, v15);

      }
      else
      {
        v14 = os_log_create("com.apple.notes", "UI");
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          ICCGColorCreateWithString_cold_3();

      }
      v12 = 0;
LABEL_22:
      CGColorSpaceRelease(v6);
      goto LABEL_23;
    }
    v13 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      ICCGColorCreateWithString_cold_2();

  }
  else
  {
    v4 = (__CFString *)os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
      ICCGColorCreateWithString_cold_1();
  }
  v12 = 0;
LABEL_23:

  return v12;
}

CGColorRef ICCGColorCopyInverse(CGColor *a1)
{
  const CGFloat *Components;
  uint64_t v3;
  uint64_t v4;
  const CGFloat *v5;
  uint64_t v6;
  double *v7;
  double *v8;
  double v9;
  CGColorSpace *ColorSpace;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  Components = CGColorGetComponents(a1);
  CGColorGetNumberOfComponents(a1);
  MEMORY[0x1E0C80A78]();
  v5 = (const CGFloat *)((char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (v3)
  {
    v6 = v3;
    v7 = (double *)Components;
    v8 = (double *)v5;
    do
    {
      v9 = *v7++;
      *v8++ = 1.0 - v9;
      --v6;
    }
    while (v6);
  }
  v5[v3] = Components[v3];
  ColorSpace = CGColorGetColorSpace(a1);
  return CGColorCreate(ColorSpace, v5);
}

uint64_t ICCGColorEquivalentToColor(CGColor *a1, CGColor *a2)
{
  uint64_t v3;
  CGColorSpace *DeviceRGB;
  CGColor *CopyByMatchingToColorSpace;
  CGColor *v8;
  size_t NumberOfComponents;
  const CGFloat *Components;
  const CGFloat *v11;
  size_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  BOOL v18;

  if (!((unint64_t)a1 | (unint64_t)a2))
    return 1;
  v3 = 0;
  if (!a1 || !a2)
    return v3;
  CGColorGetColorSpace(a1);
  CGColorGetColorSpace(a2);
  if ((CGColorSpaceEqualToColorSpace() & 1) != 0)
  {
    if (!CGColorEqualToColor(a1, a2))
    {
      NumberOfComponents = CGColorGetNumberOfComponents(a1);
      if (NumberOfComponents != CGColorGetNumberOfComponents(a2))
        return 0;
      Components = CGColorGetComponents(a1);
      v11 = CGColorGetComponents(a2);
      if (NumberOfComponents)
      {
        v12 = NumberOfComponents - 1;
        do
        {
          v13 = *Components++;
          v14 = v13;
          v15 = *v11++;
          v16 = vabdd_f64(v14, v15);
          v18 = v12-- != 0;
          v3 = v16 < 0.00999999978;
        }
        while (v16 < 0.00999999978 && v18);
        return v3;
      }
    }
    return 1;
  }
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  CopyByMatchingToColorSpace = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, a1, 0);
  v8 = CGColorCreateCopyByMatchingToColorSpace(DeviceRGB, kCGRenderingIntentDefault, a2, 0);
  CGColorGetColorSpace(CopyByMatchingToColorSpace);
  CGColorGetColorSpace(v8);
  v3 = 0;
  if (CGColorSpaceEqualToColorSpace())
    v3 = ICCGColorEquivalentToColor(CopyByMatchingToColorSpace, v8);
  CGColorSpaceRelease(DeviceRGB);
  CGColorRelease(CopyByMatchingToColorSpace);
  CGColorRelease(v8);
  return v3;
}

id ICDataFromCGImage(CGImage *a1, const __CFString *a2, void *a3)
{
  const __CFDictionary *v5;
  __CFData *v6;
  CGImageDestination *v7;
  CGImageDestination *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;

  v5 = a3;
  v6 = (__CFData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v7 = CGImageDestinationCreateWithData(v6, a2, 1uLL, 0);
  if (!v7)
  {
    v10 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ICDataFromCGImage_cold_1(v10);

    goto LABEL_10;
  }
  v8 = v7;
  CGImageDestinationAddImage(v7, a1, v5);
  if (!CGImageDestinationFinalize(v8))
  {
    v11 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      ICDataFromCGImage_cold_2((uint64_t)a2, v11);

    CFRelease(v8);
LABEL_10:
    v9 = 0;
    goto LABEL_11;
  }
  CFRelease(v8);
  v9 = (void *)-[__CFData copy](v6, "copy");
LABEL_11:

  return v9;
}

id ICJPEGDataFromCGImage(CGImage *a1)
{
  __CFString *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x1E0CEC530], "identifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  ICDataFromCGImage(a1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id ICPNGDataFromCGImage(CGImage *a1)
{
  __CFString *v2;
  void *v3;

  objc_msgSend((id)*MEMORY[0x1E0CEC580], "identifier");
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  ICDataFromCGImage(a1, v2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void sub_1DDAB4910(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
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

void sub_1DDAB5584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, char a15)
{
  void *v15;

  objc_sync_exit(v15);
  _Block_object_dispose(&a15, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAB5788(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Block_object_dispose(&a17, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAB5A48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1DDAB5B00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

UTType *__getUMUserPersonaAttributesClass_block_invoke(uint64_t a1)
{
  UTType *result;
  void *v3;
  SEL v4;

  UserManagementLibrary();
  result = (UTType *)objc_getClass("UMUserPersonaAttributes");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUMUserPersonaAttributesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getUMUserPersonaAttributesClass_block_invoke_cold_1();
    return +[ICArchive universalTypeIdentifier](v3, v4);
  }
  return result;
}

void sub_1DDAB8214(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAB886C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
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

void sub_1DDAB9794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAB9A2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAB9CC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 168), 8);
  _Block_object_dispose((const void *)(v34 - 120), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_10(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

uint64_t OUTLINED_FUNCTION_12()
{
  return objc_msgSend(0, "count");
}

void sub_1DDABB830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void *ICSpecificCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "isMemberOfClass:", a1))
    return a2;
  return 0;
}

CFTypeRef ICCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf)
    return 0;
  if (CFGetTypeID(cf) == a1)
    return cf;
  return 0;
}

void *ICCheckedProtocolCast(Protocol *a1, void *a2)
{
  uint64_t v4;
  const char *Name;

  if (!a1)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "protocol", "id ICCheckedProtocolCast(Protocol *, id<NSObject>)", 1, 0, CFSTR("Protocol is nil"));
  if (a2 && (objc_msgSend(a2, "conformsToProtocol:", a1) & 1) == 0)
  {
    v4 = objc_opt_class();
    if (a1)
      Name = protocol_getName(a1);
    else
      Name = "<No protocol supplied>";
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "src == ((void *)0) || result != ((void *)0)", "id ICCheckedProtocolCast(Protocol *, id<NSObject>)", 1, 0, CFSTR("Unexpected object type in checked protocol cast %@ expects %s"), v4, Name);
    return 0;
  }
  return a2;
}

void sub_1DDABC4B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t ICInternalSettingsIsTracingEnabled()
{
  if (ICInternalSettingsIsTracingEnabled_predicate != -1)
    dispatch_once(&ICInternalSettingsIsTracingEnabled_predicate, &__block_literal_global_7);
  return ICInternalSettingsIsTracingEnabled_ICInternalSettingsTraceEnabled;
}

id ICGenericError()
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("com.apple.notes"), -1, 0);
}

uint64_t ICRectEdgeAtIndex(unint64_t a1)
{
  if (a1 >= 4)
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "index < 4", "ICRectEdge ICRectEdgeAtIndex(NSUInteger)", 1, 0, CFSTR("Invalid edge index %lu"), a1);
  if (a1 <= 3)
    return (1 << a1);
  else
    return 0;
}

uint64_t ICRectEdgeToIndex(uint64_t a1)
{
  uint64_t v1;

  v1 = a1 - 1;
  if ((unint64_t)(a1 - 1) < 8 && ((0x8Bu >> v1) & 1) != 0)
    return qword_1DDAF0600[v1];
  +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "__objc_no", "NSUInteger ICRectEdgeToIndex(ICRectEdge)", 1, 0, CFSTR("Invalid edge %lu"), a1);
  return 0x7FFFFFFFFFFFFFFFLL;
}

uint64_t ICStringFromRect(double a1, double a2, double a3, double a4)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.02f, %.02f} {%.02f, %.02f}"), *(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

__CFString *ICImportGroupContainerIdentifier()
{
  if (ICIsSandboxModeEnabled())
    return CFSTR("group.com.apple.notesdebug.import");
  else
    return CFSTR("group.com.apple.notes.import");
}

const __CFString *ICSupportFrameworkBundleIdentifier()
{
  return CFSTR("com.apple.NotesSupport");
}

const __CFString *ICHTMLFrameworkBundleIdentifier()
{
  return CFSTR("com.apple.Notes");
}

const __CFString *ICUIFrameworkBundleIdentifier()
{
  return CFSTR("com.apple.NotesUI");
}

id ICDataStoreServiceBundleIdentifier()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ICNotesAppBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.datastore"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ICIntentsExtensionBundleIdentifier()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ICNotesAppBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.IntentsExtension"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ICSharingExtensionBundleIdentifier()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ICNotesAppBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.SharingExtension"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id ICEditorExtensionBundleIdentifier()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x1E0CB3940];
  ICNotesAppBundleIdentifier();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringWithFormat:", CFSTR("%@.EditorExtension"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

const __CFString *ICSystemPaperViewServiceBundleIdentifier()
{
  return CFSTR("com.apple.SystemPaperViewService");
}

id getPHPhotoLibraryClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getPHPhotoLibraryClass_softClass;
  v7 = getPHPhotoLibraryClass_softClass;
  if (!getPHPhotoLibraryClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getPHPhotoLibraryClass_block_invoke;
    v3[3] = &unk_1EA823E40;
    v3[4] = &v4;
    __getPHPhotoLibraryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1DDABED88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getPHPhotoLibraryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PhotosLibraryCore_frameworkLibrary)
  {
    PhotosLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PhotosLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("PHPhotoLibrary");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getPHPhotoLibraryClass_block_invoke_cold_1();
    free(v3);
  }
  getPHPhotoLibraryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DDABFE50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,char a53)
{
  _Block_object_dispose(&a53, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAC0ACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDAC0D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSYItemIndexingManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SynapseLibraryCore_frameworkLibrary)
  {
    SynapseLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SynapseLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SYItemIndexingManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getSYItemIndexingManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getSYItemIndexingManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t ICInternalSettingsIsAlexandriaEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICArchive userDefaultsKey](ICArchive, "userDefaultsKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "BOOLForKey:", v1);

  return v2;
}

uint64_t ICInternalSettingsIsAlexandriaDemoModeEnabled()
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  +[ICArchive demoModeUserDefaultsKey](ICArchive, "demoModeUserDefaultsKey");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v0, "BOOLForKey:", v1);

  return v2;
}

uint64_t ICInternalSettingsIsSystemPaperEnabled()
{
  int v0;

  v0 = MGGetSInt32Answer();
  if (v0 == 3)
    return 1;
  if ((v0 - 1) > 1)
    return 0;
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsDefaultToPaperKitPDFsAndScans()
{
  uint64_t result;
  void *v1;
  uint64_t v2;

  result = ICInternalSettingsIsPDFsInNotesEnabled();
  if ((_DWORD)result)
  {
    +[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("DefaultToPaperKitPDFsAndScans"));

    return v2;
  }
  return result;
}

uint64_t ICInternalSettingsIsPDFsInNotesEnabled()
{
  void *v0;
  uint64_t v1;

  if (!_os_feature_enabled_impl())
    return 0;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("ICUseLegacyPDFAttachments")) ^ 1;

  return v1;
}

uint64_t ICInternalSettingsIsMentionNotificationsDisabled()
{
  void *v0;
  uint64_t v1;

  +[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("internalSettings.disableMentionNotifications"));

  return v1;
}

uint64_t ICInternalSettingsIsPageViewControllerCrashWorkaroundDisabled()
{
  void *v0;
  uint64_t v1;

  +[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("DisablePageViewControllerCrashWorkaround"));

  return v1;
}

uint64_t ICInternalSettingsSmartFoldersCanIncludeRecentlyDeletedNotes()
{
  void *v0;
  uint64_t v1;

  +[ICAppGroupDefaults sharedAppGroupDefaults](ICAppGroupDefaults, "sharedAppGroupDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("internalSettings.smartFoldersCanIncludeRecentlyDeletedNotes"));

  return v1;
}

uint64_t ICInternalSettingsIsLockedNotesV1NeoEnabled()
{
  uint64_t v0;
  void *v1;

  if (+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests"))
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v1, "BOOLForKey:", CFSTR("EnableLockedNotesV1Neo")) & 1) != 0)
    v0 = 1;
  else
    v0 = _os_feature_enabled_impl();

  return v0;
}

uint64_t ICInternalSettingsIsAudioTranscriptionEnabled()
{
  if (ICInternalSettingsIsAudioTranscriptionEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsAudioTranscriptionEnabled_onceToken, &__block_literal_global_141);
  return ICInternalSettingsIsAudioTranscriptionEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsCallRecordingEnabled()
{
  if (ICInternalSettingsIsAudioTranscriptionEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsAudioTranscriptionEnabled_onceToken, &__block_literal_global_141);
  if (ICInternalSettingsIsAudioTranscriptionEnabled_isEnabled)
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t ICInternalSettingsIsAudioKeyPointsEnabled()
{
  if (ICInternalSettingsIsAudioKeyPointsEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsAudioKeyPointsEnabled_onceToken, &__block_literal_global_145);
  return ICInternalSettingsIsAudioKeyPointsEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsAudioMastihaEnabled()
{
  if (ICInternalSettingsIsAudioMastihaEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsAudioMastihaEnabled_onceToken, &__block_literal_global_146);
  return ICInternalSettingsIsAudioMastihaEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsCollapsibleSectionsEnabled()
{
  if (ICInternalSettingsIsCollapsibleSectionsEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsCollapsibleSectionsEnabled_onceToken, &__block_literal_global_149);
  return ICInternalSettingsIsCollapsibleSectionsEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsNewNoteAcceleratorEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("EnableNewNoteAccelerator"));

  return v1;
}

uint64_t ICInternalSettingsIsSpotlightInstantAnswersEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("EnableSpotlightInstantAnswers"));

  return v1;
}

uint64_t ICInternalSettingsIsAsyncFindEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsFindPDFsEnabled()
{
  uint64_t result;

  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return _os_feature_enabled_impl();
  return result;
}

uint64_t ICInternalSettingsIsLinkConversionEnabled()
{
  if (ICInternalSettingsIsLinkConversionEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsLinkConversionEnabled_onceToken, &__block_literal_global_153);
  return ICInternalSettingsIsLinkConversionEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsViewProviderCacheDisabled()
{
  if (ICInternalSettingsIsViewProviderCacheDisabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsViewProviderCacheDisabled_onceToken, &__block_literal_global_155);
  return ICInternalSettingsIsViewProviderCacheDisabled_isEnabled;
}

uint64_t ICInternalSettingsIsGreyParrotEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsMathEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_157);
  return ICInternalSettingsIsMathEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsMathDebugHighlightingEnabled()
{
  if (ICInternalSettingsIsMathDebugHighlightingEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsMathDebugHighlightingEnabled_onceToken, &__block_literal_global_159);
  return ICInternalSettingsIsMathDebugHighlightingEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsNotesMathEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_157);
  return ICInternalSettingsIsMathEnabled_isEnabled;
}

uint64_t ICInternalSettingsIsPaperKitMathEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_157);
  if (ICInternalSettingsIsMathEnabled_isEnabled)
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t ICInternalSettingsIsScrubbingEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_157);
  if (ICInternalSettingsIsMathEnabled_isEnabled)
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t ICInternalSettingsIsGraphingEnabled()
{
  if (ICInternalSettingsIsMathEnabled_onceToken != -1)
    dispatch_once(&ICInternalSettingsIsMathEnabled_onceToken, &__block_literal_global_157);
  if (ICInternalSettingsIsMathEnabled_isEnabled && ICInternalSettingsIsPaperKitMathEnabled())
    return _os_feature_enabled_impl();
  else
    return 0;
}

uint64_t ICInternalSettingsIsEmphasisEnabled()
{
  void *v1;
  uint64_t v2;

  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("EnableEmphasis"));

  return v2;
}

uint64_t ICInternalSettingsShouldPreserveImportedCallRecordingData()
{
  if (ICInternalSettingsShouldPreserveImportedCallRecordingData_onceToken != -1)
    dispatch_once(&ICInternalSettingsShouldPreserveImportedCallRecordingData_onceToken, &__block_literal_global_164);
  return ICInternalSettingsShouldPreserveImportedCallRecordingData_isEnabled;
}

uint64_t ICInternalSettingsShouldDisableTranscriptPostProcessing()
{
  if (ICInternalSettingsShouldDisableTranscriptPostProcessing_onceToken != -1)
    dispatch_once(&ICInternalSettingsShouldDisableTranscriptPostProcessing_onceToken, &__block_literal_global_165);
  return ICInternalSettingsShouldDisableTranscriptPostProcessing_isEnabled;
}

uint64_t ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs()
{
  if (ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_onceToken != -1)
    dispatch_once(&ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_onceToken, &__block_literal_global_166);
  return ICInternalSettingsShouldPostProcessOnlyTranscriptParagraphs_isEnabled;
}

uint64_t ICInternalSettingsIsGenerationToolEnabled()
{
  uint64_t result;

  if (+[ICDeviceSupport isRunningUnitTests](ICDeviceSupport, "isRunningUnitTests"))
    return 1;
  result = _os_feature_enabled_impl();
  if ((_DWORD)result)
    return _os_feature_enabled_impl();
  return result;
}

uint64_t ICInternalSettingsIsAppleAccountBrandingEnabled()
{
  return _os_feature_enabled_impl();
}

uint64_t ICInternalSettingsIsOnenessUnlockEnabled()
{
  return _os_feature_enabled_impl();
}

const __CFString *NSStringFromICLaunchConfigurationEnvironment(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Default");
  if (a1 == 1)
    v1 = CFSTR("PurplePerformanceTesting");
  if (a1 == 2)
    return CFSTR("UserInterfaceTesting");
  else
    return v1;
}

id ICUnlocalizedString(void *a1)
{
  return a1;
}

void sub_1DDAC2D44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAC2DC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAC2E28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAC2EB8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAC2F40(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAC2FE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAC3974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1DDAC3B04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAC4E84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAC5154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

const __CFString *NSStringFromNotesVersion(uint64_t a1)
{
  const __CFString *result;

  switch(a1)
  {
    case 0:
      result = CFSTR("Fall2015");
      break;
    case 1:
      result = CFSTR("Fall2016");
      break;
    case 2:
      result = CFSTR("Fall2017");
      break;
    case 3:
      result = CFSTR("Fall2018");
      break;
    case 4:
      result = CFSTR("Fall2019");
      break;
    case 5:
      result = CFSTR("Fall2020");
      break;
    case 6:
      result = CFSTR("Spring2021");
      break;
    case 7:
      result = CFSTR("Fall2021");
      break;
    case 8:
      result = CFSTR("Spring2022");
      break;
    case 9:
      result = CFSTR("Fall2022");
      break;
    case 10:
      result = CFSTR("Fall2022B");
      break;
    case 11:
      result = CFSTR("Winter2022");
      break;
    case 12:
      result = CFSTR("Spring2023");
      break;
    case 13:
      result = CFSTR("Fall2023");
      break;
    case 14:
      result = CFSTR("Spring2024");
      break;
    case 15:
      result = CFSTR("Fall2024");
      break;
    default:
      if (a1 == 0x7FFFFFFFFFFFFFFFLL)
        result = CFSTR("Unknown");
      else
        result = CFSTR("Before2015");
      break;
  }
  return result;
}

void __getUMUserPersonaAttributesClass_block_invoke_0(uint64_t a1)
{
  ICPersistenceConfiguration *v2;
  SEL v3;

  UserManagementLibrary_0();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UMUserPersonaAttributes");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUMUserPersonaAttributesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (ICPersistenceConfiguration *)__getUMUserPersonaAttributesClass_block_invoke_cold_1();
    -[ICPersistenceConfiguration .cxx_destruct](v2, v3);
  }
}

void sub_1DDAC5C50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void ReachabilityCallback(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0CB37D0];
  v4 = a3;
  objc_msgSend(v3, "defaultCenter");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "postNotificationName:object:", kReachabilityChangedNotification, v4);

}

uint64_t ICReindexAlertEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("reindexingAlertEnabled"));

  return v1;
}

void ICEnableSandboxMode()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v15[16];

  if (_ICDidInquireSandboxModeEnabled == 1)
  {
    v0 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
      ICEnableSandboxMode_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
  else if (_ICIsSandboxModeEnabled == 1)
  {
    v0 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
      ICEnableSandboxMode_cold_2(v0, v8, v9, v10, v11, v12, v13, v14);
  }
  else
  {
    _ICIsSandboxModeEnabled = 1;
    v0 = os_log_create("com.apple.notes", "Application");
    if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1DDAA5000, v0, OS_LOG_TYPE_INFO, "Enabled sandbox mode", v15, 2u);
    }
  }

}

__CFString *ICSearchableIndexName()
{
  if (ICIsSandboxModeEnabled())
    return CFSTR("NotesDebug");
  else
    return CFSTR("Notes");
}

void sub_1DDAC85AC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 40));
  _Unwind_Resume(a1);
}

void sub_1DDAC8A28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDAC8BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1DDAC8EC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAC95B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDAC9E94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDACA418(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DDACAD70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_1DDACAFE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DDACB0EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_10_1(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

const __CFString *ICSettingsBundleID()
{
  if (ICIsSandboxModeEnabled())
    return CFSTR("com.apple.mobilenotesdebug");
  else
    return CFSTR("com.apple.mobilenotes");
}

uint64_t ICHashWithArray(void *a1)
{
  id v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_opt_class();
          ICCheckedDynamicCast(v11, (uint64_t)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = objc_opt_class();
            ICCheckedDynamicCast(v14, (uint64_t)v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = ICHashWithDictionary(v12);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = objc_opt_class();
              ICCheckedDynamicCast(v15, (uint64_t)v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = ICHashWithSet(v12);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = objc_opt_class();
                ICCheckedDynamicCast(v16, (uint64_t)v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = ICHashWithOrderedSet(v12);
              }
              else
              {
                v17 = objc_msgSend(v10, "hash", (_QWORD)v19);
                if (v17)
                  goto LABEL_17;
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "hash");
              }
            }
          }
        }
        v17 = v13;

LABEL_17:
        v4 = v17 + 31 * v4;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t ICHashWithDictionary(void *a1)
{
  id v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v5 = v1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", v10, (_QWORD)v29);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v10;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = objc_opt_class();
          ICCheckedDynamicCast(v13, (uint64_t)v12);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 = objc_opt_class();
            ICCheckedDynamicCast(v16, (uint64_t)v12);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v17 = objc_opt_class();
              ICCheckedDynamicCast(v17, (uint64_t)v12);
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              v15 = ICHashWithSet(v14);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v18 = objc_opt_class();
                ICCheckedDynamicCast(v18, (uint64_t)v12);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = ICHashWithOrderedSet(v14);
              }
              else
              {
                v19 = objc_msgSend(v12, "hash");
                if (v19)
                  goto LABEL_17;
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                v15 = objc_msgSend(v14, "hash");
              }
            }
          }
        }
        v19 = v15;

LABEL_17:
        v20 = v11;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v21 = objc_opt_class();
          ICCheckedDynamicCast(v21, (uint64_t)v20);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          v23 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v24 = objc_opt_class();
            ICCheckedDynamicCast(v24, (uint64_t)v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v25 = objc_opt_class();
              ICCheckedDynamicCast(v25, (uint64_t)v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = ICHashWithSet(v22);
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v26 = objc_opt_class();
                ICCheckedDynamicCast(v26, (uint64_t)v20);
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = ICHashWithOrderedSet(v22);
              }
              else
              {
                v27 = objc_msgSend(v20, "hash");
                if (v27)
                  goto LABEL_28;
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v22 = (void *)objc_claimAutoreleasedReturnValue();
                v23 = objc_msgSend(v22, "hash");
              }
            }
          }
        }
        v27 = v23;

LABEL_28:
        v4 += 31 * v19 + v27;

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t ICHashWithSet(void *a1)
{
  id v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_opt_class();
          ICCheckedDynamicCast(v11, (uint64_t)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = objc_opt_class();
            ICCheckedDynamicCast(v14, (uint64_t)v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = objc_opt_class();
              ICCheckedDynamicCast(v15, (uint64_t)v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = ICHashWithSet();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = objc_opt_class();
                ICCheckedDynamicCast(v16, (uint64_t)v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = ICHashWithOrderedSet(v12);
              }
              else
              {
                v17 = objc_msgSend(v10, "hash", (_QWORD)v19);
                if (v17)
                  goto LABEL_17;
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "hash");
              }
            }
          }
        }
        v17 = v13;

LABEL_17:
        v4 += v17;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v4;
}

uint64_t ICHashWithOrderedSet(void *a1)
{
  id v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = (objc_class *)objc_opt_class();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = v1;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(v5);
        v10 = *(id *)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v11 = objc_opt_class();
          ICCheckedDynamicCast(v11, (uint64_t)v10);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = ICHashWithArray();
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = objc_opt_class();
            ICCheckedDynamicCast(v14, (uint64_t)v10);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            v13 = ICHashWithDictionary();
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v15 = objc_opt_class();
              ICCheckedDynamicCast(v15, (uint64_t)v10);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              v13 = ICHashWithSet();
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                v16 = objc_opt_class();
                ICCheckedDynamicCast(v16, (uint64_t)v10);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = ICHashWithOrderedSet();
              }
              else
              {
                v17 = objc_msgSend(v10, "hash", (_QWORD)v19);
                if (v17)
                  goto LABEL_17;
                objc_msgSend(MEMORY[0x1E0C99E38], "null");
                v12 = (void *)objc_claimAutoreleasedReturnValue();
                v13 = objc_msgSend(v12, "hash");
              }
            }
          }
        }
        v17 = v13;

LABEL_17:
        v4 = v17 + 31 * v4;
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return v4;
}

id catchingException(void *a1)
{
  void (**v1)(void);

  v1 = a1;
  v1[2]();

  return 0;
}

void sub_1DDACDEB4(void *a1)
{
  id v1;

  v1 = objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1DDACDEA0);
}

Class initCHSTimelineController()
{
  Class Class;

  if (!ChronoServicesLibrary_frameworkLibrary)
  {
    ChronoServicesLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/ChronoServices.framework/ChronoServices", 2);
    if (!ChronoServicesLibrary_frameworkLibrary)
      initCHSTimelineController_cold_1();
  }
  Class = objc_getClass("CHSTimelineController");
  classCHSTimelineController = (uint64_t)Class;
  if (!Class)
    initCHSTimelineController_cold_2();
  getCHSTimelineControllerClass = (uint64_t (*)())CHSTimelineControllerFunction;
  return Class;
}

id CHSTimelineControllerFunction()
{
  return (id)classCHSTimelineController;
}

void sub_1DDACEEF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1DDACF3DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1DDACF554(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DDACF5D8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DDACF6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6, uint64_t a7, ...)
{
  void *v7;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__n128 __Block_byref_object_copy__7(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = a2[3];
  a1[3] = result;
  return result;
}

void sub_1DDACF7D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DDACF840(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1DDACF99C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1DDACFA84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDACFB38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1DDACFC38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DDACFCEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1DDAD2D3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  id *v22;
  uint64_t v23;

  objc_destroyWeak(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v23 - 72));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1DDAD2F98(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy__13(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void __Block_byref_object_dispose__14(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1DDAD4574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAD6E48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

void sub_1DDAD7748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAD7A14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DDAD7B68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double TSDOffsetForEdgeOfFrame(int a1, double a2, double a3, double a4, double a5)
{
  double result;

  switch(a1)
  {
    case 0:
      result = CGRectGetMinX(*(CGRect *)&a2);
      break;
    case 1:
      result = CGRectGetMidX(*(CGRect *)&a2);
      break;
    case 2:
      result = CGRectGetMaxX(*(CGRect *)&a2);
      break;
    case 3:
      result = CGRectGetMinY(*(CGRect *)&a2);
      break;
    case 4:
      result = CGRectGetMidY(*(CGRect *)&a2);
      break;
    case 5:
      result = CGRectGetMaxY(*(CGRect *)&a2);
      break;
    default:
      result = 0.0;
      break;
  }
  return result;
}

double TSDRectWithCenterAndSize(double a1, double a2, double a3)
{
  return a1 - a3 * 0.5;
}

double TSDRectWithPoints(double a1, double a2, double a3)
{
  if (a1 >= a3)
    return a3;
  else
    return a1;
}

double TSDRectWithSize()
{
  return 0.0;
}

double TSDRectWithSizeAlignedToRect(int a1, int a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double x;
  double width;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  v17.size.height = a4;
  v17.size.width = a3;
  v17.origin.x = 0.0;
  v17.origin.y = 0.0;
  v18 = CGRectStandardize(v17);
  x = v18.origin.x;
  width = v18.size.width;
  v18.origin.x = a5;
  v18.origin.y = a6;
  v18.size.width = a7;
  v18.size.height = a8;
  if (!CGRectIsNull(v18))
  {
    switch(a1)
    {
      case 3:
        v20.origin.x = a5;
        v20.origin.y = a6;
        v20.size.width = a7;
        v20.size.height = a8;
        x = CGRectGetMaxX(v20) - width;
        break;
      case 2:
        v21.origin.x = a5;
        v21.origin.y = a6;
        v21.size.width = a7;
        v21.size.height = a8;
        x = CGRectGetMidX(v21) + width * -0.5;
        break;
      case 1:
        v19.origin.x = a5;
        v19.origin.y = a6;
        v19.size.width = a7;
        v19.size.height = a8;
        x = CGRectGetMinX(v19);
        break;
    }
    switch(a2)
    {
      case 3:
        v23.origin.x = a5;
        v23.origin.y = a6;
        v23.size.width = a7;
        v23.size.height = a8;
        CGRectGetMaxY(v23);
        break;
      case 2:
        v24.origin.x = a5;
        v24.origin.y = a6;
        v24.size.width = a7;
        v24.size.height = a8;
        CGRectGetMidY(v24);
        break;
      case 1:
        v22.origin.x = a5;
        v22.origin.y = a6;
        v22.size.width = a7;
        v22.size.height = a8;
        CGRectGetMinY(v22);
        break;
    }
  }
  return x;
}

BOOL TSDNearlyEqualPoints(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL TSDNearlyEqualSizes(double a1, double a2, double a3, double a4)
{
  _BOOL4 v4;

  v4 = vabdd_f64(a1, a3) < 0.01;
  return vabdd_f64(a2, a4) < 0.01 && v4;
}

BOOL TSDNearlyEqualSizesWithThreshold(double a1, double a2, double a3, double a4, double a5)
{
  _BOOL4 v5;

  v5 = vabdd_f64(a1, a3) < a5;
  return vabdd_f64(a2, a4) < a5 && v5;
}

BOOL TSDNearlyEqualTransforms(double *a1, double *a2)
{
  return vabdd_f64(*a1, *a2) < 0.000000001
      && vabdd_f64(a1[1], a2[1]) < 0.000000001
      && vabdd_f64(a1[2], a2[2]) < 0.000000001
      && vabdd_f64(a1[3], a2[3]) < 0.000000001
      && vabdd_f64(a1[4], a2[4]) < 0.000000001
      && vabdd_f64(a1[5], a2[5]) < 0.000000001;
}

BOOL TSDNearlyContainsRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v13;
  CGRect v14;

  v13 = CGRectInset(*(CGRect *)&a1, -0.01, -0.01);
  v14.origin.x = a5;
  v14.origin.y = a6;
  v14.size.width = a7;
  v14.size.height = a8;
  return CGRectContainsRect(v13, v14);
}

BOOL TSDCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  return fabs((a3 - a1) * (a6 - a2) - (a4 - a2) * (a5 - a1)) < 8.90029543e-308;
}

BOOL TSDNearlyCollinearPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;

  v6 = a3 - a1;
  return (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) * (v6 * (a6 - a2) - (a4 - a2) * (a5 - a1)) < ((a4 - a2) * (a4 - a2)
                                                                                              + v6 * v6)
                                                                                             * 0.0001
                                                                                             * ((a6 - a2) * (a6 - a2)
                                                                                              + (a5 - a1) * (a5 - a1));
}

double TSDDistanceSquared(double a1, double a2, double a3, double a4)
{
  return (a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3);
}

BOOL TSDRectsOverlapVertically(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v16;
  double MaxX;
  double v18;
  double MinX;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  v16 = CGRectGetMinX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  MaxX = CGRectGetMaxX(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  v18 = CGRectGetMaxX(v24);
  if (MinX <= v16)
    return MaxX >= v16;
  else
    return v18 >= MinX;
}

BOOL TSDRectsOverlapHorizontally(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v16;
  double MaxY;
  double v18;
  double MinY;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  MinY = CGRectGetMinY(*(CGRect *)&a1);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  v16 = CGRectGetMinY(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  MaxY = CGRectGetMaxY(v23);
  v24.origin.x = a5;
  v24.origin.y = a6;
  v24.size.width = a7;
  v24.size.height = a8;
  v18 = CGRectGetMaxY(v24);
  if (MinY <= v16)
    return MaxY >= v16;
  else
    return v18 >= MinY;
}

uint64_t TSDLineIntersectsRect(CGFloat a1, CGFloat a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v12;
  double v13;
  uint64_t v16;
  uint64_t v17;
  uint64_t result;
  double v19;
  double v20;
  int v21;

  v12 = a4;
  v13 = a3;
  while (1)
  {
    v16 = p_ComputeOutcode(a1, a2, a5, a6, a7, a8);
    v17 = p_ComputeOutcode(v13, v12, a5, a6, a7, a8);
    result = 1;
    if (!v16 || !v17)
      break;
    if ((v17 & v16) != 0)
      return 0;
    v19 = (v13 + a1) * 0.5;
    v20 = (v12 + a2) * 0.5;
    v21 = TSDLineIntersectsRect(1, a1, a2, v19, v20, a5, a6, a7, a8);
    a1 = v19;
    a2 = v20;
    v13 = a3;
    v12 = a4;
    if (v21)
      return 1;
  }
  return result;
}

uint64_t p_ComputeOutcode(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  uint64_t v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v14.origin.x = a3;
  v14.origin.y = a4;
  v14.size.width = a5;
  v14.size.height = a6;
  if (a2 <= CGRectGetMaxY(v14))
  {
    v15.origin.x = a3;
    v15.origin.y = a4;
    v15.size.width = a5;
    v15.size.height = a6;
    if (a2 < CGRectGetMinY(v15))
      v12 = 2;
    else
      v12 = 0;
  }
  else
  {
    v12 = 1;
  }
  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  if (a1 > CGRectGetMaxX(v16))
    return v12 | 4;
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a5;
  v17.size.height = a6;
  if (a1 < CGRectGetMinX(v17))
    return v12 | 8;
  else
    return v12;
}

double TSDAveragePoints(double a1, double a2, double a3)
{
  return (a1 + a3) * 0.5;
}

double TSDNearestPointOnInfiniteLineToPoint(double *a1, double a2, double a3)
{
  double v3;
  double v4;
  double v5;
  double v6;

  v3 = a1[1];
  v4 = a1[2] - *a1;
  v5 = a1[3] - v3;
  v6 = 1.0 / sqrt(v5 * v5 + v4 * v4);
  return *a1 + v4 * v6 * ((a3 - v3) * (v5 * v6) + (a2 - *a1) * (v4 * v6));
}

double TSDNormalizePoint(double a1, double a2)
{
  return a1 * (1.0 / sqrt(a2 * a2 + a1 * a1));
}

double TSDSubtractPoints(double a1, double a2, double a3)
{
  return a1 - a3;
}

double TSDDotPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a4 + a1 * a3;
}

double TSDAddPoints(double a1, double a2, double a3)
{
  return a1 + a3;
}

double TSDMultiplyPointScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

BOOL TSDSizeIsEmpty(double a1, double a2)
{
  return a2 == 0.0 || a1 == 0.0;
}

double TSDSizeWithMaxArea(double result, double a2, double a3, double a4)
{
  if (result * a2 <= a3 * a4)
    return a3;
  return result;
}

double TSDUnionRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL4 v8;

  v8 = a7 <= 0.0;
  if (a8 > 0.0)
    v8 = 0;
  if (a3 > 0.0 || a4 > 0.0)
  {
    if (v8)
    {
      return a1;
    }
    else if (a1 < a5)
    {
      return a1;
    }
  }
  else if (v8)
  {
    return *MEMORY[0x1E0C9D648];
  }
  return a5;
}

double TSDHorizontalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MaxY;
  CGFloat v16;
  double MinY;
  double v18;
  double result;
  CGFloat v20;
  double MaxX;
  double v23;
  double MinX;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v20 = a7;
  v26.size.height = a8;
  v25 = fmax(MinX, CGRectGetMinX(v26));
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  MaxX = CGRectGetMaxX(v27);
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  v28.size.height = a8;
  v23 = fmin(MaxX, CGRectGetMaxX(v28));
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  MaxY = CGRectGetMaxY(v29);
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = v20;
  v30.size.height = a8;
  v16 = fmin(MaxY, CGRectGetMaxY(v30));
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  MinY = CGRectGetMinY(v31);
  v32.origin.x = a5;
  v32.origin.y = a6;
  v32.size.width = v20;
  v32.size.height = a8;
  v18 = fmax(MinY, CGRectGetMinY(v32));
  v33.origin.x = v25;
  v33.size.width = v23 - v25;
  v33.size.height = v18 - v16;
  v33.origin.y = v16;
  *(_QWORD *)&result = (unint64_t)CGRectStandardize(v33);
  return result;
}

double TSDVerticalSpacingRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MinY;
  CGFloat v16;
  double MaxY;
  double v18;
  double result;
  CGFloat v20;
  double MinX;
  double v23;
  double MaxX;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v26.origin.x = a5;
  v26.origin.y = a6;
  v26.size.width = a7;
  v20 = a7;
  v26.size.height = a8;
  v25 = fmin(MaxX, CGRectGetMaxX(v26));
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  MinX = CGRectGetMinX(v27);
  v28.origin.x = a5;
  v28.origin.y = a6;
  v28.size.width = a7;
  v28.size.height = a8;
  v23 = fmax(MinX, CGRectGetMinX(v28));
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  MinY = CGRectGetMinY(v29);
  v30.origin.x = a5;
  v30.origin.y = a6;
  v30.size.width = v20;
  v30.size.height = a8;
  v16 = fmax(MinY, CGRectGetMinY(v30));
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  MaxY = CGRectGetMaxY(v31);
  v32.origin.x = a5;
  v32.origin.y = a6;
  v32.size.width = v20;
  v32.size.height = a8;
  v18 = fmin(MaxY, CGRectGetMaxY(v32));
  v33.origin.x = v25;
  v33.size.width = v23 - v25;
  v33.size.height = v18 - v16;
  v33.origin.y = v16;
  *(_QWORD *)&result = (unint64_t)CGRectStandardize(v33);
  return result;
}

BOOL TSDIntersectsRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  _BOOL8 result;

  if (a1 < a5)
    result = a1 + a3 > a5;
  else
    result = a5 + a7 > a1;
  if (a2 >= a6)
  {
    if (a6 + a8 > a2)
      return result;
    return 0;
  }
  if (a2 + a4 <= a6)
    return 0;
  return result;
}

BOOL TSDPointInRectInclusive(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;

  v6 = a3 + a5;
  return a1 >= a3 && a1 <= v6 && a2 >= a4 && a2 <= a4 + a6;
}

double TSDAddSizes(double a1, double a2, double a3)
{
  return a1 + a3;
}

double TSDSubtractSizes(double a1, double a2, double a3)
{
  return a1 - a3;
}

double TSDMultiplyPointBySize(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSDMultiplySizeScalar(double a1, double a2, double a3)
{
  return a1 * a3;
}

double TSDMultiplyRectScalar(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v9;
  CGRect v11;

  v9 = a1;
  if (!CGRectIsInfinite(*(CGRect *)&a1))
  {
    v11.origin.x = v9;
    v11.origin.y = a2;
    v11.size.width = a3;
    v11.size.height = a4;
    if (!CGRectIsNull(v11))
      return v9 * a5;
  }
  return v9;
}

double TSDFlooredPoint(double a1)
{
  return floor(a1);
}

double TSDPointLength(double a1, double a2)
{
  return sqrt(a2 * a2 + a1 * a1);
}

double TSDPointSquaredLength(double a1, double a2)
{
  return a2 * a2 + a1 * a1;
}

double TSDDistance(double a1, double a2, double a3, double a4)
{
  return sqrt((a2 - a4) * (a2 - a4) + (a1 - a3) * (a1 - a3));
}

double TSDOrthogonalDistance(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  v4 = a1 - a3;
  if (v4 < 0.0)
    v4 = -v4;
  v5 = a2 - a4;
  if (v5 < 0.0)
    v5 = -v5;
  return v4 + v5;
}

void TSDDistanceToRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  double MaxX;
  double MinY;
  double MaxY;
  double v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;

  v16.origin.x = a3;
  v16.origin.y = a4;
  v16.size.width = a5;
  v16.size.height = a6;
  if (a1 < CGRectGetMinX(v16))
  {
    v17.origin.x = a3;
    v17.origin.y = a4;
    v17.size.width = a5;
    v17.size.height = a6;
    if (a2 < CGRectGetMinY(v17))
    {
      v18.origin.x = a3;
      v18.origin.y = a4;
      v18.size.width = a5;
      v18.size.height = a6;
      CGRectGetMinX(v18);
LABEL_7:
      v22.origin.x = a3;
      v22.origin.y = a4;
      v22.size.width = a5;
      v22.size.height = a6;
      CGRectGetMinY(v22);
      return;
    }
    v23.origin.x = a3;
    v23.origin.y = a4;
    v23.size.width = a5;
    v23.size.height = a6;
    MaxY = CGRectGetMaxY(v23);
    v24.origin.x = a3;
    v24.origin.y = a4;
    v24.size.width = a5;
    v24.size.height = a6;
    CGRectGetMinX(v24);
    if (a2 <= MaxY)
      return;
LABEL_13:
    v28.origin.x = a3;
    v28.origin.y = a4;
    v28.size.width = a5;
    v28.size.height = a6;
    CGRectGetMaxY(v28);
    return;
  }
  v19.origin.x = a3;
  v19.origin.y = a4;
  v19.size.width = a5;
  v19.size.height = a6;
  MaxX = CGRectGetMaxX(v19);
  v20.origin.x = a3;
  v20.origin.y = a4;
  v20.size.width = a5;
  v20.size.height = a6;
  MinY = CGRectGetMinY(v20);
  if (a1 <= MaxX)
  {
    if (a2 >= MinY)
    {
      v29.origin.x = a3;
      v29.origin.y = a4;
      v29.size.width = a5;
      v29.size.height = a6;
      if (a2 > CGRectGetMaxY(v29))
      {
        v30.origin.x = a3;
        v30.origin.y = a4;
        v30.size.width = a5;
        v30.size.height = a6;
        CGRectGetMaxY(v30);
      }
    }
    else
    {
      v25.origin.x = a3;
      v25.origin.y = a4;
      v25.size.width = a5;
      v25.size.height = a6;
      CGRectGetMinY(v25);
    }
    return;
  }
  if (a2 < MinY)
  {
    v21.origin.x = a3;
    v21.origin.y = a4;
    v21.size.width = a5;
    v21.size.height = a6;
    CGRectGetMaxX(v21);
    goto LABEL_7;
  }
  v26.origin.x = a3;
  v26.origin.y = a4;
  v26.size.width = a5;
  v26.size.height = a6;
  v15 = CGRectGetMaxY(v26);
  v27.origin.x = a3;
  v27.origin.y = a4;
  v27.size.width = a5;
  v27.size.height = a6;
  CGRectGetMaxX(v27);
  if (a2 > v15)
    goto LABEL_13;
}

double TSDDistanceToRectFromRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double MidX;
  double MidY;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v23;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  MidY = CGRectGetMidY(v23);
  v16 = TSUClamp(MidX, a5, a5 + a7);
  v17 = TSUClamp(MidY, a6, a6 + a8);
  v18 = TSUClamp(v16, a1, a1 + a3);
  v19 = TSUClamp(v17, a2, a2 + a4);
  return sqrt((v17 - v19) * (v17 - v19) + (v16 - v18) * (v16 - v18));
}

double TSDClampPointInRect(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v9;

  v9 = TSUClamp(a1, a3, a3 + a5);
  TSUClamp(a2, a4, a4 + a6);
  return v9;
}

double TSDCenterOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

BOOL TSDPercentRectInsideRect(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8)
{
  CGRect v9;

  v9 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  return CGRectEqualToRect(v9, *MEMORY[0x1E0C9D628]);
}

double TSDRectGetMaxPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MaxX;
  CGRect v10;

  MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMaxY(v10);
  return MaxX;
}

double TSDComplexMultiplyPoint(double a1, double a2, double a3, double a4)
{
  return a1 * a3 - a2 * a4;
}

double TSDCrossPoints(double a1, double a2, double a3, double a4)
{
  return a2 * a3 - a1 * a4;
}

double TSDGrowRectToPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double MinX;
  double v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;
  CGRect v16;

  if (!CGRectIsNull(*(CGRect *)&a1))
  {
    v13.origin.x = a1;
    v13.origin.y = a2;
    v13.size.width = a3;
    v13.size.height = a4;
    MinX = CGRectGetMinX(v13);
    if (MinX >= a5)
      v11 = a5;
    else
      v11 = MinX;
    v14.origin.x = a1;
    v14.origin.y = a2;
    v14.size.width = a3;
    v14.size.height = a4;
    CGRectGetMaxX(v14);
    v15.origin.x = a1;
    v15.origin.y = a2;
    v15.size.width = a3;
    v15.size.height = a4;
    CGRectGetMinY(v15);
    v16.origin.x = a1;
    v16.origin.y = a2;
    v16.size.width = a3;
    v16.size.height = a4;
    CGRectGetMaxY(v16);
    return v11;
  }
  return a5;
}

double TSDFlipRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v14;

  CGRectGetMidY(*(CGRect *)&a1);
  v14.origin.x = a5;
  v14.origin.y = a6;
  v14.size.width = a7;
  v14.size.height = a8;
  CGRectGetMidY(v14);
  return a1;
}

double TSDCenterRectOverRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MidY;
  double v17;
  CGFloat v18;
  double result;
  double MidX;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  v21.origin.x = a5;
  v21.origin.y = a6;
  v21.size.width = a7;
  v21.size.height = a8;
  MidX = CGRectGetMidX(v21);
  v22.origin.x = a5;
  v22.origin.y = a6;
  v22.size.width = a7;
  v22.size.height = a8;
  MidY = CGRectGetMidY(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  v17 = CGRectGetMidX(v23);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  v18 = MidY - CGRectGetMidY(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectOffset(v25, MidX - v17, v18);
  return result;
}

BOOL TSDRectIsFinite(double a1, double a2, double a3, double a4)
{
  _BOOL8 result;
  double v5;

  result = 0;
  if (fabs(a1) != INFINITY && fabs(a2) != INFINITY && fabs(a3) != INFINITY)
  {
    v5 = fabs(a4);
    return v5 > INFINITY || v5 < INFINITY;
  }
  return result;
}

void TSDRectDivide(CGRect *a1, CGRect *a2, CGRectEdge a3, double a4, double a5, double a6, double a7, CGFloat a8)
{
  _OWORD v8[2];

  memset(v8, 0, sizeof(v8));
  if (!a1)
    a1 = (CGRect *)v8;
  if (!a2)
    a2 = (CGRect *)v8;
  CGRectDivide(*(CGRect *)&a4, a1, a2, a8, a3);
}

uint64_t TSDGetCanvasSpaceCorners(uint64_t a1, _OWORD *a2, _OWORD *a3, _OWORD *a4, _OWORD *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  __int128 v18;
  double MidX;
  CGFloat MidY;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double *v26;
  long double v27;
  double v28;
  double v29;
  double v30;
  uint64_t v31;
  __int128 v32;
  _BOOL4 v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  BOOL v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  float64x2_t v46;
  __int128 v47;
  __int128 v48;
  double v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53[3];
  CGRect v54;
  CGRect v55;

  v53[2] = *(double *)MEMORY[0x1E0C80C00];
  v18 = *(_OWORD *)(a1 + 16);
  v46 = *(float64x2_t *)a1;
  v47 = v18;
  v48 = *(_OWORD *)(a1 + 32);
  TSDTransformedCornersOfRect(&v46, &v49, &v51, &v52, v53, a6, a7, a8, a9);
  v54.origin.x = a6;
  v54.origin.y = a7;
  v54.size.width = a8;
  v54.size.height = a9;
  MidX = CGRectGetMidX(v54);
  v55.origin.x = a6;
  v55.origin.y = a7;
  v55.size.width = a8;
  v55.size.height = a9;
  MidY = CGRectGetMidY(v55);
  v21 = 0;
  v22 = 0;
  v23 = *(double *)(a1 + 32) + MidY * *(double *)(a1 + 16) + *(double *)a1 * MidX;
  v24 = 1000000.0;
  v25 = *(double *)(a1 + 40) + MidY * *(double *)(a1 + 24) + *(double *)(a1 + 8) * MidX;
  v26 = (double *)&v50;
  do
  {
    v27 = atan2(*v26 - v25, *(v26 - 1) - v23);
    v28 = fmod(v27 * 57.2957795, 360.0);
    if (v28 < 0.0)
      v28 = v28 + 360.0;
    if (v28 == 0.0)
      v29 = 225.0;
    else
      v29 = 360.0 - v28 + -135.0;
    v30 = fabs(v29);
    if (v30 < v24)
    {
      v21 = v22;
      v24 = v30;
    }
    ++v22;
    v26 += 2;
  }
  while (v22 != 4);
  *a2 = *((_OWORD *)&v49 + v21);
  v31 = (v21 + 2) & 3;
  if (v21 + 2 <= 0)
    v31 = -(-(v21 + 2) & 3);
  *a4 = *((_OWORD *)&v49 + v31);
  v32 = *(_OWORD *)(a1 + 16);
  v46 = *(float64x2_t *)a1;
  v47 = v32;
  v48 = *(_OWORD *)(a1 + 32);
  v33 = TSDIsTransformFlipped(v46.f64);
  v34 = v21 + 3;
  if (v33)
    v35 = v21 + 1;
  else
    v35 = v21 + 3;
  v36 = v35 & 3;
  if (!v33)
    v34 = v21 + 1;
  v38 = -v35;
  v37 = v38 < 0;
  v39 = v38 & 3;
  if (v37)
    v40 = v36;
  else
    v40 = -v39;
  *a5 = *((_OWORD *)&v49 + v40);
  v41 = v34 & 3;
  v42 = -v34;
  v37 = v42 < 0;
  v43 = v42 & 3;
  if (v37)
    v44 = v41;
  else
    v44 = -v43;
  *a3 = *((_OWORD *)&v49 + v44);
  return v21;
}

double TSDAngleFromDelta(long double a1, long double a2)
{
  return atan2(a2, a1);
}

void TSDNormalizeAngleInDegrees(long double a1)
{
  fmod(a1, 360.0);
}

double TSDInterpolatePoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSDMixPoints(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

uint64_t TSDMixBOOLs(uint64_t result, unsigned int a2, double a3)
{
  if (a3 > 0.5)
    return a2;
  else
    return result;
}

double TSDMixFloats(double a1, double a2, double a3)
{
  return a2 * a3 + a1 * (1.0 - a3);
}

void TSDMixAnglesInDegrees(long double a1, long double a2, double a3)
{
  double v5;
  double v6;
  double v7;

  v5 = fmod(a1, 360.0);
  if (v5 < 0.0)
    v5 = v5 + 360.0;
  if (v5 == 0.0)
    v6 = 0.0;
  else
    v6 = v5;
  v7 = fmod(a2, 360.0);
  if (v7 < 0.0)
    v7 = v7 + 360.0;
  if (v7 == 0.0)
    v7 = 0.0;
  if (vabdd_f64(v7, v6) > 180.0)
  {
    if (v6 <= v7)
      v7 = v7 + -360.0;
    else
      v7 = v7 + 360.0;
  }
  fmod(v7 * a3 + v6 * (1.0 - a3), 360.0);
}

double TSDMixAnglesInRadians(double a1, double a2, double a3)
{
  double v3;

  TSDMixAnglesInDegrees(a1 * 57.2957795, a2 * 57.2957795, a3);
  return v3 * 0.0174532925;
}

double TSDMixSizes(double a1, double a2, double a3, double a4, double a5)
{
  return a3 * a5 + a1 * (1.0 - a5);
}

double TSDMixRects(double a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  return a5 * a9 + a1 * (1.0 - a9);
}

double TSDSizeWithMaxSize(double result, double a2, double a3)
{
  if (result >= a3)
    return a3;
  return result;
}

double TSDClipRectToMaxY(double a1, double a2, double a3, double a4)
{
  CGRectGetMaxY(*(CGRect *)&a1);
  return a1;
}

double TSDClipRectToMinY(double a1, double a2, double a3, double a4)
{
  CGRectGetMinY(*(CGRect *)&a1);
  return a1;
}

double TSDTranslatedRectMaximizingOverlapWithRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double MaxX;
  double MinX;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double MaxY;
  double MinY;
  double v25;
  double v26;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v34;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;

  v36.origin.x = a5;
  v36.origin.y = a6;
  v36.size.width = a7;
  v36.size.height = a8;
  MaxX = CGRectGetMaxX(v36);
  v34 = a1;
  v37.origin.x = a1;
  v37.origin.y = a2;
  v37.size.width = a3;
  v37.size.height = a4;
  if (MaxX > CGRectGetMaxX(v37))
  {
    v38.origin.x = a5;
    v38.origin.y = a6;
    v38.size.width = a7;
    v38.size.height = a8;
    MinX = CGRectGetMinX(v38);
    v39.origin.x = a1;
    v39.origin.y = a2;
    v39.size.width = a3;
    v39.size.height = a4;
    if (MinX > CGRectGetMinX(v39))
    {
      v40.origin.x = a5;
      v40.origin.y = a6;
      v40.size.width = a7;
      v40.size.height = a8;
      v29 = CGRectGetMaxX(v40);
      v41.origin.x = a1;
      v41.origin.y = a2;
      v41.size.width = a3;
      v41.size.height = a4;
      v30 = v29 - CGRectGetMaxX(v41);
      v42.origin.x = a5;
      v42.origin.y = a6;
      v42.size.width = a7;
      v42.size.height = a8;
      v28 = CGRectGetMinX(v42);
      v43.origin.x = a1;
      v43.origin.y = a2;
      v43.size.width = a3;
      v43.size.height = a4;
      v17 = v28 - CGRectGetMinX(v43);
      if (v30 < v17)
        v17 = v30;
      v18 = a1 + v17;
LABEL_11:
      v34 = v18;
      goto LABEL_12;
    }
  }
  v44.origin.x = a5;
  v44.origin.y = a6;
  v44.size.width = a7;
  v44.size.height = a8;
  v19 = CGRectGetMinX(v44);
  v45.origin.x = a1;
  v45.origin.y = a2;
  v45.size.width = a3;
  v45.size.height = a4;
  if (v19 < CGRectGetMinX(v45))
  {
    v46.origin.x = a5;
    v46.origin.y = a6;
    v46.size.width = a7;
    v46.size.height = a8;
    v20 = CGRectGetMaxX(v46);
    v47.origin.x = a1;
    v47.origin.y = a2;
    v47.size.width = a3;
    v47.size.height = a4;
    if (v20 < CGRectGetMaxX(v47))
    {
      v48.origin.x = a1;
      v48.origin.y = a2;
      v48.size.width = a3;
      v48.size.height = a4;
      v31 = CGRectGetMinX(v48);
      v49.origin.x = a5;
      v49.origin.y = a6;
      v49.size.width = a7;
      v49.size.height = a8;
      v32 = v31 - CGRectGetMinX(v49);
      v50.origin.x = a1;
      v50.origin.y = a2;
      v50.size.width = a3;
      v50.size.height = a4;
      v21 = CGRectGetMaxX(v50);
      v51.origin.x = a5;
      v51.origin.y = a6;
      v51.size.width = a7;
      v51.size.height = a8;
      v22 = v21 - CGRectGetMaxX(v51);
      if (v32 < v22)
        v22 = v32;
      v18 = a1 - v22;
      goto LABEL_11;
    }
  }
LABEL_12:
  v52.origin.x = a5;
  v52.origin.y = a6;
  v52.size.width = a7;
  v52.size.height = a8;
  MaxY = CGRectGetMaxY(v52);
  v53.origin.x = a1;
  v53.origin.y = a2;
  v53.size.width = a3;
  v53.size.height = a4;
  if (MaxY <= CGRectGetMaxY(v53))
    goto LABEL_15;
  v54.origin.x = a5;
  v54.origin.y = a6;
  v54.size.width = a7;
  v54.size.height = a8;
  MinY = CGRectGetMinY(v54);
  v55.origin.x = a1;
  v55.origin.y = a2;
  v55.size.width = a3;
  v55.size.height = a4;
  if (MinY <= CGRectGetMinY(v55))
  {
LABEL_15:
    v60.origin.x = a5;
    v60.origin.y = a6;
    v60.size.width = a7;
    v60.size.height = a8;
    v25 = CGRectGetMinY(v60);
    v61.origin.x = a1;
    v61.origin.y = a2;
    v61.size.width = a3;
    v61.size.height = a4;
    if (v25 < CGRectGetMinY(v61))
    {
      v62.origin.x = a5;
      v62.origin.y = a6;
      v62.size.width = a7;
      v62.size.height = a8;
      v26 = CGRectGetMaxY(v62);
      v63.origin.x = a1;
      v63.origin.y = a2;
      v63.size.width = a3;
      v63.size.height = a4;
      if (v26 < CGRectGetMaxY(v63))
      {
        v64.origin.x = a1;
        v64.origin.y = a2;
        v64.size.width = a3;
        v64.size.height = a4;
        CGRectGetMinY(v64);
        v65.origin.x = a5;
        v65.origin.y = a6;
        v65.size.width = a7;
        v65.size.height = a8;
        CGRectGetMinY(v65);
        v66.origin.x = a1;
        v66.origin.y = a2;
        v66.size.width = a3;
        v66.size.height = a4;
        CGRectGetMaxY(v66);
        v67.origin.x = a5;
        v67.origin.y = a6;
        v67.size.width = a7;
        v67.size.height = a8;
        CGRectGetMaxY(v67);
      }
    }
  }
  else
  {
    v56.origin.x = a5;
    v56.origin.y = a6;
    v56.size.width = a7;
    v56.size.height = a8;
    CGRectGetMaxY(v56);
    v57.origin.x = a1;
    v57.origin.y = a2;
    v57.size.width = a3;
    v57.size.height = a4;
    CGRectGetMaxY(v57);
    v58.origin.x = a5;
    v58.origin.y = a6;
    v58.size.width = a7;
    v58.size.height = a8;
    CGRectGetMinY(v58);
    v59.origin.x = a1;
    v59.origin.y = a2;
    v59.size.width = a3;
    v59.size.height = a4;
    CGRectGetMinY(v59);
  }
  return v34;
}

double TSDOriginRotate(double *a1, double a2, double a3)
{
  __double2 v5;
  double result;

  v5 = __sincos_stret(a3);
  result = v5.__sinval * a2;
  *a1 = v5.__cosval * a2;
  a1[1] = v5.__sinval * a2;
  return result;
}

double TSDNiceAngleFromDelta(long double a1, long double a2)
{
  double result;

  if (a2 != 0.0)
    return atan2(a2, a1);
  result = 3.14159265;
  if (a1 >= 0.0)
    return 0.0;
  return result;
}

double TSDDeltaFromAngle(double a1)
{
  if (a1 == 0.0)
    return 1.0;
  return __sincos_stret(a1).__cosval;
}

double TSDShiftConstrainDelta(long double a1, long double a2)
{
  long double v4;

  v4 = atan2(a2, a1);
  return sqrt(a2 * a2 + a1 * a1)
       * __sincos_stret((double)(int)((v4 + 6.28318531) / 0.785398163 + 0.5) * 0.785398163).__cosval;
}

double TSDShiftConstrainDeltaToAngle(double a1, double a2, double a3)
{
  return __sincos_stret(a3).__cosval * sqrt(a2 * a2 + a1 * a1);
}

double TSDRotatePoint90Degrees(int a1, double a2, double a3)
{
  if (a1)
    return -a3;
  else
    return a3;
}

void TSDNormalizeSignedDifferenceAngleInDegrees(double a1, double a2)
{
  fmod(a1 - a2, 360.0);
}

double TSDNormalizeDifferenceAngleInDegrees(double a1, double a2)
{
  double v2;

  v2 = fmod(a1 - a2, 360.0);
  if (v2 > 180.0)
    v2 = v2 + -360.0;
  if (v2 < -180.0)
    v2 = v2 + 360.0;
  return fabs(v2);
}

void TSDNormalizeAngleInRadians(long double a1)
{
  fmod(a1, 6.28318531);
}

void TSDNormalizeAngleAboutZeroInRadians(double a1)
{
  fmod(a1 + 3.14159265, 6.28318531);
}

double TSDDeltaApplyAffineTransform(float64x2_t *a1, double a2, double a3)
{
  double result;

  *(_QWORD *)&result = *(_OWORD *)&vsubq_f64(vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3), *a1, a2)), vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], *(double *)(MEMORY[0x1E0C9D538] + 8)), *a1, *MEMORY[0x1E0C9D538])));
  return result;
}

void TSDDistanceBetweenAnglesInRadians(long double a1, long double a2)
{
  fmod(a1, 6.28318531);
  fmod(a2, 6.28318531);
}

double TSDAngleBetweenPoints(double a1, double a2, double a3, double a4, double a5, double a6)
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;

  v6 = a3 - a1;
  v7 = a4 - a2;
  v8 = 1.0 / sqrt(v7 * v7 + v6 * v6);
  v9 = a5 - a1;
  v10 = a6 - a2;
  v11 = 1.0 / sqrt(v10 * v10 + v9 * v9);
  return acos(v7 * v8 * (v10 * v11) + v6 * v8 * (v9 * v11));
}

double TSDRotationFromTransform(uint64_t a1)
{
  return atan2(*(long double *)(a1 + 8), *(long double *)(a1 + 24));
}

double TSDNormalizedPointInRect(double a1, double a2, double a3, double a4, double a5)
{
  return (a1 - a3) / a5;
}

double TSDPointFromNormalizedRect(double a1, double a2, double a3, double a4, double a5)
{
  return a3 + a1 * a5;
}

void TSDRectFromNormalizedSubrect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  CGRect v12;
  CGRect v13;

  v12.origin.x = a5;
  v12.origin.y = a6;
  v12.size.width = a7;
  v12.size.height = a8;
  CGRectGetMaxX(v12);
  v13.origin.x = a5;
  v13.origin.y = a6;
  v13.size.width = a7;
  v13.size.height = a8;
  CGRectGetMaxY(v13);
}

void TSDNormalizedSubrectInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGRect v8;

  CGRectGetMaxX(*(CGRect *)&a1);
  v8.origin.x = a1;
  v8.origin.y = a2;
  v8.size.width = a3;
  v8.size.height = a4;
  CGRectGetMaxY(v8);
}

double TSDRectSubtractingRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v11;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRectEdge v21;
  double MaxX;
  double v23;
  double v24;
  double v25;
  double MinX;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double MinY;
  double v33;
  double MaxY;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  CGRect slice;
  CGRect remainder;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;

  v11 = a1;
  v42 = CGRectIntersection(*(CGRect *)&a1, *(CGRect *)&a5);
  x = v42.origin.x;
  y = v42.origin.y;
  width = v42.size.width;
  height = v42.size.height;
  if (!CGRectIsNull(v42))
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MaxY = CGRectGetMaxY(v43);
    v44.origin.x = v11;
    v44.origin.y = a2;
    v44.size.width = a3;
    v44.size.height = a4;
    MinY = CGRectGetMinY(v44);
    v45.origin.x = v11;
    v45.origin.y = a2;
    v45.size.width = a3;
    v45.size.height = a4;
    v37 = CGRectGetMaxY(v45);
    v46.origin.x = x;
    v46.origin.y = y;
    v46.size.width = width;
    v46.size.height = height;
    v38 = v37 - CGRectGetMaxY(v46);
    v47.origin.x = v11;
    v47.origin.y = a2;
    v47.size.width = a3;
    v47.size.height = a4;
    v33 = v38 * CGRectGetWidth(v47);
    v36 = height;
    v39 = x;
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    v16 = CGRectGetMinY(v48);
    v49.origin.x = v11;
    v49.origin.y = a2;
    v49.size.width = a3;
    v49.size.height = a4;
    v17 = v16 - CGRectGetMinY(v49);
    v50.origin.x = v11;
    v50.origin.y = a2;
    v50.size.width = a3;
    v50.size.height = a4;
    v18 = v17 * CGRectGetWidth(v50);
    v19 = v33;
    if (v18 <= v33)
    {
      v35 = MaxY - MinY;
      v21 = CGRectMinYEdge;
    }
    else
    {
      v51.origin.x = v11;
      v51.origin.y = a2;
      v51.size.width = a3;
      v51.size.height = a4;
      v20 = CGRectGetMaxY(v51);
      v52.size.height = v36;
      v52.origin.x = v39;
      v52.origin.y = y;
      v52.size.width = width;
      v35 = v20 - CGRectGetMinY(v52);
      v21 = CGRectMaxYEdge;
      v19 = v18;
    }
    v53.origin.x = v11;
    v53.origin.y = a2;
    v53.size.width = a3;
    v53.size.height = a4;
    MaxX = CGRectGetMaxX(v53);
    v54.size.height = v36;
    v54.origin.x = v39;
    v54.origin.y = y;
    v54.size.width = width;
    v23 = MaxX - CGRectGetMaxX(v54);
    v55.origin.x = v11;
    v55.origin.y = a2;
    v55.size.width = a3;
    v55.size.height = a4;
    v24 = v23 * CGRectGetHeight(v55);
    if (v24 > v19)
    {
      v56.size.height = v36;
      v56.origin.x = v39;
      v56.origin.y = y;
      v56.size.width = width;
      v25 = CGRectGetMaxX(v56);
      v57.origin.x = v11;
      v57.origin.y = a2;
      v57.size.width = a3;
      v57.size.height = a4;
      v21 = CGRectMinXEdge;
      v35 = v25 - CGRectGetMinX(v57);
      v19 = v24;
    }
    v58.size.height = v36;
    v58.origin.x = v39;
    v58.origin.y = y;
    v58.size.width = width;
    MinX = CGRectGetMinX(v58);
    v59.origin.x = v11;
    v59.origin.y = a2;
    v59.size.width = a3;
    v59.size.height = a4;
    v27 = MinX - CGRectGetMinX(v59);
    v60.origin.x = v11;
    v60.origin.y = a2;
    v60.size.width = a3;
    v60.size.height = a4;
    v28 = CGRectGetHeight(v60);
    v29 = v35;
    if (v27 * v28 > v19)
    {
      v61.origin.x = v11;
      v61.origin.y = a2;
      v61.size.width = a3;
      v61.size.height = a4;
      v30 = CGRectGetMaxX(v61);
      v62.size.height = v36;
      v62.origin.x = v39;
      v62.origin.y = y;
      v62.size.width = width;
      v29 = v30 - CGRectGetMinX(v62);
      v21 = CGRectMaxXEdge;
    }
    memset(&remainder, 0, sizeof(remainder));
    memset(&slice, 0, sizeof(slice));
    v63.origin.x = v11;
    v63.origin.y = a2;
    v63.size.width = a3;
    v63.size.height = a4;
    CGRectDivide(v63, &slice, &remainder, v29, v21);
    return remainder.origin.x;
  }
  return v11;
}

double TSDRectWithTopRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double TSDRectWithBottomRightPoint(double a1, double a2, double a3)
{
  return a3 - a1;
}

double TSDRectWithTopLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double TSDRectWithBottomLeftPoint(double a1, double a2, double a3)
{
  return a3;
}

double TSDSizeWithAspectRatio(int a1, double result, double a3, double a4, double a5)
{
  BOOL v5;
  double v6;

  v5 = result == a4 && a3 == a5;
  if (!v5 && a4 != 0.0 && a5 != 0.0 && a4 != 3.40282347e38 && a5 != 3.40282347e38)
  {
    if (a1)
    {
      v6 = sqrt(a5 * a5 + a4 * a4);
      return a4 / v6 * (a3 * (a5 / v6) + result * (a4 / v6));
    }
    else if (vabdd_f64(result, a4) < 0.01)
    {
      return a3 * a4 / a5;
    }
  }
  return result;
}

double TSDSizeExpandedToMatchAspectRatio(double result, double a2, double a3, double a4)
{
  _BOOL4 v4;
  BOOL v5;
  double v6;

  v4 = result != a3;
  if (a2 != a4)
    v4 = 1;
  v5 = a3 <= 0.0 || !v4;
  if (!v5 && a4 > 0.0)
  {
    v6 = a3 / a4;
    if (v6 > result / a2)
      return a2 * v6;
  }
  return result;
}

double TSDScaleSizeWithinSize(double a1, double a2, double a3, double a4)
{
  if (a1 / a2 < a3 / a4)
    return a1 * (a4 / a2);
  return a3;
}

double TSDShrinkSizeToFitInSize(double result, double a2, double a3, double a4)
{
  BOOL v4;
  BOOL v5;

  if (result <= a3)
  {
    v4 = a2 == a4;
    v5 = a2 < a4;
  }
  else
  {
    v4 = 0;
    v5 = 0;
  }
  if (!v5 && !v4)
  {
    if (result / a2 <= a3 / a4)
    {
      if (result / a2 < a3 / a4)
        return result * (a4 / a2);
      else
        return a3;
    }
    else
    {
      return a3;
    }
  }
  return result;
}

double TSDFitOrFillSizeInSize(int a1, double a2, double a3, double a4, double a5)
{
  double v5;
  double v6;
  double v7;

  v5 = a4 / a2;
  v6 = a5 / a3;
  if (v5 >= v6)
    v7 = v5;
  else
    v7 = v6;
  if (v5 >= v6)
    v5 = v6;
  if (a1)
    v5 = v7;
  return a2 * v5;
}

double TSDFitOrFillSizeInRect(int a1, double a2, double a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7)
{
  double v11;
  double v12;
  double v13;

  v11 = a6 / a2;
  if (a6 / a2 >= a7 / a3)
    v12 = a6 / a2;
  else
    v12 = a7 / a3;
  if (a6 / a2 >= a7 / a3)
    v11 = a7 / a3;
  if (a1)
    v13 = v12;
  else
    v13 = v11;
  return TSDCenterRectOverRect(0.0, 0.0, a2 * v13, a3 * v13, a4, a5, a6, a7);
}

void TSDScaleRectAroundPoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7)
{
  CGAffineTransform v12;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGRect v19;

  memset(&v18, 0, sizeof(v18));
  CGAffineTransformMakeTranslation(&v18, -a5, -a6);
  memset(&v17, 0, sizeof(v17));
  CGAffineTransformMakeScale(&v17, a7, a7);
  memset(&v16, 0, sizeof(v16));
  t1 = v18;
  t2 = v17;
  CGAffineTransformConcat(&v15, &t1, &t2);
  t1 = v18;
  CGAffineTransformInvert(&v12, &t1);
  CGAffineTransformConcat(&v16, &v15, &v12);
  t1 = v16;
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  CGRectApplyAffineTransform(v19, &t1);
}

void TSDScaledRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX;
  double MidY;
  CGRect v12;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  MidY = CGRectGetMidY(v12);
  TSDScaleRectAroundPoint(a1, a2, a3, a4, MidX, MidY, a5);
}

void TSDVisibleUnscaledRectForNewScale(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5, double a6, CGFloat a7, double a8)
{
  float64x2_t v14;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;

  memset(&v19, 0, sizeof(v19));
  CGAffineTransformMakeScale(&v19, a7, a7);
  memset(&v18, 0, sizeof(v18));
  v17 = v19;
  CGAffineTransformInvert(&v18, &v17);
  v17 = v18;
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  v21 = CGRectApplyAffineTransform(v20, &v17);
  v14 = vaddq_f64(*(float64x2_t *)&v18.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v18.c, a6), *(float64x2_t *)&v18.a, a5));
  TSDScaleRectAroundPoint(v21.origin.x, v21.origin.y, v21.size.width, v21.size.height, v14.f64[0], v14.f64[1], a7 / a8);
}

double TSDRectWithInverseNormalizedRect(double a1, double a2, double a3)
{
  return -a1 / a3;
}

double TSDRectByExpandingBoundingRectToContentRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, double a9, double a10, double a11, double a12)
{
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double MaxX;
  double v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;

  v25 = a1 + a5 * a3;
  v36.origin.x = a5;
  v36.origin.y = a6;
  v36.size.width = a7;
  v36.size.height = a8;
  MaxX = CGRectGetMaxX(v36);
  v37.origin.x = a5;
  v37.origin.y = a6;
  v37.size.width = a7;
  v37.size.height = a8;
  CGRectGetMaxY(v37);
  v26 = a1 + MaxX * a3;
  if (v25 >= v26)
    v27 = a1 + MaxX * a3;
  else
    v27 = v25;
  if (v25 >= v26)
    v26 = v25;
  v35 = v27;
  v28 = v26 - v27;
  v29 = -a9 / a11 * (v26 - v27);
  v38.origin.x = -a9 / a11;
  v38.origin.y = -a10 / a12;
  v38.size.width = 1.0 / a11;
  v38.size.height = 1.0 / a12;
  v30 = CGRectGetMaxX(v38);
  v39.origin.x = -a9 / a11;
  v39.origin.y = -a10 / a12;
  v39.size.width = 1.0 / a11;
  v39.size.height = 1.0 / a12;
  CGRectGetMaxY(v39);
  if (v29 >= v30 * v28)
    v31 = v30 * v28;
  else
    v31 = v29;
  return v35 + v31;
}

double TSDClampRectToRect(double a1, double a2, CGFloat a3, CGFloat a4, double a5, double a6, double a7, double a8)
{
  double v15;
  double MaxX;
  double MaxY;
  double v18;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect v25;

  v23 = a5 + a7;
  v15 = TSUClamp(a1, a5, a5 + a7);
  v21 = a6;
  v22 = a6 + a8;
  TSUClamp(a2, a6, a6 + a8);
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  MaxY = CGRectGetMaxY(v25);
  v18 = TSUClamp(MaxX, a5, v23);
  TSUClamp(MaxY, v21, v22);
  if (v15 >= v18)
    return v18;
  else
    return v15;
}

double TSDAliasRound(double a1)
{
  double v1;
  double v2;
  double result;

  v1 = floor(a1);
  v2 = a1 - v1;
  result = ceil(a1);
  if (v2 < 0.49)
    return v1;
  return result;
}

double TSDAliasRoundedPoint(double a1)
{
  double v1;
  double v2;
  double result;

  v1 = floor(a1);
  v2 = a1 - v1;
  result = ceil(a1);
  if (v2 < 0.49)
    return v1;
  return result;
}

double TSDRoundForScale(double a1, double a2)
{
  return TSURound(a1 * a2) / a2;
}

double TSDRoundedPoint(double a1, double a2)
{
  double v3;

  v3 = TSURound(a1);
  TSURound(a2);
  return v3;
}

double TSDRoundedPointForScale(double a1, double a2, double a3)
{
  double v4;
  double v5;

  v4 = a2 * a3;
  v5 = TSURound(a1 * a3);
  TSURound(v4);
  return 1.0 / a3 * v5;
}

double TSDRoundedSize(double a1, double a2)
{
  double v3;

  v3 = TSURound(a1);
  TSURound(a2);
  return v3;
}

double TSDCeilSize(double a1)
{
  return ceil(a1);
}

double TSDRoundedRect(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  return TSDRoundedRectForScale(a1, a2, a3, a4, 1.0);
}

double TSDRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v15;
  double MinY;
  double v17;
  double MaxX;
  CGFloat v19;
  double MaxY;
  double v21;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v23.origin.x = TSDMultiplyRectScalar(v8, a2, a3, a4, a5);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    MinX = CGRectGetMinX(v23);
    v15 = TSURound(MinX);
    v24.origin.x = x;
    v24.origin.y = y;
    v24.size.width = width;
    v24.size.height = height;
    MinY = CGRectGetMinY(v24);
    v17 = TSURound(MinY);
    v25.origin.x = x;
    v25.origin.y = y;
    v25.size.width = width;
    v25.size.height = height;
    MaxX = CGRectGetMaxX(v25);
    v19 = TSURound(MaxX) - v15;
    v26.origin.x = x;
    v26.origin.y = y;
    v26.size.width = width;
    v26.size.height = height;
    MaxY = CGRectGetMaxY(v26);
    v21 = TSURound(MaxY);
    return TSDMultiplyRectScalar(v15, v17, v19, v21 - v17, 1.0 / a5);
  }
  return v8;
}

double TSDAliasRoundedRectForScale(double a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double v8;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MinX;
  double v15;
  double v16;
  double v17;
  double v18;
  double MinY;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double MaxX;
  double v25;
  double v26;
  double v27;
  double MaxY;
  double v29;
  double v30;
  double v31;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v8 = a1;
  if (a5 != 0.0 && !CGRectIsNull(*(CGRect *)&a1))
  {
    v34.origin.x = TSDMultiplyRectScalar(v8, a2, a3, a4, a5);
    x = v34.origin.x;
    y = v34.origin.y;
    width = v34.size.width;
    height = v34.size.height;
    MinX = CGRectGetMinX(v34);
    v15 = floor(MinX);
    v16 = MinX - v15;
    v17 = ceil(MinX);
    if (v16 >= 0.49)
      v18 = v17;
    else
      v18 = v15;
    v35.origin.x = x;
    v35.origin.y = y;
    v35.size.width = width;
    v35.size.height = height;
    MinY = CGRectGetMinY(v35);
    v20 = floor(MinY);
    v21 = MinY - v20;
    v22 = ceil(MinY);
    if (v21 >= 0.49)
      v23 = v22;
    else
      v23 = v20;
    v36.origin.x = x;
    v36.origin.y = y;
    v36.size.width = width;
    v36.size.height = height;
    MaxX = CGRectGetMaxX(v36);
    v25 = floor(MaxX);
    v26 = MaxX - v25;
    v27 = ceil(MaxX);
    if (v26 < 0.49)
      v27 = v25;
    v33 = v27 - v18;
    v37.origin.x = x;
    v37.origin.y = y;
    v37.size.width = width;
    v37.size.height = height;
    MaxY = CGRectGetMaxY(v37);
    v29 = floor(MaxY);
    v30 = MaxY - v29;
    v31 = ceil(MaxY);
    if (v30 < 0.49)
      v31 = v29;
    return TSDMultiplyRectScalar(v18, v23, v33, v31 - v23, 1.0 / a5);
  }
  return v8;
}

double TSDRoundedMinX(double a1, double a2, double a3, double a4)
{
  double MinX;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  return TSURound(MinX);
}

double TSDRoundedMidX(double a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double v8;
  double MaxX;
  double v10;
  CGRect v12;

  v8 = TSURound(a1);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  MaxX = CGRectGetMaxX(v12);
  v10 = (v8 + TSURound(MaxX)) * 0.5;
  return TSURound(v10);
}

double TSDRoundedMaxX(double a1, double a2, double a3, double a4)
{
  double MaxX;

  MaxX = CGRectGetMaxX(*(CGRect *)&a1);
  return TSURound(MaxX);
}

double TSDRoundedMinY(double a1, double a2, double a3, double a4)
{
  double MinY;

  MinY = CGRectGetMinY(*(CGRect *)&a1);
  return TSURound(MinY);
}

double TSDRoundedMidY(CGFloat a1, double a2, CGFloat a3, CGFloat a4)
{
  double v8;
  double MaxY;
  double v10;
  CGRect v12;

  v8 = TSURound(a2);
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  MaxY = CGRectGetMaxY(v12);
  v10 = (v8 + TSURound(MaxY)) * 0.5;
  return TSURound(v10);
}

double TSDRoundedMaxY(double a1, double a2, double a3, double a4)
{
  double MaxY;

  MaxY = CGRectGetMaxY(*(CGRect *)&a1);
  return TSURound(MaxY);
}

double TSDFloorForScale(double a1, double a2)
{
  return TSURound(a1 * a2) / a2;
}

uint64_t TSDSizeHasNaNComponents()
{
  return 0;
}

uint64_t TSDTransformHasNaNComponents()
{
  return 0;
}

uint64_t TSDSizeHasInfComponents(double a1, double a2)
{
  _BOOL4 v2;

  v2 = fabs(a2) == INFINITY;
  return fabs(a1) == INFINITY || v2;
}

double TSDSanitizeRect(double result)
{
  double v1;
  double v2;

  v1 = fabs(result);
  if (v1 >= INFINITY)
    v2 = 0.0;
  else
    v2 = result;
  if (v1 <= INFINITY)
    return v2;
  return result;
}

double TSDSanitizePoint(double result)
{
  double v1;
  double v2;

  v1 = fabs(result);
  if (v1 >= INFINITY)
    v2 = 0.0;
  else
    v2 = result;
  if (v1 <= INFINITY)
    return v2;
  return result;
}

double TSDSanitizeSize(double result)
{
  double v1;
  double v2;

  v1 = fabs(result);
  if (v1 >= INFINITY)
    v2 = 0.0;
  else
    v2 = result;
  if (v1 <= INFINITY)
    return v2;
  return result;
}

BOOL TSDTransformsDifferOnlyByTranslation(double *a1, double *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

CGPath *TSDCreatePathFromTransformedRect(const CGAffineTransform *a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  CGPath *Mutable;
  CGRect v12;

  Mutable = CGPathCreateMutable();
  v12.origin.x = a2;
  v12.origin.y = a3;
  v12.size.width = a4;
  v12.size.height = a5;
  CGPathAddRect(Mutable, a1, v12);
  return Mutable;
}

float64x2_t TSDTransformedCornersOfRect(float64x2_t *a1, double *a2, double *a3, double *a4, double *a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  CGFloat MinX;
  CGFloat MinY;
  CGFloat MaxX;
  CGFloat MaxY;
  float64x2_t result;
  CGRect v23;
  CGRect v24;
  CGRect v25;

  MinX = CGRectGetMinX(*(CGRect *)&a6);
  v23.origin.x = a6;
  v23.origin.y = a7;
  v23.size.width = a8;
  v23.size.height = a9;
  MinY = CGRectGetMinY(v23);
  v24.origin.x = a6;
  v24.origin.y = a7;
  v24.size.width = a8;
  v24.size.height = a9;
  MaxX = CGRectGetMaxX(v24);
  v25.origin.x = a6;
  v25.origin.y = a7;
  v25.size.width = a8;
  v25.size.height = a9;
  MaxY = CGRectGetMaxY(v25);
  *a2 = MinX;
  a2[1] = MinY;
  *a3 = MinX;
  a3[1] = MaxY;
  *a4 = MaxX;
  a4[1] = MaxY;
  *a5 = MaxX;
  a5[1] = MinY;
  *(float64x2_t *)a2 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a2[1]), *a1, *a2));
  *(float64x2_t *)a3 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a3[1]), *a1, *a3));
  *(float64x2_t *)a4 = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a4[1]), *a1, *a4));
  result = vaddq_f64(a1[2], vmlaq_n_f64(vmulq_n_f64(a1[1], a5[1]), *a1, *a5));
  *(float64x2_t *)a5 = result;
  return result;
}

CGAffineTransform *TSDAffineTransformShear@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  __int128 v9;
  CGAffineTransform v11;
  CGAffineTransform t1;

  t1.a = 1.0;
  t1.b = a3;
  t1.c = a4;
  __asm { FMOV            V0.2D, #1.0 }
  *(_OWORD *)&t1.d = _Q0;
  t1.ty = 1.0;
  v9 = a1[1];
  *(_OWORD *)&v11.a = *a1;
  *(_OWORD *)&v11.c = v9;
  *(_OWORD *)&v11.tx = a1[2];
  return CGAffineTransformConcat(a2, &t1, &v11);
}

long double TSDTransformAngle(double *a1)
{
  double v1;
  double v2;

  v2 = *a1;
  v1 = a1[1];
  if (v1 * a1[2] - *a1 * a1[3] > 0.0)
  {
    v2 = -v2;
    v1 = -v1;
  }
  return atan2(v1, v2) * 57.2957795;
}

BOOL TSDIsTransformFlipped(double *a1)
{
  return a1[2] * a1[1] - *a1 * a1[3] > 0.0;
}

double TSDTransformScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

double TSDTransformIsValid(double *a1)
{
  double v1;
  double result;
  double v3;
  BOOL v4;
  BOOL v5;

  v1 = fabs(*a1 * a1[3] - a1[1] * a1[2]);
  result = 0.0;
  if (v1 >= 0.001 && v1 != INFINITY && fabs(a1[4]) != INFINITY)
  {
    v3 = fabs(a1[5]);
    v4 = v3 < INFINITY;
    v5 = v3 <= INFINITY;
    result = 0.0;
    if (v4)
      result = 1.0;
    if (!v5)
      return 1.0;
  }
  return result;
}

double TSDTransformXYScale(double *a1)
{
  return sqrt(a1[1] * a1[1] + *a1 * *a1);
}

CGAffineTransform *TSDTransformNormalizeScale@<X0>(uint64_t a1@<X0>, CGAffineTransform *a2@<X8>)
{
  CGFloat v2;
  CGFloat v3;
  __int128 v4;
  CGAffineTransform v6;

  v2 = 1.0 / sqrt(*(double *)(a1 + 8) * *(double *)(a1 + 8) + *(double *)a1 * *(double *)a1);
  v3 = 1.0 / sqrt(*(double *)(a1 + 24) * *(double *)(a1 + 24) + *(double *)(a1 + 16) * *(double *)(a1 + 16));
  v4 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v6.a = *(_OWORD *)a1;
  *(_OWORD *)&v6.c = v4;
  *(_OWORD *)&v6.tx = *(_OWORD *)(a1 + 32);
  return CGAffineTransformScale(a2, &v6, v2, v3);
}

BOOL TSDIsTransformAxisAlignedWithObjectSize(double *a1, double a2, double a3)
{
  double v3;
  double v4;
  double v5;

  v3 = 1.0 / (a2 * 0.5);
  v4 = 1.0 / (a3 * 0.5);
  if (v3 >= v4)
    v3 = v4;
  v5 = fabs(a1[3]);
  if (fabs(*a1) < v3 && v5 < v3)
    return 1;
  if (fabs(a1[1]) >= v3)
    return 0;
  return fabs(a1[2]) < v3;
}

BOOL TSDIsTransformAxisAlignedWithThreshold(double *a1, double a2)
{
  if (fabs(*a1) < a2 && fabs(a1[3]) < a2)
    return 1;
  if (fabs(a1[1]) >= a2)
    return 0;
  return fabs(a1[2]) < a2;
}

BOOL TSDIsTransformAxisAligned(double *a1)
{
  if (fabs(*a1) < 1.0e-12 && fabs(a1[3]) < 1.0e-12)
    return 1;
  if (fabs(a1[1]) >= 1.0e-12)
    return 0;
  return fabs(a1[2]) < 1.0e-12;
}

BOOL TSDIsTransformAxisAlignedUnflipped(double *a1)
{
  return fabs(a1[1]) < 1.0e-12 && fabs(a1[2]) < 1.0e-12 && *a1 >= 0.0 && a1[3] >= 0.0;
}

CGAffineTransform *TSDAffineTransformForFlips@<X0>(CGAffineTransform *result@<X0>, int a2@<W1>, uint64_t a3@<X8>, CGFloat a4@<D0>, CGFloat a5@<D1>, CGFloat a6@<D2>, CGFloat a7@<D3>)
{
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  double MinX;
  CGFloat MaxX;
  __int128 v22;
  __int128 v23;
  double MinY;
  CGFloat MaxY;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  CGAffineTransform v33;
  CGAffineTransform v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  v13 = MEMORY[0x1E0C9BAA8];
  v14 = *MEMORY[0x1E0C9BAA8];
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a3 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a3 + 16) = v15;
  v16 = *(_OWORD *)(v13 + 32);
  *(_OWORD *)(a3 + 32) = v16;
  if ((_DWORD)result)
  {
    v31 = v15;
    v32 = v14;
    v17 = a4;
    v18 = a5;
    v30 = v16;
    v19 = a6;
    MinX = CGRectGetMinX(*(CGRect *)(&a7 - 3));
    v35.origin.x = a4;
    v35.origin.y = a5;
    v35.size.width = a6;
    v35.size.height = a7;
    MaxX = CGRectGetMaxX(v35);
    *(_OWORD *)&v34.a = v32;
    *(_OWORD *)&v34.c = v31;
    *(_OWORD *)&v34.tx = v30;
    CGAffineTransformTranslate((CGAffineTransform *)a3, &v34, MinX + MaxX, 0.0);
    v22 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v22;
    *(_OWORD *)&v33.tx = *(_OWORD *)(a3 + 32);
    result = CGAffineTransformScale(&v34, &v33, -1.0, 1.0);
    v23 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v23;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  if (a2)
  {
    v36.origin.x = a4;
    v36.origin.y = a5;
    v36.size.width = a6;
    v36.size.height = a7;
    MinY = CGRectGetMinY(v36);
    v37.origin.x = a4;
    v37.origin.y = a5;
    v37.size.width = a6;
    v37.size.height = a7;
    MaxY = CGRectGetMaxY(v37);
    v26 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v26;
    *(_OWORD *)&v33.tx = *(_OWORD *)(a3 + 32);
    CGAffineTransformTranslate(&v34, &v33, 0.0, MinY + MaxY);
    v27 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v27;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
    v28 = *(_OWORD *)(a3 + 16);
    *(_OWORD *)&v33.a = *(_OWORD *)a3;
    *(_OWORD *)&v33.c = v28;
    *(_OWORD *)&v33.tx = *(_OWORD *)(a3 + 32);
    result = CGAffineTransformScale(&v34, &v33, 1.0, -1.0);
    v29 = *(_OWORD *)&v34.c;
    *(_OWORD *)a3 = *(_OWORD *)&v34.a;
    *(_OWORD *)(a3 + 16) = v29;
    *(_OWORD *)(a3 + 32) = *(_OWORD *)&v34.tx;
  }
  return result;
}

CGAffineTransform *TSDTransformFromTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  CGAffineTransform v10;
  CGAffineTransform t1;
  CGAffineTransform v12;

  v6 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v6;
  *(_OWORD *)&v10.tx = a2[2];
  CGAffineTransformInvert(&t1, &v10);
  v7 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  v8 = a2[1];
  *(_OWORD *)&v10.a = *a2;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tx = a2[2];
  return CGAffineTransformConcat(a3, &v12, &v10);
}

CGAffineTransform *TSDTransformInTransformSpace@<X0>(_OWORD *a1@<X0>, _OWORD *a2@<X1>, CGAffineTransform *a3@<X8>)
{
  __int128 v5;
  __int128 v6;
  __int128 v7;
  CGAffineTransform v9;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v12;

  v5 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v5;
  *(_OWORD *)&t1.tx = a2[2];
  v6 = a1[1];
  *(_OWORD *)&t2.a = *a1;
  *(_OWORD *)&t2.c = v6;
  *(_OWORD *)&t2.tx = a1[2];
  CGAffineTransformConcat(&v12, &t1, &t2);
  v7 = a2[1];
  *(_OWORD *)&t1.a = *a2;
  *(_OWORD *)&t1.c = v7;
  *(_OWORD *)&t1.tx = a2[2];
  CGAffineTransformInvert(&v9, &t1);
  return CGAffineTransformConcat(a3, &v12, &v9);
}

CGAffineTransform *TSDTransformConvertForNewOrigin@<X0>(_OWORD *a1@<X0>, CGAffineTransform *a2@<X8>, CGFloat a3@<D0>, CGFloat a4@<D1>)
{
  __int128 v8;
  CGAffineTransform v10;
  CGAffineTransform t1;
  CGAffineTransform v12;
  CGAffineTransform v13;
  CGAffineTransform v14;

  memset(&v14, 0, sizeof(v14));
  CGAffineTransformMakeTranslation(&v14, -a3, -a4);
  memset(&v13, 0, sizeof(v13));
  CGAffineTransformMakeTranslation(&v13, a3, a4);
  t1 = v13;
  v8 = a1[1];
  *(_OWORD *)&v10.a = *a1;
  *(_OWORD *)&v10.c = v8;
  *(_OWORD *)&v10.tx = a1[2];
  CGAffineTransformConcat(&v12, &t1, &v10);
  t1 = v14;
  return CGAffineTransformConcat(a2, &v12, &t1);
}

CGAffineTransform *TSDTransformMakeFree@<X0>(int a1@<W0>, uint64_t a2@<X8>, double a3@<D0>, double a4@<D1>, double a5@<D2>, double a6@<D3>, CGFloat a7@<D4>, double a8@<D5>, double a9@<D6>, double a10@<D7>)
{
  double v18;
  double v19;
  double v20;
  long double v21;
  double v22;
  double v23;
  long double v24;
  double v25;
  __int128 v26;
  __int128 v27;
  double v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  CGAffineTransform *result;
  __int128 v35;
  double sx;
  CGFloat v38;
  CGAffineTransform v39;
  CGAffineTransform v40;
  CGAffineTransform v41;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v44;

  v18 = TSDDistance(a3, a4, a5, a6);
  v38 = a7;
  v19 = TSDDistance(a7, a8, a9, a10);
  if (v18 < 0.0001 || v19 < 0.0001)
    return CGAffineTransformMakeTranslation((CGAffineTransform *)a2, a7 - a3, a8 - a4);
  sx = v19 / v18;
  v20 = TSDSubtractPoints(a3, a4, a5);
  v22 = TSDAngleFromDelta(v20, v21);
  v23 = TSDSubtractPoints(a7, a8, a9);
  v25 = TSDAngleFromDelta(v23, v24);
  *(_OWORD *)a2 = 0u;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  CGAffineTransformMakeTranslation((CGAffineTransform *)a2, -a3, -a4);
  CGAffineTransformMakeRotation(&t2, -v22);
  v26 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a2;
  *(_OWORD *)&t1.c = v26;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v44, &t1, &t2);
  v27 = *(_OWORD *)&v44.c;
  *(_OWORD *)a2 = *(_OWORD *)&v44.a;
  *(_OWORD *)(a2 + 16) = v27;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
  v28 = 1.0;
  if (!a1)
    v28 = sx;
  CGAffineTransformMakeScale(&v41, sx, v28);
  v29 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a2;
  *(_OWORD *)&t1.c = v29;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v44, &t1, &v41);
  v30 = *(_OWORD *)&v44.c;
  *(_OWORD *)a2 = *(_OWORD *)&v44.a;
  *(_OWORD *)(a2 + 16) = v30;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
  CGAffineTransformMakeRotation(&v40, v25);
  v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a2;
  *(_OWORD *)&t1.c = v31;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformConcat(&v44, &t1, &v40);
  v32 = *(_OWORD *)&v44.c;
  *(_OWORD *)a2 = *(_OWORD *)&v44.a;
  *(_OWORD *)(a2 + 16) = v32;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
  CGAffineTransformMakeTranslation(&v39, v38, a8);
  v33 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&t1.a = *(_OWORD *)a2;
  *(_OWORD *)&t1.c = v33;
  *(_OWORD *)&t1.tx = *(_OWORD *)(a2 + 32);
  result = CGAffineTransformConcat(&v44, &t1, &v39);
  v35 = *(_OWORD *)&v44.c;
  *(_OWORD *)a2 = *(_OWORD *)&v44.a;
  *(_OWORD *)(a2 + 16) = v35;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v44.tx;
  return result;
}

CGFloat TSDTransformMakeAxisAligned@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D1>, double a4@<D2>, double a5@<D3>, double a6@<D4>, double a7@<D5>, double a8@<D6>, double a9@<D7>, double a10, double a11, double a12)
{
  double v19;
  double v20;
  double v21;
  CGFloat result;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  CGAffineTransform v29;
  CGAffineTransform t1;
  CGAffineTransform t2;
  CGAffineTransform v32;

  v19 = TSDDistance(a2, a3, a4, a5);
  v20 = TSDDistance(a6, a7, a8, a9);
  if (v19 < 0.0001 || v20 < 0.0001)
  {
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, a6 - a2, a7 - a3);
  }
  else
  {
    v21 = v20 / v19;
    if (v21 >= a10)
    {
      if (v21 > a11)
        v21 = a11 + (v21 - a11) * a12;
    }
    else
    {
      v21 = (v21 - a10) * a12 * 0.5 + a10;
    }
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
    CGAffineTransformMakeTranslation((CGAffineTransform *)a1, (a2 + a4) * -0.5, (a3 + a5) * -0.5);
    CGAffineTransformMakeScale(&t2, v21, v21);
    v23 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v23;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &t2);
    v24 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v24;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
    CGAffineTransformMakeTranslation(&v29, (a6 + a8) * 0.5, (a7 + a9) * 0.5);
    v25 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)&t1.a = *(_OWORD *)a1;
    *(_OWORD *)&t1.c = v25;
    *(_OWORD *)&t1.tx = *(_OWORD *)(a1 + 32);
    CGAffineTransformConcat(&v32, &t1, &v29);
    v26 = *(_OWORD *)&v32.c;
    *(_OWORD *)a1 = *(_OWORD *)&v32.a;
    *(_OWORD *)(a1 + 16) = v26;
    result = v32.tx;
    *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  }
  return result;
}

CGFloat TSDTransformConvertingRectToRect@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>)
{
  return TSDTransformConvertingRectToRectAtPercent(a1, a2, a3, a4, a5, a6, a7, a8, 1.0);
}

CGFloat TSDTransformConvertingRectToRectAtPercent@<D0>(uint64_t a1@<X8>, double a2@<D0>, double a3@<D2>, double a4@<D3>, double a5@<D4>, double a6@<D5>, double a7@<D6>, double a8@<D7>, double a9)
{
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  CGFloat result;
  CGAffineTransform v31;
  CGAffineTransform v32;

  v14 = TSDSubtractPoints(a5, a6, a2);
  v15 = a7 / a3;
  v16 = a8 / a4;
  v18 = TSDMultiplyPointScalar(v14, v17, a9);
  v20 = v19;
  v21 = TSDMixSizes(1.0, 1.0, v15, v16, a9);
  v23 = v22;
  v24 = MEMORY[0x1E0C9BAA8];
  v25 = *MEMORY[0x1E0C9BAA8];
  v26 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)a1 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)(a1 + 16) = v26;
  v27 = *(_OWORD *)(v24 + 32);
  *(_OWORD *)(a1 + 32) = v27;
  *(_OWORD *)&v32.a = v25;
  *(_OWORD *)&v32.c = v26;
  *(_OWORD *)&v32.tx = v27;
  CGAffineTransformTranslate((CGAffineTransform *)a1, &v32, v18, v20);
  v28 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v31.a = *(_OWORD *)a1;
  *(_OWORD *)&v31.c = v28;
  *(_OWORD *)&v31.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v32, &v31, v21, v23);
  v29 = *(_OWORD *)&v32.c;
  *(_OWORD *)a1 = *(_OWORD *)&v32.a;
  *(_OWORD *)(a1 + 16) = v29;
  result = v32.tx;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v32.tx;
  return result;
}

double TSD_CGAffineTransformDecompose(uint64_t a1, uint64_t a2)
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  __int128 v14;
  __int128 v15;
  double v16;
  __int128 v17;
  __int128 v18;
  double result;
  CGAffineTransform v20;
  CGAffineTransform v21;

  v4 = *(double *)(a1 + 8);
  v5 = *(double *)(a1 + 16);
  v6 = *(double *)(a1 + 24);
  v7 = sqrt(v4 * v4 + *(double *)a1 * *(double *)a1);
  v8 = sqrt(v6 * v6 + v5 * v5);
  v9 = *(double *)a1 * v6 - v5 * v4;
  v10 = -v8;
  v11 = -v7;
  if (*(double *)a1 < v6)
    v10 = v8;
  else
    v11 = v7;
  if (v9 < 0.0)
    v12 = v11;
  else
    v12 = v7;
  if (v9 < 0.0)
    v13 = v10;
  else
    v13 = v8;
  v14 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v14;
  *(_OWORD *)&v20.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformScale(&v21, &v20, 1.0 / v12, 1.0 / v13);
  v15 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v15;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  v16 = atan2(*(long double *)(a1 + 8), *(long double *)a1);
  v17 = *(_OWORD *)(a1 + 16);
  *(_OWORD *)&v20.a = *(_OWORD *)a1;
  *(_OWORD *)&v20.c = v17;
  *(_OWORD *)&v20.tx = *(_OWORD *)(a1 + 32);
  CGAffineTransformRotate(&v21, &v20, -v16);
  v18 = *(_OWORD *)&v21.c;
  *(_OWORD *)a1 = *(_OWORD *)&v21.a;
  *(_OWORD *)(a1 + 16) = v18;
  *(_OWORD *)(a1 + 32) = *(_OWORD *)&v21.tx;
  *(double *)a2 = v12;
  *(double *)(a2 + 8) = v13;
  *(double *)(a2 + 16) = v16;
  *(_QWORD *)(a2 + 24) = *(_QWORD *)a1;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a2 + 40) = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a2 + 48) = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 56) = *(_QWORD *)(a1 + 32);
  result = *(double *)(a1 + 40);
  *(double *)(a2 + 64) = result;
  return result;
}

CGFloat TSD_CGAffineTransformCompose@<D0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v4;
  CGFloat v5;
  __int128 v6;
  CGFloat v7;
  CGFloat v8;
  __int128 v9;
  __int128 v10;
  CGFloat result;
  CGAffineTransform v12;
  CGAffineTransform v13;

  v4 = *(_OWORD *)(a1 + 40);
  *(_OWORD *)a2 = *(_OWORD *)(a1 + 24);
  *(_OWORD *)(a2 + 16) = v4;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)(a1 + 56);
  v5 = *(double *)(a1 + 16);
  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v13.a = *(_OWORD *)a2;
  *(_OWORD *)&v13.c = v6;
  *(_OWORD *)&v13.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformRotate((CGAffineTransform *)a2, &v13, v5);
  v7 = *(double *)a1;
  v8 = *(double *)(a1 + 8);
  v9 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)&v12.a = *(_OWORD *)a2;
  *(_OWORD *)&v12.c = v9;
  *(_OWORD *)&v12.tx = *(_OWORD *)(a2 + 32);
  CGAffineTransformScale(&v13, &v12, v7, v8);
  v10 = *(_OWORD *)&v13.c;
  *(_OWORD *)a2 = *(_OWORD *)&v13.a;
  *(_OWORD *)(a2 + 16) = v10;
  result = v13.tx;
  *(_OWORD *)(a2 + 32) = *(_OWORD *)&v13.tx;
  return result;
}

double TSDTransformDecompose(_OWORD *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  __int128 v11;
  uint64_t v12;
  double result;
  uint64_t v14;
  _OWORD v15[3];
  _QWORD v16[10];

  v16[9] = *MEMORY[0x1E0C80C00];
  v11 = a1[1];
  v15[0] = *a1;
  v15[1] = v11;
  v15[2] = a1[2];
  TSD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)v16);
  v12 = v16[2];
  *a2 = v16[7];
  *a3 = v16[8];
  *a4 = v12;
  result = *(double *)v16;
  v14 = v16[1];
  *a5 = v16[0];
  *a6 = v14;
  return result;
}

uint64_t TSDTransform3DDecompose(_OWORD *a1, CGFloat *a2, CGFloat *a3, CGFloat *a4, CGFloat *a5, CGFloat *a6)
{
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  CGFloat m13;
  CGFloat m12;
  CGAffineTransform v24;
  CGAffineTransform v25;
  CATransform3D v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a1[5];
  *(_OWORD *)&v26.m31 = a1[4];
  *(_OWORD *)&v26.m33 = v12;
  v13 = a1[7];
  *(_OWORD *)&v26.m41 = a1[6];
  *(_OWORD *)&v26.m43 = v13;
  v14 = a1[1];
  *(_OWORD *)&v26.m11 = *a1;
  *(_OWORD *)&v26.m13 = v14;
  v15 = a1[3];
  *(_OWORD *)&v26.m21 = a1[2];
  *(_OWORD *)&v26.m23 = v15;
  v16 = MEMORY[0x1DF0DFDE4](&v26);
  if ((_DWORD)v16)
  {
    memset(&v24, 0, sizeof(v24));
    v17 = a1[5];
    *(_OWORD *)&v26.m31 = a1[4];
    *(_OWORD *)&v26.m33 = v17;
    v18 = a1[7];
    *(_OWORD *)&v26.m41 = a1[6];
    *(_OWORD *)&v26.m43 = v18;
    v19 = a1[1];
    *(_OWORD *)&v26.m11 = *a1;
    *(_OWORD *)&v26.m13 = v19;
    v20 = a1[3];
    *(_OWORD *)&v26.m21 = a1[2];
    *(_OWORD *)&v26.m23 = v20;
    CATransform3DGetAffineTransform(&v24, &v26);
    v25 = v24;
    TSD_CGAffineTransformDecompose((uint64_t)&v25, (uint64_t)&v26);
    m13 = v26.m13;
    *a2 = v26.m24;
    *a3 = v26.m31;
    *a4 = m13;
    m12 = v26.m12;
    *a5 = v26.m11;
    *a6 = m12;
  }
  return v16;
}

void TSDTransformMixAffineTransforms(__int128 *a1@<X0>, _OWORD *a2@<X1>, uint64_t a3@<X8>, double a4@<D0>)
{
  __int128 v7;
  __int128 v8;
  double v9;
  double v10;
  double v11;
  BOOL v12;
  double *v13;
  uint64_t i;
  _OWORD v15[3];
  __int128 v16;
  _OWORD v17[4];
  double v18;
  double v19;
  double __x;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v7 = a1[1];
  v16 = *a1;
  v17[0] = v7;
  v17[1] = a1[2];
  TSD_CGAffineTransformDecompose((uint64_t)&v16, (uint64_t)&v18);
  v8 = a2[1];
  v15[0] = *a2;
  v15[1] = v8;
  v15[2] = a2[2];
  TSD_CGAffineTransformDecompose((uint64_t)v15, (uint64_t)&v16);
  if ((v18 >= 0.0 || *((double *)&v16 + 1) >= 0.0) && (v19 >= 0.0 || *(double *)&v16 >= 0.0))
  {
    v9 = __x;
  }
  else
  {
    v18 = -v18;
    v19 = -v19;
    v9 = __x + dbl_1DDAF07E0[__x < 0.0];
  }
  v10 = fmod(v9, 6.28318531);
  __x = v10;
  v11 = fmod(*(long double *)v17, 6.28318531);
  *(double *)v17 = v11;
  if (vabdd_f64(v10, v11) > 3.14159265)
  {
    v12 = v10 <= v11;
    if (v10 > v11)
      v11 = v10;
    v13 = (double *)&v16;
    if (!v12)
      v13 = &v18;
    v13[2] = v11 + -6.28318531;
  }
  for (i = 0; i != 72; i += 8)
    *(double *)((char *)&v18 + i) = *(double *)((char *)&v18 + i)
                                  + (*(double *)((char *)&v17[-1] + i) - *(double *)((char *)&v18 + i)) * a4;
  TSD_CGAffineTransformCompose((uint64_t)&v18, a3);
}

BOOL TSDTransform3DNearlyEqualToTransform(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[8];
  _OWORD v12[8];

  v2 = a1[5];
  v12[4] = a1[4];
  v12[5] = v2;
  v3 = a1[7];
  v12[6] = a1[6];
  v12[7] = v3;
  v4 = a1[1];
  v12[0] = *a1;
  v12[1] = v4;
  v5 = a1[3];
  v12[2] = a1[2];
  v12[3] = v5;
  v6 = a2[5];
  v11[4] = a2[4];
  v11[5] = v6;
  v7 = a2[7];
  v11[6] = a2[6];
  v11[7] = v7;
  v8 = a2[1];
  v11[0] = *a2;
  v11[1] = v8;
  v9 = a2[3];
  v11[2] = a2[2];
  v11[3] = v9;
  return TSDTransform3DNearlyEqualToTransformWithTolerance((double *)v12, (double *)v11, 0.01);
}

BOOL TSDTransform3DNearlyEqualToTransformWithTolerance(double *a1, double *a2, double a3)
{
  return vabdd_f64(*a1, *a2) < a3
      && vabdd_f64(a1[1], a2[1]) < a3
      && vabdd_f64(a1[2], a2[2]) < a3
      && vabdd_f64(a1[3], a2[3]) < a3
      && vabdd_f64(a1[4], a2[4]) < a3
      && vabdd_f64(a1[5], a2[5]) < a3
      && vabdd_f64(a1[6], a2[6]) < a3
      && vabdd_f64(a1[7], a2[7]) < a3
      && vabdd_f64(a1[8], a2[8]) < a3
      && vabdd_f64(a1[9], a2[9]) < a3
      && vabdd_f64(a1[10], a2[10]) < a3
      && vabdd_f64(a1[11], a2[11]) < a3
      && vabdd_f64(a1[12], a2[12]) < a3
      && vabdd_f64(a1[13], a2[13]) < a3
      && vabdd_f64(a1[14], a2[14]) < a3
      && vabdd_f64(a1[15], a2[15]) < a3;
}

uint64_t TSUDeviceCMYKColorSpace()
{
  if (TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce != -1)
    dispatch_once(&TSUDeviceCMYKColorSpace_sDeviceCMYKDispatchOnce, &__block_literal_global_1);
  return TSUDeviceCMYKColorSpace_sDeviceCMYKColorSpace;
}

uint64_t TSUDeviceGrayColorSpace()
{
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce[0] != -1)
    dispatch_once(TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_2_1);
  return TSUDeviceGrayColorSpace_sDeviceGrayColorSpace;
}

CGColorRef TSUCGColorCreateDeviceRGB(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  CGFloat components[5];

  components[4] = *(CGFloat *)MEMORY[0x1E0C80C00];
  components[0] = a1;
  components[1] = a2;
  components[2] = a3;
  components[3] = a4;
  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_28);
  return CGColorCreate((CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, components);
}

CGColorRef TSUCGColorCreateDeviceGray(CGFloat a1, CGFloat a2)
{
  CGFloat components[3];

  components[2] = *(CGFloat *)MEMORY[0x1E0C80C00];
  components[0] = a1;
  components[1] = a2;
  if (TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce[0] != -1)
    dispatch_once(TSUDeviceGrayColorSpace_sDeviceGrayDispatchOnce, &__block_literal_global_2_1);
  return CGColorCreate((CGColorSpaceRef)TSUDeviceGrayColorSpace_sDeviceGrayColorSpace, components);
}

CGPatternRef TSUCGPatternCreateWithImageAndTransform(CGImage *a1, __int128 *a2)
{
  CGFloat v4;
  CGFloat v5;
  size_t Width;
  size_t Height;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  CGAffineTransform v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGRect v16;

  CGImageRetain(a1);
  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  Width = CGImageGetWidth(a1);
  Height = CGImageGetHeight(a1);
  if (a2)
  {
    v8 = a2[1];
    v13 = *a2;
    v14 = v8;
    v9 = a2[2];
  }
  else
  {
    v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v13 = *MEMORY[0x1E0C9BAA8];
    v14 = v10;
    v9 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  }
  v15 = v9;
  v16.size.height = (double)Height;
  v16.size.width = (double)Width;
  *(_OWORD *)&v12.a = v13;
  *(_OWORD *)&v12.c = v14;
  *(_OWORD *)&v12.tx = v9;
  v16.origin.x = v4;
  v16.origin.y = v5;
  return CGPatternCreate(a1, v16, &v12, (double)Width, v16.size.height, kCGPatternTilingConstantSpacing, 1, &TSUCGPatternCreateWithImageAndTransform_sCallbacks);
}

void TSUDrawImageAtOriginInContext(CGImage *a1, CGContext *a2)
{
  CGFloat v4;
  CGFloat v5;
  CGFloat Width;
  CGRect v7;

  v4 = *MEMORY[0x1E0C9D538];
  v5 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  Width = (double)CGImageGetWidth(a1);
  v7.size.height = (double)CGImageGetHeight(a1);
  v7.origin.x = v4;
  v7.origin.y = v5;
  v7.size.width = Width;
  CGContextDrawImage(a2, v7, a1);
}

CGColorRef TSUCGColorCreatePatternWithImageAndTransform(CGImage *a1, __int128 *a2)
{
  CGPattern *v2;
  CGColorSpace *Pattern;
  CGColorRef v4;
  CGFloat v6[2];

  v6[1] = *(CGFloat *)MEMORY[0x1E0C80C00];
  v2 = TSUCGPatternCreateWithImageAndTransform(a1, a2);
  Pattern = CGColorSpaceCreatePattern(0);
  v6[0] = 1.0;
  v4 = CGColorCreateWithPattern(Pattern, v2, v6);
  CGColorSpaceRelease(Pattern);
  CGPatternRelease(v2);
  return v4;
}

CGColorRef TSUCGColorCreatePatternWithImage(CGImage *a1)
{
  return TSUCGColorCreatePatternWithImageAndTransform(a1, 0);
}

uint64_t TSUHSBFromCGColorRef(CGColor *a1, double *a2, double *a3, double *a4, CGFloat *a5)
{
  CGColorSpace *ColorSpace;
  const CGFloat *Components;

  *a5 = 0.0;
  *a4 = 0.0;
  *a3 = 0.0;
  *a2 = 0.0;
  ColorSpace = CGColorGetColorSpace(a1);
  if (CGColorSpaceGetModel(ColorSpace) != kCGColorSpaceModelRGB || CGColorGetNumberOfComponents(a1) != 4)
    return 0;
  *a5 = CGColorGetAlpha(a1);
  Components = CGColorGetComponents(a1);
  TSURGBToHSB(a2, a3, a4, *Components, Components[1], Components[2]);
  return 1;
}

double TSURGBToHSB(double *a1, double *a2, double *a3, double a4, double a5, double a6)
{
  double v7;
  double v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double result;
  BOOL v18;
  double v19;

  if (a4 < a5 || a4 < a6)
  {
    if (a5 >= a4)
      v7 = a4;
    else
      v7 = a5;
    if (a4 >= a6)
      v8 = a6;
    else
      v8 = a4;
    v9 = a5 < a4 || a5 < a6;
    if (v9)
      v10 = a6;
    else
      v10 = a5;
    if (v9)
      v11 = v7;
    else
      v11 = v8;
  }
  else
  {
    if (a5 >= a6)
      v11 = a6;
    else
      v11 = a5;
    v10 = a4;
  }
  v12 = 0.0;
  if (v10 <= 0.0)
  {
    v14 = 0.0;
  }
  else
  {
    v13 = v10 - v11;
    v14 = (v10 - v11) / v10;
    if (v14 != 0.0)
    {
      v15 = (v10 - a5) / v13;
      v16 = (v10 - a6) / v13;
      if (v10 == a4)
      {
        if (v11 == a5)
          v12 = v16 + 5.0;
        else
          v12 = 1.0 - v15;
      }
      else
      {
        v18 = v10 == a5;
        v19 = (v10 - a4) / v13;
        if (v18)
        {
          if (v11 == a6)
            v12 = v19 + 1.0;
          else
            v12 = 3.0 - v16;
        }
        else if (v11 == a4)
        {
          v12 = v15 + 3.0;
        }
        else
        {
          v12 = 5.0 - v19;
        }
      }
    }
  }
  *a3 = v10;
  result = v12 / 6.0;
  *a1 = v12 / 6.0;
  *a2 = v14;
  return result;
}

double *TSUHSBToRGB(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  BOOL v7;
  double v8;
  uint64_t v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  v6 = a4 * 6.0;
  v7 = a4 == 1.0;
  v8 = 0.0;
  if (!v7)
    v8 = v6;
  v9 = (uint64_t)v8;
  v10 = v8 - (double)(uint64_t)v8;
  v11 = (1.0 - a5) * a6;
  v12 = (1.0 - a5 * v10) * a6;
  v13 = (1.0 - a5 * (1.0 - v10)) * a6;
  v14 = a6;
  v15 = v13;
  switch(v9)
  {
    case 0:
      goto LABEL_10;
    case 1:
      v14 = v12;
      v15 = a6;
      goto LABEL_10;
    case 2:
      v14 = v11;
      v15 = a6;
      v11 = v13;
      goto LABEL_10;
    case 3:
      v14 = v11;
      v15 = v12;
      goto LABEL_8;
    case 4:
      v14 = v13;
      v15 = v11;
LABEL_8:
      v11 = a6;
      goto LABEL_10;
    case 5:
      v14 = a6;
      v15 = v11;
      v11 = v12;
LABEL_10:
      *result = v14;
      *a2 = v15;
      *a3 = v11;
      break;
    default:
      return result;
  }
  return result;
}

double TSUCMYKToRGB(double *a1, double *a2, double *a3, double a4, double a5, double a6, double a7)
{
  double result;

  *a1 = 1.0 - fmin(a7 + a4 * (1.0 - a7), 1.0);
  *a2 = 1.0 - fmin(a7 + a5 * (1.0 - a7), 1.0);
  result = 1.0 - fmin(a7 + a6 * (1.0 - a7), 1.0);
  *a3 = result;
  return result;
}

uint64_t TSUColorIsBlack(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  uint64_t Model;
  const CGFloat *Components;
  uint64_t result;
  double v6;
  BOOL v7;

  ColorSpace = CGColorGetColorSpace(a1);
  Model = CGColorSpaceGetModel(ColorSpace);
  Components = CGColorGetComponents(a1);
  switch((int)Model)
  {
    case 0:
      v6 = *Components;
      goto LABEL_8;
    case 1:
      if (*Components != 0.0 || Components[1] != 0.0)
        goto LABEL_3;
      v6 = Components[2];
LABEL_8:
      v7 = v6 == 0.0;
LABEL_10:
      result = v7;
      break;
    case 2:
      v7 = Components[3] == 1.0;
      goto LABEL_10;
    case 3:
    case 4:
    case 5:
      NSLog(CFSTR("TSUColorIsBlack: unhandled color model %u for color %p"), Model, a1);
      goto LABEL_3;
    default:
LABEL_3:
      result = 0;
      break;
  }
  return result;
}

CGFloat TSUColorLightness(CGColor *a1)
{
  CGColorSpace *ColorSpace;
  CGColorSpaceModel Model;
  const CGFloat *v4;
  double v5;
  const CGFloat *Components;
  double v8;
  double v9;
  double v10;
  double v11;

  ColorSpace = CGColorGetColorSpace(a1);
  Model = CGColorSpaceGetModel(ColorSpace);
  switch(Model)
  {
    case kCGColorSpaceModelMonochrome:
      return *CGColorGetComponents(a1);
    case kCGColorSpaceModelCMYK:
      Components = CGColorGetComponents(a1);
      v8 = Components[3];
      v9 = 1.0 - fmin(v8 + *Components * (1.0 - v8), 1.0);
      v10 = 1.0 - fmin(v8 + Components[1] * (1.0 - v8), 1.0);
      v11 = 1.0 - fmin(v8 + Components[2] * (1.0 - v8), 1.0);
      v5 = fmax(fmax(v9, v10), v11) + fmin(fmin(v9, v10), v11);
      return v5 * 0.5;
    case kCGColorSpaceModelRGB:
      v4 = CGColorGetComponents(a1);
      v5 = fmax(fmax(*v4, v4[1]), v4[2]) + fmin(fmin(*v4, v4[1]), v4[2]);
      return v5 * 0.5;
  }
  NSLog(CFSTR("WARNING: Testing lightness of unsupported color model"));
  return 0.0;
}

CGContext *TSUCreateRGBABitmapContext(int a1, double a2, CGFloat a3, CGFloat a4)
{
  CGContext *v8;
  CGAffineTransform v10;
  CGAffineTransform transform;

  if (TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce != -1)
    dispatch_once(&TSUDeviceRGBColorSpace_sDeviceRGBDispatchOnce, &__block_literal_global_28);
  v8 = CGBitmapContextCreate(0, (unint64_t)(a2 * a4), (unint64_t)(a3 * a4), 8uLL, (4 * (unint64_t)(a2 * a4) + 31) & 0xFFFFFFFFFFFFFFE0, (CGColorSpaceRef)TSUDeviceRGBColorSpace_sDeviceRGBColorSpace, 0x2002u);
  CGAffineTransformMakeScale(&transform, a4, a4);
  CGContextConcatCTM(v8, &transform);
  if (a1)
  {
    CGContextTranslateCTM(v8, 0.0, a3);
    CGAffineTransformMakeScale(&v10, 1.0, -1.0);
    CGContextConcatCTM(v8, &v10);
  }
  return v8;
}

unint64_t TSUBitmapGetAlignedBytesPerRow(uint64_t a1)
{
  return (a1 + 31) & 0xFFFFFFFFFFFFFFE0;
}

CGColorRef TSUCreateCheckerBoardColor(CGColor *a1, CGColor *a2, CGFloat a3, CGFloat a4)
{
  double v8;
  double v9;
  CGContext *v10;
  CGContext *v11;
  CGImage *Image;
  CGColorRef PatternWithImageAndTransform;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v8 = a3 + a3;
  v9 = a4 + a4;
  v10 = TSUCreateRGBABitmapContext(0, a3 + a3, a4 + a4, 1.0);
  if (!v10)
    return 0;
  v11 = v10;
  CGContextSetFillColorWithColor(v10, a1);
  v15.origin.x = 0.0;
  v15.origin.y = 0.0;
  v15.size.width = v8;
  v15.size.height = v9;
  CGContextFillRect(v11, v15);
  CGContextSetFillColorWithColor(v11, a2);
  v16.origin.x = 0.0;
  v16.origin.y = 0.0;
  v16.size.width = a3;
  v16.size.height = a4;
  CGContextFillRect(v11, v16);
  v17.origin.x = a3;
  v17.origin.y = a4;
  v17.size.width = a3;
  v17.size.height = a4;
  CGContextFillRect(v11, v17);
  Image = CGBitmapContextCreateImage(v11);
  CGContextRelease(v11);
  if (!Image)
    return 0;
  PatternWithImageAndTransform = TSUCGColorCreatePatternWithImageAndTransform(Image, 0);
  CGImageRelease(Image);
  return PatternWithImageAndTransform;
}

double TSURound(double a1)
{
  return round(a1);
}

double TSUFractionalPart(double a1)
{
  BOOL v1;
  double v2;
  double result;

  v1 = a1 <= 0.0;
  v2 = -(-a1 - floor(-a1));
  result = a1 - floor(a1);
  if (v1)
    return v2;
  return result;
}

double TSUClamp(double a1, double a2, double a3)
{
  if (a1 >= a2)
  {
    a2 = a1;
    if (a1 > a3)
      return a3;
  }
  return a2;
}

uint64_t TSUClampInt(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a1 >= a3)
    v3 = a3;
  else
    v3 = a1;
  if (a1 >= a2)
    return v3;
  else
    return a2;
}

uint64_t TSUClampRange(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = a1 + a2;
  if (a1 >= a3 + a4)
    v5 = a3 + a4;
  else
    v5 = a1;
  if (a1 < a3)
    v5 = a3;
  if (v4 >= a3 + a4)
    v6 = a3 + a4;
  else
    v6 = a1 + a2;
  if (v4 >= a3)
    v7 = v6;
  else
    v7 = a3;
  if (v5 >= v7)
    v8 = v7;
  else
    v8 = v5;
  if (a1 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = a3 + a4;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0x7FFFFFFFFFFFFFFFLL;
  else
    return v8;
}

BOOL TSURangeEnclosesRange(NSRange range2, NSRange range1)
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v6;
  NSRange v7;

  if (range2.location == 0x7FFFFFFFFFFFFFFFLL || range1.location == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  length = range1.length;
  range1.length = range2.length;
  location = range2.location;
  if (length)
  {
    v7.location = range1.location;
    v7.length = length;
    range1.location = location;
    return NSIntersectionRange(v7, range1).length == length;
  }
  else
  {
    v6 = range1.location <= range2.location + range2.length;
    if (range1.location < range2.location)
      v6 = 0;
    if (range2.length)
      return v6;
    else
      return range2.location == range1.location;
  }
}

double TSUMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double TSUReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double TSUSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

id Date.isToday.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1DDAEB7B4();
  v1 = objc_msgSend(v0, sel_ic_isToday);

  return v1;
}

id Date.isYesterday.getter()
{
  void *v0;
  id v1;

  v0 = (void *)sub_1DDAEB7B4();
  v1 = objc_msgSend(v0, sel_ic_isYesterday);

  return v1;
}

void Date.shortFormattedDate.getter()
{
  sub_1DDADDF8C((SEL *)&selRef_ic_shortFormattedDate);
}

void Date.shortFormattedDateForAccessibility.getter()
{
  sub_1DDADDF8C((SEL *)&selRef_ic_shortFormattedDateForAccessibility);
}

void Date.briefFormattedDate.getter()
{
  sub_1DDADDF8C((SEL *)&selRef_ic_briefFormattedDate);
}

void Date.briefFormattedDateForAccessibility.getter()
{
  sub_1DDADDF8C((SEL *)&selRef_ic_briefFormattedDateForAccessibility);
}

void Date.localDateWithSeconds.getter()
{
  sub_1DDADDF8C((SEL *)&selRef_ic_localDateWithSeconds);
}

void sub_1DDADDF8C(SEL *a1)
{
  void *v2;
  id v3;

  v2 = (void *)sub_1DDAEB7B4();
  v3 = objc_msgSend(v2, *a1);

  if (v3)
  {
    sub_1DDAEB940();

  }
  else
  {
    __break(1u);
  }
}

uint64_t Date.truncated.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DDADE058((SEL *)&selRef_ic_truncated, a1);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0E0D5C]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t Date.startOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DDADE058((SEL *)&selRef_ic_startOfDay, a1);
}

uint64_t Date.endOfDay.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1DDADE058((SEL *)&selRef_ic_endOfDay, a1);
}

uint64_t sub_1DDADE058@<X0>(SEL *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  void (*v12)(char *, char *, uint64_t);
  uint64_t result;
  uint64_t v14;

  v4 = sub_1DDAEB7CC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED11E588);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)sub_1DDAEB7B4();
  v11 = objc_msgSend(v10, *a1);

  if (v11)
  {
    sub_1DDAEB7C0();

    v12 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v12(v9, v7, v4);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v9, 0, 1, v4);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v9, 1, v4);
    if ((_DWORD)result != 1)
      return ((uint64_t (*)(uint64_t, char *, uint64_t))v12)(a2, v9, v4);
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v9, 1, 1, v4);
  }
  __break(1u);
  return result;
}

id Date.isEarlier(than:)(uint64_t a1)
{
  return sub_1DDADE1D0(a1, (SEL *)&selRef_ic_isEarlierThanDate_);
}

id Date.isLater(than:)(uint64_t a1)
{
  return sub_1DDADE1D0(a1, (SEL *)&selRef_ic_isLaterThanDate_);
}

id Date.isSameDay(as:)(uint64_t a1)
{
  return sub_1DDADE1D0(a1, (SEL *)&selRef_ic_isSameDayAsDate_);
}

id sub_1DDADE1D0(uint64_t a1, SEL *a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)sub_1DDAEB7B4();
  v4 = (void *)sub_1DDAEB7B4();
  v5 = objc_msgSend(v3, *a2, v4);

  return v5;
}

uint64_t Date.numberOfDays(from:)()
{
  void *v0;
  void *v1;
  unint64_t v2;
  uint64_t result;

  v0 = (void *)sub_1DDAEB7B4();
  v1 = (void *)sub_1DDAEB7B4();
  v2 = (unint64_t)objc_msgSend(v0, sel_ic_numberOfDaysFromDate_, v1);

  if ((v2 & 0x8000000000000000) == 0)
    return v2;
  result = sub_1DDAEBB2C();
  __break(1u);
  return result;
}

void Date.briefFormattedDateForSiri(forAccessibility:inLocale:)(char a1)
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)sub_1DDAEB7B4();
  v3 = (void *)sub_1DDAEB7FC();
  v4 = objc_msgSend(v2, sel_ic_briefFormattedDateForSiriLocale_forAccessibility_, v3, a1 & 1);

  if (v4)
  {
    sub_1DDAEB940();

  }
  else
  {
    __break(1u);
  }
}

uint64_t Date.init(date:)@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void (*v12)(char *, char *, uint64_t);
  void (*v13)(char *, uint64_t, uint64_t, uint64_t);
  char *v14;
  uint64_t v15;
  uint64_t v17;

  v2 = sub_1DDAEB7CC();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v17 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED11E588);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  v9 = (void *)sub_1DDAEB934();
  objc_msgSend(v8, sel_setDateFormat_, v9);

  v10 = (void *)sub_1DDAEB934();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_dateFromString_, v10);

  if (!v11)
  {

    v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
    v13(v7, 1, 1, v2);
    goto LABEL_5;
  }
  sub_1DDAEB7C0();

  v12 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
  v12(v7, v5, v2);
  v13 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56);
  v13(v7, 0, 1, v2);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v7, 1, v2) == 1)
  {
LABEL_5:
    sub_1DDADE564((uint64_t)v7);
    v14 = a1;
    v15 = 1;
    return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v13)(v14, v15, 1, v2);
  }
  v12(a1, v7, v2);
  v14 = a1;
  v15 = 0;
  return ((uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))v13)(v14, v15, 1, v2);
}

uint64_t sub_1DDADE564(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED11E588);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void type metadata accessor for os_unfair_lock_s(uint64_t a1)
{
  sub_1DDADE624(a1, &qword_1F03FEC40);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_1DDADE5C8(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DDADE5E8(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for _NSRange(uint64_t a1)
{
  sub_1DDADE624(a1, &qword_1F03FF040);
}

void sub_1DDADE624(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t WeakRef.ref.getter()
{
  uint64_t v0;

  swift_beginAccess();
  return MEMORY[0x1DF0E0E88](v0 + 16);
}

uint64_t WeakRef.ref.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*WeakRef.ref.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[4] = v1;
  swift_beginAccess();
  v3[3] = MEMORY[0x1DF0E0E88](v1 + 16);
  return sub_1DDADE760;
}

void sub_1DDADE760(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t WeakRef.__allocating_init(_:)()
{
  uint64_t v0;

  swift_allocObject();
  v0 = sub_1DDADE884();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t WeakRef.init(_:)()
{
  uint64_t v0;

  v0 = sub_1DDADE884();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t WeakRef.deinit()
{
  uint64_t v0;

  swift_unknownObjectWeakDestroy();
  return v0;
}

uint64_t WeakRef.__deallocating_deinit()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocClassInstance();
}

uint64_t sub_1DDADE884()
{
  uint64_t v0;

  swift_unknownObjectWeakInit();
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return v0;
}

uint64_t sub_1DDADE8E0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + 16;
  swift_beginAccess();
  result = MEMORY[0x1DF0E0E88](v3);
  *a2 = result;
  return result;
}

uint64_t sub_1DDADE92C()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_1DDADE978()
{
  return 8;
}

_QWORD *sub_1DDADE984(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1DDADE994()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for WeakRef(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for WeakRef);
}

uint64_t method lookup function for WeakRef()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of WeakRef.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1DF0E0D20](a1, v6, a5);
}

uint64_t sub_1DDADEA20()
{
  uint64_t v0;

  v0 = sub_1DDAEB8D4();
  __swift_allocate_value_buffer(v0, qword_1F03FEC18);
  __swift_project_value_buffer(v0, (uint64_t)qword_1F03FEC18);
  return sub_1DDAEB8C8();
}

uint64_t GMSAvailability.available.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t GMSAvailability.available.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*GMSAvailability.available.modify())()
{
  return nullsub_1;
}

uint64_t GMSAvailability.availabilityInfo.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for GMSAvailability() + 20);
  return sub_1DDADEB30(v3, a1);
}

uint64_t type metadata accessor for GMSAvailability()
{
  uint64_t result;

  result = qword_1F03FF078;
  if (!qword_1F03FF078)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DDADEB30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t GMSAvailability.availabilityInfo.setter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for GMSAvailability() + 20);
  return sub_1DDADEBA8(a1, v3);
}

uint64_t sub_1DDADEBA8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*GMSAvailability.availabilityInfo.modify())()
{
  type metadata accessor for GMSAvailability();
  return nullsub_1;
}

id sub_1DDADEC18()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)ICModelAvailabilityManager), sel_init);
  qword_1F03FEC50 = (uint64_t)result;
  return result;
}

void __swiftcall ICModelAvailabilityManager.init()(ICModelAvailabilityManager *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id static ICModelAvailabilityManager.shared.getter()
{
  if (qword_1F03FEB88 != -1)
    swift_once();
  swift_beginAccess();
  return (id)qword_1F03FEC50;
}

void static ICModelAvailabilityManager.shared.setter(uint64_t a1)
{
  void *v2;

  if (qword_1F03FEB88 != -1)
    swift_once();
  swift_beginAccess();
  v2 = (void *)qword_1F03FEC50;
  qword_1F03FEC50 = a1;

}

uint64_t (*static ICModelAvailabilityManager.shared.modify())()
{
  if (qword_1F03FEB88 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t ICModelAvailabilityManager.supportsCallTranscription.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v1 = sub_1DDAEB838();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78]();
  v4 = (char *)&v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD **)(v0 + OBJC_IVAR___ICModelAvailabilityManager_callTranscriptionSupportedLocales);
  swift_bridgeObjectRetain();
  sub_1DDAEB808();
  v6 = sub_1DDAEB7D8();
  v8 = v7;
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  LOBYTE(v1) = sub_1DDADF040(v6, v8, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v1 & 1;
}

uint64_t sub_1DDADF040(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint64_t result;
  _QWORD *v9;
  uint64_t i;
  uint64_t v11;
  BOOL v12;

  v3 = a3[2];
  if (!v3)
    return 0;
  if (a3[4] == a1 && a3[5] == a2)
    return 1;
  result = sub_1DDAEBB74();
  if ((result & 1) != 0)
    return 1;
  if (v3 == 1)
    return 0;
  v9 = a3 + 7;
  for (i = 1; ; ++i)
  {
    v11 = i + 1;
    if (__OFADD__(i, 1))
      break;
    v12 = *(v9 - 1) == a1 && *v9 == a2;
    if (v12 || (sub_1DDAEBB74() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t ICModelAvailabilityManager.supportsGreymatter.getter()
{
  unsigned __int8 v1;

  sub_1DDAEBA9C();
  return v1;
}

uint64_t sub_1DDADF1CC@<X0>(uint64_t a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  int v9;
  char v10;
  uint64_t v11;

  v4 = type metadata accessor for GMSAvailability();
  result = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = OBJC_IVAR___ICModelAvailabilityManager_cachedSupportsGreymatter;
  v9 = *(unsigned __int8 *)(a1 + OBJC_IVAR___ICModelAvailabilityManager_cachedSupportsGreymatter);
  if (v9 == 2)
  {
    ICModelAvailabilityManager.gmsAvailability.getter(v7);
    v10 = *v7;
    result = sub_1DDAE1A00((uint64_t)v7);
    *(_BYTE *)(a1 + v8) = v10;
  }
  else
  {
    v10 = v9 & 1;
  }
  *a2 = v10;
  return result;
}

uint64_t sub_1DDADF274@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;

  return sub_1DDADF1CC(*(_QWORD *)(v1 + 16), a1);
}

uint64_t ICModelAvailabilityManager.gmsAvailability.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t (*v13)(char *, uint64_t);
  uint64_t v14;
  uint64_t v15;
  char *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  unint64_t v30;
  void (*v31)(char *, uint64_t);
  const char *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  unint64_t v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  uint64_t v43;
  NSObject *v44;
  os_log_type_t v45;
  uint8_t *v46;
  uint64_t v47;
  _BYTE *v48;
  uint64_t result;
  uint64_t v50;
  _BYTE *v51;
  _BYTE *v52;
  void (*v53)(char *, uint64_t);
  uint64_t v54;
  _BYTE *v55;
  _BYTE *v56;
  uint64_t v57;
  uint8_t *v58;
  uint8_t *v59;
  uint64_t v60;
  char *v61;
  uint64_t *v62;
  char *v63;
  _BYTE *v64;
  uint64_t v65;
  uint64_t v66;

  v64 = a1;
  v1 = sub_1DDAEB874();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = *(_QWORD *)(v2 + 64);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v63 = (char *)((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = (char *)((char *)&v57 - v63);
  v5 = sub_1DDAEB8B0();
  v6 = *(_QWORD *)(v5 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v8 = (char *)&v57 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DDAEB88C();
  v10 = *(_QWORD *)(v9 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v12 = (char *)&v57 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DDAEB880();
  sub_1DDAEB8A4();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  sub_1DDAEB898();
  v13 = *(uint64_t (**)(char *, uint64_t))(v6 + 8);
  v14 = v1;
  v15 = v13(v8, v5);
  MEMORY[0x1E0C80A78](v15);
  v16 = (char *)((char *)&v57 - v63);
  (*(void (**)(int64_t, char *, uint64_t))(v2 + 16))((char *)&v57 - v63, v4, v1);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v16, v1);
  if (MEMORY[0x1E0D25F68] && v17 == *MEMORY[0x1E0D25F68])
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v16, v1);
    v18 = sub_1DDAEB850();
    v63 = (char *)&v57;
    v19 = *(_QWORD *)(v18 - 8);
    v20 = *(_QWORD *)(v19 + 64);
    MEMORY[0x1E0C80A78](v18);
    v21 = (v20 + 15) & 0xFFFFFFFFFFFFFFF0;
    v22 = (char *)&v57 - v21;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))((char *)&v57 - v21, v16, v18);
    if (qword_1F03FEC30 != -1)
      swift_once();
    v23 = sub_1DDAEB8D4();
    v24 = __swift_project_value_buffer(v23, (uint64_t)qword_1F03FEC18);
    v62 = &v57;
    MEMORY[0x1E0C80A78](v24);
    v25 = (char *)&v57 - v21;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))((char *)&v57 - v21, (char *)&v57 - v21, v18);
    v26 = sub_1DDAEB8BC();
    v27 = sub_1DDAEBA6C();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v66 = v60;
      v61 = v4;
      *(_DWORD *)v28 = 136315138;
      v58 = v28 + 4;
      v59 = v28;
      v29 = sub_1DDAEB844();
      v65 = sub_1DDAE094C(v29, v30, &v66);
      v4 = v61;
      sub_1DDAEBACC();
      swift_bridgeObjectRelease();
      v31 = *(void (**)(char *, uint64_t))(v19 + 8);
      v31(v25, v18);
      v32 = "gms restricted: %s";
LABEL_13:
      v40 = v27;
      v41 = v59;
      _os_log_impl(&dword_1DDAA5000, v26, v40, v32, v59, 0xCu);
      v42 = v60;
      swift_arrayDestroy();
      MEMORY[0x1DF0E0DF8](v42, -1, -1);
      MEMORY[0x1DF0E0DF8](v41, -1, -1);

      v31(v22, v18);
LABEL_23:
      v54 = type metadata accessor for GMSAvailability();
      v55 = v64;
      v56 = &v64[*(int *)(v54 + 20)];
      (*(void (**)(_BYTE *, char *, uint64_t))(v2 + 32))(v56, v4, v14);
      result = (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v56, 0, 1, v14);
      *v55 = 0;
      return result;
    }
    goto LABEL_22;
  }
  if (MEMORY[0x1E0D25F78] && v17 == *MEMORY[0x1E0D25F78])
  {
    (*(void (**)(char *, uint64_t))(v2 + 96))(v16, v1);
    v18 = sub_1DDAEB868();
    v63 = (char *)&v57;
    v19 = *(_QWORD *)(v18 - 8);
    v33 = *(_QWORD *)(v19 + 64);
    MEMORY[0x1E0C80A78](v18);
    v34 = (v33 + 15) & 0xFFFFFFFFFFFFFFF0;
    v22 = (char *)&v57 - v34;
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))((char *)&v57 - v34, v16, v18);
    if (qword_1F03FEC30 != -1)
      swift_once();
    v35 = sub_1DDAEB8D4();
    v36 = __swift_project_value_buffer(v35, (uint64_t)qword_1F03FEC18);
    v62 = &v57;
    MEMORY[0x1E0C80A78](v36);
    v25 = (char *)&v57 - v34;
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))((char *)&v57 - v34, (char *)&v57 - v34, v18);
    v26 = sub_1DDAEB8BC();
    v27 = sub_1DDAEBA6C();
    if (os_log_type_enabled(v26, v27))
    {
      v37 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v66 = v60;
      v61 = v4;
      *(_DWORD *)v37 = 136315138;
      v58 = v37 + 4;
      v59 = v37;
      v38 = sub_1DDAEB85C();
      v65 = sub_1DDAE094C(v38, v39, &v66);
      v4 = v61;
      sub_1DDAEBACC();
      swift_bridgeObjectRelease();
      v31 = *(void (**)(char *, uint64_t))(v19 + 8);
      v31(v25, v18);
      v32 = "gms not available: %s";
      goto LABEL_13;
    }
LABEL_22:

    v53 = *(void (**)(char *, uint64_t))(v19 + 8);
    v53(v25, v18);
    v53(v22, v18);
    goto LABEL_23;
  }
  if (MEMORY[0x1E0D26080] && v17 == *MEMORY[0x1E0D26080])
  {
    if (qword_1F03FEC30 != -1)
      swift_once();
    v43 = sub_1DDAEB8D4();
    __swift_project_value_buffer(v43, (uint64_t)qword_1F03FEC18);
    v44 = sub_1DDAEB8BC();
    v45 = sub_1DDAEBA6C();
    if (os_log_type_enabled(v44, v45))
    {
      v46 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v46 = 0;
      _os_log_impl(&dword_1DDAA5000, v44, v45, "gms available", v46, 2u);
      MEMORY[0x1DF0E0DF8](v46, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    v47 = type metadata accessor for GMSAvailability();
    v48 = v64;
    result = (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v2 + 56))(&v64[*(int *)(v47 + 20)], 1, 1, v1);
    *v48 = 1;
  }
  else
  {
    v50 = type metadata accessor for GMSAvailability();
    v51 = v64;
    v52 = &v64[*(int *)(v50 + 20)];
    (*(void (**)(_BYTE *, char *, uint64_t))(v2 + 32))(v52, v4, v1);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v2 + 56))(v52, 0, 1, v1);
    *v51 = 0;
    return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v16, v1);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t ICModelAvailabilityManager.supportsGeneralASR.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v1 + 20));
  v2 = *(unsigned __int8 *)(v1 + 16);
  os_unfair_lock_unlock((os_unfair_lock_t)(v1 + 20));
  swift_release();
  return v2;
}

_BYTE *sub_1DDADFAB4@<X0>(_BYTE *result@<X0>, _BYTE *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t ICModelAvailabilityManager.determineASRAvailability()()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;

  v1[18] = v0;
  v2 = sub_1DDAEB820();
  v1[19] = v2;
  v1[20] = *(_QWORD *)(v2 - 8);
  v1[21] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC10);
  v1[22] = swift_task_alloc();
  v3 = sub_1DDAEB838();
  v1[23] = v3;
  v1[24] = *(_QWORD *)(v3 - 8);
  v1[25] = swift_task_alloc();
  v1[26] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DDADFB7C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  void (*v15)(uint64_t, uint64_t);
  void *v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t v21;

  sub_1DDAEB808();
  if (qword_1F03FEC30 != -1)
    swift_once();
  v1 = v0[25];
  v2 = v0[26];
  v3 = v0[23];
  v4 = v0[24];
  v5 = sub_1DDAEB8D4();
  v0[27] = __swift_project_value_buffer(v5, (uint64_t)qword_1F03FEC18);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v1, v2, v3);
  v6 = sub_1DDAEB8BC();
  v7 = sub_1DDAEBA6C();
  v8 = os_log_type_enabled(v6, v7);
  v10 = v0[24];
  v9 = v0[25];
  if (v8)
  {
    v20 = v0[23];
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v21 = v12;
    *(_DWORD *)v11 = 136315138;
    v13 = sub_1DDAEB7D8();
    v0[17] = sub_1DDAE094C(v13, v14, &v21);
    sub_1DDAEBACC();
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v15(v9, v20);
    _os_log_impl(&dword_1DDAA5000, v6, v7, "Current locale is %s", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0E0DF8](v12, -1, -1);
    MEMORY[0x1DF0E0DF8](v11, -1, -1);
  }
  else
  {
    v15 = *(void (**)(uint64_t, uint64_t))(v10 + 8);
    v15(v0[25], v0[23]);
  }

  v0[28] = v15;
  v16 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_1DDADFDCC;
  v17 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v18 = v0 + 10;
  v18[1] = 0x40000000;
  v18[2] = sub_1DDAE00E4;
  v18[3] = &block_descriptor;
  v18[4] = v17;
  objc_msgSend(v16, sel_supportedLanguagesForTaskHint_completion_, 1009, v18);
  return swift_continuation_await();
}

uint64_t sub_1DDADFDCC()
{
  return swift_task_switch();
}

uint64_t sub_1DDADFE18()
{
  uint64_t v0;
  _QWORD *v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  void (*v23)(uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;

  v1 = *(_QWORD **)(v0 + 120);
  swift_bridgeObjectRetain_n();
  v2 = sub_1DDAEB8BC();
  v3 = sub_1DDAEBA6C();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v28 = v5;
    *(_DWORD *)v4 = 136315138;
    v6 = swift_bridgeObjectRetain();
    v7 = MEMORY[0x1DF0DFBEC](v6, MEMORY[0x1E0DEA968]);
    v9 = v8;
    swift_bridgeObjectRelease();
    *(_QWORD *)(v0 + 128) = sub_1DDAE094C(v7, v9, &v28);
    sub_1DDAEBACC();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DDAA5000, v2, v3, "Supported languages are %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0E0DF8](v5, -1, -1);
    MEMORY[0x1DF0E0DF8](v4, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
  }

  v10 = *(_QWORD *)(v0 + 168);
  v11 = *(_QWORD *)(v0 + 176);
  v12 = *(_QWORD *)(v0 + 152);
  v13 = *(_QWORD *)(v0 + 160);
  sub_1DDAEB82C();
  sub_1DDAEB814();
  (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v10, v12);
  v14 = sub_1DDAEB7F0();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14);
  v17 = *(_QWORD *)(v0 + 176);
  if (v16 == 1)
  {
    swift_bridgeObjectRelease();
    sub_1DDAE1890(v17, &qword_1F03FEC10);
LABEL_8:
    v22 = 0;
    goto LABEL_9;
  }
  v18 = sub_1DDAEB7E4();
  v20 = v19;
  (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v17, v14);
  v21 = sub_1DDADF040(v18, v20, v1);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if ((v21 & 1) == 0)
    goto LABEL_8;
  v22 = 1;
LABEL_9:
  v23 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
  v24 = *(_QWORD *)(v0 + 208);
  v25 = *(_QWORD *)(v0 + 184);
  v26 = *(_QWORD *)(*(_QWORD *)(v0 + 144) + OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable);
  swift_retain();
  os_unfair_lock_lock((os_unfair_lock_t)(v26 + 20));
  *(_BYTE *)(v26 + 16) = v22;
  os_unfair_lock_unlock((os_unfair_lock_t)(v26 + 20));
  swift_release();
  v23(v24, v25);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DDAE00E4(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_1DDAEB988();
  return swift_continuation_resume();
}

uint64_t sub_1DDAE0240(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1DDAE02A0;
  return ICModelAvailabilityManager.determineASRAvailability()();
}

uint64_t sub_1DDAE02A0()
{
  uint64_t *v0;
  void (**v1)(_QWORD);
  void *v2;
  uint64_t v4;

  v1 = *(void (***)(_QWORD))(*v0 + 24);
  v2 = *(void **)(*v0 + 16);
  v4 = *v0;
  swift_task_dealloc();

  v1[2](v1);
  _Block_release(v1);
  return (*(uint64_t (**)(void))(v4 + 8))();
}

id ICModelAvailabilityManager.init()()
{
  _BYTE *v0;
  _BYTE *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  objc_super v15;

  v1 = v0;
  v2 = sub_1DDAEBA90();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DDAEB8EC();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DDAEBA84();
  MEMORY[0x1E0C80A78](v7);
  v1[OBJC_IVAR___ICModelAvailabilityManager_cachedSupportsGreymatter] = 2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC60);
  v8 = swift_allocObject();
  *(_OWORD *)(v8 + 16) = xmmword_1DDAF08A0;
  *(_QWORD *)(v8 + 32) = 0x53552D6E65;
  *(_QWORD *)(v8 + 40) = 0xE500000000000000;
  *(_QWORD *)(v8 + 48) = 0x41432D6E65;
  *(_QWORD *)(v8 + 56) = 0xE500000000000000;
  *(_QWORD *)(v8 + 64) = 0x42472D6E65;
  *(_QWORD *)(v8 + 72) = 0xE500000000000000;
  *(_QWORD *)(v8 + 80) = 0x55412D6E65;
  *(_QWORD *)(v8 + 88) = 0xE500000000000000;
  *(_QWORD *)(v8 + 96) = 0x47532D6E65;
  *(_QWORD *)(v8 + 104) = 0xE500000000000000;
  *(_QWORD *)(v8 + 112) = 0x415A2D6E65;
  *(_QWORD *)(v8 + 120) = 0xE500000000000000;
  *(_QWORD *)(v8 + 128) = 0x45492D6E65;
  *(_QWORD *)(v8 + 136) = 0xE500000000000000;
  *(_QWORD *)(v8 + 144) = 0x4E492D6E65;
  *(_QWORD *)(v8 + 152) = 0xE500000000000000;
  *(_QWORD *)(v8 + 160) = 0x5A4E2D6E65;
  *(_QWORD *)(v8 + 168) = 0xE500000000000000;
  *(_QWORD *)(v8 + 176) = 0x4E432D687ALL;
  *(_QWORD *)(v8 + 184) = 0xE500000000000000;
  *(_QWORD *)(v8 + 192) = 0x4B482D687ALL;
  *(_QWORD *)(v8 + 200) = 0xE500000000000000;
  *(_QWORD *)(v8 + 208) = 0x4E432D657579;
  *(_QWORD *)(v8 + 216) = 0xE600000000000000;
  *(_QWORD *)(v8 + 224) = 0x504A2D616ALL;
  *(_QWORD *)(v8 + 232) = 0xE500000000000000;
  *(_QWORD *)(v8 + 240) = 0x53452D7365;
  *(_QWORD *)(v8 + 248) = 0xE500000000000000;
  *(_QWORD *)(v8 + 256) = 0x584D2D7365;
  *(_QWORD *)(v8 + 264) = 0xE500000000000000;
  *(_QWORD *)(v8 + 272) = 0x53552D7365;
  *(_QWORD *)(v8 + 280) = 0xE500000000000000;
  *(_QWORD *)(v8 + 288) = 0x45442D6564;
  *(_QWORD *)(v8 + 296) = 0xE500000000000000;
  *(_QWORD *)(v8 + 304) = 0x52462D7266;
  *(_QWORD *)(v8 + 312) = 0xE500000000000000;
  *(_QWORD *)(v8 + 320) = 0x52422D7470;
  *(_QWORD *)(v8 + 328) = 0xE500000000000000;
  v9 = OBJC_IVAR___ICModelAvailabilityManager_callTranscriptionSupportedLocales;
  *(_QWORD *)(v8 + 336) = 0x57542D687ALL;
  *(_QWORD *)(v8 + 344) = 0xE500000000000000;
  *(_QWORD *)&v1[v9] = v8;
  v10 = OBJC_IVAR___ICModelAvailabilityManager_queue;
  sub_1DDAE1650(0, &qword_1F03FEC48);
  v11 = v1;
  sub_1DDAEBA78();
  sub_1DDAEB8E0();
  (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v5, *MEMORY[0x1E0DEF8D0], v2);
  *(_QWORD *)&v1[v10] = sub_1DDAEBAA8();
  v12 = OBJC_IVAR___ICModelAvailabilityManager__generalASRAvailable;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC58);
  v13 = swift_allocObject();
  *(_DWORD *)(v13 + 20) = 0;
  *(_BYTE *)(v13 + 16) = 0;
  *(_QWORD *)&v11[v12] = v13;

  v15.receiver = v11;
  v15.super_class = (Class)ICModelAvailabilityManager;
  return objc_msgSendSuper2(&v15, sel_init);
}

uint64_t sub_1DDAE06A8(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1DDAE1A50;
  return v6();
}

uint64_t sub_1DDAE06FC(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1DDAE1A50;
  return v7();
}

uint64_t sub_1DDAE0750(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DDAEBA18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DDAEBA0C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DDAE1890(a1, &qword_1F03FEC38);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DDAEB9E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DDAE089C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DDAE0900;
  return v6(a1);
}

uint64_t sub_1DDAE0900()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DDAE094C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1DDAE0A1C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1DDAE1980((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1DDAE1980((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DDAE0A1C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_1DDAEBAD8();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1DDAE0BD4(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_1DDAEBB20();
  if (!v8)
  {
    sub_1DDAEBB2C();
    __break(1u);
LABEL_17:
    result = sub_1DDAEBB44();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_1DDAE0BD4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1DDAE0C68(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DDAE0E40(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1DDAE0E40(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DDAE0C68(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_1DDAE0DDC(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1DDAEBAFC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1DDAEBB2C();
      __break(1u);
LABEL_10:
      v2 = sub_1DDAEB94C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1DDAEBB44();
    __break(1u);
LABEL_14:
    result = sub_1DDAEBB2C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1DDAE0DDC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC68);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1DDAE0E40(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC68);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_1DDAEBB44();
  __break(1u);
  return result;
}

uint64_t *initializeBufferWithCopyOfBuffer for GMSAvailability(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v11 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v11 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1DDAEB874();
    v9 = *(_QWORD *)(v8 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8))
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
      memcpy(v6, v7, *(_QWORD *)(*(_QWORD *)(v10 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v9 + 16))(v6, v7, v8);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v6, 0, 1, v8);
    }
  }
  return v3;
}

uint64_t destroy for GMSAvailability(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1DDAEB874();
  v4 = *(_QWORD *)(v3 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  return result;
}

_BYTE *initializeWithCopy for GMSAvailability(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1DDAEB874();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v5, v6, v7);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *assignWithCopy for GMSAvailability(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1DDAEB874();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 24))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 16))(v5, v6, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

_BYTE *initializeWithTake for GMSAvailability(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1DDAEB874();
  v8 = *(_QWORD *)(v7 - 8);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7))
  {
    v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v5, v6, v7);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  }
  return a1;
}

_BYTE *assignWithTake for GMSAvailability(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(_BYTE *, uint64_t, uint64_t);
  int v10;
  int v11;
  uint64_t v12;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1DDAEB874();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v8 + 48);
  v10 = v9(v5, 1, v7);
  v11 = v9(v6, 1, v7);
  if (!v10)
  {
    if (!v11)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 40))(v5, v6, v7);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v8 + 8))(v5, v7);
    goto LABEL_6;
  }
  if (v11)
  {
LABEL_6:
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
    memcpy(v5, v6, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v8 + 32))(v5, v6, v7);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v5, 0, 1, v7);
  return a1;
}

uint64_t getEnumTagSinglePayload for GMSAvailability()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DDAE1474(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  BOOL v5;
  int v6;
  uint64_t v10;

  if ((_DWORD)a2 == 254)
  {
    v4 = *a1;
    v5 = v4 >= 2;
    v6 = (v4 + 2147483646) & 0x7FFFFFFF;
    if (v5)
      return (v6 + 1);
    else
      return 0;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for GMSAvailability()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_1DDAE1500(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 254)
  {
    *result = a2 + 1;
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF048);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_1DDAE1574()
{
  unint64_t v0;

  sub_1DDAE15E8();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1DDAE15E8()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F03FF088)
  {
    sub_1DDAEB874();
    v0 = sub_1DDAEBAB4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F03FF088);
  }
}

uint64_t type metadata accessor for ICModelAvailabilityManager(uint64_t a1)
{
  return sub_1DDAE1650(a1, &qword_1F03FF090);
}

uint64_t sub_1DDAE1650(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

uint64_t sub_1DDAE1688()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1DDAE16B4()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(const void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DDAE1A50;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1F03FF098 + dword_1F03FF098))(v2, v3);
}

uint64_t sub_1DDAE171C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DDAE1A50;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F03FF0A8 + dword_1F03FF0A8))(v2, v3, v4);
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DDAE17C4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DDAE1848;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F03FF0B8 + dword_1F03FF0B8))(a1, v4, v5, v6);
}

uint64_t sub_1DDAE1848()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DDAE1890(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DDAE18CC()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DDAE18F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DDAE1848;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F03FF0C8 + dword_1F03FF0C8))(a1, v4);
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1DDAE1980(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t sub_1DDAE1A00(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for GMSAvailability();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DDAE1A3C@<X0>(_BYTE *a1@<X8>)
{
  return sub_1DDADF274(a1);
}

uint64_t NSComparisonResult.init<A>(_:_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v6)(uint64_t, uint64_t);
  char v8;
  void (*v9)(uint64_t, uint64_t);

  if ((sub_1DDAEB910() & 1) != 0)
  {
    v6 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8);
    v6(a2, a3);
    v6(a1, a3);
    return -1;
  }
  else
  {
    v8 = sub_1DDAEB904();
    v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(a3 - 8) + 8);
    v9(a2, a3);
    v9(a1, a3);
    return v8 & 1;
  }
}

uint64_t AsyncPriorityQueue.basePriority.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  v4 = sub_1DDAEBA18();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t AsyncPriorityQueue.__allocating_init(basePriority:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = swift_allocObject();
  swift_defaultActor_initialize();
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask) = 0;
  v3 = v2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  v4 = sub_1DDAEBA18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v2;
}

uint64_t AsyncPriorityQueue.init(basePriority:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  swift_defaultActor_initialize();
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork) = MEMORY[0x1E0DEE9D8];
  *(_QWORD *)(v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask) = 0;
  v3 = v1 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  v4 = sub_1DDAEBA18();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(v3, a1, v4);
  return v1;
}

uint64_t AsyncPriorityQueue.enqueue(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  unint64_t *v18;
  uint64_t v19;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v21;
  unint64_t v22;
  uint64_t v24;

  v7 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v24 - v12;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  v15 = &v13[*(int *)(v7 + 24)];
  v16 = sub_1DDAEBA18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v15, a1, v16);
  v17 = &v13[*(int *)(v7 + 20)];
  *(_QWORD *)v17 = a2;
  *((_QWORD *)v17 + 1) = a3;
  sub_1DDAE1E38((uint64_t)v13, (uint64_t)v11);
  v18 = (unint64_t *)(v3 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork);
  swift_beginAccess();
  v19 = *v18;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v18 = v19;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v19 = sub_1DDAE3598(0, *(_QWORD *)(v19 + 16) + 1, 1, v19);
    *v18 = v19;
  }
  v22 = *(_QWORD *)(v19 + 16);
  v21 = *(_QWORD *)(v19 + 24);
  if (v22 >= v21 >> 1)
  {
    v19 = sub_1DDAE3598(v21 > 1, v22 + 1, 1, v19);
    *v18 = v19;
  }
  *(_QWORD *)(v19 + 16) = v22 + 1;
  sub_1DDAE37A0((uint64_t)v11, v19+ ((*(unsigned __int8 *)(v8 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80))+ *(_QWORD *)(v8 + 72) * v22);
  sub_1DDAE21D8(v18);
  swift_endAccess();
  sub_1DDAE225C();
  return sub_1DDAE37E4((uint64_t)v13);
}

uint64_t type metadata accessor for AsyncPriorityQueue.WorkItem(uint64_t a1)
{
  return sub_1DDAE3834(a1, (uint64_t *)&unk_1F03FF118);
}

uint64_t sub_1DDAE1E38(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t AsyncPriorityQueue.enqueueAndWait(priority:operation:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1DDAE1E98()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v1 = *(_QWORD *)(v0 + 40);
  v2 = *(_QWORD *)(v0 + 16);
  sub_1DDAE5830(&qword_1F03FF0F8, type metadata accessor for AsyncPriorityQueue, (uint64_t)&protocol conformance descriptor for AsyncPriorityQueue);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  v4 = *(_OWORD *)(v0 + 24);
  *(_QWORD *)(v3 + 16) = v1;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 40) = v2;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v5;
  *v5 = v0;
  v5[1] = sub_1DDAE1F68;
  return sub_1DDAEBB5C();
}

uint64_t sub_1DDAE1F68()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DDAE1FC8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DDAE1FD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  unint64_t *v21;
  uint64_t v22;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v24;
  unint64_t v25;
  uint64_t v27;
  uint64_t v28;

  v28 = a3;
  v9 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v27 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v27 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v17 = *(_QWORD *)(v16 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v17 + 16))(v15, a1, v16);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v17 + 56))(v15, 0, 1, v16);
  v18 = &v15[*(int *)(v9 + 24)];
  v19 = sub_1DDAEBA18();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v18, a5, v19);
  v20 = &v15[*(int *)(v9 + 20)];
  *(_QWORD *)v20 = v28;
  *((_QWORD *)v20 + 1) = a4;
  sub_1DDAE1E38((uint64_t)v15, (uint64_t)v13);
  v21 = (unint64_t *)(a2 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork);
  swift_beginAccess();
  v22 = *v21;
  swift_retain();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *v21 = v22;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    v22 = sub_1DDAE3598(0, *(_QWORD *)(v22 + 16) + 1, 1, v22);
    *v21 = v22;
  }
  v25 = *(_QWORD *)(v22 + 16);
  v24 = *(_QWORD *)(v22 + 24);
  if (v25 >= v24 >> 1)
  {
    v22 = sub_1DDAE3598(v24 > 1, v25 + 1, 1, v22);
    *v21 = v22;
  }
  *(_QWORD *)(v22 + 16) = v25 + 1;
  sub_1DDAE37A0((uint64_t)v13, v22+ ((*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80))+ *(_QWORD *)(v10 + 72) * v25);
  sub_1DDAE21D8(v21);
  swift_endAccess();
  sub_1DDAE225C();
  return sub_1DDAE37E4((uint64_t)v15);
}

uint64_t sub_1DDAE21D8(unint64_t *a1)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6[2];

  v2 = *(_QWORD *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  v3 = *a1;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v3 = sub_1DDAE555C(v3);
  v4 = *(_QWORD *)(v3 + 16);
  v6[0] = v3 + ((*(unsigned __int8 *)(v2 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80));
  v6[1] = v4;
  result = sub_1DDAE434C(v6);
  *a1 = v3;
  return result;
}

uint64_t sub_1DDAE225C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC38);
  result = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask;
  if (!*(_QWORD *)(v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask))
  {
    v6 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork;
    result = swift_beginAccess();
    if (*(_QWORD *)(*(_QWORD *)v6 + 16))
    {
      v7 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
      v8 = sub_1DDAEBA18();
      v9 = *(_QWORD *)(v8 - 8);
      (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))(v4, v7, v8);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v4, 0, 1, v8);
      v10 = sub_1DDAE5830(&qword_1F03FF0F8, type metadata accessor for AsyncPriorityQueue, (uint64_t)&protocol conformance descriptor for AsyncPriorityQueue);
      v11 = (_QWORD *)swift_allocObject();
      v11[2] = v0;
      v11[3] = v10;
      v11[4] = v0;
      swift_retain_n();
      *(_QWORD *)(v0 + v5) = sub_1DDAE30B0((uint64_t)v4, (uint64_t)&unk_1F03FF138, (uint64_t)v11);
      return swift_release();
    }
  }
  return result;
}

uint64_t sub_1DDAE23B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  return swift_task_switch();
}

uint64_t sub_1DDAE23D0()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1DDAE5830(&qword_1F03FF0F8, type metadata accessor for AsyncPriorityQueue, (uint64_t)&protocol conformance descriptor for AsyncPriorityQueue);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1DDAE2460;
  return sub_1DDAEBB68();
}

uint64_t sub_1DDAE2460()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DDAE24B4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask) = 0;
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DDAE24F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3[15] = a2;
  v3[16] = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
  v3[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FEC38);
  v3[18] = swift_task_alloc();
  v3[19] = swift_task_alloc();
  v4 = sub_1DDAEBA18();
  v3[20] = v4;
  v3[21] = *(_QWORD *)(v4 - 8);
  v3[22] = swift_task_alloc();
  v5 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v3[23] = v5;
  v6 = *(_QWORD *)(v5 - 8);
  v3[24] = v6;
  v3[25] = *(_QWORD *)(v6 + 64);
  v3[26] = swift_task_alloc();
  v3[27] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DDAE25EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;

  v1 = *(_QWORD *)(v0 + 128) + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork;
  v2 = OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  *(_QWORD *)(v0 + 224) = OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork;
  *(_QWORD *)(v0 + 232) = v2;
  swift_beginAccess();
  if (!*(_QWORD *)(*(_QWORD *)v1 + 16) || (sub_1DDAEBA30() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v4 = *(_QWORD *)(v0 + 128) + *(_QWORD *)(v0 + 224);
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v4 + 16))
  {
    v5 = *(_QWORD *)(v0 + 216);
    v6 = *(_QWORD *)(v0 + 184);
    v7 = *(_QWORD *)(v0 + 168);
    v8 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 192) + 80);
    v9 = (v8 + 32) & ~v8;
    sub_1DDAE1E38(*(_QWORD *)v4 + v9, v5);
    sub_1DDAE5688(0, 1);
    swift_endAccess();
    v10 = v5 + *(int *)(v6 + 24);
    sub_1DDAE5830(&qword_1F03FF160, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], MEMORY[0x1E0DF0758]);
    v11 = sub_1DDAEB91C();
    v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16);
    if ((v11 & 1) != 0)
    {
      v13 = *(_QWORD *)(v0 + 176);
      v14 = *(_QWORD *)(v0 + 160);
      v15 = v10;
    }
    else
    {
      v13 = *(_QWORD *)(v0 + 176);
      v14 = *(_QWORD *)(v0 + 160);
      v15 = *(_QWORD *)(v0 + 128) + *(_QWORD *)(v0 + 232);
    }
    v12(v13, v15, v14);
    v17 = *(_QWORD *)(v0 + 208);
    v16 = *(_QWORD *)(v0 + 216);
    v18 = *(_QWORD *)(v0 + 168);
    v20 = *(_QWORD *)(v0 + 152);
    v19 = *(_QWORD *)(v0 + 160);
    v12(v20, *(_QWORD *)(v0 + 176), v19);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v20, 0, 1, v19);
    sub_1DDAE1E38(v16, v17);
    v21 = swift_allocObject();
    *(_QWORD *)(v21 + 16) = 0;
    *(_QWORD *)(v21 + 24) = 0;
    sub_1DDAE37A0(v17, v21 + v9);
    if ((swift_taskGroup_addPending() & 1) != 0)
    {
      v22 = *(_QWORD *)(v0 + 160);
      v23 = *(_QWORD *)(v0 + 168);
      v24 = *(_QWORD *)(v0 + 144);
      sub_1DDAE59C8(*(_QWORD *)(v0 + 152), v24, &qword_1F03FEC38);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v23 + 48))(v24, 1, v22) == 1)
      {
        sub_1DDAE1890(*(_QWORD *)(v0 + 144), &qword_1F03FEC38);
      }
      else
      {
        v33 = *(_QWORD *)(v0 + 160);
        v34 = *(_QWORD *)(v0 + 168);
        v35 = *(_QWORD *)(v0 + 144);
        sub_1DDAEBA0C();
        (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v35, v33);
      }
      if (*(_QWORD *)(v21 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v36 = sub_1DDAEB9E8();
        v38 = v37;
        swift_unknownObjectRelease();
      }
      else
      {
        v36 = 0;
        v38 = 0;
      }
      v39 = **(_QWORD **)(v0 + 120);
      v40 = swift_allocObject();
      *(_QWORD *)(v40 + 16) = &unk_1F03FF170;
      *(_QWORD *)(v40 + 24) = v21;
      v41 = v38 | v36;
      if (v38 | v36)
      {
        v41 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v36;
        *(_QWORD *)(v0 + 40) = v38;
      }
      v31 = *(_QWORD *)(v0 + 152);
      *(_QWORD *)(v0 + 96) = 1;
      *(_QWORD *)(v0 + 104) = v41;
      *(_QWORD *)(v0 + 112) = v39;
      swift_task_create();
      swift_release();
      v32 = &qword_1F03FEC38;
    }
    else
    {
      v25 = *(_QWORD *)(v0 + 216);
      v26 = *(_QWORD *)(v0 + 152);
      v27 = *(_QWORD *)(v0 + 136);
      swift_release();
      sub_1DDAE1890(v26, &qword_1F03FEC38);
      sub_1DDAE59C8(v25, v27, &qword_1F03FF100);
      v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
      v29 = *(_QWORD *)(v28 - 8);
      v30 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v29 + 48))(v27, 1, v28);
      v31 = *(_QWORD *)(v0 + 136);
      if (v30 != 1)
      {
        sub_1DDAEB9F4();
        (*(void (**)(uint64_t, uint64_t))(v29 + 8))(v31, v28);
LABEL_22:
        v42 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 240) = v42;
        *v42 = v0;
        v42[1] = sub_1DDAE2A48;
        return sub_1DDAEBA3C();
      }
      v32 = &qword_1F03FF100;
    }
    sub_1DDAE1890(v31, v32);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DDAE2A48()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DDAE2AA0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  void (*v13)(uint64_t, uint64_t, uint64_t);
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
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;

  v2 = *(_QWORD *)(v0 + 216);
  v1 = *(_QWORD *)(v0 + 224);
  v3 = *(_QWORD *)(v0 + 128);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 168) + 8))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 160));
  sub_1DDAE37E4(v2);
  if (!*(_QWORD *)(*(_QWORD *)(v3 + v1) + 16) || (sub_1DDAEBA30() & 1) != 0)
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v5 = *(_QWORD *)(v0 + 128) + *(_QWORD *)(v0 + 224);
  result = swift_beginAccess();
  if (*(_QWORD *)(*(_QWORD *)v5 + 16))
  {
    v6 = *(_QWORD *)(v0 + 216);
    v7 = *(_QWORD *)(v0 + 184);
    v8 = *(_QWORD *)(v0 + 168);
    v9 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 192) + 80);
    v10 = (v9 + 32) & ~v9;
    sub_1DDAE1E38(*(_QWORD *)v5 + v10, v6);
    sub_1DDAE5688(0, 1);
    swift_endAccess();
    v11 = v6 + *(int *)(v7 + 24);
    sub_1DDAE5830(&qword_1F03FF160, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0750], MEMORY[0x1E0DF0758]);
    v12 = sub_1DDAEB91C();
    v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    if ((v12 & 1) != 0)
    {
      v14 = *(_QWORD *)(v0 + 176);
      v15 = *(_QWORD *)(v0 + 160);
      v16 = v11;
    }
    else
    {
      v14 = *(_QWORD *)(v0 + 176);
      v15 = *(_QWORD *)(v0 + 160);
      v16 = *(_QWORD *)(v0 + 128) + *(_QWORD *)(v0 + 232);
    }
    v13(v14, v16, v15);
    v18 = *(_QWORD *)(v0 + 208);
    v17 = *(_QWORD *)(v0 + 216);
    v19 = *(_QWORD *)(v0 + 168);
    v21 = *(_QWORD *)(v0 + 152);
    v20 = *(_QWORD *)(v0 + 160);
    v13(v21, *(_QWORD *)(v0 + 176), v20);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v19 + 56))(v21, 0, 1, v20);
    sub_1DDAE1E38(v17, v18);
    v22 = swift_allocObject();
    *(_QWORD *)(v22 + 16) = 0;
    *(_QWORD *)(v22 + 24) = 0;
    sub_1DDAE37A0(v18, v22 + v10);
    if ((swift_taskGroup_addPending() & 1) != 0)
    {
      v23 = *(_QWORD *)(v0 + 160);
      v24 = *(_QWORD *)(v0 + 168);
      v25 = *(_QWORD *)(v0 + 144);
      sub_1DDAE59C8(*(_QWORD *)(v0 + 152), v25, &qword_1F03FEC38);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v24 + 48))(v25, 1, v23) == 1)
      {
        sub_1DDAE1890(*(_QWORD *)(v0 + 144), &qword_1F03FEC38);
      }
      else
      {
        v34 = *(_QWORD *)(v0 + 160);
        v35 = *(_QWORD *)(v0 + 168);
        v36 = *(_QWORD *)(v0 + 144);
        sub_1DDAEBA0C();
        (*(void (**)(uint64_t, uint64_t))(v35 + 8))(v36, v34);
      }
      if (*(_QWORD *)(v22 + 16))
      {
        swift_getObjectType();
        swift_unknownObjectRetain();
        v37 = sub_1DDAEB9E8();
        v39 = v38;
        swift_unknownObjectRelease();
      }
      else
      {
        v37 = 0;
        v39 = 0;
      }
      v40 = **(_QWORD **)(v0 + 120);
      v41 = swift_allocObject();
      *(_QWORD *)(v41 + 16) = &unk_1F03FF170;
      *(_QWORD *)(v41 + 24) = v22;
      v42 = v39 | v37;
      if (v39 | v37)
      {
        v42 = v0 + 16;
        *(_QWORD *)(v0 + 16) = 0;
        *(_QWORD *)(v0 + 24) = 0;
        *(_QWORD *)(v0 + 32) = v37;
        *(_QWORD *)(v0 + 40) = v39;
      }
      v32 = *(_QWORD *)(v0 + 152);
      *(_QWORD *)(v0 + 96) = 1;
      *(_QWORD *)(v0 + 104) = v42;
      *(_QWORD *)(v0 + 112) = v40;
      swift_task_create();
      swift_release();
      v33 = &qword_1F03FEC38;
    }
    else
    {
      v26 = *(_QWORD *)(v0 + 216);
      v27 = *(_QWORD *)(v0 + 152);
      v28 = *(_QWORD *)(v0 + 136);
      swift_release();
      sub_1DDAE1890(v27, &qword_1F03FEC38);
      sub_1DDAE59C8(v26, v28, &qword_1F03FF100);
      v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
      v30 = *(_QWORD *)(v29 - 8);
      v31 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v30 + 48))(v28, 1, v29);
      v32 = *(_QWORD *)(v0 + 136);
      if (v31 != 1)
      {
        sub_1DDAEB9F4();
        (*(void (**)(uint64_t, uint64_t))(v30 + 8))(v32, v29);
LABEL_22:
        v43 = (_QWORD *)swift_task_alloc();
        *(_QWORD *)(v0 + 240) = v43;
        *v43 = v0;
        v43[1] = sub_1DDAE2A48;
        return sub_1DDAEBA3C();
      }
      v33 = &qword_1F03FF100;
    }
    sub_1DDAE1890(v32, v33);
    goto LABEL_22;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DDAE2EEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(v3 + 16) = a3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
  *(_QWORD *)(v3 + 24) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DDAE2F48()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 16);
  v2 = (_QWORD *)(v1 + *(int *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) + 20));
  v5 = (uint64_t (*)(void))(*(int *)*v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v3;
  *v3 = v0;
  v3[1] = sub_1DDAE2FB0;
  return v5();
}

uint64_t sub_1DDAE2FB0()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DDAE3004()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int v4;
  uint64_t v5;

  v1 = *(_QWORD *)(v0 + 24);
  sub_1DDAE59C8(*(_QWORD *)(v0 + 16), v1, &qword_1F03FF100);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v3 = *(_QWORD *)(v2 - 8);
  v4 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2);
  v5 = *(_QWORD *)(v0 + 24);
  if (v4 == 1)
  {
    sub_1DDAE1890(*(_QWORD *)(v0 + 24), &qword_1F03FF100);
  }
  else
  {
    sub_1DDAEB9F4();
    (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v5, v2);
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DDAE30B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DDAEBA18();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DDAEBA0C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DDAE1890(a1, &qword_1F03FEC38);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DDAEB9E8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

Swift::Void __swiftcall AsyncPriorityQueue.cancel()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[2];
  uint64_t *v16;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_workerTask))
  {
    swift_retain();
    sub_1DDAEBA24();
    swift_release();
  }
  v8 = (uint64_t *)(v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_pendingWork);
  swift_beginAccess();
  v9 = *v8;
  v10 = *(_QWORD *)(*v8 + 16);
  if (v10)
  {
    v15[1] = *v8;
    v16 = v8;
    v11 = v9 + ((*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80));
    v12 = *(_QWORD *)(v5 + 72);
    swift_bridgeObjectRetain();
    do
    {
      sub_1DDAE1E38(v11, (uint64_t)v7);
      sub_1DDAE59C8((uint64_t)v7, (uint64_t)v3, &qword_1F03FF100);
      sub_1DDAE37E4((uint64_t)v7);
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
      v14 = *(_QWORD *)(v13 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v3, 1, v13) == 1)
      {
        sub_1DDAE1890((uint64_t)v3, &qword_1F03FF100);
      }
      else
      {
        sub_1DDAEB9F4();
        (*(void (**)(char *, uint64_t))(v14 + 8))(v3, v13);
      }
      v11 += v12;
      --v10;
    }
    while (v10);
    swift_bridgeObjectRelease();
    v8 = v16;
  }
  *v8 = MEMORY[0x1E0DEE9D8];
  swift_bridgeObjectRelease();
}

uint64_t AsyncPriorityQueue.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  v2 = sub_1DDAEBA18();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return v0;
}

uint64_t AsyncPriorityQueue.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + OBJC_IVAR____TtC12NotesSupport18AsyncPriorityQueue_basePriority;
  v2 = sub_1DDAEBA18();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  swift_bridgeObjectRelease();
  swift_release();
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t AsyncPriorityQueue.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DDAE34D0()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1DDAE34DC(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DDAE5A94;
  return v6(a1);
}

uint64_t sub_1DDAE3540(int *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1DDAE0900;
  return v4();
}

uint64_t sub_1DDAE3598(char a1, int64_t a2, char a3, unint64_t a4)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  _QWORD *v13;
  size_t v14;
  BOOL v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_29;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (!v9)
  {
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    goto LABEL_19;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF190);
  v10 = *(_QWORD *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1DDAEBB2C();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  v17 = (*(unsigned __int8 *)(v16 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v16 + 80);
  v18 = (unint64_t)v13 + v17;
  if ((a1 & 1) != 0)
  {
    if ((unint64_t)v13 < a4 || v18 >= a4 + v17 + *(_QWORD *)(v16 + 72) * v8)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (v13 != (_QWORD *)a4)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1DDAE5570(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

uint64_t sub_1DDAE37A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DDAE37E4(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for AsyncPriorityQueue(uint64_t a1)
{
  return sub_1DDAE3834(a1, (uint64_t *)&unk_1F03FF108);
}

uint64_t sub_1DDAE3834(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DDAE3868(uint64_t a1)
{
  uint64_t *v1;

  return sub_1DDAE1FD0(a1, v1[2], v1[3], v1[4], v1[5]);
}

uint64_t sub_1DDAE3874()
{
  return type metadata accessor for AsyncPriorityQueue(0);
}

uint64_t sub_1DDAE387C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DDAEBA18();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for AsyncPriorityQueue()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncPriorityQueue.__allocating_init(basePriority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t *sub_1DDAE3920(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;
  void (*v19)(char *, char *, uint64_t);

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v10 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v10 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
    v8 = *(_QWORD *)(v7 - 8);
    if ((*(unsigned int (**)(uint64_t *, uint64_t, uint64_t))(v8 + 48))(a2, 1, v7))
    {
      v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v9 - 8) + 64));
    }
    else
    {
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16))(a1, a2, v7);
      (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(v8 + 56))(a1, 0, 1, v7);
    }
    v11 = *(int *)(a3 + 20);
    v12 = *(int *)(a3 + 24);
    v13 = (uint64_t *)((char *)a1 + v11);
    v14 = (uint64_t *)((char *)a2 + v11);
    v15 = v14[1];
    *v13 = *v14;
    v13[1] = v15;
    v16 = (char *)a1 + v12;
    v17 = (char *)a2 + v12;
    v18 = sub_1DDAEBA18();
    v19 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 16);
    swift_retain();
    v19(v16, v17, v18);
  }
  return a1;
}

uint64_t sub_1DDAE3A48(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(a1, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  swift_release();
  v6 = a1 + *(int *)(a2 + 24);
  v7 = sub_1DDAEBA18();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
}

char *sub_1DDAE3ADC(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, char *, uint64_t);

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 20);
  v10 = *(int *)(a3 + 24);
  v11 = &a1[v9];
  v12 = &a2[v9];
  v13 = *((_QWORD *)v12 + 1);
  *(_QWORD *)v11 = *(_QWORD *)v12;
  *((_QWORD *)v11 + 1) = v13;
  v14 = &a1[v10];
  v15 = &a2[v10];
  v16 = sub_1DDAEBA18();
  v17 = *(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16);
  swift_retain();
  v17(v14, v15, v16);
  return a1;
}

char *sub_1DDAE3BD8(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  uint64_t v19;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 24))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  v12 = *(int *)(a3 + 20);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = *((_QWORD *)v14 + 1);
  *(_QWORD *)v13 = *(_QWORD *)v14;
  *((_QWORD *)v13 + 1) = v15;
  swift_retain();
  swift_release();
  v16 = *(int *)(a3 + 24);
  v17 = &a1[v16];
  v18 = &a2[v16];
  v19 = sub_1DDAEBA18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v19 - 8) + 24))(v17, v18, v19);
  return a1;
}

char *sub_1DDAE3D28(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(a2, 1, v6))
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v8 - 8) + 64));
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
  }
  v9 = *(int *)(a3 + 24);
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = sub_1DDAEBA18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v10, v11, v12);
  return a1;
}

char *sub_1DDAE3E10(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t (*v8)(char *, uint64_t, uint64_t);
  int v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48);
  v9 = v8(a1, 1, v6);
  v10 = v8(a2, 1, v6);
  if (!v9)
  {
    if (!v10)
    {
      (*(void (**)(char *, char *, uint64_t))(v7 + 40))(a1, a2, v6);
      goto LABEL_7;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(a1, v6);
    goto LABEL_6;
  }
  if (v10)
  {
LABEL_6:
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(a1, a2, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(a1, 0, 1, v6);
LABEL_7:
  *(_OWORD *)&a1[*(int *)(a3 + 20)] = *(_OWORD *)&a2[*(int *)(a3 + 20)];
  swift_release();
  v12 = *(int *)(a3 + 24);
  v13 = &a1[v12];
  v14 = &a2[v12];
  v15 = sub_1DDAEBA18();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v15 - 8) + 40))(v13, v14, v15);
  return a1;
}

uint64_t sub_1DDAE3F54()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DDAE3F60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  unint64_t v11;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  if ((_DWORD)a2 != 0x7FFFFFFF)
  {
    v8 = sub_1DDAEBA18();
    v10 = a1 + *(int *)(a3 + 24);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
    return v9(v10, a2, v8);
  }
  v11 = *(_QWORD *)(a1 + *(int *)(a3 + 20));
  if (v11 >= 0xFFFFFFFF)
    LODWORD(v11) = -1;
  return (v11 + 1);
}

uint64_t sub_1DDAE400C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DDAE4018(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF100);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = result;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    if (a3 == 0x7FFFFFFF)
    {
      *(_QWORD *)(a1 + *(int *)(a4 + 20)) = (a2 - 1);
      return result;
    }
    v10 = sub_1DDAEBA18();
    v12 = a1 + *(int *)(a4 + 24);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_1DDAE40C0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DDAE4150();
  if (v0 <= 0x3F)
  {
    sub_1DDAEBA18();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1DDAE4150()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F03FF128)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F03FF0E8);
    v0 = sub_1DDAEBAB4();
    if (!v1)
      atomic_store(v0, &qword_1F03FF128);
  }
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0E0D68](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DDAE41EC()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DDAE4218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DDAE1848;
  v3[2] = v2;
  return swift_task_switch();
}

uint64_t sub_1DDAE4278(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DDAE1A50;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F03FF140 + dword_1F03FF140))(a1, v4);
}

uint64_t sub_1DDAE42E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1DDAE1A50;
  return sub_1DDAE24F4(a1, a2, v2);
}

uint64_t sub_1DDAE434C(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
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
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  char v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  BOOL v80;
  unint64_t v81;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  BOOL v90;
  uint64_t v91;
  char v92;
  char *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  BOOL v97;
  uint64_t v98;
  uint64_t v99;
  char *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  unint64_t v108;
  uint64_t v109;
  char *v110;
  char *v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  unint64_t v115;
  uint64_t v116;
  unint64_t v117;
  char *v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  unint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  unint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t *v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;

  v2 = v1;
  v137 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v131 = *(_QWORD *)(v137 - 8);
  v4 = MEMORY[0x1E0C80A78](v137);
  v128 = (uint64_t)&v123 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v138 = (uint64_t)&v123 - v7;
  v8 = MEMORY[0x1E0C80A78](v6);
  v134 = (uint64_t)&v123 - v9;
  MEMORY[0x1E0C80A78](v8);
  v133 = (uint64_t)&v123 - v10;
  v11 = a1[1];
  result = sub_1DDAEBB50();
  if (result >= v11)
  {
    if (v11 < 0)
      goto LABEL_140;
    if (v11)
      return sub_1DDAE4CE8(0, v11, 1, a1);
    return result;
  }
  if (v11 >= 0)
    v13 = v11;
  else
    v13 = v11 + 1;
  if (v11 < -1)
    goto LABEL_148;
  v125 = result;
  if (v11 < 2)
  {
    v17 = (char *)MEMORY[0x1E0DEE9D8];
    v130 = MEMORY[0x1E0DEE9D8]
         + ((*(unsigned __int8 *)(v131 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v131 + 80));
    v124 = MEMORY[0x1E0DEE9D8];
    if (v11 != 1)
    {
      v19 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_106:
      if (v19 >= 2)
      {
        v116 = *a1;
        do
        {
          v117 = v19 - 2;
          if (v19 < 2)
            goto LABEL_135;
          if (!v116)
            goto LABEL_147;
          v118 = v17;
          v119 = *(_QWORD *)&v17[16 * v117 + 32];
          v120 = *(_QWORD *)&v17[16 * v19 + 24];
          sub_1DDAE4EF4(v116 + *(_QWORD *)(v131 + 72) * v119, v116 + *(_QWORD *)(v131 + 72) * *(_QWORD *)&v17[16 * v19 + 16], v116 + *(_QWORD *)(v131 + 72) * v120, v130);
          if (v2)
            break;
          if (v120 < v119)
            goto LABEL_136;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v118 = sub_1DDAE5548((uint64_t)v17);
          if (v117 >= *((_QWORD *)v118 + 2))
            goto LABEL_137;
          v121 = &v118[16 * v117 + 32];
          *(_QWORD *)v121 = v119;
          *((_QWORD *)v121 + 1) = v120;
          v122 = *((_QWORD *)v118 + 2);
          if (v19 > v122)
            goto LABEL_138;
          memmove(&v118[16 * v19 + 16], &v118[16 * v19 + 32], 16 * (v122 - v19));
          *((_QWORD *)v118 + 2) = v122 - 1;
          v19 = v122 - 1;
          v17 = v118;
        }
        while (v122 > 2);
      }
LABEL_117:
      swift_bridgeObjectRelease();
      *(_QWORD *)(v124 + 16) = 0;
      return swift_bridgeObjectRelease();
    }
  }
  else
  {
    v14 = v13 >> 1;
    v15 = sub_1DDAEB9B8();
    *(_QWORD *)(v15 + 16) = v14;
    v16 = *(unsigned __int8 *)(v131 + 80);
    v124 = v15;
    v130 = v15 + ((v16 + 32) & ~v16);
  }
  v18 = 0;
  v17 = (char *)MEMORY[0x1E0DEE9D8];
  v136 = a1;
  while (1)
  {
    v20 = v18;
    v21 = v18 + 1;
    if (v18 + 1 >= v11)
    {
      v38 = v18 + 1;
      goto LABEL_58;
    }
    v126 = v2;
    v22 = *a1;
    v23 = *(_QWORD *)(v131 + 72);
    v24 = v133;
    sub_1DDAE1E38(*a1 + v23 * v21, v133);
    v25 = v22 + v23 * v20;
    v129 = v20;
    v26 = v134;
    sub_1DDAE1E38(v25, v134);
    LODWORD(v135) = sub_1DDAEBA00();
    v27 = v26;
    v20 = v129;
    sub_1DDAE37E4(v27);
    sub_1DDAE37E4(v24);
    v28 = v20 + 2;
    v139 = v23;
    v132 = v22;
    if (v20 + 2 >= v11)
    {
      v31 = v20 + 2;
      v37 = v23;
      if ((v135 & 1) == 0)
        goto LABEL_37;
    }
    else
    {
      v29 = v23 * v21;
      v30 = v22;
      v31 = v28;
      v32 = v23 * v28;
      do
      {
        v33 = v11;
        v34 = v133;
        sub_1DDAE1E38(v30 + v32, v133);
        v35 = v134;
        sub_1DDAE1E38(v30 + v29, v134);
        v36 = sub_1DDAEBA00();
        sub_1DDAE37E4(v35);
        sub_1DDAE37E4(v34);
        if (((v135 ^ v36) & 1) != 0)
        {
          a1 = v136;
          v20 = v129;
          v11 = v33;
          v37 = v139;
          if ((v135 & 1) == 0)
            goto LABEL_37;
          goto LABEL_24;
        }
        v37 = v139;
        v30 += v139;
        ++v31;
        v11 = v33;
      }
      while (v33 != v31);
      v31 = v33;
      a1 = v136;
      v20 = v129;
      if ((v135 & 1) == 0)
      {
LABEL_37:
        v38 = v31;
        break;
      }
    }
LABEL_24:
    if (v31 < v20)
      goto LABEL_141;
    v38 = v31;
    if (v20 >= v31)
      break;
    v135 = v11;
    v123 = v17;
    v39 = 0;
    v40 = v20;
    v41 = v37 * (v31 - 1);
    v42 = v31 * v37;
    v43 = v40;
    v44 = v40 * v37;
    v45 = v132;
    do
    {
      if (v43 != v38 + v39 - 1)
      {
        if (!v45)
          goto LABEL_146;
        sub_1DDAE37A0(v45 + v44, v128);
        if (v44 < v41 || v45 + v44 >= (unint64_t)(v45 + v42))
        {
          swift_arrayInitWithTakeFrontToBack();
        }
        else if (v44 != v41)
        {
          swift_arrayInitWithTakeBackToFront();
        }
        sub_1DDAE37A0(v128, v45 + v41);
        a1 = v136;
        v38 = v31;
        v37 = v139;
      }
      ++v43;
      --v39;
      v41 -= v37;
      v42 -= v37;
      v44 += v37;
    }
    while (v43 < v38 + v39);
    v17 = v123;
    v2 = v126;
    v20 = v129;
    v11 = v135;
    if (v38 < v135)
      goto LABEL_41;
LABEL_58:
    if (v38 < v20)
      goto LABEL_134;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v135 = v38;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
      v17 = sub_1DDAE5344(0, *((_QWORD *)v17 + 2) + 1, 1, v17);
    v65 = *((_QWORD *)v17 + 2);
    v64 = *((_QWORD *)v17 + 3);
    v19 = v65 + 1;
    if (v65 >= v64 >> 1)
      v17 = sub_1DDAE5344((char *)(v64 > 1), v65 + 1, 1, v17);
    *((_QWORD *)v17 + 2) = v19;
    v66 = v17 + 32;
    v67 = &v17[16 * v65 + 32];
    v68 = v135;
    *(_QWORD *)v67 = v20;
    *((_QWORD *)v67 + 1) = v68;
    if (v65)
    {
      while (1)
      {
        v69 = v19 - 1;
        if (v19 >= 4)
        {
          v74 = &v66[16 * v19];
          v75 = *((_QWORD *)v74 - 8);
          v76 = *((_QWORD *)v74 - 7);
          v80 = __OFSUB__(v76, v75);
          v77 = v76 - v75;
          if (v80)
            goto LABEL_123;
          v79 = *((_QWORD *)v74 - 6);
          v78 = *((_QWORD *)v74 - 5);
          v80 = __OFSUB__(v78, v79);
          v72 = v78 - v79;
          v73 = v80;
          if (v80)
            goto LABEL_124;
          v81 = v19 - 2;
          v82 = &v66[16 * v19 - 32];
          v84 = *(_QWORD *)v82;
          v83 = *((_QWORD *)v82 + 1);
          v80 = __OFSUB__(v83, v84);
          v85 = v83 - v84;
          if (v80)
            goto LABEL_126;
          v80 = __OFADD__(v72, v85);
          v86 = v72 + v85;
          if (v80)
            goto LABEL_129;
          if (v86 >= v77)
          {
            v104 = &v66[16 * v69];
            v106 = *(_QWORD *)v104;
            v105 = *((_QWORD *)v104 + 1);
            v80 = __OFSUB__(v105, v106);
            v107 = v105 - v106;
            if (v80)
              goto LABEL_133;
            v97 = v72 < v107;
            goto LABEL_95;
          }
        }
        else
        {
          if (v19 != 3)
          {
            v98 = *((_QWORD *)v17 + 4);
            v99 = *((_QWORD *)v17 + 5);
            v80 = __OFSUB__(v99, v98);
            v91 = v99 - v98;
            v92 = v80;
            goto LABEL_89;
          }
          v71 = *((_QWORD *)v17 + 4);
          v70 = *((_QWORD *)v17 + 5);
          v80 = __OFSUB__(v70, v71);
          v72 = v70 - v71;
          v73 = v80;
        }
        if ((v73 & 1) != 0)
          goto LABEL_125;
        v81 = v19 - 2;
        v87 = &v66[16 * v19 - 32];
        v89 = *(_QWORD *)v87;
        v88 = *((_QWORD *)v87 + 1);
        v90 = __OFSUB__(v88, v89);
        v91 = v88 - v89;
        v92 = v90;
        if (v90)
          goto LABEL_128;
        v93 = &v66[16 * v69];
        v95 = *(_QWORD *)v93;
        v94 = *((_QWORD *)v93 + 1);
        v80 = __OFSUB__(v94, v95);
        v96 = v94 - v95;
        if (v80)
          goto LABEL_131;
        if (__OFADD__(v91, v96))
          goto LABEL_132;
        if (v91 + v96 >= v72)
        {
          v97 = v72 < v96;
LABEL_95:
          if (v97)
            v69 = v81;
          goto LABEL_97;
        }
LABEL_89:
        if ((v92 & 1) != 0)
          goto LABEL_127;
        v100 = &v66[16 * v69];
        v102 = *(_QWORD *)v100;
        v101 = *((_QWORD *)v100 + 1);
        v80 = __OFSUB__(v101, v102);
        v103 = v101 - v102;
        if (v80)
          goto LABEL_130;
        if (v103 < v91)
          goto LABEL_14;
LABEL_97:
        v108 = v69 - 1;
        if (v69 - 1 >= v19)
        {
          __break(1u);
LABEL_120:
          __break(1u);
LABEL_121:
          __break(1u);
LABEL_122:
          __break(1u);
LABEL_123:
          __break(1u);
LABEL_124:
          __break(1u);
LABEL_125:
          __break(1u);
LABEL_126:
          __break(1u);
LABEL_127:
          __break(1u);
LABEL_128:
          __break(1u);
LABEL_129:
          __break(1u);
LABEL_130:
          __break(1u);
LABEL_131:
          __break(1u);
LABEL_132:
          __break(1u);
LABEL_133:
          __break(1u);
LABEL_134:
          __break(1u);
LABEL_135:
          __break(1u);
LABEL_136:
          __break(1u);
LABEL_137:
          __break(1u);
LABEL_138:
          __break(1u);
LABEL_139:
          __break(1u);
LABEL_140:
          __break(1u);
LABEL_141:
          __break(1u);
LABEL_142:
          __break(1u);
          goto LABEL_143;
        }
        v109 = *a1;
        if (!*a1)
          goto LABEL_145;
        v110 = v17;
        v111 = &v66[16 * v108];
        v112 = *(_QWORD *)v111;
        v113 = &v66[16 * v69];
        v114 = *((_QWORD *)v113 + 1);
        sub_1DDAE4EF4(v109 + *(_QWORD *)(v131 + 72) * *(_QWORD *)v111, v109 + *(_QWORD *)(v131 + 72) * *(_QWORD *)v113, v109 + *(_QWORD *)(v131 + 72) * v114, v130);
        if (v2)
          goto LABEL_117;
        if (v114 < v112)
          goto LABEL_120;
        if (v69 > *((_QWORD *)v110 + 2))
          goto LABEL_121;
        *(_QWORD *)v111 = v112;
        *(_QWORD *)&v66[16 * v108 + 8] = v114;
        v115 = *((_QWORD *)v110 + 2);
        if (v69 >= v115)
          goto LABEL_122;
        v17 = v110;
        v19 = v115 - 1;
        memmove(&v66[16 * v69], v113 + 16, 16 * (v115 - 1 - v69));
        *((_QWORD *)v110 + 2) = v115 - 1;
        a1 = v136;
        if (v115 <= 2)
          goto LABEL_14;
      }
    }
    v19 = 1;
LABEL_14:
    v11 = a1[1];
    v18 = v135;
    if (v135 >= v11)
      goto LABEL_106;
  }
  v2 = v126;
  if (v38 >= v11)
    goto LABEL_58;
LABEL_41:
  if (__OFSUB__(v38, v20))
    goto LABEL_139;
  if (v38 - v20 >= v125)
    goto LABEL_58;
  if (__OFADD__(v20, v125))
    goto LABEL_142;
  if (v20 + v125 >= v11)
    v46 = v11;
  else
    v46 = v20 + v125;
  if (v46 >= v20)
  {
    if (v38 != v46)
    {
      v129 = v20;
      v123 = v17;
      v126 = v2;
      v127 = v46;
      v47 = *(_QWORD *)(v131 + 72);
      v48 = v47 * (v38 - 1);
      v132 = v47;
      v49 = v38 * v47;
      do
      {
        v51 = 0;
        v52 = v129;
        v135 = v38;
        while (1)
        {
          v139 = v52;
          v53 = *a1;
          v54 = v49;
          v55 = v49 + v51 + *a1;
          v56 = a1;
          v57 = v133;
          sub_1DDAE1E38(v55, v133);
          v58 = v48;
          v59 = v48 + v51 + v53;
          v60 = v134;
          sub_1DDAE1E38(v59, v134);
          LOBYTE(v53) = sub_1DDAEBA00();
          sub_1DDAE37E4(v60);
          sub_1DDAE37E4(v57);
          if ((v53 & 1) == 0)
            break;
          v61 = *v56;
          if (!*v56)
            goto LABEL_144;
          v49 = v54;
          v48 = v58;
          v62 = v61 + v58 + v51;
          sub_1DDAE37A0(v61 + v54 + v51, v138);
          swift_arrayInitWithTakeFrontToBack();
          sub_1DDAE37A0(v138, v62);
          v51 -= v132;
          v52 = v139 + 1;
          v50 = v135;
          a1 = v136;
          if (v135 == v139 + 1)
            goto LABEL_51;
        }
        v50 = v135;
        a1 = v56;
        v48 = v58;
        v49 = v54;
LABEL_51:
        v38 = v50 + 1;
        v48 += v132;
        v49 += v132;
      }
      while (v38 != v127);
      v38 = v127;
      v2 = v126;
      v17 = v123;
      v20 = v129;
    }
    goto LABEL_58;
  }
LABEL_143:
  __break(1u);
LABEL_144:
  __break(1u);
LABEL_145:
  __break(1u);
LABEL_146:
  __break(1u);
LABEL_147:
  __break(1u);
LABEL_148:
  result = sub_1DDAEBB2C();
  __break(1u);
  return result;
}

uint64_t sub_1DDAE4CE8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
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

  v24 = a1;
  v27 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v7 = MEMORY[0x1E0C80A78](v27);
  v28 = (uint64_t)&v22 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v22 - v10;
  result = MEMORY[0x1E0C80A78](v9);
  v15 = (char *)&v22 - v14;
  v26 = a3;
  v23 = a2;
  if (a3 != a2)
  {
    v16 = *(_QWORD *)(v13 + 72);
    v30 = v16 * (v26 - 1);
    v25 = v16;
    v29 = v16 * v26;
LABEL_5:
    v17 = 0;
    v18 = v24;
    while (1)
    {
      v19 = *a4;
      sub_1DDAE1E38(v29 + v17 + *a4, (uint64_t)v15);
      sub_1DDAE1E38(v30 + v17 + v19, (uint64_t)v11);
      LOBYTE(v19) = sub_1DDAEBA00();
      sub_1DDAE37E4((uint64_t)v11);
      result = sub_1DDAE37E4((uint64_t)v15);
      if ((v19 & 1) == 0)
      {
LABEL_4:
        v30 += v25;
        v29 += v25;
        if (++v26 == v23)
          return result;
        goto LABEL_5;
      }
      v20 = *a4;
      if (!*a4)
        break;
      v21 = v20 + v30 + v17;
      sub_1DDAE37A0(v20 + v29 + v17, v28);
      swift_arrayInitWithTakeFrontToBack();
      result = sub_1DDAE37A0(v28, v21);
      v17 -= v25;
      if (v26 == ++v18)
        goto LABEL_4;
    }
    __break(1u);
  }
  return result;
}

uint64_t sub_1DDAE4EF4(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  char v31;
  unint64_t v32;
  uint64_t result;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;

  v36 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v8 = MEMORY[0x1E0C80A78](v36);
  v10 = (char *)&v34 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v34 - v11;
  v14 = *(_QWORD *)(v13 + 72);
  if (!v14)
  {
    __break(1u);
LABEL_61:
    __break(1u);
LABEL_62:
    __break(1u);
    goto LABEL_63;
  }
  if (a2 - a1 == 0x8000000000000000 && v14 == -1)
    goto LABEL_61;
  v15 = a3 - a2;
  if (a3 - a2 == 0x8000000000000000 && v14 == -1)
    goto LABEL_62;
  v16 = (uint64_t)(a2 - a1) / v14;
  v39 = a1;
  v38 = a4;
  v17 = v15 / v14;
  if (v16 >= v15 / v14)
  {
    if ((v17 & 0x8000000000000000) == 0)
    {
      v19 = v17 * v14;
      if (a4 < a2 || a2 + v19 <= a4)
      {
        swift_arrayInitWithTakeFrontToBack();
      }
      else if (a4 != a2)
      {
        swift_arrayInitWithTakeBackToFront();
      }
      v26 = a4 + v19;
      v37 = a4 + v19;
      v39 = a2;
      v35 = a1;
      if (v19 >= 1 && a1 < a2)
      {
        v28 = -v14;
        do
        {
          v29 = a3 + v28;
          sub_1DDAE1E38(v26 + v28, (uint64_t)v12);
          v30 = a2 + v28;
          sub_1DDAE1E38(a2 + v28, (uint64_t)v10);
          v31 = sub_1DDAEBA00();
          sub_1DDAE37E4((uint64_t)v10);
          sub_1DDAE37E4((uint64_t)v12);
          if ((v31 & 1) != 0)
          {
            if (a3 < a2 || v29 >= a2)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != a2)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v39 += v28;
          }
          else
          {
            v32 = v37;
            v37 += v28;
            if (a3 < v32 || v29 >= v32)
            {
              swift_arrayInitWithTakeFrontToBack();
            }
            else if (a3 != v32)
            {
              swift_arrayInitWithTakeBackToFront();
            }
            v30 = a2;
          }
          v26 = v37;
          if (v37 <= a4)
            break;
          a2 = v30;
          a3 += v28;
        }
        while (v30 > v35);
      }
      goto LABEL_59;
    }
  }
  else if ((v16 & 0x8000000000000000) == 0)
  {
    v18 = v16 * v14;
    if (a4 < a1 || a1 + v18 <= a4)
    {
      swift_arrayInitWithTakeFrontToBack();
    }
    else if (a4 != a1)
    {
      swift_arrayInitWithTakeBackToFront();
    }
    v20 = a4 + v18;
    v37 = a4 + v18;
    if (v18 >= 1 && a2 < a3)
    {
      do
      {
        sub_1DDAE1E38(a2, (uint64_t)v12);
        sub_1DDAE1E38(a4, (uint64_t)v10);
        v22 = sub_1DDAEBA00();
        sub_1DDAE37E4((uint64_t)v10);
        sub_1DDAE37E4((uint64_t)v12);
        v23 = v39;
        if ((v22 & 1) != 0)
        {
          v24 = a2 + v14;
          if (v39 < a2 || v39 >= v24)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 == a2)
          {
            v23 = a2;
          }
          else
          {
            swift_arrayInitWithTakeBackToFront();
          }
        }
        else
        {
          v25 = v38 + v14;
          if (v39 < v38 || v39 >= v25)
          {
            swift_arrayInitWithTakeFrontToBack();
          }
          else if (v39 != v38)
          {
            swift_arrayInitWithTakeBackToFront();
          }
          v38 = v25;
          v24 = a2;
        }
        v39 = v23 + v14;
        a4 = v38;
        if (v38 >= v20)
          break;
        a2 = v24;
      }
      while (v24 < a3);
    }
LABEL_59:
    sub_1DDAE543C(&v39, &v38, (uint64_t *)&v37);
    return 1;
  }
LABEL_63:
  result = sub_1DDAEBB44();
  __break(1u);
  return result;
}

char *sub_1DDAE5344(char *result, int64_t a2, char a3, char *a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF188);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((v5 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
  }
  else
  {
    memcpy(v13, v14, 16 * v8);
  }
  swift_bridgeObjectRelease();
  return v10;
}

uint64_t sub_1DDAE543C(unint64_t *a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;

  v3 = *a1;
  v4 = *a2;
  v5 = *a3;
  result = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v7 = *(_QWORD *)(*(_QWORD *)(result - 8) + 72);
  if (!v7)
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v8 = v5 - v4;
  if (v5 - v4 == 0x8000000000000000 && v7 == -1)
    goto LABEL_14;
  if (v8 / v7 < 0)
  {
LABEL_15:
    result = sub_1DDAEBB44();
    __break(1u);
    return result;
  }
  if (v3 < v4 || v3 >= v4 + v8 / v7 * v7)
    return swift_arrayInitWithTakeFrontToBack();
  if (v3 != v4)
    return swift_arrayInitWithTakeBackToFront();
  return result;
}

char *sub_1DDAE5548(uint64_t a1)
{
  return sub_1DDAE5344(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1DDAE555C(unint64_t a1)
{
  return sub_1DDAE3598(0, *(_QWORD *)(a1 + 16), 0, a1);
}

uint64_t sub_1DDAE5570(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v8 = *(_QWORD *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
    v9 = *(unsigned __int8 *)(v8 + 80);
    v10 = *(_QWORD *)(v8 + 72);
    v11 = a4 + ((v9 + 32) & ~v9) + v10 * a1;
    v12 = v10 * v4;
    v13 = a3 + v12;
    v14 = v11 + v12;
    if (v11 >= v13 || v14 <= a3)
    {
      swift_arrayInitWithCopy();
      return v13;
    }
  }
  result = sub_1DDAEBB44();
  __break(1u);
  return result;
}

uint64_t sub_1DDAE5688(uint64_t a1, int64_t a2)
{
  unint64_t *v2;
  unint64_t v4;
  int64_t v5;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int isUniquelyReferenced_nonNull_native;
  int64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t result;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  if (a1 < 0)
  {
    __break(1u);
    goto LABEL_27;
  }
  v4 = *v2;
  v5 = *(_QWORD *)(*v2 + 16);
  if (v5 < a2)
  {
LABEL_27:
    __break(1u);
    goto LABEL_28;
  }
  v7 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v8 = a1 - a2;
  if (__OFSUB__(0, v7))
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v9 = v5 - v7;
  if (__OFADD__(v5, v8))
  {
LABEL_30:
    __break(1u);
LABEL_31:
    __break(1u);
LABEL_32:
    __break(1u);
    goto LABEL_33;
  }
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  if (!isUniquelyReferenced_nonNull_native || v9 > *(_QWORD *)(v4 + 24) >> 1)
  {
    if (v5 <= v9)
      v11 = v5 + v8;
    else
      v11 = v5;
    v4 = sub_1DDAE3598(isUniquelyReferenced_nonNull_native, v11, 1, v4);
  }
  v12 = *(_QWORD *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8);
  v13 = v4 + ((*(unsigned __int8 *)(v12 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v12 + 80));
  v14 = *(_QWORD *)(v12 + 72);
  v15 = v14 * a1;
  v16 = v13 + v14 * a1;
  result = swift_arrayDestroy();
  if (!v7)
    goto LABEL_25;
  v18 = *(_QWORD *)(v4 + 16);
  v19 = v18 - a2;
  if (__OFSUB__(v18, a2))
    goto LABEL_31;
  if ((v19 & 0x8000000000000000) == 0)
  {
    if (v15 < v14 * a2 || v16 >= v13 + v14 * a2 + v19 * v14)
    {
      result = swift_arrayInitWithTakeFrontToBack();
    }
    else if (v15 != v14 * a2)
    {
      result = swift_arrayInitWithTakeBackToFront();
    }
    v21 = *(_QWORD *)(v4 + 16);
    v22 = __OFADD__(v21, v8);
    v23 = v21 - v7;
    if (!v22)
    {
      *(_QWORD *)(v4 + 16) = v23;
LABEL_25:
      *v2 = v4;
      return result;
    }
    goto LABEL_32;
  }
LABEL_33:
  result = sub_1DDAEBB44();
  __break(1u);
  return result;
}

uint64_t sub_1DDAE5830(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0E0D74](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DDAE5870()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v1 = type metadata accessor for AsyncPriorityQueue.WorkItem(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (v2 + 32) & ~v2;
  swift_unknownObjectRelease();
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F03FF0E8);
  v5 = *(_QWORD *)(v4 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v0 + v3, 1, v4))
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v0 + v3, v4);
  swift_release();
  v6 = v0 + v3 + *(int *)(v1 + 24);
  v7 = sub_1DDAEBA18();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v6, v7);
  return swift_deallocObject();
}

uint64_t sub_1DDAE5950()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for AsyncPriorityQueue.WorkItem(0) - 8) + 80);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = v0 + ((v2 + 32) & ~v2);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1DDAE1A50;
  return sub_1DDAE2EEC(v3, v4, v5);
}

uint64_t sub_1DDAE59C8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DDAE5A0C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DDAE5A30()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DDAE1848;
  return ((uint64_t (*)(int *))((char *)&dword_1F03FF178 + dword_1F03FF178))(v2);
}

uint64_t NSAttributedString.range.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t result;

  objc_msgSend(v0, sel_ic_range);
  v1 = objc_msgSend(v0, sel_string);
  sub_1DDAEB940();

  v2 = sub_1DDAEBA60();
  v4 = v3;
  result = swift_bridgeObjectRelease();
  if ((v4 & 1) == 0)
    return v2;
  __break(1u);
  return result;
}

uint64_t NSAttributedString.componentRanges(separatedBy:in:)(uint64_t a1, uint64_t a2, id a3, uint64_t a4, char a5)
{
  void *v5;
  void *v6;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  char isEscapingClosureAtFileLocation;
  uint64_t result;
  _QWORD aBlock[6];

  v6 = v5;
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a1;
  *(_QWORD *)(v12 + 24) = a2;
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = sub_1DDAE5CFC;
  *(_QWORD *)(v13 + 24) = v12;
  aBlock[4] = sub_1DDAE5D50;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1DDAE5D74;
  aBlock[3] = &block_descriptor_0;
  v14 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  if ((a5 & 1) != 0)
  {
    a3 = objc_msgSend(v6, sel_ic_range);
    a4 = v15;
  }
  v16 = objc_msgSend(v6, sel_ic_componentRangesSeparatedByPredicate_inRange_, v14, a3, a4);
  _Block_release(v14);
  sub_1DDAE5DB8();
  v17 = sub_1DDAEB988();

  v18 = sub_1DDAE5DF4(v17);
  swift_release();
  swift_bridgeObjectRelease();
  isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
  result = swift_release();
  if ((isEscapingClosureAtFileLocation & 1) == 0)
    return v18;
  __break(1u);
  return result;
}

uint64_t sub_1DDAE5CEC()
{
  return swift_deallocObject();
}

uint64_t sub_1DDAE5CFC(uint64_t a1, unsigned __int16 a2)
{
  uint64_t v2;

  if ((a2 & 0xF800) == 0xD800)
    return 0;
  else
    return (*(uint64_t (**)(uint64_t, _QWORD))(v2 + 16))(a1, a2) & 1;
}

uint64_t sub_1DDAE5D40()
{
  return swift_deallocObject();
}

uint64_t sub_1DDAE5D50()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))() & 1;
}

uint64_t sub_1DDAE5D74(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(a1 + 32))(a2, a3) & 1;
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

unint64_t sub_1DDAE5DB8()
{
  unint64_t result;

  result = qword_1F03FF198;
  if (!qword_1F03FF198)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F03FF198);
  }
  return result;
}

uint64_t sub_1DDAE5DF4(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (a1 >> 62)
    goto LABEL_15;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    v3 = MEMORY[0x1E0DEE9D8];
    if (!v2)
      return v3;
    v14 = MEMORY[0x1E0DEE9D8];
    result = sub_1DDAE5FE8(0, v2 & ~(v2 >> 63), 0);
    if (v2 < 0)
      break;
    v5 = 0;
    v3 = v14;
    while (v2 != v5)
    {
      if ((a1 & 0xC000000000000001) != 0)
        v6 = (id)MEMORY[0x1DF0DFD6C](v5, a1);
      else
        v6 = *(id *)(a1 + 8 * v5 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_rangeValue);
      v10 = v9;

      v12 = *(_QWORD *)(v14 + 16);
      v11 = *(_QWORD *)(v14 + 24);
      if (v12 >= v11 >> 1)
        sub_1DDAE5FE8(v11 > 1, v12 + 1, 1);
      ++v5;
      *(_QWORD *)(v14 + 16) = v12 + 1;
      v13 = v14 + 16 * v12;
      *(_QWORD *)(v13 + 32) = v8;
      *(_QWORD *)(v13 + 40) = v10;
      if (v2 == v5)
        return v3;
    }
    __break(1u);
LABEL_15:
    swift_bridgeObjectRetain();
    v2 = sub_1DDAEBB38();
    swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

id NSAttributedString.range(byTrimmingCharactersIn:in:)(uint64_t a1, id a2, uint64_t a3, char a4)
{
  void *v4;
  void *v8;
  uint64_t v9;
  id v10;

  v8 = (void *)sub_1DDAEB7A8();
  if ((a4 & 1) != 0)
  {
    a2 = objc_msgSend(v4, sel_ic_range);
    a3 = v9;
  }
  v10 = objc_msgSend(v4, sel_ic_rangeByTrimmingCharactersInSet_inRange_, v8, a2, a3);

  return v10;
}

uint64_t sub_1DDAE5FE8(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DDAE6004(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DDAE6004(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_32;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F03FF1A0);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    memcpy(v13, v14, 16 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DDAEBB44();
  __break(1u);
  return result;
}

uint64_t Sequence.sorted<A>(by:comparator:)()
{
  return sub_1DDAEB97C();
}

uint64_t sub_1DDAE619C(uint64_t a1, uint64_t a2, uint64_t (*a3)(char *, char *), uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  char v13;
  void (*v14)(char *, uint64_t);
  _QWORD v16[2];

  v6 = *(_QWORD *)(*MEMORY[0x1E0DEE2A8] + *a5 + 8);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](a1);
  v10 = (char *)v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v16 - v11;
  swift_getAtKeyPath();
  swift_getAtKeyPath();
  v13 = a3(v12, v10);
  v14 = *(void (**)(char *, uint64_t))(v7 + 8);
  v14(v10, v6);
  v14(v12, v6);
  return v13 & 1;
}

uint64_t sub_1DDAE62A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DDAE619C(a1, a2, *(uint64_t (**)(char *, char *))(v2 + 40), *(_QWORD *)(v2 + 48), *(_QWORD **)(v2 + 56)) & 1;
}

uint64_t Sequence.sorted<A>(by:)(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD v6[16];

  v4 = *(_QWORD *)(*MEMORY[0x1E0DEE2A8] + *a1 + 8);
  v6[2] = a2;
  v6[3] = v4;
  v6[4] = a3;
  v6[5] = a4;
  v6[6] = v4;
  v6[10] = a2;
  v6[11] = a3;
  v6[12] = a4;
  v6[13] = sub_1DDAE6348;
  v6[14] = v6;
  v6[15] = a1;
  return sub_1DDAEB97C();
}

uint64_t sub_1DDAE6348()
{
  return sub_1DDAEB910() & 1;
}

uint64_t Sequence.removingNils<A>()()
{
  return sub_1DDAEB964();
}

uint64_t sub_1DDAE63C0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;

  v4 = sub_1DDAEBAB4();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
}

uint64_t Sequence.count(where:)(uint64_t (*a1)(char *), uint64_t a2, uint64_t a3, char *a4)
{
  uint64_t v4;
  uint64_t AssociatedTypeWitness;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t AssociatedConformanceWitness;
  uint64_t v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char v25;
  char v26;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t (*v32)(char *);
  uint64_t v33;
  char *v34;
  uint64_t v35;

  v32 = a1;
  v33 = a2;
  v34 = a4;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v30 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v8 = (char *)&v29 - v7;
  v9 = sub_1DDAEBAB4();
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v29 - v11;
  v13 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = swift_getAssociatedTypeWitness();
  v29 = *(_QWORD *)(v16 - 8);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v29 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))(v15, v35, a3);
  sub_1DDAEB958();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v34 = v18;
  v35 = v16;
  v20 = v30;
  v31 = AssociatedConformanceWitness;
  sub_1DDAEBAC0();
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v20 + 48);
  if (v21(v12, 1, AssociatedTypeWitness) == 1)
  {
    v22 = 0;
  }
  else
  {
    v22 = 0;
    v23 = v20;
    v24 = *(void (**)(char *, char *, uint64_t))(v20 + 32);
    v24(v8, v12, AssociatedTypeWitness);
    while (1)
    {
      v25 = v32(v8);
      if (v4)
        break;
      v26 = v25;
      (*(void (**)(char *, uint64_t))(v23 + 8))(v8, AssociatedTypeWitness);
      if ((v26 & 1) != 0 && __OFADD__(v22++, 1))
      {
        __break(1u);
        break;
      }
      sub_1DDAEBAC0();
      if (v21(v12, 1, AssociatedTypeWitness) == 1)
        goto LABEL_12;
      v24(v8, v12, AssociatedTypeWitness);
    }
    (*(void (**)(char *, uint64_t))(v23 + 8))(v8, AssociatedTypeWitness);
  }
LABEL_12:
  (*(void (**)(char *, uint64_t))(v29 + 8))(v34, v35);
  return v22;
}

uint64_t Sequence<>.uniqued()(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t AssociatedTypeWitness;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;

  v4 = v3;
  v8 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v12 = sub_1DDAEB9AC();
  if (MEMORY[0x1DF0DFC34](v12, AssociatedTypeWitness))
    v13 = sub_1DDAE68FC(v12, AssociatedTypeWitness, a3);
  else
    v13 = MEMORY[0x1E0DEE9E8];
  swift_bridgeObjectRelease();
  v18 = v13;
  v14 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v4, a1);
  MEMORY[0x1E0C80A78](v14);
  *(&v17 - 4) = a1;
  *(&v17 - 3) = a2;
  *(&v17 - 2) = a3;
  *(&v17 - 1) = (uint64_t)&v18;
  v15 = sub_1DDAEB970();
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_1DDAE67F8(uint64_t a1)
{
  uint64_t AssociatedTypeWitness;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  char v9;
  uint64_t v11;

  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v3 = *(_QWORD *)(AssociatedTypeWitness - 8);
  v4 = MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v11 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v6, a1, AssociatedTypeWitness);
  sub_1DDAEBA54();
  v9 = sub_1DDAEBA48();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, AssociatedTypeWitness);
  return v9 & 1;
}

uint64_t sub_1DDAE68FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  void (*v18)(char *, unint64_t, uint64_t);
  BOOL v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, char *, uint64_t);
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;

  v5 = a1;
  v45 = *(_QWORD *)(a2 - 8);
  v6 = MEMORY[0x1E0C80A78](a1);
  v8 = (char *)&v37 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v44 = (char *)&v37 - v10;
  v37 = v11;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v37 - v13;
  if (MEMORY[0x1DF0DFC28](v12))
  {
    sub_1DDAEBAF0();
    v15 = sub_1DDAEBAE4();
  }
  else
  {
    v15 = MEMORY[0x1E0DEE9E8];
  }
  v40 = MEMORY[0x1DF0DFC34](v5, a2);
  if (!v40)
    return v15;
  v16 = 0;
  v43 = v15 + 56;
  v38 = v14;
  v39 = v5;
  while (1)
  {
    v17 = sub_1DDAEB9C4();
    sub_1DDAEB9A0();
    if ((v17 & 1) != 0)
    {
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, v5+ ((*(unsigned __int8 *)(v45 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v45 + 80))+ *(_QWORD *)(v45 + 72) * v16, a2);
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
        goto LABEL_20;
    }
    else
    {
      result = sub_1DDAEBB08();
      if (v37 != 8)
        goto LABEL_23;
      v46 = result;
      v18 = *(void (**)(char *, unint64_t, uint64_t))(v45 + 16);
      v18(v14, (unint64_t)&v46, a2);
      swift_unknownObjectRelease();
      v19 = __OFADD__(v16, 1);
      v20 = v16 + 1;
      if (v19)
      {
LABEL_20:
        __break(1u);
        return v15;
      }
    }
    v21 = v45;
    v41 = *(void (**)(char *, char *, uint64_t))(v45 + 32);
    v42 = v20;
    v41(v44, v14, a2);
    v22 = sub_1DDAEB8F8();
    v23 = -1 << *(_BYTE *)(v15 + 32);
    v24 = v22 & ~v23;
    v25 = v24 >> 6;
    v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
    v27 = 1 << v24;
    v28 = *(_QWORD *)(v21 + 72);
    if (((1 << v24) & v26) != 0)
    {
      v29 = ~v23;
      do
      {
        v18(v8, *(_QWORD *)(v15 + 48) + v28 * v24, a2);
        v30 = a3;
        v31 = sub_1DDAEB928();
        v32 = *(void (**)(char *, uint64_t))(v45 + 8);
        v32(v8, a2);
        if ((v31 & 1) != 0)
        {
          v32(v44, a2);
          a3 = v30;
          v14 = v38;
          v5 = v39;
          goto LABEL_7;
        }
        v24 = (v24 + 1) & v29;
        v25 = v24 >> 6;
        v26 = *(_QWORD *)(v43 + 8 * (v24 >> 6));
        v27 = 1 << v24;
        a3 = v30;
      }
      while ((v26 & (1 << v24)) != 0);
      v14 = v38;
      v5 = v39;
    }
    v33 = v44;
    *(_QWORD *)(v43 + 8 * v25) = v27 | v26;
    result = ((uint64_t (*)(unint64_t, char *, uint64_t))v41)(*(_QWORD *)(v15 + 48) + v28 * v24, v33, a2);
    v35 = *(_QWORD *)(v15 + 16);
    v19 = __OFADD__(v35, 1);
    v36 = v35 + 1;
    if (v19)
      break;
    *(_QWORD *)(v15 + 16) = v36;
LABEL_7:
    v16 = v42;
    if (v42 == v40)
      return v15;
  }
  __break(1u);
LABEL_23:
  __break(1u);
  return result;
}

uint64_t sub_1DDAE6C04(uint64_t a1)
{
  return sub_1DDAE67F8(a1) & 1;
}

void ICStringFromCGColor_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "Could not get color space name from color %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ICCGColorCreateWithString_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "No strings from color string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ICCGColorCreateWithString_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "No color space from color string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ICCGColorCreateWithString_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1DDAA5000, v0, v1, "No component count in color string: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void ICCGColorCreateWithString_cold_4(void *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "count");
  OUTLINED_FUNCTION_1_0();
  v6 = 2048;
  v7 = a2;
  _os_log_error_impl(&dword_1DDAA5000, a3, OS_LOG_TYPE_ERROR, "Color string component count (%zu) is different from the expected count for the color space (%zu) plus the alpha component", v5, 0x16u);
}

void ICDataFromCGImage_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DDAA5000, log, OS_LOG_TYPE_ERROR, "Failed to create CGImageDestinationRef", v1, 2u);
}

void ICDataFromCGImage_cold_2(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 136315394;
  v3 = "NSData *ICDataFromCGImage(CGImageRef, CFStringRef, NSDictionary *__strong)";
  v4 = 2112;
  v5 = a1;
  _os_log_error_impl(&dword_1DDAA5000, a2, OS_LOG_TYPE_ERROR, "%s -- Failed to finalize image with type '%@'.", (uint8_t *)&v2, 0x16u);
}

uint64_t __getUMUserManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getUMUserPersonaAttributesClass_block_invoke_cold_1(v0);
}

uint64_t __getUMUserPersonaAttributesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:alertMessage:format:].cold.1(v0);
}

uint64_t __getPHPhotoLibraryClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[ICIndexItemsOperation main].cold.1(v0);
}

void __getSYItemIndexingManagerClass_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = abort_report_np();
  __71__ICLocalization_localizedFrameworkStringForKey_value_table_allowSiri___block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void ICEnableSandboxMode_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1DDAA5000, a1, a3, "Trying to enable sandbox mode after checking sandbox state — ignoring to prevent inconsistent app state", a5, a6, a7, a8, 0);
}

void ICEnableSandboxMode_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_5(&dword_1DDAA5000, a1, a3, "Trying to enable sandbox mode even though it's already enabled — ignoring", a5, a6, a7, a8, 0);
}

void initCHSTimelineController_cold_1()
{
  __assert_rtn("ChronoServicesLibrary", "ICWidget.m", 22, "frameworkLibrary");
}

void initCHSTimelineController_cold_2()
{
  __assert_rtn("initCHSTimelineController", "ICWidget.m", 23, "classCHSTimelineController");
}

uint64_t sub_1DDAEB7A8()
{
  return MEMORY[0x1E0CAE410]();
}

uint64_t sub_1DDAEB7B4()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1DDAEB7C0()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1DDAEB7CC()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DDAEB7D8()
{
  return MEMORY[0x1E0CB0A90]();
}

uint64_t sub_1DDAEB7E4()
{
  return MEMORY[0x1E0CB0AC0]();
}

uint64_t sub_1DDAEB7F0()
{
  return MEMORY[0x1E0CB0AE8]();
}

uint64_t sub_1DDAEB7FC()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1DDAEB808()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DDAEB814()
{
  return MEMORY[0x1E0CB0D80]();
}

uint64_t sub_1DDAEB820()
{
  return MEMORY[0x1E0CB0DB8]();
}

uint64_t sub_1DDAEB82C()
{
  return MEMORY[0x1E0CB0DF0]();
}

uint64_t sub_1DDAEB838()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DDAEB844()
{
  return MEMORY[0x1E0D25F98]();
}

uint64_t sub_1DDAEB850()
{
  return MEMORY[0x1E0D25FA8]();
}

uint64_t sub_1DDAEB85C()
{
  return MEMORY[0x1E0D26040]();
}

uint64_t sub_1DDAEB868()
{
  return MEMORY[0x1E0D26050]();
}

uint64_t sub_1DDAEB874()
{
  return MEMORY[0x1E0D26098]();
}

uint64_t sub_1DDAEB880()
{
  return MEMORY[0x1E0D260D0]();
}

uint64_t sub_1DDAEB88C()
{
  return MEMORY[0x1E0D260E0]();
}

uint64_t sub_1DDAEB898()
{
  return MEMORY[0x1E0D260F0]();
}

uint64_t sub_1DDAEB8A4()
{
  return MEMORY[0x1E0D26100]();
}

uint64_t sub_1DDAEB8B0()
{
  return MEMORY[0x1E0D26170]();
}

uint64_t sub_1DDAEB8BC()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DDAEB8C8()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DDAEB8D4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DDAEB8E0()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1DDAEB8EC()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1DDAEB8F8()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1DDAEB904()
{
  return MEMORY[0x1E0DEA3B8]();
}

uint64_t sub_1DDAEB910()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1DDAEB91C()
{
  return MEMORY[0x1E0DEA3C8]();
}

uint64_t sub_1DDAEB928()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DDAEB934()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DDAEB940()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DDAEB94C()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DDAEB958()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1DDAEB964()
{
  return MEMORY[0x1E0DEAAA8]();
}

uint64_t sub_1DDAEB970()
{
  return MEMORY[0x1E0DEAB08]();
}

uint64_t sub_1DDAEB97C()
{
  return MEMORY[0x1E0DEAB30]();
}

uint64_t sub_1DDAEB988()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DDAEB994()
{
  return MEMORY[0x1E0DEADB0]();
}

uint64_t sub_1DDAEB9A0()
{
  return MEMORY[0x1E0DEADC8]();
}

uint64_t sub_1DDAEB9AC()
{
  return MEMORY[0x1E0DEAE10]();
}

uint64_t sub_1DDAEB9B8()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1DDAEB9C4()
{
  return MEMORY[0x1E0DEAE38]();
}

uint64_t sub_1DDAEB9D0()
{
  return MEMORY[0x1E0DEAE60]();
}

uint64_t sub_1DDAEB9DC()
{
  return MEMORY[0x1E0DEAEA0]();
}

uint64_t sub_1DDAEB9E8()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DDAEB9F4()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1DDAEBA00()
{
  return MEMORY[0x1E0DF0708]();
}

uint64_t sub_1DDAEBA0C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DDAEBA18()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DDAEBA24()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1DDAEBA30()
{
  return MEMORY[0x1E0DF08B8]();
}

uint64_t sub_1DDAEBA3C()
{
  return MEMORY[0x1E0DF0900]();
}

uint64_t sub_1DDAEBA48()
{
  return MEMORY[0x1E0DEB2E8]();
}

uint64_t sub_1DDAEBA54()
{
  return MEMORY[0x1E0DEB388]();
}

uint64_t sub_1DDAEBA60()
{
  return MEMORY[0x1E0CB1C58]();
}

uint64_t sub_1DDAEBA6C()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DDAEBA78()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1DDAEBA84()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1DDAEBA90()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1DDAEBA9C()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1DDAEBAA8()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1DDAEBAB4()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DDAEBAC0()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1DDAEBACC()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DDAEBAD8()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DDAEBAE4()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1DDAEBAF0()
{
  return MEMORY[0x1E0DEC268]();
}

uint64_t sub_1DDAEBAFC()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DDAEBB08()
{
  return MEMORY[0x1E0DEC3D8]();
}

uint64_t sub_1DDAEBB14()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DDAEBB20()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DDAEBB2C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DDAEBB38()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DDAEBB44()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DDAEBB50()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1DDAEBB5C()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1DDAEBB68()
{
  return MEMORY[0x1E0DF0DE0]();
}

uint64_t sub_1DDAEBB74()
{
  return MEMORY[0x1E0DED600]();
}

CGAffineTransform *__cdecl CATransform3DGetAffineTransform(CGAffineTransform *__return_ptr retstr, CATransform3D *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0CD2600](retstr, t);
}

BOOL CATransform3DIsAffine(CATransform3D *t)
{
  return MEMORY[0x1E0CD2620](t);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

uint64_t CEMGetSharedEmojiCharacterSet()
{
  return MEMORY[0x1E0D15DB8]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98558](allocator, capacity, theDict);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
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

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x1E0C995E8](userNotification, responseFlags, timeout);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformRotate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF0](retstr, t, angle);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateCopyByMatchingToColorSpace(CGColorSpaceRef a1, CGColorRenderingIntent intent, CGColorRef color, CFDictionaryRef options)
{
  return (CGColorRef)MEMORY[0x1E0C9BC88](a1, *(_QWORD *)&intent, color, options);
}

CGColorRef CGColorCreateWithPattern(CGColorSpaceRef space, CGPatternRef pattern, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BCC0](space, pattern, components);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CFStringRef CGColorSpaceCopyName(CGColorSpaceRef space)
{
  return (CFStringRef)MEMORY[0x1E0C9BDB8](space);
}

CGColorSpaceRef CGColorSpaceCreateDeviceCMYK(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE0]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceGray(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDE8]();
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreatePattern(CGColorSpaceRef baseSpace)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE30](baseSpace);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

uint64_t CGColorSpaceEqualToColorSpace()
{
  return MEMORY[0x1E0C9BE68]();
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

size_t CGColorSpaceGetNumberOfComponents(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BED8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextConcatCTM(CGContextRef c, CGAffineTransform *transform)
{
  MEMORY[0x1E0C9C050](c, transform);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageRetain(CGImageRef image)
{
  return (CGImageRef)MEMORY[0x1E0C9CDA8](image);
}

CGImageSourceRef CGImageSourceCreateWithData(CFDataRef data, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC590](data, options);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPatternRef CGPatternCreate(void *info, CGRect bounds, CGAffineTransform *matrix, CGFloat xStep, CGFloat yStep, CGPatternTiling tiling, BOOL isColored, const CGPatternCallbacks *callbacks)
{
  return (CGPatternRef)MEMORY[0x1E0C9D4A8](info, matrix, *(_QWORD *)&tiling, isColored, callbacks, (__n128)bounds.origin, *(__n128 *)&bounds.origin.y, (__n128)bounds.size, *(__n128 *)&bounds.size.height, xStep, yStep);
}

void CGPatternRelease(CGPatternRef pattern)
{
  MEMORY[0x1E0C9D510](pattern);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIsInfinite(CGRect rect)
{
  return MEMORY[0x1E0C9D610]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectStandardize(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D638]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

int32_t CMTimeCompare(CMTime *time1, CMTime *time2)
{
  return MEMORY[0x1E0C9F2D8](time1, time2);
}

Float64 CMTimeGetSeconds(CMTime *time)
{
  Float64 result;

  MEMORY[0x1E0C9F310](time);
  return result;
}

CMTime *__cdecl CMTimeMake(CMTime *__return_ptr retstr, int64_t value, int32_t timescale)
{
  return (CMTime *)MEMORY[0x1E0C9F318](retstr, value, *(_QWORD *)&timescale);
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetFloat32Answer()
{
  return MEMORY[0x1E0DE2B58]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB3400](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

Boolean SCNetworkReachabilityScheduleWithRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE88E8](target, runLoop, runLoopMode);
}

Boolean SCNetworkReachabilitySetCallback(SCNetworkReachabilityRef target, SCNetworkReachabilityCallBack callout, SCNetworkReachabilityContext *context)
{
  return MEMORY[0x1E0CE88F0](target, callout, context);
}

Boolean SCNetworkReachabilityUnscheduleFromRunLoop(SCNetworkReachabilityRef target, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  return MEMORY[0x1E0CE8900](target, runLoop, runLoopMode);
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
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

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

uint64_t archive_entry_copy_stat()
{
  return MEMORY[0x1E0DE3DB8]();
}

uint64_t archive_entry_free()
{
  return MEMORY[0x1E0DE3DC8]();
}

uint64_t archive_entry_new()
{
  return MEMORY[0x1E0DE3DD0]();
}

uint64_t archive_entry_pathname()
{
  return MEMORY[0x1E0DE3DD8]();
}

uint64_t archive_entry_set_pathname()
{
  return MEMORY[0x1E0DE3E18]();
}

uint64_t archive_entry_set_symlink()
{
  return MEMORY[0x1E0DE3E30]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x1E0DE3E60]();
}

uint64_t archive_read_close()
{
  return MEMORY[0x1E0DE3E78]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x1E0DE3E88]();
}

uint64_t archive_read_finish()
{
  return MEMORY[0x1E0DE3EF0]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x1E0DE3F00]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x1E0DE3F08]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x1E0DE3F28]();
}

uint64_t archive_read_support_compression_all()
{
  return MEMORY[0x1E0DE3F40]();
}

uint64_t archive_read_support_format_all()
{
  return MEMORY[0x1E0DE3F70]();
}

uint64_t archive_write_close()
{
  return MEMORY[0x1E0DE3FC0]();
}

uint64_t archive_write_data()
{
  return MEMORY[0x1E0DE3FC8]();
}

uint64_t archive_write_data_block()
{
  return MEMORY[0x1E0DE3FD0]();
}

uint64_t archive_write_disk_new()
{
  return MEMORY[0x1E0DE3FD8]();
}

uint64_t archive_write_disk_set_standard_lookup()
{
  return MEMORY[0x1E0DE3FE8]();
}

uint64_t archive_write_finish()
{
  return MEMORY[0x1E0DE3FF0]();
}

uint64_t archive_write_finish_entry()
{
  return MEMORY[0x1E0DE3FF8]();
}

uint64_t archive_write_header()
{
  return MEMORY[0x1E0DE4008]();
}

uint64_t archive_write_new()
{
  return MEMORY[0x1E0DE4010]();
}

uint64_t archive_write_open_filename()
{
  return MEMORY[0x1E0DE4028]();
}

uint64_t archive_write_set_compression_bzip2()
{
  return MEMORY[0x1E0DE4038]();
}

uint64_t archive_write_set_compression_none()
{
  return MEMORY[0x1E0DE4040]();
}

uint64_t archive_write_set_format_pax()
{
  return MEMORY[0x1E0DE4050]();
}

uint64_t archive_write_set_format_zip()
{
  return MEMORY[0x1E0DE4068]();
}

long double atan2(long double __y, long double __x)
{
  long double result;

  MEMORY[0x1E0C81620](__y, __x);
  return result;
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int lstat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C83C40](a1, a2);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x1E0C84160](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

int pthread_rwlock_destroy(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84E90](a1);
}

int pthread_rwlock_init(pthread_rwlock_t *a1, const pthread_rwlockattr_t *a2)
{
  return MEMORY[0x1E0C84E98](a1, a2);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_tryrdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA8](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x1E0C85000](*(_QWORD *)&a1, a2, a3);
}

ssize_t readlink(const char *a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C85018](a1, a2, a3);
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
}

uint64_t swift_arrayInitWithTakeBackToFront()
{
  return MEMORY[0x1E0DEEAE8]();
}

uint64_t swift_arrayInitWithTakeFrontToBack()
{
  return MEMORY[0x1E0DEEAF0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_defaultActor_deallocate()
{
  return MEMORY[0x1E0DF0FB0]();
}

uint64_t swift_defaultActor_destroy()
{
  return MEMORY[0x1E0DF0FB8]();
}

uint64_t swift_defaultActor_initialize()
{
  return MEMORY[0x1E0DF0FC0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getAssociatedConformanceWitness()
{
  return MEMORY[0x1E0DEEC00]();
}

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_taskGroup_addPending()
{
  return MEMORY[0x1E0DF0FE8]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

