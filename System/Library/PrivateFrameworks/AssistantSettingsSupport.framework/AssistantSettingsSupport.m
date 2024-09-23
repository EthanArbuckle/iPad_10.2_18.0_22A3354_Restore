void sub_2153F671C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2153F77FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2153F7C94(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2153F7D88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2153F8248(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2153F83E8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t tccPreferencesChangedCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "tccPreferencesChanged");
}

void sub_2153F9C00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v17 - 40));
  _Unwind_Resume(a1);
}

void sub_2153FB944(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getAnalyticsSendEventLazySymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D33CD30;
    v5 = 0;
    CoreAnalyticsLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreAnalyticsLibraryCore_frameworkLibrary)
    __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)CoreAnalyticsLibraryCore_frameworkLibrary, "AnalyticsSendEventLazy");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getAnalyticsSendEventLazySymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id getPETEventPropertyClass()
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
  v0 = (void *)getPETEventPropertyClass_softClass;
  v7 = getPETEventPropertyClass_softClass;
  if (!getPETEventPropertyClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPETEventPropertyClass_block_invoke;
    v3[3] = &unk_24D33CD10;
    v3[4] = &v4;
    __getPETEventPropertyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2153FBF40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getPETScalarEventTrackerClass()
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
  v0 = (void *)getPETScalarEventTrackerClass_softClass;
  v7 = getPETScalarEventTrackerClass_softClass;
  if (!getPETScalarEventTrackerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getPETScalarEventTrackerClass_block_invoke;
    v3[3] = &unk_24D33CD10;
    v3[4] = &v4;
    __getPETScalarEventTrackerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_2153FC494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void doAsync(void *a1)
{
  NSObject *v2;

  if (a1)
  {
    dispatch_get_global_queue(-32768, 0);
    v2 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v2, a1);

  }
}

Class __getPETEventPropertyClass_block_invoke(uint64_t a1)
{
  Class result;

  ProactiveEventTrackerLibrary();
  result = objc_getClass("PETEventProperty");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPETEventPropertyClass_block_invoke_cold_1();
  getPETEventPropertyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void ProactiveEventTrackerLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!ProactiveEventTrackerLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24D33CE08;
    v2 = 0;
    ProactiveEventTrackerLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!ProactiveEventTrackerLibraryCore_frameworkLibrary)
    ProactiveEventTrackerLibrary_cold_1(&v0);
}

Class __getPETScalarEventTrackerClass_block_invoke(uint64_t a1)
{
  Class result;

  ProactiveEventTrackerLibrary();
  result = objc_getClass("PETScalarEventTracker");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getPETScalarEventTrackerClass_block_invoke_cold_1();
  getPETScalarEventTrackerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2153FE46C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2153FE840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2153FEA60(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2153FEDE0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 24));
  _Unwind_Resume(a1);
}

Class __getVTUIGMEnrollmentViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!VoiceTriggerUILibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D33CEF0;
    v5 = 0;
    VoiceTriggerUILibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!VoiceTriggerUILibraryCore_frameworkLibrary)
    __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_1(&v3);
  result = objc_getClass("VTUIGMEnrollmentViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_2();
  getVTUIGMEnrollmentViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_215400668(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215400C24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_24D33CF70;
    v5 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_cold_1(&v3);
  result = dlsym((void *)SpringBoardServicesLibraryCore_frameworkLibrary, "SBSCopyDisplayIdentifiers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBSCopyDisplayIdentifiersSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2154017AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SearchLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SearchLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D33CF88;
    v3 = 0;
    SearchLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SearchLibraryCore_frameworkLibrary)
    SearchLibrary_cold_1(&v1);
  return SearchLibraryCore_frameworkLibrary;
}

void sub_215402104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215402520(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

Class __getCKKnowledgeStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreKnowledgeLibrary();
  result = objc_getClass("CKKnowledgeStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKKnowledgeStoreClass_block_invoke_cold_1();
  getCKKnowledgeStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreKnowledgeLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!CoreKnowledgeLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_24D33CFC0;
    v2 = 0;
    CoreKnowledgeLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!CoreKnowledgeLibraryCore_frameworkLibrary)
    CoreKnowledgeLibrary_cold_1(&v0);
}

Class __getCKPermanentEventStoreClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreKnowledgeLibrary();
  result = objc_getClass("CKPermanentEventStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKPermanentEventStoreClass_block_invoke_cold_1();
  getCKPermanentEventStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKEventClass_block_invoke(uint64_t a1)
{
  Class result;

  CoreKnowledgeLibrary();
  result = objc_getClass("CKEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKEventClass_block_invoke_cold_1();
  getCKEventClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_2154040D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215404954(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_215407C9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getCKKnowledgeStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreKnowledgeLibrary_0();
  result = objc_getClass("CKKnowledgeStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKKnowledgeStoreClass_block_invoke_cold_1_0();
  getCKKnowledgeStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void CoreKnowledgeLibrary_0()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!CoreKnowledgeLibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_24D33D208;
    v2 = 0;
    CoreKnowledgeLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!CoreKnowledgeLibraryCore_frameworkLibrary_0)
    CoreKnowledgeLibrary_cold_1_0(&v0);
}

Class __getCKPermanentEventStoreClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreKnowledgeLibrary_0();
  result = objc_getClass("CKPermanentEventStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKPermanentEventStoreClass_block_invoke_cold_1_0();
  getCKPermanentEventStoreClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getCKEventClass_block_invoke_0(uint64_t a1)
{
  Class result;

  CoreKnowledgeLibrary_0();
  result = objc_getClass("CKEvent");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getCKEventClass_block_invoke_cold_1_0();
  getCKEventClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_215408E60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id ASTDisabledLockScreenBundles()
{
  if (ASTDisabledLockScreenBundles_onceToken != -1)
    dispatch_once(&ASTDisabledLockScreenBundles_onceToken, &__block_literal_global_6);
  return (id)ASTDisabledLockScreenBundles_disabledLockScreenBundles;
}

void ASTSetLockScreenEnabled(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "propertyForKey:", CFSTR("BUNDLE_ID"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  ASTDisabledLockScreenBundles();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if ((_DWORD)a1)
    objc_msgSend(v3, "removeObject:", v6);
  else
    objc_msgSend(v3, "addObject:", v6);

  ASTDisabledLockScreenBundles();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  CFPreferencesSetAppValue(CFSTR("LockscreenSuggestionsDisabledBundles"), (CFPropertyListRef)objc_msgSend(v5, "allObjects"), CFSTR("com.apple.duetexpertd"));

  CFPreferencesSynchronize(CFSTR("com.apple.duetexpertd"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD570]);
  notify_post("com.apple.duetexpertd.prefschanged");
  +[AssistantMetrics didDetailToggle:bundleId:on:](AssistantMetrics, "didDetailToggle:bundleId:on:", CFSTR("appinlockscreen"), v6, a1);

}

void sub_215409DCC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21540A834(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_21540C25C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getNRPairedDeviceRegistryClass()
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
  v0 = (void *)getNRPairedDeviceRegistryClass_softClass;
  v7 = getNRPairedDeviceRegistryClass_softClass;
  if (!getNRPairedDeviceRegistryClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getNRPairedDeviceRegistryClass_block_invoke;
    v3[3] = &unk_24D33CD10;
    v3[4] = &v4;
    __getNRPairedDeviceRegistryClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_21540C314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getNRDevicePropertySystemVersion()
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
  v0 = (id *)getNRDevicePropertySystemVersionSymbolLoc_ptr;
  v6 = getNRDevicePropertySystemVersionSymbolLoc_ptr;
  if (!getNRDevicePropertySystemVersionSymbolLoc_ptr)
  {
    v1 = (void *)NanoRegistryLibrary();
    v0 = (id *)dlsym(v1, "NRDevicePropertySystemVersion");
    v4[3] = (uint64_t)v0;
    getNRDevicePropertySystemVersionSymbolLoc_ptr = (uint64_t)v0;
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
    getNRDevicePropertySystemVersion_cold_1();
  return *v0;
}

void sub_21540C3AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21540C750(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21540CC84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location)
{
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21540D0F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 112));
  _Unwind_Resume(a1);
}

void sub_21540D698(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  id *v11;
  uint64_t v12;

  objc_destroyWeak(v11);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

void sub_21540DC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id *location)
{
  uint64_t v12;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v12 - 112));
  _Unwind_Resume(a1);
}

void sub_21540E6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21540EB7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_2154101C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215411178(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  id *v10;
  uint64_t v11;

  objc_destroyWeak(v10);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 104));
  _Unwind_Resume(a1);
}

id getVTUIEnrollTrainingViewControllerClass()
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
  v0 = (void *)getVTUIEnrollTrainingViewControllerClass_softClass;
  v7 = getVTUIEnrollTrainingViewControllerClass_softClass;
  if (!getVTUIEnrollTrainingViewControllerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getVTUIEnrollTrainingViewControllerClass_block_invoke;
    v3[3] = &unk_24D33CD10;
    v3[4] = &v4;
    __getVTUIEnrollTrainingViewControllerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_215411604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_215411CA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215412360(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_2154124C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215412CBC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21541313C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getVTUISiriDataSharingOptInPresenterClass_block_invoke(uint64_t a1)
{
  Class result;

  VoiceTriggerUILibrary();
  result = objc_getClass("VTUISiriDataSharingOptInPresenter");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVTUISiriDataSharingOptInPresenterClass_block_invoke_cold_1();
  getVTUISiriDataSharingOptInPresenterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void VoiceTriggerUILibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = 0;
  if (!VoiceTriggerUILibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_24D33D620;
    v2 = 0;
    VoiceTriggerUILibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!VoiceTriggerUILibraryCore_frameworkLibrary_0)
    VoiceTriggerUILibrary_cold_1(&v0);
}

Class __getNRPairedDeviceRegistryClass_block_invoke(uint64_t a1)
{
  Class result;

  NanoRegistryLibrary();
  result = objc_getClass("NRPairedDeviceRegistry");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getNRPairedDeviceRegistryClass_block_invoke_cold_1();
  getNRPairedDeviceRegistryClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t NanoRegistryLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!NanoRegistryLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D33D638;
    v3 = 0;
    NanoRegistryLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!NanoRegistryLibraryCore_frameworkLibrary)
    NanoRegistryLibrary_cold_1(&v1);
  return NanoRegistryLibraryCore_frameworkLibrary;
}

Class __getBYFlowSkipControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  SetupAssistantLibrary();
  result = objc_getClass("BYFlowSkipController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBYFlowSkipControllerClass_block_invoke_cold_1();
  getBYFlowSkipControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SetupAssistantLibrary()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = xmmword_24D33D650;
    v3 = 0;
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SetupAssistantLibraryCore_frameworkLibrary)
    SetupAssistantLibrary_cold_1(&v1);
  return SetupAssistantLibraryCore_frameworkLibrary;
}

Class __getVTUIVoiceSelectionViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  VoiceTriggerUILibrary();
  result = objc_getClass("VTUIVoiceSelectionViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVTUIVoiceSelectionViewControllerClass_block_invoke_cold_1();
  getVTUIVoiceSelectionViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getVTUIEnrollTrainingViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  VoiceTriggerUILibrary();
  result = objc_getClass("VTUIEnrollTrainingViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1();
  getVTUIEnrollTrainingViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

char *OUTLINED_FUNCTION_4()
{
  return dlerror();
}

void sub_2154169E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_21541812C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

uint64_t SearchLibrary_0()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SearchLibraryCore_frameworkLibrary_0)
  {
    v2 = xmmword_24D33D788;
    v3 = 0;
    SearchLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SearchLibraryCore_frameworkLibrary_0)
    SearchLibrary_cold_1_0(&v1);
  return SearchLibraryCore_frameworkLibrary_0;
}

void sub_215419640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SearchLibrary_1()
{
  void *v1;
  __int128 v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v1 = 0;
  if (!SearchLibraryCore_frameworkLibrary_1)
  {
    v2 = xmmword_24D33D7C0;
    v3 = 0;
    SearchLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!SearchLibraryCore_frameworkLibrary_1)
    SearchLibrary_cold_1_1(&v1);
  return SearchLibraryCore_frameworkLibrary_1;
}

void *__getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_0(uint64_t a1)
{
  void *result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_0)
  {
    v4 = xmmword_24D33D7D8;
    v5 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!SpringBoardServicesLibraryCore_frameworkLibrary_0)
    __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_cold_1_0(&v3);
  result = dlsym((void *)SpringBoardServicesLibraryCore_frameworkLibrary_0, "SBSCopyDisplayIdentifiers");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getSBSCopyDisplayIdentifiersSymbolLoc_ptr_0 = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t sub_21541992C()
{
  void *v0;
  char v1;

  sub_21542A098();
  v0 = (void *)sub_21542A08C();
  v1 = sub_21542A074();

  return v1 & 1;
}

void sub_2154199D0()
{
  id v0;

  sub_21542A098();
  v0 = (id)sub_21542A08C();
  sub_21542A080();

}

void sub_215419A1C(_BYTE *a1@<X8>)
{
  void *v2;
  char v3;

  sub_21542A098();
  v2 = (void *)sub_21542A08C();
  v3 = sub_21542A074();

  *a1 = v3 & 1;
}

void sub_215419A68()
{
  id v0;

  sub_21542A098();
  v0 = (id)sub_21542A08C();
  sub_21542A080();

}

void (*sub_215419AB4(uint64_t a1))()
{
  void *v2;
  char v3;

  *(_QWORD *)a1 = sub_21542A098();
  v2 = (void *)sub_21542A08C();
  v3 = sub_21542A074();

  *(_BYTE *)(a1 + 8) = v3 & 1;
  return sub_215419B10;
}

void sub_215419B10()
{
  id v0;

  v0 = (id)sub_21542A08C();
  sub_21542A080();

}

id GMOptInStatusProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GMOptInStatusProvider.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMOptInStatusProvider();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GMOptInStatusProvider()
{
  return objc_opt_self();
}

id GMOptInStatusProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMOptInStatusProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

void (*sub_215419C30(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x28uLL);
  *a1 = v2;
  v2[4] = sub_215419AB4((uint64_t)v2);
  return sub_215419C6C;
}

void sub_215419C6C(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD))(*a1 + 32))(*a1);
  free(v1);
}

uint64_t dispatch thunk of GMOptInStatusProviding.userOptInStatus.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 8))();
}

uint64_t dispatch thunk of GMOptInStatusProviding.userOptInStatus.setter(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 16))();
}

uint64_t dispatch thunk of GMOptInStatusProviding.userOptInStatus.modify(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(a3 + 24))();
}

uint64_t method lookup function for GMOptInStatusProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GMOptInStatusProvider.userOptInStatus.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
}

uint64_t dispatch thunk of GMOptInStatusProvider.userOptInStatus.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of GMOptInStatusProvider.userOptInStatus.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x60))();
}

uint64_t sub_215419D10(uint64_t a1, uint64_t a2)
{
  return sub_215419E6C(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x24BDCF9E0]);
}

uint64_t sub_215419D30(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_21542A290();
  *a2 = 0;
  return result;
}

uint64_t sub_215419DA4(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_21542A29C();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_215419E20@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_21542A2A8();
  v2 = sub_21542A284();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_215419E60(uint64_t a1, uint64_t a2)
{
  return sub_215419E6C(a1, a2, MEMORY[0x24BEE0CD8]);
}

uint64_t sub_215419E6C(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_21542A2A8();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_215419EA8()
{
  sub_21542A2A8();
  sub_21542A2C0();
  return swift_bridgeObjectRelease();
}

uint64_t sub_215419EE8()
{
  uint64_t v0;

  sub_21542A2A8();
  sub_21542A464();
  sub_21542A2C0();
  v0 = sub_21542A47C();
  swift_bridgeObjectRelease();
  return v0;
}

uint64_t sub_215419F5C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_21542A2A8();
  v2 = v1;
  if (v0 == sub_21542A2A8() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_21542A440();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
}

uint64_t sub_215419FE8()
{
  sub_21541A220(&qword_254DC2E78, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21542D348);
  sub_21541A220(&qword_254DC2E80, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21542D138);
  return sub_21542A41C();
}

uint64_t sub_21541A06C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_21542A284();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_21541A0B0@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_21542A2A8();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_21541A0D8()
{
  sub_21541A220(&qword_254DC2E68, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21542D304);
  sub_21541A220(&qword_254DC2E70, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21542D258);
  return sub_21542A41C();
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_21541A184(a1, &qword_254DC2E28);
}

void type metadata accessor for OpenExternalURLOptionsKey(uint64_t a1)
{
  sub_21541A184(a1, &qword_254DC2E30);
}

void sub_21541A184(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21541A1C8()
{
  return sub_21541A220(&qword_254DC2E38, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21542D0FC);
}

uint64_t sub_21541A1F4()
{
  return sub_21541A220(&qword_254DC2E40, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21542D0D0);
}

uint64_t sub_21541A220(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x2199E1738](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_21541A260()
{
  return sub_21541A220(&qword_254DC2E48, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21542D21C);
}

uint64_t sub_21541A28C()
{
  return sub_21541A220(&qword_254DC2E50, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21542D1F0);
}

uint64_t sub_21541A2B8()
{
  return sub_21541A220(&qword_254DC2E58, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21542D28C);
}

uint64_t sub_21541A2E4()
{
  return sub_21541A220(&qword_254DC2E60, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21542D16C);
}

ValueMetadata *type metadata accessor for BetaBadge()
{
  return &type metadata for BetaBadge;
}

uint64_t sub_21541A328()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_21541A338@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _OWORD *v8;
  uint64_t v9;
  uint64_t ObjCClassFromMetadata;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t KeyPath;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  int v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _OWORD v75[2];
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  _OWORD v82[2];
  __int128 v83;
  _OWORD v84[2];
  uint64_t v85;
  char v86;
  uint64_t v87;
  unsigned __int8 v88;
  uint64_t v89;
  uint64_t v90;

  v68 = a1;
  v1 = sub_21542A200();
  v66 = *(_QWORD *)(v1 - 8);
  v67 = v1;
  MEMORY[0x24BDAC7A8]();
  v65 = (char *)&v52 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2E88);
  MEMORY[0x24BDAC7A8]();
  v62 = (uint64_t)&v52 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21542A20C();
  MEMORY[0x24BDAC7A8]();
  v61 = (char *)&v52 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2E90);
  MEMORY[0x24BDAC7A8]();
  v6 = (char *)&v52 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2E98);
  MEMORY[0x24BDAC7A8]();
  v8 = (_OWORD *)((char *)&v52 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2EA0);
  MEMORY[0x24BDAC7A8]();
  v63 = (char *)&v52 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GMFooterUtility();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v11 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v12 = sub_215429E94();
  v14 = v13;

  *(_QWORD *)&v76 = v12;
  *((_QWORD *)&v76 + 1) = v14;
  sub_21541A928();
  v15 = sub_21542A1B8();
  v57 = v16;
  v58 = v15;
  v56 = v17;
  v59 = v18;
  sub_21542A218();
  sub_21542A0EC();
  v19 = v85;
  LOBYTE(v12) = v86;
  v20 = v87;
  v55 = v88;
  v53 = v90;
  v54 = v89;
  sub_21542A1A0();
  v21 = *MEMORY[0x24BDF1668];
  v22 = sub_21542A194();
  v23 = *(_QWORD *)(v22 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v23 + 104))(v6, v21, v22);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v23 + 56))(v6, 0, 1, v22);
  v24 = sub_21542A1AC();
  sub_21541ACA0((uint64_t)v6, &qword_254DC2E90);
  KeyPath = swift_getKeyPath();
  v26 = sub_21542A1F4();
  v27 = swift_getKeyPath();
  v28 = sub_21542A1E8();
  v29 = sub_21542A17C();
  *(_QWORD *)&v69 = v58;
  *((_QWORD *)&v69 + 1) = v57;
  LOBYTE(v70) = v56 & 1;
  *((_QWORD *)&v70 + 1) = v59;
  *(_QWORD *)&v71 = v19;
  BYTE8(v71) = v12;
  *(_QWORD *)&v72 = v20;
  BYTE8(v72) = v55;
  *(_QWORD *)&v73 = v54;
  *((_QWORD *)&v73 + 1) = v53;
  *(_QWORD *)&v74 = KeyPath;
  *((_QWORD *)&v74 + 1) = v24;
  *(_QWORD *)&v75[0] = v27;
  *((_QWORD *)&v75[0] + 1) = v26;
  *(_QWORD *)&v75[1] = v28;
  BYTE8(v75[1]) = v29;
  LOBYTE(KeyPath) = sub_21542A170();
  sub_21542A0E0();
  v80 = v73;
  v81 = v74;
  v82[0] = v75[0];
  *(_OWORD *)((char *)v82 + 9) = *(_OWORD *)((char *)v75 + 9);
  v76 = v69;
  v77 = v70;
  v78 = v71;
  v79 = v72;
  LOBYTE(v83) = KeyPath;
  *((_QWORD *)&v83 + 1) = v30;
  *(_QWORD *)&v84[0] = v31;
  *((_QWORD *)&v84[0] + 1) = v32;
  *(_QWORD *)&v84[1] = v33;
  BYTE8(v84[1]) = 0;
  v34 = *MEMORY[0x24BDEEB68];
  v35 = sub_21542A140();
  v36 = (uint64_t)v61;
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v35 - 8) + 104))(v61, v34, v35);
  v37 = v62;
  sub_21541AA0C(v36, v62);
  sub_21541AC5C(v37, (uint64_t)v8 + *(int *)(v60 + 36), &qword_254DC2E88);
  v38 = v84[0];
  v8[8] = v83;
  v8[9] = v38;
  *(_OWORD *)((char *)v8 + 153) = *(_OWORD *)((char *)v84 + 9);
  v39 = v81;
  v8[4] = v80;
  v8[5] = v39;
  v40 = v82[1];
  v8[6] = v82[0];
  v8[7] = v40;
  v41 = v77;
  *v8 = v76;
  v8[1] = v41;
  v42 = v79;
  v8[2] = v78;
  v8[3] = v42;
  sub_21541AA50((uint64_t)&v76);
  sub_21541ACA0(v37, &qword_254DC2E88);
  sub_21541AAE8(v36);
  sub_21541AB24((uint64_t)&v69);
  v44 = v65;
  v43 = v66;
  v45 = v67;
  (*(void (**)(char *, _QWORD, uint64_t))(v66 + 104))(v65, *MEMORY[0x24BDF40B8], v67);
  v46 = swift_getKeyPath();
  v47 = (uint64_t)v63;
  v48 = (uint64_t *)&v63[*(int *)(v64 + 36)];
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2EB0);
  (*(void (**)(char *, char *, uint64_t))(v43 + 16))((char *)v48 + *(int *)(v49 + 28), v44, v45);
  *v48 = v46;
  sub_21541AC5C((uint64_t)v8, v47, &qword_254DC2E98);
  (*(void (**)(char *, uint64_t))(v43 + 8))(v44, v45);
  sub_21541ACA0((uint64_t)v8, &qword_254DC2E98);
  v50 = v68;
  sub_21541AC5C(v47, v68, &qword_254DC2EA0);
  *(_OWORD *)(v50 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_254DC2EB8) + 36)) = xmmword_21542D390;
  return sub_21541ACA0(v47, &qword_254DC2EA0);
}

