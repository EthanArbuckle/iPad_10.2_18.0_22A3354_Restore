id _FALogSystem()
{
  if (_FALogSystem_onceToken != -1)
    dispatch_once(&_FALogSystem_onceToken, &__block_literal_global_2);
  return (id)_FALogSystem_log;
}

void sub_1CAEBF49C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,char a23)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a23, 8);
  _Unwind_Resume(a1);
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

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

id _FASignpostLogSystem()
{
  if (_FASignpostLogSystem_onceToken != -1)
    dispatch_once(&_FASignpostLogSystem_onceToken, &__block_literal_global_3);
  return (id)_FASignpostLogSystem_log;
}

os_signpost_id_t _FASignpostCreate(NSObject *a1)
{
  os_signpost_id_t v1;

  v1 = os_signpost_id_generate(a1);
  mach_continuous_time();
  return v1;
}

unint64_t _FASignpostGetNanoseconds(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;

  if (_FASignpostGetNanoseconds_onceToken != -1)
    dispatch_once(&_FASignpostGetNanoseconds_onceToken, &__block_literal_global_5);
  v3 = mach_continuous_time();
  LODWORD(v4) = _FASignpostGetNanoseconds_timebase_info;
  LODWORD(v5) = *(_DWORD *)algn_1ECFCF0FC;
  return (unint64_t)((double)v4 / (double)v5 * (double)(v3 - a2));
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

const __CFString *FALogStringForQualityOfService(uint64_t a1)
{
  if (a1 <= 16)
  {
    if (a1 == -1)
      return CFSTR("Default");
    if (a1 == 9)
      return CFSTR("Background");
  }
  else
  {
    switch(a1)
    {
      case 17:
        return CFSTR("Utility");
      case 33:
        return CFSTR("UserInteractive");
      case 25:
        return CFSTR("UserInitiated");
    }
  }
  return CFSTR("Unknown");
}

void sub_1CAEC5438(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1CAEC55CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAEC87CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1CAECC9A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getCNAvatarImageRendererClass()
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
  v0 = (void *)getCNAvatarImageRendererClass_softClass;
  v7 = getCNAvatarImageRendererClass_softClass;
  if (!getCNAvatarImageRendererClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNAvatarImageRendererClass_block_invoke;
    v3[3] = &unk_1E85620F8;
    v3[4] = &v4;
    __getCNAvatarImageRendererClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1CAECCA64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _weakUIImagePNGRepresentation(void *a1)
{
  id v1;
  void (*v2)(id);
  void *v3;
  _Unwind_Exception *v5;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v2 = (void (*)(id))getUIImagePNGRepresentationSymbolLoc_ptr;
  v10 = getUIImagePNGRepresentationSymbolLoc_ptr;
  if (!getUIImagePNGRepresentationSymbolLoc_ptr)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __getUIImagePNGRepresentationSymbolLoc_block_invoke;
    v6[3] = &unk_1E85620F8;
    v6[4] = &v7;
    __getUIImagePNGRepresentationSymbolLoc_block_invoke((uint64_t)v6);
    v2 = (void (*)(id))v8[3];
  }
  _Block_object_dispose(&v7, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)_weakUIImagePNGRepresentation_cold_1();
    _Block_object_dispose(&v7, 8);
    _Unwind_Resume(v5);
  }
  v2(v1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __getCNAvatarImageRenderingScopeClass_block_invoke(uint64_t a1)
{
  ContactsUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("CNAvatarImageRenderingScope");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNAvatarImageRenderingScopeClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1();
    ContactsUILibrary();
  }
}

void ContactsUILibrary()
{
  void *v0;

  if (!ContactsUILibraryCore_frameworkLibrary)
    ContactsUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ContactsUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getCNAvatarImageRendererClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ContactsUILibrary();
  result = objc_getClass("CNAvatarImageRenderer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getCNAvatarImageRendererClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getCNAvatarImageRendererClass_block_invoke_cold_1();
    return (Class)__getUIImagePNGRepresentationSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getUIImagePNGRepresentationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (UIKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)UIKitLibraryCore_frameworkLibrary;
  }
  else
  {
    UIKitLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)UIKitLibraryCore_frameworkLibrary;
    if (!UIKitLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "UIImagePNGRepresentation");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getUIImagePNGRepresentationSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1CAECEAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAAUIFamilySetupPrompterClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    AppleAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleAccountUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AAUIFamilySetupPrompter");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAAUIFamilySetupPrompterClass_block_invoke_cold_1();
    free(v3);
  }
  getAAUIFamilySetupPrompterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1CAECF09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1CAED08DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1CAED1554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

uint64_t OUTLINED_FUNCTION_2()
{
  return objc_opt_class();
}

void sub_1CAED3254(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v14;
  va_list va;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v14 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1CAED40FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CAED4280(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1CAED454C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getGDPersonTaggingOptionsClass_block_invoke(uint64_t a1)
{
  IntelligencePlatformLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("GDPersonTaggingOptions");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getGDPersonTaggingOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getGDPersonTaggingOptionsClass_block_invoke_cold_1();
    IntelligencePlatformLibrary();
  }
}

void IntelligencePlatformLibrary()
{
  void *v0;

  if (!IntelligencePlatformLibraryCore_frameworkLibrary)
    IntelligencePlatformLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!IntelligencePlatformLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getGDViewServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  IntelligencePlatformLibrary();
  result = objc_getClass("GDViewService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getGDViewServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getGDViewServiceClass_block_invoke_cold_1();
    return (Class)__getGDConfigurationClass_block_invoke(v3);
  }
  return result;
}

Class __getGDConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  IntelligencePlatformLibrary();
  result = objc_getClass("GDConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getGDConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getGDConfigurationClass_block_invoke_cold_1();
    return (Class)__getGDEntityTaggingServiceClass_block_invoke(v3);
  }
  return result;
}

Class __getGDEntityTaggingServiceClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  IntelligencePlatformLibrary();
  result = objc_getClass("GDEntityTaggingService");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getGDEntityTaggingServiceClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getGDEntityTaggingServiceClass_block_invoke_cold_1();
    return (Class)-[NSArray(FamilyCircle) fa_map:](v3);
  }
  return result;
}

void sub_1CAED4F80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1CAED69DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_1CAED6C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSTPrivateServiceClientClass_block_invoke(uint64_t a1)
{
  ScreenTimeCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("STPrivateServiceClient");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSTPrivateServiceClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSTPrivateServiceClientClass_block_invoke_cold_1();
    ScreenTimeCoreLibrary();
  }
}

void ScreenTimeCoreLibrary()
{
  void *v0;

  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
    ScreenTimeCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!ScreenTimeCoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSTUserIDClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  ScreenTimeCoreLibrary();
  result = objc_getClass("STUserID");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSTUserIDClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSTUserIDClass_block_invoke_cold_1();
    return (Class)__getSTSetupClientClass_block_invoke(v3);
  }
  return result;
}

Class __getSTSetupClientClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;

  ScreenTimeCoreLibrary();
  result = objc_getClass("STSetupClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSTSetupClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getSTSetupClientClass_block_invoke_cold_1();
    return +[FAFamilyMemberPhotoRequest responseClass](v3, v4);
  }
  return result;
}

void sub_1CAED8F7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

uint64_t sub_1CAED9638@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(a2 - 8) + 32))(a3, a1);
}

unint64_t MissingRequiredKey.errorDescription.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v7;
  unint64_t v8;

  v2 = *(_QWORD *)(a1 + 16);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = 0;
  v8 = 0xE000000000000000;
  sub_1CAF207FC();
  swift_bridgeObjectRelease();
  v7 = 0xD000000000000016;
  v8 = 0x80000001CAF2A010;
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v1, v2);
  sub_1CAF2043C();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t Dictionary.subscript.getter@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  uint64_t v26;

  v24 = a6;
  v26 = *(_QWORD *)(a3 - 8);
  MEMORY[0x1E0C80A78]();
  v25 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1CAF20754();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78]();
  v15 = (char *)&v24 - v14;
  MEMORY[0x1D1799624](a1, a2, a3, a4, a5);
  v16 = *(_QWORD *)(a4 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v15, 1, a4) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v16 + 32))(v24, v15, a4);
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v17 = v26;
  v18 = v25;
  (*(void (**)(char *, uint64_t, uint64_t))(v26 + 16))(v25, a1, a3);
  v21 = type metadata accessor for MissingRequiredKey(0, a3, v19, v20);
  MEMORY[0x1D179A5CC](&protocol conformance descriptor for MissingRequiredKey<A>, v21);
  swift_allocError();
  (*(void (**)(uint64_t, char *, uint64_t))(v17 + 32))(v22, v18, a3);
  return swift_willThrow();
}

uint64_t type metadata accessor for MissingRequiredKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for MissingRequiredKey);
}

void sub_1CAED98EC()
{
  JUMPOUT(0x1D179A5CCLL);
}

uint64_t sub_1CAED98FC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1CAED9904()
{
  uint64_t result;
  unint64_t v1;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1CAED9970(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v8;

  v3 = a1;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 80);
  if (v5 <= 7 && *(_QWORD *)(v4 + 64) <= 0x18uLL && (*(_DWORD *)(v4 + 80) & 0x100000) == 0)
  {
    (*(void (**)(uint64_t *))(v4 + 16))(a1);
  }
  else
  {
    v8 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v8 + ((v5 + 16) & ~v5));
    swift_retain();
  }
  return v3;
}

uint64_t sub_1CAED99E0(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))();
}

uint64_t sub_1CAED99F0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 16))();
  return a1;
}

uint64_t sub_1CAED9A20(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 24))();
  return a1;
}

uint64_t sub_1CAED9A50(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 32))();
  return a1;
}

uint64_t sub_1CAED9A80(uint64_t a1, uint64_t a2, uint64_t a3)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 40))();
  return a1;
}

uint64_t sub_1CAED9AB0(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  unsigned int v5;
  unsigned int v6;
  uint64_t v7;
  char v8;
  int v9;
  unsigned int v10;
  int v11;

  if (!a2)
    return 0;
  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  v6 = a2 - v5;
  if (a2 <= v5)
    goto LABEL_18;
  v7 = *(_QWORD *)(v4 + 64);
  v8 = 8 * v7;
  if (v7 <= 3)
  {
    v10 = ((v6 + ~(-1 << v8)) >> v8) + 1;
    if (HIWORD(v10))
    {
      v9 = *(_DWORD *)(a1 + v7);
      if (!v9)
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 > 0xFF)
    {
      v9 = *(unsigned __int16 *)(a1 + v7);
      if (!*(_WORD *)(a1 + v7))
        goto LABEL_18;
      goto LABEL_11;
    }
    if (v10 < 2)
    {
LABEL_18:
      if (v5)
        return (*(uint64_t (**)(void))(v4 + 48))();
      return 0;
    }
  }
  v9 = *(unsigned __int8 *)(a1 + v7);
  if (!*(_BYTE *)(a1 + v7))
    goto LABEL_18;
LABEL_11:
  v11 = (v9 - 1) << v8;
  if (v7 > 3)
    v11 = 0;
  if (!(_DWORD)v7)
    return v5 + v11 + 1;
  if (v7 > 3)
    LODWORD(v7) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1CAED9B60 + 4 * byte_1CAF24240[(v7 - 1)]))();
}

void sub_1CAED9BB0(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v6;
  unsigned int v7;
  size_t v8;
  BOOL v9;
  unsigned int v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;

  v6 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v7 = *(_DWORD *)(v6 + 84);
  v8 = *(_QWORD *)(v6 + 64);
  v9 = a3 >= v7;
  v10 = a3 - v7;
  if (v10 != 0 && v9)
  {
    if (v8 <= 3)
    {
      v13 = ((v10 + ~(-1 << (8 * v8))) >> (8 * v8)) + 1;
      if (HIWORD(v13))
      {
        v11 = 4u;
      }
      else if (v13 >= 0x100)
      {
        v11 = 2;
      }
      else
      {
        v11 = v13 > 1;
      }
    }
    else
    {
      v11 = 1u;
    }
  }
  else
  {
    v11 = 0u;
  }
  if (v7 < a2)
  {
    v12 = ~v7 + a2;
    if (v8 < 4)
    {
      if ((_DWORD)v8)
      {
        v14 = v12 & ~(-1 << (8 * v8));
        bzero(a1, v8);
        if ((_DWORD)v8 == 3)
        {
          *a1 = v14;
          *((_BYTE *)a1 + 2) = BYTE2(v14);
        }
        else if ((_DWORD)v8 == 2)
        {
          *a1 = v14;
        }
        else
        {
          *(_BYTE *)a1 = v14;
        }
      }
    }
    else
    {
      bzero(a1, *(_QWORD *)(v6 + 64));
      *(_DWORD *)a1 = v12;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X11 }
}

void type metadata accessor for Dataclass(uint64_t a1)
{
  sub_1CAEDA2C0(a1, (unint64_t *)&unk_1EF990F10);
}

void type metadata accessor for AIDAServiceType(uint64_t a1)
{
  sub_1CAEDA2C0(a1, &qword_1EF98FFD8);
}

void type metadata accessor for Destination(uint64_t a1)
{
  sub_1CAEDA2C0(a1, &qword_1EF9903A0);
}

uint64_t sub_1CAED9D9C()
{
  return sub_1CAEDA0CC(&qword_1EF990398, (uint64_t (*)(uint64_t))type metadata accessor for Destination, (uint64_t)&unk_1CAF243B4);
}

uint64_t sub_1CAED9DC8()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

uint64_t sub_1CAED9E0C()
{
  return sub_1CAF20A24();
}

uint64_t sub_1CAED9E34()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

uint64_t sub_1CAED9E74(uint64_t a1, uint64_t a2)
{
  return sub_1CAEDA4D0(a1, a2, MEMORY[0x1E0DEA950]);
}

void sub_1CAED9E94(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

uint64_t sub_1CAED9E9C(uint64_t a1, uint64_t a2)
{
  return sub_1CAEDA4D0(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_1CAED9EA8(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_1CAF203E8();
  *a2 = 0;
  return result;
}

uint64_t sub_1CAED9F1C(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_1CAF203F4();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_1CAED9F98@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_1CAF20400();
  v2 = sub_1CAF203DC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

BOOL sub_1CAED9FD8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1CAED9FEC@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1CAED9FFC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_1CAEDA00C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1CAEDA01C()
{
  sub_1CAEDA0CC(&qword_1EF990F60, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_1CAF2465C);
  sub_1CAEDA0CC(&qword_1EF990F68, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_1CAF2447C);
  return sub_1CAF20904();
}

uint64_t sub_1CAEDA0A0()
{
  return sub_1CAEDA0CC(&qword_1EF990F20, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_1CAF24444);
}

uint64_t sub_1CAEDA0CC(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D179A5CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CAEDA10C()
{
  return sub_1CAEDA0CC(&qword_1EF990F28, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_1CAF2441C);
}

uint64_t sub_1CAEDA138()
{
  sub_1CAEDA0CC(&qword_1EF990F50, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_1CAF2461C);
  sub_1CAEDA0CC(&qword_1EF990F58, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_1CAF2457C);
  return sub_1CAF20904();
}

uint64_t sub_1CAEDA1BC()
{
  return sub_1CAEDA0CC(&qword_1EF990F30, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_1CAF24544);
}

uint64_t sub_1CAEDA1E8()
{
  return sub_1CAEDA0CC(&qword_1EF990F38, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_1CAF2451C);
}

uint64_t sub_1CAEDA214()
{
  return sub_1CAEDA0CC((unint64_t *)&unk_1EF990F40, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_1CAF245AC);
}

uint64_t sub_1CAEDA240()
{
  return sub_1CAEDA0CC(&qword_1EF9903F8, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_1CAF244AC);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1D179A548](a1, v6, a5);
}

void type metadata accessor for FLItemCollection(uint64_t a1)
{
  sub_1CAEDA2C0(a1, &qword_1EF990F70);
}

void type metadata accessor for FLItemGroup(uint64_t a1)
{
  sub_1CAEDA2C0(a1, &qword_1EF990F78);
}

void sub_1CAEDA2C0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1CAEDA304@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1CAF20400();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1CAEDA32C()
{
  sub_1CAEDA0CC(&qword_1EF990FC0, (uint64_t (*)(uint64_t))type metadata accessor for FLItemGroup, (uint64_t)&unk_1CAF2479C);
  sub_1CAEDA0CC(&qword_1EF990FC8, (uint64_t (*)(uint64_t))type metadata accessor for FLItemGroup, (uint64_t)&unk_1CAF2473C);
  return sub_1CAF20904();
}

uint64_t sub_1CAEDA3B0()
{
  return sub_1CAEDA0CC(&qword_1EF990F80, (uint64_t (*)(uint64_t))type metadata accessor for FLItemGroup, (uint64_t)&unk_1CAF24700);
}

uint64_t sub_1CAEDA3DC()
{
  return sub_1CAEDA0CC(&qword_1EF990F88, (uint64_t (*)(uint64_t))type metadata accessor for FLItemGroup, (uint64_t)&unk_1CAF246D4);
}

uint64_t sub_1CAEDA408@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1CAF203DC();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_1CAEDA44C()
{
  sub_1CAEDA0CC(&qword_1EF990FB0, (uint64_t (*)(uint64_t))type metadata accessor for FLItemCollection, (uint64_t)&unk_1CAF248F4);
  sub_1CAEDA0CC(&qword_1EF990FB8, (uint64_t (*)(uint64_t))type metadata accessor for FLItemCollection, (uint64_t)&unk_1CAF24894);
  return sub_1CAF20904();
}

uint64_t sub_1CAEDA4D0(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1CAF20400();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_1CAEDA50C()
{
  sub_1CAF20400();
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAEDA54C()
{
  uint64_t v0;

  sub_1CAF20400();
  sub_1CAF20A18();
  sub_1CAF20490();
  v0 = sub_1CAF20A30();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_1CAEDA5BC()
{
  return sub_1CAEDA0CC(&qword_1EF990F90, (uint64_t (*)(uint64_t))type metadata accessor for FLItemGroup, (uint64_t)&unk_1CAF24770);
}

uint64_t sub_1CAEDA5E8()
{
  return sub_1CAEDA0CC(&qword_1EF990F98, (uint64_t (*)(uint64_t))type metadata accessor for FLItemCollection, (uint64_t)&unk_1CAF24858);
}

uint64_t sub_1CAEDA614()
{
  return sub_1CAEDA0CC(&qword_1EF990FA0, (uint64_t (*)(uint64_t))type metadata accessor for FLItemCollection, (uint64_t)&unk_1CAF2482C);
}

uint64_t sub_1CAEDA640()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_1CAF20400();
  v2 = v1;
  if (v0 == sub_1CAF20400() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_1CAEDA6C8()
{
  return sub_1CAEDA0CC(&qword_1EF990FA8, (uint64_t (*)(uint64_t))type metadata accessor for FLItemCollection, (uint64_t)&unk_1CAF248C8);
}

id FAOSUpdatedActivity.init(heartbeatActivityHandler:)(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[6];

  v4 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v8[4] = a1;
  v8[5] = a2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1CAEDA7AC;
  v8[3] = &block_descriptor;
  v5 = _Block_copy(v8);
  v6 = objc_msgSend(v4, sel_initWithHeartbeatActivityHandler_, v5);
  _Block_release(v5);
  swift_release();
  return v6;
}

{
  id v2;

  v2 = sub_1CAEDC448(a1, a2);
  swift_release();
  return v2;
}

uint64_t sub_1CAEDA7AC(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
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

uint64_t sub_1CAEDA820(void (*a1)(void))
{
  uint64_t v1;

  a1();
  return sub_1CAEDCECC(*(uint64_t (**)(void))(v1 + 8));
}

uint64_t FAOSUpdatedActivity.checkin()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 40) = v0;
  return swift_task_switch();
}

uint64_t sub_1CAEDA8DC()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t);
  uint64_t v12;

  if (qword_1EF98FBC8 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  v0[6] = __swift_project_value_buffer(v1, (uint64_t)qword_1EF98FD50);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v12 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[4] = sub_1CAEDBE5C(0x286E696B63656863, 0xE900000000000029, &v12);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "FAOSUpdatedActivity %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v6 = (_QWORD *)(v0[5] + OBJC_IVAR___FAOSUpdatedActivity_scheduler);
  v7 = v6[3];
  v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  v11 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v8 + 32) + *(_QWORD *)(v8 + 32));
  v9 = (_QWORD *)swift_task_alloc();
  v0[7] = v9;
  *v9 = v0;
  v9[1] = sub_1CAEDAAAC;
  return v11(v7, v8);
}

uint64_t sub_1CAEDAAAC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 64) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  else
    return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAEDAB18()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  v1 = *(void **)(v0 + 64);
  v2 = v1;
  v3 = v1;
  v4 = sub_1CAF202C8();
  v5 = sub_1CAF206AC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 64);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v7 = 136315138;
    v14 = v8;
    *(_QWORD *)(v0 + 16) = v6;
    v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    v10 = sub_1CAF20454();
    *(_QWORD *)(v0 + 24) = sub_1CAEDBE5C(v10, v11, &v14);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1CAEBA000, v4, v5, "FAOSUpdatedActivity failed to schedule: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v8, -1, -1);
    MEMORY[0x1D179A698](v7, -1, -1);

  }
  else
  {
    v12 = *(void **)(v0 + 64);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEDADE8(const void *a1, void *a2)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  v4 = a2;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1CAEDAE60;
  v5[5] = v4;
  return swift_task_switch();
}

uint64_t sub_1CAEDAE60()
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

Swift::Void __swiftcall FAOSUpdatedActivity.unregister()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = v0;
  if (qword_1EF98FBC8 != -1)
    swift_once();
  v2 = sub_1CAF202E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1EF98FD50);
  v3 = sub_1CAF202C8();
  v4 = sub_1CAF206A0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    v6 = swift_slowAlloc();
    v10 = v6;
    *(_DWORD *)v5 = 136315138;
    sub_1CAEDBE5C(0x7473696765726E75, 0xEC00000029287265, &v10);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v3, v4, "FAOSUpdatedActivity %s", v5, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v6, -1, -1);
    MEMORY[0x1D179A698](v5, -1, -1);
  }

  v7 = (_QWORD *)(v1 + OBJC_IVAR___FAOSUpdatedActivity_scheduler);
  v8 = *(_QWORD *)(v1 + OBJC_IVAR___FAOSUpdatedActivity_scheduler + 24);
  v9 = v7[4];
  __swift_project_boxed_opaque_existential_1(v7, v8);
  (*(void (**)(uint64_t, uint64_t))(v9 + 40))(v8, v9);
}

void __swiftcall FAOSUpdatedActivity.init()(FAOSUpdatedActivity *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void FAOSUpdatedActivity.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

const char *sub_1CAEDB138()
{
  return "com.apple.family.osupdate.activity";
}

uint64_t (*sub_1CAEDB14C())(uint64_t a1)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  swift_retain();
  return sub_1CAEDC740;
}

uint64_t sub_1CAEDB1A4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CAF20658();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a2;
  v10[6] = a3;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  swift_retain();
  swift_retain();
  if ((_DWORD)a2 == 1)
  {
    sub_1CAEDCD2C((uint64_t)v7);
  }
  else
  {
    sub_1CAF2064C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (v10[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = sub_1CAF205EC();
      v13 = v12;
      swift_unknownObjectRelease();
      if (v13 | v11)
      {
        v15[0] = 0;
        v15[1] = 0;
        v15[2] = v11;
        v15[3] = v13;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1CAEDB370(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  return swift_task_switch();
}

uint64_t sub_1CAEDB38C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(void);
  uint64_t v15;

  if (XPCActivity.shouldDefer()())
  {
    if (qword_1EF98FBC8 != -1)
      swift_once();
    v1 = sub_1CAF202E0();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EF98FD50);
    v2 = sub_1CAF202C8();
    v3 = sub_1CAF206A0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      v5 = swift_slowAlloc();
      v15 = v5;
      *(_DWORD *)v4 = 136315138;
      *(_QWORD *)(v0 + 24) = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2A170, &v15);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v2, v3, "FAOSUpdatedActivity %s - deferring activityBlock", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v5, -1, -1);
      MEMORY[0x1D179A698](v4, -1, -1);
    }

    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    if (qword_1EF98FBC8 != -1)
      swift_once();
    v7 = sub_1CAF202E0();
    __swift_project_value_buffer(v7, (uint64_t)qword_1EF98FD50);
    v8 = sub_1CAF202C8();
    v9 = sub_1CAF206A0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v15 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v0 + 16) = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2A170, &v15);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v8, v9, "FAOSUpdatedActivity %s - executing activityBlock", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v11, -1, -1);
      MEMORY[0x1D179A698](v10, -1, -1);
    }

    v14 = (uint64_t (*)(void))(**(int **)(v0 + 40) + *(_QWORD *)(v0 + 40));
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v12;
    *v12 = v0;
    v12[1] = sub_1CAEDB684;
    v6 = v14;
  }
  return v6();
}

uint64_t sub_1CAEDB684()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1CAEDB6F0()
{
  uint64_t v0;

  XPCActivity.done()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

__n128 sub_1CAEDB724@<Q0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  __n128 result;

  swift_beginAccess();
  v3 = *(_BYTE *)(v1 + 33);
  *(_BYTE *)a1 = *(_BYTE *)(v1 + 32);
  *(_BYTE *)(a1 + 1) = v3;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(v1 + 40);
  result = *(__n128 *)(v1 + 56);
  *(__n128 *)(a1 + 24) = result;
  return result;
}

__n128 sub_1CAEDB77C(char *a1)
{
  uint64_t v1;
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  __n128 result;
  __n128 v7;

  v2 = *a1;
  v3 = a1[1];
  v7 = *(__n128 *)(a1 + 8);
  v4 = *((_QWORD *)a1 + 3);
  v5 = *((_QWORD *)a1 + 4);
  swift_beginAccess();
  *(_BYTE *)(v1 + 32) = v2;
  *(_BYTE *)(v1 + 33) = v3;
  result = v7;
  *(__n128 *)(v1 + 40) = v7;
  *(_QWORD *)(v1 + 56) = v4;
  *(_QWORD *)(v1 + 64) = v5;
  return result;
}

uint64_t (*sub_1CAEDB7EC())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t FAOSUpdatedActivityProvider.deinit()
{
  uint64_t v0;

  swift_release();
  return v0;
}

uint64_t (*sub_1CAEDB84C())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t (*sub_1CAEDB888())(_QWORD *a1)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_1CAEDCEF4;
  *(_QWORD *)(v4 + 24) = v3;
  swift_retain();
  return sub_1CAEDCC88;
}

uint64_t (*sub_1CAEDB904())(uint64_t a1)
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *v0;
  v3 = v0[2];
  v2 = v0[3];
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = *(_QWORD *)(v1 + 80);
  v4[3] = *(_QWORD *)(v1 + 88);
  v4[4] = v3;
  v4[5] = v2;
  swift_retain();
  return sub_1CAEDC950;
}

uint64_t sub_1CAEDB970(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v18;

  v10 = *(_QWORD *)(a4 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78]();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78]();
  v13 = (char *)&v18 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1CAF20658();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v13, 1, 1, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a4);
  v15 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v16 = (char *)swift_allocObject();
  *((_QWORD *)v16 + 2) = 0;
  *((_QWORD *)v16 + 3) = 0;
  *((_QWORD *)v16 + 4) = a4;
  *((_QWORD *)v16 + 5) = a5;
  *((_QWORD *)v16 + 6) = a2;
  *((_QWORD *)v16 + 7) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v16[v15], (char *)&v18 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  swift_retain();
  sub_1CAF037B8((uint64_t)v13, (uint64_t)&unk_1EF991050, (uint64_t)v16);
  return swift_release();
}

uint64_t sub_1CAEDBAC0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  return swift_task_switch();
}

uint64_t sub_1CAEDBAE0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(void);
  uint64_t v9;

  if (qword_1EF98FBC8 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EF98FD50);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2A170, &v9);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "FAOSUpdatedBackgroundTaskProvider %s - executing activityBlock", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v8 = (uint64_t (*)(void))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v6;
  *v6 = v0;
  v6[1] = sub_1CAEDBC88;
  return v8();
}

uint64_t sub_1CAEDBC88()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1CAEDBCF4()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(*(_QWORD *)(v0 + 56) + 16))(*(_QWORD *)(v0 + 48));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t _s12FamilyCircle27FAOSUpdatedActivityProviderCfD_0()
{
  swift_release();
  return swift_deallocClassInstance();
}

const char *sub_1CAEDBD58()
{
  return "com.apple.family.osupdate.backgroundTask";
}

uint64_t (*sub_1CAEDBD6C())(uint64_t a1)
{
  sub_1CAEDB904();
  return sub_1CAEDC950;
}

uint64_t sub_1CAEDBD88(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_1CAEDBD98(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_1CAEDBDCC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1CAEDBDEC(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_1CAEDBE5C(v6, v7, a3);
  v8 = *a1 + 8;
  sub_1CAF2076C();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_1CAEDBE5C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1CAEDBF2C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1CAEDCD8C((uint64_t)v12, *a3);
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
      sub_1CAEDCD8C((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_1CAEDBF2C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1CAF20778();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1CAEDC0E4(a5, a6);
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
  v8 = sub_1CAF2082C();
  if (!v8)
  {
    sub_1CAF208B0();
    __break(1u);
LABEL_17:
    result = sub_1CAF208F8();
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

uint64_t sub_1CAEDC0E4(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1CAEDC178(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEDC2EC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1CAEDC2EC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1CAEDC178(uint64_t a1, unint64_t a2)
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
      v3 = sub_1CAEF49A8(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1CAF20808();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1CAF208B0();
      __break(1u);
LABEL_10:
      v2 = sub_1CAF204C0();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1CAF208F8();
    __break(1u);
LABEL_14:
    result = sub_1CAF208B0();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

uint64_t sub_1CAEDC2EC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE8C0);
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
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

_BYTE **sub_1CAEDC438(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

id sub_1CAEDC448(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  objc_super v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;

  LOBYTE(v17) = 9;
  v5 = v2;
  if ((_s12FamilyCircle0A12FeatureFlagsO7enabledySbACFZ_0((unsigned __int8 *)&v17) & 1) != 0)
  {
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = a1;
    *(_QWORD *)(v6 + 24) = a2;
    __swift_instantiateConcreteTypeFromMangledName(qword_1EF98FF20);
    v7 = swift_allocObject();
    *(_WORD *)(v7 + 32) = 1;
    *(_QWORD *)(v7 + 40) = 0;
    *(_QWORD *)(v7 + 48) = 0;
    *(_QWORD *)(v7 + 56) = 0;
    *(_QWORD *)(v7 + 64) = 3080;
    *(_QWORD *)(v7 + 16) = &unk_1EF991098;
    *(_QWORD *)(v7 + 24) = v6;
    v8 = (void *)objc_opt_self();
    swift_retain();
    swift_retain();
    v9 = objc_msgSend(v8, sel_sharedScheduler);
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FE88);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = v7;
    swift_release();
    v12 = sub_1CAEDCE8C(&qword_1EF98FE80, &qword_1EF98FE88, (uint64_t)&protocol conformance descriptor for SystemBackgroundTaskScheduler<A, B, C>);
  }
  else
  {
    v13 = swift_allocObject();
    *(_QWORD *)(v13 + 16) = a1;
    *(_QWORD *)(v13 + 24) = a2;
    type metadata accessor for FAOSUpdatedActivityProvider();
    v14 = swift_allocObject();
    *(_WORD *)(v14 + 32) = 1;
    *(_QWORD *)(v14 + 40) = 0;
    *(_QWORD *)(v14 + 48) = 0;
    *(_QWORD *)(v14 + 56) = 0;
    *(_QWORD *)(v14 + 64) = 3080;
    *(_QWORD *)(v14 + 16) = &unk_1EF991090;
    *(_QWORD *)(v14 + 24) = v13;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDA0);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = 0;
    *(_QWORD *)(v11 + 24) = v14;
    v12 = sub_1CAEDCE8C(&qword_1EF98FD98, &qword_1EF98FDA0, (uint64_t)&protocol conformance descriptor for XPCActivityScheduler<A>);
    swift_retain();
  }
  v18 = v10;
  v19 = v12;
  *(_QWORD *)&v17 = v11;
  sub_1CAEDCE74(&v17, (uint64_t)v5 + OBJC_IVAR___FAOSUpdatedActivity_scheduler);

  v16.receiver = v5;
  v16.super_class = (Class)FAOSUpdatedActivity;
  return objc_msgSendSuper2(&v16, sel_init);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D179A5B4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1CAEDC71C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEDC740(uint64_t a1)
{
  uint64_t v1;

  return sub_1CAEDB1A4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

_UNKNOWN **sub_1CAEDC748()
{
  return &protocol witness table for XPCActivity;
}

__n128 sub_1CAEDC754@<Q0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v4;
  __n128 result;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_BYTE *)(v3 + 33);
  *(_BYTE *)a2 = *(_BYTE *)(v3 + 32);
  *(_BYTE *)(a2 + 1) = v4;
  *(_OWORD *)(a2 + 8) = *(_OWORD *)(v3 + 40);
  result = *(__n128 *)(v3 + 56);
  *(__n128 *)(a2 + 24) = result;
  return result;
}

__n128 sub_1CAEDC7B0(char *a1, uint64_t *a2)
{
  char v2;
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __n128 result;
  __n128 v8;

  v2 = *a1;
  v3 = a1[1];
  v8 = *(__n128 *)(a1 + 8);
  v4 = *((_QWORD *)a1 + 3);
  v5 = *((_QWORD *)a1 + 4);
  v6 = *a2;
  swift_beginAccess();
  *(_BYTE *)(v6 + 32) = v2;
  *(_BYTE *)(v6 + 33) = v3;
  result = v8;
  *(__n128 *)(v6 + 40) = v8;
  *(_QWORD *)(v6 + 56) = v4;
  *(_QWORD *)(v6 + 64) = v5;
  return result;
}

unint64_t type metadata accessor for FAOSUpdatedActivity()
{
  unint64_t result;

  result = qword_1EF991040;
  if (!qword_1EF991040)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1EF991040);
  }
  return result;
}

uint64_t type metadata accessor for FAOSUpdatedActivityProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for FAOSUpdatedActivityProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FAOSUpdatedActivityProvider.activityName()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of FAOSUpdatedActivityProvider.activityHandler()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t dispatch thunk of FAOSUpdatedActivityProvider.criteria.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of FAOSUpdatedActivityProvider.criteria.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t dispatch thunk of FAOSUpdatedActivityProvider.criteria.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 136))();
}

uint64_t sub_1CAEDC8C8()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for FAOSUpdatedBackgroundTaskProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FAOSUpdatedBackgroundTaskProvider);
}

uint64_t sub_1CAEDC920(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(*(_QWORD *)(a2 + 88) + 8);
}

uint64_t sub_1CAEDC92C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEDC950(uint64_t a1)
{
  uint64_t *v1;

  return sub_1CAEDB970(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1CAEDC95C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CAEDC9D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v2 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  v3 = *(_OWORD *)(v0 + 48);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1CAEDCEDC;
  *(_OWORD *)(v2 + 48) = v4;
  *(_QWORD *)(v2 + 40) = v0 + ((v5 + 64) & ~v5);
  *(_OWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_1CAEDCA50()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1CAEDCA7C()
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
  v4[1] = sub_1CAEDCEDC;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EF991058 + dword_1EF991058))(v2, v3);
}

uint64_t sub_1CAEDCAE4()
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
  v5[1] = sub_1CAEDCEDC;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1EF991448 + dword_1EF991448))(v2, v3, v4);
}

uint64_t objectdestroy_16Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEDCB8C(uint64_t a1)
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
  v7[1] = sub_1CAEDCC10;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EF991450 + dword_1EF991450))(a1, v4, v5, v6);
}

uint64_t sub_1CAEDCC10()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAEDCC58()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1CAEDCC7C()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1CAEDCC88(_QWORD *a1)
{
  uint64_t v1;

  return sub_1CAEDF550(a1, *(uint64_t (**)(_QWORD))(v1 + 16));
}

uint64_t sub_1CAEDCC90()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEDCCC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_1CAEDCC10;
  *(_QWORD *)(v3 + 48) = v2;
  *(_OWORD *)(v3 + 32) = v4;
  return swift_task_switch();
}

uint64_t sub_1CAEDCD2C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1CAEDCD8C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CAEDCDCC()
{
  uint64_t v0;
  uint64_t v1;
  void (*v2)(void);
  _QWORD *v3;

  v2 = *(void (**)(void))(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCEDC;
  return ((uint64_t (*)(void (*)(void)))((char *)&dword_1EF991088 + dword_1EF991088))(v2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D179A5C0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1CAEDCE74(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t sub_1CAEDCE8C(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D179A5CC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CAEDCECC(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_1CAEDCEF8(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 16) = v3;
  *(_QWORD *)(v4 + 24) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAEDCF54()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1CAEDCF9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1CAEDCFEC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAEDD028(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  v2 = a1[1];
  v4 = *a2;
  swift_beginAccess();
  *(_QWORD *)(v4 + 32) = v3;
  *(_QWORD *)(v4 + 40) = v2;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAEDD084()
{
  uint64_t v0;
  uint64_t v1;

  swift_beginAccess();
  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1CAEDD0CC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  swift_beginAccess();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAEDD11C@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEDD31C(&OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteURL, a1);
}

uint64_t sub_1CAEDD128(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CAEDD170(uint64_t a1)
{
  return sub_1CAEDD374(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteURL);
}

uint64_t sub_1CAEDD17C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFB0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t (*sub_1CAEDD1C4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAEDD208()
{
  return sub_1CAEDD660(&OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteCode);
}

uint64_t sub_1CAEDD214(uint64_t a1, uint64_t a2)
{
  return sub_1CAEDD6BC(a1, a2, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteCode);
}

uint64_t (*sub_1CAEDD220())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1CAEDD264(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFB0);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAEDD128(a1, (uint64_t)v9);
  v10 = *a2 + *a5;
  swift_beginAccess();
  sub_1CAEDD17C((uint64_t)v9, v10);
  return swift_endAccess();
}

uint64_t sub_1CAEDD310@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEDD31C(&OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_iconURL, a1);
}

uint64_t sub_1CAEDD31C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a1;
  swift_beginAccess();
  return sub_1CAEDD128(v4, a2);
}

uint64_t sub_1CAEDD368(uint64_t a1)
{
  return sub_1CAEDD374(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_iconURL);
}

uint64_t sub_1CAEDD374(uint64_t a1, _QWORD *a2)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *a2;
  swift_beginAccess();
  sub_1CAEDD17C(a1, v4);
  return swift_endAccess();
}

uint64_t (*sub_1CAEDD3C8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAEDD40C()
{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_canEditRecipients);
  swift_beginAccess();
  return *v1;
}

uint64_t sub_1CAEDD450(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_canEditRecipients);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1CAEDD498())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAEDD4DC()
{
  return sub_1CAEDD660(&OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkTitle);
}

uint64_t sub_1CAEDD4E8(uint64_t a1, uint64_t a2)
{
  return sub_1CAEDD6BC(a1, a2, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkTitle);
}

uint64_t (*sub_1CAEDD4F4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAEDD538()
{
  return sub_1CAEDD660(&OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkSubtitle);
}

uint64_t sub_1CAEDD544(uint64_t a1, uint64_t a2)
{
  return sub_1CAEDD6BC(a1, a2, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkSubtitle);
}

uint64_t (*sub_1CAEDD550())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAEDD594()
{
  return sub_1CAEDD660(&OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageSubject);
}

uint64_t sub_1CAEDD5A0(uint64_t a1, uint64_t a2)
{
  return sub_1CAEDD6BC(a1, a2, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageSubject);
}

uint64_t (*sub_1CAEDD5AC())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAEDD5F0(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v6 = *a1;
  v5 = a1[1];
  v7 = (_QWORD *)(*a2 + *a5);
  swift_beginAccess();
  *v7 = v6;
  v7[1] = v5;
  swift_bridgeObjectRetain();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAEDD654()
{
  return sub_1CAEDD660(&OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageBodyHTML);
}

uint64_t sub_1CAEDD660(_QWORD *a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v2 = (uint64_t *)(v1 + *a1);
  swift_beginAccess();
  v3 = *v2;
  swift_bridgeObjectRetain();
  return v3;
}

uint64_t sub_1CAEDD6B0(uint64_t a1, uint64_t a2)
{
  return sub_1CAEDD6BC(a1, a2, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageBodyHTML);
}

uint64_t sub_1CAEDD6BC(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  _QWORD *v6;

  v6 = (_QWORD *)(v3 + *a3);
  swift_beginAccess();
  *v6 = a1;
  v6[1] = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*sub_1CAEDD714())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

_QWORD *FAGuardianInviteModel.__allocating_init(with:)(uint64_t a1)
{
  swift_allocObject();
  return FAGuardianInviteModel.init(with:)(a1);
}

_QWORD *FAGuardianInviteModel.init(with:)(uint64_t a1)
{
  _QWORD *v1;
  _QWORD *v2;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  char v30;
  _QWORD *v31;
  char v32;
  char *v33;
  void *v34;
  char v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  id v40;
  id v41;
  NSObject *v42;
  os_log_type_t v43;
  uint64_t v44;
  uint8_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  uint64_t v50;
  uint8_t *v51;
  int v52;
  _QWORD *result;
  uint64_t v54;
  char v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t v65;
  _QWORD *v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  _QWORD *v80;
  int v81;
  int v82;
  _QWORD *v83;
  uint64_t v84;
  int v85;
  uint64_t v86;
  uint64_t v87[4];

  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFB0);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v81 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (uint64_t)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteURL;
  v7 = sub_1CAF200D0();
  v8 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56);
  v8(v6, 1, 1, v7);
  v9 = (uint64_t)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_iconURL;
  v8((uint64_t)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_iconURL, 1, 1, v7);
  if (!*(_QWORD *)(a1 + 16) || (v10 = sub_1CAEDE240(0), (v11 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v35 = 0;
    v86 = 0;
    v85 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    goto LABEL_21;
  }
  v12 = (_QWORD *)(*(_QWORD *)(a1 + 56) + 16 * v10);
  v13 = v12[1];
  v2[2] = *v12;
  v2[3] = v13;
  v14 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v14 || (v15 = sub_1CAEDE240(1), (v16 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v85 = 0;
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v35 = 1;
    v86 = 1;
    goto LABEL_21;
  }
  v17 = (_QWORD *)(*(_QWORD *)(a1 + 56) + 16 * v15);
  v18 = v17[1];
  v2[4] = *v17;
  v2[5] = v18;
  v19 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v19 || (sub_1CAEDE240(2), (v20 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v85 = 0;
    LODWORD(v86) = 1;
    v35 = 2;
LABEL_20:
    HIDWORD(v86) = 1;
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  sub_1CAF200C4();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_1CAEDD17C((uint64_t)v5, v6);
  swift_endAccess();
  if (!*(_QWORD *)(a1 + 16) || (v21 = sub_1CAEDE240(3), (v22 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v36 = 0;
    v37 = 0;
    v38 = 0;
    v85 = 0;
    LODWORD(v86) = 1;
    v35 = 3;
    goto LABEL_20;
  }
  v23 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v21);
  v25 = *v23;
  v24 = v23[1];
  v26 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteCode);
  *v26 = v25;
  v26[1] = v24;
  v27 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v27 || (sub_1CAEDE240(4), (v28 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v36 = 0;
    v37 = 0;
    v38 = 0;
    LODWORD(v86) = 1;
    v35 = 4;
LABEL_53:
    HIDWORD(v86) = 1;
    v85 = 1;
    goto LABEL_21;
  }
  swift_bridgeObjectRetain();
  sub_1CAF200C4();
  swift_bridgeObjectRelease();
  swift_beginAccess();
  sub_1CAEDD17C((uint64_t)v5, v9);
  swift_endAccess();
  if (!*(_QWORD *)(a1 + 16) || (v29 = sub_1CAEDE240(5), (v30 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v36 = 0;
    v37 = 0;
    v38 = 0;
    LODWORD(v86) = 1;
    v35 = 5;
    goto LABEL_53;
  }
  v31 = (_QWORD *)(*(_QWORD *)(a1 + 56) + 16 * v29);
  if (*v31 == 1702195828 && v31[1] == 0xE400000000000000)
    v32 = 1;
  else
    v32 = sub_1CAF209A0();
  *((_BYTE *)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_canEditRecipients) = v32 & 1;
  if (!*(_QWORD *)(a1 + 16) || (v54 = sub_1CAEDE240(6), (v55 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v36 = 0;
    v37 = 0;
    v38 = 0;
    LODWORD(v86) = 1;
    v35 = 6;
    goto LABEL_53;
  }
  v56 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v54);
  v58 = *v56;
  v57 = v56[1];
  v59 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkTitle);
  *v59 = v58;
  v59[1] = v57;
  v60 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v60 || (v61 = sub_1CAEDE240(7), (v62 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v37 = 0;
    v38 = 0;
    v35 = 7;
    v86 = 0x100000001;
    v85 = 1;
LABEL_55:
    v36 = 1;
    goto LABEL_21;
  }
  v63 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v61);
  v65 = *v63;
  v64 = v63[1];
  v66 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkSubtitle);
  *v66 = v65;
  v66[1] = v64;
  v67 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v67 || (v68 = sub_1CAEDE240(8), (v69 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v38 = 0;
    v35 = 8;
    v86 = 0x100000001;
    v85 = 1;
    v36 = 1;
    v37 = 1;
LABEL_21:
    *v33 = v35;
    swift_willThrow();
    swift_bridgeObjectRelease();
    if (qword_1ECFCE888 != -1)
      swift_once();
    v39 = sub_1CAF202E0();
    __swift_project_value_buffer(v39, (uint64_t)qword_1ECFCE8A8);
    v40 = v34;
    v41 = v34;
    v42 = sub_1CAF202C8();
    v43 = sub_1CAF206AC();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = swift_slowAlloc();
      v81 = v36;
      v45 = (uint8_t *)v44;
      v46 = swift_slowAlloc();
      v84 = v9;
      v47 = v46;
      v87[0] = v46;
      v82 = v37;
      *(_DWORD *)v45 = 136315138;
      v83 = v2;
      swift_getErrorValue();
      v48 = sub_1CAF209DC();
      v87[3] = sub_1CAEDBE5C(v48, v49, v87);
      v37 = v82;
      sub_1CAF2076C();
      swift_bridgeObjectRelease();

      _os_log_impl(&dword_1CAEBA000, v42, v43, "%s", v45, 0xCu);
      swift_arrayDestroy();
      v50 = v47;
      v9 = v84;
      MEMORY[0x1D179A698](v50, -1, -1);
      v51 = v45;
      v36 = v81;
      MEMORY[0x1D179A698](v51, -1, -1);

    }
    else
    {

    }
    v52 = v85;
    if ((v86 & 1) != 0)
      swift_bridgeObjectRelease();
    if (HIDWORD(v86))
      swift_bridgeObjectRelease();
    sub_1CAEDE2E4(v6);
    if (v52)
      swift_bridgeObjectRelease();
    sub_1CAEDE2E4(v9);
    if (v36)
    {
      swift_bridgeObjectRelease();
      if (!v37)
      {
LABEL_34:
        if (!v38)
        {
LABEL_36:
          type metadata accessor for FAGuardianInviteModel();
          swift_deallocPartialClassInstance();
          return 0;
        }
LABEL_35:
        swift_bridgeObjectRelease();
        goto LABEL_36;
      }
    }
    else if (!v37)
    {
      goto LABEL_34;
    }
    swift_bridgeObjectRelease();
    if (!v38)
      goto LABEL_36;
    goto LABEL_35;
  }
  v70 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v68);
  v72 = *v70;
  v71 = v70[1];
  v73 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageSubject);
  *v73 = v72;
  v73[1] = v71;
  v74 = *(_QWORD *)(a1 + 16);
  swift_bridgeObjectRetain();
  if (!v74 || (v75 = sub_1CAEDE240(9), (v76 & 1) == 0))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910A0);
    sub_1CAEDE298();
    v34 = (void *)swift_allocError();
    v35 = 9;
    v86 = 0x100000001;
    v85 = 1;
    v37 = 1;
    v38 = 1;
    goto LABEL_55;
  }
  v77 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v75);
  v79 = *v77;
  v78 = v77[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  result = v2;
  v80 = (_QWORD *)((char *)v2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageBodyHTML);
  *v80 = v79;
  v80[1] = v78;
  return result;
}

uint64_t FAGuardianInviteModel.deinit()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1CAEDE2E4(v0 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteURL);
  swift_bridgeObjectRelease();
  sub_1CAEDE2E4(v0 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_iconURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t FAGuardianInviteModel.__deallocating_deinit()
{
  FAGuardianInviteModel.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_1CAEDE164(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1CAF20A18();
  sub_1CAF20490();
  v4 = sub_1CAF20A30();
  return sub_1CAEDE9B8(a1, a2, v4);
}

uint64_t sub_1CAEDE1C8(uint64_t a1)
{
  uint64_t v2;

  sub_1CAF20A18();
  FamilyFeatureFlags.rawValue.getter();
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  v2 = sub_1CAF20A30();
  return sub_1CAEDEA98(a1, v2);
}

uint64_t sub_1CAEDE240(uint64_t a1)
{
  uint64_t v2;
  _BYTE v4[72];

  sub_1CAF20A18();
  sub_1CAF17850((uint64_t)v4, a1);
  v2 = sub_1CAF20A30();
  return sub_1CAEDEE8C(a1, v2);
}

unint64_t sub_1CAEDE298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF9910A8;
  if (!qword_1EF9910A8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF9910A0);
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for MissingRequiredKey<A>, v1);
    atomic_store(result, (unint64_t *)&qword_1EF9910A8);
  }
  return result;
}

uint64_t sub_1CAEDE2E4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for FAGuardianInviteModel()
{
  uint64_t result;

  result = qword_1EF9910B0;
  if (!qword_1EF9910B0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CAEDE360@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  *a2 = *(_QWORD *)(v3 + 16);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CAEDE3AC@<X0>(uint64_t *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 40);
  *a2 = *(_QWORD *)(v3 + 32);
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CAEDE3F8@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteURL, a2);
}

uint64_t sub_1CAEDE404(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAEDD264(a1, a2, a3, a4, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteURL);
}

uint64_t sub_1CAEDE420@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteCode, a2);
}

uint64_t sub_1CAEDE42C(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAEDD5F0(a1, a2, a3, a4, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_inviteCode);
}

uint64_t sub_1CAEDE448@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return keypath_get_3Tm(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_iconURL, a2);
}

uint64_t keypath_get_3Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, uint64_t a3@<X8>)
{
  uint64_t v4;

  v4 = *a1 + *a2;
  swift_beginAccess();
  return sub_1CAEDD128(v4, a3);
}

uint64_t sub_1CAEDE4A4(uint64_t a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAEDD264(a1, a2, a3, a4, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_iconURL);
}

uint64_t sub_1CAEDE4C0@<X0>(_QWORD *a1@<X0>, _BYTE *a2@<X8>)
{
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(*a1 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_canEditRecipients);
  result = swift_beginAccess();
  *a2 = *v3;
  return result;
}

uint64_t sub_1CAEDE510(char *a1, _QWORD *a2)
{
  char v2;
  _BYTE *v3;
  uint64_t result;

  v2 = *a1;
  v3 = (_BYTE *)(*a2 + OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_canEditRecipients);
  result = swift_beginAccess();
  *v3 = v2;
  return result;
}

uint64_t sub_1CAEDE55C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkTitle, a2);
}

uint64_t sub_1CAEDE568(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAEDD5F0(a1, a2, a3, a4, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkTitle);
}

uint64_t sub_1CAEDE584@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkSubtitle, a2);
}

uint64_t sub_1CAEDE590(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAEDD5F0(a1, a2, a3, a4, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailLinkSubtitle);
}

uint64_t sub_1CAEDE5AC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageSubject, a2);
}

uint64_t sub_1CAEDE5B8(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAEDD5F0(a1, a2, a3, a4, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageSubject);
}

uint64_t sub_1CAEDE5D4@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_get_5Tm(a1, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageBodyHTML, a2);
}

uint64_t keypath_get_5Tm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(*a1 + *a2);
  swift_beginAccess();
  v5 = v4[1];
  *a3 = *v4;
  a3[1] = v5;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1CAEDE630(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAEDD5F0(a1, a2, a3, a4, &OBJC_IVAR____TtC12FamilyCircle21FAGuardianInviteModel_mailMessageBodyHTML);
}

uint64_t sub_1CAEDE64C()
{
  return type metadata accessor for FAGuardianInviteModel();
}

void sub_1CAEDE654()
{
  unint64_t v0;

  sub_1CAEDE85C();
  if (v0 <= 0x3F)
    swift_updateClassMetadata2();
}

uint64_t method lookup function for FAGuardianInviteModel()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FAGuardianInviteModel.title.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.title.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.title.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 176))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.subtitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.subtitle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 192))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.subtitle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 200))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.inviteURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 208))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.inviteURL.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 216))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.inviteURL.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 224))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.inviteCode.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 232))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.inviteCode.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.inviteCode.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.iconURL.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.iconURL.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 264))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.iconURL.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 272))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.canEditRecipients.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 280))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.canEditRecipients.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 288))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.canEditRecipients.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 296))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailLinkTitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 304))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailLinkTitle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 312))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailLinkTitle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 320))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailLinkSubtitle.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 328))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailLinkSubtitle.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 336))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailLinkSubtitle.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 344))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailMessageSubject.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 352))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailMessageSubject.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 360))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailMessageSubject.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 368))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailMessageBodyHTML.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 376))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailMessageBodyHTML.setter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 384))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.mailMessageBodyHTML.modify()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 392))();
}

uint64_t dispatch thunk of FAGuardianInviteModel.__allocating_init(with:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 400))();
}

void sub_1CAEDE85C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF9910C0)
  {
    sub_1CAF200D0();
    v0 = sub_1CAF20754();
    if (!v1)
      atomic_store(v0, &qword_1EF9910C0);
  }
}

unint64_t sub_1CAEDE8B0(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1CAF207D8();
  return sub_1CAEDF20C(a1, v2);
}

unint64_t sub_1CAEDE8E0(uint64_t a1)
{
  uint64_t v2;

  sub_1CAF20A18();
  sub_1CAF20A24();
  v2 = sub_1CAF20A30();
  return sub_1CAEDF2D0(a1, v2);
}

unint64_t sub_1CAEDE938(uint64_t a1)
{
  uint64_t v2;

  sub_1CAF20400();
  sub_1CAF20A18();
  sub_1CAF20490();
  v2 = sub_1CAF20A30();
  swift_bridgeObjectRelease();
  return sub_1CAEDF36C(a1, v2);
}

unint64_t sub_1CAEDE9B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_1CAF209A0() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_1CAF209A0() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1CAEDEA98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

uint64_t sub_1CAEDEE8C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  v3 = a2 & ~(-1 << *(_BYTE *)(v2 + 32));
  if (((*(_QWORD *)(v2 + 64 + ((v3 >> 3) & 0xFFFFFFFFFFFFF8)) >> v3) & 1) != 0)
    __asm { BR              X9 }
  return a2 & ~(-1 << *(_BYTE *)(v2 + 32));
}

unint64_t sub_1CAEDF20C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v6;
  char v7;
  _BYTE v9[40];

  v3 = -1 << *(_BYTE *)(v2 + 32);
  v4 = a2 & ~v3;
  if (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0)
  {
    v6 = ~v3;
    do
    {
      sub_1CAEDF4E0(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x1D1799A68](v9, a1);
      sub_1CAEDF51C((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

unint64_t sub_1CAEDF2D0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  unint64_t result;
  uint64_t v7;
  uint64_t v8;

  v4 = v2 + 64;
  v5 = -1 << *(_BYTE *)(v2 + 32);
  result = a2 & ~v5;
  if (((*(_QWORD *)(v2 + 64 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0)
  {
    v7 = *(_QWORD *)(v2 + 48);
    if (*(_QWORD *)(v7 + 8 * result) != a1)
    {
      v8 = ~v5;
      for (result = (result + 1) & v8;
            ((*(_QWORD *)(v4 + ((result >> 3) & 0xFFFFFFFFFFFFF8)) >> result) & 1) != 0;
            result = (result + 1) & v8)
      {
        if (*(_QWORD *)(v7 + 8 * result) == a1)
          break;
      }
    }
  }
  return result;
}

unint64_t sub_1CAEDF36C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_1CAF20400();
    v8 = v7;
    if (v6 == sub_1CAF20400() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_1CAF209A0();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_1CAF20400();
          v15 = v14;
          if (v13 == sub_1CAF20400() && v15 == v16)
            break;
          v18 = sub_1CAF209A0();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

uint64_t sub_1CAEDF4E0(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_1CAEDF51C(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x1E0DEC198] - 8) + 8))();
  return a1;
}

uint64_t sub_1CAEDF550(_QWORD *a1, uint64_t (*a2)(_QWORD))
{
  return a2(*a1);
}

uint64_t sub_1CAEDF574(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD v15[4];

  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78]();
  v7 = (char *)v15 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CAF20658();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(v7, 1, 1, v8);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a1;
  v10[5] = a2;
  v10[6] = a3;
  LODWORD(a2) = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8);
  swift_retain();
  swift_retain();
  if ((_DWORD)a2 == 1)
  {
    sub_1CAEDCD2C((uint64_t)v7);
  }
  else
  {
    sub_1CAF2064C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v7, v8);
    if (v10[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v11 = sub_1CAF205EC();
      v13 = v12;
      swift_unknownObjectRelease();
      if (v13 | v11)
      {
        v15[0] = 0;
        v15[1] = 0;
        v15[2] = v11;
        v15[3] = v13;
      }
    }
  }
  swift_task_create();
  return swift_release();
}

uint64_t sub_1CAEDF740(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[5] = a5;
  v6[6] = a6;
  v6[4] = a4;
  return swift_task_switch();
}

uint64_t sub_1CAEDF75C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t (*v6)(void);
  uint64_t v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t (*v14)(void);
  uint64_t v15;

  if (XPCActivity.shouldDefer()())
  {
    if (qword_1ECFCE740 != -1)
      swift_once();
    v1 = sub_1CAF202E0();
    __swift_project_value_buffer(v1, (uint64_t)qword_1ECFCE720);
    v2 = sub_1CAF202C8();
    v3 = sub_1CAF206A0();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      v5 = swift_slowAlloc();
      v15 = v5;
      *(_DWORD *)v4 = 136315138;
      *(_QWORD *)(v0 + 24) = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2A170, &v15);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v2, v3, "FAFamilyFetchActivityScheduler %s - defering fetchBlock", v4, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v5, -1, -1);
      MEMORY[0x1D179A698](v4, -1, -1);
    }

    v6 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    if (qword_1ECFCE740 != -1)
      swift_once();
    v7 = sub_1CAF202E0();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ECFCE720);
    v8 = sub_1CAF202C8();
    v9 = sub_1CAF206A0();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      v11 = swift_slowAlloc();
      v15 = v11;
      *(_DWORD *)v10 = 136315138;
      *(_QWORD *)(v0 + 16) = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2A170, &v15);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v8, v9, "FAFamilyFetchActivityScheduler %s - executing fetchBlock", v10, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v11, -1, -1);
      MEMORY[0x1D179A698](v10, -1, -1);
    }

    v14 = (uint64_t (*)(void))(**(int **)(v0 + 40) + *(_QWORD *)(v0 + 40));
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v12;
    *v12 = v0;
    v12[1] = sub_1CAEDB684;
    v6 = v14;
  }
  return v6();
}

uint64_t type metadata accessor for FAFamilyFetchActivityProvider()
{
  return objc_opt_self();
}

const char *sub_1CAEDFA74()
{
  return "com.apple.family.cache.refresh";
}

uint64_t (*sub_1CAEDFA88())(_QWORD *a1)
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = swift_allocObject();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = swift_allocObject();
  *(_QWORD *)(v4 + 16) = sub_1CAEDFB28;
  *(_QWORD *)(v4 + 24) = v3;
  swift_retain();
  return sub_1CAEDFB30;
}

uint64_t sub_1CAEDFB04()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEDFB28(uint64_t a1)
{
  uint64_t v1;

  return sub_1CAEDF574(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t sub_1CAEDFB30(_QWORD *a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD))(v1 + 16))(*a1);
}

uint64_t sub_1CAEDFB54()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEDFB88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_1CAEDCC10;
  *(_QWORD *)(v3 + 48) = v2;
  *(_OWORD *)(v3 + 32) = v4;
  return swift_task_switch();
}

FamilyCircle::UnsatisfiedError __swiftcall UnsatisfiedError.init()()
{
  _QWORD *v0;
  FamilyCircle::UnsatisfiedError result;

  *v0 = 0xD000000000000015;
  v0[1] = 0x80000001CAF2A520;
  v0[2] = 0xD000000000000010;
  v0[3] = 0x80000001CAF2A540;
  return result;
}

uint64_t sub_1CAEDFC30()
{
  return 1;
}

uint64_t _s12FamilyCircle19AuthKitFeatureFlagsO9hashValueSivg_0()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

uint64_t sub_1CAEDFC78()
{
  return sub_1CAF20A24();
}

uint64_t sub_1CAEDFC9C()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

uint64_t waitWithPollingBlock<A>(iterations:waitFor:maxTotalTime:block:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v10;

  v8[9] = a8;
  v8[10] = v10;
  v8[7] = a6;
  v8[8] = a7;
  v8[5] = a4;
  v8[6] = a5;
  v8[3] = a2;
  v8[4] = a3;
  v8[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CAEDFD08()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _QWORD *v8;

  v1 = v0[9];
  v2 = v0[10];
  v3 = v0[8];
  v5 = v0[4];
  v4 = v0[5];
  v6 = v0[3];
  v7 = (_QWORD *)swift_allocObject();
  v0[11] = v7;
  v7[2] = v2;
  v7[3] = v6;
  v7[4] = v3;
  v7[5] = v1;
  v7[6] = v5;
  v7[7] = v4;
  swift_retain();
  v8 = (_QWORD *)swift_task_alloc();
  v0[12] = v8;
  *v8 = v0;
  v8[1] = sub_1CAEDFDC8;
  return sub_1CAF201F0();
}

uint64_t sub_1CAEDFDC8()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 104) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAEDFE3C()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEDFE70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v6[21] = a5;
  v6[22] = a6;
  v6[19] = a3;
  v6[20] = a4;
  v6[17] = a1;
  v6[18] = a2;
  v7 = sub_1CAF2061C();
  v6[23] = v7;
  v6[24] = *(_QWORD *)(v7 - 8);
  v6[25] = swift_task_alloc();
  v8 = sub_1CAF20874();
  v6[26] = v8;
  v6[27] = *(_QWORD *)(v8 - 8);
  v6[28] = swift_task_alloc();
  v6[29] = swift_task_alloc();
  v9 = sub_1CAF2088C();
  v6[30] = v9;
  v6[31] = *(_QWORD *)(v9 - 8);
  v6[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CAEDFF38()
{
  uint64_t v0;
  uint64_t v1;
  BOOL v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v11)(_QWORD);
  uint64_t v12;

  v1 = *(_QWORD *)(v0 + 144);
  v2 = __OFSUB__(v1, 1);
  v3 = v1 - 1;
  *(_QWORD *)(v0 + 264) = v3;
  if (v2)
  {
    __break(1u);
  }
  else if ((v3 & 0x8000000000000000) == 0)
  {
    if (qword_1ECFCE888 == -1)
      goto LABEL_4;
    goto LABEL_9;
  }
  __break(1u);
LABEL_9:
  swift_once();
LABEL_4:
  *(_QWORD *)(v0 + 272) = 0;
  v4 = sub_1CAF202E0();
  *(_QWORD *)(v0 + 280) = __swift_project_value_buffer(v4, (uint64_t)qword_1ECFCE8A8);
  v5 = sub_1CAF202C8();
  v6 = sub_1CAF206B8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v12 = v8;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v7 + 4) = sub_1CAEDBE5C(0xD00000000000003CLL, 0x80000001CAF2A5B0, &v12);
    *(_WORD *)(v7 + 12) = 2048;
    *(_QWORD *)(v7 + 14) = 0;
    _os_log_impl(&dword_1CAEBA000, v5, v6, "%s calling block for %ld time", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v8, -1, -1);
    MEMORY[0x1D179A698](v7, -1, -1);
  }

  v11 = (uint64_t (*)(_QWORD))(**(int **)(v0 + 152) + *(_QWORD *)(v0 + 152));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 288) = v9;
  *v9 = v0;
  v9[1] = sub_1CAEE00EC;
  return v11(*(_QWORD *)(v0 + 136));
}

uint64_t sub_1CAEE00EC()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 296) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAEE0190()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = *v1;
  *(_QWORD *)(*v1 + 320) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2 + 304))(*(_QWORD *)(v2 + 232), *(_QWORD *)(v2 + 208));
  }
  else
  {
    v4 = *(_QWORD *)(v2 + 248);
    v3 = *(_QWORD *)(v2 + 256);
    v5 = *(_QWORD *)(v2 + 240);
    (*(void (**)(_QWORD, _QWORD))(v2 + 304))(*(_QWORD *)(v2 + 232), *(_QWORD *)(v2 + 208));
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

void sub_1CAEE0230()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  void (*v9)(_QWORD);
  uint64_t v10;

  v1 = *(_QWORD *)(v0 + 272);
  if (v1 == *(_QWORD *)(v0 + 264))
  {
    sub_1CAEE0DD0();
    swift_allocError();
    swift_willThrow();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    (*(void (**)(void))(v0 + 8))();
  }
  else
  {
    v2 = v1 + 1;
    if (__OFADD__(v1, 1))
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v0 + 272) = v2;
      v3 = sub_1CAF202E0();
      *(_QWORD *)(v0 + 280) = __swift_project_value_buffer(v3, (uint64_t)qword_1ECFCE8A8);
      v4 = sub_1CAF202C8();
      v5 = sub_1CAF206B8();
      if (os_log_type_enabled(v4, v5))
      {
        v6 = swift_slowAlloc();
        v7 = swift_slowAlloc();
        v10 = v7;
        *(_DWORD *)v6 = 136315394;
        *(_QWORD *)(v6 + 4) = sub_1CAEDBE5C(0xD00000000000003CLL, 0x80000001CAF2A5B0, &v10);
        *(_WORD *)(v6 + 12) = 2048;
        *(_QWORD *)(v6 + 14) = v2;
        _os_log_impl(&dword_1CAEBA000, v4, v5, "%s calling block for %ld time", (uint8_t *)v6, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v7, -1, -1);
        MEMORY[0x1D179A698](v6, -1, -1);
      }

      v9 = (void (*)(_QWORD))(**(int **)(v0 + 152) + *(_QWORD *)(v0 + 152));
      v8 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 288) = v8;
      *v8 = v0;
      v8[1] = sub_1CAEE00EC;
      v9(*(_QWORD *)(v0 + 136));
    }
  }
}

uint64_t sub_1CAEE042C()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 296);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 248) + 8))(*(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 240));

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1CAEE04A4()
{
  uint64_t v0;
  void *v1;
  id v2;
  NSObject *v3;
  os_log_type_t v4;
  _BOOL4 v5;
  void *v6;
  uint8_t *v7;
  void *v8;
  id v9;
  int v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  _BOOL4 v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  _QWORD *v42;
  void (*v43)(_QWORD);
  uint64_t v44[2];

  v1 = *(void **)(v0 + 296);
  *(_QWORD *)(v0 + 112) = v1;
  v2 = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
  if ((swift_dynamicCast() & 1) != 0)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 192) + 8))(*(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 184));
    v3 = sub_1CAF202C8();
    v4 = sub_1CAF206B8();
    v5 = os_log_type_enabled(v3, v4);
    v6 = *(void **)(v0 + 296);
    if (v5)
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1CAEBA000, v3, v4, "waitWithPollingBlock caught cancelled/timeout", v7, 2u);
      MEMORY[0x1D179A698](v7, -1, -1);

    }
    else
    {

    }
    v27 = *(_QWORD *)(v0 + 272);
    if (v27 == *(_QWORD *)(v0 + 264))
    {
      sub_1CAEE0DD0();
      swift_allocError();
      swift_willThrow();
LABEL_11:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      (*(void (**)(void))(v0 + 8))();
      return;
    }
    v29 = v27 + 1;
    if (__OFADD__(v27, 1))
    {
      __break(1u);
    }
    else
    {
      *(_QWORD *)(v0 + 272) = v29;
      v30 = sub_1CAF202E0();
      *(_QWORD *)(v0 + 280) = __swift_project_value_buffer(v30, (uint64_t)qword_1ECFCE8A8);
      v31 = sub_1CAF202C8();
      v32 = sub_1CAF206B8();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = swift_slowAlloc();
        v34 = swift_slowAlloc();
        v44[0] = v34;
        *(_DWORD *)v33 = 136315394;
        *(_QWORD *)(v33 + 4) = sub_1CAEDBE5C(0xD00000000000003CLL, 0x80000001CAF2A5B0, v44);
        *(_WORD *)(v33 + 12) = 2048;
        *(_QWORD *)(v33 + 14) = v29;
        _os_log_impl(&dword_1CAEBA000, v31, v32, "%s calling block for %ld time", (uint8_t *)v33, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v34, -1, -1);
        MEMORY[0x1D179A698](v33, -1, -1);
      }

      v43 = (void (*)(_QWORD))(**(int **)(v0 + 152) + *(_QWORD *)(v0 + 152));
      v35 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 288) = v35;
      *v35 = v0;
      v35[1] = sub_1CAEE00EC;
      v43(*(_QWORD *)(v0 + 136));
    }
  }
  else
  {
    v8 = *(void **)(v0 + 296);
    *(_QWORD *)(v0 + 120) = v8;
    v9 = v8;
    v10 = swift_dynamicCast();
    v11 = *(void **)(v0 + 296);
    if (!v10)
    {
      v28 = v11;
      sub_1CAF1C254(v11);

      swift_willThrow();
      goto LABEL_11;
    }
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910F0);
    v12 = swift_allocObject();
    *(_OWORD *)(v12 + 16) = xmmword_1CAF24BC0;
    swift_getErrorValue();
    v13 = v11;
    v14 = v11;
    v15 = sub_1CAF209DC();
    v17 = v16;
    *(_QWORD *)(v12 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v12 + 64) = sub_1CAEE0D8C();
    *(_QWORD *)(v12 + 32) = v15;
    *(_QWORD *)(v12 + 40) = v17;
    v18 = sub_1CAF20418();
    v20 = v19;
    swift_bridgeObjectRetain();
    v21 = sub_1CAF202C8();
    v22 = sub_1CAF206AC();
    v23 = os_log_type_enabled(v21, v22);
    v24 = *(void **)(v0 + 296);
    if (v23)
    {
      v25 = swift_slowAlloc();
      v26 = swift_slowAlloc();
      v44[0] = v26;
      *(_DWORD *)v25 = 136315138;
      swift_bridgeObjectRetain();
      *(_QWORD *)(v25 + 4) = sub_1CAEDBE5C(v18, v20, v44);
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CAEBA000, v21, v22, "%s", (uint8_t *)v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v26, -1, -1);
      MEMORY[0x1D179A698](v25, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }

    v37 = *(_QWORD *)(v0 + 216);
    v36 = *(_QWORD *)(v0 + 224);
    v38 = *(_QWORD *)(v0 + 208);
    v40 = *(_QWORD *)(v0 + 168);
    v39 = *(_QWORD *)(v0 + 176);
    sub_1CAF20880();
    *(_QWORD *)(v0 + 96) = v40;
    *(_QWORD *)(v0 + 104) = v39;
    *(_QWORD *)(v0 + 80) = 0;
    *(_QWORD *)(v0 + 72) = 0;
    *(_BYTE *)(v0 + 88) = 1;
    sub_1CAEDA0CC(&qword_1EF991100, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0BA0], MEMORY[0x1E0DF0BB0]);
    sub_1CAF209C4();
    sub_1CAEDA0CC(&qword_1EF991108, (uint64_t (*)(uint64_t))MEMORY[0x1E0DF0B60], MEMORY[0x1E0DF0B90]);
    sub_1CAF20898();
    v41 = *(void (**)(uint64_t, uint64_t))(v37 + 8);
    *(_QWORD *)(v0 + 304) = v41;
    v41(v36, v38);
    v42 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 312) = v42;
    *v42 = v0;
    v42[1] = sub_1CAEE0190;
    sub_1CAF209D0();
  }
}

uint64_t sub_1CAEE0AF4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEE0B18(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v4 = v1[3];
  v5 = v1[4];
  v6 = v1[5];
  v8 = v1[6];
  v7 = v1[7];
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v9;
  *v9 = v2;
  v9[1] = sub_1CAEDCC10;
  return sub_1CAEDFE70(a1, v4, v5, v6, v8, v7);
}

uint64_t initializeBufferWithCopyOfBuffer for XPCActivity.Criteria(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for UnsatisfiedError()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for UnsatisfiedError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for UnsatisfiedError(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

_QWORD *assignWithTake for UnsatisfiedError(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for UnsatisfiedError(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for UnsatisfiedError(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for UnsatisfiedError()
{
  return &type metadata for UnsatisfiedError;
}

unint64_t sub_1CAEE0D8C()
{
  unint64_t result;

  result = qword_1EF9910F8;
  if (!qword_1EF9910F8)
  {
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0CB1A70], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF9910F8);
  }
  return result;
}

unint64_t sub_1CAEE0DD0()
{
  unint64_t result;

  result = qword_1EF991110;
  if (!qword_1EF991110)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF24CB8, &type metadata for PollingError);
    atomic_store(result, (unint64_t *)&qword_1EF991110);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for PollingError(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t storeEnumTagSinglePayload for PollingError(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1CAEE0EAC + 4 * byte_1CAF24BD0[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CAEE0ECC + 4 * byte_1CAF24BD5[v4]))();
}

_BYTE *sub_1CAEE0EAC(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CAEE0ECC(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CAEE0ED4(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CAEE0EDC(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CAEE0EE4(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CAEE0EEC(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1CAEE0EF8()
{
  return 0;
}

ValueMetadata *type metadata accessor for PollingError()
{
  return &type metadata for PollingError;
}

unint64_t sub_1CAEE0F18()
{
  unint64_t result;

  result = qword_1EF991118;
  if (!qword_1EF991118)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF24C90, &type metadata for PollingError);
    atomic_store(result, (unint64_t *)&qword_1EF991118);
  }
  return result;
}

Swift::Bool __swiftcall XPCActivity.shouldDefer()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  Swift::Bool should_defer;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  unint64_t v10;
  uint64_t v11;
  _xpc_activity_s *v12;
  _QWORD v14[2];
  _xpc_activity_s *v15;
  uint64_t v16;
  xpc_activity_t v17;

  v1 = v0;
  v2 = sub_1CAF202E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE780);
  sub_1CAF206E8();
  if (v17)
  {
    should_defer = xpc_activity_should_defer(v17);
    swift_unknownObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v0 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v2);
    swift_retain();
    v7 = sub_1CAF202C8();
    v8 = sub_1CAF206AC();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v15 = (_xpc_activity_s *)swift_slowAlloc();
      v17 = v15;
      *(_DWORD *)v9 = 136315138;
      v14[1] = v9 + 4;
      v11 = *(_QWORD *)(v1 + 24);
      v10 = *(_QWORD *)(v1 + 32);
      swift_bridgeObjectRetain();
      v16 = sub_1CAEDBE5C(v11, v10, (uint64_t *)&v17);
      sub_1CAF2076C();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v7, v8, "%s - shouldDefer called on invalidated XPCActivity", v9, 0xCu);
      v12 = v15;
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v12, -1, -1);
      MEMORY[0x1D179A698](v9, -1, -1);

    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return 0;
  }
  return should_defer;
}

Swift::Bool __swiftcall XPCActivity.done()()
{
  return sub_1CAEE3388((uint64_t)sub_1CAEE7358, 5, "%s - done called on invalidated XPCActivity");
}

uint64_t sub_1CAEE1198@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  v3 = *(_QWORD *)(a1 + 16);
  if (v3)
  {
    v4 = 0;
    v5 = (uint64_t *)(a1 + 32);
    do
    {
      v7 = *v5++;
      v6 = v7;
      if ((v7 & ~v4) == 0)
        v6 = 0;
      v4 |= v6;
      --v3;
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }
  result = swift_bridgeObjectRelease();
  *a2 = v4;
  return result;
}

_BYTE *XPCActivity.Criteria.init(priority:repeating:delay:gracePeriod:interval:options:)@<X0>(_BYTE *result@<X0>, char a2@<W1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t *a6@<X5>, uint64_t a7@<X8>)
{
  uint64_t v7;

  v7 = *a6;
  *(_BYTE *)a7 = *result;
  *(_BYTE *)(a7 + 1) = a2;
  *(_QWORD *)(a7 + 8) = a3;
  *(_QWORD *)(a7 + 16) = a4;
  *(_QWORD *)(a7 + 24) = a5;
  *(_QWORD *)(a7 + 32) = v7;
  return result;
}

uint64_t sub_1CAEE1208@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t result;

  result = MEMORY[0x1D179A740](v1 + 72);
  *a1 = result;
  return result;
}

uint64_t XPCActivity.__allocating_init(name:qos:logger:criteriaBlock:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v16;

  swift_allocObject();
  v16 = sub_1CAEE5E64(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  return v16;
}

uint64_t XPCActivity.init(name:qos:logger:criteriaBlock:handler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;

  v8 = sub_1CAEE5E64(a1, a2, a3, a4, a5, a6, a7, a8);
  swift_release();
  swift_release();
  return v8;
}

Swift::Void __swiftcall XPCActivity.unregister()()
{
  uint64_t v0;
  NSObject *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[6];

  v1 = *(NSObject **)(v0 + 16);
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = sub_1CAEE61D0;
  *(_QWORD *)(v2 + 24) = v0;
  v4[4] = sub_1CAEE61E8;
  v4[5] = v2;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 1107296256;
  v4[2] = sub_1CAEE163C;
  v4[3] = &block_descriptor_0;
  v3 = _Block_copy(v4);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v1, v3);
  _Block_release(v3);
  LOBYTE(v1) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v1 & 1) != 0)
    __break(1u);
}

uint64_t sub_1CAEE142C(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v2 = sub_1CAF202E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78]();
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = a1[3];
  v6 = a1[4];
  v8 = sub_1CAF20460();
  xpc_activity_unregister((const char *)(v8 + 32));
  swift_release();
  v9 = a1[11];
  a1[11] = 0;
  a1[12] = 0;
  sub_1CAEE63B0(v9);
  swift_unknownObjectWeakAssign();
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, (uint64_t)a1 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v2);
  swift_retain();
  v10 = sub_1CAF202C8();
  v11 = sub_1CAF206B8();
  if (os_log_type_enabled(v10, v11))
  {
    v17 = v2;
    v12 = swift_slowAlloc();
    v16 = v3;
    v13 = (uint8_t *)v12;
    v14 = swift_slowAlloc();
    v19 = v14;
    *(_DWORD *)v13 = 136315138;
    swift_bridgeObjectRetain();
    v18 = sub_1CAEDBE5C(v7, v6, &v19);
    sub_1CAF2076C();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CAEBA000, v10, v11, "%s - Unregistered criteria", v13, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v14, -1, -1);
    MEMORY[0x1D179A698](v13, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v16 + 8))(v5, v17);
  }
  else
  {

    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_1CAEE163C(uint64_t a1)
{
  return (*(uint64_t (**)(void))(a1 + 32))();
}

double XPCActivity.getCriteria()@<D0>(uint8_t *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  xpc_object_t v11;
  xpc_activity_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _xpc_activity_s *v16;
  _xpc_activity_s *v17;
  unint64_t v18;
  uint64_t v19;
  _xpc_activity_s *v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  _xpc_activity_s *v24;
  uint8_t *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  void (*v29)(char *, uint64_t);
  char *v30;
  uint64_t v31;
  uint64_t v32;
  double result;
  _QWORD v34[2];
  uint8_t *v35;
  uint64_t v36;
  __int128 v37;
  xpc_activity_t v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v2 = v1;
  v4 = sub_1CAF202E0();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v34 - v9;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE780);
  sub_1CAF206E8();
  if (!v38)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v8, v1 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v4);
    swift_retain();
    v21 = sub_1CAF202C8();
    v22 = sub_1CAF206B8();
    if (os_log_type_enabled(v21, v22))
    {
      *(_QWORD *)&v37 = v4;
      v23 = (uint8_t *)swift_slowAlloc();
      v24 = (_xpc_activity_s *)swift_slowAlloc();
      v38 = v24;
      *(_DWORD *)v23 = 136315138;
      v35 = v23 + 4;
      v36 = v5;
      v25 = a1;
      v26 = *(_QWORD *)(v2 + 24);
      v27 = *(_QWORD *)(v2 + 32);
      swift_bridgeObjectRetain();
      v28 = v26;
      a1 = v25;
      v42 = sub_1CAEDBE5C(v28, v27, (uint64_t *)&v38);
      sub_1CAF2076C();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v21, v22, "%s - getCriteria called on invalidated XPCActivity.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v24, -1, -1);
      MEMORY[0x1D179A698](v23, -1, -1);

      (*(void (**)(char *, _QWORD))(v36 + 8))(v8, v37);
      goto LABEL_12;
    }

    swift_release();
    v29 = *(void (**)(char *, uint64_t))(v5 + 8);
    v30 = v8;
LABEL_11:
    v29(v30, v4);
    goto LABEL_12;
  }
  v11 = xpc_activity_copy_criteria(v38);
  if (v11)
  {
    sub_1CAEE1A74(v11, (uint64_t *)&v38);
    v12 = v38;
    if (v38 != 2)
    {
      v32 = v40;
      v31 = v41;
      v37 = v39;
      swift_unknownObjectRelease();
      *(_QWORD *)a1 = v12;
      result = *(double *)&v37;
      *(_OWORD *)(a1 + 8) = v37;
      *((_QWORD *)a1 + 3) = v32;
      *((_QWORD *)a1 + 4) = v31;
      return result;
    }
  }
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v10, v1 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v4);
  swift_retain_n();
  v13 = sub_1CAF202C8();
  v14 = sub_1CAF206B8();
  if (!os_log_type_enabled(v13, v14))
  {

    swift_release_n();
    swift_unknownObjectRelease();
    v29 = *(void (**)(char *, uint64_t))(v5 + 8);
    v30 = v10;
    goto LABEL_11;
  }
  v15 = (uint8_t *)swift_slowAlloc();
  v16 = (_xpc_activity_s *)swift_slowAlloc();
  v35 = a1;
  v17 = v16;
  v38 = v16;
  v36 = v5;
  *(_QWORD *)&v37 = v4;
  *(_DWORD *)v15 = 136315138;
  v34[1] = v15 + 4;
  v19 = *(_QWORD *)(v2 + 24);
  v18 = *(_QWORD *)(v2 + 32);
  swift_bridgeObjectRetain();
  v42 = sub_1CAEDBE5C(v19, v18, (uint64_t *)&v38);
  sub_1CAF2076C();
  swift_release_n();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1CAEBA000, v13, v14, "%s - Criteria dictionary is nil.", v15, 0xCu);
  swift_arrayDestroy();
  v20 = v17;
  a1 = v35;
  MEMORY[0x1D179A698](v20, -1, -1);
  MEMORY[0x1D179A698](v15, -1, -1);

  swift_unknownObjectRelease();
  (*(void (**)(char *, _QWORD))(v36 + 8))(v10, v37);
LABEL_12:
  *(_QWORD *)a1 = 2;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = 0u;
  *(_OWORD *)(a1 + 24) = 0u;
  return result;
}

uint64_t sub_1CAEE1A74@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v8;
  uint64_t v9;
  uint64_t result;
  _BOOL4 v11;
  int64_t int64;
  int64_t v13;
  int64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C80878]))
  {
    v4 = sub_1CAF204B4();
    v6 = v5;
    if (qword_1ECFCE6F0 != -1)
      swift_once();
    if (v4 == qword_1ECFCE750 && v6 == *(_QWORD *)algn_1ECFCE758)
    {
      swift_bridgeObjectRelease();
      v9 = 0;
    }
    else
    {
      v8 = sub_1CAF209A0();
      swift_bridgeObjectRelease();
      v9 = ~v8 & 1;
    }
    v11 = xpc_dictionary_get_BOOL(a1, (const char *)*MEMORY[0x1E0C80898]);
    int64 = xpc_dictionary_get_int64(a1, (const char *)*MEMORY[0x1E0C80760]);
    v13 = xpc_dictionary_get_int64(a1, (const char *)*MEMORY[0x1E0C80790]);
    v14 = xpc_dictionary_get_int64(a1, (const char *)*MEMORY[0x1E0C807A8]);
    result = sub_1CAEE56BC((uint64_t)a1, &v17);
    v15 = v17;
    v16 = 256;
    if (!v11)
      v16 = 0;
    *a2 = v16 | v9;
    a2[1] = int64;
    a2[2] = v13;
    a2[3] = v14;
    a2[4] = v15;
  }
  else
  {
    result = swift_unknownObjectRelease();
    *a2 = 2;
    *(_OWORD *)(a2 + 1) = 0u;
    *(_OWORD *)(a2 + 3) = 0u;
  }
  return result;
}

Swift::Void __swiftcall XPCActivity.updateCriteria()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  void (*v12)(char *);
  NSObject *v13;
  os_log_type_t v14;
  uint64_t v15;
  uint8_t *v16;
  _xpc_activity_s *v17;
  _xpc_activity_s *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _xpc_activity_s *v22;
  void (*v23)(char *, uint64_t);
  NSObject *v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  _xpc_activity_s *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  _xpc_activity_s *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  NSObject *v37;
  os_log_type_t v38;
  uint64_t v39;
  _xpc_activity_s *v40;
  unint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void (*v47)(char *);
  char *v48;
  char *v49;
  _xpc_activity_s *v50;
  uint64_t v51;
  _xpc_activity_s *aBlock[5];
  NSObject *v53;
  uint64_t v54;

  v1 = v0;
  v2 = sub_1CAF202E0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v46 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v4);
  v9 = (char *)&v46 - v8;
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v46 - v10;
  v12 = *(void (**)(char *))(v3 + 16);
  v50 = (_xpc_activity_s *)(v1 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger);
  v12((char *)&v46 - v10);
  swift_retain();
  v13 = sub_1CAF202C8();
  v14 = sub_1CAF206B8();
  if (os_log_type_enabled(v13, v14))
  {
    v51 = v2;
    v15 = swift_slowAlloc();
    v46 = v3;
    v16 = (uint8_t *)v15;
    v17 = (_xpc_activity_s *)swift_slowAlloc();
    v47 = v12;
    v18 = v17;
    aBlock[0] = v17;
    *(_DWORD *)v16 = 136315138;
    v48 = v9;
    v49 = v6;
    v19 = *(_QWORD *)(v1 + 24);
    v20 = *(_QWORD *)(v1 + 32);
    swift_bridgeObjectRetain();
    v21 = v19;
    v2 = v51;
    v54 = sub_1CAEDBE5C(v21, v20, (uint64_t *)aBlock);
    v9 = v48;
    sub_1CAF2076C();
    swift_release();
    v6 = v49;
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CAEBA000, v13, v14, "%s - updateCriteria called.", v16, 0xCu);
    swift_arrayDestroy();
    v22 = v18;
    v12 = v47;
    MEMORY[0x1D179A698](v22, -1, -1);
    MEMORY[0x1D179A698](v16, -1, -1);

    v23 = *(void (**)(char *, uint64_t))(v46 + 8);
  }
  else
  {

    swift_release();
    v23 = *(void (**)(char *, uint64_t))(v3 + 8);
  }
  v23(v11, v2);
  v24 = *(NSObject **)(v1 + 16);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE780);
  sub_1CAF206E8();
  if (aBlock[0])
  {
    sub_1CAEE2274(aBlock[0], aBlock);
    swift_unknownObjectRelease();
    return;
  }
  if (*(_BYTE *)(v1 + 80) != 1)
  {
    ((void (*)(char *, _xpc_activity_s *, uint64_t))v12)(v6, v50, v2);
    v36 = v1;
    swift_retain();
    v37 = sub_1CAF202C8();
    v38 = sub_1CAF206B8();
    if (os_log_type_enabled(v37, v38))
    {
      v39 = swift_slowAlloc();
      v40 = (_xpc_activity_s *)swift_slowAlloc();
      *(_DWORD *)v39 = 136315394;
      v51 = v2;
      aBlock[0] = v40;
      v49 = v6;
      v42 = *(_QWORD *)(v36 + 24);
      v41 = *(_QWORD *)(v36 + 32);
      swift_bridgeObjectRetain();
      v54 = sub_1CAEDBE5C(v42, v41, (uint64_t *)aBlock);
      sub_1CAF2076C();
      swift_bridgeObjectRelease();
      *(_WORD *)(v39 + 12) = 2080;
      swift_bridgeObjectRetain();
      v54 = sub_1CAEDBE5C(v42, v41, (uint64_t *)aBlock);
      sub_1CAF2076C();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v37, v38, "%s - No current activity -- hasn't checked in yet: %s", (uint8_t *)v39, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v40, -1, -1);
      MEMORY[0x1D179A698](v39, -1, -1);

      v43 = v49;
      v44 = v51;
LABEL_15:
      v23(v43, v44);
      return;
    }
LABEL_14:

    swift_release();
    v43 = v6;
    v44 = v2;
    goto LABEL_15;
  }
  ((void (*)(char *, _xpc_activity_s *, uint64_t))v12)(v9, v50, v2);
  swift_retain();
  v25 = sub_1CAF202C8();
  v26 = sub_1CAF206B8();
  v6 = (char *)v26;
  if (os_log_type_enabled(v25, v26))
  {
    v27 = swift_slowAlloc();
    v28 = (_xpc_activity_s *)swift_slowAlloc();
    v50 = v28;
    *(_DWORD *)v27 = 136315394;
    v51 = v2;
    aBlock[0] = v28;
    v48 = v9;
    v29 = v1;
    v30 = *(_QWORD *)(v1 + 24);
    v31 = *(_QWORD *)(v29 + 32);
    swift_bridgeObjectRetain();
    v54 = sub_1CAEDBE5C(v30, v31, (uint64_t *)aBlock);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v27 + 12) = 2080;
    swift_bridgeObjectRetain();
    v32 = v30;
    v1 = v29;
    v54 = sub_1CAEDBE5C(v32, v31, (uint64_t *)aBlock);
    sub_1CAF2076C();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CAEBA000, v25, (os_log_type_t)v6, "%s - No current activity -- re-registering: %s", (uint8_t *)v27, 0x16u);
    v33 = v50;
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v33, -1, -1);
    MEMORY[0x1D179A698](v27, -1, -1);

    v34 = v48;
    v35 = v51;
  }
  else
  {

    swift_release();
    v34 = v9;
    v35 = v2;
  }
  v23(v34, v35);
  v37 = swift_allocObject();
  v37[2].isa = (Class)sub_1CAEE6220;
  v37[3].isa = (Class)v1;
  aBlock[4] = (_xpc_activity_s *)sub_1CAEE7370;
  v53 = v37;
  aBlock[0] = (_xpc_activity_s *)MEMORY[0x1E0C809B0];
  aBlock[1] = (_xpc_activity_s *)1107296256;
  aBlock[2] = (_xpc_activity_s *)sub_1CAEE163C;
  aBlock[3] = (_xpc_activity_s *)&block_descriptor_10;
  v45 = _Block_copy(aBlock);
  v2 = (uint64_t)v53;
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v24, v45);
  _Block_release(v45);
  LOBYTE(v45) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  swift_release();
  if ((v45 & 1) != 0)
  {
    __break(1u);
    goto LABEL_14;
  }
}

unint64_t sub_1CAEE2274@<X0>(_xpc_activity_s *a1@<X0>, _BYTE *a2@<X8>)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  void (**v15)(char *, void *);
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  xpc_object_t v21;
  xpc_object_t v22;
  _QWORD *v23;
  void *v24;
  unsigned int v25;
  void (*v26)(uint64_t *__return_ptr, uint64_t *);
  NSObject *isEscapingClosureAtFileLocation;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  NSObject *v36;
  os_log_type_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  void (*v50)(uint64_t *__return_ptr, uint64_t *);
  unsigned int v51;
  NSObject *v52;
  unint64_t result;
  NSObject *v54;
  uint64_t v55;
  void *v56;
  xpc_object_t v57;
  _BYTE *v58;
  xpc_activity_state_t state;
  uint64_t v60;
  BOOL v61;
  void (*v62)(_QWORD);
  _QWORD *v63;
  NSObject *v64;
  os_log_type_t v65;
  uint64_t v66;
  uint64_t v67;
  unint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  _QWORD *v72;
  NSObject *v73;
  os_log_type_t v74;
  uint64_t v75;
  uint64_t v76;
  unint64_t v77;
  uint64_t v78;
  uint64_t v79;
  unint64_t v80;
  NSObject *v81;
  void (*v82)(char *, _QWORD *);
  char *v83;
  NSObject *v84;
  os_log_type_t v85;
  int v86;
  uint64_t v87;
  uint64_t v88;
  unint64_t v89;
  uint64_t v90;
  char v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  xpc_object_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  NSObject *v104;
  int v105;
  int v106;
  __int128 v107;
  void (*v108)(char *, _QWORD *);
  int v109;
  int v110;
  uint64_t v111;
  _QWORD *v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  xpc_object_t v116;
  uint64_t v117;
  _BYTE *v118;
  char *v119;
  uint64_t aBlock;
  __int128 v121;
  __int128 v122;
  char *v123;
  uint64_t v124;
  __int128 v125;
  __int128 v126;

  v3 = v2;
  v6 = (_QWORD *)sub_1CAF202E0();
  v119 = (char *)*(v6 - 1);
  v7 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v9 = (char *)&v101 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)&v101 - v11;
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (void (**)(char *, void *))((char *)&v101 - v14);
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v101 - v17;
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v101 - v19;
  v21 = xpc_activity_copy_criteria(a1);
  v118 = a2;
  if (v21)
  {
    v22 = v21;
    v117 = (uint64_t)a1;
    v23 = v6;
    v24 = (void *)swift_unknownObjectRetain();
    sub_1CAEE1A74(v24, &aBlock);
    v25 = aBlock;
    if (aBlock != 2)
    {
      v115 = v18;
      v116 = v22;
      v48 = v121;
      v49 = v122;
      v50 = (void (*)(uint64_t *__return_ptr, uint64_t *))v3[5];
      v124 = aBlock;
      v125 = v121;
      v126 = v122;
      v50(&aBlock, &v124);
      v51 = aBlock;
      if (aBlock == 2)
      {
        v52 = v3[2];
        v12 = (char *)swift_allocObject();
        *((_QWORD *)v12 + 2) = sub_1CAEE61D0;
        *((_QWORD *)v12 + 3) = v3;
        *((_QWORD *)&v122 + 1) = sub_1CAEE7370;
        v123 = v12;
        aBlock = MEMORY[0x1E0C809B0];
        *(_QWORD *)&v121 = 1107296256;
        *((_QWORD *)&v121 + 1) = sub_1CAEE163C;
        *(_QWORD *)&v122 = &block_descriptor_29;
        v6 = _Block_copy(&aBlock);
        swift_retain();
        swift_retain();
        swift_release();
        dispatch_sync(v52, v6);
        _Block_release(v6);
        isEscapingClosureAtFileLocation = swift_isEscapingClosureAtFileLocation();
        swift_unknownObjectRelease();
        swift_release();
        result = swift_release();
        if ((isEscapingClosureAtFileLocation & 1) == 0)
        {
LABEL_14:
          *v118 = 6;
          return result;
        }
        __break(1u);
        goto LABEL_12;
      }
      v60 = v121;
      LOBYTE(aBlock) = aBlock & 1;
      v109 = (v51 >> 8) & 1;
      v110 = v51 & 1;
      BYTE1(aBlock) = BYTE1(v51) & 1;
      v113 = v122;
      v114 = *((_QWORD *)&v121 + 1);
      v111 = *((_QWORD *)&v122 + 1);
      v106 = v25 & 1;
      LOWORD(v124) = v25 & 0x101;
      v105 = (v25 >> 8) & 1;
      v107 = v48;
      v125 = v48;
      v108 = (void (*)(char *, _QWORD *))v49;
      v126 = v49;
      v112 = (_QWORD *)*((_QWORD *)&v49 + 1);
      v61 = _s12FamilyCircle11XPCActivityC8CriteriaV2eeoiySbAE_AEtFZ_0((uint64_t)&aBlock, (uint64_t)&v124);
      v62 = (void (*)(_QWORD))*((_QWORD *)v119 + 2);
      if (v61)
      {
        v63 = v23;
        ((void (*)(void (**)(char *, void *), char *, _QWORD *))v62)(v15, (char *)v3 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v23);
        swift_retain();
        v64 = sub_1CAF202C8();
        v65 = sub_1CAF206B8();
        if (os_log_type_enabled(v64, v65))
        {
          v66 = swift_slowAlloc();
          v67 = swift_slowAlloc();
          v124 = v67;
          *(_DWORD *)v66 = 136315394;
          v69 = v3[3];
          v68 = v3[4];
          swift_bridgeObjectRetain();
          aBlock = sub_1CAEDBE5C(v69, v68, &v124);
          sub_1CAF2076C();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v66 + 12) = 2080;
          LOBYTE(aBlock) = v106;
          BYTE1(aBlock) = v105;
          v121 = v107;
          *(_QWORD *)&v122 = v108;
          *((_QWORD *)&v122 + 1) = v112;
          v70 = sub_1CAF2043C();
          aBlock = sub_1CAEDBE5C(v70, v71, &v124);
          sub_1CAF2076C();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CAEBA000, v64, v65, "%s - Keeping existing criteria for: %s", (uint8_t *)v66, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1D179A698](v67, -1, -1);
          MEMORY[0x1D179A698](v66, -1, -1);
          swift_unknownObjectRelease();

        }
        else
        {

          swift_release();
          swift_unknownObjectRelease();
        }
        (*((void (**)(char *, _QWORD *))v119 + 1))((char *)v15, v63);
        a1 = (_xpc_activity_s *)v117;
        v58 = v118;
      }
      else
      {
        v103 = v60;
        v102 = (char *)v3 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger;
        v72 = v23;
        v62(v20);
        swift_retain();
        v73 = sub_1CAF202C8();
        v74 = sub_1CAF206B8();
        v104 = v73;
        if (os_log_type_enabled(v73, v74))
        {
          v75 = swift_slowAlloc();
          v76 = swift_slowAlloc();
          v124 = v76;
          *(_DWORD *)v75 = 136315394;
          v78 = v3[3];
          v77 = v3[4];
          swift_bridgeObjectRetain();
          aBlock = sub_1CAEDBE5C(v78, v77, &v124);
          sub_1CAF2076C();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v75 + 12) = 2080;
          LOBYTE(aBlock) = v106;
          BYTE1(aBlock) = v105;
          v121 = v107;
          *(_QWORD *)&v122 = v108;
          *((_QWORD *)&v122 + 1) = v112;
          v79 = sub_1CAF2043C();
          aBlock = sub_1CAEDBE5C(v79, v80, &v124);
          sub_1CAF2076C();
          swift_bridgeObjectRelease();
          v81 = v104;
          _os_log_impl(&dword_1CAEBA000, v104, v74, "%s - Existing criteria: %s", (uint8_t *)v75, 0x16u);
          swift_arrayDestroy();
          MEMORY[0x1D179A698](v76, -1, -1);
          MEMORY[0x1D179A698](v75, -1, -1);

        }
        else
        {

          swift_release();
        }
        v82 = (void (*)(char *, _QWORD *))*((_QWORD *)v119 + 1);
        v82(v20, v72);
        a1 = (_xpc_activity_s *)v117;
        v83 = v115;
        v112 = v72;
        ((void (*)(char *, char *, _QWORD *))v62)(v115, v102, v72);
        swift_retain();
        v84 = sub_1CAF202C8();
        v85 = sub_1CAF206B8();
        v86 = v85;
        if (os_log_type_enabled(v84, v85))
        {
          v87 = swift_slowAlloc();
          LODWORD(v119) = v86;
          v88 = v87;
          v117 = swift_slowAlloc();
          v124 = v117;
          *(_DWORD *)v88 = 136315394;
          v90 = v3[3];
          v89 = v3[4];
          swift_bridgeObjectRetain();
          aBlock = sub_1CAEDBE5C(v90, v89, &v124);
          sub_1CAF2076C();
          swift_release();
          swift_bridgeObjectRelease();
          *(_WORD *)(v88 + 12) = 2080;
          *((_QWORD *)&v107 + 1) = v88 + 14;
          v108 = v82;
          v92 = v109;
          v91 = v110;
          LOBYTE(aBlock) = v110;
          BYTE1(aBlock) = v109;
          v93 = v103;
          v94 = v113;
          v95 = v114;
          *(_QWORD *)&v121 = v103;
          *((_QWORD *)&v121 + 1) = v114;
          v96 = v111;
          *(_QWORD *)&v122 = v113;
          *((_QWORD *)&v122 + 1) = v111;
          v97 = sub_1CAF2043C();
          aBlock = sub_1CAEDBE5C(v97, v98, &v124);
          sub_1CAF2076C();
          swift_bridgeObjectRelease();
          _os_log_impl(&dword_1CAEBA000, v84, (os_log_type_t)v119, "%s - Registering updated  criteria: %s", (uint8_t *)v88, 0x16u);
          v99 = v117;
          swift_arrayDestroy();
          MEMORY[0x1D179A698](v99, -1, -1);
          MEMORY[0x1D179A698](v88, -1, -1);

          v108(v115, v112);
          v58 = v118;
        }
        else
        {

          swift_release();
          v82(v83, v112);
          v58 = v118;
          v93 = v103;
          v94 = v113;
          v95 = v114;
          v96 = v111;
          v92 = v109;
          v91 = v110;
        }
        LOBYTE(aBlock) = v91;
        BYTE1(aBlock) = v92;
        *(_QWORD *)&v121 = v93;
        *((_QWORD *)&v121 + 1) = v95;
        *(_QWORD *)&v122 = v94;
        *((_QWORD *)&v122 + 1) = v96;
        sub_1CAEE3E14();
        xpc_activity_set_criteria(a1, v100);
        swift_unknownObjectRelease();
        swift_unknownObjectRelease();
      }
LABEL_17:
      state = xpc_activity_get_state(a1);
      return sub_1CAEE3288(state, v58);
    }
    swift_unknownObjectRelease();
    v6 = v23;
    a1 = (_xpc_activity_s *)v117;
  }
  v26 = (void (*)(uint64_t *__return_ptr, uint64_t *))v3[5];
  v124 = 2;
  v125 = 0u;
  v126 = 0u;
  v26(&aBlock, &v124);
  if (aBlock != 2)
  {
    v33 = v121;
    v115 = (char *)v122;
    v116 = (xpc_object_t)*((_QWORD *)&v121 + 1);
    v113 = aBlock & 1;
    v114 = *((_QWORD *)&v122 + 1);
    v34 = aBlock & 0x100;
    v35 = v119;
    (*((void (**)(char *, uint64_t, _QWORD *))v119 + 2))(v9, (uint64_t)v3 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v6);
    swift_retain();
    v36 = sub_1CAF202C8();
    v37 = sub_1CAF206B8();
    if (os_log_type_enabled(v36, v37))
    {
      v38 = swift_slowAlloc();
      v39 = swift_slowAlloc();
      v117 = (uint64_t)a1;
      v111 = v39;
      v124 = v39;
      *(_DWORD *)v38 = 136315394;
      v112 = v6;
      v40 = v34;
      v41 = v33;
      v42 = v3[3];
      v43 = v3[4];
      swift_bridgeObjectRetain();
      aBlock = sub_1CAEDBE5C(v42, v43, &v124);
      sub_1CAF2076C();
      swift_release();
      v33 = v41;
      swift_bridgeObjectRelease();
      *(_WORD *)(v38 + 12) = 2080;
      LOBYTE(aBlock) = v113;
      v44 = v40 >> 8;
      BYTE1(aBlock) = BYTE1(v40);
      *(_QWORD *)&v121 = v33;
      *((_QWORD *)&v121 + 1) = v116;
      *(_QWORD *)&v122 = v115;
      *((_QWORD *)&v122 + 1) = v114;
      v45 = sub_1CAF2043C();
      aBlock = sub_1CAEDBE5C(v45, v46, &v124);
      sub_1CAF2076C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v36, v37, "%s - Registering new criteria: %s", (uint8_t *)v38, 0x16u);
      v47 = v111;
      swift_arrayDestroy();
      a1 = (_xpc_activity_s *)v117;
      MEMORY[0x1D179A698](v47, -1, -1);
      MEMORY[0x1D179A698](v38, -1, -1);

      (*((void (**)(char *, _QWORD *))v119 + 1))(v9, v112);
    }
    else
    {

      swift_release();
      (*((void (**)(char *, _QWORD *))v35 + 1))(v9, v6);
      v44 = v34 >> 8;
    }
    LOBYTE(aBlock) = v113;
    BYTE1(aBlock) = v44;
    *(_QWORD *)&v121 = v33;
    *((_QWORD *)&v121 + 1) = v116;
    *(_QWORD *)&v122 = v115;
    *((_QWORD *)&v122 + 1) = v114;
    sub_1CAEE3E14();
    xpc_activity_set_criteria(a1, v57);
    swift_unknownObjectRelease();
    v58 = v118;
    goto LABEL_17;
  }
  v15 = (void (**)(char *, void *))v119;
  (*((void (**)(char *, uint64_t, _QWORD *))v119 + 2))(v12, (uint64_t)v3 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v6);
  swift_retain();
  isEscapingClosureAtFileLocation = sub_1CAF202C8();
  v28 = sub_1CAF206B8();
  if (!os_log_type_enabled(isEscapingClosureAtFileLocation, v28))
  {
LABEL_12:

    swift_release();
    v15[1](v12, v6);
    goto LABEL_13;
  }
  v112 = v6;
  v29 = (uint8_t *)swift_slowAlloc();
  v30 = swift_slowAlloc();
  aBlock = v30;
  *(_DWORD *)v29 = 136315138;
  v32 = v3[3];
  v31 = v3[4];
  swift_bridgeObjectRetain();
  v124 = sub_1CAEDBE5C(v32, v31, &aBlock);
  sub_1CAF2076C();
  swift_release();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_1CAEBA000, isEscapingClosureAtFileLocation, v28, "%s - criteriaBlock returned nil", v29, 0xCu);
  swift_arrayDestroy();
  MEMORY[0x1D179A698](v30, -1, -1);
  MEMORY[0x1D179A698](v29, -1, -1);

  (*((void (**)(char *, _QWORD *))v119 + 1))(v12, v112);
LABEL_13:
  v54 = v3[2];
  v55 = swift_allocObject();
  *(_QWORD *)(v55 + 16) = sub_1CAEE61D0;
  *(_QWORD *)(v55 + 24) = v3;
  *((_QWORD *)&v122 + 1) = sub_1CAEE7370;
  v123 = (char *)v55;
  aBlock = MEMORY[0x1E0C809B0];
  *(_QWORD *)&v121 = 1107296256;
  *((_QWORD *)&v121 + 1) = sub_1CAEE163C;
  *(_QWORD *)&v122 = &block_descriptor_21;
  v56 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v54, v56);
  _Block_release(v56);
  LOBYTE(v54) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v54 & 1) == 0)
    goto LABEL_14;
  __break(1u);
  return result;
}

uint64_t XPCActivity.state.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  xpc_activity_state_t state;
  uint64_t result;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  unint64_t v14;
  _xpc_activity_s *v15;
  _QWORD v16[2];
  _xpc_activity_s *v17;
  uint64_t v18;
  xpc_activity_t v19;

  v2 = v1;
  v4 = sub_1CAF202E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE780);
  sub_1CAF206E8();
  if (v19)
  {
    state = xpc_activity_get_state(v19);
    sub_1CAEE3288(state, a1);
    return swift_unknownObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v1 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v4);
    swift_retain_n();
    v10 = sub_1CAF202C8();
    v11 = sub_1CAF206AC();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v17 = (_xpc_activity_s *)swift_slowAlloc();
      v18 = v2;
      v19 = v17;
      *(_DWORD *)v12 = 136315138;
      v16[1] = v12 + 4;
      swift_retain();
      v13 = sub_1CAF2043C();
      v18 = sub_1CAEDBE5C(v13, v14, (uint64_t *)&v19);
      sub_1CAF2076C();
      swift_release_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v10, v11, "%s: state called on invalidated XPCActivity", v12, 0xCu);
      v15 = v17;
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v15, -1, -1);
      MEMORY[0x1D179A698](v12, -1, -1);

    }
    else
    {

      swift_release_n();
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *a1 = 0;
  }
  return result;
}

unint64_t sub_1CAEE3288@<X0>(unint64_t result@<X0>, _BYTE *a2@<X8>)
{
  if (result >= 6)
  {
    sub_1CAF207FC();
    swift_bridgeObjectRelease();
    sub_1CAF2097C();
    sub_1CAF204A8();
    swift_bridgeObjectRelease();
    result = sub_1CAF208BC();
    __break(1u);
  }
  else
  {
    *a2 = result;
  }
  return result;
}

Swift::Bool __swiftcall XPCActivity.defer()()
{
  return sub_1CAEE3388((uint64_t)sub_1CAEE7358, 3, "%s - defer called on invalidated XPCActivity");
}

Swift::Bool __swiftcall XPCActivity.continue()()
{
  return sub_1CAEE3388((uint64_t)sub_1CAEE7358, 4, "%s - continue called on invalidated XPCActivity");
}

BOOL sub_1CAEE3388(uint64_t a1, xpc_activity_state_t a2, const char *a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _BOOL8 v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  unint64_t v16;
  _xpc_activity_s *v17;
  uint8_t *v19;
  _xpc_activity_s *v20;
  const char *v21;
  uint64_t v22;
  xpc_activity_t v23;

  v6 = v3;
  v7 = sub_1CAF202E0();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78]();
  v10 = (char *)&v19 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE780);
  sub_1CAF206E8();
  if (v23)
  {
    v11 = xpc_activity_set_state(v23, a2);
    swift_unknownObjectRelease();
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, v3 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v7);
    swift_retain();
    v12 = sub_1CAF202C8();
    v13 = sub_1CAF206AC();
    if (os_log_type_enabled(v12, v13))
    {
      v21 = a3;
      v14 = (uint8_t *)swift_slowAlloc();
      v20 = (_xpc_activity_s *)swift_slowAlloc();
      v23 = v20;
      *(_DWORD *)v14 = 136315138;
      v19 = v14 + 4;
      v15 = *(_QWORD *)(v6 + 24);
      v16 = *(_QWORD *)(v6 + 32);
      swift_bridgeObjectRetain();
      v22 = sub_1CAEDBE5C(v15, v16, (uint64_t *)&v23);
      sub_1CAF2076C();
      swift_release();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v12, v13, v21, v14, 0xCu);
      v17 = v20;
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v17, -1, -1);
      MEMORY[0x1D179A698](v14, -1, -1);

    }
    else
    {

      swift_release();
    }
    (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
    return 0;
  }
  return v11;
}

uint64_t sub_1CAEE35B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[6];

  v2 = swift_allocObject();
  swift_weakInit();
  v3 = *(_QWORD *)(a1 + 88);
  *(_QWORD *)(a1 + 88) = sub_1CAEE72B4;
  *(_QWORD *)(a1 + 96) = v2;
  swift_retain();
  sub_1CAEE63B0(v3);
  v4 = (void *)*MEMORY[0x1E0C80748];
  v8[4] = sub_1CAEE72B4;
  v8[5] = v2;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 1107296256;
  v8[2] = sub_1CAEE3B28;
  v8[3] = &block_descriptor_35;
  v5 = _Block_copy(v8);
  swift_retain();
  swift_release();
  v6 = sub_1CAF20460();
  xpc_activity_register((const char *)(v6 + 32), v4, v5);
  swift_release();
  _Block_release(v5);
  return swift_release();
}

uint64_t sub_1CAEE36CC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t result;
  NSObject *v7;
  os_log_type_t v8;
  uint8_t *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v13[2];
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = sub_1CAF202E0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_beginAccess();
  result = swift_weakLoadStrong();
  if (result)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, result + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v2);
    swift_unknownObjectRetain_n();
    v7 = sub_1CAF202C8();
    v8 = sub_1CAF206B8();
    if (os_log_type_enabled(v7, v8))
    {
      v9 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v15 = a1;
      v16 = v14;
      *(_DWORD *)v9 = 136315138;
      v13[1] = v9 + 4;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE710);
      v10 = sub_1CAF2043C();
      v15 = sub_1CAEDBE5C(v10, v11, &v16);
      sub_1CAF2076C();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v7, v8, "registered activity: %s", v9, 0xCu);
      v12 = v14;
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v12, -1, -1);
      MEMORY[0x1D179A698](v9, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    sub_1CAEE38F4(a1);
    return swift_release();
  }
  return result;
}

uint64_t sub_1CAEE38F4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint8_t *v15;
  uint64_t v16;
  _QWORD v18[2];
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v2 = v1;
  v4 = sub_1CAF202E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v2 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v4);
  swift_retain();
  v8 = sub_1CAF202C8();
  v9 = sub_1CAF206B8();
  if (os_log_type_enabled(v8, v9))
  {
    v19 = v4;
    v10 = swift_slowAlloc();
    v20 = a1;
    v11 = (uint8_t *)v10;
    v12 = swift_slowAlloc();
    v22 = v12;
    *(_DWORD *)v11 = 136315138;
    v18[1] = v11 + 4;
    v13 = *(_QWORD *)(v2 + 24);
    v14 = *(_QWORD *)(v2 + 32);
    swift_bridgeObjectRetain();
    v21 = sub_1CAEDBE5C(v13, v14, &v22);
    sub_1CAF2076C();
    swift_release();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CAEBA000, v8, v9, "%s - calling activityHandler", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v12, -1, -1);
    v15 = v11;
    a1 = v20;
    MEMORY[0x1D179A698](v15, -1, -1);

    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v19);
  }
  else
  {

    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  }
  v16 = sub_1CAF2022C();
  MEMORY[0x1E0C80A78](v16);
  v18[-2] = a1;
  v18[-1] = v2;
  return sub_1CAF20208();
}

uint64_t sub_1CAEE3B28(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  swift_retain();
  v2 = swift_unknownObjectRetain();
  v1(v2);
  swift_release();
  return swift_unknownObjectRelease();
}

uint64_t sub_1CAEE3B70(uint64_t a1, _xpc_activity_s *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  xpc_activity_state_t state;
  int v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t, uint64_t *);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;

  v6 = sub_1CAF202E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  state = xpc_activity_get_state(a2);
  sub_1CAEE3288(state, &v29);
  v11 = v29;
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v9, a3 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger, v6);
  swift_unknownObjectRetain_n();
  v12 = sub_1CAF202C8();
  v13 = sub_1CAF206B8();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v27 = v11;
    v15 = v14;
    v25 = swift_slowAlloc();
    v28 = (uint64_t)a2;
    v29 = v25;
    *(_DWORD *)v15 = 136315394;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE710);
    v16 = sub_1CAF2043C();
    v26 = a1;
    v28 = sub_1CAEDBE5C(v16, v17, &v29);
    sub_1CAF2076C();
    swift_unknownObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v15 + 12) = 2080;
    LOBYTE(v28) = v27;
    v18 = sub_1CAF2043C();
    v28 = sub_1CAEDBE5C(v18, v19, &v29);
    a1 = v26;
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CAEBA000, v12, v13, "activityHandler for %s -- state: %s", (uint8_t *)v15, 0x16u);
    v20 = v25;
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v20, -1, -1);
    v21 = v15;
    v11 = v27;
    MEMORY[0x1D179A698](v21, -1, -1);

  }
  else
  {

    swift_unknownObjectRelease_n();
  }
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  if (v11)
  {
    v22 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 56);
    LOBYTE(v29) = v11;
    return v22(a3, a1, &v29);
  }
  else
  {
    swift_unknownObjectWeakAssign();
    *(_BYTE *)(a3 + 80) = 1;
    sub_1CAEE2274(a2, &v29);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t *))(a3 + 56))(a3, a1, &v29);
  }
}

void sub_1CAEE3E14()
{
  unsigned __int8 *v0;
  int v1;
  int v2;
  int64_t v3;
  int64_t v4;
  uint64_t v5;
  int64_t v6;
  xpc_object_t v7;
  void *v8;
  const char **v9;

  v1 = *v0;
  v2 = v0[1];
  v3 = *((_QWORD *)v0 + 1);
  v4 = *((_QWORD *)v0 + 2);
  v6 = *((_QWORD *)v0 + 3);
  v5 = *((_QWORD *)v0 + 4);
  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = v7;
  v9 = (const char **)MEMORY[0x1E0C80888];
  if (v1)
    v9 = (const char **)MEMORY[0x1E0C80880];
  xpc_dictionary_set_string(v7, (const char *)*MEMORY[0x1E0C80878], *v9);
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80898], v2);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E0C80760], v3);
  xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E0C80790], v4);
  if (v2 == 1)
    xpc_dictionary_set_int64(v8, (const char *)*MEMORY[0x1E0C807A8], v6);
  if ((v5 & 1) != 0)
  {
    if (!*MEMORY[0x1E0C80868])
    {
      __break(1u);
      goto LABEL_39;
    }
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80868], 1);
  }
  if ((v5 & 4) == 0)
    goto LABEL_11;
  if (!*MEMORY[0x1E0C808E0])
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808E0], 1);
LABEL_11:
  if ((v5 & 2) == 0)
    goto LABEL_14;
  if (!*MEMORY[0x1E0C808F0])
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808F0], 1);
LABEL_14:
  if ((v5 & 8) == 0)
    goto LABEL_17;
  if (!*MEMORY[0x1E0C808D0])
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808D0], 1);
LABEL_17:
  if ((v5 & 0x10) == 0)
    goto LABEL_20;
  if (!*MEMORY[0x1E0C808C8])
  {
LABEL_42:
    __break(1u);
    goto LABEL_43;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808C8], 1);
LABEL_20:
  if ((v5 & 0x20) != 0)
    xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80738], 1);
  if ((v5 & 0x40) != 0)
  {
    if (*MEMORY[0x1E0C80808])
    {
      xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80808], 1);
      goto LABEL_25;
    }
LABEL_43:
    __break(1u);
    goto LABEL_44;
  }
LABEL_25:
  if ((v5 & 0x80) == 0)
    goto LABEL_28;
  if (!*MEMORY[0x1E0C80758])
  {
LABEL_44:
    __break(1u);
    goto LABEL_45;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80758], 1);
LABEL_28:
  if ((v5 & 0x100) == 0)
    goto LABEL_31;
  if (!*MEMORY[0x1E0C80770])
  {
LABEL_45:
    __break(1u);
    goto LABEL_46;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80770], 1);
LABEL_31:
  if ((v5 & 0x400) == 0)
    goto LABEL_34;
  if (!*MEMORY[0x1E0C80860])
  {
LABEL_46:
    __break(1u);
    goto LABEL_47;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C80860], 1);
LABEL_34:
  if ((v5 & 0x800) == 0)
    return;
  if (!*MEMORY[0x1E0C808A0])
  {
LABEL_47:
    __break(1u);
    return;
  }
  xpc_dictionary_set_BOOL(v8, (const char *)*MEMORY[0x1E0C808A0], 1);
}

uint64_t sub_1CAEE4084()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1CAF204B4();
  qword_1ECFCE750 = result;
  *(_QWORD *)algn_1ECFCE758 = v1;
  return result;
}

uint64_t XPCActivity.Priority.description.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E65746E69616D2ELL;
  else
    return 0x7974696C6974752ELL;
}

FamilyCircle::XPCActivity::Priority_optional __swiftcall XPCActivity.Priority.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  uint64_t v3;
  FamilyCircle::XPCActivity::Priority_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CAF20910();
  result.value = swift_bridgeObjectRelease();
  if (v3 == 1)
    v5 = 1;
  else
    v5 = 2;
  if (!v3)
    v5 = 0;
  *v2 = v5;
  return result;
}

uint64_t XPCActivity.Priority.rawValue.getter()
{
  _BYTE *v0;

  if (*v0)
    return 0x616E65746E69616DLL;
  else
    return 0x7974696C697475;
}

uint64_t sub_1CAEE4198(char *a1, char *a2)
{
  return sub_1CAF17610(*a1, *a2);
}

uint64_t sub_1CAEE41A4()
{
  sub_1CAF20A18();
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

uint64_t sub_1CAEE422C()
{
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAEE4290()
{
  sub_1CAF20A18();
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

FamilyCircle::XPCActivity::Priority_optional sub_1CAEE4314(Swift::String *a1)
{
  return XPCActivity.Priority.init(rawValue:)(*a1);
}

void sub_1CAEE4320(uint64_t *a1@<X8>)
{
  _BYTE *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = 0x7974696C697475;
  if (*v1)
    v2 = 0x616E65746E69616DLL;
  v3 = 0xE700000000000000;
  if (*v1)
    v3 = 0xEB0000000065636ELL;
  *a1 = v2;
  a1[1] = v3;
}

uint64_t sub_1CAEE4368()
{
  sub_1CAEE6F34();
  return sub_1CAF20574();
}

uint64_t sub_1CAEE43C4()
{
  sub_1CAEE6F34();
  return sub_1CAF20550();
}

uint64_t sub_1CAEE4410()
{
  _BYTE *v0;

  if (*v0)
    return 0x6E65746E69616D2ELL;
  else
    return 0x7974696C6974752ELL;
}

FamilyCircle::XPCActivity::State_optional __swiftcall XPCActivity.State.init(rawValue:)(Swift::Int rawValue)
{
  char *v1;
  char v2;

  v2 = 7;
  if ((unint64_t)rawValue < 7)
    v2 = rawValue;
  *v1 = v2;
  return (FamilyCircle::XPCActivity::State_optional)rawValue;
}

uint64_t XPCActivity.State.rawValue.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

BOOL sub_1CAEE4470(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1CAEE4484()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

uint64_t sub_1CAEE44C8()
{
  return sub_1CAF20A24();
}

uint64_t sub_1CAEE44F0()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

FamilyCircle::XPCActivity::State_optional sub_1CAEE4530(Swift::Int *a1)
{
  return XPCActivity.State.init(rawValue:)(*a1);
}

void sub_1CAEE4538(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

uint64_t sub_1CAEE4544()
{
  sub_1CAEE6EF0();
  return sub_1CAF20580();
}

uint64_t sub_1CAEE45A0()
{
  sub_1CAEE6EF0();
  return sub_1CAF2055C();
}

void XPCActivity.Criteria.priority.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

uint64_t XPCActivity.Criteria.repeating.getter()
{
  uint64_t v0;

  return *(unsigned __int8 *)(v0 + 1);
}

uint64_t XPCActivity.Criteria.delay.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 8);
}

uint64_t XPCActivity.Criteria.gracePeriod.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 16);
}

uint64_t XPCActivity.Criteria.interval.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

void XPCActivity.Criteria.options.getter(_QWORD *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_QWORD *)(v1 + 32);
}

uint64_t sub_1CAEE4628()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CAEE4658 + 4 * byte_1CAF24CF8[*v0]))(0x797469726F697270, 0xE800000000000000);
}

uint64_t sub_1CAEE4658()
{
  return 0x6E69746165706572;
}

uint64_t sub_1CAEE4674()
{
  return 0x79616C6564;
}

uint64_t sub_1CAEE4688()
{
  return 0x7265506563617267;
}

uint64_t sub_1CAEE46A8()
{
  return 0x6C61767265746E69;
}

uint64_t sub_1CAEE46BC()
{
  return 0x736E6F6974706FLL;
}

uint64_t sub_1CAEE46D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t result;

  result = sub_1CAEE6C54(a1, a2);
  *a3 = result;
  return result;
}

uint64_t sub_1CAEE46F8()
{
  return 0;
}

void sub_1CAEE4704(_BYTE *a1@<X8>)
{
  *a1 = 6;
}

uint64_t sub_1CAEE4710()
{
  sub_1CAEE6238();
  return sub_1CAF20A84();
}

uint64_t sub_1CAEE4738()
{
  sub_1CAEE6238();
  return sub_1CAF20A90();
}

uint64_t XPCActivity.Criteria.encode(to:)(_QWORD *a1)
{
  char *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[4];
  int v13;
  uint64_t v14;
  char v15;
  char v16;
  char v17;
  char v18;
  char v19;
  char v20;
  char v21;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991120);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *v1;
  v13 = v1[1];
  v9 = *((_QWORD *)v1 + 1);
  v12[2] = *((_QWORD *)v1 + 2);
  v12[3] = v9;
  v10 = *((_QWORD *)v1 + 3);
  v12[0] = *((_QWORD *)v1 + 4);
  v12[1] = v10;
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1CAEE6238();
  sub_1CAF20A54();
  v21 = v8;
  v20 = 0;
  sub_1CAEE627C();
  sub_1CAF2094C();
  if (!v2)
  {
    v19 = 1;
    sub_1CAF20940();
    v18 = 2;
    sub_1CAF20958();
    v17 = 3;
    sub_1CAF20958();
    v16 = 4;
    sub_1CAF20958();
    v14 = v12[0];
    v15 = 5;
    sub_1CAEE62C0();
    sub_1CAF2094C();
  }
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t XPCActivity.Criteria.init(from:)@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  char v9;
  char v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  char v20;
  char v21;
  char v22;
  char v23;
  char v24;

  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991140);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  sub_1CAEE6238();
  sub_1CAF20A48();
  if (!v2)
  {
    v23 = 0;
    sub_1CAEE6304();
    sub_1CAF20928();
    v9 = v24;
    v22 = 1;
    v10 = sub_1CAF2091C();
    v21 = 2;
    v16 = sub_1CAF20934();
    v20 = 3;
    v15 = sub_1CAF20934();
    v19 = 4;
    v14 = sub_1CAF20934();
    v18 = 5;
    sub_1CAEE6348();
    sub_1CAF20928();
    (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_BYTE *)a2 = v9;
    *(_BYTE *)(a2 + 1) = v10 & 1;
    v12 = v17;
    v13 = v15;
    *(_QWORD *)(a2 + 8) = v16;
    *(_QWORD *)(a2 + 16) = v13;
    *(_QWORD *)(a2 + 24) = v14;
    *(_QWORD *)(a2 + 32) = v12;
  }
  return __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)a1);
}

uint64_t sub_1CAEE4BA4@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  return XPCActivity.Criteria.init(from:)(a1, a2);
}

uint64_t sub_1CAEE4BB8(_QWORD *a1)
{
  return XPCActivity.Criteria.encode(to:)(a1);
}

uint64_t XPCActivity.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1CAEE638C(v0 + 72);
  sub_1CAEE63B0(*(_QWORD *)(v0 + 88));
  v1 = v0 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger;
  v2 = sub_1CAF202E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return v0;
}

uint64_t XPCActivity.__deallocating_deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_1CAEE638C(v0 + 72);
  sub_1CAEE63B0(*(_QWORD *)(v0 + 88));
  v1 = v0 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger;
  v2 = sub_1CAF202E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t XPCActivity.Criteria.Options.rawValue.getter()
{
  uint64_t v0;

  return *(_QWORD *)v0;
}

FamilyCircle::XPCActivity::Criteria::Options __swiftcall XPCActivity.Criteria.Options.init(rawValue:)(FamilyCircle::XPCActivity::Criteria::Options rawValue)
{
  FamilyCircle::XPCActivity::Criteria::Options *v1;

  v1->rawValue = rawValue.rawValue;
  return rawValue;
}

void static XPCActivity.Criteria.Options.powerNap.getter(_QWORD *a1@<X8>)
{
  *a1 = 1;
}

void static XPCActivity.Criteria.Options.wakeDevice.getter(_QWORD *a1@<X8>)
{
  *a1 = 2;
}

void static XPCActivity.Criteria.Options.significantUserInactivity.getter(_QWORD *a1@<X8>)
{
  *a1 = 4;
}

void static XPCActivity.Criteria.Options.requiresNetwork.getter(_QWORD *a1@<X8>)
{
  *a1 = 8;
}

void static XPCActivity.Criteria.Options.requiresInexpensiveNetwork.getter(_QWORD *a1@<X8>)
{
  *a1 = 16;
}

void static XPCActivity.Criteria.Options.allowBattery.getter(_QWORD *a1@<X8>)
{
  *a1 = 32;
}

void static XPCActivity.Criteria.Options.memoryIntensive.getter(_QWORD *a1@<X8>)
{
  *a1 = 64;
}

void static XPCActivity.Criteria.Options.cpuIntensive.getter(_QWORD *a1@<X8>)
{
  *a1 = 128;
}

void static XPCActivity.Criteria.Options.diskIntensive.getter(_QWORD *a1@<X8>)
{
  *a1 = 256;
}

void static XPCActivity.Criteria.Options.usesDuetNetworkBudgeting.getter(_QWORD *a1@<X8>)
{
  *a1 = 512;
}

void static XPCActivity.Criteria.Options.postInstall.getter(_QWORD *a1@<X8>)
{
  *a1 = 1024;
}

void static XPCActivity.Criteria.Options.requiresBuddyComplete.getter(_QWORD *a1@<X8>)
{
  *a1 = 2048;
}

uint64_t XPCActivity.Criteria.Options.description.getter()
{
  uint64_t *v0;
  uint64_t v1;
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  unint64_t v9;
  unint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  unint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  char *v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  unint64_t v27;
  unint64_t v28;
  char *v29;
  unint64_t v30;
  unint64_t v31;
  _QWORD *v32;
  unint64_t v33;
  unint64_t v34;
  char *v35;
  unint64_t v36;
  unint64_t v37;
  _QWORD *v38;

  v1 = *v0;
  if ((*v0 & 1) == 0)
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    if ((v1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_1CAEE58E4(0, 1, 1, MEMORY[0x1E0DEE9D8]);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v3 > 1), v4 + 1, 1, v2);
  v2[2] = v4 + 1;
  v5 = &v2[2 * v4];
  v5[4] = 0x614E7265776F702ELL;
  v5[5] = 0xE900000000000070;
  if ((v1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
    v7 = v2[2];
    v6 = v2[3];
    if (v7 >= v6 >> 1)
      v2 = sub_1CAEE58E4((_QWORD *)(v6 > 1), v7 + 1, 1, v2);
    v2[2] = v7 + 1;
    v8 = &v2[2 * v7];
    v8[4] = 0x766544656B61772ELL;
    v8[5] = 0xEB00000000656369;
  }
LABEL_12:
  if ((v1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
    v10 = v2[2];
    v9 = v2[3];
    if (v10 >= v9 >> 1)
      v2 = sub_1CAEE58E4((_QWORD *)(v9 > 1), v10 + 1, 1, v2);
    v2[2] = v10 + 1;
    v11 = &v2[2 * v10];
    v11[4] = 0xD00000000000001ALL;
    v11[5] = 0x80000001CAF2A690;
    if ((v1 & 8) == 0)
    {
LABEL_14:
      if ((v1 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_33;
    }
  }
  else if ((v1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v13 = v2[2];
  v12 = v2[3];
  if (v13 >= v12 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v12 > 1), v13 + 1, 1, v2);
  v2[2] = v13 + 1;
  v14 = &v2[2 * v13];
  v14[4] = 0xD000000000000010;
  v14[5] = 0x80000001CAF2A670;
  if ((v1 & 0x10) == 0)
  {
LABEL_15:
    if ((v1 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_38;
  }
LABEL_33:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v16 = v2[2];
  v15 = v2[3];
  if (v16 >= v15 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v15 > 1), v16 + 1, 1, v2);
  v2[2] = v16 + 1;
  v17 = &v2[2 * v16];
  v17[4] = 0xD00000000000001BLL;
  v17[5] = 0x80000001CAF2A650;
  if ((v1 & 0x20) == 0)
  {
LABEL_16:
    if ((v1 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_43;
  }
LABEL_38:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v19 = v2[2];
  v18 = v2[3];
  if (v19 >= v18 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v18 > 1), v19 + 1, 1, v2);
  v2[2] = v19 + 1;
  v20 = (char *)&v2[2 * v19];
  strcpy(v20 + 32, ".allowBattery");
  *((_WORD *)v20 + 23) = -4864;
  if ((v1 & 0x40) == 0)
  {
LABEL_17:
    if ((v1 & 0x80) == 0)
      goto LABEL_18;
    goto LABEL_48;
  }
LABEL_43:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v22 = v2[2];
  v21 = v2[3];
  if (v22 >= v21 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v21 > 1), v22 + 1, 1, v2);
  v2[2] = v22 + 1;
  v23 = &v2[2 * v22];
  v23[4] = 0xD000000000000010;
  v23[5] = 0x80000001CAF2A630;
  if ((v1 & 0x80) == 0)
  {
LABEL_18:
    if ((v1 & 0x100) == 0)
      goto LABEL_19;
    goto LABEL_53;
  }
LABEL_48:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v25 = v2[2];
  v24 = v2[3];
  if (v25 >= v24 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v24 > 1), v25 + 1, 1, v2);
  v2[2] = v25 + 1;
  v26 = (char *)&v2[2 * v25];
  strcpy(v26 + 32, ".cpuIntensive");
  *((_WORD *)v26 + 23) = -4864;
  if ((v1 & 0x100) == 0)
  {
LABEL_19:
    if ((v1 & 0x200) == 0)
      goto LABEL_20;
    goto LABEL_58;
  }
LABEL_53:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v28 = v2[2];
  v27 = v2[3];
  if (v28 >= v27 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v27 > 1), v28 + 1, 1, v2);
  v2[2] = v28 + 1;
  v29 = (char *)&v2[2 * v28];
  strcpy(v29 + 32, ".diskIntensive");
  v29[47] = -18;
  if ((v1 & 0x200) == 0)
  {
LABEL_20:
    if ((v1 & 0x400) == 0)
      goto LABEL_21;
    goto LABEL_63;
  }
LABEL_58:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v31 = v2[2];
  v30 = v2[3];
  if (v31 >= v30 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v30 > 1), v31 + 1, 1, v2);
  v2[2] = v31 + 1;
  v32 = &v2[2 * v31];
  v32[4] = 0xD000000000000019;
  v32[5] = 0x80000001CAF2A610;
  if ((v1 & 0x400) == 0)
  {
LABEL_21:
    if ((v1 & 0x800) == 0)
      goto LABEL_73;
    goto LABEL_68;
  }
LABEL_63:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
  v34 = v2[2];
  v33 = v2[3];
  if (v34 >= v33 >> 1)
    v2 = sub_1CAEE58E4((_QWORD *)(v33 > 1), v34 + 1, 1, v2);
  v2[2] = v34 + 1;
  v35 = (char *)&v2[2 * v34];
  strcpy(v35 + 32, ".postInstall");
  v35[45] = 0;
  *((_WORD *)v35 + 23) = -5120;
  if ((v1 & 0x800) != 0)
  {
LABEL_68:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_1CAEE58E4(0, v2[2] + 1, 1, v2);
    v37 = v2[2];
    v36 = v2[3];
    if (v37 >= v36 >> 1)
      v2 = sub_1CAEE58E4((_QWORD *)(v36 > 1), v37 + 1, 1, v2);
    v2[2] = v37 + 1;
    v38 = &v2[2 * v37];
    v38[4] = 0xD000000000000016;
    v38[5] = 0x80000001CAF2A5F0;
  }
LABEL_73:
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE6F8);
  sub_1CAEDCE8C(&qword_1ECFCE700, &qword_1ECFCE6F8, MEMORY[0x1E0DEAF20]);
  sub_1CAF203B8();
  swift_bridgeObjectRelease();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  sub_1CAF204A8();
  return 91;
}

uint64_t sub_1CAEE5488()
{
  sub_1CAEE6454();
  return sub_1CAF2058C();
}

uint64_t sub_1CAEE54E4()
{
  sub_1CAEE6454();
  return sub_1CAF20568();
}

_QWORD *sub_1CAEE5534@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_1CAEE5548@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_1CAEE555C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_1CAEE5570(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_1CAEE55A0@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v3;

  v3 = *v2 & *result;
  if (v3)
    *v2 &= ~*result;
  *(_QWORD *)a2 = v3;
  *(_BYTE *)(a2 + 8) = v3 == 0;
  return result;
}

uint64_t *sub_1CAEE55CC@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *result;
  v4 = *v2;
  *v2 |= *result;
  v5 = v4 & v3;
  *(_QWORD *)a2 = v5;
  *(_BYTE *)(a2 + 8) = v5 == 0;
  return result;
}

_QWORD *sub_1CAEE55F0(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_1CAEE5604(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_1CAEE5618(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_1CAEE562C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_1CAEE5640(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_1CAEE5654(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_1CAEE5668(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_1CAEE567C()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_1CAEE568C()
{
  return sub_1CAF207A8();
}

_QWORD *sub_1CAEE56A4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

uint64_t sub_1CAEE56BC@<X0>(uint64_t result@<X0>, uint64_t *a2@<X8>)
{
  void *v3;
  unsigned int v4;
  int v5;
  int v6;
  int v7;
  _BOOL4 v8;
  int v9;
  int v10;
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  _BOOL4 v15;
  uint64_t v16;
  uint64_t *v17;

  if (!*MEMORY[0x1E0C80868])
  {
    __break(1u);
    goto LABEL_34;
  }
  v3 = (void *)result;
  result = xpc_dictionary_get_BOOL((xpc_object_t)result, (const char *)*MEMORY[0x1E0C80868]);
  if (!*MEMORY[0x1E0C808E0])
  {
LABEL_34:
    __break(1u);
    goto LABEL_35;
  }
  v4 = result;
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C808E0]);
  if (!*MEMORY[0x1E0C808F0])
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v5 = result;
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C808F0]);
  if (!*MEMORY[0x1E0C808D0])
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v6 = result;
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C808D0]);
  if (!*MEMORY[0x1E0C808C8])
  {
LABEL_37:
    __break(1u);
    goto LABEL_38;
  }
  v7 = result;
  v8 = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C808C8]);
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C80738]);
  if (!*MEMORY[0x1E0C80808])
  {
LABEL_38:
    __break(1u);
    goto LABEL_39;
  }
  v9 = result;
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C80808]);
  if (!*MEMORY[0x1E0C80758])
  {
LABEL_39:
    __break(1u);
    goto LABEL_40;
  }
  v10 = result;
  v17 = a2;
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C80758]);
  if (!*MEMORY[0x1E0C80770])
  {
LABEL_40:
    __break(1u);
    goto LABEL_41;
  }
  v11 = result;
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C80770]);
  if (!*MEMORY[0x1E0C80860])
  {
LABEL_41:
    __break(1u);
    goto LABEL_42;
  }
  v12 = result;
  result = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C80860]);
  if (!*MEMORY[0x1E0C808A0])
  {
LABEL_42:
    __break(1u);
    return result;
  }
  v13 = v4;
  if (v5)
    v13 = v4 | 4;
  if (v6)
    v13 |= 2uLL;
  if (v7)
    v13 |= 8uLL;
  if (v8)
    v13 |= 0x10uLL;
  if (v9)
    v13 |= 0x20uLL;
  if (v10)
    v13 |= 0x40uLL;
  if (v11)
    v13 |= 0x80uLL;
  if (v12)
    v13 |= 0x100uLL;
  if ((_DWORD)result)
    v14 = v13 | 0x400;
  else
    v14 = v13;
  v15 = xpc_dictionary_get_BOOL(v3, (const char *)*MEMORY[0x1E0C808A0]);
  result = swift_unknownObjectRelease();
  v16 = v14 | 0x800;
  if (!v15)
    v16 = v14;
  *v17 = v16;
  return result;
}

_QWORD *sub_1CAEE58E4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE718);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 17;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 4);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1CAEE6F78(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1CAEE59F0(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  int64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911B0);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v12 = v11 - 32;
      if (v11 < 32)
        v12 = v11 - 1;
      v10[2] = v8;
      v10[3] = 2 * (v12 >> 5);
      v13 = v10 + 4;
      if ((v5 & 1) != 0)
        goto LABEL_15;
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v13 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[4 * v8 + 4])
          memmove(v13, a4 + 4, 32 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_1CAEE7180(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CAEE5AFC(char a1, int64_t a2, char a3, unint64_t a4)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911A8);
  v10 = *(_QWORD *)(sub_1CAF1FFA4() - 8);
  v11 = *(_QWORD *)(v10 + 72);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = (_QWORD *)swift_allocObject();
  v14 = _swift_stdlib_malloc_size(v13);
  if (!v11 || (v14 - v12 == 0x8000000000000000 ? (v15 = v11 == -1) : (v15 = 0), v15))
  {
LABEL_29:
    result = sub_1CAF208B0();
    __break(1u);
    return result;
  }
  v13[2] = v8;
  v13[3] = 2 * ((uint64_t)(v14 - v12) / v11);
LABEL_19:
  v16 = *(_QWORD *)(sub_1CAF1FFA4() - 8);
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
    sub_1CAEE7068(0, v8, v18, a4);
  }
  swift_bridgeObjectRelease();
  return (uint64_t)v13;
}

BOOL _s12FamilyCircle11XPCActivityC8CriteriaV2eeoiySbAE_AEtFZ_0(uint64_t a1, uint64_t a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v17;
  char v18;
  _BOOL8 result;
  uint64_t v20;
  uint64_t v24;
  int v25;
  uint64_t v26;

  v2 = *(unsigned __int8 *)(a1 + 1);
  v4 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a1 + 16);
  v5 = *(_QWORD *)(a1 + 24);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(unsigned __int8 *)(a2 + 1);
  v9 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v10 = *(_QWORD *)(a2 + 24);
  v26 = *(_QWORD *)(a2 + 32);
  v11 = *(_BYTE *)a1 == 0;
  if (*(_BYTE *)a1)
    v12 = 0x616E65746E69616DLL;
  else
    v12 = 0x7974696C697475;
  if (v11)
    v13 = 0xE700000000000000;
  else
    v13 = 0xEB0000000065636ELL;
  if (*(_BYTE *)a2)
    v14 = 0x616E65746E69616DLL;
  else
    v14 = 0x7974696C697475;
  if (*(_BYTE *)a2)
    v15 = 0xEB0000000065636ELL;
  else
    v15 = 0xE700000000000000;
  if (v12 == v14 && v13 == v15)
  {
    v20 = v3;
    swift_bridgeObjectRelease_n();
    if ((v2 ^ v7) == 1 || v4 != v9 || v20 != v8 || v5 != v10)
      return 0;
    return v6 == v26;
  }
  v25 = *(unsigned __int8 *)(a2 + 1);
  v24 = *(_QWORD *)(a2 + 16);
  v17 = v3;
  v18 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  result = 0;
  if ((v18 & 1) != 0 && v2 == v25 && v4 == v9 && v17 == v24 && v5 == v10)
    return v6 == v26;
  return result;
}

uint64_t sub_1CAEE5E64(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  uint64_t v31;
  void *v32;
  uint64_t result;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 aBlock;
  uint64_t (*v48)(uint64_t);
  void *v49;
  uint64_t (*v50)();
  uint64_t v51;

  v9 = v8;
  v44 = a7;
  v45 = a8;
  v42 = a5;
  v43 = a6;
  v41 = a4;
  v46 = a3;
  v40 = sub_1CAF206D0();
  MEMORY[0x1E0C80A78](v40);
  v39 = (char *)&v34 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = sub_1CAF206DC();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_1CAF2037C();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v34 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_BYTE *)(v8 + 80) = 0;
  v38 = sub_1CAEE72C4();
  *(_QWORD *)(v8 + 88) = 0;
  *(_QWORD *)(v8 + 96) = 0;
  strcpy((char *)&aBlock, "XPCActivity-");
  BYTE13(aBlock) = 0;
  HIWORD(aBlock) = -5120;
  sub_1CAF204A8();
  v36 = *((_QWORD *)&aBlock + 1);
  v37 = aBlock;
  v34 = v18;
  v35 = v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v20, v46, v17);
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF8D8], v13);
  *(_QWORD *)&aBlock = MEMORY[0x1E0DEE9D8];
  sub_1CAEE7300();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7C8);
  sub_1CAEDCE8C((unint64_t *)&qword_1ECFCE7D0, &qword_1ECFCE7C8, MEMORY[0x1E0DEAF38]);
  sub_1CAF207B4();
  v21 = v41;
  *(_QWORD *)(v8 + 16) = sub_1CAF20700();
  *(_QWORD *)(v8 + 24) = a1;
  v22 = v42;
  v23 = v43;
  *(_QWORD *)(v8 + 32) = a2;
  *(_QWORD *)(v8 + 40) = v22;
  v24 = v44;
  v25 = v45;
  *(_QWORD *)(v8 + 48) = v23;
  *(_QWORD *)(v8 + 56) = v24;
  *(_QWORD *)(v8 + 64) = v25;
  v26 = v8 + OBJC_IVAR____TtC12FamilyCircle11XPCActivity_logger;
  v27 = sub_1CAF202E0();
  v28 = *(_QWORD *)(v27 - 8);
  v29 = v21;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v26, v21, v27);
  v30 = *(NSObject **)(v9 + 16);
  v31 = swift_allocObject();
  *(_QWORD *)(v31 + 16) = sub_1CAEE6220;
  *(_QWORD *)(v31 + 24) = v9;
  v50 = sub_1CAEE7370;
  v51 = v31;
  *(_QWORD *)&aBlock = MEMORY[0x1E0C809B0];
  *((_QWORD *)&aBlock + 1) = 1107296256;
  v48 = sub_1CAEE163C;
  v49 = &block_descriptor_43;
  v32 = _Block_copy(&aBlock);
  swift_retain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  dispatch_sync(v30, v32);
  _Block_release(v32);
  LOBYTE(v30) = swift_isEscapingClosureAtFileLocation();
  swift_release();
  result = swift_release();
  if ((v30 & 1) != 0)
  {
    __break(1u);
  }
  else
  {
    (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v29, v27);
    (*(void (**)(uint64_t, uint64_t))(v34 + 8))(v46, v35);
    return v9;
  }
  return result;
}

uint64_t sub_1CAEE61D0()
{
  _QWORD *v0;

  return sub_1CAEE142C(v0);
}

uint64_t sub_1CAEE61D8()
{
  return swift_deallocObject();
}

uint64_t sub_1CAEE61E8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1CAEE6220()
{
  uint64_t v0;

  return sub_1CAEE35B8(v0);
}

uint64_t sub_1CAEE6228()
{
  return swift_deallocObject();
}

unint64_t sub_1CAEE6238()
{
  unint64_t result;

  result = qword_1EF991128;
  if (!qword_1EF991128)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF253A4, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF991128);
  }
  return result;
}

unint64_t sub_1CAEE627C()
{
  unint64_t result;

  result = qword_1EF991130;
  if (!qword_1EF991130)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Priority, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_1EF991130);
  }
  return result;
}

unint64_t sub_1CAEE62C0()
{
  unint64_t result;

  result = qword_1EF991138;
  if (!qword_1EF991138)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Criteria.Options, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_1EF991138);
  }
  return result;
}

unint64_t sub_1CAEE6304()
{
  unint64_t result;

  result = qword_1EF991148;
  if (!qword_1EF991148)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Priority, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_1EF991148);
  }
  return result;
}

unint64_t sub_1CAEE6348()
{
  unint64_t result;

  result = qword_1EF991150;
  if (!qword_1EF991150)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Criteria.Options, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_1EF991150);
  }
  return result;
}

uint64_t sub_1CAEE638C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1CAEE63B0(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

unint64_t sub_1CAEE63C4()
{
  unint64_t result;

  result = qword_1EF991158;
  if (!qword_1EF991158)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Priority, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_1EF991158);
  }
  return result;
}

unint64_t sub_1CAEE640C()
{
  unint64_t result;

  result = qword_1EF991160;
  if (!qword_1EF991160)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.State, &type metadata for XPCActivity.State);
    atomic_store(result, (unint64_t *)&qword_1EF991160);
  }
  return result;
}

unint64_t sub_1CAEE6454()
{
  unint64_t result;

  result = qword_1EF991168;
  if (!qword_1EF991168)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Criteria.Options, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_1EF991168);
  }
  return result;
}

unint64_t sub_1CAEE649C()
{
  unint64_t result;

  result = qword_1EF991170;
  if (!qword_1EF991170)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Criteria.Options, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_1EF991170);
  }
  return result;
}

unint64_t sub_1CAEE64E4()
{
  unint64_t result;

  result = qword_1EF98FD88;
  if (!qword_1EF98FD88)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Criteria.Options, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_1EF98FD88);
  }
  return result;
}

unint64_t sub_1CAEE652C()
{
  unint64_t result;

  result = qword_1EF98FD90;
  if (!qword_1EF98FD90)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Criteria.Options, &type metadata for XPCActivity.Criteria.Options);
    atomic_store(result, (unint64_t *)&qword_1EF98FD90);
  }
  return result;
}

uint64_t sub_1CAEE6570()
{
  return type metadata accessor for XPCActivity();
}

uint64_t type metadata accessor for XPCActivity()
{
  uint64_t result;

  result = qword_1ECFCE760;
  if (!qword_1ECFCE760)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CAEE65B4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CAF202E0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for XPCActivity()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCActivity.__allocating_init(name:qos:logger:criteriaBlock:handler:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 144))();
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCActivity.Priority(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCActivity.Priority(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1CAEE6764 + 4 * byte_1CAF24D03[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CAEE6798 + 4 * byte_1CAF24CFE[v4]))();
}

uint64_t sub_1CAEE6798(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEE67A0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAEE67A8);
  return result;
}

uint64_t sub_1CAEE67B4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAEE67BCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CAEE67C0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEE67C8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEE67D4(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1CAEE67DC(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.Priority()
{
  return &type metadata for XPCActivity.Priority;
}

uint64_t getEnumTagSinglePayload for XPCActivity.State(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFA)
    goto LABEL_17;
  if (a2 + 6 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 6) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 6;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 6;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 6;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 7;
  v8 = v6 - 7;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCActivity.State(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 6 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 6) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFA)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF9)
    return ((uint64_t (*)(void))((char *)&loc_1CAEE68D4 + 4 * byte_1CAF24D0D[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_1CAEE6908 + 4 * byte_1CAF24D08[v4]))();
}

uint64_t sub_1CAEE6908(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEE6910(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAEE6918);
  return result;
}

uint64_t sub_1CAEE6924(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAEE692CLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_1CAEE6930(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEE6938(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_1CAEE6944(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.State()
{
  return &type metadata for XPCActivity.State;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for XPCActivity.Criteria(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[40])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = v3 - 2;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCActivity.Criteria(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.Criteria()
{
  return &type metadata for XPCActivity.Criteria;
}

ValueMetadata *type metadata accessor for XPCActivity.Criteria.Options()
{
  return &type metadata for XPCActivity.Criteria.Options;
}

uint64_t getEnumTagSinglePayload for XPCActivity.Criteria.CodingKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_17;
  if (a2 + 5 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 5) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 5;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 5;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 5;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 6;
  v8 = v6 - 6;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for XPCActivity.Criteria.CodingKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1CAEE6AFC + 4 * byte_1CAF24D17[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1CAEE6B30 + 4 * byte_1CAF24D12[v4]))();
}

uint64_t sub_1CAEE6B30(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEE6B38(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAEE6B40);
  return result;
}

uint64_t sub_1CAEE6B4C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAEE6B54);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1CAEE6B58(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEE6B60(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for XPCActivity.Criteria.CodingKeys()
{
  return &type metadata for XPCActivity.Criteria.CodingKeys;
}

unint64_t sub_1CAEE6B80()
{
  unint64_t result;

  result = qword_1EF991180;
  if (!qword_1EF991180)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF2537C, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF991180);
  }
  return result;
}

unint64_t sub_1CAEE6BC8()
{
  unint64_t result;

  result = qword_1EF991188;
  if (!qword_1EF991188)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF252EC, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF991188);
  }
  return result;
}

unint64_t sub_1CAEE6C10()
{
  unint64_t result;

  result = qword_1EF991190;
  if (!qword_1EF991190)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF25314, &type metadata for XPCActivity.Criteria.CodingKeys);
    atomic_store(result, (unint64_t *)&qword_1EF991190);
  }
  return result;
}

uint64_t sub_1CAEE6C54(uint64_t a1, uint64_t a2)
{
  BOOL v2;
  char v6;

  v2 = a1 == 0x797469726F697270 && a2 == 0xE800000000000000;
  if (v2 || (sub_1CAF209A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  else if (a1 == 0x6E69746165706572 && a2 == 0xE900000000000067 || (sub_1CAF209A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 1;
  }
  else if (a1 == 0x79616C6564 && a2 == 0xE500000000000000 || (sub_1CAF209A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 2;
  }
  else if (a1 == 0x7265506563617267 && a2 == 0xEB00000000646F69 || (sub_1CAF209A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 3;
  }
  else if (a1 == 0x6C61767265746E69 && a2 == 0xE800000000000000 || (sub_1CAF209A0() & 1) != 0)
  {
    swift_bridgeObjectRelease();
    return 4;
  }
  else if (a1 == 0x736E6F6974706FLL && a2 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    return 5;
  }
  else
  {
    v6 = sub_1CAF209A0();
    swift_bridgeObjectRelease();
    if ((v6 & 1) != 0)
      return 5;
    else
      return 6;
  }
}

unint64_t sub_1CAEE6EF0()
{
  unint64_t result;

  result = qword_1EF991198;
  if (!qword_1EF991198)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.State, &type metadata for XPCActivity.State);
    atomic_store(result, (unint64_t *)&qword_1EF991198);
  }
  return result;
}

unint64_t sub_1CAEE6F34()
{
  unint64_t result;

  result = qword_1EF9911A0;
  if (!qword_1EF9911A0)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for XPCActivity.Priority, &type metadata for XPCActivity.Priority);
    atomic_store(result, (unint64_t *)&qword_1EF9911A0);
  }
  return result;
}

uint64_t sub_1CAEE6F78(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 16 * a1 + 32;
    v6 = a3 + 16 * v4;
    if (v5 >= v6 || v5 + 16 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

uint64_t sub_1CAEE7068(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v8 = *(_QWORD *)(sub_1CAF1FFA4() - 8);
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
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

uint64_t sub_1CAEE7180(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 32 * a1 + 32;
    v6 = a3 + 32 * v4;
    if (v5 >= v6 || v5 + 32 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

uint64_t sub_1CAEE7270()
{
  return swift_deallocObject();
}

uint64_t sub_1CAEE7280()
{
  return swift_deallocObject();
}

uint64_t sub_1CAEE7290()
{
  swift_weakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CAEE72B4(uint64_t a1)
{
  return sub_1CAEE36CC(a1);
}

uint64_t sub_1CAEE72BC(uint64_t a1)
{
  uint64_t v1;

  return sub_1CAEE3B70(a1, *(_xpc_activity_s **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

unint64_t sub_1CAEE72C4()
{
  unint64_t result;

  result = qword_1ECFCE798;
  if (!qword_1ECFCE798)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ECFCE798);
  }
  return result;
}

unint64_t sub_1CAEE7300()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECFCE7E0;
  if (!qword_1ECFCE7E0)
  {
    v1 = sub_1CAF206D0();
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0DEF828], v1);
    atomic_store(result, (unint64_t *)&qword_1ECFCE7E0);
  }
  return result;
}

uint64_t sub_1CAEE7348()
{
  return swift_deallocObject();
}

uint64_t sub_1CAEE7358@<X0>(uint64_t *a1@<X8>)
{
  return sub_1CAEE1208(a1);
}

FamilyCircle::MessageUtilErrors_optional __swiftcall MessageUtilErrors.init(rawValue:)(Swift::Int rawValue)
{
  _BYTE *v1;

  if (rawValue > -201)
  {
    if (rawValue == -200)
    {
      *v1 = 1;
      return (FamilyCircle::MessageUtilErrors_optional)rawValue;
    }
    if (rawValue == -100)
    {
      *v1 = 0;
      return (FamilyCircle::MessageUtilErrors_optional)rawValue;
    }
LABEL_8:
    *v1 = 4;
    return (FamilyCircle::MessageUtilErrors_optional)rawValue;
  }
  if (rawValue == -400)
  {
    *v1 = 3;
    return (FamilyCircle::MessageUtilErrors_optional)rawValue;
  }
  if (rawValue != -300)
    goto LABEL_8;
  *v1 = 2;
  return (FamilyCircle::MessageUtilErrors_optional)rawValue;
}

uint64_t MessageUtilErrors.rawValue.getter()
{
  unsigned __int8 *v0;

  return -100 * *v0 - 100;
}

uint64_t sub_1CAEE7418()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

uint64_t sub_1CAEE7464()
{
  return sub_1CAF20A24();
}

uint64_t sub_1CAEE7498()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

FamilyCircle::MessageUtilErrors_optional sub_1CAEE74E0(Swift::Int *a1)
{
  return MessageUtilErrors.init(rawValue:)(*a1);
}

void sub_1CAEE74E8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = -100 * *v1 - 100;
}

id iMessageServiceAvailabilty.deinit()
{
  uint64_t v0;
  id result;
  void *v2;
  void *v3;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2 = result;
    v3 = (void *)sub_1CAF203DC();
    objc_msgSend(v2, sel_removeListenerID_forService_, v3, 1);
    swift_bridgeObjectRelease();

    return (id)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id iMessageServiceAvailabilty.__deallocating_deinit()
{
  id result;
  void *v1;
  void *v2;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v1 = result;
    v2 = (void *)sub_1CAF203DC();
    objc_msgSend(v1, sel_removeListenerID_forService_, v2, 1);
    swift_bridgeObjectRelease();

    return (id)swift_deallocClassInstance();
  }
  else
  {
    __break(1u);
  }
  return result;
}

id iMessageServiceAvailabilty.__allocating_init()()
{
  uint64_t v0;
  id result;
  void *v2;
  void *v3;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = 0xD000000000000021;
  *(_QWORD *)(v0 + 24) = 0x80000001CAF2A850;
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2 = result;
    v3 = (void *)sub_1CAF203DC();
    objc_msgSend(v2, sel_addListenerID_forService_, v3, 1);

    return (id)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id iMessageServiceAvailabilty.init()()
{
  uint64_t v0;
  id result;
  void *v2;
  void *v3;

  *(_QWORD *)(v0 + 16) = 0xD000000000000021;
  *(_QWORD *)(v0 + 24) = 0x80000001CAF2A850;
  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v2 = result;
    v3 = (void *)sub_1CAF203DC();
    objc_msgSend(v2, sel_addListenerID_forService_, v3, 1);

    return (id)v0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1CAEE776C()
{
  sub_1CAEE7784((SEL *)&selRef_removeListenerID_forService_);
}

void sub_1CAEE7778()
{
  sub_1CAEE7784((SEL *)&selRef_addListenerID_forService_);
}

void sub_1CAEE7784(SEL *a1)
{
  id v2;
  void *v3;
  id v4;

  v2 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v2)
  {
    v3 = v2;
    v4 = (id)sub_1CAF203DC();
    objc_msgSend(v3, *a1, v4, 1);

  }
  else
  {
    __break(1u);
  }
}

id sub_1CAEE7804()
{
  id result;
  void *v1;
  void *v2;
  id v3;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v1 = result;
    v2 = (void *)sub_1CAF203DC();
    v3 = objc_msgSend(v1, sel_availabilityForListenerID_forService_, v2, 1);

    return (id)(v3 == (id)1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_1CAEE7888(uint64_t a1, uint64_t a2)
{
  sub_1CAEE78A0(a1, a2, (SEL *)&selRef_removeListenerID_forService_);
}

void sub_1CAEE7894(uint64_t a1, uint64_t a2)
{
  sub_1CAEE78A0(a1, a2, (SEL *)&selRef_addListenerID_forService_);
}

void sub_1CAEE78A0(uint64_t a1, uint64_t a2, SEL *a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (v4)
  {
    v5 = v4;
    v6 = (id)sub_1CAF203DC();
    objc_msgSend(v5, *a3, v6, 1);

  }
  else
  {
    __break(1u);
  }
}

id sub_1CAEE7924()
{
  id result;
  void *v1;
  void *v2;
  id v3;

  result = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (result)
  {
    v1 = result;
    v2 = (void *)sub_1CAF203DC();
    v3 = objc_msgSend(v1, sel_availabilityForListenerID_forService_, v2, 1);

    return (id)(v3 == (id)1);
  }
  else
  {
    __break(1u);
  }
  return result;
}

_QWORD *sub_1CAEE79AC()
{
  _QWORD *result;

  type metadata accessor for DefaultIDSProvider();
  swift_allocObject();
  result = sub_1CAEE79E4();
  qword_1EF9951E8 = (uint64_t)result;
  return result;
}

_QWORD *sub_1CAEE79E4()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  uint64_t inited;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  _QWORD v21[2];
  unint64_t v22;
  unint64_t v23;

  v1 = v0;
  v2 = sub_1CAF206D0();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1CAF2037C();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1CAF206DC();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v0[2] = 0xD000000000000010;
  v0[3] = 0x80000001CAF2A540;
  v0[6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D00130]), sel_init);
  v8 = sub_1CAEEBF3C(0, (unint64_t *)&qword_1ECFCE798);
  v21[0] = 0x80000001CAF2A540;
  v21[1] = v8;
  v22 = 0xD000000000000010;
  v23 = 0x80000001CAF2A540;
  sub_1CAF204A8();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0DEF8D8], v4);
  sub_1CAF20370();
  v22 = MEMORY[0x1E0DEE9D8];
  sub_1CAEE7300();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7C8);
  sub_1CAEEBF74();
  sub_1CAF207B4();
  v0[4] = sub_1CAF20700();
  v9 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  if (!v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
    *(_QWORD *)(inited + 32) = sub_1CAF20400();
    *(_QWORD *)(inited + 40) = v11;
    *(_QWORD *)(inited + 48) = 0xD000000000000029;
    *(_QWORD *)(inited + 56) = 0x80000001CAF2AB60;
    *(_QWORD *)(inited + 64) = sub_1CAF20400();
    *(_QWORD *)(inited + 72) = v12;
    *(_QWORD *)(inited + 80) = 0xD000000000000029;
    *(_QWORD *)(inited + 88) = 0x80000001CAF2AB60;
    v13 = sub_1CAF0BA9C(inited);
    sub_1CAF0BF38(v13);
    swift_bridgeObjectRelease();
    v14 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v15 = (void *)sub_1CAF203DC();
    v16 = (void *)sub_1CAF20388();
    swift_bridgeObjectRelease();
    v17 = objc_msgSend(v14, sel_initWithDomain_code_userInfo_, v15, 500, v16);

    if (qword_1ECFCE888 != -1)
      swift_once();
    v18 = sub_1CAF202E0();
    __swift_project_value_buffer(v18, (uint64_t)qword_1ECFCE8A8);
    v19 = v17;
    sub_1CAF1C254(v17);

    v9 = 0;
  }
  v1[5] = v9;
  return v1;
}

uint64_t sub_1CAEE7D78(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 80) = a2;
  *(_QWORD *)(v3 + 24) = a1;
  *(_QWORD *)(v3 + 32) = v2;
  return swift_task_switch();
}

uint64_t sub_1CAEE7D94()
{
  uint64_t v0;
  void *v1;
  int v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v14;
  char v15;
  unint64_t v16;
  uint64_t v17;
  _BOOL8 v18;
  uint64_t result;
  char v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  unint64_t v33;
  uint64_t v34;
  _BOOL8 v35;
  char v36;
  char v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  id v44;
  id v45;

  v1 = *(void **)(*(_QWORD *)(v0 + 32) + 40);
  *(_QWORD *)(v0 + 40) = v1;
  if (v1)
  {
    v2 = *(unsigned __int8 *)(v0 + 80);
    v3 = (void *)objc_opt_self();
    v4 = v1;
    v5 = objc_msgSend(v3, sel_refreshIDInfo);
    v6 = v5;
    *(_QWORD *)(v0 + 48) = v5;
    if (v2 == 1)
      objc_msgSend(v5, sel_setForceRefresh_, 1);
    v7 = *(_QWORD *)(v0 + 24);
    v8 = swift_allocObject();
    *(_QWORD *)(v0 + 56) = v8;
    *(_QWORD *)(v8 + 16) = MEMORY[0x1E0DEE9E0];
    v9 = *(_QWORD *)(v7 + 16);
    if (!v9)
    {
LABEL_35:
      v41 = *(_QWORD *)(v0 + 32);
      v42 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 64) = v42;
      v42[2] = v4;
      v42[3] = v7;
      v42[4] = 1;
      v42[5] = v6;
      v42[6] = v41;
      v42[7] = v8;
      v43 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 72) = v43;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991228);
      *v43 = v0;
      v43[1] = sub_1CAEE820C;
      return sub_1CAF20988();
    }
    v44 = v6;
    v45 = v4;
    swift_bridgeObjectRetain();
    v10 = (uint64_t *)(v7 + 40);
    while (1)
    {
      v12 = *(v10 - 1);
      v11 = *v10;
      swift_bridgeObjectRetain();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v14 = *(_QWORD **)(v8 + 16);
      *(_QWORD *)(v8 + 16) = 0x8000000000000000;
      v16 = sub_1CAEDE164(v12, v11);
      v17 = v14[2];
      v18 = (v15 & 1) == 0;
      result = v17 + v18;
      if (__OFADD__(v17, v18))
      {
        __break(1u);
        goto LABEL_41;
      }
      v20 = v15;
      if (v14[3] >= result)
      {
        if ((isUniquelyReferenced_nonNull_native & 1) != 0)
        {
          if ((v15 & 1) == 0)
            goto LABEL_15;
        }
        else
        {
          result = (uint64_t)sub_1CAEEA930();
          if ((v20 & 1) == 0)
            goto LABEL_15;
        }
      }
      else
      {
        sub_1CAEE9F28(result, isUniquelyReferenced_nonNull_native);
        result = sub_1CAEDE164(v12, v11);
        if ((v20 & 1) != (v21 & 1))
          return sub_1CAF209B8();
        v16 = result;
        if ((v20 & 1) == 0)
        {
LABEL_15:
          v14[(v16 >> 6) + 8] |= 1 << v16;
          v22 = (uint64_t *)(v14[6] + 16 * v16);
          *v22 = v12;
          v22[1] = v11;
          *(_BYTE *)(v14[7] + v16) = 0;
          v23 = v14[2];
          v24 = __OFADD__(v23, 1);
          v25 = v23 + 1;
          if (v24)
            goto LABEL_42;
          v14[2] = v25;
          swift_bridgeObjectRetain();
          goto LABEL_7;
        }
      }
      *(_BYTE *)(v14[7] + v16) = 0;
LABEL_7:
      *(_QWORD *)(v8 + 16) = v14;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v10 += 2;
      if (!--v9)
      {
        swift_bridgeObjectRelease();
        v7 = *(_QWORD *)(v0 + 24);
        v6 = v44;
        v4 = v45;
        goto LABEL_35;
      }
    }
  }
  v26 = *(_QWORD *)(*(_QWORD *)(v0 + 24) + 16);
  if (!v26)
  {
    v28 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v28);
  }
  v27 = (uint64_t *)(swift_bridgeObjectRetain() + 40);
  v28 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  while (1)
  {
    v30 = *(v27 - 1);
    v29 = *v27;
    swift_bridgeObjectRetain();
    v31 = swift_isUniquelyReferenced_nonNull_native();
    v33 = sub_1CAEDE164(v30, v29);
    v34 = v28[2];
    v35 = (v32 & 1) == 0;
    result = v34 + v35;
    if (__OFADD__(v34, v35))
      break;
    v36 = v32;
    if (v28[3] >= result)
    {
      if ((v31 & 1) != 0)
      {
        if ((v32 & 1) != 0)
          goto LABEL_21;
      }
      else
      {
        result = (uint64_t)sub_1CAEEA930();
        if ((v36 & 1) != 0)
          goto LABEL_21;
      }
    }
    else
    {
      sub_1CAEE9F28(result, v31);
      result = sub_1CAEDE164(v30, v29);
      if ((v36 & 1) != (v37 & 1))
        return sub_1CAF209B8();
      v33 = result;
      if ((v36 & 1) != 0)
      {
LABEL_21:
        *(_BYTE *)(v28[7] + v33) = 0;
        goto LABEL_22;
      }
    }
    v28[(v33 >> 6) + 8] |= 1 << v33;
    v38 = (uint64_t *)(v28[6] + 16 * v33);
    *v38 = v30;
    v38[1] = v29;
    *(_BYTE *)(v28[7] + v33) = 0;
    v39 = v28[2];
    v24 = __OFADD__(v39, 1);
    v40 = v39 + 1;
    if (v24)
      goto LABEL_43;
    v28[2] = v40;
    swift_bridgeObjectRetain();
LABEL_22:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v27 += 2;
    if (!--v26)
    {
      swift_bridgeObjectRelease();
      return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v28);
    }
  }
LABEL_41:
  __break(1u);
LABEL_42:
  __break(1u);
LABEL_43:
  __break(1u);
  return result;
}

uint64_t sub_1CAEE820C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEE8268()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);

  swift_release();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

void sub_1CAEE82A8(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD aBlock[6];

  v22 = a7;
  v25 = a4;
  v26 = a5;
  v24 = a2;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991230);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v21 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAEE84A4(a3);
  v23 = sub_1CAF205A4();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1CAF203DC();
  v15 = (void *)sub_1CAF203DC();
  v21 = *(_QWORD *)(a6 + 32);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a1, v10);
  v16 = (*(unsigned __int8 *)(v11 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v17 = (v12 + v16 + 7) & 0xFFFFFFFFFFFFFFF8;
  v18 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v11 + 32))(v18 + v16, v13, v10);
  *(_QWORD *)(v18 + v17) = v22;
  *(_QWORD *)(v18 + ((v17 + 15) & 0xFFFFFFFFFFFFFFF8)) = a6;
  aBlock[4] = sub_1CAEEB7EC;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CAEE874C;
  aBlock[3] = &block_descriptor_24;
  v19 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  swift_release();
  v20 = (void *)v23;
  objc_msgSend(v24, sel_idInfoForDestinations_service_infoTypes_options_listenerID_queue_completionBlock_, v23, v14, v25, v26, v15, v21, v19);
  _Block_release(v19);

}

uint64_t sub_1CAEE84A4(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  __int128 v8;
  uint64_t v9;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (v1)
  {
    v9 = MEMORY[0x1E0DEE9D8];
    sub_1CAEF9A3C(0, v1, 0);
    v2 = v9;
    v4 = a1 + 40;
    do
    {
      swift_bridgeObjectRetain();
      swift_dynamicCast();
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1CAEF9A3C(0, *(_QWORD *)(v2 + 16) + 1, 1);
        v2 = v9;
      }
      v6 = *(_QWORD *)(v2 + 16);
      v5 = *(_QWORD *)(v2 + 24);
      if (v6 >= v5 >> 1)
      {
        sub_1CAEF9A3C(v5 > 1, v6 + 1, 1);
        v2 = v9;
      }
      v4 += 16;
      *(_QWORD *)(v2 + 16) = v6 + 1;
      sub_1CAEEBF2C(&v8, (_OWORD *)(v2 + 32 * v6 + 32));
      --v1;
    }
    while (v1);
  }
  return v2;
}

void sub_1CAEE85C8(uint64_t a1, id a2, uint64_t a3, uint64_t a4)
{
  id *v4;
  id v6;
  uint64_t v7;
  id v8;

  v4 = (id *)(a4 + 16);
  if (a2)
  {
    v6 = a2;
    if (qword_1ECFCE888 != -1)
      swift_once();
    v7 = sub_1CAF202E0();
    __swift_project_value_buffer(v7, (uint64_t)qword_1ECFCE8A8);
    v8 = a2;
    sub_1CAF1C254(a2);

    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991230);
    sub_1CAF20604();

  }
  else
  {
    if (a1 && *(_QWORD *)(a1 + 16))
    {
      swift_bridgeObjectRetain();
      swift_retain();
      sub_1CAEEBD1C(a1, a1, v4);
      swift_bridgeObjectRelease();
      swift_release();
    }
    swift_beginAccess();
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991230);
    sub_1CAF20604();
  }
}

uint64_t sub_1CAEE874C(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v4)(uint64_t, void *);
  uint64_t v5;
  id v6;

  v4 = *(void (**)(uint64_t, void *))(a1 + 32);
  if (a2)
    v5 = sub_1CAF20394();
  else
    v5 = 0;
  swift_retain();
  v6 = a3;
  v4(v5, a3);
  swift_release();

  return swift_bridgeObjectRelease();
}

void sub_1CAEE87E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t inited;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD aBlock[6];

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991220);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  v7 = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (v7)
  {
    v8 = v7;
    v9 = objc_msgSend(v7, sel_aida_accountForPrimaryiCloudAccount);

    if (v9)
    {
      v10 = objc_msgSend(v9, sel_appleID);
      if (v10)
      {
        v11 = v10;
        v12 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D34380]), sel_initWithQueue_, *(_QWORD *)(a2 + 32));
        (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))((char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v4);
        v13 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
        v14 = swift_allocObject();
        (*(void (**)(unint64_t, char *, uint64_t))(v5 + 32))(v14 + v13, (char *)aBlock - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v4);
        aBlock[4] = sub_1CAEEB6D0;
        aBlock[5] = v14;
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_1CAEE8E10;
        aBlock[3] = &block_descriptor_1;
        v15 = _Block_copy(aBlock);
        swift_release();
        objc_msgSend(v12, sel_signInUsername_onService_waitUntilRegistered_withCompletion_, v11, 1, 1, v15);
        _Block_release(v15);

      }
      else
      {
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
        inited = swift_initStackObject();
        *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
        *(_QWORD *)(inited + 32) = sub_1CAF20400();
        *(_QWORD *)(inited + 40) = v25;
        *(_QWORD *)(inited + 48) = 0xD000000000000010;
        *(_QWORD *)(inited + 56) = 0x80000001CAF2AA00;
        *(_QWORD *)(inited + 64) = sub_1CAF20400();
        *(_QWORD *)(inited + 72) = v26;
        *(_QWORD *)(inited + 80) = 0xD000000000000010;
        *(_QWORD *)(inited + 88) = 0x80000001CAF2AA00;
        v27 = sub_1CAF0BA9C(inited);
        sub_1CAF0BF38(v27);
        swift_bridgeObjectRelease();
        v28 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
        v29 = (void *)sub_1CAF203DC();
        v30 = (void *)sub_1CAF20388();
        swift_bridgeObjectRelease();
        v31 = objc_msgSend(v28, sel_initWithDomain_code_userInfo_, v29, -200, v30);

        aBlock[0] = v31;
        sub_1CAF20604();

      }
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
      v16 = swift_initStackObject();
      *(_OWORD *)(v16 + 16) = xmmword_1CAF25400;
      *(_QWORD *)(v16 + 32) = sub_1CAF20400();
      *(_QWORD *)(v16 + 40) = v17;
      *(_QWORD *)(v16 + 48) = 0xD000000000000012;
      *(_QWORD *)(v16 + 56) = 0x80000001CAF2A9E0;
      *(_QWORD *)(v16 + 64) = sub_1CAF20400();
      *(_QWORD *)(v16 + 72) = v18;
      *(_QWORD *)(v16 + 80) = 0xD000000000000012;
      *(_QWORD *)(v16 + 88) = 0x80000001CAF2A9E0;
      v19 = sub_1CAF0BA9C(v16);
      sub_1CAF0BF38(v19);
      swift_bridgeObjectRelease();
      v20 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      v21 = (void *)sub_1CAF203DC();
      v22 = (void *)sub_1CAF20388();
      swift_bridgeObjectRelease();
      v23 = objc_msgSend(v20, sel_initWithDomain_code_userInfo_, v21, -100, v22);

      aBlock[0] = v23;
      sub_1CAF20604();
    }
  }
  else
  {
    __break(1u);
  }
}

uint64_t sub_1CAEE8C3C(id a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  if (a1)
  {
    swift_getErrorValue();
    v2 = a1;
    v3 = sub_1CAF209DC();
    v5 = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
    *(_QWORD *)(inited + 32) = sub_1CAF20400();
    *(_QWORD *)(inited + 40) = v7;
    *(_QWORD *)(inited + 48) = v3;
    *(_QWORD *)(inited + 56) = v5;
    *(_QWORD *)(inited + 64) = sub_1CAF20400();
    *(_QWORD *)(inited + 72) = v8;
    *(_QWORD *)(inited + 80) = v3;
    *(_QWORD *)(inited + 88) = v5;
    swift_bridgeObjectRetain_n();
    v9 = sub_1CAF0BA9C(inited);
    sub_1CAF0BF38(v9);
    swift_bridgeObjectRelease();
    v10 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v11 = (void *)sub_1CAF203DC();
    v12 = (void *)sub_1CAF20388();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_initWithDomain_code_userInfo_, v11, -300, v12);
    swift_bridgeObjectRelease();

    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991220);
    sub_1CAF20604();

  }
  v13 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991220);
  return sub_1CAF20604();
}

void sub_1CAEE8E10(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t sub_1CAEE8E64()
{
  id *v0;

  swift_bridgeObjectRelease();

  return swift_deallocClassInstance();
}

uint64_t sub_1CAEE8EA0(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;

  v6 = *v2;
  v7 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *(_QWORD *)v7 = v3;
  *(_QWORD *)(v7 + 8) = sub_1CAEEBFFC;
  *(_BYTE *)(v7 + 80) = a2;
  *(_QWORD *)(v7 + 24) = a1;
  *(_QWORD *)(v7 + 32) = v6;
  return swift_task_switch();
}

uint64_t sub_1CAEE8F14()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = *v0;
  return swift_task_switch();
}

uint64_t sub_1CAEE8F30()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991218);
  *v1 = v0;
  v1[1] = sub_1CAEE8FC8;
  return sub_1CAF20988();
}

uint64_t sub_1CAEE8FC8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEE901C()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1CAEE905C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  id result;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  _UNKNOWN **v11;
  __int128 v12;
  uint64_t v13;
  _UNKNOWN **v14;
  __int128 v15;
  uint64_t v16;
  _UNKNOWN **v17;

  if (qword_1EF990D28 != -1)
    swift_once();
  v0 = qword_1EF9951E8;
  v1 = type metadata accessor for iMessageServiceAvailabilty();
  v2 = swift_allocObject();
  *(_QWORD *)(v2 + 16) = 0xD000000000000021;
  *(_QWORD *)(v2 + 24) = 0x80000001CAF2A850;
  v3 = (void *)objc_opt_self();
  swift_retain();
  result = objc_msgSend(v3, sel_sharedInstance);
  if (result)
  {
    v5 = result;
    v6 = (void *)sub_1CAF203DC();
    objc_msgSend(v5, sel_addListenerID_forService_, v6, 1);

    v7 = qword_1EF9951E8;
    v16 = type metadata accessor for DefaultIDSProvider();
    v17 = &off_1E8561330;
    v14 = &protocol witness table for iMessageServiceAvailabilty;
    *(_QWORD *)&v15 = v0;
    v13 = v1;
    v11 = &off_1E8561320;
    *(_QWORD *)&v12 = v2;
    v10 = v16;
    *(_QWORD *)&v9 = v7;
    type metadata accessor for MessageUtil();
    v8 = swift_allocObject();
    swift_retain_n();
    swift_retain();
    swift_retain();
    swift_defaultActor_initialize();
    sub_1CAEDCE74(&v15, v8 + 112);
    sub_1CAEDCE74(&v12, v8 + 152);
    sub_1CAEDCE74(&v9, v8 + 192);
    swift_release();
    swift_release();
    result = (id)swift_release();
    qword_1EF9911B8 = v8;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t MessageUtil.__allocating_init(messageStatusProvider:messageServiceAvailabilty:messageSigninProvider:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v6 = *(_QWORD *)(a1 + 24);
  v26 = *(_QWORD *)(a1 + 32);
  v7 = __swift_mutable_project_boxed_opaque_existential_1(a1, v6);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v10 + 16))(v9);
  v11 = *(_QWORD *)(a2 + 24);
  v25 = *(_QWORD *)(a2 + 32);
  v12 = __swift_mutable_project_boxed_opaque_existential_1(a2, v11);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v15 + 16))(v14);
  v17 = *(_QWORD *)(a3 + 24);
  v16 = *(_QWORD *)(a3 + 32);
  v18 = __swift_mutable_project_boxed_opaque_existential_1(a3, v17);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v24 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v21 + 16))(v20);
  v22 = sub_1CAEEB040((uint64_t)v9, (uint64_t)v14, (uint64_t)v20, v27, v6, v17, v11, v26, v16, v25);
  __swift_destroy_boxed_opaque_existential_1Tm(a3);
  __swift_destroy_boxed_opaque_existential_1Tm(a2);
  __swift_destroy_boxed_opaque_existential_1Tm(a1);
  return v22;
}

uint64_t static MessageUtil.shared.getter()
{
  if (qword_1EF990D30 != -1)
    swift_once();
  return swift_retain();
}

uint64_t MessageUtil.init(messageStatusProvider:messageServiceAvailabilty:messageSigninProvider:)(__int128 *a1, __int128 *a2, __int128 *a3)
{
  uint64_t v3;

  swift_defaultActor_initialize();
  sub_1CAEDCE74(a1, v3 + 112);
  sub_1CAEDCE74(a2, v3 + 152);
  sub_1CAEDCE74(a3, v3 + 192);
  return v3;
}

uint64_t static MessageUtil.testableMessageUtil(messageStatusProvider:messageServiceAvailabilty:messageSigninProvider:withEnvironment:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  _BYTE v29[24];
  uint64_t v30;
  uint64_t v31;
  _BYTE v32[24];
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[24];
  uint64_t v36;
  uint64_t v37;

  v28 = type metadata accessor for MessageUtil();
  sub_1CAEEB17C(a1, (uint64_t)v35);
  sub_1CAEEB17C(a2, (uint64_t)v32);
  sub_1CAEEB17C(a3, (uint64_t)v29);
  v9 = v36;
  v8 = v37;
  v10 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v35, v36);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v29[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v13 + 16))(v12);
  v14 = v33;
  v15 = v34;
  v16 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v32, v33);
  MEMORY[0x1E0C80A78](v16);
  v18 = &v29[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v19 + 16))(v18);
  v21 = v30;
  v20 = v31;
  v22 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v29, v30);
  MEMORY[0x1E0C80A78](v22);
  v24 = &v29[-((v23 + 15) & 0xFFFFFFFFFFFFFFF0) - 8];
  (*(void (**)(_BYTE *))(v25 + 16))(v24);
  v26 = sub_1CAEEB040((uint64_t)v12, (uint64_t)v18, (uint64_t)v24, v28, v9, v21, v14, v8, v20, v15);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v32);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v35);
  swift_beginAccess();
  if (*(_BYTE *)(a4 + 16) == 1)
  {
    if (qword_1EF990D30 != -1)
      swift_once();
    qword_1EF9911B8 = v26;
    swift_retain();
    swift_release();
  }
  return v26;
}

uint64_t sub_1CAEE965C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[22];
  v2 = v0[23];
  __swift_project_boxed_opaque_existential_1(v0 + 19, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2) & 1;
}

uint64_t sub_1CAEE96A4(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v3 + 40) = a2;
  *(_QWORD *)(v3 + 16) = a1;
  *(_QWORD *)(v3 + 24) = v2;
  return swift_task_switch();
}

uint64_t sub_1CAEE96C0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 24);
  v2 = v1[17];
  v3 = v1[18];
  __swift_project_boxed_opaque_existential_1(v1 + 14, v2);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = sub_1CAEE9748;
  return v6(*(_QWORD *)(v0 + 16), *(unsigned __int8 *)(v0 + 40), v2, v3);
}

uint64_t sub_1CAEE9748(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1CAEE9798(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = v1;
  return swift_task_switch();
}

uint64_t sub_1CAEE97B0()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  char v8;
  uint8_t *v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t inited;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t (*v22)(uint64_t, uint64_t);

  if (objc_msgSend(*(id *)(v0 + 128), sel_isMe))
  {
    v1 = *(_QWORD **)(v0 + 136);
    v2 = v1[22];
    v3 = v1[23];
    __swift_project_boxed_opaque_existential_1(v1 + 19, v2);
    v4 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(v2, v3);
    *(_BYTE *)(v0 + 189) = v4 & 1;
    if (qword_1ECFCE888 != -1)
      swift_once();
    v5 = sub_1CAF202E0();
    __swift_project_value_buffer(v5, (uint64_t)qword_1ECFCE8A8);
    v6 = sub_1CAF202C8();
    v7 = sub_1CAF206A0();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = v4 ^ 1;
      v9 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v9 = 67109120;
      *(_DWORD *)(v0 + 184) = v8 & 1;
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v6, v7, "Force refresh required if iMessage off, force: %{BOOL}d", v9, 8u);
      MEMORY[0x1D179A698](v9, -1, -1);
    }

    v10 = *(_QWORD **)(v0 + 136);
    v11 = v10[27];
    v12 = v10[28];
    __swift_project_boxed_opaque_existential_1(v10 + 24, v11);
    v22 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v12 + 8) + *(_QWORD *)(v12 + 8));
    v13 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 144) = v13;
    *v13 = v0;
    v13[1] = sub_1CAEE9A98;
    return v22(v11, v12);
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
    *(_QWORD *)(inited + 32) = sub_1CAF20400();
    *(_QWORD *)(inited + 40) = v16;
    *(_QWORD *)(inited + 48) = 0xD000000000000021;
    *(_QWORD *)(inited + 56) = 0x80000001CAF2A880;
    *(_QWORD *)(inited + 64) = sub_1CAF20400();
    *(_QWORD *)(inited + 72) = v17;
    *(_QWORD *)(inited + 80) = 0xD000000000000021;
    *(_QWORD *)(inited + 88) = 0x80000001CAF2A880;
    v18 = sub_1CAF0BA9C(inited);
    sub_1CAF0BF38(v18);
    swift_bridgeObjectRelease();
    v19 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v20 = (void *)sub_1CAF203DC();
    v21 = (void *)sub_1CAF20388();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_initWithDomain_code_userInfo_, v20, -400, v21);

    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAEE9A98()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 152) = v0;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1CAEE9B04()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 160) = FAFamilyMember.allKnownHandles.getter();
  if (qword_1EF990D30 != -1)
    swift_once();
  *(_QWORD *)(v0 + 168) = qword_1EF9911B8;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAEE9B80()
{
  uint64_t v0;
  _QWORD *v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(_QWORD, BOOL, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 168);
  v2 = *(_BYTE *)(v0 + 189);
  v3 = v1[17];
  v4 = v1[18];
  __swift_project_boxed_opaque_existential_1(v1 + 14, v3);
  v7 = (uint64_t (*)(_QWORD, BOOL, uint64_t, uint64_t))(**(int **)(v4 + 8) + *(_QWORD *)(v4 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 176) = v5;
  *v5 = v0;
  v5[1] = sub_1CAEE9C14;
  return v7(*(_QWORD *)(v0 + 160), (v2 & 1) == 0, v3, v4);
}

uint64_t sub_1CAEE9C14(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 112) = v1;
  *(_QWORD *)(v2 + 120) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEE9C6C()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CAEE9CB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF990DB8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 120);
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911D0);
  sub_1CAF206E8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t MessageUtil.deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 192);
  swift_defaultActor_destroy();
  return v0;
}

uint64_t MessageUtil.__deallocating_deinit()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 112);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 152);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 192);
  swift_defaultActor_destroy();
  return swift_defaultActor_deallocate();
}

uint64_t MessageUtil.unownedExecutor.getter()
{
  uint64_t v0;

  return v0;
}

uint64_t sub_1CAEE9E14()
{
  uint64_t v0;

  return v0;
}

void *sub_1CAEE9E20(void *__src, uint64_t a2, void *__dst, uint64_t a4)
{
  uint64_t v4;

  if (__src)
    v4 = a2 - (_QWORD)__src;
  else
    v4 = 0;
  if (!__dst)
  {
    if (v4 <= 0)
      return __src;
LABEL_10:
    __src = (void *)sub_1CAF208F8();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

uint64_t sub_1CAEE9EB4(uint64_t (*a1)(void))
{
  return a1() & 1;
}

uint64_t sub_1CAEE9ED8@<X0>(uint64_t (*a1)(void)@<X0>, _DWORD *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1CAEE9F00@<X0>(uint64_t (*a1)(void)@<X0>, uint64_t *a2@<X8>)
{
  uint64_t result;

  result = a1();
  *a2 = result;
  return result;
}

uint64_t sub_1CAEE9F28(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t v12;
  uint64_t result;
  int64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  char v30;
  unint64_t v31;
  BOOL v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991250);
  v37 = a2;
  v6 = sub_1CAF208E0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_38;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v35 = v2;
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  v12 = v6 + 64;
  result = swift_retain();
  v14 = 0;
  while (1)
  {
    if (v10)
    {
      v20 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v21 = v20 | (v14 << 6);
      goto LABEL_21;
    }
    if (__OFADD__(v14++, 1))
      goto LABEL_40;
    if (v14 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v36 + 8 * v14);
    if (!v24)
    {
      v25 = v14 + 1;
      if (v14 + 1 >= v11)
      {
LABEL_31:
        swift_release();
        v3 = v35;
        if ((v37 & 1) == 0)
          goto LABEL_38;
        goto LABEL_34;
      }
      v24 = *(_QWORD *)(v36 + 8 * v25);
      if (!v24)
      {
        while (1)
        {
          v14 = v25 + 1;
          if (__OFADD__(v25, 1))
            break;
          if (v14 >= v11)
            goto LABEL_31;
          v24 = *(_QWORD *)(v36 + 8 * v14);
          ++v25;
          if (v24)
            goto LABEL_20;
        }
LABEL_39:
        __break(1u);
LABEL_40:
        __break(1u);
        return result;
      }
      ++v14;
    }
LABEL_20:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_21:
    v26 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v21);
    v28 = *v26;
    v27 = v26[1];
    v29 = *(_BYTE *)(*(_QWORD *)(v5 + 56) + v21);
    if ((v37 & 1) == 0)
      swift_bridgeObjectRetain();
    sub_1CAF20A18();
    sub_1CAF20490();
    result = sub_1CAF20A30();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v30 = 0;
      v31 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v31 && (v30 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v32 = v17 == v31;
        if (v17 == v31)
          v17 = 0;
        v30 |= v32;
        v33 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v33 == -1);
      v18 = __clz(__rbit64(~v33)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v18);
    *v19 = v28;
    v19[1] = v27;
    *(_BYTE *)(*(_QWORD *)(v7 + 56) + v18) = v29;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v23 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_38;
LABEL_34:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v23, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_38:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAEEA210(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  int64_t v23;
  _QWORD *v24;
  unint64_t v25;
  int64_t v26;
  char v27;
  unint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  int64_t v40;
  uint64_t v41;
  char v42;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD18);
  v42 = a2;
  v6 = sub_1CAF208E0();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v41 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v39 = v2;
  v40 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v21 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v22 = v21 | (v13 << 6);
      goto LABEL_31;
    }
    v23 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v23 >= v40)
      break;
    v24 = (_QWORD *)(v5 + 64);
    v25 = *(_QWORD *)(v41 + 8 * v23);
    ++v13;
    if (!v25)
    {
      v13 = v23 + 1;
      if (v23 + 1 >= v40)
        goto LABEL_33;
      v25 = *(_QWORD *)(v41 + 8 * v13);
      if (!v25)
      {
        v26 = v23 + 2;
        if (v26 >= v40)
        {
LABEL_33:
          swift_release();
          v3 = v39;
          if ((v42 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v25 = *(_QWORD *)(v41 + 8 * v26);
        if (!v25)
        {
          while (1)
          {
            v13 = v26 + 1;
            if (__OFADD__(v26, 1))
              goto LABEL_42;
            if (v13 >= v40)
              goto LABEL_33;
            v25 = *(_QWORD *)(v41 + 8 * v13);
            ++v26;
            if (v25)
              goto LABEL_30;
          }
        }
        v13 = v26;
      }
    }
LABEL_30:
    v10 = (v25 - 1) & v25;
    v22 = __clz(__rbit64(v25)) + (v13 << 6);
LABEL_31:
    v31 = 16 * v22;
    v32 = (uint64_t *)(*(_QWORD *)(v5 + 48) + v31);
    v34 = *v32;
    v33 = v32[1];
    v35 = (uint64_t *)(*(_QWORD *)(v5 + 56) + v31);
    v36 = *v35;
    v37 = v35[1];
    if ((v42 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
    }
    sub_1CAF20A18();
    sub_1CAF20490();
    result = sub_1CAF20A30();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v27 = 0;
      v28 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v28 && (v27 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v29 = v16 == v28;
        if (v16 == v28)
          v16 = 0;
        v27 |= v29;
        v30 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v30 == -1);
      v17 = __clz(__rbit64(~v30)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = 16 * v17;
    v19 = (_QWORD *)(*(_QWORD *)(v7 + 48) + v18);
    *v19 = v34;
    v19[1] = v33;
    v20 = (_QWORD *)(*(_QWORD *)(v7 + 56) + v18);
    *v20 = v36;
    v20[1] = v37;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v39;
  v24 = (_QWORD *)(v5 + 64);
  if ((v42 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v38 = 1 << *(_BYTE *)(v5 + 32);
  if (v38 >= 64)
    bzero(v24, ((unint64_t)(v38 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v24 = -1 << v38;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_1CAEEA534(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD20);
  v6 = sub_1CAF208E0();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_1CAEEBF2C(v24, v35);
      }
      else
      {
        sub_1CAEDCD8C((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_1CAF20A18();
      sub_1CAF20490();
      result = sub_1CAF20A30();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_1CAEEBF2C(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_1CAEEA830(unint64_t result, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  _QWORD *v5;
  uint64_t v6;
  BOOL v7;
  uint64_t v8;

  a5[(result >> 6) + 8] |= 1 << result;
  v5 = (_QWORD *)(a5[6] + 16 * result);
  *v5 = a2;
  v5[1] = a3;
  *(_BYTE *)(a5[7] + result) = a4;
  v6 = a5[2];
  v7 = __OFADD__(v6, 1);
  v8 = v6 + 1;
  if (v7)
    __break(1u);
  else
    a5[2] = v8;
  return result;
}

unint64_t sub_1CAEEA878(unint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _QWORD *a6)
{
  _QWORD *v6;
  _QWORD *v7;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a6[(result >> 6) + 8] |= 1 << result;
  v6 = (_QWORD *)(a6[6] + 16 * result);
  *v6 = a2;
  v6[1] = a3;
  v7 = (_QWORD *)(a6[7] + 16 * result);
  *v7 = a4;
  v7[1] = a5;
  v8 = a6[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a6[2] = v10;
  return result;
}

_OWORD *sub_1CAEEA8C8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_1CAEEBF2C(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

void *sub_1CAEEA930()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991250);
  v2 = *v0;
  v3 = sub_1CAF208D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_24:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    if (__OFADD__(v9++, 1))
      goto LABEL_26;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    if (!v21)
      break;
LABEL_23:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v18 = *v16;
    v17 = v16[1];
    LOBYTE(v16) = *(_BYTE *)(*(_QWORD *)(v2 + 56) + v15);
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v15);
    *v19 = v18;
    v19[1] = v17;
    *(_BYTE *)(*(_QWORD *)(v4 + 56) + v15) = (_BYTE)v16;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v9 + 1;
  if (v9 + 1 >= v13)
    goto LABEL_24;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    ++v9;
    goto LABEL_23;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_24;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_23;
  }
  __break(1u);
LABEL_26:
  __break(1u);
  return result;
}

void *sub_1CAEEAAC0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  int64_t v21;
  unint64_t v22;
  int64_t v23;
  _OWORD v24[2];
  _OWORD v25[2];
  uint64_t v26;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991258);
  v2 = *v0;
  v3 = sub_1CAF208D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v21 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v21 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v21);
    ++v9;
    if (!v22)
    {
      v9 = v21 + 1;
      if (v21 + 1 >= v13)
        goto LABEL_26;
      v22 = *(_QWORD *)(v6 + 8 * v9);
      if (!v22)
        break;
    }
LABEL_25:
    v12 = (v22 - 1) & v22;
    v15 = __clz(__rbit64(v22)) + (v9 << 6);
LABEL_12:
    v16 = 40 * v15;
    sub_1CAEDF4E0(*(_QWORD *)(v2 + 48) + 40 * v15, (uint64_t)v25);
    v17 = 32 * v15;
    sub_1CAEDCD8C(*(_QWORD *)(v2 + 56) + v17, (uint64_t)v24);
    v18 = *(_QWORD *)(v4 + 48) + v16;
    v19 = v25[0];
    v20 = v25[1];
    *(_QWORD *)(v18 + 32) = v26;
    *(_OWORD *)v18 = v19;
    *(_OWORD *)(v18 + 16) = v20;
    result = sub_1CAEEBF2C(v24, (_OWORD *)(*(_QWORD *)(v4 + 56) + v17));
  }
  v23 = v21 + 2;
  if (v23 >= v13)
    goto LABEL_26;
  v22 = *(_QWORD *)(v6 + 8 * v23);
  if (v22)
  {
    v9 = v23;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v23 + 1;
    if (__OFADD__(v23, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v22 = *(_QWORD *)(v6 + 8 * v9);
    ++v23;
    if (v22)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAEEACA4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  _QWORD *v24;
  int64_t v25;
  unint64_t v26;
  int64_t v27;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD18);
  v2 = *v0;
  v3 = sub_1CAF208D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v25 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v25 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v25);
    ++v9;
    if (!v26)
    {
      v9 = v25 + 1;
      if (v25 + 1 >= v13)
        goto LABEL_26;
      v26 = *(_QWORD *)(v6 + 8 * v9);
      if (!v26)
        break;
    }
LABEL_25:
    v12 = (v26 - 1) & v26;
    v15 = __clz(__rbit64(v26)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + v16);
    v19 = *v17;
    v18 = v17[1];
    v20 = (uint64_t *)(*(_QWORD *)(v2 + 56) + v16);
    v21 = *v20;
    v22 = v20[1];
    v23 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v23 = v19;
    v23[1] = v18;
    v24 = (_QWORD *)(*(_QWORD *)(v4 + 56) + v16);
    *v24 = v21;
    v24[1] = v22;
    swift_bridgeObjectRetain();
    result = (void *)swift_bridgeObjectRetain();
  }
  v27 = v25 + 2;
  if (v27 >= v13)
    goto LABEL_26;
  v26 = *(_QWORD *)(v6 + 8 * v27);
  if (v26)
  {
    v9 = v27;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v27 + 1;
    if (__OFADD__(v27, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v26 = *(_QWORD *)(v6 + 8 * v9);
    ++v27;
    if (v26)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_1CAEEAE5C()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD20);
  v2 = *v0;
  v3 = sub_1CAF208D4();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_1CAEDCD8C(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_1CAEEBF2C(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1CAEEB040(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t *boxed_opaque_existential_1;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t v19;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;

  v28 = a5;
  v29 = a8;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v27);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a5 - 8) + 32))(boxed_opaque_existential_1, a1, a5);
  v25 = a7;
  v26 = a10;
  v17 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v24);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a7 - 8) + 32))(v17, a2, a7);
  v22 = a6;
  v23 = a9;
  v18 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v21);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(v18, a3, a6);
  type metadata accessor for MessageUtil();
  v19 = swift_allocObject();
  swift_defaultActor_initialize();
  sub_1CAEDCE74(&v27, v19 + 112);
  sub_1CAEDCE74(&v24, v19 + 152);
  sub_1CAEDCE74(&v21, v19 + 192);
  return v19;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t type metadata accessor for MessageUtil()
{
  return objc_opt_self();
}

uint64_t sub_1CAEEB17C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1CAEEB1C0()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1CAEEB1E4(BOOL *a1@<X8>)
{
  uint64_t v1;

  sub_1CAEFC1A8(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1CAEEB200()
{
  unint64_t result;

  result = qword_1EF9911D8;
  if (!qword_1EF9911D8)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for MessageUtilErrors, &type metadata for MessageUtilErrors);
    atomic_store(result, (unint64_t *)&qword_1EF9911D8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for MessageUtilErrors(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFD)
    goto LABEL_17;
  if (a2 + 3 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 3) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 3;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 3;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 3;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 4;
  v8 = v6 - 4;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for MessageUtilErrors(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1CAEEB320 + 4 * byte_1CAF25415[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1CAEEB354 + 4 * byte_1CAF25410[v4]))();
}

uint64_t sub_1CAEEB354(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEEB35C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAEEB364);
  return result;
}

uint64_t sub_1CAEEB370(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAEEB378);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1CAEEB37C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEEB384(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for MessageUtilErrors()
{
  return &type metadata for MessageUtilErrors;
}

uint64_t dispatch thunk of MessageAvailabiltyProvider.removeListenerID()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of MessageAvailabiltyProvider.addListenerID()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of MessageAvailabiltyProvider.available()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of MessageStatusProvider.canSendMessage(withHandles:forceRefresh:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);

  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(a4 + 8) + *(_QWORD *)(a4 + 8));
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1CAEEBFFC;
  return v11(a1, a2, a3, a4);
}

uint64_t dispatch thunk of MessageSigninProvider.addICloud()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAEDCEDC;
  return v7(a1, a2);
}

uint64_t type metadata accessor for iMessageServiceAvailabilty()
{
  return objc_opt_self();
}

uint64_t method lookup function for iMessageServiceAvailabilty()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of iMessageServiceAvailabilty.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of iMessageServiceAvailabilty.removeListenerID()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 96))();
}

uint64_t dispatch thunk of iMessageServiceAvailabilty.addListenerID()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t dispatch thunk of iMessageServiceAvailabilty.available()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 112))();
}

uint64_t type metadata accessor for DefaultIDSProvider()
{
  return objc_opt_self();
}

uint64_t method lookup function for MessageUtil()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of MessageUtil.__allocating_init(messageStatusProvider:messageServiceAvailabilty:messageSigninProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of MessageUtil.iMessageOnDevice.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 120))();
}

uint64_t dispatch thunk of MessageUtil.getHandleMessageStatus(_:forceRefresh:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 128) + *(_QWORD *)(*(_QWORD *)v2 + 128));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1CAEEB5B0;
  return v8(a1, a2);
}

uint64_t sub_1CAEEB5B0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of MessageUtil.addICloud(forMember:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 136) + *(_QWORD *)(*(_QWORD *)v1 + 136));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CAEDCC10;
  return v6(a1);
}

void sub_1CAEEB664(uint64_t a1)
{
  uint64_t v1;

  sub_1CAEE87E0(a1, v1);
}

uint64_t sub_1CAEEB66C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991220);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1CAEEB6D0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991220);
  return sub_1CAEE8C3C(a1);
}

uint64_t block_copy_helper_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_1()
{
  return swift_release();
}

uint64_t sub_1CAEEB728()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

void sub_1CAEEB74C(uint64_t a1)
{
  uint64_t v1;

  sub_1CAEE82A8(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), *(_QWORD *)(v1 + 48), *(_QWORD *)(v1 + 56));
}

uint64_t sub_1CAEEB75C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991230);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  swift_release();
  swift_release();
  return swift_deallocObject();
}

void sub_1CAEEB7EC(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  unint64_t v6;

  v5 = *(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EF991230) - 8);
  v6 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  sub_1CAEE85C8(a1, a2, v2 + v6, *(_QWORD *)(v2 + ((*(_QWORD *)(v5 + 64) + v6 + 7) & 0xFFFFFFFFFFFFFFF8)));
}

void sub_1CAEEB85C(uint64_t a1, uint64_t a2, id *a3)
{
  unint64_t v6;
  char v7;
  id v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v25;
  void *v26;
  id v27;
  uint64_t v28;
  _QWORD v29[5];
  id v30;

  if (!*(_QWORD *)(a2 + 16))
    return;
  v6 = sub_1CAEDE8B0(a1);
  if ((v7 & 1) == 0)
    return;
  sub_1CAEDCD8C(*(_QWORD *)(a2 + 56) + 32 * v6, (uint64_t)v29);
  sub_1CAEEBF3C(0, &qword_1EF991238);
  if ((swift_dynamicCast() & 1) == 0)
    return;
  v8 = objc_msgSend(v27, sel_endpoints);
  if (!v8)
  {

    return;
  }
  v9 = v8;
  sub_1CAEEBF3C(0, &qword_1EF991240);
  v10 = sub_1CAF205B0();

  if (v10 >> 62)
  {
    swift_bridgeObjectRetain();
    v25 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
    if (v25)
      goto LABEL_7;
LABEL_18:

    swift_bridgeObjectRelease();
    return;
  }
  if (!*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_18;
LABEL_7:
  v30 = v27;
  if (qword_1ECFCE888 != -1)
    swift_once();
  v11 = sub_1CAF202E0();
  __swift_project_value_buffer(v11, (uint64_t)qword_1ECFCE8A8);
  sub_1CAEDF4E0(a1, (uint64_t)v29);
  swift_bridgeObjectRetain();
  v12 = sub_1CAF202C8();
  v13 = sub_1CAF206A0();
  if (os_log_type_enabled(v12, v13))
  {
    v14 = swift_slowAlloc();
    v26 = (void *)swift_slowAlloc();
    v27 = v26;
    *(_DWORD *)v14 = 134218242;
    if (v10 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1CAF208C8();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v14 + 12) = 2080;
    v15 = sub_1CAF207CC();
    sub_1CAEDBE5C(v15, v16, (uint64_t *)&v27);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    sub_1CAEDF51C((uint64_t)v29);
    _os_log_impl(&dword_1CAEBA000, v12, v13, "Found %ld enabled iMessage devices for %s", (uint8_t *)v14, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v26, -1, -1);
    MEMORY[0x1D179A698](v14, -1, -1);
  }
  else
  {
    swift_bridgeObjectRelease_n();
    sub_1CAEDF51C((uint64_t)v29);
  }

  v29[3] = MEMORY[0x1E0DEC198];
  v29[0] = swift_allocObject();
  sub_1CAEDF4E0(a1, v29[0] + 16);
  sub_1CAEDCD8C((uint64_t)v29, (uint64_t)&v27);
  v27 = (id)sub_1CAF2043C();
  v28 = v17;
  sub_1CAEEBEE8();
  v18 = (void *)sub_1CAF20790();
  v20 = v19;
  swift_bridgeObjectRelease();
  v27 = v18;
  v28 = v20;
  v21 = sub_1CAF20790();
  v23 = v22;
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v29);
  swift_beginAccess();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v27 = *a3;
  *a3 = (id)0x8000000000000000;
  sub_1CAF19354(1, v21, v23, isUniquelyReferenced_nonNull_native);
  *a3 = v27;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_endAccess();

}

uint64_t sub_1CAEEBD1C(uint64_t a1, uint64_t a2, id *a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v17;
  int64_t v18;
  _OWORD v19[2];
  uint64_t v20;
  _OWORD v21[2];
  uint64_t v22;

  v7 = a1 + 64;
  v8 = 1 << *(_BYTE *)(a1 + 32);
  v9 = -1;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  v10 = v9 & *(_QWORD *)(a1 + 64);
  v11 = (unint64_t)(v8 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v13 = 0;
  while (v10)
  {
    v14 = __clz(__rbit64(v10));
    v10 &= v10 - 1;
    v15 = v14 | (v13 << 6);
LABEL_5:
    sub_1CAEDF4E0(*(_QWORD *)(a1 + 48) + 40 * v15, (uint64_t)v21);
    v19[0] = v21[0];
    v19[1] = v21[1];
    v20 = v22;
    sub_1CAEEB85C((uint64_t)v19, a2, a3);
    result = sub_1CAEDF51C((uint64_t)v19);
    if (v3)
      return swift_release();
  }
  if (__OFADD__(v13++, 1))
  {
    __break(1u);
    goto LABEL_26;
  }
  if (v13 >= v11)
    return swift_release();
  v17 = *(_QWORD *)(v7 + 8 * v13);
  if (v17)
  {
LABEL_19:
    v10 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v13 << 6);
    goto LABEL_5;
  }
  v18 = v13 + 1;
  if (v13 + 1 >= v11)
    return swift_release();
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
    goto LABEL_18;
  v18 = v13 + 2;
  if (v13 + 2 >= v11)
    return swift_release();
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
    goto LABEL_18;
  v18 = v13 + 3;
  if (v13 + 3 >= v11)
    return swift_release();
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
    goto LABEL_18;
  v18 = v13 + 4;
  if (v13 + 4 >= v11)
    return swift_release();
  v17 = *(_QWORD *)(v7 + 8 * v18);
  if (v17)
  {
LABEL_18:
    v13 = v18;
    goto LABEL_19;
  }
  while (1)
  {
    v13 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v13 >= v11)
      return swift_release();
    v17 = *(_QWORD *)(v7 + 8 * v13);
    ++v18;
    if (v17)
      goto LABEL_19;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1CAEEBEC4()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
  return swift_deallocObject();
}

unint64_t sub_1CAEEBEE8()
{
  unint64_t result;

  result = qword_1EF991248;
  if (!qword_1EF991248)
  {
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EF991248);
  }
  return result;
}

_OWORD *sub_1CAEEBF2C(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_1CAEEBF3C(uint64_t a1, unint64_t *a2)
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

unint64_t sub_1CAEEBF74()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECFCE7D0;
  if (!qword_1ECFCE7D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ECFCE7C8);
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ECFCE7D0);
  }
  return result;
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

unint64_t static FamilyLogger.subsystem.getter()
{
  return 0xD000000000000010;
}

uint64_t sub_1CAEEC024(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1ECFCE8A8);
}

uint64_t static FamilyLogger.common.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1ECFCE888, (uint64_t)qword_1ECFCE8A8, a1);
}

uint64_t sub_1CAEEC05C(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF991260);
}

uint64_t static FamilyLogger.metrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D40, (uint64_t)qword_1EF991260, a1);
}

uint64_t sub_1CAEEC098@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = sub_1CAF202E0();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t sub_1CAEEC100(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF991278);
}

uint64_t static FamilyLogger.findmy.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D48, (uint64_t)qword_1EF991278, a1);
}

uint64_t sub_1CAEEC138(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF991290);
}

uint64_t static FamilyLogger.extension.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(qword_1EF990D50, (uint64_t)qword_1EF991290, a1);
}

uint64_t sub_1CAEEC178(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FFE0);
}

uint64_t static FamilyLogger.daemon.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(qword_1EF98FFF8, (uint64_t)qword_1EF98FFE0, a1);
}

uint64_t sub_1CAEEC1B0(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF9912A8);
}

uint64_t static FamilyLogger.xpc.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D60, (uint64_t)qword_1EF9912A8, a1);
}

uint64_t sub_1CAEEC1E4(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF9912C0);
}

uint64_t static FamilyLogger.biome.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D68, (uint64_t)qword_1EF9912C0, a1);
}

uint64_t sub_1CAEEC21C(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1ECFCE720);
}

uint64_t static FamilyLogger.familyFetchActivity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1ECFCE740, (uint64_t)qword_1ECFCE720, a1);
}

uint64_t sub_1CAEEC25C(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FD50);
}

uint64_t static FamilyLogger.osUpdateActivity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF98FBC8, (uint64_t)qword_1EF98FD50, a1);
}

uint64_t sub_1CAEEC29C(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FCE8);
}

uint64_t static FamilyLogger.checklist.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF98FD00, (uint64_t)qword_1EF98FCE8, a1);
}

uint64_t sub_1CAEEC2DC(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FFC0);
}

uint64_t static FamilyLogger.network.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF9903C8, (uint64_t)qword_1EF98FFC0, a1);
}

uint64_t sub_1CAEEC318(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FCA8);
}

uint64_t static FamilyLogger.config.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF98FCC0, (uint64_t)qword_1EF98FCA8, a1);
}

uint64_t sub_1CAEEC350(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FC90);
}

uint64_t static FamilyLogger.store.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(qword_1EF98FAB8, (uint64_t)qword_1EF98FC90, a1);
}

uint64_t sub_1CAEEC390(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF9912D8);
}

uint64_t static FamilyLogger.checklistMetrics.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D70, (uint64_t)qword_1EF9912D8, a1);
}

uint64_t sub_1CAEEC3D0(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FD30);
}

uint64_t static FamilyLogger.rateLimiter.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF98FD48, (uint64_t)qword_1EF98FD30, a1);
}

uint64_t sub_1CAEEC414(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FCC8);
}

uint64_t static FamilyLogger.scoring.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF98FCE0, (uint64_t)qword_1EF98FCC8, a1);
}

uint64_t sub_1CAEEC450(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FD68);
}

uint64_t static FamilyLogger.familyCFUActivity.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(qword_1EF98FBD8, (uint64_t)qword_1EF98FD68, a1);
}

uint64_t sub_1CAEEC490(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF9904C0);
}

uint64_t static FamilyLogger.familySettings.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF9904E0, (uint64_t)qword_1EF9904C0, a1);
}

uint64_t sub_1CAEEC4CC(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF9912F0);
}

uint64_t static FamilyLogger.featureFlags.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D78, (uint64_t)qword_1EF9912F0, a1);
}

uint64_t sub_1CAEEC510(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF98FDC0);
}

uint64_t static FamilyLogger.groupkitFamilyShadow.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF98FDE0, (uint64_t)qword_1EF98FDC0, a1);
}

uint64_t sub_1CAEEC550(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF991308);
}

uint64_t static FamilyLogger.tapToRadar.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D88, (uint64_t)qword_1EF991308, a1);
}

uint64_t sub_1CAEEC590(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF991320);
}

uint64_t static FamilyLogger.imageCache.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D90, (uint64_t)qword_1EF991320, a1);
}

uint64_t sub_1CAEEC5D0(uint64_t a1)
{
  return sub_1CAEEC5F0(a1, qword_1EF991338);
}

uint64_t sub_1CAEEC5F0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1CAF202E0();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1CAF202D4();
}

uint64_t static FamilyLogger.timeouts.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_1CAEEC098(&qword_1EF990D98, (uint64_t)qword_1EF991338, a1);
}

ValueMetadata *type metadata accessor for FamilyLogger()
{
  return &type metadata for FamilyLogger;
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

id FAFamilyCircle.amIOrganizer.getter()
{
  void *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_msgSend(v0, "me");
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_isOrganizer);

  return v3;
}

void *FAFamilyCircle.organizer.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  void *v6;
  uint64_t v7;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (v2 >> 62)
    goto LABEL_14;
  v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1CAF208C8())
  {
    v4 = 4;
    while (1)
    {
      v5 = (v2 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1D1799A98](v4 - 4, v2) : *(id *)(v2 + 8 * v4);
      v6 = v5;
      v7 = v4 - 3;
      if (__OFADD__(v4 - 4, 1))
        break;
      if (objc_msgSend(v5, sel_isOrganizer))
      {
        swift_bridgeObjectRelease_n();
        return v6;
      }

      ++v4;
      if (v7 == v3)
        goto LABEL_10;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
  }
LABEL_10:
  swift_bridgeObjectRelease_n();
  return 0;
}

void FAFamilyCircle.guardians.getter()
{
  sub_1CAEEDAF0((SEL *)&selRef_isGuardian);
}

BOOL FAFamilyCircle.isEmpty.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  return v3 == 0;
}

uint64_t FAFamilyCircle.refreshFamilyMemberIDSStatusAndWait(forceRefresh:)(char a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  *(_QWORD *)(v2 + 32) = v1;
  *(_BYTE *)(v2 + 150) = a1;
  v3 = sub_1CAF1FF8C();
  *(_QWORD *)(v2 + 40) = v3;
  *(_QWORD *)(v2 + 48) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 56) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CAEEC980()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  int v5;
  uint8_t *v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;

  if (qword_1ECFCE888 != -1)
    swift_once();
  v2 = sub_1CAF202E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ECFCE8A8);
  v3 = sub_1CAF202C8();
  v4 = sub_1CAF206A0();
  if (os_log_type_enabled(v3, v4))
  {
    v1 = (void *)(v0 + 144);
    v5 = *(unsigned __int8 *)(v0 + 150);
    v6 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v6 = 67109120;
    *(_DWORD *)(v0 + 144) = v5;
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v3, v4, "FAFamilyCircle refreshing ids status with forceRefresh: %{BOOL}d", v6, 8u);
    MEMORY[0x1D179A698](v6, -1, -1);
  }

  v7 = objc_msgSend(*(id *)(v0 + 32), sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v8 = sub_1CAF205B0();
  *(_QWORD *)(v0 + 64) = v8;

  if (!(v8 >> 62))
  {
    v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    *(_QWORD *)(v0 + 72) = v9;
    if (v9)
      goto LABEL_7;
LABEL_26:
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  swift_bridgeObjectRetain();
  v9 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  *(_QWORD *)(v0 + 72) = v9;
  if (!v9)
    goto LABEL_26;
LABEL_7:
  if (v9 < 1)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(v0 + 80) = 0;
    v10 = *(_QWORD *)(v0 + 64);
    if ((v10 & 0xC000000000000001) != 0)
      v11 = (id)MEMORY[0x1D1799A98](0);
    else
      v11 = *(id *)(v10 + 32);
    v1 = v11;
    *(_QWORD *)(v0 + 88) = v11;
    if (qword_1EF990DB8 == -1)
      goto LABEL_12;
  }
  swift_once();
LABEL_12:
  swift_allocObject();
  swift_unknownObjectWeakInit();
  *(_QWORD *)(v0 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911D0);
  sub_1CAF206E8();
  *(_QWORD *)(v0 + 104) = 0;
  swift_release();
  v12 = (_QWORD *)FAFamilyMember.normalizedPhoneNumbers.getter();
  v13 = objc_msgSend(v1, sel_appleID);
  if (v13)
  {
    v14 = v13;
    v16 = *(_QWORD *)(v0 + 48);
    v15 = *(_QWORD *)(v0 + 56);
    v17 = *(_QWORD *)(v0 + 40);
    v18 = sub_1CAF20400();
    v20 = v19;

    *(_QWORD *)(v0 + 16) = v18;
    *(_QWORD *)(v0 + 24) = v20;
    sub_1CAF1FF80();
    sub_1CAEEBEE8();
    v21 = sub_1CAF20784();
    v23 = v22;
    (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
    swift_bridgeObjectRelease();
    v24 = HIBYTE(v23) & 0xF;
    if ((v23 & 0x2000000000000000) == 0)
      v24 = v21 & 0xFFFFFFFFFFFFLL;
    if (v24)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v12 = sub_1CAEE58E4(0, v12[2] + 1, 1, v12);
      v26 = v12[2];
      v25 = v12[3];
      if (v26 >= v25 >> 1)
        v12 = sub_1CAEE58E4((_QWORD *)(v25 > 1), v26 + 1, 1, v12);
      v12[2] = v26 + 1;
      v27 = &v12[2 * v26];
      v27[4] = v21;
      v27[5] = v23;
    }
    else
    {
      swift_bridgeObjectRelease();
    }
  }
  *(_QWORD *)(v0 + 112) = v12;
  if (qword_1EF990D30 != -1)
    swift_once();
  *(_QWORD *)(v0 + 120) = qword_1EF9911B8;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAEECD90()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 120);
  v2 = v1[17];
  v3 = v1[18];
  __swift_project_boxed_opaque_existential_1(v1 + 14, v2);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v4;
  *v4 = v0;
  v4[1] = sub_1CAEECE18;
  return v6(*(_QWORD *)(v0 + 112), *(unsigned __int8 *)(v0 + 150), v2, v3);
}

uint64_t sub_1CAEECE18(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 136) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEECE74()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CAEECEB8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  _QWORD *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;

  v1 = *(_QWORD *)(v0 + 136);
  v2 = *(_QWORD *)(v0 + 104);
  v3 = *(void **)(v0 + 88);
  v28 = *(_QWORD *)(v0 + 72);
  v4 = *(_QWORD *)(v0 + 80) + 1;
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v6 = swift_task_alloc();
  *(_QWORD *)(v6 + 16) = v5;
  *(_QWORD *)(v6 + 24) = v1;
  sub_1CAF206E8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();

  if (v4 == v28)
  {
    swift_bridgeObjectRelease();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v8 = *(_QWORD *)(v0 + 80) + 1;
    *(_QWORD *)(v0 + 80) = v8;
    v9 = *(_QWORD *)(v0 + 64);
    if ((v9 & 0xC000000000000001) != 0)
      v10 = (id)MEMORY[0x1D1799A98]();
    else
      v10 = *(id *)(v9 + 8 * v8 + 32);
    v11 = v10;
    *(_QWORD *)(v0 + 88) = v10;
    if (qword_1EF990DB8 != -1)
      swift_once();
    swift_allocObject();
    swift_unknownObjectWeakInit();
    *(_QWORD *)(v0 + 96) = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911D0);
    sub_1CAF206E8();
    *(_QWORD *)(v0 + 104) = v2;
    swift_release();
    v12 = (_QWORD *)FAFamilyMember.normalizedPhoneNumbers.getter();
    v13 = objc_msgSend(v11, sel_appleID);
    if (v13)
    {
      v14 = v13;
      v16 = *(_QWORD *)(v0 + 48);
      v15 = *(_QWORD *)(v0 + 56);
      v17 = *(_QWORD *)(v0 + 40);
      v18 = sub_1CAF20400();
      v20 = v19;

      *(_QWORD *)(v0 + 16) = v18;
      *(_QWORD *)(v0 + 24) = v20;
      sub_1CAF1FF80();
      sub_1CAEEBEE8();
      v21 = sub_1CAF20784();
      v23 = v22;
      (*(void (**)(uint64_t, uint64_t))(v16 + 8))(v15, v17);
      swift_bridgeObjectRelease();
      v24 = HIBYTE(v23) & 0xF;
      if ((v23 & 0x2000000000000000) == 0)
        v24 = v21 & 0xFFFFFFFFFFFFLL;
      if (v24)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v12 = sub_1CAEE58E4(0, v12[2] + 1, 1, v12);
        v26 = v12[2];
        v25 = v12[3];
        if (v26 >= v25 >> 1)
          v12 = sub_1CAEE58E4((_QWORD *)(v25 > 1), v26 + 1, 1, v12);
        v12[2] = v26 + 1;
        v27 = &v12[2 * v26];
        v27[4] = v21;
        v27[5] = v23;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
    }
    *(_QWORD *)(v0 + 112) = v12;
    if (qword_1EF990D30 != -1)
      swift_once();
    *(_QWORD *)(v0 + 120) = qword_1EF9911B8;
    swift_retain();
    return swift_task_switch();
  }
}

Swift::Void __swiftcall FAFamilyCircle.refreshFamilyMemberIDSStatus(forceRefresh:)(Swift::Bool forceRefresh)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAF20640();
  v6 = sub_1CAF20658();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 56))(v5, 0, 1, v6);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = 0;
  *(_QWORD *)(v7 + 24) = 0;
  *(_QWORD *)(v7 + 32) = v1;
  *(_BYTE *)(v7 + 40) = forceRefresh;
  v8 = v1;
  sub_1CAEED364((uint64_t)v5, (uint64_t)&unk_1EF991360, v7);
  swift_release();
}

uint64_t sub_1CAEED2D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  uint64_t v5;
  _QWORD *v7;

  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v7;
  *v7 = v5;
  v7[1] = sub_1CAEDCEDC;
  return FAFamilyCircle.refreshFamilyMemberIDSStatusAndWait(forceRefresh:)(a5);
}

uint64_t sub_1CAEED328(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CAEED364(a1, a2, a3);
}

uint64_t sub_1CAEED348(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1CAEED364(a1, a2, a3);
}

uint64_t sub_1CAEED364(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1CAF20658();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1CAF2064C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1CAEDCD2C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CAF205EC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t FAFamilyCircle.membersWithoutIMessage()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  uint64_t v11;
  _QWORD *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  BOOL v31;
  _QWORD *v32;
  uint64_t v33;
  BOOL v34;
  unint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v1 = sub_1CAF1FF8C();
  v38 = *(_QWORD *)(v1 - 8);
  v39 = v1;
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v36 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v5 = sub_1CAF205B0();

  v45 = MEMORY[0x1E0DEE9D8];
  if (v5 >> 62)
    goto LABEL_67;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (v6)
  {
    v7 = 0;
    v41 = v6;
    v42 = v5 & 0xC000000000000001;
    v36 = v5 + 32;
    v37 = v5 & 0xFFFFFFFFFFFFFF8;
    v40 = v5;
    while (1)
    {
      if (v42)
      {
        v8 = (id)MEMORY[0x1D1799A98](v7, v5);
      }
      else
      {
        if (v7 >= *(_QWORD *)(v37 + 16))
          goto LABEL_64;
        v8 = *(id *)(v36 + 8 * v7);
      }
      v9 = v8;
      if (__OFADD__(v7++, 1))
      {
        __break(1u);
LABEL_64:
        __break(1u);
LABEL_65:
        __break(1u);
        goto LABEL_66;
      }
      v11 = FAFamilyMember.messageEnabledHandles.getter();
      if (v11)
        break;
LABEL_26:
      v23 = (_QWORD *)FAFamilyMember.normalizedPhoneNumbers.getter();
      if (!v23[2])
        goto LABEL_34;
      v25 = v23[4];
      v24 = v23[5];
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      v26 = (_QWORD *)FAFamilyMember.messageEnabledHandles.getter();
      if (!v26)
        goto LABEL_34;
      v27 = v26;
      v28 = v26[2];
      if (!v28)
        goto LABEL_33;
      if ((v26[4] != v25 || v26[5] != v24) && (sub_1CAF209A0() & 1) == 0)
      {
        if (v28 != 1)
        {
          v29 = v27 + 7;
          v30 = 1;
          while (1)
          {
            v5 = v30 + 1;
            if (__OFADD__(v30, 1))
              goto LABEL_65;
            v31 = *(v29 - 1) == v25 && *v29 == v24;
            if (v31 || (sub_1CAF209A0() & 1) != 0)
            {

              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              goto LABEL_40;
            }
            v29 += 2;
            ++v30;
            if (v5 == v28)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v5 = v40;
              v6 = v41;
              goto LABEL_35;
            }
          }
        }
LABEL_33:
        swift_bridgeObjectRelease();
LABEL_34:
        swift_bridgeObjectRelease();
LABEL_35:
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
        goto LABEL_5;
      }

      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
LABEL_5:
      if (v7 == v6)
      {
        swift_bridgeObjectRelease();
        return v45;
      }
    }
    v12 = (_QWORD *)v11;
    v13 = objc_msgSend(v9, sel_appleID);
    if (v13)
    {
      v14 = v13;
      v15 = sub_1CAF20400();
      v17 = v16;

      v43 = v15;
      v44 = v17;
      sub_1CAF1FF80();
      sub_1CAEEBEE8();
      v18 = sub_1CAF20784();
      v20 = v19;
      (*(void (**)(char *, uint64_t))(v38 + 8))(v3, v39);
      if ((v20 & 0x2000000000000000) != 0)
        v21 = HIBYTE(v20) & 0xF;
      else
        v21 = v18 & 0xFFFFFFFFFFFFLL;
      swift_bridgeObjectRelease();
      if (v21)
      {
        v22 = v12[2];
        if (!v22)
          goto LABEL_25;
        goto LABEL_21;
      }
      swift_bridgeObjectRelease();
    }
    v18 = 0;
    v20 = 0xE000000000000000;
    v22 = v12[2];
    if (!v22)
      goto LABEL_25;
LABEL_21:
    if (v12[4] == v18 && v12[5] == v20 || (sub_1CAF209A0() & 1) != 0)
    {
LABEL_39:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

LABEL_40:
      v5 = v40;
      v6 = v41;
      goto LABEL_5;
    }
    v5 = v40;
    if (v22 == 1)
      goto LABEL_25;
    if (v12[6] == v18 && v12[7] == v20 || (sub_1CAF209A0() & 1) != 0)
      goto LABEL_39;
    v5 = v40;
    if (v22 == 2)
    {
LABEL_25:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v6 = v41;
      goto LABEL_26;
    }
    v32 = v12 + 9;
    v33 = 2;
    while (1)
    {
      v5 = v33 + 1;
      if (__OFADD__(v33, 1))
        break;
      v34 = *(v32 - 1) == v18 && *v32 == v20;
      if (v34 || (sub_1CAF209A0() & 1) != 0)
        goto LABEL_39;
      v32 += 2;
      ++v33;
      v31 = v5 == v22;
      v5 = v40;
      if (v31)
        goto LABEL_25;
    }
LABEL_66:
    __break(1u);
LABEL_67:
    swift_bridgeObjectRetain();
    v6 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return MEMORY[0x1E0DEE9D8];
}

void FAFamilyCircle.membersAreChildOrTeen()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_16;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D1799A98](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_memberType) == (id)2
        || objc_msgSend(v6, sel_memberType) == (id)1
        || objc_msgSend(v6, sel_isChildAccount))
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
  }
}

void FAFamilyCircle.membersAreChildAccount()()
{
  sub_1CAEEDAF0((SEL *)&selRef_isChildAccount);
}

void sub_1CAEEDAF0(SEL *a1)
{
  void *v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;

  v3 = objc_msgSend(v1, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v4 = sub_1CAF205B0();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v5 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_14;
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1D1799A98](i, v4);
      else
        v7 = *(id *)(v4 + 8 * i + 32);
      v8 = v7;
      if (objc_msgSend(v7, *a1))
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
  }
}

BOOL FAFamilyCircle.familyHasChild.getter()
{
  return sub_1CAEEDE18((uint64_t (*)(void))FAFamilyCircle.membersAreChildAccount());
}

BOOL FAFamilyCircle.familyHasTeen.getter()
{
  return sub_1CAEEDE18((uint64_t (*)(void))FAFamilyCircle.membersAreTeen());
}

void FAFamilyCircle.membersAreTeen()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_14;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D1799A98](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_memberType) == (id)1)
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
  }
}

BOOL FAFamilyCircle.familyHasChildOrTeen.getter()
{
  return sub_1CAEEDE18((uint64_t (*)(void))FAFamilyCircle.membersAreChildOrTeen());
}

BOOL sub_1CAEEDE18(uint64_t (*a1)(void))
{
  unint64_t v1;
  uint64_t v2;

  v1 = a1();
  if (v1 >> 62)
    v2 = sub_1CAF208C8();
  else
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  return v2 != 0;
}

void FAFamilyCircle.membersAreGuardians()()
{
  sub_1CAEEDAF0((SEL *)&selRef_isGuardian);
}

void FAFamilyCircle.nonGuardianAdults()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_15;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D1799A98](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_memberType) || (objc_msgSend(v6, sel_isGuardian) & 1) != 0)
      {

      }
      else
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
    }
    swift_bridgeObjectRelease();
  }
}

void FAFamilyCircle.membersAreAdult()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_14;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D1799A98](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_memberType))
      {

      }
      else
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
    }
    swift_bridgeObjectRelease();
  }
}

void FAFamilyCircle.adultsNotGuardians()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_15;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D1799A98](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if ((objc_msgSend(v5, sel_isGuardian) & 1) != 0 || objc_msgSend(v6, sel_memberType))
      {

      }
      else
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
    }
    swift_bridgeObjectRelease();
  }
}

void FAFamilyCircle.membersAreNotAdult()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_14;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D1799A98](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if (objc_msgSend(v5, sel_memberType))
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
      else
      {

      }
    }
    swift_bridgeObjectRelease();
  }
}

void FAFamilyCircle.membersNotMe()()
{
  sub_1CAEEE668((SEL *)&selRef_isMe);
}

void FAFamilyCircle.guardiansNotMe()()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t i;
  id v5;
  void *v6;

  v1 = objc_msgSend(v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (!(v2 >> 62))
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v3)
      goto LABEL_3;
LABEL_15:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v3 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v3)
    goto LABEL_15;
LABEL_3:
  if (v3 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v3; ++i)
    {
      if ((v2 & 0xC000000000000001) != 0)
        v5 = (id)MEMORY[0x1D1799A98](i, v2);
      else
        v5 = *(id *)(v2 + 8 * i + 32);
      v6 = v5;
      if ((objc_msgSend(v5, sel_isMe) & 1) != 0
        || (objc_msgSend(v6, sel_isGuardian) & 1) == 0)
      {

      }
      else
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
    }
    swift_bridgeObjectRelease();
  }
}

void FAFamilyCircle.membersNotOrganizer()()
{
  sub_1CAEEE668((SEL *)&selRef_isOrganizer);
}

void sub_1CAEEE668(SEL *a1)
{
  void *v1;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t i;
  id v7;
  void *v8;

  v3 = objc_msgSend(v1, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v4 = sub_1CAF205B0();

  if (!(v4 >> 62))
  {
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v5)
      goto LABEL_3;
LABEL_14:
    swift_bridgeObjectRelease();
    return;
  }
  swift_bridgeObjectRetain();
  v5 = sub_1CAF208C8();
  swift_bridgeObjectRelease();
  if (!v5)
    goto LABEL_14;
LABEL_3:
  if (v5 < 1)
  {
    __break(1u);
  }
  else
  {
    for (i = 0; i != v5; ++i)
    {
      if ((v4 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1D1799A98](i, v4);
      else
        v7 = *(id *)(v4 + 8 * i + 32);
      v8 = v7;
      if ((objc_msgSend(v7, *a1) & 1) != 0)
      {

      }
      else
      {
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
      }
    }
    swift_bridgeObjectRelease();
  }
}

uint64_t FAFamilyCircle.childrenYoungestToOldest()()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v3;
  uint64_t v4;

  FAFamilyCircle.membersAreChildOrTeen()();
  if (v0 < 0 || (v0 & 0x4000000000000000) != 0)
  {
    v3 = swift_bridgeObjectRetain();
    v1 = (uint64_t)sub_1CAEEEE48(v3);
    swift_bridgeObjectRelease();
  }
  else
  {
    v1 = v0 & 0xFFFFFFFFFFFFFF8;
    swift_bridgeObjectRetain();
  }
  v4 = v1;
  sub_1CAEEEF3C(&v4);
  swift_bridgeObjectRelease();
  return v4;
}

Swift::Bool __swiftcall FAFamilyCircle.isOneMemberFamily()()
{
  unint64_t v0;
  uint64_t v1;

  FAFamilyCircle.membersNotMe()();
  if (v0 >> 62)
    v1 = sub_1CAF208C8();
  else
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  return v1 == 0;
}

Swift::Bool __swiftcall FAFamilyCircle.dsidInFamily(_:)(NSNumber_optional a1)
{
  void *v1;
  objc_class *v2;
  id v3;
  unint64_t v4;
  Class isa;
  Class i;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  char v11;
  unint64_t v13;

  if (!a1.value.super.super.isa)
    return (Swift::Bool)a1.value.super.super.isa;
  v2 = a1.value.super.super.isa;
  v3 = objc_msgSend(v1, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v4 = sub_1CAF205B0();

  v13 = MEMORY[0x1E0DEE9D8];
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    a1.value.super.super.isa = (Class)sub_1CAF208C8();
    isa = a1.value.super.super.isa;
    if (a1.value.super.super.isa)
      goto LABEL_4;
LABEL_16:
    swift_bridgeObjectRelease();
    v10 = MEMORY[0x1E0DEE9D8];
LABEL_17:
    swift_bridgeObjectRelease();
    v11 = sub_1CAEEEB70((uint64_t)v2, v10);

    swift_bridgeObjectRelease();
    LOBYTE(a1.value.super.super.isa) = v11 & 1;
    return (Swift::Bool)a1.value.super.super.isa;
  }
  isa = *(Class *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  LOBYTE(a1.value.super.super.isa) = swift_bridgeObjectRetain();
  if (!isa)
    goto LABEL_16;
LABEL_4:
  if ((uint64_t)isa >= 1)
  {
    for (i = 0; i != isa; i = (Class)((char *)i + 1))
    {
      if ((v4 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1D1799A98](i, v4);
      else
        v7 = *(id *)(v4 + 8 * (_QWORD)i + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_dsid);

      if (v9)
      {
        MEMORY[0x1D179981C]();
        if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
          sub_1CAF205C8();
        sub_1CAF205E0();
        sub_1CAF205BC();
      }
    }
    swift_bridgeObjectRelease();
    v10 = v13;
    goto LABEL_17;
  }
  __break(1u);
  return (Swift::Bool)a1.value.super.super.isa;
}

uint64_t sub_1CAEEEAAC(uint64_t a1, uint64_t a2, _QWORD *a3)
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
  result = sub_1CAF209A0();
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
    if (v12 || (sub_1CAF209A0() & 1) != 0)
      return 1;
    result = 0;
    v9 += 2;
    if (v11 == v3)
      return result;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CAEEEB70(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1CAF208C8())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x1D1799A98](0, a2);
LABEL_5:
      v6 = v5;
      sub_1CAEEBF3C(0, (unint64_t *)&qword_1EF991370);
      v7 = sub_1CAF2073C();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_1CAF2073C();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x1D1799A98](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_1CAF2073C();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t FAFamilyCircle.getPendingReceivedInvites()()
{
  void *v0;
  id v1;
  unint64_t v2;
  id v3;
  unint64_t v4;

  v1 = objc_msgSend(v0, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v2 = sub_1CAF205B0();

  v3 = v0;
  v4 = sub_1CAEEFE98(v2, v3);
  swift_bridgeObjectRelease();

  return v4;
}

void __swiftcall FAFamilyCircle.getMember(from:)(FAFamilyMember_optional *__return_ptr retstr, Swift::String from)
{
  void *v2;
  void *v3;
  void *object;
  uint64_t countAndFlagsBits;
  id v6;
  void *v7;
  unint64_t v8;

  v3 = v2;
  object = from._object;
  countAndFlagsBits = from._countAndFlagsBits;
  v6 = objc_msgSend(v3, sel_pendingMembers);
  if (v6)
  {
    v7 = v6;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v8 = sub_1CAF205B0();

    swift_bridgeObjectRetain();
    sub_1CAEEFD08(v8, countAndFlagsBits, (uint64_t)object);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
  }
  else
  {
    __break(1u);
  }
}

_QWORD *sub_1CAEEEE48(unint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  int64_t v4;
  uint64_t v5;
  unint64_t v6;

  v1 = a1;
  if (a1 >> 62)
    goto LABEL_10;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  while (1)
  {
    if (v2 <= 0)
    {
      v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    else
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991378);
      v3 = (_QWORD *)swift_allocObject();
      v4 = _swift_stdlib_malloc_size(v3);
      v5 = v4 - 32;
      if (v4 < 32)
        v5 = v4 - 25;
      v3[2] = v2;
      v3[3] = (2 * (v5 >> 3)) | 1;
    }
    swift_bridgeObjectRetain();
    sub_1CAEFAEF8((unint64_t)(v3 + 4), v2, v1);
    v1 = v6;
    swift_bridgeObjectRelease();
    if (v1 == v2)
      break;
    __break(1u);
LABEL_10:
    swift_bridgeObjectRetain();
    v2 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
    if (!v2)
      return (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  return v3;
}

uint64_t sub_1CAEEEF3C(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_1CAEFB100();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1CAEEEFB4(v6);
  return sub_1CAF20844();
}

void sub_1CAEEEFB4(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  char *v42;
  unint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  BOOL v54;
  unint64_t v55;
  char *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  BOOL v64;
  uint64_t v65;
  char v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  unint64_t v82;
  uint64_t v83;
  char *v84;
  char *v85;
  uint64_t v86;
  char *v87;
  unint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  unint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  char *v103;
  uint64_t v104;
  id v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  void **v110;
  uint64_t v111;

  v3 = a1[1];
  v4 = sub_1CAF20970();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_132;
    if (v3)
      sub_1CAEEF724(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_140;
  v104 = v4;
  v99 = a1;
  if (v3 < 2)
  {
    v8 = (char *)MEMORY[0x1E0DEE9D8];
    v111 = MEMORY[0x1E0DEE9D8];
    v110 = (void **)((MEMORY[0x1E0DEE9D8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v11 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_98:
      if (v11 >= 2)
      {
        v93 = *v99;
        do
        {
          v94 = v11 - 2;
          if (v11 < 2)
            goto LABEL_127;
          if (!v93)
            goto LABEL_139;
          v95 = *(_QWORD *)&v8[16 * v94 + 32];
          v96 = *(_QWORD *)&v8[16 * v11 + 24];
          sub_1CAEEF814((id *)(v93 + 8 * v95), (id *)(v93 + 8 * *(_QWORD *)&v8[16 * v11 + 16]), v93 + 8 * v96, v110);
          if (v1)
            break;
          if (v96 < v95)
            goto LABEL_128;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v8 = sub_1CAEFAD2C((uint64_t)v8);
          if (v94 >= *((_QWORD *)v8 + 2))
            goto LABEL_129;
          v97 = &v8[16 * v94 + 32];
          *(_QWORD *)v97 = v95;
          *((_QWORD *)v97 + 1) = v96;
          v98 = *((_QWORD *)v8 + 2);
          if (v11 > v98)
            goto LABEL_130;
          memmove(&v8[16 * v11 + 16], &v8[16 * v11 + 32], 16 * (v98 - v11));
          *((_QWORD *)v8 + 2) = v98 - 1;
          v11 = v98 - 1;
        }
        while (v98 > 2);
      }
LABEL_109:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v111 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_1CAF205BC();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v6 = v5 >> 1;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v7 = sub_1CAF205D4();
    *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v110 = (void **)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    v111 = v7;
  }
  v9 = 0;
  v10 = *a1;
  v100 = *a1 - 8;
  v101 = *a1 + 16;
  v8 = (char *)MEMORY[0x1E0DEE9D8];
  v107 = v3;
  while (1)
  {
    v12 = v9++;
    v108 = v12;
    if (v9 < v3)
    {
      v13 = *(void **)(v10 + 8 * v12);
      v14 = *(id *)(v10 + 8 * v9);
      v15 = v13;
      v105 = objc_msgSend(v14, "age");
      v16 = objc_msgSend(v15, "age");

      v3 = v107;
      v9 = v12 + 2;
      if (v12 + 2 < v107)
      {
        v102 = v8;
        v17 = (id *)(v101 + 8 * v12);
        while (1)
        {
          v18 = *(v17 - 1);
          v19 = *v17;
          v20 = v18;
          v21 = objc_msgSend(v19, "age");
          v22 = objc_msgSend(v20, "age");

          if ((uint64_t)v105 < (uint64_t)v16 == (uint64_t)v21 >= (uint64_t)v22)
            break;
          ++v9;
          ++v17;
          v3 = v107;
          if (v107 == v9)
          {
            v9 = v107;
            v8 = v102;
            goto LABEL_22;
          }
        }
        v8 = v102;
        v3 = v107;
LABEL_22:
        v12 = v108;
      }
      if ((uint64_t)v105 < (uint64_t)v16)
      {
        if (v9 < v12)
          goto LABEL_133;
        if (v12 < v9)
        {
          v23 = (uint64_t *)(v100 + 8 * v9);
          v24 = v9;
          v25 = v12;
          v26 = (uint64_t *)(v10 + 8 * v12);
          do
          {
            if (v25 != --v24)
            {
              if (!v10)
                goto LABEL_138;
              v27 = *v26;
              *v26 = *v23;
              *v23 = v27;
            }
            ++v25;
            --v23;
            ++v26;
          }
          while (v25 < v24);
        }
      }
    }
    if (v9 < v3)
    {
      if (__OFSUB__(v9, v12))
        goto LABEL_131;
      if (v9 - v12 < v104)
        break;
    }
LABEL_48:
    if (v9 < v12)
      goto LABEL_126;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = sub_1CAEFAB8C(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
    v40 = *((_QWORD *)v8 + 2);
    v39 = *((_QWORD *)v8 + 3);
    v11 = v40 + 1;
    if (v40 >= v39 >> 1)
      v8 = sub_1CAEFAB8C((char *)(v39 > 1), v40 + 1, 1, v8);
    *((_QWORD *)v8 + 2) = v11;
    v41 = v8 + 32;
    v42 = &v8[16 * v40 + 32];
    *(_QWORD *)v42 = v12;
    *((_QWORD *)v42 + 1) = v9;
    if (v40)
    {
      v109 = v9;
      while (1)
      {
        v43 = v11 - 1;
        if (v11 >= 4)
        {
          v48 = &v41[16 * v11];
          v49 = *((_QWORD *)v48 - 8);
          v50 = *((_QWORD *)v48 - 7);
          v54 = __OFSUB__(v50, v49);
          v51 = v50 - v49;
          if (v54)
            goto LABEL_115;
          v53 = *((_QWORD *)v48 - 6);
          v52 = *((_QWORD *)v48 - 5);
          v54 = __OFSUB__(v52, v53);
          v46 = v52 - v53;
          v47 = v54;
          if (v54)
            goto LABEL_116;
          v55 = v11 - 2;
          v56 = &v41[16 * v11 - 32];
          v58 = *(_QWORD *)v56;
          v57 = *((_QWORD *)v56 + 1);
          v54 = __OFSUB__(v57, v58);
          v59 = v57 - v58;
          if (v54)
            goto LABEL_118;
          v54 = __OFADD__(v46, v59);
          v60 = v46 + v59;
          if (v54)
            goto LABEL_121;
          if (v60 >= v51)
          {
            v78 = &v41[16 * v43];
            v80 = *(_QWORD *)v78;
            v79 = *((_QWORD *)v78 + 1);
            v54 = __OFSUB__(v79, v80);
            v81 = v79 - v80;
            if (v54)
              goto LABEL_125;
            v71 = v46 < v81;
            goto LABEL_86;
          }
        }
        else
        {
          if (v11 != 3)
          {
            v72 = *((_QWORD *)v8 + 4);
            v73 = *((_QWORD *)v8 + 5);
            v54 = __OFSUB__(v73, v72);
            v65 = v73 - v72;
            v66 = v54;
            goto LABEL_80;
          }
          v45 = *((_QWORD *)v8 + 4);
          v44 = *((_QWORD *)v8 + 5);
          v54 = __OFSUB__(v44, v45);
          v46 = v44 - v45;
          v47 = v54;
        }
        if ((v47 & 1) != 0)
          goto LABEL_117;
        v55 = v11 - 2;
        v61 = &v41[16 * v11 - 32];
        v63 = *(_QWORD *)v61;
        v62 = *((_QWORD *)v61 + 1);
        v64 = __OFSUB__(v62, v63);
        v65 = v62 - v63;
        v66 = v64;
        if (v64)
          goto LABEL_120;
        v67 = &v41[16 * v43];
        v69 = *(_QWORD *)v67;
        v68 = *((_QWORD *)v67 + 1);
        v54 = __OFSUB__(v68, v69);
        v70 = v68 - v69;
        if (v54)
          goto LABEL_123;
        if (__OFADD__(v65, v70))
          goto LABEL_124;
        if (v65 + v70 >= v46)
        {
          v71 = v46 < v70;
LABEL_86:
          if (v71)
            v43 = v55;
          goto LABEL_88;
        }
LABEL_80:
        if ((v66 & 1) != 0)
          goto LABEL_119;
        v74 = &v41[16 * v43];
        v76 = *(_QWORD *)v74;
        v75 = *((_QWORD *)v74 + 1);
        v54 = __OFSUB__(v75, v76);
        v77 = v75 - v76;
        if (v54)
          goto LABEL_122;
        if (v77 < v65)
          goto LABEL_14;
LABEL_88:
        v82 = v43 - 1;
        if (v43 - 1 >= v11)
        {
          __break(1u);
LABEL_112:
          __break(1u);
LABEL_113:
          __break(1u);
LABEL_114:
          __break(1u);
LABEL_115:
          __break(1u);
LABEL_116:
          __break(1u);
LABEL_117:
          __break(1u);
LABEL_118:
          __break(1u);
LABEL_119:
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
          goto LABEL_135;
        }
        v83 = v10;
        if (!v10)
          goto LABEL_137;
        v84 = v8;
        v85 = &v41[16 * v82];
        v86 = *(_QWORD *)v85;
        v87 = v41;
        v88 = v43;
        v89 = &v41[16 * v43];
        v90 = *((_QWORD *)v89 + 1);
        v91 = v83;
        sub_1CAEEF814((id *)(v83 + 8 * *(_QWORD *)v85), (id *)(v83 + 8 * *(_QWORD *)v89), v83 + 8 * v90, v110);
        if (v1)
          goto LABEL_109;
        if (v90 < v86)
          goto LABEL_112;
        if (v88 > *((_QWORD *)v84 + 2))
          goto LABEL_113;
        *(_QWORD *)v85 = v86;
        *(_QWORD *)&v87[16 * v82 + 8] = v90;
        v92 = *((_QWORD *)v84 + 2);
        if (v88 >= v92)
          goto LABEL_114;
        v8 = v84;
        v11 = v92 - 1;
        memmove(v89, v89 + 16, 16 * (v92 - 1 - v88));
        v41 = v87;
        *((_QWORD *)v84 + 2) = v92 - 1;
        v10 = v91;
        v9 = v109;
        if (v92 <= 2)
          goto LABEL_14;
      }
    }
    v11 = 1;
LABEL_14:
    v3 = v107;
    if (v9 >= v107)
      goto LABEL_98;
  }
  if (__OFADD__(v12, v104))
    goto LABEL_134;
  if (v12 + v104 >= v3)
    v28 = v3;
  else
    v28 = v12 + v104;
  if (v28 >= v12)
  {
    if (v9 != v28)
    {
      v103 = v8;
      v29 = v100 + 8 * v9;
      v106 = v28;
      do
      {
        v30 = *(void **)(v10 + 8 * v9);
        v31 = v12;
        v32 = v29;
        do
        {
          v33 = *(void **)v32;
          v34 = v30;
          v35 = v33;
          v36 = objc_msgSend(v34, "age");
          v37 = objc_msgSend(v35, "age");

          if ((uint64_t)v36 >= (uint64_t)v37)
            break;
          if (!v10)
            goto LABEL_136;
          v38 = *(void **)v32;
          v30 = *(void **)(v32 + 8);
          *(_QWORD *)v32 = v30;
          *(_QWORD *)(v32 + 8) = v38;
          v32 -= 8;
          ++v31;
        }
        while (v9 != v31);
        ++v9;
        v29 += 8;
        v12 = v108;
      }
      while (v9 != v106);
      v9 = v106;
      v8 = v103;
    }
    goto LABEL_48;
  }
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
  sub_1CAF208B0();
  __break(1u);
}

void sub_1CAEEF724(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v17;

  if (a3 != a2)
  {
    v4 = a3;
    v5 = *a4;
    v6 = *a4 + 8 * a3 - 8;
LABEL_5:
    v7 = *(void **)(v5 + 8 * v4);
    v8 = a1;
    v17 = v6;
    while (1)
    {
      v9 = *(void **)v6;
      v10 = v7;
      v11 = v9;
      v12 = objc_msgSend(v10, "age");
      v13 = objc_msgSend(v11, "age");

      if ((uint64_t)v12 >= (uint64_t)v13)
      {
LABEL_4:
        ++v4;
        v6 = v17 + 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
      if (!v5)
        break;
      v14 = *(void **)v6;
      v7 = *(void **)(v6 + 8);
      *(_QWORD *)v6 = v7;
      *(_QWORD *)(v6 + 8) = v14;
      v6 -= 8;
      if (v4 == ++v8)
        goto LABEL_4;
    }
    __break(1u);
  }
}

uint64_t sub_1CAEEF814(id *__src, id *a2, unint64_t a3, void **a4)
{
  id *v4;
  id *v5;
  int64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void **v12;
  void **v13;
  void **v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id *v20;
  void **v21;
  id *v22;
  id *v23;
  id *v24;
  id *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t result;
  id *v32;
  id *v35;
  char *v36;
  void **v37;
  id *v38;

  v4 = a2;
  v5 = __src;
  v6 = (char *)a2 - (char *)__src;
  v7 = (char *)a2 - (char *)__src + 7;
  if ((char *)a2 - (char *)__src >= 0)
    v7 = (char *)a2 - (char *)__src;
  v8 = v7 >> 3;
  v9 = a3 - (_QWORD)a2;
  v10 = a3 - (_QWORD)a2 + 7;
  if ((uint64_t)(a3 - (_QWORD)a2) >= 0)
    v10 = a3 - (_QWORD)a2;
  v11 = v10 >> 3;
  v38 = __src;
  v37 = a4;
  if (v8 >= v10 >> 3)
  {
    if (v9 >= -7)
    {
      if (a4 != a2 || &a2[v11] <= a4)
        memmove(a4, a2, 8 * v11);
      v22 = &a4[v11];
      v36 = (char *)v22;
      v38 = v4;
      if (v5 < v4 && v9 >= 8)
      {
        v23 = (id *)(a3 - 8);
        v24 = v4;
        v32 = v5;
        do
        {
          v35 = v4;
          v25 = v23 + 1;
          v26 = *--v24;
          v27 = *(v22 - 1);
          v28 = v26;
          v29 = objc_msgSend(v27, "age");
          v30 = objc_msgSend(v28, "age");

          if ((uint64_t)v29 >= (uint64_t)v30)
          {
            v36 = (char *)(v22 - 1);
            if (v25 < v22 || v23 >= v22 || v25 != v22)
              *v23 = *(v22 - 1);
            v24 = v35;
            --v22;
          }
          else
          {
            if (v25 != v35 || v23 >= v35)
              *v23 = *v24;
            v38 = v24;
          }
          if (v24 <= v32)
            break;
          --v23;
          v4 = v24;
        }
        while (v22 > a4);
      }
      goto LABEL_43;
    }
  }
  else if (v6 >= -7)
  {
    if (a4 != __src || &__src[v8] <= a4)
      memmove(a4, __src, 8 * v8);
    v12 = &a4[v8];
    v36 = (char *)v12;
    if ((unint64_t)v4 < a3 && v6 >= 8)
    {
      v13 = a4;
      do
      {
        v14 = v5;
        v15 = *v13;
        v16 = *v4;
        v17 = v15;
        v18 = objc_msgSend(v16, "age");
        v19 = objc_msgSend(v17, "age");

        if ((uint64_t)v18 >= (uint64_t)v19)
        {
          v21 = v14;
          if (v14 != v13)
            *v14 = *v13;
          v37 = ++v13;
          v20 = v4;
        }
        else
        {
          v20 = v4 + 1;
          v21 = v14;
          if (v14 < v4 || v14 >= v20 || v14 != v4)
            *v14 = *v4;
        }
        v5 = v21 + 1;
        if (v13 >= v12)
          break;
        v4 = v20;
      }
      while ((unint64_t)v20 < a3);
      v38 = v5;
    }
LABEL_43:
    sub_1CAEFAC84((void **)&v38, (const void **)&v37, &v36);
    return 1;
  }
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

void (*sub_1CAEEFB30(void (**a1)(id *a1), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  void (*v6)(id *);

  v6 = (void (*)(id *))malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_1CAEEFBB0(v6, a2, a3);
  return sub_1CAEEFB84;
}

void sub_1CAEEFB84(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

void (*sub_1CAEEFBB0(void (*result)(id *a1), unint64_t a2, uint64_t a3))(id *a1)
{
  void (*v3)(id *);
  id v4;

  v3 = result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = (id)MEMORY[0x1D1799A98](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = *(id *)(a3 + 8 * a2 + 32);
LABEL_5:
    *(_QWORD *)v3 = v4;
    return sub_1CAEEFC1C;
  }
  __break(1u);
  return result;
}

void sub_1CAEEFC1C(id *a1)
{

}

uint64_t sub_1CAEEFC24()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1CAEEFC48(BOOL *a1@<X8>)
{
  uint64_t v1;

  sub_1CAEFC270(v1, a1);
}

uint64_t sub_1CAEEFC60()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1CAEEFC8C()
{
  uint64_t v0;
  uint64_t v1;
  char v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_BYTE *)(v0 + 40);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCC10;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_1CAEDCEDC;
  return FAFamilyCircle.refreshFamilyMemberIDSStatusAndWait(forceRefresh:)(v2);
}

void *sub_1CAEEFD08(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  if (a1 >> 62)
    goto LABEL_20;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_1CAF208C8())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1D1799A98](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, sel_inviteEmail);
      if (v10)
      {
        v11 = v10;
        v12 = sub_1CAF20400();
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        v16 = sub_1CAF209A0();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_18;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

unint64_t sub_1CAEEFE98(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  id v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  void *v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  char v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  void *v35;
  id v36;
  uint64_t v37;

  v2 = a1;
  v37 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_57;
  v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
LABEL_3:
  v4 = MEMORY[0x1E0DEE9D8];
  if (v3)
  {
    v29 = v2;
    v5 = 0;
    v33 = v2 & 0xFFFFFFFFFFFFFF8;
    v34 = v2 & 0xC000000000000001;
    v32 = v2 + 32;
    v30 = v3;
    while (1)
    {
      if (v34)
      {
        v6 = (id)MEMORY[0x1D1799A98](v5, v29);
      }
      else
      {
        if (v5 >= *(_QWORD *)(v33 + 16))
        {
          __break(1u);
LABEL_53:
          __break(1u);
LABEL_54:
          __break(1u);
          goto LABEL_55;
        }
        v6 = *(id *)(v32 + 8 * v5);
      }
      v7 = v6;
      if (__OFADD__(v5++, 1))
        goto LABEL_53;
      v9 = objc_msgSend(v6, sel_organizerDSID);
      if (!v9)
        goto LABEL_6;
      v35 = v7;
      v36 = v9;
      v2 = (uint64_t)objc_msgSend(a2, sel_members);
      sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
      v10 = sub_1CAF205B0();

      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        v11 = sub_1CAF208C8();
        if (!v11)
        {
LABEL_28:
          swift_bridgeObjectRelease();
          v16 = MEMORY[0x1E0DEE9D8];
          goto LABEL_29;
        }
      }
      else
      {
        v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (!v11)
          goto LABEL_28;
      }
      if (v11 < 1)
        goto LABEL_56;
      for (i = 0; i != v11; ++i)
      {
        if ((v10 & 0xC000000000000001) != 0)
          v13 = (id)MEMORY[0x1D1799A98](i, v10);
        else
          v13 = *(id *)(v10 + 8 * i + 32);
        v14 = v13;
        v15 = objc_msgSend(v13, sel_dsid, v29);

        if (v15)
        {
          MEMORY[0x1D179981C]();
          if (*(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1CAF205C8();
          sub_1CAF205E0();
          sub_1CAF205BC();
        }
      }
      swift_bridgeObjectRelease();
      v16 = v4;
LABEL_29:
      swift_bridgeObjectRelease();
      if (v16 >> 62)
      {
        swift_bridgeObjectRetain();
        v17 = sub_1CAF208C8();
        if (v17)
        {
LABEL_31:
          if ((v16 & 0xC000000000000001) != 0)
            v18 = (id)MEMORY[0x1D1799A98](0, v16);
          else
            v18 = *(id *)(v16 + 32);
          v19 = v18;
          v2 = sub_1CAEEBF3C(0, (unint64_t *)&qword_1EF991370);
          v20 = sub_1CAF2073C();

          if ((v20 & 1) != 0)
          {
LABEL_34:
            swift_bridgeObjectRelease_n();

            v2 = (uint64_t)v36;
            v4 = MEMORY[0x1E0DEE9D8];
            v3 = v30;
            goto LABEL_7;
          }
          if (v17 != 1)
          {
            if ((v16 & 0xC000000000000001) != 0)
            {
              v21 = 1;
              while (1)
              {
                MEMORY[0x1D1799A98](v21, v16);
                v22 = v21 + 1;
                if (__OFADD__(v21, 1))
                  goto LABEL_54;
                v23 = sub_1CAF2073C();
                swift_unknownObjectRelease();
                if ((v23 & 1) != 0)
                  goto LABEL_34;
                ++v21;
                if (v22 == v17)
                  goto LABEL_5;
              }
            }
            v24 = 5;
            while (1)
            {
              v25 = v24 - 3;
              if (__OFADD__(v24 - 4, 1))
                break;
              v26 = *(id *)(v16 + 8 * v24);
              v27 = sub_1CAF2073C();

              if ((v27 & 1) != 0)
                goto LABEL_34;
              ++v24;
              if (v25 == v17)
                goto LABEL_5;
            }
LABEL_55:
            __break(1u);
LABEL_56:
            __break(1u);
LABEL_57:
            v3 = sub_1CAF208C8();
            goto LABEL_3;
          }
        }
      }
      else
      {
        v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v17)
          goto LABEL_31;
      }
LABEL_5:
      swift_bridgeObjectRelease_n();

      v4 = MEMORY[0x1E0DEE9D8];
      v3 = v30;
LABEL_6:
      v2 = (uint64_t)&v37;
      sub_1CAF20838();
      sub_1CAF2085C();
      sub_1CAF20868();
      sub_1CAF20844();
LABEL_7:
      if (v5 == v3)
        return v37;
    }
  }
  return v4;
}

uint64_t sub_1CAEF02F0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAEDCC10;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF991518 + dword_1EF991518))(a1, v4);
}

uint64_t sub_1CAEF0360()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEF0384(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAEDCEDC;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF9914F8 + dword_1EF9914F8))(a1, v4);
}

void sub_1CAEF03FC()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)FAFamilyFeatureFlag);
  v1 = (void *)sub_1CAF203DC();
  v2 = objc_msgSend(v0, sel_initWithRawValue_, v1);

  qword_1EF991388 = (uint64_t)v2;
}

uint64_t FamilyFeatureFlags.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CAEF04E4 + 4 * aH[*v0]))(0x756F4874696C7073, 0xEF73646C6F686573);
}

unint64_t sub_1CAEF04E4()
{
  return 0xD000000000000016;
}

uint64_t sub_1CAEF05E4()
{
  return 0x696D614674736574;
}

FamilyCircle::FamilyFeatureFlags_optional __swiftcall FamilyFeatureFlags.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FamilyCircle::FamilyFeatureFlags_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CAF20910();
  result.value = swift_bridgeObjectRelease();
  v5 = 12;
  if (v3 < 0xC)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_1CAEF0714()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  char v5;
  unsigned __int8 v7;

  if (*(_BYTE *)(v0 + OBJC_IVAR___FAFamilyFeatureFlag_swiftVariant) == 12)
  {
    if (qword_1EF990D78 != -1)
      swift_once();
    v1 = sub_1CAF202E0();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EF9912F0);
    v2 = sub_1CAF202C8();
    v3 = sub_1CAF206AC();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1CAEBA000, v2, v3, "Swift variant was nil, defaulting to false. This should never happen.", v4, 2u);
      MEMORY[0x1D179A698](v4, -1, -1);
    }

    v5 = 0;
  }
  else
  {
    v7 = *(_BYTE *)(v0 + OBJC_IVAR___FAFamilyFeatureFlag_swiftVariant);
    v5 = _s12FamilyCircle0A12FeatureFlagsO7enabledySbACFZ_0(&v7);
  }
  return v5 & 1;
}

void __swiftcall FAFamilyFeatureFlag.init()(FAFamilyFeatureFlag *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void FAFamilyFeatureFlag.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

void sub_1CAEF0894()
{
  off_1EF991390 = (_UNKNOWN *)MEMORY[0x1E0DEE9E0];
}

uint64_t static FamilyFeatureFlags.overrides.getter()
{
  if (qword_1EF990DA8 != -1)
    swift_once();
  swift_beginAccess();
  return swift_bridgeObjectRetain();
}

uint64_t static FamilyFeatureFlags.overrides.setter(uint64_t a1)
{
  return sub_1CAEF0AD8(a1, &qword_1EF990DA8, (uint64_t *)&off_1EF991390, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEEB08]);
}

uint64_t (*static FamilyFeatureFlags.overrides.modify())()
{
  if (qword_1EF990DA8 != -1)
    swift_once();
  swift_beginAccess();
  return j_j__swift_endAccess;
}

void *sub_1CAEF09A4()
{
  id v0;
  id v1;
  uint64_t v2;
  void *result;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_environment);

  v2 = sub_1CAF20394();
  type metadata accessor for RuntimeEnvironment();
  swift_allocObject();
  result = (void *)RuntimeEnvironment.init(environment:)(v2);
  off_1ECFCE890 = result;
  return result;
}

uint64_t static FamilyFeatureFlags.environment.getter()
{
  if (qword_1ECFCE880 != -1)
    swift_once();
  swift_beginAccess();
  return swift_retain();
}

uint64_t static FamilyFeatureFlags.environment.setter(uint64_t a1)
{
  return sub_1CAEF0AD8(a1, &qword_1ECFCE880, (uint64_t *)&off_1ECFCE890, (uint64_t (*)(uint64_t))MEMORY[0x1E0DEEE30]);
}

uint64_t sub_1CAEF0AD8(uint64_t a1, _QWORD *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;

  if (*a2 != -1)
    swift_once();
  swift_beginAccess();
  v7 = *a3;
  *a3 = a1;
  return a4(v7);
}

uint64_t (*static FamilyFeatureFlags.environment.modify())()
{
  if (qword_1ECFCE880 != -1)
    swift_once();
  swift_beginAccess();
  return j__swift_endAccess;
}

const char *FamilyFeatureFlags.domain.getter()
{
  return "Family";
}

uint64_t FamilyFeatureFlags.feature.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(const char *, uint64_t))((char *)sub_1CAEF0BF0 + 4 * byte_1CAF2568C[*v0]))("SplitHouseholds", 15);
}

const char *sub_1CAEF0BF0()
{
  return "ParentalControlMacOnly";
}

uint64_t static FamilyFeatureFlags.enabled(_:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  _QWORD *v9;
  uint64_t v10;
  char v11;
  int v12;
  uint64_t v13;
  _BYTE v15[24];
  ValueMetadata *v16;
  unint64_t v17;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 1;
  v3 = qword_1ECFCE880;
  swift_bridgeObjectRetain();
  if (v3 != -1)
LABEL_21:
    swift_once();
  swift_beginAccess();
  v4 = 0;
  do
  {
    v6 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_21;
    }
    v7 = *(unsigned __int8 *)(a1 + v4 + 32);
    v8 = off_1ECFCE890;
    swift_beginAccess();
    if (v8[16] != 1)
      goto LABEL_5;
    if (qword_1EF990DA8 != -1)
      swift_once();
    swift_beginAccess();
    v9 = off_1EF991390;
    if (!*((_QWORD *)off_1EF991390 + 2) || (v10 = sub_1CAEDE1C8(v7), (v11 & 1) == 0))
    {
      swift_endAccess();
LABEL_5:
      v16 = &type metadata for FamilyFeatureFlags;
      v17 = sub_1CAEF14A8();
      v15[0] = v7;
      v5 = sub_1CAF201E4();
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v15);
      if ((v5 & 1) == 0)
        goto LABEL_16;
      goto LABEL_6;
    }
    v12 = *(unsigned __int8 *)(v9[7] + v10);
    swift_endAccess();
    if (v12 != 1)
    {
LABEL_16:
      v13 = 0;
      goto LABEL_18;
    }
LABEL_6:
    ++v4;
  }
  while (v6 != v1);
  v13 = 1;
LABEL_18:
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1CAEF0E64(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1CAF176C8(*a1, *a2);
}

uint64_t sub_1CAEF0E70()
{
  sub_1CAF20A18();
  FamilyFeatureFlags.rawValue.getter();
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

uint64_t sub_1CAEF0ED4()
{
  FamilyFeatureFlags.rawValue.getter();
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAEF0F24()
{
  sub_1CAF20A18();
  FamilyFeatureFlags.rawValue.getter();
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

FamilyCircle::FamilyFeatureFlags_optional sub_1CAEF0F84(Swift::String *a1)
{
  return FamilyFeatureFlags.init(rawValue:)(*a1);
}

uint64_t sub_1CAEF0F90@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FamilyFeatureFlags.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

const char *sub_1CAEF0FB4()
{
  return "Family";
}

uint64_t sub_1CAEF0FC8()
{
  return FamilyFeatureFlags.feature.getter();
}

const char *AuthKitFeatureFlags.domain.getter()
{
  return "AuthKit";
}

const char *AuthKitFeatureFlags.feature.getter()
{
  return "TiburonU13";
}

uint64_t static AuthKitFeatureFlags.enabled(_:)(uint64_t a1)
{
  return sub_1CAEF10B8(a1, (uint64_t)&type metadata for AuthKitFeatureFlags, (uint64_t (*)(void))sub_1CAEF14EC);
}

uint64_t static AuthKitFeatureFlags.== infix(_:_:)()
{
  return 1;
}

uint64_t AuthKitFeatureFlags.hash(into:)()
{
  return sub_1CAF20A24();
}

const char *sub_1CAEF1054()
{
  return "AuthKit";
}

const char *sub_1CAEF1068()
{
  return "TiburonU13";
}

const char *AppleIDSetupFeatureFlags.domain.getter()
{
  return "AppleIDSetup";
}

const char *AppleIDSetupFeatureFlags.feature.getter()
{
  return "ProxAdvertisementOverride";
}

uint64_t static AppleIDSetupFeatureFlags.enabled(_:)(uint64_t a1)
{
  return sub_1CAEF10B8(a1, (uint64_t)&type metadata for AppleIDSetupFeatureFlags, (uint64_t (*)(void))sub_1CAEF1530);
}

uint64_t sub_1CAEF10B8(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  char v3;
  _BYTE v5[24];
  uint64_t v6;
  uint64_t v7;

  v6 = a2;
  v7 = a3();
  v3 = sub_1CAF201E4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v5);
  return v3 & 1;
}

uint64_t static AppleIDSetupFeatureFlags.== infix(_:_:)()
{
  return 1;
}

const char *sub_1CAEF1108()
{
  return "AppleIDSetup";
}

const char *sub_1CAEF111C()
{
  return "ProxAdvertisementOverride";
}

const char *AppleAccountFeatures.domain.getter()
{
  return "AppleAccount";
}

const char *AppleAccountFeatures.feature.getter()
{
  _BYTE *v0;
  const char *v1;

  v1 = "ForceLoadRemoteUI";
  if (*v0 != 1)
    v1 = "AABranding";
  if (*v0)
    return v1;
  else
    return "LoadRemoteUI";
}

uint64_t static AppleAccountFeatures.isLoadRemoteUIEnabled.getter()
{
  return sub_1CAEF119C(0);
}

uint64_t static AppleAccountFeatures.shouldForceLoadRemoteUI.getter()
{
  return sub_1CAEF119C(1);
}

uint64_t sub_1CAEF119C(char a1)
{
  char v2;
  _BYTE v4[24];
  ValueMetadata *v5;
  unint64_t v6;

  v5 = &type metadata for AppleAccountFeatures;
  v6 = sub_1CAEF1574();
  v4[0] = a1;
  v2 = sub_1CAF201E4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v4);
  return v2 & 1;
}

BOOL static AppleAccountFeatures.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t AppleAccountFeatures.hash(into:)()
{
  return sub_1CAF20A24();
}

uint64_t AppleAccountFeatures.hashValue.getter()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

const char *sub_1CAEF1270()
{
  return "AppleAccount";
}

const char *sub_1CAEF1284()
{
  _BYTE *v0;
  const char *v1;

  v1 = "ForceLoadRemoteUI";
  if (*v0 != 1)
    v1 = "AABranding";
  if (*v0)
    return v1;
  else
    return "LoadRemoteUI";
}

const char *GroupKitFeatureFlags.domain.getter()
{
  return "GroupKit";
}

const char *GroupKitFeatureFlags.feature.getter()
{
  return "FamilyShadow";
}

uint64_t GroupKitFeatureFlags.isEnabled.getter()
{
  char v0;
  _BYTE v2[24];
  ValueMetadata *v3;
  unint64_t v4;

  v3 = &type metadata for GroupKitFeatureFlags;
  v4 = sub_1CAEF15B8();
  v0 = sub_1CAF201E4();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v2);
  return v0 & 1;
}

uint64_t static GroupKitFeatureFlags.== infix(_:_:)()
{
  return 1;
}

const char *sub_1CAEF134C()
{
  return "GroupKit";
}

const char *sub_1CAEF1360()
{
  return "FamilyShadow";
}

uint64_t _s12FamilyCircle0A12FeatureFlagsO7enabledySbACFZ_0(unsigned __int8 *a1)
{
  uint64_t v1;
  _BYTE *v2;
  _QWORD *v3;
  uint64_t v4;
  char v5;
  char v6;
  _BYTE v8[24];
  ValueMetadata *v9;
  unint64_t v10;

  v1 = *a1;
  if (qword_1ECFCE880 != -1)
    swift_once();
  swift_beginAccess();
  v2 = off_1ECFCE890;
  swift_beginAccess();
  if (v2[16] != 1)
    goto LABEL_10;
  if (qword_1EF990DA8 != -1)
    swift_once();
  swift_beginAccess();
  v3 = off_1EF991390;
  if (!*((_QWORD *)off_1EF991390 + 2) || (v4 = sub_1CAEDE1C8(v1), (v5 & 1) == 0))
  {
    swift_endAccess();
LABEL_10:
    v9 = &type metadata for FamilyFeatureFlags;
    v10 = sub_1CAEF14A8();
    v8[0] = v1;
    v6 = sub_1CAF201E4();
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
    return v6 & 1;
  }
  v6 = *(_BYTE *)(v3[7] + v4);
  swift_endAccess();
  return v6 & 1;
}

unint64_t sub_1CAEF14A8()
{
  unint64_t result;

  result = qword_1ECFCE898;
  if (!qword_1ECFCE898)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for FamilyFeatureFlags, &type metadata for FamilyFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1ECFCE898);
  }
  return result;
}

unint64_t sub_1CAEF14EC()
{
  unint64_t result;

  result = qword_1EF991398;
  if (!qword_1EF991398)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AuthKitFeatureFlags, &type metadata for AuthKitFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EF991398);
  }
  return result;
}

unint64_t sub_1CAEF1530()
{
  unint64_t result;

  result = qword_1EF9913A0;
  if (!qword_1EF9913A0)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AppleIDSetupFeatureFlags, &type metadata for AppleIDSetupFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EF9913A0);
  }
  return result;
}

unint64_t sub_1CAEF1574()
{
  unint64_t result;

  result = qword_1EF9913A8;
  if (!qword_1EF9913A8)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AppleAccountFeatures, &type metadata for AppleAccountFeatures);
    atomic_store(result, (unint64_t *)&qword_1EF9913A8);
  }
  return result;
}

unint64_t sub_1CAEF15B8()
{
  unint64_t result;

  result = qword_1EF98FDF8[0];
  if (!qword_1EF98FDF8[0])
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for GroupKitFeatureFlags, &type metadata for GroupKitFeatureFlags);
    atomic_store(result, qword_1EF98FDF8);
  }
  return result;
}

unint64_t sub_1CAEF1600()
{
  unint64_t result;

  result = qword_1EF9913B0;
  if (!qword_1EF9913B0)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for FamilyFeatureFlags, &type metadata for FamilyFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EF9913B0);
  }
  return result;
}

unint64_t sub_1CAEF1648()
{
  unint64_t result;

  result = qword_1EF9913B8;
  if (!qword_1EF9913B8)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AuthKitFeatureFlags, &type metadata for AuthKitFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EF9913B8);
  }
  return result;
}

unint64_t sub_1CAEF1690()
{
  unint64_t result;

  result = qword_1EF9913C0;
  if (!qword_1EF9913C0)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AppleIDSetupFeatureFlags, &type metadata for AppleIDSetupFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EF9913C0);
  }
  return result;
}

unint64_t sub_1CAEF16D8()
{
  unint64_t result;

  result = qword_1EF9913C8;
  if (!qword_1EF9913C8)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AppleAccountFeatures, &type metadata for AppleAccountFeatures);
    atomic_store(result, (unint64_t *)&qword_1EF9913C8);
  }
  return result;
}

unint64_t sub_1CAEF1720()
{
  unint64_t result;

  result = qword_1EF9913D0;
  if (!qword_1EF9913D0)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for GroupKitFeatureFlags, &type metadata for GroupKitFeatureFlags);
    atomic_store(result, (unint64_t *)&qword_1EF9913D0);
  }
  return result;
}

unint64_t type metadata accessor for FAFamilyFeatureFlag()
{
  unint64_t result;

  result = qword_1EF9913E0;
  if (!qword_1EF9913E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF9913E0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FamilyFeatureFlags(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF5)
    goto LABEL_17;
  if (a2 + 11 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 11) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 11;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 11;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 11;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xC;
  v8 = v6 - 12;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyFeatureFlags(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 11 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 11) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF5)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF4)
    return ((uint64_t (*)(void))((char *)&loc_1CAEF187C + 4 * byte_1CAF2569D[v4]))();
  *a1 = a2 + 11;
  return ((uint64_t (*)(void))((char *)sub_1CAEF18B0 + 4 * byte_1CAF25698[v4]))();
}

uint64_t sub_1CAEF18B0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEF18B8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAEF18C0);
  return result;
}

uint64_t sub_1CAEF18CC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAEF18D4);
  *(_BYTE *)result = a2 + 11;
  return result;
}

uint64_t sub_1CAEF18D8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEF18E0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FamilyFeatureFlags()
{
  return &type metadata for FamilyFeatureFlags;
}

ValueMetadata *type metadata accessor for AuthKitFeatureFlags()
{
  return &type metadata for AuthKitFeatureFlags;
}

ValueMetadata *type metadata accessor for AppleIDSetupFeatureFlags()
{
  return &type metadata for AppleIDSetupFeatureFlags;
}

uint64_t getEnumTagSinglePayload for AppleAccountFeatures(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleAccountFeatures(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1CAEF1A00 + 4 * byte_1CAF256A7[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1CAEF1A34 + 4 * byte_1CAF256A2[v4]))();
}

uint64_t sub_1CAEF1A34(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEF1A3C(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAEF1A44);
  return result;
}

uint64_t sub_1CAEF1A50(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAEF1A58);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1CAEF1A5C(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEF1A64(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppleAccountFeatures()
{
  return &type metadata for AppleAccountFeatures;
}

uint64_t _s12FamilyCircle19AuthKitFeatureFlagsOwst_0(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1CAEF1AC0 + 4 * byte_1CAF256AC[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CAEF1AE0 + 4 * byte_1CAF256B1[v4]))();
}

_BYTE *sub_1CAEF1AC0(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CAEF1AE0(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CAEF1AE8(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CAEF1AF0(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CAEF1AF8(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CAEF1B00(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for GroupKitFeatureFlags()
{
  return &type metadata for GroupKitFeatureFlags;
}

uint64_t sub_1CAEF1B28(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v4 = sub_1CAF1FF8C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13[0] = a1;
  v13[1] = a2;
  sub_1CAF1FF80();
  sub_1CAEEBEE8();
  v8 = sub_1CAF20784();
  v10 = v9;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v11 = HIBYTE(v10) & 0xF;
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v8 & 0xFFFFFFFFFFFFLL;
  if (!v11)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  return v8;
}

uint64_t sub_1CAEF1C04(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD v21[4];
  _QWORD v22[2];

  v22[0] = a1;
  v22[1] = a2;
  v21[2] = v22;
  swift_bridgeObjectRetain();
  v6 = sub_1CAEF1D54(0x7FFFFFFFFFFFFFFFLL, 1, sub_1CAEF2348, (uint64_t)v21, a3, a4);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v22[0] = MEMORY[0x1E0DEE9D8];
    sub_1CAEF9A58(0, v7, 0);
    v8 = v22[0];
    v9 = (uint64_t *)(v6 + 56);
    do
    {
      v10 = *(v9 - 3);
      v11 = *(v9 - 2);
      v12 = *(v9 - 1);
      v13 = *v9;
      swift_bridgeObjectRetain();
      v14 = MEMORY[0x1D17996F0](v10, v11, v12, v13);
      v16 = v15;
      swift_bridgeObjectRelease();
      v22[0] = v8;
      v18 = *(_QWORD *)(v8 + 16);
      v17 = *(_QWORD *)(v8 + 24);
      if (v18 >= v17 >> 1)
      {
        sub_1CAEF9A58(v17 > 1, v18 + 1, 1);
        v8 = v22[0];
      }
      *(_QWORD *)(v8 + 16) = v18 + 1;
      v19 = v8 + 16 * v18;
      *(_QWORD *)(v19 + 32) = v14;
      *(_QWORD *)(v19 + 40) = v16;
      v9 += 4;
      --v7;
    }
    while (v7);
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  return v8;
}

uint64_t sub_1CAEF1D54(uint64_t a1, char a2, uint64_t (*a3)(_QWORD *), uint64_t a4, uint64_t a5, unint64_t a6)
{
  uint64_t v6;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  _QWORD *v40;
  uint64_t result;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  unint64_t v48;
  _QWORD v50[4];

  v50[3] = a4;
  if (a1 < 0)
    goto LABEL_42;
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = MEMORY[0x1E0DEE9D8];
  v47 = swift_allocObject();
  *(_QWORD *)(v47 + 16) = 15;
  v11 = HIBYTE(a6) & 0xF;
  if (!a1 || ((a6 & 0x2000000000000000) != 0 ? (v12 = HIBYTE(a6) & 0xF) : (v12 = a5 & 0xFFFFFFFFFFFFLL), !v12))
  {
    if ((a6 & 0x2000000000000000) == 0)
      v11 = a5 & 0xFFFFFFFFFFFFLL;
    v30 = 7;
    if (((a6 >> 60) & ((a5 & 0x800000000000000) == 0)) != 0)
      v30 = 11;
    sub_1CAEF21F0(v30 | (v11 << 16), v47, a2 & 1, v10);
    swift_bridgeObjectRelease();
    v13 = *(_QWORD **)(v10 + 16);
    swift_bridgeObjectRetain();
    swift_release();
LABEL_39:
    swift_release();
    return (uint64_t)v13;
  }
  v42 = a1;
  v43 = v10;
  v48 = 4 * v12;
  v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v14 = 15;
  v15 = 15;
  v16 = 15;
  while (1)
  {
    v50[0] = sub_1CAF20508();
    v50[1] = v17;
    v18 = a3(v50);
    if (v6)
    {
      swift_release();
      swift_release();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return (uint64_t)v13;
    }
    v19 = v18;
    swift_bridgeObjectRelease();
    if ((v19 & 1) != 0)
      break;
    v14 = sub_1CAF2049C();
LABEL_9:
    if (v48 == v14 >> 14)
      goto LABEL_29;
  }
  if (v15 >> 14 == v14 >> 14 && (a2 & 1) != 0)
  {
    v14 = sub_1CAF2049C();
    *(_QWORD *)(v47 + 16) = v14;
    v15 = v14;
    v16 = v14;
    goto LABEL_9;
  }
  if (v14 >> 14 < v15 >> 14)
    goto LABEL_41;
  v20 = sub_1CAF20520();
  v44 = v21;
  v45 = v20;
  v23 = v22;
  v25 = v24;
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v13 = sub_1CAEE59F0(0, v13[2] + 1, 1, v13);
  v27 = v13[2];
  v26 = v13[3];
  if (v27 >= v26 >> 1)
    v13 = sub_1CAEE59F0((_QWORD *)(v26 > 1), v27 + 1, 1, v13);
  v13[2] = v27 + 1;
  v28 = &v13[4 * v27];
  v28[4] = v45;
  v28[5] = v23;
  v28[6] = v25;
  v28[7] = v44;
  *(_QWORD *)(v43 + 16) = v13;
  v29 = sub_1CAF2049C();
  v14 = v29;
  *(_QWORD *)(v47 + 16) = v29;
  if (v13[2] != v42)
  {
    v15 = v29;
    v16 = v29;
    goto LABEL_9;
  }
  v16 = v29;
  v15 = v29;
LABEL_29:
  if (v48 == v15 >> 14 && (a2 & 1) != 0)
  {
    swift_bridgeObjectRelease();
LABEL_38:
    swift_bridgeObjectRetain();
    swift_release();
    goto LABEL_39;
  }
  if (v48 >= v16 >> 14)
  {
    v31 = sub_1CAF20520();
    v33 = v32;
    v35 = v34;
    v37 = v36;
    swift_bridgeObjectRelease();
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v13 = sub_1CAEE59F0(0, v13[2] + 1, 1, v13);
    v39 = v13[2];
    v38 = v13[3];
    if (v39 >= v38 >> 1)
      v13 = sub_1CAEE59F0((_QWORD *)(v38 > 1), v39 + 1, 1, v13);
    v13[2] = v39 + 1;
    v40 = &v13[4 * v39];
    v40[4] = v31;
    v40[5] = v33;
    v40[6] = v35;
    v40[7] = v37;
    *(_QWORD *)(v43 + 16) = v13;
    goto LABEL_38;
  }
LABEL_41:
  sub_1CAF208B0();
  __break(1u);
LABEL_42:
  result = sub_1CAF208B0();
  __break(1u);
  return result;
}

uint64_t sub_1CAEF21F0(unint64_t a1, uint64_t a2, unsigned __int8 a3, uint64_t a4)
{
  unint64_t v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  uint64_t result;

  v4 = *(_QWORD *)(a2 + 16) >> 14;
  v5 = (v4 == a1 >> 14) & a3;
  if (v5 == 1)
    return v5 ^ 1u;
  if (a1 >> 14 >= v4)
  {
    v7 = sub_1CAF20520();
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v14 = *(_QWORD **)(a4 + 16);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    *(_QWORD *)(a4 + 16) = v14;
    if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    {
      v14 = sub_1CAEE59F0(0, v14[2] + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v17 = v14[2];
    v16 = v14[3];
    if (v17 >= v16 >> 1)
    {
      v14 = sub_1CAEE59F0((_QWORD *)(v16 > 1), v17 + 1, 1, v14);
      *(_QWORD *)(a4 + 16) = v14;
    }
    v14[2] = v17 + 1;
    v18 = &v14[4 * v17];
    v18[4] = v7;
    v18[5] = v9;
    v18[6] = v11;
    v18[7] = v13;
    return v5 ^ 1u;
  }
  result = sub_1CAF208B0();
  __break(1u);
  return result;
}

uint64_t sub_1CAEF2348(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v2;

  v2 = *(_QWORD **)(v1 + 16);
  if (*a1 == *v2 && a1[1] == v2[1])
    return 1;
  else
    return sub_1CAF209A0() & 1;
}

uint64_t sub_1CAEF239C()
{
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CAEF23C0()
{
  return swift_deallocObject();
}

BOOL sub_1CAEF23D0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

id FAChildAccountCutOffAgeRequest.__allocating_init(urlProvider:urlSession:)(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  char *v5;
  objc_super v7;

  v5 = (char *)objc_allocWithZone(v2);
  *(_QWORD *)&v5[OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlProvider] = a1;
  *(_QWORD *)&v5[OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlSession] = a2;
  v7.receiver = v5;
  v7.super_class = v2;
  return objc_msgSendSuper2(&v7, sel_init);
}

id FAChildAccountCutOffAgeRequest.init(urlProvider:urlSession:)(uint64_t a1, uint64_t a2)
{
  char *v2;
  objc_super v4;

  *(_QWORD *)&v2[OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlProvider] = a1;
  *(_QWORD *)&v2[OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlSession] = a2;
  v4.receiver = v2;
  v4.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeRequest();
  return objc_msgSendSuper2(&v4, sel_init);
}

uint64_t type metadata accessor for FAChildAccountCutOffAgeRequest()
{
  return objc_opt_self();
}

uint64_t sub_1CAEF2528()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[19] = v0;
  v2 = sub_1CAF200D0();
  v1[20] = v2;
  v1[21] = *(_QWORD *)(v2 - 8);
  v1[22] = swift_task_alloc();
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CAEF25A4()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_1ECFCE888 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  v0[25] = __swift_project_value_buffer(v1, (uint64_t)qword_1ECFCE8A8);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1CAEBA000, v2, v3, "Fetching child cutoff age", v4, 2u);
    MEMORY[0x1D179A698](v4, -1, -1);
  }
  v5 = v0[23];
  v6 = v0[19];

  v7 = *(void **)(v6 + OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlProvider);
  v0[7] = v5;
  v0[2] = v0;
  v0[3] = sub_1CAEF270C;
  v8 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v9 = v0 + 10;
  v9[1] = 0x40000000;
  v9[2] = sub_1CAEF2F4C;
  v9[3] = &block_descriptor_2;
  v9[4] = v8;
  objc_msgSend(v7, sel_URLForEndpoint_withCompletion_, CFSTR("childAccountCutOffAge"), v9);
  return swift_continuation_await();
}

uint64_t sub_1CAEF270C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CAEF276C()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t, uint64_t);
  objc_class *v7;
  char *v8;
  id v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;

  v1 = *(_QWORD *)(v0 + 192);
  v3 = *(_QWORD *)(v0 + 168);
  v2 = *(char **)(v0 + 176);
  v5 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 160);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 32))(v1, *(_QWORD *)(v0 + 184), v4);
  v6 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
  v6(v2, v1, v4);
  v7 = (objc_class *)type metadata accessor for FAChildAccountCutOffAgeRequest.Request();
  v8 = (char *)objc_allocWithZone(v7);
  v6(&v8[OBJC_IVAR____TtCC12FamilyCircle30FAChildAccountCutOffAgeRequest7Request_url], (uint64_t)v2, v4);
  *(_QWORD *)(v0 + 120) = v8;
  *(_QWORD *)(v0 + 128) = v7;
  v9 = objc_msgSendSuper2((objc_super *)(v0 + 120), sel_init);
  *(_QWORD *)(v0 + 216) = v9;
  v10 = *(void (**)(char *, uint64_t))(v3 + 8);
  *(_QWORD *)(v0 + 224) = v10;
  v10(v2, v4);
  v11 = *(_QWORD *)(v5 + OBJC_IVAR___FAChildAccountCutOffAgeRequest_urlSession);
  v12 = swift_task_alloc();
  *(_QWORD *)(v0 + 232) = v12;
  *(_QWORD *)(v12 + 16) = v9;
  *(_QWORD *)(v12 + 24) = v11;
  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 240) = v13;
  type metadata accessor for FAChildAccountCutOffAgeResponse();
  *v13 = v0;
  v13[1] = sub_1CAEF28BC;
  return sub_1CAF209AC();
}

uint64_t sub_1CAEF28BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

id sub_1CAEF2928()
{
  uint64_t v0;
  void *v1;
  id v2;
  id result;
  void *v4;
  void (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  id v14;
  uint64_t v15;
  id v16;
  void (*v17)(uint64_t, uint64_t);
  void *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE *v21;
  _QWORD *v22;

  v1 = *(void **)(v0 + 144);
  v2 = objc_msgSend(v1, sel_error);
  if (v2)
  {

    result = objc_msgSend(v1, sel_error);
    v4 = result;
    if (!result)
    {
      __break(1u);
      return result;
    }
  }
  else
  {
    v16 = objc_msgSend(v1, sel_responseDictionary);
    if (v16)
    {
      v18 = *(void **)(v0 + 216);
      v17 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
      v19 = *(_QWORD *)(v0 + 192);
      v20 = *(_QWORD *)(v0 + 160);

      v17(v19, v20);
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (id)(*(uint64_t (**)(void *))(v0 + 8))(v1);
    }
    sub_1CAEF4B98();
    v4 = (void *)swift_allocError();
    *v21 = 1;
  }
  v6 = *(void **)(v0 + 216);
  v5 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
  v7 = *(_QWORD *)(v0 + 192);
  v8 = *(_QWORD *)(v0 + 160);
  swift_willThrow();
  v5(v7, v8);

  v9 = v4;
  v10 = v4;
  v11 = sub_1CAF202C8();
  v12 = sub_1CAF206AC();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v13 = 138412290;
    v14 = v4;
    v15 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 136) = v15;
    sub_1CAF2076C();
    *v22 = v15;

    _os_log_impl(&dword_1CAEBA000, v11, v12, "Error Fetching child cutoff age: %@", v13, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991400);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v22, -1, -1);
    MEMORY[0x1D179A698](v13, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (id)(*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEF2BE8()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 224);
  v2 = *(void **)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 192);
  v4 = *(_QWORD *)(v0 + 160);
  swift_task_dealloc();

  v1(v3, v4);
  v5 = *(void **)(v0 + 248);
  v6 = v5;
  v7 = v5;
  v8 = sub_1CAF202C8();
  v9 = sub_1CAF206AC();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v5;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 136) = v13;
    sub_1CAF2076C();
    *v11 = v13;

    _os_log_impl(&dword_1CAEBA000, v8, v9, "Error Fetching child cutoff age: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991400);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v11, -1, -1);
    MEMORY[0x1D179A698](v10, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEF2DAC()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  _QWORD *v7;
  id v8;
  uint64_t v9;

  swift_willThrow();
  v1 = *(void **)(v0 + 208);
  v2 = v1;
  v3 = v1;
  v4 = sub_1CAF202C8();
  v5 = sub_1CAF206AC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v6 = 138412290;
    v8 = v1;
    v9 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 136) = v9;
    sub_1CAF2076C();
    *v7 = v9;

    _os_log_impl(&dword_1CAEBA000, v4, v5, "Error Fetching child cutoff age: %@", v6, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991400);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v7, -1, -1);
    MEMORY[0x1D179A698](v6, -1, -1);
  }
  else
  {

  }
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEF2F4C(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v13;

  v5 = sub_1CAF200D0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    swift_allocError();
    *v10 = a3;
    v11 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_1CAF200AC();
    (*(void (**)(_QWORD, char *, uint64_t))(v6 + 32))(*(_QWORD *)(*(_QWORD *)(v9 + 64) + 40), v8, v5);
    return swift_continuation_throwingResume();
  }
}

uint64_t AARequest.fa_perform<A>(session:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[4] = a2;
  v3[5] = v2;
  v3[3] = a1;
  return swift_task_switch();
}

uint64_t sub_1CAEF3058()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v2;
  *(_OWORD *)(v2 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v2 + 32) = v1;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v3;
  *v3 = v0;
  v3[1] = sub_1CAEF3104;
  return sub_1CAF209AC();
}

uint64_t sub_1CAEF3104()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEF3170()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1CAEF317C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEF32CC(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_1CAEF332C;
  return sub_1CAEF2528();
}

uint64_t sub_1CAEF332C(void *a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  void *v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD, _QWORD);
  void *v8;

  v3 = v1;
  v5 = *(void **)(*v2 + 16);
  v6 = *v2;
  swift_task_dealloc();

  v7 = *(void (***)(_QWORD, _QWORD, _QWORD))(v6 + 24);
  if (v3)
  {
    v8 = (void *)sub_1CAF20064();

    ((void (**)(_QWORD, _QWORD, void *))v7)[2](v7, 0, v8);
    _Block_release(v7);
  }
  else
  {
    ((void (**)(_QWORD, void *, _QWORD))v7)[2](v7, a1, 0);
    _Block_release(v7);

  }
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id FAChildAccountCutOffAgeRequest.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FAChildAccountCutOffAgeRequest.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FAChildAccountCutOffAgeRequest.__deallocating_deinit(uint64_t a1)
{
  return sub_1CAEF420C(a1, type metadata accessor for FAChildAccountCutOffAgeRequest);
}

id sub_1CAEF3570()
{
  return sub_1CAEF420C(0, type metadata accessor for FAChildAccountCutOffAgeRequest.Request);
}

id sub_1CAEF3610()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  _BYTE v6[40];
  __int128 v7;
  __int128 v8;

  result = objc_msgSend(v0, sel_responseDictionary);
  if (result)
  {
    v2 = result;
    v3 = sub_1CAF20394();

    sub_1CAF207F0();
    if (*(_QWORD *)(v3 + 16) && (v4 = sub_1CAEDE8B0((uint64_t)v6), (v5 & 1) != 0))
    {
      sub_1CAEDCD8C(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)&v7);
    }
    else
    {
      v7 = 0u;
      v8 = 0u;
    }
    swift_bridgeObjectRelease();
    sub_1CAEDF51C((uint64_t)v6);
    if (*((_QWORD *)&v8 + 1))
    {
      if (swift_dynamicCast())
        return (id)0xD000000000000017;
    }
    else
    {
      sub_1CAEF5168((uint64_t)&v7, (uint64_t *)&unk_1EF9903E8);
    }
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1CAEF3774()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unsigned __int8 *v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unsigned int v16;
  uint64_t v17;
  uint64_t v18;
  unsigned __int8 *v19;
  unsigned int v20;
  uint64_t v21;
  uint64_t v22;
  unsigned __int8 *v23;
  unsigned int v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  unint64_t v28;
  _QWORD v29[3];
  uint64_t v30;
  _OWORD v31[2];

  result = objc_msgSend(v0, sel_responseDictionary);
  if (!result)
    goto LABEL_73;
  v2 = result;
  v3 = sub_1CAF20394();

  strcpy((char *)v31, "childCutOffAge");
  HIBYTE(v31[0]) = -18;
  sub_1CAF207F0();
  if (*(_QWORD *)(v3 + 16) && (v4 = sub_1CAEDE8B0((uint64_t)v29), (v5 & 1) != 0))
    sub_1CAEDCD8C(*(_QWORD *)(v3 + 56) + 32 * v4, (uint64_t)v31);
  else
    memset(v31, 0, sizeof(v31));
  swift_bridgeObjectRelease();
  sub_1CAEDF51C((uint64_t)v29);
  sub_1CAEF4BE8((uint64_t)v31, (uint64_t)v29);
  if (!v30)
  {
    sub_1CAEF5168((uint64_t)v29, (uint64_t *)&unk_1EF9903E8);
LABEL_18:
    sub_1CAEF4C30((uint64_t)v31, (uint64_t)v29);
    if (v30)
    {
      if (swift_dynamicCast())
        return (id)v27;
    }
    else
    {
      sub_1CAEF5168((uint64_t)v29, (uint64_t *)&unk_1EF9903E8);
    }
    return 0;
  }
  if ((swift_dynamicCast() & 1) == 0)
    goto LABEL_18;
  result = (id)v27;
  v6 = HIBYTE(v28) & 0xF;
  v7 = v27 & 0xFFFFFFFFFFFFLL;
  if ((v28 & 0x2000000000000000) != 0)
    v8 = HIBYTE(v28) & 0xF;
  else
    v8 = v27 & 0xFFFFFFFFFFFFLL;
  if (!v8)
  {
    swift_bridgeObjectRelease();
    v13 = 0;
LABEL_50:
    sub_1CAEF5168((uint64_t)v31, (uint64_t *)&unk_1EF9903E8);
    return (id)v13;
  }
  if ((v28 & 0x1000000000000000) != 0)
  {
    v10 = (uint64_t)sub_1CAEF4C78(v27, v28, 10);
    v12 = v26;
LABEL_47:
    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      v13 = 0;
    else
      v13 = v10;
    goto LABEL_50;
  }
  if ((v28 & 0x2000000000000000) == 0)
  {
    if ((v27 & 0x1000000000000000) != 0)
      v9 = (unsigned __int8 *)((v28 & 0xFFFFFFFFFFFFFFFLL) + 32);
    else
      v9 = (unsigned __int8 *)sub_1CAF2082C();
    v10 = (uint64_t)sub_1CAEF5238(v9, v7, 10);
    v12 = v11 & 1;
    goto LABEL_47;
  }
  v29[0] = v27;
  v29[1] = v28 & 0xFFFFFFFFFFFFFFLL;
  if (v27 != 43)
  {
    if (v27 == 45)
    {
      if (v6)
      {
        if (v6 == 1 || (BYTE1(v27) - 48) > 9u)
          goto LABEL_44;
        if (v6 == 2)
        {
          v12 = 0;
          v10 = -(uint64_t)(BYTE1(v27) - 48);
          goto LABEL_47;
        }
        if ((BYTE2(v27) - 48) > 9u)
          goto LABEL_44;
        v10 = -10 * (BYTE1(v27) - 48) - (BYTE2(v27) - 48);
        v22 = v6 - 3;
        if (v22)
        {
          v23 = (unsigned __int8 *)v29 + 3;
          while (1)
          {
            v24 = *v23 - 48;
            if (v24 > 9)
              goto LABEL_44;
            v25 = 10 * v10;
            if ((unsigned __int128)(v10 * (__int128)10) >> 64 != (10 * v10) >> 63)
              goto LABEL_44;
            v10 = v25 - v24;
            if (__OFSUB__(v25, v24))
              goto LABEL_44;
            v12 = 0;
            ++v23;
            if (!--v22)
              goto LABEL_47;
          }
        }
        goto LABEL_46;
      }
      __break(1u);
      goto LABEL_72;
    }
    if (!v6 || (v27 - 48) > 9u)
    {
LABEL_44:
      v10 = 0;
      v12 = 1;
      goto LABEL_47;
    }
    v10 = (v27 - 48);
    if (v6 != 1)
    {
      if ((BYTE1(v27) - 48) > 9u)
        goto LABEL_44;
      v10 = 10 * (v27 - 48) + (BYTE1(v27) - 48);
      v18 = v6 - 2;
      if (v18)
      {
        v19 = (unsigned __int8 *)v29 + 2;
        while (1)
        {
          v20 = *v19 - 48;
          if (v20 > 9)
            goto LABEL_44;
          v21 = 10 * v10;
          if ((unsigned __int128)(v10 * (__int128)10) >> 64 != (10 * v10) >> 63)
            goto LABEL_44;
          v10 = v21 + v20;
          if (__OFADD__(v21, v20))
            goto LABEL_44;
          v12 = 0;
          ++v19;
          if (!--v18)
            goto LABEL_47;
        }
      }
    }
    goto LABEL_46;
  }
  if (v6)
  {
    if (v6 == 1 || (BYTE1(v27) - 48) > 9u)
      goto LABEL_44;
    v10 = (BYTE1(v27) - 48);
    if (v6 != 2)
    {
      if ((BYTE2(v27) - 48) > 9u)
        goto LABEL_44;
      v10 = 10 * (BYTE1(v27) - 48) + (BYTE2(v27) - 48);
      v14 = v6 - 3;
      if (v14)
      {
        v15 = (unsigned __int8 *)v29 + 3;
        while (1)
        {
          v16 = *v15 - 48;
          if (v16 > 9)
            goto LABEL_44;
          v17 = 10 * v10;
          if ((unsigned __int128)(v10 * (__int128)10) >> 64 != (10 * v10) >> 63)
            goto LABEL_44;
          v10 = v17 + v16;
          if (__OFADD__(v17, v16))
            goto LABEL_44;
          v12 = 0;
          ++v15;
          if (!--v14)
            goto LABEL_47;
        }
      }
    }
LABEL_46:
    v12 = 0;
    goto LABEL_47;
  }
LABEL_72:
  __break(1u);
LABEL_73:
  __break(1u);
  return result;
}

id FAChildAccountCutOffAgeResponse.__allocating_init(httpResponse:data:)(void *a1, uint64_t a2, unint64_t a3)
{
  objc_class *v3;
  void *v5;
  id v8;

  if (a3 >> 60 == 15)
  {
    v5 = 0;
  }
  else
  {
    v5 = (void *)sub_1CAF200DC();
    sub_1CAEF4D5C(a2, a3);
  }
  v8 = objc_msgSend(objc_allocWithZone(v3), sel_initWithHTTPResponse_data_, a1, v5);

  return v8;
}

id FAChildAccountCutOffAgeResponse.init(httpResponse:data:)(void *a1, uint64_t a2, unint64_t a3)
{
  void *v3;
  void *v7;
  id v8;
  id v9;
  objc_super v11;

  if (a3 >> 60 == 15)
    v7 = 0;
  else
    v7 = (void *)sub_1CAF200DC();
  v11.receiver = v3;
  v11.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeResponse();
  v8 = objc_msgSendSuper2(&v11, sel_initWithHTTPResponse_data_, a1, v7);
  sub_1CAEF4D5C(a2, a3);

  v9 = v8;
  if (v9)

  return v9;
}

id FAChildAccountCutOffAgeResponse.__allocating_init(httpResponse:data:bodyIsPlist:)(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  objc_class *v4;
  objc_class *v5;
  void *v8;
  id v11;

  v5 = v4;
  if (a3 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_1CAF200DC();
    sub_1CAEF4D5C(a2, a3);
  }
  v11 = objc_msgSend(objc_allocWithZone(v5), sel_initWithHTTPResponse_data_bodyIsPlist_, a1, v8, a4 & 1);

  return v11;
}

id FAChildAccountCutOffAgeResponse.init(httpResponse:data:bodyIsPlist:)(void *a1, uint64_t a2, unint64_t a3, char a4)
{
  void *v4;
  void *v9;
  id v10;
  id v11;
  objc_super v13;

  if (a3 >> 60 == 15)
    v9 = 0;
  else
    v9 = (void *)sub_1CAF200DC();
  v13.receiver = v4;
  v13.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeResponse();
  v10 = objc_msgSendSuper2(&v13, sel_initWithHTTPResponse_data_bodyIsPlist_, a1, v9, a4 & 1);
  sub_1CAEF4D5C(a2, a3);

  v11 = v10;
  if (v11)

  return v11;
}

id FAChildAccountCutOffAgeResponse.__allocating_init(httpResponse:data:mediaType:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  objc_class *v5;
  void *v8;
  void *v9;
  id v12;

  if (a3 >> 60 != 15)
  {
    v8 = (void *)sub_1CAF200DC();
    sub_1CAEF4D5C(a2, a3);
    if (a5)
      goto LABEL_3;
LABEL_5:
    v9 = 0;
    goto LABEL_6;
  }
  v8 = 0;
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v9 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
LABEL_6:
  v12 = objc_msgSend(objc_allocWithZone(v5), sel_initWithHTTPResponse_data_mediaType_, a1, v8, v9);

  return v12;
}

id FAChildAccountCutOffAgeResponse.init(httpResponse:data:mediaType:)(void *a1, uint64_t a2, unint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v5;
  void *v10;
  void *v11;
  id v12;
  id v13;
  objc_super v15;

  if (a3 >> 60 == 15)
  {
    v10 = 0;
    if (a5)
    {
LABEL_3:
      v11 = (void *)sub_1CAF203DC();
      swift_bridgeObjectRelease();
      goto LABEL_6;
    }
  }
  else
  {
    v10 = (void *)sub_1CAF200DC();
    if (a5)
      goto LABEL_3;
  }
  v11 = 0;
LABEL_6:
  v15.receiver = v5;
  v15.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeResponse();
  v12 = objc_msgSendSuper2(&v15, sel_initWithHTTPResponse_data_mediaType_, a1, v10, v11);
  sub_1CAEF4D5C(a2, a3);

  v13 = v12;
  if (v13)

  return v13;
}

id FAChildAccountCutOffAgeResponse.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for FAChildAccountCutOffAgeResponse();
  return objc_msgSendSuper2(&v2, sel_init);
}

id FAChildAccountCutOffAgeResponse.__deallocating_deinit(uint64_t a1)
{
  return sub_1CAEF420C(a1, type metadata accessor for FAChildAccountCutOffAgeResponse);
}

id sub_1CAEF420C(uint64_t a1, uint64_t (*a2)(void))
{
  void *v2;
  objc_super v4;

  v4.receiver = v2;
  v4.super_class = (Class)a2();
  return objc_msgSendSuper2(&v4, sel_dealloc);
}

void sub_1CAEF423C(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991468);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
  v9 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
  v10 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v10 + v9, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
  aBlock[4] = sub_1CAEF5AEC;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CAEF4674;
  aBlock[3] = &block_descriptor_32;
  v11 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_performRequestWithSession_withHandler_, a3, v11);
  _Block_release(v11);
}

void sub_1CAEF4374(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
  v8 = sub_1CAF20610();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)aBlock - v10;
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)aBlock - v10, a1, v8);
  v12 = (*(unsigned __int8 *)(v9 + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a4;
  (*(void (**)(unint64_t, char *, uint64_t))(v9 + 32))(v13 + v12, v11, v8);
  aBlock[4] = sub_1CAEF59F0;
  aBlock[5] = v13;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CAEF4674;
  aBlock[3] = &block_descriptor_26;
  v14 = _Block_copy(aBlock);
  swift_release();
  objc_msgSend(a2, sel_performRequestWithSession_withHandler_, a3, v14);
  _Block_release(v14);
}

uint64_t sub_1CAEF44D4(int a1, void *a2, id a3)
{
  id v3;
  id v5;
  _BYTE *v7;

  if (a3)
  {
    v3 = a3;
  }
  else
  {
    if (a2)
    {
      type metadata accessor for FAChildAccountCutOffAgeResponse();
      if (swift_dynamicCastClass())
      {
        v5 = a2;
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991468);
        return sub_1CAF20604();
      }
    }
    sub_1CAEF4B98();
    swift_allocError();
    *v7 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991468);
  return sub_1CAF205F8();
}

uint64_t sub_1CAEF4588(int a1, void *a2, id a3)
{
  id v3;
  id v5;
  _BYTE *v7;

  if (a3)
  {
    v3 = a3;
  }
  else
  {
    if (a2 && swift_dynamicCastUnknownClass())
    {
      v5 = a2;
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
      sub_1CAF20610();
      return sub_1CAF20604();
    }
    sub_1CAEF4B98();
    swift_allocError();
    *v7 = 0;
  }
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
  sub_1CAF20610();
  return sub_1CAF205F8();
}

void sub_1CAEF4674(uint64_t a1, void *a2, void *a3, void *a4)
{
  void (*v7)(void *, void *, void *);
  id v8;
  id v9;
  id v10;

  v7 = *(void (**)(void *, void *, void *))(a1 + 32);
  swift_retain();
  v10 = a2;
  v8 = a3;
  v9 = a4;
  v7(a2, a3, a4);
  swift_release();

}

uint64_t sub_1CAEF4704(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1CAEDCEDC;
  return v6();
}

uint64_t sub_1CAEF4758(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1CAEDCEDC;
  return v7();
}

uint64_t sub_1CAEF47AC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1CAF20658();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1CAF2064C();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1CAEF5168(a1, &qword_1ECFCE7A0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CAF205EC();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1CAEF48F8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CAEF495C;
  return v6(a1);
}

uint64_t sub_1CAEF495C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

_QWORD *sub_1CAEF49A8(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE8C0);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1CAEF4A0C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_1CAF204FC();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1D179975C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

void sub_1CAEF4A84(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_1CAF2076C();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

uint64_t type metadata accessor for FAChildAccountCutOffAgeRequest.Request()
{
  uint64_t result;

  result = qword_1EF991420;
  if (!qword_1EF991420)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1CAEF4B70(uint64_t a1)
{
  uint64_t v1;

  sub_1CAEF423C(a1, *(void **)(v1 + 16), *(_QWORD *)(v1 + 24));
}

uint64_t type metadata accessor for FAChildAccountCutOffAgeResponse()
{
  return objc_opt_self();
}

unint64_t sub_1CAEF4B98()
{
  unint64_t result;

  result = qword_1EF991408;
  if (!qword_1EF991408)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF25BFC, &type metadata for FAAARequestError);
    atomic_store(result, (unint64_t *)&qword_1EF991408);
  }
  return result;
}

void sub_1CAEF4BDC(uint64_t a1)
{
  uint64_t v1;

  sub_1CAEF4374(a1, *(void **)(v1 + 24), *(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 16));
}

uint64_t sub_1CAEF4BE8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF9903E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CAEF4C30(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF9903E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

unsigned __int8 *sub_1CAEF4C78(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned __int8 *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unsigned __int8 *v11;
  uint64_t v13;
  uint64_t v14;

  v13 = a1;
  v14 = a2;
  swift_bridgeObjectRetain();
  v5 = sub_1CAF20514();
  v6 = v4;
  if ((v4 & 0x1000000000000000) == 0)
  {
    if ((v4 & 0x2000000000000000) == 0)
      goto LABEL_3;
LABEL_6:
    v8 = HIBYTE(v6) & 0xF;
    v13 = v5;
    v14 = v6 & 0xFFFFFFFFFFFFFFLL;
    v7 = (unsigned __int8 *)&v13;
    goto LABEL_7;
  }
  v5 = sub_1CAEF54B4();
  v10 = v9;
  swift_bridgeObjectRelease();
  v6 = v10;
  if ((v10 & 0x2000000000000000) != 0)
    goto LABEL_6;
LABEL_3:
  if ((v5 & 0x1000000000000000) != 0)
  {
    v7 = (unsigned __int8 *)((v6 & 0xFFFFFFFFFFFFFFFLL) + 32);
    v8 = v5 & 0xFFFFFFFFFFFFLL;
  }
  else
  {
    v7 = (unsigned __int8 *)sub_1CAF2082C();
  }
LABEL_7:
  v11 = sub_1CAEF5238(v7, v8, a3);
  swift_bridgeObjectRelease();
  return v11;
}

uint64_t sub_1CAEF4D5C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1CAEF4D70(a1, a2);
  return a1;
}

uint64_t sub_1CAEF4D70(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t method lookup function for FAChildAccountCutOffAgeRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FAChildAccountCutOffAgeRequest.__allocating_init(urlProvider:urlSession:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of FAChildAccountCutOffAgeRequest.fetch()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEF4E30;
  return v5();
}

uint64_t sub_1CAEF4E30(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1CAEF4E80()
{
  return type metadata accessor for FAChildAccountCutOffAgeRequest.Request();
}

uint64_t sub_1CAEF4E88()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CAF200D0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for FAChildAccountCutOffAgeResponse()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FAChildAccountCutOffAgeResponse.childCutOffAgeLocalized.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50))();
}

uint64_t dispatch thunk of FAChildAccountCutOffAgeResponse.childCutOffAge.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58))();
}

uint64_t storeEnumTagSinglePayload for FAAARequestError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1CAEF4F84 + 4 * byte_1CAF25AF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CAEF4FB8 + 4 * byte_1CAF25AF0[v4]))();
}

uint64_t sub_1CAEF4FB8(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEF4FC0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAEF4FC8);
  return result;
}

uint64_t sub_1CAEF4FD4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAEF4FDCLL);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CAEF4FE0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAEF4FE8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FAAARequestError()
{
  return &type metadata for FAAARequestError;
}

unint64_t sub_1CAEF5008()
{
  unint64_t result;

  result = qword_1EF991430;
  if (!qword_1EF991430)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF25BD4, &type metadata for FAAARequestError);
    atomic_store(result, (unint64_t *)&qword_1EF991430);
  }
  return result;
}

uint64_t sub_1CAEF504C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_1CAEF5078()
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
  v4[1] = sub_1CAEDCC10;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_1EF991438 + dword_1EF991438))(v2, v3);
}

uint64_t sub_1CAEF50E4(uint64_t a1)
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
  v7[1] = sub_1CAEDCEDC;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1EF991450 + dword_1EF991450))(a1, v4, v5, v6);
}

uint64_t sub_1CAEF5168(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1CAEF51A4()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAEF51C8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAEDCC10;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF991458 + dword_1EF991458))(a1, v4);
}

unsigned __int8 *sub_1CAEF5238(unsigned __int8 *result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  unsigned __int8 v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  uint64_t v9;
  unsigned __int8 *i;
  unsigned int v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 v15;
  unsigned __int8 v16;
  unsigned __int8 v17;
  unsigned __int8 *v18;
  unsigned int v19;
  char v20;
  uint64_t v21;
  unsigned __int8 v22;
  unsigned __int8 v23;
  unsigned __int8 v24;
  uint64_t v25;
  unsigned int v26;
  char v27;
  uint64_t v28;

  v3 = a2;
  v4 = *result;
  if (v4 != 43)
  {
    if (v4 == 45)
    {
      if (a2 >= 1)
      {
        v5 = a2 - 1;
        if (a2 != 1)
        {
          v6 = a3 + 48;
          v7 = a3 + 55;
          v8 = a3 + 87;
          if (a3 > 10)
          {
            v6 = 58;
          }
          else
          {
            v8 = 97;
            v7 = 65;
          }
          if (result)
          {
            v9 = 0;
            for (i = result + 1; ; ++i)
            {
              v11 = *i;
              if (v11 < 0x30 || v11 >= v6)
              {
                if (v11 < 0x41 || v11 >= v7)
                {
                  if (v11 < 0x61 || v11 >= v8)
                    return 0;
                  v12 = -87;
                }
                else
                {
                  v12 = -55;
                }
              }
              else
              {
                v12 = -48;
              }
              v13 = v9 * a3;
              if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
                return 0;
              v9 = v13 - (v11 + v12);
              if (__OFSUB__(v13, (v11 + v12)))
                return 0;
              if (!--v5)
                return (unsigned __int8 *)v9;
            }
          }
          return 0;
        }
        return 0;
      }
      __break(1u);
      goto LABEL_65;
    }
    if (a2)
    {
      v22 = a3 + 48;
      v23 = a3 + 55;
      v24 = a3 + 87;
      if (a3 > 10)
      {
        v22 = 58;
      }
      else
      {
        v24 = 97;
        v23 = 65;
      }
      if (result)
      {
        v25 = 0;
        do
        {
          v26 = *result;
          if (v26 < 0x30 || v26 >= v22)
          {
            if (v26 < 0x41 || v26 >= v23)
            {
              if (v26 < 0x61 || v26 >= v24)
                return 0;
              v27 = -87;
            }
            else
            {
              v27 = -55;
            }
          }
          else
          {
            v27 = -48;
          }
          v28 = v25 * a3;
          if ((unsigned __int128)(v25 * (__int128)a3) >> 64 != (v25 * a3) >> 63)
            return 0;
          v25 = v28 + (v26 + v27);
          if (__OFADD__(v28, (v26 + v27)))
            return 0;
          ++result;
          --v3;
        }
        while (v3);
        return (unsigned __int8 *)(v28 + (v26 + v27));
      }
      return 0;
    }
    return 0;
  }
  if (a2 < 1)
  {
LABEL_65:
    __break(1u);
    return result;
  }
  v14 = a2 - 1;
  if (a2 == 1)
    return 0;
  v15 = a3 + 48;
  v16 = a3 + 55;
  v17 = a3 + 87;
  if (a3 > 10)
  {
    v15 = 58;
  }
  else
  {
    v17 = 97;
    v16 = 65;
  }
  if (!result)
    return 0;
  v9 = 0;
  v18 = result + 1;
  do
  {
    v19 = *v18;
    if (v19 < 0x30 || v19 >= v15)
    {
      if (v19 < 0x41 || v19 >= v16)
      {
        if (v19 < 0x61 || v19 >= v17)
          return 0;
        v20 = -87;
      }
      else
      {
        v20 = -55;
      }
    }
    else
    {
      v20 = -48;
    }
    v21 = v9 * a3;
    if ((unsigned __int128)(v9 * (__int128)a3) >> 64 != (v9 * a3) >> 63)
      return 0;
    v9 = v21 + (v19 + v20);
    if (__OFADD__(v21, (v19 + v20)))
      return 0;
    ++v18;
    --v14;
  }
  while (v14);
  return (unsigned __int8 *)v9;
}

uint64_t sub_1CAEF54B4()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;

  v0 = sub_1CAF20520();
  v4 = sub_1CAEF5530(v0, v1, v2, v3);
  swift_bridgeObjectRelease();
  return v4;
}

uint64_t sub_1CAEF5530(unint64_t a1, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  _QWORD v14[3];

  if ((a4 & 0x1000000000000000) != 0)
  {
    v9 = sub_1CAEF5674(a1, a2, a3, a4);
    if (v9)
    {
      v10 = v9;
      v11 = sub_1CAEF49A8(v9, 0);
      v12 = sub_1CAEF5760((unint64_t)v14, (uint64_t)(v11 + 4), v10, a1, a2, a3, a4);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      if (v12 != v10)
      {
        __break(1u);
        goto LABEL_9;
      }
    }
    else
    {
      v11 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    }
    v13 = MEMORY[0x1D1799708](v11 + 4, v11[2]);
    swift_release();
    return v13;
  }
  else
  {
    if ((a4 & 0x2000000000000000) == 0)
    {
      if ((a3 & 0x1000000000000000) != 0)
LABEL_12:
        JUMPOUT(0x1D1799708);
LABEL_9:
      sub_1CAF2082C();
      goto LABEL_12;
    }
    v14[0] = a3;
    v14[1] = a4 & 0xFFFFFFFFFFFFFFLL;
    return MEMORY[0x1D1799708]((char *)v14 + (a1 >> 16), (a2 >> 16) - (a1 >> 16));
  }
}

unint64_t sub_1CAEF5674(unint64_t result, unint64_t a2, unint64_t a3, unint64_t a4)
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v7 = result;
  v8 = (a3 >> 59) & 1;
  if ((a4 & 0x1000000000000000) == 0)
    LOBYTE(v8) = 1;
  v9 = 4 << v8;
  if ((result & 0xC) == 4 << v8)
  {
    result = sub_1CAEF4A0C(result, a3, a4);
    v7 = result;
  }
  if ((a2 & 0xC) == v9)
  {
    result = sub_1CAEF4A0C(a2, a3, a4);
    a2 = result;
    if ((a4 & 0x1000000000000000) == 0)
      return (a2 >> 16) - (v7 >> 16);
  }
  else if ((a4 & 0x1000000000000000) == 0)
  {
    return (a2 >> 16) - (v7 >> 16);
  }
  v10 = HIBYTE(a4) & 0xF;
  if ((a4 & 0x2000000000000000) == 0)
    v10 = a3 & 0xFFFFFFFFFFFFLL;
  if (v10 < v7 >> 16)
  {
    __break(1u);
  }
  else if (v10 >= a2 >> 16)
  {
    return sub_1CAF204E4();
  }
  __break(1u);
  return result;
}

unint64_t sub_1CAEF5760(unint64_t result, uint64_t a2, uint64_t a3, unint64_t a4, unint64_t a5, unint64_t a6, unint64_t a7)
{
  _QWORD *v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v26;
  unint64_t v27;
  _QWORD v28[2];

  v9 = (_QWORD *)result;
  if (!a2)
    goto LABEL_5;
  if (!a3)
  {
    v12 = a4;
    v11 = 0;
    goto LABEL_33;
  }
  if (a3 < 0)
    goto LABEL_36;
  v10 = a5 >> 14;
  v27 = a4 >> 14;
  if (a4 >> 14 == a5 >> 14)
  {
LABEL_5:
    v11 = 0;
    v12 = a4;
LABEL_33:
    *v9 = a4;
    v9[1] = a5;
    v9[2] = a6;
    v9[3] = a7;
    v9[4] = v12;
    return v11;
  }
  v11 = 0;
  v14 = (a6 >> 59) & 1;
  if ((a7 & 0x1000000000000000) == 0)
    LOBYTE(v14) = 1;
  v15 = 4 << v14;
  v21 = (a7 & 0xFFFFFFFFFFFFFFFLL) + 32;
  v22 = a7 & 0xFFFFFFFFFFFFFFLL;
  v16 = HIBYTE(a7) & 0xF;
  if ((a7 & 0x2000000000000000) == 0)
    v16 = a6 & 0xFFFFFFFFFFFFLL;
  v23 = v16;
  v26 = a3 - 1;
  v12 = a4;
  while (1)
  {
    v17 = v12 & 0xC;
    result = v12;
    if (v17 == v15)
      result = sub_1CAEF4A0C(v12, a6, a7);
    if (result >> 14 < v27 || result >> 14 >= v10)
      break;
    if ((a7 & 0x1000000000000000) != 0)
    {
      result = sub_1CAF204F0();
      v19 = result;
      if (v17 != v15)
        goto LABEL_23;
    }
    else
    {
      v18 = result >> 16;
      if ((a7 & 0x2000000000000000) != 0)
      {
        v28[0] = a6;
        v28[1] = v22;
        v19 = *((_BYTE *)v28 + v18);
        if (v17 != v15)
          goto LABEL_23;
      }
      else
      {
        result = v21;
        if ((a6 & 0x1000000000000000) == 0)
          result = sub_1CAF2082C();
        v19 = *(_BYTE *)(result + v18);
        if (v17 != v15)
        {
LABEL_23:
          if ((a7 & 0x1000000000000000) == 0)
            goto LABEL_24;
          goto LABEL_27;
        }
      }
    }
    result = sub_1CAEF4A0C(v12, a6, a7);
    v12 = result;
    if ((a7 & 0x1000000000000000) == 0)
    {
LABEL_24:
      v12 = (v12 & 0xFFFFFFFFFFFF0000) + 65540;
      goto LABEL_29;
    }
LABEL_27:
    if (v23 <= v12 >> 16)
      goto LABEL_35;
    v12 = sub_1CAF204CC();
LABEL_29:
    *(_BYTE *)(a2 + v11) = v19;
    if (v26 == v11)
    {
      v11 = a3;
      goto LABEL_33;
    }
    ++v11;
    if (v10 == v12 >> 14)
      goto LABEL_33;
  }
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1CAEF5970()
{
  uint64_t v0;
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
  v1 = sub_1CAF20610();
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 24) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1CAEF59F0(int a1, void *a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
  sub_1CAF20610();
  return sub_1CAEF4588(a1, a2, a3);
}

uint64_t block_copy_helper_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_2()
{
  return swift_release();
}

uint64_t sub_1CAEF5A88()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991468);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1CAEF5AEC(int a1, void *a2, void *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991468);
  return sub_1CAEF44D4(a1, a2, a3);
}

id FamilyCircleInvitationStatus.family.getter()
{
  id *v0;

  return *v0;
}

uint64_t FamilyCircleInvitationStatus.receivedInvitesPending.getter()
{
  id *v0;
  id v1;
  id v2;
  unint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v3 = sub_1CAF205B0();

  v4 = v1;
  v5 = sub_1CAEEFE98(v3, v4);
  swift_bridgeObjectRelease();

  if (v5 >> 62)
    v6 = sub_1CAF208C8();
  else
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  return v6;
}

id FamilyCircleInvitationStatus.sentInvitesPending.getter()
{
  id *v0;
  id result;
  void *v2;
  unint64_t v3;
  uint64_t v4;

  result = objc_msgSend(*v0, sel_pendingMembers);
  if (result)
  {
    v2 = result;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v3 = sub_1CAF205B0();

    if (v3 >> 62)
    {
      swift_bridgeObjectRetain();
      v4 = sub_1CAF208C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    return (id)v4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id FAFamilyCircle.pendingMemberList()()
{
  void *v0;
  id result;
  void *v2;
  uint64_t v3;

  result = objc_msgSend(v0, sel_pendingMembers);
  if (result)
  {
    v2 = result;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v3 = sub_1CAF205B0();

    return (id)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t FamilyCircleInvitationStatus.familyMembersNotMe.getter()
{
  unint64_t v0;
  uint64_t v1;

  FAFamilyCircle.membersNotMe()();
  if (v0 >> 62)
    v1 = sub_1CAF208C8();
  else
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  return v1;
}

id FamilyCircleInvitationStatus.description.getter()
{
  void **v0;
  void *v1;
  id v2;
  id v3;
  unint64_t v4;
  id v5;
  unint64_t v6;
  uint64_t v7;
  id v8;
  id result;
  void *v10;
  unint64_t v11;
  id v12;
  unint64_t v13;

  v1 = *v0;
  sub_1CAF207FC();
  swift_bridgeObjectRelease();
  v2 = v1;
  v3 = objc_msgSend(v2, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v4 = sub_1CAF205B0();

  v5 = v2;
  v6 = sub_1CAEEFE98(v4, v5);
  swift_bridgeObjectRelease();

  if (v6 >> 62)
    v7 = sub_1CAF208C8();
  else
    v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();

  sub_1CAF2097C();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  sub_1CAF204A8();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  sub_1CAF207FC();
  swift_bridgeObjectRelease();
  v8 = v5;
  result = objc_msgSend(v8, sel_pendingMembers, v7);
  if (result)
  {
    v10 = result;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v11 = sub_1CAF205B0();

    if (v11 >> 62)
    {
      swift_bridgeObjectRetain();
      sub_1CAF208C8();

      swift_bridgeObjectRelease();
    }
    else
    {

    }
    swift_bridgeObjectRelease();
    sub_1CAF2097C();
    sub_1CAF204A8();
    swift_bridgeObjectRelease();
    sub_1CAF204A8();
    swift_bridgeObjectRetain();
    sub_1CAF204A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    sub_1CAF207FC();
    swift_bridgeObjectRelease();
    v12 = v8;
    FAFamilyCircle.membersNotMe()();
    if (v13 >> 62)
      sub_1CAF208C8();

    swift_bridgeObjectRelease();
    sub_1CAF2097C();
    sub_1CAF204A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    sub_1CAF204A8();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return (id)0xD00000000000001DLL;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id FamilyCircleInvitationStatus.invitesSent.getter()
{
  id *v0;
  id v1;
  id result;
  void *v3;
  unint64_t v4;
  uint64_t v5;

  v1 = *v0;
  result = objc_msgSend(v1, sel_pendingMembers);
  if (result)
  {
    v3 = result;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v4 = sub_1CAF205B0();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v5 = sub_1CAF208C8();

      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);

    }
    swift_bridgeObjectRelease();
    return (id)(v5 != 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL FamilyCircleInvitationStatus.invitesReceived.getter()
{
  id *v0;
  id v1;
  id v2;
  unint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;

  v1 = *v0;
  v2 = objc_msgSend(v1, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v3 = sub_1CAF205B0();

  v4 = v1;
  v5 = sub_1CAEEFE98(v3, v4);
  swift_bridgeObjectRelease();

  if (v5 >> 62)
    v6 = sub_1CAF208C8();
  else
    v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);

  swift_bridgeObjectRelease();
  return v6 != 0;
}

uint64_t FamilyCircleInvitationStatus.anyPendingInvite.getter()
{
  id *v0;
  id v1;
  uint64_t result;
  void *v3;
  unint64_t v4;
  uint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  id v9;
  unint64_t v10;
  uint64_t v11;

  v1 = *v0;
  result = (uint64_t)objc_msgSend(v1, sel_pendingMembers);
  if (result)
  {
    v3 = (void *)result;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v4 = sub_1CAF205B0();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v5 = sub_1CAF208C8();

      swift_bridgeObjectRelease();
    }
    else
    {
      v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);

    }
    swift_bridgeObjectRelease();
    if (v5)
    {
      return 1;
    }
    else
    {
      v6 = v1;
      v7 = objc_msgSend(v6, sel_pendingInvitesOnly);
      sub_1CAEEBF3C(0, &qword_1ECFCE918);
      v8 = sub_1CAF205B0();

      v9 = v6;
      v10 = sub_1CAEEFE98(v8, v9);
      swift_bridgeObjectRelease();

      if (v10 >> 62)
        v11 = sub_1CAF208C8();
      else
        v11 = *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);

      swift_bridgeObjectRelease();
      return v11 != 0;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL FamilyCircleInvitationStatus.showFamilyIcon.getter()
{
  unint64_t v0;
  uint64_t v1;

  v0 = FamilyCircleInvitationStatus.membersForMarquee.getter();
  if (v0 >> 62)
    v1 = sub_1CAF208C8();
  else
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  return v1 == 0;
}

uint64_t FamilyCircleInvitationStatus.membersForMarquee.getter()
{
  void **v0;
  void *v1;
  id v2;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  id v6;
  void *v7;
  unsigned int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  id v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint8_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t result;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  id v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint8_t *v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  unint64_t v55;
  _OWORD v56[2];
  uint64_t v57;
  uint64_t v58;

  v1 = *v0;
  LOBYTE(v56[0]) = 8;
  if ((_s12FamilyCircle0A12FeatureFlagsO7enabledySbACFZ_0((unsigned __int8 *)v56) & 1) == 0)
  {
LABEL_30:
    v27 = objc_msgSend(v1, sel_members);
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v28 = sub_1CAF205B0();

    if (v28 >> 62)
    {
      swift_bridgeObjectRetain();
      v29 = sub_1CAF208C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v29 = *(_QWORD *)((v28 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v29 < 3)
    {
      v32 = objc_msgSend(v1, sel_members);
      v31 = sub_1CAF205B0();

    }
    else
    {
      FAFamilyCircle.membersNotMe()();
      v31 = v30;
    }
    if (qword_1EF9904E0 != -1)
      swift_once();
    v33 = sub_1CAF202E0();
    __swift_project_value_buffer(v33, (uint64_t)qword_1EF9904C0);
    v34 = sub_1CAF202C8();
    v35 = sub_1CAF206B8();
    if (os_log_type_enabled(v34, v35))
    {
      v36 = (uint8_t *)swift_slowAlloc();
      v37 = swift_slowAlloc();
      *(_QWORD *)&v56[0] = v37;
      *(_DWORD *)v36 = 136315138;
      v58 = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2B2B0, (uint64_t *)v56);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v34, v35, "%s people for row", v36, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v37, -1, -1);
      MEMORY[0x1D179A698](v36, -1, -1);
    }

    if (v31 < 0 || (v31 & 0x4000000000000000) != 0)
    {
      v51 = swift_bridgeObjectRetain();
      v38 = (uint64_t)sub_1CAEEEE48(v51);
      swift_bridgeObjectRelease();
    }
    else
    {
      v38 = v31 & 0xFFFFFFFFFFFFFF8;
      swift_bridgeObjectRetain();
    }
    *(_QWORD *)&v56[0] = v38;
    sub_1CAEF9D48((uint64_t *)v56);
    goto LABEL_43;
  }
  v2 = objc_msgSend(v1, sel_pendingMembers);
  if (!v2)
  {
    __break(1u);
    goto LABEL_69;
  }
  v3 = v2;
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v4 = sub_1CAF205B0();

  v5 = FAFamilyCircle.getMembersWhoInvitedMe()();
  v6 = objc_msgSend(v1, "me");
  if (!v6 || (v7 = v6, v8 = objc_msgSend(v6, sel_isOrganizer), v7, !v8))
  {
LABEL_19:
    swift_bridgeObjectRelease();
    v16 = objc_msgSend(v1, "me");

    if (v16)
    {
LABEL_20:
      swift_bridgeObjectRelease();
      v17 = objc_msgSend(v1, "me");
      if (v17)
      {
        v18 = v17;
        v19 = objc_msgSend(v17, sel_isOrganizer);

        if (v19)
        {
          FAFamilyCircle.membersNotMe()();
          v21 = v20 >> 62 ? sub_1CAF208C8() : *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);
          swift_bridgeObjectRelease();
          if (!v21)
          {
            if (qword_1EF9904E0 != -1)
              swift_once();
            v46 = sub_1CAF202E0();
            __swift_project_value_buffer(v46, (uint64_t)qword_1EF9904C0);
            v47 = sub_1CAF202C8();
            v48 = sub_1CAF206B8();
            if (os_log_type_enabled(v47, v48))
            {
              v49 = (uint8_t *)swift_slowAlloc();
              v50 = swift_slowAlloc();
              *(_QWORD *)&v56[0] = v50;
              *(_DWORD *)v49 = 136315138;
              v58 = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2B2B0, (uint64_t *)v56);
              sub_1CAF2076C();
              _os_log_impl(&dword_1CAEBA000, v47, v48, "%s only organizer in this family", v49, 0xCu);
              swift_arrayDestroy();
              MEMORY[0x1D179A698](v50, -1, -1);
              MEMORY[0x1D179A698](v49, -1, -1);
            }

            return MEMORY[0x1E0DEE9D8];
          }
        }
      }
      if (qword_1EF9904E0 != -1)
        swift_once();
      v22 = sub_1CAF202E0();
      __swift_project_value_buffer(v22, (uint64_t)qword_1EF9904C0);
      v23 = sub_1CAF202C8();
      v24 = sub_1CAF206B8();
      if (os_log_type_enabled(v23, v24))
      {
        v25 = (uint8_t *)swift_slowAlloc();
        v26 = swift_slowAlloc();
        *(_QWORD *)&v56[0] = v26;
        *(_DWORD *)v25 = 136315138;
        v58 = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2B2B0, (uint64_t *)v56);
        sub_1CAF2076C();
        _os_log_impl(&dword_1CAEBA000, v23, v24, "%s fallthru computing membersForMarquee", v25, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v26, -1, -1);
        MEMORY[0x1D179A698](v25, -1, -1);
      }

      goto LABEL_30;
    }
    if (v5 >> 62)
    {
      swift_bridgeObjectRetain();
      v52 = sub_1CAF208C8();
      swift_bridgeObjectRelease();
      if (!v52)
        goto LABEL_20;
      swift_bridgeObjectRetain();
      v53 = sub_1CAF208C8();
      swift_bridgeObjectRelease();
      if (v53 == 1)
      {
        v54 = swift_bridgeObjectRetain();
        v41 = (uint64_t)sub_1CAEEEE48(v54);
        swift_bridgeObjectRelease();
        goto LABEL_50;
      }
      v55 = swift_bridgeObjectRetain();
      v41 = (uint64_t)sub_1CAEEEE48(v55);
      swift_bridgeObjectRelease();
    }
    else
    {
      v41 = v5 & 0xFFFFFFFFFFFFFF8;
      v42 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFFF8) + 0x10);
      if (!v42)
        goto LABEL_20;
      if (v42 == 1)
      {
        swift_bridgeObjectRetain();
LABEL_50:
        *(_QWORD *)&v56[0] = v41;
        sub_1CAEF9D48((uint64_t *)v56);
        swift_bridgeObjectRelease();
        v43 = *(_QWORD *)&v56[0];
        v57 = 0;
        memset(v56, 0, sizeof(v56));
        v44 = _sSo14FAFamilyMemberC12FamilyCircleE6makeMeyAbC23ACAccountProviderShadow_pSgFZ_0((uint64_t)v56);
        sub_1CAEF5168((uint64_t)v56, &qword_1EF991470);
        *(_QWORD *)&v56[0] = v43;
        swift_retain();
        v45 = v44;
        MEMORY[0x1D179981C]();
        if (*(_QWORD *)((*(_QWORD *)&v56[0] & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((*(_QWORD *)&v56[0] & 0xFFFFFFFFFFFFFF8)
                                                                                         + 0x18) >> 1)
          sub_1CAF205C8();
        sub_1CAF205E0();
        sub_1CAF205BC();
        v39 = *(_QWORD *)&v56[0];
        swift_release();

        return v39;
      }
      swift_bridgeObjectRetain();
    }
    *(_QWORD *)&v56[0] = v41;
    sub_1CAEF9D48((uint64_t *)v56);
LABEL_43:
    swift_bridgeObjectRelease();
    return *(_QWORD *)&v56[0];
  }
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v15 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
    if (v15)
      goto LABEL_7;
    goto LABEL_19;
  }
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_19;
LABEL_7:
  swift_bridgeObjectRelease();
  FAFamilyCircle.membersNotMe()();
  if (v9 >> 62)
    v10 = sub_1CAF208C8();
  else
    v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (v10)
    goto LABEL_16;
  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v11 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v11 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  if (v11 != 1)
  {
LABEL_16:
    FAFamilyCircle.membersNotMe()();
    *(_QWORD *)&v56[0] = v14;
    goto LABEL_17;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991378);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1CAF25C40;
  v13 = objc_msgSend(v1, "me");
  if (v13)
  {
    *(_QWORD *)(v12 + 32) = v13;
    *(_QWORD *)&v56[0] = v12;
    sub_1CAF205BC();
LABEL_17:
    sub_1CAEFAD40(v4);
    return *(_QWORD *)&v56[0];
  }
LABEL_69:
  __break(1u);
  result = swift_release();
  __break(1u);
  return result;
}

uint64_t FamilyCircleInvitationStatus.hideFamilyRow.getter()
{
  id *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;

  v1 = objc_msgSend(*v0, sel_members);
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v2 = sub_1CAF205B0();

  if (v2 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v3)
    v4 = 0;
  else
    v4 = FamilyCircleInvitationStatus.anyPendingInvite.getter() ^ 1;
  if (qword_1EF9904E0 != -1)
    swift_once();
  v5 = sub_1CAF202E0();
  __swift_project_value_buffer(v5, (uint64_t)qword_1EF9904C0);
  v6 = sub_1CAF202C8();
  v7 = sub_1CAF206B8();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v6, v7, "should hide family row %{BOOL}d", v8, 8u);
    MEMORY[0x1D179A698](v8, -1, -1);
  }

  return v4 & 1;
}

id FamilyCircleInvitationStatus.peopleWhoInvitedMe.getter()
{
  id *v0;
  id v1;
  id v2;
  unint64_t v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  id result;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v1 = *v0;
  v2 = objc_msgSend(*v0, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v3 = sub_1CAF205B0();

  v4 = v1;
  v5 = sub_1CAEEFE98(v3, v4);
  swift_bridgeObjectRelease();

  if (v5 >> 62)
    goto LABEL_15;
  v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v6)
  {
    while (1)
    {
      v19 = MEMORY[0x1E0DEE9D8];
      result = (id)sub_1CAEF9A58(0, v6 & ~(v6 >> 63), 0);
      if (v6 < 0)
        break;
      v8 = 0;
      v9 = v19;
      while (v6 != v8)
      {
        if ((v5 & 0xC000000000000001) != 0)
          v10 = (id)MEMORY[0x1D1799A98](v8, v5);
        else
          v10 = *(id *)(v5 + 8 * v8 + 32);
        v11 = v10;
        result = objc_msgSend(v10, sel_organizerFirstName, v19);
        if (!result)
          goto LABEL_19;
        v12 = result;
        v13 = sub_1CAF20400();
        v15 = v14;

        v19 = v9;
        v17 = *(_QWORD *)(v9 + 16);
        v16 = *(_QWORD *)(v9 + 24);
        if (v17 >= v16 >> 1)
          sub_1CAEF9A58(v16 > 1, v17 + 1, 1);
        ++v8;
        *(_QWORD *)(v9 + 16) = v17 + 1;
        v18 = v9 + 16 * v17;
        *(_QWORD *)(v18 + 32) = v13;
        *(_QWORD *)(v18 + 40) = v15;
        if (v6 == v8)
        {
          swift_bridgeObjectRelease();
          return (id)v9;
        }
      }
      __break(1u);
LABEL_15:
      v6 = sub_1CAF208C8();
      if (!v6)
        goto LABEL_16;
    }
    __break(1u);
LABEL_19:
    __break(1u);
  }
  else
  {
LABEL_16:
    swift_bridgeObjectRelease();
    return (id)MEMORY[0x1E0DEE9D8];
  }
  return result;
}

id FamilyCircleInvitationStatus.showPendingTitle.getter()
{
  void **v0;
  void *v1;
  unint64_t v2;
  uint64_t v3;
  id result;
  void *v5;
  unint64_t v6;
  uint64_t v7;

  v1 = *v0;
  FAFamilyCircle.membersNotMe()();
  if (v2 >> 62)
    v3 = sub_1CAF208C8();
  else
    v3 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (v3)
    return 0;
  result = objc_msgSend(v1, sel_pendingMembers);
  if (result)
  {
    v5 = result;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v6 = sub_1CAF205B0();

    if (v6 >> 62)
    {
      swift_bridgeObjectRetain();
      v7 = sub_1CAF208C8();
      swift_bridgeObjectRelease();
    }
    else
    {
      v7 = *(_QWORD *)((v6 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    return (id)(v7 != 0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

id FamilyCircleInvitationStatus.peopleInvitedByMe.getter()
{
  id *v0;
  id result;
  void *v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;

  result = objc_msgSend(*v0, sel_pendingMembers);
  if (!result)
    goto LABEL_20;
  v2 = result;
  sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
  v3 = sub_1CAF205B0();

  if (v3 >> 62)
  {
    swift_bridgeObjectRetain();
    v4 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
    if (v4)
      goto LABEL_4;
LABEL_17:
    swift_bridgeObjectRelease();
    return (id)MEMORY[0x1E0DEE9D8];
  }
  v4 = *(_QWORD *)((v3 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    goto LABEL_17;
LABEL_4:
  v17 = MEMORY[0x1E0DEE9D8];
  result = (id)sub_1CAEF9A58(0, v4 & ~(v4 >> 63), 0);
  if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = 0;
    v6 = v17;
    do
    {
      if ((v3 & 0xC000000000000001) != 0)
        v7 = (id)MEMORY[0x1D1799A98](v5, v3);
      else
        v7 = *(id *)(v3 + 8 * v5 + 32);
      v8 = v7;
      v9 = objc_msgSend(v7, sel_shortName);
      if (v9)
      {
        v10 = v9;
        v11 = sub_1CAF20400();
        v13 = v12;

      }
      else
      {

        v11 = 0;
        v13 = 0xE000000000000000;
      }
      v15 = *(_QWORD *)(v17 + 16);
      v14 = *(_QWORD *)(v17 + 24);
      if (v15 >= v14 >> 1)
        sub_1CAEF9A58(v14 > 1, v15 + 1, 1);
      ++v5;
      *(_QWORD *)(v17 + 16) = v15 + 1;
      v16 = v17 + 16 * v15;
      *(_QWORD *)(v16 + 32) = v11;
      *(_QWORD *)(v16 + 40) = v13;
    }
    while (v4 != v5);
    swift_bridgeObjectRelease();
    return (id)v6;
  }
  __break(1u);
LABEL_20:
  __break(1u);
  return result;
}

uint64_t FAFamilyCircle.getMembersWhoInvitedMe()()
{
  void *v0;
  id v1;
  unint64_t v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t result;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v1 = objc_msgSend(v0, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v2 = sub_1CAF205B0();

  v3 = v0;
  v4 = sub_1CAEEFE98(v2, v3);
  swift_bridgeObjectRelease();

  if (v4 >> 62)
    goto LABEL_12;
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v5)
  {
    while (1)
    {
      v13 = MEMORY[0x1E0DEE9D8];
      sub_1CAF20850();
      if (v5 < 0)
        break;
      v6 = 0;
      while (v5 != v6)
      {
        if ((v4 & 0xC000000000000001) != 0)
          v7 = (id)MEMORY[0x1D1799A98](v6, v4);
        else
          v7 = *(id *)(v4 + 8 * v6 + 32);
        v8 = v7;
        v11 = v7;
        sub_1CAEF9514(&v11, &v12);

        ++v6;
        sub_1CAF20838();
        sub_1CAF2085C();
        sub_1CAF20868();
        sub_1CAF20844();
        if (v5 == v6)
        {
          v9 = v13;
          swift_bridgeObjectRelease();
          return v9;
        }
      }
      __break(1u);
LABEL_12:
      swift_bridgeObjectRetain();
      v5 = sub_1CAF208C8();
      swift_bridgeObjectRelease();
      if (!v5)
        goto LABEL_13;
    }
    __break(1u);
    result = swift_release();
    __break(1u);
  }
  else
  {
LABEL_13:
    swift_bridgeObjectRelease();
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

id FamilyCircleInvitationStatus.badgeCountOrganizerWithStaleInvites.getter()
{
  id *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  void (*v15)(char *, uint64_t);
  uint64_t v16;
  id result;
  id v18;
  void *v19;
  unint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1CAF20178();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v22 - v9;
  v11 = *v0;
  v12 = objc_msgSend(*v0, "me");
  if (!v12)
    return 0;
  v13 = v12;
  v14 = objc_msgSend(v12, sel_isOrganizer);

  if (!v14)
    return 0;
  sub_1CAF2016C();
  FAFamilyCircle.oldestSentInviteSignalDate()((uint64_t)v3);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v10, v4);
    sub_1CAEF5168((uint64_t)v3, &qword_1EF98FDB8);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v8, v3, v4);
  sub_1CAEFB114(&qword_1EF991478, MEMORY[0x1E0CB08B0]);
  if ((sub_1CAF203C4() & 1) != 0)
  {
    v15 = *(void (**)(char *, uint64_t))(v5 + 8);
    v15(v8, v4);
    v15(v10, v4);
    return 0;
  }
  v18 = v11;
  result = objc_msgSend(v18, sel_pendingMembers);
  if (result)
  {
    v19 = result;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v20 = sub_1CAF205B0();

    if (v20 >> 62)
    {
      swift_bridgeObjectRetain();
      v16 = sub_1CAF208C8();

      swift_bridgeObjectRelease();
    }
    else
    {
      v16 = *(_QWORD *)((v20 & 0xFFFFFFFFFFFFF8) + 0x10);

    }
    swift_bridgeObjectRelease();
    v21 = *(void (**)(char *, uint64_t))(v5 + 8);
    v21(v8, v4);
    v21(v10, v4);
    return (id)v16;
  }
  __break(1u);
  return result;
}

void FAFamilyCircle.oldestSentInviteSignalDate()(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  void *v24;
  uint64_t v25;
  int v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];
  void *v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)v36 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1CAF20178();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v36 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)v36 - v11;
  v43 = 0;
  if (!objc_msgSend(v1, sel_shouldBadgeOrganizer))
  {
    if (qword_1EF98FBD8[0] != -1)
      swift_once();
    v20 = sub_1CAF202E0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1EF98FD68);
    v21 = sub_1CAF202C8();
    v22 = sub_1CAF206A0();
    if (!os_log_type_enabled(v21, v22))
    {

      goto LABEL_30;
    }
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = (void *)swift_slowAlloc();
    v42 = v24;
    *(_DWORD *)v23 = 136315138;
    v41 = sub_1CAEDBE5C(0xD00000000000001CLL, 0x80000001CAF2B2D0, (uint64_t *)&v42);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v21, v22, "%s shouldBadgeOrganizer is disabled", v23, 0xCu);
    v25 = 1;
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v24, -1, -1);
    MEMORY[0x1D179A698](v23, -1, -1);

    goto LABEL_31;
  }
  v13 = objc_msgSend(v1, sel_pendingMembers);
  if (v13)
  {
    v14 = v13;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v15 = sub_1CAF205B0();

    if ((unint64_t)v15 >> 62)
    {
      if (v15 < 0)
        v14 = (void *)v15;
      else
        v14 = (void *)(v15 & 0xFFFFFFFFFFFFFF8);
      swift_bridgeObjectRetain();
      v16 = sub_1CAF208C8();
      if (v16)
        goto LABEL_5;
    }
    else
    {
      v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRetain();
      if (v16)
      {
LABEL_5:
        if (v16 < 1)
        {
          __break(1u);
          goto LABEL_33;
        }
        v39 = v12;
        v40 = a1;
        v17 = 0;
        do
        {
          if ((v15 & 0xC000000000000001) != 0)
            v18 = (id)MEMORY[0x1D1799A98](v17, v15);
          else
            v18 = *(id *)(v15 + 8 * v17 + 32);
          v19 = v18;
          ++v17;
          v42 = v18;
          sub_1CAEF8FF0(&v42, &v43);

        }
        while (v16 != v17);
        swift_bridgeObjectRelease_n();
        if (v43)
        {
          v14 = v43;
          FAFamilyMember.clientSignalDateForInvite()((uint64_t)v5);
          v26 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
          a1 = v40;
          if (v26 == 1)
          {

            sub_1CAEF5168((uint64_t)v5, &qword_1EF98FDB8);
LABEL_30:
            v25 = 1;
            goto LABEL_31;
          }
          v16 = *(_QWORD *)(v7 + 32);
          v12 = v39;
          ((void (*)(char *, char *, uint64_t))v16)(v39, v5, v6);
          if (qword_1ECFCE888 == -1)
          {
LABEL_21:
            v27 = sub_1CAF202E0();
            __swift_project_value_buffer(v27, (uint64_t)qword_1ECFCE8A8);
            (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v12, v6);
            v28 = sub_1CAF202C8();
            v29 = sub_1CAF206A0();
            if (os_log_type_enabled(v28, v29))
            {
              v30 = swift_slowAlloc();
              v38 = v16;
              v31 = v30;
              v37 = (void *)swift_slowAlloc();
              v42 = v37;
              *(_DWORD *)v31 = 136315394;
              v41 = sub_1CAEDBE5C(0xD00000000000001CLL, 0x80000001CAF2B2D0, (uint64_t *)&v42);
              sub_1CAF2076C();
              *(_WORD *)(v31 + 12) = 2080;
              v36[1] = v31 + 14;
              sub_1CAEFB114((unint64_t *)&qword_1EF990400, MEMORY[0x1E0CB08F0]);
              v32 = sub_1CAF2097C();
              v41 = sub_1CAEDBE5C(v32, v33, (uint64_t *)&v42);
              a1 = v40;
              sub_1CAF2076C();
              swift_bridgeObjectRelease();
              (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
              _os_log_impl(&dword_1CAEBA000, v28, v29, "%s oldestPending badge time %s", (uint8_t *)v31, 0x16u);
              v34 = v37;
              swift_arrayDestroy();
              MEMORY[0x1D179A698](v34, -1, -1);
              v35 = v31;
              v16 = v38;
              MEMORY[0x1D179A698](v35, -1, -1);

            }
            else
            {

              (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
            }
            ((void (*)(uint64_t, char *, uint64_t))v16)(a1, v12, v6);
            v25 = 0;
            goto LABEL_31;
          }
LABEL_33:
          swift_once();
          goto LABEL_21;
        }
        v25 = 1;
        a1 = v40;
LABEL_31:
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(a1, v25, 1, v6);

        return;
      }
    }
    swift_bridgeObjectRelease_n();
    goto LABEL_30;
  }
  __break(1u);
}

uint64_t FamilyCircleInvitationStatus.badgeCountWithStaleInvitations.getter()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  _BYTE *v10;
  void *v11;
  void (*v12)(_BYTE *, uint64_t);
  uint64_t v13;
  id v14;
  id v15;
  unint64_t v16;
  id v17;
  unint64_t v18;
  void (*v19)(_BYTE *, uint64_t);
  _BYTE v21[16];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v1);
  v3 = &v21[-((v2 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v4 = sub_1CAF20178();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = &v21[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v6);
  v10 = &v21[-v9];
  v11 = *v0;
  sub_1CAF2016C();
  FAFamilyCircle.oldestReceivedInviteSignalDate()((uint64_t)v3);
  if ((*(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v10, v4);
    sub_1CAEF5168((uint64_t)v3, &qword_1EF98FDB8);
    return 0;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v5 + 32))(v8, v3, v4);
  sub_1CAEFB114(&qword_1EF991478, MEMORY[0x1E0CB08B0]);
  if ((sub_1CAF203C4() & 1) != 0)
  {
    v12 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
    v12(v8, v4);
    v12(v10, v4);
    return 0;
  }
  v14 = v11;
  v15 = objc_msgSend(v14, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v16 = sub_1CAF205B0();

  v17 = v14;
  v18 = sub_1CAEEFE98(v16, v17);
  swift_bridgeObjectRelease();

  if (v18 >> 62)
    v13 = sub_1CAF208C8();
  else
    v13 = *(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10);

  swift_bridgeObjectRelease();
  v19 = *(void (**)(_BYTE *, uint64_t))(v5 + 8);
  v19(v8, v4);
  v19(v10, v4);
  return v13;
}

void FAFamilyCircle.oldestReceivedInviteSignalDate()(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  unint64_t v44;
  id v45;
  unint64_t v46;
  uint64_t v47;
  char *v48;
  void (*v49)(char *, uint64_t, uint64_t);
  unint64_t v50;
  void (*v51)(char *, uint64_t, uint64_t);
  void (*v52)(char *, uint64_t, uint64_t);
  id v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  id v59;
  void *v60;
  char *v61;
  void (*v62)(char *, char *, uint64_t);
  uint64_t v63;
  char *v64;
  char *v65;
  id v66;
  void *v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  char *v72;
  unsigned int (*v73)(uint64_t, uint64_t, uint64_t);
  void (*v74)(char *, uint64_t, uint64_t);
  id v75;
  void *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  id v81;
  void *v82;
  char *v83;
  uint64_t v84;
  id v85;
  void *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  char *v91;
  char v92;
  void (*v93)(char *, uint64_t);
  uint64_t v94;
  uint64_t v95;
  NSObject *v96;
  os_log_type_t v97;
  uint8_t *v98;
  uint64_t v99;
  void (*v100)(char *, uint64_t, uint64_t);
  char *v101;
  uint64_t v102;
  uint64_t v103;
  void (*v104)(char *, uint64_t, uint64_t);
  void (**v105)(char *, uint64_t);
  char *v106;
  uint64_t v107;
  NSObject *v108;
  uint64_t v109;
  os_log_type_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  unint64_t v114;
  void (*v115)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  char *v120;
  char *v121;
  uint64_t v122;
  char *v123;
  char *v124;
  char *v125;
  char *v126;
  char *v127;
  char *v128;
  char *v129;
  void (*v130)(char *, uint64_t, uint64_t);
  uint64_t v131;
  char *v132;
  char *v133;
  char *v134;
  uint64_t v135;
  char *v136;
  char *v137;
  unint64_t v138;
  unint64_t v139;
  void (*v140)(char *, uint64_t, uint64_t);
  uint64_t v141;
  void (*v142)(uint64_t, uint64_t, uint64_t, uint64_t);
  void (*v143)(char *, uint64_t, uint64_t);
  uint64_t v144;
  uint64_t v145[2];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v122 = (uint64_t)&v118 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v118 - v8;
  v10 = MEMORY[0x1E0C80A78](v7);
  v125 = (char *)&v118 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v135 = (uint64_t)&v118 - v13;
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v118 - v15;
  v17 = MEMORY[0x1E0C80A78](v14);
  v123 = (char *)&v118 - v18;
  v19 = MEMORY[0x1E0C80A78](v17);
  v129 = (char *)&v118 - v20;
  v21 = MEMORY[0x1E0C80A78](v19);
  v141 = (uint64_t)&v118 - v22;
  MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v118 - v23;
  v25 = sub_1CAF20178();
  v26 = *(char **)(v25 - 8);
  v27 = MEMORY[0x1E0C80A78](v25);
  v29 = (char *)&v118 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = MEMORY[0x1E0C80A78](v27);
  v32 = (char *)&v118 - v31;
  v33 = MEMORY[0x1E0C80A78](v30);
  v35 = (char *)&v118 - v34;
  v36 = MEMORY[0x1E0C80A78](v33);
  v126 = (char *)&v118 - v37;
  v38 = MEMORY[0x1E0C80A78](v36);
  v128 = (char *)&v118 - v39;
  v40 = MEMORY[0x1E0C80A78](v38);
  v124 = (char *)&v118 - v41;
  MEMORY[0x1E0C80A78](v40);
  v134 = (char *)&v118 - v42;
  if (!objc_msgSend(v2, sel_shouldBadgeInvitee))
  {
    v94 = a1;
    if (qword_1EF98FBD8[0] != -1)
      swift_once();
    v95 = sub_1CAF202E0();
    __swift_project_value_buffer(v95, (uint64_t)qword_1EF98FD68);
    v96 = sub_1CAF202C8();
    v97 = sub_1CAF206A0();
    if (os_log_type_enabled(v96, v97))
    {
      v98 = (uint8_t *)swift_slowAlloc();
      v99 = swift_slowAlloc();
      v145[0] = v99;
      *(_DWORD *)v98 = 136315138;
      v144 = sub_1CAEDBE5C(0xD000000000000020, 0x80000001CAF2B2F0, v145);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v96, v97, "%s shouldBadgeInvitee is disabled", v98, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v99, -1, -1);
      MEMORY[0x1D179A698](v98, -1, -1);
    }

    (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v26 + 7))(v94, 1, 1, v25);
    return;
  }
  v121 = v9;
  v120 = v32;
  v43 = objc_msgSend(v2, sel_pendingInvitesOnly);
  sub_1CAEEBF3C(0, &qword_1ECFCE918);
  v44 = sub_1CAF205B0();

  v45 = v2;
  v46 = sub_1CAEEFE98(v44, v45);
  swift_bridgeObjectRelease();

  v139 = v46;
  if (v46 >> 62)
    goto LABEL_59;
  v47 = *(_QWORD *)((v46 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  v48 = v26;
  if (!v47)
  {
LABEL_60:
    swift_bridgeObjectRelease_n();
    (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v48 + 7))(a1, 1, 1, v25);
    return;
  }
LABEL_4:
  v137 = (char *)v47;
  v133 = v24;
  v127 = v16;
  v119 = a1;
  v49 = 0;
  v50 = v139;
  v138 = v139 & 0xC000000000000001;
  a1 = 4;
  v136 = v48;
  v131 = v25;
  v132 = v29;
  while (1)
  {
    v26 = v35;
    v24 = (char *)(a1 - 4);
    if (v138)
    {
      v51 = (void (*)(char *, uint64_t, uint64_t))MEMORY[0x1D1799A98](a1 - 4, v50);
      v16 = (char *)(a1 - 3);
      if (__OFADD__(v24, 1))
        goto LABEL_58;
    }
    else
    {
      v51 = (void (*)(char *, uint64_t, uint64_t))*(id *)(v50 + 8 * a1);
      v16 = (char *)(a1 - 3);
      if (__OFADD__(v24, 1))
      {
LABEL_58:
        __break(1u);
LABEL_59:
        swift_bridgeObjectRetain();
        v47 = sub_1CAF208C8();
        v48 = v26;
        if (!v47)
          goto LABEL_60;
        goto LABEL_4;
      }
    }
    if (!v49)
    {
      v49 = v51;
      goto LABEL_6;
    }
    v143 = v51;
    v142 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))*((_QWORD *)v48 + 7);
    v142(v141, 1, 1, v25);
    v140 = v49;
    v52 = v49;
    v53 = objc_msgSend(v52, sel_inviteStatus);
    if (v53)
      break;
LABEL_24:
    v71 = (uint64_t)v133;
    sub_1CAEFB154(v141, (uint64_t)v133);
    v72 = v48;
    v73 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))*((_QWORD *)v48 + 6);
    if (v73(v71, 1, v25) == 1)
    {

      sub_1CAEF5168(v71, &qword_1EF98FDB8);
      v29 = v132;
      v48 = v72;
LABEL_42:
      v49 = v140;
      goto LABEL_6;
    }
    v74 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v72 + 4);
    v74(v134, v71, v25);
    v142(v135, 1, 1, v25);
    v75 = objc_msgSend(v143, sel_inviteStatus);
    if (!v75)
      goto LABEL_37;
    v76 = v75;
    v130 = v74;
    v77 = sub_1CAF20400();
    v79 = v78;

    if (v77 == 0x676E69646E6550 && v79 == 0xE700000000000000)
    {
      swift_bridgeObjectRelease();
      v35 = v26;
      v74 = v130;
      v25 = v131;
    }
    else
    {
      v80 = sub_1CAF209A0();
      swift_bridgeObjectRelease();
      v35 = v26;
      v74 = v130;
      v25 = v131;
      if ((v80 & 1) == 0)
        goto LABEL_37;
    }
    v81 = objc_msgSend(v143, sel_inviteDate);
    if (v81)
    {
      v82 = v81;
      v83 = v128;
      sub_1CAF20160();

      v84 = (uint64_t)v125;
      v74(v125, (uint64_t)v83, v25);
      v142(v84, 0, 1, v25);
      if (v73(v84, 1, v25) != 1)
      {
        v74(v35, v84, v25);
        v85 = objc_msgSend(v143, sel_badgeAfter);
        if (!v85)
          goto LABEL_62;
        v86 = v85;
        objc_msgSend(v85, sel_doubleValue);

        v87 = (uint64_t)v121;
        sub_1CAF2013C();
        (*((void (**)(char *, uint64_t))v136 + 1))(v35, v25);
        v88 = v135;
        sub_1CAEF5168(v135, &qword_1EF98FDB8);
        v142(v87, 0, 1, v25);
        sub_1CAEFB154(v87, v88);
        v74 = v130;
        goto LABEL_37;
      }
    }
    else
    {
      v84 = (uint64_t)v125;
      v142((uint64_t)v125, 1, 1, v25);
    }
    sub_1CAEF5168(v84, &qword_1EF98FDB8);
LABEL_37:
    v89 = (uint64_t)v127;
    sub_1CAEFB154(v135, (uint64_t)v127);
    if (v73(v89, 1, v25) == 1)
    {

      v48 = v136;
      (*((void (**)(char *, uint64_t))v136 + 1))(v134, v25);
      sub_1CAEF5168(v89, &qword_1EF98FDB8);

      v29 = v132;
      goto LABEL_42;
    }
    v90 = v126;
    v74(v126, v89, v25);
    v91 = v134;
    v92 = sub_1CAF20124();

    v93 = (void (*)(char *, uint64_t))*((_QWORD *)v136 + 1);
    v93(v90, v25);
    v93(v91, v25);
    if ((v92 & 1) == 0)
    {

      v29 = v132;
      v48 = v136;
      goto LABEL_42;
    }

    v49 = v143;
    v29 = v132;
    v48 = v136;
LABEL_6:
    ++a1;
    v50 = v139;
    if (v16 == v137)
    {
      swift_bridgeObjectRelease_n();
      if (v49)
      {
        v100 = v49;
        v101 = v48;
        v102 = v122;
        FAFamilyInvite.clientSignalDateForInvite()(v122);
        v103 = v102;
        v48 = v101;
        if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v101 + 6))(v103, 1, v25) != 1)
        {
          v104 = (void (*)(char *, uint64_t, uint64_t))*((_QWORD *)v101 + 4);
          v105 = (void (**)(char *, uint64_t))v101;
          v106 = v120;
          v104(v120, v103, v25);
          if (qword_1ECFCE888 != -1)
            swift_once();
          v107 = sub_1CAF202E0();
          __swift_project_value_buffer(v107, (uint64_t)qword_1ECFCE8A8);
          (*((void (**)(char *, char *, uint64_t))v101 + 2))(v29, v106, v25);
          v108 = sub_1CAF202C8();
          v109 = v25;
          v110 = sub_1CAF206A0();
          if (os_log_type_enabled(v108, v110))
          {
            v111 = swift_slowAlloc();
            v143 = v104;
            v112 = v111;
            v142 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))swift_slowAlloc();
            v145[0] = (uint64_t)v142;
            *(_DWORD *)v112 = 136315394;
            v144 = sub_1CAEDBE5C(0xD000000000000020, 0x80000001CAF2B2F0, v145);
            sub_1CAF2076C();
            *(_WORD *)(v112 + 12) = 2080;
            sub_1CAEFB114((unint64_t *)&qword_1EF990400, MEMORY[0x1E0CB08F0]);
            v113 = sub_1CAF2097C();
            v144 = sub_1CAEDBE5C(v113, v114, v145);
            sub_1CAF2076C();
            swift_bridgeObjectRelease();
            v105[1](v29, v109);
            _os_log_impl(&dword_1CAEBA000, v108, v110, "%s oldestInvitation badge time %s", (uint8_t *)v112, 0x16u);
            v115 = v142;
            swift_arrayDestroy();
            MEMORY[0x1D179A698](v115, -1, -1);
            v116 = v112;
            v104 = v143;
            MEMORY[0x1D179A698](v116, -1, -1);

          }
          else
          {

            v105[1](v29, v109);
          }
          v117 = v119;
          v104((char *)v119, (uint64_t)v120, v109);
          ((void (*)(uint64_t, _QWORD, uint64_t, uint64_t))v105[7])(v117, 0, 1, v109);

          return;
        }

        sub_1CAEF5168(v103, &qword_1EF98FDB8);
      }
      (*((void (**)(uint64_t, uint64_t, uint64_t, uint64_t))v48 + 7))(v119, 1, 1, v25);

      return;
    }
  }
  v54 = v53;
  v55 = sub_1CAF20400();
  v57 = v56;

  if (v55 == 0x676E69646E6550 && v57 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v48 = v136;
    v25 = v131;
  }
  else
  {
    v58 = sub_1CAF209A0();
    swift_bridgeObjectRelease();
    v48 = v136;
    v25 = v131;
    if ((v58 & 1) == 0)
      goto LABEL_24;
  }
  v130 = v52;
  v59 = objc_msgSend(v52, sel_inviteDate);
  if (!v59)
  {
    v64 = v48;
    v63 = (uint64_t)v129;
    v142((uint64_t)v129, 1, 1, v25);
    goto LABEL_23;
  }
  v60 = v59;
  v61 = v128;
  sub_1CAF20160();

  v62 = (void (*)(char *, char *, uint64_t))*((_QWORD *)v48 + 4);
  v63 = (uint64_t)v129;
  v62(v129, v61, v25);
  v142(v63, 0, 1, v25);
  v64 = v48;
  if ((*((unsigned int (**)(uint64_t, uint64_t, uint64_t))v48 + 6))(v63, 1, v25) == 1)
  {
LABEL_23:
    sub_1CAEF5168(v63, &qword_1EF98FDB8);
    v48 = v64;
    v52 = v130;
    goto LABEL_24;
  }
  v65 = v124;
  v62(v124, (char *)v63, v25);
  v52 = v130;
  v66 = objc_msgSend(v130, sel_badgeAfter);
  if (v66)
  {
    v67 = v66;
    objc_msgSend(v66, sel_doubleValue);

    v68 = v123;
    sub_1CAF2013C();
    (*((void (**)(char *, uint64_t))v64 + 1))(v65, v25);
    v69 = v141;
    sub_1CAEF5168(v141, &qword_1EF98FDB8);
    v142((uint64_t)v68, 0, 1, v25);
    v70 = (uint64_t)v68;
    v48 = v64;
    sub_1CAEFB154(v70, v69);
    v35 = v26;
    goto LABEL_24;
  }
  __break(1u);
LABEL_62:
  __break(1u);
}

uint64_t static FamilyCircleInvitationStatus.== infix(_:_:)()
{
  sub_1CAEEBF3C(0, &qword_1EF98FD10);
  return sub_1CAF2073C() & 1;
}

uint64_t sub_1CAEF8FA0()
{
  sub_1CAEEBF3C(0, &qword_1EF98FD10);
  return sub_1CAF2073C() & 1;
}

void sub_1CAEF8FF0(void **a1, void **a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  unsigned int (*v26)(char *, uint64_t, uint64_t);
  id v27;
  void *v28;
  void *v29;
  id v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  char *v37;
  char v38;
  void (*v39)(char *, uint64_t);
  void *v40;
  id v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  id v47;
  char *v48;
  void **v49;
  uint64_t v50;
  uint64_t v51;

  v4 = sub_1CAF20178();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v46 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v48 = (char *)&v46 - v10;
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v46 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v46 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = MEMORY[0x1E0C80A78](v14);
  v19 = (char *)&v46 - v18;
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v46 - v20;
  v22 = *a1;
  v49 = a2;
  v23 = *a2;
  if (*a2)
  {
    v24 = v22;
    v25 = v23;
    FAFamilyMember.clientSignalDateForInvite()((uint64_t)v19);
    v26 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48);
    if (v26(v19, 1, v4) == 1)
    {
      v16 = v19;
LABEL_9:
      sub_1CAEF5168((uint64_t)v16, &qword_1EF98FDB8);
      if (qword_1EF98FBD8[0] != -1)
        swift_once();
      v32 = sub_1CAF202E0();
      __swift_project_value_buffer(v32, (uint64_t)qword_1EF98FD68);
      v33 = sub_1CAF202C8();
      v34 = sub_1CAF206AC();
      if (os_log_type_enabled(v33, v34))
      {
        v35 = (uint8_t *)swift_slowAlloc();
        v36 = swift_slowAlloc();
        v51 = v36;
        *(_DWORD *)v35 = 136315138;
        v50 = sub_1CAEDBE5C(0xD00000000000001CLL, 0x80000001CAF2B2D0, &v51);
        sub_1CAF2076C();
        _os_log_impl(&dword_1CAEBA000, v33, v34, "%s one or more pending members have no invite date", v35, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v36, -1, -1);
        MEMORY[0x1D179A698](v35, -1, -1);
      }

      return;
    }
    v47 = v25;
    v31 = *(void (**)(char *, char *, uint64_t))(v5 + 32);
    v31(v12, v19, v4);
    FAFamilyMember.clientSignalDateForInvite()((uint64_t)v16);
    if (v26(v16, 1, v4) == 1)
    {
      (*(void (**)(char *, uint64_t))(v5 + 8))(v12, v4);
      v25 = v47;
      goto LABEL_9;
    }
    v37 = v48;
    v31(v48, v16, v4);
    v38 = sub_1CAF20124();

    v39 = *(void (**)(char *, uint64_t))(v5 + 8);
    v39(v37, v4);
    v39(v12, v4);
    if ((v38 & 1) != 0)
    {
      v40 = *v49;
      *v49 = v24;
      v41 = v24;

    }
  }
  else
  {
    v27 = objc_msgSend(v22, sel_invitationDate);
    if (v27)
    {
      v28 = v27;
      sub_1CAF20160();

      (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v21, v8, v4);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v21, 0, 1, v4);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v21, 1, v4) != 1)
      {
        sub_1CAEF5168((uint64_t)v21, &qword_1EF98FDB8);
        v29 = *v49;
        *v49 = v22;
        v30 = v22;

        return;
      }
    }
    else
    {
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v21, 1, 1, v4);
    }
    sub_1CAEF5168((uint64_t)v21, &qword_1EF98FDB8);
    if (qword_1EF98FBD8[0] != -1)
      swift_once();
    v42 = sub_1CAF202E0();
    __swift_project_value_buffer(v42, (uint64_t)qword_1EF98FD68);
    v43 = sub_1CAF202C8();
    v44 = sub_1CAF206A0();
    if (os_log_type_enabled(v43, v44))
    {
      v45 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v45 = 0;
      _os_log_impl(&dword_1CAEBA000, v43, v44, "Pending invite w/o a date", v45, 2u);
      MEMORY[0x1D179A698](v45, -1, -1);
    }

  }
}

void __swiftcall FAFamilyCircle.invitationStatus()(FamilyCircle::FamilyCircleInvitationStatus *__return_ptr retstr)
{
  objc_class *v1;
  objc_class *v2;

  retstr->family.super.isa = v1;
  v2 = v1;
}

void sub_1CAEF9514(void **a1@<X0>, _QWORD *a2@<X8>)
{
  void *v3;
  uint64_t inited;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  id v14;
  void *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  id v21;
  void *v22;
  id v23;
  __int128 v24;
  uint64_t v25;

  v3 = *a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991488);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAF25C50;
  *(_QWORD *)(inited + 32) = 0x642D7265626D656DLL;
  *(_QWORD *)(inited + 40) = 0xEB00000000646973;
  v5 = objc_msgSend(v3, sel_organizerDSID);
  v6 = MEMORY[0x1E0DEA968];
  if (v5)
  {
    v7 = v5;
    v25 = sub_1CAEEBF3C(0, (unint64_t *)&qword_1EF991370);
    *(_QWORD *)&v24 = v7;
    sub_1CAEEBF2C(&v24, (_OWORD *)(inited + 48));
  }
  else
  {
    *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 48) = 0;
    *(_QWORD *)(inited + 56) = 0xE000000000000000;
  }
  *(_QWORD *)(inited + 80) = 0xD000000000000011;
  *(_QWORD *)(inited + 88) = 0x80000001CAF2B320;
  v8 = objc_msgSend(v3, sel_organizerLastName);
  if (v8)
  {
    v9 = v8;
    v10 = sub_1CAF20400();
    v12 = v11;

    v13 = (uint64_t *)(inited + 96);
    *(_QWORD *)(inited + 120) = v6;
    if (v12)
    {
      *v13 = v10;
      goto LABEL_9;
    }
  }
  else
  {
    v13 = (uint64_t *)(inited + 96);
    *(_QWORD *)(inited + 120) = v6;
  }
  *v13 = 0;
  v12 = 0xE000000000000000;
LABEL_9:
  *(_QWORD *)(inited + 104) = v12;
  *(_QWORD *)(inited + 128) = 0x612D7265626D656DLL;
  *(_QWORD *)(inited + 136) = 0xEF64692D656C7070;
  v14 = objc_msgSend(v3, sel_organizerEmail);
  if (!v14)
  {
    v19 = (uint64_t *)(inited + 144);
    *(_QWORD *)(inited + 168) = v6;
    goto LABEL_13;
  }
  v15 = v14;
  v16 = sub_1CAF20400();
  v18 = v17;

  v19 = (uint64_t *)(inited + 144);
  *(_QWORD *)(inited + 168) = v6;
  if (!v18)
  {
LABEL_13:
    *v19 = 0;
    v18 = 0xE000000000000000;
    goto LABEL_14;
  }
  *v19 = v16;
LABEL_14:
  *(_QWORD *)(inited + 152) = v18;
  v20 = sub_1CAF0BCFC(inited);
  sub_1CAF0C2A0(v20);
  swift_bridgeObjectRelease();
  v21 = objc_allocWithZone((Class)FAFamilyMember);
  v22 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  v23 = objc_msgSend(v21, sel_initWithDictionaryRepresentation_, v22);

  *a2 = v23;
}

uint64_t FAFamilyCircle.badgeableInviteDate()@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
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
  uint64_t v19;
  char *v20;
  unsigned int (*v21)(char *, uint64_t, uint64_t);
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  char *v25;
  uint64_t v26;
  void (*v27)(char *, uint64_t);
  uint64_t v28;
  uint64_t v29;

  v2 = sub_1CAF20178();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v28 - v7;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v28 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v28 - v14;
  v16 = MEMORY[0x1E0C80A78](v13);
  v18 = (char *)&v28 - v17;
  MEMORY[0x1E0C80A78](v16);
  v20 = (char *)&v28 - v19;
  FAFamilyCircle.oldestSentInviteSignalDate()((uint64_t)&v28 - v19);
  FAFamilyCircle.oldestReceivedInviteSignalDate()((uint64_t)v18);
  sub_1CAEFB19C((uint64_t)v20, (uint64_t)v15);
  v21 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v21(v15, 1, v2) == 1)
  {
    sub_1CAEF5168((uint64_t)v20, &qword_1EF98FDB8);
    sub_1CAEF5168((uint64_t)v15, &qword_1EF98FDB8);
    return sub_1CAEFB154((uint64_t)v18, a1);
  }
  else
  {
    v29 = a1;
    v23 = *(void (**)(char *, char *, uint64_t))(v3 + 32);
    v23(v8, v15, v2);
    sub_1CAEFB19C((uint64_t)v18, (uint64_t)v12);
    if (v21(v12, 1, v2) == 1)
    {
      sub_1CAEF5168((uint64_t)v18, &qword_1EF98FDB8);
      sub_1CAEF5168((uint64_t)v20, &qword_1EF98FDB8);
      sub_1CAEF5168((uint64_t)v12, &qword_1EF98FDB8);
      v24 = v29;
      v23((char *)v29, v8, v2);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v24, 0, 1, v2);
    }
    else
    {
      v23(v6, v12, v2);
      sub_1CAEFB114(&qword_1EF991478, MEMORY[0x1E0CB08B0]);
      if ((sub_1CAF203C4() & 1) != 0)
        v25 = v6;
      else
        v25 = v8;
      v26 = v29;
      (*(void (**)(uint64_t, char *, uint64_t))(v3 + 16))(v29, v25, v2);
      v27 = *(void (**)(char *, uint64_t))(v3 + 8);
      v27(v6, v2);
      v27(v8, v2);
      sub_1CAEF5168((uint64_t)v18, &qword_1EF98FDB8);
      sub_1CAEF5168((uint64_t)v20, &qword_1EF98FDB8);
      return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 56))(v26, 0, 1, v2);
    }
  }
}

uint64_t sub_1CAEF9A3C(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CAEF9A74(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CAEF9A58(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1CAEF9BE0(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1CAEF9A74(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991480);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 1;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 5);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[32 * v8])
      memmove(v13, v14, 32 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[32 * v8] || v13 >= &v14[32 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

uint64_t sub_1CAEF9BE0(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE718);
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
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

uint64_t sub_1CAEF9D48(uint64_t *a1)
{
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v4;
  uint64_t v6[2];

  v2 = *a1;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  *a1 = v2;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
    sub_1CAEFB100();
  v4 = *(_QWORD *)(v2 + 16);
  v6[0] = v2 + 32;
  v6[1] = v4;
  sub_1CAEF9DC0(v6);
  return sub_1CAF20844();
}

void sub_1CAEF9DC0(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  _BOOL4 v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  int v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  void *v50;
  uint64_t v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  unint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  unint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  BOOL v71;
  unint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  char *v78;
  uint64_t v79;
  uint64_t v80;
  BOOL v81;
  uint64_t v82;
  char v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  BOOL v88;
  uint64_t v89;
  uint64_t v90;
  char *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  char *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  unint64_t v99;
  char *v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  char *v104;
  uint64_t v105;
  unint64_t v106;
  uint64_t v107;
  unint64_t v108;
  char *v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  unint64_t v114;
  char *v115;
  uint64_t *v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  _BOOL4 v120;
  uint64_t v121;
  uint64_t v122;
  char *v123;
  uint64_t v124;
  uint64_t v125;

  v3 = a1[1];
  v4 = sub_1CAF20970();
  if (v4 >= v3)
  {
    if (v3 < 0)
      goto LABEL_150;
    if (v3)
      sub_1CAEFA650(0, v3, 1, a1);
    return;
  }
  if (v3 >= 0)
    v5 = v3;
  else
    v5 = v3 + 1;
  if (v3 < -1)
    goto LABEL_158;
  v118 = v4;
  v122 = v3;
  v116 = a1;
  if (v3 < 2)
  {
    v8 = (char *)MEMORY[0x1E0DEE9D8];
    v125 = MEMORY[0x1E0DEE9D8];
    v123 = (char *)((MEMORY[0x1E0DEE9D8] & 0xFFFFFFFFFFFFFF8) + 32);
    if (v3 != 1)
    {
      v12 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
LABEL_116:
      if (v12 >= 2)
      {
        v107 = *v116;
        do
        {
          v108 = v12 - 2;
          if (v12 < 2)
            goto LABEL_145;
          if (!v107)
            goto LABEL_157;
          v109 = v8;
          v110 = v8 + 32;
          v111 = *(_QWORD *)&v8[16 * v108 + 32];
          v112 = *(_QWORD *)&v8[16 * v12 + 24];
          sub_1CAEFA7C4((id *)(v107 + 8 * v111), (id *)(v107 + 8 * *(_QWORD *)&v110[16 * v12 - 16]), v107 + 8 * v112, v123);
          if (v1)
            break;
          if (v112 < v111)
            goto LABEL_146;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v109 = sub_1CAEFAD2C((uint64_t)v109);
          if (v108 >= *((_QWORD *)v109 + 2))
            goto LABEL_147;
          v113 = &v109[16 * v108 + 32];
          *(_QWORD *)v113 = v111;
          *((_QWORD *)v113 + 1) = v112;
          v114 = *((_QWORD *)v109 + 2);
          if (v12 > v114)
            goto LABEL_148;
          v8 = v109;
          memmove(&v109[16 * v12 + 16], &v109[16 * v12 + 32], 16 * (v114 - v12));
          *((_QWORD *)v109 + 2) = v114 - 1;
          v12 = v114 - 1;
        }
        while (v114 > 2);
      }
LABEL_127:
      swift_bridgeObjectRelease();
      *(_QWORD *)((v125 & 0xFFFFFFFFFFFFF8) + 0x10) = 0;
      sub_1CAF205BC();
      swift_bridgeObjectRelease();
      return;
    }
  }
  else
  {
    v6 = v5 >> 1;
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    v7 = sub_1CAF205D4();
    *(_QWORD *)((v7 & 0xFFFFFFFFFFFFFF8) + 0x10) = v6;
    v123 = (char *)((v7 & 0xFFFFFFFFFFFFFF8) + 32);
    v125 = v7;
  }
  v9 = 0;
  v10 = *a1;
  v117 = *a1 - 8;
  v8 = (char *)MEMORY[0x1E0DEE9D8];
  v11 = v122;
  v124 = *a1;
  while (1)
  {
    v13 = v9++;
    if (v9 < v11)
    {
      v14 = *(void **)(v10 + 8 * v13);
      v15 = *(id *)(v10 + 8 * v9);
      v16 = v14;
      v17 = objc_msgSend(v15, sel_memberSortOrder);
      if (v17)
      {
        v18 = v17;
        v19 = (uint64_t)objc_msgSend(v17, sel_integerValue);

      }
      else
      {
        v19 = 0;
      }
      v20 = objc_msgSend(v16, sel_memberSortOrder);
      if (v20)
      {
        v21 = v20;
        v22 = objc_msgSend(v20, sel_integerValue);

        v88 = (uint64_t)v22 < v19;
        v10 = v124;
        v23 = v88;
      }
      else
      {

        v23 = v19 > 1;
      }
      v120 = v23;
      v24 = v13 + 2;
      if (v13 + 2 < v122)
      {
        do
        {
          v26 = *(void **)(v10 + 8 * v9);
          v27 = *(id *)(v10 + 8 * v24);
          v28 = v26;
          v29 = objc_msgSend(v27, sel_memberSortOrder);
          if (v29)
          {
            v30 = v29;
            v31 = (uint64_t)objc_msgSend(v29, sel_integerValue);

          }
          else
          {
            v31 = 0;
          }
          v32 = objc_msgSend(v28, sel_memberSortOrder);
          if (v32)
          {
            v33 = v32;
            v34 = objc_msgSend(v32, sel_integerValue);

            v88 = (uint64_t)v34 < v31;
            v10 = v124;
            v35 = !v88;
            if (((v120 ^ v35) & 1) == 0)
              goto LABEL_36;
          }
          else
          {

            if (v120 == v31 < 2)
              goto LABEL_36;
          }
          v25 = v24 + 1;
          v9 = v24;
          v24 = v25;
        }
        while (v25 < v122);
        v24 = v25;
        if (!v120)
          goto LABEL_45;
      }
      else
      {
LABEL_36:
        if (!v120)
        {
LABEL_45:
          v9 = v24;
          goto LABEL_46;
        }
      }
      if (v24 < v13)
        goto LABEL_151;
      if (v13 < v24)
      {
        v36 = (uint64_t *)(v117 + 8 * v24);
        v37 = v24;
        v38 = v13;
        v39 = (uint64_t *)(v10 + 8 * v13);
        while (1)
        {
          if (v38 != --v37)
          {
            if (!v10)
              goto LABEL_156;
            v40 = *v39;
            *v39 = *v36;
            *v36 = v40;
          }
          ++v38;
          --v36;
          ++v39;
          if (v38 >= v37)
            goto LABEL_45;
        }
      }
      goto LABEL_45;
    }
LABEL_46:
    v121 = v13;
    if (v9 >= v122)
      goto LABEL_68;
    if (__OFSUB__(v9, v13))
      goto LABEL_149;
    if (v9 - v13 >= v118)
      goto LABEL_68;
    if (__OFADD__(v13, v118))
      goto LABEL_152;
    v41 = v122;
    if (v13 + v118 < v122)
      v41 = v13 + v118;
    if (v41 < v13)
      break;
    if (v9 != v41)
    {
      v115 = v8;
      v42 = v117 + 8 * v9;
      v119 = v41;
      do
      {
        v43 = *(void **)(v10 + 8 * v9);
        v44 = v121;
        v45 = v42;
        do
        {
          v46 = *(void **)v45;
          v47 = v43;
          v48 = v46;
          v49 = objc_msgSend(v47, sel_memberSortOrder);
          if (v49)
          {
            v50 = v49;
            v51 = (uint64_t)objc_msgSend(v49, sel_integerValue);

          }
          else
          {
            v51 = 0;
          }
          v52 = objc_msgSend(v48, sel_memberSortOrder);
          if (v52)
          {
            v53 = v52;
            v54 = objc_msgSend(v52, sel_integerValue);

            v88 = (uint64_t)v54 < v51;
            v10 = v124;
            if (!v88)
              break;
          }
          else
          {

            if (v51 < 2)
              break;
          }
          if (!v10)
            goto LABEL_154;
          v55 = *(void **)v45;
          v43 = *(void **)(v45 + 8);
          *(_QWORD *)v45 = v43;
          *(_QWORD *)(v45 + 8) = v55;
          v45 -= 8;
          ++v44;
        }
        while (v9 != v44);
        ++v9;
        v42 += 8;
      }
      while (v9 != v119);
      v9 = v119;
      v8 = v115;
      v13 = v121;
    }
LABEL_68:
    if (v9 < v13)
      goto LABEL_144;
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v8 = sub_1CAEFAB8C(0, *((_QWORD *)v8 + 2) + 1, 1, v8);
    v57 = *((_QWORD *)v8 + 2);
    v56 = *((_QWORD *)v8 + 3);
    v12 = v57 + 1;
    if (v57 >= v56 >> 1)
      v8 = sub_1CAEFAB8C((char *)(v56 > 1), v57 + 1, 1, v8);
    *((_QWORD *)v8 + 2) = v12;
    v58 = v8 + 32;
    v59 = &v8[16 * v57 + 32];
    *(_QWORD *)v59 = v121;
    *((_QWORD *)v59 + 1) = v9;
    if (v57)
    {
      while (1)
      {
        v60 = v12 - 1;
        if (v12 >= 4)
        {
          v65 = &v58[16 * v12];
          v66 = *((_QWORD *)v65 - 8);
          v67 = *((_QWORD *)v65 - 7);
          v71 = __OFSUB__(v67, v66);
          v68 = v67 - v66;
          if (v71)
            goto LABEL_133;
          v70 = *((_QWORD *)v65 - 6);
          v69 = *((_QWORD *)v65 - 5);
          v71 = __OFSUB__(v69, v70);
          v63 = v69 - v70;
          v64 = v71;
          if (v71)
            goto LABEL_134;
          v72 = v12 - 2;
          v73 = &v58[16 * v12 - 32];
          v75 = *(_QWORD *)v73;
          v74 = *((_QWORD *)v73 + 1);
          v71 = __OFSUB__(v74, v75);
          v76 = v74 - v75;
          if (v71)
            goto LABEL_136;
          v71 = __OFADD__(v63, v76);
          v77 = v63 + v76;
          if (v71)
            goto LABEL_139;
          if (v77 >= v68)
          {
            v95 = &v58[16 * v60];
            v97 = *(_QWORD *)v95;
            v96 = *((_QWORD *)v95 + 1);
            v71 = __OFSUB__(v96, v97);
            v98 = v96 - v97;
            if (v71)
              goto LABEL_143;
            v88 = v63 < v98;
            goto LABEL_105;
          }
        }
        else
        {
          if (v12 != 3)
          {
            v89 = *((_QWORD *)v8 + 4);
            v90 = *((_QWORD *)v8 + 5);
            v71 = __OFSUB__(v90, v89);
            v82 = v90 - v89;
            v83 = v71;
            goto LABEL_99;
          }
          v62 = *((_QWORD *)v8 + 4);
          v61 = *((_QWORD *)v8 + 5);
          v71 = __OFSUB__(v61, v62);
          v63 = v61 - v62;
          v64 = v71;
        }
        if ((v64 & 1) != 0)
          goto LABEL_135;
        v72 = v12 - 2;
        v78 = &v58[16 * v12 - 32];
        v80 = *(_QWORD *)v78;
        v79 = *((_QWORD *)v78 + 1);
        v81 = __OFSUB__(v79, v80);
        v82 = v79 - v80;
        v83 = v81;
        if (v81)
          goto LABEL_138;
        v84 = &v58[16 * v60];
        v86 = *(_QWORD *)v84;
        v85 = *((_QWORD *)v84 + 1);
        v71 = __OFSUB__(v85, v86);
        v87 = v85 - v86;
        if (v71)
          goto LABEL_141;
        if (__OFADD__(v82, v87))
          goto LABEL_142;
        if (v82 + v87 >= v63)
        {
          v88 = v63 < v87;
LABEL_105:
          if (v88)
            v60 = v72;
          goto LABEL_107;
        }
LABEL_99:
        if ((v83 & 1) != 0)
          goto LABEL_137;
        v91 = &v58[16 * v60];
        v93 = *(_QWORD *)v91;
        v92 = *((_QWORD *)v91 + 1);
        v71 = __OFSUB__(v92, v93);
        v94 = v92 - v93;
        if (v71)
          goto LABEL_140;
        if (v94 < v82)
          goto LABEL_14;
LABEL_107:
        v99 = v60 - 1;
        if (v60 - 1 >= v12)
        {
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
          __break(1u);
LABEL_149:
          __break(1u);
LABEL_150:
          __break(1u);
LABEL_151:
          __break(1u);
LABEL_152:
          __break(1u);
          goto LABEL_153;
        }
        if (!v10)
          goto LABEL_155;
        v100 = v8;
        v101 = v10;
        v102 = &v58[16 * v99];
        v103 = *(_QWORD *)v102;
        v104 = &v58[16 * v60];
        v105 = *((_QWORD *)v104 + 1);
        sub_1CAEFA7C4((id *)(v101 + 8 * *(_QWORD *)v102), (id *)(v101 + 8 * *(_QWORD *)v104), v101 + 8 * v105, v123);
        if (v1)
          goto LABEL_127;
        if (v105 < v103)
          goto LABEL_130;
        if (v60 > *((_QWORD *)v100 + 2))
          goto LABEL_131;
        *(_QWORD *)v102 = v103;
        *(_QWORD *)&v58[16 * v99 + 8] = v105;
        v106 = *((_QWORD *)v100 + 2);
        if (v60 >= v106)
          goto LABEL_132;
        v8 = v100;
        v12 = v106 - 1;
        memmove(&v58[16 * v60], v104 + 16, 16 * (v106 - 1 - v60));
        *((_QWORD *)v100 + 2) = v106 - 1;
        v10 = v124;
        if (v106 <= 2)
          goto LABEL_14;
      }
    }
    v12 = 1;
LABEL_14:
    v11 = v122;
    if (v9 >= v122)
      goto LABEL_116;
  }
LABEL_153:
  __break(1u);
LABEL_154:
  __break(1u);
LABEL_155:
  __break(1u);
LABEL_156:
  __break(1u);
LABEL_157:
  __break(1u);
LABEL_158:
  sub_1CAF208B0();
  __break(1u);
}

void sub_1CAEFA650(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  char **v6;
  uint32_t *p_ivar_base_size;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  uint32_t *v21;
  char **v22;
  uint64_t v23;
  BOOL v24;
  void *v25;
  uint64_t v28;
  uint64_t v29;

  if (a3 != a2)
  {
    v4 = a3;
    v29 = *a4;
    v5 = *a4 + 8 * a3 - 8;
    v6 = &selRef_setExpectedAltDSIDs_;
    p_ivar_base_size = &RuntimeEnvironment.ivar_base_size;
LABEL_5:
    v8 = *(void **)(v29 + 8 * v4);
    v9 = a1;
    v28 = v5;
    while (1)
    {
      v10 = *(void **)v5;
      v11 = v8;
      v12 = v10;
      v13 = objc_msgSend(v11, v6[67]);
      if (v13)
      {
        v14 = v13;
        v15 = (uint64_t)objc_msgSend(v13, *((SEL *)p_ivar_base_size + 457));

      }
      else
      {
        v15 = 0;
      }
      v16 = objc_msgSend(v12, v6[67]);
      if (v16)
      {
        v17 = v16;
        v18 = objc_msgSend(v16, *((SEL *)p_ivar_base_size + 457));
        v19 = v11;
        v20 = v4;
        v21 = p_ivar_base_size;
        v22 = v6;
        v23 = (uint64_t)v18;

        v24 = v23 < v15;
        v6 = v22;
        p_ivar_base_size = v21;
        v4 = v20;
        if (!v24)
          goto LABEL_4;
      }
      else
      {

        if (v15 < 2)
          goto LABEL_4;
      }
      if (!v29)
        break;
      v25 = *(void **)v5;
      v8 = *(void **)(v5 + 8);
      *(_QWORD *)v5 = v8;
      *(_QWORD *)(v5 + 8) = v25;
      v5 -= 8;
      if (v4 == ++v9)
      {
LABEL_4:
        ++v4;
        v5 = v28 + 8;
        if (v4 == a2)
          return;
        goto LABEL_5;
      }
    }
    __break(1u);
  }
}

uint64_t sub_1CAEFA7C4(id *a1, id *__src, unint64_t a3, char *a4)
{
  id *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  void **v12;
  void **v13;
  id *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id *v24;
  char *v25;
  id *v26;
  id *v27;
  char *v28;
  void *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  uint64_t v34;
  id *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t result;
  unint64_t v42;
  id *v44;
  char *v45;
  void **v46;
  id *v47;

  v4 = __src;
  v5 = (char *)__src - (char *)a1;
  v6 = (char *)__src - (char *)a1 + 7;
  if ((char *)__src - (char *)a1 >= 0)
    v6 = (char *)__src - (char *)a1;
  v7 = v6 >> 3;
  v8 = a3 - (_QWORD)__src;
  v9 = a3 - (_QWORD)__src + 7;
  if ((uint64_t)(a3 - (_QWORD)__src) >= 0)
    v9 = a3 - (_QWORD)__src;
  v10 = v9 >> 3;
  v47 = a1;
  v46 = (void **)a4;
  if (v7 >= v9 >> 3)
  {
    if (v8 < -7)
      goto LABEL_54;
    if (a4 != (char *)__src || &__src[v10] <= (id *)a4)
      memmove(a4, __src, 8 * v10);
    v25 = &a4[8 * v10];
    v45 = v25;
    v47 = v4;
    if (a1 >= v4 || v8 < 8)
    {
LABEL_53:
      sub_1CAEFAC84((void **)&v47, (const void **)&v46, &v45);
      return 1;
    }
    v26 = (id *)(a3 - 8);
    v27 = v4;
    while (1)
    {
      v42 = (unint64_t)v25;
      v44 = v4;
      v28 = v25 - 8;
      v29 = *--v27;
      v30 = *((id *)v25 - 1);
      v31 = v29;
      v32 = objc_msgSend(v30, sel_memberSortOrder);
      if (v32)
      {
        v33 = v32;
        v34 = (uint64_t)objc_msgSend(v32, sel_integerValue);

      }
      else
      {
        v34 = 0;
      }
      v35 = v26 + 1;
      v36 = objc_msgSend(v31, sel_memberSortOrder);
      if (v36)
      {
        v37 = v36;
        v38 = objc_msgSend(v36, sel_integerValue);

        if ((uint64_t)v38 >= v34)
          goto LABEL_46;
      }
      else
      {

        if (v34 < 2)
        {
LABEL_46:
          v45 = v28;
          v27 = v44;
          if ((unint64_t)v35 < v42 || (unint64_t)v26 >= v42 || v35 != (id *)v42)
            *v26 = *(id *)v28;
          v25 = v28;
          goto LABEL_51;
        }
      }
      v25 = (char *)v42;
      if (v35 != v44 || v26 >= v44)
        *v26 = *v27;
      v47 = v27;
LABEL_51:
      if (v27 > a1)
      {
        --v26;
        v4 = v27;
        if (v25 > a4)
          continue;
      }
      goto LABEL_53;
    }
  }
  if (v5 >= -7)
  {
    if (a4 != (char *)a1 || &a1[v7] <= (id *)a4)
      memmove(a4, a1, 8 * v7);
    v11 = &a4[8 * v7];
    v45 = v11;
    if ((unint64_t)v4 < a3 && v5 >= 8)
    {
      v12 = (void **)a4;
      v13 = a1;
      while (1)
      {
        v14 = v4;
        v15 = *v12;
        v16 = *v4;
        v17 = v15;
        v18 = objc_msgSend(v16, sel_memberSortOrder);
        if (v18)
        {
          v19 = v18;
          v20 = (uint64_t)objc_msgSend(v18, sel_integerValue);

        }
        else
        {
          v20 = 0;
        }
        v21 = objc_msgSend(v17, sel_memberSortOrder);
        if (v21)
        {
          v22 = v21;
          v23 = objc_msgSend(v21, sel_integerValue);

          if ((uint64_t)v23 >= v20)
            goto LABEL_23;
        }
        else
        {

          if (v20 < 2)
          {
LABEL_23:
            if (v13 != v12)
              *v13 = *v12;
            v46 = ++v12;
            v24 = v14;
            goto LABEL_26;
          }
        }
        v24 = v14 + 1;
        if (v13 < v14 || v13 >= v24 || v13 != v14)
          *v13 = *v14;
LABEL_26:
        ++v13;
        if (v12 < (void **)v11)
        {
          v4 = v24;
          if ((unint64_t)v24 < a3)
            continue;
        }
        v47 = v13;
        goto LABEL_53;
      }
    }
    goto LABEL_53;
  }
LABEL_54:
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

char *sub_1CAEFAB8C(char *result, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914A0);
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

char *sub_1CAEFAC84(void **a1, const void **a2, _QWORD *a3)
{
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *result;
  uint64_t v7;

  v3 = (char *)*a2;
  v4 = *a3 - (_QWORD)v3;
  v5 = v4 + 7;
  if (v4 >= 0)
    v5 = *a3 - (_QWORD)v3;
  if (v4 <= -8)
  {
    result = (char *)sub_1CAF208F8();
    __break(1u);
  }
  else
  {
    result = (char *)*a1;
    v7 = v5 >> 3;
    if (result != v3 || result >= &v3[8 * v7])
      return (char *)memmove(result, v3, 8 * v7);
  }
  return result;
}

char *sub_1CAEFAD2C(uint64_t a1)
{
  return sub_1CAEFAB8C(0, *(_QWORD *)(a1 + 16), 0, (char *)a1);
}

uint64_t sub_1CAEFAD40(unint64_t a1)
{
  unint64_t *v1;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int isUniquelyReferenced_nonNull_bridgeObject;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v3 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v4 = *v1;
  if (*v1 >> 62)
  {
    swift_bridgeObjectRetain();
    v5 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
    v6 = v5 + v3;
    if (!__OFADD__(v5, v3))
      goto LABEL_5;
LABEL_23:
    __break(1u);
    goto LABEL_24;
  }
  v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = v5 + v3;
  if (__OFADD__(v5, v3))
    goto LABEL_23;
LABEL_5:
  v4 = *v1;
  isUniquelyReferenced_nonNull_bridgeObject = swift_isUniquelyReferenced_nonNull_bridgeObject();
  *v1 = v4;
  v5 = 0;
  if (isUniquelyReferenced_nonNull_bridgeObject && (v4 & 0x8000000000000000) == 0 && (v4 & 0x4000000000000000) == 0)
  {
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
    if (v6 <= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
      goto LABEL_15;
    v5 = 1;
  }
  if (v4 >> 62)
    goto LABEL_25;
  v9 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    if (v9 <= v6)
      v9 = v6;
    swift_bridgeObjectRetain();
    v4 = MEMORY[0x1D1799AA4](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_1CAEFAEF8(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
  }
  if (v11 < 1)
    goto LABEL_19;
  v12 = *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10);
  v13 = __OFADD__(v12, v11);
  v14 = v12 + v11;
  if (!v13)
  {
    *(_QWORD *)((*v1 & 0xFFFFFFFFFFFFFF8) + 0x10) = v14;
LABEL_19:
    swift_bridgeObjectRelease();
    return sub_1CAF205BC();
  }
  __break(1u);
  return result;
}

uint64_t sub_1CAEFAEF8(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  id *v13;
  id v14;
  uint64_t result;
  void (*v16[4])(id *);

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
    if (!v7)
      return a3;
  }
  else
  {
    v7 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v7)
      return a3;
  }
  if (!a1)
    goto LABEL_19;
  v8 = a3 & 0xFFFFFFFFFFFFFF8;
  if (v6)
  {
    swift_bridgeObjectRetain();
    v10 = sub_1CAF208C8();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_1CAEFB1F4();
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991490);
          v12 = sub_1CAEEFB30(v16, i, a3);
          v14 = *v13;
          ((void (*)(void (**)(id *), _QWORD))v12)(v16, 0);
          *(_QWORD *)(a1 + 8 * i) = v14;
        }
        swift_bridgeObjectRelease();
        return a3;
      }
      goto LABEL_18;
    }
LABEL_17:
    __break(1u);
LABEL_18:
    __break(1u);
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  v9 = *(_QWORD *)((a3 & 0xFFFFFFFFFFFFFF8) + 0x10);
  if (v9 > a2)
  {
    __break(1u);
    goto LABEL_17;
  }
  if (v8 + 32 >= a1 + 8 * v9 || v8 + 32 + 8 * v9 <= a1)
  {
    sub_1CAEEBF3C(0, &qword_1ECFCE8A0);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_1CAF208F8();
  __break(1u);
  return result;
}

void sub_1CAEFB100()
{
  JUMPOUT(0x1D1799BE8);
}

uint64_t sub_1CAEFB114(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1CAF20178();
    result = MEMORY[0x1D179A5CC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CAEFB154(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CAEFB19C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

ValueMetadata *type metadata accessor for FamilyCircleInvitationStatus()
{
  return &type metadata for FamilyCircleInvitationStatus;
}

unint64_t sub_1CAEFB1F4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF991498;
  if (!qword_1EF991498)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF991490);
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0DEAF50], v1);
    atomic_store(result, (unint64_t *)&qword_1EF991498);
  }
  return result;
}

uint64_t FAFamilyMember.refreshIDSState(forceRefresh:)(char a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = v1;
  *(_BYTE *)(v2 + 65) = a1;
  return swift_task_switch();
}

uint64_t sub_1CAEFB25C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = FAFamilyMember.allKnownHandles.getter();
  if (qword_1EF990D30 != -1)
    swift_once();
  *(_QWORD *)(v0 + 48) = qword_1EF9911B8;
  swift_retain();
  return swift_task_switch();
}

uint64_t sub_1CAEFB2D8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(_QWORD, _QWORD, uint64_t, uint64_t);

  v1 = *(_QWORD **)(v0 + 48);
  v2 = v1[17];
  v3 = v1[18];
  __swift_project_boxed_opaque_existential_1(v1 + 14, v2);
  v6 = (uint64_t (*)(_QWORD, _QWORD, uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_1CAEFB360;
  return v6(*(_QWORD *)(v0 + 40), *(unsigned __int8 *)(v0 + 65), v2, v3);
}

uint64_t sub_1CAEFB360(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 16) = v1;
  *(_QWORD *)(v2 + 24) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEFB3B8()
{
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1CAEFB3FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  if (qword_1EF990DB8 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 24);
  v2 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v3 = swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911D0);
  sub_1CAF206E8();
  swift_release();
  swift_bridgeObjectRelease();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

Swift::Void __swiftcall FAFamilyMember.clearIDS()()
{
  if (qword_1EF990DB8 != -1)
    swift_once();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911D0);
  sub_1CAF206E8();
  swift_release();
}

uint64_t FAFamilyMember.iMessageConfigured.getter()
{
  void *v0;
  uint64_t v1;
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  char v17;

  v1 = FAFamilyMember.messageEnabledHandles.getter();
  if (v1)
  {
    v2 = (_QWORD *)v1;
    v3 = objc_msgSend(v0, sel_appleID);
    if (!v3
      || (v4 = v3,
          v5 = sub_1CAF20400(),
          v7 = v6,
          v4,
          v8 = sub_1CAEF1B28(v5, v7),
          v10 = v9,
          swift_bridgeObjectRelease(),
          !v10))
    {
      swift_bridgeObjectRelease();
      v8 = 0;
      v10 = 0xE000000000000000;
    }
    v11 = sub_1CAEEEAAC(v8, v10, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) != 0)
      return 1;
  }
  v13 = (_QWORD *)FAFamilyMember.normalizedPhoneNumbers.getter();
  if (v13[2]
    && (v15 = v13[4],
        v14 = v13[5],
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (v16 = (_QWORD *)FAFamilyMember.messageEnabledHandles.getter()) != 0))
  {
    v17 = sub_1CAEEEAAC(v15, v14, v16);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v17 & 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

uint64_t FAFamilyMember.isTeenOrChild.getter()
{
  void *v0;
  uint64_t result;

  if (objc_msgSend(v0, sel_memberType) == (id)2)
    return 1;
  result = (uint64_t)objc_msgSend(v0, sel_memberType);
  if (result != 1)
    return (uint64_t)objc_msgSend(v0, sel_isChildAccount);
  return result;
}

uint64_t sub_1CAEFB728(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t result;
  int v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  unint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  int v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x1E0DEE9D8];
  if (!v1)
    return v2;
  v26 = MEMORY[0x1E0DEE9D8];
  sub_1CAEF9A58(0, v1, 0);
  v2 = v26;
  result = sub_1CAEFD704(a1);
  v6 = result;
  v7 = 0;
  v8 = a1 + 64;
  v22 = v1;
  v23 = v5;
  v24 = a1 + 64;
  while ((v6 & 0x8000000000000000) == 0 && v6 < 1 << *(_BYTE *)(a1 + 32))
  {
    v11 = (unint64_t)v6 >> 6;
    if ((*(_QWORD *)(v8 + 8 * ((unint64_t)v6 >> 6)) & (1 << v6)) == 0)
      goto LABEL_23;
    if (*(_DWORD *)(a1 + 36) != v5)
      goto LABEL_24;
    v12 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v6);
    v13 = v12[1];
    v25 = *v12;
    v15 = *(_QWORD *)(v26 + 16);
    v14 = *(_QWORD *)(v26 + 24);
    result = swift_bridgeObjectRetain();
    if (v15 >= v14 >> 1)
      result = sub_1CAEF9A58(v14 > 1, v15 + 1, 1);
    *(_QWORD *)(v26 + 16) = v15 + 1;
    v16 = v26 + 16 * v15;
    *(_QWORD *)(v16 + 32) = v25;
    *(_QWORD *)(v16 + 40) = v13;
    v9 = 1 << *(_BYTE *)(a1 + 32);
    if (v6 >= v9)
      goto LABEL_25;
    v8 = a1 + 64;
    v17 = *(_QWORD *)(v24 + 8 * v11);
    if ((v17 & (1 << v6)) == 0)
      goto LABEL_26;
    v5 = v23;
    if (*(_DWORD *)(a1 + 36) != v23)
      goto LABEL_27;
    v18 = v17 & (-2 << (v6 & 0x3F));
    if (v18)
    {
      v9 = __clz(__rbit64(v18)) | v6 & 0xFFFFFFFFFFFFFFC0;
      v10 = v22;
    }
    else
    {
      v19 = v11 + 1;
      v20 = (unint64_t)(v9 + 63) >> 6;
      v10 = v22;
      if (v11 + 1 < v20)
      {
        v21 = *(_QWORD *)(v24 + 8 * v19);
        if (v21)
        {
LABEL_20:
          v9 = __clz(__rbit64(v21)) + (v19 << 6);
        }
        else
        {
          while (v20 - 2 != v11)
          {
            v21 = *(_QWORD *)(a1 + 80 + 8 * v11++);
            if (v21)
            {
              v19 = v11 + 1;
              goto LABEL_20;
            }
          }
        }
      }
    }
    ++v7;
    v6 = v9;
    if (v7 == v10)
      return v2;
  }
  __break(1u);
LABEL_23:
  __break(1u);
LABEL_24:
  __break(1u);
LABEL_25:
  __break(1u);
LABEL_26:
  __break(1u);
LABEL_27:
  __break(1u);
  return result;
}

Swift::String __swiftcall FAFamilyMember.safeShortName()()
{
  void *v0;
  id v1;
  void *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  Swift::String result;

  v1 = objc_msgSend(v0, sel_shortName);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1CAF20400();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0xE000000000000000;
  }
  v6 = v3;
  v7 = (void *)v5;
  result._object = v7;
  result._countAndFlagsBits = v6;
  return result;
}

uint64_t FAFamilyMember.clientSignalDateForInvite()@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  id v14;
  void *v15;
  void (*v16)(char *, char *, uint64_t);
  uint64_t (*v17)(uint64_t, uint64_t, uint64_t, uint64_t);
  id v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v23;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CAF20178();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v23 - v12;
  if ((objc_msgSend(v2, sel_memberIsPending) & 1) == 0)
  {
    v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
LABEL_10:
    v20 = a1;
    v21 = 1;
    return v17(v20, v21, 1, v7);
  }
  v14 = objc_msgSend(v2, sel_invitationDate);
  if (!v14)
  {
    v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
    v17((uint64_t)v6, 1, 1, v7);
    goto LABEL_9;
  }
  v15 = v14;
  sub_1CAF20160();

  v16 = *(void (**)(char *, char *, uint64_t))(v8 + 32);
  v16(v6, v11, v7);
  v17 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56);
  v17((uint64_t)v6, 0, 1, v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
LABEL_9:
    sub_1CAEF5168((uint64_t)v6, &qword_1EF98FDB8);
    goto LABEL_10;
  }
  v16(v13, v6, v7);
  v18 = objc_msgSend(v2, sel_badgeAfter);
  if (!v18)
    v18 = objc_msgSend((id)objc_opt_self(), sel_defaultInvitationDelay);
  v19 = v18;
  objc_msgSend(v18, sel_doubleValue);

  sub_1CAF2013C();
  (*(void (**)(char *, uint64_t))(v8 + 8))(v13, v7);
  v20 = a1;
  v21 = 0;
  return v17(v20, v21, 1, v7);
}

uint64_t sub_1CAEFBBD0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v0 = sub_1CAF206DC();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v7 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1CAF2037C();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1CAF206D0();
  MEMORY[0x1E0C80A78](v5);
  sub_1CAEEBF3C(0, (unint64_t *)&qword_1ECFCE798);
  sub_1CAF206C4();
  sub_1CAF20370();
  (*(void (**)(char *, _QWORD, uint64_t))(v1 + 104))(v3, *MEMORY[0x1E0DEF8D0], v0);
  result = sub_1CAF20700();
  qword_1EF9914A8 = result;
  return result;
}

void sub_1CAEFBD1C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1D179A740](v3);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_idsCache);

    if (v6)
    {
      v7 = sub_1CAF20394();

      v6 = (id)sub_1CAEFBDE4(v7);
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    v6 = 0;
  }
  *a2 = v6;
}

unint64_t sub_1CAEFBDE4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char *v6;
  char *v7;
  unint64_t result;
  int64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t *v13;
  uint64_t v14;
  unint64_t v15;
  int64_t v16;
  int64_t v17;
  unint64_t v18;
  int64_t v19;
  unint64_t v20;
  char v21;
  uint64_t *v22;
  uint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE v30[40];
  _OWORD v31[2];
  _OWORD v32[2];
  uint64_t v33;
  _OWORD v34[2];
  _OWORD v35[2];
  uint64_t v36;

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991250);
    v2 = (_QWORD *)sub_1CAF208EC();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v27 = v1 + 64;
  v3 = -1;
  v4 = -1 << *(_BYTE *)(v1 + 32);
  if (-v4 < 64)
    v3 = ~(-1 << -(char)v4);
  v5 = v3 & *(_QWORD *)(v1 + 64);
  v6 = (char *)v35 + 8;
  v7 = (char *)v32 + 8;
  v26 = (unint64_t)(63 - v4) >> 6;
  result = swift_bridgeObjectRetain();
  v9 = 0;
  while (1)
  {
    if (v5)
    {
      v14 = (v5 - 1) & v5;
      v15 = __clz(__rbit64(v5)) | (v9 << 6);
      v16 = v9;
    }
    else
    {
      v17 = v9 + 1;
      if (__OFADD__(v9, 1))
        goto LABEL_39;
      if (v17 >= v26)
      {
LABEL_35:
        sub_1CAEFDC78();
        return (unint64_t)v2;
      }
      v18 = *(_QWORD *)(v27 + 8 * v17);
      v16 = v9 + 1;
      if (!v18)
      {
        v16 = v9 + 2;
        if (v9 + 2 >= v26)
          goto LABEL_35;
        v18 = *(_QWORD *)(v27 + 8 * v16);
        if (!v18)
        {
          v16 = v9 + 3;
          if (v9 + 3 >= v26)
            goto LABEL_35;
          v18 = *(_QWORD *)(v27 + 8 * v16);
          if (!v18)
          {
            v16 = v9 + 4;
            if (v9 + 4 >= v26)
              goto LABEL_35;
            v18 = *(_QWORD *)(v27 + 8 * v16);
            if (!v18)
            {
              v19 = v9 + 5;
              if (v9 + 5 >= v26)
                goto LABEL_35;
              v18 = *(_QWORD *)(v27 + 8 * v19);
              if (!v18)
              {
                while (1)
                {
                  v16 = v19 + 1;
                  if (__OFADD__(v19, 1))
                    goto LABEL_40;
                  if (v16 >= v26)
                    goto LABEL_35;
                  v18 = *(_QWORD *)(v27 + 8 * v16);
                  ++v19;
                  if (v18)
                    goto LABEL_26;
                }
              }
              v16 = v9 + 5;
            }
          }
        }
      }
LABEL_26:
      v14 = (v18 - 1) & v18;
      v15 = __clz(__rbit64(v18)) + (v16 << 6);
    }
    sub_1CAEDF4E0(*(_QWORD *)(v1 + 48) + 40 * v15, (uint64_t)v34);
    sub_1CAEDCD8C(*(_QWORD *)(v1 + 56) + 32 * v15, (uint64_t)v6);
    v32[0] = v35[0];
    v32[1] = v35[1];
    v33 = v36;
    v31[0] = v34[0];
    v31[1] = v34[1];
    sub_1CAEDF4E0((uint64_t)v31, (uint64_t)v30);
    if (!swift_dynamicCast())
    {
      sub_1CAEF5168((uint64_t)v31, &qword_1EF9914C8);
LABEL_34:
      swift_bridgeObjectRelease();
      sub_1CAEFDC78();
      swift_release();
      return 0;
    }
    sub_1CAEDCD8C((uint64_t)v7, (uint64_t)v30);
    sub_1CAEF5168((uint64_t)v31, &qword_1EF9914C8);
    if ((swift_dynamicCast() & 1) == 0)
      goto LABEL_34;
    result = sub_1CAEDE164(v28, v29);
    v20 = result;
    if ((v21 & 1) != 0)
    {
      v10 = v1;
      v11 = v7;
      v12 = v6;
      v13 = (uint64_t *)(v2[6] + 16 * result);
      result = swift_bridgeObjectRelease();
      *v13 = v28;
      v13[1] = v29;
      v6 = v12;
      v7 = v11;
      v1 = v10;
      *(_BYTE *)(v2[7] + v20) = v28 & 1;
      goto LABEL_8;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v22 = (uint64_t *)(v2[6] + 16 * result);
    *v22 = v28;
    v22[1] = v29;
    *(_BYTE *)(v2[7] + result) = v28 & 1;
    v23 = v2[2];
    v24 = __OFADD__(v23, 1);
    v25 = v23 + 1;
    if (v24)
      goto LABEL_38;
    v2[2] = v25;
LABEL_8:
    v9 = v16;
    v5 = v14;
  }
  __break(1u);
LABEL_38:
  __break(1u);
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
  return result;
}

void sub_1CAEFC1A8(uint64_t a1@<X0>, uint64_t a2@<X1>, BOOL *a3@<X8>)
{
  uint64_t v5;
  void *v6;
  void *v7;

  v5 = a1 + 16;
  swift_beginAccess();
  v6 = (void *)MEMORY[0x1D179A740](v5);
  if (v6)
  {
    sub_1CAF0C664(a2);
    v7 = (void *)sub_1CAF20388();
    swift_bridgeObjectRelease();
    objc_msgSend(v6, sel_setIdsCache_, v7);

  }
  *a3 = v6 == 0;
}

void sub_1CAEFC270(uint64_t a1@<X0>, BOOL *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1D179A740](v3);
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, sel_setIdsCache_, 0);

  }
  *a2 = v5 == 0;
}

uint64_t FAFamilyMember.normalizedPhoneNumbers.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  int64_t v23;
  uint64_t v24;
  _QWORD *v25;
  id v26;
  void *v27;
  id v28;
  id v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  id v37;
  void *v38;
  id v39;
  id v40;
  uint64_t v41;
  int64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  unint64_t v47;
  unint64_t v48;
  uint64_t v49;
  _QWORD v51[2];
  uint64_t *v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;

  v1 = sub_1CAF1FF8C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v51 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v0, sel_memberPhoneNumbers);
  if (v5)
  {
    v6 = v5;
    v7 = sub_1CAF20400();
    v9 = v8;

  }
  else
  {
    v7 = 0;
    v9 = 0xE000000000000000;
  }
  v10 = (uint64_t *)sub_1CAEF1C04(44, 0xE100000000000000, v7, v9);
  swift_bridgeObjectRelease();
  v11 = v10[2];
  if (v11)
  {
    swift_bridgeObjectRetain();
    v52 = v10;
    v12 = v10 + 5;
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    do
    {
      v14 = *v12;
      *(_QWORD *)&v56 = *(v12 - 1);
      *((_QWORD *)&v56 + 1) = v14;
      swift_bridgeObjectRetain();
      sub_1CAF1FF80();
      sub_1CAEEBEE8();
      v15 = sub_1CAF20784();
      v17 = v16;
      (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
      if ((v17 & 0x2000000000000000) != 0)
        v18 = HIBYTE(v17) & 0xF;
      else
        v18 = v15 & 0xFFFFFFFFFFFFLL;
      swift_bridgeObjectRelease();
      if (v18)
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v13 = sub_1CAEE58E4(0, v13[2] + 1, 1, v13);
        v20 = v13[2];
        v19 = v13[3];
        if (v20 >= v19 >> 1)
          v13 = sub_1CAEE58E4((_QWORD *)(v19 > 1), v20 + 1, 1, v13);
        v13[2] = v20 + 1;
        v21 = &v13[2 * v20];
        v21[4] = v15;
        v21[5] = v17;
      }
      else
      {
        swift_bridgeObjectRelease();
      }
      v12 += 2;
      --v11;
    }
    while (v11);
    swift_bridgeObjectRelease_n();
  }
  else
  {
    swift_bridgeObjectRelease();
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v22 = MEMORY[0x1E0DEE9D8];
  v23 = v13[2];
  if (v23)
  {
    v53 = MEMORY[0x1E0DEE9D8];
    sub_1CAEF9A3C(0, v23, 0);
    v24 = v53;
    v25 = v13 + 5;
    while (1)
    {
      v26 = objc_allocWithZone(MEMORY[0x1E0C97398]);
      swift_bridgeObjectRetain();
      v27 = (void *)sub_1CAF203DC();
      v28 = objc_msgSend(v26, sel_initWithStringValue_, v27);

      if (!v28)
        break;
      v29 = objc_msgSend(v28, sel_fullyQualifiedDigits);
      if (!v29)
        break;
      v30 = v29;
      v31 = sub_1CAF20400();
      v33 = v32;

      v57 = MEMORY[0x1E0DEA968];
      if (!v33)
        goto LABEL_26;
LABEL_27:
      swift_bridgeObjectRelease();

      *(_QWORD *)&v56 = v31;
      *((_QWORD *)&v56 + 1) = v33;
      v53 = v24;
      v36 = *(_QWORD *)(v24 + 16);
      v35 = *(_QWORD *)(v24 + 24);
      if (v36 >= v35 >> 1)
      {
        sub_1CAEF9A3C(v35 > 1, v36 + 1, 1);
        v24 = v53;
      }
      v25 += 2;
      *(_QWORD *)(v24 + 16) = v36 + 1;
      sub_1CAEEBF2C(&v56, (_OWORD *)(v24 + 32 * v36 + 32));
      if (!--v23)
      {
        swift_bridgeObjectRelease();
        v22 = MEMORY[0x1E0DEE9D8];
        goto LABEL_32;
      }
    }
    v57 = MEMORY[0x1E0DEA968];
LABEL_26:
    v31 = sub_1CAF20448();
    v33 = v34;
    goto LABEL_27;
  }
  swift_bridgeObjectRelease();
LABEL_32:
  v37 = objc_allocWithZone(MEMORY[0x1E0C99E40]);
  v38 = (void *)sub_1CAF205A4();
  swift_bridgeObjectRelease();
  v39 = objc_msgSend(v37, sel_initWithArray_, v38);

  v40 = objc_msgSend(v39, sel_array);
  v41 = sub_1CAF205B0();

  v42 = *(_QWORD *)(v41 + 16);
  if (v42)
  {
    v52 = (uint64_t *)v39;
    v55 = v22;
    sub_1CAEF9A58(0, v42, 0);
    v51[1] = v41;
    v43 = v41 + 32;
    v44 = v55;
    do
    {
      sub_1CAEDCD8C(v43, (uint64_t)&v56);
      v53 = 0;
      v54 = 0xE000000000000000;
      sub_1CAF208A4();
      v45 = v53;
      v46 = v54;
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v56);
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      {
        sub_1CAEF9A58(0, *(_QWORD *)(v44 + 16) + 1, 1);
        v44 = v55;
      }
      v48 = *(_QWORD *)(v44 + 16);
      v47 = *(_QWORD *)(v44 + 24);
      if (v48 >= v47 >> 1)
      {
        sub_1CAEF9A58(v47 > 1, v48 + 1, 1);
        v44 = v55;
      }
      *(_QWORD *)(v44 + 16) = v48 + 1;
      v49 = v44 + 16 * v48;
      *(_QWORD *)(v49 + 32) = v45;
      *(_QWORD *)(v49 + 40) = v46;
      v43 += 32;
      --v42;
    }
    while (v42);
    swift_bridgeObjectRelease();

  }
  else
  {
    swift_bridgeObjectRelease();

    return MEMORY[0x1E0DEE9D8];
  }
  return v44;
}

_QWORD *FAFamilyMember.allKnownHandles.getter()
{
  void *v0;
  _QWORD *v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  _QWORD *v12;

  v1 = (_QWORD *)FAFamilyMember.normalizedPhoneNumbers.getter();
  v2 = objc_msgSend(v0, sel_appleID);
  if (v2)
  {
    v3 = v2;
    v4 = sub_1CAF20400();
    v6 = v5;

    v7 = sub_1CAEF1B28(v4, v6);
    v9 = v8;
    swift_bridgeObjectRelease();
    if (v9)
    {
      if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
        v1 = sub_1CAEE58E4(0, v1[2] + 1, 1, v1);
      v11 = v1[2];
      v10 = v1[3];
      if (v11 >= v10 >> 1)
        v1 = sub_1CAEE58E4((_QWORD *)(v10 > 1), v11 + 1, 1, v1);
      v1[2] = v11 + 1;
      v12 = &v1[2 * v11];
      v12[4] = v7;
      v12[5] = v9;
    }
  }
  return v1;
}

uint64_t sub_1CAEFC8DC()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t FAFamilyMember.messageEnabledHandles.getter()
{
  void *v0;
  void *v1;
  unint64_t *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v12;

  v1 = v0;
  if (qword_1EF990DB8 != -1)
    swift_once();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914B8);
  sub_1CAF206E8();
  swift_release();
  if (v12)
  {
    v2 = sub_1CAEFD1C4(v12);
    swift_bridgeObjectRelease();
    v3 = sub_1CAEFB728((uint64_t)v2);
    swift_release();
  }
  else
  {
    if (qword_1ECFCE888 != -1)
      swift_once();
    v4 = sub_1CAF202E0();
    __swift_project_value_buffer(v4, (uint64_t)qword_1ECFCE8A8);
    v5 = v0;
    v6 = sub_1CAF202C8();
    v7 = sub_1CAF206AC();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v8 = 138412290;
      v10 = v5;
      sub_1CAF2076C();
      *v9 = v1;

      _os_log_impl(&dword_1CAEBA000, v6, v7, "FAFamilyMember never had IDS status loaded %@", v8, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991400);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v9, -1, -1);
      MEMORY[0x1D179A698](v8, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v3;
}

uint64_t FAFamilyMember.appleIdMessageEnabled.getter()
{
  void *v0;
  uint64_t result;
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;

  result = FAFamilyMember.messageEnabledHandles.getter();
  if (result)
  {
    v2 = (_QWORD *)result;
    v3 = objc_msgSend(v0, sel_appleID);
    if (!v3
      || (v4 = v3,
          v5 = sub_1CAF20400(),
          v7 = v6,
          v4,
          v8 = sub_1CAEF1B28(v5, v7),
          v10 = v9,
          swift_bridgeObjectRelease(),
          !v10))
    {
      swift_bridgeObjectRelease();
      v8 = 0;
      v10 = 0xE000000000000000;
    }
    v11 = sub_1CAEEEAAC(v8, v10, v2);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v11 & 1;
  }
  return result;
}

uint64_t FAFamilyMember.phoneMessageEnabled.getter()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char v4;

  v0 = (_QWORD *)FAFamilyMember.normalizedPhoneNumbers.getter();
  if (v0[2]
    && (v2 = v0[4],
        v1 = v0[5],
        swift_bridgeObjectRetain(),
        swift_bridgeObjectRelease(),
        (v3 = (_QWORD *)FAFamilyMember.messageEnabledHandles.getter()) != 0))
  {
    v4 = sub_1CAEEEAAC(v2, v1, v3);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    return v4 & 1;
  }
  else
  {
    swift_bridgeObjectRelease();
    return 0;
  }
}

BOOL FAFamilyMember.isTeen.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_memberType) == (id)1;
}

BOOL FAFamilyMember.isAdult.getter()
{
  void *v0;

  return objc_msgSend(v0, sel_memberType) == 0;
}

id FAFamilyMember.isTeenOrAdult.getter()
{
  void *v0;
  id result;

  result = objc_msgSend(v0, sel_memberType);
  if (result != (id)1)
    return (id)(objc_msgSend(v0, sel_memberType) == 0);
  return result;
}

uint64_t FAFamilyMember.idsStatus()()
{
  uint64_t v1;

  if (qword_1EF990DB8 != -1)
    swift_once();
  swift_allocObject();
  swift_unknownObjectWeakInit();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914B8);
  sub_1CAF206E8();
  swift_release();
  if (v1)
    return v1;
  else
    return MEMORY[0x1E0DEE9E0];
}

Swift::String __swiftcall FAFamilyMember.stableIdWithFallback(_:)(Swift::String a1)
{
  void *v1;
  void *v2;
  void *object;
  uint64_t countAndFlagsBits;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  Swift::String result;

  v2 = v1;
  object = a1._object;
  countAndFlagsBits = a1._countAndFlagsBits;
  v5 = objc_msgSend(v2, sel_dsid);
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, sel_integerValue);
    v7 = sub_1CAF2097C();
LABEL_5:
    countAndFlagsBits = v7;
    object = v8;

    goto LABEL_6;
  }
  v9 = objc_msgSend(v2, sel_altDSID);
  if (v9)
  {
    v6 = v9;
    v7 = sub_1CAF20400();
    goto LABEL_5;
  }
  v12 = objc_msgSend(v2, sel_appleID);
  if (v12)
  {
    v13 = v12;
    countAndFlagsBits = sub_1CAF20400();
    object = v14;

  }
  else
  {
    swift_bridgeObjectRetain();
  }
LABEL_6:
  v10 = countAndFlagsBits;
  v11 = object;
  result._object = v11;
  result._countAndFlagsBits = v10;
  return result;
}

uint64_t FAFamilyMember.attemptSignin()()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_1CAEFCF00()
{
  uint64_t *v0;
  _QWORD *v1;

  if (qword_1EF990D30 != -1)
    swift_once();
  v0[3] = qword_1EF9911B8;
  swift_retain();
  v1 = (_QWORD *)swift_task_alloc();
  v0[4] = (uint64_t)v1;
  *v1 = v0;
  v1[1] = sub_1CAEFCF8C;
  return sub_1CAEE9798(v0[2]);
}

uint64_t sub_1CAEFCF8C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 40) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_release();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAEFD000()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;

  swift_release();
  if (qword_1ECFCE888 != -1)
    swift_once();
  v1 = *(void **)(v0 + 40);
  v2 = sub_1CAF202E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ECFCE8A8);
  v3 = v1;
  sub_1CAF1C254(v1);

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t ACAccount.altDSID.getter()
{
  return sub_1CAEFD0E0((SEL *)&selRef_aa_altDSID);
}

uint64_t ACAccount.appleID.getter()
{
  return sub_1CAEFD0E0((SEL *)&selRef_appleID);
}

uint64_t ACAccount.normalizedDSID.getter()
{
  return sub_1CAEFD0E0((SEL *)&selRef_normalizedDSID);
}

uint64_t sub_1CAEFD0E0(SEL *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v2 = objc_msgSend(v1, *a1);
  if (!v2)
    return 0;
  v3 = v2;
  v4 = sub_1CAF20400();

  return v4;
}

uint64_t sub_1CAEFD140(uint64_t a1, uint64_t a2)
{
  return sub_1CAEFD164(a1, a2, (SEL *)&selRef_aa_altDSID);
}

uint64_t sub_1CAEFD14C(uint64_t a1, uint64_t a2)
{
  return sub_1CAEFD164(a1, a2, (SEL *)&selRef_appleID);
}

uint64_t sub_1CAEFD158(uint64_t a1, uint64_t a2)
{
  return sub_1CAEFD164(a1, a2, (SEL *)&selRef_normalizedDSID);
}

uint64_t sub_1CAEFD164(uint64_t a1, uint64_t a2, SEL *a3)
{
  id *v3;
  id v4;
  void *v5;
  uint64_t v6;

  v4 = objc_msgSend(*v3, *a3);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = sub_1CAF20400();

  return v6;
}

unint64_t *sub_1CAEFD1C4(uint64_t isStackAllocationSafe)
{
  uint64_t v1;
  unint64_t *v2;
  char v3;
  unint64_t v4;
  size_t v5;
  unint64_t *v6;
  void *v7;
  _QWORD v9[2];

  v2 = (unint64_t *)isStackAllocationSafe;
  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = *(_BYTE *)(isStackAllocationSafe + 32);
  v4 = (unint64_t)((1 << v3) + 63) >> 6;
  v5 = 8 * v4;
  if ((v3 & 0x3Fu) <= 0xD
    || (isStackAllocationSafe = swift_stdlib_isStackAllocationSafe(), (isStackAllocationSafe & 1) != 0))
  {
    MEMORY[0x1E0C80A78](isStackAllocationSafe);
    bzero((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0), v5);
    v6 = sub_1CAEFD314((_QWORD *)((char *)v9 - ((v5 + 15) & 0x3FFFFFFFFFFFFFF0)), v4, (uint64_t)v2);
    if (v1)
      swift_willThrow();
    else
      return v6;
  }
  else
  {
    v7 = (void *)swift_slowAlloc();
    bzero(v7, v5);
    v2 = sub_1CAEFD314((unint64_t *)v7, v4, (uint64_t)v2);
    MEMORY[0x1D179A698](v7, -1, -1);
  }
  return v2;
}

unint64_t *sub_1CAEFD314(unint64_t *result, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;

  v4 = 0;
  v5 = 0;
  v6 = a3 + 64;
  v7 = 1 << *(_BYTE *)(a3 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a3 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  while (1)
  {
    if (v9)
    {
      v11 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v12 = v11 | (v5 << 6);
      goto LABEL_5;
    }
    v13 = v5 + 1;
    if (__OFADD__(v5, 1))
    {
      __break(1u);
      goto LABEL_26;
    }
    if (v13 >= v10)
      return (unint64_t *)sub_1CAEFD460(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v13);
    ++v5;
    if (!v14)
    {
      v5 = v13 + 1;
      if (v13 + 1 >= v10)
        return (unint64_t *)sub_1CAEFD460(result, a2, v4, a3);
      v14 = *(_QWORD *)(v6 + 8 * v5);
      if (!v14)
      {
        v5 = v13 + 2;
        if (v13 + 2 >= v10)
          return (unint64_t *)sub_1CAEFD460(result, a2, v4, a3);
        v14 = *(_QWORD *)(v6 + 8 * v5);
        if (!v14)
          break;
      }
    }
LABEL_20:
    v9 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v5 << 6);
LABEL_5:
    if (*(_BYTE *)(*(_QWORD *)(a3 + 56) + v12) == 1)
    {
      *(unint64_t *)((char *)result + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      if (__OFADD__(v4++, 1))
      {
        __break(1u);
        return (unint64_t *)sub_1CAEFD460(result, a2, v4, a3);
      }
    }
  }
  v15 = v13 + 3;
  if (v15 >= v10)
    return (unint64_t *)sub_1CAEFD460(result, a2, v4, a3);
  v14 = *(_QWORD *)(v6 + 8 * v15);
  if (v14)
  {
    v5 = v15;
    goto LABEL_20;
  }
  while (1)
  {
    v5 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v5 >= v10)
      return (unint64_t *)sub_1CAEFD460(result, a2, v4, a3);
    v14 = *(_QWORD *)(v6 + 8 * v5);
    ++v15;
    if (v14)
      goto LABEL_20;
  }
LABEL_26:
  __break(1u);
  return result;
}

uint64_t sub_1CAEFD460(unint64_t *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v31;

  if (!a3)
    return MEMORY[0x1E0DEE9E0];
  v4 = a4;
  v5 = a3;
  if (*(_QWORD *)(a4 + 16) == a3)
  {
    swift_retain();
    return v4;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991250);
  result = sub_1CAF208EC();
  v8 = result;
  v31 = a2;
  if (a2 < 1)
    v9 = 0;
  else
    v9 = *a1;
  v10 = 0;
  v11 = result + 64;
  while (1)
  {
    if (v9)
    {
      v12 = __clz(__rbit64(v9));
      v9 &= v9 - 1;
      v13 = v12 | (v10 << 6);
    }
    else
    {
      v14 = v10 + 1;
      if (__OFADD__(v10, 1))
        goto LABEL_40;
      if (v14 >= v31)
        return v8;
      v15 = a1[v14];
      ++v10;
      if (!v15)
      {
        v10 = v14 + 1;
        if (v14 + 1 >= v31)
          return v8;
        v15 = a1[v10];
        if (!v15)
        {
          v10 = v14 + 2;
          if (v14 + 2 >= v31)
            return v8;
          v15 = a1[v10];
          if (!v15)
          {
            v16 = v14 + 3;
            if (v16 >= v31)
              return v8;
            v15 = a1[v16];
            if (!v15)
            {
              while (1)
              {
                v10 = v16 + 1;
                if (__OFADD__(v16, 1))
                  goto LABEL_41;
                if (v10 >= v31)
                  return v8;
                v15 = a1[v10];
                ++v16;
                if (v15)
                  goto LABEL_24;
              }
            }
            v10 = v16;
          }
        }
      }
LABEL_24:
      v9 = (v15 - 1) & v15;
      v13 = __clz(__rbit64(v15)) + (v10 << 6);
    }
    v17 = (uint64_t *)(*(_QWORD *)(v4 + 48) + 16 * v13);
    v19 = *v17;
    v18 = v17[1];
    v20 = *(_BYTE *)(*(_QWORD *)(v4 + 56) + v13);
    sub_1CAF20A18();
    swift_bridgeObjectRetain();
    sub_1CAF20490();
    result = sub_1CAF20A30();
    v21 = -1 << *(_BYTE *)(v8 + 32);
    v22 = result & ~v21;
    v23 = v22 >> 6;
    if (((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6))) != 0)
    {
      v24 = __clz(__rbit64((-1 << v22) & ~*(_QWORD *)(v11 + 8 * (v22 >> 6)))) | v22 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v21) >> 6;
      do
      {
        if (++v23 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_39;
        }
        v27 = v23 == v26;
        if (v23 == v26)
          v23 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v23);
      }
      while (v28 == -1);
      v24 = __clz(__rbit64(~v28)) + (v23 << 6);
    }
    *(_QWORD *)(v11 + ((v24 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v24;
    v29 = (_QWORD *)(*(_QWORD *)(v8 + 48) + 16 * v24);
    *v29 = v19;
    v29[1] = v18;
    *(_BYTE *)(*(_QWORD *)(v8 + 56) + v24) = v20;
    ++*(_QWORD *)(v8 + 16);
    if (__OFSUB__(v5--, 1))
      break;
    if (!v5)
      return v8;
  }
LABEL_39:
  __break(1u);
LABEL_40:
  __break(1u);
LABEL_41:
  __break(1u);
  return result;
}

uint64_t sub_1CAEFD704(uint64_t a1)
{
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;
  unsigned int v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t *v9;
  unint64_t v10;

  v1 = *(_QWORD *)(a1 + 64);
  if (v1)
  {
    v2 = 0;
    return __clz(__rbit64(v1)) + v2;
  }
  v5 = *(_BYTE *)(a1 + 32);
  v6 = v5 & 0x3F;
  v3 = 1 << v5;
  if (v6 < 7)
    return v3;
  v1 = *(_QWORD *)(a1 + 72);
  if (v1)
  {
    v2 = 64;
    return __clz(__rbit64(v1)) + v2;
  }
  v7 = (unint64_t)(v3 + 63) >> 6;
  if (v7 <= 2)
    v7 = 2;
  v8 = v7 - 2;
  v9 = (unint64_t *)(a1 + 80);
  v2 = 64;
  while (v8)
  {
    v10 = *v9++;
    v1 = v10;
    --v8;
    v2 += 64;
    if (v10)
      return __clz(__rbit64(v1)) + v2;
  }
  return v3;
}

id _sSo14FAFamilyMemberC12FamilyCircleE6makeMeyAbC23ACAccountProviderShadow_pSgFZ_0(uint64_t a1)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t inited;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  id result;
  void *v25;
  id v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  _UNKNOWN **v36;
  uint64_t v37[3];
  uint64_t v38;
  uint64_t v39;

  sub_1CAEFDC80(a1, (uint64_t)&v32);
  if (v33)
  {
    sub_1CAEDCE74(&v32, (uint64_t)&v34);
    if (*((_QWORD *)&v35 + 1))
    {
LABEL_3:
      sub_1CAEDCE74(&v34, (uint64_t)v37);
      v1 = v38;
      v2 = v39;
      __swift_project_boxed_opaque_existential_1(v37, v38);
      v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 24))(v1, v2);
      if (v4)
      {
        v5 = v3;
        v6 = v4;
        v7 = v38;
        v8 = v39;
        __swift_project_boxed_opaque_existential_1(v37, v38);
        v9 = (*(uint64_t (**)(uint64_t, uint64_t))(v8 + 8))(v7, v8);
        if (v10)
        {
          v11 = v9;
          v12 = v10;
          v13 = v38;
          v14 = v39;
          __swift_project_boxed_opaque_existential_1(v37, v38);
          v15 = (*(uint64_t (**)(uint64_t, uint64_t))(v14 + 16))(v13, v14);
          if (v16)
          {
            v17 = v15;
            v18 = v16;
            __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914D0);
            inited = swift_initStackObject();
            *(_OWORD *)(inited + 16) = xmmword_1CAF25CC0;
            strcpy((char *)&v34, "member-dsid");
            HIDWORD(v34) = -352321536;
            v20 = MEMORY[0x1E0DEA968];
            sub_1CAF207F0();
            *(_QWORD *)(inited + 96) = v20;
            *(_QWORD *)(inited + 72) = v5;
            *(_QWORD *)(inited + 80) = v6;
            strcpy((char *)&v34, "member-altDSID");
            HIBYTE(v34) = -18;
            sub_1CAF207F0();
            *(_QWORD *)(inited + 168) = v20;
            *(_QWORD *)(inited + 144) = v11;
            *(_QWORD *)(inited + 152) = v12;
            *(_QWORD *)&v34 = 0x612D7265626D656DLL;
            *((_QWORD *)&v34 + 1) = 0xEF64692D656C7070;
            sub_1CAF207F0();
            *(_QWORD *)(inited + 240) = v20;
            *(_QWORD *)(inited + 216) = v17;
            *(_QWORD *)(inited + 224) = v18;
            *(_QWORD *)&v34 = 0x656D2D7369;
            *((_QWORD *)&v34 + 1) = 0xE500000000000000;
            sub_1CAF207F0();
            *(_QWORD *)(inited + 312) = MEMORY[0x1E0DEAFA0];
            *(_BYTE *)(inited + 288) = 1;
            sub_1CAF0BBBC(inited);
            v21 = objc_allocWithZone((Class)FAFamilyMember);
            v22 = (void *)sub_1CAF20388();
            swift_bridgeObjectRelease();
            v23 = objc_msgSend(v21, sel_initWithDictionaryRepresentation_, v22);

            __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
            return v23;
          }
          swift_bridgeObjectRelease();
        }
        swift_bridgeObjectRelease();
      }
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v37);
LABEL_17:
      if (qword_1EF9904E0 != -1)
        swift_once();
      v27 = sub_1CAF202E0();
      __swift_project_value_buffer(v27, (uint64_t)qword_1EF9904C0);
      v28 = sub_1CAF202C8();
      v29 = sub_1CAF206AC();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        v31 = swift_slowAlloc();
        v37[0] = v31;
        *(_DWORD *)v30 = 136315138;
        *(_QWORD *)&v34 = sub_1CAEDBE5C(0x5F28654D656B616DLL, 0xEA0000000000293ALL, v37);
        sub_1CAF2076C();
        _os_log_impl(&dword_1CAEBA000, v28, v29, "%s Can't find apple account information!", v30, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v31, -1, -1);
        MEMORY[0x1D179A698](v30, -1, -1);
      }

      return objc_msgSend(objc_allocWithZone((Class)FAFamilyMember), sel_init);
    }
LABEL_13:
    sub_1CAEF5168((uint64_t)&v34, &qword_1EF991470);
    goto LABEL_17;
  }
  result = objc_msgSend((id)objc_opt_self(), sel_defaultStore);
  if (result)
  {
    v25 = result;
    v26 = objc_msgSend(result, sel_aa_primaryAppleAccount);

    if (v26)
    {
      *((_QWORD *)&v35 + 1) = sub_1CAEEBF3C(0, &qword_1EF9914D8);
      v36 = &protocol witness table for ACAccount;
      *(_QWORD *)&v34 = v26;
    }
    else
    {
      v36 = 0;
      v34 = 0u;
      v35 = 0u;
    }
    sub_1CAEF5168((uint64_t)&v32, &qword_1EF991470);
    if (*((_QWORD *)&v35 + 1))
      goto LABEL_3;
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

void sub_1CAEFDC48(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1CAEFBD1C(v1, a1);
}

uint64_t dispatch thunk of ACAccountProviderShadow.altDSID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of ACAccountProviderShadow.appleID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of ACAccountProviderShadow.normalizedDSID.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t sub_1CAEFDC78()
{
  return swift_release();
}

uint64_t sub_1CAEFDC80(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991470);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t static Tree.search<A, B>(root:children:where:)@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X1>, uint64_t (*a3)(uint64_t)@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, char *a6@<X8>)
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t AssociatedTypeWitness;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  char *v28;
  uint64_t v30;
  unsigned int (*v31)(char *, uint64_t, uint64_t);
  void (*v32)(char *, char *, uint64_t);
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;
  uint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  char *v41;
  uint64_t AssociatedConformanceWitness;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  uint64_t (*v47)(uint64_t);
  uint64_t v48;

  v47 = a3;
  v48 = a4;
  v41 = a6;
  v46 = a2;
  v8 = (uint64_t *)(*a2 + *MEMORY[0x1E0DEE2A8]);
  v9 = *v8;
  v40 = *(_QWORD *)(*v8 - 8);
  v10 = MEMORY[0x1E0C80A78](a1);
  v38 = (char *)&v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v37 - v12;
  v14 = sub_1CAF20754();
  v44 = *(_QWORD *)(v14 - 8);
  v45 = v14;
  v15 = MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v37 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v15);
  v20 = (char *)&v37 - v19;
  MEMORY[0x1E0C80A78](v18);
  v39 = (char *)&v37 - v21;
  AssociatedConformanceWitness = v22;
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v24 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v26 = (char *)&v37 - v25;
  v43 = a1;
  if ((v47(a1) & 1) != 0)
  {
    v27 = v40;
    v28 = v41;
    (*(void (**)(char *, uint64_t, uint64_t))(v40 + 16))(v41, v43, v9);
    return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v27 + 56))(v28, 0, 1, v9);
  }
  else
  {
    v37 = v24;
    swift_getAtKeyPath();
    sub_1CAF2052C();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v43 = AssociatedTypeWitness;
    sub_1CAF20760();
    v30 = v40;
    v31 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v40 + 48);
    if (v31(v20, 1, v9) == 1)
    {
LABEL_7:
      (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v43);
      return (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v30 + 56))(v41, 1, 1, v9);
    }
    else
    {
      v32 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
      while (1)
      {
        v32(v13, v20, v9);
        v33 = a5;
        static Tree.search<A, B>(root:children:where:)(v13, v46, v47, v48, a5);
        v34 = v30;
        (*(void (**)(char *, uint64_t))(v30 + 8))(v13, v9);
        if (v31(v17, 1, v9) != 1)
          break;
        (*(void (**)(char *, uint64_t))(v44 + 8))(v17, v45);
        sub_1CAF20760();
        a5 = v33;
        if (v31(v20, 1, v9) == 1)
          goto LABEL_7;
      }
      (*(void (**)(char *, uint64_t))(v37 + 8))(v26, v43);
      v35 = v38;
      v32(v38, v17, v9);
      v36 = v41;
      v32(v41, v35, v9);
      return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v34 + 56))(v36, 0, 1, v9);
    }
  }
}

BOOL static Tree.contains<A, B>(root:children:where:)(uint64_t a1, _QWORD *a2, uint64_t (*a3)(uint64_t), uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _BOOL8 v15;
  uint64_t v17;

  v10 = *(_QWORD *)(*a2 + *MEMORY[0x1E0DEE2A8]);
  v11 = sub_1CAF20754();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v17 - v13;
  static Tree.search<A, B>(root:children:where:)(a1, a2, a3, a4, a5, (char *)&v17 - v13);
  v15 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(v14, 1, v10) != 1;
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return v15;
}

BOOL static Tree.contains<A, B>(_:root:children:)(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  _QWORD v7[8];

  v5 = (_QWORD *)(*a3 + *MEMORY[0x1E0DEE2A8]);
  v7[2] = *v5;
  v7[3] = v5[1];
  v7[4] = a4;
  v7[5] = a5;
  v7[6] = a1;
  return static Tree.contains<A, B>(root:children:where:)(a2, a3, (uint64_t (*)(uint64_t))sub_1CAEFE19C, (uint64_t)v7, a5);
}

uint64_t sub_1CAEFE19C()
{
  return sub_1CAF203D0() & 1;
}

ValueMetadata *type metadata accessor for Tree()
{
  return &type metadata for Tree;
}

uint64_t static FamilyDate.isExpired(_:maxAge:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void (*v19)(char *, uint64_t);
  char v20;
  uint64_t v22;
  uint64_t v23;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914E0);
  v23 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CAF20178();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v10);
  v15 = (char *)&v22 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v22 - v16;
  sub_1CAF2016C();
  sub_1CAEFB19C(a1, (uint64_t)v7);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_1CAF2010C();
    sub_1CAEFE410((uint64_t)v7);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v9 + 32))(v12, v7, v8);
  }
  v18 = objc_msgSend((id)objc_opt_self(), sel_seconds);
  sub_1CAF1FF74();

  sub_1CAF1FF68();
  (*(void (**)(char *, uint64_t))(v23 + 8))(v4, v2);
  sub_1CAF2013C();
  v19 = *(void (**)(char *, uint64_t))(v9 + 8);
  v19(v12, v8);
  v20 = sub_1CAF20130();
  v19(v15, v8);
  v19(v17, v8);
  return v20 & 1;
}

uint64_t sub_1CAEFE410(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

ValueMetadata *type metadata accessor for FamilyDate()
{
  return &type metadata for FamilyDate;
}

uint64_t sub_1CAEFE460@<X0>(uint64_t *a1@<X8>)
{
  void *v1;
  uint64_t v3;
  __int128 v5;
  uint64_t v6;

  v3 = (uint64_t)v1 + OBJC_IVAR___FAFamilyFetchActivityScheduler____lazy_storage___scheduler;
  swift_beginAccess();
  sub_1CAF0166C(v3, (uint64_t)&v5);
  if (v6)
    return sub_1CAEDCE74(&v5, (uint64_t)a1);
  sub_1CAEF5168((uint64_t)&v5, &qword_1EF98FC60);
  sub_1CAEFE520(v1, a1);
  sub_1CAEEB17C((uint64_t)a1, (uint64_t)&v5);
  swift_beginAccess();
  sub_1CAF016B4((uint64_t)&v5, v3);
  return swift_endAccess();
}

id sub_1CAEFE520@<X0>(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  id result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unsigned __int8 v17;

  v17 = 9;
  if ((_s12FamilyCircle0A12FeatureFlagsO7enabledySbACFZ_0(&v17) & 1) != 0)
  {
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = a1;
    v5 = swift_allocObject();
    *(_QWORD *)(v5 + 16) = &unk_1EF991550;
    *(_QWORD *)(v5 + 24) = v4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFA8);
    v6 = swift_allocObject();
    *(_QWORD *)(v6 + 16) = &unk_1EF991558;
    *(_QWORD *)(v6 + 24) = v5;
    *(_WORD *)(v6 + 32) = 257;
    *(_OWORD *)(v6 + 40) = xmmword_1CAF25D50;
    *(_QWORD *)(v6 + 56) = 86400;
    *(_QWORD *)(v6 + 64) = 40;
    v7 = (void *)objc_opt_self();
    v8 = a1;
    swift_retain();
    v9 = objc_msgSend(v7, sel_sharedScheduler);
    v10 = __swift_instantiateConcreteTypeFromMangledName(qword_1EF98FE98);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = v9;
    *(_QWORD *)(v11 + 24) = v6;
    swift_release();
    result = (id)sub_1CAEDCE8C(&qword_1EF98FE90, qword_1EF98FE98, (uint64_t)&protocol conformance descriptor for SystemBackgroundTaskScheduler<A, B, C>);
    v13 = (uint64_t)result;
  }
  else
  {
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a1;
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = &unk_1EF991538;
    *(_QWORD *)(v15 + 24) = v14;
    type metadata accessor for FAFamilyFetchActivityProvider();
    v16 = swift_allocObject();
    *(_WORD *)(v16 + 32) = 257;
    *(_OWORD *)(v16 + 40) = xmmword_1CAF25D50;
    *(_QWORD *)(v16 + 56) = 86400;
    *(_QWORD *)(v16 + 64) = 40;
    *(_QWORD *)(v16 + 16) = &unk_1EF991540;
    *(_QWORD *)(v16 + 24) = v15;
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB0);
    v11 = swift_allocObject();
    *(_QWORD *)(v11 + 16) = 0;
    *(_QWORD *)(v11 + 24) = v16;
    v13 = sub_1CAEDCE8C(&qword_1EF98FDA8, &qword_1EF98FDB0, (uint64_t)&protocol conformance descriptor for XPCActivityScheduler<A>);
    result = a1;
  }
  a2[3] = v10;
  a2[4] = v13;
  *a2 = v11;
  return result;
}

uint64_t sub_1CAEFE778(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCEDC;
  v3[4] = a1;
  return swift_task_switch();
}

uint64_t sub_1CAEFE7D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = v0;
  return swift_task_switch();
}

uint64_t sub_1CAEFE7F0()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(void);
  uint64_t v9;

  if (qword_1ECFCE740 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  v0[5] = __swift_project_value_buffer(v1, (uint64_t)qword_1ECFCE720);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[3] = sub_1CAEDBE5C(0xD00000000000001BLL, 0x80000001CAF2B460, &v9);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "FAFamilyFetchActivityScheduler %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v8 = (uint64_t (*)(void))(**(int **)(v0[4] + OBJC_IVAR___FAFamilyFetchActivityScheduler_cacheLoadBlock)
                         + *(_QWORD *)(v0[4] + OBJC_IVAR___FAFamilyFetchActivityScheduler_cacheLoadBlock));
  v6 = (_QWORD *)swift_task_alloc();
  v0[6] = v6;
  *v6 = v0;
  v6[1] = sub_1CAEFE9A8;
  return v8();
}

uint64_t sub_1CAEFE9A8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEFEA04()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t (*v10)(void);
  uint64_t v11;

  v1 = v0[7];
  if (v1)
  {
    v2 = (_QWORD *)swift_task_alloc();
    v0[8] = v2;
    *v2 = v0;
    v2[1] = sub_1CAEFEBDC;
    v3 = v0[4];
    v2[5] = v1;
    v2[6] = v3;
    return swift_task_switch();
  }
  else
  {
    v5 = sub_1CAF202C8();
    v6 = sub_1CAF206A0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v11 = v8;
      *(_DWORD *)v7 = 136315138;
      v0[2] = sub_1CAEDBE5C(0xD00000000000001BLL, 0x80000001CAF2B460, &v11);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v5, v6, "FAFamilyFetchActivityScheduler %s failed to load from cache", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v8, -1, -1);
      MEMORY[0x1D179A698](v7, -1, -1);
    }

    v10 = (uint64_t (*)(void))(**(int **)(v0[4] + OBJC_IVAR___FAFamilyFetchActivityScheduler_familyCircleFetchBlock)
                            + *(_QWORD *)(v0[4] + OBJC_IVAR___FAFamilyFetchActivityScheduler_familyCircleFetchBlock));
    v9 = (_QWORD *)swift_task_alloc();
    v0[9] = v9;
    *v9 = v0;
    v9[1] = sub_1CAEFEC60;
    return v10();
  }
}

uint64_t sub_1CAEFEBDC()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEFEC30()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEFEC60()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEFECB4()
{
  uint64_t v0;

  FAFamilyFetchActivityScheduler.reschedule()();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id FAFamilyFetchActivityScheduler.__allocating_init(familyCircleFetchBlock:cacheLoadBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  objc_class *v4;
  id v9;
  id v10;

  v9 = objc_allocWithZone(v4);
  v10 = sub_1CAF0100C(a1, a2, a3, a4);
  swift_release();
  swift_release();
  return v10;
}

id FAFamilyFetchActivityScheduler.init(familyCircleFetchBlock:cacheLoadBlock:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v4;

  v4 = sub_1CAF0100C(a1, a2, a3, a4);
  swift_release();
  swift_release();
  return v4;
}

uint64_t sub_1CAEFED98(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch();
}

uint64_t sub_1CAEFEDB0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;

  if (qword_1ECFCE740 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  *(_QWORD *)(v0 + 72) = __swift_project_value_buffer(v1, (uint64_t)qword_1ECFCE720);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 48) = sub_1CAEDBE5C(0xD00000000000002CLL, 0x80000001CAF2B4B0, &v9);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "FAFamilyFetchActivityScheduler %s fetching family circle", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v6;
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(v0 + 56);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v7;
  *v7 = v0;
  v7[1] = sub_1CAEFEF9C;
  return sub_1CAF209AC();
}

uint64_t sub_1CAEFEF9C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEFF008()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = sub_1CAF202C8();
  v2 = sub_1CAF206A0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v6 = v4;
    *(_DWORD *)v3 = 136315138;
    *(_QWORD *)(v0 + 40) = sub_1CAEDBE5C(0xD00000000000002CLL, 0x80000001CAF2B4B0, &v6);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v1, v2, "FAFamilyFetchActivityScheduler %s fetched family circle", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v4, -1, -1);
    MEMORY[0x1D179A698](v3, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEFF144()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  v1 = *(void **)(v0 + 96);
  swift_task_dealloc();
  v2 = v1;
  v3 = v1;
  v4 = sub_1CAF202C8();
  v5 = sub_1CAF206AC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 96);
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v14 = v8;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v0 + 16) = sub_1CAEDBE5C(0xD00000000000002CLL, 0x80000001CAF2B4B0, &v14);
    sub_1CAF2076C();
    *(_WORD *)(v7 + 12) = 2080;
    *(_QWORD *)(v0 + 24) = v6;
    v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    v10 = sub_1CAF2043C();
    *(_QWORD *)(v0 + 32) = sub_1CAEDBE5C(v10, v11, &v14);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1CAEBA000, v4, v5, "FAFamilyFetchActivityScheduler %s error fetching circle: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v8, -1, -1);
    MEMORY[0x1D179A698](v7, -1, -1);

  }
  else
  {
    v12 = *(void **)(v0 + 96);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAEFF334(void *a1)
{
  id v1;

  if (a1)
  {
    v1 = a1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991588);
    return sub_1CAF205F8();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991588);
    return sub_1CAF20604();
  }
}

uint64_t sub_1CAEFF394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 56) = a1;
  *(_QWORD *)(v2 + 64) = a2;
  return swift_task_switch();
}

uint64_t sub_1CAEFF3AC()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v9;

  if (qword_1ECFCE740 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  *(_QWORD *)(v0 + 72) = __swift_project_value_buffer(v1, (uint64_t)qword_1ECFCE720);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 48) = sub_1CAEDBE5C(0xD00000000000002CLL, 0x80000001CAF2B4B0, &v9);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "FAFamilyFetchActivityScheduler %s fetching cached circle", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v6 = swift_task_alloc();
  *(_QWORD *)(v0 + 80) = v6;
  *(_OWORD *)(v6 + 16) = *(_OWORD *)(v0 + 56);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 88) = v7;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFCE788);
  *v7 = v0;
  v7[1] = sub_1CAEFF5A8;
  return sub_1CAF209AC();
}

uint64_t sub_1CAEFF5A8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 96) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEFF614()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1CAEFF61C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v14;

  v1 = *(void **)(v0 + 96);
  swift_task_dealloc();
  v2 = v1;
  v3 = v1;
  v4 = sub_1CAF202C8();
  v5 = sub_1CAF206AC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 96);
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    v14 = v8;
    *(_DWORD *)v7 = 136315394;
    *(_QWORD *)(v0 + 24) = sub_1CAEDBE5C(0xD00000000000002CLL, 0x80000001CAF2B4B0, &v14);
    sub_1CAF2076C();
    *(_WORD *)(v7 + 12) = 2080;
    *(_QWORD *)(v0 + 32) = v6;
    v9 = v6;
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    v10 = sub_1CAF2043C();
    *(_QWORD *)(v0 + 40) = sub_1CAEDBE5C(v10, v11, &v14);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1CAEBA000, v4, v5, "FAFamilyFetchActivityScheduler %s error fetching cache: %s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v8, -1, -1);
    MEMORY[0x1D179A698](v7, -1, -1);

  }
  else
  {
    v12 = *(void **)(v0 + 96);

  }
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1CAEFF810(uint64_t a1, void (*a2)(uint64_t, uint64_t), uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v9 = __swift_instantiateConcreteTypeFromMangledName(a4);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](v9);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v9);
  v12 = (*(unsigned __int8 *)(v10 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v13 = swift_allocObject();
  (*(void (**)(unint64_t, char *, uint64_t))(v10 + 32))(v13 + v12, (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), v9);
  a2(a6, v13);
  return swift_release();
}

uint64_t sub_1CAEFF8F8(void *a1, void *a2)
{
  id v2;
  id v4;

  if (a2)
  {
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFCE770);
    return sub_1CAF205F8();
  }
  else
  {
    v4 = a1;
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFCE770);
    return sub_1CAF20604();
  }
}

uint64_t sub_1CAEFFA10(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v6;
  void (*v7)(uint64_t, void *);
  _QWORD v9[6];

  v9[4] = a1;
  v9[5] = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 1107296256;
  v9[2] = a4;
  v9[3] = a5;
  v6 = _Block_copy(v9);
  v7 = *(void (**)(uint64_t, void *))(a3 + 16);
  swift_retain();
  v7(a3, v6);
  _Block_release(v6);
  return swift_release();
}

void sub_1CAEFFA94(uint64_t a1, void *a2, void *a3)
{
  void (*v5)(void *, void *);
  id v6;
  id v7;

  v5 = *(void (**)(void *, void *))(a1 + 32);
  swift_retain();
  v7 = a2;
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

Swift::Void __swiftcall FAFamilyFetchActivityScheduler.reschedule()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  int v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)v13 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1CAF20658();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  v6 = (_QWORD *)swift_allocObject();
  v6[2] = 0;
  v6[3] = 0;
  v6[4] = v0;
  v7 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4);
  v8 = v0;
  if (v7 == 1)
  {
    sub_1CAEF5168((uint64_t)v3, &qword_1ECFCE7A0);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_1CAF2064C();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v3, v4);
    if (v6[2])
    {
      swift_getObjectType();
      swift_unknownObjectRetain();
      v9 = sub_1CAF205EC();
      v10 = v11;
      swift_unknownObjectRelease();
    }
    else
    {
      v9 = 0;
      v10 = 0;
    }
  }
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = &unk_1EF9914F0;
  *(_QWORD *)(v12 + 24) = v6;
  if (v10 | v9)
  {
    v13[0] = 0;
    v13[1] = 0;
    v13[2] = v9;
    v13[3] = v10;
  }
  swift_task_create();
  swift_release();
}

uint64_t sub_1CAEFFCD8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v6;

  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v6;
  *v6 = v4;
  v6[1] = sub_1CAEDCEDC;
  v6[45] = a4;
  return swift_task_switch();
}

uint64_t sub_1CAEFFD38()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 360) = v0;
  return swift_task_switch();
}

uint64_t sub_1CAEFFD50()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(void);
  uint64_t v9;

  if (qword_1ECFCE740 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  v0[46] = __swift_project_value_buffer(v1, (uint64_t)qword_1ECFCE720);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[44] = sub_1CAEDBE5C(0xD00000000000001ALL, 0x80000001CAF2B440, &v9);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "FAFamilyFetchActivityScheduler %s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v8 = (uint64_t (*)(void))(**(int **)(v0[45] + OBJC_IVAR___FAFamilyFetchActivityScheduler_cacheLoadBlock)
                         + *(_QWORD *)(v0[45] + OBJC_IVAR___FAFamilyFetchActivityScheduler_cacheLoadBlock));
  v6 = (_QWORD *)swift_task_alloc();
  v0[47] = v6;
  *v6 = v0;
  v6[1] = sub_1CAEFFF08;
  return v8();
}

uint64_t sub_1CAEFFF08(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 384) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAEFFF64()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t AssociatedConformanceWitness;
  void (*v8)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t *, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  NSObject *v39;
  os_log_type_t v40;
  uint8_t *v41;
  uint64_t v42;
  NSObject *v43;
  os_log_type_t v44;
  uint8_t *v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  char v49;
  char v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  _QWORD v53[5];
  uint64_t v54;
  _QWORD v55[5];
  _QWORD v56[5];
  uint64_t v57[4];
  uint64_t v58;

  v1 = *(void **)(v0 + 384);
  if (v1)
  {
    v2 = sub_1CAF01328(v1);
    if (v2 < 1)
    {
      v43 = sub_1CAF202C8();
      v44 = sub_1CAF206A0();
      if (os_log_type_enabled(v43, v44))
      {
        v45 = (uint8_t *)swift_slowAlloc();
        v46 = swift_slowAlloc();
        v57[0] = v46;
        *(_DWORD *)v45 = 136315138;
        *(_QWORD *)(v0 + 336) = sub_1CAEDBE5C(0xD00000000000001ALL, 0x80000001CAF2B440, v57);
        sub_1CAF2076C();
        _os_log_impl(&dword_1CAEBA000, v43, v44, "FAFamilyFetchActivityScheduler %s cacheDuration has expired. Triggering fetch now", v45, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v46, -1, -1);
        MEMORY[0x1D179A698](v45, -1, -1);
      }

      v47 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 408) = v47;
      *v47 = v0;
      v47[1] = sub_1CAF0077C;
      v47[4] = *(_QWORD *)(v0 + 360);
      return swift_task_switch();
    }
    else
    {
      v51 = v2;
      sub_1CAEFE460((uint64_t *)(v0 + 96));
      v3 = *(_QWORD *)(v0 + 128);
      v4 = *(_QWORD *)(v0 + 120);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 96), v4);
      (*(void (**)(uint64_t, uint64_t))(v3 + 24))(v4, v3);
      sub_1CAEFE460((uint64_t *)(v0 + 136));
      v6 = *(_QWORD *)(v0 + 160);
      v5 = *(_QWORD *)(v0 + 168);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 136), v6);
      (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v6, v5);
      swift_getAssociatedTypeWitness();
      AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
      v8 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
      v9 = swift_checkMetadataState();
      v8(v53, v9, AssociatedConformanceWitness);
      swift_unknownObjectRelease();
      v50 = v53[0];
      sub_1CAEFE460((uint64_t *)(v0 + 176));
      v10 = *(_QWORD *)(v0 + 200);
      v11 = *(_QWORD *)(v0 + 208);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 176), v10);
      (*(void (**)(uint64_t, uint64_t))(v11 + 24))(v10, v11);
      swift_getAssociatedTypeWitness();
      v12 = swift_getAssociatedConformanceWitness();
      v13 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v12 + 24);
      v14 = swift_checkMetadataState();
      v13(&v54, v14, v12);
      swift_unknownObjectRelease();
      v49 = BYTE1(v54);
      sub_1CAEFE460((uint64_t *)(v0 + 216));
      v15 = *(_QWORD *)(v0 + 240);
      v16 = *(_QWORD *)(v0 + 248);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 216), v15);
      (*(void (**)(uint64_t, uint64_t))(v16 + 24))(v15, v16);
      swift_getAssociatedTypeWitness();
      v17 = swift_getAssociatedConformanceWitness();
      v18 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v17 + 24);
      v19 = swift_checkMetadataState();
      v18(v55, v19, v17);
      swift_unknownObjectRelease();
      v48 = v55[1];
      sub_1CAEFE460((uint64_t *)(v0 + 16));
      v20 = *(_QWORD *)(v0 + 40);
      v21 = *(_QWORD *)(v0 + 48);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 16), v20);
      (*(void (**)(uint64_t, uint64_t))(v21 + 24))(v20, v21);
      swift_getAssociatedTypeWitness();
      v22 = swift_getAssociatedConformanceWitness();
      v23 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v22 + 24);
      v24 = swift_checkMetadataState();
      v23(v56, v24, v22);
      swift_unknownObjectRelease();
      v25 = v56[2];
      sub_1CAEFE460((uint64_t *)(v0 + 56));
      v26 = *(_QWORD *)(v0 + 80);
      v27 = *(_QWORD *)(v0 + 88);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v26);
      (*(void (**)(uint64_t, uint64_t))(v27 + 24))(v26, v27);
      swift_getAssociatedTypeWitness();
      v28 = swift_getAssociatedConformanceWitness();
      v29 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v28 + 24);
      v30 = swift_checkMetadataState();
      v29(v57, v30, v28);
      swift_unknownObjectRelease();
      v31 = v58;
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 16);
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 216);
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 176);
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
      LOBYTE(v57[0]) = v50;
      BYTE1(v57[0]) = v49;
      v57[1] = v48;
      v57[2] = v25;
      v57[3] = v51;
      v58 = v31;
      swift_getAssociatedTypeWitness();
      v32 = swift_getAssociatedConformanceWitness();
      v33 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v32 + 32);
      v34 = swift_checkMetadataState();
      v33(v57, v34, v32);
      swift_unknownObjectRelease();
      __swift_destroy_boxed_opaque_existential_1Tm(v0 + 96);
      sub_1CAEFE460((uint64_t *)(v0 + 256));
      v35 = *(_QWORD *)(v0 + 280);
      v36 = *(_QWORD *)(v0 + 288);
      __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 256), v35);
      v52 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v36 + 32) + *(_QWORD *)(v36 + 32));
      v37 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 392) = v37;
      *v37 = v0;
      v37[1] = sub_1CAF006DC;
      return v52(v35, v36);
    }
  }
  else
  {
    v39 = sub_1CAF202C8();
    v40 = sub_1CAF206A0();
    if (os_log_type_enabled(v39, v40))
    {
      v41 = (uint8_t *)swift_slowAlloc();
      v42 = swift_slowAlloc();
      v57[0] = v42;
      *(_DWORD *)v41 = 136315138;
      *(_QWORD *)(v0 + 320) = sub_1CAEDBE5C(0xD00000000000001ALL, 0x80000001CAF2B440, v57);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v39, v40, "FAFamilyFetchActivityScheduler %s failed to load from cache", v41, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v42, -1, -1);
      MEMORY[0x1D179A698](v41, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1CAF006DC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 400) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF00740()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 256);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF0077C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF007D0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF00800()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  NSObject *v4;
  os_log_type_t v5;
  void *v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  void *v13;
  uint64_t v14;

  v1 = *(void **)(v0 + 400);
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 256);
  v2 = v1;
  v3 = v1;
  v4 = sub_1CAF202C8();
  v5 = sub_1CAF206AC();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = *(void **)(v0 + 400);
    v13 = *(void **)(v0 + 384);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v14 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_getErrorValue();
    v9 = sub_1CAF209DC();
    *(_QWORD *)(v0 + 344) = sub_1CAEDBE5C(v9, v10, &v14);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1CAEBA000, v4, v5, "FAFamilyFetchActivityScheduler failed to schedule task: %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v8, -1, -1);
    MEMORY[0x1D179A698](v7, -1, -1);

  }
  else
  {
    v11 = *(void **)(v0 + 400);

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF00A04(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 40) = a1;
  *(_QWORD *)(v2 + 48) = v1;
  return swift_task_switch();
}

uint64_t sub_1CAF00A1C()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v11;
  uint64_t (*v12)(void);
  uint64_t v13;

  if (qword_1ECFCE740 != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  *(_QWORD *)(v0 + 56) = __swift_project_value_buffer(v1, (uint64_t)qword_1ECFCE720);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v13 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 32) = sub_1CAEDBE5C(0xD000000000000020, 0x80000001CAF2B480, &v13);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "FAFamilyFetchActivityScheduler %s", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  if ((objc_msgSend(*(id *)(v0 + 40), sel_isFamilyCircleFresh) & 1) != 0)
  {
    v6 = sub_1CAF202C8();
    v7 = sub_1CAF206A0();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v13 = v9;
      *(_DWORD *)v8 = 136315138;
      *(_QWORD *)(v0 + 24) = sub_1CAEDBE5C(0xD000000000000020, 0x80000001CAF2B480, &v13);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v6, v7, "FAFamilyFetchActivityScheduler %s cache is fresh... defering", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v9, -1, -1);
      MEMORY[0x1D179A698](v8, -1, -1);
    }

    FAFamilyFetchActivityScheduler.reschedule()();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)(v0 + 48)
                                       + OBJC_IVAR___FAFamilyFetchActivityScheduler_familyCircleFetchBlock)
                            + *(_QWORD *)(*(_QWORD *)(v0 + 48)
                                        + OBJC_IVAR___FAFamilyFetchActivityScheduler_familyCircleFetchBlock));
    v11 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 64) = v11;
    *v11 = v0;
    v11[1] = sub_1CAF00D14;
    return v12();
  }
}

uint64_t sub_1CAF00D14()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF00D68()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;
  uint64_t v4;
  uint64_t v6;

  v1 = sub_1CAF202C8();
  v2 = sub_1CAF206A0();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    v4 = swift_slowAlloc();
    v6 = v4;
    *(_DWORD *)v3 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_1CAEDBE5C(0xD000000000000020, 0x80000001CAF2B480, &v6);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v1, v2, "FAFamilyFetchActivityScheduler %s family fetch completed", v3, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v4, -1, -1);
    MEMORY[0x1D179A698](v3, -1, -1);
  }

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id FAFamilyFetchActivityScheduler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FAFamilyFetchActivityScheduler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FAFamilyFetchActivityScheduler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CAF00FA8(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CAF01B10;
  return v6(a1);
}

id sub_1CAF0100C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  char *v4;
  objc_class *ObjectType;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  objc_super v22;

  ObjectType = (objc_class *)swift_getObjectType();
  v10 = &v4[OBJC_IVAR___FAFamilyFetchActivityScheduler____lazy_storage___scheduler];
  *(_OWORD *)v10 = 0u;
  *((_OWORD *)v10 + 1) = 0u;
  *((_QWORD *)v10 + 4) = 0;
  v11 = qword_1ECFCE740;
  v12 = v4;
  if (v11 != -1)
    swift_once();
  v13 = sub_1CAF202E0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ECFCE720);
  v14 = sub_1CAF202C8();
  v15 = sub_1CAF20694();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v16 = 0;
    _os_log_impl(&dword_1CAEBA000, v14, v15, "FAFamilyFetchActivityScheduler Launching FAFamilyFetchActivityScheduler", v16, 2u);
    MEMORY[0x1D179A698](v16, -1, -1);
  }

  v17 = swift_allocObject();
  *(_QWORD *)(v17 + 16) = a1;
  *(_QWORD *)(v17 + 24) = a2;
  v18 = &v12[OBJC_IVAR___FAFamilyFetchActivityScheduler_familyCircleFetchBlock];
  *(_QWORD *)v18 = &unk_1EF991570;
  *((_QWORD *)v18 + 1) = v17;
  v19 = swift_allocObject();
  *(_QWORD *)(v19 + 16) = a3;
  *(_QWORD *)(v19 + 24) = a4;
  v20 = &v12[OBJC_IVAR___FAFamilyFetchActivityScheduler_cacheLoadBlock];
  *(_QWORD *)v20 = &unk_1EF991580;
  *((_QWORD *)v20 + 1) = v19;
  swift_retain();
  swift_retain();

  v22.receiver = v12;
  v22.super_class = ObjectType;
  return objc_msgSendSuper2(&v22, sel_init);
}

uint64_t sub_1CAF011BC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1CAF011E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCEDC;
  v4 = (_QWORD *)swift_task_alloc();
  v3[2] = v4;
  *v4 = v3;
  v4[1] = sub_1CAEDCEDC;
  v4[45] = v2;
  return swift_task_switch();
}

uint64_t type metadata accessor for FAFamilyFetchActivityScheduler()
{
  return objc_opt_self();
}

uint64_t method lookup function for FAFamilyFetchActivityScheduler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FAFamilyFetchActivityScheduler.__allocating_init(familyCircleFetchBlock:cacheLoadBlock:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 104))();
}

uint64_t sub_1CAF0129C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CAEFFA10(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)sub_1CAEE8E10, (uint64_t)&block_descriptor_14);
}

uint64_t sub_1CAF012C4()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1CAF012E8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1CAEFFA10(a1, a2, *(_QWORD *)(v2 + 16), (uint64_t)sub_1CAEFFA94, (uint64_t)&block_descriptor_3);
}

uint64_t block_copy_helper_3(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_3()
{
  return swift_release();
}

uint64_t sub_1CAF01328(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  os_log_type_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  double v20;
  double v21;
  uint64_t result;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v2 = sub_1CAF20178();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1ECFCE740 != -1)
    swift_once();
  v6 = sub_1CAF202E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ECFCE720);
  v7 = a1;
  v8 = sub_1CAF202C8();
  v9 = sub_1CAF206A0();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = swift_slowAlloc();
    v24 = v3;
    v11 = v10;
    v23 = swift_slowAlloc();
    v26 = v23;
    *(_DWORD *)v11 = 136315650;
    v25 = sub_1CAEDBE5C(0x6C61767265746E69, 0xEF293A6D6F726628, &v26);
    sub_1CAF2076C();
    *(_WORD *)(v11 + 12) = 2048;
    objc_msgSend(v7, sel_maxAge);
    v25 = v12;
    sub_1CAF2076C();
    *(_WORD *)(v11 + 22) = 2080;
    v13 = objc_msgSend(v7, sel_cacheDate);
    sub_1CAF20160();

    sub_1CAF018A4();
    v14 = sub_1CAF2097C();
    v16 = v15;
    (*(void (**)(char *, uint64_t))(v24 + 8))(v5, v2);
    v25 = sub_1CAEDBE5C(v14, v16, &v26);
    sub_1CAF2076C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CAEBA000, v8, v9, "FAFamilyFetchActivityScheduler %s maxAge: %f cacheDate: %s", (uint8_t *)v11, 0x20u);
    v17 = v23;
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v17, -1, -1);
    v18 = v11;
    v3 = v24;
    MEMORY[0x1D179A698](v18, -1, -1);

  }
  else
  {

  }
  v19 = objc_msgSend(v7, sel_expiration);
  sub_1CAF20160();

  sub_1CAF20148();
  v21 = v20;
  result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  if ((~*(_QWORD *)&v21 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_11;
  }
  if (v21 <= -9.22337204e18)
  {
LABEL_11:
    __break(1u);
    goto LABEL_12;
  }
  if (v21 < 9.22337204e18)
    return (uint64_t)v21;
LABEL_12:
  __break(1u);
  return result;
}

uint64_t sub_1CAF0166C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FC60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CAF016B4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FC60);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CAF016FC()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CAF01720()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCEDC;
  return sub_1CAEFE778(v2);
}

uint64_t sub_1CAF0176C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF01790()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCEDC;
  return ((uint64_t (*)(int *))((char *)&dword_1EF991740 + dword_1EF991740))(v2);
}

uint64_t sub_1CAF017F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCEDC;
  return sub_1CAEFE778(v2);
}

uint64_t sub_1CAF01840()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;

  v2 = *(int **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCC10;
  return ((uint64_t (*)(int *))((char *)&dword_1EF991740 + dword_1EF991740))(v2);
}

unint64_t sub_1CAF018A4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF990400;
  if (!qword_1EF990400)
  {
    v1 = sub_1CAF20178();
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0CB08F0], v1);
    atomic_store(result, (unint64_t *)&qword_1EF990400);
  }
  return result;
}

uint64_t sub_1CAF018EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1CAEDCC10;
  *(_OWORD *)(v2 + 56) = v3;
  return swift_task_switch();
}

uint64_t sub_1CAF0194C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;

  v2 = swift_task_alloc();
  v3 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1CAEEB5B0;
  *(_OWORD *)(v2 + 56) = v3;
  return swift_task_switch();
}

uint64_t sub_1CAF019AC(uint64_t a1)
{
  uint64_t v1;

  return sub_1CAEFF810(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), (uint64_t *)&unk_1ECFCE770, (uint64_t)&unk_1E8563780, (uint64_t)sub_1CAF019E8);
}

uint64_t sub_1CAF019DC()
{
  return objectdestroy_54Tm((uint64_t *)&unk_1ECFCE770);
}

uint64_t sub_1CAF019E8(void *a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ECFCE770);
  return sub_1CAEFF8F8(a1, a2);
}

uint64_t sub_1CAF01A38(uint64_t a1)
{
  uint64_t v1;

  return sub_1CAEFF810(a1, *(void (**)(uint64_t, uint64_t))(v1 + 16), *(_QWORD *)(v1 + 24), &qword_1EF991588, (uint64_t)&unk_1E85637A8, (uint64_t)sub_1CAF01AD0);
}

uint64_t sub_1CAF01A68()
{
  return objectdestroy_54Tm(&qword_1EF991588);
}

uint64_t objectdestroy_54Tm(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(a1);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1+ ((*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v2 - 8) + 80)), v2);
  return swift_deallocObject();
}

uint64_t sub_1CAF01AD0(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991588);
  return sub_1CAEFF334(a1);
}

uint64_t SystemBackgroundTaskScheduler.__allocating_init(taskProvider:underlyingScheduler:requestFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = swift_allocObject();
  v7 = *(_QWORD *)v6;
  *(_QWORD *)(v6 + *(_QWORD *)(*(_QWORD *)v6 + 144)) = a1;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v7 + 96) - 8) + 32))(v6 + *(_QWORD *)(*(_QWORD *)v6 + 136), a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v7 + 88) - 8) + 32))(v6 + *(_QWORD *)(*(_QWORD *)v6 + 128), a2);
  return v6;
}

uint64_t sub_1CAF01BD0()
{
  uint64_t result;
  uint64_t v1;

  swift_getAssociatedTypeWitness();
  swift_unknownObjectRetain();
  if (swift_dynamicCast())
    return v1;
  swift_getObjectType();
  swift_getMetatypeMetadata();
  sub_1CAF20454();
  swift_getMetatypeMetadata();
  sub_1CAF20454();
  sub_1CAF207FC();
  swift_bridgeObjectRelease();
  sub_1CAF204A8();
  sub_1CAF204A8();
  sub_1CAF204A8();
  result = sub_1CAF208BC();
  __break(1u);
  return result;
}

uint64_t sub_1CAF01D40()
{
  void *v0;
  id v1;
  uint64_t v2;

  v1 = objc_msgSend(v0, sel_identifier);
  v2 = sub_1CAF20400();

  return v2;
}

id sub_1CAF01D94()
{
  void *v0;

  return objc_msgSend(v0, sel_priority);
}

id sub_1CAF01DA4(uint64_t a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setPriority_, a1);
}

id (*sub_1CAF01DB8(_QWORD *a1))(uint64_t a1)
{
  void *v1;

  a1[1] = v1;
  *a1 = objc_msgSend(v1, sel_priority);
  return sub_1CAF01DF8;
}

id sub_1CAF01DF8(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setPriority_, *(_QWORD *)a1);
}

id sub_1CAF01E0C()
{
  void *v0;

  return objc_msgSend(v0, sel_requiresNetworkConnectivity);
}

id sub_1CAF01E2C(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setRequiresNetworkConnectivity_, a1 & 1);
}

id (*sub_1CAF01E40(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_requiresNetworkConnectivity);
  return sub_1CAF01E80;
}

id sub_1CAF01E80(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setRequiresNetworkConnectivity_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF01E98()
{
  void *v0;

  return objc_msgSend(v0, sel_requiresBuddyComplete);
}

id sub_1CAF01EB8(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setRequiresBuddyComplete_, a1 & 1);
}

id (*sub_1CAF01ECC(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_requiresBuddyComplete);
  return sub_1CAF01F0C;
}

id sub_1CAF01F0C(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setRequiresBuddyComplete_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF01F24()
{
  void *v0;

  return objc_msgSend(v0, sel_requiresInexpensiveNetworkConnectivity);
}

id sub_1CAF01F44(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setRequiresInexpensiveNetworkConnectivity_, a1 & 1);
}

id (*sub_1CAF01F58(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_requiresInexpensiveNetworkConnectivity);
  return sub_1CAF01F98;
}

id sub_1CAF01F98(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setRequiresInexpensiveNetworkConnectivity_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF01FB0()
{
  void *v0;

  return objc_msgSend(v0, sel_resourceIntensive);
}

id sub_1CAF01FD0(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setResourceIntensive_, a1 & 1);
}

id (*sub_1CAF01FE4(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_resourceIntensive);
  return sub_1CAF02024;
}

id sub_1CAF02024(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setResourceIntensive_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF0203C()
{
  void *v0;

  return objc_msgSend(v0, sel_requiresExternalPower);
}

id sub_1CAF0205C(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setRequiresExternalPower_, a1 & 1);
}

id (*sub_1CAF02070(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_requiresExternalPower);
  return sub_1CAF020B0;
}

id sub_1CAF020B0(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setRequiresExternalPower_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF020C8()
{
  void *v0;

  return objc_msgSend(v0, sel_postInstall);
}

id sub_1CAF020E8(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setPostInstall_, a1 & 1);
}

id (*sub_1CAF020FC(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_postInstall);
  return sub_1CAF0213C;
}

id sub_1CAF0213C(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setPostInstall_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF02154()
{
  void *v0;

  return objc_msgSend(v0, sel_powerNap);
}

id sub_1CAF02174(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setPowerNap_, a1 & 1);
}

id (*sub_1CAF02188(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_powerNap);
  return sub_1CAF021C8;
}

id sub_1CAF021C8(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setPowerNap_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF021E0()
{
  void *v0;

  return objc_msgSend(v0, sel_shouldWakeDevice);
}

id sub_1CAF02200(char a1)
{
  void *v1;

  return objc_msgSend(v1, sel_setShouldWakeDevice_, a1 & 1);
}

id (*sub_1CAF02214(uint64_t a1))(uint64_t a1)
{
  void *v1;

  *(_QWORD *)a1 = v1;
  *(_BYTE *)(a1 + 8) = objc_msgSend(v1, sel_shouldWakeDevice);
  return sub_1CAF02254;
}

id sub_1CAF02254(uint64_t a1)
{
  return objc_msgSend(*(id *)a1, sel_setShouldWakeDevice_, *(unsigned __int8 *)(a1 + 8));
}

id sub_1CAF0226C()
{
  void *v0;

  return objc_msgSend(v0, sel_trySchedulingBefore);
}

id sub_1CAF0227C()
{
  void *v0;

  return objc_msgSend(v0, sel_setTrySchedulingBefore_);
}

id (*sub_1CAF0228C(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  uint64_t v3;

  a1[1] = v1;
  objc_msgSend(v1, sel_trySchedulingBefore);
  *a1 = v3;
  return sub_1CAF022CC;
}

id sub_1CAF022CC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setTrySchedulingBefore_, *(double *)a1);
}

id sub_1CAF022E4()
{
  void *v0;

  return objc_msgSend(v0, sel_scheduleAfter);
}

id sub_1CAF022F4()
{
  void *v0;

  return objc_msgSend(v0, sel_setScheduleAfter_);
}

id (*sub_1CAF02304(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  uint64_t v3;

  a1[1] = v1;
  objc_msgSend(v1, sel_scheduleAfter);
  *a1 = v3;
  return sub_1CAF02344;
}

id sub_1CAF02344(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setScheduleAfter_, *(double *)a1);
}

id sub_1CAF0235C()
{
  void *v0;

  return objc_msgSend(v0, sel_interval);
}

id sub_1CAF0236C()
{
  void *v0;

  return objc_msgSend(v0, sel_setInterval_);
}

id (*sub_1CAF0237C(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  uint64_t v3;

  a1[1] = v1;
  objc_msgSend(v1, sel_interval);
  *a1 = v3;
  return sub_1CAF023BC;
}

id sub_1CAF023BC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setInterval_, *(double *)a1);
}

id sub_1CAF023D4()
{
  void *v0;

  return objc_msgSend(v0, sel_minDurationBetweenInstances);
}

id sub_1CAF023E4()
{
  void *v0;

  return objc_msgSend(v0, sel_setMinDurationBetweenInstances_);
}

id (*sub_1CAF023F4(_QWORD *a1))(uint64_t a1)
{
  void *v1;
  uint64_t v3;

  a1[1] = v1;
  objc_msgSend(v1, sel_minDurationBetweenInstances);
  *a1 = v3;
  return sub_1CAF02434;
}

id sub_1CAF02434(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 8), sel_setMinDurationBetweenInstances_, *(double *)a1);
}

id SystemBackgroundRequestFactory.repeatingRequest(identifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1CAF02464(a1, a2, (Class *)0x1E0D00E50);
}

id SystemBackgroundRequestFactory.nonRepeatingRequest(identifier:)(uint64_t a1, uint64_t a2)
{
  return sub_1CAF02464(a1, a2, (Class *)0x1E0D00E40);
}

id sub_1CAF02464(uint64_t a1, uint64_t a2, Class *a3)
{
  id v3;
  void *v4;
  id v5;

  v3 = objc_allocWithZone(*a3);
  swift_bridgeObjectRetain();
  v4 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  v5 = objc_msgSend(v3, sel_initWithIdentifier_, v4);

  return v5;
}

id sub_1CAF024D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAF024F0(a1, a2, a3, a4, (Class *)0x1E0D00E50);
}

id sub_1CAF024E4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAF024F0(a1, a2, a3, a4, (Class *)0x1E0D00E40);
}

id sub_1CAF024F0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, Class *a5)
{
  id v5;
  void *v6;
  id v7;

  v5 = objc_allocWithZone(*a5);
  swift_bridgeObjectRetain();
  v6 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  v7 = objc_msgSend(v5, sel_initWithIdentifier_, v6);

  return v7;
}

id sub_1CAF02564(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void **v5;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  _QWORD v15[6];

  v9 = swift_allocObject();
  *(_QWORD *)(v9 + 16) = a4;
  *(_QWORD *)(v9 + 24) = a5;
  v10 = *v5;
  swift_retain();
  v11 = (void *)sub_1CAF203DC();
  v15[4] = sub_1CAF036EC;
  v15[5] = v9;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 1107296256;
  v15[2] = sub_1CAF0267C;
  v15[3] = &block_descriptor_4;
  v12 = _Block_copy(v15);
  swift_retain();
  v13 = objc_msgSend(v10, sel_registerForTaskWithIdentifier_usingQueue_launchHandler_, v11, a3, v12);

  _Block_release(v12);
  swift_release();
  swift_release();
  return v13;
}

void sub_1CAF0267C(uint64_t a1, void *a2)
{
  void (*v3)(void);
  id v4;

  v3 = *(void (**)(void))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3();
  swift_release();

}

id sub_1CAF026CC()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *v0;
  v2 = (void *)sub_1CAF203DC();
  v3 = objc_msgSend(v1, sel_taskRequestForIdentifier_, v2);

  return v3;
}

id sub_1CAF02718(uint64_t a1)
{
  return sub_1CAF02768(a1, (SEL *)&selRef_updateTaskRequest_error_);
}

id sub_1CAF02740(uint64_t a1)
{
  return sub_1CAF02768(a1, (SEL *)&selRef_submitTaskRequest_error_);
}

id sub_1CAF02768(uint64_t a1, SEL *a2)
{
  void *v2;
  id v4;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x1E0C80C00];
  v5[0] = 0;
  if (objc_msgSend(v2, *a2, a1, v5))
    return v5[0];
  v4 = v5[0];
  sub_1CAF20070();

  return (id)swift_willThrow();
}

id sub_1CAF0280C()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *v0;
  v2 = (void *)sub_1CAF203DC();
  v3 = objc_msgSend(v1, sel_deregisterTaskWithIdentifier_, v2);

  return v3;
}

uint64_t SystemBackgroundTaskScheduler.taskProvider.getter()
{
  sub_1CAF033F4();
  return swift_unknownObjectRetain();
}

uint64_t *SystemBackgroundTaskScheduler.init(taskProvider:underlyingScheduler:requestFactory:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v5;

  v5 = *v3;
  *(uint64_t *)((char *)v3 + *(_QWORD *)(*v3 + 144)) = a1;
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 96) - 8) + 32))((uint64_t)v3 + *(_QWORD *)(*v3 + 136), a3);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(*(_QWORD *)(v5 + 88) - 8) + 32))((uint64_t)v3 + *(_QWORD *)(*v3 + 128), a2);
  return v3;
}

uint64_t sub_1CAF028DC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t ObjectType;
  uint64_t (*v15)(uint64_t, uint64_t, double);
  uint64_t result;
  __n128 v17;
  uint64_t v18;
  BOOL v19;
  uint64_t v20;
  double v21;
  void (*v22)(uint64_t, uint64_t, double);
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint8_t *v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;

  (*(void (**)(uint64_t *__return_ptr, _QWORD))(*(_QWORD *)(*(_QWORD *)v2 + 104) + 24))(&v34, *(_QWORD *)(*(_QWORD *)v2 + 80));
  v5 = v34;
  v6 = BYTE1(v34);
  v8 = v35;
  v7 = v36;
  v9 = v37;
  v10 = v38;
  swift_getObjectType();
  if (v6 != 1)
  {
    result = swift_conformsToProtocol2();
    if (result)
      v12 = result;
    else
      v12 = 0;
    if (result)
      v18 = a1;
    else
      v18 = 0;
    if (v18)
    {
      v19 = __OFADD__(v8, v7);
      v20 = v8 + v7;
      if (!v19)
      {
        ObjectType = swift_getObjectType();
        v21 = (double)v20;
        v22 = *(void (**)(uint64_t, uint64_t, double))(v12 + 24);
        swift_unknownObjectRetain();
        v22(ObjectType, v12, v21);
        v17.n128_f64[0] = (double)v8;
        goto LABEL_20;
      }
LABEL_31:
      __break(1u);
      return result;
    }
LABEL_21:
    if (qword_1ECFCE888 != -1)
      swift_once();
    v23 = sub_1CAF202E0();
    __swift_project_value_buffer(v23, (uint64_t)qword_1ECFCE8A8);
    swift_unknownObjectRetain_n();
    v24 = sub_1CAF202C8();
    v25 = sub_1CAF206AC();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = (uint8_t *)swift_slowAlloc();
      v27 = swift_slowAlloc();
      *(_DWORD *)v26 = 136315138;
      v33 = v27;
      v34 = a1;
      v35 = a2;
      swift_unknownObjectRetain();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9915A8);
      v28 = sub_1CAF2043C();
      v34 = sub_1CAEDBE5C(v28, v29, &v33);
      sub_1CAF2076C();
      swift_unknownObjectRelease_n();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_1CAEBA000, v24, v25, "Invalid task type: %s", v26, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v27, -1, -1);
      MEMORY[0x1D179A698](v26, -1, -1);

    }
    else
    {

      swift_unknownObjectRelease_n();
    }
    goto LABEL_26;
  }
  v11 = swift_conformsToProtocol2();
  if (v11)
    v12 = v11;
  else
    v12 = 0;
  if (v11)
    v13 = a1;
  else
    v13 = 0;
  if (!v13)
    goto LABEL_21;
  ObjectType = swift_getObjectType();
  v15 = *(uint64_t (**)(uint64_t, uint64_t, double))(v12 + 24);
  swift_unknownObjectRetain();
  result = v15(ObjectType, v12, (double)v9);
  if (__OFSUB__(v9, v7))
  {
    __break(1u);
    goto LABEL_31;
  }
  v17.n128_f64[0] = (double)(v9 - v7);
LABEL_20:
  (*(void (**)(uint64_t, uint64_t, __n128))(v12 + 48))(ObjectType, v12, v17);
  swift_unknownObjectRelease();
LABEL_26:
  v30 = swift_getObjectType();
  if (v5)
    v31 = 1;
  else
    v31 = 2;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(a2 + 40))(v31, v30, a2);
  v32 = swift_getObjectType();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(a2 + 64))((v10 >> 3) & 1, v32, a2);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(a2 + 88))((v10 >> 11) & 1, v32, a2);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(a2 + 112))((v10 >> 4) & 1, v32, a2);
  (*(void (**)(BOOL, uint64_t, uint64_t))(a2 + 160))((v10 & 0x20) == 0, v32, a2);
  (*(void (**)(BOOL, uint64_t, uint64_t))(a2 + 136))((v10 & 0x1C0) != 0, v32, a2);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(a2 + 184))((v10 >> 10) & 1, v32, a2);
  (*(void (**)(unint64_t, uint64_t, uint64_t))(a2 + 208))(v10 & 1, v32, a2);
  return (*(uint64_t (**)(unint64_t, uint64_t, uint64_t))(a2 + 232))((v10 >> 1) & 1, v32, a2);
}

uint64_t sub_1CAF02C9C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, _QWORD, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t);

  v5 = *(_QWORD **)v2;
  v6 = *(_QWORD *)(v2 + *(_QWORD *)(*(_QWORD *)v2 + 144));
  v7 = (_QWORD *)swift_allocObject();
  v7[2] = v5[10];
  v8 = v5[11];
  v7[3] = v8;
  v7[4] = v5[12];
  v7[5] = v5[13];
  v9 = v5[14];
  v7[6] = v9;
  v7[7] = v5[15];
  v7[8] = v6;
  v10 = *(void (**)(uint64_t, uint64_t, _QWORD, uint64_t (*)(uint64_t), _QWORD *, uint64_t, uint64_t))(v9 + 40);
  swift_unknownObjectRetain();
  v10(a1, a2, 0, sub_1CAF03758, v7, v8, v9);
  return swift_release();
}

uint64_t sub_1CAF02D68()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  *(_QWORD *)(v1 + 32) = *v0;
  return swift_task_switch();
}

unint64_t sub_1CAF02D88()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t result;
  char v5;
  unint64_t v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t AssociatedConformanceWitness;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unsigned int v25;
  unsigned int v26;
  unsigned int v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 + 104);
  v3 = *(_QWORD *)(v1 + 80);
  result = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 48))(v3, v2);
  v29 = v3;
  if ((v5 & 1) != 0)
  {
LABEL_4:
    v6 = HIDWORD(result);
    if (HIDWORD(result))
    {
      __break(1u);
    }
    else
    {
      if (result >> 11 == 27)
        goto LABEL_27;
      LODWORD(v6) = WORD1(result);
      if (WORD1(result) <= 0x10u)
      {
        if ((result & 0xFFFFFF80) == 0)
        {
          if (result <= 0xFF)
          {
            v7 = (result + 1);
LABEL_10:
            *(_QWORD *)(v0 + 16) = (v7 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v7) >> 3)) & 7)));
            goto LABEL_11;
          }
          __break(1u);
LABEL_27:
          __break(1u);
          return result;
        }
LABEL_20:
        v24 = (result & 0x3F) << 8;
        v25 = (v24 | (result >> 6)) + 33217;
        v26 = (v24 | (result >> 6) & 0x3F) << 8;
        v27 = (((v26 | (result >> 12) & 0x3F) << 8) | (result >> 18)) - 2122219023;
        v28 = (v26 | (result >> 12)) + 8487393;
        if ((_DWORD)v6)
          v7 = v27;
        else
          v7 = v28;
        if (result < 0x800)
          v7 = v25;
        goto LABEL_10;
      }
    }
    __break(1u);
    goto LABEL_20;
  }
  if (!result)
  {
    __break(1u);
    goto LABEL_4;
  }
LABEL_11:
  v8 = sub_1CAF20478();
  v10 = v9;
  v11 = *(_QWORD *)(v0 + 32);
  sub_1CAF02C9C(v8, v9);
  v12 = *(_QWORD *)(v11 + 112);
  v13 = *(_QWORD *)(v11 + 88);
  v14 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v12 + 48))(v8, v10, v13, v12);
  if (v14)
  {
    v15 = v14;
    swift_bridgeObjectRelease();
    swift_getAssociatedTypeWitness();
    AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
    v17 = swift_unknownObjectRetain();
    sub_1CAF028DC(v17, AssociatedConformanceWitness);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 56))(v15, v13, v12);
    swift_unknownObjectRelease();
  }
  else
  {
    v18 = *(_QWORD *)(v0 + 32);
    (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v2 + 24))(&v30, v29, v2);
    v19 = *(_QWORD *)(v18 + 120);
    v20 = *(_QWORD *)(v18 + 96);
    if (BYTE1(v30) == 1)
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 40))(v8, v10, v20, v19);
    else
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v19 + 48))(v8, v10, v20, v19);
    swift_bridgeObjectRelease();
    swift_getAssociatedTypeWitness();
    swift_getAssociatedConformanceWitness();
    v21 = sub_1CAF01BD0();
    swift_unknownObjectRelease();
    swift_getAssociatedTypeWitness();
    v22 = swift_getAssociatedConformanceWitness();
    v23 = swift_unknownObjectRetain();
    sub_1CAF028DC(v23, v22);
    swift_unknownObjectRelease();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v12 + 64))(v21, v13, v12);
    swift_unknownObjectRelease();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

unint64_t sub_1CAF03160()
{
  uint64_t *v0;
  uint64_t v1;
  unint64_t result;
  char v3;
  uint64_t v4;

  v1 = *v0;
  result = (*(uint64_t (**)(_QWORD))(*(_QWORD *)(*v0 + 104) + 48))(*(_QWORD *)(*v0 + 80));
  if ((v3 & 1) == 0)
  {
    if (result)
    {
LABEL_9:
      v4 = sub_1CAF20478();
      (*(void (**)(uint64_t))(*(_QWORD *)(v1 + 112) + 72))(v4);
      return swift_bridgeObjectRelease();
    }
    __break(1u);
  }
  if (HIDWORD(result))
  {
    __break(1u);
LABEL_11:
    __break(1u);
    goto LABEL_9;
  }
  if (result >> 11 == 27)
    goto LABEL_14;
  if (WORD1(result) > 0x10u)
    goto LABEL_11;
  if ((result & 0xFFFFFF80) != 0 || result <= 0xFF)
    goto LABEL_9;
  __break(1u);
LABEL_14:
  __break(1u);
  return result;
}

uint64_t *SystemBackgroundTaskScheduler.deinit()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(*v0 + 88) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 128));
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)(v1 + 96) - 8) + 8))((uint64_t)v0 + *(_QWORD *)(*v0 + 136));
  swift_unknownObjectRelease();
  return v0;
}

uint64_t SystemBackgroundTaskScheduler.__deallocating_deinit()
{
  SystemBackgroundTaskScheduler.deinit();
  return swift_deallocClassInstance();
}

uint64_t sub_1CAF0334C()
{
  sub_1CAF033F4();
  return swift_unknownObjectRetain();
}

uint64_t sub_1CAF0336C()
{
  _QWORD **v0;
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCC10;
  v3[3] = v2;
  v3[4] = *v2;
  return swift_task_switch();
}

unint64_t sub_1CAF033D4()
{
  return sub_1CAF03160();
}

uint64_t sub_1CAF033F4()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + *(_QWORD *)(*(_QWORD *)v0 + 144));
}

_UNKNOWN **sub_1CAF03404()
{
  return &protocol witness table for BGSystemTaskRequest;
}

_UNKNOWN **sub_1CAF03410()
{
  return &protocol witness table for BGNonRepeatingSystemTaskRequest;
}

_UNKNOWN **sub_1CAF0341C()
{
  return &protocol witness table for BGRepeatingSystemTaskRequest;
}

_UNKNOWN **sub_1CAF03428()
{
  return &protocol witness table for BGSystemTask;
}

uint64_t sub_1CAF03434(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 104);
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.identifier.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.priority.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.priority.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.priority.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 48))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresNetworkConnectivity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresNetworkConnectivity.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresNetworkConnectivity.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 72))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresBuddyComplete.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 80))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresBuddyComplete.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 88))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresBuddyComplete.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 96))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresInexpensiveNetworkConnectivity.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 104))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresInexpensiveNetworkConnectivity.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 112))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresInexpensiveNetworkConnectivity.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 120))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.resourceIntensive.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 128))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.resourceIntensive.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 136))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.resourceIntensive.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 144))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresExternalPower.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 152))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresExternalPower.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 160))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.requiresExternalPower.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 168))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.postInstall.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 176))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.postInstall.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 184))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.postInstall.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 192))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.powerNap.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 200))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.powerNap.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 208))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.powerNap.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 216))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.shouldWakeDevice.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 224))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.shouldWakeDevice.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 232))();
}

uint64_t dispatch thunk of SystemBackgroundTaskRequestProtocol.shouldWakeDevice.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 240))();
}

uint64_t dispatch thunk of RepeatingSystemBackgroundTaskRequestProtocol.interval.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t dispatch thunk of RepeatingSystemBackgroundTaskRequestProtocol.interval.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of RepeatingSystemBackgroundTaskRequestProtocol.interval.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of RepeatingSystemBackgroundTaskRequestProtocol.minDurationBetweenInstances.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t dispatch thunk of RepeatingSystemBackgroundTaskRequestProtocol.minDurationBetweenInstances.setter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of RepeatingSystemBackgroundTaskRequestProtocol.minDurationBetweenInstances.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SystemBackgroundRequestFactoryProtocol.repeatingRequest(identifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

ValueMetadata *type metadata accessor for SystemBackgroundRequestFactory()
{
  return &type metadata for SystemBackgroundRequestFactory;
}

uint64_t dispatch thunk of SystemBackgroundSchedulerProtocol.registerForTask(withIdentifier:using:launchHandler:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 40))();
}

uint64_t dispatch thunk of SystemBackgroundSchedulerProtocol.taskRequest(forIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 48))();
}

uint64_t dispatch thunk of SystemBackgroundSchedulerProtocol.update(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 56))();
}

uint64_t dispatch thunk of SystemBackgroundSchedulerProtocol.submitTaskRequest(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 64))();
}

uint64_t dispatch thunk of SystemBackgroundSchedulerProtocol.deregisterTask(withIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 72))();
}

uint64_t sub_1CAF035AC()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      result = swift_initClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

void type metadata accessor for SystemBackgroundTaskScheduler()
{
  JUMPOUT(0x1D179A548);
}

uint64_t method lookup function for SystemBackgroundTaskScheduler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SystemBackgroundTaskScheduler.__allocating_init(taskProvider:underlyingScheduler:requestFactory:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 152))();
}

uint64_t dispatch thunk of SystemBackgroundTaskScheduler.schedule()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 176) + *(_QWORD *)(*(_QWORD *)v0 + 176));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CAEDCC10;
  return v4();
}

uint64_t dispatch thunk of SystemBackgroundTaskScheduler.unregister()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 184))();
}

uint64_t sub_1CAF036C8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF036EC(uint64_t a1)
{
  uint64_t v1;
  uint64_t (*v2)(uint64_t *);
  uint64_t v4;

  v2 = *(uint64_t (**)(uint64_t *))(v1 + 16);
  v4 = a1;
  return v2(&v4);
}

uint64_t block_copy_helper_4(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_4()
{
  return swift_release();
}

uint64_t sub_1CAF03734()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CAF03758(uint64_t a1)
{
  uint64_t v1;
  void (*v3)(uint64_t);

  v3 = (void (*)(uint64_t))(*(uint64_t (**)(_QWORD))(*(_QWORD *)(v1 + 40) + 56))(*(_QWORD *)(v1 + 16));
  v3(a1);
  return swift_release();
}

uint64_t sub_1CAF037B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1CAF20658();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1CAF2064C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1CAEF5168(a1, &qword_1ECFCE7A0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CAF205EC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

uint64_t sub_1CAF038EC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;

  v5 = sub_1CAF20658();
  v6 = *(_QWORD *)(v5 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(a1, 1, v5) != 1)
  {
    sub_1CAF2064C();
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
    if (!*(_QWORD *)(a3 + 16))
      return swift_task_create();
    goto LABEL_3;
  }
  sub_1CAEF5168(a1, &qword_1ECFCE7A0);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1CAF205EC();
    swift_unknownObjectRelease();
  }
  return swift_task_create();
}

void AsyncLoader.State.description.getter(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;

  v1 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v1 + 16))((char *)&v4 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v3 = (char *)sub_1CAF03AB0 + 4 * byte_1CAF26088[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1CAF03AB0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v0, v1);
  return 0x676E6964616F6CLL;
}

uint64_t sub_1CAF03C4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v10;

  v5 = type metadata accessor for AsyncLoader.State(0, a2, a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v10 - v7;
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))((char *)&v10 - v7, a1, v5);
  sub_1CAF096F4((uint64_t)v8, v5);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, v5);
}

uint64_t sub_1CAF03CE8()
{
  return sub_1CAF03D28();
}

uint64_t sub_1CAF03D08(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAF09898(a1, a2, a3, a4);
}

uint64_t sub_1CAF03D28()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_1CAF2031C();
  swift_release();
  return swift_release();
}

uint64_t sub_1CAF03DB0()
{
  return sub_1CAF03D28();
}

uint64_t sub_1CAF03DD0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAF09898(a1, a2, a3, a4);
}

uint64_t sub_1CAF03DF0()
{
  return 8;
}

_QWORD *sub_1CAF03DFC(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_1CAF03E08()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *v0;
  swift_beginAccess();
  type metadata accessor for AsyncLoader.State(255, *(_QWORD *)(v1 + 80), v2, v3);
  sub_1CAF20340();
  sub_1CAF20304();
  return swift_endAccess();
}

uint64_t type metadata accessor for AsyncLoader.State(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncLoader.State);
}

uint64_t sub_1CAF03E88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 128);
  swift_beginAccess();
  return sub_1CAF0ADBC(v3, a1, &qword_1EF98FC78);
}

uint64_t sub_1CAF03EE0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(_QWORD *)(*(_QWORD *)v1 + 128);
  swift_beginAccess();
  sub_1CAF0AD74(a1, v3);
  return swift_endAccess();
}

uint64_t AsyncLoader.__allocating_init(label:logger:initialValue:timeOut:fetch:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, char a7, uint64_t a8, uint64_t a9)
{
  int v16;
  uint64_t v17;

  v16 = a7 & 1;
  v17 = swift_allocObject();
  AsyncLoader.init(label:logger:initialValue:timeOut:fetch:)(a1, a2, a3, a4, a5, a6, v16, a8, a9);
  return v17;
}

uint64_t *AsyncLoader.init(label:logger:initialValue:timeOut:fetch:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, unint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9)
{
  uint64_t *v9;
  uint64_t *v10;
  uint64_t v12;
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
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t, char *, uint64_t);
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  int v53;
  char *v54;
  void (*v55)(char *, uint64_t, uint64_t);
  char *v56;
  char *v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  unint64_t v64;
  NSObject *v65;
  os_log_type_t v66;
  _BOOL4 v67;
  uint8_t *v68;
  uint64_t v69;
  uint64_t v70;
  uint8_t *v71;
  uint64_t v72;
  char *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  NSObject *v79;
  os_log_type_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  unint64_t v84;
  uint64_t v85;
  unint64_t v86;
  _QWORD *v87;
  _QWORD *v88;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char *v100;
  unint64_t v101;
  char *v102;
  char *v103;
  char *v104;
  uint64_t v105;
  uint64_t v106;
  char *v107;
  __int128 v108;
  char *v109;
  int v110;
  unint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121[2];
  uint64_t v122;

  v10 = v9;
  v112 = a6;
  v113 = a8;
  v110 = a7;
  v111 = a5;
  v118 = a4;
  v119 = a3;
  v101 = a2;
  v12 = *v9;
  v13 = *(_QWORD *)(*v9 + 80);
  v14 = sub_1CAF20754();
  v116 = *(_QWORD *)(v14 - 8);
  v117 = v14;
  v15 = MEMORY[0x1E0C80A78](v14);
  v107 = (char *)&v90 - v16;
  v114 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v15);
  v109 = (char *)&v90 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_1CAF20280();
  v105 = *(_QWORD *)(v106 - 8);
  MEMORY[0x1E0C80A78](v106);
  v104 = (char *)&v90 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD08);
  MEMORY[0x1E0C80A78](v19);
  v100 = (char *)&v90 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v99 = sub_1CAF202E0();
  v21 = *(_QWORD *)(v99 - 8);
  v22 = MEMORY[0x1E0C80A78](v99);
  v103 = (char *)&v90 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22);
  v102 = (char *)&v90 - v24;
  v27 = type metadata accessor for AsyncLoader.State(255, v13, v25, v26);
  v28 = sub_1CAF20340();
  v29 = *(_QWORD *)(v28 - 8);
  v30 = MEMORY[0x1E0C80A78](v28);
  v32 = (char *)&v90 - v31;
  MEMORY[0x1E0C80A78](v30);
  v34 = (char *)&v90 - v33;
  v35 = *(_QWORD *)(v12 + 88);
  v36 = a1;
  v37 = (uint64_t)v10 + v35;
  v95 = v27;
  swift_storeEnumTagMultiPayload();
  v94 = v34;
  v38 = (uint64_t)v34;
  v39 = v10;
  v115 = v13;
  v40 = v13;
  v41 = v101;
  sub_1CAF03C4C(v38, v40, v42, v43);
  v96 = v29;
  v44 = *(void (**)(uint64_t, char *, uint64_t))(v29 + 32);
  v93 = v37;
  v45 = v37;
  v97 = v28;
  v46 = v28;
  v47 = v99;
  v48 = (uint64_t)v100;
  v44(v45, v32, v46);
  v49 = *(_QWORD *)(*v10 + 96);
  v108 = xmmword_1CAF26260;
  *(_OWORD *)((char *)v10 + v49) = xmmword_1CAF26260;
  v50 = (uint64_t)v10 + *(_QWORD *)(*v10 + 128);
  v51 = sub_1CAF2019C();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v51 - 8) + 56))(v50, 1, 1, v51);
  v52 = (uint64_t *)((char *)v10 + *(_QWORD *)(*v10 + 104));
  *v52 = v36;
  v52[1] = v41;
  v98 = v52;
  sub_1CAF0ADBC(v119, v48, &qword_1EF98FD08);
  v53 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v48, 1, v47);
  v92 = v36;
  if (v53 == 1)
  {
    strcpy((char *)v121, "asyncLoader.");
    BYTE5(v121[1]) = 0;
    HIWORD(v121[1]) = -5120;
    swift_bridgeObjectRetain();
    sub_1CAF204A8();
    v54 = v102;
    sub_1CAF202D4();
    sub_1CAEF5168(v48, &qword_1EF98FD08);
    v55 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
  }
  else
  {
    v55 = *(void (**)(char *, uint64_t, uint64_t))(v21 + 32);
    v54 = v102;
    v55(v102, v48, v47);
    swift_bridgeObjectRetain();
  }
  v56 = (char *)v10 + *(_QWORD *)(*v10 + 120);
  v55(v56, (uint64_t)v54, v47);
  (*(void (**)(char *, char *, uint64_t))(v21 + 16))(v103, v56, v47);
  v57 = v104;
  sub_1CAF20268();
  (*(void (**)(uint64_t, char *, uint64_t))(v105 + 32))((uint64_t)v10 + *(_QWORD *)(*v10 + 112), v57, v106);
  v59 = v116;
  v58 = v117;
  v60 = v107;
  (*(void (**)(char *, uint64_t, uint64_t))(v116 + 16))(v107, v118, v117);
  v61 = v114;
  v62 = v115;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v114 + 48))(v60, 1, v115) == 1)
  {
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v59 + 8))(v60, v58);
    v64 = v111;
    v63 = v112;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v61 + 32))(v109, v60, v62);
    swift_bridgeObjectRetain();
    v65 = sub_1CAF202C8();
    v66 = sub_1CAF206B8();
    v67 = os_log_type_enabled(v65, v66);
    v91 = v39;
    if (v67)
    {
      v68 = (uint8_t *)swift_slowAlloc();
      v69 = swift_slowAlloc();
      v121[0] = v69;
      *(_DWORD *)v68 = 136315138;
      v70 = v116;
      swift_bridgeObjectRetain();
      v122 = sub_1CAEDBE5C(v92, v41, v121);
      v59 = v70;
      v58 = v117;
      sub_1CAF2076C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CAEBA000, v65, v66, "%s has initial value", v68, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v69, -1, -1);
      v71 = v68;
      v61 = v114;
      MEMORY[0x1D179A698](v71, -1, -1);
    }
    else
    {
      swift_bridgeObjectRelease_n();
    }

    v64 = v111;
    v63 = v112;
    v72 = (uint64_t)v94;
    v73 = v109;
    (*(void (**)(char *, char *, uint64_t))(v61 + 16))(v94, v109, v62);
    swift_storeEnumTagMultiPayload();
    v74 = v93;
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t))(v96 + 8))(v74, v97);
    sub_1CAF03C4C(v72, v62, v75, v76);
    swift_endAccess();
    (*(void (**)(char *, uint64_t))(v61 + 8))(v73, v62);
    v39 = v91;
  }
  v77 = swift_allocObject();
  *(_OWORD *)(v77 + 16) = v108;
  if ((v110 & 1) != 0 || (sub_1CAF20A6C() & 1) == 0 || (sub_1CAF20A6C() & 1) != 0)
  {
    v63 = 1;
    v64 = 0xA055690D9DB80000;
  }
  v78 = a9;
  *(_QWORD *)(v77 + 16) = v64;
  *(_QWORD *)(v77 + 24) = v63;
  swift_retain_n();
  swift_retain_n();
  v79 = sub_1CAF202C8();
  v80 = sub_1CAF206B8();
  if (os_log_type_enabled(v79, v80))
  {
    v81 = swift_slowAlloc();
    v82 = swift_slowAlloc();
    v122 = v82;
    *(_DWORD *)v81 = 136315394;
    v114 = a9;
    v83 = *v98;
    v84 = v98[1];
    swift_bridgeObjectRetain();
    v121[0] = sub_1CAEDBE5C(v83, v84, &v122);
    sub_1CAF2076C();
    v62 = v115;
    swift_bridgeObjectRelease();
    swift_release_n();
    *(_WORD *)(v81 + 12) = 2080;
    swift_beginAccess();
    v85 = sub_1CAF20A60();
    v120 = sub_1CAEDBE5C(v85, v86, &v122);
    v78 = v114;
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1CAEBA000, v79, v80, "%s is using max %ss timeout", (uint8_t *)v81, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v82, -1, -1);
    MEMORY[0x1D179A698](v81, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v116 + 8))(v118, v117);
  }
  else
  {

    swift_release_n();
    swift_release_n();
    (*(void (**)(uint64_t, uint64_t))(v59 + 8))(v118, v58);
  }
  sub_1CAEF5168(v119, &qword_1EF98FD08);
  v87 = (_QWORD *)swift_allocObject();
  v87[2] = v62;
  v87[3] = v77;
  v87[4] = v113;
  v87[5] = v78;
  v88 = (uint64_t *)((char *)v39 + *(_QWORD *)(*v39 + 136));
  *v88 = &unk_1EF9915B8;
  v88[1] = v87;
  return v39;
}

uint64_t sub_1CAF04920()
{
  return swift_deallocObject();
}

uint64_t sub_1CAF04930(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;

  v5[8] = a4;
  v5[9] = a5;
  v5[6] = a2;
  v5[7] = a3;
  v5[5] = a1;
  sub_1CAF20634();
  v5[10] = sub_1CAF20628();
  v5[11] = sub_1CAF205EC();
  v5[12] = v6;
  return swift_task_switch();
}

uint64_t sub_1CAF049A4()
{
  uint64_t v0;
  _QWORD *v1;

  swift_beginAccess();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 104) = v1;
  *v1 = v0;
  v1[1] = sub_1CAF04A20;
  return sub_1CAF201F0();
}

uint64_t sub_1CAF04A20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 112) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF04A80()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF04AB4()
{
  uint64_t v0;

  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF04AE8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF04B14(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = v1[2];
  v5 = v1[3];
  v7 = v1[4];
  v6 = v1[5];
  v8 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v8;
  *v8 = v2;
  v8[1] = sub_1CAEDCEDC;
  return sub_1CAF04930(a1, v5, v7, v6, v4);
}

uint64_t sub_1CAF04B8C(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;

  v3[2] = a1;
  v3[3] = *v2;
  v3[4] = sub_1CAF20634();
  v3[5] = sub_1CAF20628();
  v5 = (_QWORD *)swift_task_alloc();
  v3[6] = v5;
  *v5 = v3;
  v5[1] = sub_1CAF04C0C;
  return sub_1CAF04DB4(a2);
}

uint64_t sub_1CAF04C0C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *v1;
  v3 = *v1;
  *(_QWORD *)(*v1 + 56) = a1;
  swift_task_dealloc();
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 64) = v4;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
  *v4 = v3;
  v4[1] = sub_1CAF04CAC;
  return sub_1CAF20664();
}

uint64_t sub_1CAF04CAC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 72) = v0;
  swift_task_dealloc();
  sub_1CAF205EC();
  return swift_task_switch();
}

uint64_t sub_1CAF04D34()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF04D74()
{
  uint64_t v0;

  swift_release();
  swift_release();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF04DB4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2[8] = a1;
  v2[9] = v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  v2[10] = v3;
  v2[11] = *(_QWORD *)(v3 - 8);
  v2[12] = swift_task_alloc();
  v2[13] = swift_task_alloc();
  v6 = type metadata accessor for AsyncLoader.State(0, v3, v4, v5);
  v2[14] = v6;
  v2[15] = *(_QWORD *)(v6 - 8);
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  v2[18] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FC78);
  v2[19] = swift_task_alloc();
  v7 = sub_1CAF2019C();
  v2[20] = v7;
  v8 = *(_QWORD *)(v7 - 8);
  v2[21] = v8;
  v2[22] = *(_QWORD *)(v8 + 64);
  v2[23] = swift_task_alloc();
  v2[24] = swift_task_alloc();
  v2[25] = sub_1CAF20634();
  v2[26] = sub_1CAF20628();
  sub_1CAF205EC();
  return swift_task_switch();
}

uint64_t sub_1CAF04F1C()
{
  _QWORD *v0;
  _QWORD *v1;
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
  void (*v13)(uint64_t, uint64_t, uint64_t);
  uint64_t v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  int EnumCaseMultiPayload;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  _BOOL4 v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  _QWORD *v34;
  NSObject *v35;
  os_log_type_t v36;
  _BOOL4 v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  unint64_t v49;
  _QWORD *v50;
  NSObject *v51;
  os_log_type_t v52;
  _BOOL4 v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  uint64_t *v57;
  unint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void (*v70)(uint64_t *, uint64_t);
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  void (*v82)(uint64_t, uint64_t);
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t TupleTypeMetadata2;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  _QWORD *v108;
  uint64_t v109[2];

  v1 = v0 + 8;
  v95 = v0 + 4;
  v96 = v0[8];
  v3 = v0[23];
  v2 = v0[24];
  v4 = v0[21];
  v6 = v0[19];
  v5 = v0[20];
  v7 = v0[18];
  v8 = v1[1];
  v98 = v1[2];
  v9 = swift_release();
  sub_1CAF06AC8(v9, v10, v11, v12);
  sub_1CAF20190();
  v13 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16);
  v13(v6, v2, v5);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v4 + 56))(v6, 0, 1, v5);
  sub_1CAF03EE0(v6);
  v109[0] = 0x3D44496B736174;
  v109[1] = 0xE700000000000000;
  sub_1CAF0AFF4(&qword_1EF98FC70, MEMORY[0x1E0CB09F0]);
  sub_1CAF2097C();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  sub_1CAF0ADBC(v96, v7, &qword_1ECFCE7A0);
  v13(v3, v2, v5);
  swift_retain();
  v14 = sub_1CAF20628();
  v15 = (*(unsigned __int8 *)(v4 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v16 = (char *)swift_allocObject();
  v17 = MEMORY[0x1E0DF06E8];
  *((_QWORD *)v16 + 2) = v14;
  *((_QWORD *)v16 + 3) = v17;
  *((_QWORD *)v16 + 4) = v98;
  *((_QWORD *)v16 + 5) = v8;
  *((_QWORD *)v16 + 6) = 0x3D44496B736174;
  *((_QWORD *)v16 + 7) = 0xE700000000000000;
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 32))(&v16[v15], v3, v5);
  v18 = sub_1CAF038EC(v7, (uint64_t)&unk_1EF991610, (uint64_t)v16);
  sub_1CAF03D28();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 4:
      v34 = v108;
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
      sub_1CAF2067C();
      sub_1CAF20754();
      swift_getTupleTypeMetadata2();
      swift_release();
      swift_retain();
      v35 = sub_1CAF202C8();
      v36 = sub_1CAF206B8();
      v37 = os_log_type_enabled(v35, v36);
      v38 = v108[24];
      v39 = v108[20];
      v40 = v108[21];
      v41 = v108[9];
      if (v37)
      {
        v106 = v108[24];
        v42 = v1 - 6;
        v43 = v18;
        v44 = v1 - 5;
        v45 = swift_slowAlloc();
        v46 = swift_slowAlloc();
        v109[0] = v46;
        *(_DWORD *)v45 = 136315394;
        v102 = v39;
        *v42 = sub_1CAEDBE5C(0xD000000000000014, 0x80000001CAF2B610, v109);
        sub_1CAF2076C();
        *(_WORD *)(v45 + 12) = 2080;
        v47 = (uint64_t *)(v41 + *(_QWORD *)(*(_QWORD *)v41 + 104));
        v99 = v40;
        v48 = *v47;
        v49 = v47[1];
        swift_bridgeObjectRetain();
        *v44 = sub_1CAEDBE5C(v48, v49, v109);
        v18 = v43;
        sub_1CAF2076C();
        swift_release();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CAEBA000, v35, v36, "%s %s still initial w/loading", (uint8_t *)v45, 0x16u);
        swift_arrayDestroy();
        v34 = v108;
        MEMORY[0x1D179A698](v46, -1, -1);
        MEMORY[0x1D179A698](v45, -1, -1);

        (*(void (**)(uint64_t, uint64_t))(v99 + 8))(v106, v102);
      }
      else
      {

        swift_release();
        (*(void (**)(uint64_t, uint64_t))(v40 + 8))(v38, v39);
      }
      (*(void (**)(_QWORD, _QWORD))(v34[11] + 8))(v34[17], v34[10]);
      break;
    case 3:
      v107 = v18;
      v50 = v108;
      (*(void (**)(_QWORD, _QWORD, _QWORD))(v108[11] + 32))(v108[12], v108[17], v108[10]);
      swift_retain_n();
      v51 = sub_1CAF202C8();
      v52 = sub_1CAF206B8();
      v53 = os_log_type_enabled(v51, v52);
      v54 = v108[9];
      if (v53)
      {
        v55 = v1 - 3;
        v56 = swift_slowAlloc();
        v103 = swift_slowAlloc();
        v109[0] = v103;
        *(_DWORD *)v56 = 136315394;
        *v95 = sub_1CAEDBE5C(0xD000000000000014, 0x80000001CAF2B610, v109);
        sub_1CAF2076C();
        *(_WORD *)(v56 + 12) = 2080;
        v57 = (uint64_t *)(v54 + *(_QWORD *)(*(_QWORD *)v54 + 104));
        v59 = *v57;
        v58 = v57[1];
        swift_bridgeObjectRetain();
        *v55 = sub_1CAEDBE5C(v59, v58, v109);
        v50 = v108;
        sub_1CAF2076C();
        swift_release_n();
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CAEBA000, v51, v52, "%s %s initial value, setting to reload-with", (uint8_t *)v56, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v103, -1, -1);
        MEMORY[0x1D179A698](v56, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      v71 = v50[21];
      v100 = v50[20];
      v104 = v50[24];
      v72 = v50[15];
      v73 = v50[16];
      v74 = v108[14];
      v75 = v108[12];
      v76 = v108[11];
      v77 = v108[10];
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
      sub_1CAF2067C();
      sub_1CAF20754();
      v78 = *(int *)(swift_getTupleTypeMetadata2() + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v76 + 16))(v73, v75, v77);
      v18 = v107;
      *(_QWORD *)(v73 + v78) = v107;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      sub_1CAF09898(v73, v79, v80, v81);
      v34 = v108;
      (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v73, v74);
      (*(void (**)(uint64_t, uint64_t))(v76 + 8))(v75, v77);
      v82 = *(void (**)(uint64_t, uint64_t))(v71 + 8);
      goto LABEL_17;
    case 1:
      v105 = v18;
      v20 = v108;
      v21 = v108[17];
      v22 = v108[13];
      v24 = v108[10];
      v23 = v108[11];
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
      sub_1CAF2067C();
      sub_1CAF20754();
      TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
      swift_release();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 32))(v22, v21, v24);
      swift_retain_n();
      v25 = sub_1CAF202C8();
      v26 = sub_1CAF206B8();
      v27 = os_log_type_enabled(v25, v26);
      v28 = v108[9];
      if (v27)
      {
        v29 = swift_slowAlloc();
        v30 = swift_slowAlloc();
        v109[0] = v30;
        *(_DWORD *)v29 = 136315394;
        *(v1 - 2) = sub_1CAEDBE5C(0xD000000000000014, 0x80000001CAF2B610, v109);
        sub_1CAF2076C();
        *(_WORD *)(v29 + 12) = 2080;
        v31 = (uint64_t *)(v28 + *(_QWORD *)(*(_QWORD *)v28 + 104));
        v32 = *v31;
        v33 = v31[1];
        swift_bridgeObjectRetain();
        *(v1 - 1) = sub_1CAEDBE5C(v32, v33, v109);
        sub_1CAF2076C();
        swift_release_n();
        v20 = v108;
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_1CAEBA000, v25, v26, "%s %s is loaded", (uint8_t *)v29, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v30, -1, -1);
        MEMORY[0x1D179A698](v29, -1, -1);
      }
      else
      {
        swift_release_n();
      }

      v83 = TupleTypeMetadata2;
      v97 = v20[21];
      v100 = v20[20];
      v104 = v20[24];
      v84 = v20[16];
      v85 = v108[15];
      v86 = v108[14];
      v87 = v108[13];
      v88 = v108[11];
      v89 = v108[10];
      v90 = *(int *)(v83 + 48);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v88 + 16))(v84, v87, v89);
      v18 = v105;
      *(_QWORD *)(v84 + v90) = v105;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      sub_1CAF09898(v84, v91, v92, v93);
      v34 = v108;
      (*(void (**)(uint64_t, uint64_t))(v85 + 8))(v84, v86);
      (*(void (**)(uint64_t, uint64_t))(v88 + 8))(v87, v89);
      v82 = *(void (**)(uint64_t, uint64_t))(v97 + 8);
LABEL_17:
      v82(v104, v100);
      break;
    default:
      v34 = v108;
      v60 = v108[24];
      v61 = v108[20];
      v62 = v108[21];
      v64 = (uint64_t *)v108[16];
      v63 = (uint64_t *)v108[17];
      v65 = v108[14];
      v66 = v108[15];
      *v64 = v18;
      swift_storeEnumTagMultiPayload();
      swift_retain();
      sub_1CAF09898((uint64_t)v64, v67, v68, v69);
      v70 = *(void (**)(uint64_t *, uint64_t))(v66 + 8);
      v70(v64, v65);
      (*(void (**)(uint64_t, uint64_t))(v62 + 8))(v60, v61);
      v70(v63, v65);
      break;
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return ((uint64_t (*)(uint64_t))v34[1])(v18);
}

uint64_t sub_1CAF05970(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3[7] = a2;
  v3[8] = v2;
  v3[6] = a1;
  v4 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v3[9] = v4;
  v3[10] = *(_QWORD *)(v4 - 8);
  v3[11] = swift_task_alloc();
  v3[12] = swift_task_alloc();
  v3[13] = type metadata accessor for AsyncLoader.State(0, v4, v5, v6);
  v3[14] = swift_task_alloc();
  sub_1CAF20634();
  v3[15] = sub_1CAF20628();
  v3[16] = sub_1CAF205EC();
  v3[17] = v7;
  return swift_task_switch();
}

void sub_1CAF05A40()
{
  char *v0;

  sub_1CAF03D28();
  v0 = (char *)sub_1CAF05AAC + 4 * byte_1CAF2608E[swift_getEnumCaseMultiPayload()];
  __asm { BR              X10 }
}

uint64_t sub_1CAF05AAC()
{
  uint64_t v0;
  _QWORD *v1;

  *(_QWORD *)(v0 + 160) = **(_QWORD **)(v0 + 112);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 168) = v1;
  __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
  *v1 = v0;
  v1[1] = sub_1CAF060E8;
  return sub_1CAF20664();
}

uint64_t sub_1CAF05B24()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(_QWORD *)(v0 + 112);
  v2 = *(_QWORD *)(v0 + 72);
  v3 = *(_QWORD *)(v0 + 80);
  v4 = *(_QWORD *)(v0 + 48);
  swift_release();
  __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
  sub_1CAF2067C();
  sub_1CAF20754();
  swift_getTupleTypeMetadata2();
  swift_release();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v3 + 32))(v4, v1, v2);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF06038()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF06098()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF060E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF06148()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF061A4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF06204()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF0625C(uint64_t a1)
{
  return sub_1CAF064D4(a1, (uint64_t)&unk_1E85638B8, (uint64_t)&unk_1EF9915E0);
}

uint64_t sub_1CAF06270(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a4;
  v5 = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  v4[3] = swift_task_alloc();
  v6 = *(_QWORD *)(v5 + 80);
  v4[4] = v6;
  v4[5] = *(_QWORD *)(v6 - 8);
  v4[6] = swift_task_alloc();
  sub_1CAF20634();
  v4[7] = sub_1CAF20628();
  v4[8] = sub_1CAF205EC();
  v4[9] = v7;
  return swift_task_switch();
}

uint64_t sub_1CAF06328()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  v2 = sub_1CAF20658();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)swift_task_alloc();
  v0[10] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_1CAF063A0;
  return sub_1CAF05970(v0[6], v0[3]);
}

uint64_t sub_1CAF063A0()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  sub_1CAEF5168(v3, &qword_1ECFCE7A0);
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[5] + 8))(v2[6], v2[4]);
  return swift_task_switch();
}

uint64_t sub_1CAF06430()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF06478()
{
  uint64_t v0;

  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF064C0(uint64_t a1)
{
  return sub_1CAF064D4(a1, (uint64_t)&unk_1E85638E0, (uint64_t)&unk_1EF9915F0);
}

uint64_t sub_1CAF064D4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v14;

  v5 = v3;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAF0ADBC(a1, (uint64_t)v9, &qword_1ECFCE7A0);
  sub_1CAF20634();
  swift_retain();
  v10 = sub_1CAF20628();
  v11 = (_QWORD *)swift_allocObject();
  v12 = MEMORY[0x1E0DF06E8];
  v11[2] = v10;
  v11[3] = v12;
  v11[4] = v5;
  sub_1CAF037B8((uint64_t)v9, a3, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_1CAF065AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4[2] = a4;
  v5 = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  v4[3] = swift_task_alloc();
  v6 = *(_QWORD *)(v5 + 80);
  v4[4] = v6;
  v4[5] = *(_QWORD *)(v6 - 8);
  v4[6] = swift_task_alloc();
  sub_1CAF20634();
  v4[7] = sub_1CAF20628();
  v4[8] = sub_1CAF205EC();
  v4[9] = v7;
  return swift_task_switch();
}

uint64_t sub_1CAF06664()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = v0[3];
  v2 = sub_1CAF20658();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 56))(v1, 1, 1, v2);
  v3 = (_QWORD *)swift_task_alloc();
  v0[10] = (uint64_t)v3;
  *v3 = v0;
  v3[1] = sub_1CAF066DC;
  return sub_1CAF04B8C(v0[6], v0[3]);
}

uint64_t sub_1CAF066DC()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2 = *(_QWORD **)v1;
  v3 = *(_QWORD *)(*(_QWORD *)v1 + 24);
  *(_QWORD *)(*(_QWORD *)v1 + 88) = v0;
  swift_task_dealloc();
  sub_1CAEF5168(v3, &qword_1ECFCE7A0);
  if (!v0)
    (*(void (**)(_QWORD, _QWORD))(v2[5] + 8))(v2[6], v2[4]);
  return swift_task_switch();
}

uint64_t sub_1CAF0676C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v5 = type metadata accessor for AsyncLoader.State(0, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - v7;
  swift_storeEnumTagMultiPayload();
  sub_1CAF09898((uint64_t)v8, v9, v10, v11);
  return (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

uint64_t AsyncLoader.deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v5 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 88);
  type metadata accessor for AsyncLoader.State(255, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = sub_1CAF20340();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  swift_bridgeObjectRelease();
  v7 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 112);
  v8 = sub_1CAF20280();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8))(v7, v8);
  v9 = v4 + *(_QWORD *)(*(_QWORD *)v4 + 120);
  v10 = sub_1CAF202E0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 8))(v9, v10);
  sub_1CAEF5168(v4 + *(_QWORD *)(*(_QWORD *)v4 + 128), &qword_1EF98FC78);
  swift_release();
  return v4;
}

uint64_t AsyncLoader.__deallocating_deinit(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  AsyncLoader.deinit(a1, a2, a3, a4);
  return swift_deallocClassInstance();
}

uint64_t sub_1CAF068F8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t result;

  type metadata accessor for AsyncLoader(0, *(_QWORD *)(a1 + 80), a2, a3);
  result = sub_1CAF202EC();
  *a4 = result;
  return result;
}

uint64_t AsyncLoader.value.getter@<X0>(uint64_t a1@<X2>, uint64_t a2@<X3>, char *a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  int EnumCaseMultiPayload;
  void (*v15)(char *, char *, uint64_t);
  uint64_t v17;

  v5 = *(_QWORD *)(*(_QWORD *)v3 + 80);
  v6 = type metadata accessor for AsyncLoader.State(0, v5, a1, a2);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v17 - v9;
  v11 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v8);
  v13 = (char *)&v17 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAF03D28();
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  switch(EnumCaseMultiPayload)
  {
    case 4:
      goto LABEL_4;
    case 3:
LABEL_5:
      v15 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
      v15(v13, v10, v5);
      v15(a3, v13, v5);
      return (*(uint64_t (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(a3, 0, 1, v5);
    case 1:
LABEL_4:
      __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
      sub_1CAF2067C();
      sub_1CAF20754();
      swift_getTupleTypeMetadata2();
      swift_release();
      goto LABEL_5;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v11 + 56))(a3, 1, 1, v5);
  return (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v10, v6);
}

void sub_1CAF06AC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  NSObject *v26;
  int v27;
  uint64_t v28;
  uint8_t *v29;
  uint64_t v30;
  unint64_t v31;
  void (*v32)(char *, uint64_t);
  char *v33;
  os_signpost_id_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t);
  void (*v39)(char *, uint64_t);
  uint64_t v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  unint64_t v48;
  _QWORD v49[2];
  uint8_t *v50;
  int v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v5 = v4;
  v6 = *v4;
  v54 = *(_QWORD *)(*v4 + 80);
  v7 = type metadata accessor for AsyncLoader.State(0, v54, a3, a4);
  v57 = *(_QWORD *)(v7 - 8);
  v58 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v49 - v8;
  v10 = sub_1CAF2025C();
  v55 = *(_QWORD *)(v10 - 8);
  v56 = v10;
  v11 = MEMORY[0x1E0C80A78](v10);
  v53 = (char *)v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v49 - v13;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FC78);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)v49 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = sub_1CAF2019C();
  v19 = *(_QWORD *)(v18 - 8);
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)v49 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)v49 - v23;
  v25 = (uint64_t)v5 + *(_QWORD *)(v6 + 128);
  swift_beginAccess();
  sub_1CAF0ADBC(v25, (uint64_t)v17, &qword_1EF98FC78);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v19 + 48))(v17, 1, v18) == 1)
  {
    sub_1CAEF5168((uint64_t)v17, &qword_1EF98FC78);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v19 + 32))(v24, v17, v18);
    (*(void (**)(char *, char *, uint64_t))(v19 + 16))(v22, v24, v18);
    sub_1CAF20250();
    v26 = sub_1CAF20274();
    v27 = sub_1CAF20730();
    if ((sub_1CAF20748() & 1) != 0)
    {
      (*(void (**)(char *, char *, uint64_t))(v55 + 16))(v53, v14, v56);
      v28 = swift_slowAlloc();
      v51 = v27;
      v29 = (uint8_t *)v28;
      v52 = swift_slowAlloc();
      v60 = v52;
      v50 = v29;
      *(_DWORD *)v29 = 136315138;
      v49[1] = v29 + 4;
      v30 = sub_1CAF20184();
      v59 = sub_1CAEDBE5C(v30, v31, &v60);
      sub_1CAF2076C();
      swift_bridgeObjectRelease();
      v32 = *(void (**)(char *, uint64_t))(v19 + 8);
      v32(v22, v18);
      v33 = v53;
      v34 = sub_1CAF20244();
      v35 = v50;
      _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v26, (os_signpost_type_t)v51, v34, "cancelTask", "taskID=%s", v50, 0xCu);
      v36 = v52;
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v36, -1, -1);
      MEMORY[0x1D179A698](v35, -1, -1);

      v37 = v56;
      v38 = *(void (**)(char *, uint64_t))(v55 + 8);
      v38(v14, v56);
      v32(v24, v18);
      v38(v33, v37);
    }
    else
    {

      v39 = *(void (**)(char *, uint64_t))(v19 + 8);
      v39(v22, v18);
      (*(void (**)(char *, uint64_t))(v55 + 8))(v14, v56);
      v39(v24, v18);
    }
  }
  sub_1CAF03D28();
  v40 = v58;
  v41 = sub_1CAF07018(v58);
  (*(void (**)(char *, uint64_t))(v57 + 8))(v9, v40);
  if (v41)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    sub_1CAF20670();
    swift_retain_n();
    v42 = sub_1CAF202C8();
    v43 = sub_1CAF206A0();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      v45 = swift_slowAlloc();
      v60 = v45;
      *(_DWORD *)v44 = 136315138;
      v46 = (uint64_t *)((char *)v5 + *(_QWORD *)(*v5 + 104));
      v47 = *v46;
      v48 = v46[1];
      swift_bridgeObjectRetain();
      v59 = sub_1CAEDBE5C(v47, v48, &v60);
      sub_1CAF2076C();
      swift_bridgeObjectRelease();
      swift_release_n();
      _os_log_impl(&dword_1CAEBA000, v42, v43, "Task cancelled: %s", v44, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v45, -1, -1);
      MEMORY[0x1D179A698](v44, -1, -1);
      swift_release();

    }
    else
    {
      swift_release();

      swift_release_n();
    }
  }
}

uint64_t sub_1CAF07018(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char *v13;
  void (*v14)(char *);
  int EnumCaseMultiPayload;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v20;

  v2 = *(_QWORD *)(a1 - 8);
  v3 = MEMORY[0x1E0C80A78](a1);
  v5 = (char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v3);
  v8 = (char *)&v20 - v7;
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (uint64_t *)((char *)&v20 - v10);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v20 - v12;
  v14 = *(void (**)(char *))(v2 + 16);
  v14((char *)&v20 - v12);
  EnumCaseMultiPayload = swift_getEnumCaseMultiPayload();
  if (EnumCaseMultiPayload == 4)
  {
    ((void (*)(char *, char *, uint64_t))v14)(v8, v13, a1);
    v17 = *(_QWORD *)(a1 + 16);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
    sub_1CAF2067C();
    sub_1CAF20754();
    v16 = *(_QWORD *)&v8[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v17 - 8) + 8))(v8, v17);
  }
  else if (EnumCaseMultiPayload == 1)
  {
    ((void (*)(char *, char *, uint64_t))v14)(v5, v13, a1);
    v18 = *(_QWORD *)(a1 + 16);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
    sub_1CAF2067C();
    sub_1CAF20754();
    v16 = *(_QWORD *)&v5[*(int *)(swift_getTupleTypeMetadata2() + 48)];
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v18 - 8) + 8))(v5, v18);
  }
  else if (EnumCaseMultiPayload)
  {
    v16 = 0;
  }
  else
  {
    ((void (*)(uint64_t *, char *, uint64_t))v14)(v11, v13, a1);
    v16 = *v11;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v13, a1);
  return v16;
}

uint64_t sub_1CAF07230(char *a1, uint64_t a2)
{
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
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
  uint64_t v36;
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
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  char **v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  void (*v67)(char *, char *, uint64_t);
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t (*v77)(uint64_t, uint64_t, uint64_t);
  int v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  char v87;
  void (*v88)(char *, uint64_t);
  NSObject *v89;
  os_log_type_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  uint64_t v96;
  char *v97;
  char *v98;
  NSObject *v99;
  os_log_type_t v100;
  uint8_t *v101;
  uint64_t v102;
  uint64_t *v103;
  uint64_t v104;
  unint64_t v105;
  char *v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  _QWORD v115[17];
  char *v116;
  char *v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  char *v121;
  char *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  char *v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;

  v125 = a2;
  v129 = a1;
  v3 = *(_QWORD *)(*(_QWORD *)v2 + 80);
  v127 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v132 = (char *)v115 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v124 = sub_1CAF2019C();
  v133 = *(_QWORD *)(v124 - 8);
  MEMORY[0x1E0C80A78](v124);
  v117 = (char *)v115 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v126 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FC88);
  v6 = MEMORY[0x1E0C80A78](v126);
  v123 = (uint64_t)v115 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v115[7] = (char *)v115 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v115[6] = (char *)v115 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v115[8] = (char *)v115 - v13;
  MEMORY[0x1E0C80A78](v12);
  v115[5] = (char *)v115 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FC78);
  v16 = MEMORY[0x1E0C80A78](v15);
  v118 = (uint64_t)v115 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = MEMORY[0x1E0C80A78](v16);
  v130 = (uint64_t)v115 - v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = (char *)v115 - v21;
  v23 = MEMORY[0x1E0C80A78](v20);
  v115[4] = (char *)v115 - v24;
  v25 = MEMORY[0x1E0C80A78](v23);
  v115[14] = (char *)v115 - v26;
  v27 = MEMORY[0x1E0C80A78](v25);
  v115[15] = (char *)v115 - v28;
  v29 = MEMORY[0x1E0C80A78](v27);
  v115[3] = (char *)v115 - v30;
  v31 = MEMORY[0x1E0C80A78](v29);
  v115[12] = (char *)v115 - v32;
  v33 = MEMORY[0x1E0C80A78](v31);
  v115[13] = (char *)v115 - v34;
  v35 = MEMORY[0x1E0C80A78](v33);
  v115[1] = (char *)v115 - v36;
  v37 = MEMORY[0x1E0C80A78](v35);
  v115[9] = (char *)v115 - v38;
  v39 = MEMORY[0x1E0C80A78](v37);
  v121 = (char *)v115 - v40;
  v41 = MEMORY[0x1E0C80A78](v39);
  v115[2] = (char *)v115 - v42;
  v43 = MEMORY[0x1E0C80A78](v41);
  v115[10] = (char *)v115 - v44;
  MEMORY[0x1E0C80A78](v43);
  v115[11] = (char *)v115 - v45;
  v48 = type metadata accessor for AsyncLoader.State(0, v3, v46, v47);
  v128 = *(_QWORD *)(v48 - 8);
  v49 = MEMORY[0x1E0C80A78](v48);
  v116 = (char *)v115 - ((v50 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = MEMORY[0x1E0C80A78](v49);
  v52 = MEMORY[0x1E0C80A78](v51);
  v115[16] = (char *)v115 - v53;
  v54 = MEMORY[0x1E0C80A78](v52);
  v122 = (char *)v115 - v55;
  MEMORY[0x1E0C80A78](v54);
  v56 = v3;
  v120 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
  v57 = sub_1CAF20A3C();
  v58 = MEMORY[0x1E0C80A78](v57);
  v60 = (char *)v115 - ((v59 + 15) & 0xFFFFFFFFFFFFFFF0);
  v61 = MEMORY[0x1E0C80A78](v58);
  v63 = (char **)((char *)v115 - v62);
  MEMORY[0x1E0C80A78](v61);
  v65 = (char *)v115 - v64;
  v131 = v66;
  v67 = *(void (**)(char *, char *, uint64_t))(v66 + 16);
  v67((char *)v115 - v64, v129, v57);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v119 = v56;
    v130 = v57;
    v67((char *)v63, v65, v57);
    v132 = *v63;
    sub_1CAF03D28();
    v68 = (char *)&loc_1CAF077C0 + 4 * word_1CAF26094[swift_getEnumCaseMultiPayload()];
    __asm { BR              X10 }
  }
  v116 = (char *)v48;
  v129 = v65;
  v67(v60, v65, v57);
  v69 = v127;
  v70 = v56;
  (*(void (**)(char *, char *, uint64_t))(v127 + 32))(v132, v60, v56);
  v71 = v134 + *(_QWORD *)(*(_QWORD *)v134 + 128);
  swift_beginAccess();
  sub_1CAF0ADBC(v71, (uint64_t)v22, &qword_1EF98FC78);
  v72 = v133;
  v73 = v130;
  v74 = v124;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v133 + 16))(v130, v125, v124);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v72 + 56))(v73, 0, 1, v74);
  v75 = v123;
  v76 = v123 + *(int *)(v126 + 48);
  sub_1CAF0ADBC((uint64_t)v22, v123, &qword_1EF98FC78);
  sub_1CAF0ADBC(v73, v76, &qword_1EF98FC78);
  v77 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v72 + 48);
  v78 = v77(v75, 1, v74);
  v79 = v75;
  v80 = (uint64_t)v22;
  if (v78 == 1)
  {
    sub_1CAEF5168(v130, &qword_1EF98FC78);
    sub_1CAEF5168((uint64_t)v22, &qword_1EF98FC78);
    if (v77(v76, 1, v74) == 1)
    {
      sub_1CAEF5168(v79, &qword_1EF98FC78);
      v81 = v134;
LABEL_10:
      v130 = v57;
      swift_retain_n();
      v89 = sub_1CAF202C8();
      v90 = sub_1CAF206A0();
      if (os_log_type_enabled(v89, v90))
      {
        v91 = swift_slowAlloc();
        v133 = swift_slowAlloc();
        v136 = v133;
        *(_DWORD *)v91 = 136315394;
        v135 = sub_1CAEDBE5C(0xD00000000000001ELL, 0x80000001CAF2B630, &v136);
        sub_1CAF2076C();
        *(_WORD *)(v91 + 12) = 2080;
        v92 = (uint64_t *)(v81 + *(_QWORD *)(*(_QWORD *)v81 + 104));
        v93 = *v92;
        v94 = v92[1];
        swift_bridgeObjectRetain();
        v135 = sub_1CAEDBE5C(v93, v94, &v136);
        sub_1CAF2076C();
        swift_bridgeObjectRelease();
        swift_release_n();
        _os_log_impl(&dword_1CAEBA000, v89, v90, "%s %s loading completed", (uint8_t *)v91, 0x16u);
        v95 = v133;
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v95, -1, -1);
        MEMORY[0x1D179A698](v91, -1, -1);

      }
      else
      {

        swift_release_n();
      }
      v96 = v128;
      v97 = v129;
      v98 = v116;
      sub_1CAF2067C();
      sub_1CAF20754();
      v107 = *(int *)(swift_getTupleTypeMetadata2() + 48);
      v108 = v127;
      v109 = (uint64_t)v122;
      v110 = v132;
      (*(void (**)(char *, char *, uint64_t))(v127 + 16))(v122, v132, v70);
      *(_QWORD *)(v109 + v107) = 0;
      swift_storeEnumTagMultiPayload();
      sub_1CAF09898(v109, v111, v112, v113);
      (*(void (**)(uint64_t, char *))(v96 + 8))(v109, v98);
      (*(void (**)(char *, uint64_t))(v108 + 8))(v110, v70);
      v106 = v97;
      v57 = v130;
      return (*(uint64_t (**)(char *, uint64_t))(v131 + 8))(v106, v57);
    }
    goto LABEL_8;
  }
  v119 = v70;
  v82 = v118;
  sub_1CAF0ADBC(v79, v118, &qword_1EF98FC78);
  if (v77(v76, 1, v74) == 1)
  {
    sub_1CAEF5168(v130, &qword_1EF98FC78);
    sub_1CAEF5168(v80, &qword_1EF98FC78);
    (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v82, v74);
    v70 = v119;
LABEL_8:
    sub_1CAEF5168(v79, &qword_1EF98FC88);
    v83 = v132;
    v81 = v134;
    goto LABEL_12;
  }
  v84 = v80;
  v85 = v82;
  v86 = v117;
  (*(void (**)(char *, uint64_t, uint64_t))(v72 + 32))(v117, v76, v74);
  sub_1CAF0AFF4(&qword_1EF98FC68, MEMORY[0x1E0CB09D0]);
  v87 = sub_1CAF203D0();
  v88 = *(void (**)(char *, uint64_t))(v72 + 8);
  v88(v86, v74);
  sub_1CAEF5168(v130, &qword_1EF98FC78);
  sub_1CAEF5168(v84, &qword_1EF98FC78);
  v88((char *)v85, v74);
  sub_1CAEF5168(v123, &qword_1EF98FC78);
  v83 = v132;
  v70 = v119;
  v81 = v134;
  if ((v87 & 1) != 0)
    goto LABEL_10;
LABEL_12:
  (*(void (**)(char *, uint64_t))(v69 + 8))(v83, v70);
  swift_retain_n();
  v99 = sub_1CAF202C8();
  v100 = sub_1CAF206B8();
  if (os_log_type_enabled(v99, v100))
  {
    v101 = (uint8_t *)swift_slowAlloc();
    v102 = swift_slowAlloc();
    v136 = v102;
    *(_DWORD *)v101 = 136315138;
    v103 = (uint64_t *)(v81 + *(_QWORD *)(*(_QWORD *)v81 + 104));
    v104 = *v103;
    v105 = v103[1];
    swift_bridgeObjectRetain();
    v135 = sub_1CAEDBE5C(v104, v105, &v136);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    swift_release_n();
    _os_log_impl(&dword_1CAEBA000, v99, v100, "Success on wrong task %s", v101, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v102, -1, -1);
    MEMORY[0x1D179A698](v101, -1, -1);

  }
  else
  {

    swift_release_n();
  }
  v106 = v129;
  return (*(uint64_t (**)(char *, uint64_t))(v131 + 8))(v106, v57);
}

uint64_t sub_1CAF08ACC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7[9] = a6;
  v7[10] = a7;
  v7[7] = a4;
  v7[8] = a5;
  v7[6] = a1;
  v8 = *a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903E0);
  v7[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D0);
  v7[12] = swift_task_alloc();
  v9 = *(_QWORD *)(v8 + 80);
  v7[13] = v9;
  v7[14] = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1ECFCE7E8);
  v10 = sub_1CAF20A3C();
  v7[15] = v10;
  v7[16] = *(_QWORD *)(v10 - 8);
  v7[17] = swift_task_alloc();
  v7[18] = *(_QWORD *)(v9 - 8);
  v7[19] = swift_task_alloc();
  v11 = sub_1CAF2025C();
  v7[20] = v11;
  v7[21] = *(_QWORD *)(v11 - 8);
  v7[22] = swift_task_alloc();
  v7[23] = swift_task_alloc();
  sub_1CAF20634();
  v7[24] = sub_1CAF20628();
  v7[25] = sub_1CAF205EC();
  v7[26] = v12;
  return swift_task_switch();
}

uint64_t sub_1CAF08C30()
{
  _QWORD *v0;
  NSObject *v1;
  os_signpost_type_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, _QWORD);
  uint8_t *v7;
  uint64_t v8;
  os_signpost_id_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(_QWORD);
  uint64_t v17;

  sub_1CAF20274();
  sub_1CAF20238();
  swift_bridgeObjectRetain_n();
  v1 = sub_1CAF20274();
  v2 = sub_1CAF20724();
  if ((sub_1CAF20748() & 1) != 0)
  {
    v3 = v0[22];
    v14 = v0[20];
    v15 = v0[21];
    v5 = v0[8];
    v4 = v0[9];
    v6 = *(void (**)(uint64_t, _QWORD))(v15 + 16);
    v6(v3, v0[23]);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v17 = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    v0[5] = sub_1CAEDBE5C(v5, v4, &v17);
    sub_1CAF2076C();
    swift_bridgeObjectRelease_n();
    v9 = sub_1CAF20244();
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v1, v2, v9, "fetch", "%s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v8, -1, -1);
    MEMORY[0x1D179A698](v7, -1, -1);

    (*(void (**)(uint64_t, uint64_t))(v15 + 8))(v3, v14);
  }
  else
  {
    v10 = v0[21];
    swift_bridgeObjectRelease_n();

    v6 = *(void (**)(uint64_t, _QWORD))(v10 + 16);
  }
  v11 = v0[7];
  ((void (*)(_QWORD, _QWORD, _QWORD))v6)(v0[22], v0[23], v0[20]);
  sub_1CAF202B0();
  swift_allocObject();
  v0[27] = sub_1CAF202A4();
  v16 = (uint64_t (*)(_QWORD))(**(int **)(v11 + *(_QWORD *)(*(_QWORD *)v11 + 136))
                                       + *(_QWORD *)(v11 + *(_QWORD *)(*(_QWORD *)v11 + 136)));
  v12 = (_QWORD *)swift_task_alloc();
  v0[28] = v12;
  *v12 = v0;
  v12[1] = sub_1CAF08E80;
  return v16(v0[19]);
}

uint64_t sub_1CAF08E80()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 232) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF08EE0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v1 = *(_QWORD *)(v0 + 216);
  v16 = *(_QWORD *)(v0 + 184);
  v2 = *(_QWORD *)(v0 + 152);
  v14 = *(_QWORD *)(v0 + 168);
  v15 = *(_QWORD *)(v0 + 160);
  v3 = *(char **)(v0 + 136);
  v4 = *(_QWORD *)(v0 + 144);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 104);
  v7 = *(_QWORD *)(v0 + 80);
  v13 = *(_QWORD *)(v0 + 72);
  v8 = *(_QWORD *)(v0 + 56);
  v11 = *(_QWORD *)(v0 + 128);
  v12 = *(_QWORD *)(v0 + 64);
  v9 = *(_QWORD *)(v0 + 48);
  swift_release();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v3, v2, v6);
  swift_storeEnumTagMultiPayload();
  sub_1CAF07230(v3, v7);
  (*(void (**)(char *, uint64_t))(v11 + 8))(v3, v5);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 32))(v9, v2, v6);
  sub_1CAF09400(v8, v1, v12, v13);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF09028()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t *v16;
  void *v17;
  id v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  _BOOL4 v26;
  uint64_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t *v30;
  unint64_t v31;
  uint64_t v32;
  void *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  uint64_t v40;

  v1 = *(void **)(v0 + 232);
  v2 = *(_QWORD *)(v0 + 216);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 160);
  v5 = *(_QWORD *)(v0 + 168);
  v6 = (uint64_t *)(v0 + 88);
  v8 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 72);
  v9 = *(_QWORD *)(v0 + 56);
  swift_release();
  sub_1CAF09400(v9, v2, v8, v7);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  *(_QWORD *)(v0 + 16) = v1;
  v10 = v1;
  v11 = sub_1CAF2061C();
  v12 = swift_dynamicCast();
  v13 = *(_QWORD *)(v11 - 8);
  v14 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56);
  v15 = *(_QWORD *)(v0 + 88);
  if (!v12)
  {
    v14(*v6, 1, 1, v11);
LABEL_5:
    v6 = (uint64_t *)(v0 + 96);
    v17 = *(void **)(v0 + 232);
    sub_1CAEF5168(*(_QWORD *)(v0 + 88), &qword_1EF9903E0);
    *(_QWORD *)(v0 + 24) = v17;
    v18 = v17;
    v19 = sub_1CAF201FC();
    v20 = swift_dynamicCast();
    v21 = *(_QWORD *)(v19 - 8);
    v22 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 56);
    v23 = *(_QWORD *)(v0 + 96);
    if (v20)
    {
      v22(*v6, 0, 1, v19);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v21 + 48))(v23, 1, v19) != 1)
      {
        v16 = &qword_1EF9903D0;
        goto LABEL_8;
      }
    }
    else
    {
      v22(*v6, 1, 1, v19);
    }
    sub_1CAEF5168(*v6, &qword_1EF9903D0);
    goto LABEL_14;
  }
  v14(*v6, 0, 1, v11);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v13 + 48))(v15, 1, v11) == 1)
    goto LABEL_5;
  v16 = &qword_1EF9903E0;
LABEL_8:
  sub_1CAEF5168(*v6, v16);
  swift_retain_n();
  v24 = sub_1CAF202C8();
  v25 = sub_1CAF206B8();
  v26 = os_log_type_enabled(v24, v25);
  v27 = *(_QWORD *)(v0 + 56);
  if (v26)
  {
    v28 = (uint8_t *)swift_slowAlloc();
    v29 = swift_slowAlloc();
    v40 = v29;
    *(_DWORD *)v28 = 136315138;
    v30 = (uint64_t *)(v27 + *(_QWORD *)(*(_QWORD *)v27 + 104));
    v32 = *v30;
    v31 = v30[1];
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 32) = sub_1CAEDBE5C(v32, v31, &v40);
    sub_1CAF2076C();
    swift_release_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_1CAEBA000, v24, v25, "%s cancelled due to timeout", v28, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v29, -1, -1);
    MEMORY[0x1D179A698](v28, -1, -1);
  }
  else
  {
    swift_release_n();
  }

LABEL_14:
  v33 = *(void **)(v0 + 232);
  v35 = *(_QWORD *)(v0 + 128);
  v34 = *(char **)(v0 + 136);
  v36 = *(_QWORD *)(v0 + 120);
  v37 = *(_QWORD *)(v0 + 80);
  *(_QWORD *)v34 = v33;
  swift_storeEnumTagMultiPayload();
  v38 = v33;
  sub_1CAF07230(v34, v37);
  (*(void (**)(char *, uint64_t))(v35 + 8))(v34, v36);
  swift_willThrow();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF09400(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  unint64_t v15;
  NSObject *v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  int v21;
  char *v22;
  uint64_t v23;
  unint64_t v24;
  char *v25;
  char v26;
  char v27;
  const char *v28;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  os_signpost_id_t v33;
  os_log_t v34;
  void (*v35)(char *, uint64_t);
  uint64_t v36;
  os_log_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v41 = a3;
  v5 = sub_1CAF2028C();
  v39 = *(_QWORD *)(v5 - 8);
  v40 = v5;
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CAF2025C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v36 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v36 - v13;
  v15 = a4;
  swift_bridgeObjectRetain_n();
  v16 = sub_1CAF20274();
  sub_1CAF20298();
  v17 = sub_1CAF20718();
  if ((sub_1CAF20748() & 1) != 0)
  {
    v38 = v17;
    swift_retain();
    sub_1CAF202BC();
    swift_release();
    v19 = v39;
    v18 = v40;
    v20 = (*(uint64_t (**)(char *, uint64_t))(v39 + 88))(v7, v40);
    v21 = *MEMORY[0x1E0DF2190];
    v22 = v12;
    v23 = v8;
    v37 = v16;
    v24 = v15;
    v25 = v14;
    if (v20 == v21)
    {
      v26 = 0;
      v27 = 0;
      v28 = "[Error] Interval already ended";
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v19 + 8))(v7, v18);
      v28 = "%s";
      v27 = 2;
      v26 = 1;
    }
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v22, v25, v23);
    v30 = v22;
    v31 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v43 = v32;
    *(_BYTE *)v31 = v27;
    *(_BYTE *)(v31 + 1) = v26;
    *(_WORD *)(v31 + 2) = 2080;
    swift_bridgeObjectRetain();
    v42 = sub_1CAEDBE5C(v41, v24, &v43);
    sub_1CAF2076C();
    swift_bridgeObjectRelease_n();
    v33 = sub_1CAF20244();
    v34 = v37;
    _os_signpost_emit_with_name_impl(&dword_1CAEBA000, v37, (os_signpost_type_t)v38, v33, "fetch", v28, (uint8_t *)v31, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v32, -1, -1);
    MEMORY[0x1D179A698](v31, -1, -1);

    v35 = *(void (**)(char *, uint64_t))(v9 + 8);
    v35(v25, v23);
    return ((uint64_t (*)(char *, uint64_t))v35)(v30, v23);
  }
  else
  {

    swift_bridgeObjectRelease_n();
    return (*(uint64_t (**)(char *, uint64_t))(v9 + 8))(v14, v8);
  }
}

uint64_t sub_1CAF096F4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))((char *)&v7 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a2);
  sub_1CAF202F8();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(a1, a2);
}

uint64_t sub_1CAF09790(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (uint64_t *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CAEDCEDC;
  return sub_1CAF06270(a1, v4, v5, v6);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF0982C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (uint64_t *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1CAEDCEDC;
  return sub_1CAF065AC(a1, v4, v5, v6);
}

uint64_t sub_1CAF09898(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  _QWORD v12[4];

  v6 = *(_QWORD *)(*(_QWORD *)v4 + 80);
  v7 = type metadata accessor for AsyncLoader.State(0, v6, a3, a4);
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)v12 - v9;
  v12[2] = v6;
  swift_getKeyPath();
  v12[0] = v6;
  swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v8 + 16))(v10, a1, v7);
  swift_retain();
  return sub_1CAF20328();
}

uint64_t sub_1CAF09974()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_1CAF09980()
{
  return 8;
}

uint64_t sub_1CAF0998C()
{
  return sub_1CAF03E08();
}

uint64_t sub_1CAF099AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAF0AE00(a1, a2, a3, a4);
}

uint64_t sub_1CAF099CC()
{
  return 8;
}

void sub_1CAF099D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;

  type metadata accessor for AsyncLoader.State(255, *(_QWORD *)(a1 + 80), a3, a4);
  sub_1CAF20340();
  if (v4 <= 0x3F)
  {
    sub_1CAF20280();
    if (v5 <= 0x3F)
    {
      sub_1CAF202E0();
      if (v6 <= 0x3F)
      {
        sub_1CAF09C14();
        if (v7 <= 0x3F)
          swift_initClassMetadata2();
      }
    }
  }
}

uint64_t type metadata accessor for AsyncLoader(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for AsyncLoader);
}

uint64_t method lookup function for AsyncLoader()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AsyncLoader.state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 144))();
}

uint64_t dispatch thunk of AsyncLoader.$state.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 168))();
}

uint64_t dispatch thunk of AsyncLoader.__allocating_init(label:logger:initialValue:timeOut:fetch:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, char a7)
{
  uint64_t v7;

  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(v7 + 216))(a1, a2, a3, a4, a5, a6, a7 & 1);
}

uint64_t dispatch thunk of AsyncLoader.reload(priority:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 224) + *(_QWORD *)(*(_QWORD *)v2 + 224));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1CAEDCEDC;
  return v8(a1, a2);
}

uint64_t dispatch thunk of AsyncLoader.load(priority:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(*(_QWORD *)v2 + 232) + *(_QWORD *)(*(_QWORD *)v2 + 232));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1CAEDCC10;
  return v8(a1, a2);
}

uint64_t dispatch thunk of AsyncLoader.load(priority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 240))();
}

uint64_t dispatch thunk of AsyncLoader.reload(priority:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 248))();
}

uint64_t dispatch thunk of AsyncLoader.resetLoaderState()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 256))();
}

void sub_1CAF09C14()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1EF98FC80)
  {
    sub_1CAF2019C();
    v0 = sub_1CAF20754();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1EF98FC80);
  }
}

uint64_t sub_1CAF09C68()
{
  uint64_t result;
  unint64_t v1;
  uint64_t v2;
  char v3;
  char v4;
  uint64_t v5;
  char *v6;
  void *v7;
  uint64_t v8;
  char *v9;

  v5 = MEMORY[0x1E0DE9D48] + 64;
  result = swift_checkMetadataState();
  if (v1 <= 0x3F)
  {
    v2 = *(_QWORD *)(result - 8) + 64;
    swift_getTupleTypeLayout2();
    v6 = &v4;
    v7 = &unk_1CAF26220;
    v8 = v2;
    swift_getTupleTypeLayout2();
    v9 = &v3;
    swift_initEnumMetadataMultiPayload();
    return 0;
  }
  return result;
}

id *sub_1CAF09D28(id *__dst, id *__src, uint64_t a3)
{
  id *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  int v9;
  char *v11;
  uint64_t v13;
  id v14;
  id v15;

  v4 = __dst;
  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v7 <= v6)
    v7 = *(_QWORD *)(v5 + 64);
  if (v7 <= 8)
    v8 = 8;
  else
    v8 = v7;
  v9 = *(_DWORD *)(v5 + 80);
  if ((v9 & 0x1000F8) != 0 || (unint64_t)(v8 + 1) > 0x18)
  {
    v11 = (char *)*__src;
    *v4 = *__src;
    v4 = (id *)&v11[(unsigned __int16)((v9 & 0xF8) + 23) & (unsigned __int16)~(v9 & 0xF8) & 0x1F8];
LABEL_12:
    swift_retain();
  }
  else
  {
    if (*((unsigned __int8 *)__src + v8) >= 5u)
    {
      if (v8 <= 3)
        v13 = v8;
      else
        v13 = 4;
      __asm { BR              X14 }
    }
    switch(*((_BYTE *)__src + v8))
    {
      case 0:
        *__dst = *__src;
        *((_BYTE *)__dst + v8) = 0;
        goto LABEL_12;
      case 1:
        (*(void (**)(id *, id *))(v5 + 16))(__dst, __src);
        *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)__src + v6 + 7) & 0xFFFFFFFFFFFFF8);
        *((_BYTE *)v4 + v8) = 1;
        goto LABEL_12;
      case 2:
        v14 = *__src;
        v15 = *__src;
        *v4 = v14;
        *((_BYTE *)v4 + v8) = 2;
        break;
      case 3:
        (*(void (**)(id *, id *))(v5 + 16))(__dst, __src);
        *((_BYTE *)v4 + v8) = 3;
        break;
      case 4:
        (*(void (**)(id *, id *))(v5 + 16))(__dst, __src);
        *(_QWORD *)(((unint64_t)v4 + v6 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)__src + v6 + 7) & 0xFFFFFFFFFFFFF8);
        *((_BYTE *)v4 + v8) = 4;
        goto LABEL_12;
      default:
        memcpy(__dst, __src, *((unsigned __int8 *)__src + v8));
        break;
    }
  }
  return v4;
}

void sub_1CAF09F24(id *a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(*(_QWORD *)(a2 + 16) - 8);
  v3 = *(_QWORD *)(v2 + 64);
  v4 = ((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v4 <= v3)
    v4 = *(_QWORD *)(v2 + 64);
  if (v4 <= 8)
    v4 = 8;
  if (*((unsigned __int8 *)a1 + v4) >= 5u)
  {
    if (v4 <= 3)
      v5 = v4;
    else
      v5 = 4;
    __asm { BR              X14 }
  }
  switch(*((_BYTE *)a1 + v4))
  {
    case 0:
      goto LABEL_12;
    case 1:
    case 4:
      (*(void (**)(id *))(v2 + 8))(a1);
LABEL_12:
      swift_release();
      break;
    case 2:

      break;
    case 3:
      (*(void (**)(id *))(v2 + 8))(a1);
      break;
    default:
      return;
  }
}

_BYTE *sub_1CAF0A054(_BYTE *__dst, id *__src, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  id v11;
  id v12;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v7 <= v6)
    v7 = *(_QWORD *)(v5 + 64);
  if (v7 <= 8)
    v8 = 8;
  else
    v8 = v7;
  if (*((unsigned __int8 *)__src + v8) >= 5u)
  {
    if (v8 <= 3)
      v9 = v8;
    else
      v9 = 4;
    __asm { BR              X13 }
  }
  switch(*((_BYTE *)__src + v8))
  {
    case 0:
      *(_QWORD *)__dst = *__src;
      __dst[v8] = 0;
      goto LABEL_19;
    case 1:
      (*(void (**)(_BYTE *, id *))(v5 + 16))(__dst, __src);
      *(_QWORD *)((unint64_t)&__dst[v6 + 7] & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)__src + v6 + 7) & 0xFFFFFFFFFFFFF8);
      v10 = 1;
      goto LABEL_18;
    case 2:
      v11 = *__src;
      v12 = *__src;
      *(_QWORD *)__dst = v11;
      __dst[v8] = 2;
      return __dst;
    case 3:
      (*(void (**)(_BYTE *, id *))(v5 + 16))(__dst, __src);
      __dst[v8] = 3;
      return __dst;
    case 4:
      (*(void (**)(_BYTE *, id *))(v5 + 16))(__dst, __src);
      *(_QWORD *)((unint64_t)&__dst[v6 + 7] & 0xFFFFFFFFFFFFF8) = *(_QWORD *)(((unint64_t)__src + v6 + 7) & 0xFFFFFFFFFFFFF8);
      v10 = 4;
LABEL_18:
      __dst[v8] = v10;
LABEL_19:
      swift_retain();
      break;
    default:
      memcpy(__dst, __src, v8 + 1);
      break;
  }
  return __dst;
}

id *sub_1CAF0A210(id *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  id v13;
  id v14;

  if (__dst != (id *)__src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    if (v8 <= v7)
      v8 = *(_QWORD *)(v6 + 64);
    if (v8 <= 8)
      v9 = 8;
    else
      v9 = v8;
    if (*((unsigned __int8 *)__dst + v9) >= 5u)
    {
      if (v9 <= 3)
        v10 = v9;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    switch(*((_BYTE *)__dst + v9))
    {
      case 0:
        goto LABEL_14;
      case 1:
      case 4:
        (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
LABEL_14:
        swift_release();
        break;
      case 2:

        break;
      case 3:
        (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
        break;
      default:
        break;
    }
    if (__src[v9] >= 5u)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    switch(__src[v9])
    {
      case 0u:
        *__dst = *(id *)__src;
        *((_BYTE *)__dst + v9) = 0;
        goto LABEL_30;
      case 1u:
        (*(void (**)(id *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
        *(_QWORD *)(((unint64_t)__dst + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((unint64_t)&__src[v7 + 7] & 0xFFFFFFFFFFFFF8);
        v12 = 1;
        goto LABEL_29;
      case 2u:
        v13 = *(id *)__src;
        v14 = v13;
        *__dst = v13;
        *((_BYTE *)__dst + v9) = 2;
        return __dst;
      case 3u:
        (*(void (**)(id *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
        *((_BYTE *)__dst + v9) = 3;
        return __dst;
      case 4u:
        (*(void (**)(id *, unsigned __int8 *, uint64_t))(v6 + 16))(__dst, __src, v5);
        *(_QWORD *)(((unint64_t)__dst + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((unint64_t)&__src[v7 + 7] & 0xFFFFFFFFFFFFF8);
        v12 = 4;
LABEL_29:
        *((_BYTE *)__dst + v9) = v12;
LABEL_30:
        swift_retain();
        break;
      default:
        memcpy(__dst, __src, v9 + 1);
        break;
    }
  }
  return __dst;
}

_BYTE *sub_1CAF0A4C8(_BYTE *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;

  v5 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v6 = *(_QWORD *)(v5 + 64);
  v7 = ((v6 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v7 <= v6)
    v7 = *(_QWORD *)(v5 + 64);
  if (v7 <= 8)
    v8 = 8;
  else
    v8 = v7;
  if (__src[v8] >= 5u)
  {
    if (v8 <= 3)
      v9 = v8;
    else
      v9 = 4;
    __asm { BR              X13 }
  }
  switch(__src[v8])
  {
    case 0u:
      *(_QWORD *)__dst = *(_QWORD *)__src;
      __dst[v8] = 0;
      return __dst;
    case 1u:
      (*(void (**)(_BYTE *, unsigned __int8 *))(v5 + 32))(__dst, __src);
      *(_QWORD *)((unint64_t)&__dst[v6 + 7] & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((unint64_t)&__src[v6 + 7] & 0xFFFFFFFFFFFFF8);
      v10 = 1;
      goto LABEL_18;
    case 2u:
      *(_QWORD *)__dst = *(_QWORD *)__src;
      v10 = 2;
      goto LABEL_18;
    case 3u:
      (*(void (**)(_BYTE *, unsigned __int8 *))(v5 + 32))(__dst, __src);
      v10 = 3;
      goto LABEL_18;
    case 4u:
      (*(void (**)(_BYTE *, unsigned __int8 *))(v5 + 32))(__dst, __src);
      *(_QWORD *)((unint64_t)&__dst[v6 + 7] & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((unint64_t)&__src[v6 + 7] & 0xFFFFFFFFFFFFF8);
      v10 = 4;
LABEL_18:
      __dst[v8] = v10;
      break;
    default:
      memcpy(__dst, __src, v8 + 1);
      break;
  }
  return __dst;
}

id *sub_1CAF0A670(id *__dst, unsigned __int8 *__src, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;

  if (__dst != (id *)__src)
  {
    v5 = *(_QWORD *)(a3 + 16);
    v6 = *(_QWORD *)(v5 - 8);
    v7 = *(_QWORD *)(v6 + 64);
    v8 = ((v7 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
    if (v8 <= v7)
      v8 = *(_QWORD *)(v6 + 64);
    if (v8 <= 8)
      v9 = 8;
    else
      v9 = v8;
    if (*((unsigned __int8 *)__dst + v9) >= 5u)
    {
      if (v9 <= 3)
        v10 = v9;
      else
        v10 = 4;
      __asm { BR              X12 }
    }
    switch(*((_BYTE *)__dst + v9))
    {
      case 0:
        goto LABEL_14;
      case 1:
      case 4:
        (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
LABEL_14:
        swift_release();
        break;
      case 2:

        break;
      case 3:
        (*(void (**)(id *, _QWORD))(v6 + 8))(__dst, *(_QWORD *)(a3 + 16));
        break;
      default:
        break;
    }
    if (__src[v9] >= 5u)
    {
      if (v9 <= 3)
        v11 = v9;
      else
        v11 = 4;
      __asm { BR              X12 }
    }
    switch(__src[v9])
    {
      case 0u:
        *__dst = *(id *)__src;
        *((_BYTE *)__dst + v9) = 0;
        return __dst;
      case 1u:
        (*(void (**)(id *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
        *(_QWORD *)(((unint64_t)__dst + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((unint64_t)&__src[v7 + 7] & 0xFFFFFFFFFFFFF8);
        v12 = 1;
        goto LABEL_29;
      case 2u:
        *__dst = *(id *)__src;
        v12 = 2;
        goto LABEL_29;
      case 3u:
        (*(void (**)(id *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
        v12 = 3;
        goto LABEL_29;
      case 4u:
        (*(void (**)(id *, unsigned __int8 *, uint64_t))(v6 + 32))(__dst, __src, v5);
        *(_QWORD *)(((unint64_t)__dst + v7 + 7) & 0xFFFFFFFFFFFFF8) = *(_QWORD *)((unint64_t)&__src[v7 + 7] & 0xFFFFFFFFFFFFF8);
        v12 = 4;
LABEL_29:
        *((_BYTE *)__dst + v9) = v12;
        break;
      default:
        memcpy(__dst, __src, v9 + 1);
        break;
    }
  }
  return __dst;
}

uint64_t sub_1CAF0A914(uint64_t a1, unsigned int a2, uint64_t a3)
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  int v7;
  unsigned int v9;
  int v10;
  unsigned int v11;

  v3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > v3)
    v3 = ((v3 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  v4 = 8;
  if (v3 > 8)
    v4 = v3;
  if (!a2)
    return 0;
  if (a2 < 0xFB)
    goto LABEL_23;
  v5 = v4 + 1;
  v6 = 8 * (v4 + 1);
  if ((v4 + 1) <= 3)
  {
    v9 = ((a2 + ~(-1 << v6) - 250) >> v6) + 1;
    if (HIWORD(v9))
    {
      v7 = *(_DWORD *)(a1 + v5);
      if (!v7)
        goto LABEL_23;
      goto LABEL_16;
    }
    if (v9 > 0xFF)
    {
      v7 = *(unsigned __int16 *)(a1 + v5);
      if (!*(_WORD *)(a1 + v5))
        goto LABEL_23;
      goto LABEL_16;
    }
    if (v9 < 2)
    {
LABEL_23:
      v11 = *(unsigned __int8 *)(a1 + v4);
      if (v11 >= 6)
        return (v11 ^ 0xFF) + 1;
      else
        return 0;
    }
  }
  v7 = *(unsigned __int8 *)(a1 + v5);
  if (!*(_BYTE *)(a1 + v5))
    goto LABEL_23;
LABEL_16:
  v10 = (v7 - 1) << v6;
  if (v5 > 3)
    v10 = 0;
  if (!(_DWORD)v5)
    return (v10 + 251);
  if (v5 > 3)
    LODWORD(v5) = 4;
  return ((uint64_t (*)(void))((char *)&loc_1CAF0A9EC + 4 * byte_1CAF260F0[(v5 - 1)]))();
}

void sub_1CAF0AA38(_WORD *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  unint64_t v5;
  size_t v6;
  unsigned int v7;
  unsigned int v8;
  unsigned int v9;
  int v10;

  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a4 + 16) - 8) + 64);
  if (((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > v5)
    v5 = ((v5 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v5 <= 8)
    v5 = 8;
  v6 = v5 + 1;
  if (a3 < 0xFB)
  {
    v7 = 0u;
  }
  else if (v6 <= 3)
  {
    v9 = ((a3 + ~(-1 << (8 * v6)) - 250) >> (8 * v6)) + 1;
    if (HIWORD(v9))
    {
      v7 = 4u;
    }
    else if (v9 >= 0x100)
    {
      v7 = 2;
    }
    else
    {
      v7 = v9 > 1;
    }
  }
  else
  {
    v7 = 1u;
  }
  if (a2 <= 0xFA)
    __asm { BR              X11 }
  v8 = a2 - 251;
  if (v6 < 4)
  {
    if ((_DWORD)v5 != -1)
    {
      v10 = v8 & ~(-1 << (8 * v6));
      bzero(a1, v6);
      if ((_DWORD)v6 == 3)
      {
        *a1 = v10;
        *((_BYTE *)a1 + 2) = BYTE2(v10);
      }
      else if ((_DWORD)v6 == 2)
      {
        *a1 = v10;
      }
      else
      {
        *(_BYTE *)a1 = v10;
      }
    }
  }
  else
  {
    bzero(a1, v5 + 1);
    *(_DWORD *)a1 = v8;
  }
  __asm { BR              X10 }
}

uint64_t sub_1CAF0ABF4(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 64);
  if (((v2 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > v2)
    v2 = ((v2 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  v3 = 8;
  if (v2 > 8)
    v3 = v2;
  if (*(unsigned __int8 *)(a1 + v3) < 5u)
    return *(unsigned __int8 *)(a1 + v3);
  if (v3 <= 3)
    v4 = v3;
  else
    v4 = 4;
  return ((uint64_t (*)(void))((char *)&loc_1CAF0AC50 + 4 * byte_1CAF260FE[v4]))();
}

void sub_1CAF0AC98(_BYTE *a1, unsigned int a2, uint64_t a3)
{
  unint64_t v4;
  size_t v5;
  unsigned int v6;
  unsigned int v7;
  int v8;

  v4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a3 + 16) - 8) + 64);
  if (((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8 > v4)
    v4 = ((v4 + 7) & 0xFFFFFFFFFFFFFFF8) + 8;
  if (v4 <= 8)
    v5 = 8;
  else
    v5 = v4;
  if (a2 > 4)
  {
    v6 = a2 - 5;
    if (v5 < 4)
    {
      v7 = v6 >> (8 * v5);
      v8 = v6 & ~(-1 << (8 * v5));
      a1[v5] = v7 + 5;
      bzero(a1, v5);
      if ((_DWORD)v5 == 3)
      {
        *(_WORD *)a1 = v8;
        a1[2] = BYTE2(v8);
      }
      else if ((_DWORD)v5 == 2)
      {
        *(_WORD *)a1 = v8;
      }
      else
      {
        *a1 = v8;
      }
    }
    else
    {
      a1[v5] = 5;
      bzero(a1, v5);
      *(_DWORD *)a1 = v6;
    }
  }
  else
  {
    a1[v5] = a2;
  }
}

uint64_t sub_1CAF0AD74(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FC78);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1CAF0ADBC(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CAF0AE00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  type metadata accessor for AsyncLoader.State(255, *(_QWORD *)(*(_QWORD *)v4 + 80), a3, a4);
  v6 = sub_1CAF20334();
  MEMORY[0x1E0C80A78](v6);
  (*(void (**)(char *, uint64_t))(v7 + 16))((char *)&v10 - v8, a1);
  swift_beginAccess();
  sub_1CAF20340();
  sub_1CAF20310();
  return swift_endAccess();
}

uint64_t sub_1CAF0AEC8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = sub_1CAF2019C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CAF0AF4C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = *(unsigned __int8 *)(*(_QWORD *)(sub_1CAF2019C() - 8) + 80);
  v5 = v1[2];
  v6 = v1[3];
  v7 = (uint64_t *)v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = (uint64_t)v1 + ((v4 + 64) & ~v4);
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1CAEDCEDC;
  return sub_1CAF08ACC(a1, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1CAF0AFF4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    v5 = sub_1CAF2019C();
    result = MEMORY[0x1D179A5CC](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

id sub_1CAF0B048()
{
  uint64_t v0;
  id v1;

  v0 = sub_1CAF20394();
  v1 = _sSo9ACAccountC12FamilyCircleE10fa_account4withABSgSDySSypG_tFZ_0(v0);
  swift_bridgeObjectRelease();
  return v1;
}

id _sSo9ACAccountC12FamilyCircleE10fa_account4withABSgSDySSypG_tFZ_0(uint64_t a1)
{
  id v2;
  void *v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  unint64_t v11;
  char v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  unint64_t v19;
  char v20;
  uint64_t *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  os_log_type_t v31;
  uint8_t *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char v36;
  uint64_t v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  NSObject *v45;
  os_log_type_t v46;
  uint8_t *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  char v52;
  uint64_t v53;
  _QWORD *v54;
  uint64_t v55;
  uint64_t v56;
  char *v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  NSObject *v64;
  id v65;
  id v67;
  _QWORD v68[3];
  uint64_t v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  sub_1CAF20400();
  v2 = objc_allocWithZone(MEMORY[0x1E0C8F2C8]);
  v3 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  v4 = objc_msgSend(v2, sel_initWithIdentifier_description_, v3, 0);

  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C8F298]), sel_initWithAccountType_, v4);
  if (v5)
  {
    v6 = sub_1CAF20400();
    v8 = v7;
    if (*(_QWORD *)(a1 + 16))
    {
      v9 = v6;
      v10 = v5;
      v11 = sub_1CAEDE164(v9, v8);
      if ((v12 & 1) != 0)
      {
        sub_1CAEDCD8C(*(_QWORD *)(a1 + 56) + 32 * v11, (uint64_t)&v72);
        swift_bridgeObjectRelease();
        if (*((_QWORD *)&v73 + 1))
        {
          if ((swift_dynamicCast() & 1) != 0)
          {
            v13 = (void *)sub_1CAF203DC();
            swift_bridgeObjectRelease();
LABEL_12:
            objc_msgSend(v5, sel_setUsername_, v13);

            goto LABEL_13;
          }
LABEL_11:
          v13 = 0;
          goto LABEL_12;
        }
LABEL_10:
        sub_1CAF0B888((uint64_t)&v72);
        goto LABEL_11;
      }
      v72 = 0u;
      v73 = 0u;
    }
    else
    {
      v72 = 0u;
      v73 = 0u;
      v14 = v5;
    }
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
LABEL_13:
  v15 = sub_1CAF20400();
  if (*(_QWORD *)(a1 + 16) && (v17 = sub_1CAEDE164(v15, v16), (v18 & 1) != 0))
  {
    sub_1CAEDCD8C(*(_QWORD *)(a1 + 56) + 32 * v17, (uint64_t)&v72);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v73 + 1))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991618);
    if ((swift_dynamicCast() & 1) != 0)
    {
      if (*(_QWORD *)(v70 + 16))
      {
        v19 = sub_1CAEDE164(0xD000000000000015, 0x80000001CAF2B690);
        if ((v20 & 1) != 0)
        {
          v21 = (uint64_t *)(*(_QWORD *)(v70 + 56) + 16 * v19);
          v23 = *v21;
          v22 = v21[1];
          swift_bridgeObjectRetain();
          swift_bridgeObjectRelease();
          v24 = HIBYTE(v22) & 0xF;
          if ((v22 & 0x2000000000000000) == 0)
            v24 = v23 & 0xFFFFFFFFFFFFLL;
          if (v24)
          {
            v25 = objc_allocWithZone(MEMORY[0x1E0C8F2B0]);
            swift_bridgeObjectRetain();
            v26 = (void *)sub_1CAF203DC();
            swift_bridgeObjectRelease();
            v27 = objc_msgSend(v25, sel_initWithPassword_, v26);

            if (v27)
            {
              v28 = v27;
              v29 = (void *)sub_1CAF203DC();
              swift_bridgeObjectRelease();
              -[NSObject setToken:](v28, sel_setToken_, v29);

            }
            else
            {
              swift_bridgeObjectRelease();
            }
            v67 = v5;
            objc_msgSend(v67, sel_setCredential_, v27);

            goto LABEL_32;
          }
        }
      }
      swift_bridgeObjectRelease();
    }
  }
  else
  {
    sub_1CAF0B888((uint64_t)&v72);
  }
  if (qword_1ECFCE888 != -1)
    swift_once();
  v30 = sub_1CAF202E0();
  __swift_project_value_buffer(v30, (uint64_t)qword_1ECFCE8A8);
  v27 = sub_1CAF202C8();
  v31 = sub_1CAF206A0();
  if (os_log_type_enabled(v27, v31))
  {
    v32 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v32 = 0;
    _os_log_impl(&dword_1CAEBA000, v27, v31, "ACAccount.fa_account(with ephemeralAuthResults:) no token set on account", v32, 2u);
    MEMORY[0x1D179A698](v32, -1, -1);
  }
LABEL_32:

  v33 = sub_1CAF20400();
  if (*(_QWORD *)(a1 + 16) && (v35 = sub_1CAEDE164(v33, v34), (v36 & 1) != 0))
  {
    sub_1CAEDCD8C(*(_QWORD *)(a1 + 56) + 32 * v35, (uint64_t)&v72);
  }
  else
  {
    v72 = 0u;
    v73 = 0u;
  }
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v73 + 1))
  {
    if (v5)
    {
      sub_1CAEF4BE8((uint64_t)&v72, (uint64_t)&v70);
      v37 = *((_QWORD *)&v71 + 1);
      if (*((_QWORD *)&v71 + 1))
      {
        v38 = __swift_project_boxed_opaque_existential_1(&v70, *((uint64_t *)&v71 + 1));
        v39 = *(_QWORD *)(v37 - 8);
        MEMORY[0x1E0C80A78](v38);
        v41 = (char *)v68 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
        (*(void (**)(char *))(v39 + 16))(v41);
        v42 = v5;
        v43 = sub_1CAF20994();
        (*(void (**)(char *, uint64_t))(v39 + 8))(v41, v37);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v70);
      }
      else
      {
        v48 = v5;
        v43 = 0;
      }
      objc_msgSend(v5, sel_setAccountProperty_forKey_, v43, *MEMORY[0x1E0D00058]);

      swift_unknownObjectRelease();
    }
  }
  else
  {
    if (qword_1ECFCE888 != -1)
      swift_once();
    v44 = sub_1CAF202E0();
    __swift_project_value_buffer(v44, (uint64_t)qword_1ECFCE8A8);
    v45 = sub_1CAF202C8();
    v46 = sub_1CAF206A0();
    if (os_log_type_enabled(v45, v46))
    {
      v47 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v47 = 0;
      _os_log_impl(&dword_1CAEBA000, v45, v46, "ACAccount.fa_account(with ephemeralAuthResults:) dsid is nil!", v47, 2u);
      MEMORY[0x1D179A698](v47, -1, -1);
    }

  }
  v49 = sub_1CAF20400();
  if (*(_QWORD *)(a1 + 16) && (v51 = sub_1CAEDE164(v49, v50), (v52 & 1) != 0))
  {
    sub_1CAEDCD8C(*(_QWORD *)(a1 + 56) + 32 * v51, (uint64_t)&v70);
  }
  else
  {
    v70 = 0u;
    v71 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v71 + 1))
  {
    if (qword_1ECFCE888 != -1)
      swift_once();
    v60 = sub_1CAF202E0();
    __swift_project_value_buffer(v60, (uint64_t)qword_1ECFCE8A8);
    v61 = sub_1CAF202C8();
    v62 = sub_1CAF206A0();
    if (os_log_type_enabled(v61, v62))
    {
      v63 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v63 = 0;
      _os_log_impl(&dword_1CAEBA000, v61, v62, "ACAccount.fa_account(with ephemeralAuthResults:) altdsid is nil!", v63, 2u);
      MEMORY[0x1D179A698](v63, -1, -1);
      v64 = v4;
      v4 = v61;
    }
    else
    {
      v64 = v61;
    }
    goto LABEL_62;
  }
  if (v5)
  {
    sub_1CAEF4BE8((uint64_t)&v70, (uint64_t)v68);
    v53 = v69;
    if (v69)
    {
      v54 = __swift_project_boxed_opaque_existential_1(v68, v69);
      v55 = *(_QWORD *)(v53 - 8);
      MEMORY[0x1E0C80A78](v54);
      v57 = (char *)v68 - ((v56 + 15) & 0xFFFFFFFFFFFFFFF0);
      (*(void (**)(char *))(v55 + 16))(v57);
      v58 = v5;
      v59 = sub_1CAF20994();
      (*(void (**)(char *, uint64_t))(v55 + 8))(v57, v53);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v68);
    }
    else
    {
      v65 = v5;
      v59 = 0;
    }
    v64 = (id)*MEMORY[0x1E0CFFF00];
    objc_msgSend(v5, sel_setAccountProperty_forKey_, v59, v64);

    swift_unknownObjectRelease();
LABEL_62:

  }
  sub_1CAF0B888((uint64_t)&v70);
  sub_1CAF0B888((uint64_t)&v72);
  return v5;
}

uint64_t sub_1CAF0B888(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EF9903E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t ACAccount.fa_isSuspended.getter()
{
  void *v0;
  id v1;
  void *v2;
  unsigned __int8 v3;

  v1 = objc_msgSend(v0, sel_aa_suspensionInfo);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_isFamilySuspended);

    if ((v3 & 1) != 0)
      return 1;
  }
  if (!objc_msgSend(v0, sel_aa_isPrimaryEmailVerified))
    return 1;
  else
    return (uint64_t)objc_msgSend(v0, sel_aa_isSuspended);
}

id static FamilyError.createError(_:domain:code:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t inited;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
  *(_QWORD *)(inited + 32) = sub_1CAF20400();
  *(_QWORD *)(inited + 40) = v9;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 64) = sub_1CAF20400();
  *(_QWORD *)(inited + 72) = v10;
  *(_QWORD *)(inited + 80) = a1;
  *(_QWORD *)(inited + 88) = a2;
  swift_bridgeObjectRetain_n();
  v11 = sub_1CAF0BA9C(inited);
  swift_bridgeObjectRetain();
  sub_1CAF0BF38(v11);
  swift_bridgeObjectRelease();
  v12 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  v13 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  v14 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v12, sel_initWithDomain_code_userInfo_, v13, a5, v14);

  return v15;
}

unint64_t sub_1CAF0BA9C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  _QWORD *v12;
  uint64_t v13;
  BOOL v14;
  uint64_t v15;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD18);
  v2 = (_QWORD *)sub_1CAF208EC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (uint64_t *)(a1 + 56);
  while (1)
  {
    v5 = *(v4 - 3);
    v6 = *(v4 - 2);
    v8 = *(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    result = sub_1CAEDE164(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    v12 = (_QWORD *)(v2[7] + 16 * result);
    *v12 = v8;
    v12[1] = v7;
    v13 = v2[2];
    v14 = __OFADD__(v13, 1);
    v15 = v13 + 1;
    if (v14)
      goto LABEL_11;
    v4 += 4;
    v2[2] = v15;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CAF0BBBC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  _OWORD v15[2];
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991258);
  v2 = sub_1CAF208EC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1CAF0ADBC(v6, (uint64_t)v15, &qword_1EF991638);
    result = sub_1CAEDE8B0((uint64_t)v15);
    if ((v8 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v9 = v3[6] + 40 * result;
    v10 = v15[0];
    v11 = v15[1];
    *(_QWORD *)(v9 + 32) = v16;
    *(_OWORD *)v9 = v10;
    *(_OWORD *)(v9 + 16) = v11;
    result = (unint64_t)sub_1CAEEBF2C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 72;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CAF0BCFC(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD20);
  v2 = sub_1CAF208EC();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_1CAF0ADBC(v6, (uint64_t)&v15, &qword_1EF991628);
    v7 = v15;
    v8 = v16;
    result = sub_1CAEDE164(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_1CAEEBF2C(&v17, (_OWORD *)(v3[7] + 32 * result));
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 48;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CAF0BE30(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  void *v5;
  id v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991630);
  v2 = (_QWORD *)sub_1CAF208EC();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 40);
  while (1)
  {
    v5 = *v4;
    v6 = *(v4 - 1);
    v7 = v5;
    result = sub_1CAEDE938((uint64_t)v6);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = 8 * result;
    *(_QWORD *)(v2[6] + v10) = v6;
    *(_QWORD *)(v2[7] + v10) = v7;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v2[2] = v13;
    v4 += 2;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_1CAF0BF38(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t *v7;
  unint64_t result;
  int64_t i;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  _OWORD *v18;
  unint64_t v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;
  int64_t v23;
  uint64_t *v24;
  unint64_t v25;
  char v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  int64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  _OWORD v40[2];

  v1 = a1;
  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD20);
    v2 = (_QWORD *)sub_1CAF208EC();
  }
  else
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
  }
  v32 = v1 + 64;
  v3 = -1 << *(_BYTE *)(v1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(v1 + 64);
  v31 = (unint64_t)(63 - v3) >> 6;
  v6 = &v37;
  v7 = &v39;
  result = swift_bridgeObjectRetain();
  i = 0;
  v10 = MEMORY[0x1E0DEE9B8] + 8;
  v11 = MEMORY[0x1E0DEA968];
  if (v5)
    goto LABEL_10;
LABEL_11:
  v20 = i + 1;
  if (__OFADD__(i, 1))
    goto LABEL_35;
  if (v20 >= v31)
    goto LABEL_32;
  v21 = *(_QWORD *)(v32 + 8 * v20);
  v22 = i + 1;
  if (!v21)
  {
    v22 = i + 2;
    if (i + 2 >= v31)
      goto LABEL_32;
    v21 = *(_QWORD *)(v32 + 8 * v22);
    if (!v21)
    {
      v22 = i + 3;
      if (i + 3 >= v31)
        goto LABEL_32;
      v21 = *(_QWORD *)(v32 + 8 * v22);
      if (!v21)
      {
        v22 = i + 4;
        if (i + 4 >= v31)
          goto LABEL_32;
        v21 = *(_QWORD *)(v32 + 8 * v22);
        if (!v21)
        {
          v23 = i + 5;
          if (i + 5 < v31)
          {
            v21 = *(_QWORD *)(v32 + 8 * v23);
            if (v21)
            {
              v22 = i + 5;
              goto LABEL_26;
            }
            while (1)
            {
              v22 = v23 + 1;
              if (__OFADD__(v23, 1))
                goto LABEL_36;
              if (v22 >= v31)
                break;
              v21 = *(_QWORD *)(v32 + 8 * v22);
              ++v23;
              if (v21)
                goto LABEL_26;
            }
          }
LABEL_32:
          sub_1CAEFDC78();
          return (unint64_t)v2;
        }
      }
    }
  }
LABEL_26:
  v34 = (v21 - 1) & v21;
  v19 = __clz(__rbit64(v21)) + (v22 << 6);
  for (i = v22; ; v19 = __clz(__rbit64(v5)) | (i << 6))
  {
    v24 = (uint64_t *)(*(_QWORD *)(v1 + 48) + 16 * v19);
    v35 = *v24;
    v36 = v24[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1CAEEBF2C(v6, v7);
    sub_1CAEEBF2C(v7, v40);
    sub_1CAEEBF2C(v40, &v38);
    result = sub_1CAEDE164(v35, v36);
    v25 = result;
    if ((v26 & 1) != 0)
    {
      v33 = i;
      v12 = v7;
      v13 = v6;
      v14 = v1;
      v15 = v11;
      v16 = v10;
      v17 = (uint64_t *)(v2[6] + 16 * result);
      swift_bridgeObjectRelease();
      *v17 = v35;
      v17[1] = v36;
      v10 = v16;
      v11 = v15;
      v1 = v14;
      v6 = v13;
      v7 = v12;
      i = v33;
      v18 = (_OWORD *)(v2[7] + 32 * v25);
      __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v18);
      result = (unint64_t)sub_1CAEEBF2C(&v38, v18);
      v5 = v34;
      if (!v34)
        goto LABEL_11;
      goto LABEL_10;
    }
    if (v2[2] >= v2[3])
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v27 = (uint64_t *)(v2[6] + 16 * result);
    *v27 = v35;
    v27[1] = v36;
    result = (unint64_t)sub_1CAEEBF2C(&v38, (_OWORD *)(v2[7] + 32 * result));
    v28 = v2[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
      goto LABEL_34;
    v2[2] = v30;
    v5 = v34;
    if (!v34)
      goto LABEL_11;
LABEL_10:
    v34 = (v5 - 1) & v5;
  }
  __break(1u);
LABEL_34:
  __break(1u);
LABEL_35:
  __break(1u);
LABEL_36:
  __break(1u);
  return result;
}

uint64_t sub_1CAF0C2A0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  char v23;
  unint64_t v24;
  BOOL v25;
  uint64_t v26;
  int64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  _OWORD v32[2];
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  _OWORD v36[2];
  _OWORD v37[3];
  _OWORD v38[2];
  __int128 v39;
  _OWORD v40[2];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991258);
    v2 = sub_1CAF208EC();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v28 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v27 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v27)
        goto LABEL_37;
      v14 = *(_QWORD *)(v28 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v27)
          goto LABEL_37;
        v14 = *(_QWORD *)(v28 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v27)
            goto LABEL_37;
          v14 = *(_QWORD *)(v28 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (uint64_t *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v19 = *v17;
    v18 = v17[1];
    sub_1CAEDCD8C(*(_QWORD *)(a1 + 56) + 32 * v12, (uint64_t)v40);
    *(_QWORD *)&v39 = v19;
    *((_QWORD *)&v39 + 1) = v18;
    v37[2] = v39;
    v38[0] = v40[0];
    v38[1] = v40[1];
    *(_QWORD *)&v37[0] = v19;
    *((_QWORD *)&v37[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    sub_1CAEEBF2C(v38, v32);
    v33 = v29;
    v34 = v30;
    v35 = v31;
    sub_1CAEEBF2C(v32, v36);
    v29 = v33;
    v30 = v34;
    v31 = v35;
    sub_1CAEEBF2C(v36, v37);
    sub_1CAEEBF2C(v37, &v33);
    result = sub_1CAF207D8();
    v20 = -1 << *(_BYTE *)(v2 + 32);
    v21 = result & ~v20;
    v22 = v21 >> 6;
    if (((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v21) & ~*(_QWORD *)(v6 + 8 * (v21 >> 6)))) | v21 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v23 = 0;
      v24 = (unint64_t)(63 - v20) >> 6;
      do
      {
        if (++v22 == v24 && (v23 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v25 = v22 == v24;
        if (v22 == v24)
          v22 = 0;
        v23 |= v25;
        v26 = *(_QWORD *)(v6 + 8 * v22);
      }
      while (v26 == -1);
      v9 = __clz(__rbit64(~v26)) + (v22 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v29;
    *(_OWORD *)(v10 + 16) = v30;
    *(_QWORD *)(v10 + 32) = v31;
    result = (uint64_t)sub_1CAEEBF2C(&v33, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v27)
  {
LABEL_37:
    swift_release();
    sub_1CAEFDC78();
    return v2;
  }
  v14 = *(_QWORD *)(v28 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v27)
      goto LABEL_37;
    v14 = *(_QWORD *)(v28 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

uint64_t sub_1CAF0C664(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  int64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  int64_t v16;
  _QWORD *v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  char v22;
  unint64_t v23;
  BOOL v24;
  uint64_t v25;
  int64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _OWORD v35[2];
  _OWORD v36[3];

  if (*(_QWORD *)(a1 + 16))
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991258);
    v2 = sub_1CAF208EC();
  }
  else
  {
    v2 = MEMORY[0x1E0DEE9E0];
  }
  v27 = a1 + 64;
  v3 = -1 << *(_BYTE *)(a1 + 32);
  if (-v3 < 64)
    v4 = ~(-1 << -(char)v3);
  else
    v4 = -1;
  v5 = v4 & *(_QWORD *)(a1 + 64);
  v26 = (unint64_t)(63 - v3) >> 6;
  v6 = v2 + 64;
  swift_bridgeObjectRetain();
  result = swift_retain();
  v8 = 0;
  while (1)
  {
    if (v5)
    {
      v11 = __clz(__rbit64(v5));
      v5 &= v5 - 1;
      v12 = v11 | (v8 << 6);
      goto LABEL_28;
    }
    v13 = v8 + 1;
    if (__OFADD__(v8, 1))
    {
LABEL_38:
      __break(1u);
      goto LABEL_39;
    }
    if (v13 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v13);
    v15 = v8 + 1;
    if (!v14)
    {
      v15 = v8 + 2;
      if (v8 + 2 >= v26)
        goto LABEL_37;
      v14 = *(_QWORD *)(v27 + 8 * v15);
      if (!v14)
      {
        v15 = v8 + 3;
        if (v8 + 3 >= v26)
          goto LABEL_37;
        v14 = *(_QWORD *)(v27 + 8 * v15);
        if (!v14)
        {
          v15 = v8 + 4;
          if (v8 + 4 >= v26)
            goto LABEL_37;
          v14 = *(_QWORD *)(v27 + 8 * v15);
          if (!v14)
            break;
        }
      }
    }
LABEL_27:
    v5 = (v14 - 1) & v14;
    v12 = __clz(__rbit64(v14)) + (v15 << 6);
    v8 = v15;
LABEL_28:
    v17 = (_QWORD *)(*(_QWORD *)(a1 + 48) + 16 * v12);
    v18 = v17[1];
    *(_QWORD *)&v36[0] = *v17;
    *((_QWORD *)&v36[0] + 1) = v18;
    swift_bridgeObjectRetain();
    swift_dynamicCast();
    swift_dynamicCast();
    v32 = v28;
    v33 = v29;
    v34 = v30;
    sub_1CAEEBF2C(&v31, v35);
    v28 = v32;
    v29 = v33;
    v30 = v34;
    sub_1CAEEBF2C(v35, v36);
    sub_1CAEEBF2C(v36, &v32);
    result = sub_1CAF207D8();
    v19 = -1 << *(_BYTE *)(v2 + 32);
    v20 = result & ~v19;
    v21 = v20 >> 6;
    if (((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6))) != 0)
    {
      v9 = __clz(__rbit64((-1 << v20) & ~*(_QWORD *)(v6 + 8 * (v20 >> 6)))) | v20 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v22 = 0;
      v23 = (unint64_t)(63 - v19) >> 6;
      do
      {
        if (++v21 == v23 && (v22 & 1) != 0)
        {
          __break(1u);
          goto LABEL_38;
        }
        v24 = v21 == v23;
        if (v21 == v23)
          v21 = 0;
        v22 |= v24;
        v25 = *(_QWORD *)(v6 + 8 * v21);
      }
      while (v25 == -1);
      v9 = __clz(__rbit64(~v25)) + (v21 << 6);
    }
    *(_QWORD *)(v6 + ((v9 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v9;
    v10 = *(_QWORD *)(v2 + 48) + 40 * v9;
    *(_OWORD *)v10 = v28;
    *(_OWORD *)(v10 + 16) = v29;
    *(_QWORD *)(v10 + 32) = v30;
    result = (uint64_t)sub_1CAEEBF2C(&v32, (_OWORD *)(*(_QWORD *)(v2 + 56) + 32 * v9));
    ++*(_QWORD *)(v2 + 16);
  }
  v16 = v8 + 5;
  if (v8 + 5 >= v26)
  {
LABEL_37:
    swift_release();
    sub_1CAEFDC78();
    return v2;
  }
  v14 = *(_QWORD *)(v27 + 8 * v16);
  if (v14)
  {
    v15 = v8 + 5;
    goto LABEL_27;
  }
  while (1)
  {
    v15 = v16 + 1;
    if (__OFADD__(v16, 1))
      break;
    if (v15 >= v26)
      goto LABEL_37;
    v14 = *(_QWORD *)(v27 + 8 * v15);
    ++v16;
    if (v14)
      goto LABEL_27;
  }
LABEL_39:
  __break(1u);
  return result;
}

unint64_t static FamilyError.TraceKey.getter()
{
  return 0xD000000000000010;
}

id static FamilyError.createContextError(msg:)(uint64_t a1, uint64_t a2)
{
  uint64_t inited;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
  *(_QWORD *)(inited + 32) = sub_1CAF20400();
  *(_QWORD *)(inited + 40) = v5;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 64) = sub_1CAF20400();
  *(_QWORD *)(inited + 72) = v6;
  *(_QWORD *)(inited + 80) = a1;
  *(_QWORD *)(inited + 88) = a2;
  swift_bridgeObjectRetain_n();
  v7 = sub_1CAF0BA9C(inited);
  sub_1CAF0BF38(v7);
  swift_bridgeObjectRelease();
  v8 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  v9 = (void *)sub_1CAF203DC();
  v10 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  v11 = objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 500, v10);

  return v11;
}

uint64_t static FamilyError.reason(_:)(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  uint64_t v14;
  id v15;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v2 = objc_msgSend(a1, sel_userInfo);
  v3 = sub_1CAF20394();

  v4 = sub_1CAF20400();
  if (!*(_QWORD *)(v3 + 16) || (v6 = sub_1CAEDE164(v4, v5), (v7 & 1) == 0))
  {
    v18 = 0u;
    v19 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1CAEDCD8C(*(_QWORD *)(v3 + 56) + 32 * v6, (uint64_t)&v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_7:
    sub_1CAF0B888((uint64_t)&v18);
    goto LABEL_8;
  }
  if (swift_dynamicCast())
    return v17;
LABEL_8:
  v8 = objc_msgSend(a1, sel_userInfo);
  v9 = sub_1CAF20394();

  v10 = sub_1CAF20400();
  if (*(_QWORD *)(v9 + 16) && (v12 = sub_1CAEDE164(v10, v11), (v13 & 1) != 0))
  {
    sub_1CAEDCD8C(*(_QWORD *)(v9 + 56) + 32 * v12, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
  {
    sub_1CAF0B888((uint64_t)&v18);
    goto LABEL_16;
  }
  if (!swift_dynamicCast())
  {
LABEL_16:
    v15 = objc_msgSend(a1, sel_debugDescription);
    v14 = sub_1CAF20400();

    return v14;
  }
  return v17;
}

uint64_t static FamilyError.traceableReason(_:)(void *a1)
{
  id v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;

  v1 = objc_msgSend(a1, sel_userInfo);
  v2 = sub_1CAF20394();

  if (!*(_QWORD *)(v2 + 16) || (v3 = sub_1CAEDE164(0xD000000000000010, 0x80000001CAF2B6B0), (v4 & 1) == 0))
  {
    v11 = 0u;
    v12 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1CAEDCD8C(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v11);
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v12 + 1))
  {
LABEL_7:
    sub_1CAF0B888((uint64_t)&v11);
    goto LABEL_8;
  }
  if (!swift_dynamicCast())
  {
LABEL_8:
    v5 = 0;
    v6 = 0xE000000000000000;
    goto LABEL_9;
  }
  v5 = v9;
  v6 = v10;
LABEL_9:
  v7 = sub_1CAEF1B28(v5, v6);
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t static FamilyError.nameFromFilename(_:)(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[6];

  v2 = sub_1CAF200D0();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAF20094();
  v6 = sub_1CAF20088();
  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v7 = *(_QWORD *)(v6 + 16);
  if (v7)
  {
    v8 = v6 + 16 * v7;
    v9 = *(_QWORD *)(v8 + 16);
    v10 = *(_QWORD *)(v8 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v12[4] = v9;
    v12[5] = v10;
    v12[2] = 0x74666977732ELL;
    v12[3] = 0xE600000000000000;
    v12[0] = 0;
    v12[1] = 0xE000000000000000;
    sub_1CAEEBEE8();
    a1 = sub_1CAF20790();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t FamilyError.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CAF0CFF4 + 4 * byte_1CAF26274[*v0]))(0x74694B68747561, 0xE700000000000000);
}

unint64_t sub_1CAF0CFF4()
{
  return 0xD000000000000011;
}

FamilyCircle::FamilyError_optional __swiftcall FamilyError.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FamilyCircle::FamilyError_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CAF20910();
  result.value = swift_bridgeObjectRelease();
  v5 = 15;
  if (v3 < 0xF)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t sub_1CAF0D218(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1CAF176BC(*a1, *a2);
}

uint64_t sub_1CAF0D224()
{
  sub_1CAF20A18();
  FamilyError.rawValue.getter();
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

uint64_t sub_1CAF0D288()
{
  FamilyError.rawValue.getter();
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CAF0D2D8()
{
  sub_1CAF20A18();
  FamilyError.rawValue.getter();
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

FamilyCircle::FamilyError_optional sub_1CAF0D338(Swift::String *a1)
{
  return FamilyError.init(rawValue:)(*a1);
}

uint64_t sub_1CAF0D344@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = FamilyError.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

unint64_t sub_1CAF0D368(_QWORD *a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t result;
  char v8;
  uint64_t *v9;
  _QWORD *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v1 = a1[2];
  if (!v1)
    return MEMORY[0x1E0DEE9E0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903B0);
  v3 = (_QWORD *)sub_1CAF208EC();
  v4 = a1[4];
  v5 = a1[5];
  v6 = a1[6];
  result = sub_1CAEDE8E0(v4);
  if ((v8 & 1) != 0)
  {
LABEL_7:
    __break(1u);
LABEL_8:
    swift_bridgeObjectRetain();
    return (unint64_t)v3;
  }
  v9 = a1 + 9;
  while (1)
  {
    *(_QWORD *)((char *)v3 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v4;
    v10 = (_QWORD *)(v3[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v3[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      break;
    v3[2] = v13;
    if (!--v1)
      goto LABEL_8;
    v14 = v9 + 3;
    v4 = *(v9 - 2);
    v5 = *(v9 - 1);
    v15 = *v9;
    swift_bridgeObjectRetain();
    result = sub_1CAEDE8E0(v4);
    v9 = v14;
    v6 = v15;
    if ((v16 & 1) != 0)
      goto LABEL_7;
  }
  __break(1u);
  return result;
}

id _s12FamilyCircle0A5ErrorO06createC9WithTrace_4code6domain4files0C0_pSS_ACS2StFZ_0(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t inited;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  id v28;
  void *v29;
  void *v30;
  id v31;
  _QWORD v33[19];
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;

  v33[0] = a4;
  v12 = sub_1CAF200D0();
  v13 = *(_QWORD *)(v12 - 8);
  MEMORY[0x1E0C80A78](v12);
  v15 = (char *)v33 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = *a3;
  sub_1CAF20094();
  v17 = sub_1CAF20088();
  (*(void (**)(char *, uint64_t))(v13 + 8))(v15, v12);
  v18 = *(_QWORD *)(v17 + 16);
  if (v18)
  {
    v19 = v17 + 16 * v18;
    v20 = *(_QWORD *)(v19 + 16);
    v21 = *(_QWORD *)(v19 + 24);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    v36 = v20;
    v37 = v21;
    v34 = 0x74666977732ELL;
    v35 = 0xE600000000000000;
    v33[17] = 0;
    v33[18] = 0xE000000000000000;
    sub_1CAEEBEE8();
    a6 = sub_1CAF20790();
    a7 = v22;
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAF25C50;
  *(_QWORD *)(inited + 32) = sub_1CAF20400();
  *(_QWORD *)(inited + 40) = v24;
  *(_QWORD *)(inited + 48) = a1;
  *(_QWORD *)(inited + 56) = a2;
  *(_QWORD *)(inited + 64) = sub_1CAF20400();
  *(_QWORD *)(inited + 72) = v25;
  *(_QWORD *)(inited + 80) = a1;
  *(_QWORD *)(inited + 88) = a2;
  *(_QWORD *)(inited + 96) = 0xD000000000000010;
  *(_QWORD *)(inited + 104) = 0x80000001CAF2B6B0;
  v36 = a6;
  v37 = a7;
  swift_bridgeObjectRetain_n();
  sub_1CAF204A8();
  LOBYTE(v34) = v16;
  FamilyError.rawValue.getter();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  v26 = v37;
  *(_QWORD *)(inited + 112) = v36;
  *(_QWORD *)(inited + 120) = v26;
  v27 = sub_1CAF0BA9C(inited);
  swift_bridgeObjectRetain();
  sub_1CAF0BF38(v27);
  swift_bridgeObjectRelease();
  v28 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
  v29 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  v30 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  v31 = objc_msgSend(v28, sel_initWithDomain_code_userInfo_, v29, 500, v30, v33[0]);

  return v31;
}

unint64_t sub_1CAF0D74C()
{
  unint64_t result;

  result = qword_1EF991620;
  if (!qword_1EF991620)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for FamilyError, &type metadata for FamilyError);
    atomic_store(result, (unint64_t *)&qword_1EF991620);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for FamilyError(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF2)
    goto LABEL_17;
  if (a2 + 14 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 14) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 14;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 14;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 14;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xF;
  v8 = v6 - 15;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for FamilyError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 14 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 14) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF2)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF1)
    return ((uint64_t (*)(void))((char *)&loc_1CAF0D86C + 4 * byte_1CAF26288[v4]))();
  *a1 = a2 + 14;
  return ((uint64_t (*)(void))((char *)sub_1CAF0D8A0 + 4 * byte_1CAF26283[v4]))();
}

uint64_t sub_1CAF0D8A0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF0D8A8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAF0D8B0);
  return result;
}

uint64_t sub_1CAF0D8BC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAF0D8C4);
  *(_BYTE *)result = a2 + 14;
  return result;
}

uint64_t sub_1CAF0D8C8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF0D8D0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for FamilyError()
{
  return &type metadata for FamilyError;
}

uint64_t dispatch thunk of BackgroundTaskProvider.criteria.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BackgroundTaskProvider.criteria.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 32))();
}

uint64_t dispatch thunk of BackgroundTaskProvider.criteria.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 40))();
}

uint64_t dispatch thunk of BackgroundTaskProvider.activityName()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 48))();
}

uint64_t dispatch thunk of BackgroundTaskProvider.activityHandler()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 56))();
}

uint64_t dispatch thunk of BackgroundTaskScheduler.taskProvider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of BackgroundTaskScheduler.schedule()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 32) + *(_QWORD *)(a2 + 32));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAEDCC10;
  return v7(a1, a2);
}

uint64_t dispatch thunk of BackgroundTaskScheduler.unregister()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 40))();
}

uint64_t SerialDispatcher.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  SerialDispatcher.init()();
  return v0;
}

uint64_t SerialDispatcher.init()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t);
  uint64_t v7;
  _QWORD v9[2];

  v1 = sub_1CAF206DC();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1CAF206D0();
  v6 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF810];
  MEMORY[0x1E0C80A78](v5);
  v7 = sub_1CAF2037C();
  MEMORY[0x1E0C80A78](v7);
  *(_QWORD *)(v0 + 16) = 0;
  v9[0] = sub_1CAEE72C4();
  sub_1CAF20370();
  v9[1] = MEMORY[0x1E0DEE9D8];
  sub_1CAEDA0CC((unint64_t *)&qword_1ECFCE7E0, v6, MEMORY[0x1E0DEF828]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7C8);
  sub_1CAF0DE24((unint64_t *)&qword_1ECFCE7D0, &qword_1ECFCE7C8);
  sub_1CAF207B4();
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v4, *MEMORY[0x1E0DEF8D0], v1);
  *(_QWORD *)(v0 + 24) = sub_1CAF20700();
  return v0;
}

uint64_t SerialDispatcher.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD aBlock[6];

  v1 = v0;
  v2 = sub_1CAF2034C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v15 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v13 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1CAF2037C();
  v6 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(v1 + 16);
  v13 = *(_QWORD *)(v1 + 24);
  v10 = swift_allocObject();
  *(_QWORD *)(v10 + 16) = v9;
  aBlock[4] = sub_1CAF0DE04;
  aBlock[5] = v10;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CAEDA7AC;
  aBlock[3] = &block_descriptor_5;
  v11 = _Block_copy(aBlock);
  swift_retain_n();
  sub_1CAF20370();
  v16 = MEMORY[0x1E0DEE9D8];
  sub_1CAEDA0CC((unint64_t *)&qword_1ECFCE7A8, v3, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7B0);
  sub_1CAF0DE24((unint64_t *)&qword_1ECFCE7B8, &qword_1ECFCE7B0);
  sub_1CAF207B4();
  MEMORY[0x1D1799978](0, v8, v5, v11);
  _Block_release(v11);
  swift_release();
  (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v2);
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v14);
  swift_release();
  swift_release();

  return v1;
}

uint64_t sub_1CAF0DD94(uint64_t result)
{
  if (result)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    return sub_1CAF20670();
  }
  return result;
}

uint64_t sub_1CAF0DDE0()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF0DE04()
{
  uint64_t v0;

  return sub_1CAF0DD94(*(_QWORD *)(v0 + 16));
}

uint64_t block_copy_helper_5(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_5()
{
  return swift_release();
}

uint64_t sub_1CAF0DE24(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0DEAF38], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t SerialDispatcher.__deallocating_deinit()
{
  SerialDispatcher.deinit();
  return swift_deallocClassInstance();
}

uint64_t SerialDispatcher.async(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  _QWORD *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD aBlock[6];

  v3 = v2;
  v6 = sub_1CAF2034C();
  v7 = (uint64_t (*)(uint64_t))MEMORY[0x1E0DEF4F8];
  v8 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CAF2037C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[0] = *(_QWORD *)(v3 + 24);
  v15 = (_QWORD *)swift_allocObject();
  v15[2] = v3;
  v15[3] = a1;
  v15[4] = a2;
  aBlock[4] = sub_1CAF0E1D4;
  aBlock[5] = v15;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CAEDA7AC;
  aBlock[3] = &block_descriptor_6;
  v16 = _Block_copy(aBlock);
  swift_retain();
  swift_retain();
  sub_1CAF20370();
  v18[1] = MEMORY[0x1E0DEE9D8];
  sub_1CAEDA0CC((unint64_t *)&qword_1ECFCE7A8, v7, MEMORY[0x1E0DEF510]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7B0);
  sub_1CAF0DE24((unint64_t *)&qword_1ECFCE7B8, &qword_1ECFCE7B0);
  sub_1CAF207B4();
  MEMORY[0x1D1799978](0, v14, v10, v16);
  _Block_release(v16);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v6);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  return swift_release();
}

uint64_t sub_1CAF0E07C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    swift_retain_n();
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    sub_1CAF20670();
    swift_release();
  }
  v10 = sub_1CAF20658();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v8, 1, 1, v10);
  v11 = (_QWORD *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v9;
  v11[5] = a2;
  v11[6] = a3;
  swift_retain();
  *(_QWORD *)(a1 + 16) = sub_1CAF037B8((uint64_t)v8, (uint64_t)&unk_1EF991650, (uint64_t)v11);
  return swift_release();
}

uint64_t sub_1CAF0E1A8()
{
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF0E1D4()
{
  uint64_t *v0;

  return sub_1CAF0E07C(v0[2], v0[3], v0[4]);
}

uint64_t type metadata accessor for SerialDispatcher()
{
  return objc_opt_self();
}

uint64_t method lookup function for SerialDispatcher()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SerialDispatcher.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1CAF0E214(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;

  v6[3] = a5;
  v6[4] = a6;
  v6[2] = a4;
  return swift_task_switch();
}

uint64_t sub_1CAF0E230()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v3;
  uint64_t (*v4)(void);

  if (*(_QWORD *)(v0 + 16))
  {
    v1 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v1;
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    *v1 = v0;
    v1[1] = sub_1CAF0E314;
    return sub_1CAF20664();
  }
  else
  {
    sub_1CAF20688();
    v4 = (uint64_t (*)(void))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v3;
    *v3 = v0;
    v3[1] = sub_1CAF0E3F8;
    return v4();
  }
}

uint64_t sub_1CAF0E314()
{
  void *v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  if (v0)

  return swift_task_switch();
}

uint64_t sub_1CAF0E380()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t (*v2)(void);
  _QWORD *v3;
  uint64_t (*v5)(void);

  v1 = *(_QWORD *)(v0 + 48);
  sub_1CAF20688();
  if (v1)
  {
    v2 = *(uint64_t (**)(void))(v0 + 8);
  }
  else
  {
    v5 = (uint64_t (*)(void))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
    v3 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 56) = v3;
    *v3 = v0;
    v3[1] = sub_1CAF0E3F8;
    v2 = v5;
  }
  return v2();
}

uint64_t sub_1CAF0E3F8()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAF0E440()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (*v3)(void);

  sub_1CAF20688();
  v3 = (uint64_t (*)(void))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v1;
  *v1 = v0;
  v1[1] = sub_1CAF0E3F8;
  return v3();
}

uint64_t sub_1CAF0E4B8()
{
  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF0E4EC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_1CAEDCC10;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 16) = v2;
  return swift_task_switch();
}

uint64_t static RuntimeEnvironment.defaultEnvironment.getter()
{
  id v0;
  id v1;
  uint64_t v2;
  uint64_t v3;

  v0 = objc_msgSend((id)objc_opt_self(), sel_processInfo);
  v1 = objc_msgSend(v0, sel_environment);

  v2 = sub_1CAF20394();
  type metadata accessor for RuntimeEnvironment();
  v3 = swift_allocObject();
  RuntimeEnvironment.init(environment:)(v2);
  return v3;
}

uint64_t sub_1CAF0E5F8()
{
  uint64_t v0;

  swift_beginAccess();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t RuntimeEnvironment.__allocating_init(environment:)(uint64_t a1)
{
  uint64_t v2;

  v2 = swift_allocObject();
  RuntimeEnvironment.init(environment:)(a1);
  return v2;
}

uint64_t type metadata accessor for RuntimeEnvironment()
{
  return objc_opt_self();
}

uint64_t RuntimeEnvironment.init(environment:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v4;
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  unint64_t v10;
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v20;

  v2 = v1;
  if (*(_QWORD *)(a1 + 16) && (v4 = sub_1CAEDE164(0xD00000000000001CLL, 0x80000001CAF2B760), (v5 & 1) != 0))
  {
    v6 = 0xEB00000000676E69;
    v7 = 0x7473655474696E55;
    v8 = (uint64_t *)(*(_QWORD *)(a1 + 56) + 16 * v4);
    v9 = *v8;
    v10 = v8[1];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRelease();
    if (v9 == 0x7473655474696E55 && v10 == 0xEB00000000676E69)
    {
      v12 = 1;
    }
    else
    {
      v12 = sub_1CAF209A0();
      v7 = v9;
      v6 = v10;
    }
  }
  else
  {
    swift_bridgeObjectRelease();
    v12 = 0;
    v7 = 0;
    v6 = 0;
  }
  *(_BYTE *)(v2 + 16) = v12 & 1;
  if (qword_1ECFCE888 != -1)
    swift_once();
  v13 = sub_1CAF202E0();
  __swift_project_value_buffer(v13, (uint64_t)qword_1ECFCE8A8);
  swift_bridgeObjectRetain();
  swift_retain_n();
  v14 = sub_1CAF202C8();
  v15 = sub_1CAF206A0();
  if (os_log_type_enabled(v14, v15))
  {
    v16 = swift_slowAlloc();
    v17 = swift_slowAlloc();
    v20 = v17;
    *(_DWORD *)v16 = 136315394;
    if (v6)
    {
      v18 = v6;
    }
    else
    {
      v7 = 0x74657320746F6ELL;
      v18 = 0xE700000000000000;
    }
    swift_bridgeObjectRetain();
    sub_1CAEDBE5C(v7, v18, &v20);
    sub_1CAF2076C();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    *(_WORD *)(v16 + 12) = 1024;
    swift_beginAccess();
    swift_release();
    sub_1CAF2076C();
    swift_release();
    _os_log_impl(&dword_1CAEBA000, v14, v15, "env is: %s  testing mode:%{BOOL}d", (uint8_t *)v16, 0x12u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v17, -1, -1);
    MEMORY[0x1D179A698](v16, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
    swift_release_n();
  }
  return v2;
}

uint64_t RuntimeEnvironment.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t RuntimeEnvironment.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

uint64_t sub_1CAF0E990@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  result = swift_beginAccess();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_1CAF0E9D4(char *a1, uint64_t *a2)
{
  char v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = *a2;
  result = swift_beginAccess();
  *(_BYTE *)(v3 + 16) = v2;
  return result;
}

uint64_t method lookup function for RuntimeEnvironment()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of RuntimeEnvironment.isTesting.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 88))();
}

uint64_t dispatch thunk of RuntimeEnvironment.__allocating_init(environment:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t sub_1CAF0EA34(int *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))((char *)a1 + *a1);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CAEF495C;
  return v4();
}

uint64_t sub_1CAF0EA8C(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else if (a2)
  {
    **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(result + 32) + 64) + 40) = a2;
    v6 = a2;
    return swift_continuation_throwingResume();
  }
  else
  {
    __break(1u);
  }
  return result;
}

BOOL static CFUScheduleStatus.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t CFUScheduleStatus.hash(into:)()
{
  return sub_1CAF20A24();
}

uint64_t CFUScheduleStatus.hashValue.getter()
{
  sub_1CAF20A18();
  sub_1CAF20A24();
  return sub_1CAF20A30();
}

id sub_1CAF0EB98()
{
  id result;

  result = sub_1CAF120A8();
  qword_1EF98FDE8 = (uint64_t)result;
  return result;
}

double sub_1CAF0EBB4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  double result;
  uint64_t v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31[5];
  uint64_t v32;

  v10 = sub_1CAF20178();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v31[0]) = 8;
  if ((_s12FamilyCircle0A12FeatureFlagsO7enabledySbACFZ_0((unsigned __int8 *)v31) & 1) != 0)
  {
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v13, a2, v10);
    v14 = swift_allocObject();
    *(_QWORD *)(v14 + 16) = a3;
    *(_QWORD *)(v14 + 24) = a4;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991748);
    v15 = swift_allocObject();
    *(_QWORD *)(v15 + 16) = &unk_1EF991540;
    *(_QWORD *)(v15 + 24) = v14;
    swift_retain();
    swift_retain();
    v16 = sub_1CAF11450((uint64_t)v13);
    swift_release();
    (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    *(_WORD *)(v15 + 32) = 0;
    *(_QWORD *)(v15 + 40) = v16;
    *(_OWORD *)(v15 + 48) = xmmword_1CAF264E0;
    *(_QWORD *)(v15 + 64) = 32;
    sub_1CAEEB17C(a1, (uint64_t)v31);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991750);
    if (swift_dynamicCast())
    {
      v17 = (void *)objc_opt_self();
      swift_retain();
      v18 = objc_msgSend(v17, sel_sharedScheduler);
      v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991758);
      v20 = swift_allocObject();
      *(_QWORD *)(v20 + 16) = v18;
      *(_QWORD *)(v20 + 24) = v15;
      *(_QWORD *)(a5 + 24) = v19;
      *(_QWORD *)(a5 + 32) = sub_1CAF12A8C();
      swift_release();
      *(_QWORD *)a5 = v20;
      return result;
    }
    if (qword_1EF98FBD8[0] != -1)
      swift_once();
    v27 = sub_1CAF202E0();
    __swift_project_value_buffer(v27, (uint64_t)qword_1EF98FD68);
    v23 = sub_1CAF202C8();
    v28 = sub_1CAF206AC();
    if (!os_log_type_enabled(v23, v28))
    {

      swift_release();
      goto LABEL_13;
    }
    v29 = (uint8_t *)swift_slowAlloc();
    v30 = swift_slowAlloc();
    v31[0] = v30;
    *(_DWORD *)v29 = 136315138;
    v32 = sub_1CAEDBE5C(0xD00000000000002FLL, 0x80000001CAF2B8B0, v31);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v23, v28, "%s Invalid factory provided", v29, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v30, -1, -1);
    MEMORY[0x1D179A698](v29, -1, -1);
    swift_release();
  }
  else
  {
    if (qword_1EF98FBD8[0] != -1)
      swift_once();
    v22 = sub_1CAF202E0();
    __swift_project_value_buffer(v22, (uint64_t)qword_1EF98FD68);
    v23 = sub_1CAF202C8();
    v24 = sub_1CAF206B8();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v31[0] = v26;
      *(_DWORD *)v25 = 136315138;
      v32 = sub_1CAEDBE5C(0xD00000000000002FLL, 0x80000001CAF2B8B0, v31);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v23, v24, "%s Required FF not set", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v26, -1, -1);
      MEMORY[0x1D179A698](v25, -1, -1);
    }
  }

LABEL_13:
  *(_QWORD *)(a5 + 32) = 0;
  result = 0.0;
  *(_OWORD *)a5 = 0u;
  *(_OWORD *)(a5 + 16) = 0u;
  return result;
}

uint64_t sub_1CAF0F03C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint64_t v17;
  uint8_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  os_log_type_t v23;
  uint8_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v42 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CAF20178();
  v8 = *(_QWORD *)(v7 - 8);
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v42 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v13 = (char *)&v42 - v12;
  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v14 = sub_1CAF202E0();
  __swift_project_value_buffer(v14, (uint64_t)qword_1EF98FD68);
  v15 = sub_1CAF202C8();
  v16 = sub_1CAF206A0();
  if (os_log_type_enabled(v15, v16))
  {
    v43 = v13;
    v17 = swift_slowAlloc();
    v42 = a1;
    v18 = (uint8_t *)v17;
    v19 = swift_slowAlloc();
    v44 = v7;
    v45 = v8;
    v20 = v19;
    v47 = v19;
    *(_DWORD *)v18 = 136315138;
    v46 = sub_1CAEDBE5C(0xD000000000000010, 0x80000001CAF2B900, &v47);
    v13 = v43;
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v15, v16, "%s called", v18, 0xCu);
    swift_arrayDestroy();
    v21 = v20;
    v7 = v44;
    v8 = v45;
    MEMORY[0x1D179A698](v21, -1, -1);
    MEMORY[0x1D179A698](v18, -1, -1);
  }

  FAFamilyCircle.badgeableInviteDate()((uint64_t)v6);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v6, 1, v7) == 1)
  {
    sub_1CAEF5168((uint64_t)v6, &qword_1EF98FDB8);
    v22 = sub_1CAF202C8();
    v23 = sub_1CAF206B8();
    if (os_log_type_enabled(v22, v23))
    {
      v24 = (uint8_t *)swift_slowAlloc();
      v25 = v7;
      v26 = v8;
      v27 = swift_slowAlloc();
      v47 = v27;
      *(_DWORD *)v24 = 136315138;
      v46 = sub_1CAEDBE5C(0xD000000000000010, 0x80000001CAF2B900, &v47);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v22, v23, "%s No pending invite, no CFU trigger needed", v24, 0xCu);
      v28 = 1;
      swift_arrayDestroy();
      v29 = v27;
      v8 = v26;
      v7 = v25;
      MEMORY[0x1D179A698](v29, -1, -1);
      MEMORY[0x1D179A698](v24, -1, -1);

    }
    else
    {

      v28 = 1;
    }
  }
  else
  {
    v30 = *(char **)(v8 + 32);
    ((void (*)(char *, char *, uint64_t))v30)(v13, v6, v7);
    (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v11, v13, v7);
    v31 = sub_1CAF202C8();
    v32 = sub_1CAF206B8();
    if (os_log_type_enabled(v31, v32))
    {
      v33 = swift_slowAlloc();
      v43 = v30;
      v34 = v33;
      v35 = swift_slowAlloc();
      v44 = a2;
      v36 = v35;
      v47 = v35;
      *(_DWORD *)v34 = 136315394;
      v45 = v8;
      v46 = sub_1CAEDBE5C(0xD000000000000010, 0x80000001CAF2B900, &v47);
      sub_1CAF2076C();
      *(_WORD *)(v34 + 12) = 2080;
      sub_1CAEFB114((unint64_t *)&qword_1EF990400, MEMORY[0x1E0CB08F0]);
      v37 = sub_1CAF2097C();
      v46 = sub_1CAEDBE5C(v37, v38, &v47);
      v8 = v45;
      sub_1CAF2076C();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
      _os_log_impl(&dword_1CAEBA000, v31, v32, "%s Pending invite, CFU trigger needed at %s", (uint8_t *)v34, 0x16u);
      swift_arrayDestroy();
      v39 = v36;
      a2 = v44;
      MEMORY[0x1D179A698](v39, -1, -1);
      v40 = v34;
      v30 = v43;
      MEMORY[0x1D179A698](v40, -1, -1);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v8 + 8))(v11, v7);
    }

    ((void (*)(uint64_t, char *, uint64_t))v30)(a2, v13, v7);
    v28 = 0;
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 56))(a2, v28, 1, v7);
}

uint64_t sub_1CAF0F5BC(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1CAF0F5D4()
{
  uint64_t v0;
  _QWORD *v1;

  if (qword_1EF98FDF0 != -1)
    swift_once();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v1;
  *v1 = v0;
  v1[1] = sub_1CAF0F650;
  return sub_1CAF0F698(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1CAF0F650()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAF0F698(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[29] = a1;
  v2[30] = v1;
  v2[31] = swift_getObjectType();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  v2[32] = swift_task_alloc();
  v3 = sub_1CAF20178();
  v2[33] = v3;
  v2[34] = *(_QWORD *)(v3 - 8);
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v2[37] = swift_task_alloc();
  v2[38] = swift_task_alloc();
  v2[39] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CAF0F75C()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  v0[40] = v1;
  v0[41] = __swift_project_value_buffer(v1, (uint64_t)qword_1EF98FD68);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v8 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[28] = sub_1CAEDBE5C(0xD000000000000019, 0x80000001CAF2B850, &v8);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v6 = (_QWORD *)swift_task_alloc();
  v0[42] = v6;
  *v6 = v0;
  v6[1] = sub_1CAF0F90C;
  return swift_task_switch();
}

uint64_t sub_1CAF0F90C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 344) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF0F968()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  char *v9;
  char v10;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t AssociatedConformanceWitness;
  void (*v23)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void (*v43)(_QWORD *__return_ptr, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  void (*v49)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t *, uint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  _QWORD *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  _QWORD v63[5];
  uint64_t v64;
  _QWORD v65[5];
  _QWORD v66[5];
  _QWORD v67[5];
  uint64_t v68[6];

  v1 = *(void **)(v0 + 344);
  if (!v1)
  {
    v9 = *(char **)(v0 + 232);
    v10 = 2;
LABEL_7:
    *v9 = v10;
LABEL_8:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 256);
  sub_1CAF0F03C(*(_QWORD *)(v0 + 344), v4);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v4, 1, v2) == 1)
  {
    sub_1CAEF5168(*(_QWORD *)(v0 + 256), &qword_1EF98FDB8);
    v5 = sub_1CAF202C8();
    v6 = sub_1CAF206A0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v68[0] = v8;
      *(_DWORD *)v7 = 136315138;
      *(_QWORD *)(v0 + 200) = sub_1CAEDBE5C(0xD000000000000019, 0x80000001CAF2B850, v68);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v5, v6, "%s wakeup not needed", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v8, -1, -1);
      MEMORY[0x1D179A698](v7, -1, -1);
    }

    v9 = *(char **)(v0 + 232);
    v10 = 3;
    goto LABEL_7;
  }
  v12 = *(_QWORD *)(v0 + 312);
  v13 = *(void **)(v0 + 240);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 32))(v12, *(_QWORD *)(v0 + 256), *(_QWORD *)(v0 + 264));
  sub_1CAEEB17C((uint64_t)v13 + OBJC_IVAR___FAFamilyCFUScheduler_factory, v0 + 136);
  v14 = swift_allocObject();
  *(_QWORD *)(v14 + 16) = v13;
  v15 = v13;
  sub_1CAF0EBB4(v0 + 136, v12, (uint64_t)&unk_1EF991738, v14, v0 + 96);
  swift_release();
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 136);
  if (!*(_QWORD *)(v0 + 120))
  {
    v57 = *(_BYTE **)(v0 + 232);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 272) + 8))(*(_QWORD *)(v0 + 312), *(_QWORD *)(v0 + 264));

    sub_1CAEF5168(v0 + 96, &qword_1EF98FC60);
    *v57 = 4;
    goto LABEL_8;
  }
  v16 = *(_QWORD *)(v0 + 240);
  sub_1CAEDCE74((__int128 *)(v0 + 96), v0 + 56);
  sub_1CAEEB17C(v0 + 56, v0 + 16);
  v17 = v16 + OBJC_IVAR___FAFamilyCFUScheduler_scheduler;
  swift_beginAccess();
  sub_1CAF016B4(v0 + 16, v17);
  swift_endAccess();
  v19 = *(_QWORD *)(v0 + 80);
  v18 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v19);
  (*(void (**)(uint64_t, uint64_t))(v18 + 24))(v19, v18);
  v21 = *(_QWORD *)(v0 + 80);
  v20 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v21);
  (*(void (**)(uint64_t, uint64_t))(v20 + 24))(v21, v20);
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v23 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  v24 = swift_checkMetadataState();
  v23(v63, v24, AssociatedConformanceWitness);
  swift_unknownObjectRelease();
  v61 = v63[0];
  v25 = *(_QWORD *)(v0 + 80);
  v26 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v25);
  (*(void (**)(uint64_t, uint64_t))(v26 + 24))(v25, v26);
  swift_getAssociatedTypeWitness();
  v27 = swift_getAssociatedConformanceWitness();
  v28 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v27 + 24);
  v29 = swift_checkMetadataState();
  v28(&v64, v29, v27);
  swift_unknownObjectRelease();
  v60 = BYTE1(v64);
  v30 = *(_QWORD *)(v0 + 80);
  v31 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v30);
  (*(void (**)(uint64_t, uint64_t))(v31 + 24))(v30, v31);
  swift_getAssociatedTypeWitness();
  v32 = swift_getAssociatedConformanceWitness();
  v33 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v32 + 24);
  v34 = swift_checkMetadataState();
  v33(v65, v34, v32);
  swift_unknownObjectRelease();
  v59 = v65[1];
  v35 = *(_QWORD *)(v0 + 80);
  v36 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v35);
  (*(void (**)(uint64_t, uint64_t))(v36 + 24))(v35, v36);
  swift_getAssociatedTypeWitness();
  v37 = swift_getAssociatedConformanceWitness();
  v38 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v37 + 24);
  v39 = swift_checkMetadataState();
  v38(v66, v39, v37);
  swift_unknownObjectRelease();
  v58 = v66[2];
  v40 = *(_QWORD *)(v0 + 80);
  v41 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v40);
  (*(void (**)(uint64_t, uint64_t))(v41 + 24))(v40, v41);
  swift_getAssociatedTypeWitness();
  v42 = swift_getAssociatedConformanceWitness();
  v43 = *(void (**)(_QWORD *__return_ptr, uint64_t, uint64_t))(v42 + 24);
  v44 = swift_checkMetadataState();
  v43(v67, v44, v42);
  swift_unknownObjectRelease();
  v45 = v67[3];
  v46 = *(_QWORD *)(v0 + 80);
  v47 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v46);
  (*(void (**)(uint64_t, uint64_t))(v47 + 24))(v46, v47);
  swift_getAssociatedTypeWitness();
  v48 = swift_getAssociatedConformanceWitness();
  v49 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(v48 + 24);
  v50 = swift_checkMetadataState();
  v49(v68, v50, v48);
  swift_unknownObjectRelease();
  LOBYTE(v68[0]) = v61;
  BYTE1(v68[0]) = v60;
  v68[1] = v59;
  v68[2] = v58;
  v68[3] = v45;
  swift_getAssociatedTypeWitness();
  v51 = swift_getAssociatedConformanceWitness();
  v52 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v51 + 32);
  v53 = swift_checkMetadataState();
  v52(v68, v53, v51);
  swift_unknownObjectRelease();
  v54 = *(_QWORD *)(v0 + 80);
  v55 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v54);
  v62 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v55 + 32) + *(_QWORD *)(v55 + 32));
  v56 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 352) = v56;
  *v56 = v0;
  v56[1] = sub_1CAF100E8;
  return v62(v54, v55);
}

uint64_t sub_1CAF100E8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 360) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF1014C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t AssociatedConformanceWitness;
  void (*v7)(uint64_t *__return_ptr, uint64_t, uint64_t);
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t, uint64_t);
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, uint64_t);
  uint64_t v32;
  NSObject *log;
  os_log_type_t type;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v39 = *(_QWORD *)(v0 + 312);
  v1 = *(_QWORD *)(v0 + 296);
  v2 = *(_QWORD *)(v0 + 272);
  v35 = *(_QWORD *)(v0 + 288);
  v37 = *(_QWORD *)(v0 + 280);
  v3 = *(_QWORD *)(v0 + 264);
  sub_1CAF2016C();
  v4 = *(_QWORD *)(v0 + 80);
  v5 = *(_QWORD *)(v0 + 88);
  __swift_project_boxed_opaque_existential_1((_QWORD *)(v0 + 56), v4);
  (*(void (**)(uint64_t, uint64_t))(v5 + 24))(v4, v5);
  swift_getAssociatedTypeWitness();
  AssociatedConformanceWitness = swift_getAssociatedConformanceWitness();
  v7 = *(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(AssociatedConformanceWitness + 24);
  v8 = swift_checkMetadataState();
  v7(&v42, v8, AssociatedConformanceWitness);
  swift_unknownObjectRelease();
  sub_1CAF2013C();
  v9 = *(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16);
  v9(v35, v1, v3);
  v9(v37, v39, v3);
  v10 = sub_1CAF202C8();
  v11 = sub_1CAF206B8();
  if (os_log_type_enabled(v10, v11))
  {
    v40 = *(_QWORD *)(v0 + 304);
    v41 = *(_QWORD *)(v0 + 312);
    v36 = *(void **)(v0 + 344);
    v38 = *(_QWORD *)(v0 + 296);
    type = v11;
    log = v10;
    v13 = *(_QWORD *)(v0 + 280);
    v12 = *(_QWORD *)(v0 + 288);
    v14 = *(_QWORD *)(v0 + 264);
    v15 = *(_QWORD *)(v0 + 272);
    v16 = swift_slowAlloc();
    v32 = swift_slowAlloc();
    v42 = v32;
    *(_DWORD *)v16 = 136315394;
    sub_1CAEFB114((unint64_t *)&qword_1EF990400, MEMORY[0x1E0CB08F0]);
    v17 = sub_1CAF2097C();
    *(_QWORD *)(v0 + 208) = sub_1CAEDBE5C(v17, v18, &v42);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    v19 = *(void (**)(uint64_t, uint64_t))(v15 + 8);
    v19(v12, v14);
    *(_WORD *)(v16 + 12) = 2080;
    v20 = sub_1CAF2097C();
    *(_QWORD *)(v0 + 216) = sub_1CAEDBE5C(v20, v21, &v42);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    v19(v13, v14);
    _os_log_impl(&dword_1CAEBA000, log, type, "Schedule CFU signal at %s for %s", (uint8_t *)v16, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v32, -1, -1);
    MEMORY[0x1D179A698](v16, -1, -1);

    v19(v38, v14);
    v19(v40, v14);
    v19(v41, v14);
  }
  else
  {
    v22 = *(void **)(v0 + 344);
    v23 = *(_QWORD *)(v0 + 304);
    v24 = *(_QWORD *)(v0 + 312);
    v26 = *(_QWORD *)(v0 + 288);
    v25 = *(_QWORD *)(v0 + 296);
    v28 = *(_QWORD *)(v0 + 272);
    v27 = *(_QWORD *)(v0 + 280);
    v29 = *(_QWORD *)(v0 + 264);

    v30 = *(void (**)(uint64_t, uint64_t))(v28 + 8);
    v30(v27, v29);
    v30(v26, v29);
    v30(v25, v29);
    v30(v23, v29);
    v30(v24, v29);
  }
  **(_BYTE **)(v0 + 232) = 0;
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF10500()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  id v7;

  if (qword_1ECFCE740 != -1)
    swift_once();
  v1 = *(void **)(v0 + 360);
  v2 = *(void **)(v0 + 344);
  v3 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 264);
  v5 = *(_QWORD *)(v0 + 272);
  v6 = *(_BYTE **)(v0 + 232);
  __swift_project_value_buffer(*(_QWORD *)(v0 + 320), (uint64_t)qword_1ECFCE720);
  v7 = v1;
  sub_1CAF1C254(v1);

  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  *v6 = 1;
  __swift_destroy_boxed_opaque_existential_1Tm(v0 + 56);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF1062C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1CAF10680;
  return sub_1CAF106DC(v0 + 24);
}

uint64_t sub_1CAF10680()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF106D4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF106DC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[7] = a1;
  v2[8] = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  v2[9] = swift_task_alloc();
  v2[10] = swift_task_alloc();
  v2[11] = swift_task_alloc();
  v3 = sub_1CAF20178();
  v2[12] = v3;
  v2[13] = *(_QWORD *)(v3 - 8);
  v2[14] = swift_task_alloc();
  v2[15] = swift_task_alloc();
  v2[16] = swift_task_alloc();
  v2[17] = swift_task_alloc();
  v2[18] = swift_task_alloc();
  v2[19] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1CAF107BC()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v8;

  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  v0[20] = __swift_project_value_buffer(v1, (uint64_t)qword_1EF98FD68);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v8 = v5;
    *(_DWORD *)v4 = 136315138;
    v0[6] = sub_1CAEDBE5C(0x6F466B636568635FLL, 0xEE00292855464372, &v8);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "%s called", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v6 = (_QWORD *)swift_task_alloc();
  v0[21] = v6;
  *v6 = v0;
  v6[1] = sub_1CAF10970;
  return swift_task_switch();
}

uint64_t sub_1CAF10970(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 176) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF109CC()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unsigned int (*v5)(uint64_t, uint64_t, uint64_t);
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  void (*v12)(_QWORD, _QWORD, _QWORD);
  char v13;
  void (*v14)(void *, uint64_t, uint64_t);
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  void (*v27)(uint64_t, uint64_t);
  NSObject *v28;
  os_log_type_t v29;
  _BOOL4 v30;
  uint64_t v31;
  uint64_t v32;
  uint8_t *v33;
  uint64_t v34;
  unint64_t v35;
  void (*v36)(uint64_t, uint64_t);
  uint8_t *v37;
  _QWORD *v38;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  id v43;
  void *v44;
  unsigned int v45;
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
  uint64_t v56;
  char v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  os_log_type_t v63;
  _BOOL4 v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  unint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(_QWORD, _QWORD, _QWORD);
  NSObject *log;
  uint64_t v74;
  uint64_t v75;

  v1 = *(void **)(v0 + 176);
  if (!v1)
  {
    v10 = 2;
LABEL_22:
    **(_BYTE **)(v0 + 56) = v10;
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v2 = *(_QWORD *)(v0 + 96);
  v3 = *(_QWORD *)(v0 + 104);
  v4 = *(_QWORD *)(v0 + 88);
  sub_1CAF0F03C(*(_QWORD *)(v0 + 176), v4);
  v5 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48);
  if (v5(v4, 1, v2) == 1)
  {
    sub_1CAEF5168(*(_QWORD *)(v0 + 88), &qword_1EF98FDB8);
    v6 = sub_1CAF202C8();
    v7 = sub_1CAF206B8();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v75 = v9;
      *(_DWORD *)v8 = 136315138;
      *(_QWORD *)(v0 + 16) = sub_1CAEDBE5C(0x6F466B636568635FLL, 0xEE00292855464372, &v75);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v6, v7, "%s No longer need a wakeup it seems", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v9, -1, -1);
      MEMORY[0x1D179A698](v8, -1, -1);
    }

    v10 = 3;
    goto LABEL_22;
  }
  v11 = *(_QWORD *)(v0 + 104);
  v12 = *(void (**)(_QWORD, _QWORD, _QWORD))(v11 + 32);
  v12(*(_QWORD *)(v0 + 152), *(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 96));
  sub_1CAF2016C();
  sub_1CAEFB114(&qword_1EF991478, MEMORY[0x1E0CB08B0]);
  v13 = sub_1CAF203C4();
  v14 = *(void (**)(void *, uint64_t, uint64_t))(v11 + 16);
  v15 = *(_QWORD *)(v0 + 144);
  v16 = *(_QWORD *)(v0 + 96);
  if ((v13 & 1) == 0)
  {
    v14(*(void **)(v0 + 136), v15, v16);
    v28 = sub_1CAF202C8();
    v29 = sub_1CAF206A0();
    log = v28;
    v30 = os_log_type_enabled(v28, v29);
    v31 = *(_QWORD *)(v0 + 136);
    v32 = *(_QWORD *)(v0 + 96);
    if (v30)
    {
      v70 = *(_QWORD *)(v0 + 104);
      v72 = v12;
      v33 = (uint8_t *)swift_slowAlloc();
      v71 = swift_slowAlloc();
      v75 = v71;
      *(_DWORD *)v33 = 136315138;
      sub_1CAEFB114((unint64_t *)&qword_1EF990400, MEMORY[0x1E0CB08F0]);
      v34 = sub_1CAF2097C();
      *(_QWORD *)(v0 + 32) = sub_1CAEDBE5C(v34, v35, &v75);
      sub_1CAF2076C();
      swift_bridgeObjectRelease();
      v36 = *(void (**)(uint64_t, uint64_t))(v70 + 8);
      v36(v31, v32);
      _os_log_impl(&dword_1CAEBA000, log, v29, "Signal CFU: %s", v33, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v71, -1, -1);
      v37 = v33;
      v12 = v72;
      MEMORY[0x1D179A698](v37, -1, -1);

    }
    else
    {
      v36 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 104) + 8);
      v36(v31, v32);

    }
    v40 = *(_QWORD *)(v0 + 96);
    v41 = *(_QWORD *)(v0 + 104);
    v42 = *(void **)(v0 + 80);
    v14(v42, *(_QWORD *)(v0 + 152), v40);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v41 + 56))(v42, 0, 1, v40);
    _s12FamilyCircle18CoreFollowupSenderO13sendInviteCFU14invitationDatey10Foundation0J0VSg_tFZ_0(v42);
    sub_1CAEF5168((uint64_t)v42, &qword_1EF98FDB8);
    v43 = objc_msgSend(v1, "me");
    if (v43 && (v44 = v43, v45 = objc_msgSend(v43, sel_isOrganizer), v44, v45))
    {
      v46 = *(_QWORD *)(v0 + 96);
      v47 = *(_QWORD *)(v0 + 72);
      FAFamilyCircle.oldestSentInviteSignalDate()(v47);
      if (v5(v47, 1, v46) == 1)
      {
        v49 = *(_QWORD *)(v0 + 144);
        v48 = *(_QWORD *)(v0 + 152);
        v50 = *(_QWORD *)(v0 + 96);
        v51 = *(_QWORD *)(v0 + 72);

        v36(v49, v50);
        v36(v48, v50);
        sub_1CAEF5168(v51, &qword_1EF98FDB8);
LABEL_21:
        v10 = 5;
        goto LABEL_22;
      }
      v12(*(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 72), *(_QWORD *)(v0 + 96));
      v57 = sub_1CAF203C4();
      v58 = *(_QWORD *)(v0 + 144);
      if ((v57 & 1) != 0)
      {
        v59 = *(_QWORD *)(v0 + 152);
        v60 = *(_QWORD *)(v0 + 128);
        v61 = *(_QWORD *)(v0 + 96);
      }
      else
      {
        v14(*(void **)(v0 + 120), *(_QWORD *)(v0 + 144), *(_QWORD *)(v0 + 96));
        v62 = sub_1CAF202C8();
        v63 = sub_1CAF206B8();
        v64 = os_log_type_enabled(v62, v63);
        v65 = *(_QWORD *)(v0 + 120);
        v66 = *(_QWORD *)(v0 + 96);
        if (v64)
        {
          v67 = (uint8_t *)swift_slowAlloc();
          v74 = swift_slowAlloc();
          v75 = v74;
          *(_DWORD *)v67 = 136315138;
          sub_1CAEFB114((unint64_t *)&qword_1EF990400, MEMORY[0x1E0CB08F0]);
          v68 = sub_1CAF2097C();
          *(_QWORD *)(v0 + 24) = sub_1CAEDBE5C(v68, v69, &v75);
          sub_1CAF2076C();
          swift_bridgeObjectRelease();
          v36(v65, v66);
          _os_log_impl(&dword_1CAEBA000, v62, v63, "Wakeup for familyCircleUI for row badging check %s", v67, 0xCu);
          swift_arrayDestroy();
          MEMORY[0x1D179A698](v74, -1, -1);
          MEMORY[0x1D179A698](v67, -1, -1);
        }
        else
        {
          v36(*(_QWORD *)(v0 + 120), *(_QWORD *)(v0 + 96));
        }

        v58 = *(_QWORD *)(v0 + 144);
        v59 = *(_QWORD *)(v0 + 152);
        v60 = *(_QWORD *)(v0 + 128);
        v61 = *(_QWORD *)(v0 + 96);
        objc_msgSend((id)objc_opt_self(), sel_broadcastFamilyChangedNotification);
      }

      v36(v60, v61);
      v36(v58, v61);
      v55 = v59;
      v56 = v61;
    }
    else
    {
      v53 = *(_QWORD *)(v0 + 144);
      v52 = *(_QWORD *)(v0 + 152);
      v54 = *(_QWORD *)(v0 + 96);

      v36(v53, v54);
      v55 = v52;
      v56 = v54;
    }
    v36(v55, v56);
    goto LABEL_21;
  }
  v14(*(void **)(v0 + 112), v15, v16);
  v17 = sub_1CAF202C8();
  v18 = sub_1CAF206B8();
  v19 = os_log_type_enabled(v17, v18);
  v21 = *(_QWORD *)(v0 + 104);
  v20 = *(_QWORD *)(v0 + 112);
  v22 = *(_QWORD *)(v0 + 96);
  if (v19)
  {
    v23 = (uint8_t *)swift_slowAlloc();
    v24 = swift_slowAlloc();
    v75 = v24;
    *(_DWORD *)v23 = 136315138;
    sub_1CAEFB114((unint64_t *)&qword_1EF990400, MEMORY[0x1E0CB08F0]);
    v25 = sub_1CAF2097C();
    *(_QWORD *)(v0 + 40) = sub_1CAEDBE5C(v25, v26, &v75);
    sub_1CAF2076C();
    swift_bridgeObjectRelease();
    v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v27(v20, v22);
    _os_log_impl(&dword_1CAEBA000, v17, v18, "Not time for CFU: %s", v23, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v24, -1, -1);
    MEMORY[0x1D179A698](v23, -1, -1);
  }
  else
  {
    v27 = *(void (**)(uint64_t, uint64_t))(v21 + 8);
    v27(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 96));
  }

  *(_QWORD *)(v0 + 184) = v27;
  v38 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 192) = v38;
  *v38 = v0;
  v38[1] = sub_1CAF11240;
  return sub_1CAF0F698(*(_QWORD *)(v0 + 56));
}

uint64_t sub_1CAF11240()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF11294()
{
  uint64_t v0;
  void (*v1)(uint64_t, uint64_t);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = *(void (**)(uint64_t, uint64_t))(v0 + 184);
  v2 = *(_QWORD *)(v0 + 144);
  v3 = *(_QWORD *)(v0 + 152);
  v4 = *(_QWORD *)(v0 + 96);

  v1(v2, v4);
  v1(v3, v4);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id FAFamilyCFUScheduler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void FAFamilyCFUScheduler.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FAFamilyCFUScheduler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1CAF11450(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  NSObject *v31;
  os_log_type_t v32;
  BOOL v33;
  char *v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void (*v41)(char *, uint64_t);
  char *v42;
  void (*v43)(char *, uint64_t);
  char *v44;
  void *v45;
  id v46;
  char *v47;
  id v48;
  char *v49;
  uint64_t v50;
  void (*v51)(char *, uint64_t);
  double v52;
  double v53;
  uint64_t v54;
  NSObject *v55;
  os_log_type_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  char *v71;
  uint64_t v72;
  uint64_t v73[3];
  uint64_t v74;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914E0);
  v68 = *(_QWORD *)(v2 - 8);
  v69 = v2;
  v3 = MEMORY[0x1E0C80A78](v2);
  v66 = (char *)&v60 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v67 = (char *)&v60 - v5;
  v6 = sub_1CAF201CC();
  v63 = *(_QWORD *)(v6 - 8);
  v64 = v6;
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v60 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v9);
  v65 = (char *)&v60 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = sub_1CAF201D8();
  v61 = *(_QWORD *)(v11 - 8);
  v62 = v11;
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v60 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v60 - v15;
  v17 = sub_1CAF20178();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v60 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = MEMORY[0x1E0C80A78](v19);
  v24 = (char *)&v60 - v23;
  v25 = MEMORY[0x1E0C80A78](v22);
  v70 = (char *)&v60 - v26;
  MEMORY[0x1E0C80A78](v25);
  v28 = (char *)&v60 - v27;
  sub_1CAF2016C();
  v29 = a1;
  v71 = v28;
  if ((sub_1CAF20130() & 1) != 0)
  {
    v74 = 120;
    if (qword_1EF98FBD8[0] != -1)
      swift_once();
    v30 = sub_1CAF202E0();
    __swift_project_value_buffer(v30, (uint64_t)qword_1EF98FD68);
    v31 = sub_1CAF202C8();
    v32 = sub_1CAF206B8();
    v33 = os_log_type_enabled(v31, v32);
    v34 = v71;
    if (v33)
    {
      v35 = (uint8_t *)swift_slowAlloc();
      v36 = swift_slowAlloc();
      v73[0] = v36;
      *(_DWORD *)v35 = 136315138;
      v72 = sub_1CAEDBE5C(0xD000000000000012, 0x80000001CAF2B8E0, v73);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v31, v32, "%s 'real soon'", v35, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v36, -1, -1);
      MEMORY[0x1D179A698](v35, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v18 + 8))(v34, v17);
    goto LABEL_17;
  }
  v60 = v16;
  sub_1CAF201C0();
  sub_1CAF201C0();
  v38 = v63;
  v37 = v64;
  (*(void (**)(char *, _QWORD, uint64_t))(v63 + 104))(v8, *MEMORY[0x1E0CB1130], v64);
  v39 = (uint64_t)v65;
  sub_1CAF201B4();
  (*(void (**)(char *, uint64_t))(v38 + 8))(v8, v37);
  v40 = v62;
  v41 = *(void (**)(char *, uint64_t))(v61 + 8);
  v41(v14, v62);
  (*(void (**)(char *, uint64_t, uint64_t))(v18 + 16))(v21, v29, v17);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v18 + 48))(v39, 1, v17) == 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v24, v21, v17);
    sub_1CAEF5168(v39, &qword_1EF98FDB8);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v18 + 8))(v21, v17);
    (*(void (**)(char *, uint64_t, uint64_t))(v18 + 32))(v24, v39, v17);
  }
  v42 = v60;
  sub_1CAF201A8();
  v43 = *(void (**)(char *, uint64_t))(v18 + 8);
  v43(v24, v17);
  v41(v42, v40);
  sub_1CAF20100();
  v44 = v71;
  sub_1CAF20100();
  v45 = (void *)objc_opt_self();
  v46 = objc_msgSend(v45, sel_milliseconds);
  sub_1CAF12AD8();
  v47 = v66;
  sub_1CAF1FF5C();
  v48 = objc_msgSend(v45, sel_seconds);
  v49 = v67;
  v50 = v69;
  sub_1CAF1FF74();

  v51 = *(void (**)(char *, uint64_t))(v68 + 8);
  v51(v47, v50);
  sub_1CAF1FF68();
  v53 = v52;
  v51(v49, v50);
  if ((~*(_QWORD *)&v53 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_19;
  }
  if (v53 <= -9.22337204e18)
  {
LABEL_19:
    __break(1u);
    goto LABEL_20;
  }
  if (v53 >= 9.22337204e18)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v39 = (uint64_t)v53;
  v74 = (uint64_t)v53;
  if (qword_1EF98FBD8[0] != -1)
LABEL_21:
    swift_once();
  v54 = sub_1CAF202E0();
  __swift_project_value_buffer(v54, (uint64_t)qword_1EF98FD68);
  v55 = sub_1CAF202C8();
  v56 = sub_1CAF206B8();
  if (os_log_type_enabled(v55, v56))
  {
    v57 = swift_slowAlloc();
    v58 = swift_slowAlloc();
    v73[0] = v58;
    *(_DWORD *)v57 = 136315394;
    v72 = sub_1CAEDBE5C(0xD000000000000012, 0x80000001CAF2B8E0, v73);
    sub_1CAF2076C();
    *(_WORD *)(v57 + 12) = 2048;
    v72 = v39;
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v55, v56, "%s computed %lld", (uint8_t *)v57, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v58, -1, -1);
    MEMORY[0x1D179A698](v57, -1, -1);
  }

  v43(v70, v17);
  v43(v44, v17);
LABEL_17:
  swift_beginAccess();
  return v74;
}

uint64_t (*sub_1CAF11B84())(uint64_t a1)
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  NSObject *v4;
  os_log_type_t v5;
  uint8_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v12;

  v1 = v0;
  v2 = *v0;
  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v3 = sub_1CAF202E0();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EF98FD68);
  v4 = sub_1CAF202C8();
  v5 = sub_1CAF206A0();
  if (os_log_type_enabled(v4, v5))
  {
    v6 = (uint8_t *)swift_slowAlloc();
    v7 = swift_slowAlloc();
    v12 = v7;
    *(_DWORD *)v6 = 136315138;
    sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2A170, &v12);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v4, v5, "%s", v6, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v7, -1, -1);
    MEMORY[0x1D179A698](v6, -1, -1);
  }

  v9 = v1[2];
  v8 = v1[3];
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = *(_QWORD *)(v2 + 80);
  v10[3] = *(_QWORD *)(v2 + 88);
  v10[4] = v9;
  v10[5] = v8;
  swift_retain();
  return sub_1CAF1284C;
}

uint64_t sub_1CAF11D44(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;

  v10 = *(_QWORD *)(a4 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](a1);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CAF20658();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a4);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = a4;
  *((_QWORD *)v17 + 5) = a5;
  *((_QWORD *)v17 + 6) = a2;
  *((_QWORD *)v17 + 7) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  swift_retain();
  sub_1CAF037B8((uint64_t)v14, (uint64_t)&unk_1EF991708, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_1CAF11E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[6] = a7;
  v8[7] = a8;
  v8[4] = a5;
  v8[5] = a6;
  v8[3] = a4;
  return swift_task_switch();
}

uint64_t sub_1CAF11EB4()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(void);
  uint64_t v9;

  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v1 = sub_1CAF202E0();
  __swift_project_value_buffer(v1, (uint64_t)qword_1EF98FD68);
  v2 = sub_1CAF202C8();
  v3 = sub_1CAF206A0();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    v5 = swift_slowAlloc();
    v9 = v5;
    *(_DWORD *)v4 = 136315138;
    *(_QWORD *)(v0 + 16) = sub_1CAEDBE5C(0xD000000000000011, 0x80000001CAF2A170, &v9);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v2, v3, "%s called block", v4, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v5, -1, -1);
    MEMORY[0x1D179A698](v4, -1, -1);
  }

  v8 = (uint64_t (*)(void))(**(int **)(v0 + 24) + *(_QWORD *)(v0 + 24));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 64) = v6;
  *v6 = v0;
  v6[1] = sub_1CAEDBC88;
  return v8();
}

uint64_t sub_1CAF1205C()
{
  uint64_t v0;

  swift_release();
  return v0;
}

const char *sub_1CAF12078()
{
  return "com.apple.family.cfu.signal";
}

uint64_t (*sub_1CAF1208C())(uint64_t a1)
{
  sub_1CAF11B84();
  return sub_1CAF1284C;
}

id sub_1CAF120A8()
{
  objc_class *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  objc_super v7;
  _BYTE v8[24];
  ValueMetadata *v9;
  _UNKNOWN **v10;
  _BYTE v11[24];
  ValueMetadata *v12;
  _UNKNOWN **v13;
  _BYTE v14[24];
  ValueMetadata *v15;
  _UNKNOWN **v16;

  v15 = &type metadata for SystemBackgroundRequestFactory;
  v16 = &protocol witness table for SystemBackgroundRequestFactory;
  v12 = &type metadata for CFUSchedulerFamilyProvider;
  v13 = &off_1E855F848;
  v0 = (objc_class *)type metadata accessor for FAFamilyCFUScheduler();
  v1 = (char *)objc_allocWithZone(v0);
  v2 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v11, (uint64_t)&type metadata for CFUSchedulerFamilyProvider);
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(void))(v3 + 16))();
  v9 = &type metadata for CFUSchedulerFamilyProvider;
  v10 = &off_1E855F848;
  v4 = &v1[OBJC_IVAR___FAFamilyCFUScheduler_scheduler];
  *(_OWORD *)v4 = 0u;
  *((_OWORD *)v4 + 1) = 0u;
  *((_QWORD *)v4 + 4) = 0;
  sub_1CAEEB17C((uint64_t)v14, (uint64_t)&v1[OBJC_IVAR___FAFamilyCFUScheduler_factory]);
  sub_1CAEEB17C((uint64_t)v8, (uint64_t)&v1[OBJC_IVAR___FAFamilyCFUScheduler_familyProvider]);
  v7.receiver = v1;
  v7.super_class = v0;
  v5 = objc_msgSendSuper2(&v7, sel_init);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v8);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v14);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v11);
  return v5;
}

uint64_t sub_1CAF121CC()
{
  return swift_task_switch();
}

uint64_t sub_1CAF121E0()
{
  _QWORD *v0;
  id v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = objc_msgSend(objc_allocWithZone((Class)FAFetchFamilyCircleRequest), sel_init);
  v0[16] = v1;
  objc_msgSend(v1, sel_setCachePolicy_, 0);
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_1CAF122A8;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x1E0C809B0];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_1CAF0EA8C;
  v3[3] = &block_descriptor_6;
  v3[4] = v2;
  objc_msgSend(v1, sel_startRequestWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_1CAF122A8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CAF12308()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120));
}

uint64_t sub_1CAF1233C()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;

  v1 = *(void **)(v0 + 128);
  swift_willThrow();

  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v2 = *(void **)(v0 + 136);
  v3 = sub_1CAF202E0();
  __swift_project_value_buffer(v3, (uint64_t)qword_1EF98FD68);
  v4 = v2;
  sub_1CAF1C254(v2);

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

void _s12FamilyCircle20FAFamilyCFUSchedulerC22scheduleWakeupIfNeededyyFZ_0()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v9 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  LOBYTE(v12) = 8;
  if ((_s12FamilyCircle0A12FeatureFlagsO7enabledySbACFZ_0((unsigned __int8 *)&v12) & 1) != 0)
  {
    v3 = sub_1CAF20658();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 56))(v2, 1, 1, v3);
    v4 = swift_allocObject();
    *(_QWORD *)(v4 + 16) = 0;
    *(_QWORD *)(v4 + 24) = 0;
    sub_1CAEED348((uint64_t)v2, (uint64_t)&unk_1EF991718, v4);
    swift_release();
  }
  else
  {
    if (qword_1EF98FBD8[0] != -1)
      swift_once();
    v5 = sub_1CAF202E0();
    __swift_project_value_buffer(v5, (uint64_t)qword_1EF98FD68);
    v10 = sub_1CAF202C8();
    v6 = sub_1CAF206B8();
    if (os_log_type_enabled(v10, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v8 = swift_slowAlloc();
      v12 = v8;
      *(_DWORD *)v7 = 136315138;
      v11 = sub_1CAEDBE5C(0xD000000000000018, 0x80000001CAF2B830, &v12);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v10, v6, "%s Required FF not set", v7, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v8, -1, -1);
      MEMORY[0x1D179A698](v7, -1, -1);
    }

  }
}

unint64_t sub_1CAF12628()
{
  unint64_t result;

  result = qword_1EF991658;
  if (!qword_1EF991658)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for CFUScheduleStatus, &type metadata for CFUScheduleStatus);
    atomic_store(result, (unint64_t *)&qword_1EF991658);
  }
  return result;
}

uint64_t sub_1CAF1266C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1CAEEB5B0;
  return v7(a1, a2);
}

uint64_t storeEnumTagSinglePayload for CFUScheduleStatus(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 5 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 5) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFB)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFA)
    return ((uint64_t (*)(void))((char *)&loc_1CAF12724 + 4 * byte_1CAF264F5[v4]))();
  *a1 = a2 + 5;
  return ((uint64_t (*)(void))((char *)sub_1CAF12758 + 4 * byte_1CAF264F0[v4]))();
}

uint64_t sub_1CAF12758(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF12760(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAF12768);
  return result;
}

uint64_t sub_1CAF12774(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAF1277CLL);
  *(_BYTE *)result = a2 + 5;
  return result;
}

uint64_t sub_1CAF12780(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF12788(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for CFUScheduleStatus()
{
  return &type metadata for CFUScheduleStatus;
}

uint64_t type metadata accessor for FAFamilyCFUScheduler()
{
  return objc_opt_self();
}

uint64_t method lookup function for FAFamilyCFUScheduler()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_1CAF127D0()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for FAFamilyCFUSystemBackgroundTaskProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FAFamilyCFUSystemBackgroundTaskProvider);
}

uint64_t sub_1CAF12828()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF1284C(uint64_t a1)
{
  uint64_t *v1;

  return sub_1CAF11D44(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1CAF12858()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CAF128CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  uint64_t v5;

  v2 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  v3 = *(_OWORD *)(v0 + 48);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80);
  *(_QWORD *)(v1 + 16) = v2;
  *(_QWORD *)v2 = v1;
  *(_QWORD *)(v2 + 8) = sub_1CAEDCC10;
  *(_OWORD *)(v2 + 48) = v4;
  *(_QWORD *)(v2 + 40) = v0 + ((v5 + 64) & ~v5);
  *(_OWORD *)(v2 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_1CAF1294C()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CAF12970(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1CAEDCC10;
  v3[2] = a1;
  return swift_task_switch();
}

uint64_t sub_1CAF129D0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1CAF129F4()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1CAEDCEDC;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_1CAF10680;
  return sub_1CAF106DC((uint64_t)(v1 + 3));
}

uint64_t sub_1CAF12A68()
{
  swift_release();
  return swift_deallocObject();
}

unint64_t sub_1CAF12A8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EF991760;
  if (!qword_1EF991760)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EF991758);
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for SystemBackgroundTaskScheduler<A, B, C>, v1);
    atomic_store(result, (unint64_t *)&qword_1EF991760);
  }
  return result;
}

unint64_t sub_1CAF12AD8()
{
  unint64_t result;

  result = qword_1EF991768;
  if (!qword_1EF991768)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1EF991768);
  }
  return result;
}

ValueMetadata *type metadata accessor for CFUSchedulerFamilyProvider()
{
  return &type metadata for CFUSchedulerFamilyProvider;
}

uint64_t FAFamilyChecklistRankingConfigRequest.__allocating_init()()
{
  uint64_t v0;

  v0 = swift_allocObject();
  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)FAFamilyCircleRequest), sel_init);
  return v0;
}

uint64_t FAFamilyChecklistRankingConfigRequest.init()()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 16) = objc_msgSend(objc_allocWithZone((Class)FAFamilyCircleRequest), sel_init);
  return v0;
}

uint64_t sub_1CAF12BA0(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = v1;
  return swift_task_switch();
}

uint64_t sub_1CAF12BB8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = v0[4];
  v1 = v0[5];
  v3 = swift_task_alloc();
  v0[6] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  *(_QWORD *)(v3 + 24) = v2;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903C0);
  *v4 = v0;
  v4[1] = sub_1CAF12C68;
  return sub_1CAF209AC();
}

uint64_t sub_1CAF12C68()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF12CD4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD, _QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16), *(_QWORD *)(v0 + 24));
}

void sub_1CAF12CE4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void (*v10)(char *, uint64_t, uint64_t);
  unint64_t v11;
  uint64_t v12;
  void (*v13)(unint64_t, char *, uint64_t);
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t aBlock;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;

  v19 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D8);
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(_QWORD *)(v6 + 64);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)(a2 + 16);
  v10 = *(void (**)(char *, uint64_t, uint64_t))(v6 + 16);
  v10(v8, a1, v5);
  v11 = (*(unsigned __int8 *)(v6 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
  v12 = swift_allocObject();
  v13 = *(void (**)(unint64_t, char *, uint64_t))(v6 + 32);
  v13(v12 + v11, v8, v5);
  v24 = sub_1CAF131D8;
  v25 = v12;
  aBlock = MEMORY[0x1E0C809B0];
  v21 = 1107296256;
  v22 = sub_1CAEE8E10;
  v23 = &block_descriptor_7;
  v14 = _Block_copy(&aBlock);
  swift_release();
  v15 = objc_msgSend(v9, sel_serviceRemoteObjectWithErrorHandler_, v14);
  _Block_release(v14);
  if (v15)
  {
    v10(v8, a1, v5);
    v16 = swift_allocObject();
    v13(v16 + v11, v8, v5);
    v24 = sub_1CAF13298;
    v25 = v16;
    aBlock = MEMORY[0x1E0C809B0];
    v21 = 1107296256;
    v22 = sub_1CAF13010;
    v23 = &block_descriptor_9;
    v17 = _Block_copy(&aBlock);
    swift_unknownObjectRetain();
    swift_release();
    objc_msgSend(v15, sel_familyChecklistRankingConfigWithCachePolicy_replyBlock_, v19, v17);
    swift_unknownObjectRelease_n();
    _Block_release(v17);
  }
}

void sub_1CAF12EF8(uint64_t a1)
{
  uint64_t v1;

  sub_1CAF12CE4(a1, *(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24));
}

void *sub_1CAF12F00(void *result)
{
  id v1;

  if (result)
  {
    v1 = result;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D8);
    return (void *)sub_1CAF205F8();
  }
  return result;
}

uint64_t sub_1CAF12F48(uint64_t a1, id a2)
{
  id v2;
  int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  _QWORD v9[4];

  if (a2)
  {
    v9[0] = a2;
    v2 = a2;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D8);
    return sub_1CAF205F8();
  }
  else
  {
    sub_1CAEF4BE8(a1, (uint64_t)v9);
    if (v9[3])
    {
      v4 = swift_dynamicCast();
      v5 = v7;
      v6 = v8;
      if (!v4)
      {
        v5 = 0;
        v6 = 0xF000000000000000;
      }
    }
    else
    {
      sub_1CAF0B888((uint64_t)v9);
      v5 = 0;
      v6 = 0xF000000000000000;
    }
    v9[0] = v5;
    v9[1] = v6;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D8);
    return sub_1CAF20604();
  }
}

uint64_t sub_1CAF13010(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(__int128 *, void *);
  id v6;
  __int128 v8;
  __int128 v9;

  v5 = *(void (**)(__int128 *, void *))(a1 + 32);
  if (a2)
  {
    *((_QWORD *)&v9 + 1) = swift_getObjectType();
    *(_QWORD *)&v8 = a2;
  }
  else
  {
    v8 = 0u;
    v9 = 0u;
  }
  swift_retain();
  swift_unknownObjectRetain();
  v6 = a3;
  v5(&v8, a3);
  swift_release();

  return sub_1CAF0B888((uint64_t)&v8);
}

uint64_t FAFamilyChecklistRankingConfigRequest.deinit()
{
  uint64_t v0;

  return v0;
}

uint64_t FAFamilyChecklistRankingConfigRequest.__deallocating_deinit()
{
  uint64_t v0;

  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for FAFamilyChecklistRankingConfigRequest()
{
  return objc_opt_self();
}

uint64_t method lookup function for FAFamilyChecklistRankingConfigRequest()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of FAFamilyChecklistRankingConfigRequest.__allocating_init()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of FAFamilyChecklistRankingConfigRequest.fetch(cachePolicy:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(*(_QWORD *)v1 + 96) + *(_QWORD *)(*(_QWORD *)v1 + 96));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1CAF13174;
  return v6(a1);
}

uint64_t sub_1CAF13174(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t v6;

  v6 = *v2;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(a1, a2);
}

void *sub_1CAF131D8(void *a1)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D8);
  return sub_1CAF12F00(a1);
}

uint64_t block_copy_helper_6(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_6()
{
  return swift_release();
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D8);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

uint64_t sub_1CAF13298(uint64_t a1, void *a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903D8);
  return sub_1CAF12F48(a1, a2);
}

uint64_t sub_1CAF132F0(uint64_t a1, uint64_t *a2, unint64_t *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  int64_t v10;
  uint64_t result;
  int64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  unint64_t v20;
  char v21;
  uint64_t v22;
  unint64_t *v23;
  unint64_t v24;
  char isUniquelyReferenced_nonNull_native;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t *v31;
  uint64_t v32;
  int64_t v33;
  _BYTE v34[40];
  _OWORD v35[2];
  uint64_t v36;
  _OWORD v37[2];
  uint64_t v38;
  char *v39;

  v31 = a3;
  v30 = sub_1CAF1FFA4();
  v29 = *(_QWORD *)(v30 - 8);
  MEMORY[0x1E0C80A78](v30);
  v39 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = a1 + 64;
  v7 = 1 << *(_BYTE *)(a1 + 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & *(_QWORD *)(a1 + 64);
  v10 = (unint64_t)(v7 + 63) >> 6;
  result = swift_bridgeObjectRetain();
  v12 = 0;
  v13 = MEMORY[0x1E0DEE9B8] + 8;
  v32 = a1 + 64;
  v33 = v10;
  while (v9)
  {
    v14 = __clz(__rbit64(v9));
    v9 &= v9 - 1;
    v15 = v14 | (v12 << 6);
LABEL_25:
    sub_1CAEDF4E0(*(_QWORD *)(a1 + 48) + 40 * v15, (uint64_t)v37);
    v35[0] = v37[0];
    v35[1] = v37[1];
    v36 = v38;
    v19 = *a2;
    if (*(_QWORD *)(*a2 + 16))
    {
      v20 = sub_1CAEDE8B0((uint64_t)v35);
      if ((v21 & 1) != 0)
      {
        sub_1CAEDCD8C(*(_QWORD *)(v19 + 56) + 32 * v20, (uint64_t)v34);
        if (swift_dynamicCast())
        {
          v22 = v13;
          sub_1CAEDF4E0((uint64_t)v35, (uint64_t)v34);
          if ((swift_dynamicCast() & 1) != 0)
          {
            sub_1CAF1FF98();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            v23 = v31;
            v24 = *v31;
            isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
            *v23 = v24;
            if ((isUniquelyReferenced_nonNull_native & 1) == 0)
            {
              v24 = sub_1CAEE5AFC(0, *(_QWORD *)(v24 + 16) + 1, 1, v24);
              *v31 = v24;
            }
            v27 = *(_QWORD *)(v24 + 16);
            v26 = *(_QWORD *)(v24 + 24);
            if (v27 >= v26 >> 1)
            {
              v24 = sub_1CAEE5AFC(v26 > 1, v27 + 1, 1, v24);
              *v31 = v24;
            }
            *(_QWORD *)(v24 + 16) = v27 + 1;
            (*(void (**)(unint64_t, char *, uint64_t))(v29 + 32))(v24+ ((*(unsigned __int8 *)(v29 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v29 + 80))+ *(_QWORD *)(v29 + 72) * v27, v39, v30);
          }
          else
          {
            swift_bridgeObjectRelease();
          }
          v13 = v22;
          v6 = v32;
          v10 = v33;
        }
      }
    }
    result = sub_1CAEDF51C((uint64_t)v35);
  }
  v16 = v12 + 1;
  if (__OFADD__(v12, 1))
  {
    __break(1u);
    goto LABEL_36;
  }
  if (v16 >= v10)
    return swift_release();
  v17 = *(_QWORD *)(v6 + 8 * v16);
  ++v12;
  if (v17)
    goto LABEL_24;
  v12 = v16 + 1;
  if (v16 + 1 >= v10)
    return swift_release();
  v17 = *(_QWORD *)(v6 + 8 * v12);
  if (v17)
    goto LABEL_24;
  v12 = v16 + 2;
  if (v16 + 2 >= v10)
    return swift_release();
  v17 = *(_QWORD *)(v6 + 8 * v12);
  if (v17)
    goto LABEL_24;
  v12 = v16 + 3;
  if (v16 + 3 >= v10)
    return swift_release();
  v17 = *(_QWORD *)(v6 + 8 * v12);
  if (v17)
  {
LABEL_24:
    v9 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v12 << 6);
    goto LABEL_25;
  }
  v18 = v16 + 4;
  if (v18 >= v10)
    return swift_release();
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v12 = v18;
    goto LABEL_24;
  }
  while (1)
  {
    v12 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v12 >= v10)
      return swift_release();
    v17 = *(_QWORD *)(v6 + 8 * v12);
    ++v18;
    if (v17)
      goto LABEL_24;
  }
LABEL_36:
  __break(1u);
  return result;
}

uint64_t static FamilySettingsDestinations.uuid.getter()
{
  return sub_1CAF136C4((uint64_t *)aUuid);
}

uint64_t static FamilySettingsDestinations.uuid.setter(uint64_t a1, uint64_t a2)
{
  return sub_1CAF13724(a1, a2, aUuid, &qword_1EF991790);
}

uint64_t (*static FamilySettingsDestinations.uuid.modify())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t static FamilySettingsDestinations.altDSID.getter()
{
  return sub_1CAF136C4((uint64_t *)aAltdsid_2);
}

uint64_t sub_1CAF136C4(uint64_t *a1)
{
  uint64_t v2;

  swift_beginAccess();
  v2 = *a1;
  swift_bridgeObjectRetain();
  return v2;
}

uint64_t static FamilySettingsDestinations.altDSID.setter(uint64_t a1, uint64_t a2)
{
  return sub_1CAF13724(a1, a2, aAltdsid_2, &aAltdsid_2[1]);
}

uint64_t sub_1CAF13724(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4)
{
  swift_beginAccess();
  *a3 = a1;
  *a4 = a2;
  return swift_bridgeObjectRelease();
}

uint64_t (*static FamilySettingsDestinations.altDSID.modify())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t sub_1CAF137C0()
{
  uint64_t inited;
  unint64_t v1;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903B8);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAF26730;
  *(_OWORD *)(inited + 32) = xmmword_1CAF26740;
  *(_QWORD *)(inited + 48) = 0x80000001CAF2BB30;
  *(_OWORD *)(inited + 56) = xmmword_1CAF26750;
  *(_QWORD *)(inited + 72) = 0x80000001CAF2BB60;
  *(_OWORD *)(inited + 80) = xmmword_1CAF26760;
  *(_QWORD *)(inited + 96) = 0x80000001CAF2BBA0;
  *(_OWORD *)(inited + 104) = xmmword_1CAF26770;
  *(_QWORD *)(inited + 120) = 0x80000001CAF2BBD0;
  *(_QWORD *)(inited + 128) = 12;
  sub_1CAF207FC();
  sub_1CAF204A8();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  sub_1CAF204A8();
  *(_QWORD *)(inited + 136) = 0;
  *(_QWORD *)(inited + 144) = 0xE000000000000000;
  *(_OWORD *)(inited + 152) = xmmword_1CAF26780;
  *(_QWORD *)(inited + 168) = 0x80000001CAF2BC70;
  *(_OWORD *)(inited + 176) = xmmword_1CAF26790;
  *(_QWORD *)(inited + 192) = 0x80000001CAF2BCD0;
  *(_OWORD *)(inited + 200) = xmmword_1CAF267A0;
  *(_QWORD *)(inited + 216) = 0x80000001CAF2BD20;
  *(_OWORD *)(inited + 224) = xmmword_1CAF267B0;
  *(_QWORD *)(inited + 240) = 0x80000001CAF2BD70;
  *(_OWORD *)(inited + 248) = xmmword_1CAF267C0;
  *(_QWORD *)(inited + 264) = 0x80000001CAF2BDB0;
  *(_QWORD *)(inited + 272) = 9;
  sub_1CAF207FC();
  sub_1CAF204A8();
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1CAF204A8();
  swift_bridgeObjectRelease();
  sub_1CAF204A8();
  *(_QWORD *)(inited + 280) = 0;
  *(_QWORD *)(inited + 288) = 0xE000000000000000;
  *(_QWORD *)(inited + 296) = 10;
  *(_QWORD *)(inited + 304) = 0xD00000000000001ALL;
  *(_QWORD *)(inited + 312) = 0x80000001CAF2BE40;
  *(_OWORD *)(inited + 320) = xmmword_1CAF267D0;
  *(_QWORD *)(inited + 336) = 0x80000001CAF2BE60;
  v1 = sub_1CAF0D368((_QWORD *)inited);
  swift_setDeallocating();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9903A8);
  result = swift_arrayDestroy();
  qword_1EF9951A0 = v1;
  return result;
}

void static FamilySettingsDestinations.urlDestination(to:)(uint64_t a1)
{
  void *ObjCClassFromMetadata;
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8[2];

  v8[1] = *(id *)MEMORY[0x1E0C80C00];
  ObjCClassFromMetadata = (void *)swift_getObjCClassFromMetadata();
  sub_1CAF0BBBC(MEMORY[0x1E0DEE9D8]);
  v3 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  v8[0] = 0;
  v4 = objc_msgSend(ObjCClassFromMetadata, sel_urlDestinationTo_params_error_, a1, v3, v8);

  v5 = v8[0];
  if (v4)
  {
    sub_1CAF200AC();
    v6 = v5;

  }
  else
  {
    v7 = v8[0];
    sub_1CAF20070();

    swift_willThrow();
  }
}

uint64_t static FamilySettingsDestinations.urlDestination(to:params:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  unint64_t v13;
  char v14;
  unint64_t *v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  char v19;
  uint64_t v20;
  NSObject *v21;
  os_log_type_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t result;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  unint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  uint64_t v38;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFB0);
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v31 - v10;
  if (qword_1EF98FFB8 != -1)
    swift_once();
  v12 = qword_1EF9951A0;
  if (!*(_QWORD *)(qword_1EF9951A0 + 16) || (v13 = sub_1CAEDE8E0(a1), (v14 & 1) == 0))
  {
    if (qword_1ECFCE888 != -1)
      swift_once();
    v20 = sub_1CAF202E0();
    __swift_project_value_buffer(v20, (uint64_t)qword_1ECFCE8A8);
    v21 = sub_1CAF202C8();
    v22 = sub_1CAF206AC();
    if (os_log_type_enabled(v21, v22))
    {
      v23 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v23 = 0;
      _os_log_impl(&dword_1CAEBA000, v21, v22, "destination does not contain a value so returning default path", v23, 2u);
      MEMORY[0x1D179A698](v23, -1, -1);
    }

    v34 = 0;
    v35 = 0xE000000000000000;
    sub_1CAF207FC();
    sub_1CAF204A8();
    *(_QWORD *)&v36 = a1;
    type metadata accessor for Destination(0);
    sub_1CAF208A4();
    v24 = v34;
    LOBYTE(v34) = 14;
    _s12FamilyCircle0A5ErrorO06createC9WithTrace_4code6domain4files0C0_pSS_ACS2StFZ_0(v24, v35, (char *)&v34, 0xD000000000000010, 0x80000001CAF2A540, 0xD00000000000002DLL, 0x80000001CAF2BA50);
    swift_bridgeObjectRelease();
    return swift_willThrow();
  }
  v15 = (unint64_t *)(*(_QWORD *)(v12 + 56) + 16 * v13);
  v17 = *v15;
  v16 = v15[1];
  v38 = a2;
  if (a1 == 9)
  {
    swift_beginAccess();
    v33 = xmmword_1EF991788;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1CAF207F0();
    if (*(_QWORD *)(a2 + 16) && (v18 = sub_1CAEDE8B0((uint64_t)&v34), (v19 & 1) != 0))
    {
      sub_1CAEDCD8C(*(_QWORD *)(a2 + 56) + 32 * v18, (uint64_t)&v36);
    }
    else
    {
      v36 = 0u;
      v37 = 0u;
    }
    sub_1CAEDF51C((uint64_t)&v34);
    if (*((_QWORD *)&v37 + 1))
    {
      if ((swift_dynamicCast() & 1) != 0)
      {
        v26 = *((_QWORD *)&v33 + 1);
        v32 = v33;
        v36 = xmmword_1EF991788;
        swift_bridgeObjectRetain();
        sub_1CAF207F0();
        sub_1CAF144CC((uint64_t)&v34, &v36);
        sub_1CAEDF51C((uint64_t)&v34);
        sub_1CAEF5168((uint64_t)&v36, (uint64_t *)&unk_1EF9903E8);
        v34 = v17;
        v35 = v16;
        v36 = xmmword_1EF991788;
        *(_QWORD *)&v33 = v32;
        *((_QWORD *)&v33 + 1) = v26;
        sub_1CAEEBEE8();
        sub_1CAF20790();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_19;
      }
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_bridgeObjectRelease();
      sub_1CAEF5168((uint64_t)&v36, (uint64_t *)&unk_1EF9903E8);
    }
    LOBYTE(v34) = 14;
    _s12FamilyCircle0A5ErrorO06createC9WithTrace_4code6domain4files0C0_pSS_ACS2StFZ_0(0xD00000000000001CLL, 0x80000001CAF2BAB0, (char *)&v34, 0xD000000000000010, 0x80000001CAF2A540, 0xD00000000000002DLL, 0x80000001CAF2BA50);
    swift_willThrow();
    return swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
LABEL_19:
  sub_1CAF200C4();
  swift_bridgeObjectRelease();
  if (*(_QWORD *)(v38 + 16))
  {
    v34 = MEMORY[0x1E0DEE9D8];
    v27 = swift_bridgeObjectRetain();
    sub_1CAF132F0(v27, &v38, &v34);
    swift_bridgeObjectRelease();
    v28 = sub_1CAF200D0();
    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 48))(v11, 1, v28))
    {
      swift_bridgeObjectRetain();
      sub_1CAF200B8();
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  sub_1CAEDD128((uint64_t)v11, (uint64_t)v9);
  v29 = sub_1CAF200D0();
  v30 = *(_QWORD *)(v29 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v9, 1, v29) != 1)
  {
    (*(void (**)(uint64_t, char *, uint64_t))(v30 + 32))(a3, v9, v29);
    sub_1CAEF5168((uint64_t)v11, &qword_1EF98FFB0);
    return swift_bridgeObjectRelease();
  }
  sub_1CAEF5168((uint64_t)v9, &qword_1EF98FFB0);
  result = sub_1CAF208BC();
  __break(1u);
  return result;
}

FamilySettingsDestinations __swiftcall FamilySettingsDestinations.init()()
{
  return (FamilySettingsDestinations)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id FamilySettingsDestinations.init()()
{
  objc_super v1;

  v1.super_class = (Class)FamilySettingsDestinations;
  return objc_msgSendSuper2(&v1, sel_init);
}

double sub_1CAF144CC@<D0>(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  double result;
  uint64_t v11;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1CAEDE8B0(a1);
  LOBYTE(a1) = v7;
  swift_bridgeObjectRelease();
  if ((a1 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v9 = *v3;
    v11 = *v3;
    *v3 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1CAEEAAC0();
      v9 = v11;
    }
    sub_1CAEDF51C(*(_QWORD *)(v9 + 48) + 40 * v6);
    sub_1CAEEBF2C((_OWORD *)(*(_QWORD *)(v9 + 56) + 32 * v6), a2);
    sub_1CAF14788(v6, v9);
    *v3 = v9;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a2 = 0u;
    a2[1] = 0u;
  }
  return result;
}

uint64_t sub_1CAF145B4(uint64_t a1, uint64_t a2)
{
  uint64_t *v2;
  uint64_t *v3;
  unint64_t v6;
  char v7;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;

  v3 = v2;
  swift_bridgeObjectRetain();
  v6 = sub_1CAEDE164(a1, a2);
  LOBYTE(a2) = v7;
  swift_bridgeObjectRelease();
  if ((a2 & 1) == 0)
    return 0;
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v9 = *v3;
  v12 = *v3;
  *v3 = 0x8000000000000000;
  if (!isUniquelyReferenced_nonNull_native)
  {
    sub_1CAEEACA4();
    v9 = v12;
  }
  swift_bridgeObjectRelease();
  v10 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 16 * v6);
  sub_1CAF14950(v6, v9);
  *v3 = v9;
  swift_bridgeObjectRelease();
  return v10;
}

double sub_1CAF14698@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_1CAEDE164(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_1CAEEAE5C();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_1CAEEBF2C((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_1CAF14B24(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

unint64_t sub_1CAF14788(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  _BYTE v28[40];

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CAF207C0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CAEDF4E0(*(_QWORD *)(a2 + 48) + 40 * v6, (uint64_t)v28);
        v10 = sub_1CAF207D8();
        result = sub_1CAEDF51C((uint64_t)v28);
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 >= v8 && v3 >= (uint64_t)v11)
          {
LABEL_16:
            v14 = *(_QWORD *)(a2 + 48);
            v15 = v14 + 40 * v3;
            v16 = (__int128 *)(v14 + 40 * v6);
            if (v3 != v6 || v15 >= (unint64_t)v16 + 40)
            {
              v17 = *v16;
              v18 = v16[1];
              *(_QWORD *)(v15 + 32) = *((_QWORD *)v16 + 4);
              *(_OWORD *)v15 = v17;
              *(_OWORD *)(v15 + 16) = v18;
            }
            v19 = *(_QWORD *)(a2 + 56);
            v20 = (_OWORD *)(v19 + 32 * v3);
            v21 = (_OWORD *)(v19 + 32 * v6);
            if (v3 != v6 || (v3 = v6, v20 >= v21 + 2))
            {
              v9 = v21[1];
              *v20 = *v21;
              v20[1] = v9;
              v3 = v6;
            }
          }
        }
        else if (v11 >= v8 || v3 >= (uint64_t)v11)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v22 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v23 = *v22;
    v24 = (-1 << v3) - 1;
  }
  else
  {
    v22 = (uint64_t *)(v4 + 8 * (result >> 6));
    v24 = *v22;
    v23 = (-1 << result) - 1;
  }
  *v22 = v24 & v23;
  v25 = *(_QWORD *)(a2 + 16);
  v26 = __OFSUB__(v25, 1);
  v27 = v25 - 1;
  if (v26)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v27;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1CAF14950(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _OWORD *v12;
  _OWORD *v13;
  uint64_t v14;
  _OWORD *v15;
  _OWORD *v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CAF207C0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CAF20A18();
        swift_bridgeObjectRetain();
        sub_1CAF20490();
        v9 = sub_1CAF20A30();
        result = swift_bridgeObjectRelease();
        v10 = v9 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v10 < v8)
            goto LABEL_5;
        }
        else if (v10 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v10)
        {
LABEL_11:
          v11 = *(_QWORD *)(a2 + 48);
          v12 = (_OWORD *)(v11 + 16 * v3);
          v13 = (_OWORD *)(v11 + 16 * v6);
          if (v3 != v6 || v12 >= v13 + 1)
            *v12 = *v13;
          v14 = *(_QWORD *)(a2 + 56);
          v15 = (_OWORD *)(v14 + 16 * v3);
          v16 = (_OWORD *)(v14 + 16 * v6);
          if (v3 != v6 || (v3 = v6, v15 >= v16 + 1))
          {
            *v15 = *v16;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v17 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v18 = *v17;
    v19 = (-1 << v3) - 1;
  }
  else
  {
    v17 = (uint64_t *)(v4 + 8 * (result >> 6));
    v19 = *v17;
    v18 = (-1 << result) - 1;
  }
  *v17 = v19 & v18;
  v20 = *(_QWORD *)(a2 + 16);
  v21 = __OFSUB__(v20, 1);
  v22 = v20 - 1;
  if (v21)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v22;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_1CAF14B24(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_1CAF207C0();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_1CAF20A18();
        swift_bridgeObjectRetain();
        sub_1CAF20490();
        v10 = sub_1CAF20A30();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t type metadata accessor for FamilySettingsDestinations()
{
  unint64_t result;

  result = qword_1EF9917A8;
  if (!qword_1EF9917A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF9917A8);
  }
  return result;
}

FamilyCircle::RemoteGuardianInviteKeys_optional __swiftcall RemoteGuardianInviteKeys.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FamilyCircle::RemoteGuardianInviteKeys_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CAF20910();
  result.value = swift_bridgeObjectRelease();
  v5 = 10;
  if (v3 < 0xA)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t RemoteGuardianInviteKeys.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CAF14DBC + 4 * byte_1CAF267E0[*v0]))(0x79654B656C746974, 0xE800000000000000);
}

uint64_t sub_1CAF14DBC()
{
  return 0x656C746974627573;
}

uint64_t sub_1CAF14DDC()
{
  return 0x5255657469766E69;
}

uint64_t sub_1CAF14DFC()
{
  return 0x6F43657469766E69;
}

uint64_t sub_1CAF14E20()
{
  return 0x4B4C52556E6F6369;
}

unint64_t sub_1CAF14E3C()
{
  return 0xD000000000000014;
}

void sub_1CAF14EC4(char *a1)
{
  sub_1CAF17040(*a1);
}

uint64_t sub_1CAF14ED0()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1CAF20A18();
  sub_1CAF17850((uint64_t)v3, v1);
  return sub_1CAF20A30();
}

void sub_1CAF14F14(uint64_t a1)
{
  char *v1;

  sub_1CAF17850(a1, *v1);
}

uint64_t sub_1CAF14F1C()
{
  char *v0;
  char v1;
  _BYTE v3[72];

  v1 = *v0;
  sub_1CAF20A18();
  sub_1CAF17850((uint64_t)v3, v1);
  return sub_1CAF20A30();
}

FamilyCircle::RemoteGuardianInviteKeys_optional sub_1CAF14F5C(Swift::String *a1)
{
  return RemoteGuardianInviteKeys.init(rawValue:)(*a1);
}

uint64_t sub_1CAF14F68@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = RemoteGuardianInviteKeys.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t HelpTopic.id.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)())((char *)sub_1CAF14FAC + 4 * byte_1CAF267EA[*v0]))();
}

uint64_t sub_1CAF14FAC()
{
  return 0x636566316C68636DLL;
}

uint64_t sub_1CAF14FCC()
{
  return 0x616664326C68636DLL;
}

uint64_t sub_1CAF14FEC()
{
  return 0x346438626C68636DLL;
}

uint64_t HelpTopic.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)())((char *)sub_1CAF1502C + 4 * byte_1CAF267EE[*v0]))();
}

uint64_t sub_1CAF1502C()
{
  return 0x636566316C68636DLL;
}

uint64_t sub_1CAF1504C()
{
  return 0x616664326C68636DLL;
}

uint64_t sub_1CAF1506C()
{
  return 0x346438626C68636DLL;
}

FamilyCircle::HelpTopic_optional __swiftcall HelpTopic.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FamilyCircle::HelpTopic_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CAF20910();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

void sub_1CAF150E4(char *a1)
{
  sub_1CAF16EE8(*a1);
}

void sub_1CAF150F0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CAF20A18();
  __asm { BR              X9 }
}

uint64_t sub_1CAF1512C()
{
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

void sub_1CAF151B8()
{
  __asm { BR              X9 }
}

uint64_t sub_1CAF151E4()
{
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

void sub_1CAF15258()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CAF20A18();
  __asm { BR              X9 }
}

uint64_t sub_1CAF15290()
{
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

FamilyCircle::HelpTopic_optional sub_1CAF1531C(Swift::String *a1)
{
  return HelpTopic.init(rawValue:)(*a1);
}

uint64_t sub_1CAF15328()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1CAF15348 + 4 * byte_1CAF267FE[*v0]))();
}

void sub_1CAF15348(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "mchl1fec4810");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_1CAF1536C(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "mchl2dfa792e");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_1CAF15390(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "mchlb8d4803d");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

unint64_t static ProfilePictureMarqueKeyNames.lightModeKey.getter()
{
  return 0xD000000000000016;
}

unint64_t static ProfilePictureMarqueKeyNames.darkModeKey.getter()
{
  return 0xD000000000000015;
}

uint64_t static ProfilePictureMarqueKeyNames.rowState.getter()
{
  return 0x6F52796C696D6146;
}

uint64_t static ProfilePictureMarqueKeyNames.refreshed.getter()
{
  return 0x614D796C696D6146;
}

id ProfilePictureMarqueKeyNames.init()()
{
  return sub_1CAF15548(type metadata accessor for ProfilePictureMarqueKeyNames);
}

uint64_t type metadata accessor for ProfilePictureMarqueKeyNames()
{
  return objc_opt_self();
}

id ProfilePictureMarqueKeyNames.__deallocating_deinit()
{
  return sub_1CAF155EC(type metadata accessor for ProfilePictureMarqueKeyNames);
}

unint64_t static FamilyDefaultSuites.familyUserDefaultsSuite.getter()
{
  return 0xD000000000000016;
}

uint64_t static FamilyDefaultSuites.familyDaemonDefaultsSuite.getter()
{
  return 0x6963796C696D6166;
}

id FamilyDefaultSuites.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id FamilyDefaultSuites.init()()
{
  return sub_1CAF15548(type metadata accessor for FamilyDefaultSuites);
}

id sub_1CAF15548(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for FamilyDefaultSuites()
{
  return objc_opt_self();
}

id sub_1CAF155A4(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  objc_super v4;

  v4.receiver = a1;
  v4.super_class = (Class)a3();
  return objc_msgSendSuper2(&v4, sel_init);
}

id FamilyDefaultSuites.__deallocating_deinit()
{
  return sub_1CAF155EC(type metadata accessor for FamilyDefaultSuites);
}

id sub_1CAF155EC(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

Swift::Bool __swiftcall NSUserDefaults.exists(key:)(Swift::String key)
{
  void *v1;
  void *v2;
  id v3;
  _OWORD v5[2];

  v2 = (void *)sub_1CAF203DC();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1CAF2079C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1CAF0B888((uint64_t)v5);
  return v3 != 0;
}

Swift::Void __swiftcall NSUserDefaults.clear(key:)(Swift::String key)
{
  void *v1;
  id v2;

  v2 = (id)sub_1CAF203DC();
  objc_msgSend(v1, sel_removeObjectForKey_, v2);

}

id sub_1CAF156E4()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;

  v1 = *v0;
  v2 = (void *)sub_1CAF203DC();
  v3 = objc_msgSend(v1, sel_integerForKey_, v2);

  return v3;
}

uint64_t sub_1CAF15728()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;
  uint64_t v4;

  v1 = *v0;
  v2 = (void *)sub_1CAF203DC();
  v3 = objc_msgSend(v1, sel_stringForKey_, v2);

  if (!v3)
    return 0;
  v4 = sub_1CAF20400();

  return v4;
}

void sub_1CAF157A4(uint64_t a1)
{
  sub_1CAF157C4(a1);
}

void sub_1CAF157C4(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[3];
  uint64_t v10;

  sub_1CAEF4BE8(a1, (uint64_t)v9);
  v2 = v10;
  if (v10)
  {
    v3 = __swift_project_boxed_opaque_existential_1(v9, v10);
    v4 = *(_QWORD *)(v2 - 8);
    MEMORY[0x1E0C80A78](v3);
    v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v4 + 16))(v6);
    v7 = sub_1CAF20994();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v2);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v9);
  }
  else
  {
    v7 = 0;
  }
  v8 = (void *)sub_1CAF203DC();
  objc_msgSend(v1, sel_setObject_forKey_, v7, v8);
  swift_unknownObjectRelease();

}

BOOL sub_1CAF158CC()
{
  void **v0;
  void *v1;
  void *v2;
  id v3;
  _OWORD v5[2];

  v1 = *v0;
  v2 = (void *)sub_1CAF203DC();
  v3 = objc_msgSend(v1, sel_objectForKey_, v2);

  if (v3)
  {
    sub_1CAF2079C();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v5, 0, sizeof(v5));
  }
  sub_1CAF0B888((uint64_t)v5);
  return v3 != 0;
}

void sub_1CAF15954()
{
  void **v0;
  void *v1;
  id v2;

  v1 = *v0;
  v2 = (id)sub_1CAF203DC();
  objc_msgSend(v1, sel_removeObjectForKey_, v2);

}

uint64_t static InviteScheme.inviteFamilyMemberScheme.getter()
{
  return 0x7370747468;
}

unint64_t static InviteScheme.inviteFamilyMemberHost.getter()
{
  return 0xD000000000000010;
}

unint64_t static InviteScheme.inviteFamilyMemberPath.getter()
{
  return 0xD000000000000023;
}

uint64_t static InviteScheme.queryParamsActionKey.getter()
{
  return 0x6E6F6974636161;
}

unint64_t static InviteScheme.queryParamsActionValue.getter()
{
  return 0xD000000000000010;
}

uint64_t static InviteScheme.queryParamsInviteCodeKey.getter()
{
  return 0x632D657469766E69;
}

uint64_t sub_1CAF15A38()
{
  uint64_t result;
  uint64_t v1;

  result = sub_1CAF20A78();
  qword_1EF9917B0 = result;
  *(_QWORD *)algn_1EF9917B8 = v1;
  return result;
}

uint64_t static FamilyTimeouts.maxScreenTimeWait.getter()
{
  if (qword_1EF990DC0 != -1)
    swift_once();
  return qword_1EF9917B0;
}

unint64_t sub_1CAF15AA4()
{
  unint64_t result;

  result = qword_1EF9917C0;
  if (!qword_1EF9917C0)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for RemoteGuardianInviteKeys, &type metadata for RemoteGuardianInviteKeys);
    atomic_store(result, (unint64_t *)&qword_1EF9917C0);
  }
  return result;
}

unint64_t sub_1CAF15AEC()
{
  unint64_t result;

  result = qword_1EF9917C8;
  if (!qword_1EF9917C8)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for HelpTopic, &type metadata for HelpTopic);
    atomic_store(result, &qword_1EF9917C8);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for RemoteGuardianInviteKeys(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xF7)
    goto LABEL_17;
  if (a2 + 9 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 9) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 9;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 9;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 9;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 0xA;
  v8 = v6 - 10;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for RemoteGuardianInviteKeys(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 9 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 9) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xF7)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xF6)
    return ((uint64_t (*)(void))((char *)&loc_1CAF15C0C + 4 * byte_1CAF26807[v4]))();
  *a1 = a2 + 9;
  return ((uint64_t (*)(void))((char *)sub_1CAF15C40 + 4 * byte_1CAF26802[v4]))();
}

uint64_t sub_1CAF15C40(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF15C48(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAF15C50);
  return result;
}

uint64_t sub_1CAF15C5C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAF15C64);
  *(_BYTE *)result = a2 + 9;
  return result;
}

uint64_t sub_1CAF15C68(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF15C70(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for RemoteGuardianInviteKeys()
{
  return &type metadata for RemoteGuardianInviteKeys;
}

uint64_t storeEnumTagSinglePayload for HelpTopic(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1CAF15CD8 + 4 * byte_1CAF26811[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1CAF15D0C + 4 * byte_1CAF2680C[v4]))();
}

uint64_t sub_1CAF15D0C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF15D14(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAF15D1CLL);
  return result;
}

uint64_t sub_1CAF15D28(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAF15D30);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1CAF15D34(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF15D3C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for HelpTopic()
{
  return &type metadata for HelpTopic;
}

uint64_t dispatch thunk of FamilyUserDefaultsProtocol.integer(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 8))();
}

uint64_t dispatch thunk of FamilyUserDefaultsProtocol.string(forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 16))();
}

uint64_t dispatch thunk of FamilyUserDefaultsProtocol.set(_:forKey:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(void))(a5 + 24))();
}

uint64_t dispatch thunk of FamilyUserDefaultsProtocol.exists(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 32))();
}

uint64_t dispatch thunk of FamilyUserDefaultsProtocol.clear(key:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(a4 + 40))();
}

ValueMetadata *type metadata accessor for InviteScheme()
{
  return &type metadata for InviteScheme;
}

ValueMetadata *type metadata accessor for FamilyTimeouts()
{
  return &type metadata for FamilyTimeouts;
}

uint64_t XPCActivityScheduler.__allocating_init(taskProvider:)(uint64_t a1)
{
  uint64_t result;

  result = swift_allocObject();
  *(_QWORD *)(result + 16) = 0;
  *(_QWORD *)(result + 24) = a1;
  return result;
}

uint64_t sub_1CAF15DD4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_release();
}

uint64_t XPCActivityScheduler.taskProvider.getter()
{
  sub_1CAF16B18();
  return swift_unknownObjectRetain();
}

uint64_t XPCActivityScheduler.init(taskProvider:)(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = 0;
  *(_QWORD *)(v1 + 24) = a1;
  return v1;
}

uint64_t sub_1CAF15E04()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;

  v1[3] = v0;
  v1[4] = *v0;
  v2 = sub_1CAF202E0();
  v1[5] = v2;
  v1[6] = *(_QWORD *)(v2 - 8);
  v1[7] = swift_task_alloc();
  sub_1CAF2037C();
  v1[8] = swift_task_alloc();
  return swift_task_switch();
}

unint64_t sub_1CAF15E8C()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t (*v6)(uint64_t, uint64_t);
  unint64_t result;
  char v8;
  unint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
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
  _QWORD *v28;
  _QWORD *v29;
  int v30;
  unsigned int v31;
  unsigned int v32;
  unsigned int v33;
  unsigned int v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v2 = v0[4];
  v3 = *(_QWORD *)(v0[3] + 24);
  v5 = *(_QWORD *)(v2 + 80);
  v4 = *(_QWORD *)(v2 + 88);
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 48);
  result = v6(v5, v4);
  if ((v8 & 1) == 0)
  {
    if (result)
      goto LABEL_11;
    __break(1u);
  }
  v9 = HIDWORD(result);
  if (HIDWORD(result))
  {
    __break(1u);
    goto LABEL_17;
  }
  if (result >> 11 != 27)
  {
    LODWORD(v9) = WORD1(result);
    if (WORD1(result) <= 0x10u)
    {
      if ((result & 0xFFFFFF80) == 0)
      {
        if (result > 0xFF)
        {
          __break(1u);
          goto LABEL_25;
        }
        v10 = (result + 1);
        goto LABEL_10;
      }
LABEL_18:
      v30 = (result & 0x3F) << 8;
      v31 = (v30 | (result >> 6)) + 33217;
      v32 = (v30 | (result >> 6) & 0x3F) << 8;
      v33 = (((v32 | (result >> 12) & 0x3F) << 8) | (result >> 18)) - 2122219023;
      v34 = (v32 | (result >> 12)) + 8487393;
      if ((_DWORD)v9)
        v10 = v33;
      else
        v10 = v34;
      if (result < 0x800)
        v10 = v31;
LABEL_10:
      v0[2] = (v10 + 0xFEFEFEFEFEFEFFLL) & ~(-1 << (8 * ((4 - (__clz(v10) >> 3)) & 7)));
LABEL_11:
      v11 = sub_1CAF20478();
      v13 = v0[3];
      if (*(_QWORD *)(v13 + 16))
      {
        swift_bridgeObjectRelease();
LABEL_15:
        sub_1CAF2022C();
        v6(v5, v4);
        v25 = v3;
        v26 = v5;
        v27 = *(_QWORD *)(v13 + 16);
        v0[9] = v27;
        v28 = (_QWORD *)swift_task_alloc();
        v0[10] = v28;
        v28[2] = v26;
        v28[3] = v4;
        v28[4] = v25;
        v28[5] = v27;
        swift_retain();
        v29 = (_QWORD *)swift_task_alloc();
        v0[11] = v29;
        *v29 = v0;
        v29[1] = sub_1CAF1625C;
        return sub_1CAF20214();
      }
      v40 = v12;
      v36 = v6;
      v37 = v11;
      v38 = v0[3];
      v1 = (_QWORD *)swift_allocObject();
      v1[2] = v5;
      v1[3] = v4;
      v1[4] = v3;
      v14 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 56);
      swift_unknownObjectRetain();
      v39 = v5;
      v15 = v14(v5, v4);
      v17 = v16;
      v5 = swift_allocObject();
      *(_QWORD *)(v5 + 16) = v15;
      *(_QWORD *)(v5 + 24) = v17;
      if (qword_1ECFCE740 == -1)
      {
LABEL_14:
        v18 = v0[7];
        v35 = v0[8];
        v19 = v0[5];
        v20 = v0[6];
        v21 = __swift_project_value_buffer(v19, (uint64_t)qword_1ECFCE720);
        swift_bridgeObjectRetain();
        sub_1CAF20364();
        (*(void (**)(uint64_t, uint64_t, uint64_t))(v20 + 16))(v18, v21, v19);
        v22 = swift_allocObject();
        *(_QWORD *)(v22 + 16) = sub_1CAF16BB4;
        *(_QWORD *)(v22 + 24) = v1;
        v23 = swift_allocObject();
        *(_QWORD *)(v23 + 16) = sub_1CAF036EC;
        *(_QWORD *)(v23 + 24) = v5;
        type metadata accessor for XPCActivity();
        swift_allocObject();
        swift_retain();
        swift_retain();
        v24 = sub_1CAEE5E64(v37, v40, v35, v18, (uint64_t)sub_1CAF16BDC, v22, (uint64_t)sub_1CAF16C5C, v23);
        swift_release();
        swift_release();
        swift_release();
        swift_release();
        swift_bridgeObjectRelease();
        v13 = v38;
        *(_QWORD *)(v38 + 16) = v24;
        swift_release();
        v5 = v39;
        v6 = v36;
        goto LABEL_15;
      }
LABEL_25:
      swift_once();
      goto LABEL_14;
    }
LABEL_17:
    __break(1u);
    goto LABEL_18;
  }
  __break(1u);
  return result;
}

uint64_t sub_1CAF1625C()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1CAF162D8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = a4;
  v4[2] = a1;
  v4[3] = a2;
  return swift_task_switch();
}

uint64_t sub_1CAF162F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  v3 = swift_task_alloc();
  *(_QWORD *)(v0 + 48) = v3;
  *(_OWORD *)(v3 + 16) = *(_OWORD *)(v0 + 32);
  *(_QWORD *)(v3 + 32) = v2;
  *(_QWORD *)(v3 + 40) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 56) = v4;
  *v4 = v0;
  v4[1] = sub_1CAF1639C;
  return sub_1CAF20988();
}

uint64_t sub_1CAF1639C()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1CAF163F8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF16404(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
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
  uint64_t v36;
  uint64_t v37;
  _QWORD aBlock[6];

  v31 = a3;
  v32 = a5;
  v29 = a2;
  v30 = a4;
  v27 = a1;
  v33 = sub_1CAF2034C();
  v36 = *(_QWORD *)(v33 - 8);
  MEMORY[0x1E0C80A78](v33);
  v6 = (char *)&v26 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CAF2037C();
  v34 = *(_QWORD *)(v7 - 8);
  v35 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE708);
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(_QWORD *)(v11 + 64);
  MEMORY[0x1E0C80A78](v10);
  v13 = sub_1CAF20358();
  v14 = *(_QWORD *)(v13 - 8);
  MEMORY[0x1E0C80A78](v13);
  v16 = (char *)&v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAEE72C4();
  (*(void (**)(char *, _QWORD, uint64_t))(v14 + 104))(v16, *MEMORY[0x1E0DEF540], v13);
  v28 = sub_1CAF2070C();
  (*(void (**)(char *, uint64_t))(v14 + 8))(v16, v13);
  (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))((char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v27, v10);
  v17 = (*(unsigned __int8 *)(v11 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v11 + 80);
  v18 = (char *)swift_allocObject();
  v19 = v29;
  v21 = v31;
  v20 = v32;
  *((_QWORD *)v18 + 2) = v30;
  *((_QWORD *)v18 + 3) = v20;
  *((_QWORD *)v18 + 4) = v19;
  *((_QWORD *)v18 + 5) = v21;
  (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v18[v17], (char *)&v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0), v10);
  aBlock[4] = sub_1CAF16DF4;
  aBlock[5] = v18;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CAEDA7AC;
  aBlock[3] = &block_descriptor_24_0;
  v22 = _Block_copy(aBlock);
  swift_retain();
  swift_unknownObjectRetain();
  sub_1CAF20370();
  v37 = MEMORY[0x1E0DEE9D8];
  sub_1CAF16E44();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7B0);
  sub_1CAF16E8C();
  v23 = v33;
  sub_1CAF207B4();
  v24 = (void *)v28;
  MEMORY[0x1D1799978](0, v9, v6, v22);
  _Block_release(v22);

  (*(void (**)(char *, uint64_t))(v36 + 8))(v6, v23);
  (*(void (**)(char *, uint64_t))(v34 + 8))(v9, v35);
  return swift_release();
}

uint64_t sub_1CAF166D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];

  (*(void (**)(uint64_t *__return_ptr, uint64_t, uint64_t))(a5 + 24))(v12, a4, a5);
  if (qword_1ECFCE740 != -1)
    swift_once();
  v6 = sub_1CAF202E0();
  __swift_project_value_buffer(v6, (uint64_t)qword_1ECFCE720);
  v7 = sub_1CAF202C8();
  v8 = sub_1CAF206A0();
  if (os_log_type_enabled(v7, v8))
  {
    v9 = swift_slowAlloc();
    v10 = swift_slowAlloc();
    v12[0] = v10;
    *(_DWORD *)v9 = 136315394;
    sub_1CAEDBE5C(0x656C756465686373, 0xEA00000000002928, v12);
    sub_1CAF2076C();
    *(_WORD *)(v9 + 12) = 2048;
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v7, v8, "FAFamilyFetchActivityScheduler %s updating criteria interval: %lld", (uint8_t *)v9, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v10, -1, -1);
    MEMORY[0x1D179A698](v9, -1, -1);
  }

  if (a2)
    XPCActivity.updateCriteria()();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE708);
  return sub_1CAF20604();
}

uint64_t sub_1CAF168AC(uint64_t a1, uint64_t a2, unsigned __int8 *a3, uint64_t (*a4)(uint64_t))
{
  int v6;
  uint64_t result;

  v6 = *a3;
  result = MEMORY[0x1D17994A4]();
  switch(v6)
  {
    case 4:
      return XPCActivity.continue()();
    case 3:
      return XPCActivity.defer()();
    case 2:
      return a4(a1);
  }
  return result;
}

void sub_1CAF16928()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[6];

  v1 = *(_QWORD *)(v0 + 16);
  if (v1)
  {
    v2 = *(NSObject **)(v1 + 16);
    v3 = swift_allocObject();
    *(_QWORD *)(v3 + 16) = sub_1CAEE61D0;
    *(_QWORD *)(v3 + 24) = v1;
    v5[4] = sub_1CAF16C74;
    v5[5] = v3;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 1107296256;
    v5[2] = sub_1CAEE163C;
    v5[3] = &block_descriptor_8;
    v4 = _Block_copy(v5);
    swift_retain_n();
    swift_retain();
    swift_release();
    dispatch_sync(v2, v4);
    _Block_release(v4);
    LOBYTE(v2) = swift_isEscapingClosureAtFileLocation();
    swift_release_n();
    swift_release();
    if ((v2 & 1) != 0)
      __break(1u);
  }
}

uint64_t XPCActivityScheduler.deinit()
{
  uint64_t v0;

  swift_release();
  swift_unknownObjectRelease();
  return v0;
}

uint64_t XPCActivityScheduler.__deallocating_deinit()
{
  swift_release();
  swift_unknownObjectRelease();
  return swift_deallocClassInstance();
}

uint64_t sub_1CAF16A90()
{
  sub_1CAF16B18();
  return swift_unknownObjectRetain();
}

uint64_t sub_1CAF16AB0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1CAEDCC10;
  return sub_1CAF15E04();
}

void sub_1CAF16AF8()
{
  sub_1CAF16928();
}

uint64_t sub_1CAF16B18()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 24);
}

uint64_t sub_1CAF16B20()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = swift_task_alloc();
  v5 = *(_OWORD *)(v0 + 16);
  *(_QWORD *)(v1 + 16) = v4;
  *(_QWORD *)v4 = v1;
  *(_QWORD *)(v4 + 8) = sub_1CAEDCEDC;
  *(_OWORD *)(v4 + 32) = v5;
  *(_QWORD *)(v4 + 16) = v2;
  *(_QWORD *)(v4 + 24) = v3;
  return swift_task_switch();
}

uint64_t sub_1CAF16B90()
{
  swift_unknownObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CAF16BB4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(*(_QWORD *)(v0 + 24) + 24))(*(_QWORD *)(v0 + 16));
}

double sub_1CAF16BDC@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  double result;
  uint64_t v5;
  __int128 v6;
  __int128 v7;

  (*(void (**)(uint64_t *__return_ptr))(v1 + 16))(&v5);
  v3 = 256;
  if (!BYTE1(v5))
    v3 = 0;
  *(_QWORD *)a1 = v3 | v5;
  *(_OWORD *)(a1 + 8) = v6;
  result = *(double *)&v7;
  *(_OWORD *)(a1 + 24) = v7;
  return result;
}

uint64_t sub_1CAF16C38()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF16C5C(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;

  return sub_1CAF168AC(a1, a2, a3, *(uint64_t (**)(uint64_t))(v3 + 16));
}

uint64_t sub_1CAF16C64()
{
  return swift_deallocObject();
}

uint64_t sub_1CAF16C74()
{
  uint64_t v0;

  return sub_1CAEDBDCC(*(uint64_t (**)(void))(v0 + 16));
}

uint64_t block_copy_helper_7(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper_7()
{
  return swift_release();
}

uint64_t sub_1CAF16C94(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a2 + 88);
}

uint64_t sub_1CAF16C9C()
{
  return swift_initClassMetadata2();
}

uint64_t type metadata accessor for XPCActivityScheduler(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for XPCActivityScheduler);
}

uint64_t method lookup function for XPCActivityScheduler()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of XPCActivityScheduler.__allocating_init(taskProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 136))();
}

uint64_t dispatch thunk of XPCActivityScheduler.schedule()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(*(_QWORD *)v0 + 144) + *(_QWORD *)(*(_QWORD *)v0 + 144));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1CAEDCC10;
  return v4();
}

uint64_t dispatch thunk of XPCActivityScheduler.unregister()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 160))();
}

uint64_t sub_1CAF16D68(uint64_t a1)
{
  uint64_t *v1;

  return sub_1CAF16404(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1CAF16D74()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE708);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 48) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CAF16DF4()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = v0[2];
  v2 = v0[3];
  v3 = *(unsigned __int8 *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE708) - 8) + 80);
  return sub_1CAF166D0(v0[4], v0[5], (uint64_t)v0 + ((v3 + 48) & ~v3), v1, v2);
}

unint64_t sub_1CAF16E44()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECFCE7A8;
  if (!qword_1ECFCE7A8)
  {
    v1 = sub_1CAF2034C();
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1ECFCE7A8);
  }
  return result;
}

unint64_t sub_1CAF16E8C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ECFCE7B8;
  if (!qword_1ECFCE7B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1ECFCE7B0);
    result = MEMORY[0x1D179A5CC](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1ECFCE7B8);
  }
  return result;
}

void sub_1CAF16EE8(char a1)
{
  __asm { BR              X9 }
}

uint64_t sub_1CAF16F18(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1CAF16F8C + 4 * byte_1CAF26B34[a2]))(0x636566316C68636DLL);
}

uint64_t sub_1CAF16F8C(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x636566316C68636DLL && v1 == 0xEC00000030313834)
    v2 = 1;
  else
    v2 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1CAF17040(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1CAF17090(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1CAF171B4 + 4 * byte_1CAF26B42[a2]))(0x656C746974627573);
}

uint64_t sub_1CAF171B4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x656C746974627573 && v1 == 0xEB0000000079654BLL)
    v2 = 1;
  else
    v2 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1CAF1730C(char a1)
{
  __asm { BR              X12 }
}

uint64_t sub_1CAF17358(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1CAF173D4 + 4 * byte_1CAF26B51[a2]))(0xD000000000000010);
}

uint64_t sub_1CAF173D4(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0xD000000000000010 && v1 == 0x80000001CAF29F90)
    v2 = 1;
  else
    v2 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

void sub_1CAF1748C(char a1)
{
  __asm { BR              X10 }
}

uint64_t sub_1CAF174DC(uint64_t a1, unsigned __int8 a2)
{
  return ((uint64_t (*)(uint64_t))((char *)sub_1CAF17554 + 4 * byte_1CAF26B5A[a2]))(0x6341796C696D6166);
}

uint64_t sub_1CAF17554(uint64_t a1)
{
  uint64_t v1;
  char v2;

  if (a1 == 0x6341796C696D6166 && v1 == 0xEC0000006E6F6974)
    v2 = 1;
  else
    v2 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v2 & 1;
}

uint64_t sub_1CAF17610(char a1, char a2)
{
  BOOL v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  char v7;

  v2 = (a1 & 1) == 0;
  if ((a1 & 1) != 0)
    v3 = 0x616E65746E69616DLL;
  else
    v3 = 0x7974696C697475;
  if (v2)
    v4 = 0xE700000000000000;
  else
    v4 = 0xEB0000000065636ELL;
  if ((a2 & 1) != 0)
    v5 = 0x616E65746E69616DLL;
  else
    v5 = 0x7974696C697475;
  if ((a2 & 1) != 0)
    v6 = 0xEB0000000065636ELL;
  else
    v6 = 0xE700000000000000;
  if (v3 == v5 && v4 == v6)
    v7 = 1;
  else
    v7 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

uint64_t sub_1CAF176BC(uint64_t a1, uint64_t a2)
{
  return sub_1CAF176D4(a1, a2, FamilyError.rawValue.getter);
}

uint64_t sub_1CAF176C8(uint64_t a1, uint64_t a2)
{
  return sub_1CAF176D4(a1, a2, FamilyFeatureFlags.rawValue.getter);
}

uint64_t sub_1CAF176D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(void))
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v9;

  v4 = a3();
  v6 = v5;
  if (v4 == a3() && v6 == v7)
    v9 = 1;
  else
    v9 = sub_1CAF209A0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v9 & 1;
}

void sub_1CAF1776C(char a1)
{
  sub_1CAF20A18();
  __asm { BR              X10 }
}

uint64_t sub_1CAF177C8()
{
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

void sub_1CAF17850(uint64_t a1, char a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1CAF17890()
{
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

void sub_1CAF179AC(uint64_t a1, char a2)
{
  __asm { BR              X11 }
}

uint64_t sub_1CAF179F4()
{
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

void sub_1CAF17A64(uint64_t a1, char a2)
{
  sub_1CAF20A18();
  __asm { BR              X10 }
}

uint64_t sub_1CAF17ABC()
{
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

uint64_t sub_1CAF17B44(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v8;
  _OWORD v9[2];

  if (*(_QWORD *)(a1 + 24))
  {
    sub_1CAEEBF2C((_OWORD *)a1, v9);
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v8 = *v3;
    *v3 = 0x8000000000000000;
    sub_1CAF195B8(v9, a2, a3, isUniquelyReferenced_nonNull_native);
    *v3 = v8;
    swift_bridgeObjectRelease();
    return swift_bridgeObjectRelease();
  }
  else
  {
    sub_1CAF0B888(a1);
    sub_1CAF14698(a2, a3, v9);
    swift_bridgeObjectRelease();
    return sub_1CAF0B888((uint64_t)v9);
  }
}

FamilyCircle::URLParameter_optional __swiftcall URLParameter.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FamilyCircle::URLParameter_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CAF20910();
  result.value = swift_bridgeObjectRelease();
  v5 = 4;
  if (v3 < 4)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t URLParameter.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(uint64_t, unint64_t))((char *)sub_1CAF17C88 + 4 * byte_1CAF26B77[*v0]))(0x6E6F697463616161, 0xE800000000000000);
}

uint64_t sub_1CAF17C88()
{
  return 0x6341796C696D6166;
}

uint64_t sub_1CAF17CA8()
{
  return 0x746544746E657665;
}

uint64_t sub_1CAF17CC8()
{
  return 0x707954746E657665;
}

void sub_1CAF17CE4(char *a1)
{
  sub_1CAF1748C(*a1);
}

void sub_1CAF17CF0()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CAF20A18();
  __asm { BR              X9 }
}

uint64_t sub_1CAF17D3C()
{
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

void sub_1CAF17DC0()
{
  __asm { BR              X10 }
}

uint64_t sub_1CAF17DFC()
{
  sub_1CAF20490();
  return swift_bridgeObjectRelease();
}

void sub_1CAF17E6C()
{
  unsigned __int8 *v0;
  uint64_t v1;

  v1 = *v0;
  sub_1CAF20A18();
  __asm { BR              X9 }
}

uint64_t sub_1CAF17EB4()
{
  sub_1CAF20490();
  swift_bridgeObjectRelease();
  return sub_1CAF20A30();
}

FamilyCircle::URLParameter_optional sub_1CAF17F38(Swift::String *a1)
{
  return URLParameter.init(rawValue:)(*a1);
}

uint64_t sub_1CAF17F44()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(void))((char *)sub_1CAF17F74 + 4 * byte_1CAF26B87[*v0]))();
}

void sub_1CAF17F74(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "familyAction");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_1CAF17F98(uint64_t a1@<X8>)
{
  strcpy((char *)a1, "eventDetails");
  *(_BYTE *)(a1 + 13) = 0;
  *(_WORD *)(a1 + 14) = -5120;
}

void sub_1CAF17FBC(_QWORD *a1@<X8>)
{
  *a1 = 0x707954746E657665;
  a1[1] = 0xE900000000000065;
}

FamilyCircle::AppleAccountAction_optional __swiftcall AppleAccountAction.init(rawValue:)(Swift::String rawValue)
{
  char *v1;
  char *v2;
  unint64_t v3;
  FamilyCircle::AppleAccountAction_optional result;
  char v5;

  v2 = v1;
  v3 = sub_1CAF20910();
  result.value = swift_bridgeObjectRelease();
  v5 = 5;
  if (v3 < 5)
    v5 = v3;
  *v2 = v5;
  return result;
}

uint64_t AppleAccountAction.rawValue.getter()
{
  unsigned __int8 *v0;

  return ((uint64_t (*)(unint64_t, unint64_t))((char *)sub_1CAF1806C + 4 * byte_1CAF26B8B[*v0]))(0xD000000000000011, 0x80000001CAF29F70);
}

unint64_t sub_1CAF1806C()
{
  return 0xD000000000000010;
}

uint64_t sub_1CAF18088@<X0>(uint64_t a1@<X8>)
{
  return a1 + 8;
}

uint64_t sub_1CAF180B0()
{
  return 0x68736572666572;
}

void sub_1CAF180C8(char *a1)
{
  sub_1CAF1730C(*a1);
}

void sub_1CAF180D4()
{
  char *v0;

  sub_1CAF1776C(*v0);
}

void sub_1CAF180DC(uint64_t a1)
{
  char *v1;

  sub_1CAF179AC(a1, *v1);
}

void sub_1CAF180E4(uint64_t a1)
{
  char *v1;

  sub_1CAF17A64(a1, *v1);
}

FamilyCircle::AppleAccountAction_optional sub_1CAF180EC(Swift::String *a1)
{
  return AppleAccountAction.init(rawValue:)(*a1);
}

uint64_t sub_1CAF180F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = AppleAccountAction.rawValue.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t FamilyAction.init(rawValue:)@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1CAF20910();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

unint64_t FamilyAction.rawValue.getter()
{
  return 0xD000000000000016;
}

uint64_t sub_1CAF1818C()
{
  sub_1CAF20A18();
  sub_1CAF20490();
  return sub_1CAF20A30();
}

uint64_t sub_1CAF181E0()
{
  return sub_1CAF20490();
}

uint64_t sub_1CAF181FC()
{
  sub_1CAF20A18();
  sub_1CAF20490();
  return sub_1CAF20A30();
}

uint64_t sub_1CAF1824C@<X0>(BOOL *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_1CAF20910();
  result = swift_bridgeObjectRelease();
  *a1 = v2 != 0;
  return result;
}

void sub_1CAF1829C(_QWORD *a1@<X8>)
{
  *a1 = 0xD000000000000016;
  a1[1] = 0x80000001CAF29FF0;
}

void sub_1CAF182BC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1CAF20754();
  MEMORY[0x1E0C80A78](v2);
  __asm { BR              X11 }
}

uint64_t sub_1CAF1835C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  strcpy((char *)(v7 - 96), "familyAction");
  *(_BYTE *)(v7 - 83) = 0;
  *(_WORD *)(v7 - 82) = -5120;
  MEMORY[0x1D1799624](v7 - 96, v5, MEMORY[0x1E0DEA968], v2, MEMORY[0x1E0DEA978]);
  swift_bridgeObjectRelease();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 48))(v4, 1, v2) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v3);
  }
  else if ((swift_dynamicCast() & 1) != 0)
  {
    v8 = *(_QWORD *)(v7 - 88);
    *(_QWORD *)(v7 - 96) = *(_QWORD *)(v7 - 96);
    *(_QWORD *)(v7 - 88) = v8;
    return sub_1CAF20544();
  }
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 56))(v0, 1, 1, v1);
}

void Dictionary<>.subscript.getter(char *a1)
{
  sub_1CAF189C8(a1);
}

{
  char v1;

  v1 = *a1;
  sub_1CAF182BC((uint64_t)&v1);
}

{
  sub_1CAF189C8(a1);
}

{
  char v1;

  v1 = *a1;
  sub_1CAF182BC((uint64_t)&v1);
}

uint64_t Dictionary<>.subscript.setter(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1CAF18A0C(a1, a2, a3, a4, a5, &qword_1EF991618);
}

{
  return sub_1CAF18A0C(a1, a2, a3, a4, a5, &qword_1EF991820);
}

void (*Dictionary<>.subscript.modify(_QWORD *a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t a1, char a2)
{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  char v15;
  char v17;

  v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[2] = a5;
  v11[3] = v5;
  *v11 = a3;
  v11[1] = a4;
  v12 = sub_1CAF20754();
  v11[4] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v11[5] = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v11[6] = malloc(v14);
  v11[7] = malloc(v14);
  v15 = *a2;
  *((_BYTE *)v11 + 64) = *a2;
  v17 = v15;
  sub_1CAF182BC((uint64_t)&v17);
  return sub_1CAF18584;
}

{
  uint64_t v5;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  size_t v14;
  char v15;
  char v17;

  v11 = malloc(0x48uLL);
  *a1 = v11;
  v11[2] = a5;
  v11[3] = v5;
  *v11 = a3;
  v11[1] = a4;
  v12 = sub_1CAF20754();
  v11[4] = v12;
  v13 = *(_QWORD *)(v12 - 8);
  v11[5] = v13;
  v14 = *(_QWORD *)(v13 + 64);
  v11[6] = malloc(v14);
  v11[7] = malloc(v14);
  v15 = *a2;
  *((_BYTE *)v11 + 64) = *a2;
  v17 = v15;
  sub_1CAF182BC((uint64_t)&v17);
  return sub_1CAF18B30;
}

void sub_1CAF18584(uint64_t a1, char a2)
{
  sub_1CAF18B3C(a1, a2, &qword_1EF991618);
}

uint64_t Dictionary<>.subscript.setter(uint64_t a1, char *a2, uint64_t a3, uint64_t a4)
{
  return sub_1CAF18C94(a1, a2, a3, a4, &qword_1EF991618);
}

{
  return sub_1CAF18C94(a1, a2, a3, a4, &qword_1EF991820);
}

void (*Dictionary<>.subscript.modify(_QWORD *a1, char *a2, uint64_t a3, uint64_t a4))(uint64_t a1, char a2)
{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char v13;
  char v15;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[1] = a4;
  v9[2] = v4;
  *v9 = a3;
  v10 = sub_1CAF20754();
  v9[3] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[4] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[5] = malloc(v12);
  v9[6] = malloc(v12);
  v13 = *a2;
  *((_BYTE *)v9 + 56) = *a2;
  v15 = v13;
  sub_1CAF182BC((uint64_t)&v15);
  return sub_1CAF186A8;
}

{
  uint64_t v4;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  size_t v12;
  char v13;
  char v15;

  v9 = malloc(0x40uLL);
  *a1 = v9;
  v9[1] = a4;
  v9[2] = v4;
  *v9 = a3;
  v10 = sub_1CAF20754();
  v9[3] = v10;
  v11 = *(_QWORD *)(v10 - 8);
  v9[4] = v11;
  v12 = *(_QWORD *)(v11 + 64);
  v9[5] = malloc(v12);
  v9[6] = malloc(v12);
  v13 = *a2;
  *((_BYTE *)v9 + 56) = *a2;
  v15 = v13;
  sub_1CAF182BC((uint64_t)&v15);
  return sub_1CAF18DAC;
}

void sub_1CAF186A8(uint64_t a1, char a2)
{
  sub_1CAF18DB8(a1, a2, &qword_1EF991618);
}

void Dictionary<>.subscript.getter(uint64_t a1)
{
  __asm { BR              X10 }
}

{
  __asm { BR              X10 }
}

uint64_t sub_1CAF186F8()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;

  if (*(_QWORD *)(v0 + 16) && (v1 = sub_1CAEDE164(0x6341796C696D6166, 0xEC0000006E6F6974), (v2 & 1) != 0))
  {
    v3 = *(_QWORD *)(*(_QWORD *)(v0 + 56) + 16 * v1);
    swift_bridgeObjectRetain();
  }
  else
  {
    v3 = 0;
  }
  swift_bridgeObjectRelease();
  return v3;
}

void Dictionary<>.subscript.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __asm { BR              X10 }
}

uint64_t sub_1CAF18804()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;

  if (v1)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v5 = *v0;
    *v0 = 0x8000000000000000;
    sub_1CAF19478(v2, v1, 0x6341796C696D6166, 0xEC0000006E6F6974, isUniquelyReferenced_nonNull_native);
    *v0 = v5;
  }
  else
  {
    sub_1CAF145B4(0x6341796C696D6166, 0xEC0000006E6F6974);
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

void (*Dictionary<>.subscript.modify(uint64_t a1, char *a2))(uint64_t a1, char a2)
{
  uint64_t v2;
  char v4;
  uint64_t v5;
  uint64_t v6;

  *(_QWORD *)(a1 + 16) = v2;
  v4 = *a2;
  *(_BYTE *)(a1 + 25) = *a2;
  *(_BYTE *)(a1 + 24) = v4;
  Dictionary<>.subscript.getter((uint64_t)a2);
  *(_QWORD *)a1 = v5;
  *(_QWORD *)(a1 + 8) = v6;
  return sub_1CAF18938;
}

void sub_1CAF18938(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a1;
  v2 = *(_QWORD *)(a1 + 8);
  if ((a2 & 1) != 0)
  {
    v4 = *(_BYTE *)(a1 + 25);
    swift_bridgeObjectRetain();
    Dictionary<>.subscript.setter(v3, v2, (uint64_t)&v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    Dictionary<>.subscript.setter(*(_QWORD *)a1, v2, a1 + 24);
  }
}

void sub_1CAF189C8(char *a1)
{
  char v1;

  v1 = *a1;
  sub_1CAF182BC((uint64_t)&v1);
}

uint64_t sub_1CAF18A0C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  uint64_t v7;

  sub_1CAF1990C(a1, a2, a3, a4, a5, a6);
  v7 = sub_1CAF20754();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(a1, v7);
}

void sub_1CAF18B30(uint64_t a1, char a2)
{
  sub_1CAF18B3C(a1, a2, &qword_1EF991820);
}

void sub_1CAF18B3C(uint64_t a1, char a2, uint64_t *a3)
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);
  char v11;
  char v12;

  v4 = *(void **)a1;
  v5 = *(_BYTE *)(*(_QWORD *)a1 + 64);
  v6 = *(void **)(*(_QWORD *)a1 + 48);
  v7 = *(void **)(*(_QWORD *)a1 + 56);
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  v9 = *(_QWORD *)(*(_QWORD *)a1 + 40);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v6, v7, v8);
    v11 = v5;
    __swift_instantiateConcreteTypeFromMangledName(a3);
    sub_1CAF196E8((uint64_t)v6, (uint64_t)&v11);
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v6, v8);
  }
  else
  {
    v12 = *(_BYTE *)(*(_QWORD *)a1 + 64);
    __swift_instantiateConcreteTypeFromMangledName(a3);
    sub_1CAF196E8((uint64_t)v7, (uint64_t)&v12);
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
  }
  v10(v7, v8);
  free(v7);
  free(v6);
  free(v4);
}

uint64_t sub_1CAF18C94(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v6;

  sub_1CAF19978(a1, a2, a3, a4, a5);
  v6 = sub_1CAF20754();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
}

void sub_1CAF18DAC(uint64_t a1, char a2)
{
  sub_1CAF18DB8(a1, a2, &qword_1EF991820);
}

void sub_1CAF18DB8(uint64_t a1, char a2, uint64_t *a3)
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void *, uint64_t);
  char v11;
  char v12;

  v4 = *(void **)a1;
  v5 = *(_BYTE *)(*(_QWORD *)a1 + 56);
  v6 = *(void **)(*(_QWORD *)a1 + 40);
  v7 = *(void **)(*(_QWORD *)a1 + 48);
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v9 = *(_QWORD *)(*(_QWORD *)a1 + 32);
  if ((a2 & 1) != 0)
  {
    (*(void (**)(_QWORD, void *, uint64_t))(v9 + 16))(*(_QWORD *)(*(_QWORD *)a1 + 40), v7, v8);
    v11 = v5;
    __swift_instantiateConcreteTypeFromMangledName(a3);
    sub_1CAF196E8((uint64_t)v6, (uint64_t)&v11);
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
    v10(v6, v8);
  }
  else
  {
    v12 = *(_BYTE *)(*(_QWORD *)a1 + 56);
    __swift_instantiateConcreteTypeFromMangledName(a3);
    sub_1CAF196E8((uint64_t)v7, (uint64_t)&v12);
    v10 = *(void (**)(void *, uint64_t))(v9 + 8);
  }
  v10(v7, v8);
  free(v7);
  free(v6);
  free(v4);
}

uint64_t sub_1CAF18EFC()
{
  uint64_t v0;
  _OWORD *v1;
  unint64_t v2;
  char v3;

  if (*(_QWORD *)(v0 + 16) && (v2 = sub_1CAEDE164(0x6341796C696D6166, 0xEC0000006E6F6974), (v3 & 1) != 0))
  {
    sub_1CAEDCD8C(*(_QWORD *)(v0 + 56) + 32 * v2, (uint64_t)v1);
  }
  else
  {
    *v1 = 0u;
    v1[1] = 0u;
  }
  return swift_bridgeObjectRelease();
}

void sub_1CAF18FA4(uint64_t a1, uint64_t a2, unsigned __int8 *a3)
{
  uint64_t v3;
  _BYTE v4[32];

  v3 = *a3;
  sub_1CAEF4BE8(a1, (uint64_t)v4);
  __asm { BR              X9 }
}

uint64_t sub_1CAF18FF4()
{
  _BYTE v1[32];
  _BYTE v2[80];

  sub_1CAEF4BE8((uint64_t)v2, (uint64_t)v1);
  sub_1CAF17B44((uint64_t)v1, 0x6341796C696D6166, 0xEC0000006E6F6974);
  return sub_1CAF0B888((uint64_t)v2);
}

void Dictionary<>.subscript.setter(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_1CAF190CC()
{
  uint64_t v0;
  _BYTE v2[80];

  sub_1CAEF4BE8(v0, (uint64_t)v2);
  sub_1CAF17B44((uint64_t)v2, 0x6341796C696D6166, 0xEC0000006E6F6974);
  return sub_1CAF0B888(v0);
}

void (*Dictionary<>.subscript.modify(_QWORD *a1, _BYTE *a2))(uint64_t *a1, char a2)
{
  uint64_t v2;
  _QWORD *v5;

  v5 = malloc(0x70uLL);
  *a1 = v5;
  v5[12] = v2;
  *((_BYTE *)v5 + 104) = *a2;
  Dictionary<>.subscript.getter((uint64_t)a2);
  return sub_1CAF191BC;
}

void sub_1CAF191BC(uint64_t *a1, char a2)
{
  uint64_t v2;

  v2 = *(unsigned __int8 *)(*a1 + 104);
  if ((a2 & 1) != 0)
  {
    sub_1CAEF4BE8(*a1, *a1 + 32);
    __asm { BR              X9 }
  }
  __asm { BR              X9 }
}

void sub_1CAF19258()
{
  uint64_t v0;
  uint64_t v1;

  sub_1CAEF4BE8(v0, v1);
  sub_1CAF17B44(v1, 0x6341796C696D6166, 0xEC0000006E6F6974);
  JUMPOUT(0x1CAF19334);
}

void sub_1CAF19278()
{
  uint64_t v0;
  uint64_t v1;

  sub_1CAEF4BE8(v0, v1);
  sub_1CAF17B44(v1, 0x746544746E657665, 0xEC000000736C6961);
  sub_1CAF0B888(v0);
  JUMPOUT(0x1CAF19334);
}

void sub_1CAF19298()
{
  JUMPOUT(0x1CAF192B0);
}

void sub_1CAF192DC()
{
  uint64_t v0;
  uint64_t v1;

  sub_1CAEF4BE8(v0, v1);
  sub_1CAF17B44(v1, 0x746544746E657665, 0xEC000000736C6961);
  JUMPOUT(0x1CAF19334);
}

void sub_1CAF192FC()
{
  JUMPOUT(0x1CAF19314);
}

uint64_t sub_1CAF19354(char a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t result;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  char v19;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1CAEDE164(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  result = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= result && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        *(_BYTE *)(v18[7] + v12) = a1 & 1;
        return result;
      }
      goto LABEL_11;
    }
    if (v17 >= result && (a4 & 1) == 0)
    {
      result = (uint64_t)sub_1CAEEA930();
      goto LABEL_7;
    }
    sub_1CAEE9F28(result, a4 & 1);
    result = sub_1CAEDE164(a2, a3);
    if ((v16 & 1) == (v19 & 1))
    {
      v12 = result;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CAEEA830(v12, a2, a3, a1 & 1, v18);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1CAF209B8();
  __break(1u);
  return result;
}

uint64_t sub_1CAF19478(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, char a5)
{
  _QWORD *v5;
  _QWORD **v6;
  _QWORD *v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  _BOOL8 v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t result;
  unint64_t v23;
  char v24;

  v6 = (_QWORD **)v5;
  v12 = (_QWORD *)*v5;
  v14 = sub_1CAEDE164(a3, a4);
  v15 = v12[2];
  v16 = (v13 & 1) == 0;
  v17 = v15 + v16;
  if (__OFADD__(v15, v16))
  {
    __break(1u);
  }
  else
  {
    v18 = v13;
    v19 = v12[3];
    if (v19 >= v17 && (a5 & 1) != 0)
    {
LABEL_7:
      v20 = *v6;
      if ((v18 & 1) != 0)
      {
LABEL_8:
        v21 = (uint64_t *)(v20[7] + 16 * v14);
        result = swift_bridgeObjectRelease();
        *v21 = a1;
        v21[1] = a2;
        return result;
      }
      goto LABEL_11;
    }
    if (v19 >= v17 && (a5 & 1) == 0)
    {
      sub_1CAEEACA4();
      goto LABEL_7;
    }
    sub_1CAEEA210(v17, a5 & 1);
    v23 = sub_1CAEDE164(a3, a4);
    if ((v18 & 1) == (v24 & 1))
    {
      v14 = v23;
      v20 = *v6;
      if ((v18 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CAEEA878(v14, a3, a4, a1, a2, v20);
      return swift_bridgeObjectRetain();
    }
  }
  result = sub_1CAF209B8();
  __break(1u);
  return result;
}

_OWORD *sub_1CAF195B8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_1CAEDE164(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        return sub_1CAEEBF2C(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_1CAEEAE5C();
      goto LABEL_7;
    }
    sub_1CAEEA534(v15, a4 & 1);
    v21 = sub_1CAEDE164(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_1CAEEA8C8(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_1CAF209B8();
  __break(1u);
  return result;
}

void sub_1CAF196E8(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = sub_1CAF20754();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1CAF20754();
  MEMORY[0x1E0C80A78](v4);
  __asm { BR              X10 }
}

uint64_t sub_1CAF197BC()
{
  uint64_t v0;
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
  int v11;

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v0 + 16))(v5, v4, v6);
  v8 = *(_QWORD *)(v3 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v8 + 48))(v5, 1, v3) == 1)
  {
    (*(void (**)(uint64_t, uint64_t))(v0 + 8))(v5, v6);
    v9 = 0;
    v10 = 0;
  }
  else
  {
    sub_1CAF20538();
    v9 = *(_QWORD *)(v7 - 96);
    v10 = *(_QWORD *)(v7 - 88);
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v3);
  }
  *(_QWORD *)(v7 - 96) = v9;
  *(_QWORD *)(v7 - 88) = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991828);
  v11 = swift_dynamicCast();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 56))(v2, v11 ^ 1u, 1, v1);
  strcpy((char *)(v7 - 112), "familyAction");
  *(_BYTE *)(v7 - 99) = 0;
  *(_WORD *)(v7 - 98) = -5120;
  return sub_1CAF203AC();
}

void sub_1CAF1990C(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t *a6)
{
  char v7;

  v7 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(a6);
  sub_1CAF196E8(a1, (uint64_t)&v7);
}

void sub_1CAF19978(uint64_t a1, char *a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  char v6;

  v6 = *a2;
  __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_1CAF196E8(a1, (uint64_t)&v6);
}

unint64_t sub_1CAF199DC()
{
  unint64_t result;

  result = qword_1EF9917F8;
  if (!qword_1EF9917F8)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for URLParameter, &type metadata for URLParameter);
    atomic_store(result, (unint64_t *)&qword_1EF9917F8);
  }
  return result;
}

unint64_t sub_1CAF19A24()
{
  unint64_t result;

  result = qword_1EF991800;
  if (!qword_1EF991800)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AppleAccountAction, &type metadata for AppleAccountAction);
    atomic_store(result, (unint64_t *)&qword_1EF991800);
  }
  return result;
}

unint64_t sub_1CAF19A68(uint64_t a1)
{
  unint64_t result;

  result = sub_1CAF19A8C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CAF19A8C()
{
  unint64_t result;

  result = qword_1EF991808;
  if (!qword_1EF991808)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for AppleAccountAction, &type metadata for AppleAccountAction);
    atomic_store(result, (unint64_t *)&qword_1EF991808);
  }
  return result;
}

unint64_t sub_1CAF19AD4()
{
  unint64_t result;

  result = qword_1EF991810;
  if (!qword_1EF991810)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for FamilyAction, &type metadata for FamilyAction);
    atomic_store(result, (unint64_t *)&qword_1EF991810);
  }
  return result;
}

unint64_t sub_1CAF19B18(uint64_t a1)
{
  unint64_t result;

  result = sub_1CAF19B3C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CAF19B3C()
{
  unint64_t result;

  result = qword_1EF991818;
  if (!qword_1EF991818)
  {
    result = MEMORY[0x1D179A5CC](&protocol conformance descriptor for FamilyAction, &type metadata for FamilyAction);
    atomic_store(result, (unint64_t *)&qword_1EF991818);
  }
  return result;
}

uint64_t sub_1CAF19B80(uint64_t *a1, char *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))Dictionary<>.subscript.getter);
}

void sub_1CAF19B8C(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &qword_1EF991618);
}

uint64_t sub_1CAF19B98()
{
  return 16;
}

__n128 sub_1CAF19BA4(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void sub_1CAF19BB0(char *a1@<X1>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v5 = *a1;
  Dictionary<>.subscript.getter((uint64_t)&v5);
  *a2 = v3;
  a2[1] = v4;
}

void sub_1CAF19BF0(uint64_t *a1, uint64_t a2, char *a3)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a1;
  v4 = a1[1];
  v5 = *a3;
  swift_bridgeObjectRetain();
  Dictionary<>.subscript.setter(v3, v4, (uint64_t)&v5);
}

uint64_t sub_1CAF19C40()
{
  return 0;
}

uint64_t sub_1CAF19C50(uint64_t *a1, char *a2, uint64_t a3)
{
  return keypath_getTm(a1, a2, a3, (uint64_t (*)(char *, uint64_t, uint64_t, uint64_t))Dictionary<>.subscript.getter);
}

uint64_t keypath_getTm(uint64_t *a1, char *a2, uint64_t a3, uint64_t (*a4)(char *, uint64_t, uint64_t, uint64_t))
{
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v10;

  v5 = &a2[a3];
  v6 = *(_QWORD *)&a2[a3 - 16];
  v7 = *((_QWORD *)v5 - 1);
  v8 = *a1;
  v10 = *a2;
  return a4(&v10, v8, v6, v7);
}

void sub_1CAF19C98(uint64_t a1, uint64_t a2, char *a3, uint64_t a4)
{
  keypath_setTm(a1, a2, a3, a4, &qword_1EF991820);
}

void keypath_setTm(uint64_t a1, uint64_t a2, char *a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  char v7;

  v6 = *(_QWORD *)&a3[a4 - 16];
  v5 = *(_QWORD *)&a3[a4 - 8];
  v7 = *a3;
  sub_1CAF19978(a1, &v7, v6, v5, a5);
}

uint64_t sub_1CAF19CE4()
{
  return 16;
}

__n128 sub_1CAF19CF0(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a1;
  *a2 = *a1;
  return result;
}

void sub_1CAF19CFC(uint64_t a1, char *a2)
{
  char v2;

  v2 = *a2;
  Dictionary<>.subscript.getter((uint64_t)&v2);
}

uint64_t sub_1CAF19D30()
{
  return 0;
}

uint64_t storeEnumTagSinglePayload for URLParameter(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 3 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 3) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFD)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFC)
    return ((uint64_t (*)(void))((char *)&loc_1CAF19D8C + 4 * byte_1CAF26BB9[v4]))();
  *a1 = a2 + 3;
  return ((uint64_t (*)(void))((char *)sub_1CAF19DC0 + 4 * byte_1CAF26BB4[v4]))();
}

uint64_t sub_1CAF19DC0(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF19DC8(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAF19DD0);
  return result;
}

uint64_t sub_1CAF19DDC(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAF19DE4);
  *(_BYTE *)result = a2 + 3;
  return result;
}

uint64_t sub_1CAF19DE8(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF19DF0(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for URLParameter()
{
  return &type metadata for URLParameter;
}

uint64_t getEnumTagSinglePayload for AppleAccountAction(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFC)
    goto LABEL_17;
  if (a2 + 4 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 4) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 4;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 4;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 4;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 5;
  v8 = v6 - 5;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for AppleAccountAction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 4 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 4) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFC)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFB)
    return ((uint64_t (*)(void))((char *)&loc_1CAF19EE8 + 4 * byte_1CAF26BC3[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_1CAF19F1C + 4 * byte_1CAF26BBE[v4]))();
}

uint64_t sub_1CAF19F1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF19F24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAF19F2CLL);
  return result;
}

uint64_t sub_1CAF19F38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAF19F40);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_1CAF19F44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF19F4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AppleAccountAction()
{
  return &type metadata for AppleAccountAction;
}

uint64_t storeEnumTagSinglePayload for FamilyAction(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_1CAF19FA8 + 4 * byte_1CAF26BC8[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1CAF19FC8 + 4 * byte_1CAF26BCD[v4]))();
}

_BYTE *sub_1CAF19FA8(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1CAF19FC8(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CAF19FD0(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CAF19FD8(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1CAF19FE0(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1CAF19FE8(_DWORD *result)
{
  *result = 0;
  return result;
}

ValueMetadata *type metadata accessor for FamilyAction()
{
  return &type metadata for FamilyAction;
}

id sub_1CAF1A004()
{
  id *v0;

  return objc_msgSend(*v0, sel_setTaskCompleted);
}

uint64_t dispatch thunk of SystemBackgroundTaskProtocol.setTaskCompleted()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 16))();
}

uint64_t sub_1CAF1A01C()
{
  return swift_initClassMetadata2();
}

uint64_t (*sub_1CAF1A068())(uint64_t a1)
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = *v0;
  v3 = v0[2];
  v2 = v0[3];
  v4 = (_QWORD *)swift_allocObject();
  v4[2] = *(_QWORD *)(v1 + 80);
  v4[3] = *(_QWORD *)(v1 + 88);
  v4[4] = v3;
  v4[5] = v2;
  swift_retain();
  return sub_1CAF1A388;
}

uint64_t sub_1CAF1A0D4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  uint64_t v19;

  v10 = *(_QWORD *)(a4 - 8);
  v11 = *(_QWORD *)(v10 + 64);
  MEMORY[0x1E0C80A78](a1);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ECFCE7A0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1CAF20658();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 1, 1, v15);
  (*(void (**)(char *, uint64_t, uint64_t))(v10 + 16))((char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a4);
  v16 = (*(unsigned __int8 *)(v10 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = 0;
  *((_QWORD *)v17 + 3) = 0;
  *((_QWORD *)v17 + 4) = a4;
  *((_QWORD *)v17 + 5) = a5;
  *((_QWORD *)v17 + 6) = a2;
  *((_QWORD *)v17 + 7) = a3;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v17[v16], (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0), a4);
  swift_retain();
  sub_1CAF037B8((uint64_t)v14, (uint64_t)&unk_1EF991838, (uint64_t)v17);
  return swift_release();
}

uint64_t sub_1CAF1A224(uint64_t a1, uint64_t a2, uint64_t a3, int *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  _QWORD *v9;
  uint64_t (*v11)(void);

  v8[3] = a7;
  v8[4] = a8;
  v8[2] = a6;
  v11 = (uint64_t (*)(void))((char *)a4 + *a4);
  v9 = (_QWORD *)swift_task_alloc();
  v8[5] = v9;
  *v9 = v8;
  v9[1] = sub_1CAF1A280;
  return v11();
}

uint64_t sub_1CAF1A280()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    return (*(uint64_t (**)(void))(v2 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1CAF1A2EC()
{
  uint64_t v0;

  (*(void (**)(_QWORD))(*(_QWORD *)(v0 + 32) + 16))(*(_QWORD *)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for FAFamilyFetchSystemBackgroundTaskProvider(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for FAFamilyFetchSystemBackgroundTaskProvider);
}

const char *sub_1CAF1A334()
{
  return "com.apple.family.cache.refresh.backgroundTask";
}

uint64_t (*sub_1CAF1A348())(uint64_t a1)
{
  sub_1CAF1A068();
  return sub_1CAF1A388;
}

uint64_t sub_1CAF1A364()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CAF1A388(uint64_t a1)
{
  uint64_t *v1;

  return sub_1CAF1A0D4(a1, v1[4], v1[5], v1[2], v1[3]);
}

uint64_t sub_1CAF1A394()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = *(_QWORD *)(v1 - 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 64) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(unint64_t, uint64_t))(v2 + 8))(v0 + v3, v1);
  return swift_deallocObject();
}

uint64_t sub_1CAF1A408()
{
  uint64_t v0;
  uint64_t v1;
  int *v2;
  uint64_t v3;
  __int128 v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(void);

  v2 = *(int **)(v0 + 48);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 32);
  v5 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(v0 + 32) - 8) + 80);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_1CAEDCC10;
  *(_OWORD *)(v3 + 24) = v4;
  *(_QWORD *)(v3 + 16) = v0 + ((v5 + 64) & ~v5);
  v8 = (uint64_t (*)(void))((char *)v2 + *v2);
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 40) = v6;
  *v6 = v3;
  v6[1] = sub_1CAF1A280;
  return v8();
}

uint64_t AIDAAccountManager.enableICloudSync(for:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[38] = a1;
  v2[39] = v1;
  v3 = sub_1CAF202E0();
  v2[40] = v3;
  v2[41] = *(_QWORD *)(v3 - 8);
  v2[42] = swift_task_alloc();
  return swift_task_switch();
}

id sub_1CAF1A510()
{
  uint64_t v0;
  void *v1;
  id v2;
  id result;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  void *v16;
  char v17;
  unint64_t v18;
  id v19;
  NSObject *v20;
  os_log_type_t v21;
  uint8_t *v22;
  void *v23;
  id v24;
  uint64_t inited;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  NSObject *v32;
  os_log_type_t v33;
  uint8_t *v34;
  uint64_t v35;
  _BYTE *v36;
  NSObject *v37;
  os_log_type_t v38;
  uint8_t *v39;
  uint64_t v40;
  void *v41;
  _BYTE *v42;
  uint64_t v43;
  void *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  NSObject *v50;
  os_log_type_t v51;
  uint8_t *v52;
  uint64_t v53;
  id v54;
  uint64_t v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58[3];

  v1 = *(void **)(v0 + 312);
  v2 = (id)*MEMORY[0x1E0CFCF18];
  result = objc_msgSend(v1, sel_accounts);
  if (result)
  {
    v4 = result;
    type metadata accessor for AIDAServiceType(0);
    sub_1CAEEBF3C(0, &qword_1EF9914D8);
    sub_1CAEDA0CC(&qword_1EF990F60, (uint64_t (*)(uint64_t))type metadata accessor for AIDAServiceType, (uint64_t)&unk_1CAF2465C);
    v5 = sub_1CAF20394();

    if (!*(_QWORD *)(v5 + 16) || (v6 = sub_1CAEDE938((uint64_t)v2), (v7 & 1) == 0))
    {
      swift_bridgeObjectRelease();

      if (qword_1ECFCE888 != -1)
        swift_once();
      __swift_project_value_buffer(*(_QWORD *)(v0 + 320), (uint64_t)qword_1ECFCE8A8);
      v32 = sub_1CAF202C8();
      v33 = sub_1CAF206B8();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = (uint8_t *)swift_slowAlloc();
        v35 = swift_slowAlloc();
        v58[0] = v35;
        *(_DWORD *)v34 = 136315138;
        *(_QWORD *)(v0 + 288) = sub_1CAEDBE5C(0xD000000000000016, 0x80000001CAF2C010, v58);
        sub_1CAF2076C();
        _os_log_impl(&dword_1CAEBA000, v32, v33, "%s unable to get iCloud account", v34, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v35, -1, -1);
        MEMORY[0x1D179A698](v34, -1, -1);
      }

      sub_1CAF1B3F8();
      swift_allocError();
      *v36 = 0;
      swift_willThrow();
      goto LABEL_22;
    }
    v9 = *(_QWORD *)(v0 + 304);
    v8 = *(void **)(v0 + 312);
    v10 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v6);
    *(_QWORD *)(v0 + 344) = v10;
    v11 = v10;
    swift_bridgeObjectRelease();

    objc_msgSend(v11, sel_setEnabled_forDataclass_, 1, v9);
    v12 = objc_msgSend(v8, sel_accountStore);
    v13 = objc_msgSend(v12, sel_dataclassActionsForAccountSave_, v11);

    if (v13)
    {
      type metadata accessor for Dataclass(0);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991850);
      sub_1CAEDA0CC(&qword_1EF990F50, (uint64_t (*)(uint64_t))type metadata accessor for Dataclass, (uint64_t)&unk_1CAF2461C);
      v14 = sub_1CAF20394();

      if (!*(_QWORD *)(v14 + 16))
      {
LABEL_33:
        swift_bridgeObjectRelease();
        goto LABEL_34;
      }
      v15 = sub_1CAEDE938((uint64_t)*(id *)(v0 + 304));
      v16 = *(void **)(v0 + 304);
      if ((v17 & 1) != 0)
      {
        v18 = *(_QWORD *)(*(_QWORD *)(v14 + 56) + 8 * v15);
        swift_bridgeObjectRetain();
        swift_bridgeObjectRelease();

        if (v18 >> 62)
        {
          swift_bridgeObjectRetain();
          v49 = sub_1CAF208C8();
          swift_bridgeObjectRelease();
          if (v49)
            goto LABEL_9;
        }
        else if (*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
        {
LABEL_9:
          if ((v18 & 0xC000000000000001) != 0)
          {
            v19 = (id)MEMORY[0x1D1799A98](0, v18);
          }
          else
          {
            if (!*(_QWORD *)((v18 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_42;
            }
            v19 = *(id *)(v18 + 32);
          }
          v16 = v19;
          *(_QWORD *)(v0 + 352) = v19;
          swift_bridgeObjectRelease();
          if (objc_msgSend(v16, sel_type))
          {
            if (qword_1ECFCE888 == -1)
            {
LABEL_14:
              __swift_project_value_buffer(*(_QWORD *)(v0 + 320), (uint64_t)qword_1ECFCE8A8);
              v20 = sub_1CAF202C8();
              v21 = sub_1CAF206B8();
              if (os_log_type_enabled(v20, v21))
              {
                v22 = (uint8_t *)swift_slowAlloc();
                v57 = swift_slowAlloc();
                v58[0] = v57;
                *(_DWORD *)v22 = 136315138;
                *(_QWORD *)(v0 + 296) = sub_1CAEDBE5C(0xD000000000000016, 0x80000001CAF2C010, v58);
                sub_1CAF2076C();
                _os_log_impl(&dword_1CAEBA000, v20, v21, "%s Using first data class as desired action and saving account", v22, 0xCu);
                swift_arrayDestroy();
                MEMORY[0x1D179A698](v57, -1, -1);
                MEMORY[0x1D179A698](v22, -1, -1);
              }

              v23 = *(void **)(v0 + 304);
              v24 = objc_msgSend(*(id *)(v0 + 312), sel_accountStore);
              *(_QWORD *)(v0 + 360) = v24;
              __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991858);
              inited = swift_initStackObject();
              *(_OWORD *)(inited + 16) = xmmword_1CAF24BC0;
              *(_QWORD *)(inited + 32) = v23;
              *(_QWORD *)(inited + 40) = v16;
              v26 = v11;
              v27 = v23;
              v28 = v16;
              sub_1CAF0BE30(inited);
              sub_1CAEEBF3C(0, &qword_1EF991860);
              v29 = sub_1CAF20388();
              *(_QWORD *)(v0 + 368) = v29;
              swift_bridgeObjectRelease();
              *(_QWORD *)(v0 + 56) = v0 + 401;
              *(_QWORD *)(v0 + 16) = v0;
              *(_QWORD *)(v0 + 24) = sub_1CAF1AFC4;
              v30 = swift_continuation_init();
              *(_QWORD *)(v0 + 192) = MEMORY[0x1E0C809B0];
              v31 = (_QWORD *)(v0 + 192);
              v31[1] = 0x40000000;
              v31[2] = sub_1CAF1B378;
              v31[3] = &block_descriptor_2;
              v31[4] = v30;
              objc_msgSend(v24, sel_saveAccount_withDataclassActions_doVerify_completion_, v26, v29, 1, v31);
              return (id)swift_continuation_await();
            }
LABEL_42:
            swift_once();
            goto LABEL_14;
          }
          if (qword_1ECFCE888 != -1)
            swift_once();
          __swift_project_value_buffer(*(_QWORD *)(v0 + 320), (uint64_t)qword_1ECFCE8A8);
          v37 = sub_1CAF202C8();
          v38 = sub_1CAF206B8();
          if (os_log_type_enabled(v37, v38))
          {
            v39 = (uint8_t *)swift_slowAlloc();
            v40 = swift_slowAlloc();
            v58[0] = v40;
            *(_DWORD *)v39 = 136315138;
            *(_QWORD *)(v0 + 272) = sub_1CAEDBE5C(0xD000000000000016, 0x80000001CAF2C010, v58);
            sub_1CAF2076C();
            _os_log_impl(&dword_1CAEBA000, v37, v38, "%s dataclass actions is preventing to enable iCloud sync", v39, 0xCu);
            swift_arrayDestroy();
            MEMORY[0x1D179A698](v40, -1, -1);
            MEMORY[0x1D179A698](v39, -1, -1);
          }

          sub_1CAF1B3F8();
          v41 = (void *)swift_allocError();
          *v42 = 1;
          swift_willThrow();

          if (qword_1ECFCE888 != -1)
            swift_once();
          v43 = *(_QWORD *)(v0 + 336);
          v44 = *(void **)(v0 + 344);
          v45 = *(_QWORD *)(v0 + 320);
          v46 = *(_QWORD *)(v0 + 328);
          v47 = __swift_project_value_buffer(v45, (uint64_t)qword_1ECFCE8A8);
          (*(void (**)(uint64_t, uint64_t, uint64_t))(v46 + 16))(v43, v47, v45);
          v58[0] = 0;
          v58[1] = 0xE000000000000000;
          v48 = v41;
          sub_1CAF207FC();
          swift_bridgeObjectRelease();
          sub_1CAF1C254(v41);

          (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v43, v45);
          swift_willThrow();

LABEL_22:
          swift_task_dealloc();
          return (id)(*(uint64_t (**)(void))(v0 + 8))();
        }
        goto LABEL_33;
      }
      swift_bridgeObjectRelease();

    }
LABEL_34:
    if (qword_1ECFCE888 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 320), (uint64_t)qword_1ECFCE8A8);
    v50 = sub_1CAF202C8();
    v51 = sub_1CAF206B8();
    if (os_log_type_enabled(v50, v51))
    {
      v52 = (uint8_t *)swift_slowAlloc();
      v53 = swift_slowAlloc();
      v58[0] = v53;
      *(_DWORD *)v52 = 136315138;
      *(_QWORD *)(v0 + 280) = sub_1CAEDBE5C(0xD000000000000016, 0x80000001CAF2C010, v58);
      sub_1CAF2076C();
      _os_log_impl(&dword_1CAEBA000, v50, v51, "%s No dataclass actions returned", v52, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v53, -1, -1);
      MEMORY[0x1D179A698](v52, -1, -1);
    }

    v54 = objc_msgSend(*(id *)(v0 + 312), sel_accountStore);
    *(_QWORD *)(v0 + 384) = v54;
    *(_QWORD *)(v0 + 120) = v0 + 400;
    *(_QWORD *)(v0 + 80) = v0;
    *(_QWORD *)(v0 + 88) = sub_1CAF1B07C;
    v55 = swift_continuation_init();
    *(_QWORD *)(v0 + 232) = MEMORY[0x1E0C809B0];
    v56 = (_QWORD *)(v0 + 232);
    v56[1] = 0x40000000;
    v56[2] = sub_1CAF1B378;
    v56[3] = &block_descriptor_9;
    v56[4] = v55;
    objc_msgSend(v54, sel_saveAccount_withDataclassActions_doVerify_completion_, v11, 0, 1, v56);
    return (id)swift_continuation_await();
  }
  __break(1u);
  return result;
}

uint64_t sub_1CAF1AFC4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 376) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1CAF1B024()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(void **)(v0 + 360);
  v2 = *(void **)(v0 + 368);
  v4 = *(void **)(v0 + 344);
  v3 = *(void **)(v0 + 352);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF1B07C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 392) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_1CAF1B0DC()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 384);
  v2 = *(void **)(v0 + 344);

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF1B124()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  v1 = *(void **)(v0 + 368);
  v3 = *(void **)(v0 + 352);
  v2 = *(void **)(v0 + 360);
  v4 = *(void **)(v0 + 344);
  swift_willThrow();

  v5 = *(void **)(v0 + 376);
  if (qword_1ECFCE888 != -1)
    swift_once();
  v6 = *(_QWORD *)(v0 + 336);
  v7 = *(void **)(v0 + 344);
  v8 = *(_QWORD *)(v0 + 320);
  v9 = *(_QWORD *)(v0 + 328);
  v10 = __swift_project_value_buffer(v8, (uint64_t)qword_1ECFCE8A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 16))(v6, v10, v8);
  v11 = v5;
  sub_1CAF207FC();
  swift_bridgeObjectRelease();
  sub_1CAF1C254(v5);

  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v6, v8);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF1B254()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v1 = *(void **)(v0 + 384);
  v2 = *(void **)(v0 + 344);
  swift_willThrow();

  v3 = *(void **)(v0 + 392);
  if (qword_1ECFCE888 != -1)
    swift_once();
  v4 = *(_QWORD *)(v0 + 336);
  v5 = *(void **)(v0 + 344);
  v6 = *(_QWORD *)(v0 + 320);
  v7 = *(_QWORD *)(v0 + 328);
  v8 = __swift_project_value_buffer(v6, (uint64_t)qword_1ECFCE8A8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v4, v8, v6);
  v9 = v3;
  sub_1CAF207FC();
  swift_bridgeObjectRelease();
  sub_1CAF1C254(v3);

  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v4, v6);
  swift_willThrow();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1CAF1B378(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(qword_1ECFCE7E8);
    swift_allocError();
    *v4 = a3;
    v5 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    **(_BYTE **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
    return swift_continuation_throwingResume();
  }
}

unint64_t sub_1CAF1B3F8()
{
  unint64_t result;

  result = qword_1EF991848;
  if (!qword_1EF991848)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF26FE8, &type metadata for AccountError);
    atomic_store(result, (unint64_t *)&qword_1EF991848);
  }
  return result;
}

uint64_t storeEnumTagSinglePayload for AccountError(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_1CAF1B488 + 4 * byte_1CAF26F61[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_1CAF1B4BC + 4 * byte_1CAF26F5C[v4]))();
}

uint64_t sub_1CAF1B4BC(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF1B4C4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CAF1B4CCLL);
  return result;
}

uint64_t sub_1CAF1B4D8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CAF1B4E0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_1CAF1B4E4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CAF1B4EC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for AccountError()
{
  return &type metadata for AccountError;
}

unint64_t sub_1CAF1B50C()
{
  unint64_t result;

  result = qword_1EF991868;
  if (!qword_1EF991868)
  {
    result = MEMORY[0x1D179A5CC](&unk_1CAF26FC0, &type metadata for AccountError);
    atomic_store(result, (unint64_t *)&qword_1EF991868);
  }
  return result;
}

id FAFamilyInvite.clientSignalDateForInvite()@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  void (*v18)(char *, uint64_t, uint64_t, uint64_t);
  id v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v25;
  void *v26;
  char *v27;
  char v28;
  id v29;
  void *v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  id result;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  char *v38;
  char *v39;

  v2 = v1;
  v4 = sub_1CAF20178();
  v5 = *(_QWORD *)(v4 - 8);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v38 = (char *)&v36 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  v11 = MEMORY[0x1E0C80A78](v10);
  v37 = (char *)&v36 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v36 - v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v36 - v16;
  v18 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56);
  v18((char *)&v36 - v16, 1, 1, v4);
  v19 = objc_msgSend(v2, sel_inviteStatus);
  if (!v19)
    return (id)sub_1CAEFB154((uint64_t)v17, a1);
  v20 = v19;
  v39 = v8;
  v21 = sub_1CAF20400();
  v23 = v22;

  if (v21 == 0x676E69646E6550 && v23 == 0xE700000000000000)
  {
    swift_bridgeObjectRelease();
    v24 = v18;
    v25 = v5;
    v26 = v2;
    v27 = v39;
  }
  else
  {
    v28 = sub_1CAF209A0();
    swift_bridgeObjectRelease();
    v24 = v18;
    v25 = v5;
    v26 = v2;
    v27 = v39;
    if ((v28 & 1) == 0)
      return (id)sub_1CAEFB154((uint64_t)v17, a1);
  }
  v29 = objc_msgSend(v26, sel_inviteDate);
  if (!v29)
  {
    v24(v15, 1, 1, v4);
    goto LABEL_11;
  }
  v30 = v29;
  sub_1CAF20160();

  v31 = *(void (**)(char *, char *, uint64_t))(v25 + 32);
  v31(v15, v27, v4);
  v24(v15, 0, 1, v4);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v15, 1, v4) == 1)
  {
LABEL_11:
    sub_1CAEF5168((uint64_t)v15, &qword_1EF98FDB8);
    return (id)sub_1CAEFB154((uint64_t)v17, a1);
  }
  v32 = v38;
  v31(v38, v15, v4);
  result = objc_msgSend(v26, sel_badgeAfter);
  if (result)
  {
    v34 = result;
    objc_msgSend(result, sel_doubleValue);

    v35 = (uint64_t)v37;
    sub_1CAF2013C();
    (*(void (**)(char *, uint64_t))(v25 + 8))(v32, v4);
    sub_1CAEF5168((uint64_t)v17, &qword_1EF98FDB8);
    v24((char *)v35, 0, 1, v4);
    sub_1CAEFB154(v35, (uint64_t)v17);
    return (id)sub_1CAEFB154((uint64_t)v17, a1);
  }
  __break(1u);
  return result;
}

uint64_t FAFamilyInvite.inviteAsFamilyMember.getter()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t inited;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  id v24;
  void *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t result;
  double v34;
  double v35;
  unint64_t v36;
  id v37;
  void *v38;
  id v39;
  uint64_t v40;
  __int128 v41;
  unint64_t v42;

  v1 = v0;
  v2 = sub_1CAF20178();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v40 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v40 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991488);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1CAF27030;
  *(_QWORD *)(inited + 32) = 0x642D7265626D656DLL;
  *(_QWORD *)(inited + 40) = 0xEB00000000646973;
  v10 = objc_msgSend(v1, sel_organizerDSID);
  if (v10)
  {
    v11 = v10;
    v42 = sub_1CAF1BD08();
    *(_QWORD *)&v41 = v11;
    sub_1CAEEBF2C(&v41, (_OWORD *)(inited + 48));
  }
  else
  {
    *(_QWORD *)(inited + 72) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 48) = 0;
    *(_QWORD *)(inited + 56) = 0xE000000000000000;
  }
  *(_QWORD *)(inited + 80) = 0xD000000000000011;
  *(_QWORD *)(inited + 88) = 0x80000001CAF2B320;
  v12 = objc_msgSend(v1, sel_organizerFirstName);
  if (v12)
  {
    v13 = v12;
    v14 = sub_1CAF20400();
    v16 = v15;

    v17 = (uint64_t *)(inited + 96);
    *(_QWORD *)(inited + 120) = MEMORY[0x1E0DEA968];
    if (v16)
    {
      *v17 = v14;
      goto LABEL_9;
    }
  }
  else
  {
    v17 = (uint64_t *)(inited + 96);
    *(_QWORD *)(inited + 120) = MEMORY[0x1E0DEA968];
  }
  *v17 = 0;
  v16 = 0xE000000000000000;
LABEL_9:
  *(_QWORD *)(inited + 104) = v16;
  *(_QWORD *)(inited + 128) = 0xD000000000000010;
  *(_QWORD *)(inited + 136) = 0x80000001CAF2C0A0;
  v18 = objc_msgSend(v1, sel_organizerLastName);
  if (v18)
  {
    v19 = v18;
    v20 = sub_1CAF20400();
    v22 = v21;

    v23 = (uint64_t *)(inited + 144);
    *(_QWORD *)(inited + 168) = MEMORY[0x1E0DEA968];
    if (v22)
    {
      *v23 = v20;
      goto LABEL_14;
    }
  }
  else
  {
    v23 = (uint64_t *)(inited + 144);
    *(_QWORD *)(inited + 168) = MEMORY[0x1E0DEA968];
  }
  *v23 = 0;
  v22 = 0xE000000000000000;
LABEL_14:
  *(_QWORD *)(inited + 152) = v22;
  *(_QWORD *)(inited + 176) = 0x612D7265626D656DLL;
  *(_QWORD *)(inited + 184) = 0xEF64692D656C7070;
  v24 = objc_msgSend(v1, sel_organizerEmail);
  if (v24)
  {
    v25 = v24;
    v26 = sub_1CAF20400();
    v28 = v27;

    v29 = (uint64_t *)(inited + 192);
    v30 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 216) = MEMORY[0x1E0DEA968];
    if (v28)
    {
      *v29 = v26;
      goto LABEL_19;
    }
  }
  else
  {
    v29 = (uint64_t *)(inited + 192);
    v30 = MEMORY[0x1E0DEA968];
    *(_QWORD *)(inited + 216) = MEMORY[0x1E0DEA968];
  }
  *v29 = 0;
  v28 = 0xE000000000000000;
LABEL_19:
  *(_QWORD *)(inited + 200) = v28;
  *(_QWORD *)(inited + 224) = 0xD000000000000014;
  *(_QWORD *)(inited + 232) = 0x80000001CAF2C0C0;
  *(_QWORD *)(inited + 240) = 0;
  *(_QWORD *)(inited + 248) = 0xE000000000000000;
  *(_QWORD *)(inited + 264) = v30;
  *(_QWORD *)(inited + 272) = 0xD000000000000018;
  *(_QWORD *)(inited + 280) = 0x80000001CAF2C0E0;
  v31 = objc_msgSend(v1, sel_inviteDate);
  if (v31)
  {
    v32 = v31;
    sub_1CAF20160();

    (*(void (**)(char *, char *, uint64_t))(v3 + 32))(v8, v5, v2);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v3 + 56))(v8, 0, 1, v2);
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2);
    if ((_DWORD)result != 1)
    {
      sub_1CAF20154();
      v35 = v34;
      (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
      *(_QWORD *)(inited + 312) = MEMORY[0x1E0DEB070];
      *(double *)(inited + 288) = v35 * 1000.0;
      v36 = sub_1CAF0BCFC(inited);
      sub_1CAF0C2A0(v36);
      swift_bridgeObjectRelease();
      v37 = objc_allocWithZone((Class)FAFamilyMember);
      v38 = (void *)sub_1CAF20388();
      swift_bridgeObjectRelease();
      v39 = objc_msgSend(v37, sel_initWithDictionaryRepresentation_, v38);

      return (uint64_t)v39;
    }
  }
  else
  {
    result = (*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v3 + 56))(v8, 1, 1, v2);
  }
  __break(1u);
  return result;
}

unint64_t sub_1CAF1BD08()
{
  unint64_t result;

  result = qword_1EF991370;
  if (!qword_1EF991370)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF991370);
  }
  return result;
}

Swift::String_optional __swiftcall FAFamilyInvite.getInviteURL()()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  void *v17;
  char *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  Swift::String_optional result;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FFB0);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v23 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1CAF200D0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v24 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CAF1FFF8();
  v25 = *(_QWORD *)(v7 - 8);
  v26 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAF1FFEC();
  sub_1CAF1FFE0();
  sub_1CAF1FFC8();
  sub_1CAF1FFD4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9911A8);
  sub_1CAF1FFA4();
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_1CAF25400;
  sub_1CAF1FF98();
  v10 = objc_msgSend(v0, sel_code);
  if (v10)
  {
    v11 = v10;
    sub_1CAF20400();

  }
  sub_1CAF1FF98();
  swift_bridgeObjectRelease();
  sub_1CAF1FFB0();
  sub_1CAF1FFBC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v3, 1, v4) == 1)
  {
    sub_1CAEF5168((uint64_t)v3, &qword_1EF98FFB0);
    if (qword_1ECFCE888 != -1)
      swift_once();
    v12 = sub_1CAF202E0();
    __swift_project_value_buffer(v12, (uint64_t)qword_1ECFCE8A8);
    v13 = sub_1CAF202C8();
    v14 = sub_1CAF206AC();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1CAEBA000, v13, v14, "URL does not exist for getInviteURL", v15, 2u);
      MEMORY[0x1D179A698](v15, -1, -1);
    }

    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
    v16 = 0;
    v17 = 0;
  }
  else
  {
    v18 = v24;
    (*(void (**)(char *, char *, uint64_t))(v5 + 32))(v24, v3, v4);
    v16 = sub_1CAF2007C();
    v17 = v19;
    (*(void (**)(char *, uint64_t))(v5 + 8))(v18, v4);
    (*(void (**)(char *, uint64_t))(v25 + 8))(v9, v26);
  }
  v20 = v16;
  v21 = v17;
  result.value._object = v21;
  result.value._countAndFlagsBits = v20;
  return result;
}

Swift::String __swiftcall FAFamilyInvite.localizedName()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  Swift::String result;
  uint64_t v19;

  v1 = v0;
  v2 = sub_1CAF20058();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CAF2004C();
  v6 = objc_msgSend(v1, sel_organizerFirstName);
  if (v6)
  {
    v7 = v6;
    sub_1CAF20400();

  }
  sub_1CAF20028();
  v8 = objc_msgSend(v1, sel_organizerLastName);
  if (v8)
  {
    v9 = v8;
    sub_1CAF20400();

  }
  sub_1CAF20034();
  v10 = (void *)objc_opt_self();
  v11 = (void *)sub_1CAF20040();
  v12 = objc_msgSend(v10, sel_localizedStringFromPersonNameComponents_style_options_, v11, 0, 0);

  v13 = sub_1CAF20400();
  v15 = v14;

  (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  v16 = v13;
  v17 = v15;
  result._object = v17;
  result._countAndFlagsBits = v16;
  return result;
}

void sub_1CAF1C254(void *a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSObject *v10;
  os_log_type_t v11;
  uint8_t *v12;
  uint64_t v13;
  uint64_t v14;

  if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9910F0);
    v2 = swift_allocObject();
    *(_OWORD *)(v2 + 16) = xmmword_1CAF24BC0;
    swift_getErrorValue();
    v3 = a1;
    v4 = sub_1CAF209DC();
    v6 = v5;
    *(_QWORD *)(v2 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v2 + 64) = sub_1CAEE0D8C();
    *(_QWORD *)(v2 + 32) = v4;
    *(_QWORD *)(v2 + 40) = v6;
    v7 = sub_1CAF20418();
    v9 = v8;
    swift_bridgeObjectRetain();
    v10 = sub_1CAF202C8();
    v11 = sub_1CAF206AC();
    if (os_log_type_enabled(v10, v11))
    {
      v12 = (uint8_t *)swift_slowAlloc();
      v13 = swift_slowAlloc();
      v14 = v13;
      *(_DWORD *)v12 = 136315138;
      swift_bridgeObjectRetain();
      sub_1CAEDBE5C(v7, v9, &v14);
      sub_1CAF2076C();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_1CAEBA000, v10, v11, "%s", v12, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1D179A698](v13, -1, -1);
      MEMORY[0x1D179A698](v12, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
  }
}

uint64_t sub_1CAF1C464()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v9;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914E0);
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_allocate_value_buffer(v2, qword_1EF9951F8);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF9951F8);
  v5 = (void *)objc_opt_self();
  v6 = objc_msgSend(v5, sel_hours);
  sub_1CAF12AD8();
  sub_1CAF1FF5C();
  v7 = objc_msgSend(v5, sel_seconds);
  sub_1CAF1FF74();

  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v4, v0);
}

void static CoreFollowupSender.clearInviteCFU()()
{
  id v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  unsigned int v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint64_t v11;
  void *v12;
  uint64_t inited;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  id v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24[3];

  v24[2] = *(id *)MEMORY[0x1E0C80C00];
  v0 = objc_allocWithZone(MEMORY[0x1E0D15E30]);
  v1 = (void *)sub_1CAF203DC();
  v2 = objc_msgSend(v0, sel_initWithClientIdentifier_, v1);

  if (v2)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991480);
    v3 = swift_allocObject();
    *(_OWORD *)(v3 + 16) = xmmword_1CAF24BC0;
    *(_QWORD *)(v3 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v3 + 32) = 0x6E49796C696D6146;
    *(_QWORD *)(v3 + 40) = 0xEF55464365746976;
    v4 = (void *)sub_1CAF205A4();
    swift_bridgeObjectRelease();
    v24[0] = 0;
    v5 = objc_msgSend(v2, sel_clearPendingFollowUpItemsWithUniqueIdentifiers_error_, v4, v24);

    if (v5)
    {
      v6 = qword_1EF98FBD8[0];
      v7 = v24[0];
      if (v6 != -1)
        swift_once();
      v8 = sub_1CAF202E0();
      __swift_project_value_buffer(v8, (uint64_t)qword_1EF98FD68);
      v9 = sub_1CAF202C8();
      v10 = sub_1CAF206B8();
      if (os_log_type_enabled(v9, v10))
      {
        v11 = swift_slowAlloc();
        v12 = (void *)swift_slowAlloc();
        v24[0] = v12;
        *(_DWORD *)v11 = 136315394;
        sub_1CAEDBE5C(0xD000000000000010, 0x80000001CAF2C170, (uint64_t *)v24);
        sub_1CAF2076C();
        *(_WORD *)(v11 + 12) = 2080;
        sub_1CAEDBE5C(0x6E49796C696D6146, 0xEF55464365746976, (uint64_t *)v24);
        sub_1CAF2076C();
        _os_log_impl(&dword_1CAEBA000, v9, v10, "%s cleared %s", (uint8_t *)v11, 0x16u);
        swift_arrayDestroy();
        MEMORY[0x1D179A698](v12, -1, -1);
        MEMORY[0x1D179A698](v11, -1, -1);
      }

      return;
    }
    v21 = v24[0];
    v20 = (id)sub_1CAF20070();

    swift_willThrow();
  }
  else
  {
    v24[0] = 0;
    v24[1] = (id)0xE000000000000000;
    sub_1CAF207FC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
    *(_QWORD *)(inited + 32) = sub_1CAF20400();
    *(_QWORD *)(inited + 40) = v14;
    *(_QWORD *)(inited + 48) = 0xD000000000000027;
    *(_QWORD *)(inited + 56) = 0x80000001CAF2C120;
    *(_QWORD *)(inited + 64) = sub_1CAF20400();
    *(_QWORD *)(inited + 72) = v15;
    *(_QWORD *)(inited + 80) = 0xD000000000000027;
    *(_QWORD *)(inited + 88) = 0x80000001CAF2C120;
    v16 = sub_1CAF0BA9C(inited);
    sub_1CAF0BF38(v16);
    swift_bridgeObjectRelease();
    v17 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v18 = (void *)sub_1CAF203DC();
    v19 = (void *)sub_1CAF20388();
    swift_bridgeObjectRelease();
    v20 = objc_msgSend(v17, sel_initWithDomain_code_userInfo_, v18, 500, v19);

    swift_willThrow();
  }
  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v22 = sub_1CAF202E0();
  __swift_project_value_buffer(v22, (uint64_t)qword_1EF98FD68);
  v23 = v20;
  sub_1CAF1C254(v20);

}

void _s12FamilyCircle18CoreFollowupSenderO13sendInviteCFU14invitationDatey10Foundation0J0VSg_tFZ_0(void *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  id v25;
  char *v26;
  void (*v27)(char *, uint64_t);
  void (*v28)(char *, uint64_t);
  void *v29;
  void *v30;
  void (*v31)(char *, uint64_t);
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint64_t v42;
  _QWORD *v43;
  id v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  NSObject *v49;
  os_log_type_t v50;
  uint8_t *v51;
  void *v52;
  uint64_t inited;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  id v57;
  void *v58;
  void *v59;
  id v60;
  id v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  id v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  char *v69;
  uint64_t v70;
  void *v71;
  id v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  unint64_t v76;
  uint64_t v77;

  v71 = a1;
  v77 = *MEMORY[0x1E0C80C00];
  v73 = sub_1CAF202E0();
  v70 = *(_QWORD *)(v73 - 8);
  MEMORY[0x1E0C80A78](v73);
  v69 = (char *)&v66 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF9914E0);
  v68 = *(_QWORD *)(v2 - 8);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v66 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v67 = (char *)&v66 - v6;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FDB8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v66 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CAF20178();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v66 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v66 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v66 - v18;
  v20 = objc_allocWithZone(MEMORY[0x1E0D15E30]);
  v21 = (void *)sub_1CAF203DC();
  v72 = objc_msgSend(v20, sel_initWithClientIdentifier_, v21);

  v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D15E38]), sel_init);
  sub_1CAEFB19C((uint64_t)v71, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    sub_1CAEFE410((uint64_t)v9);
    sub_1CAF2016C();
    v23 = (void *)objc_opt_self();
    v24 = objc_msgSend(v23, sel_hours);
    sub_1CAF12AD8();
    sub_1CAF1FF5C();
    v25 = objc_msgSend(v23, sel_seconds);
    v26 = v67;
    sub_1CAF1FF74();

    v27 = *(void (**)(char *, uint64_t))(v68 + 8);
    v27(v5, v2);
    sub_1CAF1FF68();
    v27(v26, v2);
    sub_1CAF2013C();
    v28 = *(void (**)(char *, uint64_t))(v11 + 8);
    v28(v14, v10);
    v29 = (void *)sub_1CAF20118();
    v28(v17, v10);
    objc_msgSend(v22, sel_setExpirationDate_, v29);

  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(v19, v9, v10);
    if (qword_1EF990DC8 != -1)
      swift_once();
    __swift_project_value_buffer(v2, (uint64_t)qword_1EF9951F8);
    sub_1CAF1FF68();
    sub_1CAF2013C();
    v30 = (void *)sub_1CAF20118();
    v31 = *(void (**)(char *, uint64_t))(v11 + 8);
    v31(v17, v10);
    objc_msgSend(v22, sel_setExpirationDate_, v30);

    v31(v19, v10);
  }
  v75 = 0;
  v76 = 0xE000000000000000;
  v74 = *MEMORY[0x1E0D15DE0];
  type metadata accessor for FLItemGroup(0);
  sub_1CAF208A4();
  v32 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setGroupIdentifier_, v32);

  objc_msgSend(v22, sel_setDisplayStyle_, 8);
  v33 = (void *)sub_1CAF203DC();
  objc_msgSend(v22, sel_setTitle_, v33);

  v34 = objc_msgSend(v22, sel_title);
  objc_msgSend(v22, sel_setInformativeText_, v34);

  v75 = 0;
  v76 = 0xE000000000000000;
  v74 = *MEMORY[0x1E0D15E08];
  type metadata accessor for FLItemCollection(0);
  sub_1CAF208A4();
  v35 = (void *)sub_1CAF203DC();
  swift_bridgeObjectRelease();
  objc_msgSend(v22, sel_setCollectionIdentifier_, v35);

  v36 = (void *)sub_1CAF203DC();
  objc_msgSend(v22, sel_setCategoryIdentifier_, v36);

  v37 = (void *)sub_1CAF203DC();
  objc_msgSend(v22, sel_setUniqueIdentifier_, v37);

  if (qword_1EF98FBD8[0] != -1)
    swift_once();
  v38 = __swift_project_value_buffer(v73, (uint64_t)qword_1EF98FD68);
  v39 = v22;
  v40 = sub_1CAF202C8();
  v41 = sub_1CAF206A0();
  if (os_log_type_enabled(v40, v41))
  {
    v42 = swift_slowAlloc();
    v43 = (_QWORD *)swift_slowAlloc();
    v71 = (void *)swift_slowAlloc();
    v75 = v71;
    *(_DWORD *)v42 = 136315394;
    v74 = sub_1CAEDBE5C(0xD00000000000001ELL, 0x80000001CAF2C250, (uint64_t *)&v75);
    sub_1CAF2076C();
    *(_WORD *)(v42 + 12) = 2112;
    v74 = (uint64_t)v39;
    v44 = v39;
    sub_1CAF2076C();
    *v43 = v39;

    _os_log_impl(&dword_1CAEBA000, v40, v41, "%s about to post %@", (uint8_t *)v42, 0x16u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991400);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v43, -1, -1);
    v45 = v71;
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v45, -1, -1);
    MEMORY[0x1D179A698](v42, -1, -1);

    v46 = v72;
    if (v72)
      goto LABEL_10;
LABEL_14:
    v75 = 0;
    v76 = 0xE000000000000000;
    sub_1CAF207FC();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF98FD28);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_1CAF25400;
    *(_QWORD *)(inited + 32) = sub_1CAF20400();
    *(_QWORD *)(inited + 40) = v54;
    *(_QWORD *)(inited + 48) = 0xD000000000000035;
    *(_QWORD *)(inited + 56) = 0x80000001CAF2C1D0;
    *(_QWORD *)(inited + 64) = sub_1CAF20400();
    *(_QWORD *)(inited + 72) = v55;
    *(_QWORD *)(inited + 80) = 0xD000000000000035;
    *(_QWORD *)(inited + 88) = 0x80000001CAF2C1D0;
    v56 = sub_1CAF0BA9C(inited);
    sub_1CAF0BF38(v56);
    swift_bridgeObjectRelease();
    v57 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v58 = (void *)sub_1CAF203DC();
    v59 = (void *)sub_1CAF20388();
    swift_bridgeObjectRelease();
    v60 = objc_msgSend(v57, sel_initWithDomain_code_userInfo_, v58, 500, v59);

    swift_willThrow();
LABEL_16:
    v62 = v70;
    v63 = v69;
    v64 = v73;
    (*(void (**)(char *, uint64_t, uint64_t))(v70 + 16))(v69, v38, v73);
    v75 = 0;
    v76 = 0xE000000000000000;
    v65 = v60;
    sub_1CAF207FC();
    swift_bridgeObjectRelease();
    sub_1CAF1C254(v60);

    (*(void (**)(char *, uint64_t))(v62 + 8))(v63, v64);
    return;
  }

  v46 = v72;
  if (!v72)
    goto LABEL_14;
LABEL_10:
  v75 = 0;
  v47 = v46;
  if (!objc_msgSend(v47, sel_postFollowUpItem_error_, v39, &v75))
  {
    v61 = v75;
    v60 = (id)sub_1CAF20070();

    swift_willThrow();
    goto LABEL_16;
  }
  v48 = v75;
  v49 = sub_1CAF202C8();
  v50 = sub_1CAF206B8();
  if (os_log_type_enabled(v49, v50))
  {
    v51 = (uint8_t *)swift_slowAlloc();
    v52 = (void *)swift_slowAlloc();
    v75 = v52;
    *(_DWORD *)v51 = 136315138;
    v74 = sub_1CAEDBE5C(0xD00000000000001ELL, 0x80000001CAF2C250, (uint64_t *)&v75);
    sub_1CAF2076C();
    _os_log_impl(&dword_1CAEBA000, v49, v50, "%s Posted CFU", v51, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v52, -1, -1);
    MEMORY[0x1D179A698](v51, -1, -1);

  }
  else
  {

  }
}

ValueMetadata *type metadata accessor for CoreFollowupSender()
{
  return &type metadata for CoreFollowupSender;
}

void __swiftcall FARequestEphemeralSigner.init(ephemeralAuthResults:)(FARequestEphemeralSigner *__return_ptr retstr, Swift::OpaquePointer ephemeralAuthResults)
{
  id v2;
  void *v3;

  v2 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v3 = (void *)sub_1CAF20388();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_initWithEphemeralAuthResults_, v3);

}

id FARequestEphemeralSigner.init(ephemeralAuthResults:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  *(_QWORD *)(v1 + OBJC_IVAR___FARequestEphemeralSigner_ephemeralAuthResults) = a1;
  v3.super_class = (Class)FARequestEphemeralSigner;
  return objc_msgSendSuper2(&v3, sel_init);
}

unint64_t sub_1CAF1D734()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v1 = sub_1CAF20400();
  v3 = v2;
  v4 = objc_msgSend(v0, sel_ephemeralAuthResults);
  v5 = sub_1CAF20394();

  if (!*(_QWORD *)(v5 + 16) || (v6 = sub_1CAEDE164(v1, v3), (v7 & 1) == 0))
  {
    v10 = 0u;
    v11 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1CAEDCD8C(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v11 + 1))
  {
LABEL_7:
    sub_1CAF0B888((uint64_t)&v10);
    return sub_1CAF0BCFC(MEMORY[0x1E0DEE9D8]);
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF991820);
  if (swift_dynamicCast())
    return v9;
  return sub_1CAF0BCFC(MEMORY[0x1E0DEE9D8]);
}

uint64_t sub_1CAF1D85C()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  v0 = sub_1CAF1D734();
  v1 = sub_1CAF20400();
  if (!*(_QWORD *)(v0 + 16) || (v3 = sub_1CAEDE164(v1, v2), (v4 & 1) == 0))
  {
    v7 = 0u;
    v8 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_1CAEDCD8C(*(_QWORD *)(v0 + 56) + 32 * v3, (uint64_t)&v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v8 + 1))
  {
LABEL_9:
    sub_1CAF0B888((uint64_t)&v7);
    return 0;
  }
  if (swift_dynamicCast())
    return v6;
  else
    return 0;
}

uint64_t sub_1CAF1D934()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  char v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;

  v1 = v0;
  v2 = sub_1CAF20400();
  v4 = v3;
  v5 = objc_msgSend(v0, sel_ephemeralAuthResults);
  v6 = sub_1CAF20394();

  if (!*(_QWORD *)(v6 + 16) || (v7 = sub_1CAEDE164(v2, v4), (v8 & 1) == 0))
  {
    v18 = 0u;
    v19 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  sub_1CAEDCD8C(*(_QWORD *)(v6 + 56) + 32 * v7, (uint64_t)&v18);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v19 + 1))
  {
LABEL_7:
    sub_1CAF0B888((uint64_t)&v18);
    goto LABEL_8;
  }
  if ((swift_dynamicCast() & 1) != 0)
  {
    *(_QWORD *)&v18 = v17;
    return sub_1CAF2097C();
  }
LABEL_8:
  v10 = sub_1CAF20400();
  v12 = v11;
  v13 = objc_msgSend(v1, sel_ephemeralAuthResults);
  v14 = sub_1CAF20394();

  if (*(_QWORD *)(v14 + 16) && (v15 = sub_1CAEDE164(v10, v12), (v16 & 1) != 0))
  {
    sub_1CAEDCD8C(*(_QWORD *)(v14 + 56) + 32 * v15, (uint64_t)&v18);
  }
  else
  {
    v18 = 0u;
    v19 = 0u;
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v19 + 1))
  {
    if (swift_dynamicCast())
      return v17;
    else
      return 0;
  }
  else
  {
    sub_1CAF0B888((uint64_t)&v18);
    return 0;
  }
}

uint64_t sub_1CAF1DB48()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  char v7;
  uint64_t v9;
  __int128 v10;
  __int128 v11;

  v1 = sub_1CAF20400();
  v3 = v2;
  v4 = objc_msgSend(v0, sel_ephemeralAuthResults);
  v5 = sub_1CAF20394();

  if (!*(_QWORD *)(v5 + 16) || (v6 = sub_1CAEDE164(v1, v3), (v7 & 1) == 0))
  {
    v10 = 0u;
    v11 = 0u;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_1CAEDCD8C(*(_QWORD *)(v5 + 56) + 32 * v6, (uint64_t)&v10);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v11 + 1))
  {
LABEL_9:
    sub_1CAF0B888((uint64_t)&v10);
    return 0;
  }
  if (swift_dynamicCast())
    return v9;
  else
    return 0;
}

void sub_1CAF1DC64(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint8_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  os_log_type_t v32;
  uint8_t *v33;
  uint64_t v34;
  id v35;

  if (qword_1ECFCE888 != -1)
    swift_once();
  v2 = sub_1CAF202E0();
  __swift_project_value_buffer(v2, (uint64_t)qword_1ECFCE8A8);
  v3 = sub_1CAF202C8();
  v4 = sub_1CAF206A0();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_1CAEBA000, v3, v4, "FARequestEphemeralSigner.sign signing request", v5, 2u);
    MEMORY[0x1D179A698](v5, -1, -1);
  }

  v6 = sub_1CAF1DB48();
  if (v7)
  {
    v8 = v6;
    v9 = v7;
    v10 = sub_1CAF20400();
    sub_1CAF1E0B0(v8, v9, v10, v11);
    v13 = v12;
    swift_bridgeObjectRelease();
    if (v13)
    {
      v14 = (void *)sub_1CAF203DC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v14 = 0;
    }
    objc_msgSend(a1, sel_setValue_forHTTPHeaderField_, v14, *MEMORY[0x1E0CFAB10]);

    sub_1CAF1E0B0(v8, v9, 0xD000000000000021, 0x80000001CAF2C360);
    if (v27)
    {
      v28 = (void *)sub_1CAF203DC();
      swift_bridgeObjectRelease();
    }
    else
    {
      v28 = 0;
    }
    v29 = (void *)sub_1CAF203DC();
    objc_msgSend(a1, sel_setValue_forHTTPHeaderField_, v28, v29);

    v30 = (void *)sub_1CAF203DC();
    swift_bridgeObjectRelease();
    v31 = sub_1CAF203DC();
    objc_msgSend(a1, sel_setValue_forHTTPHeaderField_, v30, v31);

  }
  else
  {
    v15 = sub_1CAF1D934();
    if (v16)
    {
      v17 = v15;
      v18 = v16;
      v19 = sub_1CAF202C8();
      v20 = sub_1CAF206AC();
      if (os_log_type_enabled(v19, v20))
      {
        v21 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v21 = 0;
        _os_log_impl(&dword_1CAEBA000, v19, v20, "FARequestEphemeralSigner.sign altdsid is nil falling back to dsid", v21, 2u);
        MEMORY[0x1D179A698](v21, -1, -1);
      }

      v22 = sub_1CAF20400();
      sub_1CAF1E0B0(v17, v18, v22, v23);
      v25 = v24;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if (v25)
      {
        v26 = (void *)sub_1CAF203DC();
        swift_bridgeObjectRelease();
      }
      else
      {
        v26 = 0;
      }
      v31 = sub_1CAF203DC();
      objc_msgSend(a1, sel_setValue_forHTTPHeaderField_, v26, v31);

    }
    else
    {
      v31 = sub_1CAF202C8();
      v32 = sub_1CAF206AC();
      if (os_log_type_enabled(v31, v32))
      {
        v33 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v33 = 0;
        _os_log_impl(&dword_1CAEBA000, v31, v32, "FARequestEphemeralSigner.sign altdsid is nil", v33, 2u);
        MEMORY[0x1D179A698](v33, -1, -1);
      }
    }
  }

  sub_1CAF1D934();
  if (v34)
  {
    v35 = (id)sub_1CAF203DC();
    swift_bridgeObjectRelease();
  }
  else
  {
    v35 = 0;
  }
  objc_msgSend(a1, sel_aa_addDeviceProvisioningInfoHeadersWithDSID_, v35);

}

uint64_t sub_1CAF1E0B0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  unint64_t v11;
  char v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  os_log_type_t v19;
  uint8_t *v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  _OWORD v25[2];

  v6 = sub_1CAF20430();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v23 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1CAF1D734();
  if (!*(_QWORD *)(v10 + 16))
  {
    v23 = 0u;
    v24 = 0u;
LABEL_9:
    swift_bridgeObjectRelease();
    goto LABEL_10;
  }
  swift_bridgeObjectRetain();
  v11 = sub_1CAEDE164(a3, a4);
  if ((v12 & 1) == 0)
  {
    v23 = 0u;
    v24 = 0u;
    swift_bridgeObjectRelease();
    goto LABEL_9;
  }
  sub_1CAEDCD8C(*(_QWORD *)(v10 + 56) + 32 * v11, (uint64_t)&v23);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  if (*((_QWORD *)&v24 + 1))
  {
    sub_1CAEEBF2C(&v23, v25);
    *(_QWORD *)&v23 = 0;
    *((_QWORD *)&v23 + 1) = 0xE000000000000000;
    sub_1CAF204A8();
    sub_1CAF204A8();
    sub_1CAF208A4();
    sub_1CAF20424();
    v13 = sub_1CAF2040C();
    v15 = v14;
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    v16 = 0;
    if (v15 >> 60 != 15)
    {
      v16 = sub_1CAF200E8();
      sub_1CAEF4D5C(v13, v15);
    }
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v25);
    return v16;
  }
LABEL_10:
  sub_1CAF0B888((uint64_t)&v23);
  if (qword_1ECFCE888 != -1)
    swift_once();
  v17 = sub_1CAF202E0();
  __swift_project_value_buffer(v17, (uint64_t)qword_1ECFCE8A8);
  swift_bridgeObjectRetain_n();
  v18 = sub_1CAF202C8();
  v19 = sub_1CAF206A0();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = (uint8_t *)swift_slowAlloc();
    v21 = swift_slowAlloc();
    *(_QWORD *)&v25[0] = v21;
    *(_DWORD *)v20 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)&v23 = sub_1CAEDBE5C(a3, a4, (uint64_t *)v25);
    sub_1CAF2076C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1CAEBA000, v18, v19, "FARequestEphemeralSigner.headerValue %s is nil", v20, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1D179A698](v21, -1, -1);
    MEMORY[0x1D179A698](v20, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  return 0;
}

void __swiftcall FARequestEphemeralSigner.init()(FARequestEphemeralSigner *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void FARequestEphemeralSigner.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id FARequestEphemeralSigner.account.getter()
{
  void *v0;
  id v1;
  uint64_t v2;
  id v3;

  v1 = objc_msgSend(v0, sel_ephemeralAuthResults);
  v2 = sub_1CAF20394();

  v3 = _sSo9ACAccountC12FamilyCircleE10fa_account4withABSgSDySSypG_tFZ_0(v2);
  swift_bridgeObjectRelease();
  return v3;
}

unint64_t FARequestEphemeralSigner.accountInfoPayload()()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;

  v0 = sub_1CAF0BA9C(MEMORY[0x1E0DEE9D8]);
  v1 = sub_1CAF1DB48();
  if (v2)
  {
    v3 = v1;
    v4 = v2;
    v5 = HIBYTE(v2) & 0xF;
    if ((v2 & 0x2000000000000000) == 0)
      v5 = v1 & 0xFFFFFFFFFFFFLL;
    if (v5)
    {
      v6 = sub_1CAF20400();
      v8 = v7;
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      sub_1CAF19478(v3, v4, v6, v8, isUniquelyReferenced_nonNull_native);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v10 = sub_1CAF1D934();
  if (v11)
  {
    v12 = v10;
    v13 = v11;
    v14 = HIBYTE(v11) & 0xF;
    if ((v11 & 0x2000000000000000) == 0)
      v14 = v10 & 0xFFFFFFFFFFFFLL;
    if (v14)
    {
      v15 = sub_1CAF20400();
      v17 = v16;
      v18 = swift_isUniquelyReferenced_nonNull_native();
      sub_1CAF19478(v12, v13, v15, v17, v18);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v19 = sub_1CAF1DB48();
  if (v20)
  {
    v21 = v19;
    v22 = v20;
    v23 = HIBYTE(v20) & 0xF;
    if ((v20 & 0x2000000000000000) == 0)
      v23 = v19 & 0xFFFFFFFFFFFFLL;
    if (v23)
    {
      v24 = sub_1CAF20400();
      v26 = v25;
      v27 = swift_isUniquelyReferenced_nonNull_native();
      sub_1CAF19478(v21, v22, v24, v26, v27);
      swift_bridgeObjectRelease();
    }
    swift_bridgeObjectRelease();
  }
  v28 = sub_1CAF1D85C();
  if (v29)
  {
    v30 = v28;
    v31 = v29;
    v32 = swift_isUniquelyReferenced_nonNull_native();
    sub_1CAF19478(v30, v31, 0x796C696D61467364, 0xED00006E656B6F54, v32);
    swift_bridgeObjectRelease();
  }
  return v0;
}

unint64_t type metadata accessor for FARequestEphemeralSigner()
{
  unint64_t result;

  result = qword_1EF991878;
  if (!qword_1EF991878)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF991878);
  }
  return result;
}

uint64_t _weakUIImagePNGRepresentation_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1(v0);
}

uint64_t __getCNAvatarImageRenderingScopeClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getCNAvatarImageRendererClass_block_invoke_cold_1();
}

uint64_t __getCNAvatarImageRendererClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[FARecommendedFamilyMember contactFromRecommendationWithIdentifier:].cold.1(v0);
}

uint64_t __getAAUIFamilySetupPrompterClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[FASettingPresetsCache _cacheDirectoryURLWithError:].cold.1(v0);
}

uint64_t __getGDPersonTaggingOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getGDViewServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getGDViewServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getGDConfigurationClass_block_invoke_cold_1(v0);
}

uint64_t __getGDConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getGDEntityTaggingServiceClass_block_invoke_cold_1(v0);
}

uint64_t __getGDEntityTaggingServiceClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[FASettingsPresetSource initWithDictionary:].cold.1(v0);
}

uint64_t __getSTPrivateServiceClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSTUserIDClass_block_invoke_cold_1(v0);
}

uint64_t __getSTUserIDClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSTSetupClientClass_block_invoke_cold_1(v0);
}

uint64_t __getSTSetupClientClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[FAFamilyMemberPhotoRequest urlString].cold.1(v0);
}

uint64_t sub_1CAF1FF5C()
{
  return MEMORY[0x1E0CAE248]();
}

uint64_t sub_1CAF1FF68()
{
  return MEMORY[0x1E0CAE250]();
}

uint64_t sub_1CAF1FF74()
{
  return MEMORY[0x1E0CAE310]();
}

uint64_t sub_1CAF1FF80()
{
  return MEMORY[0x1E0CAE430]();
}

uint64_t sub_1CAF1FF8C()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1CAF1FF98()
{
  return MEMORY[0x1E0CAE668]();
}

uint64_t sub_1CAF1FFA4()
{
  return MEMORY[0x1E0CAE690]();
}

uint64_t sub_1CAF1FFB0()
{
  return MEMORY[0x1E0CAE778]();
}

uint64_t sub_1CAF1FFBC()
{
  return MEMORY[0x1E0CAE7D0]();
}

uint64_t sub_1CAF1FFC8()
{
  return MEMORY[0x1E0CAE7F0]();
}

uint64_t sub_1CAF1FFD4()
{
  return MEMORY[0x1E0CAE808]();
}

uint64_t sub_1CAF1FFE0()
{
  return MEMORY[0x1E0CAE848]();
}

uint64_t sub_1CAF1FFEC()
{
  return MEMORY[0x1E0CAE878]();
}

uint64_t sub_1CAF1FFF8()
{
  return MEMORY[0x1E0CAE890]();
}

uint64_t sub_1CAF20004()
{
  return MEMORY[0x1E0CAEB20]();
}

uint64_t sub_1CAF20010()
{
  return MEMORY[0x1E0CAEB38]();
}

uint64_t sub_1CAF2001C()
{
  return MEMORY[0x1E0CAEB50]();
}

uint64_t sub_1CAF20028()
{
  return MEMORY[0x1E0CAF6F8]();
}

uint64_t sub_1CAF20034()
{
  return MEMORY[0x1E0CAF708]();
}

uint64_t sub_1CAF20040()
{
  return MEMORY[0x1E0CAF750]();
}

uint64_t sub_1CAF2004C()
{
  return MEMORY[0x1E0CAF788]();
}

uint64_t sub_1CAF20058()
{
  return MEMORY[0x1E0CAF790]();
}

uint64_t sub_1CAF20064()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1CAF20070()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1CAF2007C()
{
  return MEMORY[0x1E0CAFDA0]();
}

uint64_t sub_1CAF20088()
{
  return MEMORY[0x1E0CAFDB0]();
}

uint64_t sub_1CAF20094()
{
  return MEMORY[0x1E0CAFDE0]();
}

uint64_t sub_1CAF200A0()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1CAF200AC()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1CAF200B8()
{
  return MEMORY[0x1E0CAFF68]();
}

uint64_t sub_1CAF200C4()
{
  return MEMORY[0x1E0CAFF90]();
}

uint64_t sub_1CAF200D0()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1CAF200DC()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1CAF200E8()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_1CAF200F4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1CAF20100()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_1CAF2010C()
{
  return MEMORY[0x1E0CB05A8]();
}

uint64_t sub_1CAF20118()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1CAF20124()
{
  return MEMORY[0x1E0CB06D0]();
}

uint64_t sub_1CAF20130()
{
  return MEMORY[0x1E0CB06D8]();
}

uint64_t sub_1CAF2013C()
{
  return MEMORY[0x1E0CB06E8]();
}

uint64_t sub_1CAF20148()
{
  return MEMORY[0x1E0CB0708]();
}

uint64_t sub_1CAF20154()
{
  return MEMORY[0x1E0CB07C0]();
}

uint64_t sub_1CAF20160()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1CAF2016C()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1CAF20178()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CAF20184()
{
  return MEMORY[0x1E0CB0910]();
}

uint64_t sub_1CAF20190()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1CAF2019C()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1CAF201A8()
{
  return MEMORY[0x1E0CB0F38]();
}

uint64_t sub_1CAF201B4()
{
  return MEMORY[0x1E0CB1070]();
}

uint64_t sub_1CAF201C0()
{
  return MEMORY[0x1E0CB10C8]();
}

uint64_t sub_1CAF201CC()
{
  return MEMORY[0x1E0CB11B8]();
}

uint64_t sub_1CAF201D8()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1CAF201E4()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_1CAF201F0()
{
  return MEMORY[0x1E0CF0F30]();
}

uint64_t sub_1CAF201FC()
{
  return MEMORY[0x1E0CF0F40]();
}

uint64_t sub_1CAF20208()
{
  return MEMORY[0x1E0CF0F70]();
}

uint64_t sub_1CAF20214()
{
  return MEMORY[0x1E0CF0F78]();
}

uint64_t sub_1CAF20220()
{
  return MEMORY[0x1E0CF0F88]();
}

uint64_t sub_1CAF2022C()
{
  return MEMORY[0x1E0CF0F90]();
}

uint64_t sub_1CAF20238()
{
  return MEMORY[0x1E0DF2100]();
}

uint64_t sub_1CAF20244()
{
  return MEMORY[0x1E0DF2108]();
}

uint64_t sub_1CAF20250()
{
  return MEMORY[0x1E0DF2110]();
}

uint64_t sub_1CAF2025C()
{
  return MEMORY[0x1E0DF2118]();
}

uint64_t sub_1CAF20268()
{
  return MEMORY[0x1E0DF2130]();
}

uint64_t sub_1CAF20274()
{
  return MEMORY[0x1E0DF2150]();
}

uint64_t sub_1CAF20280()
{
  return MEMORY[0x1E0DF2170]();
}

uint64_t sub_1CAF2028C()
{
  return MEMORY[0x1E0DF2198]();
}

uint64_t sub_1CAF20298()
{
  return MEMORY[0x1E0DF2218]();
}

uint64_t sub_1CAF202A4()
{
  return MEMORY[0x1E0DF2220]();
}

uint64_t sub_1CAF202B0()
{
  return MEMORY[0x1E0DF2228]();
}

uint64_t sub_1CAF202BC()
{
  return MEMORY[0x1E0DF2238]();
}

uint64_t sub_1CAF202C8()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1CAF202D4()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1CAF202E0()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1CAF202EC()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_1CAF202F8()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_1CAF20304()
{
  return MEMORY[0x1E0C96158]();
}

uint64_t sub_1CAF20310()
{
  return MEMORY[0x1E0C96160]();
}

uint64_t sub_1CAF2031C()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_1CAF20328()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_1CAF20334()
{
  return MEMORY[0x1E0C96180]();
}

uint64_t sub_1CAF20340()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_1CAF2034C()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CAF20358()
{
  return MEMORY[0x1E0DEF560]();
}

uint64_t sub_1CAF20364()
{
  return MEMORY[0x1E0DEF570]();
}

uint64_t sub_1CAF20370()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CAF2037C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CAF20388()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1CAF20394()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_1CAF203A0()
{
  return MEMORY[0x1E0DEA0A0]();
}

uint64_t sub_1CAF203AC()
{
  return MEMORY[0x1E0DEA0A8]();
}

uint64_t sub_1CAF203B8()
{
  return MEMORY[0x1E0DEA3B0]();
}

uint64_t sub_1CAF203C4()
{
  return MEMORY[0x1E0DEA3C0]();
}

uint64_t sub_1CAF203D0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CAF203DC()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CAF203E8()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_1CAF203F4()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_1CAF20400()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CAF2040C()
{
  return MEMORY[0x1E0CB1988]();
}

uint64_t sub_1CAF20418()
{
  return MEMORY[0x1E0CB19C0]();
}

uint64_t sub_1CAF20424()
{
  return MEMORY[0x1E0CB19E8]();
}

uint64_t sub_1CAF20430()
{
  return MEMORY[0x1E0CB1A18]();
}

uint64_t sub_1CAF2043C()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1CAF20448()
{
  return MEMORY[0x1E0DEA610]();
}

uint64_t sub_1CAF20454()
{
  return MEMORY[0x1E0DEA618]();
}

uint64_t sub_1CAF20460()
{
  return MEMORY[0x1E0DEA630]();
}

uint64_t sub_1CAF2046C()
{
  return MEMORY[0x1E0DEA658]();
}

uint64_t sub_1CAF20478()
{
  return MEMORY[0x1E0DEA6F0]();
}

uint64_t sub_1CAF20484()
{
  return MEMORY[0x1E0DEA6F8]();
}

uint64_t sub_1CAF20490()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1CAF2049C()
{
  return MEMORY[0x1E0DEA7C0]();
}

uint64_t sub_1CAF204A8()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CAF204B4()
{
  return MEMORY[0x1E0DEA828]();
}

uint64_t sub_1CAF204C0()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1CAF204CC()
{
  return MEMORY[0x1E0DEA858]();
}

uint64_t sub_1CAF204D8()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1CAF204E4()
{
  return MEMORY[0x1E0DEA878]();
}

uint64_t sub_1CAF204F0()
{
  return MEMORY[0x1E0DEA880]();
}

uint64_t sub_1CAF204FC()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1CAF20508()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1CAF20514()
{
  return MEMORY[0x1E0DEAA40]();
}

uint64_t sub_1CAF20520()
{
  return MEMORY[0x1E0DEAA50]();
}

uint64_t sub_1CAF2052C()
{
  return MEMORY[0x1E0DEAA58]();
}

uint64_t sub_1CAF20538()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1CAF20544()
{
  return MEMORY[0x1E0DEAC90]();
}

uint64_t sub_1CAF20550()
{
  return MEMORY[0x1E0DEACA0]();
}

uint64_t sub_1CAF2055C()
{
  return MEMORY[0x1E0DEACB8]();
}

uint64_t sub_1CAF20568()
{
  return MEMORY[0x1E0DEACC0]();
}

uint64_t sub_1CAF20574()
{
  return MEMORY[0x1E0DEAD18]();
}

uint64_t sub_1CAF20580()
{
  return MEMORY[0x1E0DEAD30]();
}

uint64_t sub_1CAF2058C()
{
  return MEMORY[0x1E0DEAD38]();
}

uint64_t sub_1CAF20598()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1CAF205A4()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CAF205B0()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1CAF205BC()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CAF205C8()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1CAF205D4()
{
  return MEMORY[0x1E0DEAE28]();
}

uint64_t sub_1CAF205E0()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1CAF205EC()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1CAF205F8()
{
  return MEMORY[0x1E0DF05C8]();
}

uint64_t sub_1CAF20604()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1CAF20610()
{
  return MEMORY[0x1E0DF05D8]();
}

uint64_t sub_1CAF2061C()
{
  return MEMORY[0x1E0DF05E0]();
}

uint64_t sub_1CAF20628()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1CAF20634()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1CAF20640()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1CAF2064C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1CAF20658()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1CAF20664()
{
  return MEMORY[0x1E0DF0860]();
}

uint64_t sub_1CAF20670()
{
  return MEMORY[0x1E0DF0870]();
}

uint64_t sub_1CAF2067C()
{
  return MEMORY[0x1E0DF0890]();
}

uint64_t sub_1CAF20688()
{
  return MEMORY[0x1E0DF08C8]();
}

uint64_t sub_1CAF20694()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1CAF206A0()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1CAF206AC()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1CAF206B8()
{
  return MEMORY[0x1E0DF2290]();
}

uint64_t sub_1CAF206C4()
{
  return MEMORY[0x1E0DEF800]();
}

uint64_t sub_1CAF206D0()
{
  return MEMORY[0x1E0DEF810]();
}

uint64_t sub_1CAF206DC()
{
  return MEMORY[0x1E0DEF8E0]();
}

uint64_t sub_1CAF206E8()
{
  return MEMORY[0x1E0DEF8F8]();
}

uint64_t sub_1CAF206F4()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CAF20700()
{
  return MEMORY[0x1E0DEF910]();
}

uint64_t sub_1CAF2070C()
{
  return MEMORY[0x1E0DEF920]();
}

uint64_t sub_1CAF20718()
{
  return MEMORY[0x1E0DF2298]();
}

uint64_t sub_1CAF20724()
{
  return MEMORY[0x1E0DF22A0]();
}

uint64_t sub_1CAF20730()
{
  return MEMORY[0x1E0DF22A8]();
}

uint64_t sub_1CAF2073C()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1CAF20748()
{
  return MEMORY[0x1E0DF22B0]();
}

uint64_t sub_1CAF20754()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1CAF20760()
{
  return MEMORY[0x1E0DEBB68]();
}

uint64_t sub_1CAF2076C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1CAF20778()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1CAF20784()
{
  return MEMORY[0x1E0CB2480]();
}

uint64_t sub_1CAF20790()
{
  return MEMORY[0x1E0CB24A8]();
}

uint64_t sub_1CAF2079C()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_1CAF207A8()
{
  return MEMORY[0x1E0DEC050]();
}

uint64_t sub_1CAF207B4()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CAF207C0()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_1CAF207CC()
{
  return MEMORY[0x1E0DEC160]();
}

uint64_t sub_1CAF207D8()
{
  return MEMORY[0x1E0DEC168]();
}

uint64_t sub_1CAF207E4()
{
  return MEMORY[0x1E0DEC178]();
}

uint64_t sub_1CAF207F0()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1CAF207FC()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1CAF20808()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1CAF20814()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1CAF20820()
{
  return MEMORY[0x1E0DEC3E8]();
}

uint64_t sub_1CAF2082C()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1CAF20838()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1CAF20844()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1CAF20850()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1CAF2085C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1CAF20868()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1CAF20874()
{
  return MEMORY[0x1E0DF0B60]();
}

uint64_t sub_1CAF20880()
{
  return MEMORY[0x1E0DF0B98]();
}

uint64_t sub_1CAF2088C()
{
  return MEMORY[0x1E0DF0BA0]();
}

uint64_t sub_1CAF20898()
{
  return MEMORY[0x1E0DEC7D0]();
}

uint64_t sub_1CAF208A4()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1CAF208B0()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1CAF208BC()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1CAF208C8()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1CAF208D4()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_1CAF208E0()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_1CAF208EC()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1CAF208F8()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1CAF20904()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1CAF20910()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1CAF2091C()
{
  return MEMORY[0x1E0DECFC8]();
}

uint64_t sub_1CAF20928()
{
  return MEMORY[0x1E0DECFF0]();
}

uint64_t sub_1CAF20934()
{
  return MEMORY[0x1E0DED010]();
}

uint64_t sub_1CAF20940()
{
  return MEMORY[0x1E0DED0F8]();
}

uint64_t sub_1CAF2094C()
{
  return MEMORY[0x1E0DED120]();
}

uint64_t sub_1CAF20958()
{
  return MEMORY[0x1E0DED140]();
}

uint64_t sub_1CAF20964()
{
  return MEMORY[0x1E0DED1A0]();
}

uint64_t sub_1CAF20970()
{
  return MEMORY[0x1E0DED1B0]();
}

uint64_t sub_1CAF2097C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CAF20988()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1CAF20994()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CAF209A0()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CAF209AC()
{
  return MEMORY[0x1E0DF0EC0]();
}

uint64_t sub_1CAF209B8()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_1CAF209C4()
{
  return MEMORY[0x1E0DF0EE8]();
}

uint64_t sub_1CAF209D0()
{
  return MEMORY[0x1E0DF0EF0]();
}

uint64_t sub_1CAF209DC()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1CAF209E8()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1CAF209F4()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1CAF20A00()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1CAF20A0C()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1CAF20A18()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CAF20A24()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CAF20A30()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_1CAF20A3C()
{
  return MEMORY[0x1E0DEE030]();
}

uint64_t sub_1CAF20A48()
{
  return MEMORY[0x1E0DEE240]();
}

uint64_t sub_1CAF20A54()
{
  return MEMORY[0x1E0DEE270]();
}

uint64_t sub_1CAF20A60()
{
  return MEMORY[0x1E0DEE758]();
}

uint64_t sub_1CAF20A6C()
{
  return MEMORY[0x1E0DEE780]();
}

uint64_t sub_1CAF20A78()
{
  return MEMORY[0x1E0DEE7C8]();
}

uint64_t sub_1CAF20A84()
{
  return MEMORY[0x1E0DEE8E0]();
}

uint64_t sub_1CAF20A90()
{
  return MEMORY[0x1E0DEE8E8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

CGDataProviderRef CGDataProviderCreateWithCFData(CFDataRef data)
{
  return (CGDataProviderRef)MEMORY[0x1E0C9C5F0](data);
}

void CGDataProviderRelease(CGDataProviderRef provider)
{
  MEMORY[0x1E0C9C638](provider);
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

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithDataProvider(CGDataProviderRef provider, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5A0](provider, options);
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
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

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
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

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
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

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
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

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_getTupleTypeLayout2()
{
  return MEMORY[0x1E0DEED08]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_initEnumMetadataMultiPayload()
{
  return MEMORY[0x1E0DEED60]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x1E0DEEDC8]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_stdlib_isStackAllocationSafe()
{
  return MEMORY[0x1E0DEEE88]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
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

uint64_t swift_weakDestroy()
{
  return MEMORY[0x1E0DEEF98]();
}

uint64_t swift_weakInit()
{
  return MEMORY[0x1E0DEEFA0]();
}

uint64_t swift_weakLoadStrong()
{
  return MEMORY[0x1E0DEEFA8]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

xpc_object_t xpc_activity_copy_criteria(xpc_activity_t activity)
{
  return (xpc_object_t)MEMORY[0x1E0C85D80](activity);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85D90](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x1E0C85D98](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x1E0C85DB0](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x1E0C85DD0](identifier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

