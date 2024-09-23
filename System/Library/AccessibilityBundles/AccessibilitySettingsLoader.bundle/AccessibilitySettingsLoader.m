void sub_230B0C5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B0C6A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXValidationManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary();
  result = objc_getClass("AXValidationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXValidationManagerClass_block_invoke_cold_1();
  getAXValidationManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXValidationManagerClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_1();
  result = objc_getClass("AXValidationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXValidationManagerClass_block_invoke_cold_1();
  getAXValidationManagerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXValidationManagerClass_block_invoke_1(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_4();
  result = objc_getClass("AXValidationManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXValidationManagerClass_block_invoke_cold_1();
  getAXValidationManagerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230B0CAD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXBinaryMonitorClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_1();
  result = objc_getClass("AXBinaryMonitor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXBinaryMonitorClass_block_invoke_cold_1();
  getAXBinaryMonitorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXBinaryMonitorClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_4();
  result = objc_getClass("AXBinaryMonitor");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXBinaryMonitorClass_block_invoke_cold_1();
  getAXBinaryMonitorClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

BOOL _hasBooleanEntitlement(__SecTask *a1, void *a2)
{
  __CFString *v3;
  CFTypeRef v4;
  NSObject *v5;
  CFTypeID v6;
  _BOOL8 v7;
  CFErrorRef error;
  uint8_t buf[4];
  __SecTask *v11;
  __int16 v12;
  __CFString *v13;
  __int16 v14;
  CFErrorRef v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  error = 0;
  v4 = SecTaskCopyValueForEntitlement(a1, v3, &error);
  if (error)
  {
    GAXLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      v11 = a1;
      v12 = 2112;
      v13 = v3;
      v14 = 2112;
      v15 = error;
      _os_log_error_impl(&dword_230B0B000, v5, OS_LOG_TYPE_ERROR, "Unable to check if task %@ has entitlement %@: %@", buf, 0x20u);
    }

    CFRelease(error);
  }
  if (v4)
  {
    v6 = CFGetTypeID(v4);
    v7 = v6 == CFBooleanGetTypeID() && CFBooleanGetValue((CFBooleanRef)v4) != 0;
    CFRelease(v4);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void sub_230B0D550(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t AccessibilityUtilitiesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24FED6150;
    v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary)
    AccessibilityUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUtilitiesLibraryCore_frameworkLibrary;
}

uint64_t AccessibilityUtilitiesLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_24FED61F0;
    v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_0)
    AccessibilityUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUtilitiesLibraryCore_frameworkLibrary_0;
}

uint64_t AccessibilityUtilitiesLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_24FED6378;
    v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_1)
    AccessibilityUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUtilitiesLibraryCore_frameworkLibrary_1;
}

uint64_t AccessibilityUtilitiesLibrary_2()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_2)
  {
    v2 = xmmword_24FED64B0;
    v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_2 = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_2)
    AccessibilityUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUtilitiesLibraryCore_frameworkLibrary_2;
}

uint64_t AccessibilityUtilitiesLibrary_3()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_3)
  {
    v2 = xmmword_24FED65C8;
    v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_3 = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_3)
    AccessibilityUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUtilitiesLibraryCore_frameworkLibrary_3;
}

uint64_t AccessibilityUtilitiesLibrary_4()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_4)
  {
    v2 = xmmword_24FED67E8;
    v3 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_4 = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_4)
    AccessibilityUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUtilitiesLibraryCore_frameworkLibrary_4;
}