uint64_t sub_21541A8CC()
{
  return sub_21542A1DC();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E1720]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21541A928()
{
  unint64_t result;

  result = qword_254DC2EA8;
  if (!qword_254DC2EA8)
  {
    result = MEMORY[0x2199E1738](MEMORY[0x24BEE0D50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254DC2EA8);
  }
  return result;
}

uint64_t sub_21541A96C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21542A128();
  *a1 = result;
  return result;
}

uint64_t sub_21541A994()
{
  swift_retain();
  return sub_21542A134();
}

uint64_t sub_21541A9BC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_21542A110();
  *a1 = result;
  return result;
}

uint64_t sub_21541A9E4()
{
  swift_retain();
  return sub_21542A11C();
}

uint64_t sub_21541AA0C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_21542A20C();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21541AA50(uint64_t a1)
{
  sub_21541AAD8(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t sub_21541AAD8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_21541AAE8(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21542A20C();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21541AB24(uint64_t a1)
{
  sub_21541ABAC(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return a1;
}

uint64_t sub_21541ABAC(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_21541ABBC()
{
  return sub_21542A0F8();
}

uint64_t sub_21541ABDC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  sub_21542A200();
  MEMORY[0x24BDAC7A8]();
  (*(void (**)(char *, uint64_t))(v3 + 16))((char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_21542A104();
}

uint64_t sub_21541AC5C(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_21541ACA0(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_21541ACDC()
{
  return sub_21541AE7C(&qword_254DC2EC0, &qword_254DC2EB8, (uint64_t (*)(void))sub_21541AD54, MEMORY[0x24BDEC438]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x2199E172C](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_21541AD54()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2EC8;
  if (!qword_254DC2EC8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2EA0);
    v2[0] = sub_21541ADD8();
    v2[1] = sub_21541B0D4(&qword_254DC2F60, &qword_254DC2EB0, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2EC8);
  }
  return result;
}

unint64_t sub_21541ADD8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2ED0;
  if (!qword_254DC2ED0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2E98);
    v2[0] = sub_21541AE7C(&qword_254DC2ED8, &qword_254DC2EE0, (uint64_t (*)(void))sub_21541AEE4, MEMORY[0x24BDECC60]);
    v2[1] = sub_21541B0D4(&qword_254DC2F58, &qword_254DC2E88, MEMORY[0x24BDF03D8]);
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2ED0);
  }
  return result;
}

uint64_t sub_21541AE7C(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4;
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21541AEE4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2EE8;
  if (!qword_254DC2EE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2EF0);
    v2[0] = sub_21541AF68();
    v2[1] = sub_21541B0D4(&qword_254DC2F48, &qword_254DC2F50, MEMORY[0x24BDF06D0]);
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2EE8);
  }
  return result;
}

unint64_t sub_21541AF68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2EF8;
  if (!qword_254DC2EF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2F00);
    v2[0] = sub_21541AFEC();
    v2[1] = sub_21541B0D4(&qword_254DC2F38, &qword_254DC2F40, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2EF8);
  }
  return result;
}

unint64_t sub_21541AFEC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2F08;
  if (!qword_254DC2F08)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2F10);
    v2[0] = sub_21541B070();
    v2[1] = sub_21541B0D4(&qword_254DC2F28, &qword_254DC2F30, MEMORY[0x24BDF1028]);
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2F08);
  }
  return result;
}

unint64_t sub_21541B070()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2F18;
  if (!qword_254DC2F18)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2F20);
    v2[0] = MEMORY[0x24BDF1F80];
    v2[1] = MEMORY[0x24BDEBEE0];
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2F18);
  }
  return result;
}

uint64_t sub_21541B0D4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x2199E1738](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_21541B114(uint64_t a1, uint64_t *a2, uint64_t *a3, uint64_t (*a4)(uint64_t))
{
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t result;
  char v14;
  uint64_t v15;
  BOOL v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;

  if (!*(_QWORD *)(a1 + 16))
  {
    v8 = (_QWORD *)MEMORY[0x24BEE4B00];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(a2);
  v7 = sub_21542A404();
  v8 = (_QWORD *)v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (!v9)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v8;
  }
  v10 = v7 + 64;
  v11 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_21541AC5C(v11, (uint64_t)&v18, a3);
    v12 = v18;
    result = a4(v18);
    if ((v14 & 1) != 0)
      break;
    *(_QWORD *)(v10 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v8[6] + 8 * result) = v12;
    result = (unint64_t)sub_21541C3FC(&v19, (_OWORD *)(v8[7] + 32 * result));
    v15 = v8[2];
    v16 = __OFADD__(v15, 1);
    v17 = v15 + 1;
    if (v16)
      goto LABEL_11;
    v8[2] = v17;
    v11 += 40;
    if (!--v9)
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

uint64_t sub_21541B23C(void *a1)
{
  uint64_t ObjCClassFromMetadata;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  id v9;
  _QWORD *v10;
  id v11;

  if (qword_254DC2DF8 != -1)
    swift_once();
  type metadata accessor for GMFooterUtility();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v3 = (void *)objc_opt_self();
  v4 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  v5 = sub_215429E94();
  v7 = v6;

  v8 = objc_msgSend((id)objc_opt_self(), sel_currentDevice, 0xE000000000000000);
  objc_msgSend(v8, sel_sf_isiPad);

  v9 = objc_msgSend(v3, sel_bundleForClass_, ObjCClassFromMetadata);
  sub_215429E94();

  v10 = (_QWORD *)swift_allocObject();
  v10[2] = a1;
  v10[3] = v5;
  v10[4] = v7;
  *(_QWORD *)(swift_allocObject() + 16) = a1;
  v11 = a1;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2FB0);
  sub_21541C21C();
  return sub_21542A248();
}

id sub_21541B480(void *a1, uint64_t a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  id result;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t inited;
  void **v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  id v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  uint64_t v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD aBlock[6];

  v6 = sub_21542A224();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x24BDAC7A8]();
  v9 = (char *)&v39 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21542A23C();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8]();
  v13 = (char *)&v39 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  result = objc_msgSend(a1, sel_specifier);
  if (result)
  {
    v15 = result;
    v16 = objc_msgSend(result, sel_target);
    v45 = v10;
    v46 = v7;
    v43 = v15;
    v44 = v11;
    v42 = a2;
    if (v16)
    {
      objc_opt_self();
      v17 = (void *)swift_dynamicCastObjCClass();
      if (v17)
      {
        v41 = v17;
        v40 = objc_msgSend(v17, sel_navigationItem);
LABEL_7:
        v18 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BEBD708]), sel_init);
        v19 = (void *)objc_opt_self();
        v20 = (void *)sub_21542A284();
        v21 = objc_msgSend(v19, sel_preferredFontForTextStyle_, v20);

        objc_msgSend(v18, sel_setFont_, v21);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3010);
        inited = swift_initStackObject();
        v23 = (void **)MEMORY[0x24BEBB368];
        *(_OWORD *)(inited + 16) = xmmword_21542D4A0;
        v24 = *v23;
        *(_QWORD *)(inited + 32) = *v23;
        v25 = (void *)objc_opt_self();
        swift_bridgeObjectRetain();
        v26 = v24;
        v27 = objc_msgSend(v25, sel_labelColor);
        v28 = objc_msgSend(v27, sel_colorWithAlphaComponent_, a3);

        *(_QWORD *)(inited + 64) = sub_21541C5B0(0, &qword_254DC3018);
        *(_QWORD *)(inited + 40) = v28;
        sub_21541B114(inited, &qword_254DC3040, &qword_254DC3048, (uint64_t (*)(uint64_t))sub_21541C37C);
        v29 = objc_allocWithZone(MEMORY[0x24BDD1458]);
        v30 = (void *)sub_21542A284();
        swift_bridgeObjectRelease();
        type metadata accessor for Key(0);
        sub_21541A220(&qword_254DC2E68, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_21542D304);
        v31 = (void *)sub_21542A254();
        swift_bridgeObjectRelease();
        v32 = objc_msgSend(v29, sel_initWithString_attributes_, v30, v31);

        objc_msgSend(v18, sel_setAttributedText_, v32);
        sub_21541C5B0(0, &qword_254DC3020);
        v33 = (void *)sub_21542A368();
        v34 = swift_allocObject();
        v35 = v40;
        *(_QWORD *)(v34 + 16) = v40;
        *(_QWORD *)(v34 + 24) = v18;
        aBlock[4] = sub_21541C614;
        aBlock[5] = v34;
        aBlock[0] = MEMORY[0x24BDAC760];
        aBlock[1] = 1107296256;
        aBlock[2] = sub_21541B988;
        aBlock[3] = &block_descriptor;
        v36 = _Block_copy(aBlock);
        v37 = v35;
        v38 = v18;
        swift_release();
        sub_21542A230();
        aBlock[0] = MEMORY[0x24BEE4AF8];
        sub_21541A220(&qword_254DC3028, (uint64_t (*)(uint64_t))MEMORY[0x24BEE5458], MEMORY[0x24BEE5468]);
        __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3030);
        sub_21541B0D4(&qword_254DC3038, &qword_254DC3030, MEMORY[0x24BEE12C8]);
        sub_21542A3B0();
        MEMORY[0x2199E0DC0](0, v13, v9, v36);
        _Block_release(v36);

        (*(void (**)(char *, uint64_t))(v46 + 8))(v9, v6);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v44 + 8))(v13, v45);
      }
      swift_unknownObjectRelease();
    }
    v40 = 0;
    v41 = 0;
    goto LABEL_7;
  }
  return result;
}

uint64_t sub_21541B988(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

uint64_t sub_21541B9B4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v14;

  v0 = sub_215429EC4();
  v1 = *(_QWORD *)(v0 - 8);
  ((void (*)(void))MEMORY[0x24BDAC7A8])();
  v3 = (char *)&v14 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2FF8);
  v4 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v6 = (char *)&v14 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v14 - v7;
  v9 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
  objc_msgSend(v9, sel_userInterfaceIdiom);

  sub_215429EB8();
  sub_21541AC5C((uint64_t)v8, (uint64_t)v6, &qword_254DC2FF8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v1 + 48))(v6, 1, v0) != 1)
  {
    (*(void (**)(char *, char *, uint64_t))(v1 + 32))(v3, v6, v0);
    v10 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
    v11 = (void *)sub_215429EAC();
    sub_21541B114(MEMORY[0x24BEE4AF8], &qword_254DC3000, &qword_254DC3008, (uint64_t (*)(uint64_t))sub_21541C37C);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_21541A220(&qword_254DC2E78, (uint64_t (*)(uint64_t))type metadata accessor for OpenExternalURLOptionsKey, (uint64_t)&unk_21542D348);
    v12 = (void *)sub_21542A254();
    swift_bridgeObjectRelease();
    objc_msgSend(v10, sel_openURL_options_completionHandler_, v11, v12, 0);

    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
  }
  return sub_21541C33C((uint64_t)v8);
}

uint64_t sub_21541BC1C()
{
  uint64_t v0;
  char *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  uint64_t v9;

  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2FF0);
  MEMORY[0x24BDAC7A8]();
  v1 = (char *)&v9 - ((v0 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2FD8);
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8]();
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC2DF8 != -1)
    swift_once();
  v6 = objc_allocWithZone(MEMORY[0x24BE51A90]);
  v7 = (void *)sub_21542A284();
  objc_msgSend(v6, sel_initWithBundleIdentifier_, v7);

  sub_21542A020();
  (*(void (**)(char *, char *, uint64_t))(v3 + 16))(v1, v5, v2);
  swift_storeEnumTagMultiPayload();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2FC8);
  sub_21541C2A0();
  sub_21541B0D4(&qword_254DC2FD0, &qword_254DC2FD8, MEMORY[0x24BEC6520]);
  sub_21542A14C();
  return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
}

id sub_21541BF30(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  void *v4;
  void *v5;
  objc_class *ObjectType;
  void *v10;
  id v11;
  id v12;
  objc_super v14;

  v5 = v4;
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    v10 = (void *)sub_21542A284();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v14.receiver = v5;
  v14.super_class = ObjectType;
  v11 = objc_msgSendSuper2(&v14, sel_initWithStyle_reuseIdentifier_specifier_, a1, v10, a4);

  v12 = v11;
  if (v12)

  return v12;
}

id sub_21541C120()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for AssistantPlacardCell()
{
  return objc_opt_self();
}

uint64_t sub_21541C174()
{
  uint64_t v0;

  return sub_21541B23C(*(void **)(v0 + 16));
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

uint64_t sub_21541C1B8()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

id sub_21541C1E4(double a1)
{
  uint64_t v1;

  return sub_21541B480(*(void **)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_21541C1F0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_21541C214()
{
  return sub_21541B9B4();
}

unint64_t sub_21541C21C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2FB8;
  if (!qword_254DC2FB8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2FB0);
    v2[0] = sub_21541C2A0();
    v2[1] = sub_21541B0D4(&qword_254DC2FD0, &qword_254DC2FD8, MEMORY[0x24BEC6520]);
    result = MEMORY[0x2199E1738](MEMORY[0x24BDEF3E0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2FB8);
  }
  return result;
}

unint64_t sub_21541C2A0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_254DC2FC0;
  if (!qword_254DC2FC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC2FC8);
    v2[0] = sub_21541B0D4(&qword_254DC2FD0, &qword_254DC2FD8, MEMORY[0x24BEC6520]);
    v2[1] = sub_21541B0D4(&qword_254DC2FE0, &qword_254DC2FE8, MEMORY[0x24BDEDC10]);
    result = MEMORY[0x2199E1738](MEMORY[0x24BDED308], v1, v2);
    atomic_store(result, (unint64_t *)&qword_254DC2FC0);
  }
  return result;
}

uint64_t sub_21541C33C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC2FF8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_21541C37C(uint64_t a1)
{
  uint64_t v2;

  sub_21542A2A8();
  sub_21542A464();
  sub_21542A2C0();
  v2 = sub_21542A47C();
  swift_bridgeObjectRelease();
  return sub_21541C43C(a1, v2);
}

_OWORD *sub_21541C3FC(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

unint64_t sub_21541C40C(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_21542A3BC();
  return sub_21541C648(a1, v2);
}

unint64_t sub_21541C43C(uint64_t a1, uint64_t a2)
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
    v6 = sub_21542A2A8();
    v8 = v7;
    if (v6 == sub_21542A2A8() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_21542A440();
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
          v13 = sub_21542A2A8();
          v15 = v14;
          if (v13 == sub_21542A2A8() && v15 == v16)
            break;
          v18 = sub_21542A440();
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

uint64_t sub_21541C5B0(uint64_t a1, unint64_t *a2)
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

uint64_t sub_21541C5E8()
{
  uint64_t v0;

  return swift_deallocObject();
}

id sub_21541C614()
{
  uint64_t v0;
  id result;

  result = *(id *)(v0 + 16);
  if (result)
    return objc_msgSend(result, sel_setTitleView_, *(_QWORD *)(v0 + 24));
  return result;
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

unint64_t sub_21541C648(uint64_t a1, uint64_t a2)
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
      sub_21541C70C(*(_QWORD *)(v2 + 48) + 40 * v4, (uint64_t)v9);
      v7 = MEMORY[0x2199E0E14](v9, a1);
      sub_21541C748((uint64_t)v9);
      if ((v7 & 1) != 0)
        break;
      v4 = (v4 + 1) & v6;
    }
    while (((*(_QWORD *)(v2 + 64 + ((v4 >> 3) & 0xFFFFFFFFFFFFF8)) >> v4) & 1) != 0);
  }
  return v4;
}

uint64_t sub_21541C70C(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 16))(a2, a1);
  return a2;
}

uint64_t sub_21541C748(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(MEMORY[0x24BEE23D0] - 8) + 8))();
  return a1;
}

uint64_t sub_21541C77C()
{
  id v0;
  void *v1;
  uint64_t v2;
  unint64_t v3;
  char v4;
  uint64_t v6;
  __int128 v7;
  __int128 v8;

  v0 = objc_msgSend((id)objc_opt_self(), sel_assistantLanguageTitlesDictionary);
  if (!v0 || (v1 = v0, v2 = sub_21542A260(), v1, !v2))
  {
    v7 = 0u;
    v8 = 0u;
LABEL_11:
    sub_21541C8BC((uint64_t)&v7);
    return 0;
  }
  swift_bridgeObjectRetain();
  sub_21542A3D4();
  if (*(_QWORD *)(v2 + 16) && (v3 = sub_21541C40C((uint64_t)&v6), (v4 & 1) != 0))
  {
    sub_21541C8FC(*(_QWORD *)(v2 + 56) + 32 * v3, (uint64_t)&v7);
  }
  else
  {
    v7 = 0u;
    v8 = 0u;
  }
  swift_bridgeObjectRelease();
  sub_21541C748((uint64_t)&v6);
  if (!*((_QWORD *)&v8 + 1))
    goto LABEL_11;
  if ((swift_dynamicCast() & 1) != 0)
    return v6;
  return 0;
}

uint64_t sub_21541C8BC(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3050);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_21541C8FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void sub_21541C938()
{
  strcpy((char *)&qword_254DC3058, "com.apple.siri");
  unk_254DC3067 = -18;
}

