id getSOAuthorizationCoreClass()
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
  v0 = (void *)getSOAuthorizationCoreClass_softClass;
  v7 = getSOAuthorizationCoreClass_softClass;
  if (!getSOAuthorizationCoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationCoreClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOAuthorizationCoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DABD624(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOAuthorizationCoreClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_2();
  result = objc_getClass("SOAuthorizationCore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationCoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOAuthorizationCoreClass_block_invoke_cold_1();
    return (Class)AppSSOCoreLibrary(v3);
  }
  return result;
}

void AppSSOCoreLibrary()
{
  void *v0;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_0)
    AppSSOCoreLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!AppSSOCoreLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void AppSSOCoreLibrary_0()
{
  void *v0;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_5)
    AppSSOCoreLibraryCore_frameworkLibrary_5 = _sl_dlopen();
  if (!AppSSOCoreLibraryCore_frameworkLibrary_5)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

uint64_t AppSSOCoreLibrary_1()
{
  uint64_t v0;
  void *v2;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_7)
    AppSSOCoreLibraryCore_frameworkLibrary_7 = _sl_dlopen();
  v0 = AppSSOCoreLibraryCore_frameworkLibrary_7;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_7)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void AppSSOCoreLibrary_2()
{
  void *v0;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_8)
    AppSSOCoreLibraryCore_frameworkLibrary_8 = _sl_dlopen();
  if (!AppSSOCoreLibraryCore_frameworkLibrary_8)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

void AppSSOCoreLibrary_3()
{
  void *v0;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_9)
    AppSSOCoreLibraryCore_frameworkLibrary_9 = _sl_dlopen();
  if (!AppSSOCoreLibraryCore_frameworkLibrary_9)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

uint64_t AppSSOCoreLibrary_4()
{
  uint64_t v0;
  void *v2;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  v0 = AppSSOCoreLibraryCore_frameworkLibrary_11;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

void sub_20DABDE64(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOConfigurationClass()
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
  v0 = (void *)getSOConfigurationClass_softClass;
  v7 = getSOConfigurationClass_softClass;
  if (!getSOConfigurationClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOConfigurationClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOConfigurationClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DABDF34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOConfigurationHost()
{
  if (SO_LOG_SOConfigurationHost_once != -1)
    dispatch_once(&SO_LOG_SOConfigurationHost_once, &__block_literal_global_152);
  return (id)SO_LOG_SOConfigurationHost_log;
}

id getSOAuthorizationResultCoreClass()
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
  v0 = (void *)getSOAuthorizationResultCoreClass_softClass;
  v7 = getSOAuthorizationResultCoreClass_softClass;
  if (!getSOAuthorizationResultCoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationResultCoreClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOAuthorizationResultCoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DABE140(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOAuthorizationResultCoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary)
  {
    AppSSOCoreLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOAuthorizationResultCore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOAuthorizationResultCoreClass_block_invoke_cold_1();
    free(v3);
  }
  getSOAuthorizationResultCoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SO_LOG_SOExtensionServiceConnection()
{
  if (SO_LOG_SOExtensionServiceConnection_once != -1)
    dispatch_once(&SO_LOG_SOExtensionServiceConnection_once, &__block_literal_global);
  return (id)SO_LOG_SOExtensionServiceConnection_log;
}

void sub_20DABE79C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  _Block_object_dispose(&location, 8);
  _Unwind_Resume(a1);
}

void sub_20DABEA28(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

Class __getSOInternalProtocolsClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary();
  result = objc_getClass("SOInternalProtocols");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOInternalProtocolsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOInternalProtocolsClass_block_invoke_cold_1();
    return (Class)__getSOErrorHelperClass_block_invoke(v3);
  }
  return result;
}

void __getSOErrorHelperClass_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  void *v10;
  NSObject *v11;
  uint64_t v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  AppSSOCoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SOErrorHelper");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v10 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0(v10, v11, v12, v13, v14, v15, v16, v17, a9);
  }
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_20DABF0C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SORemoteExtensionContext()
{
  if (SO_LOG_SORemoteExtensionContext_once != -1)
    dispatch_once(&SO_LOG_SORemoteExtensionContext_once, &__block_literal_global_168);
  return (id)SO_LOG_SORemoteExtensionContext_log;
}

void sub_20DABF1B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DABF31C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass()
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
  v0 = (void *)getSOErrorHelperClass_softClass_0;
  v7 = getSOErrorHelperClass_softClass_0;
  if (!getSOErrorHelperClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_0;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DABF484(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DABF818(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_20DABF988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getASAuthorizationProviderExtensionAuthorizationRequestClass()
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
  v0 = (void *)getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass;
  v7 = getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass;
  if (!getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DABFE64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAC0808(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC09C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC0D20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_1)
  {
    AppSSOCoreLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary_1)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOErrorHelper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
    free(v3);
  }
  getSOErrorHelperClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    AuthenticationServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AuthenticationServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("ASAuthorizationProviderExtensionAuthorizationRequest");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke_cold_1();
    free(v3);
  }
  getASAuthorizationProviderExtensionAuthorizationRequestClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32)
                                                                                                 + 8)
                                                                                     + 24);
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t OUTLINED_FUNCTION_9(uint64_t a1)
{
  return *(_QWORD *)a1;
}

