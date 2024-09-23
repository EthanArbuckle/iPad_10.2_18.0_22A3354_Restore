void sub_20DB2F2A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_20DB32A30(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 48));
  _Unwind_Resume(a1);
}

void sub_20DB33420(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_20DB348FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 96), 8);
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

void sub_20DB34E6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_20DB35430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_20DB3DE7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_20DB42A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_7_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_20DB46AD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_10_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_20DB51950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DB54B28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20DB54DF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DB5DFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_20DB5EC44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_20DB5FFC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_20DB60468(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

void sub_20DB610D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

uint64_t LocalAuthenticationLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = LocalAuthenticationLibraryCore_frameworkLibrary;
  v6 = LocalAuthenticationLibraryCore_frameworkLibrary;
  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24C81D348;
    v8 = *(_OWORD *)&off_24C81D358;
    v1 = _sl_dlopen();
    v4[3] = v1;
    LocalAuthenticationLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20DB6430C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t LocalAuthenticationLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = LocalAuthenticationLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getLAContextClass()
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
  v0 = (void *)getLAContextClass_softClass;
  v7 = getLAContextClass_softClass;
  if (!getLAContextClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLAContextClass_block_invoke;
    v3[3] = &unk_24C81D370;
    v3[4] = &v4;
    __getLAContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DB6441C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  LocalAuthenticationLibrary();
  result = objc_getClass("LAContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLAContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getLAContextClass_block_invoke_cold_1();
    return (Class)getLAEnvironmentClass(v3);
  }
  return result;
}

id getLAEnvironmentClass()
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
  v0 = (void *)getLAEnvironmentClass_softClass;
  v7 = getLAEnvironmentClass_softClass;
  if (!getLAEnvironmentClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getLAEnvironmentClass_block_invoke;
    v3[3] = &unk_24C81D370;
    v3[4] = &v4;
    __getLAEnvironmentClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DB64528(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getLAEnvironmentClass_block_invoke(uint64_t a1)
{
  Class result;
  id v3;
  SEL v4;

  LocalAuthenticationLibrary();
  result = objc_getClass("LAEnvironment");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getLAEnvironmentClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getLAEnvironmentClass_block_invoke_cold_1();
    return (Class)+[CDPDFollowUpFactory contextToIdentifierMap](v3, v4);
  }
  return result;
}

void sub_20DB68568(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (SetupAssistantLibraryCore_frameworkLibrary)
  {
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
  }
  else
  {
    SetupAssistantLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)SetupAssistantLibraryCore_frameworkLibrary;
    if (!SetupAssistantLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "BYSetupAssistantFinishedDarwinNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getBYSetupAssistantFinishedDarwinNotificationSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20DB68C38(_Unwind_Exception *a1)
{
  uint64_t v1;

  os_activity_scope_leave((os_activity_scope_state_t)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_20DB699D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

uint64_t UserManagementLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = UserManagementLibraryCore_frameworkLibrary;
  v6 = UserManagementLibraryCore_frameworkLibrary;
  if (!UserManagementLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_24C81D5B0;
    v8 = *(_OWORD *)&off_24C81D5C0;
    v1 = _sl_dlopen();
    v4[3] = v1;
    UserManagementLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_20DB6C520(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t UserManagementLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = UserManagementLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id getUMUserManagerClass()
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
  v0 = (void *)getUMUserManagerClass_softClass;
  v7 = getUMUserManagerClass_softClass;
  if (!getUMUserManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getUMUserManagerClass_block_invoke;
    v3[3] = &unk_24C81D370;
    v3[4] = &v4;
    __getUMUserManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DB6C630(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getUMUserManagerClass_block_invoke(uint64_t a1)
{
  CDPDClientHandler *v2;
  SEL v3;
  id v4;
  BOOL v5;
  id v6;

  UserManagementLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("UMUserManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getUMUserManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getUMUserManagerClass_block_invoke_cold_1();
    -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:](v2, v3, v4, v5, v6);
  }
}

void sub_20DB6DA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

const char *OUTLINED_FUNCTION_11_0(SEL sel)
{
  return sel_getName(sel);
}

void sub_20DB733F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_20DB76E1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_20DB7CAA8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_11_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x1Cu);
}

void sub_20DB7FBE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_20DB80FA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

void sub_20DB813F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DB8147C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *__getMKBDeviceLockAssertionSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (MobileKeyBagLibraryCore_frameworkLibrary)
  {
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
  }
  else
  {
    MobileKeyBagLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)MobileKeyBagLibraryCore_frameworkLibrary;
    if (!MobileKeyBagLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "MKBDeviceLockAssertion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getMKBDeviceLockAssertionSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_20DB837B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_20DB84054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v9 - 80));
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_7_1()
{
  uint64_t v0;

  return v0;
}

uint64_t _networkReachabilityCallBack(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "_networkReachabilityDidChangeWithFlags:", a2);
}

uint64_t sub_20DB88D6C()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v1 = objc_msgSend(v0, sel_escrowInformationMetadata);
  if (!v1)
    return 0;
  v2 = v1;
  if (!objc_msgSend(v1, sel_hasBuild)
    || (v3 = objc_msgSend(v2, sel_build)) == 0)
  {

    return 0;
  }
  v4 = v3;
  v5 = sub_20DB9F648();

  return v5;
}

void sub_20DB88E08()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unsigned int v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v1 = objc_msgSend(v0, sel_escrowInformationMetadata);
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, sel_clientMetadata);

    if (!v3)
    {
      __break(1u);
      goto LABEL_11;
    }
    v4 = objc_msgSend(v3, sel_hasDeviceMid);

    if (v4)
    {
      v5 = objc_msgSend(v0, sel_escrowInformationMetadata);
      v6 = v5;
      if (v5)
      {
        v7 = objc_msgSend(v5, sel_clientMetadata);

        if (v7)
        {
          v8 = objc_msgSend(v7, sel_deviceMid);

          if (v8)
          {
            sub_20DB9F648();

          }
          return;
        }
LABEL_11:
        __break(1u);
      }
    }
  }
}

id sub_20DB88F28()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;

  v1 = objc_msgSend(v0, sel_escrowInformationMetadata);
  if (!v1)
    return 0;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_passcodeGeneration);
  if (v3)
  {
    v4 = v3;
    if (objc_msgSend(v3, sel_hasValue))
      v5 = objc_msgSend(v4, sel_value);
    else
      v5 = 0;

  }
  else
  {
    v5 = 0;
    v4 = v2;
  }

  return v5;
}

uint64_t sub_20DB88FE4(uint64_t a1, uint64_t a2)
{
  return sub_20DB89040(a1, a2, (SEL *)&selRef_hasLabel, (SEL *)&selRef_label);
}

uint64_t sub_20DB88FF8(uint64_t a1, uint64_t a2)
{
  return sub_20DB89040(a1, a2, (SEL *)&selRef_hasRecordId, (SEL *)&selRef_recordId);
}

uint64_t sub_20DB8900C()
{
  return sub_20DB88D6C();
}

uint64_t sub_20DB8902C(uint64_t a1, uint64_t a2)
{
  return sub_20DB89040(a1, a2, (SEL *)&selRef_hasSerialNumber, (SEL *)&selRef_serialNumber);
}

uint64_t sub_20DB89040(uint64_t a1, uint64_t a2, SEL *a3, SEL *a4)
{
  void **v4;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;

  v6 = *v4;
  if (!objc_msgSend(v6, *a3))
    return 0;
  v7 = objc_msgSend(v6, *a4);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = sub_20DB9F648();

  return v9;
}

void sub_20DB890B8()
{
  sub_20DB88E08();
}

id sub_20DB890D8()
{
  return sub_20DB88F28();
}

id sub_20DB890FC()
{
  id *v0;
  id v1;
  id result;

  v1 = *v0;
  result = objc_msgSend(*v0, sel_hasRecordStatus);
  if ((_DWORD)result)
    return (id)(objc_msgSend(v1, sel_recordStatus) == 0);
  return result;
}

id sub_20DB89144()
{
  id *v0;
  id v1;
  id result;

  v1 = *v0;
  result = objc_msgSend(*v0, sel_hasRecordViability);
  if ((_DWORD)result)
    return (id)(objc_msgSend(v1, sel_recordViability) < 2);
  return result;
}

uint64_t sub_20DB8918C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  os_log_type_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  os_log_type_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  NSObject *v38;
  os_log_type_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  uint64_t v44;
  unint64_t v45;
  unint64_t v46;
  os_log_t v47;
  uint64_t v48;
  uint64_t v49;
  os_log_t v50;
  unint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;

  v56 = *(_QWORD *)(a1 - 8);
  v5 = ((uint64_t (*)(void))MEMORY[0x24BDAC7A8])();
  v7 = (char *)&v49 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v5);
  v9 = (char *)&v49 - v8;
  v10 = sub_20DB9F60C();
  v11 = *(_QWORD *)(v10 - 8);
  v12 = MEMORY[0x24BDAC7A8](v10);
  v14 = (char *)&v49 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v12);
  v16 = (char *)&v49 - v15;
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  if (v18)
  {
    v19 = v18;
    v55 = v17;
    if ((sub_20DB9F678() & 1) != 0)
    {
      swift_bridgeObjectRelease();
      return 1;
    }
    if (qword_2549DB870 != -1)
      swift_once();
    v34 = v10;
    v35 = __swift_project_value_buffer(v10, (uint64_t)qword_2549DC270);
    v36 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v16, v35, v34);
    v37 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v9, v2, a1);
    swift_bridgeObjectRetain();
    v38 = sub_20DB9F5F4();
    v39 = sub_20DB9F6D8();
    LODWORD(v53) = v39;
    if (os_log_type_enabled(v38, v39))
    {
      v40 = swift_slowAlloc();
      v51 = (unint64_t)"Daemon";
      v41 = v40;
      v42 = swift_slowAlloc();
      v52 = v42;
      *(_DWORD *)v41 = 141559043;
      v57 = 1752392040;
      v58 = v42;
      v54 = v34;
      sub_20DB9F714();
      *(_WORD *)(v41 + 12) = 2081;
      v43 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 16);
      v50 = v38;
      v44 = v43(a1, a2);
      if (v45)
      {
        v46 = v45;
      }
      else
      {
        v44 = 0x3E6C696E3CLL;
        v46 = 0xE500000000000000;
      }
      v57 = sub_20DB919A4(v44, v46, &v58);
      sub_20DB9F714();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, a1);
      *(_WORD *)(v41 + 22) = 2160;
      v57 = 1752392040;
      sub_20DB9F714();
      *(_WORD *)(v41 + 32) = 2081;
      swift_bridgeObjectRetain();
      v57 = sub_20DB919A4(v55, v19, &v58);
      sub_20DB9F714();
      swift_bridgeObjectRelease_n();
      *(_WORD *)(v41 + 42) = 2080;
      v57 = sub_20DB919A4(0xD000000000000015, v51 | 0x8000000000000000, &v58);
      sub_20DB9F714();
      v47 = v50;
      _os_log_impl(&dword_20DB2C000, v50, (os_log_type_t)v53, "Unexpected record label for record %{private,mask.hash}s (Got: %{private,mask.hash}s, Expected: %s*", (uint8_t *)v41, 0x34u);
      v48 = v52;
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v48, -1, -1);
      MEMORY[0x212BB073C](v41, -1, -1);

      (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v54);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v37 + 8))(v9, a1);

      swift_bridgeObjectRelease_n();
      (*(void (**)(char *, uint64_t))(v36 + 8))(v16, v34);
    }
  }
  else
  {
    if (qword_2549DB870 != -1)
      swift_once();
    v21 = __swift_project_value_buffer(v10, (uint64_t)qword_2549DC270);
    v22 = v11;
    (*(void (**)(char *, uint64_t, uint64_t))(v11 + 16))(v14, v21, v10);
    v23 = v56;
    (*(void (**)(char *, uint64_t, uint64_t))(v56 + 16))(v7, v2, a1);
    v24 = sub_20DB9F5F4();
    v25 = sub_20DB9F6E4();
    if (os_log_type_enabled(v24, v25))
    {
      v26 = swift_slowAlloc();
      v54 = v10;
      v27 = v26;
      v28 = swift_slowAlloc();
      v53 = v28;
      *(_DWORD *)v27 = 141558275;
      v57 = 1752392040;
      v58 = v28;
      v55 = v22;
      sub_20DB9F714();
      *(_WORD *)(v27 + 12) = 2081;
      v29 = v25;
      v30 = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 16))(a1, a2);
      if (v31)
      {
        v32 = v31;
      }
      else
      {
        v30 = 0x3E6C696E3CLL;
        v32 = 0xE500000000000000;
      }
      v57 = sub_20DB919A4(v30, v32, &v58);
      sub_20DB9F714();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, a1);
      _os_log_impl(&dword_20DB2C000, v24, v29, "No label found on record %{private,mask.hash}s", (uint8_t *)v27, 0x16u);
      v33 = v53;
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v33, -1, -1);
      MEMORY[0x212BB073C](v27, -1, -1);

      (*(void (**)(char *, uint64_t))(v55 + 8))(v14, v54);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v23 + 8))(v7, a1);

      (*(void (**)(char *, uint64_t))(v22 + 8))(v14, v10);
    }
  }
  return 0;
}