uint64_t sub_21541C968()
{
  uint64_t v0;

  v0 = sub_21542A0D4();
  __swift_allocate_value_buffer(v0, qword_254DC4030);
  __swift_project_value_buffer(v0, (uint64_t)qword_254DC4030);
  if (qword_254DC2DE0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_21542A0C8();
}

uint64_t sub_21541CA18()
{
  uint64_t v0;

  v0 = sub_21542A0D4();
  __swift_allocate_value_buffer(v0, qword_254DC4048);
  __swift_project_value_buffer(v0, (uint64_t)qword_254DC4048);
  if (qword_254DC2DE0 != -1)
    swift_once();
  swift_bridgeObjectRetain();
  return sub_21542A0C8();
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_21541CB24(uint64_t a1)
{
  int64_t v1;
  uint64_t v2;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  __int128 v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v1 = *(_QWORD *)(a1 + 16);
  v2 = MEMORY[0x24BEE4AF8];
  if (v1)
  {
    v14 = MEMORY[0x24BEE4AF8];
    sub_21541E2F8(0, v1, 0);
    v2 = v14;
    v4 = (uint64_t *)(a1 + 40);
    v5 = MEMORY[0x24BEE0D00];
    do
    {
      v7 = *(v4 - 1);
      v6 = *v4;
      v14 = v2;
      v8 = *(_QWORD *)(v2 + 16);
      v9 = *(_QWORD *)(v2 + 24);
      swift_bridgeObjectRetain();
      if (v8 >= v9 >> 1)
      {
        sub_21541E2F8(v9 > 1, v8 + 1, 1);
        v2 = v14;
      }
      v4 += 2;
      v12 = v5;
      v13 = sub_21541EAE0();
      *(_QWORD *)&v11 = v7;
      *((_QWORD *)&v11 + 1) = v6;
      *(_QWORD *)(v2 + 16) = v8 + 1;
      sub_21541EB24(&v11, v2 + 40 * v8 + 32);
      --v1;
    }
    while (v1);
  }
  return v2;
}

id GMFooterUtility.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GMFooterUtility.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMFooterUtility();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for GMFooterUtility()
{
  return objc_opt_self();
}

void sub_21541CCC8(void *a1)
{
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t inited;
  uint64_t ObjCClassFromMetadata;
  id v19;
  void *v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  os_log_type_t v29;
  uint8_t *v30;
  uint64_t v31;
  id v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  uint64_t v53[3];

  if (qword_254DC2DE8 != -1)
    swift_once();
  v2 = sub_21542A0D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DC4030);
  v3 = sub_21542A0BC();
  v4 = sub_21542A350();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = swift_slowAlloc();
    v6 = swift_slowAlloc();
    v53[0] = v6;
    *(_DWORD *)v5 = 136315394;
    sub_21541DCB8(0xD000000000000018, 0x80000002154330A0, v53);
    sub_21542A38C();
    *(_WORD *)(v5 + 12) = 2080;
    if (qword_254DC2DF8 != -1)
      swift_once();
    v7 = (uint64_t *)(qword_254DC3378 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
    swift_beginAccess();
    v8 = GMEligibilityContext.description.getter(*v7);
    sub_21541DCB8(v8, v9, v53);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2153F2000, v3, v4, "%s Choosing footer for eligibility: %s", (uint8_t *)v5, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v6, -1, -1);
    MEMORY[0x2199E17B0](v5, -1, -1);

  }
  else
  {

  }
  if (qword_254DC2DF8 != -1)
    swift_once();
  v10 = (_QWORD *)(qword_254DC3378 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  switch(*v10)
  {
    case 2:
    case 3:
    case 6:
    case 0xBLL:
    case 0xELL:
    case 0x13:
    case 0x16:
      goto LABEL_29;
    case 4:
    case 0xALL:
    case 0x15:
      v11 = (id)MobileGestalt_get_current_device();
      if (!v11)
      {
        __break(1u);
        goto LABEL_36;
      }
      v12 = v11;
      v13 = (id)MobileGestalt_copy_deviceClass_obj();

      if (!v13)
      {
LABEL_36:
        __break(1u);
        JUMPOUT(0x21541D8FCLL);
      }
      v14 = sub_21542A2A8();
      v16 = v15;

      __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3068);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = xmmword_21542D4A0;
      *(_QWORD *)(inited + 32) = v14;
      *(_QWORD *)(inited + 40) = v16;
      type metadata accessor for GMFooterUtility();
      ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
      v19 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
      sub_215429E94();

      sub_21541CB24(inited);
      sub_21542A2B4();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v20 = (void *)sub_21542A284();
      swift_bridgeObjectRelease();
      objc_msgSend(a1, sel_setProperty_forKey_, v20, *MEMORY[0x24BE75A68], 0xE000000000000000);

      swift_setDeallocating();
      swift_arrayDestroy();
      return;
    case 5:
    case 0xCLL:
      type metadata accessor for GMFooterUtility();
      v21 = swift_getObjCClassFromMetadata();
      v22 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v21);
      goto LABEL_19;
    case 7:
    case 8:
    case 9:
      type metadata accessor for GMFooterUtility();
      v23 = swift_getObjCClassFromMetadata();
      v24 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v23);
      v25 = sub_215429E94();
      v27 = v26;

      sub_21541D9A4(v25, v27, a1);
      swift_bridgeObjectRelease();
      return;
    case 0xFLL:
      v33 = objc_msgSend((id)objc_opt_self(), sel_currentDevice);
      objc_msgSend(v33, sel_sf_isiPad);

      v34 = sub_21541E4B4();
      if (v35)
      {
        v36 = v34;
        v37 = v35;
        __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3068);
        v38 = swift_allocObject();
        *(_OWORD *)(v38 + 16) = xmmword_21542D4A0;
        *(_QWORD *)(v38 + 32) = v36;
        *(_QWORD *)(v38 + 40) = v37;
      }
      else
      {
        v38 = MEMORY[0x24BEE4AF8];
      }
      type metadata accessor for GMFooterUtility();
      v45 = swift_getObjCClassFromMetadata();
      v46 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v45);
      sub_215429E94();

      if (*(_QWORD *)(v38 + 16))
      {
        sub_21541CB24(v38);
        sub_21542A2B4();
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v47 = (void *)sub_21542A284();
      swift_bridgeObjectRelease();
      objc_msgSend(a1, sel_setProperty_forKey_, v47, *MEMORY[0x24BE75A68], 0xE000000000000000);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

      return;
    case 0x10:
      v39 = objc_msgSend((id)objc_opt_self(), sel_sharedPreferences);
      v40 = objc_msgSend(v39, sel_languageCode);

      if (v40)
      {
        sub_21542A2A8();

        v41 = sub_21541C77C();
        v43 = v42;
        swift_bridgeObjectRelease();
        if (v43)
        {
          __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3068);
          v44 = swift_allocObject();
          *(_OWORD *)(v44 + 16) = xmmword_21542D4A0;
          *(_QWORD *)(v44 + 32) = v41;
          *(_QWORD *)(v44 + 40) = v43;
        }
        else
        {
          v44 = MEMORY[0x24BEE4AF8];
        }
        type metadata accessor for GMFooterUtility();
        v50 = swift_getObjCClassFromMetadata();
        v51 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v50);
        sub_215429E94();

        if (*(_QWORD *)(v44 + 16))
        {
          sub_21541CB24(v44);
          sub_21542A2B4();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
        }
        v52 = (void *)sub_21542A284();
        swift_bridgeObjectRelease();
        objc_msgSend(a1, sel_setProperty_forKey_, v52, *MEMORY[0x24BE75A68], 0xE000000000000000);
        swift_bridgeObjectRelease();

      }
      else
      {
LABEL_29:
        type metadata accessor for GMFooterUtility();
        v48 = swift_getObjCClassFromMetadata();
        v32 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v48);
LABEL_30:
        sub_215429E94();

        v49 = (void *)sub_21542A284();
        swift_bridgeObjectRelease();
        objc_msgSend(a1, sel_setProperty_forKey_, v49, *MEMORY[0x24BE75A68], 0xE000000000000000);

      }
      return;
    default:
      v28 = sub_21542A0BC();
      v29 = sub_21542A350();
      if (os_log_type_enabled(v28, v29))
      {
        v30 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v30 = 0;
        _os_log_impl(&dword_2153F2000, v28, v29, "Defaulting to empty", v30, 2u);
        MEMORY[0x2199E17B0](v30, -1, -1);
      }

      type metadata accessor for GMFooterUtility();
      v31 = swift_getObjCClassFromMetadata();
      v22 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, v31);
LABEL_19:
      v32 = v22;
      goto LABEL_30;
  }
}

id sub_21541D9A4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t ObjCClassFromMetadata;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  objc_class *v19;
  NSString *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;

  v4 = v3;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC30A0);
  MEMORY[0x24BDAC7A8](v8);
  v10 = (char *)&v30 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for GMFooterUtility();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  v12 = objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  v13 = sub_215429E94();
  v15 = v14;

  v32 = a1;
  v33 = a2;
  swift_bridgeObjectRetain();
  sub_21542A2CC();
  sub_21542A2CC();
  v17 = v32;
  v16 = v33;
  swift_bridgeObjectRetain();
  v18 = (void *)sub_21542A284();
  swift_bridgeObjectRelease();
  objc_msgSend(a3, sel_setProperty_forKey_, v18, *MEMORY[0x24BE75A68]);

  sub_21541EA58();
  v19 = (objc_class *)swift_getObjCClassFromMetadata();
  v20 = NSStringFromClass(v19);
  if (!v20)
  {
    sub_21542A2A8();
    v20 = (NSString *)sub_21542A284();
    swift_bridgeObjectRelease();
  }
  objc_msgSend(a3, sel_setProperty_forKey_, v20, *MEMORY[0x24BE75A30]);

  v32 = v17;
  v33 = v16;
  v30 = v13;
  v31 = v15;
  v21 = sub_215429F48();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v21 - 8) + 56))(v10, 1, 1, v21);
  sub_21541A928();
  v22 = sub_21542A3A4();
  v24 = v23;
  v26 = v25;
  sub_21541ACA0((uint64_t)v10, &qword_254DC30A0);
  swift_bridgeObjectRelease();
  if ((v26 & 1) != 0)
    return (id)swift_bridgeObjectRelease();
  v32 = v22;
  v33 = v24;
  v30 = v17;
  v31 = v16;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC30B0);
  sub_21541EA94();
  v27 = sub_21542A380();
  return objc_msgSend(a3, sel_addFooterHyperlinkWithRange_target_action_, v27, v28, v4, sel_openStorageManagement);
}

id GMFooterUtility.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMFooterUtility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21541DCB8(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_21541DD88(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_21541C8FC((uint64_t)v12, *a3);
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
      sub_21541C8FC((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_21541DD88(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_21542A398();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_21541DF40(a5, a6);
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
  v8 = sub_21542A3EC();
  if (!v8)
  {
    sub_21542A3F8();
    __break(1u);
LABEL_17:
    result = sub_21542A410();
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

uint64_t sub_21541DF40(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_21541DFD4(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_21541E1AC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_21541E1AC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_21541DFD4(uint64_t a1, unint64_t a2)
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
      v3 = sub_21541E148(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_21542A3E0();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_21542A3F8();
      __break(1u);
LABEL_10:
      v2 = sub_21542A2D8();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_21542A410();
    __break(1u);
LABEL_14:
    result = sub_21542A3F8();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_21541E148(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3098);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_21541E1AC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3098);
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
  result = sub_21542A410();
  __break(1u);
  return result;
}

uint64_t sub_21541E2F8(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_21541E314(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_21541E314(char a1, int64_t a2, char a3, _QWORD *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = a4[3];
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
  v8 = a4[2];
  if (v7 <= v8)
    v9 = a4[2];
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC30C8);
    v10 = (_QWORD *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v10[2] = v8;
    v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
  }
  else
  {
    v10 = (_QWORD *)MEMORY[0x24BEE4AF8];
  }
  v12 = (unint64_t)(v10 + 4);
  v13 = (unint64_t)(a4 + 4);
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= v13 + 40 * v8)
      memmove(v10 + 4, a4 + 4, 40 * v8);
    a4[2] = 0;
    goto LABEL_28;
  }
  if (v13 >= v12 + 40 * v8 || v12 >= v13 + 40 * v8)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC30D0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_21542A410();
  __break(1u);
  return result;
}

uint64_t sub_21541E4B4()
{
  uint64_t v0;
  uint64_t v1;
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
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  void (*v23)(char *, uint64_t);
  void (*v24)(char *, uint64_t);
  uint64_t v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(char *, uint64_t);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC30D8);
  MEMORY[0x24BDAC7A8](v0);
  v40 = (char *)&v37 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_215429F30();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x24BDAC7A8](v2);
  v6 = (char *)&v37 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v4);
  v8 = (char *)&v37 - v7;
  v9 = sub_215429F48();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = MEMORY[0x24BDAC7A8](v9);
  v39 = (char *)&v37 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v37 - v14;
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v37 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC30E0);
  MEMORY[0x24BDAC7A8](v18);
  v20 = (char *)&v37 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_215429F0C();
  sub_215429F3C();
  v21 = v9;
  v22 = v9;
  v23 = *(void (**)(char *, uint64_t))(v10 + 8);
  v23(v17, v22);
  sub_215429F18();
  v24 = *(void (**)(char *, uint64_t))(v3 + 8);
  v24(v8, v2);
  v25 = sub_215429EDC();
  v26 = *(_QWORD *)(v25 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v26 + 48))(v20, 1, v25) == 1)
  {
    v27 = &qword_254DC30E0;
    v28 = (uint64_t)v20;
  }
  else
  {
    v37 = sub_215429ED0();
    v38 = v29;
    (*(void (**)(char *, uint64_t))(v26 + 8))(v20, v25);
    sub_215429F0C();
    sub_215429F3C();
    v30 = v23;
    v23(v15, v21);
    v31 = v40;
    sub_215429F24();
    v24(v6, v2);
    v32 = sub_215429F00();
    v33 = *(_QWORD *)(v32 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v33 + 48))(v31, 1, v32) != 1)
    {
      sub_215429ED0();
      (*(void (**)(char *, uint64_t))(v33 + 8))(v31, v32);
      v35 = v39;
      sub_215429F0C();
      v41 = v37;
      v42 = v38;
      sub_21542A2CC();
      sub_21542A2CC();
      swift_bridgeObjectRelease();
      v34 = sub_215429EE8();
      swift_bridgeObjectRelease();
      v30(v35, v21);
      return v34;
    }
    swift_bridgeObjectRelease();
    v27 = &qword_254DC30D8;
    v28 = (uint64_t)v31;
  }
  sub_21541ACA0(v28, v27);
  return 0;
}

uint64_t method lookup function for GMFooterUtility()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GMFooterUtility.updateFooter(specifier:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x50))();
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

unint64_t sub_21541EA58()
{
  unint64_t result;

  result = qword_254DC30A8;
  if (!qword_254DC30A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_254DC30A8);
  }
  return result;
}

unint64_t sub_21541EA94()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DC30B8;
  if (!qword_254DC30B8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_254DC30B0);
    result = MEMORY[0x2199E1738](MEMORY[0x24BEE1BC0], v1);
    atomic_store(result, (unint64_t *)&qword_254DC30B8);
  }
  return result;
}

unint64_t sub_21541EAE0()
{
  unint64_t result;

  result = qword_254DC30C0;
  if (!qword_254DC30C0)
  {
    result = MEMORY[0x2199E1738](MEMORY[0x24BDCFB50], MEMORY[0x24BEE0D00]);
    atomic_store(result, (unint64_t *)&qword_254DC30C0);
  }
  return result;
}

uint64_t sub_21541EB24(__int128 *a1, uint64_t a2)
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

uint64_t sub_21541EB3C@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *a1 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  v4 = sub_21542A014();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, v3, v4);
}

uint64_t sub_21541EBA4(uint64_t a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v10;

  v4 = sub_21542A014();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v10 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v8 = *a2 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  (*(void (**)(uint64_t, char *, uint64_t))(v5 + 40))(v8, v7, v4);
  return swift_endAccess();
}

uint64_t sub_21541EC68@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;

  v3 = v1 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  v4 = sub_21542A014();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

id GMAvailabilityProvider.__allocating_init(provider:)(uint64_t a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return GMAvailabilityProvider.init(provider:)(a1);
}

id GMAvailabilityProvider.init(provider:)(uint64_t a1)
{
  char *v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  char *v16;
  objc_class *v17;
  id v18;
  objc_super v20;

  v3 = sub_215429FB4();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC30E8);
  MEMORY[0x24BDAC7A8](v7);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_21542A014();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x24BDAC7A8](v10);
  v13 = (char *)&v20 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_21541EEB0(a1, (uint64_t)v9);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10) == 1)
  {
    v14 = v1;
    sub_215429FA8();
    sub_21542A008();
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
    sub_21541EEF8((uint64_t)v9);
    (*(void (**)(char *, char *, uint64_t))(v11 + 32))(&v1[OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider], v13, v10);
  }
  else
  {
    v15 = *(void (**)(char *, char *, uint64_t))(v11 + 32);
    v15(v13, v9, v10);
    v16 = v1;
    v15(&v1[OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider], v13, v10);
  }

  v17 = (objc_class *)type metadata accessor for GMAvailabilityProvider();
  v20.receiver = v1;
  v20.super_class = v17;
  v18 = objc_msgSendSuper2(&v20, sel_init);
  sub_21541EEF8(a1);
  return v18;
}

uint64_t sub_21541EEB0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC30E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_21541EEF8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC30E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for GMAvailabilityProvider()
{
  uint64_t result;

  result = qword_254DC3148;
  if (!qword_254DC3148)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_21541EF74()
{
  return swift_task_switch();
}

uint64_t sub_21541EF88()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_21541F030;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_21541F0C4;
  v3[3] = &block_descriptor_0;
  v3[4] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_21541F030()
{
  return swift_task_switch();
}

uint64_t sub_21541F07C()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 120);
  v2 = objc_msgSend(v1, sel_status);

  return (*(uint64_t (**)(id))(v0 + 8))(v2);
}

uint64_t sub_21541F0C4(uint64_t a1, void *a2)
{
  id v2;

  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  v2 = a2;
  return swift_continuation_resume();
}

uint64_t sub_21541F0F4()
{
  return swift_task_switch();
}

uint64_t sub_21541F108()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_21541F1B0;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_21541F0C4;
  v3[3] = &block_descriptor_1;
  v3[4] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_21541F1B0()
{
  return swift_task_switch();
}

uint64_t sub_21541F1FC()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + 120);
  v2 = objc_msgSend(v1, sel_unavailabiltyReasons);

  return (*(uint64_t (**)(id))(v0 + 8))(v2);
}

uint64_t sub_21541F244()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v1 = sub_21542A014();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  sub_215429FC0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

id GMAvailabilityProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void GMAvailabilityProvider.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id GMAvailabilityProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMAvailabilityProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_21541F3E8()
{
  return swift_task_switch();
}

uint64_t sub_21541F3FC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_21541F030;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_21541F0C4;
  v3[3] = &block_descriptor_7;
  v3[4] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_21541F4A4()
{
  return swift_task_switch();
}

uint64_t sub_21541F4B8()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)objc_opt_self();
  v0[7] = v0 + 15;
  v0[2] = v0;
  v0[3] = sub_21541F1B0;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_21541F0C4;
  v3[3] = &block_descriptor_6;
  v3[4] = v2;
  objc_msgSend(v1, sel_currentAvailabilityWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_21541F560()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v7;

  v1 = sub_21542A014();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v7 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, v1);
  sub_215429FC0();
  return (*(uint64_t (**)(char *, uint64_t))(v2 + 8))(v4, v1);
}

uint64_t sub_21541F620@<X0>(uint64_t a1@<X8>)
{
  _QWORD *v1;
  uint64_t v3;
  uint64_t v4;

  v3 = *v1 + OBJC_IVAR____TtC24AssistantSettingsSupport22GMAvailabilityProvider_provider;
  swift_beginAccess();
  v4 = sub_21542A014();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, v3, v4);
}

uint64_t dispatch thunk of GMAvailabilityProviding.availabilityStatus()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21541F958;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GMAvailabilityProviding.unavailabilityReason()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21541F958;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GMAvailabilityProviding.availability()(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 24))();
}

uint64_t dispatch thunk of GMAvailabilityProviding.provider.getter(uint64_t a1, uint64_t a2)
{
  return (*(uint64_t (**)(void))(a2 + 32))();
}

uint64_t sub_21541F778()
{
  return type metadata accessor for GMAvailabilityProvider();
}

uint64_t sub_21541F780()
{
  uint64_t result;
  unint64_t v1;

  result = sub_21542A014();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for GMAvailabilityProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GMAvailabilityProvider.provider.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x58))();
}

uint64_t dispatch thunk of GMAvailabilityProvider.__allocating_init(provider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of GMAvailabilityProvider.availabilityStatus()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x78);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F884;
  return v5();
}