void sub_20DAC1D00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOExtension()
{
  if (SO_LOG_SOExtension_once != -1)
    dispatch_once(&SO_LOG_SOExtension_once, &__block_literal_global_1);
  return (id)SO_LOG_SOExtension_log;
}

void sub_20DAC1E60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC1F18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_20DAC21A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass_0()
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
  v0 = (void *)getSOErrorHelperClass_softClass_1;
  v7 = getSOErrorHelperClass_softClass_1;
  if (!getSOErrorHelperClass_softClass_1)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_1;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_1((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DAC2268(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAC242C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC2550(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC26FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC3B74(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC3E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
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

void sub_20DAC3FBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC40E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC4640(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAC4BAC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC4D28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC5D7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC6108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_1(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_2)
  {
    AppSSOCoreLibraryCore_frameworkLibrary_2 = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary_2)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOErrorHelper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
    free(v3);
  }
  getSOErrorHelperClass_softClass_1 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_20DAC8304(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

Class __getSOAuthorizationParametersCoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_3)
  {
    AppSSOCoreLibraryCore_frameworkLibrary_3 = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary_3)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOAuthorizationParametersCore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOAuthorizationParametersCoreClass_block_invoke_cold_1();
    free(v3);
  }
  getSOAuthorizationParametersCoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SO_LOG_SOExtensionManager()
{
  if (SO_LOG_SOExtensionManager_once != -1)
    dispatch_once(&SO_LOG_SOExtensionManager_once, &__block_literal_global_66);
  return (id)SO_LOG_SOExtensionManager_log;
}

void sub_20DAC8CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAC8E6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_20DAC9274(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC9340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAC9528(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAC9748(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_2(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_4)
  {
    AppSSOCoreLibraryCore_frameworkLibrary_4 = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary_4)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOErrorHelper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
    free(v3);
  }
  getSOErrorHelperClass_softClass_2 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x20u);
}

void sub_20DACB380(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACB40C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACB610(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SORequestQueue()
{
  if (SO_LOG_SORequestQueue_once != -1)
    dispatch_once(&SO_LOG_SORequestQueue_once, &__block_literal_global_35);
  return (id)SO_LOG_SORequestQueue_log;
}

void sub_20DACB748(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACBA10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACBD28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACBD94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACBE04(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACBEC8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACC024(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACC088(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_1_2(uint64_t result, int a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 1024;
  *(_DWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_2_2(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x12u);
}

void sub_20DACCA04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, ...)
{
  va_list va;

  va_start(va, a5);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOUtilsClass()
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
  v0 = (void *)getSOUtilsClass_softClass;
  v7 = getSOUtilsClass_softClass;
  if (!getSOUtilsClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOUtilsClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOUtilsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DACCAC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOUtilsClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_0();
  result = objc_getClass("SOUtils");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOUtilsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOUtilsClass_block_invoke_cold_1();
    return (Class)__getSOErrorHelperClass_block_invoke_3(v3);
  }
  return result;
}

Class __getSOErrorHelperClass_block_invoke_3(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  __CFString *v5;
  BOOL v6;

  AppSSOCoreLibrary_0();
  result = objc_getClass("SOErrorHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_3 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
    return (Class)+[SOPreferences BOOLValueForKey:defaultValue:](v3, v4, v5, v6);
  }
  return result;
}

id getSOUtilsClass_0()
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
  v0 = (void *)getSOUtilsClass_softClass_0;
  v7 = getSOUtilsClass_softClass_0;
  if (!getSOUtilsClass_softClass_0)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOUtilsClass_block_invoke_0;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOUtilsClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DACCE40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOPreferences()
{
  if (SO_LOG_SOPreferences_once != -1)
    dispatch_once(&SO_LOG_SOPreferences_once, &__block_literal_global_5);
  return (id)SO_LOG_SOPreferences_log;
}

Class __getSOUtilsClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_6)
  {
    AppSSOCoreLibraryCore_frameworkLibrary_6 = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary_6)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOUtils");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOUtilsClass_block_invoke_cold_1();
    free(v3);
  }
  getSOUtilsClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id SO_LOG_SOConfigurationManager()
{
  if (SO_LOG_SOConfigurationManager_once != -1)
    dispatch_once(&SO_LOG_SOConfigurationManager_once, &__block_literal_global_5);
  return (id)SO_LOG_SOConfigurationManager_log;
}

id SO_LOG_SOAuthorizationRequest()
{
  if (SO_LOG_SOAuthorizationRequest_once != -1)
    dispatch_once(&SO_LOG_SOAuthorizationRequest_once, &__block_literal_global_7);
  return (id)SO_LOG_SOAuthorizationRequest_log;
}

id getSOErrorHelperClass_1()
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
  v0 = (void *)getSOErrorHelperClass_softClass_4;
  v7 = getSOErrorHelperClass_softClass_4;
  if (!getSOErrorHelperClass_softClass_4)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_4;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_4((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DACD7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOAuthorizationCredentialClass()
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
  v0 = (void *)getSOAuthorizationCredentialClass_softClass;
  v7 = getSOAuthorizationCredentialClass_softClass;
  if (!getSOAuthorizationCredentialClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationCredentialClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOAuthorizationCredentialClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DACDDE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getASAuthorizationErrorDomain()
{
  id *v0;
  _Unwind_Exception *ASAuthorizationErrorDomain_cold_1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getASAuthorizationErrorDomainSymbolLoc_ptr;
  v7 = getASAuthorizationErrorDomainSymbolLoc_ptr;
  if (!getASAuthorizationErrorDomainSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getASAuthorizationErrorDomainSymbolLoc_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getASAuthorizationErrorDomainSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (id *)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    ASAuthorizationErrorDomain_cold_1 = (_Unwind_Exception *)getASAuthorizationErrorDomain_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(ASAuthorizationErrorDomain_cold_1);
  }
  return *v0;
}

void sub_20DACEF28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACF050(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DACF560(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_4(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_1();
  result = objc_getClass("SOErrorHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_4 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOErrorHelperClass_block_invoke_cold_1();
    return (Class)__getSOAuthorizationCredentialClass_block_invoke(v3);
  }
  return result;
}

Class __getSOAuthorizationCredentialClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_1();
  result = objc_getClass("SOAuthorizationCredential");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationCredentialClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOAuthorizationCredentialClass_block_invoke_cold_1();
    return (Class)__getASAuthorizationErrorDomainSymbolLoc_block_invoke(v3);
  }
  return result;
}

void *__getASAuthorizationErrorDomainSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (AuthenticationServicesLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)AuthenticationServicesLibraryCore_frameworkLibrary_0;
  }
  else
  {
    AuthenticationServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    v2 = (void *)AuthenticationServicesLibraryCore_frameworkLibrary_0;
    if (!AuthenticationServicesLibraryCore_frameworkLibrary_0)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "ASAuthorizationErrorDomain");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getASAuthorizationErrorDomainSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getPOLoginManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!PlatformSSOLibraryCore_frameworkLibrary)
  {
    PlatformSSOLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!PlatformSSOLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("POLoginManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    __getPOLoginManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getPOLoginManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t OUTLINED_FUNCTION_4_0(uint64_t result, uint64_t a2, int a3, float a4)
{
  *(float *)a2 = a4;
  *(_DWORD *)(a2 + 4) = result & 1;
  *(_WORD *)(a2 + 8) = 1024;
  *(_DWORD *)(a2 + 10) = a3;
  return result;
}

void OUTLINED_FUNCTION_5_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0xEu);
}

id SO_LOG_SOAuthorization()
{
  if (SO_LOG_SOAuthorization_once != -1)
    dispatch_once(&SO_LOG_SOAuthorization_once, &__block_literal_global_8);
  return (id)SO_LOG_SOAuthorization_log;
}

void sub_20DACFFE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD0048(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD00A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD0108(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD015C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD01BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20DAD0B70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass_2()
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
  v0 = (void *)getSOErrorHelperClass_softClass_5;
  v7 = getSOErrorHelperClass_softClass_5;
  if (!getSOErrorHelperClass_softClass_5)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_5;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_5((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DAD11C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAD18B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOAuthorizationCredentialCoreClass()
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
  v0 = (void *)getSOAuthorizationCredentialCoreClass_softClass;
  v7 = getSOAuthorizationCredentialCoreClass_softClass;
  if (!getSOAuthorizationCredentialCoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOAuthorizationCredentialCoreClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOAuthorizationCredentialCoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DAD19E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAD1E04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  void *v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  objc_sync_exit(v15);
  _Unwind_Resume(a1);
}

void sub_20DAD2BE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOAuthorizationRequestParametersCoreClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_2();
  result = objc_getClass("SOAuthorizationRequestParametersCore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationRequestParametersCoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOAuthorizationRequestParametersCoreClass_block_invoke_cold_1();
    return __getSOErrorHelperClass_block_invoke_5(v3);
  }
  return result;
}

Class __getSOErrorHelperClass_block_invoke_5(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_2();
  result = objc_getClass("SOErrorHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOErrorHelperClass_block_invoke_cold_1();
    return (Class)__getSOAuthorizationCredentialCoreClass_block_invoke(v3);
  }
  return result;
}

Class __getSOAuthorizationCredentialCoreClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_2();
  result = objc_getClass("SOAuthorizationCredentialCore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOAuthorizationCredentialCoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOAuthorizationCredentialCoreClass_block_invoke_cold_1();
    return (Class)__getSOConfigurationClientClass_block_invoke(v3);
  }
  return result;
}

Class __getSOConfigurationClientClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_2();
  result = objc_getClass("SOConfigurationClient");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOConfigurationClientClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOConfigurationClientClass_block_invoke_cold_1();
    return (Class)__getSOUIAuthorizationViewControllerClass_block_invoke(v3);
  }
  return result;
}

Class __getSOUIAuthorizationViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOUILibraryCore_frameworkLibrary)
  {
    AppSSOUILibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppSSOUILibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOUIAuthorizationViewController");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOUIAuthorizationViewControllerClass_block_invoke_cold_1();
    free(v3);
  }
  getSOUIAuthorizationViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_2_3(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_1(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_10_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

id SO_LOG_SOExtensionViewService()
{
  if (SO_LOG_SOExtensionViewService_once != -1)
    dispatch_once(&SO_LOG_SOExtensionViewService_once, &__block_literal_global_9);
  return (id)SO_LOG_SOExtensionViewService_log;
}

void sub_20DAD3DE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAD40A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass_3()
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
  v0 = (void *)getSOErrorHelperClass_softClass_6;
  v7 = getSOErrorHelperClass_softClass_6;
  if (!getSOErrorHelperClass_softClass_6)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_6;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_6((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DAD4168(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAD438C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD45A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id getSOFullProfileClass()
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
  v0 = (void *)getSOFullProfileClass_softClass;
  v7 = getSOFullProfileClass_softClass;
  if (!getSOFullProfileClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOFullProfileClass_block_invoke;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOFullProfileClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DAD4664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DAD48AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD4AC0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD4CA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD589C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD5C84(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  objc_sync_exit(v2);
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD5FD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20DAD60F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD6284(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD6C28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20DAD739C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_20DAD7D1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id obj, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  objc_sync_exit(obj);
  objc_sync_exit(a23);
  _Unwind_Resume(a1);
}

void sub_20DAD8190(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD85A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD88CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD8CA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_20DAD8F14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

Class __getSOConfigurationVersionClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_3();
  result = objc_getClass("SOConfigurationVersion");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOConfigurationVersionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOConfigurationVersionClass_block_invoke_cold_1();
    return (Class)__getSOErrorHelperClass_block_invoke_6(v3);
  }
  return result;
}

Class __getSOErrorHelperClass_block_invoke_6(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_3();
  result = objc_getClass("SOErrorHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOErrorHelperClass_block_invoke_cold_1();
    return __getSOConfigurationClass_block_invoke(v3);
  }
  return result;
}

Class __getSOConfigurationClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AppSSOCoreLibrary_3();
  result = objc_getClass("SOConfiguration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOConfigurationClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSOConfigurationClass_block_invoke_cold_1();
    return (Class)__getSOFullProfileClass_block_invoke(v3);
  }
  return result;
}

void __getSOFullProfileClass_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  os_log_t v4;
  const char *v5;

  AppSSOCoreLibrary_3();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SOFullProfile");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOFullProfileClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (void *)__getSOFullProfileClass_block_invoke_cold_1();
    OUTLINED_FUNCTION_0_2(v2, v3, v4, v5);
  }
}

void OUTLINED_FUNCTION_0_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_13_1(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void sub_20DAD9768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id SO_LOG_SOHostExtensionContext()
{
  if (SO_LOG_SOHostExtensionContext_once != -1)
    dispatch_once(&SO_LOG_SOHostExtensionContext_once, &__block_literal_global_111);
  return (id)SO_LOG_SOHostExtensionContext_log;
}

void sub_20DADA450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getSOFullProfileClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_10)
  {
    AppSSOCoreLibraryCore_frameworkLibrary_10 = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary_10)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOFullProfile");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOFullProfileClass_block_invoke_cold_1();
    free(v3);
  }
  getSOFullProfileClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void appSSO_init()
{
  void *v0;
  void *v1;
  uint64_t v2;
  NSObject *v3;
  __int128 v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v4 = xmmword_24C80CC90;
    v5 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    *(_QWORD *)&v4 = 0;
    *((_QWORD *)&v4 + 1) = &v4;
    v5 = 0x2020000000;
    v0 = getappSSO_initSymbolLoc_ptr;
    v6 = getappSSO_initSymbolLoc_ptr;
    if (!getappSSO_initSymbolLoc_ptr)
    {
      v1 = (void *)AppSSOCoreLibrary_4();
      v0 = dlsym(v1, "appSSO_init");
      *(_QWORD *)(*((_QWORD *)&v4 + 1) + 24) = v0;
      getappSSO_initSymbolLoc_ptr = v0;
    }
    _Block_object_dispose(&v4, 8);
    if (!v0)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    ((void (*)(uint64_t))v0)(v2);
  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

  }
}

void sub_20DADA678(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_AppSSOClientImpl()
{
  if (SO_LOG_AppSSOClientImpl_once != -1)
    dispatch_once(&SO_LOG_AppSSOClientImpl_once, &__block_literal_global_13);
  return (id)SO_LOG_AppSSOClientImpl_log;
}

uint64_t appSSO_willPerform(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  NSObject *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v12 = xmmword_24C80CC90;
    v13 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    *(_QWORD *)&v12 = 0;
    *((_QWORD *)&v12 + 1) = &v12;
    v13 = 0x2020000000;
    v8 = getappSSO_willPerformSymbolLoc_ptr;
    v14 = getappSSO_willPerformSymbolLoc_ptr;
    if (!getappSSO_willPerformSymbolLoc_ptr)
    {
      v9 = (void *)AppSSOCoreLibrary_4();
      v8 = dlsym(v9, "appSSO_willPerform");
      *(_QWORD *)(*((_QWORD *)&v12 + 1) + 24) = v8;
      getappSSO_willPerformSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v12, 8);
    if (!v8)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    return 0;
  }
}

void sub_20DADA820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void appSSO_performResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v17 = xmmword_24C80CC90;
    v18 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v12 = v11;
    *(_QWORD *)&v17 = 0;
    *((_QWORD *)&v17 + 1) = &v17;
    v18 = 0x2020000000;
    v13 = getappSSO_performResponseSymbolLoc_ptr;
    v19 = getappSSO_performResponseSymbolLoc_ptr;
    if (!getappSSO_performResponseSymbolLoc_ptr)
    {
      v14 = (void *)AppSSOCoreLibrary_4();
      v13 = dlsym(v14, "appSSO_performResponse");
      *(_QWORD *)(*((_QWORD *)&v17 + 1) + 24) = v13;
      getappSSO_performResponseSymbolLoc_ptr = v13;
    }
    _Block_object_dispose(&v17, 8);
    if (!v13)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))v13)(a1, a2, a3, a4, a5, v12);

  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    if (v11)
    {
      v16 = objc_msgSend(getSOErrorHelperClass_4(), "silentInternalErrorWithMessage:", CFSTR("AppSSOCore is not available"));
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v11 + 2))(v11, 0, 0, v16);
    }
  }

}

void sub_20DADA9E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

id getSOErrorHelperClass_4()
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
  v0 = (void *)getSOErrorHelperClass_softClass_7;
  v7 = getSOErrorHelperClass_softClass_7;
  if (!getSOErrorHelperClass_softClass_7)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_7;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_7((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DADAAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void appSSO_performResponseCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  NSObject *v13;
  uint64_t v14;
  __int128 v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v9 = a5;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v15 = xmmword_24C80CC90;
    v16 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v10 = v9;
    *(_QWORD *)&v15 = 0;
    *((_QWORD *)&v15 + 1) = &v15;
    v16 = 0x2020000000;
    v11 = getappSSO_performResponseCredentialSymbolLoc_ptr;
    v17 = getappSSO_performResponseCredentialSymbolLoc_ptr;
    if (!getappSSO_performResponseCredentialSymbolLoc_ptr)
    {
      v12 = (void *)AppSSOCoreLibrary_4();
      v11 = dlsym(v12, "appSSO_performResponseCredential");
      *(_QWORD *)(*((_QWORD *)&v15 + 1) + 24) = v11;
      getappSSO_performResponseCredentialSymbolLoc_ptr = v11;
    }
    _Block_object_dispose(&v15, 8);
    if (!v11)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, id))v11)(a1, a2, a3, a4, v10);

  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    if (v9)
    {
      v14 = objc_msgSend(getSOErrorHelperClass_4(), "silentInternalErrorWithMessage:", CFSTR("AppSSOCore is not available"));
      (*((void (**)(id, _QWORD, uint64_t))v9 + 2))(v9, 0, v14);
    }
  }

}