uint64_t sub_20DB89798(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  os_log_type_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  char *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  unint64_t v47;
  unint64_t v48;
  id v49;
  void *v50;
  uint64_t v51;
  unint64_t v52;
  unint64_t v53;
  os_log_t v54;
  uint64_t v55;
  uint64_t result;
  uint64_t v57;
  uint64_t v58;
  os_log_t v59;
  int v60;
  uint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;

  v7 = *(_QWORD *)(a2 - 8);
  v8 = MEMORY[0x24BDAC7A8](a1);
  v10 = (char *)&v57 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v8);
  v12 = (char *)&v57 - v11;
  v13 = sub_20DB9F60C();
  v64 = *(_QWORD *)(v13 - 8);
  v14 = MEMORY[0x24BDAC7A8](v13);
  v16 = (char *)&v57 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v14);
  v62 = (char *)&v57 - v17;
  v18 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 32))(a2, a3);
  if (!v19)
  {
    if (qword_2549DB870 != -1)
      swift_once();
    v28 = __swift_project_value_buffer(v13, (uint64_t)qword_2549DC270);
    v29 = v64;
    (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v16, v28, v13);
    (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v10, v3, a2);
    v30 = sub_20DB9F5F4();
    v31 = sub_20DB9F6E4();
    if (os_log_type_enabled(v30, v31))
    {
      v32 = swift_slowAlloc();
      v33 = swift_slowAlloc();
      v62 = (char *)v33;
      *(_DWORD *)v32 = 141558275;
      v65 = 1752392040;
      v66 = v33;
      v63 = v13;
      sub_20DB9F714();
      *(_WORD *)(v32 + 12) = 2081;
      v34 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
      if (v35)
      {
        v36 = v35;
      }
      else
      {
        v34 = 0x3E6C696E3CLL;
        v36 = 0xE500000000000000;
      }
      v65 = sub_20DB919A4(v34, v36, &v66);
      sub_20DB9F714();
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a2);
      _os_log_impl(&dword_20DB2C000, v30, v31, "No serial found on record %{private,mask.hash}s", (uint8_t *)v32, 0x16u);
      v37 = v62;
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v37, -1, -1);
      MEMORY[0x212BB073C](v32, -1, -1);

      (*(void (**)(char *, uint64_t))(v64 + 8))(v16, v63);
    }
    else
    {
      (*(void (**)(char *, uint64_t))(v7 + 8))(v10, a2);

      (*(void (**)(char *, uint64_t))(v29 + 8))(v16, v13);
    }
    return 0;
  }
  v20 = v19;
  v61 = v18;
  v63 = v13;
  v21 = objc_msgSend(a1, sel_serialNumber);
  if (v21)
  {
    v22 = v21;
    v23 = sub_20DB9F648();
    v25 = v24;

    if (v61 == v23 && v20 == v25)
    {
      swift_bridgeObjectRelease();
LABEL_25:
      swift_bridgeObjectRelease();
      return 1;
    }
    v27 = sub_20DB9F7B0();
    swift_bridgeObjectRelease();
    if ((v27 & 1) != 0)
      goto LABEL_25;
  }
  if (qword_2549DB870 != -1)
    swift_once();
  v38 = v63;
  v39 = __swift_project_value_buffer(v63, (uint64_t)qword_2549DC270);
  v40 = v64;
  v41 = v62;
  (*(void (**)(char *, uint64_t, uint64_t))(v64 + 16))(v62, v39, v38);
  (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))(v12, v3, a2);
  v42 = v41;
  v43 = a1;
  swift_bridgeObjectRetain();
  v44 = sub_20DB9F5F4();
  v60 = sub_20DB9F6D8();
  if (!os_log_type_enabled(v44, (os_log_type_t)v60))
  {
    (*(void (**)(char *, uint64_t))(v7 + 8))(v12, a2);

    swift_bridgeObjectRelease_n();
    (*(void (**)(char *, uint64_t))(v40 + 8))(v42, v38);
    return 0;
  }
  v59 = v44;
  v45 = swift_slowAlloc();
  v58 = swift_slowAlloc();
  v65 = 1752392040;
  v66 = v58;
  *(_DWORD *)v45 = 141559299;
  sub_20DB9F714();
  *(_WORD *)(v45 + 12) = 2081;
  v46 = (*(uint64_t (**)(uint64_t, uint64_t))(a3 + 16))(a2, a3);
  if (v47)
  {
    v48 = v47;
  }
  else
  {
    v46 = 0x3E6C696E3CLL;
    v48 = 0xE500000000000000;
  }
  v65 = sub_20DB919A4(v46, v48, &v66);
  sub_20DB9F714();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v12, a2);
  *(_WORD *)(v45 + 22) = 2160;
  v65 = 1752392040;
  sub_20DB9F714();
  *(_WORD *)(v45 + 32) = 2081;
  v49 = objc_msgSend(v43, sel_serialNumber);
  if (v49)
  {
    v50 = v49;
    v51 = sub_20DB9F648();
    v53 = v52;

    v65 = sub_20DB919A4(v51, v53, &v66);
    sub_20DB9F714();

    swift_bridgeObjectRelease();
    *(_WORD *)(v45 + 42) = 2160;
    v65 = 1752392040;
    sub_20DB9F714();
    *(_WORD *)(v45 + 52) = 2081;
    swift_bridgeObjectRetain();
    v65 = sub_20DB919A4(v61, v20, &v66);
    sub_20DB9F714();
    swift_bridgeObjectRelease_n();
    v54 = v59;
    _os_log_impl(&dword_20DB2C000, v59, (os_log_type_t)v60, "Serial number did not match for record %{private,mask.hash}s (Got: %{private,mask.hash}s, Expected: %{private,mask.hash}s", (uint8_t *)v45, 0x3Eu);
    v55 = v58;
    swift_arrayDestroy();
    MEMORY[0x212BB073C](v55, -1, -1);
    MEMORY[0x212BB073C](v45, -1, -1);

    (*(void (**)(char *, uint64_t))(v64 + 8))(v62, v63);
    return 0;
  }

  result = swift_bridgeObjectRelease();
  __break(1u);
  return result;
}

uint64_t sub_20DB89E54(void *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  id v18;
  void *v19;
  id v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  NSObject *v27;
  os_log_type_t v28;
  uint8_t *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  os_log_type_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  os_log_type_t v37;
  uint64_t v38;
  unint64_t v39;
  unint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  NSObject *v49;
  os_log_type_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t);
  uint64_t v56;
  unint64_t v57;
  unint64_t v58;
  os_log_t v59;
  uint64_t v60;
  uint64_t v61;
  os_log_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  char *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;

  v68 = *(_QWORD *)(a2 - 8);
  v7 = MEMORY[0x24BDAC7A8](a1);
  v9 = (char *)&v61 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v7);
  v67 = (char *)&v61 - v10;
  v11 = sub_20DB9F60C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = MEMORY[0x24BDAC7A8](v11);
  v15 = (char *)&v61 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x24BDAC7A8](v13);
  v17 = (char *)&v61 - v16;
  v18 = objc_msgSend(a1, sel_localSecretGeneration);
  if (v18)
  {
    v19 = v18;
    v20 = objc_msgSend(v18, sel_unsignedLongLongValue);

    v21 = *(uint64_t (**)(uint64_t, uint64_t))(a3 + 48);
    v22 = a2;
    v66 = a3;
    v23 = v21(a2, a3);
    if ((v24 & 1) != 0)
    {
      if (qword_2549DB870 != -1)
        swift_once();
      v30 = __swift_project_value_buffer(v11, (uint64_t)qword_2549DC270);
      (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v15, v30, v11);
      v31 = v68;
      (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v9, v3, a2);
      v32 = sub_20DB9F5F4();
      v33 = sub_20DB9F6D8();
      if (os_log_type_enabled(v32, v33))
      {
        v34 = swift_slowAlloc();
        v64 = v11;
        v65 = v12;
        v35 = v34;
        v36 = swift_slowAlloc();
        v67 = (char *)v36;
        *(_DWORD *)v35 = 141558275;
        v69 = 1752392040;
        v70 = v36;
        sub_20DB9F714();
        *(_WORD *)(v35 + 12) = 2081;
        v37 = v33;
        v38 = (*(uint64_t (**)(uint64_t))(v66 + 16))(v22);
        if (v39)
        {
          v40 = v39;
        }
        else
        {
          v38 = 0x3E6C696E3CLL;
          v40 = 0xE500000000000000;
        }
        v69 = sub_20DB919A4(v38, v40, &v70);
        sub_20DB9F714();
        swift_bridgeObjectRelease();
        (*(void (**)(char *, uint64_t))(v31 + 8))(v9, v22);
        _os_log_impl(&dword_20DB2C000, v32, v37, "No secret generation found on record with id %{private,mask.hash}s", (uint8_t *)v35, 0x16u);
        v41 = v67;
        swift_arrayDestroy();
        MEMORY[0x212BB073C](v41, -1, -1);
        MEMORY[0x212BB073C](v35, -1, -1);

        (*(void (**)(char *, uint64_t))(v65 + 8))(v15, v64);
      }
      else
      {
        (*(void (**)(char *, uint64_t))(v31 + 8))(v9, a2);

        (*(void (**)(char *, uint64_t))(v12 + 8))(v15, v11);
      }
      return 2;
    }
    else
    {
      v25 = v23;
      if (v20 == (id)v23)
      {
        return 5;
      }
      else
      {
        if (qword_2549DB870 != -1)
          swift_once();
        v42 = v11;
        v43 = __swift_project_value_buffer(v11, (uint64_t)qword_2549DC270);
        v44 = v12;
        v45 = v17;
        (*(void (**)(char *, uint64_t, uint64_t))(v12 + 16))(v17, v43, v11);
        v47 = v67;
        v46 = v68;
        v48 = v22;
        (*(void (**)(char *, uint64_t, uint64_t))(v68 + 16))(v67, v3, v22);
        v49 = sub_20DB9F5F4();
        v50 = sub_20DB9F6D8();
        v51 = v50;
        if (os_log_type_enabled(v49, v50))
        {
          v52 = swift_slowAlloc();
          v65 = v44;
          v53 = v52;
          v54 = swift_slowAlloc();
          v63 = v54;
          *(_DWORD *)v53 = 141558787;
          v69 = 1752392040;
          v70 = v54;
          v64 = v42;
          sub_20DB9F714();
          *(_WORD *)(v53 + 12) = 2081;
          v55 = *(uint64_t (**)(uint64_t))(v66 + 16);
          v62 = v49;
          v56 = v55(v48);
          if (v57)
          {
            v58 = v57;
          }
          else
          {
            v56 = 0x3E6C696E3CLL;
            v58 = 0xE500000000000000;
          }
          LODWORD(v66) = v51;
          v69 = sub_20DB919A4(v56, v58, &v70);
          sub_20DB9F714();
          swift_bridgeObjectRelease();
          (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);
          *(_WORD *)(v53 + 22) = 2048;
          v69 = v25;
          sub_20DB9F714();
          *(_WORD *)(v53 + 32) = 2048;
          v69 = (uint64_t)v20;
          sub_20DB9F714();
          v59 = v62;
          _os_log_impl(&dword_20DB2C000, v62, (os_log_type_t)v66, "Secret generation mismatch for record with id %{private,mask.hash}s (Got: %llu Expected: %llu)", (uint8_t *)v53, 0x2Au);
          v60 = v63;
          swift_arrayDestroy();
          MEMORY[0x212BB073C](v60, -1, -1);
          MEMORY[0x212BB073C](v53, -1, -1);

          (*(void (**)(char *, uint64_t))(v65 + 8))(v45, v64);
        }
        else
        {
          (*(void (**)(char *, uint64_t))(v46 + 8))(v47, v48);

          (*(void (**)(char *, uint64_t))(v44 + 8))(v45, v42);
        }
        return 3;
      }
    }
  }
  else
  {
    if (qword_2549DB870 != -1)
      swift_once();
    __swift_project_value_buffer(v11, (uint64_t)qword_2549DC270);
    v27 = sub_20DB9F5F4();
    v28 = sub_20DB9F6D8();
    if (os_log_type_enabled(v27, v28))
    {
      v29 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v29 = 0;
      _os_log_impl(&dword_20DB2C000, v27, v28, "No passcode generation data found on device", v29, 2u);
      MEMORY[0x212BB073C](v29, -1, -1);
    }

    return 1;
  }
}

id sub_20DB8A4B4(_QWORD *a1, void *a2)
{
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  id v45;
  char v47;
  uint64_t v48[3];
  uint64_t v49;
  uint64_t v50;
  _QWORD v51[3];
  uint64_t v52;
  uint64_t v53;

  if (qword_2549DB870 != -1)
    swift_once();
  v4 = sub_20DB9F60C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2549DC270);
  sub_20DB8C0C0((uint64_t)a1, (uint64_t)v51);
  v5 = sub_20DB9F5F4();
  v6 = sub_20DB9F6D8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = swift_slowAlloc();
    v8 = swift_slowAlloc();
    *(_DWORD *)v7 = 141558275;
    v48[0] = v8;
    sub_20DB9F714();
    *(_WORD *)(v7 + 12) = 2081;
    v10 = v52;
    v9 = v53;
    __swift_project_boxed_opaque_existential_1(v51, v52);
    v11 = (*(uint64_t (**)(uint64_t, uint64_t))(v9 + 16))(v10, v9);
    if (v12)
    {
      v13 = v12;
    }
    else
    {
      v11 = 0;
      v13 = 0xE000000000000000;
    }
    sub_20DB919A4(v11, v13, v48);
    sub_20DB9F714();
    swift_bridgeObjectRelease();
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
    _os_log_impl(&dword_20DB2C000, v5, v6, "Evaluating record %{private,mask.hash}s", (uint8_t *)v7, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x212BB073C](v8, -1, -1);
    MEMORY[0x212BB073C](v7, -1, -1);
  }
  else
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  }

  v14 = a1[3];
  v15 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v14);
  v16 = (*(uint64_t (**)(uint64_t, uint64_t))(v15 + 56))(v14, v15);
  sub_20DB8C0C0((uint64_t)a1, (uint64_t)v51);
  if ((v16 & 1) != 0)
  {
    v17 = v52;
    v18 = v53;
    __swift_project_boxed_opaque_existential_1(v51, v52);
    v47 = sub_20DB8918C(v17, v18);
  }
  else
  {
    v47 = 0;
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v51);
  v19 = a1[3];
  v20 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v19);
  v21 = sub_20DB89798(a2, v19, v20);
  v22 = a1[3];
  v23 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v22);
  (*(void (**)(uint64_t, uint64_t))(v23 + 40))(v22, v23);
  v25 = v24;
  if (v24)
    swift_bridgeObjectRelease();
  v26 = a1[3];
  v27 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v26);
  v28 = (*(uint64_t (**)(uint64_t, uint64_t))(v27 + 56))(v26, v27);
  sub_20DB8C0C0((uint64_t)a1, (uint64_t)v48);
  v29 = a2;
  if ((v28 & 1) == 0)
  {
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
LABEL_19:
    v33 = 3;
    if ((v21 & 1) == 0)
      goto LABEL_17;
    goto LABEL_20;
  }
  v30 = v49;
  v31 = v50;
  __swift_project_boxed_opaque_existential_1(v48, v49);
  v32 = (*(uint64_t (**)(uint64_t, uint64_t))(v31 + 64))(v30, v31);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v48);
  if ((v32 & 1) == 0)
    goto LABEL_19;
  v33 = 1;
  if ((v21 & 1) == 0)
  {
LABEL_17:
    v34 = 0;
    goto LABEL_21;
  }
LABEL_20:
  v35 = a1[3];
  v36 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v35);
  v34 = sub_20DB89E54(v29, v35, v36);