uint64_t sub_21541F884(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t dispatch thunk of GMAvailabilityProvider.unavailabilityReason()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x80);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F958;
  return v5();
}

uint64_t dispatch thunk of GMAvailabilityProvider.availability()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t sub_21541F95C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 160) = v0;
  return swift_task_switch();
}

uint64_t sub_21541F974()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)objc_opt_self();
  v2 = sub_21542A284();
  v0[21] = v2;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_21541FA40;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_21541FCF0;
  v4[3] = &block_descriptor_1;
  v4[4] = v3;
  objc_msgSend(v1, sel_getTicketForFeature_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_21541FA40()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21541FAA0()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 144);

  v2 = sub_21542A068();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_21541FAE4()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;

  v1 = *(void **)(v0 + 168);
  swift_willThrow();

  if (qword_254DC2DF0 != -1)
    swift_once();
  v2 = *(void **)(v0 + 176);
  v3 = sub_21542A0D4();
  __swift_project_value_buffer(v3, (uint64_t)qword_254DC4048);
  v4 = v2;
  v5 = v2;
  v6 = sub_21542A0BC();
  v7 = sub_21542A344();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 176);
  if (v8)
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v17 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_getErrorValue();
    v12 = sub_21542A458();
    *(_QWORD *)(v0 + 80) = sub_21541DCB8(v12, v13, &v17);
    sub_21542A38C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2153F2000, v6, v7, "#gmenrollment Error trying to enroll into queue %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v11, -1, -1);
    MEMORY[0x2199E17B0](v10, -1, -1);
  }
  else
  {

  }
  v14 = *(void **)(v0 + 176);
  sub_21542A05C();
  v15 = sub_21542A02C();

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
}

uint64_t sub_21541FCF4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 160) = v0;
  return swift_task_switch();
}

uint64_t sub_21541FD0C()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = (void *)objc_opt_self();
  v2 = sub_21542A284();
  v0[21] = v2;
  v0[7] = v0 + 18;
  v0[2] = v0;
  v0[3] = sub_21541FDD8;
  v3 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v4 = v0 + 10;
  v4[1] = 0x40000000;
  v4[2] = sub_21541FCF0;
  v4[3] = &block_descriptor_1_0;
  v4[4] = v3;
  objc_msgSend(v1, sel_getTicketStatusForFeature_completionHandler_, v2, v4);
  return swift_continuation_await();
}

uint64_t sub_21541FDD8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 176) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_21541FE38()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 144);

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_21541FE70()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  _BOOL4 v8;
  void *v9;
  uint8_t *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v17;

  v1 = *(void **)(v0 + 168);
  swift_willThrow();

  if (qword_254DC2DF0 != -1)
    swift_once();
  v2 = *(void **)(v0 + 176);
  v3 = sub_21542A0D4();
  __swift_project_value_buffer(v3, (uint64_t)qword_254DC4048);
  v4 = v2;
  v5 = v2;
  v6 = sub_21542A0BC();
  v7 = sub_21542A344();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(void **)(v0 + 176);
  if (v8)
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = swift_slowAlloc();
    v17 = v11;
    *(_DWORD *)v10 = 136315138;
    swift_getErrorValue();
    v12 = sub_21542A458();
    *(_QWORD *)(v0 + 80) = sub_21541DCB8(v12, v13, &v17);
    sub_21542A38C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_2153F2000, v6, v7, "#gmenrollment Error trying to get ticket status %s", v10, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v11, -1, -1);
    MEMORY[0x2199E17B0](v10, -1, -1);
  }
  else
  {

  }
  v14 = *(void **)(v0 + 176);
  sub_21542A05C();
  v15 = sub_21542A02C();

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v15);
}

uint64_t sub_21542007C(uint64_t result, void *a2, void *a3)
{
  _QWORD *v4;
  id v5;
  id v6;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC31D8);
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

id GMEnrollmentProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GMEnrollmentProvider.init()()
{
  char *v0;
  char *v1;
  objc_super v3;

  v1 = &v0[OBJC_IVAR____TtC24AssistantSettingsSupport20GMEnrollmentProvider_featureName];
  *(_QWORD *)v1 = 0x6C6C2E64756F6C63;
  *((_QWORD *)v1 + 1) = 0xE90000000000006DLL;
  v3.receiver = v0;
  v3.super_class = (Class)type metadata accessor for GMEnrollmentProvider();
  return objc_msgSendSuper2(&v3, sel_init);
}

id GMEnrollmentProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMEnrollmentProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_215420228()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F958;
  v3[20] = v2;
  return swift_task_switch();
}

uint64_t sub_215420288()
{
  uint64_t *v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;

  v2 = *v0;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F958;
  v3[20] = v2;
  return swift_task_switch();
}

uint64_t type metadata accessor for GMEnrollmentProvider()
{
  return objc_opt_self();
}

uint64_t dispatch thunk of GMEnrollmentProviding.enroll()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 8) + *(_QWORD *)(a2 + 8));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21541F958;
  return v7(a1, a2);
}

uint64_t dispatch thunk of GMEnrollmentProviding.status()(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(a2 + 16) + *(_QWORD *)(a2 + 16));
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_21541F958;
  return v7(a1, a2);
}

uint64_t method lookup function for GMEnrollmentProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GMEnrollmentProvider.enroll()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x58);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F884;
  return v5();
}

uint64_t dispatch thunk of GMEnrollmentProvider.status()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x60);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F958;
  return v5();
}

unint64_t GMEligibilityContext.init(rawValue:)(unint64_t a1)
{
  return sub_215421444(a1);
}

BOOL sub_2154204D8(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_2154204EC()
{
  sub_21542A464();
  sub_21542A470();
  return sub_21542A47C();
}

uint64_t sub_215420530()
{
  return sub_21542A470();
}

uint64_t sub_215420558()
{
  sub_21542A464();
  sub_21542A470();
  return sub_21542A47C();
}

unint64_t sub_215420598@<X0>(unint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  char v4;

  result = sub_215421444(*a1);
  *(_QWORD *)a2 = result;
  *(_BYTE *)(a2 + 8) = v4 & 1;
  return result;
}

void sub_2154205C8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t GMEligibilityContext.description.getter(uint64_t a1)
{
  uint64_t result;

  result = 0xD000000000000019;
  switch(a1)
  {
    case 0:
      result = 0x6E776F6E6B6E75;
      break;
    case 1:
      result = 0x6E6564646968;
      break;
    case 2:
      return result;
    case 3:
      result = 0xD000000000000013;
      break;
    case 4:
      result = 0x6465756575716E65;
      break;
    case 5:
      result = 0x6E45657669746361;
      break;
    case 6:
      result = 0x646574696D696CLL;
      break;
    case 7:
      result = 0xD000000000000019;
      break;
    case 8:
      result = 0xD00000000000001DLL;
      break;
    case 9:
      result = 0xD000000000000017;
      break;
    case 10:
      result = 0xD00000000000001BLL;
      break;
    case 11:
      result = 0xD00000000000001FLL;
      break;
    case 12:
      result = 0xD00000000000001ALL;
      break;
    case 13:
    case 17:
    case 19:
      result = 0xD000000000000010;
      break;
    case 14:
      result = 0xD000000000000019;
      break;
    case 15:
      result = 0xD00000000000001ALL;
      break;
    case 16:
      result = 0xD00000000000001ELL;
      break;
    case 18:
      result = 0x646574704F746F6ELL;
      break;
    case 20:
      result = 0xD00000000000001FLL;
      break;
    case 21:
      result = 0xD00000000000001BLL;
      break;
    case 22:
      result = 0xD000000000000016;
      break;
    default:
      result = sub_21542A44C();
      __break(1u);
      break;
  }
  return result;
}

uint64_t sub_2154207FC()
{
  uint64_t *v0;

  return GMEligibilityContext.description.getter(*v0);
}

uint64_t sub_215420804(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  id v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;

  v4 = sub_215429F90();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x24BDAC7A8](v4);
  v7 = (char *)&v38 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC2DF0 != -1)
    swift_once();
  v8 = sub_21542A0D4();
  __swift_project_value_buffer(v8, (uint64_t)qword_254DC4048);
  (*(void (**)(char *, uint64_t, uint64_t))(v5 + 16))(v7, a1, v4);
  v9 = a2;
  v10 = sub_21542A0BC();
  v11 = sub_21542A338();
  if (os_log_type_enabled(v10, v11))
  {
    v12 = swift_slowAlloc();
    v39 = swift_slowAlloc();
    v41 = v39;
    *(_DWORD *)v12 = 136315394;
    v38 = v12 + 4;
    sub_215429F84();
    sub_215429F78();
    sub_2154214AC();
    v13 = sub_21542A32C();
    v15 = v14;
    swift_bridgeObjectRelease();
    v40 = sub_21541DCB8(v13, v15, &v41);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    *(_WORD *)(v12 + 12) = 2080;
    v16 = sub_21542A050();
    v40 = sub_21541DCB8(v16, v17, &v41);
    sub_21542A38C();

    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2153F2000, v10, v11, "Getting context for Unavailability: %s TicketStatus: %s", (uint8_t *)v12, 0x16u);
    v18 = v39;
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v18, -1, -1);
    MEMORY[0x2199E17B0](v12, -1, -1);

  }
  else
  {
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  }
  v19 = sub_21542A050();
  v21 = v20;
  sub_21542A05C();
  v22 = (void *)sub_21542A02C();
  v23 = sub_21542A050();
  v25 = v24;

  if (v23 == v19 && v25 == v21)
  {
    swift_bridgeObjectRelease_n();
    return 3;
  }
  else
  {
    v27 = sub_21542A440();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 3;
    }
    else
    {
      v28 = (void *)sub_21542A044();
      v29 = sub_21542A050();
      v31 = v30;

      if (v29 == v19 && v31 == v21)
      {
        swift_bridgeObjectRelease_n();
        return 4;
      }
      else
      {
        v32 = sub_21542A440();
        swift_bridgeObjectRelease();
        if ((v32 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v33 = (void *)sub_21542A038();
          v34 = sub_21542A050();
          v36 = v35;

          if (v34 == v19 && v36 == v21)
          {
            swift_bridgeObjectRelease_n();
            return 5;
          }
          else
          {
            v37 = sub_21542A440();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v37 & 1) != 0)
              return 5;
            else
              return 3;
          }
        }
      }
    }
  }
}

uint64_t sub_215420C24(uint64_t a1)
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  void (*v17)(char *, uint64_t, uint64_t);
  NSObject *v18;
  os_log_type_t v19;
  uint64_t v20;
  uint8_t *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  uint8_t *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t, uint64_t);
  char v33;
  void (*v34)(char *, uint64_t);
  char *v35;
  uint64_t v36;
  uint64_t v37;
  void (*v38)(char *, uint64_t, uint64_t);
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char v42;
  char *v43;
  BOOL v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char v48;
  char *v49;
  char *v50;
  uint64_t v51;
  char v52;
  char *v53;
  uint64_t v55;
  char v56;
  char *v57;
  uint64_t v58;
  char v59;
  uint64_t v60;
  char v61;
  uint64_t v62;
  char v63;
  uint8_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  char *v69;
  char *v70;
  uint64_t v71;
  void (*v72)(char *, uint64_t, uint64_t);
  void (*v73)(char *, uint64_t);
  uint64_t v74;
  uint64_t v75;

  v2 = sub_215429F78();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x24BDAC7A8](v2);
  v5 = (char *)&v64 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_215429F90();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v68 = (char *)&v64 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = MEMORY[0x24BDAC7A8](v8);
  v69 = (char *)&v64 - v11;
  v12 = MEMORY[0x24BDAC7A8](v10);
  v70 = (char *)&v64 - v13;
  MEMORY[0x24BDAC7A8](v12);
  v15 = (char *)&v64 - v14;
  if (qword_254DC2DF0 != -1)
    swift_once();
  v16 = sub_21542A0D4();
  __swift_project_value_buffer(v16, (uint64_t)qword_254DC4048);
  v17 = *(void (**)(char *, uint64_t, uint64_t))(v7 + 16);
  v71 = a1;
  v72 = v17;
  v17(v15, a1, v6);
  v18 = sub_21542A0BC();
  v19 = sub_21542A338();
  if (os_log_type_enabled(v18, v19))
  {
    v20 = swift_slowAlloc();
    v67 = v2;
    v21 = (uint8_t *)v20;
    v65 = swift_slowAlloc();
    v75 = v65;
    v66 = v3;
    v64 = v21;
    *(_DWORD *)v21 = 136315138;
    v73 = (void (*)(char *, uint64_t))(v21 + 4);
    sub_215429F84();
    sub_2154214AC();
    v22 = v6;
    v23 = sub_21542A32C();
    v25 = v24;
    swift_bridgeObjectRelease();
    v26 = v23;
    v6 = v22;
    v74 = sub_21541DCB8(v26, v25, &v75);
    v3 = v66;
    sub_21542A38C();
    swift_bridgeObjectRelease();
    v73 = *(void (**)(char *, uint64_t))(v7 + 8);
    v73(v15, v22);
    v27 = v64;
    _os_log_impl(&dword_2153F2000, v18, v19, "Getting context for Unavailability: %s", v64, 0xCu);
    v28 = v65;
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v28, -1, -1);
    v2 = v67;
    MEMORY[0x2199E17B0](v27, -1, -1);
  }
  else
  {
    v73 = *(void (**)(char *, uint64_t))(v7 + 8);
    v73(v15, v6);
  }

  v29 = v71;
  v30 = sub_215429F84();
  v31 = *MEMORY[0x24BE3BEC0];
  v32 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 104);
  v32(v5, v31, v2);
  v33 = sub_2154214F4((uint64_t)v5, v30);
  swift_bridgeObjectRelease();
  v34 = *(void (**)(char *, uint64_t))(v3 + 8);
  v34(v5, v2);
  v35 = v70;
  v36 = v6;
  v37 = v6;
  v38 = v72;
  v72(v70, v29, v36);
  if ((v33 & 1) != 0)
  {
    v39 = sub_215429F84();
    LODWORD(v67) = v31;
    v40 = v35;
    v41 = v39;
    v32(v5, *MEMORY[0x24BE3BEB8], v2);
    v42 = sub_2154214F4((uint64_t)v5, v41);
    swift_bridgeObjectRelease();
    v34(v5, v2);
    v43 = v40;
    v31 = v67;
    v73(v43, v37);
    if ((v42 & 1) != 0)
    {
      sub_21542A0B0();
      v44 = (sub_21542A0A4() & 1) == 0;
      v45 = 7;
      v46 = 9;
      goto LABEL_25;
    }
  }
  else
  {
    v73(v35, v37);
  }
  v47 = sub_215429F84();
  v32(v5, v31, v2);
  v48 = sub_2154214F4((uint64_t)v5, v47);
  swift_bridgeObjectRelease();
  v34(v5, v2);
  v49 = v69;
  v38(v69, v29, v37);
  if ((v48 & 1) != 0)
  {
    v50 = v49;
    v51 = sub_215429F84();
    v32(v5, *MEMORY[0x24BE3BEA8], v2);
    v52 = sub_2154214F4((uint64_t)v5, v51);
    swift_bridgeObjectRelease();
    v34(v5, v2);
    v53 = v50;
    v38 = v72;
    v73(v53, v37);
    if ((v52 & 1) != 0)
    {
      sub_21542A0B0();
      if ((sub_21542A0A4() & 1) != 0)
        return 22;
      else
        return 21;
    }
  }
  else
  {
    v73(v49, v37);
  }
  v55 = sub_215429F84();
  v32(v5, v31, v2);
  v56 = sub_2154214F4((uint64_t)v5, v55);
  swift_bridgeObjectRelease();
  v34(v5, v2);
  v57 = v68;
  v38(v68, v29, v37);
  if ((v56 & 1) != 0)
  {
    v58 = sub_215429F84();
    v32(v5, *MEMORY[0x24BE3BEA8], v2);
    v59 = sub_2154214F4((uint64_t)v5, v58);
    swift_bridgeObjectRelease();
    v34(v5, v2);
    v73(v57, v37);
    if ((v59 & 1) == 0)
      return 22;
  }
  else
  {
    v73(v57, v37);
  }
  v60 = sub_215429F84();
  v32(v5, *MEMORY[0x24BE3BED0], v2);
  v61 = sub_2154214F4((uint64_t)v5, v60);
  swift_bridgeObjectRelease();
  v34(v5, v2);
  if ((v61 & 1) == 0)
  {
    v62 = sub_215429F84();
    v32(v5, *MEMORY[0x24BE3BEA8], v2);
    v63 = sub_2154214F4((uint64_t)v5, v62);
    swift_bridgeObjectRelease();
    v34(v5, v2);
    v44 = (v63 & 1) == 0;
    v45 = 5;
    v46 = 12;
LABEL_25:
    if (v44)
      return v45;
    else
      return v46;
  }
  sub_21542A0B0();
  if ((sub_21542A0A4() & 1) != 0)
    return 11;
  else
    return 10;
}

uint64_t sub_21542128C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;

  v0 = sub_21542A050();
  v2 = v1;
  sub_21542A05C();
  v3 = (void *)sub_21542A038();
  v4 = sub_21542A050();
  v6 = v5;

  if (v4 == v0 && v6 == v2)
  {
    swift_bridgeObjectRelease_n();
    return 5;
  }
  else
  {
    v8 = sub_21542A440();
    swift_bridgeObjectRelease();
    if ((v8 & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 5;
    }
    else
    {
      v9 = (void *)sub_21542A044();
      v10 = sub_21542A050();
      v12 = v11;

      if (v10 == v0 && v12 == v2)
      {
        swift_bridgeObjectRelease_n();
        return 4;
      }
      else
      {
        v13 = sub_21542A440();
        swift_bridgeObjectRelease();
        if ((v13 & 1) != 0)
        {
          swift_bridgeObjectRelease();
          return 4;
        }
        else
        {
          v14 = (void *)sub_21542A02C();
          v15 = sub_21542A050();
          v17 = v16;

          if (v15 == v0 && v17 == v2)
          {
            swift_bridgeObjectRelease_n();
            return 3;
          }
          else
          {
            v18 = sub_21542A440();
            swift_bridgeObjectRelease();
            swift_bridgeObjectRelease();
            if ((v18 & 1) != 0)
              return 3;
            else
              return 0;
          }
        }
      }
    }
  }
}

unint64_t sub_215421444(unint64_t result)
{
  if (result > 0x16)
    return 0;
  return result;
}

unint64_t sub_215421458()
{
  unint64_t result;

  result = qword_254DC31E0;
  if (!qword_254DC31E0)
  {
    result = MEMORY[0x2199E1738](&protocol conformance descriptor for GMEligibilityContext, &type metadata for GMEligibilityContext);
    atomic_store(result, (unint64_t *)&qword_254DC31E0);
  }
  return result;
}

ValueMetadata *type metadata accessor for GMEligibilityContext()
{
  return &type metadata for GMEligibilityContext;
}

unint64_t sub_2154214AC()
{
  unint64_t result;
  uint64_t v1;

  result = qword_254DC31E8;
  if (!qword_254DC31E8)
  {
    v1 = sub_215429F78();
    result = MEMORY[0x2199E1738](MEMORY[0x24BE3BFA0], v1);
    atomic_store(result, (unint64_t *)&qword_254DC31E8);
  }
  return result;
}

uint64_t sub_2154214F4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_215429F78();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_21541A220((unint64_t *)&qword_254DC31E8, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF80], MEMORY[0x24BE3BFA0]), v6 = sub_21542A26C(), v7 = -1 << *(_BYTE *)(a2 + 32), v8 = v6 & ~v7, ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_21541A220(&qword_254DC3338, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BF80], MEMORY[0x24BE3BFA8]);
      v12 = sub_21542A278();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_215421678(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(char *, unint64_t, uint64_t);
  char v12;
  uint64_t v14;
  uint64_t v15;

  v3 = sub_215429F54();
  v15 = *(_QWORD *)(v3 - 8);
  MEMORY[0x24BDAC7A8](v3);
  v5 = (char *)&v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_QWORD *)(a2 + 16)
    && (sub_21541A220(&qword_254DC3340, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BE28], MEMORY[0x24BE3BE38]),
        v6 = sub_21542A26C(),
        v7 = -1 << *(_BYTE *)(a2 + 32),
        v8 = v6 & ~v7,
        ((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0))
  {
    v9 = ~v7;
    v10 = *(_QWORD *)(v15 + 72);
    v11 = *(void (**)(char *, unint64_t, uint64_t))(v15 + 16);
    do
    {
      v11(v5, *(_QWORD *)(a2 + 48) + v10 * v8, v3);
      sub_21541A220(&qword_254DC3348, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BE28], MEMORY[0x24BE3BE40]);
      v12 = sub_21542A278();
      (*(void (**)(char *, uint64_t))(v15 + 8))(v5, v3);
      if ((v12 & 1) != 0)
        break;
      v8 = (v8 + 1) & v9;
    }
    while (((*(_QWORD *)(a2 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0);
  }
  else
  {
    v12 = 0;
  }
  return v12 & 1;
}

uint64_t sub_215421844()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  return MEMORY[0x2199E1834](v1);
}

