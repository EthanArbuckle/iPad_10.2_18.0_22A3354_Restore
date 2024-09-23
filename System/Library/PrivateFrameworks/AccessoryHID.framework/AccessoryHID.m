void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1)
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &loc_217369000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_217365000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_signpost_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_217365000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_217365000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = (_QWORD *)&loc_217369000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[305];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_217365000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

void sub_217366890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_217366EC4(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 80));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

uint64_t accessoryServer_registerAvailabilityChangedHandlerForServiceEntry(const char *a1, const void *a2, unsigned int a3)
{
  BOOL v6;
  NSObject *v7;
  const char *v8;
  uint64_t result;
  NSObject *v10;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    v7 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
  }
  else
  {
    v7 = *(NSObject **)gLogObjects;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = "null";
    if (a1)
      v8 = a1;
    v11[0] = 67109378;
    v11[1] = a3;
    v12 = 2080;
    v13 = v8;
    _os_log_impl(&dword_217365000, v7, OS_LOG_TYPE_DEFAULT, "Register AvailabilityChangedHandler (%d, %s)", (uint8_t *)v11, 0x12u);
  }
  result = 0;
  if (a2 && a1 && a3 <= 1)
  {
    pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
    _gNotificationName[a3] = a1;
    if (*((_QWORD *)&_gServerAvailabilityChangedHandler + a3))
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v10 = *(NSObject **)gLogObjects;
      }
      else
      {
        v10 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
      }
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
        accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_1((const char **)&_gNotificationName[a3], a3, v10);
      _Block_release(*((const void **)&_gServerAvailabilityChangedHandler + a3));
    }
    *((_QWORD *)&_gServerAvailabilityChangedHandler + a3) = _Block_copy(a2);
    pthread_rwlock_unlock(&_gServerAvailableTokenLock);
    return _SetupAvailabilityChangedHandlerForServiceEntry(a3);
  }
  return result;
}

uint64_t _SetupAvailabilityChangedHandlerForServiceEntry(unsigned int a1)
{
  BOOL v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  const char *v6;
  const char *v7;
  int *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  int v12;
  _QWORD handler[4];
  char v15;
  _BYTE buf[12];
  __int16 v17;
  unsigned int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  _BOOL4 v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    v3 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
  }
  else
  {
    v3 = *(NSObject **)gLogObjects;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
    v17 = 1024;
    v18 = a1;
    _os_log_impl(&dword_217365000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d)", buf, 0x12u);
  }
  if (a1 > 1)
    return 0;
  pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
  if (gLogObjects && gNumLogObjects >= 1)
  {
    v4 = *(NSObject **)gLogObjects;
  }
  else
  {
    v4 = MEMORY[0x24BDACB70];
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
  }
  v5 = a1;
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v6 = (const char *)_gNotificationName[a1];
    *(_QWORD *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
    *(_DWORD *)buf = 136315650;
    if (!v6)
      v6 = "null";
    v17 = 1024;
    v18 = a1;
    v19 = 2080;
    v20 = v6;
    _os_log_impl(&dword_217365000, v4, OS_LOG_TYPE_INFO, "%s (%d, %s)", buf, 0x1Cu);
  }
  v7 = (const char *)_gNotificationName[a1];
  if (v7 && *((_QWORD *)&_gServerAvailabilityChangedHandler + a1))
  {
    v8 = (int *)((char *)&_gServerAvailableToken + 4 * a1);
    if (*v8 == -1
      || (notify_cancel(*v8),
          *((_DWORD *)&_gServerAvailableToken + a1) = -1,
          pthread_rwlock_unlock(&_gServerAvailableTokenLock),
          usleep(0x186A0u),
          pthread_rwlock_wrlock(&_gServerAvailableTokenLock),
          (v7 = (const char *)_gNotificationName[a1]) != 0)
      && *v8 == -1)
    {
      handler[0] = MEMORY[0x24BDAC760];
      handler[1] = 0x40000000;
      handler[2] = ___SetupAvailabilityChangedHandlerForServiceEntry_block_invoke;
      handler[3] = &__block_descriptor_tmp_0;
      v15 = a1;
      if (notify_register_dispatch(v7, (int *)&_gServerAvailableToken + a1, MEMORY[0x24BDAC9B8], handler))
      {
        _Block_release(*((const void **)&_gServerAvailabilityChangedHandler + a1));
        v10 = 0;
        *((_QWORD *)&_gServerAvailabilityChangedHandler + v5) = 0;
        _gNotificationName[v5] = 0;
      }
      else
      {
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        notify_get_state(*((_DWORD *)&_gServerAvailableToken + a1), (uint64_t *)buf);
        _gServerAvailable[a1] = *(_QWORD *)buf != 0;
        v10 = 1;
      }
      goto LABEL_38;
    }
    if (gLogObjects && gNumLogObjects >= 1)
    {
      v9 = *(NSObject **)gLogObjects;
    }
    else
    {
      v9 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (const char *)_gNotificationName[a1];
      v12 = *((_DWORD *)&_gServerAvailableToken + a1);
      *(_DWORD *)buf = 136315906;
      if (!v11)
        v11 = "null";
      *(_QWORD *)&buf[4] = "_SetupAvailabilityChangedHandlerForServiceEntry";
      v17 = 1024;
      v18 = a1;
      v19 = 2080;
      v20 = v11;
      v21 = 1024;
      v22 = v12 != -1;
      _os_log_impl(&dword_217365000, v9, OS_LOG_TYPE_INFO, "%s did not register for notification (%d, %s), token (%d)", buf, 0x22u);
    }
  }
  v10 = 0;