uint64_t soft_AXProcessIsSystemApplication()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXProcessIsSystemApplicationSymbolLoc_ptr;
  v7 = getAXProcessIsSystemApplicationSymbolLoc_ptr;
  if (!getAXProcessIsSystemApplicationSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary_1();
    v0 = dlsym(v1, "AXProcessIsSystemApplication");
    v5[3] = (uint64_t)v0;
    getAXProcessIsSystemApplicationSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXProcessIsSystemApplication_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B0D9EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAXSettingsClass()
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
  v0 = (void *)getAXSettingsClass_softClass;
  v7 = getAXSettingsClass_softClass;
  if (!getAXSettingsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXSettingsClass_block_invoke;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getAXSettingsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B0DAA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXSettingsClass_0()
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
  v0 = (void *)getAXSettingsClass_softClass_0;
  v7 = getAXSettingsClass_softClass_0;
  if (!getAXSettingsClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXSettingsClass_block_invoke_0;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getAXSettingsClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B0DB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAXSettingsClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary();
  result = objc_getClass("AXSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXSettingsClass_block_invoke_cold_1();
  getAXSettingsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXSettingsClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_1();
  result = objc_getClass("AXSettings");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXSettingsClass_block_invoke_cold_1();
  getAXSettingsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230B0E0C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B0E1AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B0E92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getZoomServicesClass()
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
  v0 = (void *)getZoomServicesClass_softClass;
  v7 = getZoomServicesClass_softClass;
  if (!getZoomServicesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getZoomServicesClass_block_invoke;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getZoomServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B0EBA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXDeviceHasHomeButton()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXDeviceHasHomeButtonSymbolLoc_ptr;
  v7 = getAXDeviceHasHomeButtonSymbolLoc_ptr;
  if (!getAXDeviceHasHomeButtonSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary();
    v0 = dlsym(v1, "AXDeviceHasHomeButton");
    v5[3] = (uint64_t)v0;
    getAXDeviceHasHomeButtonSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXDeviceHasHomeButton_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B0ED2C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXDeviceIsPad()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXDeviceIsPadSymbolLoc_ptr;
  v7 = getAXDeviceIsPadSymbolLoc_ptr;
  if (!getAXDeviceIsPadSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary();
    v0 = dlsym(v1, "AXDeviceIsPad");
    v5[3] = (uint64_t)v0;
    getAXDeviceIsPadSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXDeviceIsPad_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B0EDC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsSpringBoard()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXProcessIsSpringBoardSymbolLoc_ptr;
  v7 = getAXProcessIsSpringBoardSymbolLoc_ptr;
  if (!getAXProcessIsSpringBoardSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary();
    v0 = dlsym(v1, "AXProcessIsSpringBoard");
    v5[3] = (uint64_t)v0;
    getAXProcessIsSpringBoardSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXProcessIsSpringBoard_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B0F11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B0F230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft___ax_verbose_encode_with_type_encoding_group_class(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v2 = get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr;
  v8 = get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr;
  if (!get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr)
  {
    v3 = (void *)AccessibilityUtilitiesLibrary();
    v2 = dlsym(v3, "__ax_verbose_encode_with_type_encoding_group_class");
    v6[3] = (uint64_t)v2;
    get__ax_verbose_encode_with_type_encoding_group_classSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v5, 8);
  if (!v2)
    soft___ax_verbose_encode_with_type_encoding_group_class_cold_1();
  return ((uint64_t (*)(uint64_t, const char *))v2)(a1, "__CGPoint__");
}

void sub_230B0F894(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsInCallService()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXProcessIsInCallServiceSymbolLoc_ptr;
  v7 = getAXProcessIsInCallServiceSymbolLoc_ptr;
  if (!getAXProcessIsInCallServiceSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary();
    v0 = dlsym(v1, "AXProcessIsInCallService");
    v5[3] = (uint64_t)v0;
    getAXProcessIsInCallServiceSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXProcessIsInCallService_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B0F92C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B0FA08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXUIKeyboardIsOnScreen()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  v7 = getAXUIKeyboardIsOnScreenSymbolLoc_ptr;
  if (!getAXUIKeyboardIsOnScreenSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUIUtilitiesLibrary();
    v0 = dlsym(v1, "AXUIKeyboardIsOnScreen");
    v5[3] = (uint64_t)v0;
    getAXUIKeyboardIsOnScreenSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXUIKeyboardIsOnScreen_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B0FCA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr;
  v7 = getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr;
  if (!getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUIUtilitiesLibrary();
    v0 = dlsym(v1, "AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside");
    v5[3] = (uint64_t)v0;
    getAXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInsideSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B0FD38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id soft_AXUIKeyboardWindow()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXUIKeyboardWindowSymbolLoc_ptr;
  v7 = getAXUIKeyboardWindowSymbolLoc_ptr;
  if (!getAXUIKeyboardWindowSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUIUtilitiesLibrary();
    v0 = dlsym(v1, "AXUIKeyboardWindow");
    v5[3] = (uint64_t)v0;
    getAXUIKeyboardWindowSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXUIKeyboardWindow_cold_1();
  ((void (*)(uint64_t))v0)(v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void sub_230B0FDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

double soft_AXUIConvertRectFromScreenToContextSpace(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void *v17;

  v9 = a1;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v10 = getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr;
  v17 = getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr;
  if (!getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr)
  {
    v11 = (void *)AccessibilityUIUtilitiesLibrary();
    v10 = dlsym(v11, "AXUIConvertRectFromScreenToContextSpace");
    v15[3] = (uint64_t)v10;
    getAXUIConvertRectFromScreenToContextSpaceSymbolLoc_ptr = v10;
  }
  _Block_object_dispose(&v14, 8);
  if (!v10)
    soft_AXUIConvertRectFromScreenToContextSpace_cold_1();
  v12 = ((double (*)(id, double, double, double, double))v10)(v9, a2, a3, a4, a5);

  return v12;
}

void sub_230B102F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B10544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getAXBackBoardServerClass()
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
  v0 = (void *)getAXBackBoardServerClass_softClass;
  v7 = getAXBackBoardServerClass_softClass;
  if (!getAXBackBoardServerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXBackBoardServerClass_block_invoke;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getAXBackBoardServerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B10668(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B11048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  _Block_object_dispose(&a30, 8);
  _Unwind_Resume(a1);
}

void soft_AXPerformSafeBlock(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v1 = a1;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v2 = getAXPerformSafeBlockSymbolLoc_ptr;
  v7 = getAXPerformSafeBlockSymbolLoc_ptr;
  if (!getAXPerformSafeBlockSymbolLoc_ptr)
  {
    v3 = (void *)AccessibilityUtilitiesLibrary();
    v2 = dlsym(v3, "AXPerformSafeBlock");
    v5[3] = (uint64_t)v2;
    getAXPerformSafeBlockSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v4, 8);
  if (!v2)
    soft_AXPerformSafeBlock_cold_1();
  ((void (*)(id))v2)(v1);

}

void sub_230B11104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id soft___UIAccessibilityCastAsClass(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void *v13;

  v5 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v6 = get__UIAccessibilityCastAsClassSymbolLoc_ptr;
  v13 = get__UIAccessibilityCastAsClassSymbolLoc_ptr;
  if (!get__UIAccessibilityCastAsClassSymbolLoc_ptr)
  {
    v7 = (void *)AccessibilityUtilitiesLibrary();
    v6 = dlsym(v7, "__UIAccessibilityCastAsClass");
    v11[3] = (uint64_t)v6;
    get__UIAccessibilityCastAsClassSymbolLoc_ptr = v6;
  }
  _Block_object_dispose(&v10, 8);
  if (!v6)
    soft___UIAccessibilityCastAsClass_cold_1();
  ((void (*)(uint64_t, id, uint64_t, uint64_t))v6)(a1, v5, 1, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_230B12110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id soft_AXSafeClassFromString(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getAXSafeClassFromStringSymbolLoc_ptr;
  v9 = getAXSafeClassFromStringSymbolLoc_ptr;
  if (!getAXSafeClassFromStringSymbolLoc_ptr)
  {
    v3 = (void *)AccessibilityUtilitiesLibrary();
    v2 = dlsym(v3, "AXSafeClassFromString");
    v7[3] = (uint64_t)v2;
    getAXSafeClassFromStringSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
    soft_AXSafeClassFromString_cold_1();
  ((void (*)(id))v2)(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

void sub_230B121CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B127C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B12A08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getZoomServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!operator||)
  {
    v4 = xmmword_24FED6168;
    v5 = 0;
    operator|| = _sl_dlopen();
  }
  if (!operator||)
    __getZoomServicesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("ZoomServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getZoomServicesClass_block_invoke_cold_2();
  getZoomServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilityUIUtilitiesLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24FED6180;
    v3 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary)
    AccessibilityUIUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUIUtilitiesLibraryCore_frameworkLibrary;
}

Class __getAXBackBoardServerClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary();
  result = objc_getClass("AXBackBoardServer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXBackBoardServerClass_block_invoke_cold_1();
  getAXBackBoardServerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

char *OUTLINED_FUNCTION_0()
{
  return dlerror();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_230B12E8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSpeakTypingServicesClass()
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
  v0 = (void *)getSpeakTypingServicesClass_softClass;
  v7 = getSpeakTypingServicesClass_softClass;
  if (!getSpeakTypingServicesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSpeakTypingServicesClass_block_invoke;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getSpeakTypingServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B130BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B1336C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B1345C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getTTSSpeechSynthesizerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!TextToSpeechLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24FED61C0;
    v5 = 0;
    TextToSpeechLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!TextToSpeechLibraryCore_frameworkLibrary)
    __getTTSSpeechSynthesizerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("TTSSpeechSynthesizer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getTTSSpeechSynthesizerClass_block_invoke_cold_2();
  getTTSSpeechSynthesizerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSpeakTypingServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24FED61D8;
    v5 = 0;
    SpeakTypingServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary)
    __getSpeakTypingServicesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SpeakTypingServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSpeakTypingServicesClass_block_invoke_cold_2();
  getSpeakTypingServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230B138D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXBackBoardServerClass_0()
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
  v0 = (void *)getAXBackBoardServerClass_softClass_0;
  v7 = getAXBackBoardServerClass_softClass_0;
  if (!getAXBackBoardServerClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXBackBoardServerClass_block_invoke_0;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getAXBackBoardServerClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B13990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B13B64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsSpringBoard_0()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXProcessIsSpringBoardSymbolLoc_ptr_0;
  v7 = getAXProcessIsSpringBoardSymbolLoc_ptr_0;
  if (!getAXProcessIsSpringBoardSymbolLoc_ptr_0)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary_1();
    v0 = dlsym(v1, "AXProcessIsSpringBoard");
    v5[3] = (uint64_t)v0;
    getAXProcessIsSpringBoardSymbolLoc_ptr_0 = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXProcessIsSpringBoard_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B13C04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B13E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getAXResourceLoaderClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_1();
  result = objc_getClass("AXResourceLoader");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXResourceLoaderClass_block_invoke_cold_1();
  getAXResourceLoaderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXBackBoardServerClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_1();
  result = objc_getClass("AXBackBoardServer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXBackBoardServerClass_block_invoke_cold_1();
  getAXBackBoardServerClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void *__getkMADisplayFilterSettingsChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!MediaAccessibilityLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24FED6390;
    v5 = 0;
    MediaAccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MediaAccessibilityLibraryCore_frameworkLibrary)
    __getkMADisplayFilterSettingsChangedNotificationSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)MediaAccessibilityLibraryCore_frameworkLibrary, "kMADisplayFilterSettingsChangedNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getkMADisplayFilterSettingsChangedNotificationSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void _handleGuidedAccessActiveStatusDidChangeBroadcastNotification()
{
  void *v0;
  void *v1;

  v0 = (void *)MEMORY[0x2348BF380]();
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "postNotificationName:object:", *MEMORY[0x24BDF7250], 0);

  objc_autoreleasePoolPop(v0);
}

void sub_230B142D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B143A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230B144C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getAXReplayerClass_block_invoke(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_2();
  result = objc_getClass("AXReplayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXReplayerClass_block_invoke_cold_1();
  getAXReplayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getAXBackBoardServerClass_block_invoke_1(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_2();
  result = objc_getClass("AXBackBoardServer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXBackBoardServerClass_block_invoke_cold_1();
  getAXBackBoardServerClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _axSettingsHandlePreferenceChanged(int a1, int a2, CFStringRef theString1)
{
  void *v4;
  _QWORD *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  if (CFStringCompare(theString1, (CFStringRef)*MEMORY[0x24BED27A0], 0))
  {
    if (CFStringCompare(theString1, (CFStringRef)*MEMORY[0x24BED27A8], 0))
      return;
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v5 = (_QWORD *)getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr;
    v11 = getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr;
    if (!getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr)
    {
      v6 = (void *)AccessibilityLibrary();
      v5 = dlsym(v6, "AXMFiHearingDeviceStreamingEarDidChangeNotification");
      v9[3] = (uint64_t)v5;
      getAXMFiHearingDeviceStreamingEarDidChangeNotificationSymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v8, 8);
    if (!v5)
      _axSettingsHandlePreferenceChanged_cold_2();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v5 = (_QWORD *)getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr;
    v11 = getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr;
    if (!getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr)
    {
      v7 = (void *)AccessibilityLibrary();
      v5 = dlsym(v7, "AXMFiHearingDevicePairedUUIDsDidChangeNotification");
      v9[3] = (uint64_t)v5;
      getAXMFiHearingDevicePairedUUIDsDidChangeNotificationSymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v8, 8);
    if (!v5)
      _axSettingsHandlePreferenceChanged_cold_1();
  }
  objc_msgSend(v4, "postNotificationName:object:", *v5, 0, v8);

}

void sub_230B14A60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t AccessibilityLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24FED64C8;
    v3 = 0;
    AccessibilityLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AccessibilityLibraryCore_frameworkLibrary)
    AccessibilityLibrary_cold_1(&v1);
  return AccessibilityLibraryCore_frameworkLibrary;
}

id getSpeakThisServicesClass()
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
  v0 = (void *)getSpeakThisServicesClass_softClass;
  v7 = getSpeakThisServicesClass_softClass;
  if (!getSpeakThisServicesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSpeakThisServicesClass_block_invoke;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getSpeakThisServicesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B14DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSpeakThisServicesClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SpeakThisServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24FED6500;
    v5 = 0;
    SpeakThisServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpeakThisServicesLibraryCore_frameworkLibrary)
    __getSpeakThisServicesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SpeakThisServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSpeakThisServicesClass_block_invoke_cold_2();
  getSpeakThisServicesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t _handleInvertColorsPreload()
{
  NSObject *v0;
  uint8_t v2[16];

  AXLogInvertColorsLoadBundles();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_230B0B000, v0, OS_LOG_TYPE_INFO, "Handling invert colors pre-load", v2, 2u);
  }

  _AXSInvertColorsReloadPreferenceImmediately();
  +[AXInvertColorsController loadInvertColorsBundle](AXInvertColorsController, "loadInvertColorsBundle");
  return _AXSInvertColorsMarkInvertColorsPreloadComplete();
}

void sub_230B155B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B15B1C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsAssistiveTouch()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXProcessIsAssistiveTouchSymbolLoc_ptr;
  v7 = getAXProcessIsAssistiveTouchSymbolLoc_ptr;
  if (!getAXProcessIsAssistiveTouchSymbolLoc_ptr)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary_3();
    v0 = dlsym(v1, "AXProcessIsAssistiveTouch");
    v5[3] = (uint64_t)v0;
    getAXProcessIsAssistiveTouchSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXProcessIsAssistiveTouch_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B15BB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXProcessIsSpringBoard_1()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXProcessIsSpringBoardSymbolLoc_ptr_2;
  v7 = getAXProcessIsSpringBoardSymbolLoc_ptr_2;
  if (!getAXProcessIsSpringBoardSymbolLoc_ptr_2)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary_3();
    v0 = dlsym(v1, "AXProcessIsSpringBoard");
    v5[3] = (uint64_t)v0;
    getAXProcessIsSpringBoardSymbolLoc_ptr_2 = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    soft_AXProcessIsSpringBoard_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B15C4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _accessibilityASTEnabled()
{
  return AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t AccessibilityUIUtilitiesLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_24FED65B0;
    v3 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0)
    AccessibilityUIUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_0;
}

uint64_t ___accessibilityASTEnabled_block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enable");
}

void typingFeedback()
{
  id v0;

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateForCurrentTypingFeedbackStatus");

}

void quickTypePredictionFeedback()
{
  id v0;

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateForCurrentQuickTypeFeedbackStatus");

}

void wordFeedback()
{
  id v0;

  +[SpeakTypingManager sharedInstance](SpeakTypingManager, "sharedInstance");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "updateForCurrentWordFeedbackStatus");

}

id getSpeakTypingServicesClass_0()
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
  v0 = (void *)getSpeakTypingServicesClass_softClass_0;
  v7 = getSpeakTypingServicesClass_softClass_0;
  if (!getSpeakTypingServicesClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSpeakTypingServicesClass_block_invoke_0;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getSpeakTypingServicesClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B1643C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void soft_AXPerformSafeBlock_0(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v1 = a1;
  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v2 = getAXPerformSafeBlockSymbolLoc_ptr_0;
  v7 = getAXPerformSafeBlockSymbolLoc_ptr_0;
  if (!getAXPerformSafeBlockSymbolLoc_ptr_0)
  {
    v3 = (void *)AccessibilityUtilitiesLibrary_4();
    v2 = dlsym(v3, "AXPerformSafeBlock");
    v5[3] = (uint64_t)v2;
    getAXPerformSafeBlockSymbolLoc_ptr_0 = v2;
  }
  _Block_object_dispose(&v4, 8);
  if (!v2)
    soft_AXPerformSafeBlock_cold_1();
  ((void (*)(id))v2)(v1);

}

void sub_230B164F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B16670(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_230B16884(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_230B169A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getAXValidationManagerClass()
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
  v0 = (void *)getAXValidationManagerClass_softClass_1;
  v7 = getAXValidationManagerClass_softClass_1;
  if (!getAXValidationManagerClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAXValidationManagerClass_block_invoke_1;
    v3[3] = &unk_24FED6130;
    v3[4] = &v4;
    __getAXValidationManagerClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_230B16A5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t soft_AXPerformValidationChecks()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  void *v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = getAXPerformValidationChecksSymbolLoc_ptr_1;
  v7 = getAXPerformValidationChecksSymbolLoc_ptr_1;
  if (!getAXPerformValidationChecksSymbolLoc_ptr_1)
  {
    v1 = (void *)AccessibilityUtilitiesLibrary_4();
    v0 = dlsym(v1, "AXPerformValidationChecks");
    v5[3] = (uint64_t)v0;
    getAXPerformValidationChecksSymbolLoc_ptr_1 = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    __54__ZoomServicesUI__installZoomUISafeCategoriesIfNeeded__block_invoke_3_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_230B16C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getSpeakTypingServicesClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24FED67D0;
    v5 = 0;
    SpeakTypingServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpeakTypingServicesLibraryCore_frameworkLibrary_0)
    __getSpeakTypingServicesClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SpeakTypingServices");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSpeakTypingServicesClass_block_invoke_cold_2();
  getSpeakTypingServicesClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AccessibilityUIUtilitiesLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_24FED6800;
    v3 = 0;
    AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1)
    AccessibilityUIUtilitiesLibrary_cold_1(&v1);
  return AccessibilityUIUtilitiesLibraryCore_frameworkLibrary_1;
}

Class __getAXResourceLoaderClass_block_invoke_0(uint64_t a1)
{
  Class result;

  AccessibilityUtilitiesLibrary_4();
  result = objc_getClass("AXResourceLoader");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAXResourceLoaderClass_block_invoke_cold_1();
  getAXResourceLoaderClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_230B17970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_5)
  {
    v4 = xmmword_24FED6818;
    v5 = 0;
    AccessibilityUtilitiesLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  }
  if (!AccessibilityUtilitiesLibraryCore_frameworkLibrary_5)
    __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)AccessibilityUtilitiesLibraryCore_frameworkLibrary_5, "AXSpringBoardUserChangedAudioRouteNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_ptr_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                               + 24);
  return result;
}

void soft_AXDeviceHasHomeButton_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXDeviceHasHomeButton(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 65, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXDeviceIsPad_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXDeviceIsPad(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 64, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXProcessIsSpringBoard_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsSpringBoard(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 68, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft___ax_verbose_encode_with_type_encoding_group_class_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "char *soft___ax_verbose_encode_with_type_encoding_group_class(__unsafe_unretained Class, const char *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 74, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXProcessIsInCallService_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsInCallService(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 66, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXUIKeyboardIsOnScreen_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXUIKeyboardIsOnScreen(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 39, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRect soft_AXUIKeyboardScreenFrameExcludingInputAccessoryIfFirstResponderInside(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 41, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXUIKeyboardWindow_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "UIWindow *soft_AXUIKeyboardWindow(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 40, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXUIConvertRectFromScreenToContextSpace_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGRect soft_AXUIConvertRectFromScreenToContextSpace(UIWindow *__strong, CGRect)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 42, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXPerformSafeBlock_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void soft_AXPerformSafeBlock(__strong dispatch_block_t)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 72, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft___UIAccessibilityCastAsClass_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "id soft___UIAccessibilityCastAsClass(__unsafe_unretained Class, __strong id, BOOL, BOOL *)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 73, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void soft_AXSafeClassFromString_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class soft_AXSafeClassFromString(NSString *__strong)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 70, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void AccessibilityUtilitiesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 32, CFSTR("%s"), *a1);

  __break(1u);
}

void __getZoomServicesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ZoomServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 27, CFSTR("%s"), *a1);

  __break(1u);
}

void __getZoomServicesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getZoomServicesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 96, CFSTR("Unable to find class %s"), "ZoomServices");

  __break(1u);
}

void __getAXValidationManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXValidationManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 52, CFSTR("Unable to find class %s"), "AXValidationManager");

  __break(1u);
}

void AccessibilityUIUtilitiesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityUIUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXBackBoardServerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXBackBoardServerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 54, CFSTR("Unable to find class %s"), "AXBackBoardServer");

  __break(1u);
}

void __getAXSettingsClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXSettingsClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 50, CFSTR("Unable to find class %s"), "AXSettings");

  __break(1u);
}

void __getTTSSpeechSynthesizerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *TextToSpeechLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getTTSSpeechSynthesizerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getTTSSpeechSynthesizerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 89, CFSTR("Unable to find class %s"), "TTSSpeechSynthesizer");

  __break(1u);
}

void __getSpeakTypingServicesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpeakTypingServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 24, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSpeakTypingServicesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSpeakTypingServicesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 47, CFSTR("Unable to find class %s"), "SpeakTypingServices");

  __break(1u);
}

void soft_AXProcessIsSystemApplication_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsSystemApplication(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 77, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __getAXResourceLoaderClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXResourceLoaderClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 56, CFSTR("Unable to find class %s"), "AXResourceLoader");

  __break(1u);
}

void __getAXBinaryMonitorClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXBinaryMonitorClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 60, CFSTR("Unable to find class %s"), "AXBinaryMonitor");

  __break(1u);
}

void __getkMADisplayFilterSettingsChangedNotificationSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MediaAccessibilityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAXReplayerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAXReplayerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 58, CFSTR("Unable to find class %s"), "AXReplayer");

  __break(1u);
}