void sub_20DADAC54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t appSSO_willHandle(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  void *v9;
  NSObject *v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v12 = xmmword_24C80CC90;
    v13 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    *(_QWORD *)&v12 = 0;
    *((_QWORD *)&v12 + 1) = &v12;
    v13 = 0x2020000000;
    v8 = getappSSO_willHandleSymbolLoc_ptr;
    v14 = getappSSO_willHandleSymbolLoc_ptr;
    if (!getappSSO_willHandleSymbolLoc_ptr)
    {
      v9 = (void *)AppSSOCoreLibrary_4();
      v8 = dlsym(v9, "appSSO_willHandle");
      *(_QWORD *)(*((_QWORD *)&v12 + 1) + 24) = v8;
      getappSSO_willHandleSymbolLoc_ptr = v8;
    }
    _Block_object_dispose(&v12, 8);
    if (!v8)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))v8)(a1, a2, a3, a4);
  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    return 0;
  }
}

void sub_20DADADBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void appSSO_handleResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, void *a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v11 = a6;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v17 = xmmword_24C80CC90;
    v18 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v12 = v11;
    *(_QWORD *)&v17 = 0;
    *((_QWORD *)&v17 + 1) = &v17;
    v18 = 0x2020000000;
    v13 = getappSSO_handleResponseSymbolLoc_ptr;
    v19 = getappSSO_handleResponseSymbolLoc_ptr;
    if (!getappSSO_handleResponseSymbolLoc_ptr)
    {
      v14 = (void *)AppSSOCoreLibrary_4();
      v13 = dlsym(v14, "appSSO_handleResponse");
      *(_QWORD *)(*((_QWORD *)&v17 + 1) + 24) = v13;
      getappSSO_handleResponseSymbolLoc_ptr = v13;
    }
    _Block_object_dispose(&v17, 8);
    if (!v13)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))v13)(a1, a2, a3, a4, a5, v12);

  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    if (v11)
    {
      v16 = objc_msgSend(getSOErrorHelperClass_4(), "silentInternalErrorWithMessage:", CFSTR("AppSSOCore is not available"));
      (*((void (**)(id, _QWORD, _QWORD, uint64_t))v11 + 2))(v11, 0, 0, v16);
    }
  }

}