uint64_t sub_2154218DC()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*sub_215421934(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___GMSpecifierController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x2199E1834](v5);
  return sub_2154219A4;
}

void sub_2154219A4(void **a1, char a2)
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

id GMSpecifierController.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id GMSpecifierController.init()()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  objc_class *v9;
  char *v10;
  id v11;
  char *v12;
  objc_class *v13;
  id v14;
  char *v15;
  objc_class *v16;
  id v17;
  char *v18;
  objc_class *v19;
  id v20;
  objc_super v22;

  v1 = sub_215429F9C();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x24BDAC7A8](v1);
  v4 = (char *)&v22 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(qword_254DC30E8);
  MEMORY[0x24BDAC7A8](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v0[OBJC_IVAR___GMSpecifierController_availabilityNotifications] = 0;
  v8 = sub_21542A014();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(v7, 1, 1, v8);
  v9 = (objc_class *)type metadata accessor for GMAvailabilityProvider();
  objc_allocWithZone(v9);
  v10 = v0;
  v11 = GMAvailabilityProvider.init(provider:)((uint64_t)v7);
  v12 = &v10[OBJC_IVAR___GMSpecifierController_availabilityProvider];
  *((_QWORD *)v12 + 3) = v9;
  *((_QWORD *)v12 + 4) = &protocol witness table for GMAvailabilityProvider;
  *(_QWORD *)v12 = v11;
  __swift_project_boxed_opaque_existential_1(v12, (uint64_t)v9);
  sub_21541F560();
  (*(void (**)(char *, char *, uint64_t))(v2 + 32))(&v10[OBJC_IVAR___GMSpecifierController_availability], v4, v1);
  v13 = (objc_class *)type metadata accessor for GMOptInStatusProvider();
  v14 = objc_msgSend(objc_allocWithZone(v13), sel_init);
  v15 = &v10[OBJC_IVAR___GMSpecifierController_optInStatusProvider];
  *((_QWORD *)v15 + 3) = v13;
  *((_QWORD *)v15 + 4) = &protocol witness table for GMOptInStatusProvider;
  *(_QWORD *)v15 = v14;
  v16 = (objc_class *)type metadata accessor for GMEnrollmentProvider();
  v17 = objc_msgSend(objc_allocWithZone(v16), sel_init);
  v18 = &v10[OBJC_IVAR___GMSpecifierController_enrollmentProvider];
  *((_QWORD *)v18 + 3) = v16;
  *((_QWORD *)v18 + 4) = &protocol witness table for GMEnrollmentProvider;
  *(_QWORD *)v18 = v17;

  v19 = (objc_class *)type metadata accessor for GMSpecifierController();
  v22.receiver = v10;
  v22.super_class = v19;
  v20 = objc_msgSendSuper2(&v22, sel_init);
  sub_215424788();

  return v20;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t type metadata accessor for GMSpecifierController()
{
  uint64_t result;

  result = qword_254DC3280;
  if (!qword_254DC3280)
    return swift_getSingletonMetadata();
  return result;
}

id GMSpecifierController.__allocating_init(availabilityProvider:optInStatus:enrollmentProvider:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  objc_class *v3;
  id v7;

  v7 = objc_allocWithZone(v3);
  return GMSpecifierController.init(availabilityProvider:optInStatus:enrollmentProvider:)(a1, a2, a3);
}

id GMSpecifierController.init(availabilityProvider:optInStatus:enrollmentProvider:)(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  char *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  char *v12;
  uint64_t v13;
  uint64_t v14;
  objc_class *v15;
  id v16;
  uint64_t v18;
  uint64_t v19;
  objc_super v20;

  v18 = a2;
  v19 = a3;
  v5 = sub_215429F9C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x24BDAC7A8](v5);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_unknownObjectWeakInit();
  *(_QWORD *)&v3[OBJC_IVAR___GMSpecifierController_availabilityNotifications] = 0;
  sub_2154248FC((uint64_t)a1, (uint64_t)&v3[OBJC_IVAR___GMSpecifierController_availabilityProvider]);
  v9 = a1[3];
  v10 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v9);
  v11 = *(void (**)(uint64_t, uint64_t))(v10 + 24);
  v12 = v3;
  v11(v9, v10);
  (*(void (**)(char *, char *, uint64_t))(v6 + 32))(&v12[OBJC_IVAR___GMSpecifierController_availability], v8, v5);
  v13 = v18;
  sub_2154248FC(v18, (uint64_t)&v12[OBJC_IVAR___GMSpecifierController_optInStatusProvider]);
  v14 = v19;
  sub_2154248FC(v19, (uint64_t)&v12[OBJC_IVAR___GMSpecifierController_enrollmentProvider]);

  v15 = (objc_class *)type metadata accessor for GMSpecifierController();
  v20.receiver = v12;
  v20.super_class = v15;
  v16 = objc_msgSendSuper2(&v20, sel_init);
  sub_215424788();

  __swift_destroy_boxed_opaque_existential_0(v14);
  __swift_destroy_boxed_opaque_existential_0(v13);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v16;
}

uint64_t sub_215421EA0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = v0;
  return swift_task_switch();
}

uint64_t sub_215421EB8()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR___GMSpecifierController_enrollmentProvider);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 24) = v4;
  *v4 = v0;
  v4[1] = sub_215421F3C;
  return v6(v2, v3);
}

uint64_t sub_215421F3C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215421F98()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 32);
  v2 = sub_21542128C();

  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_2154220F4(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a2;
  *(_QWORD *)(v2 + 24) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_21542213C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t, uint64_t);

  v1 = (_QWORD *)(*(_QWORD *)(v0 + 16) + OBJC_IVAR___GMSpecifierController_enrollmentProvider);
  v2 = v1[3];
  v3 = v1[4];
  __swift_project_boxed_opaque_existential_1(v1, v2);
  v6 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v3 + 8) + *(_QWORD *)(v3 + 8));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v4;
  *v4 = v0;
  v4[1] = sub_2154221C0;
  return v6(v2, v3);
}

uint64_t sub_2154221C0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_21542221C()
{
  uint64_t v0;
  void *v1;
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  uint64_t v4;

  v1 = *(void **)(v0 + 40);
  v3 = *(void **)(v0 + 16);
  v2 = *(void (***)(_QWORD, _QWORD))(v0 + 24);
  v4 = sub_21542128C();

  v2[2](v2, v4);
  _Block_release(v2);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215422280()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v1[10] = v0;
  v2 = sub_215429F6C();
  v1[11] = v2;
  v1[12] = *(_QWORD *)(v2 - 8);
  v1[13] = swift_task_alloc();
  v1[14] = swift_task_alloc();
  v3 = sub_21542A0D4();
  v1[15] = v3;
  v1[16] = *(_QWORD *)(v3 - 8);
  v1[17] = swift_task_alloc();
  v1[18] = swift_task_alloc();
  v4 = sub_215429F90();
  v1[19] = v4;
  v1[20] = *(_QWORD *)(v4 - 8);
  v1[21] = swift_task_alloc();
  v1[22] = swift_task_alloc();
  v5 = sub_215429F9C();
  v1[23] = v5;
  v1[24] = *(_QWORD *)(v5 - 8);
  v1[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215422388()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
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
  NSObject *v18;
  os_log_type_t v19;
  _BOOL4 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  unint64_t v29;
  void (*v30)(uint64_t, uint64_t);
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
  NSObject *v43;
  os_log_type_t v44;
  _BOOL4 v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  unint64_t v53;
  void (*v54)(uint64_t, uint64_t);
  _QWORD *v55;
  NSObject *v57;
  os_log_type_t v58;
  uint8_t *v59;
  uint64_t v60;
  _QWORD *v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v2 = *(_QWORD *)(v0 + 192);
  v1 = *(_QWORD *)(v0 + 200);
  v3 = *(_QWORD *)(v0 + 184);
  v4 = *(_QWORD *)(v0 + 80) + OBJC_IVAR___GMSpecifierController_availability;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v1, v4, v3);
  v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 88))(v1, v3);
  if (v5 == *MEMORY[0x24BE3BDE0])
  {
    v6 = *(_QWORD *)(v0 + 200);
    v7 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 88);
    v9 = *(_QWORD *)(v0 + 96);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 96))(v6, *(_QWORD *)(v0 + 184));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v9 + 32))(v7, v6, v8);
    if (qword_254DC2DF0 != -1)
      swift_once();
    v11 = *(_QWORD *)(v0 + 128);
    v10 = *(_QWORD *)(v0 + 136);
    v13 = *(_QWORD *)(v0 + 112);
    v12 = *(_QWORD *)(v0 + 120);
    v15 = *(_QWORD *)(v0 + 96);
    v14 = *(_QWORD *)(v0 + 104);
    v16 = *(_QWORD *)(v0 + 88);
    v17 = __swift_project_value_buffer(v12, (uint64_t)qword_254DC4048);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 16))(v10, v17, v12);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v15 + 16))(v14, v13, v16);
    v18 = sub_21542A0BC();
    v19 = sub_21542A338();
    v20 = os_log_type_enabled(v18, v19);
    v22 = *(_QWORD *)(v0 + 128);
    v21 = *(_QWORD *)(v0 + 136);
    v23 = *(_QWORD *)(v0 + 120);
    v25 = *(_QWORD *)(v0 + 96);
    v24 = *(_QWORD *)(v0 + 104);
    v26 = *(_QWORD *)(v0 + 88);
    if (v20)
    {
      v65 = *(_QWORD *)(v0 + 136);
      v27 = swift_slowAlloc();
      v62 = swift_slowAlloc();
      v67 = v62;
      *(_DWORD *)v27 = 136315394;
      *(_QWORD *)(v0 + 48) = sub_21541DCB8(0x6174536863746566, 0xED00002928737574, &v67);
      sub_21542A38C();
      *(_WORD *)(v27 + 12) = 2080;
      sub_21541A220(&qword_254DC3238, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BE70], MEMORY[0x24BE3BE80]);
      v28 = sub_21542A428();
      *(_QWORD *)(v0 + 56) = sub_21541DCB8(v28, v29, &v67);
      sub_21542A38C();
      swift_bridgeObjectRelease();
      v30 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v30(v24, v26);
      _os_log_impl(&dword_2153F2000, v18, v19, "%s Availability Provider says GM is restricted: %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v62, -1, -1);
      MEMORY[0x2199E17B0](v27, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v65, v23);
    }
    else
    {
      v30 = *(void (**)(uint64_t, uint64_t))(v25 + 8);
      v30(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));

      (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    }
    *(_QWORD *)(v0 + 232) = v30;
    v55 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 240) = v55;
    *v55 = v0;
    v55[1] = sub_215422C74;
    return sub_215425448(*(_QWORD *)(v0 + 112));
  }
  else if (v5 == *MEMORY[0x24BE3BDF0])
  {
    v31 = *(_QWORD *)(v0 + 200);
    v32 = *(_QWORD *)(v0 + 176);
    v33 = *(_QWORD *)(v0 + 152);
    v34 = *(_QWORD *)(v0 + 160);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 192) + 96))(v31, *(_QWORD *)(v0 + 184));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v34 + 32))(v32, v31, v33);
    if (qword_254DC2DF0 != -1)
      swift_once();
    v36 = *(_QWORD *)(v0 + 168);
    v35 = *(_QWORD *)(v0 + 176);
    v37 = *(_QWORD *)(v0 + 152);
    v38 = *(_QWORD *)(v0 + 160);
    v39 = *(_QWORD *)(v0 + 144);
    v40 = *(_QWORD *)(v0 + 120);
    v41 = *(_QWORD *)(v0 + 128);
    v42 = __swift_project_value_buffer(v40, (uint64_t)qword_254DC4048);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v41 + 16))(v39, v42, v40);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v38 + 16))(v36, v35, v37);
    v43 = sub_21542A0BC();
    v44 = sub_21542A338();
    v45 = os_log_type_enabled(v43, v44);
    v46 = *(_QWORD *)(v0 + 168);
    v47 = *(_QWORD *)(v0 + 144);
    v48 = *(_QWORD *)(v0 + 152);
    v49 = *(_QWORD *)(v0 + 120);
    v50 = *(_QWORD *)(v0 + 128);
    if (v45)
    {
      v66 = *(_QWORD *)(v0 + 144);
      v63 = *(_QWORD *)(v0 + 160);
      v51 = swift_slowAlloc();
      v64 = swift_slowAlloc();
      v67 = v64;
      *(_DWORD *)v51 = 136315394;
      *(_QWORD *)(v0 + 64) = sub_21541DCB8(0x6174536863746566, 0xED00002928737574, &v67);
      sub_21542A38C();
      *(_WORD *)(v51 + 12) = 2080;
      sub_21541A220((unint64_t *)&unk_254DC3248, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BFE8], MEMORY[0x24BE3BFF8]);
      v52 = sub_21542A428();
      *(_QWORD *)(v0 + 72) = sub_21541DCB8(v52, v53, &v67);
      sub_21542A38C();
      swift_bridgeObjectRelease();
      v54 = *(void (**)(uint64_t, uint64_t))(v63 + 8);
      v54(v46, v48);
      _os_log_impl(&dword_2153F2000, v43, v44, "%s Availability Provider says GM is unavailable: %s", (uint8_t *)v51, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v64, -1, -1);
      MEMORY[0x2199E17B0](v51, -1, -1);

      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v66, v49);
    }
    else
    {
      v54 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 160) + 8);
      v54(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));

      (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v47, v49);
    }
    *(_QWORD *)(v0 + 208) = v54;
    v61 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v61;
    *v61 = v0;
    v61[1] = sub_215422B7C;
    return sub_215423C64(*(_QWORD *)(v0 + 176));
  }
  else if (v5 == *MEMORY[0x24BE3C018])
  {
    if (qword_254DC2DF0 != -1)
      swift_once();
    __swift_project_value_buffer(*(_QWORD *)(v0 + 120), (uint64_t)qword_254DC4048);
    v57 = sub_21542A0BC();
    v58 = sub_21542A338();
    if (os_log_type_enabled(v57, v58))
    {
      v59 = (uint8_t *)swift_slowAlloc();
      v60 = swift_slowAlloc();
      v67 = v60;
      *(_DWORD *)v59 = 136315138;
      *(_QWORD *)(v0 + 40) = sub_21541DCB8(0x6174536863746566, 0xED00002928737574, &v67);
      sub_21542A38C();
      _os_log_impl(&dword_2153F2000, v57, v58, "%s Availability Provider says GM is available.", v59, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v60, -1, -1);
      MEMORY[0x2199E17B0](v59, -1, -1);
    }

    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(uint64_t))(v0 + 8))(5);
  }
  else
  {
    return sub_21542A434();
  }
}

uint64_t sub_215422B7C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 224) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215422BD8()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(v0 + 208))(*(_QWORD *)(v0 + 176), *(_QWORD *)(v0 + 152));
  v1 = *(_QWORD *)(v0 + 224);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_215422C74(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 248) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215422CD0()
{
  uint64_t v0;
  uint64_t v1;

  (*(void (**)(_QWORD, _QWORD))(v0 + 232))(*(_QWORD *)(v0 + 112), *(_QWORD *)(v0 + 88));
  v1 = *(_QWORD *)(v0 + 248);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v1);
}

uint64_t sub_215422E88(const void *a1, void *a2)
{
  _QWORD *v2;
  _QWORD *v4;

  v2[2] = a2;
  v2[3] = _Block_copy(a1);
  a2;
  v4 = (_QWORD *)swift_task_alloc();
  v2[4] = v4;
  *v4 = v2;
  v4[1] = sub_215422EE8;
  return sub_215422280();
}

uint64_t sub_215422EE8(uint64_t a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v6;

  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 24);
  v4 = *(void **)(*v1 + 16);
  v6 = *v1;
  swift_task_dealloc();

  v3[2](v3, a1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

uint64_t sub_215422F5C(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2[27] = a1;
  v2[28] = v1;
  v3 = sub_215429F6C();
  v2[29] = v3;
  v2[30] = *(_QWORD *)(v3 - 8);
  v2[31] = swift_task_alloc();
  v2[32] = swift_task_alloc();
  v4 = sub_215429F90();
  v2[33] = v4;
  v2[34] = *(_QWORD *)(v4 - 8);
  v2[35] = swift_task_alloc();
  v2[36] = swift_task_alloc();
  v5 = sub_215429F9C();
  v2[37] = v5;
  v2[38] = *(_QWORD *)(v5 - 8);
  v2[39] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_21542302C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  uint64_t v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  NSObject *v25;
  os_log_type_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;

  v1 = *(_QWORD *)(v0 + 224) + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  v2 = MEMORY[0x2199E1834](v1);
  *(_QWORD *)(v0 + 320) = v2;
  if (!v2)
  {
    if (qword_254DC2DF0 != -1)
      swift_once();
    v14 = sub_21542A0D4();
    __swift_project_value_buffer(v14, (uint64_t)qword_254DC4048);
    v15 = sub_21542A0BC();
    v16 = sub_21542A338();
    if (os_log_type_enabled(v15, v16))
    {
      v17 = (uint8_t *)swift_slowAlloc();
      v18 = swift_slowAlloc();
      v32 = v18;
      *(_DWORD *)v17 = 136315138;
      *(_QWORD *)(v0 + 200) = sub_21541DCB8(0xD000000000000015, 0x8000000215433860, &v32);
      sub_21542A38C();
      _os_log_impl(&dword_2153F2000, v15, v16, "%s Delegate is not set. Bailing.", v17, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v18, -1, -1);
      MEMORY[0x2199E17B0](v17, -1, -1);
    }

    goto LABEL_9;
  }
  v4 = *(_QWORD *)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 312);
  v5 = *(_QWORD *)(v0 + 296);
  v6 = *(_QWORD *)(v0 + 216);
  *(_QWORD *)(v0 + 168) = 0;
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v3, v6, v5);
  v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 88))(v3, v5);
  if (v7 == *MEMORY[0x24BE3BDE0])
  {
    v8 = *(_QWORD *)(v0 + 312);
    v9 = *(_QWORD *)(v0 + 256);
    v10 = *(_QWORD *)(v0 + 232);
    v11 = *(_QWORD *)(v0 + 240);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 304) + 96))(v8, *(_QWORD *)(v0 + 296));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32))(v9, v8, v10);
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 344) = v12;
    *v12 = v0;
    v12[1] = sub_2154238E8;
    return sub_215425448(*(_QWORD *)(v0 + 256));
  }
  if (v7 == *MEMORY[0x24BE3BDF0])
  {
    v19 = *(_QWORD *)(v0 + 312);
    v20 = *(_QWORD *)(v0 + 288);
    v21 = *(_QWORD *)(v0 + 264);
    v22 = *(_QWORD *)(v0 + 272);
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v0 + 304) + 96))(v19, *(_QWORD *)(v0 + 296));
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v22 + 32))(v20, v19, v21);
    v23 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 328) = v23;
    *v23 = v0;
    v23[1] = sub_21542356C;
    return sub_215423C64(*(_QWORD *)(v0 + 288));
  }
  if (v7 == *MEMORY[0x24BE3C018])
  {
    *(_QWORD *)(v0 + 168) = 5;
    if (qword_254DC2DF0 != -1)
      swift_once();
    v24 = sub_21542A0D4();
    __swift_project_value_buffer(v24, (uint64_t)qword_254DC4048);
    v25 = sub_21542A0BC();
    v26 = sub_21542A338();
    if (os_log_type_enabled(v25, v26))
    {
      v27 = swift_slowAlloc();
      v28 = swift_slowAlloc();
      *(_DWORD *)v27 = 136315394;
      v32 = v28;
      *(_QWORD *)(v0 + 136) = sub_21541DCB8(0xD000000000000015, 0x8000000215433860, &v32);
      sub_21542A38C();
      *(_WORD *)(v27 + 12) = 2080;
      swift_beginAccess();
      v29 = GMEligibilityContext.description.getter(*(_QWORD *)(v0 + 168));
      *(_QWORD *)(v0 + 144) = sub_21541DCB8(v29, v30, &v32);
      sub_21542A38C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2153F2000, v25, v26, "%s Availability Provider says GM is available. Context: %s", (uint8_t *)v27, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v28, -1, -1);
      MEMORY[0x2199E17B0](v27, -1, -1);
    }

    v31 = *(void **)(v0 + 320);
    swift_beginAccess();
    objc_msgSend(v31, sel_updateWithContext_, *(_QWORD *)(v0 + 168));
    swift_unknownObjectRelease();
