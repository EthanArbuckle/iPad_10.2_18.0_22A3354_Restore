id OUTLINED_FUNCTION_13_0(uint64_t a1)
{
  return objc_loadWeakRetained((id *)(a1 + 48));
}

uint64_t OUTLINED_FUNCTION_9_0(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_4_0(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_5_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_6_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

id TK_LOG_sepkey()
{
  if (TK_LOG_sepkey_once != -1)
    dispatch_once(&TK_LOG_sepkey_once, &__block_literal_global_101);
  return (id)TK_LOG_sepkey_log;
}

id TK_LOG_sepkey_0()
{
  if (TK_LOG_sepkey_once_0 != -1)
    dispatch_once(&TK_LOG_sepkey_once_0, &__block_literal_global_335);
  return (id)TK_LOG_sepkey_log_0;
}

void sub_1B976C12C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B976C280(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B976CDF4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B976DBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id provideEndpoint(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  int v20;
  NSObject *v21;
  void *v22;

  if (runningInOsxSystemContext_onceToken != -1)
    dispatch_once(&runningInOsxSystemContext_onceToken, &__block_literal_global_12);
  LA_LOG_EndpointProvider();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    provideEndpoint_cold_3(v2, v3, v4, v5, v6, v7, v8, v9);

  if (!runningInOsxSystemContext_runningInOsxSystemContext)
  {
    if (runningInLoginWindowContext_onceToken != -1)
      dispatch_once(&runningInLoginWindowContext_onceToken, &__block_literal_global_14);
    LA_LOG_EndpointProvider();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      provideEndpoint_cold_2(v10, v11, v12, v13, v14, v15, v16, v17);

    if (!runningInLoginWindowContext_runningInLoginWindowContext)
      goto LABEL_19;
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bundleIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v19, "hasPrefix:", CFSTR("com.apple.SecurityAgent")) & 1) != 0
    || (objc_msgSend(v19, "hasPrefix:", CFSTR("com.apple.authorizationhost")) & 1) != 0)
  {
    v20 = 1;
  }
  else
  {
    v20 = objc_msgSend(v19, "hasPrefix:", CFSTR("com.apple.AppSSOAgent"));
  }
  LA_LOG_EndpointProvider();
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    provideEndpoint_cold_1((uint64_t)v19, v20, v21);

  if (v20)
  {
    provideEndpointWithUID(a1, 0xFFFFFFFFLL);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_19:
    v22 = 0;
  }
  return v22;
}

void sub_1B976E1F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id TK_LOG_client()
{
  if (TK_LOG_client_once != -1)
    dispatch_once(&TK_LOG_client_once, &__block_literal_global_59);
  return (id)TK_LOG_client_log;
}

id TK_LOG_client_0()
{
  if (TK_LOG_client_once_0 != -1)
    dispatch_once(&TK_LOG_client_once_0, &__block_literal_global_9);
  return (id)TK_LOG_client_log_0;
}

id TK_LOG_client_1()
{
  if (TK_LOG_client_once_1 != -1)
    dispatch_once(&TK_LOG_client_once_1, &__block_literal_global_181);
  return (id)TK_LOG_client_log_1;
}

id LA_LOG_EndpointProvider()
{
  if (LA_LOG_EndpointProvider_once != -1)
    dispatch_once(&LA_LOG_EndpointProvider_once, &__block_literal_global_9);
  return (id)LA_LOG_EndpointProvider_log;
}

uint64_t ioKitTransport(uint64_t *a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  int v18;
  const char *v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = 136315394;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v18, 0x16u);
  }
  if (a1)
  {
    v14 = init();
    v15 = 70;
    if ((_DWORD)v14)
    {
      v16 = v14;
    }
    else
    {
      v16 = performCommand(*a1, a2, a3, a4, a5, a6, a7);
      if ((_DWORD)v16)
        v15 = 70;
      else
        v15 = 10;
    }
  }
  else
  {
    v15 = 70;
    v16 = 4294967293;
  }
  if (v15 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v18 = 136315650;
    v19 = "ACMLib";
    v20 = 2080;
    v21 = "ioKitTransport";
    v22 = 2048;
    v23 = (int)v16;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v18, 0x20u);
  }
  return v16;
}

uint64_t performCommand(uint64_t a1, int a2, char a3, const void *a4, size_t a5, void *a6, size_t *a7)
{
  _BYTE *v14;
  void *v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  size_t v19;
  unsigned int v20;
  size_t v22;
  size_t inputStructCnt;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  _BYTE v29[10];
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  inputStructCnt = 0;
  v14 = LibCall_BuildCommand(a2, 0, a3, a4, a5, &inputStructCnt);
  if (v14)
  {
    v15 = v14;
    if (!a6 && a7)
    {
      v18 = 4294967293;
    }
    else
    {
      if (a7)
        v16 = *a7;
      else
        v16 = 0;
      v22 = v16;
      v17 = IOConnectCallStructMethod(_connect, 0, v14, inputStructCnt, a6, &v22);
      v18 = v17;
      if (a1)
        LODWORD(a1) = *(_DWORD *)(a1 + 16);
      if ((_DWORD)v17)
      {
        if (_logLevel <= 0x46u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136316418;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          v30 = 1024;
          v31 = v18;
          v32 = 1024;
          v33 = v18;
          _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> err 0x%x (%d).\n", buf, 0x2Eu);
        }
      }
      else
      {
        if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315906;
          v25 = "ACMLib";
          v26 = 2080;
          v27 = "performCommand";
          v28 = 1024;
          *(_DWORD *)v29 = a2;
          *(_WORD *)&v29[4] = 1024;
          *(_DWORD *)&v29[6] = a1;
          _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: cmd(%u) on CS[%u] -> ok.\n", buf, 0x22u);
        }
        v18 = 0;
        if (a7)
          *a7 = v22;
      }
    }
    v19 = inputStructCnt;
    acm_mem_free_info("<data>", v15, inputStructCnt, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 134, "performCommand");
    acm_mem_free_data(v15, v19);
    if ((_DWORD)v18)
      v20 = 70;
    else
      v20 = 10;
  }
  else
  {
    v20 = 70;
    v18 = 4294967291;
  }
  if (v20 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v25 = "ACMLib";
    v26 = 2080;
    v27 = "performCommand";
    v28 = 2048;
    *(_QWORD *)v29 = (int)v18;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v18;
}

_BYTE *LibCall_BuildCommand(char a1, char a2, char a3, const void *a4, size_t a5, _QWORD *a6)
{
  _BYTE *v12;
  BOOL v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_BuildCommand");
  v12 = 0;
  if (a5)
    v13 = a4 == 0;
  else
    v13 = 0;
  if (!v13 && a6)
  {
    if (a5 >= 0xFFFFFFFFFFFFFFF8)
    {
      v12 = 0;
    }
    else
    {
      v12 = acm_mem_alloc_data(a5 + 8);
      acm_mem_alloc_info("<data>", v12, a5 + 8, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 22, "LibCall_BuildCommand");
      if (v12)
      {
        *a6 = a5 + 8;
        *(_DWORD *)v12 = 1396920900;
        v12[4] = a1;
        v12[5] = a2;
        v12[6] = a3;
        if (a5)
          memcpy(v12 + 8, a4, a5);
      }
    }
  }
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: returning.\n", "ACM", "LibCall_BuildCommand");
  return v12;
}

void acm_mem_free_data(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_2 - __n;
    if (_allocatedMem_2 < __n)
      v4 = 0;
    _allocatedMem_2 = v4;
  }
}

void *acm_mem_alloc_data(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xCB62F0E9uLL);
  if (result)
    _allocatedMem_2 += size;
  return result;
}

const char *acm_mem_free_info(const char *result, const void *a2, unint64_t a3, const char *a4, int a5, const char *a6)
{
  uint64_t v6;
  const char *v7;
  const char *v8;
  const char *v9;

  if (a2)
  {
    v6 = _allocatedMem_0 - a3;
    if (_allocatedMem_0 < a3)
      v6 = 0;
    _allocatedMem_0 = v6;
  }
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v7 = "NULL";
    if (result)
      v8 = result;
    else
      v8 = "NULL";
    if (a4)
      v9 = a4;
    else
      v9 = "NULL";
    if (a6)
      v7 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_free_info", v8, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v9, a5, v7);
  }
  return result;
}

const char *acm_mem_alloc_info(const char *result, const void *a2, uint64_t a3, const char *a4, int a5, const char *a6)
{
  const char *v6;
  const char *v7;
  const char *v8;

  if (a2)
    _allocatedMem_0 += a3;
  if (gACMLoggingLevel <= 0x1Eu)
  {
    v6 = "NULL";
    if (result)
      v7 = result;
    else
      v7 = "NULL";
    if (a4)
      v8 = a4;
    else
      v8 = "NULL";
    if (a6)
      v6 = a6;
    return (const char *)printf("%s: %s: mem: type=%s ptr=%p size=%u (total=%u raw=%u data=%u types=%u) %s:%d (%s).\n", "ACM", "acm_mem_alloc_info", v7, a2, a3, _allocatedMem_0, 0, _allocatedMem_2, _allocatedMem_3, v8, a5, v6);
  }
  return result;
}

