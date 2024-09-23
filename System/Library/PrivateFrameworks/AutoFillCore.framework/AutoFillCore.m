void AFDispatchAsync(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unint64_t v7;
  _QWORD v8[4];
  id v9;

  v3 = a2;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __AFDispatchAsync_block_invoke;
  v8[3] = &unk_250853428;
  v9 = v3;
  v4 = v3;
  v5 = a1;
  v6 = (void *)MEMORY[0x23B803990](v8);
  if (_block_count(void)::once_token != -1)
    dispatch_once(&_block_count(void)::once_token, &__block_literal_global);
  do
    v7 = __ldaxr(&_block_count(void)::count);
  while (__stlxr(v7 + 1, &_block_count(void)::count));
  dispatch_async(v5, v6);

}

void ___ZL12_block_countv_block_invoke()
{
  atomic_store(0, &_block_count(void)::count);
}

void sub_236D9E740(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_236D9EAF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_236D9F154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void sub_236D9F4F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_236DA056C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void InputContextLibrary()
{
  void *v0;

  if (!InputContextLibraryCore_frameworkLibrary)
    InputContextLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!InputContextLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSFSafariCreditCardStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!SafariFoundationLibraryCore_frameworkLibrary)
  {
    SafariFoundationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!SafariFoundationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("SFSafariCreditCardStore");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getSFSafariCreditCardStoreClass_block_invoke_cold_1();
    free(v3);
  }
  getSFSafariCreditCardStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t SafariCoreLibrary()
{
  uint64_t v0;
  void *v2;

  if (!SafariCoreLibraryCore_frameworkLibrary)
    SafariCoreLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = SafariCoreLibraryCore_frameworkLibrary;
  if (!SafariCoreLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getMCProfileConnectionClass_block_invoke(uint64_t a1)
{
  Class result;

  ManagedConfigurationLibrary();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMCProfileConnectionClass_block_invoke_cold_1();
    return (Class)ManagedConfigurationLibrary();
  }
  return result;
}

uint64_t ManagedConfigurationLibrary()
{
  uint64_t v0;
  void *v2;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
    ManagedConfigurationLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = ManagedConfigurationLibraryCore_frameworkLibrary;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getLAContextClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LocalAuthenticationLibraryCore_frameworkLibrary)
  {
    LocalAuthenticationLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!LocalAuthenticationLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LAContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLAContextClass_block_invoke_cold_1();
    free(v3);
  }
  getLAContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  NSObject *v5;

  _os_log_error_impl(a1, v5, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_error_impl(a1, v4, OS_LOG_TYPE_ERROR, a4, v5, 0xCu);
}

void sub_236DA0DF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSFSafariCredentialStoreClass()
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
  v0 = (void *)getSFSafariCredentialStoreClass_softClass;
  v7 = getSFSafariCredentialStoreClass_softClass;
  if (!getSFSafariCredentialStoreClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSFSafariCredentialStoreClass_block_invoke;
    v3[3] = &unk_2508535B8;
    v3[4] = &v4;
    __getSFSafariCredentialStoreClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236DA11F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236DA1D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32)
{
  _Block_object_dispose(&a32, 8);
  _Unwind_Resume(a1);
}

id getSFAutoFillFeatureManagerClass()
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
  v0 = (void *)getSFAutoFillFeatureManagerClass_softClass;
  v7 = getSFAutoFillFeatureManagerClass_softClass;
  if (!getSFAutoFillFeatureManagerClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSFAutoFillFeatureManagerClass_block_invoke;
    v3[3] = &unk_2508535B8;
    v3[4] = &v4;
    __getSFAutoFillFeatureManagerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236DA1E34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id getSFAutoFillPasskeyClass()
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
  v0 = (void *)getSFAutoFillPasskeyClass_softClass;
  v7 = getSFAutoFillPasskeyClass_softClass;
  if (!getSFAutoFillPasskeyClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getSFAutoFillPasskeyClass_block_invoke;
    v3[3] = &unk_2508535B8;
    v3[4] = &v4;
    __getSFAutoFillPasskeyClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236DA1F8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236DA2498(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_236DA2E88(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

id getAKPrivateEmailContextClass()
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
  v0 = (void *)getAKPrivateEmailContextClass_softClass;
  v7 = getAKPrivateEmailContextClass_softClass;
  if (!getAKPrivateEmailContextClass_softClass)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __getAKPrivateEmailContextClass_block_invoke;
    v3[3] = &unk_2508535B8;
    v3[4] = &v4;
    __getAKPrivateEmailContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_236DA32CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_236DA35B4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_236DA4598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  _Block_object_dispose(&a41, 8);
  _Unwind_Resume(a1);
}

void __getSFAppAutoFillPasskeyProviderClass_block_invoke(uint64_t a1)
{
  SafariFoundationLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SFAppAutoFillPasskeyProvider");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFAppAutoFillPasskeyProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSFAppAutoFillPasskeyProviderClass_block_invoke_cold_1();
    SafariFoundationLibrary();
  }
}

void SafariFoundationLibrary()
{
  void *v0;

  if (!SafariFoundationLibraryCore_frameworkLibrary_0)
    SafariFoundationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!SafariFoundationLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SafariFoundationLibrary();
  result = objc_getClass("SFAppAutoFillOneTimeCodeProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFAppAutoFillOneTimeCodeProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke_cold_1();
    return (Class)__getSFSafariCredentialStoreClass_block_invoke(v3);
  }
  return result;
}

Class __getSFSafariCredentialStoreClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SafariFoundationLibrary();
  result = objc_getClass("SFSafariCredentialStore");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFSafariCredentialStoreClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSFSafariCredentialStoreClass_block_invoke_cold_1();
    return (Class)__getSFAutoFillFeatureManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getSFAutoFillFeatureManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SafariFoundationLibrary();
  result = objc_getClass("SFAutoFillFeatureManager");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFAutoFillFeatureManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSFAutoFillFeatureManagerClass_block_invoke_cold_1();
    return (Class)__isSystemAutoFillBundle_block_invoke(v3);
  }
  return result;
}

void __isSystemAutoFillBundle_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", CFSTR("com.apple.AutoFillPanel"), CFSTR("com.apple.AutoFillPanelService"), CFSTR("com.apple.InputUI"), 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)isSystemAutoFillBundle_autoFillPanelIdentifiers;
  isSystemAutoFillBundle_autoFillPanelIdentifiers = v0;

}

Class __getSFSafariCredentialClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SafariFoundationLibrary();
  result = objc_getClass("SFSafariCredential");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFSafariCredentialClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSFSafariCredentialClass_block_invoke_cold_1();
    return __getSFAutoFillPasskeyClass_block_invoke(v3);
  }
  return result;
}

Class __getSFAutoFillPasskeyClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SafariFoundationLibrary();
  result = objc_getClass("SFAutoFillPasskey");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFAutoFillPasskeyClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSFAutoFillPasskeyClass_block_invoke_cold_1();
    return (Class)__getSFSuggestedUserProviderClass_block_invoke(v3);
  }
  return result;
}

Class __getSFSuggestedUserProviderClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SafariFoundationLibrary();
  result = objc_getClass("SFSuggestedUserProvider");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSFSuggestedUserProviderClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSFSuggestedUserProviderClass_block_invoke_cold_1();
    return (Class)__getAKAccountManagerClass_block_invoke(v3);
  }
  return result;
}

void __getAKAccountManagerClass_block_invoke(uint64_t a1)
{
  AuthKitLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AKAccountManager");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKAccountManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAKAccountManagerClass_block_invoke_cold_1();
    AuthKitLibrary();
  }
}

void AuthKitLibrary()
{
  void *v0;

  if (!AuthKitLibraryCore_frameworkLibrary)
    AuthKitLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AuthKitLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getAKPrivateEmailControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AuthKitLibrary();
  result = objc_getClass("AKPrivateEmailController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKPrivateEmailControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAKPrivateEmailControllerClass_block_invoke_cold_1();
    return __getAKPrivateEmailContextClass_block_invoke(v3);
  }
  return result;
}

Class __getAKPrivateEmailContextClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  AuthKitLibrary();
  result = objc_getClass("AKPrivateEmailContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAKPrivateEmailContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getAKPrivateEmailContextClass_block_invoke_cold_1();
    return (Class)__getCSFFeatureManagerClass_block_invoke(v3);
  }
  return result;
}