LABEL_9:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  return sub_21542A434();
}

uint64_t sub_21542356C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 336) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_2154235C8()
{
  uint64_t v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  os_log_type_t type;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 336);
  if (qword_254DC2DF0 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 280);
  v1 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 264);
  v4 = *(_QWORD *)(v0 + 272);
  v5 = sub_21542A0D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_254DC4048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  v6 = sub_21542A0BC();
  v7 = sub_21542A338();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 280);
  v10 = *(_QWORD *)(v0 + 288);
  v11 = *(_QWORD *)(v0 + 264);
  v12 = *(_QWORD *)(v0 + 272);
  if (v8)
  {
    v24 = *(_QWORD *)(v0 + 288);
    type = v7;
    v13 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v25 = v23;
    *(_DWORD *)v13 = 136315650;
    *(_QWORD *)(v0 + 184) = sub_21541DCB8(0xD000000000000015, 0x8000000215433860, &v25);
    sub_21542A38C();
    *(_WORD *)(v13 + 12) = 2080;
    sub_21541A220((unint64_t *)&unk_254DC3248, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BFE8], MEMORY[0x24BE3BFF8]);
    v14 = sub_21542A428();
    *(_QWORD *)(v0 + 192) = sub_21541DCB8(v14, v15, &v25);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v9, v11);
    *(_WORD *)(v13 + 22) = 2080;
    swift_beginAccess();
    v17 = GMEligibilityContext.description.getter(*(_QWORD *)(v0 + 168));
    *(_QWORD *)(v0 + 208) = sub_21541DCB8(v17, v18, &v25);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2153F2000, v6, type, "%s Availability Provider says GM is unavailable: %s context: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v23, -1, -1);
    MEMORY[0x2199E17B0](v13, -1, -1);

    v16(v24, v11);
  }
  else
  {

    v19 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v19(v9, v11);
    v19(v10, v11);
  }
  v20 = *(void **)(v0 + 320);
  swift_beginAccess();
  objc_msgSend(v20, sel_updateWithContext_, *(_QWORD *)(v0 + 168));
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2154238E8(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 352) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215423944()
{
  uint64_t v0;
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
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  uint64_t v17;
  unint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void *v20;
  os_log_type_t type;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;

  *(_QWORD *)(v0 + 168) = *(_QWORD *)(v0 + 352);
  if (qword_254DC2DF0 != -1)
    swift_once();
  v2 = *(_QWORD *)(v0 + 248);
  v1 = *(_QWORD *)(v0 + 256);
  v3 = *(_QWORD *)(v0 + 232);
  v4 = *(_QWORD *)(v0 + 240);
  v5 = sub_21542A0D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_254DC4048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 16))(v2, v1, v3);
  v6 = sub_21542A0BC();
  v7 = sub_21542A338();
  v8 = os_log_type_enabled(v6, v7);
  v9 = *(_QWORD *)(v0 + 248);
  v10 = *(_QWORD *)(v0 + 256);
  v11 = *(_QWORD *)(v0 + 232);
  v12 = *(_QWORD *)(v0 + 240);
  if (v8)
  {
    v24 = *(_QWORD *)(v0 + 256);
    type = v7;
    v13 = swift_slowAlloc();
    v23 = swift_slowAlloc();
    v25 = v23;
    *(_DWORD *)v13 = 136315650;
    *(_QWORD *)(v0 + 152) = sub_21541DCB8(0xD000000000000015, 0x8000000215433860, &v25);
    sub_21542A38C();
    *(_WORD *)(v13 + 12) = 2080;
    sub_21541A220(&qword_254DC3238, (uint64_t (*)(uint64_t))MEMORY[0x24BE3BE70], MEMORY[0x24BE3BE80]);
    v14 = sub_21542A428();
    *(_QWORD *)(v0 + 160) = sub_21541DCB8(v14, v15, &v25);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    v16 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v16(v9, v11);
    *(_WORD *)(v13 + 22) = 2080;
    swift_beginAccess();
    v17 = GMEligibilityContext.description.getter(*(_QWORD *)(v0 + 168));
    *(_QWORD *)(v0 + 176) = sub_21541DCB8(v17, v18, &v25);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2153F2000, v6, type, "%s Availability Provider says GM is restricted: %s context: %s", (uint8_t *)v13, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v23, -1, -1);
    MEMORY[0x2199E17B0](v13, -1, -1);

    v16(v24, v11);
  }
  else
  {

    v19 = *(void (**)(uint64_t, uint64_t))(v12 + 8);
    v19(v9, v11);
    v19(v10, v11);
  }
  v20 = *(void **)(v0 + 320);
  swift_beginAccess();
  objc_msgSend(v20, sel_updateWithContext_, *(_QWORD *)(v0 + 168));
  swift_unknownObjectRelease();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215423C64(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;

  v2[2] = a1;
  v2[3] = v1;
  v3 = sub_215429F78();
  v2[4] = v3;
  v2[5] = *(_QWORD *)(v3 - 8);
  v2[6] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215423CC4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD, uint64_t);
  char v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  _QWORD *v29;
  uint64_t v30;
  uint64_t v31;
  _QWORD *v32;
  uint64_t (*v34)(uint64_t, uint64_t);

  v2 = *(_QWORD *)(v0 + 40);
  v1 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 32);
  v4 = sub_215429F84();
  v5 = *(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104);
  v5(v1, *MEMORY[0x24BE3BEE0], v3);
  v6 = sub_2154214F4(v1, v4);
  swift_bridgeObjectRelease();
  v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v7(v1, v3);
  if ((v6 & 1) != 0)
  {
    v8 = 17;
  }
  else
  {
    v9 = *(_QWORD *)(v0 + 48);
    v10 = *(_QWORD *)(v0 + 32);
    v11 = sub_215429F84();
    v5(v9, *MEMORY[0x24BE3BEF8], v10);
    v12 = sub_2154214F4(v9, v11);
    swift_bridgeObjectRelease();
    v7(v9, v10);
    if ((v12 & 1) != 0)
    {
      v8 = 13;
    }
    else
    {
      v13 = *(_QWORD *)(v0 + 48);
      v14 = *(_QWORD *)(v0 + 32);
      v15 = sub_215429F84();
      v5(v13, *MEMORY[0x24BE3BF38], v14);
      v16 = sub_2154214F4(v13, v15);
      swift_bridgeObjectRelease();
      v7(v13, v14);
      if ((v16 & 1) != 0)
      {
        v8 = 14;
      }
      else
      {
        v17 = *(_QWORD *)(v0 + 48);
        v18 = *(_QWORD *)(v0 + 32);
        v19 = sub_215429F84();
        v5(v17, *MEMORY[0x24BE3BF50], v18);
        v20 = sub_2154214F4(v17, v19);
        swift_bridgeObjectRelease();
        v7(v17, v18);
        if ((v20 & 1) != 0)
        {
          v8 = 15;
        }
        else
        {
          v21 = *(_QWORD *)(v0 + 48);
          v22 = *(_QWORD *)(v0 + 32);
          v23 = sub_215429F84();
          v5(v21, *MEMORY[0x24BE3BF60], v22);
          v24 = sub_2154214F4(v21, v23);
          swift_bridgeObjectRelease();
          v7(v21, v22);
          if ((v24 & 1) != 0)
          {
            v8 = 16;
          }
          else
          {
            v25 = *(_QWORD *)(v0 + 48);
            v26 = *(_QWORD *)(v0 + 32);
            v27 = sub_215429F84();
            v5(v25, *MEMORY[0x24BE3BED0], v26);
            v28 = sub_2154214F4(v25, v27);
            swift_bridgeObjectRelease();
            v7(v25, v26);
            if ((v28 & 1) != 0)
            {
              v29 = (_QWORD *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___GMSpecifierController_enrollmentProvider);
              v30 = v29[3];
              v31 = v29[4];
              __swift_project_boxed_opaque_existential_1(v29, v30);
              v34 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v31 + 16) + *(_QWORD *)(v31 + 16));
              v32 = (_QWORD *)swift_task_alloc();
              *(_QWORD *)(v0 + 56) = v32;
              *v32 = v0;
              v32[1] = sub_215423FB4;
              return v34(v30, v31);
            }
            v8 = sub_215420C24(*(_QWORD *)(v0 + 16));
          }
        }
      }
    }
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v8);
}

uint64_t sub_215423FB4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215424010()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 64);
  v2 = sub_215420804(*(_QWORD *)(v0 + 16), v1);

  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v2);
}

uint64_t sub_21542405C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v5[3];
  uint64_t v6;
  uint64_t v7;

  v1 = v0 + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  sub_2154248FC(v1, (uint64_t)v5);
  v2 = v6;
  v3 = v7;
  __swift_project_boxed_opaque_existential_1(v5, v6);
  LOBYTE(v2) = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(v2, v3);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v5);
  return v2 & 1;
}

uint64_t sub_215424184(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = v1 + OBJC_IVAR___GMSpecifierController_optInStatusProvider;
  swift_beginAccess();
  v4 = *(_QWORD *)(v3 + 24);
  v5 = *(_QWORD *)(v3 + 32);
  __swift_mutable_project_boxed_opaque_existential_1(v3, v4);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v5 + 16))(a1, v4, v5);
  return swift_endAccess();
}

uint64_t sub_2154242A0()
{
  return swift_task_switch();
}

uint64_t sub_2154242B4()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)objc_opt_self();
  v0[2] = v0;
  v0[3] = sub_21542434C;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_2154243F4;
  v3[3] = &block_descriptor_2;
  v3[4] = v2;
  objc_msgSend(v1, sel_clearCFUWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_21542434C()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 120) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2154243AC()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2154243B8()
{
  uint64_t v0;

  swift_willThrow();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2154243F4(uint64_t a1, void *a2)
{
  _QWORD *v3;
  id v4;

  if (!a2)
    return swift_continuation_throwingResume();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC31D8);
  swift_allocError();
  *v3 = a2;
  v4 = a2;
  return swift_continuation_throwingResumeWithError();
}

uint64_t sub_215424584(const void *a1, void *a2)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 120) = a2;
  *(_QWORD *)(v2 + 128) = _Block_copy(a1);
  v4 = a2;
  return swift_task_switch();
}

uint64_t sub_2154245CC()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = (void *)objc_opt_self();
  v0[2] = v0;
  v0[3] = sub_215424664;
  v2 = swift_continuation_init();
  v0[10] = MEMORY[0x24BDAC760];
  v3 = v0 + 10;
  v3[1] = 0x40000000;
  v3[2] = sub_2154243F4;
  v3[3] = &block_descriptor_27;
  v3[4] = v2;
  objc_msgSend(v1, sel_clearCFUWithCompletionHandler_, v3);
  return swift_continuation_await();
}

uint64_t sub_215424664()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 136) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_2154246C4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 128);

  (*(void (**)(uint64_t, _QWORD))(v1 + 16))(v1, 0);
  _Block_release(*(const void **)(v0 + 128));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_21542470C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *(_QWORD *)(v0 + 128);
  v2 = *(void **)(v0 + 136);
  v3 = *(void **)(v0 + 120);
  swift_willThrow();

  v4 = (void *)sub_215429EA0();
  (*(void (**)(uint64_t, void *))(v1 + 16))(v1, v4);

  _Block_release(*(const void **)(v0 + 128));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215424788()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v13;

  v1 = v0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  MEMORY[0x24BDAC7A8](v2);
  v4 = (char *)&v13 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC2DF0 != -1)
    swift_once();
  v5 = sub_21542A0D4();
  __swift_project_value_buffer(v5, (uint64_t)qword_254DC4048);
  v6 = sub_21542A0BC();
  v7 = sub_21542A338();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_2153F2000, v6, v7, "Adding Availability listeners", v8, 2u);
    MEMORY[0x2199E17B0](v8, -1, -1);
  }

  v9 = sub_21542A320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v4, 1, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = v1;
  v11 = v1;
  sub_215425DEC((uint64_t)v4, (uint64_t)&unk_254DC3358, (uint64_t)v10);
  return swift_release();
}

uint64_t sub_2154248FC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_215424940(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v4[6] = a4;
  v5 = sub_215429F9C();
  v4[7] = v5;
  v4[8] = *(_QWORD *)(v5 - 8);
  v4[9] = swift_task_alloc();
  v4[10] = swift_task_alloc();
  v4[11] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC3360);
  v4[12] = swift_task_alloc();
  v6 = sub_215429FE4();
  v4[13] = v6;
  v4[14] = *(_QWORD *)(v6 - 8);
  v4[15] = swift_task_alloc();
  v7 = sub_21542A014();
  v4[16] = v7;
  v4[17] = *(_QWORD *)(v7 - 8);
  v4[18] = swift_task_alloc();
  v8 = sub_215429FD8();
  v4[19] = v8;
  v4[20] = *(_QWORD *)(v8 - 8);
  v4[21] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_215424A58()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  uint64_t v11;

  v2 = v0[17];
  v1 = v0[18];
  v4 = v0[15];
  v3 = v0[16];
  v5 = v0[14];
  v11 = v0[13];
  v6 = (_QWORD *)(v0[6] + OBJC_IVAR___GMSpecifierController_availabilityProvider);
  v7 = v6[3];
  v8 = v6[4];
  __swift_project_boxed_opaque_existential_1(v6, v7);
  (*(void (**)(uint64_t, uint64_t))(v8 + 32))(v7, v8);
  sub_215429FFC();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  sub_215429FCC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v4, v11);
  v0[22] = OBJC_IVAR___GMSpecifierController_availability;
  v0[23] = sub_21541A220(&qword_254DC3368, (uint64_t (*)(uint64_t))MEMORY[0x24BE3C0C8], MEMORY[0x24BE3C0D8]);
  v9 = (_QWORD *)swift_task_alloc();
  v0[24] = v9;
  *v9 = v0;
  v9[1] = sub_215424B84;
  return sub_21542A2F0();
}

uint64_t sub_215424B84()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 200) = v0;
  return swift_task_switch();
}

uint64_t sub_215424BE8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  NSObject *v11;
  os_log_type_t v12;
  _BOOL4 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  uint64_t v27;

  v1 = *(_QWORD *)(v0 + 96);
  v2 = *(_QWORD *)(v0 + 56);
  v3 = *(_QWORD *)(v0 + 64);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v3 + 48))(v1, 1, v2) == 1)
  {
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 160) + 8))(*(_QWORD *)(v0 + 168), *(_QWORD *)(v0 + 152));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    (*(void (**)(_QWORD, uint64_t, uint64_t))(v3 + 32))(*(_QWORD *)(v0 + 88), v1, v2);
    if (qword_254DC2DF0 != -1)
      swift_once();
    v5 = *(_QWORD *)(v0 + 80);
    v6 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 56);
    v8 = *(_QWORD *)(v0 + 64);
    v9 = sub_21542A0D4();
    __swift_project_value_buffer(v9, (uint64_t)qword_254DC4048);
    v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v8 + 16);
    v10(v5, v6, v7);
    v11 = sub_21542A0BC();
    v12 = sub_21542A338();
    v13 = os_log_type_enabled(v11, v12);
    v14 = *(_QWORD *)(v0 + 80);
    v15 = *(_QWORD *)(v0 + 56);
    v16 = *(_QWORD *)(v0 + 64);
    if (v13)
    {
      v17 = swift_slowAlloc();
      v18 = swift_slowAlloc();
      v27 = v18;
      *(_DWORD *)v17 = 136315394;
      *(_QWORD *)(v17 + 4) = sub_21541DCB8(0xD00000000000001BLL, 0x8000000215433880, &v27);
      *(_WORD *)(v17 + 12) = 2080;
      sub_21541A220(&qword_254DC3370, (uint64_t (*)(uint64_t))MEMORY[0x24BE3C020], MEMORY[0x24BE3C048]);
      v19 = sub_21542A428();
      *(_QWORD *)(v17 + 14) = sub_21541DCB8(v19, v20, &v27);
      swift_bridgeObjectRelease();
      v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v21(v14, v15);
      _os_log_impl(&dword_2153F2000, v11, v12, "%s Availability changes notification received. %s", (uint8_t *)v17, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v18, -1, -1);
      MEMORY[0x2199E17B0](v17, -1, -1);
    }
    else
    {
      v21 = *(void (**)(uint64_t, uint64_t))(v16 + 8);
      v21(*(_QWORD *)(v0 + 80), *(_QWORD *)(v0 + 56));
    }

    *(_QWORD *)(v0 + 208) = v21;
    v23 = *(_QWORD *)(v0 + 64);
    v22 = *(_QWORD *)(v0 + 72);
    v24 = *(_QWORD *)(v0 + 56);
    v25 = *(_QWORD *)(v0 + 48) + *(_QWORD *)(v0 + 176);
    v10(v22, *(_QWORD *)(v0 + 88), v24);
    swift_beginAccess();
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 40))(v25, v22, v24);
    swift_endAccess();
    v26 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 216) = v26;
    *v26 = v0;
    v26[1] = sub_215424F6C;
    return sub_215422F5C(*(_QWORD *)(v0 + 88));
  }
}

uint64_t sub_215424F0C()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 40) = *(_QWORD *)(v0 + 200);
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC31D8);
  swift_dynamicCast();
  return swift_willThrowTypedImpl();
}

uint64_t sub_215424F6C()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215424FC0()
{
  uint64_t v0;
  _QWORD *v1;

  (*(void (**)(_QWORD, _QWORD))(v0 + 208))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 56));
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 224) = v1;
  *v1 = v0;
  v1[1] = sub_21542502C;
  return sub_21542A2F0();
}

uint64_t sub_21542502C()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  swift_task_dealloc();
  if (v0)
    *(_QWORD *)(v2 + 200) = v0;
  return swift_task_switch();
}

uint64_t sub_215425090()
{
  sub_21542A0B0();
  return sub_21542A0A4() & 1;
}

id GMSpecifierController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMSpecifierController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_2154251AC(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_215425DE8;
  return v6();
}

uint64_t sub_215425200(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_215425DE8;
  return v7();
}

uint64_t sub_215425254(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21542A320();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21542A314();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_215425B20(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21542A2E4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_215425398(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_2154253FC;
  return v6(a1);
}

uint64_t sub_2154253FC()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_215425448(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;

  v1[2] = a1;
  v2 = sub_215429F54();
  v1[3] = v2;
  v1[4] = *(_QWORD *)(v2 - 8);
  v1[5] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_2154254A8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(uint64_t, _QWORD, uint64_t);
  char v6;
  void (*v7)(uint64_t, uint64_t);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 24);
  v4 = sub_215429F60();
  v5 = *(void (**)(uint64_t, _QWORD, uint64_t))(v2 + 104);
  v5(v1, *MEMORY[0x24BE3BE10], v3);
  v6 = sub_215421678(v1, v4);
  swift_bridgeObjectRelease();
  v7 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
  v7(v1, v3);
  if ((v6 & 1) != 0
    || (v8 = *(_QWORD *)(v0 + 40),
        v9 = *(_QWORD *)(v0 + 24),
        v10 = sub_215429F60(),
        v5(v8, *MEMORY[0x24BE3BE20], v9),
        v11 = sub_215421678(v8, v10),
        swift_bridgeObjectRelease(),
        v7(v8, v9),
        (v11 & 1) != 0))
  {
    v12 = 19;
  }
  else
  {
    v13 = *(_QWORD *)(v0 + 40);
    v14 = *(_QWORD *)(v0 + 24);
    v15 = sub_215429F60();
    v5(v13, *MEMORY[0x24BE3BE08], v14);
    v16 = sub_215421678(v13, v15);
    swift_bridgeObjectRelease();
    v7(v13, v14);
    if ((v16 & 1) != 0)
      v12 = 9;
    else
      v12 = 0;
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v12);
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

uint64_t sub_21542561C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___GMSpecifierController_delegate;
  swift_beginAccess();
  result = MEMORY[0x2199E1834](v3);
  *a2 = result;
  return result;
}

uint64_t sub_215425670()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_2154256C4()
{
  return type metadata accessor for GMSpecifierController();
}

uint64_t sub_2154256CC()
{
  uint64_t result;
  unint64_t v1;

  result = sub_215429F9C();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for GMSpecifierController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GMSpecifierController.delegate.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of GMSpecifierController.delegate.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of GMSpecifierController.delegate.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of GMSpecifierController.__allocating_init(availabilityProvider:optInStatus:enrollmentProvider:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 224))();
}