void _axSettingsHandlePreferenceChanged_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getAXMFiHearingDevicePairedUUIDsDidChangeNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 37, CFSTR("%s"), dlerror());

  __break(1u);
}

void _axSettingsHandlePreferenceChanged_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getAXMFiHearingDeviceStreamingEarDidChangeNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 36, CFSTR("%s"), dlerror());

  __break(1u);
}

void AccessibilityLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpeakThisServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AXSettingsLoaderSoftLinkages.h"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSpeakThisServicesClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSpeakThisServicesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AXSettingsLoaderSoftLinkages.h"), 100, CFSTR("Unable to find class %s"), "SpeakThisServices");

  __break(1u);
}

void soft_AXProcessIsAssistiveTouch_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "BOOL soft_AXProcessIsAssistiveTouch(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AXSettingsLoaderSoftLinkages.h"), 75, CFSTR("%s"), OUTLINED_FUNCTION_0());

  __break(1u);
}

void __getAXSpringBoardUserChangedAudioRouteNotificationSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AccessibilityUtilitiesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MPAVRoutingControllerAccessibility.m"), 12, CFSTR("%s"), *a1);

  __break(1u);
  ASTLogCommon();
}

uint64_t ASTLogCommon()
{
  return MEMORY[0x24BDFFC40]();
}