LABEL_21:
  v37 = a1[3];
  v38 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v37);
  (*(void (**)(uint64_t, uint64_t))(v38 + 16))(v37, v38);
  if (v39)
  {
    v40 = (void *)sub_20DB9F63C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v40 = 0;
  }
  v41 = a1[3];
  v42 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v41);
  (*(void (**)(uint64_t, uint64_t))(v42 + 24))(v41, v42);
  if (v43)
  {
    v44 = (void *)sub_20DB9F63C();
    swift_bridgeObjectRelease();
  }
  else
  {
    v44 = 0;
  }
  v45 = objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithRecordPresence_isValid_recordId_buildVersion_isForCurrentDevice_hasMachineId_recordViability_localSecretViability_tlkRecoveryViability_sosViability_pcsRecoveryViability_, 1, v47 & 1, v40, v44, v21 & 1, v25 != 0, v33, v34, 3, 3, 3);

  __swift_destroy_boxed_opaque_existential_1((uint64_t)a1);
  return v45;
}

void sub_20DB8A91C(uint64_t a1, uint64_t a2)
{
  _QWORD *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  char *isa;
  NSObject *v16;
  NSObject *v17;
  os_log_type_t v18;
  _BOOL4 v19;
  uint64_t v20;
  id v21;
  void *v22;
  uint64_t v23;
  unint64_t v24;
  unint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD *v29;
  os_log_type_t v30;
  uint8_t *v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  uint8_t *v35;
  uint8_t *v36;
  NSObject *v37;
  uint64_t v38;
  NSObject *v39;
  unsigned __int8 v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  BOOL v44;
  uint64_t v45;
  NSObject *v46;
  unsigned __int8 v47;
  uint64_t v48;
  unint64_t v49;
  NSObject *v50;
  char *v51;
  _QWORD *v52;
  NSObject *v53;
  NSObject *v54;
  NSObject *v55;
  NSObject *v56;
  int v57;
  uint64_t v58;
  char *v59;
  NSObject *v60;
  id v61;
  void *v62;
  uint64_t v63;
  unint64_t v64;
  unint64_t v65;
  NSObject *v66;
  char *v67;
  uint64_t v68;
  char *v69;
  unint64_t v70;
  NSObject *v71;
  NSObject *v72;
  int v73;
  uint64_t v74;
  id v75;
  void *v76;
  uint64_t v77;
  unint64_t v78;
  unint64_t v79;
  uint64_t v80;
  char *v81;
  _QWORD *v82;
  char *v83;
  _QWORD *v84;
  NSObject *v85;
  int v86;
  uint64_t v87;
  id v88;
  void *v89;
  uint64_t v90;
  unint64_t v91;
  unint64_t v92;
  uint64_t v93;
  char *v94;
  _QWORD *v95;
  id v96;
  uint8_t *v97;
  int v98;
  NSObject *v99;
  char *v100;
  char *v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  NSObject *v106;
  char *v107;
  _QWORD *v108;
  uint64_t v109;
  NSObject *v110;
  _QWORD v111[5];
  _BYTE v112[40];
  __int128 v113;
  uint64_t v114;
  __int128 v115;
  __int128 v116;
  uint64_t v117;
  char v118;
  char v119;

  v4 = (_QWORD *)sub_20DB9F60C();
  v5 = *(v4 - 1);
  v6 = MEMORY[0x24BDAC7A8](v4);
  v100 = (char *)&v97 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x24BDAC7A8](v6);
  v105 = (char *)&v97 - v9;
  v10 = MEMORY[0x24BDAC7A8](v8);
  v101 = (char *)&v97 - v11;
  MEMORY[0x24BDAC7A8](v10);
  v13 = ((char *)&v97 - v12);
  if (qword_2549DB870 != -1)
    goto LABEL_78;
  while (1)
  {
    v14 = __swift_project_value_buffer((uint64_t)v4, (uint64_t)qword_2549DC270);
    isa = (char *)v5[2].isa;
    v109 = v14;
    v107 = isa;
    ((void (*))isa)(v13);
    v16 = (id)a2;
    v17 = sub_20DB9F5F4();
    v18 = sub_20DB9F6FC();
    v19 = os_log_type_enabled(v17, v18);
    v108 = v4;
    if (v19)
    {
      v106 = v5;
      v20 = swift_slowAlloc();
      v104 = swift_slowAlloc();
      *(_QWORD *)&v115 = v104;
      *(_DWORD *)v20 = 141558275;
      *(_QWORD *)&v113 = 1752392040;
      sub_20DB9F714();
      *(_WORD *)(v20 + 12) = 2081;
      v21 = -[NSObject serialNumber](v16, sel_serialNumber);
      v110 = v16;
      if (!v21)
      {

        __break(1u);
LABEL_80:

        __break(1u);
LABEL_81:

        __break(1u);
LABEL_82:

        __break(1u);
        return;
      }
      v22 = v21;
      v23 = sub_20DB9F648();
      v25 = v24;

      *(_QWORD *)&v113 = sub_20DB919A4(v23, v25, (uint64_t *)&v115);
      sub_20DB9F714();
      v16 = v110;

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20DB2C000, v17, v18, "Beginning account escrow record evaluation to find viable escrow records matching this device's serial number: %{private,mask.hash}s", (uint8_t *)v20, 0x16u);
      v26 = v104;
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v26, -1, -1);
      MEMORY[0x212BB073C](v20, -1, -1);

      v27 = v106[1].isa;
      v28 = v13;
      v29 = v108;
    }
    else
    {

      v27 = v5[1].isa;
      v28 = v13;
      v29 = v4;
    }
    v106 = v27;
    ((void (*)(NSObject *, _QWORD *))v27)(v28, v29);
    swift_bridgeObjectRetain();
    v5 = sub_20DB9F5F4();
    v30 = sub_20DB9F6D8();
    if (os_log_type_enabled(v5, v30))
    {
      v31 = (uint8_t *)swift_slowAlloc();
      *(_DWORD *)v31 = 134217984;
      *(_QWORD *)&v115 = *(_QWORD *)(a1 + 16);
      sub_20DB9F714();
      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20DB2C000, v5, v30, "Starting with %ld records", v31, 0xCu);
      MEMORY[0x212BB073C](v31, -1, -1);

    }
    else
    {

      swift_bridgeObjectRelease();
    }
    v32 = v16;
    swift_bridgeObjectRetain_n();
    v33 = v32;
    v13 = sub_20DB9F5F4();
    v34 = sub_20DB9F6D8();
    if (!os_log_type_enabled(v13, (os_log_type_t)v34))
    {

      swift_bridgeObjectRelease_n();
      goto LABEL_37;
    }
    v110 = v33;
    v35 = (uint8_t *)swift_slowAlloc();
    v36 = v35;
    *(_DWORD *)v35 = 134217984;
    v37 = *(NSObject **)(a1 + 16);
    if (!v37)
      break;
    v97 = v35;
    v98 = v34;
    v99 = v13;
    v13 = sub_20DB8C1A4(0, &qword_2549DB8B8);
    v38 = a1 + 32;
    swift_bridgeObjectRetain();
    a2 = 0;
    while (1)
    {
      sub_20DB8C0C0(v38, (uint64_t)&v115);
      sub_20DB8C0C0((uint64_t)&v115, (uint64_t)&v113);
      v39 = v110;
      swift_bridgeObjectRetain();
      v4 = sub_20DB8A4B4(&v113, v39);
      __swift_destroy_boxed_opaque_existential_1((uint64_t)&v115);
      swift_bridgeObjectRelease();
      v40 = objc_msgSend(v4, sel_isForCurrentDevice);

      if ((v40 & 1) != 0)
        break;
      ++a2;
      v38 += 40;
      if (v37 == a2)
        goto LABEL_21;
    }
    if ((unint64_t)v37 >= a2)
    {
      if (v37 == a2)
      {
LABEL_21:
        swift_bridgeObjectRelease_n();
        v41 = 0;
LABEL_35:
        v13 = v99;
        LOBYTE(v34) = v98;
        v36 = v97;
        goto LABEL_36;
      }
      v42 = 1;
      v43 = v37;
    }
    else
    {
      v42 = -1;
      v43 = a2;
      a2 = (uint64_t)v37;
    }
    v41 = 0;
    v104 = a1 + 72;
    v103 = v42;
    v102 = v43;
    while (1)
    {
      v44 = __OFADD__(v41, v42);
      v41 += v42;
      if (v44)
        break;
      if (a2 == v37)
        goto LABEL_77;
      v5 = v37;
      if ((a2 + 1) != v37)
      {
        v45 = v104 + 40 * a2;
        v5 = (a2 + 1);
        while (a2 >= -1)
        {
          if ((unint64_t)v5 >= *(_QWORD *)(a1 + 16))
            goto LABEL_73;
          sub_20DB8C0C0(v45, (uint64_t)&v115);
          sub_20DB8C0C0((uint64_t)&v115, (uint64_t)&v113);
          v46 = v39;
          swift_bridgeObjectRetain();
          v4 = sub_20DB8A4B4(&v113, v46);
          __swift_destroy_boxed_opaque_existential_1((uint64_t)&v115);
          swift_bridgeObjectRelease();
          v47 = objc_msgSend(v4, sel_isForCurrentDevice);

          if ((v47 & 1) != 0)
            goto LABEL_23;
          v5 = ((char *)v5 + 1);
          v45 += 40;
          if (v37 == v5)
          {
            v5 = v37;
LABEL_23:
            v42 = v103;
            v43 = v102;
            goto LABEL_24;
          }
        }
        __break(1u);
LABEL_73:
        __break(1u);
LABEL_74:
        __break(1u);
LABEL_75:
        __break(1u);
        break;
      }
LABEL_24:
      a2 = (uint64_t)v5;
      if (v5 == v43)
      {
        swift_bridgeObjectRelease_n();
        goto LABEL_35;
      }
    }
    __break(1u);
LABEL_77:
    __break(1u);
LABEL_78:
    swift_once();
  }
  swift_bridgeObjectRelease();
  v41 = 0;
LABEL_36:
  *(_QWORD *)&v115 = v41;
  sub_20DB9F714();
  swift_bridgeObjectRelease();
  _os_log_impl(&dword_20DB2C000, v13, (os_log_type_t)v34, "Found %ld records for current device", v36, 0xCu);
  MEMORY[0x212BB073C](v36, -1, -1);

  v33 = v110;
LABEL_37:
  v4 = *(_QWORD **)(a1 + 16);
  v48 = a1 + 32;
  swift_bridgeObjectRetain();
  v49 = 0;
  a2 = (uint64_t)&qword_2549DB8B8;
  v5 = 0x24BE1A420;
  while (1)
  {
    if ((_QWORD *)v49 == v4)
    {
      v117 = 0;
      v116 = 0u;
      v49 = (unint64_t)v4;
      v115 = 0u;
    }
    else
    {
      if (v49 >= *(_QWORD *)(a1 + 16))
        goto LABEL_74;
      sub_20DB8C0C0(v48 + 40 * v49++, (uint64_t)&v115);
    }
    sub_20DB8C104((uint64_t)&v115, (uint64_t)&v113);
    if (!v114)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v70 = 0;
      a2 = (uint64_t)&qword_2549DB8B8;
      v5 = 0x24BE1A420;
      while (1)
      {
        if ((_QWORD *)v70 == v4)
        {
          v117 = 0;
          v116 = 0u;
          v70 = (unint64_t)v4;
          v115 = 0u;
        }
        else
        {
          if (v70 >= *(_QWORD *)(a1 + 16))
            goto LABEL_75;
          sub_20DB8C0C0(v48 + 40 * v70++, (uint64_t)&v115);
        }
        sub_20DB8C104((uint64_t)&v115, (uint64_t)&v113);
        if (!v114)
        {
          swift_bridgeObjectRelease();
          v83 = v105;
          v84 = v108;
          ((void (*)(char *, uint64_t, _QWORD *))v107)(v105, v109, v108);
          a2 = v33;
          v85 = sub_20DB9F5F4();
          v86 = sub_20DB9F6E4();
          if (os_log_type_enabled(v85, (os_log_type_t)v86))
          {
            LODWORD(v110) = v86;
            v87 = swift_slowAlloc();
            v109 = swift_slowAlloc();
            *(_QWORD *)&v115 = v109;
            *(_DWORD *)v87 = 141558275;
            *(_QWORD *)&v113 = 1752392040;
            sub_20DB9F714();
            *(_WORD *)(v87 + 12) = 2081;
            v88 = objc_msgSend((id)a2, sel_serialNumber);
            if (!v88)
              goto LABEL_80;
            v89 = v88;
            v90 = sub_20DB9F648();
            v92 = v91;

            *(_QWORD *)&v113 = sub_20DB919A4(v90, v92, (uint64_t *)&v115);
            sub_20DB9F714();

            swift_bridgeObjectRelease();
            _os_log_impl(&dword_20DB2C000, v85, (os_log_type_t)v110, "No records found for device with serial number %{private,mask.hash}s", (uint8_t *)v87, 0x16u);
            v93 = v109;
            swift_arrayDestroy();
            MEMORY[0x212BB073C](v93, -1, -1);
            MEMORY[0x212BB073C](v87, -1, -1);

            v94 = v105;
            v95 = v108;
          }
          else
          {

            v94 = v83;
            v95 = v84;
          }
          ((void (*)(char *, _QWORD *))v106)(v94, v95);
          v96 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
          v55 = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE1A420]), sel_initWithDefaultValues);
          objc_msgSend(v96, sel_initWithDeviceStatus_, v55);
          goto LABEL_71;
        }
        sub_20DB8C18C(&v113, (uint64_t)v112);
        v13 = sub_20DB8C1A4(0, &qword_2549DB8B8);
        sub_20DB8C0C0((uint64_t)v112, (uint64_t)v111);
        v71 = v33;
        v55 = sub_20DB8A4B4(v111, v71);
        __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
        if (-[NSObject isForCurrentDevice](v55, sel_isForCurrentDevice))
        {
          if ((-[NSObject recordIsValid](v55, sel_recordIsValid) & 1) != 0)
            break;
        }

      }
      swift_bridgeObjectRelease();
      v51 = v100;
      v52 = v108;
      ((void (*)(char *, uint64_t, _QWORD *))v107)(v100, v109, v108);
      a2 = v71;
      v72 = sub_20DB9F5F4();
      v73 = sub_20DB9F6FC();
      if (!os_log_type_enabled(v72, (os_log_type_t)v73))
      {

        goto LABEL_69;
      }
      LODWORD(v110) = v73;
      v74 = swift_slowAlloc();
      v109 = swift_slowAlloc();
      *(_QWORD *)&v115 = v109;
      *(_DWORD *)v74 = 141558275;
      *(_QWORD *)&v113 = 1752392040;
      v107 = (char *)&v113 + 8;
      sub_20DB9F714();
      *(_WORD *)(v74 + 12) = 2081;
      v75 = objc_msgSend((id)a2, sel_serialNumber);
      if (!v75)
        goto LABEL_82;
      v76 = v75;
      v77 = sub_20DB9F648();
      v79 = v78;

      *(_QWORD *)&v113 = sub_20DB919A4(v77, v79, (uint64_t *)&v115);
      sub_20DB9F714();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20DB2C000, v72, (os_log_type_t)v110, "Records found but none were viable for device with serial number %{private,mask.hash}s", (uint8_t *)v74, 0x16u);
      v80 = v109;
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v80, -1, -1);
      MEMORY[0x212BB073C](v74, -1, -1);

      v69 = &v118;