void sub_20DADAF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void appSSO_handleResponseCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, void *a7)
{
  id v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v13 = a7;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v19 = xmmword_24C80CC90;
    v20 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v14 = v13;
    *(_QWORD *)&v19 = 0;
    *((_QWORD *)&v19 + 1) = &v19;
    v20 = 0x2020000000;
    v15 = getappSSO_handleResponseCredentialSymbolLoc_ptr;
    v21 = getappSSO_handleResponseCredentialSymbolLoc_ptr;
    if (!getappSSO_handleResponseCredentialSymbolLoc_ptr)
    {
      v16 = (void *)AppSSOCoreLibrary_4();
      v15 = dlsym(v16, "appSSO_handleResponseCredential");
      *(_QWORD *)(*((_QWORD *)&v19 + 1) + 24) = v15;
      getappSSO_handleResponseCredentialSymbolLoc_ptr = v15;
    }
    _Block_object_dispose(&v19, 8);
    if (!v15)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id))v15)(a1, a2, a3, a4, a5, a6, v14);

  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    if (v13)
    {
      v18 = objc_msgSend(getSOErrorHelperClass_4(), "silentInternalErrorWithMessage:", CFSTR("AppSSOCore is not available"));
      (*((void (**)(id, _QWORD, uint64_t))v13 + 2))(v13, 0, v18);
    }
  }

}