LABEL_38:
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  return v10;
}

uint64_t accessoryServer_registerAvailabilityChangedHandler(const char *a1, const void *a2)
{
  return accessoryServer_registerAvailabilityChangedHandlerForServiceEntry(a1, a2, 0);
}

uint64_t accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(uint64_t result)
{
  unsigned int v1;
  BOOL v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  int v6;
  const void *v7;
  _DWORD v8[2];
  __int16 v9;
  const char *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (result <= 1)
  {
    v1 = result;
    pthread_rwlock_wrlock(&_gServerAvailableTokenLock);
    if (gLogObjects)
      v2 = gNumLogObjects < 1;
    else
      v2 = 1;
    if (v2)
    {
      v3 = MEMORY[0x24BDACB70];
      if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
        __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
    }
    else
    {
      v3 = *(NSObject **)gLogObjects;
    }
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = (const char *)_gNotificationName[v1];
      v5 = v1;
      if (!v4)
        v4 = "null";
      v8[0] = 67109378;
      v8[1] = v1;
      v9 = 2080;
      v10 = v4;
      _os_log_impl(&dword_217365000, v3, OS_LOG_TYPE_DEFAULT, "Unregister AvailabilityChangedHandler (%d, %s)", (uint8_t *)v8, 0x12u);
    }
    else
    {
      v5 = v1;
    }
    v6 = _gServerAvailableToken[v5];
    if (v6 != -1)
    {
      notify_cancel(v6);
      _gServerAvailableToken[v5] = -1;
    }
    v7 = (const void *)_gServerAvailabilityChangedHandler[v5];
    if (v7)
    {
      _Block_release(v7);
      _gServerAvailabilityChangedHandler[v5] = 0;
    }
    _gNotificationName[v5] = 0;
    return pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  }
  return result;
}

uint64_t accessoryServer_unregisterAvailabilityChangedHandler()
{
  return accessoryServer_unregisterAvailabilityChangedHandlerForServiceEntry(0);
}

