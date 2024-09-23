uint64_t __receivedNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "update");
}

void init_logging_modules(uint64_t a1, char a2, uint64_t a3)
{
  _QWORD block[6];
  char v4;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __init_logging_modules_block_invoke;
  block[3] = &__block_descriptor_tmp;
  v4 = a2;
  block[4] = a3;
  block[5] = a1;
  if (init_logging_modules_onceToken != -1)
    dispatch_once(&init_logging_modules_onceToken, block);
}

void __init_logging_modules_block_invoke(uint64_t a1)
{
  char *v2;
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
  v2 = "diaLibraryMPQ";
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
          _os_log_error_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_ERROR, "Subsystem missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
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
          _os_log_debug_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_DEBUG, "Created log object %s: %s", buf, 0x16u);
        }
      }
      else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v13 = v8;
        v14 = 2080;
        v15 = v9;
        _os_log_error_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_ERROR, "Failed to create os_log_t object %s: %s!", buf, 0x16u);
      }
      ++v4;
      v11 = *(unsigned __int8 *)(a1 + 48);
      v3 += 16;
    }
    while (v4 < v11);
    v2 = "com.apple.accessoryd.MediaLibraryMPQ" + 23;
  }
  else
  {
    LODWORD(v11) = 0;
    v5 = 0;
  }
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = *((_QWORD *)v2 + 191);
    LODWORD(v13) = v5;
    _os_log_impl(&dword_21A7E0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "Created %d log object(s)!", buf, 8u);
    LODWORD(v11) = *(unsigned __int8 *)(a1 + 48);
  }
  gLogObjects = *(_QWORD *)(a1 + 40);
  gNumLogObjects = v11;
}

void *WeakLinkSymbol(const char *a1, unint64_t a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

const void *__HandleForSource(unint64_t a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  void *v4;

  pthread_mutex_lock(&__HandlesLock);
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, (const void *)a1);
  if (!Value)
  {
    if (a1 <= 8
      && ((0x1BFu >> a1) & 1) != 0
      && (v4 = dlopen((const char *)-[__CFString UTF8String](off_24DD25D40[a1], "UTF8String"), 1)) != 0)
    {
      Value = v4;
      CFDictionarySetValue((CFMutableDictionaryRef)__Handles, (const void *)a1, v4);
    }
    else
    {
      NSLog(CFSTR("Could not load source: %ld"), a1);
      Value = 0;
    }
  }
  pthread_mutex_unlock(&__HandlesLock);
  return Value;
}

id WeakLinkClass(void *a1, unint64_t a2)
{
  NSString *v3;
  void *v4;

  v3 = a1;
  if (__HandleForSource(a2))
  {
    NSClassFromString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

id *WeakLinkStringConstant(const char *a1, unint64_t a2)
{
  id *v3;

  v3 = (id *)__HandleForSource(a2);
  if (v3)
  {
    v3 = (id *)dlsym(v3, a1);
    if (v3)
      v3 = (id *)*v3;
  }
  return v3;
}

uint64_t IsAppVisibleInCurrentMode(uint64_t a1)
{
  void *v1;
  id v2;
  id v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = WeakLinkClass(CFSTR("LSApplicationProxy"), 1uLL);
  v3 = WeakLinkClass(CFSTR("LSApplicationWorkspace"), 1uLL);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  objc_msgSend(v3, "defaultWorkspace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "applicationIsInstalled:", v1);

  if (v5)
  {
    objc_msgSend(v2, "applicationProxyForIdentifier:", v1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "defaultWorkspace");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __IsAppVisibleInCurrentMode_block_invoke;
    v11[3] = &unk_24DD25D90;
    v13 = &v14;
    v8 = v6;
    v12 = v8;
    objc_msgSend(v7, "enumerateBundlesOfType:block:", 4, v11);

  }
  v9 = *((unsigned __int8 *)v15 + 24);
  _Block_object_dispose(&v14, 8);

  return v9;
}

void sub_21A7E1A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t IsExistAppMusic()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.Music");
}

uint64_t IsExistAppPodcasts()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.podcasts");
}

uint64_t IsExistAppiBooks()
{
  return IsAppVisibleInCurrentMode((uint64_t)"com.apple.iBooks");
}

id ACCGetOSVersion()
{
  const void *v0;
  const void *v1;
  BOOL v2;
  id v3;
  CFTypeID v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  id v9;
  uint8_t buf[4];
  const char *v12;
  __int16 v13;
  int v14;
  __int16 v15;
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v0 = (const void *)MGCopyAnswerWithError();
  v1 = v0;
  if (v0)
  {
    v4 = CFGetTypeID(v0);
    if (v4 == CFStringGetTypeID())
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", v1);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (gLogObjects && gNumLogObjects >= 1)
      {
        v8 = *(id *)gLogObjects;
      }
      else
      {
        if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
          ACCGetOSVersion_cold_1();
        v8 = MEMORY[0x24BDACB70];
        v9 = MEMORY[0x24BDACB70];
      }
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v12 = "ACCGetOSVersion";
        _os_log_impl(&dword_21A7E0000, v8, OS_LOG_TYPE_DEFAULT, "%s got non-string when querying key", buf, 0xCu);
      }

      v5 = 0;
    }
    goto LABEL_25;
  }
  if (gLogObjects)
    v2 = gNumLogObjects < 1;
  else
    v2 = 1;
  if (v2)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      ACCGetOSVersion_cold_1();
    v6 = MEMORY[0x24BDACB70];
    v3 = MEMORY[0x24BDACB70];
  }
  else
  {
    v6 = *(id *)gLogObjects;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v12 = "ACCGetOSVersion";
    v13 = 1024;
    v14 = 0;
    v15 = 2112;
    v16 = CFSTR("ProductVersion");
    _os_log_impl(&dword_21A7E0000, v6, OS_LOG_TYPE_DEFAULT, "%s MG error: 0x%08x retrieving key:(%@)", buf, 0x1Cu);
  }

  v5 = 0;
  v7 = 0;
  if (v1)
  {
LABEL_25:
    CFRelease(v1);
    v7 = (void *)v5;
  }
  return v7;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

