void sub_1AF64A994(_Unwind_Exception *a1)
{
  void *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 128));
  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t accessoryServer_isServerAvailable()
{
  return accessoryServer_isServerAvailableForServiceEntry(0);
}

void sub_1AF64AB64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void init_logging_signposts()
{
  init_logging_signpost_modules((uint64_t)&_gLogSignpostObjects, 4, (uint64_t)_kLoggingSignpostModuleEntries);
}

void init_logging_signpost_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __init_logging_signpost_modules_block_invoke;
  block[3] = &__block_descriptor_tmp_0;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_signpost_modules_onceToken != -1)
    dispatch_once(&init_logging_signpost_modules_onceToken, block);
}

void init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 9, (uint64_t)_kLoggingModuleEntries);
  init_logging_signposts();
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
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

  v14 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v6 = gNumLogObjects < 1;
  else
    v6 = 1;
  if (v6)
  {
    v7 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
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
    _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "Register AvailabilityChangedHandler (%d, %s)", (uint8_t *)v11, 0x12u);
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
        v10 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
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

uint64_t accessoryServer_registerAvailabilityChangedHandler(const char *a1, const void *a2)
{
  return accessoryServer_registerAvailabilityChangedHandlerForServiceEntry(a1, a2, 0);
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

  v14 = *MEMORY[0x1E0C80C00];
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
        v6 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
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
        _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_INFO, "%s cannot get server state (%d, %s)", state64, 0x1Cu);
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

  v23 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    v3 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
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
    _os_log_impl(&dword_1AF649000, v3, OS_LOG_TYPE_DEFAULT, "%s (%d)", buf, 0x12u);
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
    v4 = MEMORY[0x1E0C81028];
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
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
    _os_log_impl(&dword_1AF649000, v4, OS_LOG_TYPE_INFO, "%s (%d, %s)", buf, 0x1Cu);
  }
  v7 = (const char *)_gNotificationName[a1];
  if (v7 && *((_QWORD *)&_gServerAvailabilityChangedHandler + a1))
  {
    v8 = &_gServerAvailableToken[a1];
    if (*v8 == -1
      || (notify_cancel(*v8),
          _gServerAvailableToken[a1] = -1,
          pthread_rwlock_unlock(&_gServerAvailableTokenLock),
          usleep(0x186A0u),
          pthread_rwlock_wrlock(&_gServerAvailableTokenLock),
          (v7 = (const char *)_gNotificationName[a1]) != 0)
      && *v8 == -1)
    {
      handler[0] = MEMORY[0x1E0C809B0];
      handler[1] = 0x40000000;
      handler[2] = ___SetupAvailabilityChangedHandlerForServiceEntry_block_invoke;
      handler[3] = &__block_descriptor_tmp_1;
      v15 = a1;
      if (notify_register_dispatch(v7, &_gServerAvailableToken[a1], MEMORY[0x1E0C80D38], handler))
      {
        _Block_release(*((const void **)&_gServerAvailabilityChangedHandler + a1));
        v10 = 0;
        *((_QWORD *)&_gServerAvailabilityChangedHandler + v5) = 0;
        _gNotificationName[v5] = 0;
      }
      else
      {
        *(_QWORD *)buf = 0xAAAAAAAAAAAAAAAALL;
        notify_get_state(_gServerAvailableToken[a1], (uint64_t *)buf);
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
      v9 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = (const char *)_gNotificationName[a1];
      v12 = _gServerAvailableToken[a1];
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
      _os_log_impl(&dword_1AF649000, v9, OS_LOG_TYPE_INFO, "%s did not register for notification (%d, %s), token (%d)", buf, 0x22u);
    }
  }
  v10 = 0;
LABEL_38:
  pthread_rwlock_unlock(&_gServerAvailableTokenLock);
  return v10;
}

void __init_logging_signpost_modules_block_invoke(uint64_t a1)
{
  char **__ptr32 *v2;
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

  v18 = *MEMORY[0x1E0C80C00];
  v2 = &off_1AF670000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x1E0C81028];
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
          _os_log_error_impl(&dword_1AF649000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
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
          _os_log_debug_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_1AF649000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_1AF670000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 125);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogSignpostObjects = *(_QWORD *)(a1 + 40);
  gNumLogSignpostObjects = v11;
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  char **__ptr32 *v2;
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

  v18 = *MEMORY[0x1E0C80C00];
  v2 = &off_1AF670000;
  if (*(_BYTE *)(a1 + 48))
  {
    v3 = 0;
    v4 = 0;
    v5 = 0;
    v6 = MEMORY[0x1E0C81028];
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
          _os_log_error_impl(&dword_1AF649000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
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
          _os_log_debug_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_1AF649000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = &off_1AF670000;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 125);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

id acc_strings_bundle()
{
  void *v0;
  uint64_t v1;
  void *v2;

  v0 = (void *)acc_strings_bundle_bundle;
  if (!acc_strings_bundle_bundle)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreAccessories"));
    v1 = objc_claimAutoreleasedReturnValue();
    v2 = (void *)acc_strings_bundle_bundle;
    acc_strings_bundle_bundle = v1;

    v0 = (void *)acc_strings_bundle_bundle;
  }
  return v0;
}

id acc_strings_placeholder_Unknown()
{
  void *v0;
  void *v1;

  acc_strings_bundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "localizedStringForKey:value:table:", CFSTR("Unknown"), &stru_1E5FB4390, 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

CFBundleRef acc_strings_bundleCF()
{
  CFBundleRef result;

  result = (CFBundleRef)acc_strings_bundleCF_bundle;
  if (!acc_strings_bundleCF_bundle)
  {
    result = CFBundleGetBundleWithIdentifier(CFSTR("com.apple.CoreAccessories"));
    acc_strings_bundleCF_bundle = (uint64_t)result;
  }
  return result;
}

uint64_t acc_strings_copyPlaceholder_Unknown()
{
  acc_strings_placeholder_Unknown();
  return objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t acc_policies_shouldHideAccessoryWithModelNumber(uint64_t a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  const char *v5;
  const char *v6;
  int v8;
  const char *v9;
  __int16 v10;
  const char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("ShowHiddenAccessories"));

  if ((v3 & 1) != 0)
  {
    v4 = 0;
  }
  else
  {
    if (acc_policies_shouldHideAccessoryWithModelNumber_onceToken != -1)
      dispatch_once(&acc_policies_shouldHideAccessoryWithModelNumber_onceToken, &__block_literal_global);
    v4 = objc_msgSend((id)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers, "containsObject:", a1);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v5 = "NO";
    if ((_DWORD)v4)
      v6 = "YES";
    else
      v6 = "NO";
    if (v3)
      v5 = "YES";
    v8 = 136315394;
    v9 = v6;
    v10 = 2080;
    v11 = v5;
    _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "shouldHideAccessory: %s, showHiddenAccessories: %s", (uint8_t *)&v8, 0x16u);
  }
  return v4;
}

void __acc_policies_shouldHideAccessoryWithModelNumber_block_invoke()
{
  void *v0;

  v0 = (void *)acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldHideAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_1E5FBBA50;

}

BOOL acc_policies_endpointRequiresUserAuthorization(uint64_t a1)
{
  return !a1 || !*(_QWORD *)a1 || *(_DWORD *)(*(_QWORD *)a1 + 8) != 2;
}

uint64_t acc_policies_shouldOverrideNameOnAccessoryWithModelNumber(uint64_t a1)
{
  uint64_t v2;
  const char *v3;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken != -1)
    dispatch_once(&acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_onceToken, &__block_literal_global_50);
  v2 = objc_msgSend((id)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers, "containsObject:", a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v3 = "NO";
    if ((_DWORD)v2)
      v3 = "YES";
    v5 = 136315138;
    v6 = v3;
    _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "shouldOverrideName: %s", (uint8_t *)&v5, 0xCu);
  }
  return v2;
}

void __acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_block_invoke()
{
  void *v0;

  v0 = (void *)acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers;
  acc_policies_shouldOverrideNameOnAccessoryWithModelNumber_hiddenModelNumbers = (uint64_t)&unk_1E5FBBA68;

}

BOOL acc_policies_isTransportSupervised(unsigned int a1, int a2)
{
  _BOOL4 v2;

  v2 = ((1 << a1) & 0x1C3) != 0 && a2 == 1;
  return a1 <= 8 && v2;
}

uint64_t acc_policies_shouldResetLightningBusWhenTransportIsNoLongerRestricted(unsigned int a1, int a2)
{
  if ((a2 - 3) < 0xFFFFFFFE)
    return (a1 < 9) & (0x1C3u >> a1);
  else
    return 0;
}