LABEL_61:
      v81 = (char *)*((_QWORD *)v69 - 32);
      v82 = v108;
      goto LABEL_70;
    }
    sub_20DB8C18C(&v113, (uint64_t)v112);
    sub_20DB8C1A4(0, &qword_2549DB8B8);
    sub_20DB8C0C0((uint64_t)v112, (uint64_t)v111);
    v50 = v33;
    v13 = sub_20DB8A4B4(v111, v50);
    __swift_destroy_boxed_opaque_existential_1((uint64_t)v112);
    if (-[NSObject isForCurrentDevice](v13, sel_isForCurrentDevice))
    {
      if (-[NSObject localViability](v13, sel_localViability) == (id)1)
        break;
    }

  }
  swift_bridgeObjectRelease();
  v51 = v101;
  v52 = v108;
  ((void (*)(char *, uint64_t, _QWORD *))v107)(v101, v109, v108);
  v53 = v50;
  v54 = v13;
  a2 = v53;
  v55 = v54;
  v56 = sub_20DB9F5F4();
  v57 = sub_20DB9F6FC();
  if (os_log_type_enabled(v56, (os_log_type_t)v57))
  {
    LODWORD(v105) = v57;
    v110 = v56;
    v58 = swift_slowAlloc();
    v59 = (char *)swift_slowAlloc();
    v109 = swift_slowAlloc();
    *(_QWORD *)&v115 = v109;
    *(_DWORD *)v58 = 138412803;
    *(_QWORD *)&v113 = v55;
    v60 = v55;
    sub_20DB9F714();
    v107 = v59;
    *(_QWORD *)v59 = v55;

    *(_WORD *)(v58 + 12) = 2160;
    *(_QWORD *)&v113 = 1752392040;
    sub_20DB9F714();
    *(_WORD *)(v58 + 22) = 2081;
    v61 = objc_msgSend((id)a2, sel_serialNumber);
    if (!v61)
      goto LABEL_81;
    v62 = v61;
    v63 = sub_20DB9F648();
    v65 = v64;

    *(_QWORD *)&v113 = sub_20DB919A4(v63, v65, (uint64_t *)&v115);
    sub_20DB9F714();

    swift_bridgeObjectRelease();
    v66 = v110;
    _os_log_impl(&dword_20DB2C000, v110, (os_log_type_t)v105, "Found viable record: %@ for device with serial number %{private,mask.hash}s", (uint8_t *)v58, 0x20u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8C0);
    v67 = v107;
    swift_arrayDestroy();
    MEMORY[0x212BB073C](v67, -1, -1);
    v68 = v109;
    swift_arrayDestroy();
    MEMORY[0x212BB073C](v68, -1, -1);
    MEMORY[0x212BB073C](v58, -1, -1);

    v69 = &v119;
    goto LABEL_61;
  }

LABEL_69:
  v81 = v51;
  v82 = v52;
LABEL_70:
  ((void (*)(char *, _QWORD *))v106)(v81, v82);
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_initWithDeviceStatus_, v55);
LABEL_71:

  swift_bridgeObjectRelease_n();
}

uint64_t sub_20DB8B918(unint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t result;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void **v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  _UNKNOWN **v16;
  uint64_t v17;

  if (a1 >> 62)
  {
    swift_bridgeObjectRetain();
    v2 = sub_20DB9F780();
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
  result = sub_20DB8BEB4(0, v2 & ~(v2 >> 63), 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v3 = v17;
    if ((a1 & 0xC000000000000001) != 0)
    {
      v5 = 0;
      do
      {
        v6 = MEMORY[0x212BAFCEC](v5, a1);
        v17 = v3;
        v8 = *(_QWORD *)(v3 + 16);
        v7 = *(_QWORD *)(v3 + 24);
        if (v8 >= v7 >> 1)
        {
          sub_20DB8BEB4(v7 > 1, v8 + 1, 1);
          v3 = v17;
        }
        ++v5;
        v15 = sub_20DB8C1A4(0, (unint64_t *)&qword_2549DB8A8);
        v16 = &off_24C81DF00;
        *(_QWORD *)&v14 = v6;
        *(_QWORD *)(v3 + 16) = v8 + 1;
        sub_20DB8C18C(&v14, v3 + 40 * v8 + 32);
      }
      while (v2 != v5);
    }
    else
    {
      v9 = (void **)(a1 + 32);
      do
      {
        v10 = *v9;
        v17 = v3;
        v12 = *(_QWORD *)(v3 + 16);
        v11 = *(_QWORD *)(v3 + 24);
        v13 = v10;
        if (v12 >= v11 >> 1)
        {
          sub_20DB8BEB4(v11 > 1, v12 + 1, 1);
          v3 = v17;
        }
        v15 = sub_20DB8C1A4(0, (unint64_t *)&qword_2549DB8A8);
        v16 = &off_24C81DF00;
        *(_QWORD *)&v14 = v13;
        *(_QWORD *)(v3 + 16) = v12 + 1;
        sub_20DB8C18C(&v14, v3 + 40 * v12 + 32);
        ++v9;
        --v2;
      }
      while (v2);
    }
    return v3;
  }
  __break(1u);
  return result;
}

uint64_t sub_20DB8BB08(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  unint64_t v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  sub_20DB8C1A4(0, (unint64_t *)&qword_2549DB8A8);
  v5 = sub_20DB9F690();
  swift_getObjectType();
  v6 = a4;
  v7 = sub_20DB8B918(v5);
  swift_bridgeObjectRelease();
  sub_20DB8A91C(v7, (uint64_t)v6);
  v9 = v8;
  swift_deallocPartialClassInstance();
  return v9;
}

void type metadata accessor for CDPRemoteApprovalEscapeOfferMask(uint64_t a1)
{
  sub_20DB8C238(a1, &qword_2549DB878);
}

void type metadata accessor for CDPContextType(uint64_t a1)
{
  sub_20DB8C238(a1, &qword_2549DB880);
}

_QWORD *sub_20DB8BBE0@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

void sub_20DB8BBEC(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_20DB8BBF4@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 | *result;
  return result;
}

_QWORD *sub_20DB8BC08@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

_QWORD *sub_20DB8BC1C@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 ^ *result;
  return result;
}

BOOL sub_20DB8BC30(_QWORD *a1, uint64_t *a2)
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

_QWORD *sub_20DB8BC60@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
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

uint64_t *sub_20DB8BC8C@<X0>(uint64_t *result@<X0>, uint64_t a2@<X8>)
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

_QWORD *sub_20DB8BCB0(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_20DB8BCC4(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

_QWORD *sub_20DB8BCD8(_QWORD *result)
{
  _QWORD *v1;

  *v1 ^= *result;
  return result;
}

_QWORD *sub_20DB8BCEC@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & ~*result;
  return result;
}

BOOL sub_20DB8BD00(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & ~*a1) == 0;
}

BOOL sub_20DB8BD14(_QWORD *a1)
{
  _QWORD *v1;

  return (*v1 & *a1) == 0;
}

BOOL sub_20DB8BD28(_QWORD *a1)
{
  _QWORD *v1;

  return (*a1 & ~*v1) == 0;
}

BOOL sub_20DB8BD3C()
{
  _QWORD *v0;

  return *v0 == 0;
}

uint64_t sub_20DB8BD4C()
{
  return sub_20DB9F72C();
}

_QWORD *sub_20DB8BD64(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= ~*result;
  return result;
}

BOOL sub_20DB8BD78(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

uint64_t sub_20DB8BD8C@<X0>(uint64_t a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = sub_20DB8C070(a1);
  result = swift_bridgeObjectRelease();
  *a2 = v3;
  return result;
}

_QWORD *sub_20DB8BDC8@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_20DB8BDD8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_20DB8BDE4()
{
  return sub_20DB8BE2C(&qword_2549DB888, (uint64_t)&unk_20DBA4440);
}

uint64_t sub_20DB8BE08()
{
  return sub_20DB8BE2C(&qword_2549DB890, (uint64_t)&unk_20DBA4410);
}

uint64_t sub_20DB8BE2C(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for CDPRemoteApprovalEscapeOfferMask(255);
    result = MEMORY[0x212BB06E8](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_20DB8BE6C()
{
  return sub_20DB8BE2C(&qword_2549DB898, (uint64_t)&unk_20DBA4468);
}

uint64_t sub_20DB8BE90()
{
  return sub_20DB8BE2C(&qword_2549DB8A0, (uint64_t)&unk_20DBA44A0);
}

uint64_t sub_20DB8BEB4(char a1, int64_t a2, char a3)
{
  uint64_t *v3;
  uint64_t result;

  result = sub_20DB8BED0(a1, a2, a3, (_QWORD *)*v3);
  *v3 = result;
  return result;
}

uint64_t sub_20DB8BED0(char a1, int64_t a2, char a3, _QWORD *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8C8);
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8D0);
    swift_arrayInitWithCopy();
LABEL_28:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_20DB9F798();
  __break(1u);
  return result;
}

uint64_t sub_20DB8C070(uint64_t a1)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;

  v1 = *(_QWORD *)(a1 + 16);
  if (!v1)
    return 0;
  result = 0;
  v4 = (uint64_t *)(a1 + 32);
  do
  {
    v6 = *v4++;
    v5 = v6;
    if ((v6 & ~result) == 0)
      v5 = 0;
    result |= v5;
    --v1;
  }
  while (v1);
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_20DB8C0C0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_20DB8C104(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8B0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BB06D0]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_20DB8C18C(__int128 *a1, uint64_t a2)
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

uint64_t sub_20DB8C1A4(uint64_t a1, unint64_t *a2)
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

uint64_t __swift_destroy_boxed_opaque_existential_1(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

void type metadata accessor for CDPStateError(uint64_t a1)
{
  sub_20DB8C238(a1, &qword_2549DB8D8);
}

void sub_20DB8C238(uint64_t a1, unint64_t *a2)
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

uint64_t CDPRemoteApprovalEscapeOfferMask.description.getter(char a1)
{
  _QWORD *v2;
  unint64_t v3;
  unint64_t v4;
  _QWORD *v5;
  unint64_t v6;
  unint64_t v7;
  char *v8;
  unint64_t v9;
  unint64_t v10;
  char *v11;
  unint64_t v12;
  unint64_t v13;
  char *v14;
  unint64_t v15;
  unint64_t v16;
  _QWORD *v17;
  unint64_t v18;
  unint64_t v19;
  _QWORD *v20;
  unint64_t v21;
  unint64_t v22;
  _QWORD *v23;
  unint64_t v24;
  unint64_t v25;
  char *v26;
  uint64_t v27;

  if ((a1 & 1) == 0)
  {
    v2 = (_QWORD *)MEMORY[0x24BEE4AF8];
    if ((a1 & 2) == 0)
      goto LABEL_12;
    goto LABEL_7;
  }
  v2 = sub_20DB8C7E4(0, 1, 1, MEMORY[0x24BEE4AF8]);
  v4 = v2[2];
  v3 = v2[3];
  if (v4 >= v3 >> 1)
    v2 = sub_20DB8C7E4((_QWORD *)(v3 > 1), v4 + 1, 1, v2);
  v2[2] = v4 + 1;
  v5 = &v2[2 * v4];
  v5[4] = 1701736302;
  v5[5] = 0xE400000000000000;
  if ((a1 & 2) != 0)
  {
LABEL_7:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_20DB8C7E4(0, v2[2] + 1, 1, v2);
    v7 = v2[2];
    v6 = v2[3];
    if (v7 >= v6 >> 1)
      v2 = sub_20DB8C7E4((_QWORD *)(v6 > 1), v7 + 1, 1, v2);
    v2[2] = v7 + 1;
    v8 = (char *)&v2[2 * v7];
    strcpy(v8 + 32, "otherDevices");
    v8[45] = 0;
    *((_WORD *)v8 + 23) = -5120;
  }
LABEL_12:
  if ((a1 & 4) != 0)
  {
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_20DB8C7E4(0, v2[2] + 1, 1, v2);
    v10 = v2[2];
    v9 = v2[3];
    if (v10 >= v9 >> 1)
      v2 = sub_20DB8C7E4((_QWORD *)(v9 > 1), v10 + 1, 1, v2);
    v2[2] = v10 + 1;
    v11 = (char *)&v2[2 * v10];
    strcpy(v11 + 32, "remoteApproval");
    v11[47] = -18;
    if ((a1 & 8) == 0)
    {
LABEL_14:
      if ((a1 & 0x10) == 0)
        goto LABEL_15;
      goto LABEL_29;
    }
  }
  else if ((a1 & 8) == 0)
  {
    goto LABEL_14;
  }
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20DB8C7E4(0, v2[2] + 1, 1, v2);
  v13 = v2[2];
  v12 = v2[3];
  if (v13 >= v12 >> 1)
    v2 = sub_20DB8C7E4((_QWORD *)(v12 > 1), v13 + 1, 1, v2);
  v2[2] = v13 + 1;
  v14 = (char *)&v2[2 * v13];
  strcpy(v14 + 32, "accountReset");
  v14[45] = 0;
  *((_WORD *)v14 + 23) = -5120;
  if ((a1 & 0x10) == 0)
  {
LABEL_15:
    if ((a1 & 0x20) == 0)
      goto LABEL_16;
    goto LABEL_34;
  }
LABEL_29:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20DB8C7E4(0, v2[2] + 1, 1, v2);
  v16 = v2[2];
  v15 = v2[3];
  if (v16 >= v15 >> 1)
    v2 = sub_20DB8C7E4((_QWORD *)(v15 > 1), v16 + 1, 1, v2);
  v2[2] = v16 + 1;
  v17 = &v2[2 * v16];
  v17[4] = 1885956979;
  v17[5] = 0xE400000000000000;
  if ((a1 & 0x20) == 0)
  {
LABEL_16:
    if ((a1 & 0x40) == 0)
      goto LABEL_17;
    goto LABEL_39;
  }
LABEL_34:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20DB8C7E4(0, v2[2] + 1, 1, v2);
  v19 = v2[2];
  v18 = v2[3];
  if (v19 >= v18 >> 1)
    v2 = sub_20DB8C7E4((_QWORD *)(v18 > 1), v19 + 1, 1, v2);
  v2[2] = v19 + 1;
  v20 = &v2[2 * v19];
  v20[4] = 0x797265766F636572;
  v20[5] = 0xEB0000000079654BLL;
  if ((a1 & 0x40) == 0)
  {
LABEL_17:
    if ((a1 & 0x80) == 0)
      goto LABEL_49;
    goto LABEL_44;
  }
LABEL_39:
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20DB8C7E4(0, v2[2] + 1, 1, v2);
  v22 = v2[2];
  v21 = v2[3];
  if (v22 >= v21 >> 1)
    v2 = sub_20DB8C7E4((_QWORD *)(v21 > 1), v22 + 1, 1, v2);
  v2[2] = v22 + 1;
  v23 = &v2[2 * v22];
  v23[4] = 0xD000000000000011;
  v23[5] = 0x800000020DBBAFA0;
  if (a1 < 0)
  {
LABEL_44:
    if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
      v2 = sub_20DB8C7E4(0, v2[2] + 1, 1, v2);
    v25 = v2[2];
    v24 = v2[3];
    if (v25 >= v24 >> 1)
      v2 = sub_20DB8C7E4((_QWORD *)(v24 > 1), v25 + 1, 1, v2);
    v2[2] = v25 + 1;
    v26 = (char *)&v2[2 * v25];
    strcpy(v26 + 32, "piggybacking");
    v26[45] = 0;
    *((_WORD *)v26 + 23) = -5120;
  }
LABEL_49:
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB940);
  sub_20DB8C754();
  v27 = sub_20DB9F630();
  swift_bridgeObjectRelease();
  return v27;
}

__C::CDPRemoteApprovalEscapeOfferMask __swiftcall CDPRemoteApprovalEscapeOfferMask.removing(_:)(__C::CDPRemoteApprovalEscapeOfferMask a1)
{
  uint64_t v1;
  Swift::UInt v2;

  v2 = -1;
  if ((v1 & a1.rawValue) != 0)
    v2 = ~a1.rawValue;
  return (__C::CDPRemoteApprovalEscapeOfferMask)(v2 & v1);
}

uint64_t sub_20DB8C74C()
{
  _QWORD *v0;

  return CDPRemoteApprovalEscapeOfferMask.description.getter(*v0);
}

unint64_t sub_20DB8C754()
{
  unint64_t result;
  uint64_t v1;

  result = qword_2549DB948;
  if (!qword_2549DB948)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_2549DB940);
    result = MEMORY[0x212BB06E8](MEMORY[0x24BEE12B0], v1);
    atomic_store(result, (unint64_t *)&qword_2549DB948);
  }
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x212BB06DC](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

_QWORD *sub_20DB8C7E4(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
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
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB950);
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
    sub_20DB8C8F0(0, v8, (unint64_t)v13, (uint64_t)a4);
LABEL_24:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_20DB8C8F0(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
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
  result = sub_20DB9F798();
  __break(1u);
  return result;
}

uint64_t sub_20DB8C9E0()
{
  uint64_t v0;

  v0 = sub_20DB9F60C();
  __swift_allocate_value_buffer(v0, qword_2549DC270);
  __swift_project_value_buffer(v0, (uint64_t)qword_2549DC270);
  return sub_20DB9F600();
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

uint64_t sub_20DB8CB20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

uint64_t sub_20DB8CB38()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v14;

  v1 = objc_msgSend(*(id *)(*(_QWORD *)(v0 + 24) + OBJC_IVAR___CDPDRPDExecutor_ledger), sel_rpdBlockingError);
  if (v1)
  {
    v2 = v1;
    if (qword_2549DB870 != -1)
      swift_once();
    v3 = sub_20DB9F60C();
    __swift_project_value_buffer(v3, (uint64_t)qword_2549DC270);
    v4 = v2;
    v5 = sub_20DB9F5F4();
    v6 = sub_20DB9F6F0();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      v14 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v7 = 138412290;
      v8 = v4;
      v9 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)(v0 + 16) = v9;
      sub_20DB9F714();
      *v14 = v9;

      _os_log_impl(&dword_20DB2C000, v5, v6, "CDPDRPDExecutor: Performing RPD failed with error: %@", v7, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8C0);
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v14, -1, -1);
      MEMORY[0x212BB073C](v7, -1, -1);
    }
    else
    {

    }
    swift_willThrow();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v10 = *(_QWORD *)(v0 + 24);
    sub_20DB9F5C4();
    v11 = swift_task_alloc();
    *(_QWORD *)(v0 + 32) = v11;
    *(_QWORD *)(v11 + 16) = v10;
    v12 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v12;
    *v12 = v0;
    v12[1] = sub_20DB8CD98;
    return sub_20DB9F5AC();
  }
}

