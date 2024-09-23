void sub_21DFED1A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFEE0C0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_21DFEE554(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_21DFEEAA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_21DFEEDF8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
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

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void __Block_byref_object_dispose__6(uint64_t a1)
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

id KSCategory()
{
  if (KSCategory_onceToken != -1)
    dispatch_once(&KSCategory_onceToken, &__block_literal_global_1);
  return (id)KSCategory_logFacility;
}

void sub_21DFF1CB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_21DFF3D4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFF6ACC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25)
{
  id v25;
  NSObject *v26;
  id v27;

  if (a2 == 1)
  {
    v25 = objc_begin_catch(exception_object);
    KSCategory();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v25, "reason");
      v27 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "userInfo");
      objc_claimAutoreleasedReturnValue();
      -[_KSCloudKitManager copyFieldsFromRecord:toRecord:].cold.1();
    }

    objc_end_catch();
    JUMPOUT(0x21DFF6A88);
  }
  _Unwind_Resume(exception_object);
}

void sub_21DFF70EC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 152), 8);
  _Unwind_Resume(a1);
}

void sub_21DFF8070(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id initCloudSettingsManager()
{
  id v0;

  if (CloudSettingsLibrary_frameworkLibrary
    || (CloudSettingsLibrary_frameworkLibrary = (uint64_t)dlopen("/System/Library/PrivateFrameworks/CloudSettings.framework/CloudSettings", 2)) != 0|| (NSLog(CFSTR("Failed to open framework /System/Library/PrivateFrameworks/CloudSettings.framework/CloudSettings")), CloudSettingsLibrary_frameworkLibrary))
  {
    classCloudSettingsManager = (uint64_t)objc_getClass("CloudSettingsManager");
    getCloudSettingsManagerClass = (uint64_t (*)())CloudSettingsManagerFunction;
    v0 = (id)classCloudSettingsManager;
  }
  else
  {
    v0 = 0;
  }
  return v0;
}

id CloudSettingsManagerFunction()
{
  return (id)classCloudSettingsManager;
}

uint64_t OUTLINED_FUNCTION_0(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  *(_QWORD *)(a3 + 4) = v3;
  *(_WORD *)(a3 + 12) = 2112;
  *(_QWORD *)(a3 + 14) = result;
  *(_WORD *)(a3 + 22) = 2112;
  *(_QWORD *)(a3 + 24) = a2;
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x20u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void _handleKeyBagNotification(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "handleKeyBagLockNotification");

}

void *initMKBDeviceUnlockedSinceBoot()
{
  void *result;
  void *v1;
  uint64_t (*v2)();

  result = MobileKeyBagLibrary();
  if (result)
  {
    v1 = MobileKeyBagLibrary();
    v2 = (uint64_t (*)())dlsym(v1, "MKBDeviceUnlockedSinceBoot");
    softLinkMKBDeviceUnlockedSinceBoot = v2;
    if (!v2)
    {
      NSLog(CFSTR("Failed to softlink function MKBDeviceUnlockedSinceBoot"));
      v2 = softLinkMKBDeviceUnlockedSinceBoot;
    }
    return (void *)v2();
  }
  return result;
}

void *MobileKeyBagLibrary()
{
  void *result;

  result = (void *)MobileKeyBagLibrary_frameworkLibrary;
  if (!MobileKeyBagLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag", 2);
    MobileKeyBagLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(CFSTR("Failed to open framework /System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag"));
      return (void *)MobileKeyBagLibrary_frameworkLibrary;
    }
  }
  return result;
}