uint64_t ACCMediaLibraryShimGetCurTimeMs()
{
  double v0;

  objc_msgSend(MEMORY[0x24BDBCE60], "timeIntervalSinceReferenceDate");
  return (v0 * 1000.0);
}

id ACCMediaLibraryShimUIDString(void *a1, int a2)
{
  id v3;
  int AppBooleanValue;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  __CFString *v11;
  __CFString *v12;
  int v13;
  __CFString *v14;
  __CFString *v15;
  int v16;
  __CFString *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;

  v3 = a1;
  AppBooleanValue = __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting;
  if (__allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting == -1)
  {
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("allowCachedTracksForAppleMusic"), CFSTR("com.apple.iapd"), 0);
    __allowCachedTracksForAppleMusic___allowCachedTracksForAppleMusicSetting = AppBooleanValue;
  }
  v5 = CFSTR("LM");
  if (a2)
    v5 = CFSTR("AM");
  if (!AppBooleanValue)
    v5 = &stru_24DD265E0;
  v6 = v5;
  GetMediaLibraryHelper();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ACCGetOSVersion();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "showMusic");
  v11 = CFSTR("M");
  if (!v10)
    v11 = CFSTR("N");
  v12 = v11;
  v13 = objc_msgSend(v7, "showPodcasts");
  v14 = CFSTR("P");
  if (!v13)
    v14 = CFSTR("N");
  v15 = v14;
  v16 = objc_msgSend(v7, "showAudioBooks");
  v17 = CFSTR("B");
  if (!v16)
    v17 = CFSTR("N");
  v18 = v17;
  if (!v8)
    ACCMediaLibraryShimUIDString_cold_1();
  if (!v9)
    ACCMediaLibraryShimUIDString_cold_1();
  v19 = v18;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@%@%@%@-%@"), v9, v6, v12, v15, v18, v8);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id ACCRadioLibraryUIDString()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  ACCGetOSVersion();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDDC7F0], "deviceMediaLibrary");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "uniqueIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@-%@"), v2, CFSTR("4954524C"), v0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t _sendOnlyInLibraryItemsForPlaylist()
{
  void *v0;
  ACCSettingsState *v1;
  void *v2;

  v0 = (void *)_sendOnlyInLibraryItemsForPlaylist_state;
  if (!_sendOnlyInLibraryItemsForPlaylist_state)
  {
    v1 = -[ACCSettingsState initWithKey:applicationID:notification:defaultValue:invalidValue:]([ACCSettingsState alloc], "initWithKey:applicationID:notification:defaultValue:invalidValue:", CFSTR("SendOnlyInLibraryItems"), CFSTR("com.apple.iapd"), CFSTR("com.apple.iapd.LoggingPreferencesChangedNotification"), 0, -1);
    v2 = (void *)_sendOnlyInLibraryItemsForPlaylist_state;
    _sendOnlyInLibraryItemsForPlaylist_state = (uint64_t)v1;

    v0 = (void *)_sendOnlyInLibraryItemsForPlaylist_state;
  }
  return objc_msgSend(v0, "BOOLValue");
}

void sub_21A7E7A40(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x420], 8);
  _Block_object_dispose(&STACK[0x440], 8);
  _Block_object_dispose(&STACK[0x460], 8);
  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&STACK[0x4B0], 8);
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