BOOL acc_policies_endpointRequiresChargingCurrentLimit(uint64_t a1, int a2, int a3, unsigned int a4, unsigned int a5, _WORD *a6)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned __int16 v13;
  int v14;
  int v15;
  int v16;
  int v17;
  unsigned int v18;
  int v19;
  unsigned int v20;
  _BOOL8 v21;
  CFTypeRef *v22;
  const void *v23;
  const void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  void *v31;
  _BOOL4 v32;
  void *v33;
  void *v34;
  _BOOL4 v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  BOOL v40;
  _BOOL4 v41;
  int v42;
  uint64_t v44;
  int v45;
  id obj;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[128];
  uint8_t buf[4];
  int v62;
  __int16 v63;
  int v64;
  __int16 v65;
  unsigned int v66;
  __int16 v67;
  unsigned int v68;
  __int16 v69;
  unsigned int v70;
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  _QWORD v75[3];
  _QWORD v76[3];
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[3];
  _QWORD v83[3];
  _QWORD v84[3];
  _QWORD v85[3];
  _QWORD v86[3];
  _QWORD v87[9];

  v87[6] = *MEMORY[0x1E0C80C00];
  v85[0] = CFSTR("nameMatch");
  v85[1] = CFSTR("modelContain");
  v86[0] = CFSTR("IntelliLink");
  v86[1] = CFSTR("1.0");
  v85[2] = CFSTR("overrideCurrentLimit");
  v86[2] = &unk_1E5FBBA80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v86, v85, 3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v87[0] = v6;
  v83[0] = CFSTR("nameMatch");
  v83[1] = CFSTR("modelContain");
  v84[0] = CFSTR("MyLink");
  v84[1] = CFSTR("1.0");
  v83[2] = CFSTR("overrideCurrentLimit");
  v84[2] = &unk_1E5FBBA80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v84, v83, 3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v87[1] = v7;
  v81[0] = CFSTR("nameMatch");
  v81[1] = CFSTR("manufacturerMatch");
  v82[0] = CFSTR("iPL24Z");
  v82[1] = CFSTR("SDI Technologies");
  v81[2] = CFSTR("overrideCurrentLimit");
  v82[2] = &unk_1E5FBBA80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v82, v81, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v87[2] = v8;
  v79[0] = CFSTR("modelMatch");
  v79[1] = CFSTR("manufacturerMatch");
  v80[0] = CFSTR("MIB2");
  v80[1] = CFSTR("HARMAN");
  v79[2] = CFSTR("overrideCurrentLimit");
  v80[2] = &unk_1E5FBBA98;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = v9;
  v77[0] = CFSTR("modelMatch");
  v77[1] = CFSTR("manufacturerMatch");
  v78[0] = CFSTR("Range Rover Velar");
  v78[1] = CFSTR("Land Rover");
  v77[2] = CFSTR("overrideCurrentLimit");
  v78[2] = &unk_1E5FBBA80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v87[4] = v10;
  v75[0] = CFSTR("modelMatch");
  v75[1] = CFSTR("manufacturerMatch");
  v76[0] = CFSTR("Jaguar I-PACE");
  v76[1] = CFSTR("Jaguar");
  v75[2] = CFSTR("overrideCurrentLimit");
  v76[2] = &unk_1E5FBBA80;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v87[5] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v87, 6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("ChargingPowerOverride"));
  v14 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("ChargingPowerBehavior"));
  v15 = acc_userDefaultsIapd_copyIntegerForKey((uint64_t)CFSTR("ChargingPowerBehavior"));
  if (v15 <= 0)
    v16 = a5;
  else
    v16 = v15;
  if ((v14 - 3) < 6)
  {
    v17 = 10 * v14 - 5;
    v18 = a4;
LABEL_7:
    v19 = 1;
    goto LABEL_8;
  }
  v17 = 45;
  v18 = a4;
  if (v14 != 1)
    goto LABEL_7;
  v19 = 0;
LABEL_8:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110656;
    v62 = a2;
    v63 = 1024;
    v64 = a3;
    v65 = 1024;
    v66 = v19;
    v67 = 1024;
    v68 = v13;
    v69 = 1024;
    v70 = v18;
    v71 = 1024;
    v72 = v14;
    v73 = 1024;
    v74 = v17;
    _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d checkChargingCurrentLimit=%d chargingCurrentLimit=%d inLimit=%d behavior=%d batteryThreshold=%d", buf, 0x2Cu);
  }
  if (!v19)
    goto LABEL_66;
  v55 = 0;
  v20 = v13;
  v21 = v13 < v18 && v13 != 0;
  if (a1 && !v21)
  {
    v22 = *(CFTypeRef **)(a1 + 64);
    if (v22)
    {
      if (*v22)
        v55 = (void *)CFRetain(*v22);
      else
        v55 = 0;
      v23 = *(const void **)(*(_QWORD *)(a1 + 64) + 16);
      if (v23)
        v54 = (void *)CFRetain(v23);
      else
        v54 = 0;
      v24 = *(const void **)(*(_QWORD *)(a1 + 64) + 8);
      if (v24)
        v53 = (void *)CFRetain(v24);
      else
        v53 = 0;
      if (v55 && v54)
      {
        v45 = v17;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = v12;
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
        if (v25)
        {
          v26 = v25;
          LODWORD(v44) = v13;
          HIDWORD(v44) = v16;
          v27 = *(_QWORD *)v57;
          while (2)
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v57 != v27)
                objc_enumerationMutation(obj);
              v29 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
              objc_msgSend(v29, "objectForKey:", CFSTR("nameMatch"), v44);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("nameContain"));
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              v32 = _matchOrContainString(v55, v30, v31);

              objc_msgSend(v29, "objectForKey:", CFSTR("modelMatch"));
              v33 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("modelContain"));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              v35 = _matchOrContainString(v54, v33, v34);

              objc_msgSend(v29, "objectForKey:", CFSTR("manufacturerMatch"));
              v36 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v29, "objectForKey:", CFSTR("manufacturerContain"));
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = _matchOrContainString(v53, v36, v37);

              if (v32 && v35 && v38)
              {
                objc_msgSend(v29, "objectForKey:", CFSTR("overrideCurrentLimit"));
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v20 = (unsigned __int16)objc_msgSend(v39, "intValue");

                v18 = a4;
                v16 = HIDWORD(v44);
                goto LABEL_40;
              }
            }
            v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v60, 16);
            if (v26)
              continue;
            break;
          }
          v18 = a4;
          v20 = v44;
          v16 = HIDWORD(v44);
        }
LABEL_40:

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 67110400;
          v62 = a2;
          v63 = 1024;
          v64 = a3;
          v65 = 1024;
          v66 = v20;
          v67 = 1024;
          v68 = v18;
          v69 = 1024;
          v70 = v16;
          v71 = 1024;
          v72 = v45;
          _os_log_debug_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "RequiresChargingCurrentLimit: isApple=%d deviceType=%d chargingCurrentLimit=%d inLimit=%d battery=%d threshold=%d", buf, 0x26u);
        }
        if (a3 != 3 && v16 >= v45 && (a2 & 1) == 0 && (v18 > 0x5DC || v20 >= 0x5DD) && v20 - 1501 < 0xFFFFFA24)
          v20 = 1500;
        if (v20)
          v40 = v20 >= v18;
        else
          v40 = 1;
        v21 = !v40;
        goto LABEL_55;
      }
LABEL_67:
      v21 = 0;
      v41 = a6 != 0;
      goto LABEL_58;
    }
LABEL_66:
    v54 = 0;
    v55 = 0;
    v53 = 0;
    goto LABEL_67;
  }
  v53 = 0;
  v54 = 0;
LABEL_55:
  v41 = a6 != 0;
  if (a6 && v21)
  {
    *a6 = v20;
    v41 = 1;
    v21 = 1;
  }
LABEL_58:
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    if (v41)
      v42 = (unsigned __int16)*a6;
    else
      v42 = -1;
    *(_DWORD *)buf = 67110656;
    v62 = a2;
    v63 = 1024;
    v64 = a3;
    v65 = 1024;
    v66 = a5;
    v67 = 1024;
    v68 = v16;
    v69 = 1024;
    v70 = v18;
    v71 = 1024;
    v72 = v42;
    v73 = 1024;
    v74 = v21;
    _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "RequiresChargingCurrentLimit: isApple=%d, deviceType=%d, batt=%d(%d), %d->%d, return %d", buf, 0x2Cu);
  }

  return v21;
}

BOOL _matchOrContainString(void *a1, void *a2, void *a3)
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  _BOOL8 v9;
  uint64_t v10;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)v7;
  v9 = (v6 | v7) == 0;
  if (v5)
  {
    if (v6)
    {
      v10 = objc_msgSend(v5, "isEqualToString:", v6);
LABEL_6:
      v9 = v10;
      goto LABEL_7;
    }
    if (v7)
    {
      v10 = objc_msgSend(v5, "containsString:", v7);
      goto LABEL_6;
    }
  }
LABEL_7:

  return v9;
}

BOOL acc_policies_shouldFailAuthOnOOBPairingFailure(_BOOL8 result)
{
  if (result)
    return *(_DWORD *)(result + 24) == 9;
  return result;
}

uint64_t acc_policies_allowACCAuthProtocolOnAllTransport()
{
  void *v0;
  uint64_t v1;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("AllowACCAuthProtocolOnAllTransport"));

  return v1;
}

uint64_t acc_policies_allowACCAuthProtocolOnTransport(int a1)
{
  void *v2;
  char v3;
  void *v4;
  int v5;
  void *v6;
  unsigned int v7;
  int v9;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("EnableACCAuthProtocolOnNFC"));

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLForKey:", CFSTR("DisableACCAuthProtocolOnInductive"));

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "BOOLForKey:", CFSTR("AllowACCAuthProtocolOnAllTransport"));

  if (a1 == 13 && (v3 & 1) != 0)
    return 1;
  v9 = v5 ^ 1;
  if (a1 != 12)
    v9 = 0;
  return v9 | v7;
}

uint64_t acc_policies_productTypeNeedsPreArmDeviceIdentity(const __CFString *a1)
{
  CFTypeID v2;
  BOOL v3;

  if (a1)
  {
    v2 = CFGetTypeID(a1);
    if (v2 == CFStringGetTypeID())
    {
      v3 = CFStringCompare(a1, CFSTR("iPhone13,1"), 0) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("iPhone13,2"), 0) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("iPhone13,3"), 0) == kCFCompareEqualTo
        || CFStringCompare(a1, CFSTR("iPhone13,4"), 0) == kCFCompareEqualTo;
      acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm = v3;
    }
  }
  return acc_policies_productTypeNeedsPreArmDeviceIdentity_modelNeedsPreArm;
}