void sub_20DADB150(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void appSSO_handleResponseImpersonationCredential(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v15 = a8;
  if (!AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v22 = xmmword_24C80CC90;
    v23 = 0;
    AppSSOCoreLibraryCore_frameworkLibrary_11 = _sl_dlopen();
  }
  if (AppSSOCoreLibraryCore_frameworkLibrary_11)
  {
    v16 = a1;
    v17 = v15;
    *(_QWORD *)&v22 = 0;
    *((_QWORD *)&v22 + 1) = &v22;
    v23 = 0x2020000000;
    v18 = getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr;
    v24 = getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr;
    if (!getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr)
    {
      v19 = (void *)AppSSOCoreLibrary_4();
      v18 = dlsym(v19, "appSSO_handleResponseImpersonationCredential");
      *(_QWORD *)(*((_QWORD *)&v22 + 1) + 24) = v18;
      getappSSO_handleResponseImpersonationCredentialSymbolLoc_ptr = v18;
    }
    _Block_object_dispose(&v22, 8);
    if (!v18)
    {
      getASAuthorizationErrorDomain_cold_1();
      __break(1u);
    }
    ((void (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, id, _QWORD))v18)(v16, a2, a3, a4, a5, a6, a7, v17, v22);

  }
  else
  {
    SO_LOG_AppSSOClientImpl();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();

    if (v15)
    {
      v21 = objc_msgSend(getSOErrorHelperClass_4(), "silentInternalErrorWithMessage:", CFSTR("AppSSOCore is not available"));
      (*((void (**)(id, _QWORD, uint64_t))v15 + 2))(v15, 0, v21);
    }
  }

}

void sub_20DADB32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

SOExtensionFinder *__getSOErrorHelperClass_block_invoke_7(uint64_t a1)
{
  SOExtensionFinder *result;
  SOExtensionFinder *v3;
  SEL v4;

  AppSSOCoreLibrary_4();
  result = (SOExtensionFinder *)objc_getClass("SOErrorHelper");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSOErrorHelperClass_softClass_7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SOExtensionFinder *)__getSOErrorHelperClass_block_invoke_cold_1();
    return -[SOExtensionFinder init](v3, v4);
  }
  return result;
}