id GetMediaLibraryHelper()
{
  if (GetMediaLibraryHelper___mediaLibraryHelperInitOnce != -1)
    dispatch_once(&GetMediaLibraryHelper___mediaLibraryHelperInitOnce, &__block_literal_global_381);
  return (id)GetMediaLibraryHelper___mediaLibraryHelper;
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x3Cu);
}

uint64_t OUTLINED_FUNCTION_9@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = a2;
  return *(_QWORD *)(a1 + 40);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_11(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_13()
{
  return _os_assert_log();
}

uint64_t OUTLINED_FUNCTION_14()
{
  uint64_t v0;

  return objc_msgSend(*(id *)(v0 + 48), "persistentID");
}

id ACCMediaLibraryFeatureRequestedInfoDesc(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t k;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE00B50]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE00B68]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v1;
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x24BE00B70]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v5 = v2;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v38 != v9)
          objc_enumerationMutation(v5);
        v8 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * i), "intValue");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v37, v43, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v11 = v3;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v34;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v34 != v15)
          objc_enumerationMutation(v11);
        v14 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v33 + 1) + 8 * j), "intValue");
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v33, v42, 16);
    }
    while (v13);
  }
  else
  {
    v14 = 0;
  }

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v17 = v4;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
  if (v18)
  {
    v19 = v18;
    v20 = 0;
    v21 = *(_QWORD *)v30;
    do
    {
      for (k = 0; k != v19; ++k)
      {
        if (*(_QWORD *)v30 != v21)
          objc_enumerationMutation(v17);
        v20 |= 1 << objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * k), "intValue");
      }
      v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v29, v41, 16);
    }
    while (v19);
  }
  else
  {
    v20 = 0;
  }

  v23 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(v28, "objectForKey:", *MEMORY[0x24BE00B48]);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "objectForKey:", *MEMORY[0x24BE00B58]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", CFSTR("[properties(item=%llxh playlist=%llxh content=%llxh) hideNonLocal=%@ playAllSongsCapable=%@]"), v8, v14, v20, v24, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

uint64_t ascii_to_hex(uint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  char v6;
  char v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  char v11;
  char v12;
  __int16 v13;

  if (a3 >= 2)
  {
    v3 = 0;
    v4 = a3 >> 1;
    do
    {
      v5 = 0;
      v13 = -21846;
      v6 = 1;
      do
      {
        v7 = v6;
        v8 = *(unsigned __int8 *)(a2 + (v5 | (2 * v3)));
        v9 = v8 - 48;
        v10 = v8 - 65;
        if ((v8 - 97) >= 6)
          v11 = 0;
        else
          v11 = v8 - 87;
        v12 = v8 - 55;
        if (v10 > 5)
          v12 = v11;
        if (v9 < 0xA)
          v12 = v9;
        *((_BYTE *)&v13 + v5) = v12;
        v5 = 1;
        v6 = 0;
      }
      while ((v7 & 1) != 0);
      *(_BYTE *)(result + v3++) = HIBYTE(v13) | (16 * v13);
    }
    while (v3 != v4);
  }
  return result;
}

unsigned __int8 *printBytes(unsigned __int8 *result, uint64_t a2, char *a3, int a4)
{
  uint64_t v4;
  unsigned __int8 *v7;
  unsigned int v8;

  if (result)
  {
    v4 = a2;
    if (a2)
    {
      v7 = result;
      do
      {
        v8 = *v7++;
        result = (unsigned __int8 *)printf(a3, v8);
        --v4;
      }
      while (v4);
      if (a4)
        return (unsigned __int8 *)putchar(10);
    }
  }
  return result;
}

const char *removeNewline(const char *a1)
{
  size_t v2;

  v2 = strlen(a1);
  if (v2 && a1[v2 - 1] == 10)
    a1[v2 - 1] = 0;
  return a1;
}

char *createHexString(uint64_t a1, unint64_t a2, int a3)
{
  size_t v5;
  char *result;
  char *v7;
  unint64_t v8;
  char *v9;
  char *v10;
  size_t v11;
  char *v12;
  size_t v13;
  char *v14;

  if (a1 && a2)
  {
    if ((a2 & 0x8000000000000000) == 0)
    {
      if (!a3)
      {
        v5 = (2 * a2) | 1;
LABEL_10:
        v7 = (char *)malloc_type_malloc(v5, 0xA799D077uLL);
        if (v7)
        {
          v8 = 0;
          v9 = v7;
          v14 = v7;
          v10 = v7;
          v11 = v5;
          while (a3)
          {
            if (v8 >= a2 - 1)
            {
              v12 = v10;
              v13 = v11;
              goto LABEL_17;
            }
            snprintf(v10, v11, "%02X ");
LABEL_18:
            ++v8;
            v11 -= 3;
            v10 += 3;
            v9 += 2;
            v5 -= 2;
            if (a2 == v8)
              return v14;
          }
          v12 = v9;
          v13 = v5;
LABEL_17:
          snprintf(v12, v13, "%02X");
          goto LABEL_18;
        }
        goto LABEL_21;
      }
      if (is_mul_ok(a2, 3uLL))
      {
        v5 = 3 * a2;
        goto LABEL_10;
      }
    }
    do
LABEL_21:
      result = (char *)malloc_type_malloc(0xEuLL, 0xD85E358FuLL);
    while (!result);
    strcpy(result, "<print error>");
    return result;
  }
  result = (char *)malloc_type_malloc(7uLL, 0x55AA73BCuLL);
  if (result)
    strcpy(result, "(null)");
  return result;
}