uint64_t acc_policies_deviceNeedsPreArmDeviceIdentity()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  _BOOL4 v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  int v21;
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    v18 = 0;
    v16 = 0;
  }
  else
  {
    +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "stringForKey:", CFSTR("DeviceIdentityPreArmDateOverride"));
    v1 = (void *)objc_claimAutoreleasedReturnValue();

    if (v1)
    {
      v2 = v1;
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate", (uint8_t *)&v21, 2u);
      }
      objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0CB3500], "punctuationCharacterSet");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = objc_msgSend(v7, "count");
      v9 = v8 > 2;
      if (v8 < 3)
      {
        v14 = 0;
      }
      else
      {
        v10 = objc_alloc_init(MEMORY[0x1E0C99D78]);
        objc_msgSend(v7, "objectAtIndexedSubscript:", 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setDay:", objc_msgSend(v11, "integerValue"));

        objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setMonth:", objc_msgSend(v12, "integerValue"));

        objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setYear:", objc_msgSend(v13, "integerValue"));

        objc_msgSend(v3, "dateFromComponents:", v10);
        v14 = (id)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
        {
          v21 = 138412290;
          v22 = v14;
          _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: _parseDate: %@", (uint8_t *)&v21, 0xCu);
        }

      }
    }
    else
    {
      v14 = 0;
      v9 = 0;
    }
    v15 = v14;
    v16 = v15;
    if (v9 && v15)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v21) = 0;
        _os_log_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "acc_policies_deviceNeedsPreArmDeviceIdentity: override", (uint8_t *)&v21, 2u);
      }
      objc_storeStrong((id *)&acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, v14);
      +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setObject:forKey:", acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, CFSTR("PreArmDeviceIdentityDate"));

    }
    v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
      goto LABEL_19;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken != -1)
      dispatch_once(&acc_policies_deviceNeedsPreArmDeviceIdentity_onceToken, &__block_literal_global_105);
    v18 = acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    if (acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
LABEL_19:
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend((id)v18, "compare:", v19) == -1;

    }
  }

  return v18;
}

void __acc_policies_deviceNeedsPreArmDeviceIdentity_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed = objc_msgSend(v0, "BOOLForKey:", CFSTR("DidPreArmDeviceIdentity"));

  if (!acc_policies_deviceNeedsPreArmDeviceIdentity_alreadyPreArmed)
  {
    +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKey:", CFSTR("PreArmDeviceIdentityDate"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
    acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v2;

    if (!acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate)
    {
      objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v4 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v4, "setDay:", 1);
      objc_msgSend(v4, "setMonth:", 3);
      objc_msgSend(v4, "setYear:", 2021);
      objc_msgSend(v13, "dateFromComponents:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_alloc_init(MEMORY[0x1E0C99D78]);
      objc_msgSend(v6, "setDay:", 1);
      objc_msgSend(v6, "setMonth:", 9);
      objc_msgSend(v6, "setYear:", 2021);
      objc_msgSend(v13, "dateFromComponents:", v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, v7);
      objc_msgSend(v8, "duration");
      objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v5, (double)(int)(arc4random() % (int)v9));
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = (void *)acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate;
      acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate = v10;

      +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setObject:forKey:", acc_policies_deviceNeedsPreArmDeviceIdentity_preArmDate, CFSTR("PreArmDeviceIdentityDate"));

    }
  }
}

void acc_policies_deviceDidPreArmDeviceIdentity()
{
  id v0;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setBool:forKey:", 1, CFSTR("DidPreArmDeviceIdentity"));

}

BOOL acc_policies_allowAudioProductCertsOnTransport(int a1)
{
  return (a1 & 0xFFFFFFFE) == 2;
}

uint64_t acc_policies_supportInductivePowerTX(int a1, unsigned int a2)
{
  unsigned int v2;

  if (a1 == 2)
    v2 = 1;
  else
    v2 = a2;
  if (a1 == 3)
    v2 = a2;
  if (a1 == 1)
    return 0;
  else
    return v2;
}

unint64_t systemInfo_getCurrentUnixTime()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

unint64_t systemInfo_getCurrentUnixTimeMS()
{
  void *v0;
  double v1;
  double v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v3 = vcvtad_u64_f64(v2 * 1000.0);
  if (v2 <= 0.0)
    return 0;
  else
    return v3;
}

uint64_t systemInfo_isInternalBuild()
{
  if (systemInfo_isInternalBuild_onceToken != -1)
    dispatch_once(&systemInfo_isInternalBuild_onceToken, &__block_literal_global_0);
  return systemInfo_isInternalBuild_internalBuild;
}

uint64_t __systemInfo_isInternalBuild_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_isInternalBuild_internalBuild = result;
  return result;
}

uint64_t systemInfo_isDeveloperBuild()
{
  if (systemInfo_isDeveloperBuild_onceToken != -1)
    dispatch_once(&systemInfo_isDeveloperBuild_onceToken, &__block_literal_global_2);
  return systemInfo_isDeveloperBuild_developerBuild;
}

void __systemInfo_isDeveloperBuild_block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    systemInfo_isDeveloperBuild_developerBuild = CFEqual(v0, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
  else
  {
    systemInfo_isDeveloperBuild_developerBuild = 0;
  }
}

uint64_t systemInfo_systemSupportsPearl()
{
  if (systemInfo_systemSupportsPearl_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsPearl_onceToken, &__block_literal_global_7);
  return systemInfo_systemSupportsPearl_supportsPearl;
}

uint64_t __systemInfo_systemSupportsPearl_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsPearl_supportsPearl = result;
  return result;
}

uint64_t systemInfo_systemSupportsWAPI()
{
  if (systemInfo_systemSupportsWAPI_onceToken != -1)
    dispatch_once(&systemInfo_systemSupportsWAPI_onceToken, &__block_literal_global_10);
  return systemInfo_systemSupportsWAPI_supportsWAPI;
}

uint64_t __systemInfo_systemSupportsWAPI_block_invoke()
{
  uint64_t result;

  result = MGGetBoolAnswer();
  systemInfo_systemSupportsWAPI_supportsWAPI = result;
  return result;
}

uint64_t systemInfo_copyDeviceClass()
{
  return MGCopyAnswer();
}

uint64_t systemInfo_isHomePod()
{
  void *v0;
  uint64_t v1;

  v0 = (void *)MGCopyAnswer();
  v1 = objc_msgSend(v0, "isEqualToString:", CFSTR("AudioAccessory"));

  return v1;
}

uint64_t systemInfo_copyRegionCode()
{
  CFTypeID v0;
  uint64_t result;

  if (systemInfo_copyRegionCode_onceToken != -1)
    dispatch_once(&systemInfo_copyRegionCode_onceToken, &__block_literal_global_15);
  if (systemInfo_copyRegionCode_regionCode)
  {
    v0 = CFGetTypeID((CFTypeRef)systemInfo_copyRegionCode_regionCode);
    if (v0 == CFStringGetTypeID())
      return systemInfo_copyRegionCode_regionCode;
  }
  result = 0;
  systemInfo_copyRegionCode_regionCode = 0;
  return result;
}

uint64_t __systemInfo_copyRegionCode_block_invoke()
{
  uint64_t result;

  result = MGCopyAnswer();
  systemInfo_copyRegionCode_regionCode = result;
  return result;
}

const void *systemInfo_copyProductType()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

const void *systemInfo_copyProductVersion()
{
  const void *result;
  const void *v1;
  CFTypeID v2;

  result = (const void *)MGCopyAnswer();
  if (result)
  {
    v1 = result;
    v2 = CFGetTypeID(result);
    if (v2 == CFStringGetTypeID())
      return v1;
    else
      return 0;
  }
  return result;
}

void sub_1AF65022C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1AF6508F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1AF652228(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  void *v21;
  id *v22;
  id *v23;

  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  objc_sync_exit(v21);
  _Unwind_Resume(a1);
}

void sub_1AF6543F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6545D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF654F6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6554F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF655A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF655C00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6560EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1AF65E5E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t acc_userDefaults_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaults_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaults_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaults_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

void acc_userDefaults_setArrayForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setObject:forKey:", a2, a1);

}

void acc_userDefaults_setIntegerForKey(uint64_t a1, uint64_t a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a2, a1);

}

void acc_userDefaults_setDoubleForKey(uint64_t a1, double a2)
{
  id v4;

  +[ACCUserDefaults sharedDefaults](ACCUserDefaults, "sharedDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDouble:forKey:", a1, a2);

}

uint64_t acc_userDefaultsIapd_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t acc_userDefaultsIapd_copyStringForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyArrayForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "arrayForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyDictionaryForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dictionaryForKey:", a1);
  v3 = objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t acc_userDefaultsIapd_copyIntegerForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", a1);

  return v3;
}

double acc_userDefaultsIapd_copyDoubleForKey(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;

  +[ACCUserDefaults sharedDefaultsIapd](ACCUserDefaults, "sharedDefaultsIapd");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleForKey:", a1);
  v4 = v3;

  return v4;
}

uint64_t acc_userDefaultsLogging_BOOLForKey(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  +[ACCUserDefaults sharedDefaultsLogging](ACCUserDefaults, "sharedDefaultsLogging");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLForKey:", a1);

  return v3;
}

uint64_t TLV8Get(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, _QWORD *a5, unsigned __int8 **a6)
{
  unsigned __int8 *v6;
  uint64_t v7;
  unsigned __int8 *v8;
  int v9;
  uint64_t result;

  do
  {
    if (a1 == a2)
      return 4294960569;
    if (a1 >= a2)
      return 4294960591;
    if ((unint64_t)(a2 - a1) < 2)
      return 4294960569;
    v6 = a1 + 2;
    v7 = a1[1];
    v8 = &a1[v7 + 2];
    if (v8 > a2)
      return 4294960546;
    v9 = *a1;
    a1 += v7 + 2;
  }
  while (v9 != a3);
  if (a4)
    *a4 = v6;
  if (a5)
    *a5 = v7;
  result = 0;
  if (a6)
    *a6 = v8;
  return result;
}