uint64_t dispatch thunk of GMSpecifierController.gmFFEnabled()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE8))();
}

uint64_t dispatch thunk of GMSpecifierController.enroll()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xF0);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F958;
  return v5();
}

uint64_t dispatch thunk of GMSpecifierController.fetchStatus()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0xF8);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_21541F884;
  return v5();
}

uint64_t dispatch thunk of GMSpecifierController.featureOptInStatus()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x118))();
}

uint64_t dispatch thunk of GMSpecifierController.setFeatureOptInStatus(enabled:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x120))();
}

uint64_t dispatch thunk of GMSpecifierController.clearCFU()()
{
  _QWORD *v0;
  uint64_t v1;
  int *v2;
  _QWORD *v3;
  uint64_t (*v5)(void);

  v2 = *(int **)((*MEMORY[0x24BEE4EA0] & *v0) + 0x128);
  v5 = (uint64_t (*)(void))((char *)v2 + *v2);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_215425950;
  return v5();
}

uint64_t sub_215425950()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t dispatch thunk of GMSpecifierController.hasEngagedCFU()()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x138))();
}

uint64_t sub_2154259B8()
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
  v4[1] = sub_215425DE8;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_254DC32B8 + dword_254DC32B8))(v2, v3);
}

uint64_t sub_215425A20()
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
  v5[1] = sub_215425DE8;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_254DC32C8 + dword_254DC32C8))(v2, v3, v4);
}

uint64_t sub_215425A9C(uint64_t a1)
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
  v7[1] = sub_215425DE8;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_254DC32D8 + dword_254DC32D8))(a1, v4, v5, v6);
}

uint64_t sub_215425B20(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_215425B60()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215425B84(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_215425DE8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254DC32E8 + dword_254DC32E8))(a1, v4);
}

uint64_t sub_215425BF8()
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
  v4[1] = sub_215425950;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_254DC32F8 + dword_254DC32F8))(v2, v3);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_215425C94()
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
  v4[1] = sub_215425DE8;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_254DC3318 + dword_254DC3318))(v2, v3);
}

uint64_t objectdestroy_13Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215425D2C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_215425D50()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_215425D7C(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_215425DE8;
  return sub_215424940(a1, v4, v5, v6);
}

uint64_t sub_215425DEC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_21542A320();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_21542A314();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_215425B20(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_21542A2E4();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_215425F74()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_215426000(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_215426048())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_2154260D4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState;
  swift_beginAccess();
  return *(_QWORD *)v1;
}

uint64_t sub_215426160(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t result;

  v3 = (_QWORD *)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_2154261A8())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_2154261EC()
{
  id result;

  result = objc_msgSend(objc_allocWithZone((Class)type metadata accessor for GMEligibilityProvider()), sel_init);
  qword_254DC3378 = (uint64_t)result;
  return result;
}

id GMEligibilityProvider.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id static GMEligibilityProvider.shared.getter()
{
  if (qword_254DC2DF8 != -1)
    swift_once();
  return (id)qword_254DC3378;
}

void *sub_215426300()
{
  uint64_t v0;
  void **v1;
  void *v2;
  id v3;

  v1 = (void **)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  v2 = *v1;
  v3 = v2;
  return v2;
}

void sub_2154263A8(void *a1)
{
  uint64_t v1;
  void **v3;
  void *v4;

  v3 = (void **)(v1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  v4 = *v3;
  *v3 = a1;

}

void sub_2154263F8(void **a1, _QWORD *a2)
{
  void *v2;
  void **v3;
  void *v4;
  id v5;

  v2 = *a1;
  v3 = (void **)(*a2 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  v4 = *v3;
  *v3 = v2;
  v5 = v2;

}

uint64_t (*sub_215426458())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

uint64_t GMEligibilityProvider.gmSpecifierController.getter()
{
  return swift_unknownObjectRetain();
}

uint64_t sub_2154264D4()
{
  return 0;
}

id sub_21542654C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  if (*v1 == 5)
    return objc_msgSend(*(id *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController), sel_featureOptInStatus);
  else
    return 0;
}

uint64_t sub_21542660C()
{
  uint64_t v0;
  uint64_t *v1;

  v1 = (uint64_t *)(v0 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
  swift_beginAccess();
  return sub_215426660(*v1, (uint64_t)&unk_24D33D7F0) & 1;
}

uint64_t sub_215426660(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  uint64_t i;
  uint64_t v4;
  _BOOL8 v5;
  BOOL v6;

  v2 = *(_QWORD *)(a2 + 16);
  if (!v2)
    return 0;
  if (*(_QWORD *)(a2 + 32) == result)
    return 1;
  if (v2 == 1)
    return 0;
  for (i = 5; ; ++i)
  {
    v4 = i - 3;
    if (__OFADD__(i - 4, 1))
      break;
    v6 = *(_QWORD *)(a2 + 8 * i) == result;
    v5 = v6;
    v6 = v6 || v4 == v2;
    if (v6)
      return v5;
  }
  __break(1u);
  return result;
}

char *GMEligibilityProvider.init()()
{
  char *v0;
  id v1;
  char *v2;
  id v3;
  char *v4;
  objc_super v6;

  *(_QWORD *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState] = 0;
  *(_QWORD *)&v0[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter] = 0;
  v1 = objc_allocWithZone((Class)type metadata accessor for GMSpecifierController());
  v2 = v0;
  v3 = objc_msgSend(v1, sel_init);
  *(_QWORD *)&v2[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController] = v3;

  v6.receiver = v2;
  v6.super_class = (Class)type metadata accessor for GMEligibilityProvider();
  v4 = (char *)objc_msgSendSuper2(&v6, sel_init);
  objc_msgSend(*(id *)&v4[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController], sel_setDelegate_, v4);
  return v4;
}

uint64_t type metadata accessor for GMEligibilityProvider()
{
  return objc_opt_self();
}

uint64_t sub_2154267BC(void *a1)
{
  char *v1;
  char *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  _QWORD *v12;
  id v13;
  void **v14;
  void *v15;
  id v16;
  uint64_t v17;
  _QWORD *v18;
  char *v19;
  uint64_t v21;
  char *v22;
  id v23;
  uint64_t v24;

  v2 = v1;
  v24 = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)&v21 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC2DF0 != -1)
    swift_once();
  v7 = sub_21542A0D4();
  __swift_project_value_buffer(v7, (uint64_t)qword_254DC4048);
  v8 = a1;
  v9 = sub_21542A0BC();
  v10 = sub_21542A338();
  if (os_log_type_enabled(v9, v10))
  {
    v22 = v2;
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v11 = 138412290;
    if (a1)
    {
      v23 = v8;
      v13 = v8;
    }
    else
    {
      v23 = 0;
    }
    sub_21542A38C();
    *v12 = a1;

    _os_log_impl(&dword_2153F2000, v9, v10, "Fetch status called with presenter. %@", v11, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC33B0);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v12, -1, -1);
    MEMORY[0x2199E17B0](v11, -1, -1);

    v2 = v22;
  }
  else
  {

  }
  v14 = (void **)&v2[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter];
  swift_beginAccess();
  v15 = *v14;
  *v14 = a1;
  v16 = v8;

  v17 = sub_21542A320();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v6, 1, 1, v17);
  v18 = (_QWORD *)swift_allocObject();
  v18[2] = 0;
  v18[3] = 0;
  v18[4] = v2;
  v19 = v2;
  sub_215425DEC((uint64_t)v6, (uint64_t)&unk_254DC33A8, (uint64_t)v18);
  return swift_release();
}

uint64_t sub_215426A60(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  _QWORD *v6;

  v4[6] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  v4[7] = swift_task_alloc();
  v6 = (_QWORD *)swift_task_alloc();
  v4[8] = v6;
  *v6 = v4;
  v6[1] = sub_215426AE8;
  v6[22] = a4;
  return swift_task_switch();
}

uint64_t sub_215426AE8()
{
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_215426B3C()
{
  uint64_t v0;
  void **v1;
  void *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v17;

  v1 = (void **)(*(_QWORD *)(v0 + 48) + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  v2 = *v1;
  if (*v1)
  {
    v3 = qword_254DC2DF0;
    v4 = v2;
    if (v3 != -1)
      swift_once();
    v5 = sub_21542A0D4();
    __swift_project_value_buffer(v5, (uint64_t)qword_254DC4048);
    v6 = sub_21542A0BC();
    v7 = sub_21542A338();
    if (os_log_type_enabled(v6, v7))
    {
      v8 = (uint8_t *)swift_slowAlloc();
      v9 = swift_slowAlloc();
      v17 = v9;
      *(_DWORD *)v8 = 136315138;
      *(_QWORD *)(v0 + 40) = sub_21541DCB8(0xD000000000000017, 0x8000000215433AF0, &v17);
      sub_21542A38C();
      _os_log_impl(&dword_2153F2000, v6, v7, "%s Attempt to reload specifiers.", v8, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v9, -1, -1);
      MEMORY[0x2199E17B0](v8, -1, -1);
    }

    v10 = *(_QWORD *)(v0 + 56);
    v11 = sub_21542A320();
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 56))(v10, 1, 1, v11);
    sub_21542A308();
    v12 = v4;
    v13 = sub_21542A2FC();
    v14 = (_QWORD *)swift_allocObject();
    v15 = MEMORY[0x24BEE6930];
    v14[2] = v13;
    v14[3] = v15;
    v14[4] = v12;
    sub_215425DEC(v10, (uint64_t)&unk_254DC3418, (uint64_t)v14);

    swift_release();
  }
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215426D88(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_21542A308();
  *(_QWORD *)(v4 + 24) = sub_21542A2FC();
  sub_21542A2E4();
  return swift_task_switch();
}

uint64_t sub_215426DF4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 16);
  swift_release();
  objc_msgSend(v1, sel_reloadSpecifiers);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_215426E8C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 176) = v0;
  return swift_task_switch();
}

uint64_t sub_215426EA4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD *v16;

  v1 = *(_QWORD *)(v0 + 176);
  v2 = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility;
  *(_QWORD *)(v0 + 184) = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility;
  v3 = (uint64_t *)(v1 + v2);
  swift_beginAccess();
  v4 = *v3;
  *(_QWORD *)(v0 + 192) = *v3;
  if (v4 == 17)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v5 = *(_QWORD *)(v0 + 176);
  v6 = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState;
  *(_QWORD *)(v0 + 200) = OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState;
  v7 = (_QWORD *)(v5 + v6);
  swift_beginAccess();
  if (*v7 == 1)
  {
    if (qword_254DC2DF0 != -1)
      swift_once();
    v8 = sub_21542A0D4();
    __swift_project_value_buffer(v8, (uint64_t)qword_254DC4048);
    v9 = sub_21542A0BC();
    v10 = sub_21542A350();
    if (os_log_type_enabled(v9, v10))
    {
      v11 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_2153F2000, v9, v10, "Enrollment request is already in progress. Bailing.", v11, 2u);
      MEMORY[0x2199E17B0](v11, -1, -1);
    }

    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v13 = *(_QWORD *)(v0 + 176);
  *v7 = 1;
  v14 = *(void **)(v13 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_gmSpecifierController);
  *(_QWORD *)(v0 + 56) = v0 + 168;
  *(_QWORD *)(v0 + 16) = v0;
  *(_QWORD *)(v0 + 24) = sub_215427084;
  v15 = swift_continuation_init();
  *(_QWORD *)(v0 + 80) = MEMORY[0x24BDAC760];
  v16 = (_QWORD *)(v0 + 80);
  v16[1] = 0x40000000;
  v16[2] = sub_2154273EC;
  v16[3] = &block_descriptor_3;
  v16[4] = v15;
  objc_msgSend(v14, sel_fetchStatusWithCompletionHandler_, v16);
  return swift_continuation_await();
}

uint64_t sub_215427084()
{
  return swift_task_switch();
}

uint64_t sub_2154270D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  os_log_type_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  os_log_type_t v13;
  uint8_t *v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v19;

  v1 = *(_QWORD *)(v0 + 168);
  *(_QWORD *)(*(_QWORD *)(v0 + 176) + *(_QWORD *)(v0 + 200)) = 2;
  if (qword_254DC2DF0 != -1)
    swift_once();
  v2 = sub_21542A0D4();
  __swift_project_value_buffer(v2, (uint64_t)qword_254DC4048);
  v3 = sub_21542A0BC();
  v4 = sub_21542A338();
  if (os_log_type_enabled(v3, v4))
  {
    v5 = *(_QWORD *)(v0 + 192);
    v6 = swift_slowAlloc();
    v7 = swift_slowAlloc();
    *(_DWORD *)v6 = 136315650;
    v19 = v7;
    *(_QWORD *)(v0 + 80) = sub_21541DCB8(0xD000000000000011, 0x8000000215433AD0, &v19);
    sub_21542A38C();
    *(_WORD *)(v6 + 12) = 2080;
    v8 = GMEligibilityContext.description.getter(v5);
    *(_QWORD *)(v0 + 80) = sub_21541DCB8(v8, v9, &v19);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v6 + 22) = 2080;
    v10 = GMEligibilityContext.description.getter(v1);
    *(_QWORD *)(v0 + 80) = sub_21541DCB8(v10, v11, &v19);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_2153F2000, v3, v4, "%s Previous Status: %s New Status: %s", (uint8_t *)v6, 0x20u);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v7, -1, -1);
    MEMORY[0x2199E17B0](v6, -1, -1);
  }

  if (v1 != *(_QWORD *)(v0 + 192))
  {
    *(_QWORD *)(*(_QWORD *)(v0 + 176) + *(_QWORD *)(v0 + 184)) = v1;
    v12 = sub_21542A0BC();
    v13 = sub_21542A350();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      v15 = swift_slowAlloc();
      v19 = v15;
      *(_DWORD *)v14 = 136315138;
      v16 = GMEligibilityContext.description.getter(v1);
      *(_QWORD *)(v0 + 80) = sub_21541DCB8(v16, v17, &v19);
      sub_21542A38C();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_2153F2000, v12, v13, "Status: %s", v14, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v15, -1, -1);
      MEMORY[0x2199E17B0](v14, -1, -1);
    }

  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_2154273EC(uint64_t a1, uint64_t a2)
{
  **(_QWORD **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 40) = a2;
  return swift_continuation_resume();
}

void sub_215427400(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  void **v17;
  void *v18;
  id v19;
  uint64_t *v20;
  id *v21;
  id v22;
  NSObject *v23;
  os_log_type_t v24;
  uint8_t *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t v31;
  _QWORD v32[2];
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38[4];

  v2 = v1;
  v38[3] = *MEMORY[0x24BDAC8D0];
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_254DC32B0);
  MEMORY[0x24BDAC7A8](v4);
  v6 = (char *)v32 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_254DC2DF0 != -1)
    swift_once();
  v7 = sub_21542A0D4();
  v8 = __swift_project_value_buffer(v7, (uint64_t)qword_254DC4048);
  v9 = v2;
  v10 = sub_21542A0BC();
  v11 = sub_21542A350();
  if (os_log_type_enabled(v10, v11))
  {
    v32[1] = v8;
    v34 = v6;
    v12 = swift_slowAlloc();
    v13 = (_QWORD *)swift_slowAlloc();
    v14 = swift_slowAlloc();
    v38[0] = v14;
    *(_DWORD *)v12 = 136315650;
    v37 = sub_21541DCB8(0xD000000000000010, 0x80000002154338A0, v38);
    sub_21542A38C();
    *(_WORD *)(v12 + 12) = 2080;
    v33 = a1;
    v15 = GMEligibilityContext.description.getter(a1);
    v37 = sub_21541DCB8(v15, v16, v38);
    sub_21542A38C();
    swift_bridgeObjectRelease();
    *(_WORD *)(v12 + 22) = 2112;
    v17 = (void **)&v9[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter];
    swift_beginAccess();
    v18 = *v17;
    if (*v17)
    {
      v37 = (uint64_t)*v17;
      v19 = v18;
    }
    else
    {
      v37 = 0;
    }
    sub_21542A38C();
    *v13 = v18;

    _os_log_impl(&dword_2153F2000, v10, v11, "%s Updating eligibility with %s do we have a presenter? %@", (uint8_t *)v12, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_254DC33B0);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v13, -1, -1);
    swift_arrayDestroy();
    MEMORY[0x2199E17B0](v14, -1, -1);
    MEMORY[0x2199E17B0](v12, -1, -1);

    a1 = v33;
    v6 = v34;
  }
  else
  {

  }
  v20 = (uint64_t *)&v9[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility];
  swift_beginAccess();
  *v20 = a1;
  v21 = (id *)&v9[OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter];
  swift_beginAccess();
  if (*v21)
  {
    v22 = *v21;
    v23 = sub_21542A0BC();
    v24 = sub_21542A338();
    if (os_log_type_enabled(v23, v24))
    {
      v25 = (uint8_t *)swift_slowAlloc();
      v26 = swift_slowAlloc();
      v36 = v26;
      *(_DWORD *)v25 = 136315138;
      v35 = sub_21541DCB8(0xD000000000000010, 0x80000002154338A0, &v36);
      sub_21542A38C();
      _os_log_impl(&dword_2153F2000, v23, v24, "%s Attempting to reload specifiers.", v25, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x2199E17B0](v26, -1, -1);
      MEMORY[0x2199E17B0](v25, -1, -1);
    }

    v27 = sub_21542A320();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v27 - 8) + 56))(v6, 1, 1, v27);
    sub_21542A308();
    v28 = v22;
    v29 = sub_21542A2FC();
    v30 = (_QWORD *)swift_allocObject();
    v31 = MEMORY[0x24BEE6930];
    v30[2] = v29;
    v30[3] = v31;
    v30[4] = v28;
    sub_215425DEC((uint64_t)v6, (uint64_t)&unk_254DC33C0, (uint64_t)v30);
    swift_release();

  }
}

uint64_t sub_2154278D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 16) = a4;
  sub_21542A308();
  *(_QWORD *)(v4 + 24) = sub_21542A2FC();
  sub_21542A2E4();
  return swift_task_switch();
}

id GMEligibilityProvider.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for GMEligibilityProvider();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t GMRequestState.init(rawValue:)(unint64_t result)
{
  if (result > 2)
    return 0;
  return result;
}

uint64_t *sub_2154279F8@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  BOOL v3;

  v2 = *result;
  v3 = (unint64_t)*result > 2;
  if ((unint64_t)*result > 2)
    v2 = 0;
  *(_QWORD *)a2 = v2;
  *(_BYTE *)(a2 + 8) = v3;
  return result;
}

uint64_t sub_215427A18(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_215425950;
  return sub_215426A60(a1, v4, v5, v6);
}

uint64_t sub_215427A88(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_215425DE8;
  return sub_2154278D0(a1, v4, v5, v6);
}

unint64_t sub_215427AF8()
{
  unint64_t result;

  result = qword_254DC33C8;
  if (!qword_254DC33C8)
  {
    result = MEMORY[0x2199E1738](&protocol conformance descriptor for GMRequestState, &type metadata for GMRequestState);
    atomic_store(result, (unint64_t *)&qword_254DC33C8);
  }
  return result;
}

uint64_t sub_215427B3C@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility, a2);
}

uint64_t sub_215427B48(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_eligibility);
}

uint64_t sub_215427B54@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm(a1, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState, a2);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  _QWORD *v4;
  uint64_t result;

  v4 = (_QWORD *)(*a1 + *a2);
  result = swift_beginAccess();
  *a3 = *v4;
  return result;
}

uint64_t sub_215427BAC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_requestState);
}

uint64_t keypath_setTm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

id sub_215427C00@<X0>(_QWORD *a1@<X0>, void **a2@<X8>)
{
  void **v3;
  void *v4;

  v3 = (void **)(*a1 + OBJC_IVAR____TtC24AssistantSettingsSupport21GMEligibilityProvider_presenter);
  swift_beginAccess();
  v4 = *v3;
  *a2 = *v3;
  return v4;
}