uint64_t obfuscatedPointer(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  if (result)
  {
    v1 = result;
    v2 = obfuscatedPointer_salt;
    if (!obfuscatedPointer_salt)
    {
      v2 = random();
      obfuscatedPointer_salt = v2;
    }
    return v1 + v2;
  }
  return result;
}

BOOL getMemoryUse(_QWORD *a1, _QWORD *a2, _QWORD *a3)
{
  __int128 v6;
  kern_return_t v7;
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33;

  v33 = -1431655766;
  *(_QWORD *)&v6 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v6 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v31 = v6;
  v32 = v6;
  v29 = v6;
  v30 = v6;
  v27 = v6;
  v28 = v6;
  v25 = v6;
  v26 = v6;
  v23 = v6;
  v24 = v6;
  v21 = v6;
  v22 = v6;
  v19 = v6;
  v20 = v6;
  v18 = v6;
  v16 = v6;
  v17 = v6;
  v14 = v6;
  v15 = v6;
  v12 = v6;
  v13 = v6;
  *(_OWORD *)task_info_out = v6;
  v11 = v6;
  task_info_outCnt = 93;
  v7 = task_info(*MEMORY[0x24BDAEC58], 0x16u, task_info_out, &task_info_outCnt);
  if (!v7)
  {
    if (a1)
      *a1 = v11;
    if (a2)
      *a2 = *(_QWORD *)task_info_out;
    if (a3)
      *a3 = v19;
  }
  return v7 == 0;
}

uint64_t init_logging()
{
  init_logging_modules((uint64_t)&_gLogObjects, 1, (uint64_t)&_kLoggingModuleEntries);
  return init_logging_signposts();
}

void __init_logging_modules_block_invoke_cold_1(uint8_t *buf, int a2, _DWORD *a3)
{
  *(_DWORD *)buf = 67109120;
  *a3 = a2;
  _os_log_error_impl(&dword_21A7E0000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Category missing for logging module %d!\n(Check LoggingModuleEntry_t table)", buf, 8u);
}

void ACCGetOSVersion_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_21A7E0000, MEMORY[0x24BDACB70], v0, "Make sure you have called init_logging()!\ngLogObjects: %p, gNumLogObjects: %d", v1, v2, v3, v4, v5);
}

void ACCMediaLibraryShimUIDString_cold_1()
{
  OUTLINED_FUNCTION_13();
  _os_crash();
  __break(1u);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
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

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
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

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x24BED8450]();
}

uint64_t MRMediaRemoteSendCommandToApp()
{
  return MEMORY[0x24BE65230]();
}

uint64_t MRMediaRemoteSetAppPlaybackQueue()
{
  return MEMORY[0x24BE65250]();
}

uint64_t MRSystemAppPlaybackQueueCreate()
{
  return MEMORY[0x24BE653F8]();
}

uint64_t MRSystemAppPlaybackQueueDestroy()
{
  return MEMORY[0x24BE65410]();
}

uint64_t MRSystemAppPlaybackQueueInternalPrepareBundleIDForPlayback()
{
  return MEMORY[0x24BE65418]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryData()
{
  return MEMORY[0x24BE65448]();
}

uint64_t MRSystemAppPlaybackQueueSetLocalQueryFirstItemPID()
{
  return MEMORY[0x24BE65450]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
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

uint64_t acc_strings_bundle()
{
  return MEMORY[0x24BE1A0E0]();
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

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x24BDAE070](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

uint64_t init_logging_signposts()
{
  return MEMORY[0x24BE00BA8]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
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

int printf(const char *a1, ...)
{
  return MEMORY[0x24BDAF6A8](a1);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8D0](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x24BDAF8E0](a1);
}

int putchar(int a1)
{
  return MEMORY[0x24BDAF9F0](*(_QWORD *)&a1);
}

uint64_t random(void)
{
  return MEMORY[0x24BDAFA48]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x24BDB0180](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