uint64_t TLV8GetNext(_BYTE *a1, _BYTE *a2, _BYTE *a3, _QWORD *a4, _QWORD *a5, _QWORD *a6)
{
  uint64_t v6;
  _BYTE *v7;
  uint64_t result;

  if (a1 == a2)
    return 4294960569;
  if (a1 >= a2)
    return 4294960591;
  if ((unint64_t)(a2 - a1) < 2)
    return 4294960569;
  v6 = a1[1];
  v7 = &a1[v6 + 2];
  if (v7 > a2)
    return 4294960546;
  *a3 = *a1;
  *a4 = a1 + 2;
  *a5 = v6;
  result = 0;
  if (a6)
    *a6 = v7;
  return result;
}

uint64_t TLV8GetBytes(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unint64_t a4, size_t a5, char *__dst, _QWORD *a7, unsigned __int8 **a8)
{
  const void *v14;
  size_t v15;
  unsigned __int8 *v16;
  int v17;
  char *v18;
  char *v19;
  unsigned __int8 *v20;
  const void *v21;
  size_t v22;
  uint64_t result;

  do
  {
    if (a1 == a2)
      return 4294960569;
    if (a1 >= a2)
      return 4294960591;
    if ((unint64_t)(a2 - a1) < 2)
      return 4294960569;
    v14 = a1 + 2;
    v15 = a1[1];
    v16 = &a1[v15 + 2];
    if (v16 > a2)
      return 4294960546;
    v17 = *a1;
    a1 += v15 + 2;
  }
  while (v17 != a3);
  if (v15 > a5)
    return 4294960545;
  v18 = &__dst[a5];
  memcpy(__dst, v14, v15);
  v19 = &__dst[v15];
LABEL_8:
  v20 = v16;
  while (a2 > v20)
  {
    if ((unint64_t)(a2 - v20) < 2)
      break;
    v21 = v20 + 2;
    v22 = v20[1];
    v16 = &v20[v22 + 2];
    if (v16 > a2 || *v20 != a3)
      break;
    v20 += v22 + 2;
    if ((_DWORD)v22)
    {
      if (v18 - v19 < v22)
        return 4294960545;
      memcpy(v19, v21, v22);
      v19 += v22;
      goto LABEL_8;
    }
  }
  if (v19 - __dst < a4)
    return 4294960546;
  if (a7)
    *a7 = v19 - __dst;
  result = 0;
  if (a8)
    *a8 = v20;
  return result;
}

unint64_t TLV8GetSInt64(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int *a4, unsigned __int8 **a5)
{
  unsigned __int8 *v5;
  char *v6;
  uint64_t v7;
  unint64_t result;
  int v9;

  do
  {
    if (a1 == a2)
    {
LABEL_16:
      result = 0;
      v9 = -6727;
      goto LABEL_13;
    }
    v5 = a1;
    if (a1 >= a2)
    {
      result = 0;
      v9 = -6705;
      goto LABEL_13;
    }
    if ((unint64_t)(a2 - a1) < 2)
      goto LABEL_16;
    v6 = (char *)(a1 + 2);
    v7 = a1[1];
    a1 += v7 + 2;
    if (a1 > a2)
    {
      result = 0;
      v9 = -6750;
      goto LABEL_13;
    }
  }
  while (*v5 != a3);
  if (a5)
    *a5 = a1;
  result = 0;
  v9 = -6743;
  switch((int)v7)
  {
    case 1:
      v9 = 0;
      result = *v6;
      break;
    case 2:
      v9 = 0;
      result = (__int16)(v5[3] << 8) | (unint64_t)v5[2];
      break;
    case 4:
      v9 = 0;
      result = *(int *)v6;
      break;
    case 8:
      v9 = 0;
      result = *(_QWORD *)v6;
      break;
    default:
      break;
  }
LABEL_13:
  if (a4)
    *a4 = v9;
  return result;
}

unint64_t TLVParseSInt64(unsigned __int8 *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result;
  int v6;

  result = 0;
  v6 = -6743;
  if ((a3 & 1) != 0)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        v6 = 0;
        result = (char)*a1;
        if (a4)
          goto LABEL_16;
        return result;
      case 2:
        v6 = 0;
        result = (__int16)(*a1 << 8) | (unint64_t)a1[1];
        if (a4)
          goto LABEL_16;
        return result;
      case 4:
        v6 = 0;
        result = (*a1 << 24) | ((unint64_t)a1[1] << 16) | ((unint64_t)a1[2] << 8) | a1[3];
        goto LABEL_15;
      case 8:
        v6 = 0;
        result = bswap64(*(_QWORD *)a1);
        if (!a4)
          return result;
        goto LABEL_16;
      default:
LABEL_15:
        if (a4)
LABEL_16:
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        v6 = 0;
        result = (__int16)(a1[1] << 8) | (unint64_t)*a1;
        if (a4)
          goto LABEL_16;
        break;
      case 4:
        v6 = 0;
        result = *(int *)a1;
        if (a4)
          goto LABEL_16;
        break;
      case 8:
        v6 = 0;
        result = *(_QWORD *)a1;
        if (a4)
          goto LABEL_16;
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

uint64_t TLV8GetUInt64(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int *a4, unsigned __int8 **a5)
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  uint64_t v7;
  uint64_t result;
  int v9;

  do
  {
    if (a1 == a2)
    {
LABEL_16:
      result = 0;
      v9 = -6727;
      goto LABEL_13;
    }
    v5 = a1;
    if (a1 >= a2)
    {
      result = 0;
      v9 = -6705;
      goto LABEL_13;
    }
    if ((unint64_t)(a2 - a1) < 2)
      goto LABEL_16;
    v6 = a1 + 2;
    v7 = a1[1];
    a1 += v7 + 2;
    if (a1 > a2)
    {
      result = 0;
      v9 = -6750;
      goto LABEL_13;
    }
  }
  while (*v5 != a3);
  if (a5)
    *a5 = a1;
  result = 0;
  v9 = -6743;
  switch((int)v7)
  {
    case 1:
      v9 = 0;
      result = *v6;
      break;
    case 2:
      v9 = 0;
      result = *((unsigned __int16 *)v5 + 1);
      break;
    case 4:
      v9 = 0;
      result = *(unsigned int *)v6;
      break;
    case 8:
      v9 = 0;
      result = *(_QWORD *)v6;
      break;
    default:
      break;
  }
LABEL_13:
  if (a4)
    *a4 = v9;
  return result;
}

unint64_t TLVParseUInt64(unsigned int *a1, uint64_t a2, char a3, int *a4)
{
  unint64_t result;
  int v6;

  result = 0;
  v6 = -6743;
  if ((a3 & 1) != 0)
  {
    switch(a2)
    {
      case 1:
LABEL_6:
        v6 = 0;
        result = *(unsigned __int8 *)a1;
        if (a4)
          goto LABEL_16;
        return result;
      case 2:
        v6 = 0;
        result = __rev16(*(unsigned __int16 *)a1);
        if (a4)
          goto LABEL_16;
        return result;
      case 4:
        v6 = 0;
        result = bswap32(*a1);
        goto LABEL_15;
      case 8:
        v6 = 0;
        result = bswap64(*(_QWORD *)a1);
        if (!a4)
          return result;
        goto LABEL_16;
      default:
LABEL_15:
        if (a4)
LABEL_16:
          *a4 = v6;
        break;
    }
  }
  else
  {
    switch(a2)
    {
      case 1:
        goto LABEL_6;
      case 2:
        v6 = 0;
        result = *(unsigned __int16 *)a1;
        if (a4)
          goto LABEL_16;
        break;
      case 4:
        v6 = 0;
        result = *a1;
        if (a4)
          goto LABEL_16;
        break;
      case 8:
        v6 = 0;
        result = *(_QWORD *)a1;
        if (a4)
          goto LABEL_16;
        break;
      default:
        goto LABEL_15;
    }
  }
  return result;
}

unsigned __int8 *TLV8CopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int8 **a4, unsigned __int8 **a5, int *a6)
{
  int v10;
  unsigned __int8 *v11;
  unsigned __int8 *v12;
  size_t v13;
  unsigned __int8 *v14;
  unsigned __int8 *v16[4];

  memset(v16, 170, sizeof(v16));
  v10 = TLV8GetOrCopyCoalesced(a1, a2, a3, &v16[3], (size_t *)&v16[2], &v16[1], v16);
  if (v10)
  {
    v11 = 0;
    goto LABEL_10;
  }
  v11 = v16[1];
  v12 = v16[2];
  if (!v16[1])
  {
    if (v16[2] <= (unsigned __int8 *)1)
      v13 = 1;
    else
      v13 = (size_t)v16[2];
    v14 = (unsigned __int8 *)malloc_type_malloc(v13, 0xA969B135uLL);
    v11 = v14;
    if (!v14)
    {
      v10 = -6728;
      goto LABEL_10;
    }
    memcpy(v14, v16[3], (size_t)v12);
  }
  *a4 = v12;
  v10 = 0;
  if (a5)
    *a5 = a1;
LABEL_10:
  if (a6)
    *a6 = v10;
  return v11;
}