uint64_t init()
{
  uint64_t v0;
  mach_port_t v1;
  const __CFDictionary *v2;
  io_service_t MatchingService;
  io_object_t v4;
  unsigned int v5;
  int v7;
  const char *v8;
  __int16 v9;
  const char *v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 136315394;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v7, 0x16u);
  }
  if ((_initialized & 1) != 0)
  {
    v0 = 0;
  }
  else
  {
    v1 = *MEMORY[0x1E0CBBAB8];
    v2 = IOServiceMatching("AppleCredentialManager");
    MatchingService = IOServiceGetMatchingService(v1, v2);
    if (!MatchingService)
    {
      v5 = 70;
      v0 = 4294967291;
      goto LABEL_10;
    }
    v4 = MatchingService;
    v0 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, (io_connect_t *)&_connect);
    if ((_DWORD)v0)
    {
      v5 = 70;
      goto LABEL_10;
    }
    IOObjectRelease(v4);
    _initialized = 1;
  }
  v5 = 10;
LABEL_10:
  if (v5 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v7 = 136315650;
    v8 = "ACMLib";
    v9 = 2080;
    v10 = "init";
    v11 = 2048;
    v12 = (int)v0;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v7, 0x20u);
  }
  return v0;
}

void sub_1B976F33C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id TK_LOG_token()
{
  if (TK_LOG_token_once != -1)
    dispatch_once(&TK_LOG_token_once, &__block_literal_global_264);
  return (id)TK_LOG_token_log;
}