uint64_t sub_20DB8CD98()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(v2 + 48) = v0;
  swift_task_dealloc();
  if (v0)
    return swift_task_switch();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20DB8CE0C()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8CE40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 184) = a1;
  *(_QWORD *)(v2 + 192) = a2;
  return swift_task_switch();
}

uint64_t sub_20DB8CE58()
{
  _QWORD *v0;
  void *v1;
  uint64_t v2;
  _QWORD *v3;

  v1 = *(void **)(v0[24] + OBJC_IVAR___CDPDRPDExecutor_sbDeleter);
  v0[15] = v0 + 29;
  v0[10] = v0;
  v0[11] = sub_20DB8CEF8;
  v2 = swift_continuation_init();
  v0[18] = MEMORY[0x24BDAC760];
  v3 = v0 + 18;
  v3[1] = 0x40000000;
  v3[2] = sub_20DB8D6B0;
  v3[3] = &block_descriptor;
  v3[4] = v2;
  objc_msgSend(v1, sel_deleteAllBackupRecordsWithCompletion_, v3);
  return swift_continuation_await();
}

uint64_t sub_20DB8CEF8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 200) = *(_QWORD *)(*(_QWORD *)v0 + 112);
  return swift_task_switch();
}

uint64_t sub_20DB8CF58()
{
  _QWORD *v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  if (qword_2549DB870 != -1)
    swift_once();
  v1 = sub_20DB9F60C();
  v0[26] = __swift_project_value_buffer(v1, (uint64_t)qword_2549DC270);
  v2 = sub_20DB9F5F4();
  v3 = sub_20DB9F6D8();
  if (os_log_type_enabled(v2, v3))
  {
    v4 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_20DB2C000, v2, v3, "CDPRPDExecutor: Secure backup deleted. Proceeding with resetting the circle", v4, 2u);
    MEMORY[0x212BB073C](v4, -1, -1);
  }
  v5 = v0[24];

  v6 = *(void **)(v5 + OBJC_IVAR___CDPDRPDExecutor_resetter);
  v7 = sub_20DB9F63C();
  v0[27] = v7;
  v0[7] = v0 + 29;
  v0[2] = v0;
  v0[3] = sub_20DB8D0DC;
  v8 = swift_continuation_init();
  v0[18] = MEMORY[0x24BDAC760];
  v9 = v0 + 18;
  v9[1] = 0x40000000;
  v9[2] = sub_20DB8D6B0;
  v9[3] = &block_descriptor_14;
  v9[4] = v8;
  objc_msgSend(v6, sel_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion_, 1, v7, v9);
  return swift_continuation_await();
}

uint64_t sub_20DB8D0DC()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 224) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20DB8D13C()
{
  uint64_t v0;
  NSObject *v1;
  os_log_type_t v2;
  uint8_t *v3;

  v1 = sub_20DB9F5F4();
  v2 = sub_20DB9F6D8();
  if (os_log_type_enabled(v1, v2))
  {
    v3 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_20DB2C000, v1, v2, "CDPDRPDExecutor: Circle reset completed.", v3, 2u);
    MEMORY[0x212BB073C](v3, -1, -1);
  }

  MEMORY[0x212BAFB54]();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8D1EC()
{
  _QWORD *v0;
  uint32_t *p_cb;
  void *v2;
  uint64_t v3;
  id v4;
  id v5;
  NSObject *v6;
  os_log_type_t v7;
  BOOL v8;
  void *v9;
  uint8_t *v10;
  _QWORD *v11;
  id v12;
  uint64_t v13;
  uint8_t *v14;
  NSObject *v15;
  os_log_type_t v16;
  uint8_t *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  swift_willThrow();
  p_cb = &OBJC_PROTOCOL___CDPDAuthProviderInternal.cb;
  if (qword_2549DB870 != -1)
    swift_once();
  v2 = (void *)v0[25];
  v3 = sub_20DB9F60C();
  __swift_project_value_buffer(v3, (uint64_t)qword_2549DC270);
  v4 = v2;
  v5 = v2;
  v6 = sub_20DB9F5F4();
  v7 = sub_20DB9F6E4();
  v8 = os_log_type_enabled(v6, v7);
  v9 = (void *)v0[25];
  if (v8)
  {
    v10 = (uint8_t *)swift_slowAlloc();
    v11 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v10 = 138412290;
    v12 = v9;
    v13 = _swift_stdlib_bridgeErrorToNSError();
    v0[18] = v13;
    sub_20DB9F714();
    *v11 = v13;

    _os_log_impl(&dword_20DB2C000, v6, v7, "CDPDRPDExecutor: Failed to delete secure backup with error: %@", v10, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8C0);
    swift_arrayDestroy();
    MEMORY[0x212BB073C](v11, -1, -1);
    v14 = v10;
    p_cb = (_DWORD *)(&OBJC_PROTOCOL___CDPDAuthProviderInternal + 64);
    MEMORY[0x212BB073C](v14, -1, -1);

  }
  else
  {

  }
  if (*((_QWORD *)p_cb + 270) != -1)
    swift_once();
  v0[26] = __swift_project_value_buffer(v3, (uint64_t)qword_2549DC270);
  v15 = sub_20DB9F5F4();
  v16 = sub_20DB9F6D8();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl(&dword_20DB2C000, v15, v16, "CDPRPDExecutor: Secure backup deleted. Proceeding with resetting the circle", v17, 2u);
    MEMORY[0x212BB073C](v17, -1, -1);
  }
  v18 = v0[24];

  v19 = *(void **)(v18 + OBJC_IVAR___CDPDRPDExecutor_resetter);
  v20 = sub_20DB9F63C();
  v0[27] = v20;
  v0[7] = v0 + 29;
  v0[2] = v0;
  v0[3] = sub_20DB8D0DC;
  v0[22] = swift_continuation_init();
  v0[18] = MEMORY[0x24BDAC760];
  v0[19] = 0x40000000;
  v0[20] = sub_20DB8D6B0;
  v0[21] = &block_descriptor_14;
  objc_msgSend(v19, sel_resetCircleIncludingCloudKitData_cloudKitResetReasonDescription_withCompletion_, 1, v20, v0 + 18);
  return swift_continuation_await();
}

uint64_t sub_20DB8D518()
{
  uint64_t v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  NSObject *v5;
  os_log_type_t v6;
  void *v7;
  uint8_t *v8;
  _QWORD *v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v2 = *(void **)(v0 + 216);
  v1 = *(void **)(v0 + 224);
  swift_willThrow();

  v3 = v1;
  v4 = v1;
  v5 = sub_20DB9F5F4();
  v6 = sub_20DB9F6E4();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = *(void **)(v0 + 224);
    v8 = (uint8_t *)swift_slowAlloc();
    v9 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v8 = 138412290;
    v10 = v7;
    v11 = _swift_stdlib_bridgeErrorToNSError();
    *(_QWORD *)(v0 + 144) = v11;
    sub_20DB9F714();
    *v9 = v11;

    _os_log_impl(&dword_20DB2C000, v5, v6, "CDPDRPDExecutor: Failed to reset circle with error: %@", v8, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8C0);
    swift_arrayDestroy();
    MEMORY[0x212BB073C](v9, -1, -1);
    MEMORY[0x212BB073C](v8, -1, -1);
  }
  else
  {
    v12 = *(void **)(v0 + 224);

  }
  v13 = swift_willThrow();
  MEMORY[0x212BAFB54](v13);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8D6B0(uint64_t a1, char a2, void *a3)
{
  _QWORD *v4;
  id v5;

  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549DB9E0);
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

uint64_t sub_20DB8D84C(const void *a1, void *a2)
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
  v5[1] = sub_20DB8D8C4;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_20DB8D8C4()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 24);
  if (v0)
  {
    v5 = (void *)sub_20DB9F594();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

void __swiftcall CDPDRPDExecutor.init()(CDPDRPDExecutor *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CDPDRPDExecutor.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for CDPDRPDExecutor()
{
  unint64_t result;

  result = qword_2549DB998;
  if (!qword_2549DB998)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549DB998);
  }
  return result;
}

uint64_t sub_20DB8DA64()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));

  return swift_deallocObject();
}

uint64_t sub_20DB8DA90()
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
  v4[1] = sub_20DB8DCD0;
  return ((uint64_t (*)(const void *, void *))((char *)&dword_2549DB9A8 + dword_2549DB9A8))(v2, v3);
}

uint64_t sub_20DB8DAF8()
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
  v5[1] = sub_20DB8DCD0;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_2549DBA70 + dword_2549DBA70))(v2, v3, v4);
}

uint64_t objectdestroy_3Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20DB8DBA0(uint64_t a1)
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
  v7[1] = sub_20DB8DC24;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2549DBA80 + dword_2549DBA80))(a1, v4, v5, v6);
}

uint64_t sub_20DB8DC24()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20DB8DC6C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB8DC24;
  v5[23] = a1;
  v5[24] = v4;
  return swift_task_switch();
}

uint64_t CDPExponentialRetryScheduler.retryFetchEscrowRecord(_:cdpContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549DB9F8 + dword_2549DB9F8);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB90288;
  return v7(a1, a2);
}

uint64_t sub_20DB8DD40(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_20DB8DDA4()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  id v9;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 16) = 0;
  v3 = objc_msgSend(v2, sel_fetchEscrowRecords_error_, v1, v0 + 16);
  v4 = *(void **)(v0 + 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(uint64_t **)(v0 + 24);
    sub_20DB8FE94();
    v7 = sub_20DB9F690();
    v8 = v4;

    *v6 = v7;
  }
  else
  {
    v9 = v4;
    sub_20DB9F5A0();

    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_20DB8DEB4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  uint64_t v12;

  v2 = *(_QWORD *)(a1 - 8);
  MEMORY[0x24BDAC7A8](a1);
  v4 = (char *)&v12 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v5, a1);
  v6 = sub_20DB9F7A4();
  if (v6)
  {
    v7 = (void *)v6;
    (*(void (**)(char *, uint64_t))(v2 + 8))(v4, a1);
  }
  else
  {
    v7 = (void *)swift_allocError();
    (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v8, v4, a1);
  }
  v9 = (void *)sub_20DB9F594();

  v10 = objc_msgSend(v9, sel_isRecoverableError);
  return v10;
}

