void sub_20E4DC860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DCC10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getWBSPrivacyProxyChangeNotification()
{
  id *v0;
  void *v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (id *)getWBSPrivacyProxyChangeNotificationSymbolLoc_ptr;
  v6 = getWBSPrivacyProxyChangeNotificationSymbolLoc_ptr;
  if (!getWBSPrivacyProxyChangeNotificationSymbolLoc_ptr)
  {
    v1 = (void *)SafariSharedUILibrary();
    v0 = (id *)dlsym(v1, "WBSPrivacyProxyChangeNotification");
    v4[3] = (uint64_t)v0;
    getWBSPrivacyProxyChangeNotificationSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getWBSPrivacyProxyChangeNotification_cold_1();
  return *v0;
}

void sub_20E4DCCAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DCE80(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 48));
  _Unwind_Resume(a1);
}

void sub_20E4DD0D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 32));
  _Unwind_Resume(a1);
}

id getWBUHistoryClass()
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
  v0 = (void *)getWBUHistoryClass_softClass;
  v7 = getWBUHistoryClass_softClass;
  if (!getWBUHistoryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getWBUHistoryClass_block_invoke;
    v3[3] = &unk_24C94F880;
    v3[4] = &v4;
    __getWBUHistoryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20E4DD190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DD224(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id get_SFAccountManagerAppearanceValuesClass()
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
  v0 = (void *)get_SFAccountManagerAppearanceValuesClass_softClass;
  v7 = get_SFAccountManagerAppearanceValuesClass_softClass;
  if (!get_SFAccountManagerAppearanceValuesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __get_SFAccountManagerAppearanceValuesClass_block_invoke;
    v3[3] = &unk_24C94F880;
    v3[4] = &v4;
    __get_SFAccountManagerAppearanceValuesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20E4DD604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getWBSHistoryClass()
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
  v0 = (void *)getWBSHistoryClass_softClass;
  v7 = getWBSHistoryClass_softClass;
  if (!getWBSHistoryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getWBSHistoryClass_block_invoke;
    v3[3] = &unk_24C94F880;
    v3[4] = &v4;
    __getWBSHistoryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20E4DD79C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DDBE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getWBSImageUtilitiesClass()
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
  v0 = (void *)getWBSImageUtilitiesClass_softClass;
  v7 = getWBSImageUtilitiesClass_softClass;
  if (!getWBSImageUtilitiesClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getWBSImageUtilitiesClass_block_invoke;
    v3[3] = &unk_24C94F880;
    v3[4] = &v4;
    __getWBSImageUtilitiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20E4DDD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DDE80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_20E4DEAEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t getSFScreenScale()
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
  v0 = get_SFScreenScaleSymbolLoc_ptr;
  v7 = get_SFScreenScaleSymbolLoc_ptr;
  if (!get_SFScreenScaleSymbolLoc_ptr)
  {
    v1 = (void *)MobileSafariLibrary();
    v0 = dlsym(v1, "_SFScreenScale");
    v5[3] = (uint64_t)v0;
    get_SFScreenScaleSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
    getSFScreenScale_cold_1();
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

void sub_20E4DEBAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DEF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DF13C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E4DF4E4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20E4DF964(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E4DFA2C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id iconForApplicationProxy(void *a1)
{
  id v1;
  double v2;
  double v3;
  unsigned int v4;
  uint64_t v5;
  void *v6;
  CGImage *v7;
  void *v8;

  v1 = a1;
  getSFScreenScale();
  v3 = v2;
  if (v2 >= 2.0)
    v4 = 15;
  else
    v4 = 0;
  if (v2 >= 3.0)
    v5 = 32;
  else
    v5 = v4;
  objc_msgSend(v1, "iconDataForVariant:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (CGImage *)LICreateIconFromCachedBitmap();
    if (v7)
    {
      objc_msgSend(MEMORY[0x24BEBD640], "imageWithCGImage:scale:orientation:", v7, 0, v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }
    CGImageRelease(v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t MobileSafariLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!MobileSafariLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24C94F8A0;
    v3 = 0;
    MobileSafariLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!MobileSafariLibraryCore_frameworkLibrary)
    MobileSafariLibrary_cold_1(&v1);
  return MobileSafariLibraryCore_frameworkLibrary;
}

Class __getWBSCacheClass_block_invoke(uint64_t a1)
{
  Class result;

  SafariSharedLibrary();
  result = objc_getClass("WBSCache");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWBSCacheClass_block_invoke_cold_1();
  getWBSCacheClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SafariSharedLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!SafariSharedLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24C94F8B8;
    v2 = 0;
    SafariSharedLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SafariSharedLibraryCore_frameworkLibrary)
    SafariSharedLibrary_cold_1(&v0);
}

Class __getWBSPrivacyProxyAvailabilityManagerClass_block_invoke(uint64_t a1)
{
  Class result;

  SafariSharedUILibrary();
  result = objc_getClass("WBSPrivacyProxyAvailabilityManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWBSPrivacyProxyAvailabilityManagerClass_block_invoke_cold_1();
  getWBSPrivacyProxyAvailabilityManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SafariSharedUILibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SafariSharedUILibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24C94F8D0;
    v3 = 0;
    SafariSharedUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SafariSharedUILibraryCore_frameworkLibrary)
    SafariSharedUILibrary_cold_1(&v1);
  return SafariSharedUILibraryCore_frameworkLibrary;
}

Class __getWBUHistoryClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!WebUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C94F8E8;
    v5 = 0;
    WebUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!WebUILibraryCore_frameworkLibrary)
    __getWBUHistoryClass_block_invoke_cold_1(&v3);
  result = objc_getClass("WBUHistory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWBUHistoryClass_block_invoke_cold_2();
  getWBUHistoryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getWBSHistoryClass_block_invoke(uint64_t a1)
{
  Class result;

  SafariSharedLibrary();
  result = objc_getClass("WBSHistory");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWBSHistoryClass_block_invoke_cold_1();
  getWBSHistoryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getWBSImageUtilitiesClass_block_invoke(uint64_t a1)
{
  Class result;

  SafariSharedUILibrary();
  result = objc_getClass("WBSImageUtilities");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWBSImageUtilitiesClass_block_invoke_cold_1();
  getWBSImageUtilitiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getWBSTouchIconResponseClass_block_invoke(uint64_t a1)
{
  Class result;

  SafariSharedUILibrary();
  result = objc_getClass("WBSTouchIconResponse");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWBSTouchIconResponseClass_block_invoke_cold_1();
  getWBSTouchIconResponseClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getWBSTouchIconCacheClass_block_invoke(uint64_t a1)
{
  Class result;

  SafariSharedUILibrary();
  result = objc_getClass("WBSTouchIconCache");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getWBSTouchIconCacheClass_block_invoke_cold_1();
  getWBSTouchIconCacheClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_20E4E08E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E4E19C4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20E4E1B20(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20E4E26D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

id OUTLINED_FUNCTION_2_0(id a1)
{
  return a1;
}

uint64_t OUTLINED_FUNCTION_3_0()
{
  uint64_t v0;

  return v0;
}

void sub_20E4E5794(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getAAUIProfilePictureStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!AppleAccountUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24C94FD20;
    v5 = 0;
    AppleAccountUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!AppleAccountUILibraryCore_frameworkLibrary)
    __getAAUIProfilePictureStoreClass_block_invoke_cold_1(&v3);
  result = objc_getClass("AAUIProfilePictureStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getAAUIProfilePictureStoreClass_block_invoke_cold_2();
  getAAUIProfilePictureStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_20E4E9E88(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 128));
  _Unwind_Resume(a1);
}

void sub_20E4EA168(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E4EA228(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20E4EA48C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E4EB3E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E4EB51C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_20E4EB690(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_20E4EB924(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_20E4EBA98(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_2_2(uint64_t a1, void *a2)
{
  return a2;
}

void sub_20E4EC960(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E4EF148(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20E4EF268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  void *v7;
  void *v8;
  va_list va;

  va_start(va, a7);

  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E4EF324(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_20E4EF3B0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E4EF410(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E4EF474(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E4EF8C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

id getWBSPrivacyProxyAvailabilityManagerClass(void)
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
  v0 = (void *)getWBSPrivacyProxyAvailabilityManagerClass(void)::softClass;
  v7 = getWBSPrivacyProxyAvailabilityManagerClass(void)::softClass;
  if (!getWBSPrivacyProxyAvailabilityManagerClass(void)::softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = ___ZL42getWBSPrivacyProxyAvailabilityManagerClassv_block_invoke;
    v3[3] = &unk_24C9505E8;
    v3[4] = &v4;
    ___ZL42getWBSPrivacyProxyAvailabilityManagerClassv_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20E4EF9F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20E4EFB70(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E4EFC58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10)
{
  a10.super_class = (Class)_ASWebsiteNameProvider;
  -[_Unwind_Exception dealloc](&a10, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_20E4EFD44(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20E4EFF40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, id location)
{
  void *v16;
  void *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

  _Unwind_Resume(a1);
}

void sub_20E4EFFEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20E4F0198(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13)
{
  void *v13;
  void *v14;

  _Unwind_Resume(a1);
}

void sub_20E4F0294(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  v3 = v2;

  _Unwind_Resume(a1);
}

void sub_20E4F0360(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E4F0594(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, void *a9, void *a10)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_20E4F0798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, void *a15)
{
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  _Unwind_Resume(a1);
}

void sub_20E4F09AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E4F0AF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E4F0CB8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E4F0FBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _Unwind_Exception *exception_object)
{
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  _Unwind_Resume(a1);
}

void sub_20E4F10A8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E4F1114(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_20E4F16EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, uint64_t a13, uint64_t a14, void *a15, void *a16)
{
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  _Unwind_Resume(a1);
}

void sub_20E4F1A74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E4F1DEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, void *a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  void *v40;
  uint64_t v41;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v41 - 152), 8);

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

void sub_20E4F1F4C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;
  void *v12;

  v12 = v11;

  _Unwind_Resume(a1);
}

id SafariShared::WBSSQLiteDatabaseFetch<NSString * const {__strong}&>(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;

  v5 = a1;
  v6 = a2;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE82D98]), "initWithDatabase:query:", v5, v6);
  objc_msgSend(v7, "bindString:atParameterIndex:", *a3, 1);
  objc_msgSend(v7, "fetch");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_20E4F1FFC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_20E4F2278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;

  _Unwind_Resume(a1);
}

void sub_20E4F2498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, void *a14)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  _Unwind_Resume(a1);
}

void sub_20E4F2584(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_20E4F26BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_20E4F27EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void ___ZL35isProcessAllowedToFetchWebsiteNamesv_block_invoke()
{
  void *v0;
  id v1;

  objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "bundleIdentifier");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  isProcessAllowedToFetchWebsiteNames(void)::isProcessAllowedToFetchWebsiteNames = objc_msgSend(v0, "isEqualToString:", *MEMORY[0x24BE82F68]);

}

void sub_20E4F2A90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void ___ZL42getWBSPrivacyProxyAvailabilityManagerClassv_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SafariSharedUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("WBSPrivacyProxyAvailabilityManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getWBSPrivacyProxyAvailabilityManagerClass(void)::softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                            + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBSPrivacyProxyAvailabilityManagerClass()_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASSafariSharedUISoftLinking.h"), 23, CFSTR("Unable to find class %s"), "WBSPrivacyProxyAvailabilityManager");

    __break(1u);
  }
}

void sub_20E4F2B74(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void *SafariSharedUILibrary(void)
{
  void *v0;
  void *v2;
  void *v3;

  if (!SafariSharedUILibraryCore(char **)::frameworkLibrary)
    SafariSharedUILibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v0 = (void *)SafariSharedUILibraryCore(char **)::frameworkLibrary;
  if (!SafariSharedUILibraryCore(char **)::frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariSharedUILibrary()");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASSafariSharedUISoftLinking.h"), 6, CFSTR("%s"), 0);

    __break(1u);
    free(v2);
  }
  return v0;
}

void sub_20E4F2C98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *a10, _Unwind_Exception *exception_object)
{
  void *v11;

  _Unwind_Resume(a1);
}

uint64_t __deviceAlertStyle_block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x24BE0B290], "isPad");
  deviceAlertStyle_style = result;
  return result;
}

void sub_20E4F52D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_20E4F59DC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void _ASAuthorizationButtonInitialize(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v14[4] = *MEMORY[0x24BDAC8D0];
  v1 = (void *)MEMORY[0x24BEBD4B8];
  v2 = a1;
  objc_msgSend(v1, "clearColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackgroundColor:", v3);

  v4 = (void *)MEMORY[0x24BDD1628];
  objc_msgSend(v2, "widthAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintGreaterThanOrEqualToConstant:", 130.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v6;
  objc_msgSend(v2, "widthAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "constraintLessThanOrEqualToConstant:", 375.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(v2, "heightAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintGreaterThanOrEqualToConstant:", 30.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v10;
  objc_msgSend(v2, "heightAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintLessThanOrEqualToConstant:", 64.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activateConstraints:", v13);

}

void sub_20E4FA030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
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

void sub_20E4FB5A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id OUTLINED_FUNCTION_4(uint64_t a1, void *a2)
{
  return a2;
}

NSArray *ASAuthorizationAllSupportedPublicKeyCredentialDescriptorTransports(void)
{
  _QWORD v1[4];

  v1[3] = *MEMORY[0x24BDAC8D0];
  v1[0] = CFSTR("usb");
  v1[1] = CFSTR("nfc");
  v1[2] = CFSTR("ble");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v1, 3);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

void *asTransportToWKTransport(void *a1)
{
  id v1;
  void *v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("usb")) & 1) != 0)
  {
    v2 = &unk_24C96E008;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("nfc")) & 1) != 0)
  {
    v2 = &unk_24C96E020;
  }
  else
  {
    v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v1;
      _os_log_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_DEFAULT, "Device does not support transport: %{public}@. Ignoring.", (uint8_t *)&v5, 0xCu);
    }
    v2 = 0;
  }

  return v2;
}

id safariCredentialIdentitiesFromCredentialIdentities(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v5;
  _BOOL8 v6;
  objc_class *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  objc_class *v17;
  id v18;
  uint64_t v20;
  id obj;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v1;
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v26)
  {
    v2 = *(_QWORD *)v29;
    v20 = *(_QWORD *)v29;
    do
    {
      v3 = 0;
      do
      {
        if (*(_QWORD *)v29 != v2)
          objc_enumerationMutation(obj);
        v4 = *(id *)(*((_QWORD *)&v28 + 1) + 8 * v3);
        objc_msgSend(v4, "serviceIdentifier");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "type") == 1;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v27 = v5;
          v7 = (objc_class *)MEMORY[0x24BE83050];
          v8 = v4;
          v24 = [v7 alloc];
          objc_msgSend(v27, "identifier");
          v23 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "recordIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "user");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v22 = objc_msgSend(v8, "rank");
          objc_msgSend(v8, "credentialID");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "base64EncodedStringWithOptions:", 0);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "userHandle");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "base64EncodedStringWithOptions:", 0);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)v23;
          v16 = (void *)objc_msgSend(v24, "initWithServiceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:credentialID:userHandle:", v23, v6, v9, v10, v22, v12, v14);

          v2 = v20;
          v5 = v27;

        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v17 = (objc_class *)MEMORY[0x24BE83040];
          else
            v17 = (objc_class *)MEMORY[0x24BE83058];
          v18 = [v17 alloc];
          objc_msgSend(v5, "identifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "recordIdentifier");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "user");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend(v18, "initWithServiceIdentifier:serviceIdentifierType:externalRecordIdentifier:user:rank:", v15, v6, v9, v10, objc_msgSend(v4, "rank"));
        }

        objc_msgSend(v25, "addObject:", v16);
        ++v3;
      }
      while (v26 != v3);
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v26);
  }

  return v25;
}

id credentialIdentityStoreErrorFromSFExternalCredentialIdentityStoreError(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;

  if (a1)
  {
    v1 = a1;
    v2 = objc_msgSend(v1, "code");
    if (v2 == 1)
      v3 = 1;
    else
      v3 = 2 * (v2 == 2);
    v4 = (void *)MEMORY[0x24BDD1540];
    objc_msgSend(v1, "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("ASCredentialIdentityStoreErrorDomain"), v3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_20E504510(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20E5045A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20E504694(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20E50474C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20E50A10C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id qrCodeContentsColor()
{
  void *v0;
  void *v1;
  void *v2;

  v0 = (void *)MEMORY[0x24BEBD4B8];
  objc_msgSend(MEMORY[0x24BDD1488], "as_authenticationServicesBundle");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CABLEQRCodeContentsColor"), v1, 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_20E510CAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t isUserVerificationConfigured()
{
  id v0;
  uint64_t v1;
  uint64_t v3;

  v0 = objc_alloc_init(MEMORY[0x24BDDA938]);
  v3 = 0;
  v1 = objc_msgSend(v0, "canEvaluatePolicy:error:", 2, &v3);

  return v1;
}

void sub_20E51C624(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

uint64_t WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent()
{
  if (WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent_onceToken, &__block_literal_global_27);
  return WBS_LOG_CHANNEL_PREFIXAuthenticationServicesAgent_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAuthenticationSession()
{
  if (WBS_LOG_CHANNEL_PREFIXAuthenticationSession_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAuthenticationSession_onceToken, &__block_literal_global_3);
  return WBS_LOG_CHANNEL_PREFIXAuthenticationSession_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAuthorization()
{
  if (WBS_LOG_CHANNEL_PREFIXAuthorization_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAuthorization_onceToken, &__block_literal_global_5);
  return WBS_LOG_CHANNEL_PREFIXAuthorization_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_onceToken, &__block_literal_global_7_1);
  return WBS_LOG_CHANNEL_PREFIXCredentialProviderExtension_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasskeys()
{
  if (WBS_LOG_CHANNEL_PREFIXPasskeys_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasskeys_onceToken, &__block_literal_global_11);
  return WBS_LOG_CHANNEL_PREFIXPasskeys_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordManager()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordManager_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordManager_onceToken, &__block_literal_global_13_1);
  return WBS_LOG_CHANNEL_PREFIXPasswordManager_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXPasswordsIcons()
{
  if (WBS_LOG_CHANNEL_PREFIXPasswordsIcons_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXPasswordsIcons_onceToken, &__block_literal_global_15_0);
  return WBS_LOG_CHANNEL_PREFIXPasswordsIcons_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider()
{
  if (WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider_onceToken, &__block_literal_global_19);
  return WBS_LOG_CHANNEL_PREFIXWebsiteNameProvider_log;
}

uint64_t WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension()
{
  if (WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_onceToken != -1)
    dispatch_once(&WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_onceToken, &__block_literal_global_21);
  return WBS_LOG_CHANNEL_PREFIXAccountAuthenticationModificationExtension_log;
}

id identifierForAssertionResponse(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(v1, "credentialID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "base64EncodedStringWithOptions:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_alloc(MEMORY[0x24BE82D78]);
  objc_msgSend(v1, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)objc_msgSend(v4, "initWithCredentialID:groupID:", v3, v5);
  return v6;
}

void sub_20E525274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a58, 8);
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

uint64_t wkAttestationPreferenceFromString(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("none")) & 1) == 0)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("indirect")) & 1) != 0)
    {
      v2 = 1;
      goto LABEL_9;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("direct")) & 1) != 0)
    {
      v2 = 2;
      goto LABEL_9;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("enterprise")) & 1) != 0)
    {
      v2 = 3;
      goto LABEL_9;
    }
    v4 = WBS_LOG_CHANNEL_PREFIXAuthorization();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = v1;
      _os_log_impl(&dword_20E4D9000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring unknown attestation preference \"%{public}@\"", (uint8_t *)&v5, 0xCu);
    }
  }
  v2 = 0;
LABEL_9:

  return v2;
}

id ascCredentialDescriptorToWKDescriptor(void *a1, int a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a1;
  v4 = objc_alloc(MEMORY[0x24BDFA988]);
  objc_msgSend(v3, "credentialID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithIdentifier:", v5);

  if (a2)
  {
    objc_msgSend(v6, "setTransports:", &unk_24C96DFA8);
  }
  else
  {
    objc_msgSend(v3, "transports");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_297_0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setTransports:", v8);

    }
  }

  return v6;
}

uint64_t wkUserVerificationRequirementFromString(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("required")) & 1) == 0)
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("preferred")) & 1) == 0)
    {
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("discouraged")) & 1) != 0)
      {
        v2 = 2;
        goto LABEL_9;
      }
      v3 = WBS_LOG_CHANNEL_PREFIXAuthorization();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        v5 = 138543362;
        v6 = v1;
        _os_log_impl(&dword_20E4D9000, v3, OS_LOG_TYPE_DEFAULT, "Ignoring unknown user verification preference \"%{public}@\"", (uint8_t *)&v5, 0xCu);
      }
    }
    v2 = 1;
    goto LABEL_9;
  }
  v2 = 0;
LABEL_9:

  return v2;
}

void __shouldUseAssertionResponseForSignIn_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.webkit.webauthn"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)shouldUseAssertionResponseForSignIn_allowedAccessGroups;
  shouldUseAssertionResponseForSignIn_allowedAccessGroups = v0;

}

id wkAttachmentToASAttachment(id a1)
{
  if ((unint64_t)a1 <= 2)
    a1 = **((id **)&unk_24C951F28 + (_QWORD)a1);
  return a1;
}

void *__ascCredentialDescriptorToWKDescriptor_block_invoke(uint64_t a1, void *a2)
{
  return asTransportToWKTransport(a2);
}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_20E52CFF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSFAuthenticationSessionClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SafariServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24C952058;
    v5 = 0;
    SafariServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SafariServicesLibraryCore_frameworkLibrary_0)
    __getSFAuthenticationSessionClass_block_invoke_cold_1(&v3);
  result = objc_getClass("SFAuthenticationSession");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSFAuthenticationSessionClass_block_invoke_cold_2();
  getSFAuthenticationSessionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t AuthenticationServicesAgentMain()
{
  void *v0;
  ASPublicKeyCredentialManager *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _ASAgentCredentialSharingGroupsListener *v8;
  void *v9;
  _ASAgentPeriodicMaintenanceActivity *v10;
  void *v11;

  v0 = (void *)MEMORY[0x212BBEE3C]();
  v1 = objc_alloc_init(ASPublicKeyCredentialManager);
  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BE0B1F0]), "initWithPublicKeyCredentialManager:", v1);
  v3 = (void *)agentListener;
  agentListener = v2;

  v4 = objc_alloc(MEMORY[0x24BE0B1E8]);
  objc_msgSend((id)agentListener, "signInEventCollector");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithPublicKeyCredentialManager:signInEventCollector:", v1, v5);
  v7 = (void *)autoFillListener;
  autoFillListener = v6;

  v8 = objc_alloc_init(_ASAgentCredentialSharingGroupsListener);
  v9 = (void *)credentialSharingGroupsListener;
  credentialSharingGroupsListener = (uint64_t)v8;

  v10 = objc_alloc_init(_ASAgentPeriodicMaintenanceActivity);
  v11 = (void *)periodicMaintenanceActivity;
  periodicMaintenanceActivity = (uint64_t)v10;

  objc_autoreleasePoolPop(v0);
  WBSRunLoopRunUntilTerminationSignal();
  return 0;
}

uint64_t ASPasskeyAssertionCredentialExtensionInput.largeBlob.getter@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  uint64_t v17;
  unint64_t v18;
  int v19;
  uint64_t v20;

  v2 = sub_20E556FC0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (uint64_t *)((char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - v7;
  v9 = sub_20E556FE4();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28EF8);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E556FF0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9))
  {
    result = sub_20E52E370((uint64_t)v15, &qword_254A28EF8);
    v17 = 0;
    v18 = 0xB000000000000000;
LABEL_8:
    *a1 = v17;
    a1[1] = v18;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
  sub_20E52E370((uint64_t)v15, &qword_254A28EF8);
  sub_20E556FD8();
  (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v19 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v6, v2);
  if (v19 == *MEMORY[0x24BE0AFA8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    v17 = *v6;
    v18 = v6[1];
LABEL_7:
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_8;
  }
  if (v19 == *MEMORY[0x24BE0AFA0])
  {
    v17 = 0;
    v18 = 0xF000000000000000;
    goto LABEL_7;
  }
  result = sub_20E5574F4();
  __break(1u);
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BBF2D4]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t ASPasskeyAssertionCredentialExtensionInput.prf.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  _QWORD v25[2];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)v25 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20E556F9C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F08);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E556FA8();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5))
  {
    result = sub_20E52E370((uint64_t)v11, &qword_254A28F08);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_QWORD *)(a1 + 32) = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    sub_20E52E370((uint64_t)v11, &qword_254A28F08);
    sub_20E556F90();
    v13 = sub_20E556F78();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v4, 1, v13) == 1)
    {
      sub_20E52E370((uint64_t)v4, &qword_254A28F00);
      v15 = 0;
      v16 = 0;
      v25[0] = 0;
      v17 = 0xF000000000000000;
    }
    else
    {
      v15 = sub_20E556F48();
      v17 = v18;
      v19 = sub_20E556F54();
      v25[0] = v20;
      v21 = *(void (**)(char *, uint64_t))(v14 + 8);
      v16 = v19;
      v21(v4, v13);
    }
    v22 = sub_20E556F30();
    if (v22)
    {
      v23 = sub_20E52F1F0(v22);
      swift_bridgeObjectRelease();
    }
    else
    {
      v23 = 0;
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a1 = v15;
    *(_QWORD *)(a1 + 8) = v17;
    v24 = v25[0];
    *(_QWORD *)(a1 + 16) = v16;
    *(_QWORD *)(a1 + 24) = v24;
    *(_QWORD *)(a1 + 32) = v23;
  }
  return result;
}

uint64_t sub_20E52E370(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

void ASPasskeyAssertionCredentialExtensionInput.init(largeBlob:prf:)(uint64_t *a1@<X0>, uint64_t *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  _QWORD *v25;
  unsigned int *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD *v38;
  char *v39;

  v38 = a3;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v5);
  v39 = (char *)&v35 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F08);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20E556FC0();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (unint64_t *)((char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28EF8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v35 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = *a1;
  v17 = a1[1];
  v19 = *a2;
  v20 = a2[1];
  v36 = a2[2];
  v37 = v19;
  v21 = a2[4];
  v35 = a2[3];
  v22 = objc_msgSend(objc_allocWithZone((Class)sub_20E557008()), sel_init);
  if (v17 >> 60 == 11)
  {
    v23 = sub_20E556FE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v16, 1, 1, v23);
    v24 = v22;
    v25 = v38;
  }
  else
  {
    if (v17 >> 60 == 15)
    {
      v26 = (unsigned int *)MEMORY[0x24BE0AFA0];
    }
    else
    {
      *v13 = v18;
      v13[1] = v17;
      v26 = (unsigned int *)MEMORY[0x24BE0AFA8];
    }
    v25 = v38;
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v11 + 104))(v13, *v26, v10);
    v27 = v22;
    sub_20E556FCC();
    v28 = sub_20E556FE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v16, 0, 1, v28);
  }
  sub_20E556FFC();
  if (v21 != 1)
  {
    if (v20 >> 60 == 15)
    {
      v30 = sub_20E556F78();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v39, 1, 1, v30);
      v31 = v35;
      if (!v21)
      {
LABEL_13:
        sub_20E556F84();
        sub_20E52F480(v37, v20, v36, v31, v21);
        v34 = sub_20E556F9C();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 56))(v9, 0, 1, v34);
        goto LABEL_14;
      }
    }
    else
    {
      sub_20E52F7E4(v37, v20);
      v31 = v35;
      sub_20E52F828(v36, v35);
      v32 = v39;
      sub_20E556F3C();
      v33 = sub_20E556F78();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v33 - 8) + 56))(v32, 0, 1, v33);
      if (!v21)
        goto LABEL_13;
    }
    sub_20E52F544(v21);
    goto LABEL_13;
  }
  v29 = sub_20E556F9C();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v9, 1, 1, v29);
LABEL_14:
  sub_20E556FB4();

  *v25 = v22;
}

uint64_t ASPasskeyAssertionCredentialExtensionInput.init(coreExtensions:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void __swiftcall ASPasskeyAssertionCredentialExtensionInput.toObjC()(ASPasskeyAssertionCredentialExtensionInput *__return_ptr retstr)
{
  _QWORD *v1;

  objc_msgSend(objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionInput), sel_initWithCoreExtensions_, *v1);
}

uint64_t static ASPasskeyAssertionCredentialExtensionInput.supportsSecureCoding.getter()
{
  return 1;
}

id sub_20E52E76C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  id result;
  uint64_t v23;

  v1 = sub_20E556FC0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (uint64_t *)((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23 - v6;
  v8 = sub_20E556FE4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28EF8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(id *)(v0 + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions);
  sub_20E556FF0();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
  {
    sub_20E52E370((uint64_t)v14, &qword_254A28EF8);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_20E52E370((uint64_t)v14, &qword_254A28EF8);
  sub_20E556FD8();
  (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v17 = (*(uint64_t (**)(uint64_t *, uint64_t))(v2 + 88))(v5, v1);
  if (v17 == *MEMORY[0x24BE0AFA8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v2 + 96))(v5, v1);
    v18 = *v5;
    v19 = v5[1];
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v20 = objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput);
    sub_20E52F7E4(v18, v19);
    v16 = objc_msgSend(v20, sel_initWithOperation_, 1);
    v21 = (void *)sub_20E556DA4();
    objc_msgSend(v16, sel_setDataToWrite_, v21);

    sub_20E52F4EC(v18, v19);
    sub_20E52F4EC(v18, v19);
    return v16;
  }
  if (v17 == *MEMORY[0x24BE0AFA0])
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput), sel_initWithOperation_, 0);
  }
  result = (id)sub_20E5574F4();
  __break(1u);
  return result;
}

void __swiftcall ASPasskeyAssertionCredentialExtensionInput.init(coder:)(ASPasskeyAssertionCredentialExtensionInput_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id ASPasskeyAssertionCredentialExtensionInput.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = v1;
  sub_20E557008();
  v4 = sub_20E557398();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = objc_msgSend(v2, sel_initWithCoreExtensions_, v4);

  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v6;
}

Swift::Void __swiftcall ASPasskeyAssertionCredentialExtensionInput.encode(with:)(NSCoder with)
{
  uint64_t v1;
  id v3;
  id v4;

  v3 = *(id *)(v1 + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions);
  v4 = (id)sub_20E5572A8();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

}

void __swiftcall ASPasskeyAssertionCredentialExtensionInput.init()(ASPasskeyAssertionCredentialExtensionInput *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id ASPasskeyAssertionCredentialExtensionInput.init()()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions;
  v2 = objc_allocWithZone((Class)sub_20E557008());
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)ASPasskeyAssertionCredentialExtensionInput;
  return objc_msgSendSuper2(&v5, sel_init);
}

BOOL sub_20E52EEFC(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_20E52EF10@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_20E52EF20(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_20E52EF2C(uint64_t a1)
{
  MEMORY[0x212BBF2EC](&unk_20E55EB24, a1);
  return sub_20E556E34();
}

uint64_t sub_20E52EF68()
{
  MEMORY[0x212BBF2EC](&unk_20E55EB24);
  return sub_20E556E28();
}

uint64_t sub_20E52EFB0(uint64_t a1, uint64_t a2)
{
  sub_20E5575A8();
  MEMORY[0x212BBF2EC](&unk_20E55EB24, a2);
  sub_20E556E28();
  return sub_20E5575C0();
}

uint64_t sub_20E52F008()
{
  return sub_20E55732C();
}

uint64_t sub_20E52F010(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x212BBE74C](a1, &v6);
  v4 = v6;
  v5 = v7;
  if (v7)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_20E52F060(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = sub_20E557344();
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_20E52F0B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_20E557350();
  *a1 = result;
  return result;
}

uint64_t sub_20E52F0D8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  MEMORY[0x212BBF2EC](&unk_20E55EB24, a3);
  return sub_20E556E1C();
}

uint64_t sub_20E52F124()
{
  sub_20E52F974(&qword_254A290C0, (uint64_t (*)(uint64_t))type metadata accessor for ASCOSEAlgorithmIdentifier, (uint64_t)&unk_20E55EA58);
  sub_20E52F974(&qword_254A290C8, (uint64_t (*)(uint64_t))type metadata accessor for ASCOSEAlgorithmIdentifier, (uint64_t)&unk_20E55E9F8);
  return sub_20E557548();
}

uint64_t sub_20E52F1B8()
{
  return sub_20E55735C();
}

uint64_t sub_20E52F1C0()
{
  return sub_20E5575B4();
}

uint64_t sub_20E52F1E8()
{
  return sub_20E55759C();
}

_QWORD *sub_20E52F1F0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *result;
  int64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unint64_t i;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int64_t v35;
  _QWORD *v36;
  _QWORD *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int64_t v43;
  uint64_t v44;
  uint64_t v45;

  v2 = sub_20E556F78();
  v39 = *(_QWORD *)(v2 - 8);
  v40 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v38 = (char *)&v33 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29080);
  result = (_QWORD *)sub_20E55750C();
  v5 = 0;
  v41 = a1;
  v8 = *(_QWORD *)(a1 + 64);
  v7 = a1 + 64;
  v6 = v8;
  v9 = 1 << *(_BYTE *)(v7 - 32);
  v10 = -1;
  if (v9 < 64)
    v10 = ~(-1 << v9);
  v11 = v10 & v6;
  v34 = v7;
  v35 = (unint64_t)(v9 + 63) >> 6;
  v36 = result + 8;
  v37 = result;
  v13 = v38;
  v12 = v39;
  v14 = v40;
  if (!v11)
    goto LABEL_5;
LABEL_4:
  v42 = (v11 - 1) & v11;
  v43 = v5;
  for (i = __clz(__rbit64(v11)) | (v5 << 6); ; i = __clz(__rbit64(v17)) + (v18 << 6))
  {
    v20 = (uint64_t *)(*(_QWORD *)(v41 + 48) + 16 * i);
    v21 = *v20;
    v22 = v20[1];
    (*(void (**)(char *, unint64_t, uint64_t))(v12 + 16))(v13, *(_QWORD *)(v41 + 56) + *(_QWORD *)(v12 + 72) * i, v14);
    sub_20E52F7E4(v21, v22);
    v45 = sub_20E556F48();
    v44 = v23;
    v24 = sub_20E556F54();
    v26 = v25;
    (*(void (**)(char *, uint64_t))(v12 + 8))(v13, v14);
    result = v37;
    *(_QWORD *)((char *)v36 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v27 = (uint64_t *)(result[6] + 16 * i);
    *v27 = v21;
    v27[1] = v22;
    v28 = (uint64_t *)(result[7] + 32 * i);
    v29 = v44;
    *v28 = v45;
    v28[1] = v29;
    v28[2] = v24;
    v28[3] = v26;
    v30 = result[2];
    v31 = __OFADD__(v30, 1);
    v32 = v30 + 1;
    if (v31)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    result[2] = v32;
    v11 = v42;
    v5 = v43;
    if (v42)
      goto LABEL_4;
LABEL_5:
    v16 = v5 + 1;
    if (__OFADD__(v5, 1))
      goto LABEL_24;
    if (v16 >= v35)
      return result;
    v17 = *(_QWORD *)(v34 + 8 * v16);
    v18 = v5 + 1;
    if (!v17)
    {
      v18 = v5 + 2;
      if (v5 + 2 >= v35)
        return result;
      v17 = *(_QWORD *)(v34 + 8 * v18);
      if (!v17)
      {
        v18 = v5 + 3;
        if (v5 + 3 >= v35)
          return result;
        v17 = *(_QWORD *)(v34 + 8 * v18);
        if (!v17)
          break;
      }
    }
LABEL_18:
    v42 = (v17 - 1) & v17;
    v43 = v18;
  }
  v19 = v5 + 4;
  if (v5 + 4 >= v35)
    return result;
  v17 = *(_QWORD *)(v34 + 8 * v19);
  if (v17)
  {
    v18 = v5 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v18 = v19 + 1;
    if (__OFADD__(v19, 1))
      break;
    if (v18 >= v35)
      return result;
    v17 = *(_QWORD *)(v34 + 8 * v18);
    ++v19;
    if (v17)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_20E52F480(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a5 != 1)
  {
    sub_20E52F4B0(result, a2, a3, a4);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_20E52F4B0(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_20E52F4EC(result, a2);
    return sub_20E52F530(a3, a4);
  }
  return result;
}

uint64_t sub_20E52F4EC(uint64_t a1, unint64_t a2)
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

uint64_t sub_20E52F530(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20E52F4EC(a1, a2);
  return a1;
}

uint64_t sub_20E52F544(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char *v13;
  unint64_t i;
  int64_t v15;
  unint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  uint64_t v34;
  _QWORD *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int64_t v41;

  v2 = sub_20E556F78();
  v37 = *(_QWORD *)(v2 - 8);
  v38 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v36 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29078);
  result = sub_20E55750C();
  v5 = (_QWORD *)result;
  v6 = 0;
  v39 = a1;
  v9 = *(_QWORD *)(a1 + 64);
  v8 = a1 + 64;
  v7 = v9;
  v10 = 1 << *(_BYTE *)(v8 - 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v7;
  v32 = v8;
  v33 = (unint64_t)(v10 + 63) >> 6;
  v34 = result + 64;
  v35 = (_QWORD *)result;
  v13 = v36;
  if (!v12)
    goto LABEL_5;
LABEL_4:
  v40 = (v12 - 1) & v12;
  v41 = v6;
  for (i = __clz(__rbit64(v12)) | (v6 << 6); ; i = __clz(__rbit64(v16)) + (v17 << 6))
  {
    v19 = (uint64_t *)(*(_QWORD *)(v39 + 48) + 16 * i);
    v20 = *v19;
    v21 = v19[1];
    v22 = (uint64_t *)(*(_QWORD *)(v39 + 56) + 32 * i);
    v23 = *v22;
    v24 = v22[1];
    v25 = v22[2];
    v26 = v22[3];
    sub_20E52F7E4(v20, v21);
    sub_20E52F7E4(v23, v24);
    sub_20E52F828(v25, v26);
    sub_20E556F3C();
    v5 = v35;
    *(_QWORD *)(v34 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v27 = (uint64_t *)(v5[6] + 16 * i);
    *v27 = v20;
    v27[1] = v21;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v37 + 32))(v5[7] + *(_QWORD *)(v37 + 72) * i, v13, v38);
    v28 = v5[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v5[2] = v30;
    v6 = v41;
    v12 = v40;
    if (v40)
      goto LABEL_4;
LABEL_5:
    v15 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_24;
    if (v15 >= v33)
      return (uint64_t)v5;
    v16 = *(_QWORD *)(v32 + 8 * v15);
    v17 = v6 + 1;
    if (!v16)
    {
      v17 = v6 + 2;
      if (v6 + 2 >= v33)
        return (uint64_t)v5;
      v16 = *(_QWORD *)(v32 + 8 * v17);
      if (!v16)
      {
        v17 = v6 + 3;
        if (v6 + 3 >= v33)
          return (uint64_t)v5;
        v16 = *(_QWORD *)(v32 + 8 * v17);
        if (!v16)
          break;
      }
    }
LABEL_18:
    v40 = (v16 - 1) & v16;
    v41 = v17;
  }
  v18 = v6 + 4;
  if (v6 + 4 >= v33)
    return (uint64_t)v5;
  v16 = *(_QWORD *)(v32 + 8 * v18);
  if (v16)
  {
    v17 = v6 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v17 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v17 >= v33)
      return (uint64_t)v5;
    v16 = *(_QWORD *)(v32 + 8 * v17);
    ++v18;
    if (v16)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_20E52F7E4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_retain();
  }
  return swift_retain();
}

uint64_t sub_20E52F828(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_20E52F7E4(a1, a2);
  return a1;
}

ValueMetadata *type metadata accessor for ASPasskeyAssertionCredentialExtensionInput()
{
  return &type metadata for ASPasskeyAssertionCredentialExtensionInput;
}

unint64_t type metadata accessor for ASPasskeyAssertionCredentialExtensionInput()
{
  unint64_t result;

  result = qword_254A29060;
  if (!qword_254A29060)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A29060);
  }
  return result;
}

void type metadata accessor for LABiometryType(uint64_t a1)
{
  sub_20E52F8D8(a1, &qword_254A29068);
}

void type metadata accessor for __ASAuthorizationPublicKeyCredentialLargeBlobSupportRequirement(uint64_t a1)
{
  sub_20E52F8D8(a1, &qword_254A29070);
}

void type metadata accessor for CFString(uint64_t a1)
{
  sub_20E52F8D8(a1, &qword_254A29088);
}

void type metadata accessor for ASCOSEAlgorithmIdentifier(uint64_t a1)
{
  sub_20E52F8D8(a1, &qword_254A29090);
}

void sub_20E52F8D8(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20E52F91C()
{
  return sub_20E52F974(&qword_254A29098, (uint64_t (*)(uint64_t))type metadata accessor for ASCOSEAlgorithmIdentifier, (uint64_t)&unk_20E55E9BC);
}

uint64_t sub_20E52F948()
{
  return sub_20E52F974(&qword_254A290A0, (uint64_t (*)(uint64_t))type metadata accessor for ASCOSEAlgorithmIdentifier, (uint64_t)&unk_20E55E990);
}

uint64_t sub_20E52F974(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x212BBF2EC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20E52F9B4()
{
  return sub_20E52F974(&qword_254A290A8, (uint64_t (*)(uint64_t))type metadata accessor for ASCOSEAlgorithmIdentifier, (uint64_t)&unk_20E55EA2C);
}

uint64_t sub_20E52F9E0()
{
  return sub_20E52F974(&qword_254A290B0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20E55EB50);
}

uint64_t sub_20E52FA0C()
{
  return sub_20E52F974(&qword_254A290B8, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20E55EAF8);
}

uint64_t ASPasskeyAssertionCredentialExtensionOutput.largeBlob.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t result;
  int v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v2 = sub_20E55705C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (uint64_t *)((char *)&v23 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v23 - v7;
  v9 = sub_20E557080();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v23 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29130);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v23 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E55708C();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9))
  {
    result = sub_20E52E370((uint64_t)v15, &qword_254A29130);
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = -1;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
  sub_20E52E370((uint64_t)v15, &qword_254A29130);
  sub_20E557074();
  (*(void (**)(uint64_t *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
  v17 = (*(uint64_t (**)(uint64_t *, uint64_t))(v3 + 88))(v6, v2);
  v18 = v17;
  v19 = *MEMORY[0x24BE0B038];
  if (v17 == *MEMORY[0x24BE0B038])
  {
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    v21 = *v6;
    v24 = v6[1];
    v20 = v21;
  }
  else
  {
    if (v17 != *MEMORY[0x24BE0B040])
    {
      result = sub_20E5574F4();
      __break(1u);
      return result;
    }
    (*(void (**)(uint64_t *, uint64_t))(v3 + 96))(v6, v2);
    v24 = 0;
    v20 = *(unsigned __int8 *)v6;
  }
  (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
  result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  v22 = v24;
  *(_QWORD *)a1 = v20;
  *(_QWORD *)(a1 + 8) = v22;
  *(_BYTE *)(a1 + 16) = v18 != v19;
  return result;
}

uint64_t ASPasskeyAssertionCredentialExtensionOutput.prf.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v2 = sub_20E557038();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29138);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E557044();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
  {
    sub_20E52E370((uint64_t)v8, &qword_254A29138);
    v9 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_20E52E370((uint64_t)v8, &qword_254A29138);
    sub_20E557020();
    v11 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0);
    sub_20E55702C();
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a1, 0, 1, v11);
  }
}

uint64_t ASPasskeyAssertionCredentialExtensionOutput.init(largeBlob:prf:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
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
  unint64_t v21;
  uint64_t v22;
  int v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t result;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;

  v39 = a3;
  v40 = a2;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  MEMORY[0x24BDAC7A8](v4);
  v38 = (uint64_t)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20E55723C();
  v35 = *(_QWORD *)(v6 - 8);
  v36 = v6;
  MEMORY[0x24BDAC7A8](v6);
  v37 = (char *)&v35 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29148);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v35 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29138);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v35 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_20E55705C();
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x24BDAC7A8](v14);
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29130);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v35 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *(_QWORD *)a1;
  v21 = *(_QWORD *)(a1 + 8);
  v23 = *(unsigned __int8 *)(a1 + 16);
  v24 = objc_msgSend(objc_allocWithZone((Class)sub_20E5570A4()), sel_init);
  if (v23 == 255)
  {
    v25 = sub_20E557080();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56))(v20, 1, 1, v25);
    v26 = v24;
  }
  else
  {
    if ((v23 & 1) != 0)
    {
      *v17 = v22 & 1;
      (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BE0B040], v14);
    }
    else
    {
      *(_QWORD *)v17 = v22;
      *((_QWORD *)v17 + 1) = v21;
      (*(void (**)(char *, _QWORD, uint64_t))(v15 + 104))(v17, *MEMORY[0x24BE0B038], v14);
      sub_20E52F828(v22, v21);
    }
    v27 = v24;
    sub_20E557068();
    sub_20E530B74(v22, v21, v23);
    v28 = sub_20E557080();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 56))(v20, 0, 1, v28);
  }
  sub_20E557098();
  v29 = v40;
  sub_20E530AF4(v40, (uint64_t)v10, &qword_254A29148);
  v30 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 48))(v10, 1, v30) == 1)
  {
    sub_20E52E370((uint64_t)v10, &qword_254A29148);
    v31 = sub_20E557038();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 56))(v13, 1, 1, v31);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v35 + 16))(v37, v10, v36);
    sub_20E530AF4((uint64_t)&v10[*(int *)(v30 + 20)], v38, &qword_254A29140);
    sub_20E557014();
    sub_20E530B38((uint64_t)v10);
    v32 = sub_20E557038();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v32 - 8) + 56))(v13, 0, 1, v32);
  }
  v33 = v39;
  sub_20E557050();

  result = sub_20E52E370(v29, &qword_254A29148);
  *v33 = v24;
  return result;
}

uint64_t static ASPasskeyAssertionCredentialExtensionOutput.supportsSecureCoding.getter()
{
  return 1;
}

char *sub_20E5301E0(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  char **v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  uint64_t v23;
  objc_class *ObjCClassFromObject;
  char *v25;
  void *v26;
  uint64_t v28;
  id v29;

  v3 = sub_20E55705C();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v28 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29130);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_allocWithZone((Class)sub_20E5570A4());
  v11 = v1;
  v12 = &selRef_allowedCredentialsForSecurityKeyAssertion;
  v13 = objc_msgSend(v10, sel_init);
  if (a1)
  {
    v14 = a1;
    if (objc_msgSend(v14, sel_didWrite))
    {
      *v6 = 1;
      (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE0B040], v3);
      sub_20E557068();
      v15 = sub_20E557080();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 0, 1, v15);
      sub_20E557098();

    }
    else
    {
      v29 = v13;
      v16 = objc_msgSend(v14, sel_readData);
      if (v16)
      {
        v17 = v16;
        v18 = sub_20E556DBC();
        v20 = v19;

        *(_QWORD *)v6 = v18;
        *((_QWORD *)v6 + 1) = v20;
        (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *MEMORY[0x24BE0B038], v3);
        v21 = v20;
        sub_20E52F7E4(v18, v20);
        sub_20E557068();
        v22 = sub_20E557080();
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v9, 0, 1, v22);
        v13 = v29;
        sub_20E557098();
        v23 = v18;
        v12 = &selRef_allowedCredentialsForSecurityKeyAssertion;
        sub_20E52F4EC(v23, v21);

      }
      else
      {

        v13 = v29;
      }
    }
  }
  ObjCClassFromObject = (objc_class *)swift_getObjCClassFromObject();

  v25 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromObject), v12[483]);
  v26 = *(void **)&v25[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
  *(_QWORD *)&v25[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v13;

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v25;
}

id sub_20E5304B8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  void *v20;
  uint64_t v21;
  id result;
  uint64_t v23;

  v1 = sub_20E55705C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (uint64_t *)((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23 - v6;
  v8 = sub_20E557080();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29130);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(id *)(v0 + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions);
  sub_20E55708C();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
  {
    sub_20E52E370((uint64_t)v14, &qword_254A29130);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_20E52E370((uint64_t)v14, &qword_254A29130);
  sub_20E557074();
  (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v17 = (*(uint64_t (**)(uint64_t *, uint64_t))(v2 + 88))(v5, v1);
  if (v17 == *MEMORY[0x24BE0B038])
  {
    (*(void (**)(uint64_t *, uint64_t))(v2 + 96))(v5, v1);
    v18 = *v5;
    v19 = v5[1];
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if (v19 >> 60 == 15)
    {
      v20 = 0;
    }
    else
    {
      sub_20E52F828(v18, v19);
      v20 = (void *)sub_20E556DA4();
    }
    v16 = objc_msgSend((id)objc_opt_self(), sel__outputWithData_didWrite_, v20, 0);

    sub_20E52F530(v18, v19);
    sub_20E52F530(v18, v19);
    return v16;
  }
  if (v17 == *MEMORY[0x24BE0B040])
  {
    (*(void (**)(uint64_t *, uint64_t))(v2 + 96))(v5, v1);
    v21 = *(unsigned __int8 *)v5;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return objc_msgSend((id)objc_opt_self(), sel__outputWithData_didWrite_, 0, v21);
  }
  result = (id)sub_20E5574F4();
  __break(1u);
  return result;
}

void __swiftcall ASPasskeyAssertionCredentialExtensionOutput.init(coder:)(ASPasskeyAssertionCredentialExtensionOutput_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

char *ASPasskeyAssertionCredentialExtensionOutput.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *ObjCClassFromObject;
  char *v7;
  void *v8;

  sub_20E5570A4();
  v3 = v1;
  v4 = sub_20E557398();
  if (v4)
  {
    v5 = v4;
    ObjCClassFromObject = (objc_class *)swift_getObjCClassFromObject();

    v7 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromObject), sel_init);
    v8 = *(void **)&v7[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
    *(_QWORD *)&v7[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v5;

    swift_getObjectType();
    swift_deallocPartialClassInstance();
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v7;
}

Swift::Void __swiftcall ASPasskeyAssertionCredentialExtensionOutput.encode(with:)(NSCoder with)
{
  uint64_t v1;
  id v3;
  id v4;

  v3 = *(id *)(v1 + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions);
  v4 = (id)sub_20E5572A8();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

}

uint64_t sub_20E530AF4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_20E530B38(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20E530B74(uint64_t result, unint64_t a2, unsigned __int8 a3)
{
  if (a3 != 255)
    return sub_20E530B8C(result, a2, a3 & 1);
  return result;
}

uint64_t sub_20E530B8C(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_20E52F530(a1, a2);
  return a1;
}

ValueMetadata *type metadata accessor for ASPasskeyAssertionCredentialExtensionOutput()
{
  return &type metadata for ASPasskeyAssertionCredentialExtensionOutput;
}

unint64_t type metadata accessor for ASPasskeyAssertionCredentialExtensionOutput()
{
  unint64_t result;

  result = qword_254A29180;
  if (!qword_254A29180)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A29180);
  }
  return result;
}

uint64_t ASPasskeyRegistrationCredentialExtensionOutput.largeBlob.getter@<X0>(char *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t result;
  char v10;
  char v11;
  uint64_t v12;

  v2 = sub_20E5571C4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29190);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E5571D0();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
  {
    result = sub_20E52E370((uint64_t)v8, &qword_254A29190);
    v10 = 2;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_20E52E370((uint64_t)v8, &qword_254A29190);
    v11 = sub_20E5571B8();
    result = (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v10 = v11 & 1;
  }
  *a1 = v10;
  return result;
}

uint64_t ASPasskeyRegistrationCredentialExtensionOutput.prf.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;

  v2 = sub_20E557188();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v12 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29198);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v12 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E557194();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48))(v8, 1, v2))
  {
    sub_20E52E370((uint64_t)v8, (uint64_t *)&unk_254A29198);
    v9 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
    return (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(a1, 1, 1, v9);
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v5, v8, v2);
    sub_20E52E370((uint64_t)v8, (uint64_t *)&unk_254A29198);
    sub_20E539BD4(a1);
    (*(void (**)(char *, uint64_t))(v3 + 8))(v5, v2);
    v11 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
    return (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(a1, 0, 1, v11);
  }
}

uint64_t ASPasskeyRegistrationCredentialExtensionOutput.init(largeBlob:prf:)@<X0>(unsigned __int8 *a1@<X0>, uint64_t a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  int v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t result;
  uint64_t v32;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v7 = MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v32 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v11 = (char *)&v32 - v10;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A291A8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29198);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v32 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29190);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v32 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = *a1;
  v22 = objc_msgSend(objc_allocWithZone((Class)sub_20E5571E8()), sel_init);
  v23 = v22;
  if (v21 == 2)
  {
    v24 = sub_20E5571C4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v24 - 8) + 56))(v20, 1, 1, v24);
    v25 = v23;
  }
  else
  {
    v26 = v22;
    sub_20E5571AC();
    v27 = sub_20E5571C4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v20, 0, 1, v27);
  }
  sub_20E5571DC();
  sub_20E530AF4(a2, (uint64_t)v14, &qword_254A291A8);
  v28 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 48))(v14, 1, v28) == 1)
  {
    sub_20E52E370((uint64_t)v14, &qword_254A291A8);
    v29 = sub_20E557188();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v29 - 8) + 56))(v17, 1, 1, v29);
  }
  else
  {
    sub_20E530AF4((uint64_t)&v14[*(int *)(v28 + 20)], (uint64_t)v11, &qword_254A29140);
    sub_20E530AF4((uint64_t)&v14[*(int *)(v28 + 24)], (uint64_t)v9, &qword_254A29140);
    sub_20E557158();
    sub_20E53113C((uint64_t)v14);
    v30 = sub_20E557188();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v30 - 8) + 56))(v17, 0, 1, v30);
  }
  sub_20E5571A0();

  result = sub_20E52E370(a2, &qword_254A291A8);
  *a3 = v23;
  return result;
}

uint64_t sub_20E53113C(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t static ASPasskeyRegistrationCredentialExtensionOutput.supportsSecureCoding.getter()
{
  return 1;
}

char *sub_20E531188(void *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  objc_class *ObjCClassFromObject;
  char *v12;
  void *v13;
  uint64_t v15;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29190);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v15 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_allocWithZone((Class)sub_20E5571E8());
  v7 = v1;
  v8 = objc_msgSend(v6, sel_init);
  if (a1)
  {
    v9 = a1;
    objc_msgSend(v9, sel_isSupported);
    sub_20E5571AC();
    v10 = sub_20E5571C4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
    sub_20E5571DC();

  }
  ObjCClassFromObject = (objc_class *)swift_getObjCClassFromObject();

  v12 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromObject), sel_init);
  v13 = *(void **)&v12[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
  *(_QWORD *)&v12[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v8;

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v12;
}

id sub_20E531324()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  char v10;
  uint64_t v11;

  v1 = sub_20E5571C4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29190);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = *(id *)(v0 + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions);
  sub_20E5571D0();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
  {
    sub_20E52E370((uint64_t)v7, &qword_254A29190);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
    sub_20E52E370((uint64_t)v7, &qword_254A29190);
    v10 = sub_20E5571B8();
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
    return objc_msgSend((id)objc_opt_self(), sel__outputWithIsSupported_, v10 & 1);
  }
}

void __swiftcall ASPasskeyRegistrationCredentialExtensionOutput.init(coder:)(ASPasskeyRegistrationCredentialExtensionOutput_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

char *ASPasskeyRegistrationCredentialExtensionOutput.init(coder:)(void *a1)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  objc_class *ObjCClassFromObject;
  char *v7;
  void *v8;

  sub_20E5571E8();
  v3 = v1;
  v4 = sub_20E557398();
  if (v4)
  {
    v5 = v4;
    ObjCClassFromObject = (objc_class *)swift_getObjCClassFromObject();

    v7 = (char *)objc_msgSend(objc_allocWithZone(ObjCClassFromObject), sel_init);
    v8 = *(void **)&v7[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
    *(_QWORD *)&v7[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v5;

    swift_getObjectType();
    swift_deallocPartialClassInstance();
  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v7;
}

Swift::Void __swiftcall ASPasskeyRegistrationCredentialExtensionOutput.encode(with:)(NSCoder with)
{
  uint64_t v1;
  id v3;
  id v4;

  v3 = *(id *)(v1 + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions);
  v4 = (id)sub_20E5572A8();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

}

ValueMetadata *type metadata accessor for ASPasskeyRegistrationCredentialExtensionOutput()
{
  return &type metadata for ASPasskeyRegistrationCredentialExtensionOutput;
}

unint64_t type metadata accessor for ASPasskeyRegistrationCredentialExtensionOutput()
{
  unint64_t result;

  result = qword_254A291E0;
  if (!qword_254A291E0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A291E0);
  }
  return result;
}

void sub_20E5317D8(uint64_t a1, unint64_t a2, char a3)
{
  if (a2 >> 60 == 15)
    __asm { BR              X10 }
  __asm { BR              X10 }
}

uint64_t sub_20E53186C()
{
  unint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  sub_20E52F7E4(v1, v0);
  v2 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_cborWithUTF8String_, v2);

  sub_20E52F7E4(v1, v0);
  v5 = (void *)sub_20E556DA4();
  v6 = objc_msgSend(v3, sel_cborWithData_, v5);
  sub_20E52F530(v1, v0);

  if (v6)
  {
    sub_20E531EA0((uint64_t)v6, v4);

  }
  else
  {
    v7 = (void *)sub_20E531D54((unint64_t)v4);

  }
  sub_20E52F530(v1, v0);
  return sub_20E52F530(v1, v0);
}

void sub_20E531888()
{
  void *v0;
  id v1;
  void *v2;

  v0 = (void *)sub_20E5572A8(0xD000000000000013, 0x800000020E566270);
  swift_bridgeObjectRelease(0x800000020E566270);
  v1 = objc_msgSend((id)objc_opt_self(MEMORY[0x24BE10200]), sel_cborWithUTF8String_, v0);

  v2 = (void *)sub_20E531D54(v1);
}

void sub_20E5318A4()
{
  JUMPOUT(0x20E5318C0);
}

uint64_t sub_20E531930()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  ((void (*)(const char *__return_ptr, uint64_t, uint64_t))sub_20E52F7E4)("prfCredRandomWithoutUV", v1, v0);
  v2 = (void *)sub_20E5572A8(0xD000000000000013, 0x800000020E566270);
  swift_bridgeObjectRelease(0x800000020E566270);
  v3 = (void *)objc_opt_self(MEMORY[0x24BE10200]);
  v4 = objc_msgSend(v3, sel_cborWithUTF8String_, v2);

  ((void (*)(uint64_t, uint64_t))sub_20E52F7E4)(v1, v0);
  v5 = (void *)((uint64_t (*)(uint64_t, uint64_t))sub_20E556DA4)(v1, v0);
  v6 = objc_msgSend(v3, sel_cborWithData_, v5);
  ((void (*)(uint64_t, uint64_t))sub_20E52F530)(v1, v0);

  if (v6)
  {
    ((void (*)(id, id))sub_20E531EA0)(v6, v4);

  }
  else
  {
    v7 = (void *)sub_20E531D54(v4);

  }
  ((void (*)(uint64_t, uint64_t))sub_20E52F530)(v1, v0);
  return ((uint64_t (*)(uint64_t, uint64_t))sub_20E52F530)(v1, v0);
}

void sub_20E53194C()
{
  JUMPOUT(0x20E531968);
}

uint64_t sub_20E531A84(uint64_t a1, char a2)
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
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  int64_t v22;
  _QWORD *v23;
  unint64_t v24;
  int64_t v25;
  char v26;
  unint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t v37;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29200);
  v6 = sub_20E557518();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v2;
  v37 = v5 + 64;
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
      goto LABEL_31;
    }
    v22 = v14 + 1;
    if (__OFADD__(v14, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v22 >= v11)
      break;
    v23 = (_QWORD *)(v5 + 64);
    v24 = *(_QWORD *)(v37 + 8 * v22);
    ++v14;
    if (!v24)
    {
      v14 = v22 + 1;
      if (v22 + 1 >= v11)
        goto LABEL_33;
      v24 = *(_QWORD *)(v37 + 8 * v14);
      if (!v24)
      {
        v25 = v22 + 2;
        if (v25 >= v11)
        {
LABEL_33:
          swift_release();
          v3 = v36;
          if ((a2 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v24 = *(_QWORD *)(v37 + 8 * v25);
        if (!v24)
        {
          while (1)
          {
            v14 = v25 + 1;
            if (__OFADD__(v25, 1))
              goto LABEL_42;
            if (v14 >= v11)
              goto LABEL_33;
            v24 = *(_QWORD *)(v37 + 8 * v14);
            ++v25;
            if (v24)
              goto LABEL_30;
          }
        }
        v14 = v25;
      }
    }
LABEL_30:
    v10 = (v24 - 1) & v24;
    v21 = __clz(__rbit64(v24)) + (v14 << 6);
LABEL_31:
    v30 = 8 * v21;
    v31 = *(void **)(*(_QWORD *)(v5 + 48) + v30);
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + v30);
    if ((a2 & 1) == 0)
    {
      v33 = v31;
      v34 = v32;
    }
    result = sub_20E5573A4();
    v15 = -1 << *(_BYTE *)(v7 + 32);
    v16 = result & ~v15;
    v17 = v16 >> 6;
    if (((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6))) != 0)
    {
      v18 = __clz(__rbit64((-1 << v16) & ~*(_QWORD *)(v12 + 8 * (v16 >> 6)))) | v16 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v26 = 0;
      v27 = (unint64_t)(63 - v15) >> 6;
      do
      {
        if (++v17 == v27 && (v26 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v28 = v17 == v27;
        if (v17 == v27)
          v17 = 0;
        v26 |= v28;
        v29 = *(_QWORD *)(v12 + 8 * v17);
      }
      while (v29 == -1);
      v18 = __clz(__rbit64(~v29)) + (v17 << 6);
    }
    *(_QWORD *)(v12 + ((v18 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v18;
    v19 = 8 * v18;
    *(_QWORD *)(*(_QWORD *)(v7 + 48) + v19) = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + v19) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v36;
  v23 = (_QWORD *)(v5 + 64);
  if ((a2 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v35 = 1 << *(_BYTE *)(v5 + 32);
  if (v35 >= 64)
    bzero(v23, ((unint64_t)(v35 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v23 = -1 << v35;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_20E531D54(unint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v10;
  char v11;
  char v12;
  char v13;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v15;
  uint64_t v17;

  v2 = v1;
  v4 = *v1;
  if ((v4 & 0xC000000000000001) == 0)
  {
LABEL_8:
    swift_bridgeObjectRetain();
    a1 = sub_20E54D61C(a1);
    v13 = v12;
    swift_bridgeObjectRelease();
    if ((v13 & 1) != 0)
    {
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v9 = *v2;
      v17 = *v2;
      *v2 = 0x8000000000000000;
      if (!isUniquelyReferenced_nonNull_native)
      {
        sub_20E532310();
        v9 = v17;
      }
      goto LABEL_11;
    }
    return 0;
  }
  if (v4 < 0)
    v5 = v4;
  else
    v5 = v4 & 0xFFFFFFFFFFFFFF8;
  swift_bridgeObjectRetain();
  v6 = (id)a1;
  v7 = sub_20E5574D0();

  if (!v7)
  {
    swift_bridgeObjectRelease();
    return 0;
  }
  swift_unknownObjectRelease();
  v8 = sub_20E5574C4();
  v9 = sub_20E531F40(v5, v8);
  swift_retain();
  a1 = sub_20E54D61C((uint64_t)v6);
  v11 = v10;
  swift_release();
  if ((v11 & 1) == 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_11:

  v15 = *(_QWORD *)(*(_QWORD *)(v9 + 56) + 8 * a1);
  sub_20E532160(a1, v9);
  *v2 = v9;
  swift_bridgeObjectRelease();
  return v15;
}

uint64_t sub_20E531EA0(uint64_t a1, void *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v10;

  v3 = v2;
  v6 = *v2;
  if ((*v2 & 0xC000000000000001) == 0)
    goto LABEL_7;
  if (v6 < 0)
    v7 = *v2;
  else
    v7 = v6 & 0xFFFFFFFFFFFFFF8;
  result = sub_20E5574C4();
  if (!__OFADD__(result, 1))
  {
    *v3 = sub_20E531F40(v7, result + 1);
LABEL_7:
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v10 = *v3;
    *v3 = 0x8000000000000000;
    sub_20E5324B4(a1, a2, isUniquelyReferenced_nonNull_native);
    *v3 = v10;
    return swift_bridgeObjectRelease();
  }
  __break(1u);
  return result;
}

uint64_t sub_20E531F40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  char v13;
  unint64_t v14;
  BOOL v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  if (a2)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29200);
    v2 = sub_20E557524();
    v18 = v2;
    sub_20E5574B8();
    v3 = sub_20E5574DC();
    if (v3)
    {
      v4 = v3;
      sub_20E532C68();
      do
      {
        swift_dynamicCast();
        swift_dynamicCast();
        v2 = v18;
        v12 = *(_QWORD *)(v18 + 16);
        if (*(_QWORD *)(v18 + 24) <= v12)
        {
          sub_20E531A84(v12 + 1, 1);
          v2 = v18;
        }
        result = sub_20E5573A4();
        v6 = v2 + 64;
        v7 = -1 << *(_BYTE *)(v2 + 32);
        v8 = result & ~v7;
        v9 = v8 >> 6;
        if (((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6))) != 0)
        {
          v10 = __clz(__rbit64((-1 << v8) & ~*(_QWORD *)(v2 + 64 + 8 * (v8 >> 6)))) | v8 & 0x7FFFFFFFFFFFFFC0;
        }
        else
        {
          v13 = 0;
          v14 = (unint64_t)(63 - v7) >> 6;
          do
          {
            if (++v9 == v14 && (v13 & 1) != 0)
            {
              __break(1u);
              return result;
            }
            v15 = v9 == v14;
            if (v9 == v14)
              v9 = 0;
            v13 |= v15;
            v16 = *(_QWORD *)(v6 + 8 * v9);
          }
          while (v16 == -1);
          v10 = __clz(__rbit64(~v16)) + (v9 << 6);
        }
        *(_QWORD *)(v6 + ((v10 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v10;
        v11 = 8 * v10;
        *(_QWORD *)(*(_QWORD *)(v2 + 48) + v11) = v17;
        *(_QWORD *)(*(_QWORD *)(v2 + 56) + v11) = v4;
        ++*(_QWORD *)(v2 + 16);
        v4 = sub_20E5574DC();
      }
      while (v4);
    }
    swift_release();
  }
  else
  {
    swift_unknownObjectRelease();
    return MEMORY[0x24BEE4B00];
  }
  return v2;
}

void sub_20E532160(unint64_t a1, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;

  v3 = a1;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (a1 + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    v8 = sub_20E557404();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v9 = (v8 + 1) & v7;
      do
      {
        v10 = *(id *)(*(_QWORD *)(a2 + 48) + 8 * v6);
        v11 = sub_20E5573A4();

        v12 = v11 & v7;
        if (v3 >= (uint64_t)v9)
        {
          if (v12 >= v9 && v3 >= (uint64_t)v12)
          {
LABEL_16:
            v15 = *(_QWORD *)(a2 + 48);
            v16 = (_QWORD *)(v15 + 8 * v3);
            v17 = (_QWORD *)(v15 + 8 * v6);
            if (v3 != v6 || v16 >= v17 + 1)
              *v16 = *v17;
            v18 = *(_QWORD *)(a2 + 56);
            v19 = (_QWORD *)(v18 + 8 * v3);
            v20 = (_QWORD *)(v18 + 8 * v6);
            if (v3 != v6 || (v3 = v6, v19 >= v20 + 1))
            {
              *v19 = *v20;
              v3 = v6;
            }
          }
        }
        else if (v12 >= v9 || v3 >= (uint64_t)v12)
        {
          goto LABEL_16;
        }
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v21 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v22 = *v21;
    v23 = (-1 << v3) - 1;
  }
  else
  {
    v21 = (uint64_t *)(v4 + 8 * (a1 >> 6));
    v23 = *v21;
    v22 = (-1 << a1) - 1;
  }
  *v21 = v23 & v22;
  v24 = *(_QWORD *)(a2 + 16);
  v25 = __OFSUB__(v24, 1);
  v26 = v24 - 1;
  if (v25)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v26;
    ++*(_DWORD *)(a2 + 36);
  }
}

id sub_20E532310()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
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
  void *v17;
  void *v18;
  id v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29200);
  v2 = *v0;
  v3 = sub_20E55750C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v20 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_26;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
        break;
    }
LABEL_25:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 8 * v15;
    v17 = *(void **)(*(_QWORD *)(v2 + 48) + v16);
    v18 = *(void **)(*(_QWORD *)(v2 + 56) + v16);
    *(_QWORD *)(*(_QWORD *)(v4 + 48) + v16) = v17;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v16) = v18;
    v19 = v17;
    result = v18;
  }
  v22 = v20 + 2;
  if (v22 >= v13)
    goto LABEL_26;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void sub_20E5324B4(uint64_t a1, void *a2, char a3)
{
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v7;
  char v8;
  unint64_t v9;
  uint64_t v10;
  _BOOL8 v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;
  id v23;

  v4 = v3;
  v7 = *v3;
  v9 = sub_20E54D61C((uint64_t)a2);
  v10 = *(_QWORD *)(v7 + 16);
  v11 = (v8 & 1) == 0;
  v12 = v10 + v11;
  if (__OFADD__(v10, v11))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v13 = v8;
  v14 = *(_QWORD *)(v7 + 24);
  if (v14 >= v12 && (a3 & 1) != 0)
    goto LABEL_7;
  if (v14 >= v12 && (a3 & 1) == 0)
  {
    sub_20E532310();
LABEL_7:
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
    {
LABEL_8:
      v16 = v15[7];

      *(_QWORD *)(v16 + 8 * v9) = a1;
      return;
    }
LABEL_11:
    v15[(v9 >> 6) + 8] |= 1 << v9;
    v19 = 8 * v9;
    *(_QWORD *)(v15[6] + v19) = a2;
    *(_QWORD *)(v15[7] + v19) = a1;
    v20 = v15[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v15[2] = v22;
      v23 = a2;
      return;
    }
    goto LABEL_14;
  }
  sub_20E531A84(v12, a3 & 1);
  v17 = sub_20E54D61C((uint64_t)a2);
  if ((v13 & 1) == (v18 & 1))
  {
    v9 = v17;
    v15 = (_QWORD *)*v4;
    if ((v13 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  sub_20E532C68();
  sub_20E557584();
  __break(1u);
}

id sub_20E532604(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  id v7;

  v4 = (void *)objc_opt_self();
  v5 = (void *)sub_20E556DA4();
  v6 = objc_msgSend(v4, sel_decodeFromData_, v5);

  if (v6)
  {
    v7 = objc_msgSend(v6, sel_dictionary);

    if (v7)
    {
      sub_20E532C68();
      sub_20E532CA4();
      v6 = (id)sub_20E557290();
      sub_20E52F4EC(a1, a2);

    }
    else
    {
      sub_20E52F4EC(a1, a2);
      return 0;
    }
  }
  else
  {
    sub_20E52F4EC(a1, a2);
  }
  return v6;
}

void sub_20E532700(void *a1@<X0>, uint64_t *a2@<X8>)
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  os_log_type_t v13;
  uint8_t *v14;
  const char *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  int v22;
  uint64_t v23;
  unint64_t v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[24];
  uint64_t v28;

  v4 = (id)*MEMORY[0x24BDE8FB8];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v4))
  {
    sub_20E5573E0();
    swift_unknownObjectRelease();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_20E532BC8((uint64_t)&v25, (uint64_t)v27);
  if (!v28)
  {

    sub_20E532C10((uint64_t)v27);
LABEL_11:
    if (qword_254A28EE8 != -1)
      swift_once();
    v8 = sub_20E55720C();
    __swift_project_value_buffer(v8, (uint64_t)qword_254A2AA10);
    v9 = sub_20E5571F4();
    v10 = sub_20E557374();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_20E4D9000, v9, v10, "Keychain passkey is missing atag.", v11, 2u);
      MEMORY[0x212BBF364](v11, -1, -1);
    }
    goto LABEL_32;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    goto LABEL_11;
  }

  sub_20E52F7E4(v23, v24);
  v5 = sub_20E532604(v23, v24);
  if (!v5)
  {
    if (qword_254A28EE8 != -1)
      swift_once();
    v12 = sub_20E55720C();
    __swift_project_value_buffer(v12, (uint64_t)qword_254A2AA10);
    v9 = sub_20E5571F4();
    v13 = sub_20E557374();
    if (os_log_type_enabled(v9, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      v15 = "Could not parse keychain passkey's atag.";
LABEL_30:
      _os_log_impl(&dword_20E4D9000, v9, v13, v15, v14, 2u);
      MEMORY[0x212BBF364](v14, -1, -1);

      sub_20E52F4EC(v23, v24);
LABEL_33:
      v20 = 0;
      v21 = 0;
      v6 = 0;
      v17 = 0;
      v16 = 0;
      goto LABEL_34;
    }
    goto LABEL_31;
  }
  v6 = (uint64_t)v5;
  v7 = (id)*MEMORY[0x24BDE90A0];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v7))
  {
    sub_20E5573E0();
    swift_unknownObjectRelease();
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
  }
  sub_20E532BC8((uint64_t)&v25, (uint64_t)v27);
  if (!v28)
  {

    swift_bridgeObjectRelease();
    sub_20E532C10((uint64_t)v27);
    goto LABEL_26;
  }
  if ((swift_dynamicCast() & 1) == 0)
  {

    swift_bridgeObjectRelease();
LABEL_26:
    if (qword_254A28EE8 != -1)
      swift_once();
    v19 = sub_20E55720C();
    __swift_project_value_buffer(v19, (uint64_t)qword_254A2AA10);
    v9 = sub_20E5571F4();
    v13 = sub_20E557374();
    if (os_log_type_enabled(v9, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      v15 = "Keychain passkey is missing labl.";
      goto LABEL_30;
    }
LABEL_31:
    sub_20E52F4EC(v23, v24);
LABEL_32:

    goto LABEL_33;
  }
  v17 = v23;
  v16 = v24;

  v18 = (id)*MEMORY[0x24BDE9558];
  if (objc_msgSend(a1, sel___swift_objectForKeyedSubscript_, v18))
  {
    sub_20E5573E0();

    sub_20E52F4EC(v23, v24);
    swift_unknownObjectRelease();
  }
  else
  {

    sub_20E52F4EC(v23, v24);
    v25 = 0u;
    v26 = 0u;
  }
  sub_20E532BC8((uint64_t)&v25, (uint64_t)v27);
  if (v28)
  {
    v22 = swift_dynamicCast();
    if (v22)
      v20 = v23;
    else
      v20 = 0;
    if (v22)
      v21 = v24;
    else
      v21 = 0xF000000000000000;

  }
  else
  {

    sub_20E532C10((uint64_t)v27);
    v20 = 0;
    v21 = 0xF000000000000000;
  }
LABEL_34:
  *a2 = v20;
  a2[1] = v21;
  a2[2] = v6;
  a2[3] = v17;
  a2[4] = v16;
}

uint64_t sub_20E532BC8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A291E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20E532C10(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A291E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

unint64_t sub_20E532C68()
{
  unint64_t result;

  result = qword_254A291F0;
  if (!qword_254A291F0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A291F0);
  }
  return result;
}

unint64_t sub_20E532CA4()
{
  unint64_t result;
  unint64_t v1;

  result = qword_254A291F8;
  if (!qword_254A291F8)
  {
    v1 = sub_20E532C68();
    result = MEMORY[0x212BBF2EC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254A291F8);
  }
  return result;
}

uint64_t initializeBufferWithCopyOfBuffer for ASKeychainPasskey(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for ASKeychainPasskey(uint64_t *a1)
{
  unint64_t v1;

  v1 = a1[1];
  if (v1 >> 60 != 15)
    sub_20E52F4EC(*a1, v1);
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ASKeychainPasskey(uint64_t a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v5 = *a2;
    sub_20E52F7E4(*a2, a2[1]);
    *(_QWORD *)a1 = v5;
    *(_QWORD *)(a1 + 8) = v4;
  }
  v6 = a2[3];
  *(_QWORD *)(a1 + 16) = a2[2];
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for ASKeychainPasskey(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *a2;
      sub_20E52F7E4(*a2, a2[1]);
      v7 = *a1;
      v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_20E52F4EC(v7, v8);
      goto LABEL_8;
    }
    sub_20E532EAC((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    goto LABEL_8;
  }
  v5 = *a2;
  sub_20E52F7E4(*a2, a2[1]);
  *a1 = v5;
  a1[1] = v4;
LABEL_8:
  a1[2] = a2[2];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20E532EAC(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BDCDDE8] - 8) + 8))();
  return a1;
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

uint64_t *assignWithTake for ASKeychainPasskey(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_20E52F4EC(v6, v4);
      goto LABEL_6;
    }
    sub_20E532EAC((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
LABEL_6:
  a1[2] = a2[2];
  swift_bridgeObjectRelease();
  v7 = a2[4];
  a1[3] = a2[3];
  a1[4] = v7;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ASKeychainPasskey(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASKeychainPasskey(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASKeychainPasskey()
{
  return &type metadata for ASKeychainPasskey;
}

ValueMetadata *type metadata accessor for ASKeychainPasskey.Metadata()
{
  return &type metadata for ASKeychainPasskey.Metadata;
}

uint64_t ASAuthorizationPlatformPublicKeyCredentialRegistration.prf.getter@<X0>(_BYTE *a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_20E557188();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29198);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(v1, sel_coreCredential);
  v11 = objc_msgSend(v10, sel_extensions);

  if (!v11)
    goto LABEL_4;
  sub_20E557194();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_20E52E370((uint64_t)v9, (uint64_t *)&unk_254A29198);
LABEL_4:
    v12 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
    return (*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_20E52E370((uint64_t)v9, (uint64_t *)&unk_254A29198);
  sub_20E539BD4(a1);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v14 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  return (*(uint64_t (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 0, 1, v14);
}

id ASAuthorizationPlatformPublicKeyCredentialRegistration.__largeBlobSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  id v9;
  char v11;
  uint64_t v12;

  v1 = sub_20E5571C4();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29190);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = objc_msgSend(v0, sel_coreCredential);
  v9 = objc_msgSend(v8, sel_extensions);

  if (!v9)
    return 0;
  sub_20E5571D0();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v2 + 48))(v7, 1, v1))
  {
    sub_20E52E370((uint64_t)v7, &qword_254A29190);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_20E52E370((uint64_t)v7, &qword_254A29190);
  v11 = sub_20E5571B8();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return objc_msgSend((id)objc_opt_self(), sel__outputWithIsSupported_, v11 & 1);
}

id ASAuthorizationPlatformPublicKeyCredentialRegistration.__prfSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  _BYTE *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(_BYTE *, uint64_t, uint64_t, uint64_t);
  char *v27;
  char *v28;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  char *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v35 = (uint64_t)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v30 - v4;
  v6 = sub_20E55723C();
  v33 = *(_QWORD *)(v6 - 8);
  v34 = v6;
  v7 = MEMORY[0x24BDAC7A8](v6);
  v32 = (char *)&v30 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v30 - v9;
  v11 = sub_20E557188();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x24BDAC7A8](v11);
  v14 = (char *)&v30 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29198);
  MEMORY[0x24BDAC7A8](v15);
  v17 = (char *)&v30 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v30 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = objc_msgSend(v0, sel_coreCredential);
  v22 = objc_msgSend(v21, sel_extensions);

  if (!v22)
    return 0;
  sub_20E557194();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v17, 1, v11))
  {
    sub_20E52E370((uint64_t)v17, (uint64_t *)&unk_254A29198);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v14, v17, v11);
  sub_20E52E370((uint64_t)v17, (uint64_t *)&unk_254A29198);
  sub_20E557170();
  v24 = v33;
  v25 = v34;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v5, 1, v34) == 1)
  {
    sub_20E52E370((uint64_t)v5, &qword_254A29140);
    *v20 = sub_20E557164() & 1;
    v26 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v24 + 56);
    v26(&v20[*(int *)(v18 + 20)], 1, 1, v25);
    v26(&v20[*(int *)(v18 + 24)], 1, 1, v25);
  }
  else
  {
    v31 = *(void (**)(char *, char *, uint64_t))(v24 + 32);
    v31(v10, v5, v25);
    v27 = v32;
    (*(void (**)(char *, char *, uint64_t))(v24 + 16))(v32, v10, v25);
    sub_20E55717C();
    (*(void (**)(char *, uint64_t))(v24 + 8))(v10, v25);
    *v20 = 1;
    v28 = &v20[*(int *)(v18 + 20)];
    v31(v28, v27, v25);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56))(v28, 0, 1, v25);
    sub_20E533718(v35, (uint64_t)&v20[*(int *)(v18 + 24)]);
  }
  (*(void (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  v23 = sub_20E539DCC();
  sub_20E53113C((uint64_t)v20);
  return v23;
}

uint64_t sub_20E533718(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_20E533760()
{
  uint64_t v0;
  __int128 v1;
  void *v2;
  id v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  void *v12;
  unsigned __int8 v13;
  unint64_t v14;
  id v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  unint64_t v20;
  id v21;
  unint64_t v22;
  unint64_t v23;
  id v24;
  unint64_t v25;
  unint64_t v26;
  id v27;
  unint64_t v28;
  _OWORD v29[2];
  __int128 v30;
  __int16 v31;

  v1 = *(_OWORD *)(v0 + 16);
  v29[0] = *(_OWORD *)v0;
  v29[1] = v1;
  v30 = *(_OWORD *)(v0 + 32);
  v31 = *(_WORD *)(v0 + 48);
  v2 = *(void **)&v29[0];
  sub_20E534E74((id *)v29);
  v3 = objc_msgSend(v2, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v4 = sub_20E5572FC();

  v28 = MEMORY[0x24BEE4AF8];
  if (v4 >> 62)
LABEL_40:
    v5 = sub_20E557500();
  else
    v5 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  v6 = MEMORY[0x24BEE4AF8];
  if (v5)
  {
    v27 = v2;
    v7 = 0;
    v2 = (void *)(v4 & 0xFFFFFFFFFFFFFF8);
    while (1)
    {
      if ((v4 & 0xC000000000000001) != 0)
      {
        v8 = (void *)MEMORY[0x212BBE86C](v7, v4);
        v9 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_24:
          __break(1u);
LABEL_25:
          v14 = v28;
          v2 = v27;
          v6 = MEMORY[0x24BEE4AF8];
          goto LABEL_27;
        }
      }
      else
      {
        if (v7 >= *(_QWORD *)((v4 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
          goto LABEL_40;
        }
        v8 = *(void **)(v4 + 8 * v7 + 32);
        swift_unknownObjectRetain();
        v9 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_24;
      }
      if (objc_msgSend(v8, sel_loginChoiceKind, v27) != (id)2)
        goto LABEL_5;
      objc_opt_self();
      v10 = (void *)swift_dynamicCastObjCClassUnconditional();
      swift_unknownObjectRetain();
      v11 = objc_msgSend(v10, sel_externalCredentialProviderName);
      if (v11)
      {
        v12 = v11;
        swift_unknownObjectRelease();

LABEL_13:
        sub_20E55747C();
        sub_20E5574A0();
        sub_20E5574AC();
        sub_20E557488();
        goto LABEL_6;
      }
      if (!BYTE12(v30))
      {
        swift_unknownObjectRelease_n();
        goto LABEL_6;
      }
      if ((BYTE10(v30) & 1) != 0)
      {
        swift_unknownObjectRelease();
      }
      else
      {
        sub_20E534E74((id *)v29);
        v13 = objc_msgSend(v27, sel_isRegistrationRequest);
        swift_unknownObjectRelease();
        sub_20E534EBC((id *)v29);
        if ((v13 & 1) != 0)
          goto LABEL_5;
      }
      if ((BYTE13(v30) & 1) != 0)
        goto LABEL_13;
LABEL_5:
      swift_unknownObjectRelease();
LABEL_6:
      ++v7;
      if (v9 == v5)
        goto LABEL_25;
    }
  }
  v14 = MEMORY[0x24BEE4AF8];
LABEL_27:
  sub_20E534EBC((id *)v29);
  swift_bridgeObjectRelease();
  v15 = objc_msgSend(v2, sel_loginChoices);
  v16 = sub_20E5572FC();

  if (v16 >> 62)
  {
    swift_bridgeObjectRetain();
    v17 = sub_20E557500();
    swift_bridgeObjectRelease();
    if (v17)
      goto LABEL_29;
LABEL_42:
    swift_bridgeObjectRelease();
    v20 = MEMORY[0x24BEE4AF8];
    goto LABEL_43;
  }
  v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v17)
    goto LABEL_42;
LABEL_29:
  if (v17 < 1)
  {
    __break(1u);
    return;
  }
  for (i = 0; i != v17; ++i)
  {
    if ((v16 & 0xC000000000000001) != 0)
    {
      v19 = (void *)MEMORY[0x212BBE86C](i, v16);
    }
    else
    {
      v19 = *(void **)(v16 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    if (objc_msgSend(v19, sel_loginChoiceKind, v27))
    {
      swift_unknownObjectRelease();
    }
    else
    {
      sub_20E55747C();
      sub_20E5574A0();
      sub_20E5574AC();
      sub_20E557488();
    }
  }
  swift_bridgeObjectRelease();
  v20 = v6;
LABEL_43:
  v21 = objc_msgSend(v2, sel_loginChoices, v27);
  v22 = sub_20E5572FC();

  sub_20E534E74((id *)v29);
  swift_retain();
  v23 = sub_20E534AF0(v22, v14, (uint64_t)v29);
  sub_20E534EBC((id *)v29);
  swift_bridgeObjectRelease();
  swift_release();
  sub_20E5435BC(v20);
  sub_20E5435BC(v23);
  if ((BYTE9(v30) & 1) != 0)
  {
    sub_20E534E74((id *)v29);
    v24 = objc_msgSend(v2, sel_loginChoices);
    v25 = sub_20E5572FC();

    v26 = sub_20E534CBC(v25, (uint64_t)&unk_24C952098);
    swift_bridgeObjectRelease();
    sub_20E534EBC((id *)v29);
    sub_20E5435BC(v26);
  }
}

void sub_20E533C1C(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  id v12;

  v3 = *(void **)v1;
  v4 = *(unsigned __int8 *)(v1 + 41);
  if (sub_20E53E4EC())
  {
LABEL_2:
    v5 = objc_msgSend(v3, sel_appIdentifier);
    v6 = sub_20E5572B4();
    v8 = v7;

    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v8;
    *(_QWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 24) = 1;
    return;
  }
  if (v4)
  {
    if ((objc_msgSend(v3, sel_isCABLEAuthenticatorRequest) & 1) == 0)
    {
      ASAuthorizationUIContext.loginChoicesToShow.getter();
      v10 = sub_20E534CBC(v9, (uint64_t)&unk_24C952198);
      swift_bridgeObjectRelease();
      v11 = v10 >> 62 ? sub_20E557500() : *(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
      swift_bridgeObjectRelease();
      if (!v11)
        goto LABEL_2;
    }
    goto LABEL_12;
  }
  v12 = objc_msgSend(v3, sel_serviceType);
  if (v12 == (id)1)
  {
LABEL_12:
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 1;
    *(_BYTE *)(a1 + 24) = 4;
    return;
  }
  if (v12)
  {
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 16) = 0;
    *(_QWORD *)a1 = 1;
    *(_BYTE *)(a1 + 24) = 4;
  }
  else
  {
    sub_20E53EDC0((uint64_t *)a1);
  }
}

id sub_20E533EBC@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unsigned int v17;
  id result;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  v5 = *(void **)v2;
  v6 = *(_QWORD *)(v2 + 16);
  v7 = *(unsigned __int8 *)(v2 + 24);
  v22 = *(_QWORD *)(v2 + 8);
  ASAuthorizationUIContext.loginChoicesToShow.getter();
  v9 = v8;
  v23 = MEMORY[0x24BEE4AF8];
  if (!(v8 >> 62))
  {
    v10 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v10)
      goto LABEL_3;
LABEL_16:
    swift_bridgeObjectRelease();
    v13 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_35;
    goto LABEL_17;
  }
  v10 = sub_20E557500();
  if (!v10)
    goto LABEL_16;
LABEL_3:
  if (v10 < 1)
  {
    __break(1u);
    goto LABEL_37;
  }
  v21 = v6;
  for (i = 0; i != v10; ++i)
  {
    if ((v9 & 0xC000000000000001) != 0)
    {
      v12 = (void *)MEMORY[0x212BBE86C](i, v9);
    }
    else
    {
      v12 = *(void **)(v9 + 8 * i + 32);
      swift_unknownObjectRetain();
    }
    if (objc_msgSend(v12, sel_loginChoiceKind, v21) == (id)5 || objc_msgSend(v12, sel_loginChoiceKind) == (id)6)
    {
      sub_20E55747C();
      sub_20E5574A0();
      sub_20E5574AC();
      sub_20E557488();
    }
    else
    {
      swift_unknownObjectRelease();
    }
  }
  swift_bridgeObjectRelease();
  v13 = v23;
  v6 = v21;
  if (v23 < 0)
    goto LABEL_35;
LABEL_17:
  if ((v13 & 0x4000000000000000) == 0)
  {
    v14 = *(_QWORD *)(v13 + 16);
    goto LABEL_19;
  }
LABEL_35:
  swift_bridgeObjectRetain();
  v14 = sub_20E557500();
  swift_release();
LABEL_19:
  ASAuthorizationUIContext.loginChoicesToShow.getter();
  if (v15 >> 62)
    v16 = sub_20E557500();
  else
    v16 = *(_QWORD *)((v15 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (v14 == v16)
  {
    v17 = objc_msgSend(v5, sel_isCABLEAuthenticatorRequest);
    result = (id)swift_release();
    *(_QWORD *)a2 = v17 | ((unint64_t)(v14 > 1) << 8);
    *(_OWORD *)(a2 + 8) = xmmword_20E55EC60;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 32) = 0;
    return result;
  }
  swift_release();
  ASAuthorizationUIContext.loginChoicesToShow.getter();
  if (!(v19 >> 62))
  {
    v20 = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFF8) + 0x10);
    goto LABEL_25;
  }
LABEL_37:
  v20 = sub_20E557500();
LABEL_25:
  swift_bridgeObjectRelease();
  if (v20 == 1)
  {
    result = objc_msgSend(a1, sel_loginChoiceKind);
    switch((unint64_t)result)
    {
      case 0uLL:
        *(_OWORD *)a2 = xmmword_20E55EC50;
        goto LABEL_28;
      case 1uLL:
        result = (id)sub_20E536744((_QWORD *)a2);
        break;
      case 2uLL:
        result = (id)sub_20E534F0C((_QWORD *)a2);
        break;
      default:
        *(_QWORD *)a2 = 0;
        *(_QWORD *)(a2 + 8) = 0;
LABEL_28:
        *(_QWORD *)(a2 + 24) = 0;
        *(_QWORD *)(a2 + 32) = 0;
        *(_QWORD *)(a2 + 16) = 0x8000000000000000;
        break;
    }
  }
  else
  {
    *(_QWORD *)a2 = v22;
    *(_QWORD *)(a2 + 8) = v6;
    *(_QWORD *)(a2 + 24) = 0;
    *(_QWORD *)(a2 + 32) = 0;
    *(_QWORD *)(a2 + 16) = v7 | 0x4000000000000000;
    return (id)sub_20E534780();
  }
  return result;
}

id sub_20E534420@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  id result;
  char v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  id v18;
  uint64_t v19;
  char v20;
  int v21;
  __int128 v23;
  char v24;

  v18 = *(id *)v2;
  v19 = *(_QWORD *)(v2 + 32);
  v20 = *(_BYTE *)(v2 + 48);
  v21 = *(unsigned __int8 *)(v2 + 44);
  v17 = *(_BYTE *)(v2 + 49);
  result = objc_msgSend(a1, sel_loginChoiceKind);
  switch((unint64_t)result)
  {
    case 0uLL:
      result = (id)sub_20E53F23C((uint64_t)&v23);
      v4 = v24;
      v5 = a2;
      *(_OWORD *)a2 = v23;
      goto LABEL_17;
    case 1uLL:
      objc_opt_self();
      result = objc_msgSend((id)swift_dynamicCastObjCClassUnconditional(), sel_isExternal);
      if ((_DWORD)result || (v20 & 1) == 0)
        goto LABEL_18;
      goto LABEL_13;
    case 2uLL:
      objc_opt_self();
      v6 = (void *)swift_dynamicCastObjCClassUnconditional();
      swift_unknownObjectRetain();
      v7 = objc_msgSend(v6, sel_externalCredentialProviderName);
      if (v7)
      {
        v8 = v7;
        swift_unknownObjectRelease();

        goto LABEL_18;
      }
      v9 = objc_msgSend(v18, sel_platformUserVerificationPreference);
      v10 = sub_20E5572B4();
      v12 = v11;

      if (v10 == sub_20E5572B4() && v12 == v13)
      {
        swift_bridgeObjectRelease_n();
        result = (id)swift_unknownObjectRelease();
      }
      else
      {
        v14 = sub_20E557560();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        result = (id)swift_unknownObjectRelease();
        if ((v14 & 1) == 0 && (v17 & 1) == 0)
        {
LABEL_18:
          if (qword_254A28EC8 != -1)
            swift_once();
          v15 = *(_QWORD *)algn_254A2A9D8;
          *(_QWORD *)a2 = qword_254A2A9D0;
          *(_QWORD *)(a2 + 8) = v15;
          *(_BYTE *)(a2 + 16) = 0;
          return (id)swift_bridgeObjectRetain();
        }
      }
LABEL_13:
      if (!v21)
        goto LABEL_18;
      if (v21 == 1 || v19 != 1)
      {
        if (qword_254A28EC8 != -1)
          swift_once();
        v16 = *(_QWORD *)algn_254A2A9D8;
        *(_QWORD *)a2 = qword_254A2A9D0;
        *(_QWORD *)(a2 + 8) = v16;
        *(_BYTE *)(a2 + 16) = 1;
        return (id)swift_bridgeObjectRetain();
      }
      v5 = a2;
      *(_QWORD *)a2 = 0;
      *(_QWORD *)(a2 + 8) = 0;
      v4 = 3;
LABEL_17:
      *(_BYTE *)(v5 + 16) = v4;
      return result;
    case 5uLL:
      goto LABEL_13;
    default:
      goto LABEL_18;
  }
}

uint64_t sub_20E534780()
{
  return swift_bridgeObjectRetain();
}

uint64_t sub_20E534788(unint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  uint64_t v31;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v37;

  v3 = v2;
  v4 = a1;
  if (a1 >> 62)
  {
LABEL_32:
    swift_bridgeObjectRetain();
    v5 = sub_20E557500();
    if (v5)
      goto LABEL_3;
  }
  else
  {
    v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v5)
    {
LABEL_3:
      v33 = v3;
      v34 = v5;
      v37 = v4 & 0xC000000000000001;
      v6 = 4;
      v35 = v4;
      while (1)
      {
        v7 = v6 - 4;
        if (v37)
        {
          MEMORY[0x212BBE86C](v6 - 4, v4);
          v3 = v6 - 3;
          if (__OFADD__(v7, 1))
            goto LABEL_31;
        }
        else
        {
          swift_unknownObjectRetain();
          v3 = v6 - 3;
          if (__OFADD__(v7, 1))
          {
LABEL_31:
            __break(1u);
            goto LABEL_32;
          }
        }
        objc_opt_self();
        v8 = swift_dynamicCastObjCClass();
        if (v8)
        {
          v9 = (void *)v8;
          swift_unknownObjectRetain();
          v10 = objc_msgSend(v9, sel_relyingPartyIdentifier);
          if (v10)
          {
            v11 = v10;
            v12 = objc_msgSend(v10, sel_safari_highLevelDomainForPasswordManager);

            v13 = sub_20E5572B4();
            v15 = v14;

          }
          else
          {
            v13 = 0;
            v15 = 0;
          }
          v16 = objc_msgSend(a2, sel_site, v33);
          if (!v16)
          {
            sub_20E5572B4();
            v16 = (id)sub_20E5572A8();
            swift_bridgeObjectRelease();
          }
          v17 = objc_msgSend(v16, sel_safari_highLevelDomainForPasswordManager);

          v18 = sub_20E5572B4();
          v20 = v19;

          if (!v15)
          {
            swift_unknownObjectRelease_n();
            swift_bridgeObjectRelease();
LABEL_28:
            v5 = v34;
            v4 = v35;
            goto LABEL_5;
          }
          if (v13 == v18 && v15 == v20)
          {
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
          }
          else
          {
            v21 = sub_20E557560();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v21 & 1) == 0)
            {
              swift_unknownObjectRelease_n();
              goto LABEL_28;
            }
          }
          v22 = objc_msgSend(v9, sel_userVisibleName);
          v23 = sub_20E5572B4();
          v25 = v24;

          v26 = objc_msgSend(a2, sel_username);
          v27 = sub_20E5572B4();
          v29 = v28;

          if (v23 == v27 && v25 == v29)
          {
            swift_bridgeObjectRelease_n();
            swift_unknownObjectRelease_n();
            v31 = 1;
            goto LABEL_34;
          }
          v30 = sub_20E557560();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          swift_unknownObjectRelease_n();
          v5 = v34;
          v4 = v35;
          if ((v30 & 1) != 0)
          {
            v31 = 1;
            goto LABEL_34;
          }
        }
        else
        {
          swift_unknownObjectRelease();
        }
LABEL_5:
        ++v6;
        if (v3 == v5)
        {
          v31 = 0;
          goto LABEL_34;
        }
      }
    }
  }
  v31 = 0;
LABEL_34:
  swift_bridgeObjectRelease();
  return v31;
}

uint64_t sub_20E534AF0(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  char v12;
  uint64_t v13;

  v13 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
  {
LABEL_18:
    v6 = sub_20E557500();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v6)
    {
LABEL_3:
      v7 = 0;
      v12 = *(_BYTE *)(a3 + 41);
      while (1)
      {
        if ((a1 & 0xC000000000000001) != 0)
        {
          MEMORY[0x212BBE86C](v7, a1);
          v8 = v7 + 1;
          if (__OFADD__(v7, 1))
          {
LABEL_15:
            __break(1u);
            return v13;
          }
        }
        else
        {
          if (v7 >= *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_18;
          }
          swift_unknownObjectRetain();
          v8 = v7 + 1;
          if (__OFADD__(v7, 1))
            goto LABEL_15;
        }
        objc_opt_self();
        v9 = swift_dynamicCastObjCClass();
        if (v9
          && ((v10 = (void *)v9,
               swift_unknownObjectRetain(),
               a3 = sub_20E534788(a2, v10),
               swift_unknownObjectRelease(),
               (v12 & 1) != 0)
           || (a3 & 1) == 0))
        {
          sub_20E55747C();
          sub_20E5574A0();
          sub_20E5574AC();
          a3 = (uint64_t)&v13;
          sub_20E557488();
        }
        else
        {
          swift_unknownObjectRelease();
        }
        ++v7;
        if (v8 == v6)
          return v13;
      }
    }
  }
  return MEMORY[0x24BEE4AF8];
}

uint64_t sub_20E534CBC(unint64_t a1, uint64_t a2)
{
  unint64_t v3;
  uint64_t i;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  char **v8;
  char *v9;
  BOOL v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v16;
  uint64_t v17;

  v3 = a1;
  v17 = MEMORY[0x24BEE4AF8];
  if (a1 >> 62)
    goto LABEL_24;
  for (i = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10); i; i = sub_20E557500())
  {
    v16 = v3;
    v5 = 0;
    v6 = v3 & 0xC000000000000001;
    v7 = v3 & 0xFFFFFFFFFFFFFF8;
    v8 = (char **)(v3 + 32);
    v3 = (unint64_t)&selRef_initWithCredentialID_;
    while (1)
    {
      if (v6)
      {
        v9 = (char *)MEMORY[0x212BBE86C](v5, v16);
        v10 = __OFADD__(v5++, 1);
        if (v10)
          goto LABEL_20;
      }
      else
      {
        if (v5 >= *(_QWORD *)(v7 + 16))
          goto LABEL_23;
        v9 = v8[v5];
        swift_unknownObjectRetain();
        v10 = __OFADD__(v5++, 1);
        if (v10)
        {
LABEL_20:
          __break(1u);
          return v17;
        }
      }
      v11 = objc_msgSend(v9, *(SEL *)(v3 + 1488), v16);
      v12 = *(_QWORD *)(a2 + 16);
      if (v12)
      {
        if (*(id *)(a2 + 32) == v11)
        {
LABEL_11:
          sub_20E55747C();
          sub_20E5574A0();
          sub_20E5574AC();
          sub_20E557488();
          v3 = 0x24C96B000;
          goto LABEL_5;
        }
        if (v12 != 1)
          break;
      }
LABEL_4:
      swift_unknownObjectRelease();
LABEL_5:
      if (v5 == i)
        return v17;
    }
    v13 = 5;
    while (1)
    {
      v14 = v13 - 3;
      if (__OFADD__(v13 - 4, 1))
        break;
      if (*(id *)(a2 + 8 * v13) == v11)
        goto LABEL_11;
      ++v13;
      if (v14 == v12)
        goto LABEL_4;
    }
    __break(1u);
LABEL_23:
    __break(1u);
LABEL_24:
    ;
  }
  return MEMORY[0x24BEE4AF8];
}

id *sub_20E534E74(id *a1)
{
  id v2;

  v2 = *a1;
  sub_20E534780();
  return a1;
}

id *sub_20E534EBC(id *a1)
{

  sub_20E534F04();
  return a1;
}

uint64_t sub_20E534F04()
{
  return swift_bridgeObjectRelease();
}

uint64_t sub_20E534F0C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  void *v3;
  char **v4;
  uint64_t v5;
  unint64_t v6;
  int v7;
  char v8;
  uint64_t v9;
  uint64_t result;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  unsigned int v22;
  unsigned int v23;
  uint64_t v24;
  unsigned int v25;
  __int128 v26;
  void *v27;
  unint64_t v28;
  char **v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unsigned int v35;
  uint64_t v36;
  id v37;
  void *v38;
  uint64_t v39;
  unsigned int v40;
  uint64_t v41;
  unsigned int v42;
  uint64_t v43;
  _QWORD *v44;
  id v45;
  unsigned __int8 v46;
  void *v47;
  char **v48;
  uint64_t v49;
  char v50;
  unint64_t v51;
  unsigned int v52;
  int v53;
  uint64_t v54;

  v3 = *(void **)v1;
  v4 = *(char ***)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(unsigned __int8 *)(v1 + 24);
  v7 = *(unsigned __int8 *)(v1 + 41);
  v52 = *(unsigned __int8 *)(v1 + 44);
  v53 = *(unsigned __int8 *)(v1 + 42);
  v8 = *(_BYTE *)(v1 + 45);
  objc_opt_self();
  v9 = swift_dynamicCastObjCClass();
  if (!v9 || v7)
  {
    *a1 = v4;
    a1[1] = v5;
    a1[3] = 0;
    a1[4] = 0;
    a1[2] = v6 | 0x4000000000000000;
    return sub_20E534780();
  }
  v50 = v8;
  v45 = (id)v9;
  swift_unknownObjectRetain();
  v11 = v3;
  sub_20E534780();
  v12 = objc_msgSend(v11, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v13 = sub_20E5572FC();

  v54 = MEMORY[0x24BEE4AF8];
  if (v13 >> 62)
    goto LABEL_29;
  v14 = *(_QWORD *)((v13 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v14)
  {
LABEL_7:
    v47 = v11;
    v48 = v4;
    v51 = v6;
    v49 = v5;
    v44 = a1;
    v6 = 0;
    a1 = (_QWORD *)(v13 & 0xFFFFFFFFFFFFFF8);
    v4 = &selRef_initWithCredentialID_;
    v5 = v52;
    while (1)
    {
      if ((v13 & 0xC000000000000001) != 0)
      {
        v15 = (void *)MEMORY[0x212BBE86C](v6, v13);
        v11 = (id)(v6 + 1);
        if (__OFADD__(v6, 1))
        {
LABEL_26:
          __break(1u);
LABEL_27:
          v20 = v54;
          a1 = v44;
          v4 = v48;
          v5 = v49;
          v6 = v51;
          v11 = v47;
          goto LABEL_31;
        }
      }
      else
      {
        if (v6 >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10))
        {
          __break(1u);
LABEL_29:
          v14 = sub_20E557500();
          if (!v14)
            break;
          goto LABEL_7;
        }
        v15 = *(void **)(v13 + 8 * v6 + 32);
        swift_unknownObjectRetain();
        v11 = (id)(v6 + 1);
        if (__OFADD__(v6, 1))
          goto LABEL_26;
      }
      if (objc_msgSend(v15, v4[186]) != (id)2)
        goto LABEL_8;
      objc_opt_self();
      v16 = (void *)swift_dynamicCastObjCClassUnconditional();
      swift_unknownObjectRetain();
      v17 = objc_msgSend(v16, sel_externalCredentialProviderName);
      if (v17)
      {
        v18 = v17;
        swift_unknownObjectRelease();

LABEL_16:
        sub_20E55747C();
        sub_20E5574A0();
        v4 = &selRef_initWithCredentialID_;
        sub_20E5574AC();
        sub_20E557488();
        goto LABEL_9;
      }
      if (!(_DWORD)v5)
      {
        swift_unknownObjectRelease_n();
        goto LABEL_9;
      }
      if (v53)
      {
        swift_unknownObjectRelease();
      }
      else
      {
        v19 = v47;
        sub_20E534780();
        v46 = objc_msgSend(v19, sel_isRegistrationRequest);

        swift_unknownObjectRelease();
        v4 = &selRef_initWithCredentialID_;
        v5 = v52;
        sub_20E534F04();
        if ((v46 & 1) != 0)
          goto LABEL_8;
      }
      if ((v50 & 1) != 0)
        goto LABEL_16;
LABEL_8:
      swift_unknownObjectRelease();
LABEL_9:
      ++v6;
      if (v11 == (id)v14)
        goto LABEL_27;
    }
  }
  v20 = MEMORY[0x24BEE4AF8];
LABEL_31:

  sub_20E534F04();
  swift_bridgeObjectRelease();
  if (v20 < 0 || (v20 & 0x4000000000000000) != 0)
    v21 = sub_20E557500();
  else
    v21 = *(_QWORD *)(v20 + 16);
  swift_release();
  v22 = objc_msgSend(v11, sel_isRegistrationRequest);
  v23 = v22;
  if (v21 >= 2)
  {
    result = swift_unknownObjectRelease();
    if (v23)
    {
      v24 = v6 | 0x7000000000000000;
      result = sub_20E534780();
    }
    else
    {
      v4 = 0;
      v5 = 0;
      v24 = 0x8000000000000000;
    }
    *a1 = v4;
    a1[1] = v5;
    a1[4] = 0;
    a1[2] = v24;
    goto LABEL_44;
  }
  if (!v22)
  {
    if (objc_msgSend(v11, sel_shouldUseFallbackPasskeyUI))
    {
      result = swift_unknownObjectRelease();
      *(_OWORD *)a1 = xmmword_20E55EC80;
      a1[4] = 0;
      a1[2] = 0x8000000000000000;
LABEL_44:
      a1[3] = 0;
      return result;
    }
    v27 = v11;
    v28 = v6;
    v29 = v4;
    v30 = objc_msgSend(v27, sel_destinationSiteForCrossSiteAssertion);
    if (v30)
    {
      v31 = v30;
      v32 = sub_20E5572B4();
      v34 = v33;

      v35 = objc_msgSend(v45, sel_isSharedCredential);
      swift_unknownObjectRelease();
      *a1 = v29;
      a1[1] = v5;
      if (!v35)
      {
        v41 = v28 | 0x1000000000000000;
        goto LABEL_59;
      }
      v36 = 0x5800000000000000;
    }
    else
    {
      v37 = objc_msgSend(v27, sel_proxiedOriginDeviceName);
      if (!v37)
      {
        v42 = objc_msgSend(v45, sel_isSharedCredential);
        swift_unknownObjectRelease();
        *a1 = v4;
        a1[1] = v5;
        if (v42)
          v43 = v6 | 0x5000000000000000;
        else
          v43 = v6 | 0x800000000000000;
        a1[2] = v43;
        a1[3] = 0;
        a1[4] = 0;
        return sub_20E534780();
      }
      v38 = v37;
      v32 = sub_20E5572B4();
      v34 = v39;

      v40 = objc_msgSend(v45, sel_isSharedCredential);
      swift_unknownObjectRelease();
      *a1 = v29;
      a1[1] = v5;
      if (!v40)
      {
        v41 = v28 | 0x2000000000000000;
        goto LABEL_59;
      }
      v36 = 0x6800000000000000;
    }
    v41 = v28 | v36;
LABEL_59:
    a1[2] = v41;
    a1[3] = v32;
    a1[4] = v34;
    return sub_20E534780();
  }
  v25 = objc_msgSend(v45, sel_isExternal);
  result = swift_unknownObjectRelease();
  if (v25)
    v26 = xmmword_20E55ECA0;
  else
    v26 = xmmword_20E55EC90;
  *(_OWORD *)a1 = v26;
  a1[2] = 0x8000000000000000;
  a1[3] = 0;
  a1[4] = 0;
  return result;
}

void sub_20E5354C0(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  unint64_t v5;
  id v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  unint64_t v31;
  char v32;
  uint64_t v33;
  __int128 v34;
  char v35;
  id v36;
  _QWORD *v37;
  int v38;
  int v39;
  void *v40;
  unsigned int v41;
  void *v42;
  int v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  uint64_t v47;

  if (*(_BYTE *)(v1 + 41) == 1)
    goto LABEL_61;
  v3 = *(void **)v1;
  v4 = *(_QWORD *)(v1 + 16);
  LODWORD(v5) = *(unsigned __int8 *)(v1 + 24);
  v6 = *(id *)(v1 + 32);
  v38 = *(unsigned __int8 *)(v1 + 42);
  v43 = *(unsigned __int8 *)(v1 + 44);
  v39 = *(unsigned __int8 *)(v1 + 45);
  v47 = MEMORY[0x24BEE4B08];
  v40 = v3;
  v7 = objc_msgSend(v3, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v8 = sub_20E5572FC();

  if (v8 >> 62)
  {
LABEL_55:
    swift_bridgeObjectRetain();
    v9 = sub_20E557500();
    swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_4;
LABEL_56:
    swift_bridgeObjectRelease();
LABEL_57:
    if (v43 != 2)
      goto LABEL_60;
    switch((unint64_t)v6)
    {
      case 1uLL:
        swift_bridgeObjectRelease();
        v33 = 2;
        goto LABEL_62;
      case 2uLL:
        swift_bridgeObjectRelease();
        v34 = xmmword_20E55ECC0;
        break;
      case 4uLL:
        swift_bridgeObjectRelease();
        v34 = xmmword_20E55ECB0;
        break;
      default:
        swift_bridgeObjectRelease();
        *(_QWORD *)a1 = 0;
        *(_QWORD *)(a1 + 8) = 0;
        *(_QWORD *)(a1 + 16) = 0;
        goto LABEL_63;
    }
    *(_OWORD *)a1 = v34;
    *(_QWORD *)(a1 + 16) = 0;
    *(_BYTE *)(a1 + 24) = 0;
    return;
  }
  v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v9)
    goto LABEL_56;
LABEL_4:
  v41 = v5;
  v42 = (void *)v4;
  v36 = v6;
  v37 = (_QWORD *)a1;
  v10 = 0;
  v11 = 0;
  v45 = v8 & 0xC000000000000001;
  v44 = 0;
  v35 = 0;
  do
  {
    LODWORD(v5) = 0;
    v12 = v11;
LABEL_9:
    if (v45)
    {
      a1 = MEMORY[0x212BBE86C](v12, v8);
      v11 = v12 + 1;
      if (__OFADD__(v12, 1))
        goto LABEL_53;
    }
    else
    {
      if (v12 >= *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
        goto LABEL_54;
      a1 = *(_QWORD *)(v8 + 32 + 8 * v12);
      swift_unknownObjectRetain();
      v11 = v12 + 1;
      if (__OFADD__(v12, 1))
      {
LABEL_53:
        __break(1u);
LABEL_54:
        __break(1u);
        goto LABEL_55;
      }
    }
    objc_opt_self();
    v13 = swift_dynamicCastObjCClass();
    if (!v13)
    {
LABEL_7:
      swift_unknownObjectRelease();
      goto LABEL_8;
    }
    v4 = v13;
    swift_unknownObjectRetain();
    v14 = objc_msgSend((id)v4, sel_externalCredentialProviderName);
    if (!v14)
      goto LABEL_38;
    v15 = v14;
    v16 = sub_20E5572B4();
    v6 = v17;

    sub_20E535CC8(&v46, v16, (uint64_t)v6);
    swift_bridgeObjectRelease();
    if (!v10)
    {
      v18 = objc_msgSend((id)v4, sel_externalCredentialProviderBundleID);
      if (!v18)
      {
        swift_unknownObjectRelease_n();
        v44 = 0;
        v10 = 0;
        if (v11 == v9)
          break;
        goto LABEL_21;
      }
      v19 = v18;
      v44 = sub_20E5572B4();
      v10 = v20;

    }
    swift_unknownObjectRelease_n();
    if (v11 == v9)
      break;
LABEL_21:
    v5 = v12 + 5;
    while (1)
    {
      v21 = v5 - 4;
      if (v45)
      {
        a1 = MEMORY[0x212BBE86C](v5 - 4, v8);
        v11 = v5 - 3;
        if (__OFADD__(v21, 1))
          goto LABEL_53;
      }
      else
      {
        if (v21 >= *(_QWORD *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10))
          goto LABEL_54;
        a1 = *(_QWORD *)(v8 + 8 * v5);
        swift_unknownObjectRetain();
        v11 = v5 - 3;
        if (__OFADD__(v21, 1))
          goto LABEL_53;
      }
      objc_opt_self();
      v22 = swift_dynamicCastObjCClass();
      if (!v22)
      {
        LODWORD(v5) = 1;
        goto LABEL_7;
      }
      v23 = (void *)v22;
      swift_unknownObjectRetain();
      v24 = objc_msgSend(v23, sel_externalCredentialProviderName);
      if (!v24)
        break;
      v25 = v24;
      v6 = (id)sub_20E5572B4();
      v4 = v26;

      sub_20E535CC8(&v46, (uint64_t)v6, v4);
      swift_bridgeObjectRelease();
      if (!v10)
      {
        v27 = objc_msgSend(v23, sel_externalCredentialProviderBundleID);
        if (!v27)
        {
          swift_unknownObjectRelease_n();
          v44 = 0;
          v10 = 0;
          goto LABEL_34;
        }
        v28 = v27;
        v44 = sub_20E5572B4();
        v10 = v29;

      }
      swift_unknownObjectRelease_n();
LABEL_34:
      ++v5;
      if (v11 == v9)
        goto LABEL_48;
    }
    LODWORD(v5) = 1;
LABEL_38:
    v30 = v40;
    v6 = v42;
    v4 = v41;
    sub_20E534780();
    if (!v43)
    {

      swift_unknownObjectRelease_n();
      sub_20E534F04();
      goto LABEL_8;
    }
    if (v38)
    {

      swift_unknownObjectRelease_n();
      sub_20E534F04();
      if ((v39 & 1) != 0)
        goto LABEL_47;
LABEL_8:
      v12 = v11;
      if (v11 == v9)
        break;
      goto LABEL_9;
    }
    v6 = objc_msgSend(v30, sel_isRegistrationRequest);

    swift_unknownObjectRelease_n();
    sub_20E534F04();
    if (((v6 | v39 ^ 1) & 1) != 0)
      goto LABEL_8;
LABEL_47:
    v35 = 1;
  }
  while (!(v5 & 1 | (v11 == v9)));
LABEL_48:
  swift_bridgeObjectRelease();
  v6 = v36;
  a1 = (uint64_t)v37;
  if (!v10)
    goto LABEL_57;
  if ((v35 & 1) != 0)
  {
    swift_bridgeObjectRelease();
    goto LABEL_60;
  }
  v31 = *(_QWORD *)(v47 + 16);
  swift_bridgeObjectRelease();
  if (v31 < 2)
  {
    *v37 = v44;
    v37[1] = v10;
    v37[2] = 0;
    v32 = 1;
    goto LABEL_64;
  }
LABEL_60:
  swift_bridgeObjectRelease();
LABEL_61:
  v33 = 1;
LABEL_62:
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_QWORD *)a1 = v33;
LABEL_63:
  v32 = 4;
LABEL_64:
  *(_BYTE *)(a1 + 24) = v32;
}

uint64_t sub_20E535A74@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  int v5;
  char v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v19;
  uint64_t v20;
  uint64_t v21;

  v3 = *(void **)v1;
  v4 = *(_QWORD *)(v1 + 32);
  v5 = *(unsigned __int8 *)(v1 + 44);
  v6 = *(_BYTE *)(v1 + 49);
  objc_opt_self();
  v7 = swift_dynamicCastObjCClass();
  if (v7)
  {
    v8 = (void *)v7;
    swift_unknownObjectRetain();
    if (objc_msgSend(v8, sel_isExternal))
    {
      if (qword_254A28EC8 != -1)
        swift_once();
      v10 = qword_254A2A9D0;
      v9 = *(_QWORD *)algn_254A2A9D8;
      swift_bridgeObjectRetain();
      result = swift_unknownObjectRelease();
      *(_QWORD *)a1 = v10;
      *(_QWORD *)(a1 + 8) = v9;
      goto LABEL_21;
    }
    v13 = objc_msgSend(v3, sel_platformUserVerificationPreference);
    v14 = sub_20E5572B4();
    v16 = v15;

    if (v14 == sub_20E5572B4() && v16 == v17)
    {
      swift_bridgeObjectRelease_n();
    }
    else
    {
      v19 = sub_20E557560();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v19 & 1) == 0)
      {
        if (v5)
        {
LABEL_15:
          if (v5 == 1 || v4 != 1)
          {
            if (qword_254A28EC8 != -1)
              swift_once();
            v21 = qword_254A2A9D0;
            v20 = *(_QWORD *)algn_254A2A9D8;
            swift_bridgeObjectRetain();
            result = swift_unknownObjectRelease();
            *(_QWORD *)a1 = v21;
            *(_QWORD *)(a1 + 8) = v20;
            *(_BYTE *)(a1 + 16) = v6;
          }
          else
          {
            result = swift_unknownObjectRelease();
            *(_QWORD *)a1 = 0;
            *(_QWORD *)(a1 + 8) = 0;
            *(_BYTE *)(a1 + 16) = 3;
          }
          return result;
        }
LABEL_20:
        result = swift_unknownObjectRelease();
        *(_OWORD *)a1 = xmmword_20E55ECD0;
LABEL_21:
        *(_BYTE *)(a1 + 16) = 0;
        return result;
      }
    }
    v6 = 1;
    if (v5)
      goto LABEL_15;
    goto LABEL_20;
  }
  if (qword_254A28EC8 != -1)
    swift_once();
  v12 = *(_QWORD *)algn_254A2A9D8;
  *(_QWORD *)a1 = qword_254A2A9D0;
  *(_QWORD *)(a1 + 8) = v12;
  *(_BYTE *)(a1 + 16) = 0;
  return swift_bridgeObjectRetain();
}

uint64_t sub_20E535CC8(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_20E5575A8();
  swift_bridgeObjectRetain();
  sub_20E5572CC();
  v8 = sub_20E5575C0();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_20E557560() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_20E557560() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_20E536150(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_20E535E74()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29288);
  v3 = sub_20E557434();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = swift_retain();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_20E5575A8();
      sub_20E5572CC();
      result = sub_20E5575C0();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_20E536150(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_20E535E74();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_20E5362E8();
      goto LABEL_22;
    }
    sub_20E536498();
  }
  v11 = *v4;
  sub_20E5575A8();
  sub_20E5572CC();
  result = sub_20E5575C0();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_20E557560(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_20E557578();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_20E557560();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_20E5362E8()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29288);
  v2 = *v0;
  v3 = sub_20E557428();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_20E536498()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29288);
  v3 = sub_20E557434();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = swift_retain();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_20E5575A8();
    swift_bridgeObjectRetain();
    sub_20E5572CC();
    result = sub_20E5575C0();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

uint64_t sub_20E536744@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  unint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unsigned int v20;
  id v21;
  unint64_t v22;
  uint64_t v23;
  id v24;
  unint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;

  v4 = *(void **)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v5 = *(_QWORD *)(v1 + 16);
  v6 = *(unsigned __int8 *)(v1 + 24);
  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v28 = (id)result;
    swift_unknownObjectRetain();
    ASAuthorizationUIContext.loginChoicesToShow.getter();
    if (v8 >> 62)
      v9 = sub_20E557500();
    else
      v9 = *(_QWORD *)((v8 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRelease();
    v10 = objc_msgSend(v4, sel_proxiedOriginDeviceName);
    v11 = v10;
    if (v9 == 1)
    {
      if (v10)
      {
        v12 = sub_20E5572B4();
        v14 = v13;

        v15 = objc_msgSend(v28, sel_isSharedCredential);
        swift_unknownObjectRelease();
        *a1 = v3;
        a1[1] = v5;
        if (v15)
          v16 = v6 | 0x6000000000000000;
        else
          v16 = v6 | 0x1800000000000000;
        a1[2] = v16;
        a1[3] = v12;
        a1[4] = v14;
      }
      else
      {
        v20 = objc_msgSend(v28, sel_isSharedCredential);
        swift_unknownObjectRelease();
        *a1 = v3;
        a1[1] = v5;
        a1[4] = 0;
        if (v20)
          a1[2] = v6 | 0x4800000000000000;
        else
          a1[2] = v6;
        a1[3] = 0;
      }
    }
    else if (v10)
    {
      v17 = sub_20E5572B4();
      v19 = v18;
      swift_unknownObjectRelease();

      *a1 = v3;
      a1[1] = v5;
      a1[2] = v6 | 0x3000000000000000;
      a1[3] = v17;
      a1[4] = v19;
    }
    else
    {
      v21 = objc_msgSend(v4, sel_localAccountLoginChoices);
      __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
      v22 = sub_20E5572FC();

      if (v22 >> 62)
      {
        swift_bridgeObjectRetain();
        v23 = sub_20E557500();
        swift_bridgeObjectRelease();
      }
      else
      {
        v23 = *(_QWORD *)((v22 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      v24 = objc_msgSend(v4, sel_loginChoices);
      v25 = sub_20E5572FC();

      if (v25 >> 62)
      {
        swift_bridgeObjectRetain();
        v26 = sub_20E557500();
        swift_unknownObjectRelease();
        swift_bridgeObjectRelease_n();
      }
      else
      {
        v26 = *(_QWORD *)((v25 & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRelease();
        swift_unknownObjectRelease();
      }
      *a1 = v3;
      a1[1] = v5;
      if (v23 == v26)
        v27 = v6 | 0x3800000000000000;
      else
        v27 = v6 | 0x4000000000000000;
      a1[2] = v27;
      a1[3] = 0;
      a1[4] = 0;
    }
    return sub_20E534780();
  }
  else
  {
    *a1 = 0;
    a1[1] = 0;
    a1[3] = 0;
    a1[4] = 0;
    a1[2] = 0x8000000000000000;
  }
  return result;
}

void sub_20E536B18(uint64_t a1@<X8>)
{
  uint64_t v1;
  id v3;
  int v4;
  id v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (*(_BYTE *)(v1 + 40))
  {
    __break(1u);
  }
  else
  {
    v3 = *(id *)v1;
    v4 = *(unsigned __int8 *)(v1 + 41);
    v5 = objc_msgSend(*(id *)v1, sel_proxiedIconData);
    if (v5)
    {
      v6 = v5;
      v7 = sub_20E556DBC();
      v9 = v8;

      v10 = objc_msgSend(v3, sel_proxiedIconScale);
      if (v10)
      {
        v11 = v10;
        objc_msgSend(v10, sel_doubleValue);
        v13 = v12;

        *(_QWORD *)a1 = v7;
        *(_QWORD *)(a1 + 8) = v9;
        *(_QWORD *)(a1 + 16) = v13;
        *(_BYTE *)(a1 + 24) = 2;
        return;
      }
      sub_20E52F4EC(v7, v9);
    }
    if (v4)
    {
      v14 = objc_msgSend(v3, sel_appIdentifier);
      v15 = sub_20E5572B4();
      v17 = v16;

      *(_QWORD *)a1 = v15;
      *(_QWORD *)(a1 + 8) = v17;
      *(_QWORD *)(a1 + 16) = 0;
      *(_BYTE *)(a1 + 24) = 1;
    }
    else
    {
      sub_20E53EDC0((uint64_t *)a1);
    }
  }
}

uint64_t ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  int v26;
  unsigned __int8 v27;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20E5570E0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29950);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(v1, sel_extensions);
  sub_20E5570EC();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6))
  {
    result = sub_20E52E370((uint64_t)v12, &qword_254A29950);
    *(_QWORD *)a1 = 2;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
    sub_20E52E370((uint64_t)v12, &qword_254A29950);
    v26 = sub_20E5570D4();
    sub_20E5570BC();
    v15 = sub_20E556F78();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v15) == 1)
    {
      sub_20E52E370((uint64_t)v5, &qword_254A28F00);
      v17 = 0;
      v18 = 0;
      v19 = 0;
      v20 = 0xF000000000000000;
    }
    else
    {
      v25 = sub_20E556F48();
      v20 = v21;
      v18 = sub_20E556F54();
      v19 = v22;
      v23 = v5;
      v17 = v25;
      (*(void (**)(char *, uint64_t))(v16 + 8))(v23, v15);
    }
    v27 = v26 & 1;
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *(_QWORD *)a1 = v27;
    *(_QWORD *)(a1 + 8) = v17;
    *(_QWORD *)(a1 + 16) = v20;
    *(_QWORD *)(a1 + 24) = v18;
    *(_QWORD *)(a1 + 32) = v19;
  }
  return result;
}

void sub_20E536F10(uint64_t *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5[5];

  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5[0] = *a1;
  v5[1] = v1;
  v5[2] = v2;
  v5[3] = v3;
  v5[4] = v4;
  sub_20E537B60(v5[0], v1, v2, v3, v4);
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.setter(v5);
}

void ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.setter(uint64_t *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29950);
  MEMORY[0x24BDAC7A8](v6);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v14 = objc_msgSend(v1, sel_extensions);
  if (v9 == 2)
  {
    v15 = sub_20E5570E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 1, 1, v15);
  }
  else
  {
    if (v11 >> 60 == 15)
    {
      v16 = sub_20E556F78();
      (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v5, 1, 1, v16);
    }
    else
    {
      sub_20E52F7E4(v10, v11);
      sub_20E52F828(v12, v13);
      sub_20E556F3C();
      v17 = sub_20E556F78();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 0, 1, v17);
    }
    sub_20E5570C8();
    sub_20E537B3C(v9, v10, v11, v12, v13);
    v18 = sub_20E5570E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v8, 0, 1, v18);
  }
  sub_20E5570F8();

}

void (*ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.getter((uint64_t)v3);
  return sub_20E537184;
}

void sub_20E537184(uint64_t **a1, char a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9[5];

  v3 = *a1;
  v4 = **a1;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  v9[3] = v7;
  v9[4] = v8;
  if ((a2 & 1) != 0)
  {
    sub_20E537B60(v4, v5, v6, v7, v8);
    ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.setter(v9);
    sub_20E537B3C(*v3, v3[1], v3[2], v3[3], v3[4]);
  }
  else
  {
    ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.setter(v9);
  }
  free(v3);
}

id ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__largeBlobSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id result;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v1 = sub_20E557104();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v19 - v6;
  v8 = sub_20E557128();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29940);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(v0, sel_extensions);
  sub_20E557134();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
  {
    sub_20E52E370((uint64_t)v14, (uint64_t *)&unk_254A29940);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_20E52E370((uint64_t)v14, (uint64_t *)&unk_254A29940);
  sub_20E55711C();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v1);
  if (v17 == *MEMORY[0x24BE0B0D8])
  {
    v18 = 0;
  }
  else
  {
    if (v17 != *MEMORY[0x24BE0B0E0])
    {
      result = (id)sub_20E5574F4();
      __break(1u);
      return result;
    }
    v18 = 1;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput), sel_initWithSupportRequirement_, v18);
}

void ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__largeBlobSwift.setter(id a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v2 = v1;
  v4 = sub_20E557104();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v16 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29940);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v2, sel_extensions);
  if (!a1)
  {
    v14 = sub_20E557128();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v10, 1, 1, v14);
LABEL_8:
    sub_20E557140();

    return;
  }
  a1 = a1;
  v12 = objc_msgSend(a1, sel_supportRequirement);
  if (!v12)
  {
    v13 = (unsigned int *)MEMORY[0x24BE0B0D8];
LABEL_7:
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *v13, v4);
    sub_20E557110();

    v15 = sub_20E557128();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v10, 0, 1, v15);
    goto LABEL_8;
  }
  if (v12 == (id)1)
  {
    v13 = (unsigned int *)MEMORY[0x24BE0B0E0];
    goto LABEL_7;
  }
  sub_20E5574F4();
  __break(1u);
}

id ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__prfSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v22;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v22 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20E5570E0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29950);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v22 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v0, sel_extensions);
  sub_20E5570EC();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_20E52E370((uint64_t)v10, &qword_254A29950);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_20E52E370((uint64_t)v10, &qword_254A29950);
    sub_20E5570D4();
    sub_20E5570BC();
    v13 = sub_20E556F78();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v3, 1, v13) == 1)
    {
      sub_20E52E370((uint64_t)v3, &qword_254A28F00);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0xF000000000000000;
    }
    else
    {
      v15 = sub_20E556F48();
      v18 = v19;
      v16 = sub_20E556F54();
      v17 = v20;
      (*(void (**)(char *, uint64_t))(v14 + 8))(v3, v13);
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v12 = objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFRegistrationInput), sel_initWithInputValues_, 0);
    sub_20E52F4B0(v15, v18, v16, v17);
  }
  return v12;
}

void ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.__prfSwift.setter(id a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29950);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = objc_msgSend(v1, sel_extensions);
  if (a1)
  {
    a1 = a1;
    sub_20E53A02C();

    v7 = sub_20E5570E0();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5, 0, 1, v7);
  }
  else
  {
    v8 = sub_20E5570E0();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v5, 1, 1, v8);
  }
  sub_20E5570F8();

}

id static ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.emptyExtensions()()
{
  return objc_msgSend(objc_allocWithZone((Class)sub_20E55714C()), sel_init);
}

uint64_t sub_20E537B3C(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  if (result != 2)
    return sub_20E52F4B0(a2, a3, a4, a5);
  return result;
}

uint64_t sub_20E537B60(uint64_t result, uint64_t a2, unint64_t a3, uint64_t a4, unint64_t a5)
{
  if (result != 2)
    return sub_20E537B84(a2, a3, a4, a5);
  return result;
}

uint64_t sub_20E537B84(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4)
{
  if (a2 >> 60 != 15)
  {
    sub_20E52F7E4(result, a2);
    return sub_20E52F828(a3, a4);
  }
  return result;
}

double sub_20E537BC0@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.prf.getter((uint64_t)v5);
  v2 = v6;
  result = *(double *)v5;
  v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v2;
  return result;
}

char *keypath_get_selector___largeBlobSwift()
{
  return sel___largeBlobSwift;
}

id sub_20E537C10@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel___largeBlobSwift);
  *a2 = result;
  return result;
}

id sub_20E537C48(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel___setLargeBlobSwift_, *a1);
}

char *keypath_get_selector___prfSwift()
{
  return sel___prfSwift;
}

id sub_20E537C68@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel___prfSwift);
  *a2 = result;
  return result;
}

id sub_20E537CA0(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel___setPRFSwift_, *a1);
}

double static ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.read.getter@<D0>(_OWORD *a1@<X8>)
{
  double result;

  result = 0.0;
  *a1 = xmmword_20E55ECE0;
  return result;
}

uint64_t static ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.write(_:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  *a3 = a1;
  a3[1] = a2;
  return sub_20E52F7E4(a1, a2);
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.operation.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;

  v2 = *v1;
  v3 = v1[1];
  *a1 = *v1;
  a1[1] = v3;
  return sub_20E52F828(v2, v3);
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.operation.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  result = sub_20E52F530(*(_QWORD *)v1, *(_QWORD *)(v1 + 8));
  *(_QWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = v3;
  return result;
}

uint64_t (*ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.operation.modify())()
{
  return nullsub_1;
}

void static ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.supportRequired.getter(_BYTE *a1@<X8>)
{
  *a1 = 0;
}

void static ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.supportPreferred.getter(_BYTE *a1@<X8>)
{
  *a1 = 1;
}

BOOL static ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.SupportRequirement.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.SupportRequirement.hash(into:)()
{
  return sub_20E5575B4();
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.SupportRequirement.hashValue.getter()
{
  sub_20E5575A8();
  sub_20E5575B4();
  return sub_20E5575C0();
}

BOOL sub_20E537DB4(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_20E537DCC()
{
  sub_20E5575A8();
  sub_20E5575B4();
  return sub_20E5575C0();
}

uint64_t sub_20E537E10()
{
  return sub_20E5575B4();
}

uint64_t sub_20E537E38()
{
  sub_20E5575A8();
  sub_20E5575B4();
  return sub_20E5575C0();
}

void ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.supportRequirement.getter(_BYTE *a1@<X8>)
{
  _BYTE *v1;

  *a1 = *v1;
}

_BYTE *ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.supportRequirement.setter(_BYTE *result)
{
  _BYTE *v1;

  *v1 = *result;
  return result;
}

uint64_t (*ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.supportRequirement.modify())()
{
  return nullsub_1;
}

uint64_t static ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.read(data:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X8>)
{
  *(_QWORD *)a3 = a1;
  *(_QWORD *)(a3 + 8) = a2;
  *(_BYTE *)(a3 + 16) = 0;
  return sub_20E52F828(a1, a2);
}

uint64_t static ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.write(success:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = result & 1;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  return result;
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.result.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  char v4;

  v2 = *(_QWORD *)v1;
  v3 = *(_QWORD *)(v1 + 8);
  v4 = *(_BYTE *)(v1 + 16);
  *(_QWORD *)a1 = *(_QWORD *)v1;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = v4;
  return sub_20E537ED4(v2, v3, v4);
}

uint64_t sub_20E537ED4(uint64_t a1, unint64_t a2, char a3)
{
  if ((a3 & 1) == 0)
    return sub_20E52F828(a1, a2);
  return a1;
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.result.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = sub_20E530B8C(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16));
  *(_QWORD *)v1 = v2;
  *(_QWORD *)(v1 + 8) = v3;
  *(_BYTE *)(v1 + 16) = v4;
  return result;
}

uint64_t (*ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.result.modify())()
{
  return nullsub_1;
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput.isSupported.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput.isSupported.setter(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput.isSupported.modify())()
{
  return nullsub_1;
}

uint64_t ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.largeBlob.getter@<X0>(char *a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t result;
  char v19;
  int v20;
  uint64_t v22;

  v3 = sub_20E557104();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v22 - v8;
  v10 = sub_20E557128();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29940);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(v1, sel_extensions);
  sub_20E557134();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10))
  {
    result = sub_20E52E370((uint64_t)v16, (uint64_t *)&unk_254A29940);
    v19 = 2;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v16, v10);
    sub_20E52E370((uint64_t)v16, (uint64_t *)&unk_254A29940);
    sub_20E55711C();
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    v20 = (*(uint64_t (**)(char *, uint64_t))(v4 + 88))(v7, v3);
    if (v20 != *MEMORY[0x24BE0B0D8] && v20 != *MEMORY[0x24BE0B0E0])
    {
      result = sub_20E5574F4();
      __break(1u);
      return result;
    }
    v19 = v20 != *MEMORY[0x24BE0B0D8];
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  }
  *a1 = v19;
  return result;
}

void ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.largeBlob.setter(unsigned __int8 *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  int v10;
  id v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_20E557104();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29940);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = *a1;
  v11 = objc_msgSend(v1, sel_extensions);
  if (v10 == 2)
  {
    v12 = sub_20E557128();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(v9, 1, 1, v12);
  }
  else
  {
    v13 = (unsigned int *)MEMORY[0x24BE0B0D8];
    if ((v10 & 1) != 0)
      v13 = (unsigned int *)MEMORY[0x24BE0B0E0];
    (*(void (**)(char *, _QWORD, uint64_t))(v4 + 104))(v6, *v13, v3);
    sub_20E557110();
    v14 = sub_20E557128();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v9, 0, 1, v14);
  }
  sub_20E557140();

}

void (*ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.largeBlob.modify(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  size_t v7;

  v3 = malloc(0x40uLL);
  *a1 = v3;
  *(_QWORD *)v3 = v1;
  v4 = sub_20E557104();
  *((_QWORD *)v3 + 1) = v4;
  v5 = *(_QWORD *)(v4 - 8);
  *((_QWORD *)v3 + 2) = v5;
  v6 = *(_QWORD *)(v5 + 64);
  *((_QWORD *)v3 + 3) = malloc(v6);
  *((_QWORD *)v3 + 4) = malloc(v6);
  v7 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29940) - 8) + 64);
  *((_QWORD *)v3 + 5) = malloc(v7);
  *((_QWORD *)v3 + 6) = malloc(v7);
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.largeBlob.getter((char *)v3 + 56);
  return sub_20E53838C;
}

void sub_20E53838C(id **a1, char a2)
{
  id *v3;
  int v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  unsigned int *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  unsigned int *v15;
  id v16;
  uint64_t v17;

  v3 = *a1;
  v4 = *((unsigned __int8 *)*a1 + 56);
  v5 = objc_msgSend(**a1, sel_extensions);
  if ((a2 & 1) != 0)
  {
    if (v4 == 2)
    {
      v6 = 1;
    }
    else
    {
      v8 = (unsigned int *)MEMORY[0x24BE0B0D8];
      if ((v4 & 1) != 0)
        v8 = (unsigned int *)MEMORY[0x24BE0B0E0];
      (*((void (**)(id, _QWORD, id))v3[2] + 13))(v3[3], *v8, v3[1]);
      sub_20E557110();
      v6 = 0;
    }
    v9 = v3[5];
    v10 = v3[6];
    v12 = v3[3];
    v11 = v3[4];
    v13 = sub_20E557128();
    (*(void (**)(id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, v6, 1, v13);
    v14 = v9;
  }
  else
  {
    if (v4 == 2)
    {
      v7 = 1;
    }
    else
    {
      v15 = (unsigned int *)MEMORY[0x24BE0B0D8];
      if ((v4 & 1) != 0)
        v15 = (unsigned int *)MEMORY[0x24BE0B0E0];
      (*((void (**)(id, _QWORD, id))v3[2] + 13))(v3[4], *v15, v3[1]);
      sub_20E557110();
      v7 = 0;
    }
    v14 = v3[5];
    v16 = v3[6];
    v12 = v3[3];
    v11 = v3[4];
    v17 = sub_20E557128();
    (*(void (**)(id, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v16, v7, 1, v17);
    v10 = v16;
  }
  sub_20E557140();

  free(v10);
  free(v14);
  free(v11);
  free(v12);
  free(v3);
}

uint64_t ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.largeBlob.getter@<X0>(_QWORD *a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  id v17;
  uint64_t result;
  uint64_t v19;
  unint64_t v20;
  int v21;
  uint64_t v22;

  v3 = sub_20E556FC0();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (uint64_t *)((char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v22 - v8;
  v10 = sub_20E556FE4();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v22 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28EF8);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)&v22 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = objc_msgSend(v1, sel_extensions);
  sub_20E556FF0();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v16, 1, v10))
  {
    result = sub_20E52E370((uint64_t)v16, &qword_254A28EF8);
    v19 = 0;
    v20 = 0xB000000000000000;
LABEL_8:
    *a1 = v19;
    a1[1] = v20;
    return result;
  }
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v13, v16, v10);
  sub_20E52E370((uint64_t)v16, &qword_254A28EF8);
  sub_20E556FD8();
  (*(void (**)(uint64_t *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
  v21 = (*(uint64_t (**)(uint64_t *, uint64_t))(v4 + 88))(v7, v3);
  if (v21 == *MEMORY[0x24BE0AFA8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v4 + 96))(v7, v3);
    v19 = *v7;
    v20 = v7[1];
LABEL_7:
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
    result = (*(uint64_t (**)(char *, uint64_t))(v11 + 8))(v13, v10);
    goto LABEL_8;
  }
  if (v21 == *MEMORY[0x24BE0AFA0])
  {
    v19 = 0;
    v20 = 0xF000000000000000;
    goto LABEL_7;
  }
  result = sub_20E5574F4();
  __break(1u);
  return result;
}

void ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.largeBlob.setter(uint64_t *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  unint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  unsigned int *v14;
  uint64_t v15;
  uint64_t v16;

  v3 = sub_20E556FC0();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (uint64_t *)((char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28EF8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = *a1;
  v10 = a1[1];
  v12 = objc_msgSend(v1, sel_extensions);
  if (v10 >> 60 == 11)
  {
    v13 = sub_20E556FE4();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 56))(v9, 1, 1, v13);
  }
  else
  {
    if (v10 >> 60 == 15)
    {
      v14 = (unsigned int *)MEMORY[0x24BE0AFA0];
    }
    else
    {
      *v6 = v11;
      v6[1] = v10;
      v14 = (unsigned int *)MEMORY[0x24BE0AFA8];
    }
    (*(void (**)(_QWORD *, _QWORD, uint64_t))(v4 + 104))(v6, *v14, v3);
    sub_20E556FCC();
    v15 = sub_20E556FE4();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v9, 0, 1, v15);
  }
  sub_20E556FFC();

}

void (*ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.largeBlob.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  size_t v6;
  size_t v7;

  v3 = malloc(0x48uLL);
  *a1 = v3;
  v3[2] = v1;
  v4 = sub_20E556FC0();
  v3[3] = v4;
  v5 = *(_QWORD *)(v4 - 8);
  v3[4] = v5;
  v6 = *(_QWORD *)(v5 + 64);
  v3[5] = malloc(v6);
  v3[6] = malloc(v6);
  v7 = *(_QWORD *)(*(_QWORD *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254A28EF8) - 8) + 64);
  v3[7] = malloc(v7);
  v3[8] = malloc(v7);
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.largeBlob.getter(v3);
  return sub_20E538994;
}

void sub_20E538994(uint64_t **a1, char a2)
{
  uint64_t *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  unsigned int *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;

  v2 = *a1;
  v4 = **a1;
  v3 = (*a1)[1];
  v5 = (void *)(*a1)[2];
  if ((a2 & 1) != 0)
  {
    sub_20E538B68(**a1, v3);
    v6 = objc_msgSend(v5, sel_extensions);
    if (v3 >> 60 == 11)
    {
      v7 = 1;
    }
    else
    {
      v11 = v2[4];
      v10 = (uint64_t *)v2[5];
      v12 = v2[3];
      if (v3 >> 60 == 15)
      {
        v13 = (unsigned int *)MEMORY[0x24BE0AFA0];
      }
      else
      {
        *v10 = v4;
        v10[1] = v3;
        v13 = (unsigned int *)MEMORY[0x24BE0AFA8];
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(v11 + 104))(v10, *v13, v12);
      sub_20E556FCC();
      v7 = 0;
    }
    v19 = (void *)v2[7];
    v18 = (void *)v2[8];
    v21 = (void *)v2[5];
    v20 = (void *)v2[6];
    v22 = sub_20E556FE4();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 56))(v19, v7, 1, v22);
    sub_20E556FFC();

    sub_20E538B7C(*v2, v2[1]);
  }
  else
  {
    v8 = objc_msgSend((id)(*a1)[2], sel_extensions);
    if (v3 >> 60 == 11)
    {
      v9 = 1;
    }
    else
    {
      v14 = (uint64_t *)v2[6];
      v15 = v2[3];
      v16 = v2[4];
      if (v3 >> 60 == 15)
      {
        v17 = (unsigned int *)MEMORY[0x24BE0AFA0];
      }
      else
      {
        *v14 = v4;
        v14[1] = v3;
        v17 = (unsigned int *)MEMORY[0x24BE0AFA8];
      }
      (*(void (**)(uint64_t *, _QWORD, uint64_t))(v16 + 104))(v14, *v17, v15);
      sub_20E556FCC();
      v9 = 0;
    }
    v19 = (void *)v2[7];
    v18 = (void *)v2[8];
    v21 = (void *)v2[5];
    v20 = (void *)v2[6];
    v23 = sub_20E556FE4();
    (*(void (**)(void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v18, v9, 1, v23);
    sub_20E556FFC();

  }
  free(v18);
  free(v19);
  free(v20);
  free(v21);
  free(v2);
}

uint64_t sub_20E538B68(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 11)
    return sub_20E52F828(a1, a2);
  return a1;
}

uint64_t sub_20E538B7C(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 11)
    return sub_20E52F530(a1, a2);
  return a1;
}

void ASAuthorizationPlatformPublicKeyCredentialRegistration.largeBlob.getter(char *a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  char v12;
  char v13;
  uint64_t v14;

  v3 = sub_20E5571C4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29190);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v14 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(v1, sel_coreCredential);
  v11 = objc_msgSend(v10, sel_extensions);

  if (v11)
  {
    sub_20E5571D0();

    if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
    {
      (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
      sub_20E52E370((uint64_t)v9, &qword_254A29190);
      v13 = sub_20E5571B8();
      (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
      v12 = v13 & 1;
      goto LABEL_6;
    }
    sub_20E52E370((uint64_t)v9, &qword_254A29190);
  }
  v12 = 2;
LABEL_6:
  *a1 = v12;
}

void ASAuthorizationPlatformPublicKeyCredentialAssertion.largeBlob.getter(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  id v16;
  id v17;
  char *v18;
  int v19;
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;

  v3 = sub_20E55705C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x24BDAC7A8](v3);
  v7 = (uint64_t *)((char *)&v24 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v5);
  v25 = (char *)&v24 - v8;
  v9 = sub_20E557080();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v24 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29130);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v24 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = objc_msgSend(v1, sel_coreCredential);
  v17 = objc_msgSend(v16, sel_extensions);

  if (!v17)
    goto LABEL_4;
  sub_20E55708C();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9))
  {
    sub_20E52E370((uint64_t)v15, &qword_254A29130);
LABEL_4:
    *(_QWORD *)a1 = 0;
    *(_QWORD *)(a1 + 8) = 0;
    *(_BYTE *)(a1 + 16) = -1;
    return;
  }
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
  sub_20E52E370((uint64_t)v15, &qword_254A29130);
  v18 = v25;
  sub_20E557074();
  (*(void (**)(uint64_t *, char *, uint64_t))(v4 + 16))(v7, v18, v3);
  v19 = (*(uint64_t (**)(uint64_t *, uint64_t))(v4 + 88))(v7, v3);
  v20 = v19;
  v21 = *MEMORY[0x24BE0B038];
  if (v19 == *MEMORY[0x24BE0B038])
  {
    (*(void (**)(uint64_t *, uint64_t))(v4 + 96))(v7, v3);
    v22 = v7[1];
    v23 = *v7;
  }
  else
  {
    if (v19 != *MEMORY[0x24BE0B040])
    {
      sub_20E5574F4();
      __break(1u);
      return;
    }
    (*(void (**)(uint64_t *, uint64_t))(v4 + 96))(v7, v3);
    v22 = 0;
    v23 = *(unsigned __int8 *)v7;
  }
  (*(void (**)(char *, uint64_t))(v4 + 8))(v25, v3);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  *(_QWORD *)a1 = v23;
  *(_QWORD *)(a1 + 8) = v22;
  *(_BYTE *)(a1 + 16) = v20 != v21;
}

unint64_t sub_20E538FB4()
{
  unint64_t result;

  result = qword_254A29290;
  if (!qword_254A29290)
  {
    result = MEMORY[0x212BBF2EC](&protocol conformance descriptor for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.SupportRequirement, &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.SupportRequirement);
    atomic_store(result, (unint64_t *)&qword_254A29290);
  }
  return result;
}

uint64_t sub_20E538FF8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  result = ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.largeBlob.getter(&v3);
  *a1 = v3;
  return result;
}

void sub_20E539030(unsigned __int8 *a1)
{
  unsigned __int8 v1;

  v1 = *a1;
  ASAuthorizationPlatformPublicKeyCredentialRegistrationRequest.largeBlob.setter(&v1);
}

double sub_20E539064@<D0>(_OWORD *a1@<X8>)
{
  double result;
  __int128 v3;

  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.largeBlob.getter(&v3);
  result = *(double *)&v3;
  *a1 = v3;
  return result;
}

void sub_20E53909C(uint64_t *a1)
{
  unint64_t v1;
  uint64_t v2[2];

  v1 = a1[1];
  v2[0] = *a1;
  v2[1] = v1;
  sub_20E538B68(v2[0], v1);
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.largeBlob.setter(v2);
}

uint64_t *destroy for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput(uint64_t *result)
{
  unint64_t v1;

  v1 = result[1];
  if (v1 >> 60 != 15)
    return (uint64_t *)sub_20E52F4EC(*result, v1);
  return result;
}

uint64_t _s22AuthenticationServices57ASAuthorizationPublicKeyCredentialLargeBlobAssertionInputVwCP_0(uint64_t a1, uint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  if (v3 >> 60 == 15)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v4 = *a2;
    sub_20E52F7E4(*a2, a2[1]);
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t *assignWithCopy for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput(uint64_t *a1, uint64_t a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = *(_QWORD *)(a2 + 8);
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 != 15)
    {
      v6 = *(_QWORD *)a2;
      sub_20E52F7E4(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
      v7 = *a1;
      v8 = a1[1];
      *a1 = v6;
      a1[1] = v4;
      sub_20E52F4EC(v7, v8);
      return a1;
    }
    sub_20E532EAC((uint64_t)a1);
    goto LABEL_6;
  }
  if (v4 >> 60 == 15)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v5 = *(_QWORD *)a2;
  sub_20E52F7E4(*(_QWORD *)a2, *(_QWORD *)(a2 + 8));
  *a1 = v5;
  a1[1] = v4;
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t *assignWithTake for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v4 = a1[1];
  if (v4 >> 60 != 15)
  {
    v5 = a2[1];
    if (v5 >> 60 != 15)
    {
      v6 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_20E52F4EC(v6, v4);
      return a1;
    }
    sub_20E532EAC((uint64_t)a1);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput(uint64_t a1, unsigned int a2)
{
  uint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 12);
  v3 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v3) & 0xC) != 0)
    v4 = 14 - ((4 * v3) & 0xC | (v3 >> 2));
  else
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)result = a2 - 12;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput;
}

uint64_t *destroy for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.Operation(uint64_t *result)
{
  unint64_t v1;

  v1 = result[1];
  if ((v1 & 0x3000000000000000) == 0)
    return (uint64_t *)sub_20E52F4EC(*result, v1);
  return result;
}

uint64_t _s22AuthenticationServices57ASAuthorizationPublicKeyCredentialLargeBlobAssertionInputV9OperationOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  if ((v3 & 0x3000000000000000) != 0)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    v4 = *a2;
    sub_20E52F7E4(*a2, a2[1]);
    *(_QWORD *)a1 = v4;
    *(_QWORD *)(a1 + 8) = v3;
  }
  return a1;
}

uint64_t *assignWithCopy for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.Operation(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v4 = a1[1];
  v5 = a2[1];
  v6 = v5 & 0x3000000000000000;
  if ((v4 & 0x3000000000000000) == 0)
  {
    if (!v6)
    {
      v9 = *a2;
      sub_20E52F7E4(v9, v5);
      v10 = *a1;
      v11 = a1[1];
      *a1 = v9;
      a1[1] = v5;
      sub_20E52F4EC(v10, v11);
      return a1;
    }
    sub_20E52F4EC(*a1, v4);
    goto LABEL_6;
  }
  if (v6)
  {
LABEL_6:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  v7 = *a2;
  sub_20E52F7E4(v7, v5);
  *a1 = v7;
  a1[1] = v5;
  return a1;
}

uint64_t *assignWithTake for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.Operation(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v7;

  v4 = a1[1];
  if ((v4 & 0x3000000000000000) == 0)
  {
    v5 = a2[1];
    if ((v5 & 0x3000000000000000) == 0)
    {
      v7 = *a1;
      *a1 = *a2;
      a1[1] = v5;
      sub_20E52F4EC(v7, v4);
      return a1;
    }
    sub_20E52F4EC(*a1, v4);
  }
  *(_OWORD *)a1 = *(_OWORD *)a2;
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.Operation(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xC && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 12);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  if (v3 + 1 >= 2)
    return v3;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.Operation(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xB)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 12;
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xC)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)((4 * (a2 ^ 0xF)) | ((a2 ^ 0xF) >> 2)) << 60;
    }
  }
  return result;
}

uint64_t sub_20E539524(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 8) >> 60;
  if (((4 * (_DWORD)v1) & 0xC) != 0)
    return 16 - ((4 * (_DWORD)v1) & 0xC | (v1 >> 2));
  else
    return 0;
}

_QWORD *sub_20E53954C(_QWORD *result, unsigned int a2)
{
  if (a2 > 0xC)
  {
    *result = a2 - 13;
    result[1] = 0;
  }
  else if (a2)
  {
    *result = 0;
    result[1] = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.Operation()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput.Operation;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput;
}

uint64_t getEnumTagSinglePayload for ASPublicKeyCredentialClientData.CrossOriginValue(unsigned __int8 *a1, unsigned int a2)
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

uint64_t _s22AuthenticationServices60ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInputV18SupportRequirementOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20E539690 + 4 * byte_20E55ECF5[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20E5396C4 + 4 * byte_20E55ECF0[v4]))();
}

uint64_t sub_20E5396C4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5396CC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E5396D4);
  return result;
}

uint64_t sub_20E5396E0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E5396E8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20E5396EC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5396F4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E539700(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_20E539708(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.SupportRequirement()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput.SupportRequirement;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput;
}

uint64_t destroy for ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.OperationResult(uint64_t a1)
{
  return sub_20E530B8C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
}

uint64_t _s22AuthenticationServices58ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutputV15OperationResultOwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_20E537ED4(*(_QWORD *)a2, v4, v5);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t _s22AuthenticationServices58ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutputV15OperationResultOwca_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  char v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_BYTE *)(a2 + 16);
  sub_20E537ED4(*(_QWORD *)a2, v4, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v8 = *(_BYTE *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_20E530B8C(v6, v7, v8);
  return a1;
}

uint64_t _s22AuthenticationServices58ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutputV15OperationResultOwta_0(uint64_t a1, uint64_t a2)
{
  char v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v3 = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  v6 = *(_BYTE *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_20E530B8C(v4, v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.Service(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 16);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.Service(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_BYTE *)(result + 16) = -(char)a2;
  }
  return result;
}

uint64_t sub_20E5398D8(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 16);
}

uint64_t sub_20E5398E0(uint64_t result, char a2)
{
  *(_BYTE *)(result + 16) = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.OperationResult()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobAssertionOutput.OperationResult;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput(unsigned __int8 *a1, unsigned int a2)
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
  v8 = (v6 + 2147483646) & 0x7FFFFFFF;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20E5399E8 + 4 * byte_20E55ECFF[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20E539A1C + 4 * byte_20E55ECFA[v4]))();
}

uint64_t sub_20E539A1C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E539A24(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E539A2CLL);
  return result;
}

uint64_t sub_20E539A38(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E539A40);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20E539A44(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E539A4C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialLargeBlobRegistrationOutput;
}

uint64_t sub_20E539A74()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char *v8;
  id v9;
  unsigned int *v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t result;
  uint64_t v17;

  v1 = v0;
  v2 = sub_20E556FC0();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (uint64_t *)((char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v17 - v7;
  v9 = objc_msgSend(v1, sel_operation);
  if (!v9)
  {
    v10 = (unsigned int *)MEMORY[0x24BE0AFA0];
LABEL_6:
    (*(void (**)(char *, _QWORD, uint64_t))(v3 + 104))(v8, *v10, v2);
    return sub_20E556FCC();
  }
  if (v9 == (id)1)
  {
    v11 = objc_msgSend(v1, sel_dataToWrite);
    if (v11)
    {
      v12 = v11;
      v13 = sub_20E556DBC();
      v15 = v14;

      *v6 = v13;
      v6[1] = v15;
      v8 = (char *)v6;
      v10 = (unsigned int *)MEMORY[0x24BE0AFA8];
      goto LABEL_6;
    }
    __break(1u);
  }
  result = sub_20E5574F4();
  __break(1u);
  return result;
}

uint64_t sub_20E539BD4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, uint64_t, uint64_t, uint64_t);
  void (*v18)(char *, char *, uint64_t);
  uint64_t v19;
  char *v20;
  uint64_t v21;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v21 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v21 - v6;
  v8 = sub_20E55723C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v21 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v21 - v13;
  sub_20E557170();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v7, 1, v8) == 1)
  {
    sub_20E53DE04((uint64_t)v7);
    *a1 = sub_20E557164() & 1;
    v15 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
    v16 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v16(&a1[*(int *)(v15 + 20)], 1, 1, v8);
    return ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v16)(&a1[*(int *)(v15 + 24)], 1, 1, v8);
  }
  else
  {
    v18 = *(void (**)(char *, char *, uint64_t))(v9 + 32);
    v18(v14, v7, v8);
    (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v12, v14, v8);
    sub_20E55717C();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v14, v8);
    *a1 = 1;
    v19 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
    v20 = &a1[*(int *)(v19 + 20)];
    v18(v20, v12, v8);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v20, 0, 1, v8);
    return sub_20E533718((uint64_t)v5, (uint64_t)&a1[*(int *)(v19 + 24)]);
  }
}

id sub_20E539DCC()
{
  char *v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  _BYTE *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t v22;
  unint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  unint64_t v26;
  id v27;
  objc_super v29;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v3 = MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v29 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v29 - v6;
  v8 = *v1;
  v9 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  sub_20E53A540((uint64_t)&v1[*(int *)(v9 + 20)], (uint64_t)v7);
  v10 = sub_20E55723C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
  if (v12(v7, 1, v10) == 1)
  {
    sub_20E53DE04((uint64_t)v7);
    v13 = 0;
    v14 = 0xF000000000000000;
  }
  else
  {
    v13 = sub_20E557218();
    v14 = v15;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
  }
  sub_20E53A540((uint64_t)&v1[*(int *)(v9 + 24)], (uint64_t)v5);
  if (v12(v5, 1, v10) == 1)
  {
    sub_20E53DE04((uint64_t)v5);
    v16 = 0;
    v17 = 0xF000000000000000;
  }
  else
  {
    v16 = sub_20E557218();
    v17 = v18;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v5, v10);
  }
  v19 = objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFRegistrationOutput);
  v20 = (uint64_t *)&v19[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first];
  *(_OWORD *)&v19[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first] = xmmword_20E55ECE0;
  v21 = (uint64_t *)&v19[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second];
  *(_OWORD *)&v19[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second] = xmmword_20E55ECE0;
  v19[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_isSupported] = v8;
  swift_beginAccess();
  v22 = *v20;
  v23 = v20[1];
  *v20 = v13;
  v20[1] = v14;
  v24 = v19;
  sub_20E52F828(v13, v14);
  sub_20E52F530(v22, v23);
  swift_beginAccess();
  v25 = *v21;
  v26 = v21[1];
  *v21 = v16;
  v21[1] = v17;
  sub_20E52F828(v16, v17);
  sub_20E52F530(v25, v26);

  v29.receiver = v24;
  v29.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFRegistrationOutput;
  v27 = objc_msgSendSuper2(&v29, sel_init);
  sub_20E52F530(v16, v17);
  sub_20E52F530(v13, v14);
  return v27;
}

uint64_t sub_20E53A02C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v13;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_msgSend(v1, sel_shouldCheckForSupport);
  v5 = objc_msgSend(v1, sel_inputValues);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_saltInput1);
    sub_20E556DBC();

    v8 = objc_msgSend(v6, sel_saltInput2);
    if (v8)
    {
      v9 = v8;
      sub_20E556DBC();

    }
    sub_20E556F3C();

    v11 = sub_20E556F78();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 0, 1, v11);
  }
  else
  {
    v10 = sub_20E556F78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
  }
  return sub_20E5570C8();
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.init(saltInput1:saltInput2:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  *a5 = result;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  return result;
}

uint64_t static ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.saltInput1(_:saltInput2:)@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t *a5@<X8>)
{
  *a5 = a1;
  a5[1] = a2;
  a5[2] = a3;
  a5[3] = a4;
  sub_20E52F7E4(a1, a2);
  return sub_20E52F828(a3, a4);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.saltInput1.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_20E52F7E4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.saltInput1.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_20E52F4EC(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.saltInput1.modify())()
{
  return nullsub_1;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.saltInput2.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  sub_20E52F828(v1, *(_QWORD *)(v0 + 24));
  return v1;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.saltInput2.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_20E52F530(*(_QWORD *)(v2 + 16), *(_QWORD *)(v2 + 24));
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues.saltInput2.modify())()
{
  return nullsub_1;
}

uint64_t static ASAuthorizationPublicKeyCredentialPRFAssertionInput.inputValues(_:perCredentialInputValues:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X8>)
{
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v5 = *a1;
  v4 = a1[1];
  v6 = a1[2];
  v7 = a1[3];
  *a3 = *a1;
  a3[1] = v4;
  a3[2] = v6;
  a3[3] = v7;
  a3[4] = a2;
  sub_20E52F7E4(v5, v4);
  sub_20E52F828(v6, v7);
  return swift_bridgeObjectRetain();
}

uint64_t static ASAuthorizationPublicKeyCredentialPRFAssertionInput.perCredentialInputValues(_:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  *(_OWORD *)a2 = xmmword_20E55ECE0;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_QWORD *)(a2 + 32) = a1;
  return swift_bridgeObjectRetain();
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInput.inputValues.getter@<X0>(uint64_t *a1@<X8>)
{
  uint64_t *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = *v1;
  v3 = v1[1];
  v4 = v1[2];
  v5 = v1[3];
  *a1 = *v1;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_20E537B84(v2, v3, v4, v5);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInput.perCredentialInputValues.getter()
{
  return swift_bridgeObjectRetain();
}

{
  return swift_bridgeObjectRetain();
}

id sub_20E53A35C()
{
  uint64_t *v0;
  id v1;
  unint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v1 = 0;
  v2 = v0[1];
  v3 = (void *)v0[4];
  if (v2 >> 60 != 15)
  {
    v4 = *v0;
    v5 = v0[2];
    v6 = v0[3];
    sub_20E537B84(*v0, v0[1], v5, v6);
    sub_20E52F7E4(v4, v2);
    sub_20E52F828(v5, v6);
    v7 = (void *)sub_20E556DA4();
    if (v6 >> 60 == 15)
    {
      v8 = 0;
    }
    else
    {
      v8 = (void *)sub_20E556DA4();
      sub_20E52F530(v5, v6);
    }
    v1 = objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFAssertionInputValues), sel_initWithSaltInput1_saltInput2_, v7, v8);
    sub_20E52F4EC(v4, v2);

    sub_20E52F4B0(v4, v2, v5, v6);
  }
  if (v3)
  {
    v9 = sub_20E53D850((uint64_t)v3);
    type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues(v9);
    sub_20E53B6FC();
    v3 = (void *)sub_20E557284();
    swift_release();
  }
  v10 = objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFAssertionInput), sel_initWithInputValues_perCredentialInputValues_, v1, v3);

  return v10;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionOutput.first.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_20E55723C();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionOutput.second.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20E53A800(type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput, a1);
}

uint64_t type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(uint64_t a1)
{
  return sub_20E53A72C(a1, (uint64_t *)&unk_254A29620);
}

{
  return sub_20E53D644(a1, &qword_254A29780);
}

uint64_t sub_20E53A540(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionOutput.init(first:second:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_20E55723C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 32))(a3, a1, v6);
  v7 = a3 + *(int *)(type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0) + 20);
  return sub_20E533718(a2, v7);
}

double static ASAuthorizationPublicKeyCredentialPRFRegistrationInput.checkForSupport.getter@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_BYTE *)a1 = 1;
  result = 0.0;
  *(_OWORD *)(a1 + 8) = xmmword_20E55ECE0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0;
  return result;
}

uint64_t static ASAuthorizationPublicKeyCredentialPRFRegistrationInput.inputValues(_:)@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v3 = *a1;
  v2 = a1[1];
  v4 = a1[2];
  v5 = a1[3];
  *(_BYTE *)a2 = 1;
  *(_QWORD *)(a2 + 8) = v3;
  *(_QWORD *)(a2 + 16) = v2;
  *(_QWORD *)(a2 + 24) = v4;
  *(_QWORD *)(a2 + 32) = v5;
  sub_20E52F7E4(v3, v2);
  return sub_20E52F828(v4, v5);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationInput.shouldCheckForSupport.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

{
  uint64_t v0;

  return *(unsigned __int8 *)(v0
                            + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_shouldCheckForSupport);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationInput.inputValues.getter@<X0>(uint64_t *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v2 = v1[1];
  v3 = v1[2];
  v4 = v1[3];
  v5 = v1[4];
  *a1 = v2;
  a1[1] = v3;
  a1[2] = v4;
  a1[3] = v5;
  return sub_20E537B84(v2, v3, v4, v5);
}

id static ASAuthorizationPublicKeyCredentialPRFRegistrationInput.checkForSupport.getter()
{
  return objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFRegistrationInput), sel_initWithInputValues_, 0);
}

uint64_t static ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.supported.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  void (*v6)(_BYTE *, uint64_t, uint64_t, uint64_t);

  *a1 = 1;
  v2 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  v3 = &a1[*(int *)(v2 + 20)];
  v4 = sub_20E55723C();
  v6 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v6(v3, 1, 1, v4);
  return ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v6)(&a1[*(int *)(v2 + 24)], 1, 1, v4);
}

uint64_t type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(uint64_t a1)
{
  return sub_20E53A72C(a1, qword_254A296B8);
}

{
  return sub_20E53D644(a1, &qword_254A29750);
}

uint64_t sub_20E53A72C(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t static ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.unsupported.getter@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  _BYTE *v3;
  uint64_t v4;
  void (*v6)(_BYTE *, uint64_t, uint64_t, uint64_t);

  *a1 = 0;
  v2 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  v3 = &a1[*(int *)(v2 + 20)];
  v4 = sub_20E55723C();
  v6 = *(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56);
  v6(v3, 1, 1, v4);
  return ((uint64_t (*)(_BYTE *, uint64_t, uint64_t, uint64_t))v6)(&a1[*(int *)(v2 + 24)], 1, 1, v4);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.isSupported.getter()
{
  unsigned __int8 *v0;

  return *v0;
}

{
  uint64_t v0;
  unsigned __int8 *v1;

  v1 = (unsigned __int8 *)(v0 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_isSupported);
  swift_beginAccess();
  return *v1;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.first.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_20E53A800(type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput, a1);
}

uint64_t sub_20E53A800@<X0>(uint64_t (*a1)(_QWORD)@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;

  v4 = v2 + *(int *)(a1(0) + 20);
  return sub_20E53A540(v4, a2);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.second.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = v1 + *(int *)(type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0) + 24);
  return sub_20E53A540(v3, a1);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.init(first:second:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _BYTE *a3@<X8>)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;

  *a3 = 1;
  v6 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(0);
  v7 = &a3[*(int *)(v6 + 20)];
  v8 = sub_20E55723C();
  v9 = *(_QWORD *)(v8 - 8);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v9 + 32))(v7, a1, v8);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v7, 0, 1, v8);
  return sub_20E533718(a2, (uint64_t)&a3[*(int *)(v6 + 24)]);
}

void *ASAuthorizationPublicKeyCredentialPRFRegistrationInput.inputValues.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues);
  v2 = v1;
  return v1;
}

void __swiftcall ASAuthorizationPublicKeyCredentialPRFRegistrationInput.init(inputValues:)(ASAuthorizationPublicKeyCredentialPRFRegistrationInput *__return_ptr retstr, ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_optional *inputValues)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInputValues_, inputValues);

}

id ASAuthorizationPublicKeyCredentialPRFRegistrationInput.init(inputValues:)(uint64_t a1)
{
  uint64_t v1;
  objc_super v3;

  *(_BYTE *)(v1 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_shouldCheckForSupport) = 1;
  *(_QWORD *)(v1 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationInput_inputValues) = a1;
  v3.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFRegistrationInput;
  return objc_msgSendSuper2(&v3, sel_init);
}

void ASAuthorizationPublicKeyCredentialPRFRegistrationInput.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.isSupported.setter(char a1)
{
  uint64_t v1;
  _BYTE *v3;
  uint64_t result;

  v3 = (_BYTE *)(v1 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_isSupported);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.first.getter()
{
  return sub_20E53AF1C(&OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first, (void (*)(_QWORD, _QWORD))sub_20E52F828);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.first.setter(uint64_t a1, uint64_t a2)
{
  return sub_20E53B034(a1, a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_first, (uint64_t (*)(uint64_t, uint64_t))sub_20E52F530);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.second.getter()
{
  return sub_20E53AF1C(&OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second, (void (*)(_QWORD, _QWORD))sub_20E52F828);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.second.setter(uint64_t a1, uint64_t a2)
{
  return sub_20E53B034(a1, a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFRegistrationOutput_second, (uint64_t (*)(uint64_t, uint64_t))sub_20E52F530);
}

void ASAuthorizationPublicKeyCredentialPRFRegistrationOutput.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionOutput.first.getter()
{
  return sub_20E53AF1C(&OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first, (void (*)(_QWORD, _QWORD))sub_20E52F7E4);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionOutput.first.setter(uint64_t a1, uint64_t a2)
{
  return sub_20E53B034(a1, a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first, (uint64_t (*)(uint64_t, uint64_t))sub_20E52F4EC);
}

void sub_20E53AE20(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = objc_msgSend(*a1, sel_first);
  v4 = sub_20E556DBC();
  v6 = v5;

  *a2 = v4;
  a2[1] = v6;
}

id sub_20E53AE80(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t *v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;

  v3 = (uint64_t *)(a1 + *a3);
  swift_beginAccess();
  v4 = 0;
  v5 = v3[1];
  if (v5 >> 60 != 15)
  {
    v6 = *v3;
    sub_20E52F7E4(v6, v5);
    v4 = (void *)sub_20E556DA4();
    sub_20E52F530(v6, v5);
  }
  return v4;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionOutput.second.getter()
{
  return sub_20E53AF1C(&OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second, (void (*)(_QWORD, _QWORD))sub_20E52F828);
}

uint64_t sub_20E53AF1C(_QWORD *a1, void (*a2)(_QWORD, _QWORD))
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t v5;

  v4 = (_QWORD *)(v2 + *a1);
  swift_beginAccess();
  v5 = *v4;
  a2(*v4, v4[1]);
  return v5;
}

void sub_20E53AF88(char *a1, uint64_t a2, void *a3, _QWORD *a4)
{
  void *v5;
  char *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t *v12;
  uint64_t v13;
  unint64_t v14;

  v5 = a3;
  if (a3)
  {
    v7 = a1;
    v8 = v5;
    v5 = (void *)sub_20E556DBC();
    v10 = v9;

  }
  else
  {
    v11 = a1;
    v10 = 0xF000000000000000;
  }
  v12 = (uint64_t *)&a1[*a4];
  swift_beginAccess();
  v13 = *v12;
  v14 = v12[1];
  *v12 = (uint64_t)v5;
  v12[1] = v10;
  sub_20E52F530(v13, v14);

}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionOutput.second.setter(uint64_t a1, uint64_t a2)
{
  return sub_20E53B034(a1, a2, &OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second, (uint64_t (*)(uint64_t, uint64_t))sub_20E52F530);
}

uint64_t sub_20E53B034(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v4;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;

  v8 = (uint64_t *)(v4 + *a3);
  swift_beginAccess();
  v9 = *v8;
  v10 = v8[1];
  *v8 = a1;
  v8[1] = a2;
  return a4(v9, v10);
}

void sub_20E53B090(id *a1@<X0>, SEL *a2@<X3>, uint64_t *a3@<X8>)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = objc_msgSend(*a1, *a2);
  if (v4)
  {
    v5 = v4;
    v6 = sub_20E556DBC();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xF000000000000000;
  }
  *a3 = v6;
  a3[1] = v8;
}

void sub_20E53B0F0(uint64_t a1, void **a2, uint64_t a3, uint64_t a4, SEL *a5)
{
  void *v6;
  uint64_t v7;
  id v8;

  v6 = *a2;
  if (*(_QWORD *)(a1 + 8) >> 60 == 15)
    v7 = 0;
  else
    v7 = sub_20E556DA4();
  v8 = (id)v7;
  objc_msgSend(v6, *a5);

}

void ASAuthorizationPublicKeyCredentialPRFAssertionOutput.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInputValues.saltInput1.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1);
  sub_20E52F7E4(v1, *(_QWORD *)(v0 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1 + 8));
  return v1;
}

uint64_t ASAuthorizationPublicKeyCredentialPRFAssertionInputValues.saltInput2.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2);
  sub_20E52F828(v1, *(_QWORD *)(v0 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2 + 8));
  return v1;
}

id ASAuthorizationPublicKeyCredentialPRFAssertionInputValues.init(saltInput1:saltInput2:)(uint64_t a1, unint64_t a2, uint64_t a3, unint64_t a4)
{
  void *v8;
  void *v9;
  id v10;

  v8 = (void *)sub_20E556DA4();
  if (a4 >> 60 == 15)
  {
    v9 = 0;
  }
  else
  {
    v9 = (void *)sub_20E556DA4();
    sub_20E52F530(a3, a4);
  }
  v10 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithSaltInput1_saltInput2_, v8, v9);
  sub_20E52F4EC(a1, a2);

  return v10;
}

id ASAuthorizationPublicKeyCredentialPRFAssertionInputValues.init(saltInput1:saltInput2:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  objc_super v8;

  v5 = (_QWORD *)(v4 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput1);
  *v5 = a1;
  v5[1] = a2;
  v6 = (_QWORD *)(v4 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_saltInput2);
  *v6 = a3;
  v6[1] = a4;
  v8.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFAssertionInputValues;
  return objc_msgSendSuper2(&v8, sel_init);
}

void ASAuthorizationPublicKeyCredentialPRFAssertionInputValues.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

uint64_t sub_20E53B558(uint64_t a1, uint64_t a2, _QWORD *a3, void (*a4)(_QWORD, _QWORD), _QWORD *a5)
{
  a4(*(_QWORD *)(a1 + *a3), *(_QWORD *)(a1 + *a3 + 8));
  return sub_20E52F530(*(_QWORD *)(a1 + *a5), *(_QWORD *)(a1 + *a5 + 8));
}

void *ASAuthorizationPublicKeyCredentialPRFAssertionInput.inputValues.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues);
  v2 = v1;
  return v1;
}

void __swiftcall ASAuthorizationPublicKeyCredentialPRFAssertionInput.init(inputValues:perCredentialInputValues:)(ASAuthorizationPublicKeyCredentialPRFAssertionInput *__return_ptr retstr, ASAuthorizationPublicKeyCredentialPRFAssertionInputValues_optional *inputValues, Swift::OpaquePointer_optional perCredentialInputValues)
{
  void *v4;

  if (perCredentialInputValues.value._rawValue)
  {
    type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues((uint64_t)inputValues);
    sub_20E53B6FC();
    v4 = (void *)sub_20E557284();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithInputValues_perCredentialInputValues_, inputValues, v4);

}

uint64_t type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues(uint64_t a1)
{
  return sub_20E53D644(a1, &qword_254A297B0);
}

unint64_t sub_20E53B6FC()
{
  unint64_t result;

  result = qword_254A29488;
  if (!qword_254A29488)
  {
    result = MEMORY[0x212BBF2EC](MEMORY[0x24BDCDE08], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254A29488);
  }
  return result;
}

id ASAuthorizationPublicKeyCredentialPRFAssertionInput.init(inputValues:perCredentialInputValues:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  objc_super v4;

  *(_QWORD *)(v2 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_inputValues) = a1;
  *(_QWORD *)(v2 + OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionInput_perCredentialInputValues) = a2;
  v4.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFAssertionInput;
  return objc_msgSendSuper2(&v4, sel_init);
}

id _sSo54ASAuthorizationPublicKeyCredentialPRFRegistrationInputC22AuthenticationServicesEABycfC_0()
{
  return objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void ASAuthorizationPublicKeyCredentialPRFAssertionInput.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

char *keypath_get_selector_isSupported()
{
  return sel_isSupported;
}

id sub_20E53B88C@<X0>(id *a1@<X0>, _BYTE *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel_isSupported);
  *a2 = (_BYTE)result;
  return result;
}

id sub_20E53B8BC(unsigned __int8 *a1, id *a2)
{
  return objc_msgSend(*a2, sel_setIsSupported_, *a1);
}

char *keypath_get_selector_first()
{
  return sel_first;
}

void sub_20E53B8DC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_20E53B090(a1, (SEL *)&selRef_first, a2);
}

void sub_20E53B8F8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_20E53B0F0(a1, a2, a3, a4, (SEL *)&selRef_setFirst_);
}

char *keypath_get_selector_second()
{
  return sel_second;
}

void sub_20E53B920(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_20E53B090(a1, (SEL *)&selRef_second, a2);
}

void sub_20E53B93C(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_20E53B0F0(a1, a2, a3, a4, (SEL *)&selRef_setSecond_);
}

void sub_20E53B95C(uint64_t a1, void **a2)
{
  void *v2;
  id v3;

  v2 = *a2;
  v3 = (id)sub_20E556DA4();
  objc_msgSend(v2, sel_setFirst_, v3);

}

void sub_20E53B9AC(id *a1@<X0>, uint64_t *a2@<X8>)
{
  sub_20E53B090(a1, (SEL *)&selRef_second, a2);
}

void sub_20E53B9C8(uint64_t a1, void **a2, uint64_t a3, uint64_t a4)
{
  sub_20E53B0F0(a1, a2, a3, a4, (SEL *)&selRef_setSecond_);
}

uint64_t destroy for ASAuthorizationPublicKeyCredentialPRFAssertionInput(uint64_t *a1)
{
  unint64_t v2;
  unint64_t v3;

  v2 = a1[1];
  if (v2 >> 60 != 15)
  {
    sub_20E52F4EC(*a1, v2);
    v3 = a1[3];
    if (v3 >> 60 != 15)
      sub_20E52F4EC(a1[2], v3);
  }
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ASAuthorizationPublicKeyCredentialPRFAssertionInput(uint64_t a1, _QWORD *a2)
{
  unint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;

  v4 = a2[1];
  if (v4 >> 60 == 15)
  {
    v5 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *(_OWORD *)(a1 + 16) = v5;
  }
  else
  {
    v6 = *a2;
    sub_20E52F7E4(*a2, a2[1]);
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v4;
    v7 = a2 + 2;
    v8 = a2[3];
    if (v8 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 16) = *(_OWORD *)v7;
    }
    else
    {
      v9 = *v7;
      sub_20E52F7E4(*v7, a2[3]);
      *(_QWORD *)(a1 + 16) = v9;
      *(_QWORD *)(a1 + 24) = v8;
    }
  }
  *(_QWORD *)(a1 + 32) = a2[4];
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t *assignWithCopy for ASAuthorizationPublicKeyCredentialPRFAssertionInput(uint64_t *a1, _QWORD *a2)
{
  unint64_t v4;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _OWORD *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;

  v4 = a2[1];
  if ((unint64_t)a1[1] >> 60 != 15)
  {
    if (v4 >> 60 == 15)
    {
      sub_20E53BC44(a1);
      v6 = *((_OWORD *)a2 + 1);
      *(_OWORD *)a1 = *(_OWORD *)a2;
      *((_OWORD *)a1 + 1) = v6;
      goto LABEL_17;
    }
    v10 = *a2;
    sub_20E52F7E4(*a2, a2[1]);
    v11 = *a1;
    v12 = a1[1];
    *a1 = v10;
    a1[1] = v4;
    sub_20E52F4EC(v11, v12);
    v13 = a2 + 2;
    v9 = a2[3];
    if ((unint64_t)a1[3] >> 60 == 15)
    {
      if (v9 >> 60 != 15)
      {
        v14 = *v13;
        goto LABEL_12;
      }
    }
    else
    {
      if (v9 >> 60 != 15)
      {
        v15 = *v13;
        sub_20E52F7E4(*v13, a2[3]);
        v16 = a1[2];
        v17 = a1[3];
        a1[2] = v15;
        a1[3] = v9;
        sub_20E52F4EC(v16, v17);
        goto LABEL_17;
      }
      sub_20E532EAC((uint64_t)(a1 + 2));
    }
    *((_OWORD *)a1 + 1) = *(_OWORD *)v13;
    goto LABEL_17;
  }
  if (v4 >> 60 != 15)
  {
    v7 = *a2;
    sub_20E52F7E4(*a2, a2[1]);
    *a1 = v7;
    a1[1] = v4;
    v8 = a2 + 2;
    v9 = a2[3];
    if (v9 >> 60 == 15)
    {
      *((_OWORD *)a1 + 1) = *v8;
      goto LABEL_17;
    }
    v14 = *(_QWORD *)v8;
LABEL_12:
    sub_20E52F7E4(v14, v9);
    a1[2] = v14;
    a1[3] = v9;
    goto LABEL_17;
  }
  v5 = *((_OWORD *)a2 + 1);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v5;
LABEL_17:
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t *sub_20E53BC44(uint64_t *a1)
{
  destroy for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(a1);
  return a1;
}

uint64_t *assignWithTake for ASAuthorizationPublicKeyCredentialPRFAssertionInput(uint64_t *a1, uint64_t *a2)
{
  unint64_t v4;
  unint64_t v5;
  __int128 v6;
  uint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = a1[1];
  if (v4 >> 60 == 15)
    goto LABEL_4;
  v5 = a2[1];
  if (v5 >> 60 == 15)
  {
    sub_20E53BC44(a1);
LABEL_4:
    v6 = *((_OWORD *)a2 + 1);
    *(_OWORD *)a1 = *(_OWORD *)a2;
    *((_OWORD *)a1 + 1) = v6;
    goto LABEL_10;
  }
  v7 = *a1;
  *a1 = *a2;
  a1[1] = v5;
  sub_20E52F4EC(v7, v4);
  v8 = a2 + 2;
  v9 = a1[3];
  if (v9 >> 60 != 15)
  {
    v10 = a2[3];
    if (v10 >> 60 != 15)
    {
      v11 = a1[2];
      a1[2] = *v8;
      a1[3] = v10;
      sub_20E52F4EC(v11, v9);
      goto LABEL_10;
    }
    sub_20E532EAC((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v8;
LABEL_10:
  a1[4] = a2[4];
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFAssertionInput(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 40))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 32);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFAssertionInput(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 40) = 0;
    if (a2)
      *(_QWORD *)(result + 32) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInput()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialPRFAssertionInput;
}

uint64_t destroy for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(uint64_t *a1)
{
  uint64_t result;
  unint64_t v3;

  result = sub_20E52F4EC(*a1, a1[1]);
  v3 = a1[3];
  if (v3 >> 60 != 15)
    return sub_20E52F4EC(a1[2], v3);
  return result;
}

uint64_t initializeWithCopy for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(uint64_t a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  uint64_t v8;

  v4 = *a2;
  v5 = a2[1];
  sub_20E52F7E4(*a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = a2 + 2;
  v7 = a2[3];
  if (v7 >> 60 == 15)
  {
    *(_OWORD *)(a1 + 16) = *(_OWORD *)v6;
  }
  else
  {
    v8 = *v6;
    sub_20E52F7E4(*v6, v7);
    *(_QWORD *)(a1 + 16) = v8;
    *(_QWORD *)(a1 + 24) = v7;
  }
  return a1;
}

uint64_t *assignWithCopy for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(uint64_t *a1, uint64_t *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t *v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;

  v4 = *a2;
  v5 = a2[1];
  sub_20E52F7E4(*a2, v5);
  v6 = *a1;
  v7 = a1[1];
  *a1 = v4;
  a1[1] = v5;
  sub_20E52F4EC(v6, v7);
  v8 = a2 + 2;
  v9 = a2[3];
  if ((unint64_t)a1[3] >> 60 != 15)
  {
    if (v9 >> 60 != 15)
    {
      v11 = *v8;
      sub_20E52F7E4(*v8, v9);
      v12 = a1[2];
      v13 = a1[3];
      a1[2] = v11;
      a1[3] = v9;
      sub_20E52F4EC(v12, v13);
      return a1;
    }
    sub_20E532EAC((uint64_t)(a1 + 2));
    goto LABEL_6;
  }
  if (v9 >> 60 == 15)
  {
LABEL_6:
    *((_OWORD *)a1 + 1) = *(_OWORD *)v8;
    return a1;
  }
  v10 = *v8;
  sub_20E52F7E4(*v8, v9);
  a1[2] = v10;
  a1[3] = v9;
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

uint64_t *assignWithTake for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(uint64_t *a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  v4 = *a1;
  v5 = a1[1];
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_20E52F4EC(v4, v5);
  v6 = (uint64_t *)(a2 + 16);
  v7 = a1[3];
  if (v7 >> 60 != 15)
  {
    v8 = *(_QWORD *)(a2 + 24);
    if (v8 >> 60 != 15)
    {
      v9 = a1[2];
      a1[2] = *v6;
      a1[3] = v8;
      sub_20E52F4EC(v9, v7);
      return a1;
    }
    sub_20E532EAC((uint64_t)(a1 + 2));
  }
  *((_OWORD *)a1 + 1) = *(_OWORD *)v6;
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0xD && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 13);
  v3 = (((*(_QWORD *)(a1 + 8) >> 60) >> 2) & 0xFFFFFFF3 | (4 * ((*(_QWORD *)(a1 + 8) >> 60) & 3))) ^ 0xF;
  if (v3 >= 0xC)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xC)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 13;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xD)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
    {
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = (unint64_t)(((-a2 >> 2) & 3) - 4 * a2) << 60;
    }
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialPRFAssertionInput.InputValues;
}

uint64_t *initializeBufferWithCopyOfBuffer for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v10;
  char *v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    v7 = sub_20E55723C();
    v8 = *(_QWORD *)(v7 - 8);
    v9 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(v8 + 16);
    v9(a1, a2, v7);
    v10 = *(int *)(a3 + 20);
    v11 = (char *)a1 + v10;
    v12 = (char *)a2 + v10;
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v12, 1, v7))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
      memcpy(v11, v12, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      v9((uint64_t *)v11, (uint64_t *)v12, v7);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v11, 0, 1, v7);
    }
  }
  return a1;
}

uint64_t destroy for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void (*v8)(uint64_t, uint64_t);

  v4 = sub_20E55723C();
  v5 = *(_QWORD *)(v4 - 8);
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v8(a1, v4);
  v6 = a1 + *(int *)(a2 + 20);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4);
  if (!(_DWORD)result)
    return ((uint64_t (*)(uint64_t, uint64_t))v8)(v6, v4);
  return result;
}

char *initializeWithCopy for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_20E55723C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 16);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithCopy for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_20E55723C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 24);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

char *initializeWithTake for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t v12;

  v6 = sub_20E55723C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 32);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v11, 1, v6))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    v8(v10, v11, v6);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  }
  return a1;
}

char *assignWithTake for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  void (*v8)(void *, const void *, uint64_t);
  uint64_t v9;
  char *v10;
  char *v11;
  uint64_t (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  int v14;
  uint64_t v15;

  v6 = sub_20E55723C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(void (**)(void *, const void *, uint64_t))(v7 + 40);
  v8(a1, a2, v6);
  v9 = *(int *)(a3 + 20);
  v10 = &a1[v9];
  v11 = &a2[v9];
  v12 = *(uint64_t (**)(const void *, uint64_t, uint64_t))(v7 + 48);
  v13 = v12(&a1[v9], 1, v6);
  v14 = v12(v11, 1, v6);
  if (!v13)
  {
    if (!v14)
    {
      v8(v10, v11, v6);
      return a1;
    }
    (*(void (**)(char *, uint64_t))(v7 + 8))(v10, v6);
    goto LABEL_6;
  }
  if (v14)
  {
LABEL_6:
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
    return a1;
  }
  (*(void (**)(char *, char *, uint64_t))(v7 + 32))(v10, v11, v6);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v7 + 56))(v10, 0, 1, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFAssertionOutput()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E53C634(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;

  v6 = sub_20E55723C();
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48);
  }
  return v9(v10, a2, v8);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFAssertionOutput()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E53C6B8(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;

  v8 = sub_20E55723C();
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
  }
  else
  {
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56);
  }
  return v11(v12, a2, a2, v10);
}

void sub_20E53C738()
{
  unint64_t v0;
  unint64_t v1;

  sub_20E55723C();
  if (v0 <= 0x3F)
  {
    sub_20E53C7BC();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_20E53C7BC()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_254A29630)
  {
    sub_20E55723C();
    v0 = sub_20E5573BC();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_254A29630);
  }
}

uint64_t destroy for ASAuthorizationPublicKeyCredentialPRFRegistrationInput(uint64_t result)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;

  v1 = *(_QWORD *)(result + 16);
  if (v1 >> 60 != 15)
  {
    v2 = result;
    result = sub_20E52F4EC(*(_QWORD *)(result + 8), v1);
    v3 = *(_QWORD *)(v2 + 32);
    if (v3 >> 60 != 15)
      return sub_20E52F4EC(*(_QWORD *)(v2 + 24), v3);
  }
  return result;
}

uint64_t initializeWithCopy for ASAuthorizationPublicKeyCredentialPRFRegistrationInput(uint64_t a1, uint64_t a2)
{
  unint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t *v7;
  unint64_t v8;
  uint64_t v9;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = *(_QWORD *)(a2 + 16);
  if (v4 >> 60 == 15)
  {
    v5 = *(_OWORD *)(a2 + 24);
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
    *(_OWORD *)(a1 + 24) = v5;
  }
  else
  {
    v6 = *(_QWORD *)(a2 + 8);
    sub_20E52F7E4(v6, *(_QWORD *)(a2 + 16));
    *(_QWORD *)(a1 + 8) = v6;
    *(_QWORD *)(a1 + 16) = v4;
    v7 = (uint64_t *)(a2 + 24);
    v8 = *(_QWORD *)(a2 + 32);
    if (v8 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 24) = *(_OWORD *)v7;
    }
    else
    {
      v9 = *v7;
      sub_20E52F7E4(*v7, v8);
      *(_QWORD *)(a1 + 24) = v9;
      *(_QWORD *)(a1 + 32) = v8;
    }
  }
  return a1;
}

uint64_t assignWithCopy for ASAuthorizationPublicKeyCredentialPRFRegistrationInput(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  unint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = (_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a2 + 16);
  if (*(_QWORD *)(a1 + 16) >> 60 != 15)
  {
    if (v6 >> 60 == 15)
    {
      sub_20E53BC44((uint64_t *)(a1 + 8));
      v8 = v5[1];
      *v4 = *v5;
      v4[1] = v8;
      return a1;
    }
    v12 = *(_QWORD *)(a2 + 8);
    sub_20E52F7E4(v12, *(_QWORD *)(a2 + 16));
    v13 = *(_QWORD *)(a1 + 8);
    v14 = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 8) = v12;
    *(_QWORD *)(a1 + 16) = v6;
    sub_20E52F4EC(v13, v14);
    v15 = (uint64_t *)(a2 + 24);
    v11 = *(_QWORD *)(a2 + 32);
    if (*(_QWORD *)(a1 + 32) >> 60 == 15)
    {
      if (v11 >> 60 != 15)
      {
        v16 = *v15;
        goto LABEL_12;
      }
    }
    else
    {
      if (v11 >> 60 != 15)
      {
        v17 = *v15;
        sub_20E52F7E4(*v15, v11);
        v18 = *(_QWORD *)(a1 + 24);
        v19 = *(_QWORD *)(a1 + 32);
        *(_QWORD *)(a1 + 24) = v17;
        *(_QWORD *)(a1 + 32) = v11;
        sub_20E52F4EC(v18, v19);
        return a1;
      }
      sub_20E532EAC(a1 + 24);
    }
    *(_OWORD *)(a1 + 24) = *(_OWORD *)v15;
    return a1;
  }
  if (v6 >> 60 != 15)
  {
    v9 = *(_QWORD *)(a2 + 8);
    sub_20E52F7E4(v9, *(_QWORD *)(a2 + 16));
    *(_QWORD *)(a1 + 8) = v9;
    *(_QWORD *)(a1 + 16) = v6;
    v10 = (_OWORD *)(a2 + 24);
    v11 = *(_QWORD *)(a2 + 32);
    if (v11 >> 60 == 15)
    {
      *(_OWORD *)(a1 + 24) = *v10;
      return a1;
    }
    v16 = *(_QWORD *)v10;
LABEL_12:
    sub_20E52F7E4(v16, v11);
    *(_QWORD *)(a1 + 24) = v16;
    *(_QWORD *)(a1 + 32) = v11;
    return a1;
  }
  v7 = *(_OWORD *)(a2 + 24);
  *v4 = *v5;
  *(_OWORD *)(a1 + 24) = v7;
  return a1;
}

uint64_t assignWithTake for ASAuthorizationPublicKeyCredentialPRFRegistrationInput(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  _OWORD *v5;
  unint64_t v6;
  unint64_t v7;
  __int128 v8;
  uint64_t v9;
  _QWORD *v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v4 = (_OWORD *)(a1 + 8);
  v5 = (_OWORD *)(a2 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  if (v6 >> 60 == 15)
    goto LABEL_4;
  v7 = *(_QWORD *)(a2 + 16);
  if (v7 >> 60 == 15)
  {
    sub_20E53BC44((uint64_t *)(a1 + 8));
LABEL_4:
    v8 = v5[1];
    *v4 = *v5;
    v4[1] = v8;
    return a1;
  }
  v9 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v7;
  sub_20E52F4EC(v9, v6);
  v10 = (_QWORD *)(a2 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  if (v11 >> 60 != 15)
  {
    v12 = *(_QWORD *)(a2 + 32);
    if (v12 >> 60 != 15)
    {
      v13 = *(_QWORD *)(a1 + 24);
      *(_QWORD *)(a1 + 24) = *v10;
      *(_QWORD *)(a1 + 32) = v12;
      sub_20E52F4EC(v13, v11);
      return a1;
    }
    sub_20E532EAC(a1 + 24);
  }
  *(_OWORD *)(a1 + 24) = *(_OWORD *)v10;
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFRegistrationInput(unsigned __int8 *a1, unsigned int a2)
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
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFRegistrationInput(uint64_t result, unsigned int a2, unsigned int a3)
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

ValueMetadata *type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationInput()
{
  return &type metadata for ASAuthorizationPublicKeyCredentialPRFRegistrationInput;
}

uint64_t *initializeBufferWithCopyOfBuffer for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v4;
  int v5;
  uint64_t v7;
  _BYTE *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v4 = a1;
  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v14 = *a2;
    *v4 = *a2;
    v4 = (uint64_t *)(v14 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v7 = *(int *)(a3 + 20);
    v8 = (char *)a1 + v7;
    v9 = (char *)a2 + v7;
    v10 = sub_20E55723C();
    v11 = *(_QWORD *)(v10 - 8);
    v12 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48);
    if (v12(v9, 1, v10))
    {
      v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v13 - 8) + 64));
    }
    else
    {
      (*(void (**)(_BYTE *, char *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
    v15 = *(int *)(a3 + 24);
    v16 = (char *)v4 + v15;
    v17 = (char *)a2 + v15;
    if (v12(v17, 1, v10))
    {
      v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
      memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v18 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v17, v10);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v16, 0, 1, v10);
    }
  }
  return v4;
}

uint64_t destroy for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int (*v7)(uint64_t, uint64_t, uint64_t);
  uint64_t v8;
  uint64_t result;

  v4 = a1 + *(int *)(a2 + 20);
  v5 = sub_20E55723C();
  v6 = *(_QWORD *)(v5 - 8);
  v7 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v6 + 48);
  if (!v7(v4, 1, v5))
    (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v4, v5);
  v8 = a1 + *(int *)(a2 + 24);
  result = ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v7)(v8, 1, v5);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 8))(v8, v5);
  return result;
}

_BYTE *initializeWithCopy for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_20E55723C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(v15, 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  return a1;
}

_BYTE *assignWithCopy for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_20E55723C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v7, v8, v9);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 24))(v16, v17, v9);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 16))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
  return a1;
}

_BYTE *initializeWithTake for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int (*v11)(_BYTE *, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t v13;
  _BYTE *v14;
  _BYTE *v15;
  uint64_t v16;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_20E55723C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned int (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  if (v11(v8, 1, v9))
  {
    v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = *(int *)(a3 + 24);
  v14 = &a1[v13];
  v15 = &a2[v13];
  if (v11(v15, 1, v9))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v14, v15, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v14, v15, v9);
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v14, 0, 1, v9);
  }
  return a1;
}

_BYTE *assignWithTake for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v6;
  _BYTE *v7;
  _BYTE *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(_BYTE *, uint64_t, uint64_t);
  int v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  int v18;
  int v19;
  uint64_t v20;

  *a1 = *a2;
  v6 = *(int *)(a3 + 20);
  v7 = &a1[v6];
  v8 = &a2[v6];
  v9 = sub_20E55723C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(uint64_t (**)(_BYTE *, uint64_t, uint64_t))(v10 + 48);
  v12 = v11(v7, 1, v9);
  v13 = v11(v8, 1, v9);
  if (v12)
  {
    if (!v13)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v7, v8, v9);
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v13)
  {
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v7, v9);
LABEL_6:
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    goto LABEL_7;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v7, v8, v9);
LABEL_7:
  v15 = *(int *)(a3 + 24);
  v16 = &a1[v15];
  v17 = &a2[v15];
  v18 = v11(&a1[v15], 1, v9);
  v19 = v11(v17, 1, v9);
  if (!v18)
  {
    if (!v19)
    {
      (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 40))(v16, v17, v9);
      return a1;
    }
    (*(void (**)(_BYTE *, uint64_t))(v10 + 8))(v16, v9);
    goto LABEL_12;
  }
  if (v19)
  {
LABEL_12:
    v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    memcpy(v16, v17, *(_QWORD *)(*(_QWORD *)(v20 - 8) + 64));
    return a1;
  }
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(v10 + 32))(v16, v17, v9);
  (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v16, 0, 1, v9);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_20E53D41C(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
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
    v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v10);
  }
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationPublicKeyCredentialPRFRegistrationOutput()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_20E53D4A8(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
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
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

void sub_20E53D51C()
{
  unint64_t v0;

  sub_20E53C7BC();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

uint64_t type metadata accessor for ASAuthorizationPublicKeyCredentialPRFRegistrationInput(uint64_t a1)
{
  return sub_20E53D644(a1, &qword_254A29720);
}

uint64_t type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInput(uint64_t a1)
{
  return sub_20E53D644(a1, &qword_254A297E0);
}

uint64_t sub_20E53D644(uint64_t a1, unint64_t *a2)
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

uint64_t sub_20E53D67C()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v16;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v16 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = objc_msgSend(v1, sel_inputValues);
  if (v5)
  {
    v6 = v5;
    v7 = objc_msgSend(v5, sel_saltInput1);
    sub_20E556DBC();

    v8 = objc_msgSend(v6, sel_saltInput2);
    if (v8)
    {
      v9 = v8;
      sub_20E556DBC();

    }
    sub_20E556F3C();

    v11 = sub_20E556F78();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v4, 0, 1, v11);
  }
  else
  {
    v10 = sub_20E556F78();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v4, 1, 1, v10);
  }
  v12 = objc_msgSend(v1, sel_perCredentialInputValues);
  v13 = v12;
  if (v12)
  {
    type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionInputValues((uint64_t)v12);
    sub_20E53B6FC();
    v14 = sub_20E557290();

    sub_20E53DB14(v14);
    swift_bridgeObjectRelease();
  }
  return sub_20E556F84();
}

uint64_t sub_20E53D850(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t i;
  int64_t v13;
  unint64_t v14;
  int64_t v15;
  uint64_t *v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t *v27;
  uint64_t v28;
  BOOL v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  unint64_t v36;
  int64_t v37;
  unint64_t v38;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A297E8);
  result = sub_20E55750C();
  v3 = 0;
  v34 = (_QWORD *)result;
  v35 = a1;
  v6 = *(_QWORD *)(a1 + 64);
  v5 = a1 + 64;
  v4 = v6;
  v7 = 1 << *(_BYTE *)(v5 - 32);
  v8 = -1;
  if (v7 < 64)
    v8 = ~(-1 << v7);
  v9 = v8 & v4;
  v31 = v5;
  v32 = (unint64_t)(v7 + 63) >> 6;
  v33 = result + 64;
  if ((v8 & v4) == 0)
    goto LABEL_5;
LABEL_4:
  v10 = __clz(__rbit64(v9));
  v11 = (v9 - 1) & v9;
  for (i = v10 | (v3 << 6); ; i = __clz(__rbit64(v14)) + (v3 << 6))
  {
    v16 = (uint64_t *)(*(_QWORD *)(v35 + 48) + 16 * i);
    v18 = *v16;
    v17 = v16[1];
    v19 = (uint64_t *)(*(_QWORD *)(v35 + 56) + 32 * i);
    v21 = *v19;
    v20 = v19[1];
    v22 = v19[2];
    v23 = v19[3];
    v38 = v17;
    sub_20E52F7E4(v18, v17);
    sub_20E52F7E4(v21, v20);
    sub_20E52F828(v22, v23);
    sub_20E52F7E4(v21, v20);
    sub_20E52F828(v22, v23);
    v24 = (void *)sub_20E556DA4();
    v36 = v11;
    v37 = v3;
    if (v23 >> 60 == 15)
    {
      v25 = 0;
    }
    else
    {
      v25 = (void *)sub_20E556DA4();
      sub_20E52F530(v22, v23);
    }
    v26 = objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFAssertionInputValues), sel_initWithSaltInput1_saltInput2_, v24, v25);
    sub_20E52F4EC(v21, v20);

    sub_20E52F4EC(v21, v20);
    sub_20E52F530(v22, v23);
    result = (uint64_t)v34;
    *(_QWORD *)(v33 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v27 = (uint64_t *)(v34[6] + 16 * i);
    *v27 = v18;
    v27[1] = v38;
    *(_QWORD *)(v34[7] + 8 * i) = v26;
    v28 = v34[2];
    v29 = __OFADD__(v28, 1);
    v30 = v28 + 1;
    if (v29)
    {
      __break(1u);
LABEL_27:
      __break(1u);
      goto LABEL_28;
    }
    v34[2] = v30;
    v9 = v36;
    v3 = v37;
    if (v36)
      goto LABEL_4;
LABEL_5:
    v13 = v3 + 1;
    if (__OFADD__(v3, 1))
      goto LABEL_27;
    if (v13 >= v32)
      return result;
    v14 = *(_QWORD *)(v31 + 8 * v13);
    ++v3;
    if (!v14)
    {
      v3 = v13 + 1;
      if (v13 + 1 >= v32)
        return result;
      v14 = *(_QWORD *)(v31 + 8 * v3);
      if (!v14)
      {
        v3 = v13 + 2;
        if (v13 + 2 >= v32)
          return result;
        v14 = *(_QWORD *)(v31 + 8 * v3);
        if (!v14)
          break;
      }
    }
LABEL_18:
    v11 = (v14 - 1) & v14;
  }
  v15 = v13 + 3;
  if (v15 >= v32)
    return result;
  v14 = *(_QWORD *)(v31 + 8 * v15);
  if (v14)
  {
    v3 = v15;
    goto LABEL_18;
  }
  while (1)
  {
    v3 = v15 + 1;
    if (__OFADD__(v15, 1))
      break;
    if (v3 >= v32)
      return result;
    v14 = *(_QWORD *)(v31 + 8 * v3);
    ++v15;
    if (v14)
      goto LABEL_18;
  }
LABEL_28:
  __break(1u);
  return result;
}

uint64_t sub_20E53DB14(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  _QWORD *v5;
  int64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t i;
  int64_t v14;
  unint64_t v15;
  int64_t v16;
  uint64_t v17;
  uint64_t *v18;
  unint64_t v19;
  uint64_t v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  char *v25;
  uint64_t *v26;
  uint64_t v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int64_t v32;
  uint64_t v33;
  _QWORD *v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  int64_t v40;

  v2 = sub_20E556F78();
  v36 = *(_QWORD *)(v2 - 8);
  v37 = v2;
  MEMORY[0x24BDAC7A8](v2);
  v35 = (char *)&v30 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29078);
  result = sub_20E55750C();
  v5 = (_QWORD *)result;
  v6 = 0;
  v38 = a1;
  v9 = *(_QWORD *)(a1 + 64);
  v8 = a1 + 64;
  v7 = v9;
  v10 = 1 << *(_BYTE *)(v8 - 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & v7;
  v31 = v8;
  v32 = (unint64_t)(v10 + 63) >> 6;
  v33 = result + 64;
  v34 = (_QWORD *)result;
  if (!v12)
    goto LABEL_5;
LABEL_4:
  v39 = (v12 - 1) & v12;
  v40 = v6;
  for (i = __clz(__rbit64(v12)) | (v6 << 6); ; i = __clz(__rbit64(v15)) + (v16 << 6))
  {
    v18 = (uint64_t *)(*(_QWORD *)(v38 + 48) + 16 * i);
    v20 = *v18;
    v19 = v18[1];
    v21 = *(id *)(*(_QWORD *)(v38 + 56) + 8 * i);
    sub_20E52F7E4(v20, v19);
    v22 = objc_msgSend(v21, sel_saltInput1);
    sub_20E556DBC();

    v23 = objc_msgSend(v21, sel_saltInput2);
    if (v23)
    {
      v24 = v23;
      sub_20E556DBC();

    }
    v25 = v35;
    sub_20E556F3C();

    v5 = v34;
    *(_QWORD *)(v33 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v26 = (uint64_t *)(v5[6] + 16 * i);
    *v26 = v20;
    v26[1] = v19;
    result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v36 + 32))(v5[7] + *(_QWORD *)(v36 + 72) * i, v25, v37);
    v27 = v5[2];
    v28 = __OFADD__(v27, 1);
    v29 = v27 + 1;
    if (v28)
    {
      __break(1u);
LABEL_26:
      __break(1u);
      goto LABEL_27;
    }
    v5[2] = v29;
    v6 = v40;
    v12 = v39;
    if (v39)
      goto LABEL_4;
LABEL_5:
    v14 = v6 + 1;
    if (__OFADD__(v6, 1))
      goto LABEL_26;
    if (v14 >= v32)
      return (uint64_t)v5;
    v15 = *(_QWORD *)(v31 + 8 * v14);
    v16 = v6 + 1;
    if (!v15)
    {
      v16 = v6 + 2;
      if (v6 + 2 >= v32)
        return (uint64_t)v5;
      v15 = *(_QWORD *)(v31 + 8 * v16);
      if (!v15)
      {
        v16 = v6 + 3;
        if (v6 + 3 >= v32)
          return (uint64_t)v5;
        v15 = *(_QWORD *)(v31 + 8 * v16);
        if (!v15)
          break;
      }
    }
LABEL_18:
    v39 = (v15 - 1) & v15;
    v40 = v16;
  }
  v17 = v6 + 4;
  if (v6 + 4 >= v32)
    return (uint64_t)v5;
  v15 = *(_QWORD *)(v31 + 8 * v17);
  if (v15)
  {
    v16 = v6 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v16 = v17 + 1;
    if (__OFADD__(v17, 1))
      break;
    if (v16 >= v32)
      return (uint64_t)v5;
    v15 = *(_QWORD *)(v31 + 8 * v16);
    ++v17;
    if (v15)
      goto LABEL_18;
  }
LABEL_27:
  __break(1u);
  return result;
}

uint64_t sub_20E53DE04(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

void ASPasskeyCredentialRequestParameters.extensionInput.getter(_QWORD *a1@<X8>)
{
  void *v1;
  char *v3;
  void *v4;
  id v5;

  v3 = (char *)objc_msgSend(v1, sel_extensionInput);
  if (v3)
  {
    v4 = v3;
    v5 = *(id *)&v3[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions];

  }
  else
  {
    v5 = 0;
  }
  *a1 = v5;
}

uint64_t sub_20E53DEB4(unint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  BOOL v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  char v17;
  id v18;
  unsigned __int8 v20;
  uint64_t v21;

  v3 = v2;
  if (a1 >> 62)
  {
LABEL_31:
    swift_bridgeObjectRetain();
    v6 = sub_20E557500();
    if (v6)
      goto LABEL_3;
  }
  else
  {
    v6 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v6)
    {
LABEL_3:
      v7 = 4;
      do
      {
        v8 = v7 - 4;
        if ((a1 & 0xC000000000000001) != 0)
        {
          v9 = (void *)MEMORY[0x212BBE86C](v7 - 4, a1);
          v10 = __OFADD__(v8, 1);
          v11 = v7 - 3;
          if (v10)
            goto LABEL_30;
        }
        else
        {
          v9 = *(void **)(a1 + 8 * v7);
          swift_unknownObjectRetain();
          v10 = __OFADD__(v8, 1);
          v11 = v7 - 3;
          if (v10)
          {
LABEL_30:
            __break(1u);
            goto LABEL_31;
          }
        }
        v12 = objc_msgSend(v9, sel_loginChoiceKind);
        if (v12 == (id)1)
        {
          objc_opt_self();
          v16 = (void *)swift_dynamicCastObjCClass();
          if (!v16)
            goto LABEL_5;
          if (objc_msgSend(v16, sel_isExternal))
          {
LABEL_28:
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease();
            return 1;
          }
          v17 = *(_BYTE *)(a2 + 45);
          swift_unknownObjectRelease();
          if ((v17 & 1) != 0)
            goto LABEL_27;
        }
        else
        {
          if (v12 != (id)2)
          {
            if (!v12)
              goto LABEL_28;
            goto LABEL_5;
          }
          objc_opt_self();
          v13 = swift_dynamicCastObjCClass();
          if (!v13)
            goto LABEL_5;
          v14 = (void *)v13;
          swift_unknownObjectRetain();
          if (objc_msgSend(v14, sel_isExternal))
          {
            swift_bridgeObjectRelease();
            swift_unknownObjectRelease_n();
            return 1;
          }
          if (!*(_BYTE *)(a2 + 44))
          {
            swift_unknownObjectRelease();
LABEL_5:
            swift_unknownObjectRelease();
            goto LABEL_6;
          }
          v15 = *(unsigned __int8 *)(a2 + 45);
          if (*(_BYTE *)(a2 + 42) == 1)
          {
            swift_unknownObjectRelease_n();
            if ((v15 & 1) != 0)
              goto LABEL_27;
          }
          else
          {
            v21 = v3;
            v18 = *(id *)a2;
            sub_20E534780();
            v20 = objc_msgSend(v18, sel_isRegistrationRequest);

            v3 = v21;
            swift_unknownObjectRelease();
            sub_20E534F04();
            swift_unknownObjectRelease();
            if ((v20 & 1) == 0 && ((v15 ^ 1) & 1) == 0)
            {
LABEL_27:
              swift_bridgeObjectRelease();
              return 1;
            }
          }
        }
LABEL_6:
        ++v7;
      }
      while (v11 != v6);
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

void sub_20E53E15C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  id v11;
  unsigned int v12;
  uint64_t v13;
  int64_t v14;
  unint64_t v15;
  uint64_t v16;
  int64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  void *v24;

  v1 = a1;
  if ((a1 & 0xC000000000000001) != 0)
  {
    swift_bridgeObjectRetain();
    sub_20E557410();
    sub_20E53D644(0, &qword_254A297F8);
    sub_20E5454E0();
    sub_20E557320();
    v1 = v19;
    v18 = v20;
    v2 = v21;
    v3 = v22;
    v4 = v23;
  }
  else
  {
    v5 = -1 << *(_BYTE *)(a1 + 32);
    v18 = a1 + 56;
    v2 = ~v5;
    v6 = -v5;
    if (v6 < 64)
      v7 = ~(-1 << v6);
    else
      v7 = -1;
    v4 = v7 & *(_QWORD *)(a1 + 56);
    swift_bridgeObjectRetain();
    v3 = 0;
  }
  v17 = (unint64_t)(v2 + 64) >> 6;
  while (1)
  {
    v13 = v3;
    if ((v1 & 0x8000000000000000) == 0)
      break;
    if (!sub_20E55741C())
      goto LABEL_31;
    sub_20E53D644(0, &qword_254A297F8);
    swift_unknownObjectRetain();
    swift_dynamicCast();
    v10 = v24;
    swift_unknownObjectRelease();
    if (!v24)
      goto LABEL_31;
LABEL_10:
    v11 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
    v12 = objc_msgSend(v11, sel_extensionSupportsPasskeys_, v10);

    if (v12)
      goto LABEL_31;
  }
  if (v4)
  {
    v8 = __clz(__rbit64(v4));
    v4 &= v4 - 1;
    v9 = v8 | (v3 << 6);
LABEL_9:
    v10 = *(id *)(*(_QWORD *)(v1 + 48) + 8 * v9);
    if (!v10)
      goto LABEL_31;
    goto LABEL_10;
  }
  v14 = v3 + 1;
  if (!__OFADD__(v3, 1))
  {
    if (v14 >= v17)
      goto LABEL_31;
    v15 = *(_QWORD *)(v18 + 8 * v14);
    ++v3;
    if (!v15)
    {
      v3 = v13 + 2;
      if (v13 + 2 >= v17)
        goto LABEL_31;
      v15 = *(_QWORD *)(v18 + 8 * v3);
      if (!v15)
      {
        v3 = v13 + 3;
        if (v13 + 3 >= v17)
          goto LABEL_31;
        v15 = *(_QWORD *)(v18 + 8 * v3);
        if (!v15)
        {
          v3 = v13 + 4;
          if (v13 + 4 >= v17)
            goto LABEL_31;
          v15 = *(_QWORD *)(v18 + 8 * v3);
          if (!v15)
          {
            v3 = v13 + 5;
            if (v13 + 5 >= v17)
              goto LABEL_31;
            v15 = *(_QWORD *)(v18 + 8 * v3);
            if (!v15)
            {
              v16 = v13 + 6;
              while (v17 != v16)
              {
                v15 = *(_QWORD *)(v18 + 8 * v16++);
                if (v15)
                {
                  v3 = v16 - 1;
                  goto LABEL_28;
                }
              }
LABEL_31:
              sub_20E546BD4();
              return;
            }
          }
        }
      }
    }
LABEL_28:
    v4 = (v15 - 1) & v15;
    v9 = __clz(__rbit64(v15)) + (v3 << 6);
    goto LABEL_9;
  }
  __break(1u);
}

uint64_t ASAuthorizationUIContext.otherLoginChoices.getter()
{
  id *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(*v0, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v2 = sub_20E5572FC();

  v3 = sub_20E534CBC(v2, (uint64_t)&unk_24C9520D8);
  swift_bridgeObjectRelease();
  return v3;
}

BOOL sub_20E53E4EC()
{
  unint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  _BOOL8 v8;
  BOOL v9;

  ASAuthorizationUIContext.loginChoicesToShow.getter();
  v1 = v0;
  if (v0 >> 62)
  {
LABEL_16:
    swift_bridgeObjectRetain();
    v2 = sub_20E557500();
    if (v2)
      goto LABEL_3;
  }
  else
  {
    v2 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v2)
    {
LABEL_3:
      v3 = 4;
      while (1)
      {
        v4 = v3 - 4;
        if ((v1 & 0xC000000000000001) != 0)
        {
          v5 = (void *)MEMORY[0x212BBE86C](v3 - 4, v1);
          v6 = v3 - 3;
          if (__OFADD__(v4, 1))
            goto LABEL_15;
        }
        else
        {
          v5 = *(void **)(v1 + 8 * v3);
          swift_unknownObjectRetain();
          v6 = v3 - 3;
          if (__OFADD__(v4, 1))
          {
LABEL_15:
            __break(1u);
            goto LABEL_16;
          }
        }
        v7 = objc_msgSend(v5, sel_loginChoiceKind);
        swift_unknownObjectRelease();
        v8 = v7 == 0;
        ++v3;
        if (v7)
          v9 = 1;
        else
          v9 = v6 == v2;
        if (v9)
          goto LABEL_18;
      }
    }
  }
  v8 = 1;
LABEL_18:
  swift_bridgeObjectRelease_n();
  return v8;
}

void ASAuthorizationUIContext.loginChoicesToShow.getter()
{
  __asm { BR              X10 }
}

uint64_t sub_20E53E6C8(void *a1)
{
  int v1;
  id v2;
  id v3;
  unint64_t v4;
  uint64_t v5;

  if (!v1)
    return MEMORY[0x24BEE4AF8];
  v2 = a1;
  sub_20E534780();
  v3 = objc_msgSend(v2, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v4 = sub_20E5572FC();

  v5 = sub_20E534CBC(v4, (uint64_t)&unk_24C952158);
  swift_bridgeObjectRelease();
  sub_20E534F04();
  return v5;
}

void sub_20E53EDC0(uint64_t *a1@<X8>)
{
  void **v1;
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;

  v3 = *v1;
  ASAuthorizationUIContext.loginChoicesToShow.getter();
  v5 = v4;
  if (v4 >> 62)
    goto LABEL_53;
  v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v6)
    goto LABEL_48;
LABEL_3:
  v32 = v3;
  v33 = a1;
  v7 = 0;
  v8 = 0;
  v9 = 0;
  v10 = 0;
  v36 = v6;
  v37 = v5 & 0xC000000000000001;
  v34 = v5 & 0xFFFFFFFFFFFFFF8;
  v35 = v5;
  while (1)
  {
    while (1)
    {
      if (v37)
      {
        v11 = (void *)MEMORY[0x212BBE86C](v7, v5);
        v12 = v7 + 1;
        if (__OFADD__(v7, 1))
          goto LABEL_51;
      }
      else
      {
        if (v7 >= *(_QWORD *)(v34 + 16))
          goto LABEL_52;
        v11 = *(void **)(v5 + 8 * v7 + 32);
        swift_unknownObjectRetain();
        v12 = v7 + 1;
        if (__OFADD__(v7, 1))
        {
LABEL_51:
          __break(1u);
LABEL_52:
          __break(1u);
LABEL_53:
          v6 = sub_20E557500();
          if (!v6)
            goto LABEL_48;
          goto LABEL_3;
        }
      }
      objc_opt_self();
      v13 = swift_dynamicCastObjCClass();
      if (v13)
      {
        v14 = (void *)v13;
        swift_unknownObjectRetain();
        if (objc_msgSend(v14, sel_isExternal))
        {
          if (v10)
          {
            v15 = objc_msgSend(v14, sel_providerBundleIdentifier);
            v3 = (void *)sub_20E5572B4();
            v17 = v16;

            if ((void *)v9 == v3 && v10 == v17)
            {
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v5 = v35;
            }
            else
            {
              v18 = sub_20E557560();
              swift_bridgeObjectRelease();
              swift_bridgeObjectRelease();
              v5 = v35;
              if ((v18 & 1) == 0)
              {
                swift_unknownObjectRelease_n();
                goto LABEL_42;
              }
            }
          }
          v19 = objc_msgSend(v14, sel_providerBundleIdentifier);
          v9 = sub_20E5572B4();
          v10 = v20;

          swift_unknownObjectRelease();
          v8 = 1;
        }
        else
        {
          swift_unknownObjectRelease();
          if ((v8 & 1) != 0)
            goto LABEL_40;
          v8 = 0;
        }
      }
      objc_opt_self();
      v21 = swift_dynamicCastObjCClass();
      if (!v21)
        goto LABEL_31;
      v3 = (void *)v21;
      swift_unknownObjectRetain();
      v22 = objc_msgSend(v3, sel_externalCredentialProviderBundleID);
      if (!v22)
      {
        swift_unknownObjectRelease();
        if ((v8 & 1) == 0)
        {
          v8 = 0;
          goto LABEL_31;
        }
LABEL_40:
        swift_unknownObjectRelease();
LABEL_41:
        swift_bridgeObjectRelease();
LABEL_42:
        v27 = v33;
LABEL_43:
        swift_bridgeObjectRelease();
        goto LABEL_44;
      }
      v3 = v22;
      v23 = sub_20E5572B4();
      v25 = v24;

      if (v10)
      {
        if (v9 == v23 && v10 == v25)
        {
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
        }
        else
        {
          v26 = sub_20E557560();
          swift_unknownObjectRelease();
          swift_bridgeObjectRelease();
          if ((v26 & 1) == 0)
          {
            swift_unknownObjectRelease();
            swift_bridgeObjectRelease();
            v27 = v33;
            goto LABEL_43;
          }
        }
      }
      else
      {
        swift_unknownObjectRelease();
      }
      v8 = 1;
      v9 = v23;
      v10 = v25;
      v5 = v35;
LABEL_31:
      a1 = (uint64_t *)objc_msgSend(v11, sel_loginChoiceKind);
      swift_unknownObjectRelease();
      if (!a1)
        break;
      if (v12 == v36)
      {
        swift_bridgeObjectRelease();
        if ((v8 & 1) == 0)
          goto LABEL_47;
        v27 = v33;
        if (v10)
        {
          *v33 = v9;
          v33[1] = v10;
LABEL_45:
          v27[2] = 0;
          *((_BYTE *)v27 + 24) = 1;
          return;
        }
LABEL_44:
        v28 = objc_msgSend(v32, sel_appIdentifier);
        v29 = sub_20E5572B4();
        v31 = v30;

        *v27 = v29;
        v27[1] = v31;
        goto LABEL_45;
      }
      ++v7;
    }
    if ((v8 & 1) != 0)
      goto LABEL_41;
    if (v12 == v36)
      break;
    v8 = 0;
    ++v7;
  }
  swift_bridgeObjectRelease();
LABEL_47:
  a1 = v33;
LABEL_48:
  swift_bridgeObjectRelease();
  a1[1] = 0;
  a1[2] = 0;
  *a1 = 2;
  *((_BYTE *)a1 + 24) = 4;
}

uint64_t sub_20E53F23C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  char v3;
  uint64_t *v4;
  uint64_t v5;

  if (*(_BYTE *)(v1 + 44))
  {
    if (*(_BYTE *)(v1 + 44) == 1)
    {
      if (qword_254A28ED0 != -1)
        swift_once();
      v3 = 1;
      v4 = &qword_254A2A9E0;
    }
    else if (*(_QWORD *)(v1 + 32) == 1)
    {
      if (qword_254A28ED8 != -1)
        swift_once();
      v3 = 3;
      v4 = &qword_254A2A9F0;
    }
    else
    {
      if (qword_254A28EC0 != -1)
        swift_once();
      v3 = 1;
      v4 = &qword_254A2A9C0;
    }
  }
  else
  {
    if (qword_254A28EE0 != -1)
      swift_once();
    v3 = 4;
    v4 = &qword_254A2AA00;
  }
  v5 = v4[1];
  *(_QWORD *)a1 = *v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_BYTE *)(a1 + 16) = v3;
  return swift_bridgeObjectRetain();
}

void ASAuthorizationUIContext.iconType.getter()
{
  __asm { BR              X6 }
}

void sub_20E53F3C4()
{
  uint64_t v0;

  sub_20E536B18(v0);
}

BOOL sub_20E53F590(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASAuthorizationUIContext.Header.title.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ASAuthorizationUIContext.Header.leadingSymbol.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ASAuthorizationUIContext.MainButton.text.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

void ASAuthorizationUIContext.MainButton.action.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 16);
}

uint64_t ASAuthorizationUIContext.OtherOptionsText.hash(into:)()
{
  return sub_20E5575B4();
}

BOOL static ASAuthorizationUIContext.OtherOptionsText.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t ASAuthorizationUIContext.OtherOptionsText.hashValue.getter()
{
  sub_20E5575A8();
  sub_20E5575B4();
  return sub_20E5575C0();
}

id ASAuthorizationUIContext.presentationContext.getter()
{
  id *v0;

  return *v0;
}

void ASAuthorizationUIContext.presentationContext.setter(void *a1)
{
  id *v1;

  *v1 = a1;
}

uint64_t (*ASAuthorizationUIContext.presentationContext.modify())()
{
  return nullsub_1;
}

uint64_t ASAuthorizationUIContext.service.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  char v3;

  v2 = *(_QWORD *)(v1 + 16);
  v3 = *(_BYTE *)(v1 + 24);
  *(_QWORD *)a1 = *(_QWORD *)(v1 + 8);
  *(_QWORD *)(a1 + 8) = v2;
  *(_BYTE *)(a1 + 16) = v3;
  return sub_20E534780();
}

uint64_t ASAuthorizationUIContext.service.setter(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t result;

  v2 = *a1;
  v3 = a1[1];
  v4 = *((_BYTE *)a1 + 16);
  result = sub_20E534F04();
  *(_QWORD *)(v1 + 8) = v2;
  *(_QWORD *)(v1 + 16) = v3;
  *(_BYTE *)(v1 + 24) = v4;
  return result;
}

uint64_t (*ASAuthorizationUIContext.service.modify())()
{
  return nullsub_1;
}

uint64_t ASAuthorizationUIContext.biometryType.getter()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + 32);
}

uint64_t ASAuthorizationUIContext.biometryType.setter(uint64_t result)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = result;
  return result;
}

uint64_t (*ASAuthorizationUIContext.biometryType.modify())()
{
  return nullsub_1;
}

uint64_t sub_20E53F79C(uint64_t a1)
{
  return sub_20E53F85C(a1, 0x6E49206E676953, 0xE700000000000000, &qword_254A2A9C0, algn_254A2A9C8);
}

uint64_t sub_20E53F7C0(uint64_t a1)
{
  return sub_20E53F85C(a1, 0x65756E69746E6F43, 0xE800000000000000, &qword_254A2A9D0, algn_254A2A9D8);
}

uint64_t sub_20E53F7E4(uint64_t a1)
{
  return sub_20E53F85C(a1, 0xD000000000000015, 0x800000020E566B80, &qword_254A2A9E0, algn_254A2A9E8);
}

uint64_t sub_20E53F80C(uint64_t a1)
{
  return sub_20E53F85C(a1, 0x1000000000000016, 0x800000020E566BA0, &qword_254A2A9F0, algn_254A2A9F8);
}

uint64_t sub_20E53F834(uint64_t a1)
{
  return sub_20E53F85C(a1, 0xD000000000000015, 0x800000020E566B60, &qword_254A2AA00, algn_254A2AA08);
}

uint64_t sub_20E53F85C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t *a4, _QWORD *a5)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t result;
  uint64_t v15;

  v7 = sub_20E556DEC();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x24BDAC7A8](v7);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E556DE0();
  v11 = sub_20E556DD4();
  v13 = v12;
  result = (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  *a4 = v11;
  *a5 = v13;
  return result;
}

void ASAuthorizationUIContext.header.getter()
{
  uint64_t v1;
  uint64_t v2;

  v1 = sub_20E556DEC();
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  __asm { BR              X9 }
}

void sub_20E53F9DC(uint64_t a1, int a2, int a3)
{
  uint64_t v3;
  char v4;
  char v5;
  int v6;
  char v7;
  int v8;
  char v9;
  char v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  char v20;

  if (qword_254A28EC0 != -1)
  {
    *(_QWORD *)(v16 - 216) = v3;
    *(_DWORD *)(v16 - 184) = a2;
    *(_DWORD *)(v16 - 180) = v8;
    v17 = v4;
    v18 = v5;
    *(_DWORD *)(v16 - 200) = v6;
    v19 = v7;
    v20 = v9;
    *(_DWORD *)(v16 - 188) = a3;
    swift_once();
    a3 = *(_DWORD *)(v16 - 188);
    a2 = *(_DWORD *)(v16 - 184);
    v9 = v20;
    v8 = *(_DWORD *)(v16 - 180);
    v7 = v19;
    v6 = *(_DWORD *)(v16 - 200);
    v5 = v18;
    v4 = v17;
    v3 = *(_QWORD *)(v16 - 216);
  }
  *(_QWORD *)(v16 - 136) = v3;
  *(_QWORD *)(v16 - 128) = v14;
  *(_QWORD *)(v16 - 120) = v13;
  *(_BYTE *)(v16 - 112) = v12;
  *(_QWORD *)(v16 - 104) = v11;
  *(_BYTE *)(v16 - 96) = v15;
  *(_BYTE *)(v16 - 95) = v10;
  *(_BYTE *)(v16 - 94) = a3;
  *(_BYTE *)(v16 - 93) = a2;
  *(_BYTE *)(v16 - 92) = v9;
  *(_BYTE *)(v16 - 91) = v8;
  *(_BYTE *)(v16 - 90) = v7;
  *(_BYTE *)(v16 - 89) = v6;
  *(_BYTE *)(v16 - 88) = v5;
  *(_BYTE *)(v16 - 87) = v4;
  swift_bridgeObjectRetain();
  ASAuthorizationUIContext.iconType.getter();
  __asm { BR              X10 }
}

void ASAuthorizationUIContext.title.getter()
{
  __asm { BR              X3 }
}

void sub_20E5403E4()
{
  _QWORD *v0;

  *v0 = 0;
  v0[1] = 0;
}

void sub_20E5404BC(uint64_t a1, unint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  void *v4;

  sub_20E5454A8(a1, a2, a3, 1);
  objc_msgSend(v4, sel_isRegistrationRequest);

  sub_20E534F04();
  *v3 = 0;
  JUMPOUT(0x20E5404A0);
}

void sub_20E5404F4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  void *v3;

  sub_20E5454A8(a1, a2, a3, 3);

  sub_20E534F04();
  sub_20E5403E4();
}

void sub_20E540514(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a3 | a2 | a1 && a1 == 1 && !(a3 | a2))
    JUMPOUT(0x20E54052CLL);
  JUMPOUT(0x20E5404D0);
}

void ASAuthorizationUIContext.otherOptionsText.getter(char *a1@<X8>)
{
  uint64_t v1;
  char v3;
  id v4;
  unsigned int v5;
  id v6;
  id v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  id v11;
  id v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  unint64_t v17;
  uint64_t v18;
  id v19;
  id v20;
  unint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  unint64_t v26;
  unint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;

  if ((*(_BYTE *)(v1 + 41) & 1) != 0 || *(unsigned __int8 *)(v1 + 40) < 2u)
  {
LABEL_3:
    v3 = 0;
LABEL_4:
    *a1 = v3;
    return;
  }
  v4 = *(id *)v1;
  v5 = objc_msgSend(*(id *)v1, sel_isRegistrationRequest);
  v6 = v4;
  sub_20E534780();
  v7 = objc_msgSend(v6, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v8 = sub_20E5572FC();

  if (v5)
  {
    v9 = sub_20E534CBC(v8, (uint64_t)&unk_24C9521D0);

    swift_bridgeObjectRelease();
    sub_20E534F04();
    if (v9 >> 62)
    {
      swift_bridgeObjectRetain();
      v10 = sub_20E557500();
      swift_bridgeObjectRelease();
    }
    else
    {
      v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v10 != 1)
    {
LABEL_22:
      v24 = v6;
      sub_20E534780();
      v25 = objc_msgSend(v24, sel_loginChoices);
      v26 = sub_20E5572FC();

      v27 = sub_20E534CBC(v26, (uint64_t)&unk_24C952250);
      swift_bridgeObjectRelease();
      sub_20E534F04();
      if (v27 >> 62)
      {
        swift_bridgeObjectRetain();
        v28 = sub_20E557500();
        swift_bridgeObjectRelease();
      }
      else
      {
        v28 = *(_QWORD *)((v27 & 0xFFFFFFFFFFFFF8) + 0x10);
      }
      swift_bridgeObjectRelease();
      if (v28 >= 1)
      {
        v3 = 4;
        goto LABEL_4;
      }
      goto LABEL_3;
    }
    v11 = v6;
    sub_20E534780();
    v12 = objc_msgSend(v11, sel_loginChoices);
    v13 = sub_20E5572FC();

    v14 = sub_20E534CBC(v13, (uint64_t)&unk_24C952210);
    swift_bridgeObjectRelease();
    sub_20E534F04();
    if ((v14 & 0xC000000000000001) != 0)
    {
      v15 = (void *)MEMORY[0x212BBE86C](0, v14);
LABEL_12:
      swift_bridgeObjectRelease();
      v16 = objc_msgSend(v15, sel_loginChoiceKind);
      swift_unknownObjectRelease();
      if (v16 == (id)4)
      {
        v3 = 2;
        goto LABEL_4;
      }
      goto LABEL_22;
    }
    if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      v15 = *(void **)(v14 + 32);
      swift_unknownObjectRetain();
      goto LABEL_12;
    }
    __break(1u);
LABEL_36:
    v22 = (void *)MEMORY[0x212BBE86C](0, v14);
LABEL_20:
    swift_bridgeObjectRelease();
    v23 = objc_msgSend(v22, sel_loginChoiceKind);
    swift_unknownObjectRelease();
    if (v23 == (id)4)
    {
      v3 = 1;
      goto LABEL_4;
    }
    goto LABEL_26;
  }
  v17 = sub_20E534CBC(v8, (uint64_t)&unk_24C952290);

  swift_bridgeObjectRelease();
  sub_20E534F04();
  if (v17 >> 62)
  {
    swift_bridgeObjectRetain();
    v18 = sub_20E557500();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = *(_QWORD *)((v17 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  swift_bridgeObjectRelease();
  if (v18 != 1)
  {
LABEL_26:
    v29 = v6;
    sub_20E534780();
    v30 = objc_msgSend(v29, sel_loginChoices);
    v31 = sub_20E5572FC();

    v32 = sub_20E534CBC(v31, (uint64_t)&unk_24C952310);
    swift_bridgeObjectRelease();
    sub_20E534F04();
    if (v32 >> 62)
    {
      swift_bridgeObjectRetain();
      v33 = sub_20E557500();
      swift_bridgeObjectRelease();
    }
    else
    {
      v33 = *(_QWORD *)((v32 & 0xFFFFFFFFFFFFF8) + 0x10);
    }
    swift_bridgeObjectRelease();
    if (v33 > 0)
    {
      v3 = 3;
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  v19 = v6;
  sub_20E534780();
  v20 = objc_msgSend(v19, sel_loginChoices);
  v21 = sub_20E5572FC();

  v14 = sub_20E534CBC(v21, (uint64_t)&unk_24C9522D0);
  swift_bridgeObjectRelease();
  sub_20E534F04();
  if ((v14 & 0xC000000000000001) != 0)
    goto LABEL_36;
  if (*(_QWORD *)((v14 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v22 = *(void **)(v14 + 32);
    swift_unknownObjectRetain();
    goto LABEL_20;
  }
  __break(1u);
}

id ASAuthorizationUIContext.shouldShowManualPasswordEntryButton.getter()
{
  id *v0;
  id v1;
  id result;

  v1 = *v0;
  result = objc_msgSend(*v0, sel_isProxiedRequest);
  if ((_DWORD)result)
    return (id)((unint64_t)objc_msgSend(v1, sel_requestTypes) & 1);
  return result;
}

void ASAuthorizationUIContext.message(for:)()
{
  __asm { BR              X5 }
}

uint64_t sub_20E540B44()
{
  _QWORD *v0;

  return sub_20E536744(v0);
}

void ASAuthorizationUIContext.mainButton(for:)()
{
  uint64_t v1;
  uint64_t v2;

  v1 = sub_20E556DEC();
  v2 = MEMORY[0x24BDAC7A8](v1);
  MEMORY[0x24BDAC7A8](v2);
  __asm { BR              X3 }
}

uint64_t sub_20E540DBC()
{
  uint64_t v0;
  char v1;
  int v2;
  uint64_t v3;
  uint64_t result;
  void *v5;
  unsigned __int8 v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;

  objc_opt_self();
  result = swift_dynamicCastObjCClass();
  if (result)
  {
    v5 = (void *)result;
    swift_unknownObjectRetain();
    v6 = objc_msgSend(v5, sel_isExternal);
    if ((v6 & 1) == 0 && v2 == 2 && v3 == 1)
    {
      result = swift_unknownObjectRelease();
      *(_QWORD *)v0 = 0;
      *(_QWORD *)(v0 + 8) = 0;
      v7 = 3;
    }
    else
    {
      v8 = v6 ^ 1;
      if (qword_254A28EC8 != -1)
        swift_once();
      v10 = qword_254A2A9D0;
      v9 = *(_QWORD *)algn_254A2A9D8;
      swift_bridgeObjectRetain();
      result = swift_unknownObjectRelease();
      v7 = v8 & v1;
      *(_QWORD *)v0 = v10;
      *(_QWORD *)(v0 + 8) = v9;
    }
    *(_BYTE *)(v0 + 16) = v7;
  }
  else
  {
    *(_OWORD *)v0 = xmmword_20E55ECD0;
    *(_BYTE *)(v0 + 16) = 0;
  }
  return result;
}

void ASAuthorizationUIContext.onlyHasOtherAccountsLoginChoices.getter()
{
  unint64_t v0;
  uint64_t v1;
  unint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t i;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  ASAuthorizationUIContext.loginChoicesToShow.getter();
  if (v0 >> 62)
    v1 = sub_20E557500();
  else
    v1 = *(_QWORD *)((v0 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRelease();
  if (!v1)
    return;
  ASAuthorizationUIContext.loginChoicesToShow.getter();
  v3 = v2;
  v8 = MEMORY[0x24BEE4AF8];
  if (v2 >> 62)
  {
    v4 = sub_20E557500();
    if (v4)
      goto LABEL_6;
LABEL_21:
    swift_bridgeObjectRelease();
    v7 = MEMORY[0x24BEE4AF8];
    if ((MEMORY[0x24BEE4AF8] & 0x8000000000000000) != 0)
      goto LABEL_24;
    goto LABEL_22;
  }
  v4 = *(_QWORD *)((v2 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (!v4)
    goto LABEL_21;
LABEL_6:
  if (v4 >= 1)
  {
    for (i = 0; i != v4; ++i)
    {
      if ((v3 & 0xC000000000000001) != 0)
      {
        v6 = (void *)MEMORY[0x212BBE86C](i, v3);
      }
      else
      {
        v6 = *(void **)(v3 + 8 * i + 32);
        swift_unknownObjectRetain();
      }
      if (objc_msgSend(v6, sel_loginChoiceKind) == (id)5 || objc_msgSend(v6, sel_loginChoiceKind) == (id)6)
      {
        swift_unknownObjectRelease();
      }
      else
      {
        sub_20E55747C();
        sub_20E5574A0();
        sub_20E5574AC();
        sub_20E557488();
      }
    }
    swift_bridgeObjectRelease();
    v7 = v8;
    if (v8 < 0)
      goto LABEL_24;
LABEL_22:
    if ((v7 & 0x4000000000000000) == 0)
    {
LABEL_23:
      swift_release();
      return;
    }
LABEL_24:
    swift_bridgeObjectRetain();
    sub_20E557500();
    swift_release();
    goto LABEL_23;
  }
  __break(1u);
}

double ASAuthorizationUIContext.init(presentationContext:shouldExpandLoginChoices:configurationOverrides:)@<D0>(void *a1@<X0>, char a2@<W1>, unint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  void *v7;
  unint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  unsigned __int8 v18;
  id v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  id v24;
  char v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double result;
  id v32;
  id v33;
  id v34;
  uint64_t v35;
  char v36;
  char v37;
  id v38;
  char v39;
  id v40;
  unint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  id v47;
  uint64_t v48;
  id v49;
  __int16 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  __int16 v60;
  id v61;
  int v62;
  id v63;
  id v64;
  char v65;
  unsigned int v66;
  int v67;
  unsigned __int8 v68;
  int v69;
  uint64_t v70;
  id v71;
  void *v72;
  __int128 v73;
  unsigned __int8 v74;
  id v75;
  unsigned __int8 v76;
  char v77;
  char v78;
  char v79;
  unsigned __int8 v80;
  char v81;
  char v82;
  char v83;
  unsigned __int8 v84;
  unsigned __int8 v85;

  v8 = *a3;
  v7 = (void *)a3[1];
  v9 = *((unsigned int *)a3 + 4) | ((unint64_t)*((unsigned __int8 *)a3 + 20) << 32);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BDDA938]), sel_init);
  v68 = objc_msgSend(v10, sel_canEvaluatePolicy_error_, 1, 0);
  v71 = v10;
  v66 = objc_msgSend(v10, sel_canEvaluatePolicy_error_, 2, 0);
  v72 = a1;
  v11 = v8;
  v70 = a4;
  if ((v8 & 0xFE) == 2)
  {
    v12 = (void *)objc_opt_self();
    v13 = a1;
    v14 = objc_msgSend(v12, sel_sharedMonitor);
    v15 = objc_msgSend(v14, sel_isKeychainSyncEnabled);

    v78 = (char)v15;
    if (v8 == 3)
    {
LABEL_6:
      v17 = objc_msgSend((id)objc_opt_self(), sel_sharedMonitor);
      v18 = objc_msgSend(v17, sel_canKeychainSyncBeEnabled);

      v79 = v18;
      if (v8 == 3)
        goto LABEL_10;
      goto LABEL_9;
    }
  }
  else
  {
    v15 = (id)(v8 & 1);
    v78 = v8 & 1;
    v16 = a1;
  }
  if ((v8 & 0xFF00) == 0x200)
    goto LABEL_6;
  v79 = BYTE1(v8) & 1;
LABEL_9:
  if ((v8 & 0xFF000000) != 0x2000000)
  {
    v20 = (v8 >> 24) & 1;
    v81 = BYTE3(v8) & 1;
    goto LABEL_13;
  }
LABEL_10:
  v19 = objc_msgSend((id)objc_opt_self(), sel_sharedFeatureManager);
  LODWORD(v20) = objc_msgSend(v19, sel_shouldAutoFillPasswordsFromKeychain);

  v81 = v20;
  if (v8 == 3)
  {
    v75 = objc_msgSend(v71, sel_biometryType);
    goto LABEL_17;
  }
LABEL_13:
  if ((v9 & 1) != 0)
  {
    v75 = objc_msgSend(v71, sel_biometryType);
    if (v8 == 3)
      goto LABEL_17;
  }
  else
  {
    v75 = v7;
  }
  if ((v9 & 0xFF000000) >> 24 != 2)
  {
    v84 = BYTE3(v9) & 1;
    goto LABEL_20;
  }
LABEL_17:
  v84 = objc_msgSend((id)objc_opt_self(), sel_shouldRequireLocalAuthenticationForPasswords);
  if (v8 == 3)
  {
LABEL_21:
    v85 = objc_msgSend((id)objc_opt_self(), sel_shouldRequireLocalAuthenticationForPlatformCredentials);
    v77 = a2 & 1;
    if (v8 == 3)
      goto LABEL_25;
    goto LABEL_24;
  }
LABEL_20:
  if (BYTE4(v9) == 2)
    goto LABEL_21;
  v85 = BYTE4(v9) & 1;
  v77 = a2 & 1;
LABEL_24:
  if (BYTE2(v8) != 3)
  {
    v64 = v15;
    v21 = v8 >> 16;
    v80 = BYTE2(v8);
    v22 = objc_msgSend(a1, sel_serviceType, v64);
    goto LABEL_32;
  }
LABEL_25:
  v63 = v15;
  if ((v68 & 1) != 0)
  {
    LOBYTE(v21) = 2;
    v80 = 2;
  }
  else if (v66)
  {
    LOBYTE(v21) = 1;
    v80 = 1;
  }
  else
  {
    LOBYTE(v21) = 0;
    v80 = 0;
  }
  v22 = objc_msgSend(a1, sel_serviceType, v63);
LABEL_32:
  if (v22 == (id)1)
  {
    v26 = objc_msgSend(a1, sel_serviceName);
    if (v26)
    {
      v24 = v26;
      v69 = v20;
      v25 = 0;
      goto LABEL_39;
    }
LABEL_42:

    *(_WORD *)(v70 + 48) = 0;
    result = 0.0;
    *(_OWORD *)(v70 + 16) = 0u;
    *(_OWORD *)(v70 + 32) = 0u;
    *(_OWORD *)v70 = 0u;
    return result;
  }
  if (v22)
    goto LABEL_42;
  v23 = objc_msgSend(a1, sel_serviceName);
  if (v23)
  {
    v24 = v23;
    v69 = v20;
  }
  else
  {
    sub_20E53D644(0, &qword_254A29808);
    v38 = objc_msgSend(a1, sel_appIdentifier);
    sub_20E5572B4();

    v61 = sub_20E541F40();
    v69 = v20;
    v24 = objc_msgSend(v61, sel_localizedName);

  }
  v25 = 1;
LABEL_39:
  v27 = sub_20E5572B4();
  v29 = v28;

  *(_QWORD *)&v73 = v27;
  *((_QWORD *)&v73 + 1) = v29;
  v74 = v25;
  if (v11 == 3 || (v9 & 0xFF0000) == 0x20000)
  {
    v32 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
    LODWORD(v30) = objc_msgSend(v32, sel_atLeastOneEnabledExtensionSupportsPasskeys);

    v83 = v30;
    if (v11 == 3)
      goto LABEL_45;
  }
  else
  {
    v30 = (v9 >> 16) & 1;
    v83 = (v9 & 0x10000) >> 16;
  }
  if (BYTE1(v9) != 2)
  {
    v82 = BYTE1(v9) & 1;
    goto LABEL_50;
  }
LABEL_45:
  v33 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
  v34 = objc_msgSend(v33, sel_extensionsSync);

  if (v34)
  {
    sub_20E53D644(0, &qword_254A297F8);
    sub_20E5454E0();
    v35 = sub_20E557314();

    sub_20E53E15C(v35);
    v37 = v36;
    swift_bridgeObjectRelease();
    v82 = v37 & 1;
  }
  else
  {
    v82 = 0;
  }
LABEL_50:
  if (objc_msgSend(a1, sel_requestTypes) == (id)2)
  {
    v39 = 1;
    goto LABEL_66;
  }
  if (objc_msgSend(a1, sel_requestTypes) == (id)1)
  {
    v39 = 0;
    goto LABEL_66;
  }
  v40 = objc_msgSend(a1, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v41 = sub_20E5572FC();

  v67 = v30;
  if (v41 >> 62)
  {
    swift_bridgeObjectRetain();
    v42 = sub_20E557500();
    if (v42)
    {
LABEL_56:
      v43 = 4;
      while (1)
      {
        v44 = v43 - 4;
        if ((v41 & 0xC000000000000001) != 0)
        {
          v45 = (void *)MEMORY[0x212BBE86C](v43 - 4, v41);
          v46 = v43 - 3;
          if (__OFADD__(v44, 1))
            goto LABEL_96;
        }
        else
        {
          v45 = *(void **)(v41 + 8 * v43);
          swift_unknownObjectRetain();
          v46 = v43 - 3;
          if (__OFADD__(v44, 1))
          {
LABEL_96:
            __break(1u);
LABEL_97:
            v39 = 4;
            goto LABEL_67;
          }
        }
        v47 = objc_msgSend(v45, sel_loginChoiceKind);
        swift_unknownObjectRelease();
        if (v47 == (id)2)
          break;
        ++v43;
        if (v46 == v42)
          goto LABEL_64;
      }
      swift_bridgeObjectRelease_n();
      if ((objc_msgSend(a1, sel_requestTypes) & 1) == 0
        && (objc_msgSend(a1, sel_requestTypes) & 2) == 0)
      {
        if ((v69 | v67) != 1)
        {
          v39 = 5;
          goto LABEL_66;
        }
        if ((_BYTE)v21)
          v62 = 1;
        else
          v62 = v67;
        if (v62 != 1)
        {
          v39 = 3;
          goto LABEL_66;
        }
        v46 = v70;
        if ((v65 & 1) != 0 || (objc_msgSend(a1, sel_isRegistrationRequest) ^ 1 | v67) == 1)
        {
          v39 = 2;
          goto LABEL_67;
        }
        goto LABEL_97;
      }
      goto LABEL_65;
    }
  }
  else
  {
    v42 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
    swift_bridgeObjectRetain();
    if (v42)
      goto LABEL_56;
  }
LABEL_64:
  swift_bridgeObjectRelease_n();
LABEL_65:
  v39 = 6;
LABEL_66:
  v46 = v70;
LABEL_67:
  v76 = v39;
  sub_20E542014(a1, (unsigned __int8 *)&v72);

  v48 = v74;
  v49 = v75;
  v50 = v84;
  if (v77)
    v51 = 256;
  else
    v51 = 0;
  v52 = 0x10000;
  if (!v78)
    v52 = 0;
  v53 = 0x1000000;
  if (!v79)
    v53 = 0;
  v54 = v51 | v76 | v52 | v53 | ((unint64_t)v80 << 32);
  v55 = 0x10000000000;
  if (!v81)
    v55 = 0;
  v56 = 0x1000000000000;
  if (!v82)
    v56 = 0;
  v57 = v55 | v56;
  v58 = 0x100000000000000;
  if (!v83)
    v58 = 0;
  v59 = v54 | v57 | v58;
  if (v85)
    v60 = 256;
  else
    v60 = 0;
  *(_QWORD *)v46 = v72;
  result = *(double *)&v73;
  *(_OWORD *)(v46 + 8) = v73;
  *(_QWORD *)(v46 + 24) = v48;
  *(_QWORD *)(v46 + 32) = v49;
  *(_QWORD *)(v46 + 40) = v59;
  *(_WORD *)(v46 + 48) = v60 | v50;
  return result;
}

id sub_20E541F40()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v5[2];

  v5[1] = *(id *)MEMORY[0x24BDAC8D0];
  v0 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v5[0] = 0;
  v1 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bundleRecordWithApplicationIdentifier_error_, v0, v5);

  if (v1)
  {
    v2 = v5[0];
  }
  else
  {
    v3 = v5[0];
    sub_20E556D8C();

    swift_willThrow();
  }
  return v1;
}

void sub_20E542014(void *a1, unsigned __int8 *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint8_t *v20;
  uint64_t v21;
  int v22;
  unint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  NSObject *v29;
  os_log_type_t v30;
  uint8_t *v31;
  int v32;
  unint64_t v33;
  NSObject *v34;
  os_log_type_t v35;
  uint64_t v36;
  uint8_t *v37;
  uint64_t v38;
  id v39;
  id v40;
  unint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  void *v49;
  id v50;
  NSObject *v51;
  os_log_type_t v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  void *v56;
  uint64_t v57;
  unint64_t v58;
  unint64_t v59;
  id v60;
  unint64_t v61;
  _QWORD *v62;
  uint64_t v63;
  _QWORD *v64;
  uint64_t v65;
  _QWORD *v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  unint64_t v71;
  unint64_t v72;
  unint64_t v73;
  _QWORD *v74;
  unint64_t v75;
  unint64_t v76;
  _QWORD *v77;
  unint64_t v78;
  unint64_t v79;
  _QWORD *v80;
  unint64_t v81;
  unint64_t v82;
  _QWORD *v83;
  unint64_t v84;
  unint64_t v85;
  _QWORD *v86;
  NSObject *v87;
  os_log_type_t v88;
  uint8_t *v89;
  uint64_t v90;
  uint64_t v91;
  unint64_t v92;
  unint64_t v93;
  id v94[2];
  __int128 v95;
  char *v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  unsigned __int8 *v100;
  unint64_t v101;
  unint64_t v102;
  uint64_t v103;
  uint64_t v104[2];

  v4 = sub_20E55720C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)v94 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94[0] = a1;
  v8 = objc_msgSend(a1, sel_loginChoices);
  __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
  v9 = sub_20E5572FC();

  LOBYTE(v8) = sub_20E53DEB4(v9, (uint64_t)a2);
  swift_bridgeObjectRelease();
  if ((v8 & 1) == 0 && a2[40] - 3 >= 3)
    a2[41] = 1;
  if (qword_254A28EE8 != -1)
    goto LABEL_48;
  while (1)
  {
    v10 = __swift_project_value_buffer(v4, (uint64_t)qword_254A2AA10);
    v11 = sub_20E5571F4();
    v12 = sub_20E55738C();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_20E4D9000, v11, v12, "ASAuthorizationUIContext configuration:", v13, 2u);
      MEMORY[0x212BBF364](v13, -1, -1);
    }

    LOBYTE(v104[0]) = a2[44];
    v14 = sub_20E5572C0();
    v16 = v15;
    swift_bridgeObjectRetain();
    v17 = sub_20E5571F4();
    v18 = sub_20E55738C();
    v19 = os_log_type_enabled(v17, v18);
    v98 = v4;
    v99 = v10;
    v96 = v7;
    v97 = v5;
    if (v19)
    {
      v20 = (uint8_t *)swift_slowAlloc();
      v21 = swift_slowAlloc();
      v104[0] = v21;
      *(_DWORD *)v20 = 136315138;
      swift_bridgeObjectRetain();
      v103 = sub_20E542F7C(v14, v16, v104);
      v10 = v99;
      sub_20E5573C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20E4D9000, v17, v18, "\tUser verification: %s", v20, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BBF364](v21, -1, -1);
      MEMORY[0x212BBF364](v20, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v22 = a2[42];
    v23 = a2[42] ? 0xE200000000000000 : 0xE300000000000000;
    swift_bridgeObjectRetain();
    v24 = sub_20E5571F4();
    v25 = sub_20E55738C();
    if (os_log_type_enabled(v24, v25))
    {
      if (v22)
        v26 = 28271;
      else
        v26 = 6710895;
      v27 = (uint8_t *)swift_slowAlloc();
      v28 = swift_slowAlloc();
      v104[0] = v28;
      *(_DWORD *)v27 = 136315138;
      swift_bridgeObjectRetain();
      v103 = sub_20E542F7C(v26, v23, v104);
      v10 = v99;
      sub_20E5573C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20E4D9000, v24, v25, "\tKeychain sync: %s", v27, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BBF364](v28, -1, -1);
      MEMORY[0x212BBF364](v27, -1, -1);

      if ((a2[43] & 1) != 0)
        goto LABEL_23;
    }
    else
    {

      swift_bridgeObjectRelease_n();
      if ((a2[43] & 1) != 0)
        goto LABEL_23;
    }
    v29 = sub_20E5571F4();
    v30 = sub_20E55738C();
    if (os_log_type_enabled(v29, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v31 = 0;
      _os_log_impl(&dword_20E4D9000, v29, v30, "\tKeychain sync restricted by configuration profile", v31, 2u);
      MEMORY[0x212BBF364](v31, -1, -1);
    }

LABEL_23:
    v32 = a2[45];
    if (a2[45])
      v33 = 0xE200000000000000;
    else
      v33 = 0xE300000000000000;
    swift_bridgeObjectRetain();
    v34 = sub_20E5571F4();
    v35 = sub_20E55738C();
    if (os_log_type_enabled(v34, v35))
    {
      if (v32)
        v36 = 28271;
      else
        v36 = 6710895;
      v37 = (uint8_t *)swift_slowAlloc();
      v38 = swift_slowAlloc();
      v104[0] = v38;
      *(_DWORD *)v37 = 136315138;
      swift_bridgeObjectRetain();
      v103 = sub_20E542F7C(v36, v33, v104);
      sub_20E5573C8();
      swift_bridgeObjectRelease_n();
      _os_log_impl(&dword_20E4D9000, v34, v35, "\tiCloud Keychain AutoFill: %s", v37, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BBF364](v38, -1, -1);
      MEMORY[0x212BBF364](v37, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease_n();
    }
    v5 = v97;
    v4 = v98;
    v7 = v96;
    v39 = objc_msgSend((id)objc_opt_self(), sel_sharedManager);
    v40 = objc_msgSend(v39, sel_getEnabledExtensionsSynchronously);

    if (!v40)
      goto LABEL_51;
    sub_20E53D644(0, &qword_254A297F8);
    v41 = sub_20E5572FC();

    v42 = sub_20E5571F4();
    v43 = sub_20E55738C();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v44 = 0;
      _os_log_impl(&dword_20E4D9000, v42, v43, "\tEnabled credential provider extension:", v44, 2u);
      MEMORY[0x212BBF364](v44, -1, -1);
    }

    if (v41 >> 62)
      break;
    v46 = *(_QWORD *)((v41 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (!v46)
      goto LABEL_50;
LABEL_37:
    v102 = v41 & 0xC000000000000001;
    v47 = 4;
    *(_QWORD *)&v45 = 136446210;
    v95 = v45;
    v94[1] = (id)(MEMORY[0x24BEE4AD8] + 8);
    v100 = (unsigned __int8 *)v46;
    v101 = v41;
    while (1)
    {
      v48 = v102 ? (id)MEMORY[0x212BBE86C](v47 - 4, v41) : *(id *)(v41 + 8 * v47);
      v49 = v48;
      a2 = (unsigned __int8 *)(v47 - 3);
      if (__OFADD__(v47 - 4, 1))
        break;
      (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, v10, v4);
      v50 = v49;
      v51 = sub_20E5571F4();
      v52 = sub_20E55738C();
      if (os_log_type_enabled(v51, v52))
      {
        v53 = swift_slowAlloc();
        v54 = swift_slowAlloc();
        v104[0] = v54;
        *(_DWORD *)v53 = v95;
        v55 = objc_msgSend(v50, sel__localizedName);
        if (!v55)
        {

          __break(1u);
          JUMPOUT(0x20E542E7CLL);
        }
        v56 = v55;
        v57 = sub_20E5572B4();
        v59 = v58;

        *(_QWORD *)(v53 + 4) = sub_20E542F7C(v57, v59, v104);
        swift_bridgeObjectRelease();
        _os_log_impl(&dword_20E4D9000, v51, v52, "\t\t%{public}s", (uint8_t *)v53, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x212BBF364](v54, -1, -1);
        MEMORY[0x212BBF364](v53, -1, -1);

        v7 = v96;
        v5 = v97;
        v4 = v98;
        (*(void (**)(char *, uint64_t))(v97 + 8))(v96, v98);
        v10 = v99;
      }
      else
      {

        (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
      }
      v41 = v101;
      ++v47;
      if (a2 == v100)
        goto LABEL_50;
    }
    __break(1u);
LABEL_48:
    swift_once();
  }
  swift_bridgeObjectRetain();
  v46 = sub_20E557500();
  swift_bridgeObjectRelease();
  if (v46)
    goto LABEL_37;
LABEL_50:
  swift_bridgeObjectRelease();
LABEL_51:
  v60 = objc_msgSend(v94[0], sel_requestTypes);
  if (v60)
  {
    v61 = (unint64_t)v60;
    v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
    v63 = 1;
    v102 = (unint64_t)"Passkey Assertion";
    while (1)
    {
      if ((v61 & v63) != 0)
      {
        switch(v63)
        {
          case 1:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v62 = sub_20E54C728(0, v62[2] + 1, 1, v62);
            v69 = v62[2];
            v68 = v62[3];
            if (v69 >= v68 >> 1)
              v62 = sub_20E54C728((_QWORD *)(v68 > 1), v69 + 1, 1, v62);
            v62[2] = v69 + 1;
            v64 = &v62[2 * v69];
            v65 = 0x64726F7773736150;
            goto LABEL_54;
          case 2:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v62 = sub_20E54C728(0, v62[2] + 1, 1, v62);
            v71 = v62[2];
            v70 = v62[3];
            if (v71 >= v70 >> 1)
              v62 = sub_20E54C728((_QWORD *)(v70 > 1), v71 + 1, 1, v62);
            v62[2] = v71 + 1;
            v64 = &v62[2 * v71];
            v65 = 0x444920656C707041;
LABEL_54:
            v64[4] = v65;
            v66 = v64 + 4;
            v67 = 0xE800000000000000;
            goto LABEL_55;
          case 4:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v62 = sub_20E54C728(0, v62[2] + 1, 1, v62);
            v73 = v62[2];
            v72 = v62[3];
            if (v73 >= v72 >> 1)
              v62 = sub_20E54C728((_QWORD *)(v72 > 1), v73 + 1, 1, v62);
            v62[2] = v73 + 1;
            v74 = &v62[2 * v73];
            v74[4] = 0xD000000000000014;
            v66 = v74 + 4;
            v67 = v102 | 0x8000000000000000;
            goto LABEL_55;
          case 8:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v62 = sub_20E54C728(0, v62[2] + 1, 1, v62);
            v76 = v62[2];
            v75 = v62[3];
            if (v76 >= v75 >> 1)
              v62 = sub_20E54C728((_QWORD *)(v75 > 1), v76 + 1, 1, v62);
            v62[2] = v76 + 1;
            v77 = &v62[2 * v76];
            v77[4] = 0xD000000000000011;
            v66 = v77 + 4;
            v67 = 0x800000020E566B20;
            goto LABEL_55;
          case 16:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v62 = sub_20E54C728(0, v62[2] + 1, 1, v62);
            v79 = v62[2];
            v78 = v62[3];
            if (v79 >= v78 >> 1)
              v62 = sub_20E54C728((_QWORD *)(v78 > 1), v79 + 1, 1, v62);
            v62[2] = v79 + 1;
            v80 = &v62[2 * v79];
            v80[4] = 0xD000000000000019;
            v66 = v80 + 4;
            v67 = 0x800000020E566B00;
            goto LABEL_55;
          case 32:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v62 = sub_20E54C728(0, v62[2] + 1, 1, v62);
            v82 = v62[2];
            v81 = v62[3];
            if (v82 >= v81 >> 1)
              v62 = sub_20E54C728((_QWORD *)(v81 > 1), v82 + 1, 1, v62);
            v62[2] = v82 + 1;
            v83 = &v62[2 * v82];
            v83[4] = 0xD000000000000016;
            v66 = v83 + 4;
            v67 = 0x800000020E566AE0;
            goto LABEL_55;
          case 64:
            if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
              v62 = sub_20E54C728(0, v62[2] + 1, 1, v62);
            v85 = v62[2];
            v84 = v62[3];
            if (v85 >= v84 >> 1)
              v62 = sub_20E54C728((_QWORD *)(v84 > 1), v85 + 1, 1, v62);
            v62[2] = v85 + 1;
            v86 = &v62[2 * v85];
            v86[4] = 0x454C426163;
            v66 = v86 + 4;
            v67 = 0xE500000000000000;
LABEL_55:
            v66[1] = v67;
            break;
          default:
            break;
        }
        v61 &= ~v63;
        if (!v61)
          break;
      }
      v63 *= 2;
    }
  }
  else
  {
    v62 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  swift_bridgeObjectRetain();
  v87 = sub_20E5571F4();
  v88 = sub_20E55738C();
  if (os_log_type_enabled(v87, v88))
  {
    v89 = (uint8_t *)swift_slowAlloc();
    v90 = swift_slowAlloc();
    v103 = (uint64_t)v62;
    v104[0] = v90;
    *(_DWORD *)v89 = 136315138;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29830);
    sub_20E546C48(&qword_254A29838, &qword_254A29830, MEMORY[0x24BEE12B0]);
    v91 = sub_20E55729C();
    v93 = v92;
    swift_bridgeObjectRelease();
    v103 = sub_20E542F7C(v91, v93, v104);
    sub_20E5573C8();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20E4D9000, v87, v88, "\tRequest types: %s", v89, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BBF364](v90, -1, -1);
    MEMORY[0x212BBF364](v89, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
}

uint64_t sub_20E542F7C(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20E54304C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20E546B94((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x24BEE2520];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_20E546B94((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_20E54304C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_20E5573D4();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_20E543204(a5, a6);
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
  v8 = sub_20E557470();
  if (!v8)
  {
    sub_20E5574E8();
    __break(1u);
LABEL_17:
    result = sub_20E55753C();
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

uint64_t sub_20E543204(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20E543298(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20E543470(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_20E543470(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20E543298(uint64_t a1, unint64_t a2)
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
      v3 = sub_20E54340C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_20E55744C();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_20E5574E8();
      __break(1u);
LABEL_10:
      v2 = sub_20E5572E4();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_20E55753C();
    __break(1u);
LABEL_14:
    result = sub_20E5574E8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_20E54340C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x24BEE4AF8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29828);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20E543470(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29828);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
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
  result = sub_20E55753C();
  __break(1u);
  return result;
}

uint64_t sub_20E5435BC(unint64_t a1)
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
    v3 = sub_20E557500();
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
    v5 = sub_20E557500();
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
    v4 = MEMORY[0x212BBE878](v5, v9, 1, v4);
    swift_bridgeObjectRelease();
    *v1 = v4;
    v8 = v4 & 0xFFFFFFFFFFFFFF8;
LABEL_15:
    result = sub_20E543998(v8 + 8 * *(_QWORD *)(v8 + 16) + 32, (*(_QWORD *)(v8 + 24) >> 1) - *(_QWORD *)(v8 + 16), a1);
    if (v11 >= v3)
      break;
LABEL_24:
    __break(1u);
LABEL_25:
    swift_bridgeObjectRetain();
    v9 = sub_20E557500();
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
    return sub_20E557308();
  }
  __break(1u);
  return result;
}

void sub_20E543774(uint64_t a1, uint64_t a2)
{
  __asm { BR              X10 }
}

uint64_t sub_20E5437D0()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v7;
  uint64_t v8;
  __int16 v9;
  char v10;
  char v11;
  char v12;
  char v13;

  v8 = v3;
  v9 = v4;
  v10 = BYTE2(v4);
  v11 = BYTE3(v4);
  v12 = BYTE4(v4);
  v13 = BYTE5(v4);
  sub_20E54D760((uint64_t)&v8, (uint64_t)&v8 + BYTE6(v4), v1, v0);
  sub_20E52F4EC(v1, v0);
  if (!v2)
    v5 = v7;
  return v5 & 1;
}

uint64_t sub_20E543998(unint64_t a1, uint64_t a2, unint64_t a3)
{
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t i;
  void (*v12)(_QWORD *);
  uint64_t *v13;
  uint64_t v14;
  uint64_t result;
  uint64_t (*v16[4])();

  v6 = a3 >> 62;
  if (a3 >> 62)
  {
    swift_bridgeObjectRetain();
    v7 = sub_20E557500();
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
    v10 = sub_20E557500();
    swift_bridgeObjectRelease();
    if (v10 <= a2)
    {
      if (v7 >= 1)
      {
        sub_20E546C48(&qword_254A29848, &qword_254A29840, MEMORY[0x24BEE12E0]);
        swift_bridgeObjectRetain();
        for (i = 0; i != v7; ++i)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_254A29840);
          v12 = sub_20E543BA8(v16, i, a3);
          v14 = *v13;
          swift_unknownObjectRetain();
          ((void (*)(uint64_t (**)(), _QWORD))v12)(v16, 0);
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
    __swift_instantiateConcreteTypeFromMangledName(qword_254A29270);
    swift_arrayInitWithCopy();
    return a3;
  }
LABEL_20:
  result = sub_20E55753C();
  __break(1u);
  return result;
}

void (*sub_20E543BA8(uint64_t (**a1)(), unint64_t a2, uint64_t a3))(_QWORD *a1)
{
  uint64_t (*v6)();

  v6 = (uint64_t (*)())malloc(0x28uLL);
  *a1 = v6;
  *((_QWORD *)v6 + 4) = sub_20E543C28(v6, a2, a3);
  return sub_20E543BFC;
}

void sub_20E543BFC(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t (*sub_20E543C28(uint64_t (*result)(), unint64_t a2, uint64_t a3))()
{
  uint64_t *v3;
  uint64_t v4;

  v3 = (uint64_t *)result;
  if ((a3 & 0xC000000000000001) != 0)
  {
    v4 = MEMORY[0x212BBE86C](a2, a3);
    goto LABEL_5;
  }
  if ((a2 & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (*(_QWORD *)((a3 & 0xFFFFFFFFFFFFF8) + 0x10) > a2)
  {
    v4 = swift_unknownObjectRetain();
LABEL_5:
    *v3 = v4;
    return sub_20E543C94;
  }
  __break(1u);
  return result;
}

uint64_t sub_20E543C94()
{
  return swift_unknownObjectRelease();
}

uint64_t _s22AuthenticationServices24ASAuthorizationUIContextV10MainButtonV0F6ActionO2eeoiySbAG_AGtFZ_0(_BYTE *a1, unsigned __int8 *a2)
{
  int v2;
  uint64_t result;

  v2 = *a2;
  switch(*a1)
  {
    case 2:
      if (v2 != 2)
        goto LABEL_15;
      goto LABEL_13;
    case 3:
      if (v2 != 3)
        goto LABEL_15;
      goto LABEL_13;
    case 4:
      if (v2 != 4)
        goto LABEL_15;
      goto LABEL_13;
    case 5:
      if (v2 != 5)
        goto LABEL_15;
      goto LABEL_13;
    case 6:
      if (v2 != 6)
        goto LABEL_15;
      goto LABEL_13;
    case 7:
      if (v2 != 7)
        goto LABEL_15;
LABEL_13:
      result = 1;
      break;
    default:
      if ((v2 - 2) >= 6)
        result = (((*a1 & 1) == 0) ^ v2) & 1;
      else
LABEL_15:
        result = 0;
      break;
  }
  return result;
}

uint64_t _s22AuthenticationServices24ASAuthorizationUIContextV5TitleO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  unint64_t v5;
  char v6;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  switch(v3)
  {
    case 0uLL:
      if (v5)
        goto LABEL_19;
      v3 = 0;
      v6 = 1;
      break;
    case 1uLL:
      if (v5 != 1)
        goto LABEL_19;
      v3 = 1;
      v6 = 1;
      break;
    case 2uLL:
      if (v5 != 2)
        goto LABEL_19;
      v6 = 1;
      v3 = 2;
      break;
    case 3uLL:
      if (v5 != 3)
        goto LABEL_19;
      v6 = 1;
      v3 = 3;
      break;
    case 4uLL:
      if (v5 != 4)
        goto LABEL_19;
      v6 = 1;
      v3 = 4;
      break;
    case 5uLL:
      if (v5 != 5)
        goto LABEL_19;
      v6 = 1;
      v3 = 5;
      break;
    case 6uLL:
      if (v5 != 6)
        goto LABEL_19;
      v6 = 1;
      v3 = 6;
      break;
    case 7uLL:
      if (v5 != 7)
        goto LABEL_19;
      v6 = 1;
      v3 = 7;
      break;
    default:
      if (v5 >= 8)
      {
        if (v2 == v4 && v3 == v5)
          v6 = 1;
        else
          v6 = sub_20E557560();
      }
      else
      {
LABEL_19:
        v6 = 0;
      }
      sub_20E546C20(v4, v5);
      sub_20E546C20(v2, v3);
      break;
  }
  sub_20E546C34(v2, v3);
  sub_20E546C34(v4, v5);
  return v6 & 1;
}

void _s22AuthenticationServices24ASAuthorizationUIContextV7MessageO2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  __asm { BR              X10 }
}

uint64_t sub_20E543EF8()
{
  unint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  char v9;
  char v11;
  char v12;

  if (v0 >> 59)
  {
    sub_20E534780();
    sub_20E545FB0(v2, v1, v0);
    sub_20E54602C(v5, v4, v3);
    v6 = v2;
    v7 = v1;
    v8 = v0;
    goto LABEL_10;
  }
  if ((v3 & 1) == 0)
  {
    if ((v0 & 1) == 0)
    {
      if (v5 == v2 && v4 == v1)
        v12 = 1;
      else
        v12 = sub_20E557560();
      sub_20E545FB0(v2, v1, v0);
      sub_20E545FB0(v5, v4, v3);
      sub_20E545FB0(v2, v1, v0);
      sub_20E545FB0(v5, v4, v3);
      sub_20E545FB0(v2, v1, v0);
      sub_20E545FB0(v5, v4, v3);
      sub_20E534F04();
      sub_20E534F04();
      sub_20E54602C(v5, v4, v3);
      sub_20E54602C(v2, v1, v0);
      sub_20E54602C(v2, v1, v0);
      sub_20E54602C(v5, v4, v3);
      if ((v12 & 1) != 0)
      {
        v9 = 1;
        return v9 & 1;
      }
      goto LABEL_11;
    }
    goto LABEL_8;
  }
  if ((v0 & 1) == 0)
  {
LABEL_8:
    sub_20E545FB0(v2, v1, v0);
    sub_20E545FB0(v5, v4, v3);
    sub_20E545FB0(v2, v1, v0);
    sub_20E545FB0(v5, v4, v3);
    sub_20E545FB0(v2, v1, v0);
    sub_20E545FB0(v5, v4, v3);
    sub_20E534F04();
    sub_20E534F04();
    sub_20E54602C(v5, v4, v3);
    sub_20E54602C(v2, v1, v0);
    sub_20E54602C(v2, v1, v0);
    v6 = v5;
    v7 = v4;
    v8 = v3;
LABEL_10:
    sub_20E54602C(v6, v7, v8);
LABEL_11:
    v9 = 0;
    return v9 & 1;
  }
  if (v5 == v2 && v4 == v1)
    v11 = 1;
  else
    v11 = sub_20E557560();
  sub_20E545FB0(v2, v1, v0);
  sub_20E545FB0(v5, v4, v3);
  sub_20E545FB0(v2, v1, v0);
  sub_20E545FB0(v5, v4, v3);
  sub_20E545FB0(v2, v1, v0);
  sub_20E545FB0(v5, v4, v3);
  v9 = 1;
  sub_20E534F04();
  sub_20E534F04();
  sub_20E54602C(v5, v4, v3);
  sub_20E54602C(v2, v1, v0);
  sub_20E54602C(v2, v1, v0);
  sub_20E54602C(v5, v4, v3);
  if ((v11 & 1) == 0)
    goto LABEL_11;
  return v9 & 1;
}

uint64_t _s22AuthenticationServices24ASAuthorizationUIContextV7ServiceO2eeoiySbAE_AEtFZ_0(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v7;

  v2 = *a1;
  v3 = a1[1];
  v4 = *a2;
  v5 = a2[1];
  if ((a1[2] & 1) != 0)
  {
    if ((a2[2] & 1) != 0)
    {
      if (v2 != v4 || v3 != v5)
      {
LABEL_15:
        v7 = sub_20E557560();
        goto LABEL_17;
      }
LABEL_16:
      v7 = 1;
      goto LABEL_17;
    }
  }
  else if ((a2[2] & 1) == 0)
  {
    if (v2 != v4 || v3 != v5)
      goto LABEL_15;
    goto LABEL_16;
  }
  v7 = 0;
LABEL_17:
  sub_20E534780();
  sub_20E534780();
  sub_20E534F04();
  sub_20E534F04();
  return v7 & 1;
}

uint64_t sub_20E544E94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t result;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  char v19;

  result = sub_20E556D5C();
  v11 = result;
  if (result)
  {
    result = sub_20E556D74();
    if (__OFSUB__(a1, result))
    {
LABEL_15:
      __break(1u);
      return result;
    }
    v11 += a1 - result;
  }
  v12 = __OFSUB__(a2, a1);
  v13 = a2 - a1;
  if (v12)
  {
    __break(1u);
    goto LABEL_15;
  }
  v14 = sub_20E556D68();
  if (v14 >= v13)
    v15 = v13;
  else
    v15 = v14;
  v16 = v11 + v15;
  if (v11)
    v17 = v16;
  else
    v17 = 0;
  sub_20E54D760(v11, v17, a4, a5);
  if (!v5)
    v18 = v19;
  return v18 & 1;
}

void _s22AuthenticationServices24ASAuthorizationUIContextV8IconTypeO2eeoiySbAE_AEtFZ_0(uint64_t a1)
{
  __asm { BR              X9 }
}

uint64_t sub_20E544F98()
{
  uint64_t v0;
  unint64_t v1;
  char v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  char v9;

  if (v7)
  {
    sub_20E54585C(v3, v1, v0, v7);
    sub_20E54585C(v6, v5, v4, v2);
    sub_20E5454A8(v6, v5, v4, v2);
    sub_20E5454A8(v3, v1, v0, v7);
    v9 = 0;
  }
  else
  {
    if (v6 == v3 && v5 == v1)
      v9 = 1;
    else
      v9 = sub_20E557560();
    sub_20E54585C(v3, v1, v0, 0);
    sub_20E54585C(v6, v5, v4, 0);
    sub_20E5454A8(v6, v5, v4, 0);
    sub_20E5454A8(v3, v1, v0, 0);
  }
  return v9 & 1;
}

void sub_20E5452C4(uint64_t a1@<X8>)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  char v7;
  char v8;

  if (a1 == BYTE6(v2))
  {
    if (a1 < 1)
    {
      sub_20E54585C(v3, v2, v1, 2);
      sub_20E54585C(v6, v5, v4, 2);
      sub_20E5454A8(v6, v5, v4, 2);
      sub_20E5454A8(v3, v2, v1, 2);
    }
    else
    {
      sub_20E54585C(v3, v2, v1, 2);
      sub_20E54585C(v3, v2, v1, 2);
      sub_20E54585C(v6, v5, v4, 2);
      sub_20E543774(v6, v5);
      v8 = v7;
      sub_20E5454A8(v6, v5, v4, 2);
      sub_20E5454A8(v3, v2, v1, 2);
      if ((v8 & 1) == 0)
        JUMPOUT(0x20E545158);
    }
    JUMPOUT(0x20E54515CLL);
  }
  sub_20E54585C(v3, v2, v1, 2);
  sub_20E54585C(v6, v5, v4, 2);
  sub_20E5454A8(v6, v5, v4, 2);
  JUMPOUT(0x20E545154);
}

uint64_t sub_20E5454A8(uint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 3:
      result = swift_bridgeObjectRelease();
      break;
    case 2:
      result = sub_20E52F4EC(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

unint64_t sub_20E5454E0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A29800;
  if (!qword_254A29800)
  {
    v1 = sub_20E53D644(255, &qword_254A297F8);
    result = MEMORY[0x212BBF2EC](MEMORY[0x24BEE5BD8], v1);
    atomic_store(result, (unint64_t *)&qword_254A29800);
  }
  return result;
}

unint64_t sub_20E54553C()
{
  unint64_t result;

  result = qword_254A29810;
  if (!qword_254A29810)
  {
    result = MEMORY[0x212BBF2EC](&protocol conformance descriptor for ASAuthorizationUIContext.OtherOptionsText, &type metadata for ASAuthorizationUIContext.OtherOptionsText);
    atomic_store(result, (unint64_t *)&qword_254A29810);
  }
  return result;
}

uint64_t destroy for ASAuthorizationUIContext(id *a1)
{

  return sub_20E534F04();
}

uint64_t initializeWithCopy for ASAuthorizationUIContext(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  id v8;

  v4 = *(void **)a2;
  v5 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = *(_QWORD *)(a2 + 16);
  v7 = *(_BYTE *)(a2 + 24);
  v8 = v4;
  sub_20E534780();
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_BYTE *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  return a1;
}

uint64_t assignWithCopy for ASAuthorizationUIContext(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  v7 = *(_QWORD *)(a2 + 8);
  v8 = *(_QWORD *)(a2 + 16);
  v9 = *(_BYTE *)(a2 + 24);
  sub_20E534780();
  *(_QWORD *)(a1 + 8) = v7;
  *(_QWORD *)(a1 + 16) = v8;
  *(_BYTE *)(a1 + 24) = v9;
  sub_20E534F04();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
  *(_BYTE *)(a1 + 43) = *(_BYTE *)(a2 + 43);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_BYTE *)(a1 + 45) = *(_BYTE *)(a2 + 45);
  *(_BYTE *)(a1 + 46) = *(_BYTE *)(a2 + 46);
  *(_BYTE *)(a1 + 47) = *(_BYTE *)(a2 + 47);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ASAuthorizationUIContext(uint64_t a1, uint64_t a2)
{
  void *v4;
  char v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  v5 = *(_BYTE *)(a2 + 24);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_BYTE *)(a1 + 24) = v5;
  sub_20E534F04();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
  *(_BYTE *)(a1 + 43) = *(_BYTE *)(a2 + 43);
  *(_BYTE *)(a1 + 44) = *(_BYTE *)(a2 + 44);
  *(_BYTE *)(a1 + 45) = *(_BYTE *)(a2 + 45);
  *(_BYTE *)(a1 + 46) = *(_BYTE *)(a2 + 46);
  *(_BYTE *)(a1 + 47) = *(_BYTE *)(a2 + 47);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 50))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 50) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 50) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext()
{
  return &type metadata for ASAuthorizationUIContext;
}

uint64_t sub_20E54585C(uint64_t result, unint64_t a2, uint64_t a3, char a4)
{
  switch(a4)
  {
    case 0:
    case 1:
    case 3:
      result = swift_bridgeObjectRetain();
      break;
    case 2:
      result = sub_20E52F7E4(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for ASAuthorizationUIContext.IconType(uint64_t a1)
{
  return sub_20E5454A8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_BYTE *)(a1 + 24));
}

uint64_t initializeWithCopy for ASAuthorizationUIContext.IconType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_20E54585C(*(_QWORD *)a2, v4, v5, v6);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  *(_BYTE *)(a1 + 24) = v6;
  return a1;
}

uint64_t assignWithCopy for ASAuthorizationUIContext.IconType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  char v10;

  v3 = *(_QWORD *)a2;
  v4 = *(_QWORD *)(a2 + 8);
  v5 = *(_QWORD *)(a2 + 16);
  v6 = *(_BYTE *)(a2 + 24);
  sub_20E54585C(*(_QWORD *)a2, v4, v5, v6);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_QWORD *)(a1 + 16) = v5;
  v10 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v6;
  sub_20E5454A8(v7, v8, v9, v10);
  return a1;
}

__n128 __swift_memcpy25_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 9) = *(_OWORD *)(a2 + 9);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ASAuthorizationUIContext.IconType(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  char v8;

  v3 = *(_QWORD *)(a2 + 16);
  v4 = *(_BYTE *)(a2 + 24);
  v5 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  v6 = *(_QWORD *)(a1 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_QWORD *)(a1 + 16) = v3;
  v8 = *(_BYTE *)(a1 + 24);
  *(_BYTE *)(a1 + 24) = v4;
  sub_20E5454A8(v5, v7, v6, v8);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.IconType(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFC && *(_BYTE *)(a1 + 25))
    return (*(_DWORD *)a1 + 252);
  v3 = *(unsigned __int8 *)(a1 + 24);
  if (v3 <= 4)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.IconType(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFB)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_BYTE *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 252;
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 1;
  }
  else
  {
    if (a3 >= 0xFC)
      *(_BYTE *)(result + 25) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = -(char)a2;
  }
  return result;
}

uint64_t sub_20E545A60(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 24) <= 3u)
    return *(unsigned __int8 *)(a1 + 24);
  else
    return (*(_DWORD *)a1 + 4);
}

uint64_t sub_20E545A78(uint64_t result, unsigned int a2)
{
  uint64_t v2;

  v2 = a2 - 4;
  if (a2 >= 4)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    LOBYTE(a2) = 4;
    *(_QWORD *)result = v2;
  }
  *(_BYTE *)(result + 24) = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.IconType()
{
  return &type metadata for ASAuthorizationUIContext.IconType;
}

uint64_t destroy for ASAuthorizationUIContext.Service()
{
  return sub_20E534F04();
}

uint64_t _s22AuthenticationServices24ASAuthorizationUIContextV7ServiceOwCP_0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_20E534780();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  return a1;
}

uint64_t assignWithCopy for ASAuthorizationUIContext.Service(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  char v5;

  v3 = *a2;
  v4 = a2[1];
  v5 = *((_BYTE *)a2 + 16);
  sub_20E534780();
  *(_QWORD *)a1 = v3;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v5;
  sub_20E534F04();
  return a1;
}

uint64_t assignWithTake for ASAuthorizationUIContext.Service(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = *(_BYTE *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_BYTE *)(a1 + 16) = v3;
  sub_20E534F04();
  return a1;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.Service()
{
  return &type metadata for ASAuthorizationUIContext.Service;
}

uint64_t destroy for ASAuthorizationUIContext.Header()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ASAuthorizationUIContext.Header(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithCopy for ASAuthorizationUIContext.Header(_QWORD *a1, _QWORD *a2)
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

_QWORD *assignWithTake for ASAuthorizationUIContext.Header(_QWORD *a1, _QWORD *a2)
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

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.Header(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.Header(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.Header()
{
  return &type metadata for ASAuthorizationUIContext.Header;
}

unint64_t destroy for ASAuthorizationUIContext.Title(uint64_t a1)
{
  unint64_t result;

  result = *(_QWORD *)(a1 + 8);
  if (result >= 0xFFFFFFFF)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t _s22AuthenticationServices24ASAuthorizationUIContextV5TitleOwCP_0(uint64_t a1, uint64_t a2)
{
  unint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  if (v3 < 0xFFFFFFFF)
  {
    *(_OWORD *)a1 = *(_OWORD *)a2;
  }
  else
  {
    *(_QWORD *)a1 = *(_QWORD *)a2;
    *(_QWORD *)(a1 + 8) = v3;
    swift_bridgeObjectRetain();
  }
  return a1;
}

_QWORD *assignWithCopy for ASAuthorizationUIContext.Title(_QWORD *a1, _QWORD *a2)
{
  unint64_t v4;

  v4 = a2[1];
  if (a1[1] < 0xFFFFFFFFuLL)
  {
    if (v4 >= 0xFFFFFFFF)
    {
      *a1 = *a2;
      a1[1] = a2[1];
      swift_bridgeObjectRetain();
      return a1;
    }
LABEL_7:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
    goto LABEL_7;
  }
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t assignWithTake for ASAuthorizationUIContext.Title(uint64_t a1, uint64_t a2)
{
  unint64_t v4;

  if (*(_QWORD *)(a1 + 8) < 0xFFFFFFFFuLL)
    goto LABEL_5;
  v4 = *(_QWORD *)(a2 + 8);
  if (v4 < 0xFFFFFFFF)
  {
    swift_bridgeObjectRelease();
LABEL_5:
    *(_OWORD *)a1 = *(_OWORD *)a2;
    return a1;
  }
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.Title(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  unsigned int v4;
  unsigned int v5;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFF8 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 2147483640);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 + 1;
  v5 = v3 - 7;
  if (v4 >= 9)
    return v5;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.Title(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFF7)
  {
    *(_QWORD *)result = 0;
    *(_QWORD *)(result + 8) = 0;
    *(_DWORD *)result = a2 - 2147483640;
    if (a3 >= 0x7FFFFFF8)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFF8)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2 + 7;
  }
  return result;
}

uint64_t sub_20E545F68(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_20E545F80(_QWORD *result, int a2)
{
  if (a2 < 0)
  {
    *result = a2 ^ 0x80000000;
    result[1] = 0;
  }
  else if (a2)
  {
    result[1] = (a2 - 1);
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.Title()
{
  return &type metadata for ASAuthorizationUIContext.Title;
}

uint64_t sub_20E545FB0(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  switch(a3 >> 59)
  {
    case 0uLL:
    case 1uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xEuLL:
      result = sub_20E534780();
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
      sub_20E534780();
      result = swift_bridgeObjectRetain();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t destroy for ASAuthorizationUIContext.Message(uint64_t a1)
{
  return sub_20E54602C(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16));
}

uint64_t sub_20E54602C(uint64_t a1, uint64_t a2, unint64_t a3)
{
  uint64_t result;

  switch(a3 >> 59)
  {
    case 0uLL:
    case 1uLL:
    case 7uLL:
    case 8uLL:
    case 9uLL:
    case 0xAuLL:
    case 0xEuLL:
      result = sub_20E534F04();
      break;
    case 2uLL:
    case 3uLL:
    case 4uLL:
    case 6uLL:
    case 0xBuLL:
    case 0xCuLL:
    case 0xDuLL:
      sub_20E534F04();
      result = swift_bridgeObjectRelease();
      break;
    default:
      return result;
  }
  return result;
}

uint64_t *initializeWithCopy for ASAuthorizationUIContext.Message(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  sub_20E545FB0(*a2, v4, v5);
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  return a1;
}

uint64_t *assignWithCopy for ASAuthorizationUIContext.Message(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;

  v3 = *a2;
  v4 = a2[1];
  v5 = a2[2];
  v6 = a2[3];
  v7 = a2[4];
  sub_20E545FB0(*a2, v4, v5);
  v8 = *a1;
  v9 = a1[1];
  v10 = a1[2];
  *a1 = v3;
  a1[1] = v4;
  a1[2] = v5;
  a1[3] = v6;
  a1[4] = v7;
  sub_20E54602C(v8, v9, v10);
  return a1;
}

uint64_t *assignWithTake for ASAuthorizationUIContext.Message(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  __int128 v7;

  v3 = *(_QWORD *)(a2 + 32);
  v4 = *a1;
  v6 = a1[1];
  v5 = a1[2];
  v7 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *((_OWORD *)a1 + 1) = v7;
  a1[4] = v3;
  sub_20E54602C(v4, v6, v5);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.Message(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.Message(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = 0;
      *(_QWORD *)(result + 8) = 0;
      *(_QWORD *)(result + 24) = 0;
      *(_QWORD *)(result + 32) = 0;
      *(_QWORD *)(result + 16) = 2 * -a2;
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_20E54624C(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 16) >> 59;
  if (v1 <= 0xF)
    return v1;
  else
    return (*(_DWORD *)a1 + 16);
}

uint64_t sub_20E546268(uint64_t result)
{
  *(_QWORD *)(result + 16) &= 0x7FFFFFFFFFFFFFFuLL;
  return result;
}

uint64_t sub_20E546278(uint64_t result, uint64_t a2)
{
  if (a2 < 0x10)
  {
    *(_QWORD *)(result + 16) = *(_QWORD *)(result + 16) & 1 | (a2 << 59);
  }
  else
  {
    *(_QWORD *)result = (a2 - 16);
    *(_OWORD *)(result + 8) = xmmword_20E55F2F0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)(result + 32) = 0;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.Message()
{
  return &type metadata for ASAuthorizationUIContext.Message;
}

uint64_t destroy for ASAuthorizationUIContext.MainButton()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s22AuthenticationServices24ASAuthorizationUIContextV10MainButtonVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASAuthorizationUIContext.MainButton(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t assignWithTake for ASAuthorizationUIContext.MainButton(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.MainButton(uint64_t a1, unsigned int a2)
{
  unint64_t v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0x7FFFFFFF && *(_BYTE *)(a1 + 17))
    return (*(_DWORD *)a1 + 0x7FFFFFFF);
  v3 = *(_QWORD *)(a1 + 8);
  if (v3 >= 0xFFFFFFFF)
    LODWORD(v3) = -1;
  v4 = v3 - 1;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.MainButton(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0x7FFFFFFE)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 0x7FFFFFFF;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 1;
  }
  else
  {
    if (a3 >= 0x7FFFFFFF)
      *(_BYTE *)(result + 17) = 0;
    if (a2)
      *(_QWORD *)(result + 8) = a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.MainButton()
{
  return &type metadata for ASAuthorizationUIContext.MainButton;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.MainButton.ButtonAction(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v2;
  unsigned int v3;
  uint64_t v4;
  uint64_t result;
  unsigned int v6;
  unsigned int v7;

  if (!a2)
    return 0;
  if (a2 < 0xF9)
  {
    v6 = *a1;
    if (v6 >= 2)
    {
      v7 = (v6 + 2147483646) & 0x7FFFFFFF;
      result = v7 - 5;
      if (v7 > 5)
        return result;
    }
    return 0;
  }
  v2 = a2 + 7;
  if (a2 + 7 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if (v2 >> 8 < 0xFF)
    v3 = 1;
  if (v2 >= 0x100)
    v4 = v3;
  else
    v4 = 0;
  return ((uint64_t (*)(void))((char *)&loc_20E54649C + 4 * byte_20E55F376[v4]))();
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.MainButton.ButtonAction(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  unsigned int v3;
  int v4;
  uint64_t v5;

  v3 = a3 + 7;
  if (a3 + 7 >= 0xFFFF00)
    v4 = 4;
  else
    v4 = 2;
  if (v3 >> 8 < 0xFF)
    v4 = 1;
  if (v3 >= 0x100)
    LODWORD(v5) = v4;
  else
    LODWORD(v5) = 0;
  if (a3 >= 0xF9)
    v5 = v5;
  else
    v5 = 0;
  if (a2 <= 0xF8)
    return ((uint64_t (*)(void))((char *)&loc_20E546548 + 4 * byte_20E55F380[v5]))();
  *a1 = a2 + 7;
  return ((uint64_t (*)(void))((char *)sub_20E54657C + 4 * byte_20E55F37B[v5]))();
}

uint64_t sub_20E54657C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E546584(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E54658CLL);
  return result;
}

uint64_t sub_20E546598(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E5465A0);
  *(_BYTE *)result = a2 + 7;
  return result;
}

uint64_t sub_20E5465A4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5465AC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E5465B8(unsigned __int8 *a1)
{
  unsigned int v1;
  BOOL v2;
  int v3;

  v1 = *a1;
  v2 = v1 >= 2;
  v3 = (v1 + 2147483646) & 0x7FFFFFFF;
  if (v2)
    return (v3 + 1);
  else
    return 0;
}

_BYTE *sub_20E5465D4(_BYTE *result, int a2)
{
  if (a2)
    *result = a2 + 1;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.MainButton.ButtonAction()
{
  return &type metadata for ASAuthorizationUIContext.MainButton.ButtonAction;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.OtherOptionsText(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.OtherOptionsText(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20E5466D8 + 4 * byte_20E55F38A[v4]))();
  *a1 = a2 + 4;
  return ((uint64_t (*)(void))((char *)sub_20E54670C + 4 * byte_20E55F385[v4]))();
}

uint64_t sub_20E54670C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E546714(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E54671CLL);
  return result;
}

uint64_t sub_20E546728(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E546730);
  *(_BYTE *)result = a2 + 4;
  return result;
}

uint64_t sub_20E546734(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E54673C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

_BYTE *sub_20E546748(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.OtherOptionsText()
{
  return &type metadata for ASAuthorizationUIContext.OtherOptionsText;
}

__n128 __swift_memcpy21_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_QWORD *)(a1 + 13) = *(_QWORD *)(a2 + 13);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.ConfigurationOverrides(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[21])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  if (v3 >= 2)
    v4 = ((v3 + 2147483646) & 0x7FFFFFFF) - 1;
  else
    v4 = -2;
  if (v4 < 0)
    v4 = -1;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.ConfigurationOverrides(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 20) = 0;
    *(_DWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 21) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 21) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.ConfigurationOverrides()
{
  return &type metadata for ASAuthorizationUIContext.ConfigurationOverrides;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.UserVerificationType(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.UserVerificationType(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20E546908 + 4 * byte_20E55F394[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_20E54693C + 4 * byte_20E55F38F[v4]))();
}

uint64_t sub_20E54693C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E546944(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E54694CLL);
  return result;
}

uint64_t sub_20E546958(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E546960);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_20E546964(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E54696C(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.UserVerificationType()
{
  return &type metadata for ASAuthorizationUIContext.UserVerificationType;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationUIContext.Kind(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for ASAuthorizationUIContext.Kind(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20E546A64 + 4 * byte_20E55F39E[v4]))();
  *a1 = a2 + 6;
  return ((uint64_t (*)(void))((char *)sub_20E546A98 + 4 * byte_20E55F399[v4]))();
}

uint64_t sub_20E546A98(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E546AA0(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E546AA8);
  return result;
}

uint64_t sub_20E546AB4(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E546ABCLL);
  *(_BYTE *)result = a2 + 6;
  return result;
}

uint64_t sub_20E546AC0(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E546AC8(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationUIContext.Kind()
{
  return &type metadata for ASAuthorizationUIContext.Kind;
}

unint64_t sub_20E546AE8()
{
  unint64_t result;

  result = qword_254A29818;
  if (!qword_254A29818)
  {
    result = MEMORY[0x212BBF2EC](&unk_20E55F69C, &type metadata for ASAuthorizationUIContext.Kind);
    atomic_store(result, (unint64_t *)&qword_254A29818);
  }
  return result;
}

unint64_t sub_20E546B30()
{
  unint64_t result;

  result = qword_254A29820;
  if (!qword_254A29820)
  {
    result = MEMORY[0x212BBF2EC](&unk_20E55F704, &type metadata for ASAuthorizationUIContext.UserVerificationType);
    atomic_store(result, (unint64_t *)&qword_254A29820);
  }
  return result;
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

uint64_t sub_20E546B94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20E546BD4()
{
  return swift_release();
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BBF2E0](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20E546C20(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 8)
    return swift_bridgeObjectRetain();
  return result;
}

uint64_t sub_20E546C34(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >= 8)
    return swift_bridgeObjectRelease();
  return result;
}

uint64_t sub_20E546C48(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x212BBF2EC](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t ASAuthorizationWebBrowserPlatformPublicKeyCredential.name.getter()
{
  uint64_t *v0;
  uint64_t v1;

  v1 = *v0;
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ASAuthorizationWebBrowserPlatformPublicKeyCredential.customTitle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ASAuthorizationWebBrowserPlatformPublicKeyCredential.relyingParty.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ASAuthorizationWebBrowserPlatformPublicKeyCredential.credentialID.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 48);
  sub_20E52F7E4(v1, *(_QWORD *)(v0 + 56));
  return v1;
}

uint64_t ASAuthorizationWebBrowserPlatformPublicKeyCredential.userHandle.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 64);
  sub_20E52F7E4(v1, *(_QWORD *)(v0 + 72));
  return v1;
}

uint64_t ASAuthorizationWebBrowserPlatformPublicKeyCredential.providerName.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 80);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t destroy for ASAuthorizationWebBrowserPlatformPublicKeyCredential(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20E52F4EC(*(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  sub_20E52F4EC(*(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72));
  return swift_bridgeObjectRelease();
}

_QWORD *initializeWithCopy for ASAuthorizationWebBrowserPlatformPublicKeyCredential(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v5 = a2[3];
  a1[2] = a2[2];
  a1[3] = v5;
  v6 = a2[5];
  a1[4] = a2[4];
  a1[5] = v6;
  v7 = a2[6];
  v8 = a2[7];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_20E52F7E4(v7, v8);
  a1[6] = v7;
  a1[7] = v8;
  v9 = a2[8];
  v10 = a2[9];
  sub_20E52F7E4(v9, v10);
  a1[8] = v9;
  a1[9] = v10;
  v11 = a2[11];
  a1[10] = a2[10];
  a1[11] = v11;
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *assignWithCopy for ASAuthorizationWebBrowserPlatformPublicKeyCredential(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = a2[6];
  v5 = a2[7];
  sub_20E52F7E4(v4, v5);
  v6 = a1[6];
  v7 = a1[7];
  a1[6] = v4;
  a1[7] = v5;
  sub_20E52F4EC(v6, v7);
  v8 = a2[8];
  v9 = a2[9];
  sub_20E52F7E4(v8, v9);
  v10 = a1[8];
  v11 = a1[9];
  a1[8] = v8;
  a1[9] = v9;
  sub_20E52F4EC(v10, v11);
  a1[10] = a2[10];
  a1[11] = a2[11];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

_QWORD *assignWithTake for ASAuthorizationWebBrowserPlatformPublicKeyCredential(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  swift_bridgeObjectRelease();
  v5 = *(_QWORD *)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 40);
  a1[4] = *(_QWORD *)(a2 + 32);
  a1[5] = v6;
  swift_bridgeObjectRelease();
  v7 = a1[6];
  v8 = a1[7];
  *((_OWORD *)a1 + 3) = *(_OWORD *)(a2 + 48);
  sub_20E52F4EC(v7, v8);
  v9 = a1[8];
  v10 = a1[9];
  *((_OWORD *)a1 + 4) = *(_OWORD *)(a2 + 64);
  sub_20E52F4EC(v9, v10);
  v11 = *(_QWORD *)(a2 + 88);
  a1[10] = *(_QWORD *)(a2 + 80);
  a1[11] = v11;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for ASAuthorizationWebBrowserPlatformPublicKeyCredential(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASAuthorizationWebBrowserPlatformPublicKeyCredential(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASAuthorizationWebBrowserPlatformPublicKeyCredential()
{
  return &type metadata for ASAuthorizationWebBrowserPlatformPublicKeyCredential;
}

uint64_t ASAuthorizationWebBrowserPublicKeyCredentialManager.platformCredentials(forRelyingParty:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_20E5470D4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)v0[18];
  v2 = sub_20E5572A8();
  v0[19] = v2;
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_20E547184;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_20E547470;
  v4[3] = &block_descriptor;
  v4[4] = v3;
  objc_msgSend(v1, sel_corePlatformCredentialsForRelyingParty_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_20E547184()
{
  return swift_task_switch();
}

uint64_t sub_20E5471D0()
{
  uint64_t v0;
  unint64_t v1;
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v1 = *(_QWORD *)(v0 + 120);
  if (!(v1 >> 62))
  {
    v2 = *(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10);
    if (v2)
      goto LABEL_3;
LABEL_13:
    swift_bridgeObjectRelease();
    v5 = MEMORY[0x24BEE4AF8];
LABEL_14:

    return (*(uint64_t (**)(uint64_t))(v0 + 8))(v5);
  }
  swift_bridgeObjectRetain();
  v2 = sub_20E557500();
  swift_bridgeObjectRelease();
  if (!v2)
    goto LABEL_13;
LABEL_3:
  v42 = MEMORY[0x24BEE4AF8];
  result = sub_20E5474B4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = 0;
    v5 = v42;
    v32 = v0;
    v33 = v1 & 0xC000000000000001;
    v34 = v2;
    v35 = v1;
    do
    {
      if (v33)
        v6 = (id)MEMORY[0x212BBE86C](v4, v1);
      else
        v6 = *(id *)(v1 + 8 * v4 + 32);
      v7 = v6;
      v8 = objc_msgSend(v6, sel_name, v32);
      v9 = sub_20E5572B4();
      v40 = v10;
      v41 = v9;

      v11 = objc_msgSend(v7, sel_customTitle);
      v12 = sub_20E5572B4();
      v38 = v13;
      v39 = v12;

      v14 = objc_msgSend(v7, sel_relyingParty);
      v15 = sub_20E5572B4();
      v36 = v16;
      v37 = v15;

      v17 = objc_msgSend(v7, sel_credentialID);
      v18 = sub_20E556DBC();
      v20 = v19;

      v21 = objc_msgSend(v7, sel_userHandle);
      v22 = sub_20E556DBC();
      v24 = v23;

      v25 = objc_msgSend(v7, sel_providerName);
      v26 = sub_20E5572B4();
      v28 = v27;

      v30 = *(_QWORD *)(v42 + 16);
      v29 = *(_QWORD *)(v42 + 24);
      if (v30 >= v29 >> 1)
        sub_20E5474B4(v29 > 1, v30 + 1, 1);
      ++v4;
      *(_QWORD *)(v42 + 16) = v30 + 1;
      v31 = (_QWORD *)(v42 + 96 * v30);
      v31[4] = v41;
      v31[5] = v40;
      v31[6] = v39;
      v31[7] = v38;
      v1 = v35;
      v31[8] = v37;
      v31[9] = v36;
      v31[10] = v18;
      v31[11] = v20;
      v31[12] = v22;
      v31[13] = v24;
      v31[14] = v26;
      v31[15] = v28;
    }
    while (v34 != v4);
    swift_bridgeObjectRelease();
    v0 = v32;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

uint64_t sub_20E547470(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  sub_20E5477CC();
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_20E5572FC();
  return swift_continuation_resume();
}

uint64_t sub_20E5474B4(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_20E5474EC(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_20E5474D0(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_20E547670(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_20E5474EC(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29860);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * ((uint64_t)(v11 - 32) / 96);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v12 = v10 + 32;
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[96 * v8])
      memmove(v12, v13, 96 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[96 * v8] || v12 >= &v13[96 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_20E55753C();
  __break(1u);
  return result;
}

uint64_t sub_20E547670(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29858);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 25;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 3);
  }
  else
  {
    v10 = (char *)MEMORY[0x24BEE4AF8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[8 * v8])
      memmove(v13, v14, 8 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[8 * v8] || v13 >= &v14[8 * v8])
  {
    memcpy(v13, v14, 8 * v8);
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_20E55753C();
  __break(1u);
  return result;
}

unint64_t sub_20E5477CC()
{
  unint64_t result;

  result = qword_254A29868;
  if (!qword_254A29868)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A29868);
  }
  return result;
}

id ASAuthorizationPlatformPublicKeyCredentialProvider.createCredentialRegistrationRequest(clientData:name:userID:)(__int128 *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v2 = v1;
  v8 = *a1;
  v9 = *((_QWORD *)a1 + 2);
  v10 = *((_QWORD *)a1 + 3);
  v11 = a1[2];
  LOBYTE(v12) = *((_BYTE *)a1 + 48);
  v3 = sub_20E5520B4();
  v4 = (void *)sub_20E5572A8();
  v5 = (void *)sub_20E556DA4();
  v6 = objc_msgSend(v2, sel_createCredentialRegistrationRequestWithClientData_name_userID_, v3, v4, v5, v8, v9, v10, v11, v12);

  return v6;
}

id ASAuthorizationPlatformPublicKeyCredentialProvider.createCredentialRegistrationRequest(clientData:name:userID:requestStyle:)(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v7 = v6;
  v14 = *a1;
  v15 = *((_QWORD *)a1 + 2);
  v16 = *((_QWORD *)a1 + 3);
  v17 = a1[2];
  LOBYTE(v18) = *((_BYTE *)a1 + 48);
  v9 = sub_20E5520B4();
  v10 = (void *)sub_20E5572A8();
  v11 = (void *)sub_20E556DA4();
  v12 = objc_msgSend(v7, sel_createCredentialRegistrationRequestWithClientData_name_userID_requestStyle_, v9, v10, v11, a6, v14, v15, v16, v17, v18);

  return v12;
}

id sub_20E5479B4(__int128 *a1)
{
  void **v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;

  v2 = *v1;
  v8 = *a1;
  v9 = *((_QWORD *)a1 + 2);
  v10 = *((_QWORD *)a1 + 3);
  v11 = a1[2];
  LOBYTE(v12) = *((_BYTE *)a1 + 48);
  v3 = sub_20E5520B4();
  v4 = (void *)sub_20E5572A8();
  v5 = (void *)sub_20E556DA4();
  v6 = objc_msgSend(v2, sel_createCredentialRegistrationRequestWithClientData_name_userID_, v3, v4, v5, v8, v9, v10, v11, v12);

  return v6;
}

id sub_20E547A7C(__int128 *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void **v6;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;

  v8 = *v6;
  v14 = *a1;
  v15 = *((_QWORD *)a1 + 2);
  v16 = *((_QWORD *)a1 + 3);
  v17 = a1[2];
  LOBYTE(v18) = *((_BYTE *)a1 + 48);
  v9 = sub_20E5520B4();
  v10 = (void *)sub_20E5572A8();
  v11 = (void *)sub_20E556DA4();
  v12 = objc_msgSend(v8, sel_createCredentialRegistrationRequestWithClientData_name_userID_requestStyle_, v9, v10, v11, a6, v14, v15, v16, v17, v18);

  return v12;
}

void _sSo71ASAuthorizationWebBrowserPlatformPublicKeyCredentialRegistrationRequestP22AuthenticationServicesE10clientDataAC08ASPublicfg6ClientM0VSgvg_0(uint64_t a1@<X8>)
{
  void *v1;
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  char v19;

  v3 = objc_msgSend(v1, sel_clientData);
  if (v3)
  {
    v4 = v3;
    v5 = objc_msgSend(v3, sel_challenge);
    v6 = sub_20E556DBC();
    v8 = v7;

    v9 = objc_msgSend(v4, sel_origin);
    v10 = sub_20E5572B4();
    v12 = v11;

    v13 = objc_msgSend(v4, sel_topOrigin);
    if (v13)
    {
      v14 = v13;
      v15 = sub_20E5572B4();
      v17 = v16;

    }
    else
    {
      v15 = 0;
      v17 = 0;
    }
    v18 = objc_msgSend(v4, sel_crossOrigin);

    v19 = 2 * (v18 != (id)1);
    if (v18 == (id)2)
      v19 = 1;
    *(_QWORD *)a1 = v6;
    *(_QWORD *)(a1 + 8) = v8;
    *(_QWORD *)(a1 + 16) = v10;
    *(_QWORD *)(a1 + 24) = v12;
    *(_QWORD *)(a1 + 32) = v15;
    *(_QWORD *)(a1 + 40) = v17;
    *(_BYTE *)(a1 + 48) = v19;
  }
  else
  {
    *(_BYTE *)(a1 + 48) = 0;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_OWORD *)(a1 + 32) = 0u;
    *(_OWORD *)a1 = 0u;
  }
}

id ASAuthorizationSecurityKeyPublicKeyCredentialProvider.createCredentialRegistrationRequest(clientData:displayName:name:userID:)(__int128 *a1)
{
  void *v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v2 = v1;
  v9 = *a1;
  v10 = *((_QWORD *)a1 + 2);
  v11 = *((_QWORD *)a1 + 3);
  v12 = a1[2];
  LOBYTE(v13) = *((_BYTE *)a1 + 48);
  v3 = sub_20E5520B4();
  v4 = (void *)sub_20E5572A8();
  v5 = (void *)sub_20E5572A8();
  v6 = (void *)sub_20E556DA4();
  v7 = objc_msgSend(v2, sel_createCredentialRegistrationRequestWithClientData_displayName_name_userID_, v3, v4, v5, v6, v9, v10, v11, v12, v13);

  return v7;
}

id _sSo50ASAuthorizationPlatformPublicKeyCredentialProviderC22AuthenticationServicesE06createE16AssertionRequest10clientDataSo0abcdejK0CAC08ASPublicde6ClientM0V_tF_0(__int128 *a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v2 = v1;
  v6 = *a1;
  v7 = *((_QWORD *)a1 + 2);
  v8 = *((_QWORD *)a1 + 3);
  v9 = a1[2];
  LOBYTE(v10) = *((_BYTE *)a1 + 48);
  v3 = sub_20E5520B4();
  v4 = objc_msgSend(v2, sel_createCredentialAssertionRequestWithClientData_, v3, v6, v7, v8, v9, v10);

  return v4;
}

id sub_20E547E08(__int128 *a1)
{
  void **v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;

  v2 = *v1;
  v9 = *a1;
  v10 = *((_QWORD *)a1 + 2);
  v11 = *((_QWORD *)a1 + 3);
  v12 = a1[2];
  LOBYTE(v13) = *((_BYTE *)a1 + 48);
  v3 = sub_20E5520B4();
  v4 = (void *)sub_20E5572A8();
  v5 = (void *)sub_20E5572A8();
  v6 = (void *)sub_20E556DA4();
  v7 = objc_msgSend(v2, sel_createCredentialRegistrationRequestWithClientData_displayName_name_userID_, v3, v4, v5, v6, v9, v10, v11, v12, v13);

  return v7;
}

id sub_20E547EF8(__int128 *a1)
{
  void **v1;
  void *v2;
  id v3;
  id v4;
  __int128 v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;

  v2 = *v1;
  v6 = *a1;
  v7 = *((_QWORD *)a1 + 2);
  v8 = *((_QWORD *)a1 + 3);
  v9 = a1[2];
  LOBYTE(v10) = *((_BYTE *)a1 + 48);
  v3 = sub_20E5520B4();
  v4 = objc_msgSend(v2, sel_createCredentialAssertionRequestWithClientData_, v3, v6, v7, v8, v9, v10);

  return v4;
}

uint64_t dispatch thunk of ASAuthorizationWebBrowserPlatformPublicKeyCredentialProvider.createCredentialRegistrationRequest(clientData:name:userID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  return (*(uint64_t (**)(void))(a7 + 8))();
}

uint64_t dispatch thunk of ASAuthorizationWebBrowserPlatformPublicKeyCredentialProvider.createCredentialRegistrationRequest(clientData:name:userID:requestStyle:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  return (*(uint64_t (**)(void))(a8 + 16))();
}

uint64_t dispatch thunk of ASAuthorizationWebBrowserPlatformPublicKeyCredentialProvider.createCredentialAssertionRequest(clientData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t dispatch thunk of ASAuthorizationWebBrowserSecurityKeyPublicKeyCredentialProvider.createCredentialRegistrationRequest(clientData:displayName:name:userID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  return (*(uint64_t (**)(void))(a9 + 8))();
}

uint64_t dispatch thunk of ASAuthorizationWebBrowserSecurityKeyPublicKeyCredentialProvider.createCredentialAssertionRequest(clientData:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t ASAuthorizationPlatformPublicKeyCredentialAssertion.prf.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_20E557038();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v15 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29138);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = objc_msgSend(v1, sel_coreCredential);
  v11 = objc_msgSend(v10, sel_extensions);

  if (!v11)
    goto LABEL_4;
  sub_20E557044();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v9, 1, v3))
  {
    sub_20E52E370((uint64_t)v9, &qword_254A29138);
LABEL_4:
    v12 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v12 - 8) + 56))(a1, 1, 1, v12);
  }
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v9, v3);
  sub_20E52E370((uint64_t)v9, &qword_254A29138);
  sub_20E557020();
  v14 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0);
  sub_20E55702C();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 0, 1, v14);
}

id ASAuthorizationPlatformPublicKeyCredentialAssertion.__largeBlobSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id result;
  int v19;
  uint64_t v20;
  unint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;

  v1 = sub_20E55705C();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (uint64_t *)((char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v24 - v6;
  v8 = sub_20E557080();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v24 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29130);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v24 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(v0, sel_coreCredential);
  v16 = objc_msgSend(v15, sel_extensions);

  if (!v16)
    return 0;
  sub_20E55708C();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
  {
    sub_20E52E370((uint64_t)v14, &qword_254A29130);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_20E52E370((uint64_t)v14, &qword_254A29130);
  sub_20E557074();
  (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v19 = (*(uint64_t (**)(uint64_t *, uint64_t))(v2 + 88))(v5, v1);
  if (v19 == *MEMORY[0x24BE0B038])
  {
    (*(void (**)(uint64_t *, uint64_t))(v2 + 96))(v5, v1);
    v20 = *v5;
    v21 = v5[1];
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    if (v21 >> 60 == 15)
    {
      v22 = 0;
    }
    else
    {
      sub_20E52F828(v20, v21);
      v22 = (void *)sub_20E556DA4();
    }
    v17 = objc_msgSend((id)objc_opt_self(), sel__outputWithData_didWrite_, v22, 0);

    sub_20E52F530(v20, v21);
    sub_20E52F530(v20, v21);
    return v17;
  }
  if (v19 == *MEMORY[0x24BE0B040])
  {
    (*(void (**)(uint64_t *, uint64_t))(v2 + 96))(v5, v1);
    v23 = *(unsigned __int8 *)v5;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return objc_msgSend((id)objc_opt_self(), sel__outputWithData_didWrite_, 0, v23);
  }
  result = (id)sub_20E5574F4();
  __break(1u);
  return result;
}

id ASAuthorizationPlatformPublicKeyCredentialAssertion.__prfSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t *v27;
  uint64_t *v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v32;
  objc_super v33;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20E557038();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v32 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29138);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v32 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = type metadata accessor for ASAuthorizationPublicKeyCredentialPRFAssertionOutput(0);
  MEMORY[0x24BDAC7A8](v11);
  v13 = (char *)&v32 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = objc_msgSend(v0, sel_coreCredential);
  v15 = objc_msgSend(v14, sel_extensions);

  if (!v15)
    return 0;
  sub_20E557044();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_20E52E370((uint64_t)v10, &qword_254A29138);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
  sub_20E52E370((uint64_t)v10, &qword_254A29138);
  sub_20E557020();
  v17 = (uint64_t)&v13[*(int *)(v11 + 20)];
  sub_20E55702C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  v18 = sub_20E557218();
  v20 = v19;
  sub_20E53A540(v17, (uint64_t)v3);
  v21 = sub_20E55723C();
  v22 = *(_QWORD *)(v21 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v22 + 48))(v3, 1, v21) == 1)
  {
    sub_20E52E370((uint64_t)v3, &qword_254A29140);
    v23 = 0;
    v24 = 0xF000000000000000;
  }
  else
  {
    v23 = sub_20E557218();
    v24 = v25;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v3, v21);
  }
  v26 = (char *)objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialPRFAssertionOutput);
  v27 = (uint64_t *)&v26[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second];
  *(_OWORD *)&v26[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_second] = xmmword_20E55ECE0;
  v28 = (uint64_t *)&v26[OBJC_IVAR___ASAuthorizationPublicKeyCredentialPRFAssertionOutput_first];
  *v28 = v18;
  v28[1] = v20;
  swift_beginAccess();
  v29 = *v27;
  v30 = v27[1];
  *v27 = v23;
  v27[1] = v24;
  sub_20E52F7E4(v18, v20);
  sub_20E52F828(v23, v24);
  sub_20E52F530(v29, v30);
  v33.receiver = v26;
  v33.super_class = (Class)ASAuthorizationPublicKeyCredentialPRFAssertionOutput;
  v16 = objc_msgSendSuper2(&v33, sel_init);
  sub_20E52F530(v23, v24);
  sub_20E52F4EC(v18, v20);
  sub_20E530B38((uint64_t)v13);
  return v16;
}

uint64_t sub_20E548828()
{
  uint64_t v0;

  v0 = sub_20E55720C();
  __swift_allocate_value_buffer(v0, qword_254A2AA10);
  __swift_project_value_buffer(v0, (uint64_t)qword_254A2AA10);
  return sub_20E557200();
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

void *sub_20E5488E8(void *a1, uint64_t a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  unint64_t v6;
  char v7;
  id v8;
  void *v10;

  if ((a2 & 0xC000000000000001) == 0)
  {
    if (*(_QWORD *)(a2 + 16))
    {
      v6 = sub_20E54D61C((uint64_t)a1);
      if ((v7 & 1) != 0)
      {
        v5 = *(void **)(*(_QWORD *)(a2 + 56) + 8 * v6);
        v8 = v5;
        return v5;
      }
    }
    return 0;
  }
  v3 = a1;
  v4 = sub_20E5574D0();

  if (!v4)
    return 0;
  sub_20E53D644(0, (unint64_t *)&qword_254A291F0);
  swift_unknownObjectRetain();
  swift_dynamicCast();
  v5 = v10;
  swift_unknownObjectRelease();
  return v5;
}

uint64_t sub_20E5489BC()
{
  uint64_t v0;

  v0 = sub_20E557254();
  __swift_allocate_value_buffer(v0, qword_254A2AA28);
  __swift_project_value_buffer(v0, (uint64_t)qword_254A2AA28);
  return sub_20E557248();
}

void ASPublicKeyCredentialManager.handleExtensionsIfNeeded(for:options:webKitExtensionOutputs:)(uint64_t a1, void *a2, uint64_t a3, unint64_t a4)
{
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
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  unint64_t v28;
  void *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  id v34;
  char v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[2];
  void *v43;
  char *v44;
  char *v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  char *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;

  v52 = a3;
  v48 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29138);
  MEMORY[0x24BDAC7A8](v6);
  v46 = (uint64_t)v42 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F08);
  MEMORY[0x24BDAC7A8](v8);
  v49 = (char *)v42 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_20E556F9C();
  v50 = *(_QWORD *)(v10 - 8);
  v51 = v10;
  MEMORY[0x24BDAC7A8](v10);
  v45 = (char *)v42 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29130);
  MEMORY[0x24BDAC7A8](v12);
  v44 = (char *)v42 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29870);
  MEMORY[0x24BDAC7A8](v14);
  v16 = (char *)v42 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_20E556EF4();
  v18 = *(_QWORD *)(v17 - 8);
  MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)v42 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = sub_20E556ED0();
  v47 = *(_QWORD *)(v21 - 8);
  v22 = MEMORY[0x24BDAC7A8](v21);
  v24 = (char *)v42 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v22);
  v26 = (char *)v42 - v25;
  objc_opt_self();
  v27 = swift_dynamicCastObjCClass();
  v53 = a4;
  v28 = a4 >> 60;
  if (v27 && v28 <= 0xE)
  {
    v29 = (void *)v27;
    sub_20E556E10();
    swift_allocObject();
    swift_unknownObjectRetain();
    v31 = v52;
    v30 = v53;
    sub_20E52F828(v52, v53);
    sub_20E556E04();
    sub_20E52F974(&qword_254A29878, (uint64_t (*)(uint64_t))MEMORY[0x24BE0AED8], MEMORY[0x24BE0AEE0]);
    sub_20E556DF8();
    swift_release();
    v35 = sub_20E556EB8();
    if (v35 == 2)
    {
      (*(void (**)(char *, uint64_t))(v47 + 8))(v26, v21);
      swift_unknownObjectRelease();
      sub_20E52F530(v31, v30);
    }
    else
    {
      objc_msgSend(v29, sel_setAppID_, v35 & 1);
      swift_unknownObjectRelease();
      sub_20E52F530(v31, v30);
      (*(void (**)(char *, uint64_t))(v47 + 8))(v26, v21);
    }
  }
  else
  {
    objc_opt_self();
    v32 = swift_dynamicCastObjCClass();
    if (v32)
    {
      v33 = (void *)v32;
      swift_unknownObjectRetain();
      v43 = v33;
      v34 = objc_msgSend(v33, sel_extensions);
      if (!v34)
        v34 = objc_msgSend(objc_allocWithZone((Class)sub_20E5570A4()), sel_init);
      if (v28 <= 0xE)
      {
        v42[1] = a1;
        sub_20E556E10();
        swift_allocObject();
        sub_20E52F7E4(v52, v53);
        sub_20E556E04();
        sub_20E52F974(&qword_254A29878, (uint64_t (*)(uint64_t))MEMORY[0x24BE0AED8], MEMORY[0x24BE0AEE0]);
        sub_20E556DF8();
        swift_release();
        sub_20E556EC4();
        if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v16, 1, v17) == 1)
        {
          (*(void (**)(char *, uint64_t))(v47 + 8))(v24, v21);
          sub_20E52F530(v52, v53);
          sub_20E52E370((uint64_t)v16, &qword_254A29870);
        }
        else
        {
          (*(void (**)(char *, char *, uint64_t))(v18 + 32))(v20, v16, v17);
          sub_20E556EDC();
          sub_20E557098();
          sub_20E52F530(v52, v53);
          (*(void (**)(char *, uint64_t))(v18 + 8))(v20, v17);
          (*(void (**)(char *, uint64_t))(v47 + 8))(v24, v21);
        }
      }
      v36 = objc_msgSend(v48, sel_extensions);
      v37 = (uint64_t)v49;
      sub_20E556FA8();

      v39 = v50;
      v38 = v51;
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v50 + 48))(v37, 1, v51) == 1)
      {
        sub_20E52E370(v37, &qword_254A28F08);
        v40 = v43;
      }
      else
      {
        v41 = (uint64_t)v45;
        (*(void (**)(char *, uint64_t, uint64_t))(v39 + 32))(v45, v37, v38);
        v40 = v43;
        sub_20E54933C(v43, v41, v46);
        sub_20E557050();
        (*(void (**)(uint64_t, uint64_t))(v39 + 8))(v41, v38);
      }
      objc_msgSend(v40, sel_setExtensions_, v34);
      swift_unknownObjectRelease();

    }
  }
}

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
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  void *v33;
  unint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(char *, uint64_t, uint64_t, uint64_t);
  char *v45;
  void *v46;
  _QWORD v47[2];
  char *v48;
  char *v49;
  uint64_t v50;
  char *v51;
  char *v52;
  void *v53;
  id v54;
  uint64_t v55;
  char *v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  unint64_t v60;

  v60 = a4;
  v55 = a3;
  v57 = a2;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v6 = MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v6);
  v49 = (char *)v47 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29198);
  v11 = MEMORY[0x24BDAC7A8](v10);
  v50 = (uint64_t)v47 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v11);
  v51 = (char *)v47 - v13;
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29950);
  MEMORY[0x24BDAC7A8](v14);
  v56 = (char *)v47 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_20E5570E0();
  v58 = *(_QWORD *)(v16 - 8);
  v59 = v16;
  MEMORY[0x24BDAC7A8](v16);
  v52 = (char *)v47 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29190);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)v47 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29870);
  MEMORY[0x24BDAC7A8](v21);
  v23 = (char *)v47 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = sub_20E556EF4();
  v25 = *(_QWORD *)(v24 - 8);
  MEMORY[0x24BDAC7A8](v24);
  v27 = (char *)v47 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v28 = sub_20E556ED0();
  v29 = *(_QWORD *)(v28 - 8);
  MEMORY[0x24BDAC7A8](v28);
  v31 = (char *)v47 - ((v30 + 15) & 0xFFFFFFFFFFFFFFF0);
  objc_opt_self();
  v32 = swift_dynamicCastObjCClass();
  if (v32)
  {
    v47[1] = v20;
    v48 = v8;
    v33 = (void *)v32;
    swift_unknownObjectRetain();
    v53 = v33;
    v54 = objc_msgSend(v33, sel_extensions);
    if (!v54)
      v54 = objc_msgSend(objc_allocWithZone((Class)sub_20E5571E8()), sel_init);
    if (v60 >> 60 != 15)
    {
      v47[0] = a1;
      v34 = v60;
      sub_20E556E10();
      swift_allocObject();
      sub_20E52F7E4(v55, v34);
      sub_20E556E04();
      sub_20E52F974(&qword_254A29878, (uint64_t (*)(uint64_t))MEMORY[0x24BE0AED8], MEMORY[0x24BE0AEE0]);
      sub_20E556DF8();
      swift_release();
      sub_20E556EC4();
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v24) == 1)
      {
        (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
        sub_20E52F530(v55, v60);
        sub_20E52E370((uint64_t)v23, &qword_254A29870);
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v25 + 32))(v27, v23, v24);
        sub_20E556EE8();
        sub_20E5571DC();
        sub_20E52F530(v55, v60);
        (*(void (**)(char *, uint64_t))(v25 + 8))(v27, v24);
        (*(void (**)(char *, uint64_t))(v29 + 8))(v31, v28);
      }
    }
    v35 = objc_msgSend(v57, sel_extensions);
    v36 = (uint64_t)v56;
    sub_20E5570EC();

    v38 = v58;
    v37 = v59;
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v58 + 48))(v36, 1, v59) == 1)
    {
      sub_20E52E370(v36, &qword_254A29950);
    }
    else
    {
      v39 = (uint64_t)v52;
      (*(void (**)(char *, uint64_t, uint64_t))(v38 + 32))(v52, v36, v37);
      if ((sub_20E5570D4() & 1) != 0)
      {
        v40 = v50;
        sub_20E54A188(v53, v39, v50);
        v41 = sub_20E557188();
        v42 = *(_QWORD *)(v41 - 8);
        if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v42 + 48))(v40, 1, v41) == 1)
        {
          v43 = sub_20E55723C();
          v44 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v43 - 8) + 56);
          v44(v49, 1, 1, v43);
          v44(v48, 1, 1, v43);
          v45 = v51;
          v39 = (uint64_t)v52;
          sub_20E557158();
          sub_20E52E370(v40, (uint64_t *)&unk_254A29198);
        }
        else
        {
          v45 = v51;
          (*(void (**)(char *, uint64_t, uint64_t))(v42 + 32))(v51, v40, v41);
        }
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v42 + 56))(v45, 0, 1, v41);
        v46 = v54;
        sub_20E5571A0();
        (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v37);
        goto LABEL_17;
      }
      (*(void (**)(uint64_t, uint64_t))(v38 + 8))(v39, v37);
    }
    v46 = v54;
LABEL_17:
    objc_msgSend(v53, sel_setExtensions_, v46);
    swift_unknownObjectRelease();

  }
}

uint64_t sub_20E54933C@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void (*v31)(char *, uint64_t);
  id v32;
  uint64_t v33;
  unint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  void (*v47)(char *, uint64_t, uint64_t);
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  char *v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  id v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;

  v67 = a2;
  v70 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v4);
  v68 = (char *)&v54 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298B0);
  MEMORY[0x24BDAC7A8](v6);
  v69 = (uint64_t)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298B8);
  MEMORY[0x24BDAC7A8](v65);
  v58 = (char *)&v54 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v60 = (uint64_t)&v54 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v10);
  v59 = (uint64_t)&v54 - v12;
  v62 = sub_20E55723C();
  v13 = *(_QWORD *)(v62 - 8);
  v14 = MEMORY[0x24BDAC7A8](v62);
  v16 = (char *)&v54 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v18 = (char *)&v54 - v17;
  v19 = sub_20E556E88();
  v64 = *(_QWORD *)(v19 - 8);
  v20 = MEMORY[0x24BDAC7A8](v19);
  v22 = (char *)&v54 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v20);
  v24 = (char *)&v54 - v23;
  v63 = sub_20E556EAC();
  v61 = *(_QWORD *)(v63 - 8);
  MEMORY[0x24BDAC7A8](v63);
  v26 = (char *)&v54 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = a1;
  v27 = objc_msgSend(a1, sel_authenticatorData);
  sub_20E556DBC();

  sub_20E556E40();
  v55 = v16;
  v56 = v18;
  v57 = v13;
  v28 = v65;
  v29 = v62;
  sub_20E556E94();
  sub_20E556E70();
  sub_20E52F974((unint64_t *)&qword_254A298C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE0AE98], MEMORY[0x24BE0AEA8]);
  v30 = sub_20E5573EC();
  v31 = *(void (**)(char *, uint64_t))(v64 + 8);
  v31(v22, v19);
  v31(v24, v19);
  (*(void (**)(char *, uint64_t))(v61 + 8))(v26, v63);
  v32 = objc_msgSend(v66, sel_credentialID);
  v33 = sub_20E556DBC();
  v35 = v34;

  v36 = (uint64_t)v68;
  sub_20E556F90();
  v37 = sub_20E556F30();
  v38 = v30 & 1;
  v39 = v69;
  sub_20E54B470(v33, v35, v38, v36, v37, v69);
  swift_bridgeObjectRelease();
  sub_20E52F4EC(v33, v35);
  sub_20E52E370(v36, &qword_254A28F00);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v40 - 8) + 48))(v39, 1, v40) == 1)
  {
    sub_20E52E370(v39, &qword_254A298B0);
    v41 = sub_20E557038();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v70, 1, 1, v41);
  }
  else
  {
    v43 = v39 + *(int *)(v40 + 48);
    v44 = v58;
    v45 = (uint64_t)&v58[*(int *)(v28 + 48)];
    v46 = v57;
    v47 = *(void (**)(char *, uint64_t, uint64_t))(v57 + 32);
    v48 = v29;
    v47(v58, v39, v29);
    sub_20E54E2E4(v43, v45, &qword_254A29140);
    v49 = (uint64_t)&v44[*(int *)(v28 + 48)];
    v50 = v56;
    v47(v56, (uint64_t)v44, v48);
    v51 = v59;
    sub_20E54E2E4(v49, v59, &qword_254A29140);
    (*(void (**)(char *, char *, uint64_t))(v46 + 16))(v55, v50, v48);
    sub_20E530AF4(v51, v60, &qword_254A29140);
    v52 = v70;
    sub_20E557014();
    sub_20E52E370(v51, &qword_254A29140);
    (*(void (**)(char *, uint64_t))(v46 + 8))(v50, v48);
    v53 = sub_20E557038();
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v52, 0, 1, v53);
  }
}

uint64_t sub_20E54A188@<X0>(void *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
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
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  os_log_type_t v34;
  uint8_t *v35;
  uint64_t v36;
  unint64_t v37;
  unint64_t v38;
  char v39;
  void (*v40)(char *, uint64_t);
  id v41;
  uint64_t v42;
  unint64_t v43;
  unint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  void (*v57)(char *, uint64_t, uint64_t);
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  char *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char *v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  id v75;
  uint64_t v76;
  char *v77;
  uint64_t v78;
  uint64_t v79;

  v76 = a2;
  v79 = a3;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v4);
  v77 = (char *)&v65 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298B0);
  MEMORY[0x24BDAC7A8](v6);
  v78 = (uint64_t)&v65 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v67 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298B8);
  MEMORY[0x24BDAC7A8](v67);
  v66 = (char *)&v65 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v10 = MEMORY[0x24BDAC7A8](v9);
  v72 = (uint64_t)&v65 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v71 = (char *)&v65 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v70 = (uint64_t)&v65 - v14;
  v15 = sub_20E55723C();
  v68 = *(_QWORD *)(v15 - 8);
  v69 = v15;
  MEMORY[0x24BDAC7A8](v15);
  v65 = (char *)&v65 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = sub_20E556E88();
  v74 = *(_QWORD *)(v17 - 8);
  v18 = MEMORY[0x24BDAC7A8](v17);
  v20 = (char *)&v65 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v18);
  v22 = (char *)&v65 - v21;
  v73 = sub_20E556EAC();
  v23 = *(_QWORD *)(v73 - 8);
  MEMORY[0x24BDAC7A8](v73);
  v25 = (char *)&v65 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298C0);
  MEMORY[0x24BDAC7A8](v26);
  v28 = (char *)&v65 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  v75 = a1;
  v29 = objc_msgSend(a1, sel_attestationObject);
  sub_20E556DBC();

  sub_20E556F0C();
  v30 = sub_20E556F24();
  v31 = *(_QWORD *)(v30 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v31 + 48))(v28, 1, v30) == 1)
  {
    sub_20E52E370((uint64_t)v28, &qword_254A298C0);
    if (qword_254A28EE8 != -1)
      swift_once();
    v32 = sub_20E55720C();
    __swift_project_value_buffer(v32, (uint64_t)qword_254A2AA10);
    v33 = sub_20E5571F4();
    v34 = sub_20E557374();
    if (os_log_type_enabled(v33, v34))
    {
      v35 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v35 = 0;
      _os_log_impl(&dword_20E4D9000, v33, v34, "Could not parse registration attestationObject.", v35, 2u);
      MEMORY[0x212BBF364](v35, -1, -1);
    }

    goto LABEL_9;
  }
  v36 = sub_20E556F18();
  v38 = v37;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v28, v30);
  sub_20E52F7E4(v36, v38);
  sub_20E556E40();
  sub_20E556E94();
  sub_20E556E70();
  sub_20E52F974((unint64_t *)&qword_254A298C8, (uint64_t (*)(uint64_t))MEMORY[0x24BE0AE98], MEMORY[0x24BE0AEA8]);
  v39 = sub_20E5573EC();
  sub_20E52F4EC(v36, v38);
  v40 = *(void (**)(char *, uint64_t))(v74 + 8);
  v40(v20, v17);
  v40(v22, v17);
  (*(void (**)(char *, uint64_t))(v23 + 8))(v25, v73);
  v41 = objc_msgSend(v75, sel_credentialID);
  v42 = sub_20E556DBC();
  v44 = v43;

  v45 = (uint64_t)v77;
  sub_20E5570BC();
  v46 = sub_20E5570B0();
  v47 = v39 & 1;
  v48 = v78;
  sub_20E54B470(v42, v44, v47, v45, v46, v78);
  swift_bridgeObjectRelease();
  sub_20E52F4EC(v42, v44);
  sub_20E52E370(v45, &qword_254A28F00);
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298D0);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v49 - 8) + 48))(v48, 1, v49) == 1)
  {
    sub_20E52E370(v48, &qword_254A298B0);
LABEL_9:
    v50 = sub_20E557188();
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v50 - 8) + 56))(v79, 1, 1, v50);
  }
  v52 = v48 + *(int *)(v49 + 48);
  v53 = v67;
  v54 = v68;
  v55 = v66;
  v56 = (uint64_t)&v66[*(int *)(v67 + 48)];
  v57 = *(void (**)(char *, uint64_t, uint64_t))(v68 + 32);
  v58 = v69;
  v57(v66, v48, v69);
  sub_20E54E2E4(v52, v56, &qword_254A29140);
  v59 = (uint64_t)&v55[*(int *)(v53 + 48)];
  v60 = v65;
  v57(v65, (uint64_t)v55, v58);
  v61 = v70;
  sub_20E54E2E4(v59, v70, &qword_254A29140);
  v62 = v71;
  (*(void (**)(char *, char *, uint64_t))(v54 + 16))(v71, v60, v58);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v54 + 56))(v62, 0, 1, v58);
  sub_20E530AF4(v61, v72, &qword_254A29140);
  v63 = v79;
  sub_20E557158();
  sub_20E52E370(v61, &qword_254A29140);
  (*(void (**)(char *, uint64_t))(v54 + 8))(v60, v58);
  v64 = sub_20E557188();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v64 - 8) + 56))(v63, 0, 1, v64);
}

void sub_20E54A9B0(void *a1, uint64_t a2, uint64_t a3, void *a4, void *a5, void (*a6)(uint64_t, void *, uint64_t, unint64_t))
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v16;
  id v17;

  if (a5)
  {
    swift_unknownObjectRetain();
    v10 = a4;
    v11 = a1;
    v12 = a5;
    v13 = sub_20E556DBC();
    v15 = v14;

  }
  else
  {
    swift_unknownObjectRetain();
    v16 = a4;
    v17 = a1;
    v13 = 0;
    v15 = 0xF000000000000000;
  }
  a6(a3, a4, v13, v15);
  sub_20E52F530(v13, v15);
  swift_unknownObjectRelease();

}

Swift::Bool __swiftcall ASPublicKeyCredentialManager.passkeyExists(relyingParty:username:)(Swift::String relyingParty, Swift::String username)
{
  _QWORD *v2;
  uint64_t v3;
  _QWORD *i;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  char v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  char v20;
  id v23;
  void *v24;

  v2 = sub_20E54AD3C(relyingParty._countAndFlagsBits, (uint64_t)relyingParty._object);
  v3 = v2[2];
  if (v3)
  {
    v23 = (id)objc_opt_self();
    swift_bridgeObjectRetain();
    for (i = v2 + 8; ; i += 5)
    {
      v5 = *(i - 4);
      v6 = *(i - 3);
      v7 = *(i - 2);
      sub_20E52F828(v5, v6);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRetain();
      v8 = (void *)sub_20E5572A8();
      v9 = objc_msgSend(v23, sel_cborWithUTF8String_, v8);

      if ((v7 & 0xC000000000000001) != 0)
      {
        v10 = v9;
        v11 = sub_20E5574D0();

        if (!v11)
          goto LABEL_3;
        sub_20E53D644(0, (unint64_t *)&qword_254A291F0);
        swift_unknownObjectRetain();
        swift_dynamicCast();
        v12 = v24;
        swift_unknownObjectRelease();

        if (!v24)
          goto LABEL_4;
      }
      else
      {
        if (!*(_QWORD *)(v7 + 16) || (v13 = sub_20E54D61C((uint64_t)v9), (v14 & 1) == 0))
        {
LABEL_3:

LABEL_4:
          sub_20E52F530(v5, v6);
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          goto LABEL_5;
        }
        v12 = *(id *)(*(_QWORD *)(v7 + 56) + 8 * v13);

        if (!v12)
          goto LABEL_4;
      }
      v15 = objc_msgSend(v12, sel_string);

      if (!v15)
        goto LABEL_4;
      v16 = sub_20E5572B4();
      v18 = v17;

      if (v16 == username._countAndFlagsBits && v18 == username._object)
      {
        swift_bridgeObjectRelease();
        sub_20E52F530(v5, v6);
        swift_bridgeObjectRelease_n();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        return 1;
      }
      v20 = sub_20E557560();
      swift_bridgeObjectRelease();
      sub_20E52F530(v5, v6);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      if ((v20 & 1) != 0)
      {
        swift_bridgeObjectRelease_n();
        return 1;
      }
LABEL_5:
      if (!--v3)
      {
        swift_bridgeObjectRelease_n();
        return 0;
      }
    }
  }
  swift_bridgeObjectRelease();
  return 0;
}

_QWORD *sub_20E54AD3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void **v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void **v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  unsigned int v30;
  unint64_t v31;
  unint64_t v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  const __CFDictionary *v37;
  OSStatus v38;
  OSStatus v39;
  uint64_t v40;
  NSObject *v41;
  os_log_type_t v42;
  uint8_t *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  _QWORD *v48;
  _QWORD *v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  os_log_type_t v59;
  uint8_t *v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  const __CFDictionary *v65;
  uint64_t v66;
  id v67;
  id v68;
  CFTypeRef result;
  uint64_t v70[5];
  _QWORD v71[6];

  v71[5] = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29880);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_20E55F980;
  v5 = (void *)*MEMORY[0x24BDE9220];
  type metadata accessor for CFString(0);
  v7 = v6;
  v8 = (void **)MEMORY[0x24BDE9248];
  *(_QWORD *)(v4 + 32) = v5;
  v9 = v5;
  v10 = *v8;
  *(_QWORD *)(v4 + 56) = v6;
  *(_QWORD *)(v4 + 64) = v10;
  v11 = (void *)*MEMORY[0x24BDE9028];
  *(_QWORD *)(v4 + 88) = v6;
  *(_QWORD *)(v4 + 96) = v11;
  v12 = (void *)*MEMORY[0x24BDE9030];
  *(_QWORD *)(v4 + 120) = v6;
  *(_QWORD *)(v4 + 128) = v12;
  v13 = (void *)*MEMORY[0x24BDE9140];
  *(_QWORD *)(v4 + 184) = v6;
  *(_QWORD *)(v4 + 152) = v6;
  *(_QWORD *)(v4 + 160) = v13;
  v14 = MEMORY[0x24BEE1328];
  *(_BYTE *)(v4 + 192) = 1;
  v15 = (void *)*MEMORY[0x24BDE90A0];
  v16 = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 216) = v14;
  *(_QWORD *)(v4 + 224) = v15;
  *(_QWORD *)(v4 + 248) = v6;
  *(_QWORD *)(v4 + 256) = a1;
  *(_QWORD *)(v4 + 264) = a2;
  v17 = (void *)*MEMORY[0x24BDE9528];
  *(_QWORD *)(v4 + 312) = v6;
  *(_QWORD *)(v4 + 280) = v16;
  *(_QWORD *)(v4 + 288) = v17;
  v18 = (void **)MEMORY[0x24BDE94C0];
  *(_BYTE *)(v4 + 320) = 1;
  v19 = *v18;
  *(_QWORD *)(v4 + 376) = v6;
  *(_QWORD *)(v4 + 344) = v14;
  *(_QWORD *)(v4 + 352) = v19;
  *(_BYTE *)(v4 + 384) = 1;
  v20 = (void *)*MEMORY[0x24BDE8F50];
  *(_QWORD *)(v4 + 440) = v6;
  *(_QWORD *)(v4 + 408) = v14;
  *(_QWORD *)(v4 + 416) = v20;
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = v12;
  v25 = v13;
  v26 = v15;
  swift_bridgeObjectRetain();
  v27 = v17;
  v28 = v19;
  v29 = v20;
  v30 = objc_msgSend(v67, sel_isForTesting);
  v31 = 0xD000000000000019;
  if (v30)
    v31 = 0xD000000000000021;
  v32 = 0x800000020E566C70;
  if (v30)
    v32 = 0x800000020E566C90;
  *(_QWORD *)(v4 + 448) = v31;
  *(_QWORD *)(v4 + 456) = v32;
  v33 = (void *)*MEMORY[0x24BDE93B0];
  *(_QWORD *)(v4 + 472) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(v4 + 480) = v33;
  v34 = (void *)*MEMORY[0x24BDE93B8];
  *(_QWORD *)(v4 + 536) = v7;
  *(_QWORD *)(v4 + 504) = v7;
  *(_QWORD *)(v4 + 512) = v34;
  sub_20E53D644(0, &qword_254A29888);
  v35 = v33;
  v36 = v34;
  v37 = (const __CFDictionary *)sub_20E557368();
  result = 0;
  v38 = SecItemCopyMatching(v37, &result);
  if (v38)
  {
    v39 = v38;
    if (qword_254A28EE8 != -1)
      swift_once();
    v40 = sub_20E55720C();
    __swift_project_value_buffer(v40, (uint64_t)qword_254A2AA10);
    v41 = sub_20E5571F4();
    v42 = sub_20E557374();
    if (os_log_type_enabled(v41, v42))
    {
      v43 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v43 = 67240192;
      LODWORD(v71[0]) = v39;
      sub_20E5573C8();
      _os_log_impl(&dword_20E4D9000, v41, v42, "Could not fetch passkey: %{public}d", v43, 8u);
      MEMORY[0x212BBF364](v43, -1, -1);
    }
    goto LABEL_35;
  }
  if (result)
  {
    v71[0] = result;
    swift_unknownObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29898);
    if ((swift_dynamicCast() & 1) != 0)
    {
      v44 = v70[0];
      v65 = v37;
      if ((unint64_t)v70[0] >> 62)
      {
        swift_bridgeObjectRetain();
        v45 = sub_20E557500();
        if (v45)
          goto LABEL_14;
      }
      else
      {
        v45 = *(_QWORD *)((v70[0] & 0xFFFFFFFFFFFFF8) + 0x10);
        swift_bridgeObjectRetain();
        if (v45)
        {
LABEL_14:
          if (v45 < 1)
            __break(1u);
          v46 = 0;
          v47 = v44 & 0xC000000000000001;
          v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
          v66 = v45;
          v68 = (id)v44;
          do
          {
            if (v47)
              v50 = (id)MEMORY[0x212BBE86C](v46, v44);
            else
              v50 = *(id *)(v44 + 8 * v46 + 32);
            sub_20E532700(v50, v70);
            v52 = v70[0];
            v51 = v70[1];
            v53 = v70[2];
            v54 = v70[3];
            v55 = v70[4];
            sub_20E54E2E4((uint64_t)v70, (uint64_t)v71, &qword_254A298A0);
            if (v71[2])
            {
              if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
                v48 = sub_20E54C834(0, v48[2] + 1, 1, v48);
              v57 = v48[2];
              v56 = v48[3];
              if (v57 >= v56 >> 1)
                v48 = sub_20E54C834((_QWORD *)(v56 > 1), v57 + 1, 1, v48);
              v48[2] = v57 + 1;
              v49 = &v48[5 * v57];
              v49[4] = v52;
              v49[5] = v51;
              v49[6] = v53;
              v49[7] = v54;
              v49[8] = v55;
              v45 = v66;
              v44 = (uint64_t)v68;
            }
            ++v46;
          }
          while (v45 != v46);
          goto LABEL_39;
        }
      }
      v48 = (_QWORD *)MEMORY[0x24BEE4AF8];
LABEL_39:

      swift_bridgeObjectRelease_n();
      swift_unknownObjectRelease();
      return v48;
    }
  }
  if (qword_254A28EE8 != -1)
    swift_once();
  v58 = sub_20E55720C();
  __swift_project_value_buffer(v58, (uint64_t)qword_254A2AA10);
  v41 = sub_20E5571F4();
  v59 = sub_20E557374();
  if (!os_log_type_enabled(v41, v59))
    goto LABEL_35;
  v60 = (uint8_t *)swift_slowAlloc();
  v61 = (_QWORD *)swift_slowAlloc();
  *(_DWORD *)v60 = 138477827;
  swift_beginAccess();
  if (!result)
    goto LABEL_33;
  swift_unknownObjectRetain();
  objc_opt_self();
  v62 = swift_dynamicCastObjCClass();
  if (!v62)
  {
    swift_unknownObjectRelease();
LABEL_33:
    v70[0] = 0;
    sub_20E5573C8();
    v63 = 0;
    goto LABEL_34;
  }
  v63 = v62;
  v70[0] = v62;
  sub_20E5573C8();
LABEL_34:
  *v61 = v63;
  _os_log_impl(&dword_20E4D9000, v41, v59, "Unexpected keychain response: %{private}@", v60, 0xCu);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29890);
  swift_arrayDestroy();
  MEMORY[0x212BBF364](v61, -1, -1);
  MEMORY[0x212BBF364](v60, -1, -1);
LABEL_35:

  swift_unknownObjectRelease();
  return (_QWORD *)MEMORY[0x24BEE4AF8];
}

void sub_20E54B470(uint64_t a1@<X0>, unint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
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
  char *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(char *, uint64_t, uint64_t);
  uint64_t v43;
  unint64_t v44;
  unint64_t v45;
  void (*v46)(char *, uint64_t);
  uint64_t v47;
  uint64_t v48;
  unint64_t v49;
  unint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  char *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  unint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  NSObject *v66;
  os_log_type_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  unint64_t v71;
  uint64_t v72;
  NSObject *v73;
  os_log_type_t v74;
  uint8_t *v75;
  uint64_t v76;
  int v77;
  uint64_t v78;
  id v79;
  SEL *v80;
  void *v81;
  void *v82;
  void *v83;
  id v84;
  void *v85;
  uint64_t v86;
  unint64_t v87;
  unint64_t v88;
  uint64_t v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  unint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  unint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  _QWORD v103[2];
  uint64_t v104;
  char *v105;
  id v106;
  uint64_t v107;
  int v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char *v114;
  char *v115;
  char *v116;
  char *v117;
  uint64_t v118;
  unint64_t v119;
  char *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  unint64_t v125;
  __int128 v126;
  _BYTE v127[24];
  uint64_t v128[3];
  __int128 v129;
  uint64_t v130;
  __int128 v131;
  uint64_t v132;
  _OWORD v133[2];
  uint64_t v134;

  v113 = a5;
  v111 = a4;
  v108 = a3;
  v123 = a6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29140);
  v9 = MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)v103 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v13 = (char *)v103 - v12;
  v107 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298D8);
  MEMORY[0x24BDAC7A8](v107);
  v116 = (char *)v103 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  v16 = MEMORY[0x24BDAC7A8](v15);
  v120 = (char *)v103 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v16);
  v110 = (char *)v103 - v18;
  v122 = sub_20E556F78();
  v121 = *(_QWORD *)(v122 - 8);
  MEMORY[0x24BDAC7A8](v122);
  v115 = (char *)v103 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_20E557254();
  v112 = *(_QWORD *)(v20 - 8);
  MEMORY[0x24BDAC7A8](v20);
  v22 = (char *)v103 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = sub_20E55723C();
  v24 = *(_QWORD *)(v23 - 8);
  v25 = MEMORY[0x24BDAC7A8](v23);
  v117 = (char *)v103 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x24BDAC7A8](v25);
  v114 = (char *)v103 - v28;
  MEMORY[0x24BDAC7A8](v27);
  v30 = (char *)v103 - v29;
  v118 = a1;
  v119 = a2;
  sub_20E54C198(a1, a2, 0, v128);
  sub_20E54E2E4((uint64_t)v128, (uint64_t)&v129, &qword_254A298A0);
  v31 = v130;
  if (!v130)
  {
    if (qword_254A28EE8 != -1)
      swift_once();
    v63 = sub_20E55720C();
    __swift_project_value_buffer(v63, (uint64_t)qword_254A2AA10);
    v64 = v118;
    v65 = v119;
    sub_20E52F7E4(v118, v119);
    sub_20E52F7E4(v64, v65);
    v66 = sub_20E5571F4();
    v67 = sub_20E557374();
    if (os_log_type_enabled(v66, v67))
    {
      v68 = swift_slowAlloc();
      v69 = swift_slowAlloc();
      *(_QWORD *)&v133[0] = v69;
      *(_DWORD *)v68 = 141558275;
      *(_QWORD *)&v126 = 1752392040;
      sub_20E5573C8();
      *(_WORD *)(v68 + 12) = 2081;
      v70 = sub_20E556DB0();
      *(_QWORD *)&v126 = sub_20E542F7C(v70, v71, (uint64_t *)v133);
      sub_20E5573C8();
      swift_bridgeObjectRelease();
      sub_20E52F4EC(v64, v65);
      sub_20E52F4EC(v64, v65);
      _os_log_impl(&dword_20E4D9000, v66, v67, "Could not find passkey with credentialID %{private,mask.hash}s).", (uint8_t *)v68, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x212BBF364](v69, -1, -1);
      MEMORY[0x212BBF364](v68, -1, -1);
    }
    else
    {
      sub_20E52F4EC(v64, v65);
      sub_20E52F4EC(v64, v65);
    }

    v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298D0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v123, 1, 1, v76);
    return;
  }
  v109 = v23;
  v103[0] = v11;
  v105 = v13;
  v126 = v129;
  *(_OWORD *)&v127[8] = v131;
  v132 = v130;
  *(_QWORD *)v127 = v130;
  swift_bridgeObjectRetain();
  v32 = (void *)sub_20E5572A8();
  v33 = (void *)objc_opt_self();
  v34 = objc_msgSend(v33, sel_cborWithUTF8String_, v32);

  v35 = sub_20E5488E8(v34, v31);
  v104 = v24;
  v106 = v33;
  v103[1] = "prfCredRandomWithoutUV";
  if (v35 && (v36 = objc_msgSend(v35, sel_data), v35, v36))
  {
    v37 = sub_20E556DBC();
    v39 = v38;

    sub_20E54E19C((uint64_t)&v132);
    sub_20E52F4EC(v37, v39);
    v40 = v123;
  }
  else
  {
    sub_20E54E19C((uint64_t)&v132);
    if (qword_254A28EF0 != -1)
      swift_once();
    v41 = __swift_project_value_buffer(v20, (uint64_t)qword_254A2AA28);
    v42 = *(void (**)(char *, uint64_t, uint64_t))(v112 + 16);
    v42(v22, v41, v20);
    sub_20E557230();
    v43 = sub_20E557218();
    v45 = v44;
    v46 = *(void (**)(char *, uint64_t))(v24 + 8);
    v47 = v109;
    v46(v30, v109);
    sub_20E5317D8(v43, v45, 2);
    v42(v22, v41, v20);
    sub_20E557230();
    v48 = sub_20E557218();
    v50 = v49;
    v46(v30, v47);
    sub_20E5317D8(v48, v50, 3);
    v133[0] = v126;
    v133[1] = *(_OWORD *)v127;
    v134 = *(_QWORD *)&v127[16];
    sub_20E54E1C4((uint64_t)v133);
    LOBYTE(v48) = sub_20E54DD5C((uint64_t)v133);
    sub_20E54E20C((uint64_t)v133);
    v40 = v123;
    if ((v48 & 1) == 0)
    {
      if (qword_254A28EE8 != -1)
        swift_once();
      v72 = sub_20E55720C();
      __swift_project_value_buffer(v72, (uint64_t)qword_254A2AA10);
      v73 = sub_20E5571F4();
      v74 = sub_20E557374();
      if (os_log_type_enabled(v73, v74))
      {
        v75 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v75 = 0;
        _os_log_impl(&dword_20E4D9000, v73, v74, "Could not save PRF seeds to keychain.", v75, 2u);
        MEMORY[0x212BBF364](v75, -1, -1);
      }

      goto LABEL_29;
    }
  }
  v51 = v122;
  v52 = v121;
  v53 = v115;
  v54 = v114;
  v55 = (uint64_t)v120;
  v56 = v113;
  if (!v113)
    goto LABEL_27;
  if (!*(_QWORD *)(v113 + 16))
  {
    v61 = (uint64_t)v110;
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v121 + 56))(v110, 1, 1, v122);
LABEL_26:
    sub_20E52E370(v61, &qword_254A28F00);
LABEL_27:
    sub_20E530AF4(v111, v55, &qword_254A28F00);
    if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v55, 1, v51) == 1)
    {
      sub_20E52E370(v55, &qword_254A28F00);
LABEL_29:
      v78 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298D0);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v78 - 8) + 56))(v40, 1, 1, v78);
LABEL_41:
      sub_20E52F530(v126, *((unint64_t *)&v126 + 1));
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      return;
    }
    v61 = v55;
    goto LABEL_31;
  }
  v57 = v118;
  v58 = v119;
  sub_20E52F7E4(v118, v119);
  v59 = sub_20E54D6E8(v57, v58, MEMORY[0x24BDCDCF8], sub_20E54CBAC);
  if ((v60 & 1) != 0)
  {
    v61 = (uint64_t)v110;
    (*(void (**)(char *, uint64_t, uint64_t))(v52 + 16))(v110, *(_QWORD *)(v56 + 56) + *(_QWORD *)(v52 + 72) * v59, v51);
    v62 = 0;
  }
  else
  {
    v62 = 1;
    v61 = (uint64_t)v110;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v52 + 56))(v61, v62, 1, v51);
  sub_20E52F4EC(v57, v58);
  v77 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v52 + 48))(v61, 1, v51);
  v55 = (uint64_t)v120;
  if (v77 == 1)
    goto LABEL_26;
LABEL_31:
  (*(void (**)(char *, uint64_t, uint64_t))(v52 + 32))(v53, v61, v51);
  v79 = *(id *)v127;
  v80 = (SEL *)&selRef_unknownSenderCellImage;
  if ((v108 & 1) != 0)
  {
    v81 = (void *)sub_20E5572A8();
    v80 = (SEL *)objc_msgSend(v106, sel_cborWithUTF8String_, v81);

    v82 = sub_20E5488E8(v80, (uint64_t)v79);
    if (v82)
    {
      v79 = objc_msgSend(v82, sel_data);

      if (v79)
      {
LABEL_37:
        v86 = sub_20E556DBC();
        v88 = v87;

        v124 = v86;
        v125 = v88;
        sub_20E557224();
        v89 = sub_20E556F60();
        v91 = v90;
        v124 = v89;
        v125 = v90;
        sub_20E557278();
        sub_20E52F974(&qword_254A298E0, (uint64_t (*)(uint64_t))MEMORY[0x24BDC6AF8], MEMORY[0x24BDC6AE8]);
        sub_20E54E254();
        sub_20E557260();
        sub_20E52F4EC(v89, v91);
        sub_20E54E298();
        sub_20E557224();
        v92 = sub_20E556F6C();
        if (v93 >> 60 == 15)
        {
          v94 = v104;
          v95 = v109;
          (*(void (**)(char *, uint64_t))(v104 + 8))(v54, v109);
          (*(void (**)(char *, uint64_t))(v121 + 8))(v53, v122);
          v96 = (uint64_t)v105;
          (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v94 + 56))(v105, 1, 1, v95);
        }
        else
        {
          v97 = v92;
          v98 = v93;
          v124 = v92;
          v125 = v93;
          sub_20E557260();
          v99 = v103[0];
          sub_20E557224();
          sub_20E52F530(v97, v98);
          v94 = v104;
          v95 = v109;
          (*(void (**)(char *, uint64_t))(v104 + 8))(v54, v109);
          (*(void (**)(char *, uint64_t))(v121 + 8))(v53, v122);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v94 + 56))(v99, 0, 1, v95);
          v96 = (uint64_t)v105;
          sub_20E54E2E4(v99, (uint64_t)v105, &qword_254A29140);
        }
        v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298D0);
        v101 = v123;
        v102 = v123 + *(int *)(v100 + 48);
        (*(void (**)(uint64_t, char *, uint64_t))(v94 + 32))(v123, v117, v95);
        sub_20E54E2E4(v96, v102, &qword_254A29140);
        (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v100 - 8) + 56))(v101, 0, 1, v100);
        goto LABEL_41;
      }
    }
    __break(1u);
  }
  v83 = (void *)sub_20E5572A8();
  v84 = objc_msgSend(v106, v80[287], v83);

  v85 = sub_20E5488E8(v84, (uint64_t)v79);
  if (v85)
  {
    v79 = objc_msgSend(v85, sel_data);

    if (v79)
      goto LABEL_37;
  }
  __break(1u);
}

uint64_t sub_20E54C198@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, uint64_t a3@<X3>, uint64_t *a4@<X8>)
{
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void **v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void **v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  unsigned int v33;
  unint64_t v34;
  unint64_t v35;
  NSObject *v36;
  id v37;
  void *v38;
  OSStatus v39;
  OSStatus v40;
  uint64_t v41;
  NSObject *v42;
  os_log_type_t v43;
  uint8_t *v44;
  uint8_t *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  os_log_type_t v54;
  uint8_t *v55;
  _QWORD *v56;
  uint64_t v57;
  uint64_t v58;
  NSObject *v59;
  id v63;
  CFTypeRef result;
  uint64_t v66[6];

  v66[5] = *MEMORY[0x24BDAC8D0];
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29880);
  v6 = swift_allocObject();
  *(_OWORD *)(v6 + 16) = xmmword_20E55F980;
  v7 = (void *)*MEMORY[0x24BDE9220];
  type metadata accessor for CFString(0);
  *(_QWORD *)(v6 + 32) = v7;
  v8 = v7;
  v9 = (void *)*MEMORY[0x24BDE9248];
  *(_QWORD *)(v6 + 56) = v10;
  *(_QWORD *)(v6 + 64) = v9;
  v11 = (void *)*MEMORY[0x24BDE9028];
  *(_QWORD *)(v6 + 88) = v10;
  *(_QWORD *)(v6 + 96) = v11;
  v12 = (void *)*MEMORY[0x24BDE9030];
  *(_QWORD *)(v6 + 120) = v10;
  *(_QWORD *)(v6 + 128) = v12;
  v13 = (void *)*MEMORY[0x24BDE9140];
  *(_QWORD *)(v6 + 184) = v10;
  *(_QWORD *)(v6 + 152) = v10;
  *(_QWORD *)(v6 + 160) = v13;
  v14 = MEMORY[0x24BEE1328];
  v15 = (void **)MEMORY[0x24BDE8FB0];
  *(_BYTE *)(v6 + 192) = 1;
  v16 = *v15;
  *(_QWORD *)(v6 + 216) = v14;
  *(_QWORD *)(v6 + 224) = v16;
  v17 = MEMORY[0x24BDCDDE8];
  *(_QWORD *)(v6 + 248) = v10;
  *(_QWORD *)(v6 + 256) = a1;
  *(_QWORD *)(v6 + 264) = a2;
  v18 = (void *)*MEMORY[0x24BDE9528];
  *(_QWORD *)(v6 + 312) = v10;
  *(_QWORD *)(v6 + 280) = v17;
  *(_QWORD *)(v6 + 288) = v18;
  *(_BYTE *)(v6 + 320) = 1;
  v19 = (void *)*MEMORY[0x24BDE94C0];
  *(_QWORD *)(v6 + 376) = v10;
  *(_QWORD *)(v6 + 344) = v14;
  *(_QWORD *)(v6 + 352) = v19;
  v20 = (void **)MEMORY[0x24BDE94D0];
  *(_BYTE *)(v6 + 384) = 1;
  v21 = *v20;
  *(_QWORD *)(v6 + 440) = v10;
  *(_QWORD *)(v6 + 408) = v14;
  *(_QWORD *)(v6 + 416) = v21;
  *(_BYTE *)(v6 + 448) = 1;
  v22 = (void *)*MEMORY[0x24BDE8F50];
  *(_QWORD *)(v6 + 504) = v10;
  *(_QWORD *)(v6 + 472) = v14;
  *(_QWORD *)(v6 + 480) = v22;
  v23 = v8;
  v24 = v9;
  v25 = v11;
  v26 = v12;
  v27 = v13;
  v28 = v16;
  sub_20E52F7E4(a1, a2);
  v29 = v18;
  v30 = v19;
  v31 = v21;
  v32 = v22;
  v33 = objc_msgSend(v63, sel_isForTesting);
  v34 = 0xD000000000000019;
  if (v33)
    v34 = 0xD000000000000021;
  v35 = 0x800000020E566C70;
  *(_QWORD *)(v6 + 536) = MEMORY[0x24BEE0D00];
  if (v33)
    v35 = 0x800000020E566C90;
  *(_QWORD *)(v6 + 512) = v34;
  *(_QWORD *)(v6 + 520) = v35;
  sub_20E53D644(0, &qword_254A29888);
  v36 = sub_20E557368();
  if (a3)
  {
    v37 = v32;
    v38 = (void *)sub_20E5572A8();
    -[NSObject __swift_setObject:forKeyedSubscript:](v36, sel___swift_setObject_forKeyedSubscript_, v38, v37);

  }
  result = 0;
  v39 = SecItemCopyMatching((CFDictionaryRef)v36, &result);
  if (v39)
  {
    v40 = v39;
    if (qword_254A28EE8 != -1)
      swift_once();
    v41 = sub_20E55720C();
    __swift_project_value_buffer(v41, (uint64_t)qword_254A2AA10);
    v42 = sub_20E5571F4();
    v43 = sub_20E557374();
    if (os_log_type_enabled(v42, v43))
    {
      v44 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v44 = 67240192;
      LODWORD(v66[0]) = v40;
      sub_20E5573C8();
      _os_log_impl(&dword_20E4D9000, v42, v43, "Could not fetch passkey: %{public}d", v44, 8u);
      v45 = v44;
LABEL_26:
      MEMORY[0x212BBF364](v45, -1, -1);
      v59 = v36;
      goto LABEL_27;
    }
LABEL_22:
    v59 = v42;
    v42 = v36;
LABEL_27:

    v52 = swift_unknownObjectRelease();
    v47 = 0;
    v48 = 0;
    v49 = 0;
    v50 = 0;
    v51 = 0;
    goto LABEL_28;
  }
  if (!result)
  {
LABEL_16:
    if (qword_254A28EE8 != -1)
      swift_once();
    v53 = sub_20E55720C();
    __swift_project_value_buffer(v53, (uint64_t)qword_254A2AA10);
    v42 = sub_20E5571F4();
    v54 = sub_20E557374();
    if (!os_log_type_enabled(v42, v54))
      goto LABEL_22;
    v55 = (uint8_t *)swift_slowAlloc();
    v56 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v55 = 138477827;
    swift_beginAccess();
    if (result)
    {
      swift_unknownObjectRetain();
      objc_opt_self();
      v57 = swift_dynamicCastObjCClass();
      if (v57)
      {
        v58 = v57;
        sub_20E5573C8();
LABEL_25:
        *v56 = v58;
        _os_log_impl(&dword_20E4D9000, v42, v54, "Unexpected keychain response: %{private}@", v55, 0xCu);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254A29890);
        swift_arrayDestroy();
        MEMORY[0x212BBF364](v56, -1, -1);
        v45 = v55;
        goto LABEL_26;
      }
      swift_unknownObjectRelease();
    }
    sub_20E5573C8();
    v58 = 0;
    goto LABEL_25;
  }
  swift_unknownObjectRetain();
  objc_opt_self();
  v46 = (void *)swift_dynamicCastObjCClass();
  if (!v46)
  {
    swift_unknownObjectRelease();
    goto LABEL_16;
  }
  sub_20E532700(v46, v66);
  v47 = v66[0];
  v48 = v66[1];
  v49 = v66[2];
  v50 = v66[3];
  v51 = v66[4];

  v52 = swift_unknownObjectRelease();
LABEL_28:
  *a4 = v47;
  a4[1] = v48;
  a4[2] = v49;
  a4[3] = v50;
  a4[4] = v51;
  return v52;
}

_QWORD *sub_20E54C728(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254A29918);
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
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v13 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
      {
LABEL_15:
        if (v10 != a4 || v13 >= &a4[2 * v8 + 4])
          memmove(v13, a4 + 4, 16 * v8);
        a4[2] = 0;
        goto LABEL_24;
      }
    }
    sub_20E54DC6C(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_20E54C834(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

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
      __swift_instantiateConcreteTypeFromMangledName(&qword_254A298A8);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
      v12 = (_QWORD *)(MEMORY[0x24BEE4AF8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_20E54E0A8(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

unint64_t sub_20E54C954(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  id v6;
  char v7;
  uint64_t v8;
  id v9;
  char v10;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    sub_20E53D644(0, (unint64_t *)&qword_254A291F0);
    v6 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
    v7 = sub_20E5573B0();

    if ((v7 & 1) == 0)
    {
      v8 = ~v4;
      for (i = (i + 1) & v8; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v8)
      {
        v9 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v10 = sub_20E5573B0();

        if ((v10 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

unint64_t sub_20E54CA6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  i = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0)
  {
    type metadata accessor for CFString(0);
    v6 = *(void **)(*(_QWORD *)(v2 + 48) + 8 * i);
    sub_20E52F974(&qword_254A29910, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20E55EB24);
    v7 = v6;
    v8 = sub_20E556E1C();

    if ((v8 & 1) == 0)
    {
      v9 = ~v4;
      for (i = (i + 1) & v9; ((*(_QWORD *)(v3 + ((i >> 3) & 0xFFFFFFFFFFFFF8)) >> i) & 1) != 0; i = (i + 1) & v9)
      {
        v10 = *(id *)(*(_QWORD *)(v2 + 48) + 8 * i);
        v11 = sub_20E556E1C();

        if ((v11 & 1) != 0)
          break;
      }
    }
  }
  return i;
}

uint64_t sub_20E54CBAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a3 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
    __asm { BR              X8 }
  return a3 & ~v4;
}

unint64_t sub_20E54D53C(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_20E557560() & 1) == 0)
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
      while (!v14 && (sub_20E557560() & 1) == 0);
    }
  }
  return v6;
}

unint64_t sub_20E54D61C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_20E5573A4();
  return sub_20E54C954(a1, v2);
}

unint64_t sub_20E54D64C(uint64_t a1)
{
  uint64_t v2;

  sub_20E5575A8();
  type metadata accessor for CFString(0);
  sub_20E52F974(&qword_254A29910, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20E55EB24);
  sub_20E556E28();
  v2 = sub_20E5575C0();
  return sub_20E54CA6C(a1, v2);
}

uint64_t sub_20E54D6D4(uint64_t a1, uint64_t a2)
{
  return sub_20E54D6E8(a1, a2, (void (*)(_BYTE *, uint64_t, uint64_t))MEMORY[0x24BEE0B20], (uint64_t (*)(uint64_t, uint64_t, uint64_t))sub_20E54D53C);
}

uint64_t sub_20E54D6E8(uint64_t a1, uint64_t a2, void (*a3)(_BYTE *, uint64_t, uint64_t), uint64_t (*a4)(uint64_t, uint64_t, uint64_t))
{
  uint64_t v7;
  _BYTE v10[72];

  sub_20E5575A8();
  a3(v10, a1, a2);
  v7 = sub_20E5575C0();
  return a4(a1, a2, v7);
}

void sub_20E54D760(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  __asm { BR              X10 }
}

uint64_t sub_20E54D7C0(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, __int16 a10, char __s2, char a12, char a13, char a14, char a15, char a16, char a17, char a18, char a19, char a20,char a21,char a22,char a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37)
{
  BOOL *v37;
  const void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t result;
  uint64_t v42;
  __int16 v43;
  char v44;
  char v45;
  char v46;
  char v47;

  v42 = v39;
  v43 = v40;
  v44 = BYTE2(v40);
  v45 = BYTE3(v40);
  v46 = BYTE4(v40);
  v47 = BYTE5(v40);
  if (!v38)
  {
    __break(1u);
    JUMPOUT(0x20E54D9A4);
  }
  result = memcmp(v38, &v42, BYTE6(v40));
  *v37 = (_DWORD)result == 0;
  return result;
}

uint64_t sub_20E54D9C8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t i;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  char v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v21;
  id v25;
  void *v26;

  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
    return 0;
  swift_bridgeObjectRetain();
  v25 = (id)objc_opt_self();
  for (i = a1 + 64; ; i += 40)
  {
    v7 = *(_QWORD *)(i - 32);
    v6 = *(_QWORD *)(i - 24);
    v8 = *(_QWORD *)(i - 16);
    sub_20E52F828(v7, v6);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v9 = (void *)sub_20E5572A8();
    v10 = objc_msgSend(v25, sel_cborWithUTF8String_, v9);

    if ((v8 & 0xC000000000000001) != 0)
    {
      v11 = v10;
      v12 = sub_20E5574D0();

      if (!v12)
        goto LABEL_3;
      sub_20E53D644(0, (unint64_t *)&qword_254A291F0);
      swift_unknownObjectRetain();
      swift_dynamicCast();
      v13 = v26;
      swift_unknownObjectRelease();

      if (!v26)
        goto LABEL_4;
    }
    else
    {
      if (!*(_QWORD *)(v8 + 16) || (v14 = sub_20E54D61C((uint64_t)v10), (v15 & 1) == 0))
      {
LABEL_3:

LABEL_4:
        sub_20E52F530(v7, v6);
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
        goto LABEL_5;
      }
      v13 = *(id *)(*(_QWORD *)(v8 + 56) + 8 * v14);

      if (!v13)
        goto LABEL_4;
    }
    v16 = objc_msgSend(v13, sel_string);

    if (!v16)
      goto LABEL_4;
    v17 = sub_20E5572B4();
    v19 = v18;

    if (v17 == a2 && v19 == a3)
      break;
    v21 = sub_20E557560();
    swift_bridgeObjectRelease();
    sub_20E52F530(v7, v6);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v21 & 1) != 0)
      goto LABEL_23;
LABEL_5:
    if (!--v3)
    {
      swift_bridgeObjectRelease();
      return 0;
    }
  }
  swift_bridgeObjectRelease();
  sub_20E52F530(v7, v6);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
LABEL_23:
  swift_bridgeObjectRelease();
  return 1;
}

uint64_t sub_20E54DC6C(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_20E55753C();
  __break(1u);
  return result;
}

uint64_t sub_20E54DD5C(uint64_t a1)
{
  uint64_t inited;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v18;
  _BYTE v19[16];
  __int128 v20;
  __int128 v21;

  sub_20E54E2E4(a1, (uint64_t)v19, &qword_254A298F8);
  sub_20E54E2E4((uint64_t)v19, (uint64_t)&v20, &qword_254A298F8);
  if (*((_QWORD *)&v20 + 1) >> 60 != 15)
  {
    v21 = v20;
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29900);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_20E55F990;
    v3 = (void *)*MEMORY[0x24BDE9558];
    *(_QWORD *)(inited + 32) = *MEMORY[0x24BDE9558];
    *(_OWORD *)(inited + 40) = v21;
    sub_20E54E328((uint64_t)v19);
    sub_20E54E328((uint64_t)v19);
    v4 = v3;
    sub_20E550804(inited);
    type metadata accessor for CFString(0);
    sub_20E52F974(&qword_254A290B0, (uint64_t (*)(uint64_t))type metadata accessor for CFString, (uint64_t)&unk_20E55EB50);
    v5 = (void *)sub_20E557284();
    swift_bridgeObjectRelease();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29908);
    v6 = swift_initStackObject();
    *(_OWORD *)(v6 + 16) = xmmword_20E55F990;
    v7 = (void *)*MEMORY[0x24BDE8FB8];
    *(_QWORD *)(v6 + 32) = *MEMORY[0x24BDE8FB8];
    v18 = *(_QWORD *)(a1 + 16);
    v8 = v7;
    sub_20E54E354((uint64_t)&v18);
    sub_20E53D644(0, (unint64_t *)&qword_254A291F0);
    sub_20E532CA4();
    v9 = (void *)sub_20E557284();
    sub_20E54E19C((uint64_t)&v18);
    v10 = objc_msgSend((id)objc_opt_self(), sel_cborWithDictionary_, v9);

    *(_QWORD *)(v6 + 40) = sub_20E556D98();
    *(_QWORD *)(v6 + 48) = v11;
    sub_20E55091C(v6);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A298F8);
    v12 = (void *)sub_20E557284();
    swift_bridgeObjectRelease();
    if (!SecItemUpdate((CFDictionaryRef)v5, (CFDictionaryRef)v12))
    {

      sub_20E54E37C((uint64_t)v19);
      return 1;
    }
    if (qword_254A28EE8 != -1)
      swift_once();
    v13 = sub_20E55720C();
    __swift_project_value_buffer(v13, (uint64_t)qword_254A2AA10);
    v14 = sub_20E5571F4();
    v15 = sub_20E557374();
    if (os_log_type_enabled(v14, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v16 = 67240192;
      sub_20E5573C8();
      _os_log_impl(&dword_20E4D9000, v14, v15, "Could not update passkey: %{public}d", v16, 8u);
      MEMORY[0x212BBF364](v16, -1, -1);

      sub_20E54E37C((uint64_t)v19);
    }
    else
    {
      sub_20E54E37C((uint64_t)v19);

    }
  }
  return 0;
}

uint64_t sub_20E54E0A8(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_20E55753C();
  __break(1u);
  return result;
}

uint64_t sub_20E54E19C(uint64_t a1)
{
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_20E54E1C4(uint64_t a1)
{
  sub_20E52F828(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20E54E20C(uint64_t a1)
{
  sub_20E52F530(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_20E54E254()
{
  unint64_t result;

  result = qword_254A298E8;
  if (!qword_254A298E8)
  {
    result = MEMORY[0x212BBF2EC](MEMORY[0x24BDCDDC0], MEMORY[0x24BDCDDE8]);
    atomic_store(result, (unint64_t *)&qword_254A298E8);
  }
  return result;
}

unint64_t sub_20E54E298()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A298F0;
  if (!qword_254A298F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A298D8);
    result = MEMORY[0x212BBF2EC](MEMORY[0x24BDC6538], v1);
    atomic_store(result, (unint64_t *)&qword_254A298F0);
  }
  return result;
}

uint64_t sub_20E54E2E4(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_20E54E328(uint64_t a1)
{
  sub_20E52F828(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

uint64_t sub_20E54E354(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_20E54E37C(uint64_t a1)
{
  sub_20E52F530(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  return a1;
}

void sub_20E54E3A8()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v10[9];
  void *v11;

  v1 = sub_20E556E88();
  v10[6] = *(_QWORD *)(v1 - 8);
  v2 = MEMORY[0x24BDAC7A8](v1);
  v10[5] = (char *)v10 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = sub_20E556EAC();
  v10[7] = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x24BDAC7A8](v4);
  MEMORY[0x24BDAC7A8](v5);
  v10[8] = (char *)v10 - v6;
  v11 = v0;
  v7 = objc_msgSend(v0, sel_clientDataHash);
  sub_20E556DBC();
  v9 = v8;

  __asm { BR              X10 }
}

void sub_20E54E4D8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *boxed_opaque_existential_0;
  id v19;
  void *v20;
  void *v21;
  uint64_t inited;
  uint64_t v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, uint64_t);

  sub_20E52F4EC(v4, v3);
  if (BYTE6(v3) != sub_20E55726C())
  {
    sub_20E5572B4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29920);
    inited = swift_initStackObject();
    *(_OWORD *)(inited + 16) = xmmword_20E55F990;
    *(_QWORD *)(inited + 32) = sub_20E5572B4();
    *(_QWORD *)(inited + 40) = v23;
    *(_QWORD *)(v8 - 184) = 0;
    *(_QWORD *)(v8 - 176) = 0xE000000000000000;
    sub_20E557440();
    v24 = *(_QWORD *)(v8 - 176);
    *(_QWORD *)(v8 - 184) = *(_QWORD *)(v8 - 184);
    *(_QWORD *)(v8 - 176) = v24;
    sub_20E5572D8();
    *(_QWORD *)(v8 - 72) = sub_20E55726C();
    sub_20E557554();
    sub_20E5572D8();
    swift_bridgeObjectRelease();
    sub_20E5572D8();
    v25 = objc_msgSend(*(id *)(v0 + 80), *(SEL *)(v5 + 1064));
    sub_20E556DBC();
    v27 = v26;

    __asm { BR              X10 }
  }
  v9 = *(void **)(v0 + 80);
  v10 = objc_msgSend(v9, sel_authenticatorData);
  sub_20E556DBC();

  v11 = *(_QWORD *)(v0 + 72);
  sub_20E556E40();
  *(_QWORD *)(v0 + 72) = v11;
  if (v11)
  {
    sub_20E5572B4();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29920);
    v12 = swift_initStackObject();
    *(_OWORD *)(v12 + 16) = xmmword_20E55F9A0;
    *(_QWORD *)(v12 + 32) = sub_20E5572B4();
    *(_QWORD *)(v12 + 40) = v13;
    *(_QWORD *)(v12 + 72) = MEMORY[0x24BEE0D00];
    *(_QWORD *)(v12 + 48) = 0xD00000000000001ALL;
    *(_QWORD *)(v12 + 56) = 0x800000020E566E00;
    *(_QWORD *)(v12 + 80) = sub_20E5572B4();
    *(_QWORD *)(v12 + 88) = v14;
    v15 = *(void **)(v0 + 72);
    swift_getErrorValue();
    v16 = *(_QWORD *)(v0 + 88);
    v17 = *(_QWORD *)(v0 + 96);
    *(_QWORD *)(v12 + 120) = v17;
    boxed_opaque_existential_0 = __swift_allocate_boxed_opaque_existential_0((uint64_t *)(v12 + 96));
    (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(boxed_opaque_existential_0, v16, v17);
    sub_20E550A34(v12);
    v19 = objc_allocWithZone(MEMORY[0x24BDD1540]);
    v20 = (void *)sub_20E5572A8();
    swift_bridgeObjectRelease();
    v21 = (void *)sub_20E557284();
    swift_bridgeObjectRelease();
    objc_msgSend(v19, sel_initWithDomain_code_userInfo_, v20, 1002, v21);

    swift_willThrow();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(*(_QWORD *)(v0 + 56) + 32))(*(_QWORD *)(v0 + 64), v1, v7);
    v28 = objc_msgSend(v9, sel_relyingParty);
    *(_QWORD *)(v0 + 80) = sub_20E5572B4();
    *(_QWORD *)(v0 + 24) = v29;

    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29928);
    v30 = *(unsigned __int8 *)(*(_QWORD *)(v0 + 48) + 80);
    *(_QWORD *)(v0 + 32) = v6;
    *(_QWORD *)(v0 + 16) = v30 | 7;
    v31 = swift_allocObject();
    *(_OWORD *)(v31 + 16) = xmmword_20E55F9B0;
    sub_20E556E64();
    sub_20E556E7C();
    sub_20E556E58();
    *(_QWORD *)(v8 - 184) = v31;
    sub_20E54F1A8();
    __swift_instantiateConcreteTypeFromMangledName(&qword_254A29930);
    sub_20E54F1F0();
    *(_QWORD *)(v0 + 8) = v7;
    sub_20E5573F8();
    v32 = swift_allocObject();
    *(_OWORD *)(v32 + 16) = xmmword_20E55F990;
    v33 = *(_QWORD *)(v0 + 32);
    sub_20E556E4C();
    *(_QWORD *)(v8 - 184) = v32;
    v34 = *(_QWORD *)(v0 + 64);
    v35 = *(_QWORD *)(v0 + 40);
    sub_20E5573F8();
    sub_20E556EA0();
    swift_bridgeObjectRelease();
    v36 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 48) + 8);
    v36(v35, v2);
    v36(v33, v2);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 56) + 8))(v34, *(_QWORD *)(v0 + 8));
  }
}

id ASPasskeyAssertionCredential.init(userHandle:relyingParty:signature:clientDataHash:authenticatorData:credentialID:extensionOutput:)(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, unint64_t a12, void **a13)
{
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  char *v23;
  void *v24;
  id v25;
  void *v28;
  void *v29;
  void *v30;
  unint64_t v31;
  uint64_t v32;
  unint64_t v34;

  v17 = *a13;
  v30 = (void *)sub_20E556DA4();
  v29 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v32 = a5;
  v34 = a6;
  v28 = (void *)sub_20E556DA4();
  v31 = a8;
  v18 = (void *)sub_20E556DA4();
  v19 = (void *)sub_20E556DA4();
  v20 = (void *)sub_20E556DA4();
  if (v17)
  {
    v21 = objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionOutput);
    v22 = v17;
    v23 = (char *)objc_msgSend(v21, sel_init);
    v24 = *(void **)&v23[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
    *(_QWORD *)&v23[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v22;

  }
  else
  {
    v23 = 0;
  }
  v25 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithUserHandle_relyingParty_signature_clientDataHash_authenticatorData_credentialID_extensionOutput_, v30, v29, v28, v18, v19, v20, v23);
  sub_20E52F4EC(a11, a12);
  sub_20E52F4EC(a9, a10);
  sub_20E52F4EC(a7, v31);
  sub_20E52F4EC(v32, v34);
  sub_20E52F4EC(a1, a2);

  return v25;
}

void ASPasskeyAssertionCredential.extensionOutput.getter(_QWORD *a1@<X8>)
{
  void *v1;
  id v3;
  char *v4;
  void *v5;

  v3 = objc_msgSend(v1, sel_extensionOutput);

  if (!v3)
    goto LABEL_4;
  v4 = (char *)objc_msgSend(v1, sel_extensionOutput);
  if (v4)
  {
    v5 = v4;
    v3 = *(id *)&v4[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];

LABEL_4:
    *a1 = v3;
    return;
  }
  __break(1u);
}

void ASPasskeyAssertionCredential.extensionOutput.setter(void **a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  char *v5;
  void *v6;
  id v7;

  v2 = *a1;
  if (*a1)
  {
    v3 = objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionOutput);
    v4 = v2;
    v5 = (char *)objc_msgSend(v3, sel_init);
    v6 = *(void **)&v5[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
    v7 = v5;
    *(_QWORD *)&v5[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v4;

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v1, sel_setExtensionOutput_, v7);

}

void (*ASPasskeyAssertionCredential.extensionOutput.modify(_QWORD *a1))(void **a1, char a2)
{
  void *v1;
  id v3;
  void (*result)(void **, char);
  void (*v5)(void **, char);

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_extensionOutput);

  if (!v3)
    goto LABEL_4;
  result = (void (*)(void **, char))objc_msgSend(v1, sel_extensionOutput);
  if (result)
  {
    v5 = result;
    v3 = *(id *)((char *)result + OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions);

LABEL_4:
    *a1 = v3;
    return sub_20E54EFE8;
  }
  __break(1u);
  return result;
}

void sub_20E54EFE8(void **a1, char a2)
{
  void *v3;
  id v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  void *v11;
  id v12;

  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionOutput);
      v5 = v3;
      v6 = (char *)objc_msgSend(v4, sel_init);
      v7 = *(void **)&v6[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
      v12 = v6;
      *(_QWORD *)&v6[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v5;

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(a1[1], sel_setExtensionOutput_, v12);

  }
  else if (v3)
  {
    v8 = objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionOutput);
    v9 = v3;
    v10 = (char *)objc_msgSend(v8, sel_init);
    v11 = *(void **)&v10[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions];
    v12 = v10;
    *(_QWORD *)&v10[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionOutput_coreExtensions] = v9;

    objc_msgSend(a1[1], sel_setExtensionOutput_, v12);
  }
  else
  {
    v12 = 0;
    objc_msgSend(a1[1], sel_setExtensionOutput_, 0);
  }

}

void sub_20E54F0FC(_QWORD *a1@<X8>)
{
  uint64_t v2;

  ASPasskeyAssertionCredential.extensionOutput.getter(&v2);
  *a1 = v2;
}

void sub_20E54F134(void **a1)
{
  id v1;
  void *v2;

  v2 = *a1;
  v1 = v2;
  ASPasskeyAssertionCredential.extensionOutput.setter(&v2);
}

uint64_t *__swift_allocate_boxed_opaque_existential_0(uint64_t *a1)
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

unint64_t sub_20E54F1A8()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A298C8;
  if (!qword_254A298C8)
  {
    v1 = sub_20E556E88();
    result = MEMORY[0x212BBF2EC](MEMORY[0x24BE0AEA8], v1);
    atomic_store(result, (unint64_t *)&qword_254A298C8);
  }
  return result;
}

unint64_t sub_20E54F1F0()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254A29938;
  if (!qword_254A29938)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254A29930);
    result = MEMORY[0x212BBF2EC](MEMORY[0x24BEE12C8], v1);
    atomic_store(result, (unint64_t *)&qword_254A29938);
  }
  return result;
}

id ASPasskeyCredentialIdentity.init(relyingPartyIdentifier:userName:credentialID:userHandle:recordIdentifier:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v14 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v15 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v16 = (void *)sub_20E556DA4();
  v17 = (void *)sub_20E556DA4();
  if (a10)
  {
    v18 = (void *)sub_20E5572A8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v18 = 0;
  }
  v19 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRelyingPartyIdentifier_userName_credentialID_userHandle_recordIdentifier_, v14, v15, v16, v17, v18);
  sub_20E52F4EC(a7, a8);
  sub_20E52F4EC(a5, a6);

  return v19;
}

uint64_t ASPasskeyRegistrationCredentialExtensionInput.largeBlob.getter@<X0>(char *a1@<X8>)
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
  uint64_t result;
  char v17;
  int v18;
  uint64_t v20;

  v2 = sub_20E557104();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v20 - v7;
  v9 = sub_20E557128();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x24BDAC7A8](v9);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29940);
  MEMORY[0x24BDAC7A8](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E557134();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v15, 1, v9))
  {
    result = sub_20E52E370((uint64_t)v15, (uint64_t *)&unk_254A29940);
    v17 = 2;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v12, v15, v9);
    sub_20E52E370((uint64_t)v15, (uint64_t *)&unk_254A29940);
    sub_20E55711C();
    (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v6, v8, v2);
    v18 = (*(uint64_t (**)(char *, uint64_t))(v3 + 88))(v6, v2);
    if (v18 != *MEMORY[0x24BE0B0D8] && v18 != *MEMORY[0x24BE0B0E0])
    {
      result = sub_20E5574F4();
      __break(1u);
      return result;
    }
    v17 = v18 != *MEMORY[0x24BE0B0D8];
    (*(void (**)(char *, uint64_t))(v3 + 8))(v8, v2);
    result = (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  }
  *a1 = v17;
  return result;
}

uint64_t ASPasskeyRegistrationCredentialExtensionInput.prf.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  unsigned __int8 v25;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_20E5570E0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v22 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A29950);
  MEMORY[0x24BDAC7A8](v9);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20E5570EC();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v6 + 48))(v11, 1, v5))
  {
    result = sub_20E52E370((uint64_t)v11, &qword_254A29950);
    *(_QWORD *)a1 = 2;
    *(_OWORD *)(a1 + 8) = 0u;
    *(_OWORD *)(a1 + 24) = 0u;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v6 + 16))(v8, v11, v5);
    sub_20E52E370((uint64_t)v11, &qword_254A29950);
    v24 = sub_20E5570D4();
    sub_20E5570BC();
    v13 = sub_20E556F78();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v4, 1, v13) == 1)
    {
      sub_20E52E370((uint64_t)v4, &qword_254A28F00);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0xF000000000000000;
    }
    else
    {
      v23 = sub_20E556F48();
      v18 = v19;
      v16 = sub_20E556F54();
      v17 = v20;
      v21 = v4;
      v15 = v23;
      (*(void (**)(char *, uint64_t))(v14 + 8))(v21, v13);
    }
    v25 = v24 & 1;
    result = (*(uint64_t (**)(char *, uint64_t))(v6 + 8))(v8, v5);
    *(_QWORD *)a1 = v25;
    *(_QWORD *)(a1 + 8) = v15;
    *(_QWORD *)(a1 + 16) = v18;
    *(_QWORD *)(a1 + 24) = v16;
    *(_QWORD *)(a1 + 32) = v17;
  }
  return result;
}

uint64_t ASPasskeyRegistrationCredentialExtensionInput.init(coreExtensions:)@<X0>(uint64_t result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = result;
  return result;
}

void __swiftcall ASPasskeyRegistrationCredentialExtensionInput.toObjC()(ASPasskeyRegistrationCredentialExtensionInput *__return_ptr retstr)
{
  _QWORD *v1;

  if (!objc_msgSend(objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionInput), sel_initWithCoreExtensions_, *v1))__break(1u);
}

uint64_t static ASPasskeyRegistrationCredentialExtensionInput.supportsSecureCoding.getter()
{
  return 1;
}

id sub_20E54F838()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id result;
  int v17;
  uint64_t v18;
  uint64_t v19;

  v1 = sub_20E557104();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (char *)&v19 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v19 - v6;
  v8 = sub_20E557128();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A29940);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v19 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = *(id *)(v0 + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions);
  sub_20E557134();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
  {
    sub_20E52E370((uint64_t)v14, (uint64_t *)&unk_254A29940);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_20E52E370((uint64_t)v14, (uint64_t *)&unk_254A29940);
  sub_20E55711C();
  (*(void (**)(char *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v17 = (*(uint64_t (**)(char *, uint64_t))(v2 + 88))(v5, v1);
  if (v17 == *MEMORY[0x24BE0B0D8])
  {
    v18 = 0;
  }
  else
  {
    if (v17 != *MEMORY[0x24BE0B0E0])
    {
      result = (id)sub_20E5574F4();
      __break(1u);
      return result;
    }
    v18 = 1;
  }
  (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
  return objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialLargeBlobRegistrationInput), sel_initWithSupportRequirement_, v18);
}

void __swiftcall ASPasskeyRegistrationCredentialExtensionInput.init(coder:)(ASPasskeyRegistrationCredentialExtensionInput_optional *__return_ptr retstr, NSCoder coder)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCoder_, coder.super.isa);

}

id ASPasskeyRegistrationCredentialExtensionInput.init(coder:)(void *a1)
{
  void *v1;
  void *v2;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = v1;
  sub_20E55714C();
  v4 = (void *)sub_20E557398();
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v2, sel_initWithCoreExtensions_, v5);

    v7 = v6;
    if (v7)

  }
  else
  {

    swift_getObjectType();
    swift_deallocPartialClassInstance();
    return 0;
  }
  return v7;
}

Swift::Void __swiftcall ASPasskeyRegistrationCredentialExtensionInput.encode(with:)(NSCoder with)
{
  uint64_t v1;
  id v3;
  id v4;

  v3 = *(id *)(v1 + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions);
  v4 = (id)sub_20E5572A8();
  -[objc_class encodeObject:forKey:](with.super.isa, sel_encodeObject_forKey_, v3, v4);

}

void __swiftcall ASPasskeyRegistrationCredentialExtensionInput.init()(ASPasskeyRegistrationCredentialExtensionInput *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id ASPasskeyRegistrationCredentialExtensionInput.init()()
{
  char *v0;
  uint64_t v1;
  id v2;
  char *v3;
  objc_super v5;

  v1 = OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions;
  v2 = objc_allocWithZone((Class)sub_20E55714C());
  v3 = v0;
  *(_QWORD *)&v0[v1] = objc_msgSend(v2, sel_init);

  v5.receiver = v3;
  v5.super_class = (Class)ASPasskeyRegistrationCredentialExtensionInput;
  return objc_msgSendSuper2(&v5, sel_init);
}

ValueMetadata *type metadata accessor for ASPasskeyRegistrationCredentialExtensionInput()
{
  return &type metadata for ASPasskeyRegistrationCredentialExtensionInput;
}

unint64_t type metadata accessor for ASPasskeyRegistrationCredentialExtensionInput()
{
  unint64_t result;

  result = qword_254A29990;
  if (!qword_254A29990)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A29990);
  }
  return result;
}

id ASPasskeyCredentialRequest.init(credentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:)(void *a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5)
{
  id v10;
  void *v11;
  void *v12;
  id v13;

  v10 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  v11 = (void *)sub_20E556DA4();
  sub_20E54FFF4(a5);
  swift_bridgeObjectRelease();
  sub_20E5500D0();
  v12 = (void *)sub_20E5572F0();
  swift_bridgeObjectRelease();
  v13 = objc_msgSend(v10, sel_initWithCredentialIdentity_clientDataHash_userVerificationPreference_supportedAlgorithms_, a1, v11, a4, v12);

  sub_20E52F4EC(a2, a3);
  return v13;
}

uint64_t sub_20E54FFF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  v2 = *(_QWORD *)(a1 + 16);
  result = MEMORY[0x24BEE4AF8];
  if (v2)
  {
    v5 = MEMORY[0x24BEE4AF8];
    sub_20E557494();
    v4 = a1 + 32;
    type metadata accessor for ASCOSEAlgorithmIdentifier(0);
    sub_20E5500D0();
    do
    {
      v4 += 8;
      swift_dynamicCast();
      sub_20E55747C();
      sub_20E5574A0();
      sub_20E5574AC();
      sub_20E557488();
      --v2;
    }
    while (v2);
    return v5;
  }
  return result;
}

unint64_t sub_20E5500D0()
{
  unint64_t result;

  result = qword_254A299A0;
  if (!qword_254A299A0)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254A299A0);
  }
  return result;
}

uint64_t sub_20E55010C(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void **i;
  void *v10;
  id v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_20E557500();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  }
  v3 = MEMORY[0x24BEE4AF8];
  if (!v2)
    return v3;
  v17 = MEMORY[0x24BEE4AF8];
  result = sub_20E5474D0(0, v2 & ~(v2 >> 63), 0);
  if (v2 < 0)
  {
    __break(1u);
  }
  else
  {
    v3 = v17;
    if ((a1 & 0xC000000000000001) == 0)
    {
      for (i = (void **)(a1 + 32); ; ++i)
      {
        v10 = *i;
        v15 = 0;
        v16 = 1;
        v11 = v10;
        result = MEMORY[0x212BBE74C]();
        if (v16 == 1)
          break;
        v12 = v15;

        v17 = v3;
        v14 = *(_QWORD *)(v3 + 16);
        v13 = *(_QWORD *)(v3 + 24);
        if (v14 >= v13 >> 1)
        {
          sub_20E5474D0(v13 > 1, v14 + 1, 1);
          v3 = v17;
        }
        *(_QWORD *)(v3 + 16) = v14 + 1;
        *(_QWORD *)(v3 + 8 * v14 + 32) = v12;
        if (!--v2)
          return v3;
      }
      goto LABEL_21;
    }
    v5 = 0;
    while (1)
    {
      MEMORY[0x212BBE86C](v5, a1);
      v15 = 0;
      v16 = 1;
      result = MEMORY[0x212BBE74C]();
      if (v16 == 1)
        break;
      v6 = v15;
      swift_unknownObjectRelease();
      v17 = v3;
      v8 = *(_QWORD *)(v3 + 16);
      v7 = *(_QWORD *)(v3 + 24);
      if (v8 >= v7 >> 1)
      {
        sub_20E5474D0(v7 > 1, v8 + 1, 1);
        v3 = v17;
      }
      ++v5;
      *(_QWORD *)(v3 + 16) = v8 + 1;
      *(_QWORD *)(v3 + 8 * v8 + 32) = v6;
      if (v2 == v5)
        return v3;
    }
  }
  __break(1u);
LABEL_21:
  __break(1u);
  return result;
}

id ASPasskeyCredentialRequest.init(credentialIdentity:clientDataHash:userVerificationPreference:supportedAlgorithms:extensionInput:)(void *a1, uint64_t a2, unint64_t a3, void *a4, uint64_t a5, void **a6)
{
  void *v11;
  void *v12;
  void *v13;
  id result;
  void *v15;
  id v16;

  v11 = *a6;
  v12 = (void *)sub_20E556DA4();
  sub_20E54FFF4(a5);
  swift_bridgeObjectRelease();
  sub_20E5500D0();
  v13 = (void *)sub_20E5572F0();
  swift_bridgeObjectRelease();
  if (!v11)
  {
    v15 = 0;
    goto LABEL_5;
  }
  result = objc_msgSend(objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionInput), sel_initWithCoreExtensions_, v11);
  if (result)
  {
    v15 = result;

LABEL_5:
    v16 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCredentialIdentity_clientDataHash_userVerificationPreference_supportedAlgorithms_registrationExtensionInput_, a1, v12, a4, v13, v15);

    sub_20E52F4EC(a2, a3);
    return v16;
  }
  __break(1u);
  return result;
}

{
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v11 = *a6;
  v12 = (void *)sub_20E556DA4();
  sub_20E54FFF4(a5);
  swift_bridgeObjectRelease();
  sub_20E5500D0();
  v13 = (void *)sub_20E5572F0();
  swift_bridgeObjectRelease();
  if (v11)
  {
    v14 = objc_msgSend(objc_allocWithZone((Class)ASPasskeyAssertionCredentialExtensionInput), sel_initWithCoreExtensions_, v11);

  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithCredentialIdentity_clientDataHash_userVerificationPreference_supportedAlgorithms_assertionExtensionInput_, a1, v12, a4, v13, v14);

  sub_20E52F4EC(a2, a3);
  return v15;
}

uint64_t ASPasskeyCredentialRequest.supportedAlgorithms.getter()
{
  void *v0;
  id v1;
  unint64_t v2;
  uint64_t v3;

  v1 = objc_msgSend(v0, sel_supportedAlgorithms);
  sub_20E5500D0();
  v2 = sub_20E5572FC();

  v3 = sub_20E55010C(v2);
  swift_bridgeObjectRelease();
  return v3;
}

void ASPasskeyCredentialRequest.extensionInput.getter(_QWORD *a1@<X8>)
{
  void *v1;
  char *v3;
  void *v4;
  id v5;
  char *v6;
  void *v7;
  unint64_t v8;

  v3 = (char *)objc_msgSend(v1, sel_assertionExtensionInput);
  if (v3)
  {
    v4 = v3;
    v5 = *(id *)&v3[OBJC_IVAR___ASPasskeyAssertionCredentialExtensionInput_coreExtensions];

  }
  else
  {
    v6 = (char *)objc_msgSend(v1, sel_registrationExtensionInput);
    if (v6)
    {
      v7 = v6;
      v8 = (unint64_t)*(id *)&v6[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionInput_coreExtensions];

      v5 = (id)(v8 | 0x4000000000000000);
    }
    else
    {
      v5 = (id)0x8000000000000000;
    }
  }
  *a1 = v5;
}

_QWORD *initializeBufferWithCopyOfBuffer for ASPasskeyCredentialExtensionInput(_QWORD *a1, _QWORD *a2)
{
  void *v3;
  id v4;

  v3 = (void *)(*a2 & 0x3FFFFFFFFFFFFFFFLL);
  *a1 = *a2;
  v4 = v3;
  return a1;
}

void destroy for ASPasskeyCredentialExtensionInput(_QWORD *a1)
{

}

uint64_t *assignWithCopy for ASPasskeyCredentialExtensionInput(uint64_t *a1, uint64_t *a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = (void *)(*a2 & 0x3FFFFFFFFFFFFFFFLL);
  v4 = *a1;
  *a1 = *a2;
  v5 = (void *)(v4 & 0x3FFFFFFFFFFFFFFFLL);
  v6 = v3;

  return a1;
}

_QWORD *__swift_memcpy8_8(_QWORD *result, _QWORD *a2)
{
  *result = *a2;
  return result;
}

uint64_t *assignWithTake for ASPasskeyCredentialExtensionInput(uint64_t *a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = *a1;
  *a1 = *a2;

  return a1;
}

uint64_t getEnumTagSinglePayload for ASPasskeyCredentialExtensionInput(uint64_t a1, unsigned int a2)
{
  unsigned int v3;

  if (!a2)
    return 0;
  if (a2 >= 0x7E && *(_BYTE *)(a1 + 8))
    return (*(_DWORD *)a1 + 126);
  v3 = (((*(_QWORD *)a1 >> 57) >> 5) | (4 * ((*(_QWORD *)a1 >> 57) & 0x18 | *(_QWORD *)a1 & 7))) ^ 0x7F;
  if (v3 >= 0x7D)
    v3 = -1;
  return v3 + 1;
}

uint64_t storeEnumTagSinglePayload for ASPasskeyCredentialExtensionInput(uint64_t result, unsigned int a2, unsigned int a3)
{
  uint64_t v3;

  if (a2 > 0x7D)
  {
    *(_QWORD *)result = a2 - 126;
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 1;
  }
  else
  {
    if (a3 >= 0x7E)
      *(_BYTE *)(result + 8) = 0;
    if (a2)
    {
      v3 = (-a2 >> 2) & 0x1F | (32 * (-a2 & 0x7F));
      *(_QWORD *)result = (v3 | (v3 << 57)) & 0xF000000000000007;
    }
  }
  return result;
}

uint64_t sub_20E550798(_QWORD *a1)
{
  uint64_t v1;

  v1 = *a1 >> 62;
  if (v1 <= 1)
    return v1;
  else
    return (*a1 >> 3) + 2;
}

_QWORD *sub_20E5507B4(_QWORD *result)
{
  *result &= 0x3FFFFFFFFFFFFFFFuLL;
  return result;
}

unint64_t *sub_20E5507C4(unint64_t *result, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;

  if (a2 < 2)
  {
    v2 = *result & 0xFFFFFFFFFFFFFF8;
    v3 = a2 << 62;
  }
  else
  {
    v2 = 8 * (a2 - 2);
    v3 = 0x8000000000000000;
  }
  *result = v2 | v3;
  return result;
}

ValueMetadata *type metadata accessor for ASPasskeyCredentialExtensionInput()
{
  return &type metadata for ASPasskeyCredentialExtensionInput;
}

unint64_t sub_20E550804(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_254A299C0);
  v2 = (_QWORD *)sub_20E557530();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = (id)*(v4 - 2);
    sub_20E52F7E4(v5, v6);
    result = sub_20E54D64C((uint64_t)v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v7;
    v10 = (uint64_t *)(v2[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_20E55091C(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t *v4;
  uint64_t v5;
  unint64_t v6;
  id v7;
  unint64_t result;
  char v9;
  uint64_t *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A299B8);
  v2 = (_QWORD *)sub_20E557530();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (unint64_t *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = (id)*(v4 - 2);
    sub_20E52F828(v5, v6);
    result = sub_20E54D64C((uint64_t)v7);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    *(_QWORD *)(v2[6] + 8 * result) = v7;
    v10 = (uint64_t *)(v2[7] + 16 * result);
    *v10 = v5;
    v10[1] = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
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

unint64_t sub_20E550A34(uint64_t a1)
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
    v3 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A299A8);
  v2 = sub_20E557530();
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
    sub_20E551A3C(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_20E54D6D4(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_20E551A84(&v17, (_OWORD *)(v3[7] + 32 * result));
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

void sub_20E550B5C()
{
  void *v0;
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
  id v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;

  v16 = sub_20E556E88();
  v20 = *(_QWORD *)(v16 - 8);
  v1 = MEMORY[0x24BDAC7A8](v16);
  v15[3] = (char *)v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v1);
  v15[4] = (char *)v15 - v3;
  v18 = sub_20E556EAC();
  v21 = *(_QWORD *)(v18 - 8);
  v4 = MEMORY[0x24BDAC7A8](v18);
  MEMORY[0x24BDAC7A8](v4);
  v17 = (char *)v15 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298C0);
  MEMORY[0x24BDAC7A8](v6);
  v23 = (char *)v15 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_20E556F24();
  v9 = MEMORY[0x24BDAC7A8](v8);
  v19 = (char *)v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v9);
  v22 = (char *)v15 - v11;
  v12 = objc_msgSend(v0, sel_attestationObject);
  sub_20E556DBC();
  v14 = v13;

  __asm { BR              X10 }
}

uint64_t sub_20E550D24()
{
  void *v0;
  unint64_t v1;
  uint64_t v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;

  sub_20E52F4EC(v2, v1);
  if (BYTE6(v1))
  {
    v3 = objc_msgSend(v0, sel_clientDataHash);
    sub_20E556DBC();
    v5 = v4;

    __asm { BR              X10 }
  }
  sub_20E5572B4();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A29920);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20E55F990;
  *(_QWORD *)(inited + 32) = sub_20E5572B4();
  *(_QWORD *)(inited + 40) = v7;
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = 0xD000000000000043;
  *(_QWORD *)(inited + 56) = 0x800000020E566ED0;
  sub_20E550A34(inited);
  v8 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v9 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v10 = (void *)sub_20E557284();
  swift_bridgeObjectRelease();
  objc_msgSend(v8, sel_initWithDomain_code_userInfo_, v9, 1002, v10);

  return swift_willThrow();
}

uint64_t sub_20E5519FC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A298C0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20E551A3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A299B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_20E551A84(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t ASCredentialIdentityStore.credentialIdentities(forService:credentialIdentityTypes:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;

  v3[17] = a2;
  v3[18] = v2;
  v3[16] = a1;
  return swift_task_switch();
}

uint64_t sub_20E551AB0()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  v2 = v0[17];
  v1 = (void *)v0[18];
  v3 = v0[16];
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_20E551B58;
  v4 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v5 = v0 + 10;
  v5[1] = 0x40000000;
  v5[2] = sub_20E551BB0;
  v5[3] = &block_descriptor_0;
  v5[4] = v4;
  objc_msgSend(v1, sel_getCredentialIdentitiesForService_credentialIdentityTypes_completionHandler_, v3, v2, v5);
  return swift_continuation_await();
}

uint64_t sub_20E551B58()
{
  return swift_task_switch();
}

uint64_t sub_20E551BA4()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 120));
}

uint64_t sub_20E551BB0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(a1 + 32);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254A299D8);
  **(_QWORD **)(*(_QWORD *)(v1 + 64) + 40) = sub_20E5572FC();
  return swift_continuation_resume();
}

id ASPasskeyRegistrationCredential.init(relyingParty:clientDataHash:credentialID:attestationObject:extensionOutput:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, void **a9)
{
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  char *v20;
  void *v21;
  id v22;
  void *v24;
  unint64_t v25;
  void *v26;

  v15 = *a9;
  v16 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v25 = a4;
  v17 = (void *)sub_20E556DA4();
  v26 = (void *)sub_20E556DA4();
  v24 = (void *)sub_20E556DA4();
  if (v15)
  {
    v18 = objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionOutput);
    v19 = v15;
    v20 = (char *)objc_msgSend(v18, sel_init);
    v21 = *(void **)&v20[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
    *(_QWORD *)&v20[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v19;

  }
  else
  {
    v20 = 0;
  }
  v22 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRelyingParty_clientDataHash_credentialID_attestationObject_extensionOutput_, v16, v17, v26, v24, v20);
  sub_20E52F4EC(a7, a8);
  sub_20E52F4EC(a5, a6);
  sub_20E52F4EC(a3, v25);

  return v22;
}

void ASPasskeyRegistrationCredential.extensionOutput.getter(_QWORD *a1@<X8>)
{
  void *v1;
  id v3;
  char *v4;
  void *v5;

  v3 = objc_msgSend(v1, sel_extensionOutput);

  if (!v3)
    goto LABEL_4;
  v4 = (char *)objc_msgSend(v1, sel_extensionOutput);
  if (v4)
  {
    v5 = v4;
    v3 = *(id *)&v4[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];

LABEL_4:
    *a1 = v3;
    return;
  }
  __break(1u);
}

void ASPasskeyRegistrationCredential.extensionOutput.setter(void **a1)
{
  void *v1;
  void *v2;
  id v3;
  id v4;
  char *v5;
  void *v6;
  id v7;

  v2 = *a1;
  if (*a1)
  {
    v3 = objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionOutput);
    v4 = v2;
    v5 = (char *)objc_msgSend(v3, sel_init);
    v6 = *(void **)&v5[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
    v7 = v5;
    *(_QWORD *)&v5[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v4;

  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v1, sel_setExtensionOutput_, v7);

}

void (*ASPasskeyRegistrationCredential.extensionOutput.modify(_QWORD *a1))(void **a1, char a2)
{
  void *v1;
  id v3;
  void (*result)(void **, char);
  void (*v5)(void **, char);

  a1[1] = v1;
  v3 = objc_msgSend(v1, sel_extensionOutput);

  if (!v3)
    goto LABEL_4;
  result = (void (*)(void **, char))objc_msgSend(v1, sel_extensionOutput);
  if (result)
  {
    v5 = result;
    v3 = *(id *)((char *)result + OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions);

LABEL_4:
    *a1 = v3;
    return sub_20E551F30;
  }
  __break(1u);
  return result;
}

void sub_20E551F30(void **a1, char a2)
{
  void *v3;
  id v4;
  id v5;
  char *v6;
  void *v7;
  id v8;
  id v9;
  char *v10;
  void *v11;
  id v12;

  v3 = *a1;
  if ((a2 & 1) != 0)
  {
    if (v3)
    {
      v4 = objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionOutput);
      v5 = v3;
      v6 = (char *)objc_msgSend(v4, sel_init);
      v7 = *(void **)&v6[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
      v12 = v6;
      *(_QWORD *)&v6[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v5;

    }
    else
    {
      v12 = 0;
    }
    objc_msgSend(a1[1], sel_setExtensionOutput_, v12);

  }
  else if (v3)
  {
    v8 = objc_allocWithZone((Class)ASPasskeyRegistrationCredentialExtensionOutput);
    v9 = v3;
    v10 = (char *)objc_msgSend(v8, sel_init);
    v11 = *(void **)&v10[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions];
    v12 = v10;
    *(_QWORD *)&v10[OBJC_IVAR___ASPasskeyRegistrationCredentialExtensionOutput_coreExtensions] = v9;

    objc_msgSend(a1[1], sel_setExtensionOutput_, v12);
  }
  else
  {
    v12 = 0;
    objc_msgSend(a1[1], sel_setExtensionOutput_, 0);
  }

}

void sub_20E552044(_QWORD *a1@<X8>)
{
  uint64_t v2;

  ASPasskeyRegistrationCredential.extensionOutput.getter(&v2);
  *a1 = v2;
}

void sub_20E55207C(void **a1)
{
  id v1;
  void *v2;

  v2 = *a1;
  v1 = v2;
  ASPasskeyRegistrationCredential.extensionOutput.setter(&v2);
}

id sub_20E5520B4()
{
  uint64_t v0;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  int v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)v0;
  v2 = *(_QWORD *)(v0 + 8);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(unsigned __int8 *)(v0 + 48);
  v5 = objc_allocWithZone((Class)ASPublicKeyCredentialClientData);
  swift_bridgeObjectRetain();
  sub_20E52F7E4(v1, v2);
  v6 = (void *)sub_20E556DA4();
  v7 = (void *)sub_20E5572A8();
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v5, sel_initWithChallenge_origin_, v6, v7);
  sub_20E52F4EC(v1, v2);

  if (v3)
    v9 = (void *)sub_20E5572A8();
  else
    v9 = 0;
  objc_msgSend(v8, sel_setTopOrigin_, v9);

  v10 = 1;
  if ((v4 & 1) != 0)
    v10 = 2;
  if (v4 == 2)
    v11 = 0;
  else
    v11 = v10;
  objc_msgSend(v8, sel_setCrossOrigin_, v11);
  return v8;
}

BOOL static ASPublicKeyCredentialClientData.CrossOriginValue.== infix(_:_:)(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t ASPublicKeyCredentialClientData.CrossOriginValue.hash(into:)()
{
  return sub_20E5575B4();
}

uint64_t ASPublicKeyCredentialClientData.CrossOriginValue.hashValue.getter()
{
  sub_20E5575A8();
  sub_20E5575B4();
  return sub_20E5575C0();
}

uint64_t ASPublicKeyCredentialClientData.challenge.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)v0;
  sub_20E52F7E4(*(_QWORD *)v0, *(_QWORD *)(v0 + 8));
  return v1;
}

uint64_t ASPublicKeyCredentialClientData.challenge.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = sub_20E52F4EC(*(_QWORD *)v2, *(_QWORD *)(v2 + 8));
  *(_QWORD *)v2 = a1;
  *(_QWORD *)(v2 + 8) = a2;
  return result;
}

uint64_t (*ASPublicKeyCredentialClientData.challenge.modify())()
{
  return nullsub_1;
}

uint64_t ASPublicKeyCredentialClientData.origin.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 16);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ASPublicKeyCredentialClientData.origin.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return result;
}

uint64_t (*ASPublicKeyCredentialClientData.origin.modify())()
{
  return nullsub_1;
}

uint64_t ASPublicKeyCredentialClientData.topOrigin.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 32);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t ASPublicKeyCredentialClientData.topOrigin.setter(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  result = swift_bridgeObjectRelease();
  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return result;
}

uint64_t (*ASPublicKeyCredentialClientData.topOrigin.modify())()
{
  return nullsub_1;
}

void ASPublicKeyCredentialClientData.crossOrigin.getter(_BYTE *a1@<X8>)
{
  uint64_t v1;

  *a1 = *(_BYTE *)(v1 + 48);
}

_BYTE *ASPublicKeyCredentialClientData.crossOrigin.setter(_BYTE *result)
{
  uint64_t v1;

  *(_BYTE *)(v1 + 48) = *result;
  return result;
}

uint64_t (*ASPublicKeyCredentialClientData.crossOrigin.modify())()
{
  return nullsub_1;
}

uint64_t ASPublicKeyCredentialClientData.init(challenge:origin:topOrigin:crossOrigin:)@<X0>(uint64_t result@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X5>, char *a7@<X6>, uint64_t a8@<X8>)
{
  char v8;

  v8 = *a7;
  *(_QWORD *)a8 = result;
  *(_QWORD *)(a8 + 8) = a2;
  *(_QWORD *)(a8 + 16) = a3;
  *(_QWORD *)(a8 + 24) = a4;
  *(_QWORD *)(a8 + 32) = a5;
  *(_QWORD *)(a8 + 40) = a6;
  *(_BYTE *)(a8 + 48) = v8;
  return result;
}

unint64_t sub_20E5523F0()
{
  unint64_t result;

  result = qword_254A299E0;
  if (!qword_254A299E0)
  {
    result = MEMORY[0x212BBF2EC](&protocol conformance descriptor for ASPublicKeyCredentialClientData.CrossOriginValue, &type metadata for ASPublicKeyCredentialClientData.CrossOriginValue);
    atomic_store(result, (unint64_t *)&qword_254A299E0);
  }
  return result;
}

uint64_t destroy for ASPublicKeyCredentialClientData(uint64_t a1)
{
  sub_20E52F4EC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8));
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for ASPublicKeyCredentialClientData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_20E52F7E4(*(_QWORD *)a2, v5);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for ASPublicKeyCredentialClientData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;

  v4 = *(_QWORD *)a2;
  v5 = *(_QWORD *)(a2 + 8);
  sub_20E52F7E4(*(_QWORD *)a2, v5);
  v6 = *(_QWORD *)a1;
  v7 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  sub_20E52F4EC(v6, v7);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

__n128 __swift_memcpy49_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for ASPublicKeyCredentialClientData(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)a1;
  v5 = *(_QWORD *)(a1 + 8);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  sub_20E52F4EC(v4, v5);
  v6 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v7;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  return a1;
}

uint64_t getEnumTagSinglePayload for ASPublicKeyCredentialClientData(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 49))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 24);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for ASPublicKeyCredentialClientData(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 49) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 24) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 49) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for ASPublicKeyCredentialClientData()
{
  return &type metadata for ASPublicKeyCredentialClientData;
}

uint64_t storeEnumTagSinglePayload for ASPublicKeyCredentialClientData.CrossOriginValue(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_20E5526CC + 4 * byte_20E55FA65[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_20E552700 + 4 * byte_20E55FA60[v4]))();
}

uint64_t sub_20E552700(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E552708(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x20E552710);
  return result;
}

uint64_t sub_20E55271C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x20E552724);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_20E552728(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_20E552730(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for ASPublicKeyCredentialClientData.CrossOriginValue()
{
  return &type metadata for ASPublicKeyCredentialClientData.CrossOriginValue;
}

uint64_t ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.getter@<X0>(uint64_t a1@<X8>)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  uint64_t v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD v27[2];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)v27 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_20E556F9C();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8](v6);
  v9 = (char *)v27 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F08);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)v27 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(v1, sel_extensions);
  sub_20E556FA8();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v12, 1, v6))
  {
    result = sub_20E52E370((uint64_t)v12, &qword_254A28F08);
    *(_OWORD *)a1 = 0u;
    *(_OWORD *)(a1 + 16) = 0u;
    *(_QWORD *)(a1 + 32) = 1;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v7 + 16))(v9, v12, v6);
    sub_20E52E370((uint64_t)v12, &qword_254A28F08);
    sub_20E556F90();
    v15 = sub_20E556F78();
    v16 = *(_QWORD *)(v15 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v16 + 48))(v5, 1, v15) == 1)
    {
      sub_20E52E370((uint64_t)v5, &qword_254A28F00);
      v17 = 0;
      v18 = 0;
      v27[0] = 0;
      v19 = 0xF000000000000000;
    }
    else
    {
      v17 = sub_20E556F48();
      v19 = v20;
      v21 = sub_20E556F54();
      v27[0] = v22;
      v23 = *(void (**)(char *, uint64_t))(v16 + 8);
      v18 = v21;
      v23(v5, v15);
    }
    v24 = sub_20E556F30();
    if (v24)
    {
      v25 = sub_20E52F1F0(v24);
      swift_bridgeObjectRelease();
    }
    else
    {
      v25 = 0;
    }
    result = (*(uint64_t (**)(char *, uint64_t))(v7 + 8))(v9, v6);
    *(_QWORD *)a1 = v17;
    *(_QWORD *)(a1 + 8) = v19;
    v26 = v27[0];
    *(_QWORD *)(a1 + 16) = v18;
    *(_QWORD *)(a1 + 24) = v26;
    *(_QWORD *)(a1 + 32) = v25;
  }
  return result;
}

void sub_20E552994(uint64_t *a1)
{
  unint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5[5];

  v1 = a1[1];
  v2 = a1[2];
  v3 = a1[3];
  v4 = a1[4];
  v5[0] = *a1;
  v5[1] = v1;
  v5[2] = v2;
  v5[3] = v3;
  v5[4] = v4;
  sub_20E55356C(v5[0], v1, v2, v3, v4);
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.setter(v5);
}

void ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.setter(uint64_t *a1)
{
  void *v1;
  uint64_t v3;
  uint64_t v4;
  _BYTE *v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE v19[16];

  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v3);
  v5 = &v19[-((v4 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F08);
  MEMORY[0x24BDAC7A8](v6);
  v8 = &v19[-((v7 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v9 = *a1;
  v10 = a1[1];
  v11 = a1[2];
  v12 = a1[3];
  v13 = a1[4];
  v14 = objc_msgSend(v1, sel_extensions);
  if (v13 == 1)
  {
    v15 = sub_20E556F9C();
    (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v8, 1, 1, v15);
  }
  else
  {
    if (v10 >> 60 == 15)
    {
      v16 = sub_20E556F78();
      (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v5, 1, 1, v16);
    }
    else
    {
      sub_20E52F7E4(v9, v10);
      sub_20E52F828(v11, v12);
      sub_20E556F3C();
      v17 = sub_20E556F78();
      (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v5, 0, 1, v17);
    }
    if (v13)
      sub_20E52F544(v13);
    sub_20E556F84();
    sub_20E52F480(v9, v10, v11, v12, v13);
    v18 = sub_20E556F9C();
    (*(void (**)(_BYTE *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v18 - 8) + 56))(v8, 0, 1, v18);
  }
  sub_20E556FB4();

}

void (*ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.modify(_QWORD *a1))(uint64_t **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v3[5] = v1;
  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.getter((uint64_t)v3);
  return sub_20E552C24;
}

void sub_20E552C24(uint64_t **a1, char a2)
{
  uint64_t *v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9[5];

  v3 = *a1;
  v4 = **a1;
  v5 = v3[1];
  v6 = v3[2];
  v7 = v3[3];
  v8 = v3[4];
  v9[0] = v4;
  v9[1] = v5;
  v9[2] = v6;
  v9[3] = v7;
  v9[4] = v8;
  if ((a2 & 1) != 0)
  {
    sub_20E55356C(v4, v5, v6, v7, v8);
    ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.setter(v9);
    sub_20E52F480(*v3, v3[1], v3[2], v3[3], v3[4]);
  }
  else
  {
    ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.setter(v9);
  }
  free(v3);
}

id ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__largeBlobSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  int v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  void *v21;
  id result;
  uint64_t v23;

  v1 = sub_20E556FC0();
  v2 = *(_QWORD *)(v1 - 8);
  v3 = MEMORY[0x24BDAC7A8](v1);
  v5 = (uint64_t *)((char *)&v23 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  MEMORY[0x24BDAC7A8](v3);
  v7 = (char *)&v23 - v6;
  v8 = sub_20E556FE4();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x24BDAC7A8](v8);
  v11 = (char *)&v23 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28EF8);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v23 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = objc_msgSend(v0, sel_extensions);
  sub_20E556FF0();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v14, 1, v8))
  {
    sub_20E52E370((uint64_t)v14, &qword_254A28EF8);
    return 0;
  }
  (*(void (**)(char *, char *, uint64_t))(v9 + 16))(v11, v14, v8);
  sub_20E52E370((uint64_t)v14, &qword_254A28EF8);
  sub_20E556FD8();
  (*(void (**)(uint64_t *, char *, uint64_t))(v2 + 16))(v5, v7, v1);
  v17 = (*(uint64_t (**)(uint64_t *, uint64_t))(v2 + 88))(v5, v1);
  if (v17 == *MEMORY[0x24BE0AFA8])
  {
    (*(void (**)(uint64_t *, uint64_t))(v2 + 96))(v5, v1);
    v18 = *v5;
    v19 = v5[1];
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    v20 = objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput);
    sub_20E52F7E4(v18, v19);
    v16 = objc_msgSend(v20, sel_initWithOperation_, 1);
    v21 = (void *)sub_20E556DA4();
    objc_msgSend(v16, sel_setDataToWrite_, v21);

    sub_20E52F4EC(v18, v19);
    sub_20E52F4EC(v18, v19);
    return v16;
  }
  if (v17 == *MEMORY[0x24BE0AFA0])
  {
    (*(void (**)(char *, uint64_t))(v2 + 8))(v7, v1);
    (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
    return objc_msgSend(objc_allocWithZone((Class)ASAuthorizationPublicKeyCredentialLargeBlobAssertionInput), sel_initWithOperation_, 0);
  }
  result = (id)sub_20E5574F4();
  __break(1u);
  return result;
}

void ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__largeBlobSwift.setter(void *a1)
{
  sub_20E553418(a1, &qword_254A28EF8, (void (*)(void))sub_20E539A74, (uint64_t (*)(_QWORD))MEMORY[0x24BE0AFD0], (void (*)(char *))MEMORY[0x24BE0AFE8]);
}

id ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__prfSwift.getter()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;
  _QWORD *v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  _QWORD *v31;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F00);
  MEMORY[0x24BDAC7A8](v1);
  v3 = (char *)&v25 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_20E556F9C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254A28F08);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = objc_msgSend(v0, sel_extensions);
  sub_20E556FA8();

  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v5 + 48))(v10, 1, v4))
  {
    sub_20E52E370((uint64_t)v10, &qword_254A28F08);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v7, v10, v4);
    sub_20E52E370((uint64_t)v10, &qword_254A28F08);
    sub_20E556F90();
    v13 = sub_20E556F78();
    v14 = *(_QWORD *)(v13 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v3, 1, v13) == 1)
    {
      sub_20E52E370((uint64_t)v3, &qword_254A28F00);
      v15 = 0;
      v16 = 0;
      v17 = 0;
      v18 = 0xF000000000000000;
    }
    else
    {
      v26 = sub_20E556F48();
      v18 = v19;
      v16 = sub_20E556F54();
      v17 = v20;
      v21 = *(void (**)(char *, uint64_t))(v14 + 8);
      v15 = v26;
      v21(v3, v13);
    }
    v22 = sub_20E556F30();
    if (v22)
    {
      v23 = sub_20E52F1F0(v22);
      swift_bridgeObjectRelease();
    }
    else
    {
      v23 = 0;
    }
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v27 = v15;
    v28 = v18;
    v29 = v16;
    v30 = v17;
    v31 = v23;
    v12 = sub_20E53A35C();
    sub_20E52F4B0(v15, v18, v16, v17);
    swift_bridgeObjectRelease();
  }
  return v12;
}

void sub_20E5532D8(void *a1, uint64_t a2, void *a3, uint64_t *a4, void (*a5)(void), uint64_t (*a6)(_QWORD), void (*a7)(char *))
{
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v12 = __swift_instantiateConcreteTypeFromMangledName(a4);
  MEMORY[0x24BDAC7A8](v12);
  v14 = (char *)&v21 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1;
  v16 = a3;
  v17 = objc_msgSend(v15, sel_extensions);
  if (v16)
  {
    v18 = v16;
    a5();

    v19 = a6(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56))(v14, 0, 1, v19);
  }
  else
  {
    v20 = a6(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 56))(v14, 1, 1, v20);
  }
  a7(v14);

}

void ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.__prfSwift.setter(void *a1)
{
  sub_20E553418(a1, &qword_254A28F08, (void (*)(void))sub_20E53D67C, (uint64_t (*)(_QWORD))MEMORY[0x24BE0AF80], (void (*)(char *))MEMORY[0x24BE0AF98]);
}

void sub_20E553418(id a1, uint64_t *a2, void (*a3)(void), uint64_t (*a4)(_QWORD), void (*a5)(char *))
{
  void *v5;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v10 = __swift_instantiateConcreteTypeFromMangledName(a2);
  MEMORY[0x24BDAC7A8](v10);
  v12 = (char *)&v16 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = objc_msgSend(v5, sel_extensions);
  if (a1)
  {
    a1 = a1;
    a3();

    v14 = a4(0);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(v12, 0, 1, v14);
  }
  else
  {
    v15 = a4(0);
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v12, 1, 1, v15);
  }
  a5(v12);

}

id static ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.emptyExtensions()()
{
  return objc_msgSend(objc_allocWithZone((Class)sub_20E557008()), sel_init);
}

uint64_t sub_20E55356C(uint64_t result, unint64_t a2, uint64_t a3, unint64_t a4, uint64_t a5)
{
  if (a5 != 1)
  {
    sub_20E537B84(result, a2, a3, a4);
    return swift_bridgeObjectRetain();
  }
  return result;
}

double sub_20E55359C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  __int128 v4;
  _OWORD v5[2];
  uint64_t v6;

  ASAuthorizationPlatformPublicKeyCredentialAssertionRequest.prf.getter((uint64_t)v5);
  v2 = v6;
  result = *(double *)v5;
  v4 = v5[1];
  *(_OWORD *)a1 = v5[0];
  *(_OWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 32) = v2;
  return result;
}

id sub_20E5535E0@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel___largeBlobSwift);
  *a2 = result;
  return result;
}

id sub_20E553618(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel___setLargeBlobSwift_, *a1);
}

id sub_20E55362C@<X0>(id *a1@<X0>, _QWORD *a2@<X8>)
{
  id result;

  result = objc_msgSend(*a1, sel___prfSwift);
  *a2 = result;
  return result;
}

id sub_20E553664(_QWORD *a1, id *a2)
{
  return objc_msgSend(*a2, sel___setPRFSwift_, *a1);
}

uint64_t sub_20E553678()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void getWBSPrivacyProxyChangeNotification_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSNotificationName getWBSPrivacyProxyChangeNotification(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASSafariSharedUISoftLinking.h"), 24, CFSTR("%s"), dlerror());

  __break(1u);
}

void getSFScreenScale_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "CGFloat getSFScreenScale(void)");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASPasswordManagerIconController_iOS.m"), 42, CFSTR("%s"), dlerror());

  __break(1u);
}

void MobileSafariLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *MobileSafariLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASPasswordManagerIconController_iOS.m"), 38, CFSTR("%s"), *a1);

  __break(1u);
}

void __getWBSCacheClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBSCacheClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASPasswordManagerIconController_iOS.m"), 49, CFSTR("Unable to find class %s"), "WBSCache");

  __break(1u);
}

void SafariSharedLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariSharedLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASPasswordManagerIconController_iOS.m"), 48, CFSTR("%s"), *a1);

  __break(1u);
}

void __getWBSPrivacyProxyAvailabilityManagerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBSPrivacyProxyAvailabilityManagerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASSafariSharedUISoftLinking.h"), 23, CFSTR("Unable to find class %s"), "WBSPrivacyProxyAvailabilityManager");

  __break(1u);
}

void SafariSharedUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariSharedUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASSafariSharedUISoftLinking.h"), 6, CFSTR("%s"), *a1);

  __break(1u);
}

void __getWBUHistoryClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *WebUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASPasswordManagerIconController_iOS.m"), 55, CFSTR("%s"), *a1);

  __break(1u);
}

void __getWBUHistoryClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBUHistoryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASPasswordManagerIconController_iOS.m"), 56, CFSTR("Unable to find class %s"), "WBUHistory");

  __break(1u);
}

void __getWBSHistoryClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBSHistoryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASPasswordManagerIconController_iOS.m"), 50, CFSTR("Unable to find class %s"), "WBSHistory");

  __break(1u);
}

void __getWBSImageUtilitiesClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBSImageUtilitiesClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASSafariSharedUISoftLinking.h"), 14, CFSTR("Unable to find class %s"), "WBSImageUtilities");

  __break(1u);
}

void __getWBSTouchIconResponseClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBSTouchIconResponseClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASSafariSharedUISoftLinking.h"), 18, CFSTR("Unable to find class %s"), "WBSTouchIconResponse");

  __break(1u);
}

void __getWBSTouchIconCacheClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getWBSTouchIconCacheClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASSafariSharedUISoftLinking.h"), 16, CFSTR("Unable to find class %s"), "WBSTouchIconCache");

  __break(1u);
}

void __getAAUIProfilePictureStoreClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *AppleAccountUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("_ASAccountSharingGroupMemberDataManager.m"), 46, CFSTR("%s"), *a1);

  __break(1u);
}

void __getAAUIProfilePictureStoreClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getAAUIProfilePictureStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("_ASAccountSharingGroupMemberDataManager.m"), 47, CFSTR("Unable to find class %s"), "AAUIProfilePictureStore");

  __break(1u);
}

void __getSFAuthenticationSessionClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SafariServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ASWebAuthenticationSessionIOS.m"), 80, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSFAuthenticationSessionClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getSFAuthenticationSessionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("ASWebAuthenticationSessionIOS.m"), 81, CFSTR("Unable to find class %s"), "SFAuthenticationSession");

  __break(1u);
}

uint64_t sub_20E556D5C()
{
  return MEMORY[0x24BDCBBC8]();
}

uint64_t sub_20E556D68()
{
  return MEMORY[0x24BDCBBD8]();
}

uint64_t sub_20E556D74()
{
  return MEMORY[0x24BDCBBF0]();
}

uint64_t sub_20E556D80()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_20E556D8C()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20E556D98()
{
  return MEMORY[0x24BE10120]();
}

uint64_t sub_20E556DA4()
{
  return MEMORY[0x24BDCDCA0]();
}

uint64_t sub_20E556DB0()
{
  return MEMORY[0x24BE0AE60]();
}

uint64_t sub_20E556DBC()
{
  return MEMORY[0x24BDCDCE0]();
}

uint64_t sub_20E556DC8()
{
  return MEMORY[0x24BE82C50]();
}

uint64_t sub_20E556DD4()
{
  return MEMORY[0x24BE82C58]();
}

uint64_t sub_20E556DE0()
{
  return MEMORY[0x24BE82C60]();
}

uint64_t sub_20E556DEC()
{
  return MEMORY[0x24BE82C68]();
}

uint64_t sub_20E556DF8()
{
  return MEMORY[0x24BE10160]();
}

uint64_t sub_20E556E04()
{
  return MEMORY[0x24BE10170]();
}

uint64_t sub_20E556E10()
{
  return MEMORY[0x24BE10178]();
}

uint64_t sub_20E556E1C()
{
  return MEMORY[0x24BEE5118]();
}

uint64_t sub_20E556E28()
{
  return MEMORY[0x24BEE5120]();
}

uint64_t sub_20E556E34()
{
  return MEMORY[0x24BEE5130]();
}

uint64_t sub_20E556E40()
{
  return MEMORY[0x24BE0AE68]();
}

uint64_t sub_20E556E4C()
{
  return MEMORY[0x24BE0AE70]();
}

uint64_t sub_20E556E58()
{
  return MEMORY[0x24BE0AE78]();
}

uint64_t sub_20E556E64()
{
  return MEMORY[0x24BE0AE80]();
}

uint64_t sub_20E556E70()
{
  return MEMORY[0x24BE0AE88]();
}

uint64_t sub_20E556E7C()
{
  return MEMORY[0x24BE0AE90]();
}

uint64_t sub_20E556E88()
{
  return MEMORY[0x24BE0AE98]();
}

uint64_t sub_20E556E94()
{
  return MEMORY[0x24BE0AEB0]();
}

uint64_t sub_20E556EA0()
{
  return MEMORY[0x24BE0AEB8]();
}

uint64_t sub_20E556EAC()
{
  return MEMORY[0x24BE0AEC0]();
}

uint64_t sub_20E556EB8()
{
  return MEMORY[0x24BE0AEC8]();
}

uint64_t sub_20E556EC4()
{
  return MEMORY[0x24BE0AED0]();
}

uint64_t sub_20E556ED0()
{
  return MEMORY[0x24BE0AED8]();
}

uint64_t sub_20E556EDC()
{
  return MEMORY[0x24BE0AEE8]();
}

uint64_t sub_20E556EE8()
{
  return MEMORY[0x24BE0AEF0]();
}

uint64_t sub_20E556EF4()
{
  return MEMORY[0x24BE0AEF8]();
}

uint64_t sub_20E556F00()
{
  return MEMORY[0x24BE0AF08]();
}

uint64_t sub_20E556F0C()
{
  return MEMORY[0x24BE0AF10]();
}

uint64_t sub_20E556F18()
{
  return MEMORY[0x24BE0AF18]();
}

uint64_t sub_20E556F24()
{
  return MEMORY[0x24BE0AF20]();
}

uint64_t sub_20E556F30()
{
  return MEMORY[0x24BE0AF30]();
}

uint64_t sub_20E556F3C()
{
  return MEMORY[0x24BE0AF38]();
}

uint64_t sub_20E556F48()
{
  return MEMORY[0x24BE0AF40]();
}

uint64_t sub_20E556F54()
{
  return MEMORY[0x24BE0AF48]();
}

uint64_t sub_20E556F60()
{
  return MEMORY[0x24BE0AF50]();
}

uint64_t sub_20E556F6C()
{
  return MEMORY[0x24BE0AF58]();
}

uint64_t sub_20E556F78()
{
  return MEMORY[0x24BE0AF60]();
}

uint64_t sub_20E556F84()
{
  return MEMORY[0x24BE0AF70]();
}

uint64_t sub_20E556F90()
{
  return MEMORY[0x24BE0AF78]();
}

uint64_t sub_20E556F9C()
{
  return MEMORY[0x24BE0AF80]();
}

uint64_t sub_20E556FA8()
{
  return MEMORY[0x24BE0AF90]();
}

uint64_t sub_20E556FB4()
{
  return MEMORY[0x24BE0AF98]();
}

uint64_t sub_20E556FC0()
{
  return MEMORY[0x24BE0AFB0]();
}

uint64_t sub_20E556FCC()
{
  return MEMORY[0x24BE0AFC0]();
}

uint64_t sub_20E556FD8()
{
  return MEMORY[0x24BE0AFC8]();
}

uint64_t sub_20E556FE4()
{
  return MEMORY[0x24BE0AFD0]();
}

uint64_t sub_20E556FF0()
{
  return MEMORY[0x24BE0AFE0]();
}

uint64_t sub_20E556FFC()
{
  return MEMORY[0x24BE0AFE8]();
}

uint64_t sub_20E557008()
{
  return MEMORY[0x24BE0AFF0]();
}

uint64_t sub_20E557014()
{
  return MEMORY[0x24BE0B000]();
}

uint64_t sub_20E557020()
{
  return MEMORY[0x24BE0B008]();
}

uint64_t sub_20E55702C()
{
  return MEMORY[0x24BE0B010]();
}

uint64_t sub_20E557038()
{
  return MEMORY[0x24BE0B018]();
}

uint64_t sub_20E557044()
{
  return MEMORY[0x24BE0B028]();
}

uint64_t sub_20E557050()
{
  return MEMORY[0x24BE0B030]();
}

uint64_t sub_20E55705C()
{
  return MEMORY[0x24BE0B048]();
}

uint64_t sub_20E557068()
{
  return MEMORY[0x24BE0B058]();
}

uint64_t sub_20E557074()
{
  return MEMORY[0x24BE0B060]();
}

uint64_t sub_20E557080()
{
  return MEMORY[0x24BE0B068]();
}

uint64_t sub_20E55708C()
{
  return MEMORY[0x24BE0B078]();
}

uint64_t sub_20E557098()
{
  return MEMORY[0x24BE0B080]();
}

uint64_t sub_20E5570A4()
{
  return MEMORY[0x24BE0B088]();
}

uint64_t sub_20E5570B0()
{
  return MEMORY[0x24BE0B098]();
}

uint64_t sub_20E5570BC()
{
  return MEMORY[0x24BE0B0A0]();
}

uint64_t sub_20E5570C8()
{
  return MEMORY[0x24BE0B0A8]();
}

uint64_t sub_20E5570D4()
{
  return MEMORY[0x24BE0B0B0]();
}

uint64_t sub_20E5570E0()
{
  return MEMORY[0x24BE0B0B8]();
}

uint64_t sub_20E5570EC()
{
  return MEMORY[0x24BE0B0C8]();
}

uint64_t sub_20E5570F8()
{
  return MEMORY[0x24BE0B0D0]();
}

uint64_t sub_20E557104()
{
  return MEMORY[0x24BE0B0E8]();
}

uint64_t sub_20E557110()
{
  return MEMORY[0x24BE0B0F8]();
}

uint64_t sub_20E55711C()
{
  return MEMORY[0x24BE0B100]();
}

uint64_t sub_20E557128()
{
  return MEMORY[0x24BE0B108]();
}

uint64_t sub_20E557134()
{
  return MEMORY[0x24BE0B118]();
}

uint64_t sub_20E557140()
{
  return MEMORY[0x24BE0B120]();
}

uint64_t sub_20E55714C()
{
  return MEMORY[0x24BE0B128]();
}

uint64_t sub_20E557158()
{
  return MEMORY[0x24BE0B138]();
}

uint64_t sub_20E557164()
{
  return MEMORY[0x24BE0B140]();
}

uint64_t sub_20E557170()
{
  return MEMORY[0x24BE0B148]();
}

uint64_t sub_20E55717C()
{
  return MEMORY[0x24BE0B150]();
}

uint64_t sub_20E557188()
{
  return MEMORY[0x24BE0B158]();
}

uint64_t sub_20E557194()
{
  return MEMORY[0x24BE0B168]();
}

uint64_t sub_20E5571A0()
{
  return MEMORY[0x24BE0B170]();
}

uint64_t sub_20E5571AC()
{
  return MEMORY[0x24BE0B178]();
}

uint64_t sub_20E5571B8()
{
  return MEMORY[0x24BE0B180]();
}

uint64_t sub_20E5571C4()
{
  return MEMORY[0x24BE0B188]();
}

uint64_t sub_20E5571D0()
{
  return MEMORY[0x24BE0B198]();
}

uint64_t sub_20E5571DC()
{
  return MEMORY[0x24BE0B1A0]();
}

uint64_t sub_20E5571E8()
{
  return MEMORY[0x24BE0B1A8]();
}

uint64_t sub_20E5571F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20E557200()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_20E55720C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20E557218()
{
  return MEMORY[0x24BE0B1B8]();
}

uint64_t sub_20E557224()
{
  return MEMORY[0x24BDC63B0]();
}

uint64_t sub_20E557230()
{
  return MEMORY[0x24BDC63C0]();
}

uint64_t sub_20E55723C()
{
  return MEMORY[0x24BDC63E0]();
}

uint64_t sub_20E557248()
{
  return MEMORY[0x24BDC64F0]();
}

uint64_t sub_20E557254()
{
  return MEMORY[0x24BDC6510]();
}

uint64_t sub_20E557260()
{
  return MEMORY[0x24BDC66E0]();
}

uint64_t sub_20E55726C()
{
  return MEMORY[0x24BDC6AE0]();
}

uint64_t sub_20E557278()
{
  return MEMORY[0x24BDC6AF8]();
}

uint64_t sub_20E557284()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20E557290()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20E55729C()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_20E5572A8()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20E5572B4()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20E5572C0()
{
  return MEMORY[0x24BEE09F0]();
}

uint64_t sub_20E5572CC()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20E5572D8()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20E5572E4()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20E5572F0()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20E5572FC()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20E557308()
{
  return MEMORY[0x24BEE1128]();
}

uint64_t sub_20E557314()
{
  return MEMORY[0x24BDCFCE8]();
}

uint64_t sub_20E557320()
{
  return MEMORY[0x24BEE1678]();
}

uint64_t sub_20E55732C()
{
  return MEMORY[0x24BDCFD28]();
}

uint64_t sub_20E557338()
{
  return MEMORY[0x24BDCFD30]();
}

uint64_t sub_20E557344()
{
  return MEMORY[0x24BDCFD38]();
}

uint64_t sub_20E557350()
{
  return MEMORY[0x24BDCFD40]();
}

uint64_t sub_20E55735C()
{
  return MEMORY[0x24BEE1758]();
}

uint64_t sub_20E557368()
{
  return MEMORY[0x24BDCFDF8]();
}

uint64_t sub_20E557374()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20E557380()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20E55738C()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_20E557398()
{
  return MEMORY[0x24BDD0170]();
}

uint64_t sub_20E5573A4()
{
  return MEMORY[0x24BEE5BB8]();
}

uint64_t sub_20E5573B0()
{
  return MEMORY[0x24BEE5BC0]();
}

uint64_t sub_20E5573BC()
{
  return MEMORY[0x24BEE1C68]();
}

uint64_t sub_20E5573C8()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20E5573D4()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20E5573E0()
{
  return MEMORY[0x24BEE20A8]();
}

uint64_t sub_20E5573EC()
{
  return MEMORY[0x24BEE2200]();
}

uint64_t sub_20E5573F8()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_20E557404()
{
  return MEMORY[0x24BEE22D0]();
}

uint64_t sub_20E557410()
{
  return MEMORY[0x24BEE2300]();
}

uint64_t sub_20E55741C()
{
  return MEMORY[0x24BEE2358]();
}

uint64_t sub_20E557428()
{
  return MEMORY[0x24BEE24B8]();
}

uint64_t sub_20E557434()
{
  return MEMORY[0x24BEE24C0]();
}

uint64_t sub_20E557440()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20E55744C()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20E557458()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20E557464()
{
  return MEMORY[0x24BEE2660]();
}

uint64_t sub_20E557470()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20E55747C()
{
  return MEMORY[0x24BEE2908]();
}

uint64_t sub_20E557488()
{
  return MEMORY[0x24BEE2938]();
}

uint64_t sub_20E557494()
{
  return MEMORY[0x24BEE2958]();
}

uint64_t sub_20E5574A0()
{
  return MEMORY[0x24BEE2980]();
}

uint64_t sub_20E5574AC()
{
  return MEMORY[0x24BEE2988]();
}

uint64_t sub_20E5574B8()
{
  return MEMORY[0x24BEE2EA8]();
}

uint64_t sub_20E5574C4()
{
  return MEMORY[0x24BEE2EE0]();
}

uint64_t sub_20E5574D0()
{
  return MEMORY[0x24BEE2F08]();
}

uint64_t sub_20E5574DC()
{
  return MEMORY[0x24BEE2F18]();
}

uint64_t sub_20E5574E8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20E5574F4()
{
  return MEMORY[0x24BEE2F48]();
}

uint64_t sub_20E557500()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20E55750C()
{
  return MEMORY[0x24BEE3080]();
}

uint64_t sub_20E557518()
{
  return MEMORY[0x24BEE3088]();
}

uint64_t sub_20E557524()
{
  return MEMORY[0x24BEE3090]();
}

uint64_t sub_20E557530()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20E55753C()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20E557548()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_20E557554()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_20E557560()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20E55756C()
{
  return MEMORY[0x24BEE3DE0]();
}

uint64_t sub_20E557578()
{
  return MEMORY[0x24BEE3ED0]();
}

uint64_t sub_20E557584()
{
  return MEMORY[0x24BEE3ED8]();
}

uint64_t sub_20E557590()
{
  return MEMORY[0x24BE0B1C0]();
}

uint64_t sub_20E55759C()
{
  return MEMORY[0x24BEE42D8]();
}

uint64_t sub_20E5575A8()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20E5575B4()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_20E5575C0()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AKCreateAppleIDButtonImageWithCornerRadius()
{
  return MEMORY[0x24BE0AE18]();
}

uint64_t AKUserNotificationResponseAction()
{
  return MEMORY[0x24BE0AC90]();
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x24BDAC358](data, *(_QWORD *)&len, md);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x24BDBC920](allocator, flags, error, dictionary, timeout);
}

SInt32 CFUserNotificationReceiveResponse(CFUserNotificationRef userNotification, CFTimeInterval timeout, CFOptionFlags *responseFlags)
{
  return MEMORY[0x24BDBC950](userNotification, responseFlags, timeout);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x24BDBDDD8](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF078]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CPCopyBundleIdentifierAndTeamFromApplicationIdentifier()
{
  return MEMORY[0x24BE04650]();
}

uint64_t LICreateIconFromCachedBitmap()
{
  return MEMORY[0x24BE67108]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t SFCredentialIdentityStoreIdentifierCreateWithConnectionToExtension()
{
  return MEMORY[0x24BE830B8]();
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x24BDE8A88](query, attributesToUpdate);
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x24BEB3798]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x24BEB37B8]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

uint64_t UIKeyboardAutomaticIsOnScreen()
{
  return MEMORY[0x24BEBE410]();
}

uint64_t WBSApplicationIdentifierFromAuditToken()
{
  return MEMORY[0x24BE82E18]();
}

uint64_t WBSAuditTokenHasEntitlement()
{
  return MEMORY[0x24BE82E20]();
}

uint64_t WBSAuthenticationServicesAgentCredentialSharingGroupsUserNotificationsInterface()
{
  return MEMORY[0x24BE82E48]();
}

uint64_t WBSIsEqual()
{
  return MEMORY[0x24BE82E88]();
}

uint64_t WBSRunLoopRunUntilTerminationSignal()
{
  return MEMORY[0x24BE82FB8]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _UIApplicationIsExtension()
{
  return MEMORY[0x24BEBEA28]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _WBSLocalizedString()
{
  return MEMORY[0x24BE82FF8]();
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
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

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t ascCredentialRequestTypesAllPasskey()
{
  return MEMORY[0x24BE0B298]();
}

uint64_t ascCredentialRequestTypesAllPublicKey()
{
  return MEMORY[0x24BE0B2A0]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

IMP class_getMethodImplementation(Class cls, SEL name)
{
  return (IMP)MEMORY[0x24BEDCEB8](cls, name);
}

uint64_t container_copy_sandbox_token()
{
  return MEMORY[0x24BDADA40]();
}

uint64_t container_error_copy_unlocalized_description()
{
  return MEMORY[0x24BDADA88]();
}

uint64_t container_get_path()
{
  return MEMORY[0x24BDADAC0]();
}

uint64_t container_query_create()
{
  return MEMORY[0x24BDADB18]();
}

uint64_t container_query_free()
{
  return MEMORY[0x24BDADB20]();
}

uint64_t container_query_get_last_error()
{
  return MEMORY[0x24BDADB28]();
}

uint64_t container_query_get_single_result()
{
  return MEMORY[0x24BDADB30]();
}

uint64_t container_query_operation_set_flags()
{
  return MEMORY[0x24BDADB48]();
}

uint64_t container_query_set_class()
{
  return MEMORY[0x24BDADB58]();
}

uint64_t container_query_set_identifiers()
{
  return MEMORY[0x24BDADB68]();
}

uint64_t container_query_set_persona_unique_string()
{
  return MEMORY[0x24BDADB78]();
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED8](label, attr, target);
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

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t dyld_program_minos_at_least()
{
  return MEMORY[0x24BDAE140]();
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
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

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
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

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x24BDAFC00]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x24BEE4B70]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x24BEE4B98]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x24BEE4BA0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x24BEE4BB8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x24BEE4BC0]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x24BEE4BC8]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x24BEE4BD0]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x24BEE71C8]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_dynamicCastObjCClassUnconditional()
{
  return MEMORY[0x24BEE4C68]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4D10]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassFromObject()
{
  return MEMORY[0x24BEE4DA8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x24BEE4DD0]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x24BEE4E10]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x24BEE4E18]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x24BEE4E20]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x24BEE4E48]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x24BEE4E58]();
}

uint64_t swift_isUniquelyReferenced_nonNull_bridgeObject()
{
  return MEMORY[0x24BEE4E90]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x24BEE4F00]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x24BEE4F60]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x24BEE4F78]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x24BEB39F0]();
}

xpc_activity_state_t xpc_activity_get_state(xpc_activity_t activity)
{
  return MEMORY[0x24BDB05E0](activity);
}

void xpc_activity_register(const char *identifier, xpc_object_t criteria, xpc_activity_handler_t handler)
{
  MEMORY[0x24BDB05E8](identifier, criteria, handler);
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x24BDB0610](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x24BDB0618](activity);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

