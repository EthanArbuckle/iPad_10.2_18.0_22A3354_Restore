void sub_1AA8E64F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;
  id *v23;
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v25 - 88));
  _Unwind_Resume(a1);
}

uint64_t UNEqualObjects(void *a1, void *a2)
{
  if (a1 && a2)
    return objc_msgSend(a1, "isEqual:", a2);
  else
    return a1 == a2;
}

uint64_t UNEqualStrings(void *a1, void *a2)
{
  if (a1 && a2)
    return objc_msgSend(a1, "isEqualToString:", a2);
  else
    return a1 == a2;
}

uint64_t UNIsInternalInstall()
{
  return os_variant_has_internal_content();
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void UNRegisterUserNotificationsLogging()
{
  if (UNRegisterUserNotificationsLogging_onceToken != -1)
    dispatch_once(&UNRegisterUserNotificationsLogging_onceToken, &__block_literal_global_1);
}

__CFString *UNFormatLocalizedStringInBundleWithDefaultValue(void *a1, void *a2, __CFBundle *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  uint64_t v12;
  CFStringRef v13;
  __CFString *v14;
  __CFString *v15;
  __CFString *v16;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  v10 = (__CFString *)v7;
  v11 = (__CFString *)v9;
  v12 = -[__CFString length](v10, "length");
  if (a3 && v12)
  {
    v13 = CFBundleCopyLocalizedString(a3, v10, v11, 0);
  }
  else if (v11)
  {
    v13 = v11;
  }
  else
  {
    if (!v10)
    {
      v14 = 0;
      goto LABEL_9;
    }
    v13 = v10;
  }
  v14 = (__CFString *)v13;
LABEL_9:

  if (-[__CFString length](v14, "length") && objc_msgSend(v8, "count"))
  {
    UNFormatLocalizedString(v14, v8);
    v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v15 = v14;
  }
  v16 = v15;

  return v16;
}

id UNSafeCast(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  id v4;

  v2 = a2;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

BOOL UNSimilarStrings(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if ((objc_msgSend(v3, "isEqualToString:", v4) & 1) != 0)
    {
LABEL_4:
      v6 = 1;
      goto LABEL_9;
    }
  }
  else if (v3 == v4)
  {
    goto LABEL_4;
  }
  if (objc_msgSend(v3, "length"))
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "length") == 0;
LABEL_9:

  return v6;
}

const __CFString *UNStringFromNotificationAttachmentDisplayLocation(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("<invalid>");
  else
    return off_1E57EF920[a1];
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id OUTLINED_FUNCTION_3(uint64_t a1, void *a2)
{
  return a2;
}

void sub_1AA8F3BF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *UNShowPreviewsSettingString(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E57EFA28[a1];
}

__CFString *UNNotificationSettingString(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E57EFA10[a1];
}

__CFString *UNNotificationGroupingSettingString(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E57EFA58[a1];
}

__CFString *UNAuthorizationStatusString(unint64_t a1)
{
  if (a1 > 4)
    return 0;
  else
    return off_1E57EF9E8[a1];
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

BOOL UNSimilarArrays(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
    {
LABEL_4:
      v6 = 1;
      goto LABEL_9;
    }
  }
  else if (v3 == v4)
  {
    goto LABEL_4;
  }
  if (objc_msgSend(v3, "count"))
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "count") == 0;
LABEL_9:

  return v6;
}

BOOL UNSimilarSets(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  _BOOL8 v6;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    if ((objc_msgSend(v3, "isEqual:", v4) & 1) != 0)
    {
LABEL_4:
      v6 = 1;
      goto LABEL_9;
    }
  }
  else if (v3 == v4)
  {
    goto LABEL_4;
  }
  if (objc_msgSend(v3, "count"))
    v6 = 0;
  else
    v6 = objc_msgSend(v5, "count") == 0;
LABEL_9:

  return v6;
}

uint64_t UNEqualBools(int a1, int a2)
{
  return a1 ^ a2 ^ 1u;
}

BOOL UNEqualIntegers(uint64_t a1, uint64_t a2)
{
  return a1 == a2;
}

BOOL UNEqualDoubles(double a1, double a2)
{
  return vabdd_f64(a1, a2) < 2.22044605e-16;
}

BOOL UNDoubleIsZero(double a1)
{
  return fabs(a1) < 2.22044605e-16;
}