uint64_t TLV8GetOrCopyCoalesced(unsigned __int8 *a1, unsigned __int8 *a2, int a3, _QWORD *a4, size_t *a5, _QWORD *a6, unsigned __int8 **a7)
{
  const void *v9;
  size_t v10;
  unsigned __int8 *v11;
  int v12;
  char *v13;
  void *v14;
  size_t v15;
  size_t v16;
  const void *v17;
  unsigned __int8 *v18;
  char *v19;
  uint64_t result;
  _QWORD *v21;
  size_t *v22;
  _QWORD *v23;
  unsigned __int8 **v24;

  do
  {
    if (a1 == a2)
      return 4294960569;
    if (a1 >= a2)
      return 4294960591;
    if ((unint64_t)(a2 - a1) < 2)
      return 4294960569;
    v9 = a1 + 2;
    v10 = a1[1];
    v11 = &a1[v10 + 2];
    if (v11 > a2)
      return 4294960546;
    v12 = *a1;
    a1 += v10 + 2;
  }
  while (v12 != a3);
  v13 = 0;
  while (2)
  {
    v14 = v13;
    v15 = v10;
    while (2)
    {
      v16 = v15;
      v17 = v9;
      v18 = v11;
      do
      {
        if (a2 <= v18
          || (unint64_t)(a2 - v18) < 2
          || (v9 = v18 + 2, v15 = v18[1], v11 = &v18[v15 + 2], v11 > a2)
          || *v18 != a3)
        {
          *a4 = v17;
          *a5 = v16;
          *a6 = v13;
          result = 0;
          if (a7)
            *a7 = v18;
          return result;
        }
        v18 += v15 + 2;
      }
      while (!(_DWORD)v15);
      if (!v16)
        continue;
      break;
    }
    v21 = a4;
    v22 = a5;
    v23 = a6;
    v24 = a7;
    v10 = v16 + v15;
    v19 = (char *)malloc_type_malloc(v16 + v15, 0x9D9E81ACuLL);
    if (v19)
    {
      v13 = v19;
      memcpy(v19, v17, v16);
      memcpy(&v13[v16], v9, v15);
      v9 = v13;
      a6 = v23;
      a7 = v24;
      a4 = v21;
      a5 = v22;
      if (v14)
      {
        free(v14);
        a4 = v21;
        a5 = v22;
        a6 = v23;
        a7 = v24;
        v9 = v13;
      }
      continue;
    }
    break;
  }
  if (v13)
    free(v13);
  return 4294960568;
}

_QWORD *TLV8BufferInit(_QWORD *result, uint64_t a2)
{
  *result = result + 4;
  result[1] = 0;
  result[2] = a2;
  result[3] = 0;
  return result;
}

void TLV8BufferFree(uint64_t a1)
{
  void *v2;

  v2 = *(void **)(a1 + 24);
  if (v2)
  {
    free(v2);
    *(_QWORD *)(a1 + 24) = 0;
  }
}

uint64_t TLV8BufferAppend(uint64_t a1, char a2, char *__s, size_t a4)
{
  size_t v4;
  char *v5;
  uint64_t v8;
  unint64_t v9;
  size_t v10;
  size_t v11;
  size_t v12;
  char *v13;
  char *v14;
  char *v15;
  const void *v16;
  size_t v17;
  char *v18;
  size_t v19;
  uint64_t result;

  v4 = a4;
  v5 = __s;
  if (a4 == -1)
    v4 = strlen(__s);
  if (v4 >= 0x100)
  {
    v9 = v4 / 0xFF;
    if (v4 % 0xFF)
      ++v9;
    v8 = 2 * v9;
  }
  else
  {
    v8 = 2;
  }
  v10 = v8 + v4;
  v11 = *(_QWORD *)(a1 + 8);
  v12 = v10 + v11;
  if (v10 + v11 > *(_QWORD *)(a1 + 16))
    return 4294960553;
  if (v12 < v11)
    return 4294960545;
  if (v12 > 0x12C)
  {
    v14 = (char *)malloc_type_malloc(v12, 0xC0D9A027uLL);
    if (!v14)
      return 4294960568;
    v15 = v14;
    v16 = *(const void **)(a1 + 24);
    v17 = *(_QWORD *)(a1 + 8);
    if (v16)
    {
      memcpy(v14, v16, v17);
      free(*(void **)(a1 + 24));
    }
    else if (v17)
    {
      memcpy(v14, (const void *)(a1 + 32), v17);
    }
    *(_QWORD *)a1 = v15;
    *(_QWORD *)(a1 + 24) = v15;
    v13 = &v15[*(_QWORD *)(a1 + 8)];
  }
  else
  {
    v13 = (char *)(a1 + v11 + 32);
  }
  v18 = &v5[v4];
  do
  {
    if ((unint64_t)(v18 - v5) >= 0xFF)
      v19 = 255;
    else
      v19 = v18 - v5;
    *v13 = a2;
    v13[1] = v19;
    if (v19)
      memcpy(v13 + 2, v5, v19);
    v5 += v19;
    v13 += v19 + 2;
  }
  while (v5 != v18);
  result = 0;
  *(_QWORD *)(a1 + 8) = &v13[-*(_QWORD *)a1];
  return result;
}

uint64_t TLV8BufferAppendSInt64(uint64_t a1, char a2, uint64_t a3)
{
  size_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a3 == (char)a3)
  {
    LOBYTE(v5[0]) = a3;
    v3 = 1;
  }
  else
  {
    v5[0] = a3;
    v3 = 8;
  }
  return TLV8BufferAppend(a1, a2, (char *)v5, v3);
}

uint64_t TLV8BufferAppendUInt64(uint64_t a1, char a2, unint64_t a3)
{
  size_t v3;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v5[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a3 > 0xFF)
  {
    if (a3 >> 16)
    {
      LODWORD(v5[0]) = a3;
      if (HIDWORD(a3))
      {
        BYTE4(v5[0]) = BYTE4(a3);
        BYTE5(v5[0]) = BYTE5(a3);
        BYTE6(v5[0]) = BYTE6(a3);
        HIBYTE(v5[0]) = HIBYTE(a3);
        v3 = 8;
      }
      else
      {
        v3 = 4;
      }
    }
    else
    {
      LOWORD(v5[0]) = a3;
      v3 = 2;
    }
  }
  else
  {
    LOBYTE(v5[0]) = a3;
    v3 = 1;
  }
  return TLV8BufferAppend(a1, a2, (char *)v5, v3);
}

uint64_t TLV8BufferDetach(uint64_t a1, _QWORD *a2, size_t *a3)
{
  size_t v6;
  void *v7;
  size_t v8;
  void *v9;
  uint64_t result;

  v6 = *(_QWORD *)(a1 + 8);
  v7 = *(void **)(a1 + 24);
  if (v7)
    goto LABEL_8;
  if (v6 <= 1)
    v8 = 1;
  else
    v8 = *(_QWORD *)(a1 + 8);
  v9 = malloc_type_malloc(v8, 0xDF1AB553uLL);
  if (v9)
  {
    v7 = v9;
    if (v6)
      memcpy(v9, *(const void **)a1, v6);
LABEL_8:
    result = 0;
    *(_QWORD *)a1 = a1 + 32;
    *(_QWORD *)(a1 + 8) = 0;
    *(_QWORD *)(a1 + 24) = 0;
    *a2 = v7;
    *a3 = v6;
    return result;
  }
  return 4294960568;
}

unint64_t TLV8MaxPayloadBytesForTotalBytes(unint64_t a1)
{
  unint64_t v2;

  if (a1 < 2)
    return 0;
  v2 = a1 - 2 * (a1 / 0x101);
  if (a1 % 0x101 < 2)
    return v2 - (a1 % 0x101 != 0);
  else
    return v2 - 2;
}

uint64_t TLV8x16Get(unsigned __int8 *a1, unsigned __int8 *a2, char a3, int a4, unsigned __int8 **a5, unint64_t *a6, unsigned __int8 **a7)
{
  int v7;
  uint64_t v8;
  unint64_t v9;
  unsigned __int8 *v10;
  uint64_t v11;

  while (a1 != a2)
  {
    if (a2 - a1 < 1
      || (v7 = *a1, a2 - (a1 + 1) < 2)
      || ((v8 = a1[1], (a3 & 1) != 0)
        ? (v9 = a1[2] | (unint64_t)(v8 << 8))
        : (v9 = v8 | ((unint64_t)a1[2] << 8)),
          v10 = a1 + 3,
          a2 - (a1 + 3) < v9))
    {
      v11 = 4294960546;
      goto LABEL_10;
    }
    a1 = &v10[v9];
    if (v7 == a4)
    {
      v11 = 0;
      *a5 = v10;
      *a6 = v9;
LABEL_10:
      a2 = a1;
      if (!a7)
        return v11;
LABEL_11:
      *a7 = a2;
      return v11;
    }
  }
  v11 = 4294960569;
  if (a7)
    goto LABEL_11;
  return v11;
}

uint64_t TLV8x16GetNext(unsigned __int8 *a1, unsigned __int8 *a2, char a3, _WORD *a4, unsigned __int8 **a5, unint64_t *a6, _QWORD *a7)
{
  uint64_t v7;
  unint64_t v8;
  unsigned __int8 *v9;
  uint64_t result;

  if (a1 == a2)
    return 4294960569;
  if (a2 - a1 < 1 || a2 - (a1 + 1) < 2)
    return 4294960546;
  v7 = a1[1];
  v8 = (a3 & 1) != 0 ? a1[2] | (unint64_t)(v7 << 8) : v7 | ((unint64_t)a1[2] << 8);
  v9 = a1 + 3;
  if (a2 - (a1 + 3) < v8)
    return 4294960546;
  *a4 = *a1;
  *a5 = v9;
  *a6 = v8;
  result = 0;
  if (a7)
    *a7 = &v9[v8];
  return result;
}

unint64_t TLV8x16GetSInt64(unsigned __int8 *a1, unsigned __int8 *a2, char a3, int a4, _DWORD *a5, unsigned __int8 **a6)
{
  unint64_t result;
  uint64_t v9;
  unsigned __int8 *v10;
  int v11;

  v9 = 0xAAAAAAAAAAAAAAAALL;
  v10 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v11 = TLV8x16Get(a1, a2, a3, a4, &v10, (unint64_t *)&v9, a6);
  if (v11)
  {
    result = 0;
    if (!a5)
      return result;
  }
  else
  {
    result = TLVParseSInt64(v10, v9, a3, &v11);
    if (!a5)
      return result;
  }
  *a5 = v11;
  return result;
}