uint64_t AXAccessibilityBundlesDirectory()
{
  return MEMORY[0x24BDFFC50]();
}

uint64_t AXDisallowsUIBasedAccessibilityFeatures()
{
  return MEMORY[0x24BED1FE0]();
}

uint64_t AXLogAppAccessibility()
{
  return MEMORY[0x24BE001F0]();
}

uint64_t AXLogCommon()
{
  return MEMORY[0x24BE00200]();
}

uint64_t AXLogInvertColorsLoadBundles()
{
  return MEMORY[0x24BE00210]();
}

uint64_t AXLogSpeakScreen()
{
  return MEMORY[0x24BE00228]();
}

uint64_t AXLogSpeakTyping()
{
  return MEMORY[0x24BE00230]();
}

uint64_t AXPerformBlockAsynchronouslyOnMainThread()
{
  return MEMORY[0x24BE00290]();
}

uint64_t AXPerformBlockOnMainThreadAfterDelay()
{
  return MEMORY[0x24BE002A0]();
}

uint64_t AXSystemRootDirectory()
{
  return MEMORY[0x24BE00428]();
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
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

CFNotificationCenterRef CFNotificationCenterGetLocalCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC060]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveEveryObserver(CFNotificationCenterRef center, const void *observer)
{
  MEMORY[0x24BDBC080](center, observer);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x24BDBEFC0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t GAXLogCommon()
{
  return MEMORY[0x24BE00570]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSRect NSRectFromString(NSString *aString)
{
  double v1;
  double v2;
  double v3;
  double v4;
  NSRect result;

  MEMORY[0x24BDD11D8](aString);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BDF6670]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromRect(NSRect aRect)
{
  return (NSString *)MEMORY[0x24BDD1260]((__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x24BDE8D70](allocator);
}

BOOL UIAccessibilityIsInvertColorsEnabled(void)
{
  return MEMORY[0x24BDF7280]();
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x24BDF7288]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BDF72C0]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BDF72F8](*(_QWORD *)&notification, argument);
}