BOOL UNEqualFloats(float a1, float a2)
{
  return vabds_f32(a1, a2) < 0.00000011921;
}

BOOL UNFloatIsZero(float a1)
{
  return fabsf(a1) < 0.00000011921;
}

void UNLogToDeveloper(uint64_t a1, uint64_t a2)
{
  void *v2;
  NSObject *v3;
  uint8_t buf[4];
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@: %@"), a1, a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSLog((NSString *)CFSTR("%@"), v2);
  v3 = UNLogCommunicationNotifications;
  if (os_log_type_enabled((os_log_t)UNLogCommunicationNotifications, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v5 = v2;
    _os_log_impl(&dword_1AA8E4000, v3, OS_LOG_TYPE_DEFAULT, "Logged to developer: %{public}@", buf, 0xCu);
  }

}

id UNNotificationDestinationStrings(char a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 4) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("NotificationCenter"));
    if ((a1 & 2) == 0)
    {
LABEL_3:
      if ((a1 & 1) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(v3, "addObject:", CFSTR("Alert"));
      if ((a1 & 8) == 0)
        return v3;
      goto LABEL_5;
    }
  }
  else if ((a1 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", CFSTR("LockScreen"));
  if ((a1 & 1) != 0)
    goto LABEL_9;
LABEL_4:
  if ((a1 & 8) != 0)
LABEL_5:
    objc_msgSend(v3, "addObject:", CFSTR("CarPlay"));
  return v3;
}

uint64_t UNNotificationAttachmentFamilyFromTypeIdentifier(void *a1)
{
  const __CFString *v1;
  __CFString *v2;
  uint64_t v3;
  const __CFString *v4;

  v1 = a1;
  v2 = (__CFString *)v1;
  if (!v1)
    goto LABEL_32;
  if (UTTypeConformsTo(v1, (CFStringRef)*MEMORY[0x1E0CA5AC8]) != 1)
  {
    v4 = (const __CFString *)*MEMORY[0x1E0CA5B90];
    if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5B90]) == 1)
    {
      if (UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5BA8])
        || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5B68])
        || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5C10])
        || UTTypeEqual(v2, CFSTR("public.heic"))
        || UTTypeEqual(v2, v4))
      {
        v3 = 2;
        goto LABEL_33;
      }
    }
    else if (UTTypeConformsTo(v2, (CFStringRef)*MEMORY[0x1E0CA5BF8]) == 1
           && (UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5C38])
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5BD0])
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5BD8])
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5BE0])
            || UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5AA0])
            || UTTypeEqual(v2, CFSTR("com.apple.m4v-video"))
            || UTTypeEqual(v2, CFSTR("public.3gpp"))
            || UTTypeEqual(v2, CFSTR("public.3gpp2"))))
    {
      v3 = 3;
      goto LABEL_33;
    }
LABEL_32:
    v3 = 0;
    goto LABEL_33;
  }
  if (!UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5AD0])
    && !UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5CC0])
    && !UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5BC8])
    && !UTTypeEqual(v2, (CFStringRef)*MEMORY[0x1E0CA5BE8])
    && !UTTypeEqual(v2, CFSTR("com.apple.m4a-audio"))
    && !UTTypeEqual(v2, CFSTR("com.apple.coreaudio-format"))
    && !UTTypeEqual(v2, CFSTR("public.aifc-audio"))
    && !UTTypeEqual(v2, CFSTR("org.3gpp.adaptive-multi-rate-audio"))
    && !UTTypeEqual(v2, CFSTR("public.au-audio"))
    && !UTTypeEqual(v2, CFSTR("public.ac3-audio"))
    && !UTTypeEqual(v2, CFSTR("public.enhanced-ac3-audio")))
  {
    goto LABEL_32;
  }
  v3 = 1;
LABEL_33:

  return v3;
}

uint64_t UNNotificationAttachmentFamilyMaximumSize(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 0;
  else
    return qword_1AA9159F0[a1 - 1];
}

const __CFString *UNNotificationAttachmentFamilyToString(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return CFSTR("<Invalid>");
  else
    return off_1E57EFBE0[a1 - 1];
}

void sub_1AA8F7EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