void sub_20DB8DFB4(uint64_t a1, uint64_t a2, void *a3)
{
  void (*v5)(uint64_t, void *);
  id v6;

  v5 = *(void (**)(uint64_t, void *))(a1 + 32);
  swift_retain();
  v6 = a3;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_20DB8E14C(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t (*v13)(id, id);

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v13 = (uint64_t (*)(id, id))((char *)&dword_2549DB9F8 + dword_2549DB9F8);
  v8 = a1;
  v9 = a2;
  v10 = a4;
  v11 = (_QWORD *)swift_task_alloc();
  v4[6] = v11;
  *v11 = v4;
  v11[1] = sub_20DB8E1F0;
  return v13(v8, v9);
}

uint64_t sub_20DB8E1F0()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 24);
  v4 = *(void **)(*v1 + 32);
  v6 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v8 = sub_20DB9F594();

    v9 = 0;
    v10 = (void *)v8;
  }
  else
  {
    sub_20DB8FE94();
    v9 = sub_20DB9F684();
    swift_bridgeObjectRelease();
    v8 = 0;
    v10 = (void *)v9;
  }
  v11 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 40);
  v11[2](v11, v9, v8);

  _Block_release(v11);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t CDPExponentialRetryScheduler.retryFetchAllEscrowRecord(_:cdpContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549DBA08 + dword_2549DBA08);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB90288;
  return v7(a1, a2);
}

uint64_t sub_20DB8E33C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_20DB8E3A0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;
  uint64_t *v6;
  uint64_t v7;
  id v8;
  id v9;

  v1 = *(_QWORD *)(v0 + 32);
  v2 = (void *)objc_opt_self();
  *(_QWORD *)(v0 + 16) = 0;
  v3 = objc_msgSend(v2, sel_fetchAllEscrowRecords_error_, v1, v0 + 16);
  v4 = *(void **)(v0 + 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(uint64_t **)(v0 + 24);
    sub_20DB8FE94();
    v7 = sub_20DB9F690();
    v8 = v4;

    *v6 = v7;
  }
  else
  {
    v9 = v4;
    sub_20DB9F5A0();

    swift_willThrow();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8E4B0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;
  void *v8;
  uint64_t v9;
  _QWORD v11[8];

  v7 = swift_allocObject();
  swift_getErrorValue();
  *(_BYTE *)(v7 + 16) = sub_20DB8DEB4(v11[7]) & 1;
  v11[4] = a3;
  v11[5] = v7;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 1107296256;
  v11[2] = sub_20DB8DFB4;
  v11[3] = a4;
  v8 = _Block_copy(v11);
  swift_retain();
  swift_release();
  objc_msgSend(a2, sel_reauthenticateUserWithCompletion_, v8);
  _Block_release(v8);
  swift_beginAccess();
  v9 = *(unsigned __int8 *)(v7 + 16);
  swift_release();
  return v9;
}

uint64_t sub_20DB8E6F0(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t (*v13)(id, id);

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v13 = (uint64_t (*)(id, id))((char *)&dword_2549DBA08 + dword_2549DBA08);
  v8 = a1;
  v9 = a2;
  v10 = a4;
  v11 = (_QWORD *)swift_task_alloc();
  v4[6] = v11;
  *v11 = v4;
  v11[1] = sub_20DB90274;
  return v13(v8, v9);
}

uint64_t CDPExponentialRetryScheduler.retryFetchAccountInfo(_:cdpContext:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_2549DBA18 + dword_2549DBA18);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB90288;
  return v7(a1, a2);
}

uint64_t sub_20DB8E800(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = a2;
  return swift_task_switch();
}

uint64_t sub_20DB8E818()
{
  uint64_t v0;
  uint64_t *v1;
  id v2;
  uint64_t v3;

  v1 = *(uint64_t **)(v0 + 16);
  v2 = objc_msgSend(*(id *)(v0 + 24), sel_getAccountInfoWithError_, 0);
  v3 = sub_20DB9F624();

  *v1 = v3;
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8E9D0(void *a1, void *a2, void *aBlock, void *a4)
{
  _QWORD *v4;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  uint64_t (*v13)(id, id);

  v4[3] = a2;
  v4[4] = a4;
  v4[2] = a1;
  v4[5] = _Block_copy(aBlock);
  v13 = (uint64_t (*)(id, id))((char *)&dword_2549DBA18 + dword_2549DBA18);
  v8 = a1;
  v9 = a2;
  v10 = a4;
  v11 = (_QWORD *)swift_task_alloc();
  v4[6] = v11;
  *v11 = v4;
  v11[1] = sub_20DB8EA74;
  return v13(v8, v9);
}

uint64_t sub_20DB8EA74()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);

  v2 = v0;
  v3 = *v1;
  v5 = *(void **)(*v1 + 24);
  v4 = *(void **)(*v1 + 32);
  v6 = *(void **)(*v1 + 16);
  v7 = *v1;
  swift_task_dealloc();

  if (v0)
  {
    v8 = sub_20DB9F594();

    v9 = 0;
    v10 = (void *)v8;
  }
  else
  {
    v9 = sub_20DB9F618();
    swift_bridgeObjectRelease();
    v8 = 0;
    v10 = (void *)v9;
  }
  v11 = *(void (***)(_QWORD, _QWORD, _QWORD))(v3 + 40);
  v11[2](v11, v9, v8);

  _Block_release(v11);
  return (*(uint64_t (**)(void))(v7 + 8))();
}

uint64_t CDPExponentialRetryScheduler.retrySilentAuth(authContext:)(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_2549DBA28 + dword_2549DBA28);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_20DB8EBC4;
  return v5(a1);
}

uint64_t sub_20DB8EBC4(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_20DB8EC18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 128) = a1;
  *(_QWORD *)(v2 + 136) = a2;
  return swift_task_switch();
}

id sub_20DB8EC30()
{
  _QWORD *v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;

  result = objc_msgSend(objc_allocWithZone(MEMORY[0x24BE0ACC0]), sel_init);
  v0[18] = result;
  if (result)
  {
    v2 = result;
    v3 = v0[17];
    v0[7] = v0 + 15;
    v0[2] = v0;
    v0[3] = sub_20DB8ECF8;
    v4 = swift_continuation_init();
    v0[10] = MEMORY[0x24BDAC760];
    v5 = v0 + 10;
    v5[1] = 0x40000000;
    v5[2] = sub_20DB8EDD4;
    v5[3] = &block_descriptor_0;
    v5[4] = v4;
    objc_msgSend(v2, sel_authenticateWithContext_completion_, v3, v5);
    return (id)swift_continuation_await();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_20DB8ECF8()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 152) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_20DB8ED58()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 144);
  **(_QWORD **)(v0 + 128) = *(_QWORD *)(v0 + 120);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8ED94()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 144);
  swift_willThrow();

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8EDD4(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  uint64_t v8;
  uint64_t v9;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549DB9E0);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    if (a2)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBB60);
      v8 = sub_20DB9F624();
    }
    else
    {
      v8 = 0;
    }
    v9 = v8;
    sub_20DB8FFF4((uint64_t)&v9, *(_QWORD *)(*(_QWORD *)(v3 + 64) + 40));
    return swift_continuation_throwingResume();
  }
}

unint64_t sub_20DB8EEA4()
{
  uint64_t v1;

  swift_getErrorValue();
  return (unint64_t)sub_20DB8DEB4(v1) & 1;
}

uint64_t sub_20DB8F010(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v10 = (uint64_t (*)(uint64_t))((char *)&dword_2549DBA28 + dword_2549DBA28);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_20DB8F09C;
  return v10((uint64_t)v6);
}

uint64_t sub_20DB8F09C(uint64_t a1)
{
  void *v1;
  uint64_t *v2;
  void *v3;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void (**v11)(_QWORD, _QWORD, _QWORD);

  v3 = v1;
  v5 = *v2;
  v7 = *(void **)(*v2 + 16);
  v6 = *(void **)(*v2 + 24);
  v8 = *v2;
  swift_task_dealloc();

  if (v3)
  {
    a1 = sub_20DB9F594();

    v9 = 0;
    v10 = (void *)a1;
  }
  else if (a1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBB60);
    v9 = sub_20DB9F618();
    swift_bridgeObjectRelease();
    a1 = 0;
    v10 = (void *)v9;
  }
  else
  {
    v9 = 0;
    v10 = 0;
  }
  v11 = *(void (***)(_QWORD, _QWORD, _QWORD))(v5 + 32);
  v11[2](v11, v9, a1);

  _Block_release(v11);
  return (*(uint64_t (**)(void))(v8 + 8))();
}

id CDPExponentialRetryScheduler.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id CDPExponentialRetryScheduler.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDPExponentialRetryScheduler();
  return objc_msgSendSuper2(&v2, sel_init);
}

id CDPExponentialRetryScheduler.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for CDPExponentialRetryScheduler();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_20DB8F254(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_20DB8DCD0;
  return v6();
}

uint64_t sub_20DB8F2A8(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_20DB8DCD0;
  return v7();
}

uint64_t sub_20DB8F2FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_20DB9F6C0();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_20DB9F6B4();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_20DB8FCB8(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_20DB9F6A8();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_20DB8F440(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_20DB8F4A4;
  return v6(a1);
}

uint64_t sub_20DB8F4A4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_20DB8F4F0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_20DB8F508()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v1 = v0[4];
  v2 = (void *)v0[5];
  sub_20DB9F5E8();
  v3 = sub_20DB9F5DC();
  v0[6] = v3;
  v0[3] = v3;
  v4 = swift_task_alloc();
  v0[7] = v4;
  *(_QWORD *)(v4 + 16) = v1;
  v5 = swift_allocObject();
  v0[8] = v5;
  *(_QWORD *)(v5 + 16) = v2;
  v6 = v2;
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBC18);
  *v7 = v0;
  v7[1] = sub_20DB8F60C;
  return sub_20DB9F5D0();
}

uint64_t sub_20DB8F60C()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_20DB8F680(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_20DB8F698()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v1 = v0[4];
  v2 = (void *)v0[5];
  sub_20DB9F5E8();
  v3 = sub_20DB9F5DC();
  v0[6] = v3;
  v0[3] = v3;
  v4 = swift_task_alloc();
  v0[7] = v4;
  *(_QWORD *)(v4 + 16) = v1;
  v5 = swift_allocObject();
  v0[8] = v5;
  *(_QWORD *)(v5 + 16) = v2;
  v6 = v2;
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBC18);
  *v7 = v0;
  v7[1] = sub_20DB8F60C;
  return sub_20DB9F5D0();
}

uint64_t sub_20DB8F79C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 32) = a1;
  *(_QWORD *)(v2 + 40) = a2;
  return swift_task_switch();
}

uint64_t sub_20DB8F7B4()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD *v7;

  v1 = v0[4];
  v2 = (void *)v0[5];
  sub_20DB9F5E8();
  v3 = sub_20DB9F5DC();
  v0[6] = v3;
  v0[3] = v3;
  v4 = swift_task_alloc();
  v0[7] = v4;
  *(_QWORD *)(v4 + 16) = v1;
  v5 = swift_allocObject();
  v0[8] = v5;
  *(_QWORD *)(v5 + 16) = v2;
  v6 = v2;
  v7 = (_QWORD *)swift_task_alloc();
  v0[9] = v7;
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBC00);
  *v7 = v0;
  v7[1] = sub_20DB8F8B8;
  return sub_20DB9F5D0();
}

uint64_t sub_20DB8F8B8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 80) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    swift_release();
    swift_task_dealloc();
  }
  return swift_task_switch();
}

uint64_t sub_20DB8F92C()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_20DB8F960()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 48);
  swift_release();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_20DB8F9A4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 32) = a1;
  return swift_task_switch();
}

uint64_t sub_20DB8F9BC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[4];
  sub_20DB9F5E8();
  v2 = sub_20DB9F5DC();
  v0[5] = v2;
  v0[3] = v2;
  v3 = swift_task_alloc();
  v0[6] = v3;
  *(_QWORD *)(v3 + 16) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[7] = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549DBBE0);
  *v4 = v0;
  v4[1] = sub_20DB8FA90;
  return sub_20DB9F5D0();
}

uint64_t sub_20DB8FA90()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 64) = v0;
  swift_task_dealloc();
  if (!v0)
    swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_20DB8FAFC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

uint64_t sub_20DB8FB30()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for CDPExponentialRetryScheduler()
{
  return objc_opt_self();
}

uint64_t sub_20DB8FB8C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_20DB8FBC0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_20DB8DC24;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_2549DBA60 + dword_2549DBA60))(v2, v3, v4);
}

uint64_t sub_20DB8FC34(uint64_t a1)
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
  v7[1] = sub_20DB8DCD0;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_2549DBA80 + dword_2549DBA80))(a1, v4, v5, v6);
}

uint64_t sub_20DB8FCB8(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB9A0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_20DB8FCF8()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_20DB8FD1C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB8DCD0;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_2549DBA90 + dword_2549DBA90))(a1, v4);
}

uint64_t sub_20DB8FD90()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_20DB8DCD0;
  return ((uint64_t (*)(void *, void *, void *, void *))((char *)&dword_2549DBB68 + dword_2549DBB68))(v2, v3, v5, v4);
}

uint64_t sub_20DB8FE14()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_20DB8DCD0;
  return ((uint64_t (*)(void *, void *, void *, void *))((char *)&dword_2549DBB88 + dword_2549DBB88))(v2, v3, v5, v4);
}

unint64_t sub_20DB8FE94()
{
  unint64_t result;

  result = qword_2549DB8A8;
  if (!qword_2549DB8A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549DB8A8);
  }
  return result;
}

uint64_t objectdestroy_27Tm()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_20DB8FF10()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v5 = (void *)v0[4];
  v4 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_20DB8DCD0;
  return ((uint64_t (*)(void *, void *, void *, void *))((char *)&dword_2549DBBB0 + dword_2549DBBB0))(v2, v3, v5, v4);
}

uint64_t sub_20DB8FF90(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB8DC24;
  v5[16] = a1;
  v5[17] = v4;
  return swift_task_switch();
}

uint64_t sub_20DB8FFF4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549DBBE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_20DB9003C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB8DCD0;
  v5[2] = a1;
  v5[3] = v4;
  return swift_task_switch();
}

uint64_t sub_20DB900A0()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_20DB900C4(uint64_t a1)
{
  uint64_t v1;

  return sub_20DB8E4B0(a1, *(void **)(v1 + 16), (uint64_t)sub_20DB90100, (uint64_t)&block_descriptor_84) & 1;
}