unint64_t TLV8x16GetUInt64(unsigned __int8 *a1, unsigned __int8 *a2, char a3, int a4, _DWORD *a5, unsigned __int8 **a6)
{
  unint64_t result;
  uint64_t v9;
  unsigned int *v10;
  int v11;

  v9 = 0xAAAAAAAAAAAAAAAALL;
  v10 = (unsigned int *)0xAAAAAAAAAAAAAAAALL;
  v11 = TLV8x16Get(a1, a2, a3, a4, (unsigned __int8 **)&v10, (unint64_t *)&v9, a6);
  if (v11)
  {
    result = 0;
    if (!a5)
      return result;
  }
  else
  {
    result = TLVParseUInt64(v10, v9, a3, &v11);
    if (!a5)
      return result;
  }
  *a5 = v11;
  return result;
}

uint64_t TLV8x16Append(CFMutableDataRef theData, char a2, UInt8 a3, char *__s, size_t a5)
{
  size_t v5;
  size_t v10;
  size_t v11;
  UInt8 bytes[3];

  v5 = a5;
  if (a5 == -1)
    v5 = strlen(__s);
  if (v5 >> 16)
    return 4294960553;
  bytes[0] = a3;
  v10 = v5 >> 8;
  if ((a2 & 1) != 0)
    v11 = v5 >> 8;
  else
    LOBYTE(v11) = v5;
  if ((a2 & 1) != 0)
    LOBYTE(v10) = v5;
  bytes[1] = v11;
  bytes[2] = v10;
  CFDataAppendBytes(theData, bytes, 3);
  CFDataAppendBytes(theData, (const UInt8 *)__s, v5);
  return 0;
}

uint64_t TLV8x16AppendSInt64(__CFData *a1, char a2, UInt8 a3, uint64_t a4)
{
  size_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a4 == (char)a4)
  {
    LOBYTE(v6[0]) = a4;
    v4 = 1;
  }
  else
  {
    v6[0] = a4;
    v4 = 8;
  }
  return TLV8x16Append(a1, a2, a3, (char *)v6, v4);
}

uint64_t TLV8x16AppendUInt64(__CFData *a1, char a2, UInt8 a3, unint64_t a4)
{
  size_t v4;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x1E0C80C00];
  v6[0] = 0xAAAAAAAAAAAAAAAALL;
  if (a4 > 0xFF)
  {
    if (a4 >> 16)
    {
      LODWORD(v6[0]) = a4;
      if (HIDWORD(a4))
      {
        BYTE4(v6[0]) = BYTE4(a4);
        BYTE5(v6[0]) = BYTE5(a4);
        BYTE6(v6[0]) = BYTE6(a4);
        HIBYTE(v6[0]) = HIBYTE(a4);
        v4 = 8;
      }
      else
      {
        v4 = 4;
      }
    }
    else
    {
      LOWORD(v6[0]) = a4;
      v4 = 2;
    }
  }
  else
  {
    LOBYTE(v6[0]) = a4;
    v4 = 1;
  }
  return TLV8x16Append(a1, a2, a3, (char *)v6, v4);
}

uint64_t TLV16Get(unsigned __int8 *a1, unsigned __int8 *a2, int a3, int a4, _QWORD *a5, _QWORD *a6, _QWORD *a7)
{
  uint64_t result;
  unint64_t v14;
  unsigned __int8 *v15;
  unsigned __int16 v16;
  unsigned __int8 *v17;

  v17 = a1;
  v16 = -21846;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  while (1)
  {
    result = TLV16GetNext(v17, a2, a3, &v16, &v15, &v14, &v17);
    if ((_DWORD)result)
      break;
    if (v16 == a4)
    {
      *a5 = v15;
      *a6 = v14;
      break;
    }
  }
  if (a7)
    *a7 = v17;
  return result;
}

uint64_t TLV16GetNext(unsigned __int8 *a1, unsigned __int8 *a2, int a3, unsigned __int16 *a4, unsigned __int8 **a5, unint64_t *a6, _QWORD *a7)
{
  uint64_t v7;
  unsigned __int16 v8;
  unint64_t v9;
  unsigned __int8 *v10;
  uint64_t result;

  if (a1 == a2)
    return 4294960569;
  if (a1 >= a2)
    return 4294960591;
  if ((unint64_t)(a2 - a1) < 4)
    return 4294960546;
  v7 = a1[2];
  if (a3)
  {
    v8 = _byteswap_ushort(*(_WORD *)a1);
    v9 = a1[3] | (unint64_t)(v7 << 8);
  }
  else
  {
    v8 = *a1 | (a1[1] << 8);
    v9 = v7 | ((unint64_t)a1[3] << 8);
  }
  v10 = a1 + 4;
  if (a2 - (a1 + 4) < v9)
    return 4294960546;
  *a4 = v8;
  *a5 = v10;
  *a6 = v9;
  result = 0;
  if (a7)
    *a7 = &v10[v9];
  return result;
}

const __CFData *copyCertificateForFDRData(const __CFData *Copy)
{
  CFIndex Length;
  BOOL v3;
  int v4;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  BOOL v9;
  int v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  id v14;
  UInt8 *v15;
  const UInt8 *BytePtr;
  NSObject *v17;
  id v18;
  id v19;
  int v20;
  BOOL v21;
  id v22;
  NSObject *v23;
  CFIndex v24;
  int v26;
  CFIndex v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  init_logging();
  if (Copy)
  {
    Length = CFDataGetLength(Copy);
    if (gLogObjects)
      v3 = gNumLogObjects <= 3;
    else
      v3 = 1;
    v4 = !v3;
    if (Length < 611)
    {
      if (v4)
      {
        v7 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v7 = MEMORY[0x1E0C81028];
        v12 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1AF649000, v7, OS_LOG_TYPE_DEFAULT, "dataLength matches Roswell data length, return copy of fdr data", (uint8_t *)&v26, 2u);
      }

      Copy = CFDataCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Copy);
    }
    else
    {
      v5 = Length;
      if (v4)
      {
        v6 = *(id *)(gLogObjects + 24);
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[ACCTransportPlugin initWithDelegate:].cold.2();
        v6 = MEMORY[0x1E0C81028];
        v8 = MEMORY[0x1E0C81028];
      }
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "Have a custom Roswell data structure", (uint8_t *)&v26, 2u);
      }

      if (gLogObjects)
        v9 = gNumLogObjects <= 3;
      else
        v9 = 1;
      v10 = !v9;
      if (v5 == 704)
      {
        if (v10)
        {
          v11 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[ACCTransportPlugin initWithDelegate:].cold.2();
          v11 = MEMORY[0x1E0C81028];
          v14 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v26) = 0;
          _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "Have a match for (t_bpFDRData_v1)", (uint8_t *)&v26, 2u);
        }

        v15 = (UInt8 *)malloc_type_calloc(1uLL, 0x2C0uLL, 0x100004033510130uLL);
        BytePtr = CFDataGetBytePtr(Copy);
        memcpy(v15, BytePtr, 0x2C0uLL);
        if (gLogObjects && gNumLogObjects >= 4)
        {
          v17 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[ACCTransportPlugin initWithDelegate:].cold.2();
          v17 = MEMORY[0x1E0C81028];
          v19 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          v20 = *((unsigned __int16 *)v15 + 30);
          v26 = 67109120;
          LODWORD(v27) = v20;
          _os_log_impl(&dword_1AF649000, v17, OS_LOG_TYPE_DEFAULT, "pRoswellDataStructure->roswell_cert_len = %d", (uint8_t *)&v26, 8u);
        }

        Copy = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v15 + 62, *((unsigned __int16 *)v15 + 30));
        free(v15);
      }
      else
      {
        if (v10)
        {
          v13 = *(id *)(gLogObjects + 24);
        }
        else
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            -[ACCTransportPlugin initWithDelegate:].cold.2();
          v13 = MEMORY[0x1E0C81028];
          v18 = MEMORY[0x1E0C81028];
        }
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          copyCertificateForFDRData_cold_4(v5, v13);

        Copy = 0;
      }
    }
  }
  if (gLogObjects)
    v21 = gNumLogObjects < 4;
  else
    v21 = 1;
  if (v21)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v23 = MEMORY[0x1E0C81028];
    v22 = MEMORY[0x1E0C81028];
  }
  else
  {
    v23 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    if (Copy)
      v24 = CFDataGetLength(Copy);
    else
      v24 = 0;
    v26 = 134217984;
    v27 = v24;
    _os_log_impl(&dword_1AF649000, v23, OS_LOG_TYPE_INFO, "Returning Roswell data of length %ld", (uint8_t *)&v26, 0xCu);
  }

  return Copy;
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

uint64_t acc_transportClient_createConnection(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "createConnectionWithType:andIdentifier:", a1, a2);
  v6 = objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t acc_transportClient_setPropertiesForConnectionWithUUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setProperties:forConnectionWithUUID:", a1, a2);

  return v6;
}

uint64_t acc_transportClient_setPropertyForConnectionWithUUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a1;
  v12[0] = a2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "setProperties:forConnectionWithUUID:", v8, a3);

  return v9;
}

uint64_t acc_transportClient_removePropertyForConnectionWithUUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeProperty:forConnectionWithUUID:", a1, a2);

  return v6;
}

id acc_transportClient_createEndpoint(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5, uint64_t a6)
{
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  _QWORD aBlock[4];
  id v20;

  v11 = a5;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __acc_transportClient_createEndpoint_block_invoke;
  aBlock[3] = &unk_1E5FB3800;
  v20 = v11;
  v12 = v11;
  v13 = _Block_copy(aBlock);
  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "transportClient");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "createEndpointWithTransportType:andProtocol:andIdentifier:andDataOutHandler:forConnectionWithUUID:publishConnection:", a2, a3, a4, v13, a1, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = v16;
  return v17;
}