uint64_t initMGCopyAnswer(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)();

  if (MobileGestaltLibrary_sOnce != -1)
    dispatch_once(&MobileGestaltLibrary_sOnce, &__block_literal_global_36);
  if (!MobileGestaltLibrary_sLib)
    return 0;
  v4 = (uint64_t (*)())dlsym((void *)MobileGestaltLibrary_sLib, "MGCopyAnswer");
  softLinkMGCopyAnswer = v4;
  if (!v4)
  {
    NSLog(CFSTR("Failed to softlink function MGCopyAnswer"));
    v4 = softLinkMGCopyAnswer;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

uint64_t initMGGetBoolAnswer(uint64_t a1)
{
  uint64_t (*v2)();

  if (MobileGestaltLibrary_sOnce != -1)
    dispatch_once(&MobileGestaltLibrary_sOnce, &__block_literal_global_36);
  if (!MobileGestaltLibrary_sLib)
    return 0;
  v2 = (uint64_t (*)())dlsym((void *)MobileGestaltLibrary_sLib, "MGGetBoolAnswer");
  softLinkMGGetBoolAnswer = v2;
  if (!v2)
  {
    NSLog(CFSTR("Failed to softlink function MGGetBoolAnswer"));
    v2 = softLinkMGGetBoolAnswer;
  }
  return ((uint64_t (*)(uint64_t))v2)(a1);
}

id _homeDirectory()
{
  if (_homeDirectory_once_token != -1)
    dispatch_once(&_homeDirectory_once_token, &__block_literal_global_46);
  return (id)_homeDirectory_directory;
}

void ___homeDirectory_block_invoke()
{
  uint64_t v0;
  void *v1;

  softLinkCPSharedResourcesDirectory();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_homeDirectory_directory;
  _homeDirectory_directory = v0;

}

void *initCPSharedResourcesDirectory()
{
  void *result;
  void *v1;
  uint64_t (*v2)();

  result = AppSupportLibrary();
  if (result)
  {
    v1 = AppSupportLibrary();
    v2 = (uint64_t (*)())dlsym(v1, "CPSharedResourcesDirectory");
    softLinkCPSharedResourcesDirectory = v2;
    if (!v2)
    {
      NSLog(CFSTR("Failed to softlink function CPSharedResourcesDirectory"));
      v2 = softLinkCPSharedResourcesDirectory;
    }
    return (void *)v2();
  }
  return result;
}

void *AppSupportLibrary()
{
  void *result;

  result = (void *)AppSupportLibrary_frameworkLibrary;
  if (!AppSupportLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/AppSupport.framework/AppSupport", 2);
    AppSupportLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(CFSTR("Failed to open framework /System/Library/PrivateFrameworks/AppSupport.framework/AppSupport"));
      return (void *)AppSupportLibrary_frameworkLibrary;
    }
  }
  return result;
}

void sub_21DFF9C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFFAB80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_21DFFB614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFFBB78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFFBCD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21DFFC4B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21DFFCAB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id _KSGetSetting(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v4 = a1;
  +[_KSTextReplacementHelper fetchConfigurationPlistIfNeeded](_KSTextReplacementHelper, "fetchConfigurationPlistIfNeeded");
  v5 = objc_alloc(MEMORY[0x24BDBCF50]);
  +[_KSUtilities userDefaultsSuiteName](_KSUtilities, "userDefaultsSuiteName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithSuiteName:", v6);
  objc_msgSend(v7, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v9 = v8;
  else
    v9 = v3;
  v10 = v9;

  return v10;
}

ssize_t WritePadding(ssize_t __fd, uint64_t a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  size_t v5;
  _QWORD __buf[3];

  __buf[2] = *MEMORY[0x24BDAC8D0];
  v2 = (a2 + 7) & 0xFFFFFFFFFFFFFFF8;
  v3 = v2 - a2;
  if (v2 != a2)
  {
    v4 = __fd;
    __buf[0] = 0;
    __buf[1] = 0;
    do
    {
      if (v3 >= 0x10)
        v5 = 16;
      else
        v5 = v3;
      __fd = write(v4, __buf, v5);
      v3 -= v5;
    }
    while (v3);
  }
  return __fd;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_21DFFFEA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E000080(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18)
{
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  _Block_object_dispose(&a18, 8);
  objc_destroyWeak((id *)(v19 - 40));
  _Unwind_Resume(a1);
}

void sub_21E000AF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  id *v34;

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E000EFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_21E0011B8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_21E001564(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_21E001848(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_21E001B30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_21E0022F8(_Unwind_Exception *exception_object, int a2)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;

  if (a2 == 1)
  {
    v4 = objc_begin_catch(exception_object);
    KSCategory();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      +[_KSUserWordsInfo filesForLanguage:].cold.1(v2, (uint64_t)v4, v5);

    objc_end_catch();
    JUMPOUT(0x21E0022A8);
  }
  _Unwind_Resume(exception_object);
}

id FindEntry(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  id v7;
  _QWORD v9[4];
  id v10;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hasSuffix:", v4);

  if (v6)
  {
    v7 = v3;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __FindEntry_block_invoke;
      v9[3] = &unk_24E205990;
      v10 = v4;
      objc_msgSend(v3, "findEntryWithComparison:recursively:", v9, 0);
      v7 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id _KSTextReplacementServerInterface()
{
  void *v0;
  void *v1;
  void *v2;
  _QWORD v4[5];

  v4[4] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2553B8EB0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 4);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_addEntries_removeEntries_withReply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_addEntries_removeEntries_withReply_, 1, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_addEntries_removeEntries_withReply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_cancelPendingUpdatesWithReply_, 1, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_queryTextReplacementEntriesWithReply_, 0, 1);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_queryTextReplacementsWithPredicate_reply_, 0, 0);
  objc_msgSend(v0, "setClasses:forSelector:argumentIndex:ofReply:", v2, sel_queryTextReplacementsWithPredicate_reply_, 0, 1);

  return v0;
}

void sub_21E00357C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_21E004690(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E005358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E0057BC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_21E00608C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E0063CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E007444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E007644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E007EB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  id *v32;
  uint64_t v33;

  objc_destroyWeak(v32);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose((const void *)(v33 - 248), 8);
  _Block_object_dispose((const void *)(v33 - 200), 8);
  objc_destroyWeak((id *)(v33 - 152));
  _Unwind_Resume(a1);
}

void sub_21E0081A8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21E009DE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,id location,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  id *v34;
  uint64_t v35;

  objc_destroyWeak(v34);
  _Block_object_dispose(&a21, 8);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v35 - 184), 8);
  _Unwind_Resume(a1);
}