uint64_t sub_20DB900F0()
{
  return swift_deallocObject();
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

uint64_t sub_20DB9011C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB8DCD0;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

uint64_t sub_20DB90180(uint64_t a1)
{
  uint64_t v1;

  return sub_20DB8E4B0(a1, *(void **)(v1 + 16), (uint64_t)sub_20DB90100, (uint64_t)&block_descriptor_94) & 1;
}

uint64_t sub_20DB901AC(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *(_QWORD *)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_20DB8DCD0;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

uint64_t sub_20DB90210(uint64_t a1)
{
  uint64_t v1;

  return sub_20DB8E4B0(a1, *(void **)(v1 + 16), (uint64_t)sub_20DB90100, (uint64_t)&block_descriptor_105) & 1;
}

uint64_t sub_20DB9023C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if (a2)
  {
    result = swift_beginAccess();
    *(_BYTE *)(v2 + 16) = 0;
  }
  return result;
}

id CDPEscapeOffersLedger.description.getter()
{
  char *v0;
  id result;
  void *v2;

  sub_20DB9F738();
  sub_20DB9F660();
  CDPRemoteApprovalEscapeOfferMask.description.getter((char)objc_msgSend(v0, sel_escapeOffersPresented));
  sub_20DB9F660();
  swift_bridgeObjectRelease();
  sub_20DB9F660();
  CDPRemoteApprovalEscapeOfferMask.description.getter(*(_QWORD *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_expectedEscapeOffers]);
  sub_20DB9F660();
  swift_bridgeObjectRelease();
  sub_20DB9F660();
  sub_20DB9F660();
  swift_bridgeObjectRelease();
  sub_20DB9F660();
  sub_20DB9F660();
  swift_bridgeObjectRelease();
  sub_20DB9F660();
  sub_20DB905C0();
  sub_20DB9F660();
  swift_bridgeObjectRelease();
  sub_20DB9F660();
  result = objc_msgSend(*(id *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext], sel_context);
  if (result)
  {
    v2 = result;
    objc_msgSend(result, sel_type);

    type metadata accessor for CDPContextType(0);
    sub_20DB9F768();
    sub_20DB9F660();
    sub_20DB9F660();
    swift_bridgeObjectRelease();
    return 0;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_20DB905C0()
{
  uint64_t v0;
  id result;
  void *v2;
  id v3;

  result = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                                 + OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext), sel_context));
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_type);

    return (id)sub_20DB9094C((uint64_t)v3, (uint64_t)&unk_24C81DEB0);
  }
  else
  {
    __break(1u);
  }
  return result;
}

unint64_t sub_20DB90624(uint64_t a1, uint64_t a2)
{
  unint64_t v2;
  unint64_t v4;

  switch(a2)
  {
    case -6103:
      sub_20DB9F738();
      swift_bridgeObjectRelease();
      v2 = 0xD000000000000012;
      goto LABEL_9;
    case -6102:
      sub_20DB9F738();
      swift_bridgeObjectRelease();
      v4 = 0xD000000000000010;
      goto LABEL_10;
    case -6101:
      sub_20DB9F738();
      swift_bridgeObjectRelease();
      v2 = 0xD000000000000011;
      goto LABEL_9;
    case -6100:
      sub_20DB9F738();
      swift_bridgeObjectRelease();
      v2 = 0xD00000000000001BLL;
      goto LABEL_9;
    default:
      if (a2 != -5500)
        return 0;
      sub_20DB9F738();
      swift_bridgeObjectRelease();
      v2 = 0xD000000000000016;
LABEL_9:
      v4 = v2;
LABEL_10:
      sub_20DB9F660();
      swift_bridgeObjectRelease();
      return v4;
  }
}

unint64_t sub_20DB907E4()
{
  unsigned __int8 *v0;

  return sub_20DB90624(*v0, *((_QWORD *)v0 + 1));
}

uint64_t sub_20DB907F0()
{
  _BYTE *v0;
  uint64_t v1;
  unsigned __int8 v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549DBD30);
  v1 = swift_allocObject();
  *(_OWORD *)(v1 + 16) = xmmword_20DBA4690;
  v2 = 1;
  *(_BYTE *)(v1 + 32) = (v0[OBJC_IVAR___CDPEscapeOffersLedger_deviceIsVM] & 1) == 0;
  *(_QWORD *)(v1 + 40) = -6103;
  v3 = *(id *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_expectedEscapeOffers];
  *(_BYTE *)(v1 + 48) = v3 == objc_msgSend(v0, sel_escapeOffersPresented);
  *(_QWORD *)(v1 + 56) = -6100;
  *(_BYTE *)(v1 + 64) = sub_20DB905C0() & 1;
  *(_QWORD *)(v1 + 72) = -6102;
  if (v0[OBJC_IVAR___CDPEscapeOffersLedger_isWalrusEnabled] == 1)
  {
    v4 = *(void **)&v0[OBJC_IVAR___CDPEscapeOffersLedger_probationChecker];
    v5 = *(void **)&v0[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext];
    objc_msgSend(v5, sel_rpdProbationDuration);
    v7 = v6;
    v8 = objc_msgSend(v5, sel_context);
    v2 = objc_msgSend(v4, sel_rpdProbationIsInEffectForDuration_context_, v8, v7);

  }
  *(_BYTE *)(v1 + 80) = v2;
  *(_QWORD *)(v1 + 88) = -6101;
  *(_BYTE *)(v1 + 96) = v0[OBJC_IVAR___CDPEscapeOffersLedger_deviceHasPasscode];
  *(_QWORD *)(v1 + 104) = -5500;
  return v1;
}

uint64_t sub_20DB9094C(uint64_t result, uint64_t a2)
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

BOOL sub_20DB909E0()
{
  void *v0;
  id v1;
  void *v2;
  void *v3;
  unsigned int v4;
  uint64_t v5;
  NSObject *v6;
  os_log_type_t v7;
  uint8_t *v8;
  BOOL v10;

  v1 = objc_msgSend(v0, sel_rpdBlockingError);
  v10 = 1;
  if (v1)
  {
    v2 = v1;
    v3 = (void *)sub_20DB9F594();
    v4 = objc_msgSend(v3, sel_cdp_isCDPErrorWithCode_, -5500);

    if (!v4)
      v10 = 0;
  }
  if (qword_2549DB870 != -1)
    swift_once();
  v5 = sub_20DB9F60C();
  __swift_project_value_buffer(v5, (uint64_t)qword_2549DC270);
  v6 = sub_20DB9F5F4();
  v7 = sub_20DB9F6CC();
  if (os_log_type_enabled(v6, v7))
  {
    v8 = (uint8_t *)swift_slowAlloc();
    *(_DWORD *)v8 = 67109120;
    sub_20DB9F714();
    _os_log_impl(&dword_20DB2C000, v6, v7, "Ledger: canOfferRPD: %{BOOL}d", v8, 8u);
    MEMORY[0x212BB073C](v8, -1, -1);
  }

  swift_beginAccess();
  return v10;
}

id sub_20DB90BA8()
{
  char *v0;
  id result;
  void *v2;
  unsigned int v3;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  void *v8;
  uint64_t v9;
  char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint8_t *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  uint64_t *v22;
  char *v23;
  void *v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint8_t *v28;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  result = objc_msgSend(*(id *)&v0[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext], sel_context);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel__forceReset);

    if (v3)
    {
      if (qword_2549DB870 == -1)
      {
LABEL_4:
        v4 = sub_20DB9F60C();
        __swift_project_value_buffer(v4, (uint64_t)qword_2549DC270);
        v5 = sub_20DB9F5F4();
        v6 = sub_20DB9F6D8();
        if (os_log_type_enabled(v5, v6))
        {
          v7 = (uint8_t *)swift_slowAlloc();
          *(_WORD *)v7 = 0;
          _os_log_impl(&dword_20DB2C000, v5, v6, "Ledger: appleAccountSetupTool asked for a force reset. Overriding all other checks.", v7, 2u);
          MEMORY[0x212BB073C](v7, -1, -1);
        }

        return 0;
      }
LABEL_28:
      swift_once();
      goto LABEL_4;
    }
    if (qword_2549DB870 != -1)
      swift_once();
    v9 = sub_20DB9F60C();
    __swift_project_value_buffer(v9, (uint64_t)qword_2549DC270);
    v10 = v0;
    v11 = sub_20DB9F5F4();
    v12 = sub_20DB9F6CC();
    if (os_log_type_enabled(v11, v12))
    {
      v13 = (uint8_t *)swift_slowAlloc();
      v14 = swift_slowAlloc();
      v34 = v14;
      *(_DWORD *)v13 = 136315138;
      sub_20DB907F0();
      v15 = MEMORY[0x212BAFC38]();
      v17 = v16;
      swift_bridgeObjectRelease();
      sub_20DB919A4(v15, v17, &v34);
      sub_20DB9F714();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20DB2C000, v11, v12, "Ledger: rpdBlockingError - Finding first unsatisfied requirement in conditions: %s", v13, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v14, -1, -1);
      MEMORY[0x212BB073C](v13, -1, -1);

    }
    else
    {

    }
    v18 = sub_20DB907F0();
    v19 = *(_QWORD *)(v18 + 16);
    if (v19)
    {
      if ((*(_BYTE *)(v18 + 32) & 1) == 0)
      {
        v22 = (uint64_t *)(v18 + 40);
LABEL_17:
        v21 = 0;
        v20 = *v22;
        goto LABEL_18;
      }
      if (v19 != 1)
      {
        v22 = (uint64_t *)(v18 + 56);
        v32 = 1;
        v21 = 2;
        while (1)
        {
          v33 = v32 + 1;
          if (__OFADD__(v32, 1))
            break;
          if (*((_BYTE *)v22 - 8) != 1)
            goto LABEL_17;
          v22 += 2;
          ++v32;
          if (v33 == v19)
          {
            v20 = 0;
            goto LABEL_18;
          }
        }
        __break(1u);
        goto LABEL_28;
      }
    }
    v20 = 0;
    v21 = 2;
LABEL_18:
    swift_bridgeObjectRelease();
    v23 = v10;
    sub_20DB922B8(v21, v20, v23);
    v8 = v24;

    v25 = v8;
    v26 = sub_20DB9F5F4();
    v27 = sub_20DB9F6CC();
    if (os_log_type_enabled(v26, v27))
    {
      v28 = (uint8_t *)swift_slowAlloc();
      v29 = swift_slowAlloc();
      v34 = v29;
      *(_DWORD *)v28 = 136315138;
      __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBD10);
      v30 = sub_20DB9F708();
      sub_20DB919A4(v30, v31, &v34);
      sub_20DB9F714();

      swift_bridgeObjectRelease();
      _os_log_impl(&dword_20DB2C000, v26, v27, "Ledger: rpdBlockingError - error: %s", v28, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x212BB073C](v29, -1, -1);
      MEMORY[0x212BB073C](v28, -1, -1);

    }
    else
    {

    }
    return v8;
  }
  __break(1u);
  return result;
}

void sub_20DB91028(uint64_t a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  uint64_t v5;
  uint64_t inited;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[2];

  v5 = *(_QWORD *)(a1 + 8);
  sub_20DB9F648();
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBD18);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_20DBA46A0;
  *(_QWORD *)(inited + 32) = sub_20DB9F648();
  *(_QWORD *)(inited + 40) = v7;
  sub_20DB9F738();
  swift_bridgeObjectRelease();
  strcpy((char *)v15, "Ledger State: ");
  HIBYTE(v15[1]) = -18;
  v8 = objc_msgSend(a2, sel_description);
  sub_20DB9F648();

  sub_20DB9F660();
  swift_bridgeObjectRelease();
  v9 = v15[0];
  v10 = v15[1];
  *(_QWORD *)(inited + 72) = MEMORY[0x24BEE0D00];
  *(_QWORD *)(inited + 48) = v9;
  *(_QWORD *)(inited + 56) = v10;
  sub_20DB911F0(inited);
  v11 = objc_allocWithZone(MEMORY[0x24BDD1540]);
  v12 = (void *)sub_20DB9F63C();
  swift_bridgeObjectRelease();
  v13 = (void *)sub_20DB9F618();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v11, sel_initWithDomain_code_userInfo_, v12, v5, v13);

  *a3 = v14;
}