Class __getINSendMessageIntentClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary();
  result = objc_getClass("INSendMessageIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINSendMessageIntentClass_block_invoke_cold_1();
  getINSendMessageIntentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void IntentsLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!IntentsLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E57EFC48;
    v2 = 0;
    IntentsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!IntentsLibraryCore_frameworkLibrary)
    IntentsLibrary_cold_1(&v0);
}

Class __getINStartCallIntentClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary();
  result = objc_getClass("INStartCallIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINStartCallIntentClass_block_invoke_cold_1();
  getINStartCallIntentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

id UNSafeCastAny(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        UNSafeCast(*(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v9), v4);
        v10 = objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v11 = (void *)v10;
          goto LABEL_11;
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

id UNSafeConforms(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", a1))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

const __CFString *_UNNotificationCommunicationContextCapabilitiesDescription(uint64_t a1)
{
  const __CFString *v1;

  v1 = &stru_1E57F06A0;
  if (!a1)
    v1 = CFSTR("Unspecified");
  if ((a1 & 1) != 0)
    return CFSTR("Video");
  else
    return v1;
}

id UNBundle()
{
  if (UNBundle___onceToken != -1)
    dispatch_once(&UNBundle___onceToken, &__block_literal_global_3);
  return (id)UNBundle___userNotificationBundle;
}

id UNLocalizedStringForKey(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  UNBundle();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", v1, &stru_1E57F06A0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id UNLocalizedFormatStringForKey(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;

  v2 = a2;
  UNBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", v2, &stru_1E57F06A0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_1AA900B7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t UNCOneness()
{
  return _os_feature_enabled_impl();
}

uint64_t UNCCatchMe()
{
  return _os_feature_enabled_impl();
}

uint64_t UNCCatchMeHighlights()
{
  return _os_feature_enabled_impl();
}

uint64_t UNCDaemonEnabled()
{
  NSObject *v0;

  if (!_os_feature_enabled_impl())
    return _os_feature_enabled_impl();
  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v0 = UNLogUtilities;
    if (os_log_type_enabled((os_log_t)UNLogUtilities, OS_LOG_TYPE_ERROR))
      UNCDaemonEnabled_cold_1(v0);
  }
  return 0;
}

uint64_t UNCUseGroupService()
{
  uint64_t result;

  result = UNCUsePipeline();
  if ((_DWORD)result)
    return _os_feature_enabled_impl();
  return result;
}

uint64_t UNCUsePipeline()
{
  if ((_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return _os_feature_enabled_impl();
}

uint64_t UNCRemoteServicesNeeded()
{
  if ((_os_feature_enabled_impl() & 1) != 0 || (_os_feature_enabled_impl() & 1) != 0)
    return 1;
  else
    return UNCDaemonEnabled();
}

void sub_1AA902E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getINSendMessageIntentClass_block_invoke_0(uint64_t a1)
{
  Class result;

  IntentsLibrary_0();
  result = objc_getClass("INSendMessageIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINSendMessageIntentClass_block_invoke_cold_1_0();
  getINSendMessageIntentClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void IntentsLibrary_0()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!IntentsLibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_1E57EFF18;
    v2 = 0;
    IntentsLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!IntentsLibraryCore_frameworkLibrary_0)
    IntentsLibrary_cold_1_0(&v0);
}

Class __getINStartCallIntentClass_block_invoke_0(uint64_t a1)
{
  Class result;

  IntentsLibrary_0();
  result = objc_getClass("INStartCallIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINStartCallIntentClass_block_invoke_cold_1_0();
  getINStartCallIntentClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getINReadAnnouncementIntentClass_block_invoke(uint64_t a1)
{
  Class result;

  IntentsLibrary_0();
  result = objc_getClass("INReadAnnouncementIntent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getINReadAnnouncementIntentClass_block_invoke_cold_1();
  getINReadAnnouncementIntentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id UNFormatLocalizedString(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  _BYTE *v7;
  uint64_t v8;
  int v9;
  unint64_t v10;
  char *v11;
  char *v12;
  const char *v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  char *v22;
  char v23;
  char v24;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DF0], "data");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_retainAutorelease(v3);
  v7 = (_BYTE *)objc_msgSend(v6, "UTF8String");
  v8 = (uint64_t)v7;
  if (v7)
  {
    v9 = *v7;
    if (*v7)
    {
      v10 = 0;
      v11 = 0;
      do
      {
        v24 = v9;
        v12 = v11 + 1;
        v13 = &v11[v8 + 1];
        v14 = *v13;
        v23 = *v13;
        if (v9 == 37)
        {
          if (v14 == 64)
          {
            if (v10 >= objc_msgSend(v4, "count"))
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
            else
              objc_msgSend(v4, "objectAtIndex:", v10);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "description");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "dataUsingEncoding:", 4);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "appendData:", v19);
            ++v10;
LABEL_17:

            goto LABEL_18;
          }
          if ((v14 - 48) <= 9)
          {
            v22 = 0;
            v15 = strtol(v13, &v22, 10);
            v12 = &v22[~v8];
            if (*v22 != 36 || v22[1] != 64)
              goto LABEL_18;
            v16 = v15 - 1;
            if (v15 - 1 >= (unint64_t)objc_msgSend(v4, "count"))
              objc_msgSend(MEMORY[0x1E0C99E38], "null");
            else
              objc_msgSend(v4, "objectAtIndex:", v16);
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "description");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dataUsingEncoding:", 4);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "appendData:", v19);
            v12 += 2;
            goto LABEL_17;
          }
          if (v14)
          {
            if (v14 == 37)
              objc_msgSend(v5, "appendBytes:length:", &v23, 1);
            goto LABEL_18;
          }
        }
        else
        {
          objc_msgSend(v5, "appendBytes:length:", &v24, 1);
        }
        v12 = v11;
LABEL_18:
        v11 = v12 + 1;
        v9 = v12[v8 + 1];
      }
      while (v12[v8 + 1]);
    }
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v5, 4);
  }

  return (id)v8;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_4(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

id OUTLINED_FUNCTION_5(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_7()
{
  return objc_opt_class();
}

void __getINSendMessageIntentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINSendMessageIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_UNNotificationCommunicationContext+INIntent.m"), 27, CFSTR("Unable to find class %s"), "INSendMessageIntent");

  __break(1u);
}

void IntentsLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntentsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_UNNotificationCommunicationContext+INIntent.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getINStartCallIntentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINStartCallIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_UNNotificationCommunicationContext+INIntent.m"), 28, CFSTR("Unable to find class %s"), "INStartCallIntent");

  __break(1u);
}

void UNCDaemonEnabled_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1AA8E4000, log, OS_LOG_TYPE_ERROR, "UserNotificationsDaemon forced OFF. If you intended to enable this, see UNFeatureFlags.m.", v1, 2u);
}

void __getINSendMessageIntentClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINSendMessageIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UNNotificationContent.m"), 39, CFSTR("Unable to find class %s"), "INSendMessageIntent");

  __break(1u);
}

void IntentsLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *IntentsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("UNNotificationContent.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getINStartCallIntentClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINStartCallIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UNNotificationContent.m"), 40, CFSTR("Unable to find class %s"), "INStartCallIntent");

  __break(1u);
}

void __getINReadAnnouncementIntentClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getINReadAnnouncementIntentClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("UNNotificationContent.m"), 41, CFSTR("Unable to find class %s"), "INReadAnnouncementIntent");

  __break(1u);
}

uint64_t BSDeserializeNSSecureEncodableObjectOfClassFromXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D011E0]();
}

uint64_t BSSerializeNSSecureEncodableObjectToXPCDictionaryWithKey()
{
  return MEMORY[0x1E0D01568]();
}

uint64_t BSSystemRootDirectory()
{
  return MEMORY[0x1E0D01620]();
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

CFStringRef CFBundleCopyLocalizedString(CFBundleRef bundle, CFStringRef key, CFStringRef value, CFStringRef tableName)
{
  return (CFStringRef)MEMORY[0x1E0C98050](bundle, key, value, tableName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

Boolean UTTypeConformsTo(CFStringRef inUTI, CFStringRef inConformsToUTI)
{
  return MEMORY[0x1E0CA5940](inUTI, inConformsToUTI);
}

Boolean UTTypeEqual(CFStringRef inUTI1, CFStringRef inUTI2)
{
  return MEMORY[0x1E0CA5988](inUTI1, inUTI2);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFURLAttachSecurityScopeToFileURL()
{
  return MEMORY[0x1E0C9A5B0]();
}

uint64_t _CFURLCopySecurityScopeFromFileURL()
{
  return MEMORY[0x1E0C9A678]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
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

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
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

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