id SO_LOG_SOExtensionFinder()
{
  if (SO_LOG_SOExtensionFinder_once != -1)
    dispatch_once(&SO_LOG_SOExtensionFinder_once, &__block_literal_global_14);
  return (id)SO_LOG_SOExtensionFinder_log;
}

id getSOErrorHelperClass_5()
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
  v0 = (void *)getSOErrorHelperClass_softClass_8;
  v7 = getSOErrorHelperClass_softClass_8;
  if (!getSOErrorHelperClass_softClass_8)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSOErrorHelperClass_block_invoke_8;
    v3[3] = &unk_24C80C0B8;
    v3[4] = &v4;
    __getSOErrorHelperClass_block_invoke_8((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_20DADBB64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_20DADBD84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getSOErrorHelperClass_block_invoke_8(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppSSOCoreLibraryCore_frameworkLibrary_12)
  {
    AppSSOCoreLibraryCore_frameworkLibrary_12 = _sl_dlopen();
    if (!AppSSOCoreLibraryCore_frameworkLibrary_12)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SOErrorHelper");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSOErrorHelperClass_block_invoke_cold_1();
    free(v3);
  }
  getSOErrorHelperClass_softClass_8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __getSOAuthorizationResultCoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SOExtensionServiceConnection initWithListenerEndpoint:].cold.1(v0);
}