unint64_t sub_20DB911F0(uint64_t a1)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBD20);
  v2 = sub_20DB9F78C();
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
    sub_20DB92310(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_20DB92174(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = (unint64_t)sub_20DB92358(&v17, (_OWORD *)(v3[7] + 32 * result));
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

id sub_20DB91318(uint64_t a1, void *a2, char a3, uint64_t a4, char a5)
{
  char *v5;
  char *v10;
  unsigned __int8 v11;
  uint64_t v12;
  id v13;
  id v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  id v18;
  NSObject *v19;
  os_log_type_t v20;
  uint8_t *v21;
  _QWORD *v22;
  id v23;
  _QWORD *v24;
  id v26;
  objc_super v27;

  *(_QWORD *)&v5[OBJC_IVAR___CDPEscapeOffersLedger__escapeOffersPresented] = 1;
  *(_QWORD *)&v5[OBJC_IVAR___CDPEscapeOffersLedger_expectedEscapeOffers] = a1 & 0xFFFFFFFFFFFFFFE2;
  v10 = v5;
  v11 = objc_msgSend(a2, sel_isWalrusEnabled);
  v10[OBJC_IVAR___CDPEscapeOffersLedger_isWalrusEnabled] = v11;
  v10[OBJC_IVAR___CDPEscapeOffersLedger_deviceHasPasscode] = a3;
  objc_msgSend(a2, sel_rpdProbationDuration);
  *(_QWORD *)&v10[OBJC_IVAR___CDPEscapeOffersLedger_probationDuration] = v12;
  *(_QWORD *)&v10[OBJC_IVAR___CDPEscapeOffersLedger_probationChecker] = a4;
  *(_QWORD *)&v10[OBJC_IVAR___CDPEscapeOffersLedger_recoveryFlowContext] = a2;
  v10[OBJC_IVAR___CDPEscapeOffersLedger_deviceIsVM] = a5;
  swift_unknownObjectRetain();
  v13 = a2;

  v27.receiver = v10;
  v27.super_class = (Class)CDPEscapeOffersLedger;
  v14 = objc_msgSendSuper2(&v27, sel_init);
  v15 = qword_2549DB870;
  v16 = v14;
  if (v15 != -1)
    swift_once();
  v17 = sub_20DB9F60C();
  __swift_project_value_buffer(v17, (uint64_t)qword_2549DC270);
  v18 = v16;
  v19 = sub_20DB9F5F4();
  v20 = sub_20DB9F6D8();
  if (os_log_type_enabled(v19, v20))
  {
    v21 = (uint8_t *)swift_slowAlloc();
    v26 = v13;
    v22 = (_QWORD *)swift_slowAlloc();
    *(_DWORD *)v21 = 138412290;
    v23 = v18;
    sub_20DB9F714();
    *v22 = v18;

    _os_log_impl(&dword_20DB2C000, v19, v20, "Ledger: Initialized: %@", v21, 0xCu);
    __swift_instantiateConcreteTypeFromMangledName(&qword_2549DB8C0);
    swift_arrayDestroy();
    v24 = v22;
    v13 = v26;
    MEMORY[0x212BB073C](v24, -1, -1);
    MEMORY[0x212BB073C](v21, -1, -1);
    swift_unknownObjectRelease();
  }
  else
  {
    swift_unknownObjectRelease();

  }
  return v18;
}

void sub_20DB91608(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  NSObject *v5;
  os_log_type_t v6;
  uint8_t *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;

  v2 = v1;
  if (qword_2549DB870 != -1)
    swift_once();
  v4 = sub_20DB9F60C();
  __swift_project_value_buffer(v4, (uint64_t)qword_2549DC270);
  v5 = sub_20DB9F5F4();
  v6 = sub_20DB9F6D8();
  if (os_log_type_enabled(v5, v6))
  {
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v11 = v8;
    *(_DWORD *)v7 = 136315138;
    v9 = CDPRemoteApprovalEscapeOfferMask.description.getter(a1);
    sub_20DB919A4(v9, v10, &v11);
    sub_20DB9F714();
    swift_bridgeObjectRelease();
    _os_log_impl(&dword_20DB2C000, v5, v6, "Ledger: User was offered %s", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x212BB073C](v8, -1, -1);
    MEMORY[0x212BB073C](v7, -1, -1);
  }

  *(_QWORD *)(v2 + OBJC_IVAR___CDPEscapeOffersLedger__escapeOffersPresented) |= a1 & 0xFFFFFFFFFFFFFFE2;
}

void __swiftcall CDPEscapeOffersLedger.init()(CDPEscapeOffersLedger *__return_ptr retstr)
{
  objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

void CDPEscapeOffersLedger.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

unint64_t type metadata accessor for CDPEscapeOffersLedger()
{
  unint64_t result;

  result = qword_2549DBCF8;
  if (!qword_2549DBCF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_2549DBCF8);
  }
  return result;
}

uint64_t sub_20DB918D0(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_20DB918E0(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_20DB91914(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_20DB91934(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_20DB919A4(v6, v7, a3);
  v8 = *a1 + 8;
  sub_20DB9F714();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_20DB919A4(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_20DB91A74(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_20DB91FF4((uint64_t)v12, *a3);
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
      sub_20DB91FF4((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v12);
  return v7;
}

uint64_t sub_20DB91A74(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_20DB9F720();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_20DB91C2C(a5, a6);
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
  v8 = sub_20DB9F75C();
  if (!v8)
  {
    sub_20DB9F774();
    __break(1u);
LABEL_17:
    result = sub_20DB9F798();
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

uint64_t sub_20DB91C2C(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_20DB91CC0(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_20DB91E98(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_20DB91E98(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_20DB91CC0(uint64_t a1, unint64_t a2)
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
      v3 = sub_20DB91E34(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_20DB9F744();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_20DB9F774();
      __break(1u);
LABEL_10:
      v2 = sub_20DB9F66C();
      if (!v2)
        return MEMORY[0x24BEE4AF8];
    }
    sub_20DB9F798();
    __break(1u);
LABEL_14:
    result = sub_20DB9F774();
    __break(1u);
  }
  else
  {
    return MEMORY[0x24BEE4AF8];
  }
  return result;
}

_QWORD *sub_20DB91E34(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549DBD00);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_20DB91E98(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_2549DBD00);
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
  result = sub_20DB9F798();
  __break(1u);
  return result;
}

_BYTE **sub_20DB91FE4(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

uint64_t sub_20DB91FF4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

void *sub_20DB92030(void *__src, uint64_t a2, void *__dst, uint64_t a4)
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
    __src = (void *)sub_20DB9F798();
    __break(1u);
    return __src;
  }
  if (a4 - (uint64_t)__dst < v4)
    goto LABEL_10;
  if (__src)
    return memmove(__dst, __src, a2 - (_QWORD)__src);
  return __src;
}

void sub_20DB920C4(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_20DB9F714();
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

unint64_t sub_20DB92174(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_20DB9F7BC();
  sub_20DB9F654();
  v4 = sub_20DB9F7C8();
  return sub_20DB921D8(a1, a2, v4);
}

unint64_t sub_20DB921D8(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_20DB9F7B0() & 1) == 0)
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
      while (!v14 && (sub_20DB9F7B0() & 1) == 0);
    }
  }
  return v6;
}

void sub_20DB922B8(char a1, uint64_t a2, void *a3)
{
  _BYTE v3[8];
  uint64_t v4;
  uint64_t v5;

  if (a1 != 2)
  {
    v3[0] = a1 & 1;
    v4 = a2;
    sub_20DB91028((uint64_t)v3, a3, &v5);
  }
}

uint64_t sub_20DB92310(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_2549DBD28);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

_OWORD *sub_20DB92358(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t _s9ConditionVwet(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[16])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s9ConditionVwst(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *_s9ConditionVMa()
{
  return &_s9ConditionVN;
}

uint64_t __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLAEnvironmentClass_block_invoke_cold_1(v0);
}

void __getLAEnvironmentClass_block_invoke_cold_1()
{
  abort_report_np();
  -[CDPDFollowUpFactory followUpItemWithContext:].cold.1();
}

void __getUMUserManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  -[CDPDClientHandler fetchEscrowRecordDevicesWithContext:usingCache:completion:].cold.1();
}

uint64_t sub_20DB9F594()
{
  return MEMORY[0x24BDCD2F0]();
}

uint64_t sub_20DB9F5A0()
{
  return MEMORY[0x24BDCD2F8]();
}

uint64_t sub_20DB9F5AC()
{
  return MEMORY[0x24BDFC4A8]();
}

uint64_t sub_20DB9F5B8()
{
  return MEMORY[0x24BDFC4B8]();
}

uint64_t sub_20DB9F5C4()
{
  return MEMORY[0x24BDFC4C0]();
}

uint64_t sub_20DB9F5D0()
{
  return MEMORY[0x24BDFC4D8]();
}

uint64_t sub_20DB9F5DC()
{
  return MEMORY[0x24BDFC5C8]();
}

uint64_t sub_20DB9F5E8()
{
  return MEMORY[0x24BDFC5D8]();
}

uint64_t sub_20DB9F5F4()
{
  return MEMORY[0x24BEE78A8]();
}

uint64_t sub_20DB9F600()
{
  return MEMORY[0x24BEE78C0]();
}

uint64_t sub_20DB9F60C()
{
  return MEMORY[0x24BEE78D8]();
}

uint64_t sub_20DB9F618()
{
  return MEMORY[0x24BDCF808]();
}

uint64_t sub_20DB9F624()
{
  return MEMORY[0x24BDCF830]();
}

uint64_t sub_20DB9F630()
{
  return MEMORY[0x24BEE07D0]();
}

uint64_t sub_20DB9F63C()
{
  return MEMORY[0x24BDCF9E0]();
}

uint64_t sub_20DB9F648()
{
  return MEMORY[0x24BDCFA28]();
}

uint64_t sub_20DB9F654()
{
  return MEMORY[0x24BEE0B20]();
}

uint64_t sub_20DB9F660()
{
  return MEMORY[0x24BEE0BC0]();
}

uint64_t sub_20DB9F66C()
{
  return MEMORY[0x24BEE0C10]();
}

uint64_t sub_20DB9F678()
{
  return MEMORY[0x24BEE0CC8]();
}

uint64_t sub_20DB9F684()
{
  return MEMORY[0x24BDCFBA8]();
}

uint64_t sub_20DB9F690()
{
  return MEMORY[0x24BDCFBC8]();
}

uint64_t sub_20DB9F69C()
{
  return MEMORY[0x24BEE1120]();
}

uint64_t sub_20DB9F6A8()
{
  return MEMORY[0x24BEE6800]();
}

uint64_t sub_20DB9F6B4()
{
  return MEMORY[0x24BEE6988]();
}

uint64_t sub_20DB9F6C0()
{
  return MEMORY[0x24BEE6990]();
}

uint64_t sub_20DB9F6CC()
{
  return MEMORY[0x24BEE78F0]();
}

uint64_t sub_20DB9F6D8()
{
  return MEMORY[0x24BEE7908]();
}

uint64_t sub_20DB9F6E4()
{
  return MEMORY[0x24BEE7910]();
}

uint64_t sub_20DB9F6F0()
{
  return MEMORY[0x24BEE7920]();
}

uint64_t sub_20DB9F6FC()
{
  return MEMORY[0x24BEE7928]();
}

uint64_t sub_20DB9F708()
{
  return MEMORY[0x24BEE1C58]();
}

uint64_t sub_20DB9F714()
{
  return MEMORY[0x24BEE1F00]();
}

uint64_t sub_20DB9F720()
{
  return MEMORY[0x24BEE1F48]();
}

uint64_t sub_20DB9F72C()
{
  return MEMORY[0x24BEE22B0]();
}

uint64_t sub_20DB9F738()
{
  return MEMORY[0x24BEE2510]();
}

uint64_t sub_20DB9F744()
{
  return MEMORY[0x24BEE2518]();
}

uint64_t sub_20DB9F750()
{
  return MEMORY[0x24BEE2658]();
}

uint64_t sub_20DB9F75C()
{
  return MEMORY[0x24BEE2838]();
}

uint64_t sub_20DB9F768()
{
  return MEMORY[0x24BEE2BE0]();
}

uint64_t sub_20DB9F774()
{
  return MEMORY[0x24BEE2F40]();
}

uint64_t sub_20DB9F780()
{
  return MEMORY[0x24BEE3068]();
}

uint64_t sub_20DB9F78C()
{
  return MEMORY[0x24BEE3098]();
}

uint64_t sub_20DB9F798()
{
  return MEMORY[0x24BEE30B0]();
}

uint64_t sub_20DB9F7A4()
{
  return MEMORY[0x24BEE3880]();
}

uint64_t sub_20DB9F7B0()
{
  return MEMORY[0x24BEE3A30]();
}

uint64_t sub_20DB9F7BC()
{
  return MEMORY[0x24BEE42E0]();
}

uint64_t sub_20DB9F7C8()
{
  return MEMORY[0x24BEE4328]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B8]();
}

uint64_t CCCryptorGCMOneshotDecrypt()
{
  return MEMORY[0x24BDAC158]();
}

uint64_t CCCryptorGCMOneshotEncrypt()
{
  return MEMORY[0x24BDAC160]();
}

uint64_t CDPContextTypeAnalyticsString()
{
  return MEMORY[0x24BE1A308]();
}

uint64_t CDPDaemonExportedInterface()
{
  return MEMORY[0x24BE1A310]();
}

uint64_t CDPEscrowRecordStateString()
{
  return MEMORY[0x24BE1A318]();
}

uint64_t CDPLocalizedString()
{
  return MEMORY[0x24BE1A348]();
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t OctagonIsSOSFeatureEnabled()
{
  return MEMORY[0x24BDE8528]();
}

uint64_t PCSIdentitySetCreate()
{
  return MEMORY[0x24BE7ADE0]();
}

uint64_t PCSIdentitySetEnumerateIdentities()
{
  return MEMORY[0x24BE7ADF8]();
}

uint64_t PCSIdentitySetIsICDP()
{
  return MEMORY[0x24BE7AE00]();
}

uint64_t PCSIdentitySetIsICDPNetwork()
{
  return MEMORY[0x24BE7AE08]();
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

uint64_t SOSCCCopyMyPeerInfo()
{
  return MEMORY[0x24BDE8560]();
}

uint64_t SOSCCCopyMyPeerWithNewDeviceRecoverySecret()
{
  return MEMORY[0x24BDE8568]();
}

uint64_t SOSCCFetchCompatibilityMode()
{
  return MEMORY[0x24BDE8580]();
}

uint64_t SOSCCIsSOSTrustAndSyncingEnabled()
{
  return MEMORY[0x24BDE8588]();
}

uint64_t SOSCCRegisterRecoveryPublicKey()
{
  return MEMORY[0x24BDE85B0]();
}

uint64_t SOSCCResetToOffering()
{
  return MEMORY[0x24BDE85E0]();
}

uint64_t SOSCCSetCompatibilityMode()
{
  return MEMORY[0x24BDE85E8]();
}

uint64_t SOSPeerInfoCopyBackupKey()
{
  return MEMORY[0x24BDE8630]();
}

uint64_t SecPasswordGenerate()
{
  return MEMORY[0x24BDE8BD0]();
}

uint64_t SecRKCreateRecoveryKeyWithError()
{
  return MEMORY[0x24BDE8CB8]();
}

uint64_t SecRKRegisterBackupPublicKey()
{
  return MEMORY[0x24BDE8CC0]();
}

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x24BDE8CC8](rnd, count, bytes);
}

CFStringRef SecTaskCopySigningIdentifier(SecTaskRef task, CFErrorRef *error)
{
  return (CFStringRef)MEMORY[0x24BDE8D38](task, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

uint64_t _AKLogSystem()
{
  return MEMORY[0x24BE0AE10]();
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

uint64_t _CDPLogSystem()
{
  return MEMORY[0x24BE1A550]();
}

uint64_t _CDPLogSystemAnalytics()
{
  return MEMORY[0x24BE1A558]();
}

uint64_t _CDPSignpostCreate()
{
  return MEMORY[0x24BE1A560]();
}

uint64_t _CDPSignpostGetNanoseconds()
{
  return MEMORY[0x24BE1A568]();
}

uint64_t _CDPSignpostLogSystem()
{
  return MEMORY[0x24BE1A570]();
}

uint64_t _CDPStateError()
{
  return MEMORY[0x24BE1A578]();
}

uint64_t _CDPStateErrorWithUnderlying()
{
  return MEMORY[0x24BE1A580]();
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x24BDBCF60]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _PCSIdentityGetKey()
{
  return MEMORY[0x24BE7AE58]();
}

uint64_t _PCSKeyCopyExportedPrivateKey()
{
  return MEMORY[0x24BE7AE68]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x24BEE4B30]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x24BEE4B38]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

uint64_t cdp_dispatch_after_with_qos()
{
  return MEMORY[0x24BE1A598]();
}

uint64_t cdp_dispatch_async_with_qos()
{
  return MEMORY[0x24BE1A5A0]();
}

uint64_t cdp_dispatch_sync_with_qos()
{
  return MEMORY[0x24BE1A5A8]();
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

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
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

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x24BEDD070]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

void objc_terminate(void)
{
  MEMORY[0x24BEDD450]();
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
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

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

qos_class_t qos_class_self(void)
{
  return MEMORY[0x24BDAFA10]();
}

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x24BEDD500](sel);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x24BDAFEF0](__s1, __s2);
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

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x24BEE4BD8]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x24BEE71B8]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x24BEE71C0]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x24BEE4C18]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x24BEE4F40]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x24BEE5050]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x24BDB00F8](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