void sub_21E00B0B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_21E00B3BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *initBRDaemonConnectionInvalidate()
{
  void *result;
  void *v1;
  uint64_t (*v2)();

  result = CloudDocsLibrary();
  if (result)
  {
    v1 = CloudDocsLibrary();
    v2 = (uint64_t (*)())dlsym(v1, "BRDaemonConnectionInvalidate");
    softLinkBRDaemonConnectionInvalidate = v2;
    if (!v2)
    {
      NSLog(CFSTR("Failed to softlink function BRDaemonConnectionInvalidate"));
      v2 = softLinkBRDaemonConnectionInvalidate;
    }
    return (void *)v2();
  }
  return result;
}

void *CloudDocsLibrary()
{
  void *result;

  result = (void *)CloudDocsLibrary_frameworkLibrary;
  if (!CloudDocsLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs", 2);
    CloudDocsLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(CFSTR("Failed to open framework /System/Library/PrivateFrameworks/CloudDocs.framework/CloudDocs"));
      return (void *)CloudDocsLibrary_frameworkLibrary;
    }
  }
  return result;
}

void bySetupAssistantExited(__CFNotificationCenter *a1, void *a2, const __CFString *a3)
{
  id v5;
  id v6;

  v5 = a2;
  CFNotificationCenterRemoveObserver(a1, v5, a3, 0);
  objc_msgSend(v5, "buddySetupDidFinish");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("_KSTIBuddySetupDidFinishNotification_Private"), 0);

}

void sub_21E00D69C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21E00DFE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21E00E1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id initBYSetupAssistantExitedDarwinNotification()
{
  id v0;
  void *v1;
  id *v2;

  v0 = SetupAssistantLibrary();
  if (v0)
  {
    v1 = SetupAssistantLibrary();
    v2 = (id *)dlsym(v1, "BYSetupAssistantExitedDarwinNotification");
    objc_storeStrong((id *)&constantBYSetupAssistantExitedDarwinNotification, *v2);
    getBYSetupAssistantExitedDarwinNotification = (uint64_t (*)())BYSetupAssistantExitedDarwinNotificationFunction;
    v0 = (id)constantBYSetupAssistantExitedDarwinNotification;
  }
  return v0;
}

void *SetupAssistantLibrary()
{
  void *result;

  result = (void *)SetupAssistantLibrary_frameworkLibrary;
  if (!SetupAssistantLibrary_frameworkLibrary)
  {
    result = dlopen("/System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant", 2);
    SetupAssistantLibrary_frameworkLibrary = (uint64_t)result;
    if (!result)
    {
      NSLog(CFSTR("Failed to open framework /System/Library/PrivateFrameworks/SetupAssistant.framework/SetupAssistant"));
      return (void *)SetupAssistantLibrary_frameworkLibrary;
    }
  }
  return result;
}