uint64_t __getSOInternalProtocolsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOErrorHelperClass_block_invoke_cold_1(v0);
}

uint64_t __getSOErrorHelperClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SORemoteExtensionContext extensionAuthorizationRequestHandlerWithError:].cold.1(v0);
}

uint64_t __getASAuthorizationProviderExtensionAuthorizationRequestClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __30__SOExtension__setupExtension__block_invoke_2_cold_1(v0);
}

uint64_t __getSOAuthorizationParametersCoreClass_block_invoke_cold_1()
{
  int v0;
  int v1;
  os_log_t v2;

  v0 = abort_report_np();
  return __56__SOExtensionManager_loadExtensionWithBundleIdentifier___block_invoke_cold_1(v0, v1, v2);
}

uint64_t __getSOUtilsClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return +[SOConfigurationManager defaultManager].cold.1(v0);
}

uint64_t getASAuthorizationErrorDomain_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return __81__SOAuthorizationRequest_presentAuthorizationViewControllerWithHints_completion___block_invoke_cold_1(v0);
}

uint64_t __getSOAuthorizationCredentialClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getPOLoginManagerClass_block_invoke_cold_1(v0);
}

void __getPOLoginManagerClass_block_invoke_cold_1()
{
  abort_report_np();
  +[SOAuthorization canPerformAuthorizationWithURL:responseCode:].cold.1();
}