uint64_t accessoryServer_isServerAvailableForServiceEntry(unsigned int a1)
{
  BOOL v2;
  const char *v3;
  uint64_t v4;
  NSObject *v6;
  const char *v7;
  int out_token;
  _BYTE state64[12];
  __int16 v10;
  unsigned int v11;
  __int16 v12;
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  if (a1 > 1)
    return 0;
  pthread_rwlock_rdlock(&_gServerAvailableTokenLock);
  if (_gServerAvailableToken[a1] == -1)
  {
    v3 = (const char *)_gNotificationName[a1];
    if (!v3)
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v6 = *(NSObject **)gLogObjects;
      }
      else
      {
        v6 = MEMORY[0x24BDACB70];
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          __39__AccessoryHIDClient_initWithDelegate___block_invoke_cold_1();
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = (const char *)_gNotificationName[a1];
        *(_QWORD *)&state64[4] = "accessoryServer_isServerAvailableForServiceEntry";
        *(_DWORD *)state64 = 136315650;
        if (!v7)
          v7 = "null";
        v10 = 1024;
        v11 = a1;
        v12 = 2080;
        v13 = v7;
        _os_log_impl(&dword_217365000, v6, OS_LOG_TYPE_INFO, "%s cannot get server state (%d, %s)", state64, 0x1Cu);
      }
      v4 = 0;
      goto LABEL_9;
    }
    out_token = -1431655766;
    *(_QWORD *)state64 = 0xAAAAAAAAAAAAAAAALL;
    notify_register_check(v3, &out_token);
    notify_get_state(out_token, (uint64_t *)state64);
    notify_cancel(out_token);
    v2 = *(_QWORD *)state64 == 0;
  }
  else
  {
    v2 = _gServerAvailable[a1] == 0;
  }
  v4 = !v2;
LABEL_9:
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  return v4;
}

uint64_t accessoryServer_isServerAvailable()
{
  return accessoryServer_isServerAvailableForServiceEntry(0);
}

uint64_t accessoryServer_serverIsUnreachableForServiceEntry(uint64_t a1)
{
  if (a1 <= 1)
    return _SetupAvailabilityChangedHandlerForServiceEntry(a1);
  return a1;
}

uint64_t accessoryServer_serverIsUnreachable()
{
  return _SetupAvailabilityChangedHandlerForServiceEntry(0);
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_1;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  unint64_t v4;
  int v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  const char *v9;
  os_log_t v10;
  unint64_t v11;
  uint8_t buf[4];
  const char *v13;
  __int16 v14;
  const char *v15;
  uint8_t v16[4];
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v2 = &loc_217369000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x24BDACB70];
    do
    {
      v7 = *(_QWORD *)(a1 + 32);
      v8 = *(const char **)(v7 + v3);
      if (!v8)
      {
        v8 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          LODWORD(v13) = v4;
          _os_log_error_impl(&dword_217365000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
          v7 = *(_QWORD *)(a1 + 32);
          v8 = "<Undefined>";
        }
      }
      v9 = *(const char **)(v7 + v3 + 8);
      if (!v9)
      {
        v9 = "<Undefined>";
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          __init_logging_modules_block_invoke_cold_1(v16, v4, &v17);
          v9 = "<Undefined>";
        }
      }
      v10 = os_log_create(v8, v9);
      *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8 * v4) = v10;
      if (v10)
      {
        ++v5;
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v13 = v8;
          v14 = 2080;
          v15 = v9;
          _os_log_debug_impl(&dword_217365000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_217365000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = (_QWORD *)&loc_217369000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = v2[305];
    LODWORD(v13) = v5;
    _os_log_impl(&dword_217365000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_217365000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_1(const char **a1, int a2, os_log_t log)
{
  const char *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  if (!*a1)
    v3 = "null";
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2080;
  v6 = v3;
  _os_log_fault_impl(&dword_217365000, log, OS_LOG_TYPE_FAULT, "AccessoryServerAvailabilityChangedHandler already set! (%d, %s)", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_2();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_217365000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF940](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF958](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x24BDAF960](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