uint64_t __acc_transportClient_createEndpoint_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t acc_transportClient_setAccessoryInfo(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setAccessoryInfo:forEndpointWithUUID:", a2, a1);

  return v6;
}

uint64_t acc_transportClient_setPropertiesForEndpointWithUUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "setProperties:forEndpointWithUUID:", a1, a2);

  return v6;
}

uint64_t acc_transportClient_setPropertyForEndpointWithUUID(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transportClient");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = a1;
  v12[0] = a2;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "setProperties:forEndpointWithUUID:", v8, a3);

  return v9;
}

uint64_t acc_transportClient_removePropertyForEndpointWithUUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "removeProperty:forEndpointWithUUID:", a1, a2);

  return v6;
}

uint64_t acc_transportClient_publishConnection(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "publishConnectionWithUUID:", a1);

  return v4;
}

uint64_t acc_transportClient_destroyEndpoint(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "destroyEndpointWithUUID:", a1);

  return v4;
}

uint64_t acc_transportClient_destroyConnection(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "destroyConnectionWithUUID:", a1);

  return v4;
}

uint64_t acc_transportClient_copyConnectionUUIDForEndpointUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionUUIDForEndpointWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_copyEndpointUUIDsForConnectionUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpointUUIDsForConnectionWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_getAuthStateForConnectionUUID(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "authStateForConnectionWithUUID:authType:", a1, a2);

  return v6;
}

uint64_t acc_transportClient_isConnectionAuthenticated(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isConnectionAuthenticated:", a1);

  return v4;
}

uint64_t acc_transportClient_copyAccessoryInfoForConnectionWithUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryInfoForConnectionWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_copyAccessoryInfoForEndpointWithUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryInfoForEndpointWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_copyPropertiesForConnectionWithUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesForConnectionWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_copyPropertiesForEndpointWithUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "propertiesForEndpointWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_copyIdentifierForConnectionWithUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierForConnectionWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_copyIdentifierForEndpointWithUUID(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transportClient");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "identifierForEndpointWithUUID:", a1);
  v4 = objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t acc_transportClient_processIncomingData(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transportClient");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "processIncomingData:forEndpointWithUUID:", a1, a2);

  return v6;
}

void acc_transportClient_setConnectionAuthStatusDidChangeHandler(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConnectionAuthStatusChangedHandler:", v1);

}

void acc_transportClient_setConnectionPropertiesDidChangeHandler(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setConnectionPropertiesChangedHandler:", v1);

}

void acc_transportClient_setConnectionPropertyDidChangeHandler(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a1;
  if (a2)
  {
    +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transportClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __acc_transportClient_setConnectionPropertyDidChangeHandler_block_invoke;
      v7[3] = &unk_1E5FB3828;
      v8 = v3;
      objc_msgSend(v6, "setHandler:forConnectionProperty:", v7, a2);

    }
    else
    {
      objc_msgSend(v5, "setHandler:forConnectionProperty:", 0, a2);

    }
  }

}

uint64_t __acc_transportClient_setConnectionPropertyDidChangeHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void acc_transportClient_setEndpointPropertiesDidChangeHandler(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setEndpointPropertiesChangedHandler:", v1);

}

void acc_transportClient_setEndpointPropertyDidChangeHandler(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a1;
  if (a2)
  {
    +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transportClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __acc_transportClient_setEndpointPropertyDidChangeHandler_block_invoke;
      v7[3] = &unk_1E5FB3850;
      v8 = v3;
      objc_msgSend(v6, "setHandler:forEndpointProperty:", v7, a2);

    }
    else
    {
      objc_msgSend(v5, "setHandler:forEndpointProperty:", 0, a2);

    }
  }

}

uint64_t __acc_transportClient_setEndpointPropertyDidChangeHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void acc_transportClient_serverDisconnectedHandler(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setServerDisconnectedHandler:", v1);

}

void acc_transportClient_setEndpointSecureTunnelDataReceiveHandler(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v3 = a2;
  if (a1)
  {
    +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "transportClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
    {
      v7[0] = MEMORY[0x1E0C809B0];
      v7[1] = 3221225472;
      v7[2] = __acc_transportClient_setEndpointSecureTunnelDataReceiveHandler_block_invoke;
      v7[3] = &unk_1E5FB3878;
      v8 = v3;
      objc_msgSend(v6, "setSecureTunnelDataReceiveHandler:forEndpoint:", v7, a1);

    }
    else
    {
      objc_msgSend(v5, "setSecureTunnelDataReceiveHandler:forEndpoint:", 0, a1);

    }
  }

}

uint64_t __acc_transportClient_setEndpointSecureTunnelDataReceiveHandler_block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void acc_transportClient_endpointSecureTunnelDataSend(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  id v7;

  +[ACCTransportClientBridge sharedBridge](ACCTransportClientBridge, "sharedBridge");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transportClient");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "processOutgoingSecureTunnelData:forEndpoint:forType:", a3, a1, a2);

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

  v11 = *MEMORY[0x1E0C80C00];
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
      v3 = MEMORY[0x1E0C81028];
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[ACCTransportPlugin initWithDelegate:].cold.2();
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
      _os_log_impl(&dword_1AF649000, v3, OS_LOG_TYPE_DEFAULT, "Unregister AvailabilityChangedHandler (%d, %s)", (uint8_t *)v8, 0x12u);
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

id convertNSDataToNSString(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  void *v9;

  v3 = a1;
  v4 = a2;
  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = objc_retainAutorelease(v3);
    v6 = objc_msgSend(v5, "bytes");
    v7 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
    if (objc_msgSend(v5, "length"))
    {
      v8 = 0;
      do
        objc_msgSend(v7, "appendFormat:", v4, *(unsigned __int8 *)(v6 + v8++));
      while (v8 < objc_msgSend(v5, "length"));
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id trimBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id removeBidirectionalUnicodeCharacters(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0CB3500];
  v2 = a1;
  objc_msgSend(v1, "characterSetWithCharactersInString:", CFSTR("\u202A\u202B\u202C\u202D"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByCharactersInSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "componentsJoinedByString:", &stru_1E5FB4390);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id convertNSStringToNSData(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  const char *v6;
  size_t v7;
  _BYTE *v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  char v12;
  char v13;
  int v14;
  unsigned int v15;
  unsigned int v16;
  char v17;
  char v18;
  unint64_t v19;
  void *v20;
  __int16 v22;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3500], "hexadecimalCharacterSet");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "invertedSet");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "componentsJoinedByString:", &stru_1E5FB4390);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v1 = objc_retainAutorelease(v5);
    v6 = (const char *)objc_msgSend(v1, "UTF8String");
    v7 = strlen(v6) >> 1;
    v8 = malloc_type_malloc(v7, 0x71BB6ACDuLL);
    if (v6 && (unint64_t)objc_msgSend(v1, "length") >= 2)
    {
      v9 = 0;
      v10 = 0;
      do
      {
        v11 = 0;
        v22 = -21846;
        v12 = 1;
        do
        {
          v13 = v12;
          v14 = v6[v11 | (2 * v10)];
          v15 = v14 - 48;
          v16 = v14 - 65;
          if ((v14 - 97) >= 6)
            v17 = 0;
          else
            v17 = v14 - 87;
          v18 = v14 - 55;
          if (v16 > 5)
            v18 = v17;
          if (v15 < 0xA)
            v18 = v15;
          *((_BYTE *)&v22 + v11) = v18;
          v11 = 1;
          v12 = 0;
        }
        while ((v13 & 1) != 0);
        v8[v9] = HIBYTE(v22) | (16 * v22);
        v9 = (v10 + 1);
        v19 = objc_msgSend(v1, "length");
        v10 = v9;
      }
      while (v9 < v19 >> 1);
    }
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v8, v7);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
      free(v8);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

uint64_t classImplementsMethodsInProtocol(void *a1, void *a2, BOOL a3, BOOL a4, _QWORD *a5)
{
  Protocol *v9;
  void *v10;
  objc_method_description *v11;
  objc_method_description *v12;
  unint64_t v13;
  SEL *p_name;
  void *v15;
  uint64_t v16;
  unsigned int outCount;

  v9 = a2;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  outCount = 0;
  v11 = protocol_copyMethodDescriptionList(v9, a3, a4, &outCount);
  v12 = v11;
  if (outCount)
  {
    v13 = 0;
    p_name = &v11->name;
    do
    {
      if ((objc_msgSend(a1, "instancesRespondToSelector:", *p_name) & 1) == 0)
      {
        NSStringFromSelector(*p_name);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v15);

      }
      ++v13;
      p_name += 2;
    }
    while (v13 < outCount);
  }
  free(v12);
  if (outCount && objc_msgSend(v10, "count"))
  {
    v16 = 0;
    if (!a5)
      goto LABEL_12;
    goto LABEL_11;
  }
  v16 = 1;
  if (a5)
  {
LABEL_11:
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v10);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_12:

  return v16;
}

uint64_t isNSObjectNull(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  if (!a1)
    return 1;
  v1 = (void *)MEMORY[0x1E0C99E38];
  v2 = a1;
  objc_msgSend(v1, "null");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

id NSObjectIfNotNull(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if ((isNSObjectNull(v1) & 1) != 0)
    v2 = 0;
  else
    v2 = v1;

  return v2;
}

uint64_t isNSObjectEqual(unint64_t a1, uint64_t a2)
{
  if (a1 | a2)
    return objc_msgSend((id)a1, "isEqual:", a2);
  else
    return 1;
}

id castNSObjectToType(void *a1)
{
  id v1;
  id v2;

  v1 = a1;
  if (v1 && (objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

id readJSONFile(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  uint64_t v5;

  if (!a1)
  {
    v3 = 0;
    return v3;
  }
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v1)
    goto LABEL_5;
  v5 = 0;
  objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v1, 0, &v5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v5)
  {

LABEL_5:
    v3 = 0;
  }

  return v3;
}

uint64_t writeJSONFile(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  if (!v4)
    goto LABEL_7;
  if (!v3)
    v3 = (id)MEMORY[0x1E0C9AA70];
  if (objc_msgSend(MEMORY[0x1E0CB36D8], "isValidJSONObject:", v3))
  {
    v9 = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v3, 1, &v9);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v9)
      v7 = 0;
    else
      v7 = objc_msgSend(v5, "writeToFile:atomically:", v4, 1);

  }
  else
  {
LABEL_7:
    v7 = 0;
  }

  return v7;
}