uint64_t __getSOAuthorizationCoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOAuthorizationRequestParametersCoreClass_block_invoke_cold_1(v0);
}

uint64_t __getSOAuthorizationRequestParametersCoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOAuthorizationCredentialCoreClass_block_invoke_cold_1(v0);
}

uint64_t __getSOAuthorizationCredentialCoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOConfigurationClientClass_block_invoke_cold_1(v0);
}

uint64_t __getSOConfigurationClientClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOUIAuthorizationViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getSOUIAuthorizationViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SOExtensionViewService connectToContextWithSessionID:completion:].cold.1(v0);
}

uint64_t __getSOConfigurationVersionClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getSOConfigurationClass_block_invoke_cold_1();
}

uint64_t __getSOConfigurationClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSOFullProfileClass_block_invoke_cold_1(v0);
}

uint64_t __getSOFullProfileClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __49__SOHostExtensionContext_remoteContextWithError___block_invoke_cold_1(v0);
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x24BE1A1C8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

Boolean CFPreferencesSynchronize(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return MEMORY[0x24BDBC1B0](applicationID, userName, hostName);
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x24BDD0B30](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

CFTypeID SecKeyGetTypeID(void)
{
  return MEMORY[0x24BDE8B80]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFMZEnabled()
{
  return MEMORY[0x24BDBD008]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x24BDACB10](dso, description, *(_QWORD *)&flags, activity_block);
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

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
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

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

uid_t getuid(void)
{
  return MEMORY[0x24BDAE788]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t rootless_check_datavault_flag()
{
  return MEMORY[0x24BDAFBB8]();
}

uint64_t rootless_convert_to_datavault()
{
  return MEMORY[0x24BDAFBC0]();
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

