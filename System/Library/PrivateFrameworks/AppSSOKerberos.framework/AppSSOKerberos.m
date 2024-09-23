void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_5(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

id SO_LOG_SOSmartcard()
{
  if (SO_LOG_SOSmartcard_once != -1)
    dispatch_once(&SO_LOG_SOSmartcard_once, &__block_literal_global);
  return (id)SO_LOG_SOSmartcard_log;
}

id SO_LOG_SOKerberosSettingsManager()
{
  if (SO_LOG_SOKerberosSettingsManager_once != -1)
    dispatch_once(&SO_LOG_SOKerberosSettingsManager_once, &__block_literal_global_0);
  return (id)SO_LOG_SOKerberosSettingsManager_log;
}

void sub_215A1DF1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOLDAPHelper()
{
  if (SO_LOG_SOLDAPHelper_once != -1)
    dispatch_once(&SO_LOG_SOLDAPHelper_once, &__block_literal_global_1);
  return (id)SO_LOG_SOLDAPHelper_log;
}

id SO_LOG_SOKerberosServer()
{
  if (SO_LOG_SOKerberosServer_once != -1)
    dispatch_once(&SO_LOG_SOKerberosServer_once, &__block_literal_global_2);
  return (id)SO_LOG_SOKerberosServer_log;
}

void sub_215A1FDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOADSiteDiscovery()
{
  if (SO_LOG_SOADSiteDiscovery_once != -1)
    dispatch_once(&SO_LOG_SOADSiteDiscovery_once, &__block_literal_global_3);
  return (id)SO_LOG_SOADSiteDiscovery_log;
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

void sub_215A20104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_215A208D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id SO_LOG_SOKerberosRealmSettings()
{
  if (SO_LOG_SOKerberosRealmSettings_once != -1)
    dispatch_once(&SO_LOG_SOKerberosRealmSettings_once, &__block_literal_global_4);
  return (id)SO_LOG_SOKerberosRealmSettings_log;
}

void sub_215A22C78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A22D14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_215A22D80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A22F80(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A23134(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A23318(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A234EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A23610(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOKeychainHelper()
{
  if (SO_LOG_SOKeychainHelper_once != -1)
    dispatch_once(&SO_LOG_SOKeychainHelper_once, &__block_literal_global_5);
  return (id)SO_LOG_SOKeychainHelper_log;
}

id SO_LOG_SOKerberosContext()
{
  if (SO_LOG_SOKerberosContext_once != -1)
    dispatch_once(&SO_LOG_SOKerberosContext_once, &__block_literal_global_6);
  return (id)SO_LOG_SOKerberosContext_log;
}

void sub_215A2684C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A26944(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOAsynchronousLDAPOperation()
{
  if (SO_LOG_SOAsynchronousLDAPOperation_once != -1)
    dispatch_once(&SO_LOG_SOAsynchronousLDAPOperation_once, &__block_literal_global_7);
  return (id)SO_LOG_SOAsynchronousLDAPOperation_log;
}

id SO_LOG_SOKerberosExtensionProcess()
{
  if (SO_LOG_SOKerberosExtensionProcess_once != -1)
    dispatch_once(&SO_LOG_SOKerberosExtensionProcess_once, &__block_literal_global_8);
  return (id)SO_LOG_SOKerberosExtensionProcess_log;
}

void sub_215A28F68(_Unwind_Exception *a1)
{
  objc_sync_exit(0);
  _Unwind_Resume(a1);
}

void sub_215A2931C(_Unwind_Exception *a1)
{
  objc_sync_exit(0);
  _Unwind_Resume(a1);
}

uint64_t AuthenticationServicesLibrary()
{
  uint64_t v0;
  void *v2;

  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
    AuthenticationServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = AuthenticationServicesLibraryCore_frameworkLibrary;
  if (!AuthenticationServicesLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

id SO_LOG_SOKerberosHeimdalPluginSettings()
{
  if (SO_LOG_SOKerberosHeimdalPluginSettings_once != -1)
    dispatch_once(&SO_LOG_SOKerberosHeimdalPluginSettings_once, &__block_literal_global_9);
  return (id)SO_LOG_SOKerberosHeimdalPluginSettings_log;
}

void sub_215A2E370(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SOKerberosAuthentication()
{
  if (SO_LOG_SOKerberosAuthentication_once != -1)
    dispatch_once(&SO_LOG_SOKerberosAuthentication_once, &__block_literal_global_121);
  return (id)SO_LOG_SOKerberosAuthentication_log;
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

void sub_215A2F9A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A2FBE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A30610(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_13(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_215A31008(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id SO_LOG_SONetworkIdentity()
{
  if (SO_LOG_SONetworkIdentity_once != -1)
    dispatch_once(&SO_LOG_SONetworkIdentity_once, &__block_literal_global_11);
  return (id)SO_LOG_SONetworkIdentity_log;
}

void sub_215A317CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_215A31DB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

id SO_LOG_SOKerberosFileManager()
{
  if (SO_LOG_SOKerberosFileManager_once != -1)
    dispatch_once(&SO_LOG_SOKerberosFileManager_once, &__block_literal_global_12);
  return (id)SO_LOG_SOKerberosFileManager_log;
}

id SO_LOG_SOKerberosHelper()
{
  if (SO_LOG_SOKerberosHelper_once != -1)
    dispatch_once(&SO_LOG_SOKerberosHelper_once, &__block_literal_global_45);
  return (id)SO_LOG_SOKerberosHelper_log;
}

void sub_215A34634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 144), 8);
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

id SO_LOG_SODNSSRVQuery()
{
  if (SO_LOG_SODNSSRVQuery_once != -1)
    dispatch_once(&SO_LOG_SODNSSRVQuery_once, &__block_literal_global_14);
  return (id)SO_LOG_SODNSSRVQuery_log;
}

void sub_215A34AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

void sub_215A34FEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t ndrdata_get_uint64(unsigned int *a1, _QWORD *a2)
{
  _QWORD *v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t result;

  if (!a1)
    return 1;
  v3 = (_QWORD *)*((_QWORD *)a1 + 2);
  if (!v3)
    return 1;
  v4 = *a1;
  if (!(_DWORD)v4)
    return 1;
  v5 = a1 + 2;
  v6 = *((_QWORD *)a1 + 1);
  result = 1;
  if (v6)
  {
    if (a1 + 20 <= &v5[2 * v4])
    {
      result = 0;
      *a2 = *v3;
      *((_QWORD *)a1 + 2) = v3 + 1;
    }
  }
  return result;
}

uint64_t ndrdata_get_uint32(unsigned int *a1, _DWORD *a2)
{
  _DWORD *v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t result;

  if (!a1)
    return 1;
  v3 = (_DWORD *)*((_QWORD *)a1 + 2);
  if (!v3)
    return 1;
  v4 = *a1;
  if (!(_DWORD)v4)
    return 1;
  v5 = a1 + 2;
  v6 = *((_QWORD *)a1 + 1);
  result = 1;
  if (v6)
  {
    if (a1 + 12 <= &v5[2 * v4])
    {
      result = 0;
      *a2 = *v3;
      *((_QWORD *)a1 + 2) = v3 + 1;
    }
  }
  return result;
}

uint64_t ndrdata_get_uint16(unsigned int *a1, _WORD *a2)
{
  _WORD *v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t result;

  if (!a1)
    return 1;
  v3 = (_WORD *)*((_QWORD *)a1 + 2);
  if (!v3)
    return 1;
  v4 = *a1;
  if (!(_DWORD)v4)
    return 1;
  v5 = a1 + 2;
  v6 = *((_QWORD *)a1 + 1);
  result = 1;
  if (v6)
  {
    if (a1 + 8 <= &v5[2 * v4])
    {
      result = 0;
      *a2 = *v3;
      *((_QWORD *)a1 + 2) = v3 + 1;
    }
  }
  return result;
}

uint64_t ndrdata_get_uint8(unsigned int *a1, _BYTE *a2)
{
  _BYTE *v3;
  uint64_t v4;
  unsigned int *v5;
  uint64_t v6;
  uint64_t result;

  if (!a1)
    return 1;
  v3 = (_BYTE *)*((_QWORD *)a1 + 2);
  if (!v3)
    return 1;
  v4 = *a1;
  if (!(_DWORD)v4)
    return 1;
  v5 = a1 + 2;
  v6 = *((_QWORD *)a1 + 1);
  result = 1;
  if (v6)
  {
    if (a1 + 6 <= &v5[2 * v4])
    {
      result = 0;
      *a2 = *v3;
      ++*((_QWORD *)a1 + 2);
    }
  }
  return result;
}

uint64_t ndrdata_get_buffer(unsigned int *a1, void *__dst, size_t __n)
{
  const void *v3;
  _QWORD *v4;
  uint64_t v5;
  unsigned int *v6;
  uint64_t result;
  uint64_t v8;

  if (!a1)
    return 1;
  v4 = a1 + 4;
  v3 = (const void *)*((_QWORD *)a1 + 2);
  if (!v3)
    return 1;
  v5 = *a1;
  if (!(_DWORD)v5)
    return 1;
  v6 = a1 + 2;
  if (!*((_QWORD *)a1 + 1))
    return 1;
  result = 0xFFFFFFFFLL;
  if (__dst && (_DWORD)__n)
  {
    if (&v4[__n] <= (_QWORD *)&v6[2 * v5])
    {
      v8 = __n;
      memcpy(__dst, v3, __n);
      result = 0;
      *v4 += v8;
      return result;
    }
    return 1;
  }
  return result;
}

uint64_t ndrdata_init(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result;

  result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      result = 0;
      *(_QWORD *)(a1 + 8) = a2;
      *(_QWORD *)(a1 + 16) = a2;
      *(_DWORD *)a1 = a3;
    }
  }
  return result;
}

void free_kerbvalidationinfo(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = (void *)a1[9];
  if (v2)
  {
    free(v2);
    a1[9] = 0;
  }
  v3 = (void *)a1[13];
  if (v3)
  {
    free(v3);
    a1[13] = 0;
  }
  v4 = (void *)a1[17];
  if (v4)
  {
    free(v4);
    a1[17] = 0;
  }
  v5 = (void *)a1[21];
  if (v5)
  {
    free(v5);
    a1[21] = 0;
  }
  v6 = (void *)a1[25];
  if (v6)
  {
    free(v6);
    a1[25] = 0;
  }
  v7 = (void *)a1[29];
  if (v7)
  {
    free(v7);
    a1[29] = 0;
  }
  v8 = (void *)a1[37];
  if (v8)
  {
    free(v8);
    a1[37] = 0;
  }
  v9 = (void *)a1[41];
  if (v9)
  {
    free(v9);
    a1[41] = 0;
  }
  v10 = (void *)a1[33];
  if (v10)
  {
    free(v10);
    a1[33] = 0;
  }
}

uint64_t get_kerbvalidationinfo(uint64_t a1, int a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD v10[3];
  _DWORD count[3];

  memset(count, 0, sizeof(count));
  memset(v10, 0, sizeof(v10));
  result = 0xFFFFFFFFLL;
  if (a1)
  {
    if (a2)
    {
      result = ndrdata_init((uint64_t)v10, a1, a2);
      if ((_DWORD)result != 1)
      {
        result = ndrdata_get_uint64((unsigned int *)v10, &count[1]);
        if ((_DWORD)result != 1)
        {
          result = ndrdata_get_uint64((unsigned int *)v10, &count[1]);
          if ((_DWORD)result != 1)
          {
            result = ndrdata_get_uint32((unsigned int *)v10, count);
            if ((_DWORD)result != 1)
            {
              result = ndrdata_get_uint64((unsigned int *)v10, (_QWORD *)a3);
              if ((_DWORD)result != 1)
              {
                result = ndrdata_get_uint64((unsigned int *)v10, (_QWORD *)(a3 + 8));
                if ((_DWORD)result != 1)
                {
                  result = ndrdata_get_uint64((unsigned int *)v10, (_QWORD *)(a3 + 16));
                  if ((_DWORD)result != 1)
                  {
                    result = ndrdata_get_uint64((unsigned int *)v10, (_QWORD *)(a3 + 24));
                    if ((_DWORD)result != 1)
                    {
                      result = ndrdata_get_uint64((unsigned int *)v10, (_QWORD *)(a3 + 32));
                      if ((_DWORD)result != 1)
                      {
                        result = ndrdata_get_uint64((unsigned int *)v10, (_QWORD *)(a3 + 40));
                        if ((_DWORD)result != 1)
                        {
                          result = get_unicode_string((uint64_t)v10, a3 + 48);
                          if ((_DWORD)result != 1)
                          {
                            result = get_unicode_string((uint64_t)v10, a3 + 80);
                            if ((_DWORD)result != 1)
                            {
                              result = get_unicode_string((uint64_t)v10, a3 + 112);
                              if ((_DWORD)result != 1)
                              {
                                result = get_unicode_string((uint64_t)v10, a3 + 144);
                                if ((_DWORD)result != 1)
                                {
                                  result = get_unicode_string((uint64_t)v10, a3 + 176);
                                  if ((_DWORD)result != 1)
                                  {
                                    result = get_unicode_string((uint64_t)v10, a3 + 208);
                                    if ((_DWORD)result != 1)
                                    {
                                      result = ndrdata_get_uint16((unsigned int *)v10, (_WORD *)(a3 + 240));
                                      if ((_DWORD)result != 1)
                                      {
                                        result = ndrdata_get_uint16((unsigned int *)v10, (_WORD *)(a3 + 242));
                                        if ((_DWORD)result != 1)
                                        {
                                          result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 244));
                                          if ((_DWORD)result != 1)
                                          {
                                            result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 248));
                                            if ((_DWORD)result != 1)
                                            {
                                              result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 252));
                                              if ((_DWORD)result != 1)
                                              {
                                                result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                if ((_DWORD)result != 1)
                                                {
                                                  result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 256));
                                                  if ((_DWORD)result != 1)
                                                  {
                                                    result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                    if ((_DWORD)result != 1)
                                                    {
                                                      result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                      if ((_DWORD)result != 1)
                                                      {
                                                        result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                        if ((_DWORD)result != 1)
                                                        {
                                                          result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                          if ((_DWORD)result != 1)
                                                          {
                                                            result = get_unicode_string((uint64_t)v10, a3 + 272);
                                                            if ((_DWORD)result != 1)
                                                            {
                                                              result = get_unicode_string((uint64_t)v10, a3 + 304);
                                                              if ((_DWORD)result != 1)
                                                              {
                                                                result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                if ((_DWORD)result != 1)
                                                                {
                                                                  result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                  if ((_DWORD)result != 1)
                                                                  {
                                                                    result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                    if ((_DWORD)result != 1)
                                                                    {
                                                                      result = ndrdata_get_uint32((unsigned int *)v10, (_DWORD *)(a3 + 336));
                                                                      if ((_DWORD)result != 1)
                                                                      {
                                                                        result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                        if ((_DWORD)result != 1)
                                                                        {
                                                                          result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                          if ((_DWORD)result != 1)
                                                                          {
                                                                            result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                            if ((_DWORD)result != 1)
                                                                            {
                                                                              result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                              if ((_DWORD)result != 1)
                                                                              {
                                                                                result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                if ((_DWORD)result != 1)
                                                                                {
                                                                                  result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                  if ((_DWORD)result != 1)
                                                                                  {
                                                                                    result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                    if ((_DWORD)result != 1)
                                                                                    {
                                                                                      result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                      if ((_DWORD)result != 1)
                                                                                      {
                                                                                        result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                        if ((_DWORD)result != 1)
                                                                                        {
                                                                                          result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                          if ((_DWORD)result != 1)
                                                                                          {
                                                                                            result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                            if ((_DWORD)result != 1)
                                                                                            {
                                                                                              result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                              if ((_DWORD)result != 1)
                                                                                              {
                                                                                                result = get_unicode_buffer((unsigned int *)v10, a3 + 48);
                                                                                                if ((_DWORD)result != 1)
                                                                                                {
                                                                                                  result = get_unicode_buffer((unsigned int *)v10, a3 + 80);
                                                                                                  if ((_DWORD)result != 1)
                                                                                                  {
                                                                                                    result = get_unicode_buffer((unsigned int *)v10, a3 + 112);
                                                                                                    if ((_DWORD)result != 1)
                                                                                                    {
                                                                                                      result = get_unicode_buffer((unsigned int *)v10, a3 + 144);
                                                                                                      if ((_DWORD)result != 1)
                                                                                                      {
                                                                                                        result = get_unicode_buffer((unsigned int *)v10, a3 + 176);
                                                                                                        if ((_DWORD)result != 1)
                                                                                                        {
                                                                                                          result = get_unicode_buffer((unsigned int *)v10, a3 + 208);
                                                                                                          if ((_DWORD)result != 1)
                                                                                                          {
                                                                                                            result = ndrdata_get_uint32((unsigned int *)v10, count);
                                                                                                            if ((_DWORD)result != 1)
                                                                                                            {
                                                                                                              v7 = count[0];
                                                                                                              if (count[0])
                                                                                                              {
                                                                                                                v8 = (char *)malloc_type_calloc(count[0], 8uLL, 0x100004000313F17uLL);
                                                                                                                v9 = 0;
                                                                                                                while (1)
                                                                                                                {
                                                                                                                  result = ndrdata_get_uint32((unsigned int *)v10, &v8[v9]);
                                                                                                                  if ((_DWORD)result == 1)
                                                                                                                    break;
                                                                                                                  result = ndrdata_get_uint32((unsigned int *)v10, &v8[v9 + 4]);
                                                                                                                  if ((_DWORD)result == 1)
                                                                                                                    break;
                                                                                                                  v9 += 8;
                                                                                                                  if (8 * v7 == v9)
                                                                                                                  {
                                                                                                                    *(_QWORD *)(a3 + 264) = v8;
                                                                                                                    goto LABEL_61;
                                                                                                                  }
                                                                                                                }
                                                                                                              }
                                                                                                              else
                                                                                                              {
LABEL_61:
                                                                                                                result = get_unicode_buffer((unsigned int *)v10, a3 + 272);
                                                                                                                if ((_DWORD)result != 1)
                                                                                                                  return get_unicode_buffer((unsigned int *)v10, a3 + 304) == 1;
                                                                                                              }
                                                                                                            }
                                                                                                          }
                                                                                                        }
                                                                                                      }
                                                                                                    }
                                                                                                  }
                                                                                                }
                                                                                              }
                                                                                            }
                                                                                          }
                                                                                        }
                                                                                      }
                                                                                    }
                                                                                  }
                                                                                }
                                                                              }
                                                                            }
                                                                          }
                                                                        }
                                                                      }
                                                                    }
                                                                  }
                                                                }
                                                              }
                                                            }
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t get_unicode_string(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  if (!*(_QWORD *)(a1 + 16))
    return 0xFFFFFFFFLL;
  result = ndrdata_get_uint16((unsigned int *)a1, (_WORD *)a2);
  if ((_DWORD)result != 1)
  {
    result = ndrdata_get_uint16((unsigned int *)a1, (_WORD *)(a2 + 2));
    if ((_DWORD)result != 1)
      return ndrdata_get_uint32((unsigned int *)a1, (_DWORD *)(a2 + 4));
  }
  return result;
}

uint64_t get_unicode_buffer(unsigned int *a1, uint64_t a2)
{
  const void **v2;
  uint64_t result;
  uint64_t v6;
  int v7;
  int v8;
  size_t v9;
  void *v10;
  __int16 v11;

  v11 = 0;
  v2 = (const void **)(a1 + 4);
  if (!*((_QWORD *)a1 + 2))
    return 0xFFFFFFFFLL;
  result = ndrdata_get_uint32(a1, (_DWORD *)(a2 + 16));
  if ((_DWORD)result != 1)
  {
    result = ndrdata_get_uint32(a1, (_DWORD *)(a2 + 12));
    if ((_DWORD)result != 1)
    {
      result = ndrdata_get_uint32(a1, (_DWORD *)(a2 + 8));
      if ((_DWORD)result != 1)
      {
        if (!*v2)
          return 1;
        v6 = *a1;
        if (!(_DWORD)v6 || !*((_QWORD *)a1 + 1))
          return 1;
        v7 = *(_DWORD *)(a2 + 8);
        if (v7)
        {
          v8 = 2 * v7;
          if (&v2[v8] <= (const void **)&a1[2 * v6 + 2])
          {
            v9 = v8;
            v10 = malloc_type_calloc(1uLL, v8 | 1, 0xED4E4555uLL);
            *(_QWORD *)(a2 + 24) = v10;
            memcpy(v10, *v2, v9);
            *v2 = (char *)*v2 + v9;
            if ((*(_BYTE *)(a2 + 8) & 1) != 0)
              return ndrdata_get_uint16(a1, &v11);
            else
              return 0;
          }
          return 1;
        }
        *(_QWORD *)(a2 + 24) = 0;
        return 0xFFFFFFFFLL;
      }
    }
  }
  return result;
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFUUIDRef CFUUIDCreateFromString(CFAllocatorRef alloc, CFStringRef uuidStr)
{
  return (CFUUIDRef)MEMORY[0x24BDBC8D8](alloc, uuidStr);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x24BDBC8E8](alloc, uuid);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x24BDBC908](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

gss_cred_id_t GSSCreateCredentialFromUUID(CFUUIDRef uuid)
{
  return (gss_cred_id_t)MEMORY[0x24BDD1A08](uuid);
}

CFErrorRef GSSCreateError(gss_const_OID mech, OM_uint32 major_status, OM_uint32 minor_status)
{
  return (CFErrorRef)MEMORY[0x24BDD1A10](mech, *(_QWORD *)&major_status, *(_QWORD *)&minor_status);
}

gss_name_t GSSCreateName(CFTypeRef name, gss_const_OID name_type, CFErrorRef *error)
{
  return (gss_name_t)MEMORY[0x24BDD1A18](name, name_type, error);
}

gss_name_t GSSCredentialCopyName(gss_cred_id_t cred)
{
  return (gss_name_t)MEMORY[0x24BDD1A20](cred);
}

CFUUIDRef GSSCredentialCopyUUID(gss_cred_id_t credential)
{
  return (CFUUIDRef)MEMORY[0x24BDD1A28](credential);
}

OM_uint32 GSSCredentialGetLifetime(gss_cred_id_t cred)
{
  return MEMORY[0x24BDD1A30](cred);
}

CFStringRef GSSNameCreateDisplayString(gss_name_t name)
{
  return (CFStringRef)MEMORY[0x24BDD1A38](name);
}

uint64_t HeimCredCopyAttributes()
{
  return MEMORY[0x24BE4C0E0]();
}

uint64_t HeimCredCopyQuery()
{
  return MEMORY[0x24BE4C0F0]();
}

uint64_t HeimCredCreate()
{
  return MEMORY[0x24BE4C0F8]();
}

uint64_t HeimCredDelete()
{
  return MEMORY[0x24BE4C100]();
}

uint64_t HeimCredDeleteQuery()
{
  return MEMORY[0x24BE4C110]();
}

uint64_t HeimCredGetUUID()
{
  return MEMORY[0x24BE4C128]();
}

uint64_t HeimCredSetAttribute()
{
  return MEMORY[0x24BE4C140]();
}

uint64_t HeimCredSetImpersonateAuditToken()
{
  return MEMORY[0x24BE4C148]();
}

uint64_t HeimCredSetImpersonateBundle()
{
  return MEMORY[0x24BE4C150]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x24BDF5668](store, keys, patterns);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x24BDF5678](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x24BDF56B0](allocator, domain, serviceID, entity);
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x24BDE87A0](allocator, protection, flags, error);
}

uint64_t SecCertificateCopyIssuerSummary()
{
  return MEMORY[0x24BDE8880]();
}

uint64_t SecCertificateCopyNTPrincipalNames()
{
  return MEMORY[0x24BDE8890]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x24BDE8A48](identityRef, certificateRef);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A70](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x24BDE8A78](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x24BDE8A80](query);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __ApplePrivate_gsskrb5_set_default_realm()
{
  return MEMORY[0x24BDD1A58]();
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

uint64_t decode_Ticket()
{
  return MEMORY[0x24BE4C1C0]();
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
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

uint64_t free_Ticket()
{
  return MEMORY[0x24BE4C1C8]();
}

OM_uint32 gss_aapl_change_password(gss_name_t name, gss_const_OID mech, CFDictionaryRef attributes, CFErrorRef *error)
{
  return MEMORY[0x24BDD1AB0](name, mech, attributes, error);
}

OM_uint32 gss_aapl_initial_cred(gss_name_t desired_name, gss_const_OID desired_mech, CFDictionaryRef attributes, gss_cred_id_t *output_cred_handle, CFErrorRef *error)
{
  return MEMORY[0x24BDD1AB8](desired_name, desired_mech, attributes, output_cred_handle, error);
}

OM_uint32 gss_acquire_cred(OM_uint32 *minor_status, gss_name_t desired_name, OM_uint32 time_req, gss_OID_set desired_mechs, gss_cred_usage_t cred_usage, gss_cred_id_t *output_cred_handle, gss_OID_set *actual_mechs, OM_uint32 *time_rec)
{
  return MEMORY[0x24BDD1AC0](minor_status, desired_name, *(_QWORD *)&time_req, desired_mechs, *(_QWORD *)&cred_usage, output_cred_handle, actual_mechs, time_rec);
}

OM_uint32 gss_add_oid_set_member(OM_uint32 *minor_status, gss_const_OID member_oid, gss_OID_set *oid_set)
{
  return MEMORY[0x24BDD1AC8](minor_status, member_oid, oid_set);
}

OM_uint32 gss_create_empty_oid_set(OM_uint32 *minor_status, gss_OID_set *oid_set)
{
  return MEMORY[0x24BDD1AD0](minor_status, oid_set);
}

OM_uint32 gss_destroy_cred(OM_uint32 *min_stat, gss_cred_id_t *cred_handle)
{
  return MEMORY[0x24BDD1AE8](min_stat, cred_handle);
}

OM_uint32 gss_import_name(OM_uint32 *minor_status, gss_buffer_t input_name_buffer, gss_const_OID input_name_type, gss_name_t *output_name)
{
  return MEMORY[0x24BDD1AF8](minor_status, input_name_buffer, input_name_type, output_name);
}

OM_uint32 gss_init_sec_context(OM_uint32 *minor_status, gss_cred_id_t initiator_cred_handle, gss_ctx_id_t *context_handle, gss_name_t target_name, gss_OID input_mech_type, OM_uint32 req_flags, OM_uint32 time_req, gss_channel_bindings_t input_chan_bindings, gss_buffer_t input_token, gss_OID *actual_mech_type, gss_buffer_t output_token, OM_uint32 *ret_flags, OM_uint32 *time_rec)
{
  return MEMORY[0x24BDD1B00](minor_status, initiator_cred_handle, context_handle, target_name, input_mech_type, *(_QWORD *)&req_flags, *(_QWORD *)&time_req, input_chan_bindings);
}

OM_uint32 gss_inquire_cred(OM_uint32 *minor_status, gss_cred_id_t cred_handle, gss_name_t *name_ret, OM_uint32 *lifetime, gss_cred_usage_t *cred_usage, gss_OID_set *mechanisms)
{
  return MEMORY[0x24BDD1B08](minor_status, cred_handle, name_ret, lifetime, cred_usage, mechanisms);
}

OM_uint32 gss_iter_creds(OM_uint32 *min_stat, OM_uint32 flags, gss_const_OID mech, void *useriter)
{
  return MEMORY[0x24BDD1B18](min_stat, *(_QWORD *)&flags, mech, useriter);
}

OM_uint32 gss_release_buffer(OM_uint32 *minor_status, gss_buffer_t buffer)
{
  return MEMORY[0x24BDD1B38](minor_status, buffer);
}

OM_uint32 gss_release_cred(OM_uint32 *minor_status, gss_cred_id_t *cred_handle)
{
  return MEMORY[0x24BDD1B48](minor_status, cred_handle);
}

OM_uint32 gss_release_name(OM_uint32 *minor_status, gss_name_t *input_name)
{
  return MEMORY[0x24BDD1B50](minor_status, input_name);
}

OM_uint32 gss_release_oid_set(OM_uint32 *minor_status, gss_OID_set *set)
{
  return MEMORY[0x24BDD1B58](minor_status, set);
}

char *__cdecl inet_ntoa(in_addr a1)
{
  return (char *)MEMORY[0x24BDAE8A8](*(_QWORD *)&a1.s_addr);
}

uint64_t krb5_cc_clear_mcred()
{
  return MEMORY[0x24BE4C498]();
}

krb5_error_code krb5_cc_close(krb5_context context, krb5_ccache cache)
{
  return MEMORY[0x24BE4C4A0](context, cache);
}

krb5_error_code krb5_cc_get_principal(krb5_context context, krb5_ccache cache, krb5_principal *principal)
{
  return MEMORY[0x24BE4C500](context, cache, principal);
}

uint64_t krb5_cc_resolve_by_uuid()
{
  return MEMORY[0x24BE4C550]();
}

krb5_error_code krb5_cc_retrieve_cred(krb5_context context, krb5_ccache cache, krb5_flags flags, krb5_creds *mcreds, krb5_creds *creds)
{
  return MEMORY[0x24BE4C558](context, cache, *(_QWORD *)&flags, mcreds, creds);
}

uint64_t krb5_data_free()
{
  return MEMORY[0x24BE4C648]();
}

uint64_t krb5_data_zero()
{
  return MEMORY[0x24BE4C650]();
}

uint64_t krb5_decrypt_ticket()
{
  return MEMORY[0x24BE4C678]();
}

void krb5_free_context(krb5_context a1)
{
  MEMORY[0x24BE4C6D0](a1);
}

void krb5_free_cred_contents(krb5_context a1, krb5_creds *a2)
{
  MEMORY[0x24BE4C6D8](a1, a2);
}

void krb5_free_creds(krb5_context a1, krb5_creds *a2)
{
  MEMORY[0x24BE4C6E0](a1, a2);
}

void krb5_free_principal(krb5_context a1, krb5_principal a2)
{
  MEMORY[0x24BE4C708](a1, a2);
}

void krb5_free_ticket(krb5_context a1, krb5_ticket *a2)
{
  MEMORY[0x24BE4C710](a1, a2);
}

uint64_t krb5_get_creds()
{
  return MEMORY[0x24BE4C728]();
}

uint64_t krb5_get_creds_opt_add_options()
{
  return MEMORY[0x24BE4C730]();
}

uint64_t krb5_get_creds_opt_alloc()
{
  return MEMORY[0x24BE4C738]();
}

uint64_t krb5_get_creds_opt_free()
{
  return MEMORY[0x24BE4C740]();
}

uint64_t krb5_get_creds_opt_set_impersonate()
{
  return MEMORY[0x24BE4C748]();
}

uint64_t krb5_get_creds_opt_set_ticket()
{
  return MEMORY[0x24BE4C750]();
}

const char *__cdecl krb5_get_error_message(krb5_context a1, krb5_error_code a2)
{
  return (const char *)MEMORY[0x24BE4C768](a1, *(_QWORD *)&a2);
}

krb5_error_code krb5_get_init_creds_opt_alloc(krb5_context context, krb5_get_init_creds_opt **opt)
{
  return MEMORY[0x24BE4C780](context, opt);
}

void krb5_get_init_creds_opt_free(krb5_context context, krb5_get_init_creds_opt *opt)
{
  MEMORY[0x24BE4C788](context, opt);
}

uint64_t krb5_get_init_creds_opt_set_default_flags()
{
  return MEMORY[0x24BE4C798]();
}

void krb5_get_init_creds_opt_set_forwardable(krb5_get_init_creds_opt *opt, int forwardable)
{
  MEMORY[0x24BE4C7A0](opt, *(_QWORD *)&forwardable);
}

uint64_t krb5_get_init_creds_opt_set_pac_request()
{
  return MEMORY[0x24BE4C7A8]();
}

uint64_t krb5_get_init_creds_opt_set_win2k()
{
  return MEMORY[0x24BE4C7D0]();
}

krb5_error_code krb5_get_init_creds_password(krb5_context context, krb5_creds *creds, krb5_principal client, char *password, krb5_prompter_fct prompter, void *data, krb5_deltat start_time, char *in_tkt_service, krb5_get_init_creds_opt *k5_gic_options)
{
  return MEMORY[0x24BE4C7D8](context, creds, client, password, prompter, data, *(_QWORD *)&start_time, in_tkt_service);
}

krb5_error_code krb5_init_context(krb5_context *a1)
{
  return MEMORY[0x24BE4C810](a1);
}

uint64_t krb5_make_principal()
{
  return MEMORY[0x24BE4C908]();
}

uint64_t krb5_pac_free()
{
  return MEMORY[0x24BE4C930]();
}

uint64_t krb5_pac_get_buffer()
{
  return MEMORY[0x24BE4C938]();
}

uint64_t krb5_pac_parse()
{
  return MEMORY[0x24BE4C940]();
}

uint64_t krb5_pac_verify()
{
  return MEMORY[0x24BE4C948]();
}

krb5_error_code krb5_parse_name(krb5_context a1, const char *a2, krb5_principal *a3)
{
  return MEMORY[0x24BE4C950](a1, a2, a3);
}

krb5_error_code krb5_parse_name_flags(krb5_context a1, const char *a2, int a3, krb5_principal *a4)
{
  return MEMORY[0x24BE4C958](a1, a2, *(_QWORD *)&a3, a4);
}

uint64_t krb5_principal_get_realm()
{
  return MEMORY[0x24BE4C978]();
}

uint64_t krb5_ticket_get_authorization_data_type()
{
  return MEMORY[0x24BE4CB68]();
}

uint64_t ldap_connection_add_credential()
{
  return MEMORY[0x24BE07998]();
}

uint64_t ldap_connection_create_with_hostname()
{
  return MEMORY[0x24BE079A0]();
}

uint64_t ldap_connection_create_with_socket()
{
  return MEMORY[0x24BE079A8]();
}

uint64_t ldap_connection_create_with_socket_and_hostname()
{
  return MEMORY[0x24BE079B0]();
}

uint64_t ldap_connection_disconnect()
{
  return MEMORY[0x24BE079C0]();
}

uint64_t ldap_connection_query_create()
{
  return MEMORY[0x24BE079C8]();
}

uint64_t ldap_connection_set_disconnect_handler()
{
  return MEMORY[0x24BE079D8]();
}

uint64_t ldap_connection_set_source_application_by_bundle()
{
  return MEMORY[0x24BE079E0]();
}

uint64_t ldap_connection_set_tls()
{
  return MEMORY[0x24BE079E8]();
}

uint64_t ldap_connection_start()
{
  return MEMORY[0x24BE079F0]();
}

uint64_t ldap_operation_copy_error_string()
{
  return MEMORY[0x24BE07A00]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint64_t ne_session_cancel()
{
  return MEMORY[0x24BDAF028]();
}

uint64_t ne_session_create()
{
  return MEMORY[0x24BDAF030]();
}

uint64_t ne_session_get_status()
{
  return MEMORY[0x24BDAF040]();
}

uint64_t ne_session_release()
{
  return MEMORY[0x24BDAF050]();
}

uint64_t ne_session_set_event_handler()
{
  return MEMORY[0x24BDAF060]();
}

uint64_t ne_session_start()
{
  return MEMORY[0x24BDAF070]();
}

uint64_t ne_session_status_to_string()
{
  return MEMORY[0x24BDAF078]();
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
}

uint64_t nw_array_apply()
{
  return MEMORY[0x24BDE0A28]();
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x24BDE0AF8](connection);
}

uint64_t nw_connection_copy_connected_remote_endpoint()
{
  return MEMORY[0x24BDE0B28]();
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x24BDE0B68](endpoint, parameters);
}

uint64_t nw_connection_get_connected_socket()
{
  return MEMORY[0x24BDE0BB0]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x24BDE0C98](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x24BDE0CB0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x24BDE0CD0](connection);
}

uint64_t nw_endpoint_copy_parent_endpoint()
{
  return MEMORY[0x24BDE0E48]();
}

nw_endpoint_t nw_endpoint_create_host(const char *hostname, const char *port)
{
  return (nw_endpoint_t)MEMORY[0x24BDE0E88](hostname, port);
}

uint64_t nw_endpoint_create_host_with_numeric_port()
{
  return MEMORY[0x24BDE0E98]();
}

uint64_t nw_endpoint_create_srv()
{
  return MEMORY[0x24BDE0EA8]();
}

const char *__cdecl nw_endpoint_get_hostname(nw_endpoint_t endpoint)
{
  return (const char *)MEMORY[0x24BDE0F20](endpoint);
}

uint16_t nw_endpoint_get_port(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F40](endpoint);
}

nw_endpoint_type_t nw_endpoint_get_type(nw_endpoint_t endpoint)
{
  return MEMORY[0x24BDE0F50](endpoint);
}

const char *__cdecl nw_interface_get_name(nw_interface_t interface)
{
  return (const char *)MEMORY[0x24BDE13C0](interface);
}

nw_interface_type_t nw_interface_get_type(nw_interface_t interface)
{
  return MEMORY[0x24BDE13D8](interface);
}

nw_parameters_t nw_parameters_create(void)
{
  return (nw_parameters_t)MEMORY[0x24BDE1558]();
}

uint64_t nw_parameters_create_legacy_tcp_socket()
{
  return MEMORY[0x24BDE1570]();
}

nw_parameters_t nw_parameters_create_secure_tcp(nw_parameters_configure_protocol_block_t configure_tls, nw_parameters_configure_protocol_block_t configure_tcp)
{
  return (nw_parameters_t)MEMORY[0x24BDE1588](configure_tls, configure_tcp);
}

uint64_t nw_parameters_set_required_netagent_classes()
{
  return MEMORY[0x24BDE1750]();
}

uint64_t nw_parameters_set_source_application()
{
  return MEMORY[0x24BDE1770]();
}

uint64_t nw_parameters_set_source_application_by_bundle_id()
{
  return MEMORY[0x24BDE1778]();
}

uint64_t nw_parameters_set_traffic_class()
{
  return MEMORY[0x24BDE1790]();
}

uint64_t nw_path_copy_interface()
{
  return MEMORY[0x24BDE17D8]();
}

uint64_t nw_path_create_evaluator_for_endpoint()
{
  return MEMORY[0x24BDE17F0]();
}

uint64_t nw_path_evaluator_copy_path()
{
  return MEMORY[0x24BDE1828]();
}

nw_path_status_t nw_path_get_status(nw_path_t path)
{
  return MEMORY[0x24BDE1938](path);
}

uint64_t nw_path_get_vpn_config_id()
{
  return MEMORY[0x24BDE1958]();
}

uint64_t nw_path_is_per_app_vpn()
{
  return MEMORY[0x24BDE19E0]();
}

uint64_t nw_resolver_cancel()
{
  return MEMORY[0x24BDE2398]();
}

uint64_t nw_resolver_create_with_path()
{
  return MEMORY[0x24BDE2470]();
}

uint64_t nw_resolver_set_update_handler()
{
  return MEMORY[0x24BDE2488]();
}

uint64_t nwi_ifstate_get_flags()
{
  return MEMORY[0x24BDAF1B0]();
}

uint64_t nwi_ifstate_get_signature()
{
  return MEMORY[0x24BDAF1D8]();
}

uint64_t nwi_ifstate_get_vpn_server()
{
  return MEMORY[0x24BDAF1E0]();
}

uint64_t nwi_state_copy()
{
  return MEMORY[0x24BDAF1E8]();
}

uint64_t nwi_state_get_ifstate()
{
  return MEMORY[0x24BDAF200]();
}

uint64_t nwi_state_release()
{
  return MEMORY[0x24BDAF220]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
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

void uuid_unparse_upper(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x24BDB0348](uu, out);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB0640](objects, count);
}

void xpc_array_set_string(xpc_object_t xarray, size_t index, const char *string)
{
  MEMORY[0x24BDB06C0](xarray, index, string);
}