uint64_t UISystemRootDirectory()
{
  return MEMORY[0x24BDF7DD0]();
}

uint64_t ZOOMLogCommon()
{
  return MEMORY[0x24BE007E8]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

uint64_t _AXSGuidedAccessRequiresApplicationAccessibility()
{
  return MEMORY[0x24BED2248]();
}

uint64_t _AXSInvertColorsMarkInvertColorsPreloadComplete()
{
  return MEMORY[0x24BED22E8]();
}

uint64_t _AXSInvertColorsReloadPreferenceImmediately()
{
  return MEMORY[0x24BED22F0]();
}

uint64_t _AXSLetterFeedbackEnabled()
{
  return MEMORY[0x24BED2308]();
}

uint64_t _AXSPhoneticFeedbackEnabled()
{
  return MEMORY[0x24BED2388]();
}

uint64_t _AXSQuickTypePredictionFeedbackEnabled()
{
  return MEMORY[0x24BED23D0]();
}

uint64_t _AXSShouldLoadInvertBundles()
{
  return MEMORY[0x24BED24F0]();
}

uint64_t _AXSSpeakThisEnabled()
{
  return MEMORY[0x24BED2518]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXSWordFeedbackEnabled()
{
  return MEMORY[0x24BED2648]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x24BED2650]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

void abort(void)
{
  MEMORY[0x24BDAD008]();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
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

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