id base64EncodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "base64EncodedStringWithOptions:", 0, (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          objc_msgSend(v2, "addObject:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return v2;
}

id base64DecodeArray(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc(MEMORY[0x1E0C99D50]);
        v10 = (void *)objc_msgSend(v9, "initWithBase64EncodedString:options:", v8, 0, (_QWORD)v12);
        if (v10)
          objc_msgSend(v2, "addObject:", v10);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_1AF664574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location)
{
  void *v19;
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_sync_exit(v19);
  _Unwind_Resume(a1);
}

void sub_1AF6659F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1AF665FD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_1AF66662C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF666D14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6671CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6674DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF667AFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6681E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF668588(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF668950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF668DBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6690A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF66927C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF669464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF669614(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF6699F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF669BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF669D9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF669F70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF66A144(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF66A318(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF66A64C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF66A870(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1AF66AB4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1AF66ADF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

id ACCConnectionInfoCopyLocalizedAccessoryName(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1 && (isNSObjectNull(v1) & 1) == 0)
  {
    +[ACCConnectionInfo sharedInstance](ACCConnectionInfo, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = (void *)objc_msgSend(v4, "copyLocalizedAccessoryNameFromDaemon:", v2);

    if (v3)
    {
      NSLog(CFSTR("localize: name: %@ -> %@"), v2, v3);
    }
    else
    {
      NSLog(CFSTR("Failed localize: name: %@ -> %@"), v2, 0);
      v3 = (void *)objc_msgSend(v2, "copy");
    }
  }
  else
  {
    NSLog(CFSTR("Invalid accessoryName, localize: name: %@ -> %@"), v2, 0);
    v3 = 0;
  }

  return v3;
}

uint64_t ACCConnectionInfoCopyLocalizedAccessoryNameCF(void *a1)
{
  ACCConnectionInfoCopyLocalizedAccessoryName(a1);
  return objc_claimAutoreleasedReturnValue();
}

id ACCConnectionInfoCopyLocalizedAccessoryNamePrivate(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  v2 = v1;
  if (v1 && (isNSObjectNull(v1) & 1) == 0)
  {
    acc_strings_bundle();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_1E5FBBAB0, "objectForKeyedSubscript:", v2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", v2, &stru_1E5FB4390, v5);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      NSLog(CFSTR("localize: name: %@ -> %@"), v2, v3);
    }
    else
    {
      NSLog(CFSTR("Failed localize: name: %@ -> %@"), v2, 0);
      v3 = (void *)objc_msgSend(v2, "copy");
    }
  }
  else
  {
    NSLog(CFSTR("Invalid accessoryName, localize: name: %@ -> %@"), v2, 0);
    v3 = 0;
  }

  return v3;
}

uint64_t ACCConnectionInfoCopyLocalizedAccessoryNameCFPrivate(void *a1)
{
  ACCConnectionInfoCopyLocalizedAccessoryNamePrivate(a1);
  return objc_claimAutoreleasedReturnValue();
}

void signVeridianChallenge(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  init_logging();
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = a1;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "challenging Veridian using data %@", buf, 0xCu);
  }

  +[ACCHWComponentAuth sharedManager](ACCHWComponentAuth, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __signVeridianChallenge_block_invoke;
  v9[3] = &unk_1E5FB42E8;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "signVeridianChallenge:completionHandler:", a1, v9);

}

void __signVeridianChallenge_block_invoke(uint64_t a1, void *a2, void *a3, int a4)
{
  id v7;
  id v8;
  BOOL v9;
  id v10;
  NSObject *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  int v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  if (gLogObjects)
    v9 = gNumLogObjects < 4;
  else
    v9 = 1;
  if (v9)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v11 = MEMORY[0x1E0C81028];
    v10 = MEMORY[0x1E0C81028];
  }
  else
  {
    v11 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412802;
    v13 = v7;
    v14 = 2112;
    v15 = v8;
    v16 = 1024;
    v17 = a4;
    _os_log_impl(&dword_1AF649000, v11, OS_LOG_TYPE_DEFAULT, "received response. signature=%@, deviceNonce=%@, authError=%d", (uint8_t *)&v12, 0x1Cu);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void verifyBatteryMatch(uint64_t a1, void *a2)
{
  id v3;
  BOOL v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  init_logging();
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = a1;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "verifying battery match using cert %@", buf, 0xCu);
  }

  +[ACCHWComponentAuth sharedManager](ACCHWComponentAuth, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __verifyBatteryMatch_block_invoke;
  v9[3] = &unk_1E5FB4310;
  v10 = v3;
  v8 = v3;
  objc_msgSend(v7, "verifyBatteryMatch:completionHandler:", a1, v9);

}

uint64_t __verifyBatteryMatch_block_invoke(uint64_t a1, int a2)
{
  BOOL v4;
  id v5;
  NSObject *v6;
  _DWORD v8[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (gLogObjects)
    v4 = gNumLogObjects < 4;
  else
    v4 = 1;
  if (v4)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v6 = MEMORY[0x1E0C81028];
    v5 = MEMORY[0x1E0C81028];
  }
  else
  {
    v6 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = a2;
    _os_log_impl(&dword_1AF649000, v6, OS_LOG_TYPE_DEFAULT, "received response. authError=%d", (uint8_t *)v8, 8u);
  }

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void CoreAccessoriesInitForHID()
{
  BOOL v0;
  id v1;
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  init_logging();
  if (gLogObjects)
    v0 = gNumLogObjects < 4;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v2 = MEMORY[0x1E0C81028];
    v1 = MEMORY[0x1E0C81028];
  }
  else
  {
    v2 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1AF649000, v2, OS_LOG_TYPE_DEFAULT, "CoreAccessoriesInitForHID", v4, 2u);
  }

  +[ACCHWComponentAuth sharedManager](ACCHWComponentAuth, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "authenticateTouchControllerWithChallenge:completionHandler:updateRegistry:", 0, &__block_literal_global_6, 1);

}

void reauthenticateBattery()
{
  BOOL v0;
  id v1;
  NSObject *v2;
  __int128 v3;
  void *v4;
  void *v5;
  _OWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  init_logging();
  if (gLogObjects)
    v0 = gNumLogObjects < 4;
  else
    v0 = 1;
  if (v0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[ACCTransportPlugin initWithDelegate:].cold.2();
    v2 = MEMORY[0x1E0C81028];
    v1 = MEMORY[0x1E0C81028];
  }
  else
  {
    v2 = *(id *)(gLogObjects + 24);
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v6[0]) = 0;
    _os_log_impl(&dword_1AF649000, v2, OS_LOG_TYPE_DEFAULT, "reauthenticateBattery", (uint8_t *)v6, 2u);
  }

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6[0] = v3;
  v6[1] = v3;
  arc4random_buf(v6, 0x20uLL);
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", v6, 32);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[ACCHWComponentAuth sharedManager](ACCHWComponentAuth, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "authenticateVeridianWithChallenge:completionHandler:updateRegistry:updateUIProperty:logToAnalytics:", v4, &__block_literal_global_49, 1, 0, 1);

}

void OUTLINED_FUNCTION_3_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void copyCertificateForFDRData_cold_4(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = 134218240;
  v3 = a1;
  v4 = 2048;
  v5 = 704;
  _os_log_error_impl(&dword_1AF649000, a2, OS_LOG_TYPE_ERROR, "auth length = %ld, sizeof(t_bpFDRData_v1) = %lu, does not match", (uint8_t *)&v2, 0x16u);
  OUTLINED_FUNCTION_3();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void __init_logging_signpost_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_1AF649000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingSignpostModuleEntry_t table)", buf, 8u);
}

void accessoryServer_registerAvailabilityChangedHandlerForServiceEntry_cold_1(const char **a1, int a2, os_log_t log)
{
  const char *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  if (!*a1)
    v3 = "null";
  v4[0] = 67109378;
  v4[1] = a2;
  v5 = 2080;
  v6 = v3;
  _os_log_fault_impl(&dword_1AF649000, log, OS_LOG_TYPE_FAULT, "AccessoryServerAvailabilityChangedHandler already set! (%d, %s)", (uint8_t *)v4, 0x12u);
  OUTLINED_FUNCTION_3();
}

CFBundleRef CFBundleGetBundleWithIdentifier(CFStringRef bundleID)
{
  return (CFBundleRef)MEMORY[0x1E0C980E8](bundleID);
}

void CFDataAppendBytes(CFMutableDataRef theData, const UInt8 *bytes, CFIndex length)
{
  MEMORY[0x1E0C98390](theData, bytes, length);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFDataRef CFDataCreateCopy(CFAllocatorRef allocator, CFDataRef theData)
{
  return (CFDataRef)MEMORY[0x1E0C983B0](allocator, theData);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

const char *getprogname(void)
{
  return (const char *)MEMORY[0x1E0C83778]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

os_signpost_id_t os_signpost_id_make_with_pointer(os_log_t log, const void *ptr)
{
  return MEMORY[0x1E0C84930](log, ptr);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

int pthread_rwlock_rdlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EA0](a1);
}

int pthread_rwlock_unlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EB8](a1);
}

int pthread_rwlock_wrlock(pthread_rwlock_t *a1)
{
  return MEMORY[0x1E0C84EC0](a1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