uint64_t method lookup function for GMEligibilityProvider()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of GMEligibilityProvider.eligibility.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x70))();
}

uint64_t dispatch thunk of GMEligibilityProvider.eligibility.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x78))();
}

uint64_t dispatch thunk of GMEligibilityProvider.eligibility.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x80))();
}

uint64_t dispatch thunk of GMEligibilityProvider.requestState.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x88))();
}

uint64_t dispatch thunk of GMEligibilityProvider.requestState.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x90))();
}

uint64_t dispatch thunk of GMEligibilityProvider.requestState.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0x98))();
}

uint64_t dispatch thunk of GMEligibilityProvider.presenter.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.presenter.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.presenter.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.deviceSupported.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.activeEnabled.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.onWaitlist.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xC8))();
}

uint64_t dispatch thunk of GMEligibilityProvider.fetchStatus(presenter:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xD0))();
}

uint64_t dispatch thunk of GMEligibilityProvider.update(context:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x24BEE4EA0] & *v0) + 0xE0))();
}

ValueMetadata *type metadata accessor for GMRequestState()
{
  return &type metadata for GMRequestState;
}

uint64_t sub_215427DF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_215427E1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_215425950;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_254DC3400 + dword_254DC3400))(a1, v4);
}

uint64_t objectdestroyTm_0()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_215427EBC(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_215425DE8;
  return sub_215426D88(a1, v4, v5, v6);
}

void __getAnalyticsSendEventLazySymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreAnalyticsLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantVoiceMetrics.m"), 19, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPETEventPropertyClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPETEventPropertyClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantMetrics.m"), 39, CFSTR("Unable to find class %s"), "PETEventProperty");

  __break(1u);
}

void ProactiveEventTrackerLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *ProactiveEventTrackerLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantMetrics.m"), 37, CFSTR("%s"), *a1);

  __break(1u);
}

void __getPETScalarEventTrackerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getPETScalarEventTrackerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantMetrics.m"), 42, CFSTR("Unable to find class %s"), "PETScalarEventTracker");

  __break(1u);
}

void __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VoiceTriggerUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("GMSpecifierProvider.m"), 22, CFSTR("%s"), *a1);

  __break(1u);
}

void __getVTUIGMEnrollmentViewControllerClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVTUIGMEnrollmentViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("GMSpecifierProvider.m"), 23, CFSTR("Unable to find class %s"), "VTUIGMEnrollmentViewController");

  __break(1u);
}

void __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("ASTLockScreenSuggestionSpecifier.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void SearchLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SearchLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantAppClipSettingsController.m"), 23, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKKnowledgeStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKKnowledgeStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantLanguageController.m"), 37, CFSTR("Unable to find class %s"), "CKKnowledgeStore");

  __break(1u);
}

void CoreKnowledgeLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreKnowledgeLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantLanguageController.m"), 34, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKPermanentEventStoreClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKPermanentEventStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantLanguageController.m"), 39, CFSTR("Unable to find class %s"), "CKPermanentEventStore");

  __break(1u);
}

void __getCKEventClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKEventClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantLanguageController.m"), 35, CFSTR("Unable to find class %s"), "CKEvent");

  __break(1u);
}

void __getCKKnowledgeStoreClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKKnowledgeStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantVoiceController.m"), 39, CFSTR("Unable to find class %s"), "CKKnowledgeStore");

  __break(1u);
}

void CoreKnowledgeLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *CoreKnowledgeLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantVoiceController.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
}

void __getCKPermanentEventStoreClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKPermanentEventStoreClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantVoiceController.m"), 41, CFSTR("Unable to find class %s"), "CKPermanentEventStore");

  __break(1u);
}

void __getCKEventClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getCKEventClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantVoiceController.m"), 37, CFSTR("Unable to find class %s"), "CKEvent");

  __break(1u);
}

void getNRDevicePropertySystemVersion_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "NSString *getNRDevicePropertySystemVersion(void)");
  objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleFailureInFunction:file:lineNumber:description:", v0, CFSTR("AssistantController.m"), 132, CFSTR("%s"), OUTLINED_FUNCTION_4());

  __break(1u);
}

void __getVTUISiriDataSharingOptInPresenterClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVTUISiriDataSharingOptInPresenterClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantController.m"), 123, CFSTR("Unable to find class %s"), "VTUISiriDataSharingOptInPresenter");

  __break(1u);
}

void VoiceTriggerUILibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *VoiceTriggerUILibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantController.m"), 120, CFSTR("%s"), *a1);

  __break(1u);
}

void __getNRPairedDeviceRegistryClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getNRPairedDeviceRegistryClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantController.m"), 130, CFSTR("Unable to find class %s"), "NRPairedDeviceRegistry");

  __break(1u);
}

void NanoRegistryLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *NanoRegistryLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantController.m"), 129, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBYFlowSkipControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getBYFlowSkipControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantController.m"), 141, CFSTR("Unable to find class %s"), "BYFlowSkipController");

  __break(1u);
}

void SetupAssistantLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SetupAssistantLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantController.m"), 140, CFSTR("%s"), *a1);

  __break(1u);
}

void __getVTUIVoiceSelectionViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVTUIVoiceSelectionViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantController.m"), 125, CFSTR("Unable to find class %s"), "VTUIVoiceSelectionViewController");

  __break(1u);
}

void __getVTUIEnrollTrainingViewControllerClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "Class getVTUIEnrollTrainingViewControllerClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("AssistantController.m"), 121, CFSTR("Unable to find class %s"), "VTUIEnrollTrainingViewController");

  __break(1u);
}

void SearchLibrary_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SearchLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantDetailController.m"), 33, CFSTR("%s"), *a1);

  __break(1u);
}

void SearchLibrary_cold_1_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SearchLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantAppsSettingsController.m"), 31, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSBSCopyDisplayIdentifiersSymbolLoc_block_invoke_cold_1_0(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("AssistantAppsSettingsController.m"), 36, CFSTR("%s"), *a1);

  __break(1u);
  sub_215429E94();
}

uint64_t sub_215429E94()
{
  return MEMORY[0x24BDCC6D8]();
}

uint64_t sub_215429EA0()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_215429EAC()
{
  return MEMORY[0x24BDCD8D0]();
}

uint64_t sub_215429EB8()
{
  return MEMORY[0x24BDCDA68]();
}

uint64_t sub_215429EC4()
{
  return MEMORY[0x24BDCDAC0]();
}

uint64_t sub_215429ED0()
{
  return MEMORY[0x24BDCEB50]();
}

uint64_t sub_215429EDC()
{
  return MEMORY[0x24BDCEB60]();
}

uint64_t sub_215429EE8()
{
  return MEMORY[0x24BDCEBE0]();
}

uint64_t sub_215429EF4()
{
  return MEMORY[0x24BDCECF0]();
}

uint64_t sub_215429F00()
{
  return MEMORY[0x24BDCED08]();
}

uint64_t sub_215429F0C()
{
  return MEMORY[0x24BDCED58]();
}

uint64_t sub_215429F18()
{
  return MEMORY[0x24BDCEDE0]();
}

uint64_t sub_215429F24()
{
  return MEMORY[0x24BDCEE18]();
}

uint64_t sub_215429F30()
{
  return MEMORY[0x24BDCEE28]();
}

uint64_t sub_215429F3C()
{
  return MEMORY[0x24BDCEE60]();
}

uint64_t sub_215429F48()
{
  return MEMORY[0x24BDCEEA8]();
}

uint64_t sub_215429F54()
{
  return MEMORY[0x24BE3BE28]();
}

uint64_t sub_215429F60()
{
  return MEMORY[0x24BE3BE60]();
}

uint64_t sub_215429F6C()
{
  return MEMORY[0x24BE3BE70]();
}

uint64_t sub_215429F78()
{
  return MEMORY[0x24BE3BF80]();
}

uint64_t sub_215429F84()
{
  return MEMORY[0x24BE3BFD8]();
}

uint64_t sub_215429F90()
{
  return MEMORY[0x24BE3BFE8]();
}

uint64_t sub_215429F9C()
{
  return MEMORY[0x24BE3C020]();
}

uint64_t sub_215429FA8()
{
  return MEMORY[0x24BE3C058]();
}

uint64_t sub_215429FB4()
{
  return MEMORY[0x24BE3C068]();
}

uint64_t sub_215429FC0()
{
  return MEMORY[0x24BE3C090]();
}

uint64_t sub_215429FCC()
{
  return MEMORY[0x24BE3C0C0]();
}

uint64_t sub_215429FD8()
{
  return MEMORY[0x24BE3C0C8]();
}

uint64_t sub_215429FE4()
{
  return MEMORY[0x24BE3C0F0]();
}

uint64_t sub_215429FF0()
{
  return MEMORY[0x24BE3C100]();
}

uint64_t sub_215429FFC()
{
  return MEMORY[0x24BE3C110]();
}

uint64_t sub_21542A008()
{
  return MEMORY[0x24BE3C118]();
}

uint64_t sub_21542A014()
{
  return MEMORY[0x24BE3C138]();
}

uint64_t sub_21542A020()
{
  return MEMORY[0x24BEC6500]();
}

uint64_t sub_21542A02C()
{
  return MEMORY[0x24BE17D48]();
}

uint64_t sub_21542A038()
{
  return MEMORY[0x24BE17D50]();
}

uint64_t sub_21542A044()
{
  return MEMORY[0x24BE17D58]();
}

uint64_t sub_21542A050()
{
  return MEMORY[0x24BE17D60]();
}

uint64_t sub_21542A05C()
{
  return MEMORY[0x24BE17D68]();
}

uint64_t sub_21542A068()
{
  return MEMORY[0x24BE17D70]();
}

uint64_t sub_21542A074()
{
  return MEMORY[0x24BE17D78]();
}

uint64_t sub_21542A080()
{
  return MEMORY[0x24BE17D80]();
}

uint64_t sub_21542A08C()
{
  return MEMORY[0x24BE17D88]();
}

uint64_t sub_21542A098()
{
  return MEMORY[0x24BE17D90]();
}

uint64_t sub_21542A0A4()
{
  return MEMORY[0x24BE17D98]();
}

uint64_t sub_21542A0B0()
{
  return MEMORY[0x24BE17DA0]();
}

uint64_t sub_21542A0BC()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_21542A0C8()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_21542A0D4()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_21542A0E0()
{
  return MEMORY[0x24BDEB040]();
}

uint64_t sub_21542A0EC()
{
  return MEMORY[0x24BDEBED0]();
}

uint64_t sub_21542A0F8()
{
  return MEMORY[0x24BDEDE90]();
}

uint64_t sub_21542A104()
{
  return MEMORY[0x24BDEDE98]();
}

uint64_t sub_21542A110()
{
  return MEMORY[0x24BDEE038]();
}

uint64_t sub_21542A11C()
{
  return MEMORY[0x24BDEE048]();
}

uint64_t sub_21542A128()
{
  return MEMORY[0x24BDEE390]();
}

uint64_t sub_21542A134()
{
  return MEMORY[0x24BDEE3A0]();
}

uint64_t sub_21542A140()
{
  return MEMORY[0x24BDEEB88]();
}

uint64_t sub_21542A14C()
{
  return MEMORY[0x24BDEF3A0]();
}

uint64_t sub_21542A158()
{
  return MEMORY[0x24BDEFE58]();
}

uint64_t sub_21542A164()
{
  return MEMORY[0x24BDEFE68]();
}

uint64_t sub_21542A170()
{
  return MEMORY[0x24BDF14A0]();
}

uint64_t sub_21542A17C()
{
  return MEMORY[0x24BDF14A8]();
}

uint64_t sub_21542A188()
{
  return MEMORY[0x24BDF1510]();
}

uint64_t sub_21542A194()
{
  return MEMORY[0x24BDF1678]();
}

uint64_t sub_21542A1A0()
{
  return MEMORY[0x24BDF16D8]();
}

uint64_t sub_21542A1AC()
{
  return MEMORY[0x24BDF1750]();
}

uint64_t sub_21542A1B8()
{
  return MEMORY[0x24BDF1FF0]();
}

uint64_t sub_21542A1C4()
{
  return MEMORY[0x24BDF2088]();
}

uint64_t sub_21542A1D0()
{
  return MEMORY[0x24BDF20A0]();
}

uint64_t sub_21542A1DC()
{
  return MEMORY[0x24BDF2698]();
}

uint64_t sub_21542A1E8()
{
  return MEMORY[0x24BDF3CF0]();
}

uint64_t sub_21542A1F4()
{
  return MEMORY[0x24BDF3D30]();
}

uint64_t sub_21542A200()
{
  return MEMORY[0x24BDF40C0]();
}

uint64_t sub_21542A20C()
{
  return MEMORY[0x24BDF48E8]();
}

uint64_t sub_21542A218()
{
  return MEMORY[0x24BDF4F18]();
}

uint64_t sub_21542A224()
{
  return MEMORY[0x24BEE5458]();
}

uint64_t sub_21542A230()
{
  return MEMORY[0x24BEE54C8]();
}

uint64_t sub_21542A23C()
{
  return MEMORY[0x24BEE5500]();
}

uint64_t sub_21542A248()
{
  return MEMORY[0x24BE85598]();
}

uint64_t sub_21542A254()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_21542A260()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_21542A26C()
{
  return MEMORY[0x24BEE0610]();
}

uint64_t sub_21542A278()
{
  return MEMORY[0x24BEE0980]();
}

uint64_t sub_21542A284()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_21542A290()
{
  return MEMORY[0x24BDCFA08]();
}

uint64_t sub_21542A29C()
{
  return MEMORY[0x24BDCFA18]();
}

uint64_t sub_21542A2A8()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_21542A2B4()
{
  return MEMORY[0x24BDCFA68]();
}

uint64_t sub_21542A2C0()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_21542A2CC()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_21542A2D8()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_21542A2E4()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_21542A2F0()
{
  return MEMORY[0x24BEE68C8]();
}

uint64_t sub_21542A2FC()
{
  return MEMORY[0x24BEE6920]();
}

uint64_t sub_21542A308()
{
  return MEMORY[0x24BEE6928]();
}

uint64_t sub_21542A314()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_21542A320()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_21542A32C()
{
  return MEMORY[0x24BEE1598]();
}

uint64_t sub_21542A338()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_21542A344()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_21542A350()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_21542A35C()
{
  return MEMORY[0x24BEBCBF0]();
}

uint64_t sub_21542A368()
{
  return MEMORY[0x24BEE5770]();
}

uint64_t sub_21542A374()
{
  return MEMORY[0x24BEE5790]();
}

uint64_t sub_21542A380()
{
  return MEMORY[0x24BDD0278]();
}

uint64_t sub_21542A38C()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_21542A398()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_21542A3A4()
{
  return MEMORY[0x24BDD0600]();
}

uint64_t sub_21542A3B0()
{
  return MEMORY[0x24BEE22C0]();
}

uint64_t sub_21542A3BC()
{
  return MEMORY[0x24BEE23A0]();
}

uint64_t sub_21542A3C8()
{
  return MEMORY[0x24BEE23A8]();
}

uint64_t sub_21542A3D4()
{
  return MEMORY[0x24BEE23E8]();
}

uint64_t sub_21542A3E0()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_21542A3EC()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_21542A3F8()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_21542A404()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_21542A410()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_21542A41C()
{
  return MEMORY[0x24BEE31D0]();
}

uint64_t sub_21542A428()
{
  return MEMORY[0x24BEE3568]();
}

uint64_t sub_21542A434()
{
  return MEMORY[0x24BEE3A28]();
}

uint64_t sub_21542A440()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_21542A44C()
{
  return MEMORY[0x24BEE3D98]();
}

uint64_t sub_21542A458()
{
  return MEMORY[0x24BDD0708]();
}

uint64_t sub_21542A464()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_21542A470()
{
  return MEMORY[0x24BEE42F8]();
}

uint64_t sub_21542A47C()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x24BE02948]();
}

uint64_t AFDeviceSupportsANE()
{
  return MEMORY[0x24BE08C70]();
}

uint64_t AFDeviceSupportsEchoCancellation()
{
  return MEMORY[0x24BE08C80]();
}

uint64_t AFDeviceSupportsFullSiriUOD()
{
  return MEMORY[0x24BE08C88]();
}

uint64_t AFDeviceSupportsSystemAssistantExperience()
{
  return MEMORY[0x24BE08CC8]();
}

uint64_t AFGryphonAssetsExistForLanguage()
{
  return MEMORY[0x24BE08D30]();
}

uint64_t AFIsInternalInstall()
{
  return MEMORY[0x24BE08DA8]();
}

uint64_t AFOutputVoiceLanguageForRecognitionLanguage()
{
  return MEMORY[0x24BE08E90]();
}

uint64_t AFPreferencesSupportedLanguages()
{
  return MEMORY[0x24BE08ED8]();
}

uint64_t AFSiriDataSharingOptInStatusGetName()
{
  return MEMORY[0x24BE08F88]();
}

uint64_t AFSupportsCallHangUp()
{
  return MEMORY[0x24BE09058]();
}

uint64_t AFSupportsSiriInCall()
{
  return MEMORY[0x24BE09060]();
}

uint64_t AFVoiceGenderGetName()
{
  return MEMORY[0x24BE09098]();
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x24BDBBA38](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x24BDBBA98](allocator, bundleURL);
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x24BDBBAA8](bundleID);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x24BDBBAC0](bundle);
}

CFDictionaryRef CFBundleGetInfoDictionary(CFBundleRef bundle)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBAC8](bundle);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
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

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

uint64_t MobileGestalt_copy_deviceClass_obj()
{
  return MEMORY[0x24BED84F8]();
}

uint64_t MobileGestalt_get_current_device()
{
  return MEMORY[0x24BED8580]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PSApplicationSpecifierForAssistantSection()
{
  return MEMORY[0x24BE75880]();
}

uint64_t PSBundlePathForPreferenceBundle()
{
  return MEMORY[0x24BE758F0]();
}

uint64_t PSResetCachedSiriKitTCCEnabledAppIds()
{
  return MEMORY[0x24BE75C40]();
}

uint64_t PSTableSectionFooterBottomPad()
{
  return MEMORY[0x24BE75D30]();
}

uint64_t PSTextViewInsets()
{
  return MEMORY[0x24BE75D40]();
}

uint64_t SFLocalizableWAPIStringKeyForKey()
{
  return MEMORY[0x24BE85770]();
}

uint64_t TCCAccessCopyInformation()
{
  return MEMORY[0x24BEB3770]();
}

uint64_t TCCAccessSetForBundle()
{
  return MEMORY[0x24BEB37E8]();
}

uint64_t VSPreferencesSetSpokenLanguageIdentifier()
{
  return MEMORY[0x24BEC0E90]();
}

uint64_t _AXSHomeButtonAssistant()
{
  return MEMORY[0x24BED2290]();
}

uint64_t _AXSSetHomeButtonAssistant()
{
  return MEMORY[0x24BED2470]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x24BDAED08](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x24BDAED60](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint64_t nw_path_create_default_evaluator()
{
  return MEMORY[0x24BDE17E8]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x24BDE1828]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

BOOL nw_path_is_expensive(nw_path_t path)
{
  return MEMORY[0x24BDE19C8](path);
}

BOOL nw_path_uses_interface_type(nw_path_t path, nw_interface_type_t interface_type)
{
  return MEMORY[0x24BDE1A68](path, *(_QWORD *)&interface_type);
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x24BEE4B58]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x24BEE4B68]();
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

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x24BEE71D0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x24BEE71D8]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x24BEE4C10]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x24BEE4C38]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x24BEE4C60]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x24BEE4C98]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x24BEE4CA0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x24BEE4CA8]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x24BEE4D18]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x24BEE4D40]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x24BEE4D88]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x24BEE4DB0]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x24BEE4DB8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x24BEE4DC0]();
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

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x24BEE4E98]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x24BEE4EA8]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x24BEE4EB0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_release()
{
  return MEMORY[0x24BEE4EF8]();
}

uint64_t swift_retain()
{
  return MEMORY[0x24BEE4F08]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x24BEE4F30]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x24BEE4F58]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x24BEE7228]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x24BEE7230]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x24BEE7238]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x24BEE7278]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x24BEE4F70]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x24BEE4F80]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x24BEE4FB0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x24BEE4FC8]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x24BEE4FD0]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x24BEE4FD8]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x24BEE5008]();
}

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

uint64_t swift_willThrowTypedImpl()
{
  return MEMORY[0x24BEE5058]();
}