id BYSetupAssistantExitedDarwinNotificationFunction()
{
  return (id)constantBYSetupAssistantExitedDarwinNotification;
}

void *initBYSetupAssistantNeedsToRun()
{
  void *result;
  void *v1;
  uint64_t (*v2)();

  result = SetupAssistantLibrary();
  if (result)
  {
    v1 = SetupAssistantLibrary();
    v2 = (uint64_t (*)())dlsym(v1, "BYSetupAssistantNeedsToRun");
    softLinkBYSetupAssistantNeedsToRun = v2;
    if (!v2)
    {
      NSLog(CFSTR("Failed to softlink function BYSetupAssistantNeedsToRun"));
      v2 = softLinkBYSetupAssistantNeedsToRun;
    }
    return (void *)v2();
  }
  return result;
}

uint64_t _IsEnabled()
{
  void *v0;
  uint64_t v1;

  _KSGetSetting(ksDefaultEnabled, MEMORY[0x24BDBD1C8]);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLValue");

  return v1;
}

void sub_21E011840(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_21E011B74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t initMGCopyAnswer_0(uint64_t a1, uint64_t a2)
{
  uint64_t (*v4)();

  if (MobileGestaltLibrary_sOnce_0 != -1)
    dispatch_once(&MobileGestaltLibrary_sOnce_0, &__block_literal_global_224);
  if (!MobileGestaltLibrary_sLib_0)
    return 0;
  v4 = (uint64_t (*)())dlsym((void *)MobileGestaltLibrary_sLib_0, "MGCopyAnswer");
  softLinkMGCopyAnswer_0 = v4;
  if (!v4)
  {
    NSLog(CFSTR("Failed to softlink function MGCopyAnswer"));
    v4 = softLinkMGCopyAnswer_0;
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v4)(a1, a2);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t ADClientClearScalarKey()
{
  return MEMORY[0x24BE02958]();
}

uint64_t ADClientPushValueForDistributionKey()
{
  return MEMORY[0x24BE02960]();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x24BE02970]();
}

void CCHmac(CCHmacAlgorithm algorithm, const void *key, size_t keyLength, const void *data, size_t dataLength, void *macOut)
{
  MEMORY[0x24BDAC238](*(_QWORD *)&algorithm, key, keyLength, data, dataLength, macOut);
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC300](data, *(_QWORD *)&len, md);
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x24BE1B278]();
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
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

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MKBDeviceFormattedForContentProtection()
{
  return MEMORY[0x24BE67120]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x24BDD1280]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
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

int closedir(DIR *a1)
{
  return MEMORY[0x24BDAD9F0](a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCB8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
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

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEC8](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

long double exp2(long double __x)
{
  long double result;

  MEMORY[0x24BDAE278](__x);
  return result;
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

ssize_t getxattr(const char *path, const char *name, void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAE798](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

ssize_t listxattr(const char *path, char *namebuff, size_t size, int options)
{
  return MEMORY[0x24BDAEA80](path, namebuff, size, *(_QWORD *)&options);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

int open_dprotected_np(const char *a1, int a2, int a3, int a4, ...)
{
  return MEMORY[0x24BDAF230](a1, *(_QWORD *)&a2, *(_QWORD *)&a3, *(_QWORD *)&a4);
}

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t proc_set_cpumon_defaults()
{
  return MEMORY[0x24BDAF730]();
}

uint64_t proc_set_cpumon_params()
{
  return MEMORY[0x24BDAF738]();
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

dirent *__cdecl readdir(DIR *a1)
{
  return (dirent *)MEMORY[0x24BDAFA88](a1);
}

int setxattr(const char *path, const char *name, const void *value, size_t size, u_int32_t position, int options)
{
  return MEMORY[0x24BDAFD98](path, name, value, size, *(_QWORD *)&position, *(_QWORD *)&options);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x24BDAFEA8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

uint64_t uset_containsAllCodePoints()
{
  return MEMORY[0x24BEDC2F8]();
}

uint64_t uset_openPattern()
{
  return MEMORY[0x24BEDC310]();
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

void xpc_activity_set_criteria(xpc_activity_t activity, xpc_object_t criteria)
{
  MEMORY[0x24BDB0608](activity, criteria);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

void xpc_activity_unregister(const char *identifier)
{
  MEMORY[0x24BDB0620](identifier);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x24BDB06D8](value);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x24BDB0A80](value);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