void sub_1B976FA3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B976FF5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9770370(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9770628(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B9770A20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9770EA0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B9771288(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B9771484(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B977166C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B9771818(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
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

TKTokenAccessDBBackedByUserDefaults *TKTokenAccessDBCreate()
{
  return objc_alloc_init(TKTokenAccessDBBackedByUserDefaults);
}

void sub_1B97727E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9772B30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;
  uint64_t v17;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v17 - 96), 8);
  _Unwind_Resume(a1);
}

id TK_LOG_smartcard()
{
  if (TK_LOG_smartcard_once != -1)
    dispatch_once(&TK_LOG_smartcard_once, &__block_literal_global_715);
  return (id)TK_LOG_smartcard_log;
}

void sub_1B9772E18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9772F50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
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

void sub_1B9773258(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9773384(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B97735EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  void *v17;

  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_1B9773A48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9773AFC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9773DF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9774148(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1B977420C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B97747D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B9774F78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B977622C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1B9776D4C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9777D70(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1B9778428(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B97786CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_15(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x1Cu);
}

void sub_1B977CE9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,char a61,uint64_t a62,uint64_t a63)
{
  char a65;
  char a71;

  _Block_object_dispose(&a61, 8);
  _Block_object_dispose(&a65, 8);
  _Block_object_dispose(&a71, 8);
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

id TK_LOG_tokencfg()
{
  if (TK_LOG_tokencfg_once != -1)
    dispatch_once(&TK_LOG_tokencfg_once, &__block_literal_global_196);
  return (id)TK_LOG_tokencfg_log;
}

void sub_1B977DC18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B977DD94(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B977E470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1B977E628(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B977EBEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B977F184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B977F6F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TK_LOG_token_0()
{
  if (TK_LOG_token_once_0 != -1)
    dispatch_once(&TK_LOG_token_once_0, &__block_literal_global_391);
  return (id)TK_LOG_token_log_0;
}

void sub_1B9780274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B978056C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9780B2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9780E00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1B9780F38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9781004(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9781FBC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  objc_destroyWeak((id *)(v1 - 152));
  _Unwind_Resume(a1);
}

void sub_1B9782DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44,uint64_t a45,uint64_t a46,uint64_t a47,char a48)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose(&a48, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_14(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1B9783F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B97840B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, os_activity_scope_state_s a9)
{
  os_activity_scope_leave(&a9);
  _Unwind_Resume(a1);
}

void sub_1B97842E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B9784D04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B9785360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_16_1()
{
  void *v0;

  return objc_msgSend(v0, "accessControl");
}

void sub_1B9788DA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
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

void sub_1B9789A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TK_LOG_token_1()
{
  if (TK_LOG_token_once_1 != -1)
    dispatch_once(&TK_LOG_token_once_1, &__block_literal_global_8);
  return (id)TK_LOG_token_log_1;
}

void sub_1B978B6A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getBSAuditTokenClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  __int128 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  if (!BaseBoardLibraryCore_frameworkLibrary)
  {
    v4 = xmmword_1E7089FB8;
    v5 = 0;
    BaseBoardLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!BaseBoardLibraryCore_frameworkLibrary)
    __getBSAuditTokenClass_block_invoke_cold_1(&v3);
  result = objc_getClass("BSAuditToken");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBSAuditTokenClass_block_invoke_cold_2();
  getBSAuditTokenClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

id TK_LOG_token_2()
{
  if (TK_LOG_token_once_2 != -1)
    dispatch_once(&TK_LOG_token_once_2, &__block_literal_global_10);
  return (id)TK_LOG_token_log_2;
}

TKTokenAccessUserPromptRemoteAlertSB *TKTokenAccessUserPromptCreate()
{
  TKTokenAccessUserPromptRemoteAlertSB *v0;

  if (+[TKTokenAccessUserPromptRemoteAlertSB isAvailable](TKTokenAccessUserPromptRemoteAlertSB, "isAvailable"))
  {
    v0 = objc_alloc_init(TKTokenAccessUserPromptRemoteAlertSB);
  }
  else
  {
    v0 = -[TKTokenAccessUserPromptNoop initWithPreflightStatus:]([TKTokenAccessUserPromptNoop alloc], "initWithPreflightStatus:", 1);
  }
  return v0;
}

id TK_LOG_rsepkey()
{
  if (TK_LOG_rsepkey_once != -1)
    dispatch_once(&TK_LOG_rsepkey_once, &__block_literal_global_154);
  return (id)TK_LOG_rsepkey_log;
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

void sub_1B978EDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B978F04C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B978F1D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1B978F52C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B978F820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B978FAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B978FD7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B97900D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B979034C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

id getBSAuditTokenClass()
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
  v0 = (void *)getBSAuditTokenClass_softClass_0;
  v7 = getBSAuditTokenClass_softClass_0;
  if (!getBSAuditTokenClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBSAuditTokenClass_block_invoke_0;
    v3[3] = &unk_1E7089260;
    v3[4] = &v4;
    __getBSAuditTokenClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B97905E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getBSProcessHandleClass()
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
  v0 = (void *)getBSProcessHandleClass_softClass;
  v7 = getBSProcessHandleClass_softClass;
  if (!getBSProcessHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getBSProcessHandleClass_block_invoke;
    v3[3] = &unk_1E7089260;
    v3[4] = &v4;
    __getBSProcessHandleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B97906A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TK_LOG_user_prompt()
{
  if (TK_LOG_user_prompt_once != -1)
    dispatch_once(&TK_LOG_user_prompt_once, &__block_literal_global_12);
  return (id)TK_LOG_user_prompt_log;
}

id getSBSRemoteAlertConfigurationContextClass()
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
  v0 = (void *)getSBSRemoteAlertConfigurationContextClass_softClass;
  v7 = getSBSRemoteAlertConfigurationContextClass_softClass;
  if (!getSBSRemoteAlertConfigurationContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBSRemoteAlertConfigurationContextClass_block_invoke;
    v3[3] = &unk_1E7089260;
    v3[4] = &v4;
    __getSBSRemoteAlertConfigurationContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B9790798(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBSRemoteAlertDefinitionClass()
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
  v0 = (void *)getSBSRemoteAlertDefinitionClass_softClass;
  v7 = getSBSRemoteAlertDefinitionClass_softClass;
  if (!getSBSRemoteAlertDefinitionClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBSRemoteAlertDefinitionClass_block_invoke;
    v3[3] = &unk_1E7089260;
    v3[4] = &v4;
    __getSBSRemoteAlertDefinitionClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B9790850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBSRemoteAlertHandleClass()
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
  v0 = (void *)getSBSRemoteAlertHandleClass_softClass;
  v7 = getSBSRemoteAlertHandleClass_softClass;
  if (!getSBSRemoteAlertHandleClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBSRemoteAlertHandleClass_block_invoke;
    v3[3] = &unk_1E7089260;
    v3[4] = &v4;
    __getSBSRemoteAlertHandleClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B9790908(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBSRemoteAlertPresentationTargetClass()
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
  v0 = (void *)getSBSRemoteAlertPresentationTargetClass_softClass;
  v7 = getSBSRemoteAlertPresentationTargetClass_softClass;
  if (!getSBSRemoteAlertPresentationTargetClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBSRemoteAlertPresentationTargetClass_block_invoke;
    v3[3] = &unk_1E7089260;
    v3[4] = &v4;
    __getSBSRemoteAlertPresentationTargetClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B97909C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id getSBSRemoteAlertActivationContextClass()
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
  v0 = (void *)getSBSRemoteAlertActivationContextClass_softClass;
  v7 = getSBSRemoteAlertActivationContextClass_softClass;
  if (!getSBSRemoteAlertActivationContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getSBSRemoteAlertActivationContextClass_block_invoke;
    v3[3] = &unk_1E7089260;
    v3[4] = &v4;
    __getSBSRemoteAlertActivationContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B9790A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9790EA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getBSAuditTokenClass_block_invoke_0(uint64_t a1)
{
  Class result;

  BaseBoardLibrary();
  result = objc_getClass("BSAuditToken");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBSAuditTokenClass_block_invoke_cold_1_0();
  getBSAuditTokenClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void BaseBoardLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!BaseBoardLibraryCore_frameworkLibrary_0)
  {
    v1 = xmmword_1E708A240;
    v2 = 0;
    BaseBoardLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  }
  if (!BaseBoardLibraryCore_frameworkLibrary_0)
    BaseBoardLibrary_cold_1(&v0);
}

Class __getBSProcessHandleClass_block_invoke(uint64_t a1)
{
  Class result;

  BaseBoardLibrary();
  result = objc_getClass("BSProcessHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getBSProcessHandleClass_block_invoke_cold_1();
  getBSProcessHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBSRemoteAlertConfigurationContextClass_block_invoke(uint64_t a1)
{
  Class result;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertConfigurationContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1();
  getSBSRemoteAlertConfigurationContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void SpringBoardServicesLibrary()
{
  void *v0;
  __int128 v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v0 = 0;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    v1 = xmmword_1E708A258;
    v2 = 0;
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  }
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    SpringBoardServicesLibrary_cold_1(&v0);
}

Class __getSBSRemoteAlertDefinitionClass_block_invoke(uint64_t a1)
{
  Class result;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertDefinition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1();
  getSBSRemoteAlertDefinitionClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBSRemoteAlertHandleClass_block_invoke(uint64_t a1)
{
  Class result;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertHandle");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBSRemoteAlertHandleClass_block_invoke_cold_1();
  getSBSRemoteAlertHandleClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBSRemoteAlertPresentationTargetClass_block_invoke(uint64_t a1)
{
  Class result;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertPresentationTarget");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1();
  getSBSRemoteAlertPresentationTargetClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getSBSRemoteAlertActivationContextClass_block_invoke(uint64_t a1)
{
  Class result;

  SpringBoardServicesLibrary();
  result = objc_getClass("SBSRemoteAlertActivationContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1();
  getSBSRemoteAlertActivationContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1B9791A04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id TK_LOG_token_access_registry()
{
  if (TK_LOG_token_access_registry_once_0 != -1)
    dispatch_once(&TK_LOG_token_access_registry_once_0, &__block_literal_global_13);
  return (id)TK_LOG_token_access_registry_log_0;
}

void sub_1B9792F9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B9793090(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id TK_LOG_sharedrsc()
{
  if (TK_LOG_sharedrsc_once != -1)
    dispatch_once(&TK_LOG_sharedrsc_once, &__block_literal_global_14);
  return (id)TK_LOG_sharedrsc_log;
}

void sub_1B9793B38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13)
{
  void *v13;

  objc_sync_exit(v13);
  _Unwind_Resume(a1);
}

id TK_LOG_token_3()
{
  if (TK_LOG_token_once_3 != -1)
    dispatch_once(&TK_LOG_token_once_3, &__block_literal_global_15);
  return (id)TK_LOG_token_log_3;
}

void sub_1B9793E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_1B9793FF8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id TK_LOG_token_4()
{
  if (TK_LOG_token_once_4 != -1)
    dispatch_once(&TK_LOG_token_once_4, &__block_literal_global_17);
  return (id)TK_LOG_token_log_4;
}

void sub_1B9798D48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_1B9798E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9798F4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B979903C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B979911C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B9799644(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1B9799C54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  void *v27;

  objc_sync_exit(v27);
  _Unwind_Resume(a1);
}

void sub_1B9799E98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B979A00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1B979A1A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B979A300(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1B979A638(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1B979A850(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B979AD74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B979AEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B979B050(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B979B19C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1B979B478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 160), 8);
  _Block_object_dispose((const void *)(v11 - 128), 8);
  os_activity_scope_leave((os_activity_scope_state_t)(v11 - 80));
  _Unwind_Resume(a1);
}

void sub_1B979B724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
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

void sub_1B979B8FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B979BFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1B979C5AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id TK_LOG_watcher()
{
  if (TK_LOG_watcher_once != -1)
    dispatch_once(&TK_LOG_watcher_once, &__block_literal_global_86);
  return (id)TK_LOG_watcher_log;
}

void sub_1B979C848(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B979CA10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1B979CD60(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B979CE38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B979CF5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B979D068(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B979D258(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1B979D2F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void *acm_mem_alloc(size_t size)
{
  void *result;

  result = malloc_type_calloc(1uLL, size, 0xDB9956F0uLL);
  if (result)
    _allocatedMem_3 += size;
  return result;
}

void acm_mem_free(void *a1, rsize_t __n)
{
  uint64_t v4;

  if (a1)
  {
    memset_s(a1, __n, 0, __n);
    free(a1);
    v4 = _allocatedMem_3 - __n;
    if (_allocatedMem_3 < __n)
      v4 = 0;
    _allocatedMem_3 = v4;
  }
}

uint64_t getLengthOfParameters(_DWORD *a1, unsigned int a2, _DWORD *a3)
{
  int v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  int v10;
  uint64_t v11;
  unsigned int v12;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "getLengthOfParameters");
  if (a3)
  {
    *a3 = 0;
    v6 = 0;
    if (a2)
    {
      v7 = a2;
      while (1)
      {
        v8 = checkParameter(a1);
        if ((_DWORD)v8)
          break;
        v9 = v6 + 8;
        v10 = a1[4];
        v6 += v10 + 8;
        if (__CFADD__(v10, v9))
          goto LABEL_10;
        a1 += 6;
        if (!--v7)
          goto LABEL_9;
      }
      v11 = v8;
      v12 = 70;
    }
    else
    {
LABEL_9:
      v11 = 0;
      *a3 = v6;
      v12 = 10;
    }
  }
  else
  {
LABEL_10:
    v12 = 70;
    v11 = 4294967293;
  }
  if (v12 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "getLengthOfParameters", (int)v11);
  return v11;
}

uint64_t serializeParameters(uint64_t a1, int a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v6;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *v13;
  size_t v14;
  void *__src[2];
  size_t __n;

  LODWORD(v6) = a2;
  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "serializeParameters");
  v8 = 70;
  v9 = 4294967293;
  if (a3 && a4)
  {
    v10 = *a4;
    *(_DWORD *)(a3 + v10) = v6;
    v11 = v10 + 4;
    if ((_DWORD)v6)
    {
      v6 = v6;
      while (1)
      {
        *(_OWORD *)__src = *(_OWORD *)a1;
        __n = *(_QWORD *)(a1 + 16);
        v12 = checkParameter(__src);
        if ((_DWORD)v12)
          break;
        v13 = (_DWORD *)(a3 + v11);
        v14 = __n;
        *v13 = __src[0];
        v13[1] = v14;
        v11 += 8;
        if ((_DWORD)v14)
        {
          memcpy((void *)(a3 + v11), __src[1], v14);
          v11 += v14;
        }
        a1 += 24;
        if (!--v6)
          goto LABEL_11;
      }
      v9 = v12;
      v8 = 70;
    }
    else
    {
LABEL_11:
      v9 = 0;
      *a4 = v11;
      v8 = 10;
    }
  }
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "serializeParameters", (int)v9);
  return v9;
}

uint64_t GetSerializedVerifyAclConstraintSize(int a1, uint64_t a2, uint64_t a3, unsigned int a4, uint64_t a5, unsigned int a6, uint64_t a7, uint64_t a8, _DWORD *a9, unsigned int a10, _QWORD *a11)
{
  uint64_t result;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unsigned int v18;

  v18 = 0;
  result = 4294967293;
  if (a3)
  {
    if (a11)
    {
      if (a10 <= 0xA && (a9 != 0) == (a10 != 0))
      {
        result = getLengthOfParameters(a9, a10, &v18);
        if (!(_DWORD)result)
        {
          v15 = 29;
          if (a1 == 32)
            v15 = 33;
          v16 = v15 + a4;
          if (a1 == 32)
            v17 = a6;
          else
            v17 = 0;
          *a11 = v16 + v17 + v18;
        }
      }
    }
  }
  return result;
}

uint64_t SerializeVerifyAclConstraint(int a1, _OWORD *a2, const void *a3, unsigned int a4, const void *a5, unsigned int a6, char a7, int a8, _DWORD *a9, unsigned int a10, uint64_t a11, _QWORD *a12)
{
  uint64_t result;
  BOOL v14;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  int v28;
  uint64_t v30;
  unsigned int v31;

  if (!a3)
    return 4294967293;
  result = 4294967293;
  if (a12)
    v14 = a11 == 0;
  else
    v14 = 1;
  if (!v14 && a10 <= 0xA && (a9 != 0) == (a10 != 0))
  {
    v31 = 0;
    result = getLengthOfParameters(a9, a10, &v31);
    if (!(_DWORD)result)
    {
      v21 = 29;
      if (a1 == 32)
        v21 = 33;
      v22 = v21 + a4;
      if (a1 == 32)
        v23 = a6;
      else
        v23 = 0;
      if (*a12 < v22 + v23 + (unint64_t)v31)
      {
        return 4294967293;
      }
      else
      {
        v28 = a8;
        if (a2)
        {
          *(_OWORD *)a11 = *a2;
        }
        else
        {
          *(_QWORD *)a11 = 0;
          *(_QWORD *)(a11 + 8) = 0;
        }
        *(_DWORD *)(a11 + 16) = a4;
        memcpy((void *)(a11 + 20), a3, a4);
        v24 = a4 + 20;
        if (a1 == 32)
        {
          *(_DWORD *)(a11 + v24) = a6;
          v25 = a4 + 24;
          memcpy((void *)(a11 + v25), a5, a6);
          v24 = v25 + a6;
        }
        v26 = a11 + v24;
        *(_BYTE *)v26 = a7;
        *(_DWORD *)(v26 + 1) = v28;
        v30 = v24 + 5;
        result = serializeParameters((uint64_t)a9, a10, a11, &v30);
        if (!(_DWORD)result)
          *a12 = v30;
      }
    }
  }
  return result;
}

uint64_t DeserializeRequirement(unsigned int *a1, unint64_t a2, void **a3, size_t *a4)
{
  uint64_t v4;
  unsigned int v9;
  size_t v10;
  uint64_t v11;
  uint64_t v13;
  _OWORD *v14;
  __int128 v15;
  uint64_t v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *__dst;

  __dst = 0;
  v4 = 4294967293;
  if (a1)
  {
    if (a2 >= 0x10)
    {
      if (a3)
      {
        if (a4)
        {
          v9 = *a1;
          if (v9 <= 0x1C)
          {
            if (((1 << v9) & 0x1FFCFF4E) != 0)
            {
              v10 = a1[3] + 16;
              if (v10 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, 0, &__dst);
              if (!(_DWORD)v11)
              {
                if (__dst)
                {
                  memcpy(__dst, a1, v10);
LABEL_11:
                  v4 = 0;
                  *a4 = v10;
                  *a3 = __dst;
                  return v4;
                }
                return 4294967292;
              }
              goto LABEL_35;
            }
            if (((1 << v9) & 0x30) != 0)
            {
              v13 = a1[4];
              if (8 * v13 + 20 > a2)
                goto LABEL_36;
              v11 = Util_AllocRequirement(v9, v13, &__dst);
              if ((_DWORD)v11)
                goto LABEL_35;
              v14 = __dst;
              if (!__dst)
                return 4294967292;
              if (*((_DWORD *)__dst + 3) == 84)
              {
                v15 = *(_OWORD *)a1;
                *((_DWORD *)__dst + 4) = a1[4];
                *v14 = v15;
                *((_DWORD *)__dst + 3) = 84;
                if (!a1[4])
                {
                  v10 = 20;
                  goto LABEL_11;
                }
                v16 = 0;
                v10 = 20;
                while (1)
                {
                  v21 = 0;
                  v22 = 0;
                  v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                  if ((_DWORD)v11)
                    goto LABEL_35;
                  *(_QWORD *)((char *)__dst + 8 * v16 + 20) = v22;
                  v10 += v21;
                  if (++v16 >= (unint64_t)a1[4])
                    goto LABEL_11;
                }
              }
              goto LABEL_39;
            }
            if (v9 == 7)
            {
              v17 = a1[5];
              if (8 * v17 + 24 <= a2)
              {
                v11 = Util_AllocRequirement(7, v17, &__dst);
                if (!(_DWORD)v11)
                {
                  v18 = __dst;
                  if (!__dst)
                    return 4294967292;
                  if (*((_DWORD *)__dst + 3) != 88)
                  {
LABEL_39:
                    v4 = 4294967291;
                    goto LABEL_36;
                  }
                  v19 = *(_OWORD *)a1;
                  *((_QWORD *)__dst + 2) = *((_QWORD *)a1 + 2);
                  *v18 = v19;
                  *((_DWORD *)__dst + 3) = 88;
                  if (!a1[5])
                  {
                    v10 = 24;
                    goto LABEL_11;
                  }
                  v20 = 0;
                  v10 = 24;
                  while (1)
                  {
                    v21 = 0;
                    v22 = 0;
                    v11 = DeserializeRequirement((char *)a1 + v10, a2 - v10, &v22, &v21);
                    if ((_DWORD)v11)
                      break;
                    *((_QWORD *)__dst + v20 + 3) = v22;
                    v10 += v21;
                    if (++v20 >= (unint64_t)a1[5])
                      goto LABEL_11;
                  }
                }
LABEL_35:
                v4 = v11;
              }
            }
          }
        }
      }
    }
  }
LABEL_36:
  if (__dst)
    Util_DeallocRequirement((int *)__dst);
  return v4;
}

uint64_t checkParameter(_DWORD *a1)
{
  if (!a1)
    return 4294967293;
  switch(*a1)
  {
    case 0:
    case 0xC:
      if (a1[4])
        return 4294967293;
      break;
    case 1:
    case 4:
    case 5:
    case 0xA:
      if (a1[4] != 4)
        return 4294967293;
      break;
    case 2:
    case 6:
    case 7:
      if (a1[4] != 16)
        return 4294967293;
      break;
    case 3:
      if ((a1[4] - 1001) < 0xFFFFFC18)
        return 4294967293;
      break;
    case 8:
    case 9:
      if (a1[4] != 1)
        return 4294967293;
      break;
    case 0xB:
      if (a1[4] > 0x400u)
        return 4294967293;
      break;
    default:
      return 4294967293;
  }
  return 0;
}

uint64_t LibCall_ACMContextVerifyAclConstraint(uint64_t a1, uint64_t a2, _OWORD *a3, const void *a4, uint64_t a5, unsigned __int8 a6, _DWORD *a7, unsigned int a8, unsigned int a9, uint64_t a10)
{
  return verifyAclConstraintForOperationCommandInternal(a1, a2, 0xBu, a3, a4, a5, 0, 0, a6, a7, a8, a9, a10);
}

uint64_t verifyAclConstraintForOperationCommandInternal(uint64_t result, uint64_t a2, unsigned __int8 a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, uint64_t a13)
{
  uint64_t (*v20)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *);
  uint64_t v21;
  int *v22;
  _BOOL8 v23;
  BOOL v24;
  int *v25;

  v20 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *))result;
  if (gACMLoggingLevel <= 0xAu)
    result = printf("%s: %s: called.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  v25 = 0;
  v24 = 0;
  if (a4 && a5 && a6 && a13)
  {
    v21 = verifyAclConstraintInternal(v20, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, &v24, &v25);
    v22 = v25;
    v23 = v24;
  }
  else
  {
    if (!a13)
      goto LABEL_10;
    v22 = 0;
    v23 = 0;
    v21 = 4294967293;
  }
  (*(void (**)(uint64_t, uint64_t, _BOOL8, int *))(a13 + 16))(a13, v21, v23, v22);
  result = (uint64_t)v25;
  if (v25)
    result = Util_DeallocRequirement(v25);
LABEL_10:
  if (gACMLoggingLevel <= 0xAu)
    return printf("%s: %s: returning.\n", "ACM", "verifyAclConstraintForOperationCommandInternal");
  return result;
}

BOOL Util_isNullOrZeroMemory(_BYTE *a1, uint64_t a2)
{
  if (!a1)
    return 1;
  if (*a1)
    return 0;
  return memcmp(a1, a1 + 1, a2 - 1) == 0;
}

uint64_t Util_AllocRequirement(int a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v6;
  unsigned int v7;
  _DWORD *v8;
  int v9;
  const char *v11;
  const void *v12;
  int v13;
  const char *v14;
  const void *v15;
  int v16;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_AllocRequirement");
  if (a3)
  {
    v6 = 4294967293;
    v7 = 70;
    switch(a1)
    {
      case 1:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
        v12 = v8;
        v13 = 338;
        goto LABEL_49;
      case 2:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
        v12 = v8;
        v13 = 343;
        goto LABEL_49;
      case 3:
        v8 = acm_mem_alloc(0xACuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatched", v8, 172, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 348, "Util_AllocRequirement");
        v9 = 156;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 4:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataOr";
        v15 = v8;
        v16 = 406;
        goto LABEL_28;
      case 5:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x64uLL);
        v14 = "ACMRequirement - ACMRequirementDataAnd";
        v15 = v8;
        v16 = 398;
LABEL_28:
        acm_mem_alloc_info(v14, v15, 100, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v16, "Util_AllocRequirement");
        v9 = 84;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 6:
      case 9:
      case 10:
      case 11:
      case 12:
      case 14:
      case 15:
      case 18:
      case 19:
      case 22:
      case 23:
      case 27:
      case 28:
        v8 = acm_mem_alloc(0x10uLL);
        acm_mem_alloc_info("ACMRequirement", v8, 16, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 333, "Util_AllocRequirement");
        v9 = 0;
        if (v8)
          goto LABEL_6;
        goto LABEL_50;
      case 7:
        if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
          goto LABEL_53;
        v8 = acm_mem_alloc(0x68uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofN", v8, 104, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 391, "Util_AllocRequirement");
        v9 = 88;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 8:
        v8 = acm_mem_alloc(0x410uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAccessGroups", v8, 1040, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 378, "Util_AllocRequirement");
        v9 = 1024;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 13:
        v8 = acm_mem_alloc(0x30uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataUserOutputDisplayed", v8, 48, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 363, "Util_AllocRequirement");
        v9 = 32;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 16:
      case 17:
        break;
      case 20:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataSecureIntent";
        v12 = v8;
        v13 = 353;
        goto LABEL_49;
      case 21:
        v8 = acm_mem_alloc(0x14uLL);
        v11 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
        v12 = v8;
        v13 = 358;
LABEL_49:
        acm_mem_alloc_info(v11, v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_AllocRequirement");
        v9 = 4;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 24:
        v8 = acm_mem_alloc(0x434uLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataAP", v8, 1076, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 368, "Util_AllocRequirement");
        v9 = 1060;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 25:
        v8 = acm_mem_alloc(0x3BuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKeyRef", v8, 59, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 373, "Util_AllocRequirement");
        v9 = 43;
        if (!v8)
          goto LABEL_50;
        goto LABEL_6;
      case 26:
        v8 = acm_mem_alloc(0x2CuLL);
        acm_mem_alloc_info("ACMRequirement - ACMRequirementDataRatchet", v8, 44, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 384, "Util_AllocRequirement");
        v9 = 28;
        if (!v8)
        {
LABEL_50:
          v6 = 4294967292;
          goto LABEL_54;
        }
LABEL_6:
        *v8 = a1;
        *(_QWORD *)(v8 + 1) = 0x100000001;
        v8[3] = v9;
        if ((a1 & 0xFFFFFFFE) == 4)
        {
          v8[4] = a2;
        }
        else if (a1 == 1000)
        {
          v8[13] = a2;
        }
        else if (a1 == 7)
        {
          v8[5] = a2;
        }
        v6 = 0;
        *a3 = v8;
        v7 = 10;
        break;
      default:
        switch(a1)
        {
          case 1000:
            if ((unint64_t)(a2 - 11) < 0xFFFFFFFFFFFFFFF6)
              goto LABEL_53;
            v8 = acm_mem_alloc(0x88uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataKofNWithAttributes", v8, 136, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 414, "Util_AllocRequirement");
            v9 = 120;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1001:
            v8 = acm_mem_alloc(0xB8uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes", v8, 184, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 419, "Util_AllocRequirement");
            v9 = 168;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          case 1002:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
            v12 = v8;
            v13 = 424;
            goto LABEL_49;
          case 1003:
            v8 = acm_mem_alloc(0x14uLL);
            v11 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
            v12 = v8;
            v13 = 429;
            goto LABEL_49;
          case 1004:
            v8 = acm_mem_alloc(0x20uLL);
            acm_mem_alloc_info("ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes", v8, 32, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", 434, "Util_AllocRequirement");
            v9 = 16;
            if (!v8)
              goto LABEL_50;
            goto LABEL_6;
          default:
            goto LABEL_17;
        }
    }
  }
  else
  {
LABEL_53:
    v6 = 4294967293;
LABEL_54:
    v7 = 70;
  }
LABEL_17:
  if (v7 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_AllocRequirement", (int)v6);
  return v6;
}

uint64_t Util_DeallocRequirement(int *a1)
{
  int v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  const char *v9;
  rsize_t v10;
  int *v11;
  unint64_t v12;
  int v13;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "Util_DeallocRequirement");
  if (!a1)
  {
    v7 = 4294967293;
    v8 = 70;
    goto LABEL_28;
  }
  v2 = *a1;
  if (*a1 > 6)
  {
    if (v2 == 7)
    {
      if (a1[5])
      {
        v6 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v6++ + 6]);
        while (v6 < a1[5]);
      }
    }
    else
    {
      if (v2 != 1000)
        goto LABEL_25;
      if (a1[13])
      {
        v4 = 0;
        do
          Util_DeallocRequirement(*(_QWORD *)&a1[2 * v4++ + 14]);
        while (v4 < a1[13]);
      }
    }
  }
  else if (v2 == 4)
  {
    if (a1[4])
    {
      v5 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v5++ + 5]);
      while (v5 < a1[4]);
    }
  }
  else
  {
    if (v2 != 5)
      goto LABEL_25;
    if (a1[4])
    {
      v3 = 0;
      do
        Util_DeallocRequirement(*(_QWORD *)&a1[2 * v3++ + 5]);
      while (v3 < a1[4]);
    }
  }
  v2 = *a1;
LABEL_25:
  v7 = 4294967293;
  v8 = 70;
  switch(v2)
  {
    case 1:
      v9 = "ACMRequirement - ACMRequirementDataPasscodeValidated";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 542;
      goto LABEL_27;
    case 2:
      v9 = "ACMRequirement - ACMRequirementDataPassphraseEntered";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 546;
      goto LABEL_27;
    case 3:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatched";
      v10 = 172;
      v11 = a1;
      v12 = 172;
      v13 = 550;
      goto LABEL_27;
    case 4:
      v9 = "ACMRequirement - ACMRequirementDataOr";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 595;
      goto LABEL_27;
    case 5:
      v9 = "ACMRequirement - ACMRequirementDataAnd";
      v10 = 100;
      v11 = a1;
      v12 = 100;
      v13 = 589;
      goto LABEL_27;
    case 6:
    case 9:
    case 10:
    case 11:
    case 12:
    case 14:
    case 15:
    case 18:
    case 19:
    case 22:
    case 23:
    case 27:
    case 28:
      v9 = "ACMRequirement";
      v10 = 16;
      v11 = a1;
      v12 = 16;
      v13 = 538;
      goto LABEL_27;
    case 7:
      v9 = "ACMRequirement - ACMRequirementDataKofN";
      v10 = 104;
      v11 = a1;
      v12 = 104;
      v13 = 584;
      goto LABEL_27;
    case 8:
      v9 = "ACMRequirement - ACMRequirementDataAccessGroups";
      v10 = 1040;
      v11 = a1;
      v12 = 1040;
      v13 = 574;
      goto LABEL_27;
    case 13:
      v9 = "ACMRequirement - ACMRequirementDataUserOutputDisplayed";
      v10 = 48;
      v11 = a1;
      v12 = 48;
      v13 = 562;
      goto LABEL_27;
    case 16:
    case 17:
      break;
    case 20:
      v9 = "ACMRequirement - ACMRequirementDataSecureIntent";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 554;
      goto LABEL_27;
    case 21:
      v9 = "ACMRequirement - ACMRequirementDataBiometryMatchAttempted";
      v10 = 20;
      v11 = a1;
      v12 = 20;
      v13 = 558;
      goto LABEL_27;
    case 24:
      v9 = "ACMRequirement - ACMRequirementDataAP";
      v10 = 1076;
      v11 = a1;
      v12 = 1076;
      v13 = 566;
      goto LABEL_27;
    case 25:
      v9 = "ACMRequirement - ACMRequirementDataKeyRef";
      v10 = 59;
      v11 = a1;
      v12 = 59;
      v13 = 570;
      goto LABEL_27;
    case 26:
      v9 = "ACMRequirement - ACMRequirementDataRatchet";
      v10 = 44;
      v11 = a1;
      v12 = 44;
      v13 = 579;
LABEL_27:
      acm_mem_free_info(v9, v11, v12, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/CommonUtil.c", v13, "Util_DeallocRequirement");
      acm_mem_free(a1, v10);
      v7 = 0;
      v8 = 10;
      break;
    default:
      switch(v2)
      {
        case 1000:
          v9 = "ACMRequirement - ACMRequirementDataKofNWithAttributes";
          v10 = 136;
          v11 = a1;
          v12 = 136;
          v13 = 601;
          goto LABEL_27;
        case 1001:
          v9 = "ACMRequirement - ACMRequirementDataBiometryMatchedWithAttributes";
          v10 = 184;
          v11 = a1;
          v12 = 184;
          v13 = 605;
          goto LABEL_27;
        case 1002:
          v9 = "ACMRequirement - ACMRequirementDataPushButtonWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 609;
          goto LABEL_27;
        case 1003:
          v9 = "ACMRequirement - ACMRequirementDataSecureStateWithAttributes";
          v10 = 20;
          v11 = a1;
          v12 = 20;
          v13 = 613;
          goto LABEL_27;
        case 1004:
          v9 = "ACMRequirement - ACMRequirementDataPasscodeValidatedWithAttributes";
          v10 = 32;
          v11 = a1;
          v12 = 32;
          v13 = 617;
          goto LABEL_27;
        default:
          goto LABEL_28;
      }
  }
LABEL_28:
  if (v8 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "Util_DeallocRequirement", (int)v7);
  return v7;
}

_DWORD *ACMContextCreateWithExternalForm(_OWORD *a1, uint64_t a2)
{
  _DWORD *v4;
  int v5;
  unsigned int v6;
  uint64_t v8;
  uint8_t buf[4];
  const char *v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  _DWORD *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v8 = 0;
  v4 = LibCall_ACMContextCreateWithExternalForm((uint64_t (*)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *))ioKitTransport, (uint64_t)&v8, a1, a2, &_logLevel, 1);
  if (v4)
  {
    if (_logLevel <= 0x28u && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v5 = v4[4];
      *(_DWORD *)buf = 136315650;
      v10 = "ACMLib";
      v11 = 2080;
      v12 = "ACMContextCreateWithExternalForm";
      v13 = 1024;
      LODWORD(v14) = v5;
      _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] acquired.\n", buf, 0x1Cu);
    }
    v6 = 30;
  }
  else
  {
    updateLogLevelFromKext();
    v6 = 70;
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v10 = "ACMLib";
    v11 = 2080;
    v12 = "ACMContextCreateWithExternalForm";
    v13 = 2048;
    v14 = v4;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, -> ctx = %p.\n", buf, 0x20u);
  }
  return v4;
}

uint64_t ACMContextDelete(_DWORD *a1, int a2)
{
  unsigned int v4;
  int v5;
  const char *v6;
  uint64_t v7;
  unsigned int v8;
  _DWORD *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  _QWORD v16[3];

  v16[2] = *MEMORY[0x1E0C80C00];
  v4 = _logLevel;
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
    v4 = _logLevel;
  }
  if (a1 && v4 <= 0x28 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = a1[4];
    v6 = "deleted";
    *(_DWORD *)buf = 136315906;
    v12 = "ACMLib";
    v14 = "ACMContextDelete";
    v13 = 2080;
    if (a2)
      v6 = "destroyed";
    v15 = 1024;
    LODWORD(v16[0]) = v5;
    WORD2(v16[0]) = 2080;
    *(_QWORD *)((char *)v16 + 6) = v6;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: CS[%u] %s.\n", buf, 0x26u);
  }
  v10 = a1;
  v7 = LibCall_ACMContextDelete((void (*)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD))ioKitTransport, (uint64_t)&v10, a1, a2);
  if ((_DWORD)v7)
    v8 = 70;
  else
    v8 = 10;
  if (v8 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextDelete";
    v15 = 2048;
    v16[0] = (int)v7;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

uint64_t ACMContextRemovePassphraseCredentialsByPurposeAndScope(_OWORD *a1, int a2, int a3)
{
  uint64_t v6;
  _OWORD *v7;
  uint64_t v8;
  unsigned int v9;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v11, 0x16u);
  }
  if (a1 || a3 == 2)
  {
    v6 = init();
    if ((_DWORD)v6)
    {
      v8 = v6;
      v9 = 70;
    }
    else
    {
      v7 = acm_mem_alloc_data(0x18uLL);
      acm_mem_alloc_info("<data>", v7, 24, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 492, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
      if (v7)
      {
        if (a1)
        {
          *v7 = *a1;
        }
        else
        {
          *(_QWORD *)v7 = 0;
          *((_QWORD *)v7 + 1) = 0;
        }
        *((_DWORD *)v7 + 4) = a2;
        *((_DWORD *)v7 + 5) = a3;
        v8 = performCommand((uint64_t)a1, 16, 0, v7, 0x18uLL, 0, 0);
        acm_mem_free_info("<data>", v7, 0x18uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/ACMLib/ACMLib.c", 513, "ACMContextRemovePassphraseCredentialsByPurposeAndScope");
        acm_mem_free_data(v7, 0x18uLL);
        if ((_DWORD)v8)
          v9 = 70;
        else
          v9 = 10;
      }
      else
      {
        v9 = 70;
        v8 = 4294967292;
      }
    }
  }
  else
  {
    v9 = 70;
    v8 = 4294967293;
  }
  if (v9 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v11 = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMContextRemovePassphraseCredentialsByPurposeAndScope";
    v15 = 2048;
    v16 = (int)v8;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", (uint8_t *)&v11, 0x20u);
  }
  return v8;
}

uint64_t ACMContextVerifyAclConstraint(_OWORD *a1, const void *a2, uint64_t a3, unsigned __int8 a4, _DWORD *a5, unsigned int a6, unsigned int a7, uint64_t a8)
{
  _OWORD *v9;

  v9 = a1;
  return LibCall_ACMContextVerifyAclConstraint((uint64_t)ioKitTransport, (uint64_t)&v9, a1, a2, a3, a4, a5, a6, a7, a8);
}

void ACMRequirementGetSubrequirements(int *a1, uint64_t a2)
{
  int v4;
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", (uint8_t *)&v8, 0x16u);
  }
  if (a1 && a2)
  {
    v4 = *a1;
    if (*a1 == 4)
    {
      if (a1[4])
      {
        v6 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v6++ + 5]);
        while (v6 < a1[4]);
      }
    }
    else if (v4 == 5)
    {
      if (a1[4])
      {
        v7 = 0;
        do
          (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v7++ + 5]);
        while (v7 < a1[4]);
      }
    }
    else if (v4 == 7 && a1[5])
    {
      v5 = 0;
      do
        (*(void (**)(uint64_t, _QWORD))(a2 + 16))(a2, *(_QWORD *)&a1[2 * v5++ + 6]);
      while (v5 < a1[5]);
    }
  }
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v8 = 136315394;
    v9 = "ACMLib";
    v10 = 2080;
    v11 = "ACMRequirementGetSubrequirements";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", (uint8_t *)&v8, 0x16u);
  }
}

uint64_t ACMRequirementGetProperty(int *a1, int a2, uint64_t a3)
{
  unsigned int v6;
  uint64_t v7;
  unint64_t v9;
  int *v10;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  v9 = 0;
  v10 = 0;
  v6 = 70;
  v7 = 4294967293;
  if (a1 && a3)
  {
    v7 = LibCall_ACMRequirementGetPropertyData(a1, a2, &v10, &v9);
    if ((_DWORD)v7)
    {
      v6 = 70;
    }
    else
    {
      (*(void (**)(uint64_t, int *, unint64_t))(a3 + 16))(a3, v10, v9);
      v6 = 10;
    }
  }
  if (v6 >= _logLevel && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACMLib";
    v13 = 2080;
    v14 = "ACMRequirementGetProperty";
    v15 = 2048;
    v16 = (int)v7;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning, err = %ld.\n", buf, 0x20u);
  }
  return v7;
}

void updateLogLevelFromKext()
{
  unsigned __int8 v0;
  unsigned int v1;
  uint32_t outputCnt;
  uint64_t output;
  uint8_t buf[4];
  const char *v5;
  __int16 v6;
  const char *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (_logLevel <= 0xAu && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: called.\n", buf, 0x16u);
  }
  output = 0;
  outputCnt = 1;
  if (IOConnectCallScalarMethod(_connect, 2u, 0, 0, &output, &outputCnt))
    goto LABEL_8;
  v0 = output;
  v1 = output;
  _logLevel = output;
  if (output <= 0x1EuLL && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315650;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    v8 = 1024;
    v9 = v0;
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: log level set to %d.\n", buf, 0x1Cu);
LABEL_8:
    v1 = _logLevel;
  }
  if (v1 <= 0xA && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v5 = "ACMLib";
    v6 = 2080;
    v7 = "updateLogLevelFromKext";
    _os_log_impl(&dword_1B9768000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "%s: %s: returning.\n", buf, 0x16u);
  }
}

_DWORD *LibCall_ACMContextCreateWithExternalForm(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, _OWORD *, uint64_t, _QWORD *, uint64_t *), uint64_t a2, _OWORD *a3, uint64_t a4, _BYTE *a5, int a6)
{
  _DWORD *v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v20;
  _QWORD v21[2];

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm");
  v12 = 0;
  v13 = 70;
  v14 = -3;
  if (a1 && a3 && a4 == 16)
  {
    memset(v21, 0, 9);
    if (a6)
    {
      v20 = 9;
      v15 = a1(a2, 37, 0, a3, 16, v21, &v20);
      if (!v15)
      {
        if (v20 == 9)
        {
          v14 = 0;
          goto LABEL_19;
        }
        v14 = -5;
        goto LABEL_28;
      }
      v14 = v15;
      if (v15 != -3)
        goto LABEL_28;
    }
    v20 = 5;
    v16 = a1(a2, 18, 0, a3, 16, v21, &v20);
    if (v20 == 5)
      v17 = 0;
    else
      v17 = -5;
    if (v16)
      v14 = v16;
    else
      v14 = v17;
    if (!v16 && v20 == 5)
    {
LABEL_19:
      if (LODWORD(v21[0]))
      {
        v12 = acm_mem_alloc(0x14uLL);
        acm_mem_alloc_info("ACMHandleWithPayload", v12, 20, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 128, "LibCall_ACMContextCreateWithExternalForm");
        if (!v12)
        {
          v13 = 70;
          v14 = -4;
          goto LABEL_31;
        }
        v18 = *(_DWORD *)((char *)v21 + 5);
        *(_OWORD *)v12 = *a3;
        v12[4] = v18;
        if (a5)
          *a5 = BYTE4(v21[0]);
        if (v14)
        {
          acm_mem_free_info("ACMHandleWithPayload", v12, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 147, "LibCall_ACMContextCreateWithExternalForm");
          acm_mem_free(v12, 0x14uLL);
LABEL_29:
          v13 = 70;
          goto LABEL_31;
        }
      }
      else
      {
        v12 = 0;
      }
      goto LABEL_30;
    }
LABEL_28:
    v12 = 0;
    if (v14)
      goto LABEL_29;
LABEL_30:
    v14 = 0;
    v13 = 10;
  }
LABEL_31:
  if (v13 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextCreateWithExternalForm", v14);
  return v12;
}

uint64_t LibCall_ACMContextDelete(void (*a1)(uint64_t, uint64_t, _QWORD, void *, uint64_t, _QWORD, _QWORD), uint64_t a2, void *a3, int a4)
{
  uint64_t v8;
  unsigned int v9;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "LibCall_ACMContextDelete");
  if (a1 && a3)
  {
    if (a4)
      a1(a2, 2, 0, a3, 16, 0, 0);
    goto LABEL_7;
  }
  if (a3)
  {
LABEL_7:
    acm_mem_free_info("ACMHandleWithPayload", a3, 0x14uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 172, "LibCall_ACMContextDelete");
    acm_mem_free(a3, 0x14uLL);
    v8 = 0;
    v9 = 10;
    goto LABEL_8;
  }
  v9 = 70;
  v8 = 4294967293;
LABEL_8:
  if (v9 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "LibCall_ACMContextDelete", (int)v8);
  return v8;
}

unsigned int *LibCall_ACMRequirementGetType(unsigned int *result)
{
  if (result)
    return (unsigned int *)*result;
  return result;
}

uint64_t LibCall_ACMRequirementGetState(uint64_t result)
{
  if (result)
    return *(unsigned int *)(result + 4);
  return result;
}

uint64_t LibCall_ACMRequirementGetPropertyData(int *a1, int a2, int **a3, unint64_t *a4)
{
  uint64_t v4;
  int *v7;
  int *v8;
  int *v9;
  unint64_t v10;
  _DWORD *v11;
  BOOL v12;
  int v13;

  v4 = 4294967293;
  if (!a1 || !a3 || !a4)
    return v4;
  v4 = 4294967293;
  if (a2 > 399)
  {
    if (a2 > 600)
    {
      if (a2 == 601)
      {
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v7 = a1 + 7;
LABEL_45:
            *a3 = v7;
            v10 = 16;
            goto LABEL_72;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (a2 != 602)
      {
        if (a2 != 700)
          return v4;
        if (*a1 == 7)
        {
LABEL_28:
          v8 = a1 + 4;
          goto LABEL_58;
        }
        return 4294967293;
      }
      if (*a1 != 26)
        return 4294967293;
      if (a1[3] < 0x1C)
        return 4294967282;
      *a3 = a1 + 4;
      v10 = 8;
    }
    else
    {
      if (a2 == 400)
      {
        if (*a1 == 13)
        {
          v9 = a1 + 4;
LABEL_64:
          *a3 = v9;
          v10 = 32;
          goto LABEL_72;
        }
        return 4294967293;
      }
      if (a2 != 500)
      {
        if (a2 != 600)
          return v4;
        if (*a1 == 26)
        {
          if (a1[3] >= 0x1C)
          {
            v8 = a1 + 6;
LABEL_58:
            *a3 = v8;
            goto LABEL_59;
          }
          return 4294967282;
        }
        return 4294967293;
      }
      if (*a1 != 25)
        return 4294967293;
      *a3 = a1 + 4;
      v10 = 43;
    }
LABEL_72:
    v4 = 0;
    *a4 = v10;
    return v4;
  }
  if (a2 > 99)
  {
    switch(a2)
    {
      case 300:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 5;
        goto LABEL_45;
      case 301:
        if (*a1 != 3)
          return 4294967293;
        v9 = a1 + 13;
        goto LABEL_64;
      case 302:
        if (*a1 != 3)
          return 4294967293;
        v7 = a1 + 9;
        goto LABEL_45;
      case 303:
        if (*a1 != 3)
          return 4294967293;
        v10 = 0;
        v11 = a1 + 21;
        break;
      case 304:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 41;
        goto LABEL_58;
      case 305:
        if (*a1 != 3)
          return 4294967293;
        if (a1[3] < 0x9C)
          return 4294967282;
        v8 = a1 + 42;
        goto LABEL_58;
      case 306:
        if (*a1 != 24)
          return 4294967293;
        *a3 = a1 + 5;
        v10 = a1[4];
        goto LABEL_72;
      case 307:
        if (*a1 != 24)
          return 4294967293;
        v9 = a1 + 261;
        goto LABEL_64;
      default:
        if (a2 == 100)
        {
          v13 = *a1;
          if (*a1 > 19)
          {
            if (v13 == 20 || v13 == 21)
              goto LABEL_28;
          }
          else if (v13 == 1 || v13 == 3)
          {
            goto LABEL_28;
          }
          return v4;
        }
        if (a2 != 200)
          return v4;
        if (*a1 != 2)
          return 4294967293;
        goto LABEL_28;
    }
    while (!Util_isNullOrZeroMemory((_BYTE *)v11 + v10, 16))
    {
      v12 = v10 >= 0x40;
      v10 += 16;
      if (v12)
      {
        v10 = 80;
        goto LABEL_71;
      }
    }
    if (!v10)
      v11 = 0;
LABEL_71:
    *a3 = v11;
    goto LABEL_72;
  }
  switch(a2)
  {
    case 1:
      *a3 = a1;
LABEL_59:
      v10 = 4;
      goto LABEL_72;
    case 2:
      v8 = a1 + 1;
      goto LABEL_58;
    case 3:
      v8 = a1 + 2;
      goto LABEL_58;
  }
  return v4;
}

uint64_t verifyAclConstraintInternal(uint64_t (*a1)(uint64_t, uint64_t, _QWORD, void *, size_t, unsigned int *, unint64_t *), uint64_t a2, uint64_t a3, _OWORD *a4, const void *a5, uint64_t a6, const void *a7, unsigned int a8, unsigned __int8 a9, _DWORD *a10, unsigned int a11, unsigned int a12, BOOL *a13, int **a14)
{
  uint64_t v20;
  uint64_t SerializedVerifyAclConstraintSize;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  unsigned int *v25;
  uint64_t v26;
  unint64_t v27;
  rsize_t v28;
  unsigned int v29;
  size_t v33;
  int *v34;
  unint64_t v35;
  size_t v36;

  if (gACMLoggingLevel <= 0xAu)
    printf("%s: %s: called.\n", "ACM", "verifyAclConstraintInternal");
  v36 = 0;
  v34 = 0;
  v35 = 4096;
  v33 = 0;
  v20 = 4294967293;
  if (!a4 || !a5 || !a6 || !a13)
  {
LABEL_19:
    if (!(_DWORD)v20)
      goto LABEL_22;
    goto LABEL_20;
  }
  SerializedVerifyAclConstraintSize = GetSerializedVerifyAclConstraintSize(a3, (uint64_t)a4, (uint64_t)a5, a6, (uint64_t)a7, a8, a9, a12, a10, a11, &v36);
  if (!(_DWORD)SerializedVerifyAclConstraintSize)
  {
    v22 = v36;
    v23 = acm_mem_alloc_data(v36);
    acm_mem_alloc_info("<data>", v23, v22, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1929, "verifyAclConstraintInternal");
    if (v23)
    {
      v24 = SerializeVerifyAclConstraint(a3, a4, a5, a6, a7, a8, a9, a12, a10, a11, (uint64_t)v23, &v36);
      if ((_DWORD)v24)
      {
        v20 = v24;
        v25 = 0;
      }
      else
      {
        v25 = (unsigned int *)acm_mem_alloc_data(0x1000uLL);
        acm_mem_alloc_info("<data>", v25, 4096, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1935, "verifyAclConstraintInternal");
        if (v25)
        {
          v26 = a1(a2, a3, 0, v23, v36, v25, &v35);
          if ((_DWORD)v26)
          {
            v20 = v26;
          }
          else
          {
            v27 = v35 - 4;
            if (v35 < 4)
            {
              v20 = 4294967291;
            }
            else
            {
              *a13 = *v25 != 0;
              if (a14)
              {
                v20 = DeserializeRequirement(v25 + 1, v27, (void **)&v34, &v33);
                if (!(_DWORD)v20)
                  *a14 = v34;
              }
              else
              {
                v20 = 0;
              }
            }
          }
        }
        else
        {
          v20 = 4294967292;
        }
      }
      v28 = v36;
      acm_mem_free_info("<data>", v23, v36, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1958, "verifyAclConstraintInternal");
      acm_mem_free_data(v23, v28);
      if (v25)
      {
        acm_mem_free_info("<data>", v25, 0x1000uLL, "/Library/Caches/com.apple.xbs/Sources/AppleCredentialManager_ClientLibs/common/LibCall.c", 1961, "verifyAclConstraintInternal");
        acm_mem_free_data(v25, 0x1000uLL);
      }
    }
    else
    {
      v20 = 4294967292;
    }
    goto LABEL_19;
  }
  v20 = SerializedVerifyAclConstraintSize;
LABEL_20:
  if (v34)
    Util_DeallocRequirement(v34);
LABEL_22:
  if ((_DWORD)v20)
    v29 = 70;
  else
    v29 = 10;
  if (v29 >= gACMLoggingLevel)
    printf("%s: %s: returning, err = %ld.\n", "ACM", "verifyAclConstraintInternal", (int)v20);
  return v20;
}

id provideEndpointWithUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__7;
  v14 = __Block_byref_object_dispose__7;
  v15 = 0;
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithMachServiceName:options:", CFSTR("com.apple.CoreAuthentication.daemon.EndpointProvider"), 4096);
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EF237E78);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRemoteObjectInterface:", v5);

  objc_msgSend(v4, "resume");
  objc_msgSend(v4, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_20);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __provideEndpointWithUID_block_invoke_6;
  v9[3] = &unk_1E708A5F0;
  v9[4] = &v10;
  objc_msgSend(v6, "provideEndpoint:uid:reply:", a1, a2, v9);

  objc_msgSend(v4, "invalidate");
  v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

void sub_1B97A0040(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void __provideEndpointWithUID_block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  LA_LOG_EndpointProvider();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __provideEndpointWithUID_block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __provideEndpointWithUID_block_invoke_6(uint64_t a1, void *a2)
{
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), a2);
}

void __runningInOsxSystemContext_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *__s1;

  __s1 = 0;
  if (!vproc_swap_string())
  {
    LA_LOG_EndpointProvider();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
      __runningInOsxSystemContext_block_invoke_cold_1((uint64_t)&__s1, v0, v1, v2, v3, v4, v5, v6);

    v7 = __s1;
    runningInOsxSystemContext_runningInOsxSystemContext = strcmp(__s1, "System") == 0;
    free(v7);
  }
}

void __runningInLoginWindowContext_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *__s1;

  __s1 = 0;
  if (!vproc_swap_string())
  {
    LA_LOG_EndpointProvider();
    v0 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
      __runningInLoginWindowContext_block_invoke_cold_1((uint64_t)&__s1, v0, v1, v2, v3, v4, v5, v6);

    v7 = __s1;
    runningInLoginWindowContext_runningInLoginWindowContext = strcmp(__s1, "LoginWindow") == 0;
    free(v7);
  }
}

void __provideEndpointWithUID_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9768000, a2, a3, "provideEndpoint failed with:'%@'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void provideEndpoint_cold_1(uint64_t a1, char a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("YES");
  if ((a2 & 1) == 0)
    v3 = CFSTR("NO");
  v4 = 138412546;
  v5 = a1;
  v6 = 2112;
  v7 = v3;
  _os_log_debug_impl(&dword_1B9768000, log, OS_LOG_TYPE_DEBUG, "isKnownProcess:'%@' %@", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_4();
}

void provideEndpoint_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_1B9768000, a1, a3, "runningInLoginWindowContext = %d", a5, a6, a7, a8, 0);
}

void provideEndpoint_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_10_0(&dword_1B9768000, a1, a3, "runningInSystemContext = %d", a5, a6, a7, a8, 0);
}

void __runningInOsxSystemContext_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9768000, a2, a3, "runningInSystemContext manager:'%s'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __runningInLoginWindowContext_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1B9768000, a2, a3, "runningInLoginWindowContext manager:'%s'", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_4();
}

void __getBSAuditTokenClass_block_invoke_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BaseBoardLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TKTokenAccessRequest.m"), 17, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBSAuditTokenClass_block_invoke_cold_2()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBSAuditTokenClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessRequest.m"), 18, CFSTR("Unable to find class %s"), "BSAuditToken");

  __break(1u);
}

void __getBSAuditTokenClass_block_invoke_cold_1_0()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBSAuditTokenClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 21, CFSTR("Unable to find class %s"), "BSAuditToken");

  __break(1u);
}

void BaseBoardLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *BaseBoardLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 20, CFSTR("%s"), *a1);

  __break(1u);
}

void __getBSProcessHandleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getBSProcessHandleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 22, CFSTR("Unable to find class %s"), "BSProcessHandle");

  __break(1u);
}

void __getSBSRemoteAlertConfigurationContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBSRemoteAlertConfigurationContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 32, CFSTR("Unable to find class %s"), "SBSRemoteAlertConfigurationContext");

  __break(1u);
}

void SpringBoardServicesLibrary_cold_1(_QWORD *a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 29, CFSTR("%s"), *a1);

  __break(1u);
}

void __getSBSRemoteAlertDefinitionClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBSRemoteAlertDefinitionClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 33, CFSTR("Unable to find class %s"), "SBSRemoteAlertDefinition");

  __break(1u);
}

void __getSBSRemoteAlertHandleClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBSRemoteAlertHandleClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 34, CFSTR("Unable to find class %s"), "SBSRemoteAlertHandle");

  __break(1u);
}

void __getSBSRemoteAlertPresentationTargetClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBSRemoteAlertPresentationTargetClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 30, CFSTR("Unable to find class %s"), "SBSRemoteAlertPresentationTarget");

  __break(1u);
}

void __getSBSRemoteAlertActivationContextClass_block_invoke_cold_1()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSBSRemoteAlertActivationContextClass(void)_block_invoke");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, CFSTR("TKTokenAccessUserPromptRemoteAlertSB.m"), 31, CFSTR("Unable to find class %s"), "SBSRemoteAlertActivationContext");

  __break(1u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

NSString *__cdecl NSHomeDirectoryForUser(NSString *userName)
{
  return (NSString *)MEMORY[0x1E0CB2C08](userName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t SecAccessControlAddConstraintForOperation()
{
  return MEMORY[0x1E0CD5E88]();
}

uint64_t SecAccessControlCopyData()
{
  return MEMORY[0x1E0CD5E90]();
}

uint64_t SecAccessControlCreate()
{
  return MEMORY[0x1E0CD5E98]();
}

uint64_t SecAccessControlCreateFromData()
{
  return MEMORY[0x1E0CD5EA0]();
}

SecAccessControlRef SecAccessControlCreateWithFlags(CFAllocatorRef allocator, CFTypeRef protection, SecAccessControlCreateFlags flags, CFErrorRef *error)
{
  return (SecAccessControlRef)MEMORY[0x1E0CD5EA8](allocator, protection, flags, error);
}

uint64_t SecAccessControlGetConstraint()
{
  return MEMORY[0x1E0CD5EB0]();
}

uint64_t SecAccessControlGetConstraints()
{
  return MEMORY[0x1E0CD5EB8]();
}

uint64_t SecAccessControlGetProtection()
{
  return MEMORY[0x1E0CD5EC0]();
}

uint64_t SecAccessControlIsBound()
{
  return MEMORY[0x1E0CD5ED8]();
}

uint64_t SecAccessControlSetBound()
{
  return MEMORY[0x1E0CD5EE0]();
}

uint64_t SecAccessControlSetConstraints()
{
  return MEMORY[0x1E0CD5EE8]();
}

uint64_t SecAccessControlSetProtection()
{
  return MEMORY[0x1E0CD5EF0]();
}

uint64_t SecCertificateCopyAttributeDictionary()
{
  return MEMORY[0x1E0CD5F40]();
}

CFDataRef SecCertificateCopyData(SecCertificateRef certificate)
{
  return (CFDataRef)MEMORY[0x1E0CD5F60](certificate);
}

SecKeyRef SecCertificateCopyKey(SecCertificateRef certificate)
{
  return (SecKeyRef)MEMORY[0x1E0CD5F98](certificate);
}

CFStringRef SecCertificateCopySubjectSummary(SecCertificateRef certificate)
{
  return (CFStringRef)MEMORY[0x1E0CD5FF8](certificate);
}

SecCertificateRef SecCertificateCreateWithData(CFAllocatorRef allocator, CFDataRef data)
{
  return (SecCertificateRef)MEMORY[0x1E0CD6010](allocator, data);
}

uint64_t SecCertificateGetKeyUsage()
{
  return MEMORY[0x1E0CD6028]();
}

uint64_t SecIdentityCreate()
{
  return MEMORY[0x1E0CD6280]();
}

CFDictionaryRef SecKeyCopyAttributes(SecKeyRef key)
{
  return (CFDictionaryRef)MEMORY[0x1E0CD62F0](key);
}

SecKeyRef SecKeyCreateWithData(CFDataRef keyData, CFDictionaryRef attributes, CFErrorRef *error)
{
  return (SecKeyRef)MEMORY[0x1E0CD63A0](keyData, attributes, error);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
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

uint64_t aks_create_bag()
{
  return MEMORY[0x1E0CFD380]();
}

uint64_t aks_get_device_state()
{
  return MEMORY[0x1E0CFD3C0]();
}

uint64_t aks_gid_attest()
{
  return MEMORY[0x1E0CFD3E0]();
}

uint64_t aks_invalidate_bag()
{
  return MEMORY[0x1E0CFD3E8]();
}

uint64_t aks_params_create()
{
  return MEMORY[0x1E0CFD438]();
}

uint64_t aks_params_free()
{
  return MEMORY[0x1E0CFD440]();
}

uint64_t aks_params_get_der()
{
  return MEMORY[0x1E0CFD448]();
}

uint64_t aks_params_set_data()
{
  return MEMORY[0x1E0CFD450]();
}

uint64_t aks_params_set_number()
{
  return MEMORY[0x1E0CFD458]();
}

uint64_t aks_ref_key_attest()
{
  return MEMORY[0x1E0CFD498]();
}

uint64_t aks_ref_key_compute_key()
{
  return MEMORY[0x1E0CFD4A0]();
}

uint64_t aks_ref_key_create()
{
  return MEMORY[0x1E0CFD4A8]();
}

uint64_t aks_ref_key_create_with_blob()
{
  return MEMORY[0x1E0CFD4B0]();
}

uint64_t aks_ref_key_decapsulate()
{
  return MEMORY[0x1E0CFD4B8]();
}

uint64_t aks_ref_key_delete()
{
  return MEMORY[0x1E0CFD4C0]();
}

uint64_t aks_ref_key_ecies_transcode()
{
  return MEMORY[0x1E0CFD4C8]();
}

uint64_t aks_ref_key_enable_test_keys()
{
  return MEMORY[0x1E0CFD4D0]();
}

uint64_t aks_ref_key_free()
{
  return MEMORY[0x1E0CFD4D8]();
}

uint64_t aks_ref_key_get_blob()
{
  return MEMORY[0x1E0CFD4E0]();
}

uint64_t aks_ref_key_get_external_data()
{
  return MEMORY[0x1E0CFD4E8]();
}

uint64_t aks_ref_key_get_handle()
{
  return MEMORY[0x1E0CFD4F0]();
}

uint64_t aks_ref_key_get_key_class()
{
  return MEMORY[0x1E0CFD4F8]();
}

uint64_t aks_ref_key_get_options()
{
  return MEMORY[0x1E0CFD500]();
}

uint64_t aks_ref_key_get_public_key()
{
  return MEMORY[0x1E0CFD508]();
}

uint64_t aks_ref_key_get_type()
{
  return MEMORY[0x1E0CFD510]();
}

uint64_t aks_ref_key_sign()
{
  return MEMORY[0x1E0CFD518]();
}

uint64_t aks_save_bag()
{
  return MEMORY[0x1E0CFD520]();
}

uint64_t aks_sik_attest()
{
  return MEMORY[0x1E0CFD5A0]();
}

uint64_t aks_system_key_attest()
{
  return MEMORY[0x1E0CFD5C0]();
}

uint64_t aks_system_key_collection()
{
  return MEMORY[0x1E0CFD5C8]();
}

uint64_t aks_system_key_get_public()
{
  return MEMORY[0x1E0CFD5D0]();
}

uint64_t aks_system_key_operate()
{
  return MEMORY[0x1E0CFD5D8]();
}

uint64_t aks_system_key_sign()
{
  return MEMORY[0x1E0CFD5E0]();
}

uint64_t aks_unload_bag()
{
  return MEMORY[0x1E0CFD5E8]();
}

uint64_t ccdigest()
{
  return MEMORY[0x1E0C81BD0]();
}

uint64_t ccsha1_di()
{
  return MEMORY[0x1E0C823D0]();
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
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

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x1E0C840D0](__s, __smax, *(_QWORD *)&__c, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
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

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_pidpath_audittoken(audit_token_t *audittoken, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C58](audittoken, buffer, *(_QWORD *)&buffersize);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

qos_class_t qos_class_main(void)
{
  return MEMORY[0x1E0C84F78]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

uint64_t vproc_swap_string()
{
  return MEMORY[0x1E0C85B90]();
}