Class __getCSFFeatureManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
  {
    CloudSubscriptionFeaturesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!CloudSubscriptionFeaturesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("CSFFeatureManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getCSFFeatureManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getCSFFeatureManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getMCProfileConnectionClass_block_invoke_0(uint64_t a1)
{
  Class result;

  ManagedConfigurationLibrary_0();
  result = objc_getClass("MCProfileConnection");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getMCProfileConnectionClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getMCProfileConnectionClass_block_invoke_cold_1();
    return (Class)ManagedConfigurationLibrary_0();
  }
  return result;
}

uint64_t ManagedConfigurationLibrary_0()
{
  uint64_t v0;
  void *v2;

  if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
    ManagedConfigurationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = ManagedConfigurationLibraryCore_frameworkLibrary_0;
  if (!ManagedConfigurationLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getLAContextClass_block_invoke_0(uint64_t a1)
{
  Class result;
  void *v3;

  if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
  {
    LocalAuthenticationLibraryCore_frameworkLibrary_0 = _sl_dlopen();
    if (!LocalAuthenticationLibraryCore_frameworkLibrary_0)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("LAContext");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getLAContextClass_block_invoke_cold_1();
    free(v3);
  }
  getLAContextClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void OUTLINED_FUNCTION_0_0(void *a1, int a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  NSObject *v11;

  _os_log_error_impl(a1, v11, OS_LOG_TYPE_ERROR, a4, &buf, 0xCu);
}

id AFCredentialManagerOSLogFacility()
{
  if (AFCredentialManagerOSLogFacility_onceToken != -1)
    dispatch_once(&AFCredentialManagerOSLogFacility_onceToken, &__block_literal_global_3);
  return (id)AFCredentialManagerOSLogFacility_logFacility;
}

id AFLocalizationManagerOSLogFacility()
{
  if (AFLocalizationManagerOSLogFacility_onceToken != -1)
    dispatch_once(&AFLocalizationManagerOSLogFacility_onceToken, &__block_literal_global_3);
  return (id)AFLocalizationManagerOSLogFacility_logFacility;
}

id AFSuggestionGenerationManagerOSLogFacility()
{
  if (AFSuggestionGenerationManagerOSLogFacility_onceToken != -1)
    dispatch_once(&AFSuggestionGenerationManagerOSLogFacility_onceToken, &__block_literal_global_5);
  return (id)AFSuggestionGenerationManagerOSLogFacility_logFacility;
}

uint64_t __getSFSafariCreditCardStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __get_ICProactiveTriggerClass_block_invoke_cold_1(v0);
}

uint64_t __getMCProfileConnectionClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getLAContextClass_block_invoke_cold_1(v0);
}

uint64_t __getLAContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AFCredentialManager obtainApplicationIdentifierFromConnection:].cold.1(v0);
}

uint64_t __getSFAppAutoFillPasskeyProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getSFAppAutoFillOneTimeCodeProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFSafariCredentialStoreClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSafariCredentialStoreClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFAutoFillFeatureManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getSFAutoFillFeatureManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFSafariCredentialClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSafariCredentialClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getSFAutoFillPasskeyClass_block_invoke_cold_1();
}

uint64_t __getSFAutoFillPasskeyClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSFSuggestedUserProviderClass_block_invoke_cold_1(v0);
}

uint64_t __getSFSuggestedUserProviderClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKAccountManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKAccountManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAKPrivateEmailControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAKPrivateEmailControllerClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getAKPrivateEmailContextClass_block_invoke_cold_1();
}

uint64_t __getAKPrivateEmailContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getCSFFeatureManagerClass_block_invoke_cold_1(v0);
}

uint64_t __getCSFFeatureManagerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[AFLocalizationManager accessibilityLabelsForSecureHeaders:secureContents:truncationSentinel:].cold.1(v0);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x24BE04658]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x24BED8448]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x24BDAC7A0](a1, a2, *(_QWORD *)&a3, a4);
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x24BDAD160](__buf, __nbytes);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x24BDADD20](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

