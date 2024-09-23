void OUTLINED_FUNCTION_6(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

int *logfunctionv(const char *a1, uint64_t a2, const __CFString *a3, va_list a4)
{
  int v7;
  const __CFString *v8;
  const __CFString *v9;
  const char *v10;
  char *v11;
  CFIndex Length;
  CFIndex v13;
  const char *v14;
  int *result;
  char __dst[1024];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v7 = *__error();
  memcpy(__dst, "Error creating CFString", sizeof(__dst));
  if (logfunctionv_onceToken != -1)
    dispatch_once(&logfunctionv_onceToken, &__block_literal_global);
  v8 = CFStringCreateWithFormatAndArguments(0, 0, a3, a4);
  if (v8)
  {
    v9 = v8;
    v10 = __dst;
    if (CFStringGetCString(v8, __dst, 1024, 0x8000100u))
    {
      v11 = 0;
    }
    else
    {
      Length = CFStringGetLength(v9);
      v13 = CFStringGetMaximumSizeForEncoding(Length, 0x8000100u) + 1;
      v11 = (char *)malloc_type_malloc(v13, 0x5CBFF54EuLL);
      CFStringGetCString(v9, v11, v13, 0x8000100u);
      v10 = v11;
    }
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
    v10 = 0;
  }
  v14 = "";
  if (a1)
    v14 = a1;
  fprintf((FILE *)*MEMORY[0x24BDAC8D8], "%s: %s", v14, v10);
  free(v11);
  result = __error();
  *result = v7;
  return result;
}

char *__logfunctionv_block_invoke()
{
  char *result;

  result = getenv("__OSINSTALL_ENVIRONMENT");
  if (result)
    return (char *)open("/dev/console", 131082);
  return result;
}

int *logfunction(const char *a1, uint64_t a2, const __CFString *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return logfunctionv(a1, 0, a3, &a9);
}

CFErrorRef _vcreate_error_internal_with_userinfo_cf(const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFDictionary *a5, const __CFString *a6, va_list a7)
{
  int v14;
  const __CFAllocator *v15;
  CFMutableDictionaryRef MutableCopy;
  __CFDictionary *v17;
  CFStringRef v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  CFStringRef v24;
  CFErrorRef v25;

  v14 = *__error();
  v15 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  if (a5)
    MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, a5);
  else
    MutableCopy = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v17 = MutableCopy;
  if (MutableCopy)
  {
    v18 = CFStringCreateWithFormatAndArguments(v15, 0, a6, a7);
    if (v18)
    {
      v24 = v18;
      logfunction("", 1, CFSTR("%@ error %ld - %@\n"), v19, v20, v21, v22, v23, (char)a1);
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x24BDBD3A0], v24);
      CFRelease(v24);
    }
    if (a3)
      CFDictionaryAddValue(v17, (const void *)*MEMORY[0x24BDBD3B0], a3);
    if (a4)
      CFDictionaryAddValue(v17, CFSTR("target_update"), a4);
    v25 = CFErrorCreate(v15, a1, a2, v17);
    CFRelease(v17);
  }
  else
  {
    v25 = 0;
  }
  *__error() = v14;
  return v25;
}

CFErrorRef _create_error_internal_cf(const __CFString *a1, CFIndex a2, const void *a3, const void *a4, const __CFString *a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  return _vcreate_error_internal_with_userinfo_cf(a1, a2, a3, a4, 0, a5, &a9);
}

CFDictionaryRef cferror_to_dictionary_embedded(__CFError *a1, int a2)
{
  CFErrorDomain Domain;
  const __CFDictionary *v5;
  const __CFAllocator *v6;
  CFNumberRef v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  CFNumberRef v13;
  const void *v14;
  __CFDictionary *Value;
  __CFDictionary *v16;
  CFTypeID v17;
  uint64_t v18;
  const void *v19;
  __CFDictionary *MutableCopy;
  CFDictionaryRef v21;
  CFIndex v22;
  const __CFDictionary **v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v31;
  CFIndex valuePtr;
  void *values[2];
  const __CFDictionary *v34;
  uint64_t v35;
  void *keys[2];
  __int128 v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  valuePtr = CFErrorGetCode(a1);
  Domain = CFErrorGetDomain(a1);
  v5 = CFErrorCopyUserInfo(a1);
  v6 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v7 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberCFIndexType, &valuePtr);
  if (!v7)
  {
    logfunction("", 1, CFSTR("could not create cfnumber\n"), v8, v9, v10, v11, v12, v31);
    v21 = 0;
    if (!v5)
      return v21;
    goto LABEL_22;
  }
  v13 = v7;
  *(_OWORD *)keys = xmmword_24CBCEE58;
  v37 = *(_OWORD *)&off_24CBCEE68;
  values[0] = v7;
  values[1] = (void *)Domain;
  v34 = v5;
  v35 = 0;
  if (!v5)
  {
    v16 = 0;
    v22 = 2;
    if (!a2)
      goto LABEL_17;
    v23 = &v34;
    v24 = 3;
    goto LABEL_16;
  }
  v14 = (const void *)*MEMORY[0x24BDBD3B0];
  Value = (__CFDictionary *)CFDictionaryGetValue(v5, (const void *)*MEMORY[0x24BDBD3B0]);
  v16 = Value;
  if (Value)
  {
    v17 = CFGetTypeID(Value);
    if (v17 == CFErrorGetTypeID() && (v18 = cferror_to_dictionary_embedded(v16, 0)) != 0)
    {
      v19 = (const void *)v18;
      MutableCopy = CFDictionaryCreateMutableCopy(v6, 0, v5);
      v16 = MutableCopy;
      if (MutableCopy)
      {
        CFDictionarySetValue(MutableCopy, v14, v19);
        v34 = v16;
      }
      CFRelease(v19);
    }
    else
    {
      v16 = 0;
    }
  }
  v22 = 3;
  if ((a2 & 1) != 0)
  {
    v23 = (const __CFDictionary **)&v35;
    v24 = 4;
LABEL_16:
    keys[v22] = CFSTR("_MSU_Embedded_Error");
    *v23 = (const __CFDictionary *)*MEMORY[0x24BDBD270];
    v22 = v24;
  }
LABEL_17:
  v21 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, v22, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v21)
    logfunction("", 1, CFSTR("could not create cfdictionary\n"), v25, v26, v27, v28, v29, v31);
  if (v16)
    CFRelease(v16);
  CFRelease(v13);
  if (v5)
LABEL_22:
    CFRelease(v5);
  return v21;
}

const __CFString *copy_dictionary_to_cferror(const void *a1)
{
  CFTypeID v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  const __CFNumber *Value;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  const __CFString *v14;
  const __CFDictionary *v15;
  const __CFAllocator *v16;
  const __CFDictionary *MutableCopy;
  __CFDictionary *v18;
  const void *v19;
  const void *v20;
  const void *v21;
  const void *v22;
  const __CFString *v23;
  char v25;
  CFIndex valuePtr;

  valuePtr = 0;
  if (!a1)
    return 0;
  v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    v23 = CFSTR("marshalled cferror is not a dictionary.\n");
LABEL_17:
    logfunction("", 1, v23, v3, v4, v5, v6, v7, v25);
    return 0;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("Code"));
  if (!Value)
  {
    v23 = CFSTR("marshalled cferror is incomplete. missing code.\n");
    goto LABEL_17;
  }
  if (!CFNumberGetValue(Value, kCFNumberCFIndexType, &valuePtr))
  {
    v23 = CFSTR("code not convert cfnumber code to cfindex\n");
    goto LABEL_17;
  }
  v14 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("Domain"));
  if (!v14)
  {
    logfunction("", 1, CFSTR("marshalled cferror is incomplete. missing domain.\n"), v9, v10, v11, v12, v13, v25);
    return v14;
  }
  v15 = (const __CFDictionary *)CFDictionaryGetValue((CFDictionaryRef)a1, CFSTR("UserInfo"));
  if (!v15)
  {
    v23 = CFSTR("marshalled cferror is incomplete. missing \"UserInfo\".\n");
    goto LABEL_17;
  }
  v16 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v15);
  if (!MutableCopy)
  {
    v23 = CFSTR("code not create mutable copy of userInfo\n");
    goto LABEL_17;
  }
  v18 = MutableCopy;
  v19 = (const void *)*MEMORY[0x24BDBD3B0];
  v20 = CFDictionaryGetValue(MutableCopy, (const void *)*MEMORY[0x24BDBD3B0]);
  v21 = (const void *)copy_dictionary_to_cferror(v20);
  if (v21)
  {
    v22 = v21;
    CFDictionarySetValue(v18, v19, v21);
    CFRelease(v22);
  }
  v14 = (const __CFString *)CFErrorCreate(v16, v14, valuePtr, v18);
  CFRelease(v18);
  return v14;
}

CFPropertyListRef _MSUPreferencesCopyValueForDomain(const __CFString *a1, const __CFString *a2)
{
  CFPropertyListRef v4;
  const void *Value;

  v4 = CFPreferencesCopyAppValue(a1, a2);
  if (v4)
    return v4;
  if (_getManagedPreferencesDict_managedPreferencesOnce != -1)
    dispatch_once(&_getManagedPreferencesDict_managedPreferencesOnce, &__block_literal_global_0);
  if (_getManagedPreferencesDict__managedPreferencesCache)
  {
    Value = CFDictionaryGetValue((CFDictionaryRef)_getManagedPreferencesDict__managedPreferencesCache, a1);
    if (Value)
    {
      v4 = Value;
      CFRetain(Value);
      return v4;
    }
  }
  return CFPreferencesCopyValue(a1, a2, CFSTR("mobile"), (CFStringRef)*MEMORY[0x24BDBD570]);
}

CFPropertyListRef _MSUPreferencesCopyValue(const __CFString *a1)
{
  return _MSUPreferencesCopyValueForDomain(a1, CFSTR("com.apple.MobileSoftwareUpdate"));
}

uint64_t _MSUPreferencesGetAppBooleanValue(const __CFString *a1, _BYTE *a2)
{
  const __CFBoolean *v3;
  const __CFBoolean *v4;
  CFTypeID v5;
  _BOOL4 v6;
  uint64_t Value;

  v3 = (const __CFBoolean *)_MSUPreferencesCopyValueForDomain(a1, CFSTR("com.apple.MobileSoftwareUpdate"));
  v4 = v3;
  if (v3)
  {
    v5 = CFGetTypeID(v3);
    v6 = v5 == CFBooleanGetTypeID();
    if (!a2)
      goto LABEL_4;
    goto LABEL_3;
  }
  v6 = 0;
  if (a2)
LABEL_3:
    *a2 = v6;
LABEL_4:
  if (v6)
  {
    Value = CFBooleanGetValue(v4);
    if (!v4)
      return Value;
    goto LABEL_8;
  }
  Value = 0;
  if (v4)
LABEL_8:
    CFRelease(v4);
  return Value;
}

uint64_t _MSUPreferencesGetAppBooleanValueWithDefaultValue(const __CFString *a1, unsigned int a2)
{
  uint64_t result;
  char v4;

  v4 = 0;
  LODWORD(result) = _MSUPreferencesGetAppBooleanValue(a1, &v4);
  if (v4)
    return result;
  else
    return a2;
}

uint64_t _MSUPreferencesGetAppIntegerValue(const __CFString *a1, BOOL *a2)
{
  const __CFNumber *v3;
  const __CFNumber *v4;
  CFTypeID v5;
  BOOL v6;
  uint64_t valuePtr;

  valuePtr = 0;
  v3 = (const __CFNumber *)_MSUPreferencesCopyValueForDomain(a1, CFSTR("com.apple.MobileSoftwareUpdate"));
  v4 = v3;
  if (!v3 || (v5 = CFGetTypeID(v3), v5 != CFNumberGetTypeID()))
  {
    v6 = 0;
    if (!a2)
      goto LABEL_7;
    goto LABEL_6;
  }
  v6 = CFNumberGetValue(v4, kCFNumberCFIndexType, &valuePtr) != 0;
  if (a2)
LABEL_6:
    *a2 = v6;
LABEL_7:
  if (v4)
    CFRelease(v4);
  return valuePtr;
}

void ___getManagedPreferencesDict_block_invoke()
{
  CFStringRef v0;
  CFStringRef v1;

  v0 = CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("%@/%@.plist"), CFSTR("/Library/Managed Preferences/mobile"), CFSTR("com.apple.MobileSoftwareUpdate"));
  if (v0)
  {
    v1 = v0;
    _getManagedPreferencesDict__managedPreferencesCache = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v0);
    CFRelease(v1);
  }
}

uint64_t qos_class_for_msu_qos(int a1)
{
  if ((a1 - 1) > 4)
    return 0;
  else
    return dword_211424788[a1 - 1];
}

uint64_t MSUPreflightUpdate(uint64_t a1, const void *a2, const __CFString **a3, uint64_t a4, uint64_t a5)
{
  NSObject *v10;
  __CFString *v11;
  uint64_t v12;
  const __CFString *v13;
  const __CFString *v14;
  __CFDictionary *Mutable;
  __CFDictionary *v16;
  void *Value;
  const void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  NSObject *v22;
  _QWORD v24[6];
  uint8_t buf[4];
  const __CFString *v26;
  __int16 v27;
  __CFString *v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  const __CFString *v32;
  __int16 v33;
  const __CFString *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    if (a1 >= 6)
      v11 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MSUPhase(%d)"), a1);
    else
      v11 = off_24CBCF3C8[(int)a1];
    v12 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a2);
    v13 = CFSTR("SPECIFIED");
    *(_DWORD *)buf = 138413314;
    v26 = CFSTR("MSUPreflightUpdate");
    v27 = 2112;
    v28 = v11;
    if (a4)
      v14 = CFSTR("SPECIFIED");
    else
      v14 = CFSTR("NONE");
    v29 = 2112;
    if (!a5)
      v13 = CFSTR("NONE");
    v30 = v12;
    v31 = 2112;
    v32 = v14;
    v33 = 2112;
    v34 = v13;
    _os_log_impl(&dword_211416000, v10, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | phase:%@, options:%@, fncallback:%@, context:%@", buf, 0x34u);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v16 = Mutable;
  if (a2)
  {
    CFDictionarySetValue(Mutable, CFSTR("ClientOptions"), a2);
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("__msu-update-attributes-dictionary-key"));
    if (Value)
      CFDictionarySetValue(v16, CFSTR("AssetProperties"), Value);
    v18 = CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("SourcePath"));
    if (v18)
      CFDictionarySetValue(v16, CFSTR("SourcePath"), v18);
  }
  else
  {
    Value = 0;
  }
  v19 = (void *)MEMORY[0x212BD9918]();
  -[__CFDictionary setValue:forKey:](v16, "setValue:forKey:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", a1), CFSTR("Phase"));
  objc_autoreleasePoolPop(v19);
  v24[0] = MEMORY[0x24BDAC760];
  v24[1] = 3221225472;
  v24[2] = __MSUPreflightUpdate_block_invoke;
  v24[3] = &__block_descriptor_48_e25_i16__0____CFDictionary__8l;
  v24[4] = a4;
  v24[5] = a5;
  v20 = perform_command_with_progress("PreflightUpdate", v16, Value, 0, a3, (uint64_t)v24);
  CFRelease(v16);
  v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v22 = v21;
  if ((_DWORD)v20)
  {
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v26 = CFSTR("MSUPreflightUpdate");
      _os_log_impl(&dword_211416000, v22, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    MSUPreflightUpdate_cold_1();
  }
  return v20;
}

BOOL MSUPrepareUpdateWithAsset(void *a1, const void *a2, uint64_t *a3, const __CFString **a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFString *v17;
  int v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  CFErrorRef error_internal_cf;
  _BOOL8 result;
  uint8_t buf[4];
  const __CFString *v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  uint64_t v33;
  __int16 v34;
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
      v13 = CFSTR("SPECIFIED");
    else
      v13 = CFSTR("NONE");
    v14 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a2);
    *(_DWORD *)buf = 138413314;
    v29 = CFSTR("MSUPrepareUpdateWithAsset");
    if (a5)
      v15 = CFSTR("SPECIFIED");
    else
      v15 = CFSTR("NONE");
    if (a6)
      v16 = CFSTR("SPECIFIED");
    else
      v16 = CFSTR("NONE");
    v30 = 2112;
    v31 = (uint64_t)v13;
    v32 = 2112;
    v33 = v14;
    v34 = 2112;
    v35 = v15;
    v36 = 2112;
    v37 = v16;
    _os_log_impl(&dword_211416000, v12, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | update_asset:%@, options:%@, fncallback:%@, context:%@", buf, 0x34u);
  }
  v17 = (const __CFString *)objc_msgSend((id)objc_msgSend(a1, "localURL"), "path");
  if (!v17)
  {
    v22 = objc_msgSend(a1, "state");
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 9, 0, 0, CFSTR("Could not get local URL for update asset; state is %ld"),
                          v23,
                          v24,
                          v25,
                          v22);
    if (a4)
      *a4 = (const __CFString *)error_internal_cf;
    else
      CFRelease(error_internal_cf);
    result = os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    MSUPrepareUpdateWithAsset_cold_1();
    return 0;
  }
  v18 = perform_prepare_command(v17, a2, (void *)objc_msgSend(a1, "attributes"), a3, a4, a5, a6);
  v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v20 = v19;
  if (!v18)
  {
    result = os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    MSUPrepareUpdateWithAsset_cold_2();
    return 0;
  }
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v21 = *a3;
    else
      v21 = -1;
    *(_DWORD *)buf = 138412546;
    v29 = CFSTR("MSUPrepareUpdateWithAsset");
    v30 = 2048;
    v31 = v21;
    _os_log_impl(&dword_211416000, v20, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | session:%ld", buf, 0x16u);
  }
  return 1;
}

uint64_t perform_prepare_command(const __CFString *a1, const void *a2, void *a3, _QWORD *a4, const __CFString **a5, uint64_t a6, uint64_t a7)
{
  NSObject *v13;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  const __CFString *v17;
  const __CFString *v18;
  __CFDictionary *Mutable;
  __CFDictionary *v20;
  NSObject *v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  const __CFString **v26;
  const __CFString **v27;
  _QWORD v29[7];
  CFNumberRef number;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  number = 0;
  v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v26 = a5;
    if (a1)
      v14 = a1;
    else
      v14 = CFSTR("NONE");
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a2, v26);
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a3);
    *(_DWORD *)buf = 138413570;
    v17 = CFSTR("SPECIFIED");
    v32 = CFSTR("perform_prepare_command");
    if (a6)
      v18 = CFSTR("SPECIFIED");
    else
      v18 = CFSTR("NONE");
    if (!a7)
      v17 = CFSTR("NONE");
    v33 = 2112;
    v34 = (uint64_t)v14;
    a5 = v27;
    v35 = 2112;
    v36 = v15;
    v37 = 2112;
    v38 = v16;
    v39 = 2112;
    v40 = v18;
    v41 = 2112;
    v42 = v17;
    _os_log_impl(&dword_211416000, v13, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | source_path:%@, prepare_options:%@, update_attributes:%@, fncallback:%@, context:%@", buf, 0x3Eu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v20 = Mutable;
  if (a1)
    CFDictionarySetValue(Mutable, CFSTR("SourcePath"), a1);
  if (a2)
    CFDictionarySetValue(v20, CFSTR("ClientOptions"), a2);
  if (a3)
    CFDictionarySetValue(v20, CFSTR("AssetProperties"), a3);
  CFDictionarySetValue(v20, CFSTR("ClientRepliesToProgress"), (const void *)*MEMORY[0x24BDBD270]);
  v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = CFSTR("perform_prepare_command");
    _os_log_impl(&dword_211416000, v21, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | PERFORM_WITH_PROGRESS | PrepareUpdate...", buf, 0xCu);
  }
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __perform_prepare_command_block_invoke;
  v29[3] = &unk_24CBCF358;
  v29[5] = a6;
  v29[6] = a7;
  v29[4] = CFSTR("perform_prepare_command");
  v22 = perform_command_with_progress("PrepareUpdate", v20, a3, (uint64_t)&number, a5, (uint64_t)v29);
  if ((_DWORD)v22)
  {
    CFNumberGetValue(number, kCFNumberLongType, a4);
    v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      if (a4)
        v24 = *a4;
      else
        v24 = -1;
      *(_DWORD *)buf = 138412546;
      v32 = CFSTR("perform_prepare_command");
      v33 = 2048;
      v34 = v24;
      _os_log_impl(&dword_211416000, v23, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | ...PrepareUpdate | SUCCESS | session:%ld", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    perform_prepare_command_cold_1();
  }
  CFRelease(v20);
  if (number)
    CFRelease(number);
  return v22;
}

BOOL MSUPrepareUpdateWithMAAsset(void *a1, const void *a2, uint64_t *a3, const __CFString **a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  uint64_t v15;
  const __CFString *v16;
  const __CFString *v17;
  const __CFString *v18;
  int v19;
  NSObject *v20;
  NSObject *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  CFErrorRef error_internal_cf;
  _BOOL8 result;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  const __CFString *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
    {
      v13 = (void *)objc_msgSend(a1, "absoluteAssetId");
      if (v13)
        v14 = (const __CFString *)objc_msgSend(v13, "summary");
      else
        v14 = CFSTR("SPECIFIED");
    }
    else
    {
      v14 = CFSTR("NONE");
    }
    v15 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a2);
    *(_DWORD *)buf = 138413314;
    v30 = CFSTR("MSUPrepareUpdateWithMAAsset");
    v16 = CFSTR("SPECIFIED");
    if (a5)
      v17 = CFSTR("SPECIFIED");
    else
      v17 = CFSTR("NONE");
    if (!a6)
      v16 = CFSTR("NONE");
    v31 = 2112;
    v32 = (uint64_t)v14;
    v33 = 2112;
    v34 = v15;
    v35 = 2112;
    v36 = v17;
    v37 = 2112;
    v38 = v16;
    _os_log_impl(&dword_211416000, v12, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | update_asset:%@, options:%@, fncallback:%@, context:%@", buf, 0x34u);
  }
  v18 = (const __CFString *)objc_msgSend((id)objc_msgSend(a1, "getLocalUrl"), "path");
  if (!v18)
  {
    v23 = objc_msgSend(a1, "state");
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 9, 0, 0, CFSTR("Could not get local URL for update asset; state is %ld"),
                          v24,
                          v25,
                          v26,
                          v23);
    if (a4)
      *a4 = (const __CFString *)error_internal_cf;
    else
      CFRelease(error_internal_cf);
    result = os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    MSUPrepareUpdateWithMAAsset_cold_1();
    return 0;
  }
  v19 = perform_prepare_command(v18, a2, (void *)objc_msgSend(a1, "attributes"), a3, a4, a5, a6);
  v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v21 = v20;
  if (!v19)
  {
    result = os_log_type_enabled(v20, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    MSUPrepareUpdateWithMAAsset_cold_2();
    return 0;
  }
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    if (a3)
      v22 = *a3;
    else
      v22 = -1;
    *(_DWORD *)buf = 138412546;
    v30 = CFSTR("MSUPrepareUpdateWithMAAsset");
    v31 = 2048;
    v32 = v22;
    _os_log_impl(&dword_211416000, v21, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | session:%ld", buf, 0x16u);
  }
  return 1;
}

uint64_t MSUPrepareUpdate(const __CFString *a1, const __CFDictionary *a2, uint64_t *a3, const __CFString **a4, uint64_t a5, uint64_t a6)
{
  NSObject *v12;
  const __CFString *v13;
  uint64_t v14;
  const __CFString *v15;
  const __CFString *v16;
  void *Value;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  int v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  const __CFString *v30;
  __int16 v31;
  const __CFString *v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
      v13 = a1;
    else
      v13 = CFSTR("NONE");
    v14 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a2);
    v23 = 138413314;
    v24 = CFSTR("MSUPrepareUpdate");
    v15 = CFSTR("SPECIFIED");
    v26 = (uint64_t)v13;
    if (a5)
      v16 = CFSTR("SPECIFIED");
    else
      v16 = CFSTR("NONE");
    v25 = 2112;
    if (!a6)
      v15 = CFSTR("NONE");
    v27 = 2112;
    v28 = v14;
    v29 = 2112;
    v30 = v16;
    v31 = 2112;
    v32 = v15;
    _os_log_impl(&dword_211416000, v12, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | source_path:%@, options:%@, fncallback:%@, context:%@", (uint8_t *)&v23, 0x34u);
  }
  if (a2)
    Value = (void *)CFDictionaryGetValue(a2, CFSTR("__msu-update-attributes-dictionary-key"));
  else
    Value = 0;
  v18 = perform_prepare_command(a1, a2, Value, a3, a4, a5, a6);
  v19 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v20 = v19;
  if ((_DWORD)v18)
  {
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      if (a3)
        v21 = *a3;
      else
        v21 = -1;
      v23 = 138412546;
      v24 = CFSTR("MSUPrepareUpdate");
      v25 = 2048;
      v26 = v21;
      _os_log_impl(&dword_211416000, v20, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | session:%ld", (uint8_t *)&v23, 0x16u);
    }
  }
  else if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    MSUPrepareUpdate_cold_1();
  }
  return v18;
}

__CFDictionary *copyDictionaryAddingLocale(CFDictionaryRef theDict, const void *a2, const void *a3)
{
  __CFDictionary *MutableCopy;
  __CFDictionary *v6;

  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, theDict);
  v6 = MutableCopy;
  if (a2)
  {
    if (MutableCopy)
    {
      CFDictionarySetValue(MutableCopy, CFSTR("CurrentLanguageCode"), a2);
      if (a3)
        CFDictionarySetValue(v6, CFSTR("CurrentExpandedLanguageCode"), a3);
    }
  }
  return v6;
}

uint64_t MSUApplyUpdate(uint64_t a1, const __CFDictionary *a2, const __CFString **a3, uint64_t a4, uint64_t a5)
{
  NSObject *v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  const __CFAllocator *v13;
  CFNumberRef v14;
  __CFDictionary *Mutable;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  __CFDictionary *v19;
  __CFDictionary *Value;
  __CFDictionary *v21;
  unint64_t v22;
  NSObject *v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  _QWORD v29[7];
  uint64_t valuePtr;
  uint8_t buf[4];
  const __CFString *v32;
  __int16 v33;
  uint64_t v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  valuePtr = a1;
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a2);
    v11 = CFSTR("SPECIFIED");
    *(_DWORD *)buf = 138413314;
    v32 = CFSTR("MSUApplyUpdate");
    v33 = 2048;
    if (a4)
      v12 = CFSTR("SPECIFIED");
    else
      v12 = CFSTR("NONE");
    v34 = a1;
    v35 = 2112;
    if (!a5)
      v11 = CFSTR("NONE");
    v36 = v10;
    v37 = 2112;
    v38 = v12;
    v39 = 2112;
    v40 = v11;
    _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | session:%ld, options:%@, fncallback:%@, context:%@", buf, 0x34u);
  }
  v13 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v14 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongType, &valuePtr);
  Mutable = CFDictionaryCreateMutable(v13, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v16 = objc_msgSend(MEMORY[0x24BDBCEA0], "_deviceLanguage");
  v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale"), "languageCode");
  if (v17)
  {
    v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v32 = CFSTR("MSUApplyUpdate");
      v33 = 2112;
      v34 = v17;
      v35 = 2112;
      v36 = v16;
      _os_log_impl(&dword_211416000, v18, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | Current Locale: %@ ExpandedLanguageCode: %@", buf, 0x20u);
    }
  }
  CFDictionarySetValue(Mutable, CFSTR("SessionHandle"), v14);
  if (a2)
  {
    v19 = copyDictionaryAddingLocale(a2, (const void *)v17, (const void *)v16);
    CFDictionarySetValue(Mutable, CFSTR("ClientOptions"), v19);
    CFRelease(v19);
    Value = (__CFDictionary *)CFDictionaryGetValue(a2, CFSTR("__msu-update-attributes-dictionary-key"));
    goto LABEL_21;
  }
  if (!(v17 | v16))
  {
    Value = 0;
    goto LABEL_21;
  }
  v21 = CFDictionaryCreateMutable(v13, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  Value = v21;
  if (!v21)
  {
LABEL_21:
    v22 = 0x24BEAE000uLL;
    goto LABEL_22;
  }
  v22 = 0x24BEAE000;
  if (v17)
    CFDictionaryAddValue(v21, CFSTR("CurrentLanguageCode"), (const void *)v17);
  if (v16)
    CFDictionaryAddValue(Value, CFSTR("CurrentExpandedLanguageCode"), (const void *)v16);
  CFDictionarySetValue(Mutable, CFSTR("ClientOptions"), Value);
  CFRelease(Value);
  Value = 0;
LABEL_22:
  CFDictionarySetValue(Mutable, CFSTR("ClientRepliesToProgress"), (const void *)*MEMORY[0x24BDBD270]);
  v23 = objc_msgSend((id)objc_msgSend(*(id *)(v22 + 2672), "sharedLogger"), "oslog");
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v32 = CFSTR("MSUApplyUpdate");
    _os_log_impl(&dword_211416000, v23, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | PERFORM_WITH_PROGRESS | ApplyUpdate...", buf, 0xCu);
  }
  v29[0] = MEMORY[0x24BDAC760];
  v29[1] = 3221225472;
  v29[2] = __MSUApplyUpdate_block_invoke;
  v29[3] = &unk_24CBCF358;
  v29[5] = a4;
  v29[6] = a5;
  v29[4] = CFSTR("MSUApplyUpdate");
  v24 = perform_command_with_progress("ApplyUpdate", Mutable, Value, 0, a3, (uint64_t)v29);
  CFRelease(v14);
  CFRelease(Mutable);
  v25 = objc_msgSend((id)objc_msgSend(*(id *)(v22 + 2672), "sharedLogger"), "oslog");
  v26 = v25;
  if ((_DWORD)v24)
  {
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v32 = CFSTR("MSUApplyUpdate");
      _os_log_impl(&dword_211416000, v26, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
  {
    MSUApplyUpdate_cold_1();
  }
  return v24;
}

uint64_t MSUSuspendUpdate(uint64_t a1, CFTypeRef *a2)
{
  NSObject *v4;
  const __CFAllocator *v5;
  CFNumberRef v6;
  CFDictionaryRef v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t valuePtr;
  void *values;
  void *keys;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  valuePtr = a1;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = CFSTR("MSUSuspendUpdate");
    v17 = 2048;
    v18 = a1;
    _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | session:%ld", buf, 0x16u);
  }
  v5 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v6 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberLongType, &valuePtr);
  values = v6;
  keys = CFSTR("SessionHandle");
  v7 = CFDictionaryCreate(v5, (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = perform_command("SuspendUpdate", v7, 0, 0, a2);
  CFRelease(v6);
  CFRelease(v7);
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v10 = v9;
  if ((_DWORD)v8)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v16 = CFSTR("MSUSuspendUpdate");
      _os_log_impl(&dword_211416000, v10, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    MSUSuspendUpdate_cold_1();
  }
  return v8;
}

uint64_t MSUResumeUpdate(_QWORD *a1, CFTypeRef *a2)
{
  return MSUResumeUpdateWithOptions(0, a1, a2);
}

uint64_t MSUResumeUpdateWithOptions(const __CFDictionary *a1, _QWORD *a2, CFTypeRef *a3)
{
  NSObject *v6;
  void *Value;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  CFNumberRef number;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  number = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v14 = CFSTR("MSUResumeUpdateWithOptions");
    v15 = 2112;
    v16 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a1);
    _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | options:%@", buf, 0x16u);
  }
  if (a1)
    Value = (void *)CFDictionaryGetValue(a1, CFSTR("__msu-update-attributes-dictionary-key"));
  else
    Value = 0;
  v8 = perform_command("ResumeUpdate", a1, Value, (const __CFString **)&number, a3);
  if ((_DWORD)v8)
  {
    CFNumberGetValue(number, kCFNumberLongType, a2);
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      if (a2)
        v10 = *a2;
      else
        v10 = -1;
      *(_DWORD *)buf = 138412546;
      v14 = CFSTR("MSUResumeUpdateWithOptions");
      v15 = 2048;
      v16 = v10;
      _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | session:%ld", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    MSUResumeUpdateWithOptions_cold_1();
  }
  if (number)
    CFRelease(number);
  return v8;
}

BOOL MSUBrainIsLoadable(void *a1, CFTypeRef *a2)
{
  NSObject *v4;
  NSObject *v5;
  _BOOL8 result;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  NSObject *v21;
  _BOOL4 v22;
  int v23;
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412546;
    v24 = CFSTR("MSUBrainIsLoadable");
    v25 = 2112;
    v26 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a1);
    _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetAttributes:%@", (uint8_t *)&v23, 0x16u);
  }
  if (!a1)
  {
    v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    MSUBrainIsLoadable_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    return 0;
  }
  if (!perform_command("BrainIsLoadable", 0, a1, 0, a2))
  {
    if (a2)
    {
      v15 = *a2;
      v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      v17 = v16;
      if (v15)
      {
        result = os_log_type_enabled(v16, OS_LOG_TYPE_ERROR);
        if (!result)
          return result;
        MSUBrainIsLoadable_cold_2();
        return 0;
      }
      v22 = os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v22)
        return result;
      v23 = 138412290;
      v24 = CFSTR("MSUBrainIsLoadable");
      v20 = "[SPI] %@ | SUCCESS | Brain not loadable";
      v21 = v17;
    }
    else
    {
      v18 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT);
      result = 0;
      if (!v19)
        return result;
      v23 = 138412290;
      v24 = CFSTR("MSUBrainIsLoadable");
      v20 = "[SPI] %@ | DONE | Brain not loadable";
      v21 = v18;
    }
    _os_log_impl(&dword_211416000, v21, OS_LOG_TYPE_DEFAULT, v20, (uint8_t *)&v23, 0xCu);
    return 0;
  }
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 138412290;
    v24 = CFSTR("MSUBrainIsLoadable");
    _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | Brain loadable", (uint8_t *)&v23, 0xCu);
  }
  return 1;
}

uint64_t MSUPurgeSuspendedUpdate(CFTypeRef *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  const __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = CFSTR("MSUPurgeSuspendedUpdate");
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v7, 0xCu);
  }
  v3 = perform_command("PurgeSuspendedUpdate", 0, 0, 0, a1);
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v5 = v4;
  if ((_DWORD)v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = CFSTR("MSUPurgeSuspendedUpdate");
      _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", (uint8_t *)&v7, 0xCu);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    MSUPurgeSuspendedUpdate_cold_1();
  }
  return v3;
}

void MSUCloseUpdateHandle()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    MSUCloseUpdateHandle_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

BOOL MSUAssetCalculateInstallationSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  const char *v9;
  _BOOL8 result;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint8_t buf[4];
  const __CFString *v22;
  __int16 v23;
  uint64_t v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v19 = 0;
  v20 = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v22 = CFSTR("MSUAssetCalculateInstallationSize");
    v23 = 2112;
    v24 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a1);
    _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }
  if (!a1)
  {
    v11 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    MSUAssetCalculateInstallationSize_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    return 0;
  }
  if (!MSUAssetCalculatePrepareSizes(a1, &v20, 0, a3)
    || !MSUAssetCalculateApplySizes(a1, &v19, 0, a3))
  {
    result = os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    MSUAssetCalculateInstallationSize_cold_2();
    return 0;
  }
  v7 = v19 + v20;
  if (a2)
  {
    *a2 = v7;
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = CFSTR("MSUAssetCalculateInstallationSize");
      v23 = 2048;
      v24 = v7;
      v9 = "[SPI] %@ | SUCCESS | installation size:%llu bytes";
LABEL_16:
      _os_log_impl(&dword_211416000, v8, OS_LOG_TYPE_DEFAULT, v9, buf, 0x16u);
    }
  }
  else
  {
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v22 = CFSTR("MSUAssetCalculateInstallationSize");
      v23 = 2048;
      v24 = v7;
      v9 = "[SPI] %@ | SUCCESS | installation size:%llu bytes (not returned - no output location)";
      goto LABEL_16;
    }
  }
  return 1;
}

uint64_t MSUAssetCalculatePrepareSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  return MSUAssetCalculatePrepareSizes(a1, a2, 0, a3);
}

uint64_t MSUAssetCalculateApplySize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  return MSUAssetCalculateApplySizes(a1, a2, 0, a3);
}

uint64_t MSUAssetCalculatePrepareSizes(void *a1, uint64_t *a2, uint64_t *a3, CFTypeRef *a4)
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFDictionaryRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeID v16;
  const __CFNumber *Value;
  const __CFNumber *v18;
  const __CFNumber *v19;
  CFTypeID v20;
  uint64_t v21;
  CFErrorRef error_internal_cf;
  const __CFString *v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  NSObject *v27;
  _BOOL4 v28;
  const char *v29;
  char v31;
  CFTypeRef cf;
  uint64_t v33;
  uint64_t valuePtr;
  void *values;
  void *keys;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v33 = 0;
  valuePtr = 0;
  cf = 0;
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = CFSTR("MSUAssetCalculatePrepareSize");
    v39 = 2112;
    v40 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a1);
    _os_log_impl(&dword_211416000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }
  if (!a1)
  {
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 9, 0, 0, CFSTR("No asset properties provided"), v9, v10, v11, v31);
    if (!a4)
    {
      CFRelease(error_internal_cf);
      v21 = 0;
      v12 = 0;
      goto LABEL_24;
    }
    v21 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  values = a1;
  keys = CFSTR("AssetProperties");
  v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!perform_command("CalculatePrepareSize", v12, 0, (const __CFString **)&cf, a4))
  {
LABEL_23:
    v21 = 0;
    goto LABEL_24;
  }
  if (!cf || (v16 = CFGetTypeID(cf), v16 != CFDictionaryGetTypeID()))
  {
    v23 = CFSTR("No prepare sizes dictionary in response");
LABEL_19:
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, v23, v13, v14, v15, v31);
    if (a4)
    {
      v21 = 0;
LABEL_21:
      *a4 = error_internal_cf;
      goto LABEL_24;
    }
    CFRelease(error_internal_cf);
    goto LABEL_23;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Size"));
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (a2)
    *a2 = valuePtr;
  v18 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("SnapshotSize"));
  if (!v18 || (v19 = v18, v20 = CFGetTypeID(v18), v20 != CFNumberGetTypeID()))
  {
    v23 = CFSTR("No snapshot prepare size in response");
    goto LABEL_19;
  }
  CFNumberGetValue(v19, kCFNumberSInt64Type, &v33);
  if (a3)
    *a3 = v33;
  v21 = 1;
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v12)
    CFRelease(v12);
  if (!(_DWORD)v21)
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      MSUAssetCalculatePrepareSizes_cold_1();
    }
    return v21;
  }
  v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (!v25)
      goto LABEL_37;
    *(_DWORD *)buf = 138412546;
    v38 = CFSTR("MSUAssetCalculatePrepareSize");
    v39 = 2048;
    v40 = valuePtr;
    v26 = "[SPI] %@ | SUCCESS | prepare size:%llu bytes";
  }
  else
  {
    if (!v25)
      goto LABEL_37;
    *(_DWORD *)buf = 138412546;
    v38 = CFSTR("MSUAssetCalculatePrepareSize");
    v39 = 2048;
    v40 = valuePtr;
    v26 = "[SPI] %@ | SUCCESS | prepare size:%llu bytes (not returned - no output location)";
  }
  _os_log_impl(&dword_211416000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
LABEL_37:
  v27 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v28 = os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
  if (a3)
  {
    if (v28)
    {
      *(_DWORD *)buf = 138412546;
      v38 = CFSTR("MSUAssetCalculatePrepareSize");
      v39 = 2048;
      v40 = v33;
      v29 = "[SPI] %@ | SUCCESS | snapshot prepare size:%llu bytes";
LABEL_42:
      _os_log_impl(&dword_211416000, v27, OS_LOG_TYPE_DEFAULT, v29, buf, 0x16u);
    }
  }
  else if (v28)
  {
    *(_DWORD *)buf = 138412546;
    v38 = CFSTR("MSUAssetCalculatePrepareSize");
    v39 = 2048;
    v40 = v33;
    v29 = "[SPI] %@ | SUCCESS | snapshot prepare size:%llu bytes (not returned - no output location)";
    goto LABEL_42;
  }
  return v21;
}

uint64_t MSUAssetCalculateApplySizes(void *a1, uint64_t *a2, _QWORD *a3, CFTypeRef *a4)
{
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  CFDictionaryRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFTypeID v16;
  const __CFNumber *Value;
  const __CFNumber *v18;
  const __CFNumber *v19;
  CFTypeID v20;
  uint64_t v21;
  CFErrorRef error_internal_cf;
  const __CFString *v23;
  NSObject *v24;
  _BOOL4 v25;
  const char *v26;
  char v28;
  CFTypeRef cf;
  uint64_t v30;
  uint64_t valuePtr;
  void *values;
  void *keys;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  uint64_t v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  valuePtr = 0;
  cf = 0;
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v35 = CFSTR("MSUAssetCalculateApplySize");
    v36 = 2112;
    v37 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a1);
    _os_log_impl(&dword_211416000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }
  if (!a1)
  {
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 9, 0, 0, CFSTR("No asset properties provided"), v9, v10, v11, v28);
    if (!a4)
    {
      CFRelease(error_internal_cf);
      v21 = 0;
      v12 = 0;
      goto LABEL_24;
    }
    v21 = 0;
    v12 = 0;
    goto LABEL_21;
  }
  values = a1;
  keys = CFSTR("AssetProperties");
  v12 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!perform_command("CalculateApplySize", v12, 0, (const __CFString **)&cf, a4))
  {
LABEL_23:
    v21 = 0;
    goto LABEL_24;
  }
  if (!cf || (v16 = CFGetTypeID(cf), v16 != CFDictionaryGetTypeID()))
  {
    v23 = CFSTR("No apply sizes dictionary in response");
LABEL_19:
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, v23, v13, v14, v15, v28);
    if (a4)
    {
      v21 = 0;
LABEL_21:
      *a4 = error_internal_cf;
      goto LABEL_24;
    }
    CFRelease(error_internal_cf);
    goto LABEL_23;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("Size"));
  CFNumberGetValue(Value, kCFNumberSInt64Type, &valuePtr);
  if (a2)
    *a2 = valuePtr;
  v18 = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("SnapshotSize"));
  if (!v18 || (v19 = v18, v20 = CFGetTypeID(v18), v20 != CFNumberGetTypeID()))
  {
    v23 = CFSTR("No snapshot apply size in response");
    goto LABEL_19;
  }
  CFNumberGetValue(v19, kCFNumberSInt64Type, &v30);
  if (a3)
    *a3 = v30;
  v21 = 1;
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if (v12)
    CFRelease(v12);
  if ((_DWORD)v21)
  {
    v24 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v25)
      {
        *(_DWORD *)buf = 138412546;
        v35 = CFSTR("MSUAssetCalculateApplySize");
        v36 = 2048;
        v37 = valuePtr;
        v26 = "[SPI] %@ | SUCCESS | apply size:%llu bytes";
LABEL_36:
        _os_log_impl(&dword_211416000, v24, OS_LOG_TYPE_DEFAULT, v26, buf, 0x16u);
      }
    }
    else if (v25)
    {
      *(_DWORD *)buf = 138412546;
      v35 = CFSTR("MSUAssetCalculateApplySize");
      v36 = 2048;
      v37 = valuePtr;
      v26 = "[SPI] %@ | SUCCESS | apply size:%llu bytes (not returned - no output location)";
      goto LABEL_36;
    }
  }
  else if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    MSUAssetCalculateApplySizes_cold_1();
  }
  return v21;
}

uint64_t MSUCheckPreparationSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v11;
  CFNumberRef v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  CFNumberRef v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  CFTypeID v20;
  const __CFNumber *Value;
  const void *v22;
  uint64_t v23;
  const void *error_internal_cf;
  const __CFString *v25;
  CFIndex v26;
  CFTypeRef v27;
  NSObject *v28;
  _BOOL4 v29;
  const char *v30;
  const __CFString *v32;
  CFTypeRef v33;
  uint64_t v34;
  CFTypeRef cf;
  uint64_t valuePtr;
  uint8_t buf[4];
  const __CFString *v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  valuePtr = 0;
  v33 = 0;
  v34 = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v38 = CFSTR("MSUAssetCalculateApplySize");
    v39 = 2112;
    v40 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a1);
    _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }
  if (!a1)
  {
    v25 = CFSTR("No asset properties provided");
    v26 = 9;
LABEL_19:
    v27 = 0;
    goto LABEL_20;
  }
  if ((MSUAssetCalculatePrepareSizes(a1, &valuePtr, 0, &v33) & 1) == 0)
  {
    v27 = v33;
    v25 = CFSTR("MSUAssetCalculatePrepareSize failed");
    v26 = 7;
LABEL_20:
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), v26, v27, 0, v25, v7, v8, v9, (char)v33);
    if (a3)
    {
      v23 = 0;
      v11 = 0;
LABEL_22:
      v16 = 0;
LABEL_23:
      *a3 = error_internal_cf;
      goto LABEL_26;
    }
    CFRelease(error_internal_cf);
    v23 = 0;
    v11 = 0;
LABEL_25:
    v16 = 0;
    goto LABEL_26;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!Mutable)
  {
    v25 = CFSTR("Failed to allocate command_options");
    v26 = 14;
    goto LABEL_19;
  }
  v11 = Mutable;
  v12 = CFNumberCreate(0, kCFNumberSInt64Type, &valuePtr);
  if (!v12)
  {
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 14, 0, 0, CFSTR("Failed to allocate requiredPrepSize_cf"), v13, v14, v15, (char)v33);
    if (a3)
    {
      v23 = 0;
      goto LABEL_22;
    }
    CFRelease(error_internal_cf);
    v23 = 0;
    goto LABEL_25;
  }
  v16 = v12;
  CFDictionarySetValue(v11, CFSTR("ClientOptions"), v12);
  if (!perform_command("CheckPreparationSize", v11, 0, (const __CFString **)&cf, a3))
  {
LABEL_51:
    v23 = 0;
    goto LABEL_26;
  }
  if (!cf || (v20 = CFGetTypeID(cf), v20 != CFDictionaryGetTypeID()))
  {
    v32 = CFSTR("No results dict in response");
LABEL_47:
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, v32, v17, v18, v19, (char)v33);
    if (a3)
      goto LABEL_48;
    CFRelease(error_internal_cf);
    goto LABEL_51;
  }
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("RequiredSize"));
  if (!Value)
  {
    v32 = CFSTR("No prep size in response");
    goto LABEL_47;
  }
  CFNumberGetValue(Value, kCFNumberSInt64Type, &v34);
  if (a2)
    *a2 = v34;
  v22 = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("ErrorInfo"));
  v23 = 1;
  if (a3 && v22)
  {
    error_internal_cf = copy_dictionary_to_cferror(v22);
LABEL_48:
    v23 = 0;
    goto LABEL_23;
  }
LABEL_26:
  if (v33)
  {
    CFRelease(v33);
    v33 = 0;
  }
  if (v11)
    CFRelease(v11);
  if (v16)
    CFRelease(v16);
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if ((_DWORD)v23)
  {
    v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    v29 = os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v29)
      {
        *(_DWORD *)buf = 138412546;
        v38 = CFSTR("MSUAssetCalculateApplySize");
        v39 = 2048;
        v40 = v34;
        v30 = "[SPI] %@ | SUCCESS | required size:%llu bytes";
LABEL_42:
        _os_log_impl(&dword_211416000, v28, OS_LOG_TYPE_DEFAULT, v30, buf, 0x16u);
      }
    }
    else if (v29)
    {
      *(_DWORD *)buf = 138412546;
      v38 = CFSTR("MSUAssetCalculateApplySize");
      v39 = 2048;
      v40 = v34;
      v30 = "[SPI] %@ | SUCCESS | required size:%llu bytes (not returned - no output location)";
      goto LABEL_42;
    }
  }
  else if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    MSUAssetCalculateApplySizes_cold_1();
  }
  return v23;
}

uint64_t MSUCheckInstallationSize(void *a1, uint64_t *a2, CFTypeRef *a3)
{
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CFDictionaryRef v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFTypeID v14;
  const __CFNumber *Value;
  const void *v16;
  uint64_t v17;
  const void *error_internal_cf;
  CFErrorRef v19;
  const __CFString *v20;
  NSObject *v21;
  _BOOL4 v22;
  const char *v23;
  uint64_t v25;
  CFTypeRef cf;
  void *values;
  void *keys;
  uint8_t buf[4];
  const __CFString *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v25 = 0;
  cf = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v30 = CFSTR("MSUCheckInstallationSize");
    v31 = 2112;
    v32 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a1);
    _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | assetprops:%@", buf, 0x16u);
  }
  if (a1)
  {
    values = a1;
    keys = CFSTR("AssetProperties");
    v10 = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], (const void **)&keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
    if (perform_command("CheckInstallationSize", v10, 0, (const __CFString **)&cf, a3))
    {
      if (cf && (v14 = CFGetTypeID(cf), v14 == CFDictionaryGetTypeID()))
      {
        Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("RequiredSize"));
        if (Value)
        {
          CFNumberGetValue(Value, kCFNumberSInt64Type, &v25);
          if (a2)
            *a2 = v25;
          v16 = CFDictionaryGetValue((CFDictionaryRef)cf, CFSTR("ErrorInfo"));
          v17 = 1;
          if (!a3 || !v16)
          {
LABEL_18:
            if (!v10)
              goto LABEL_24;
LABEL_23:
            CFRelease(v10);
            goto LABEL_24;
          }
          error_internal_cf = copy_dictionary_to_cferror(v16);
LABEL_17:
          v17 = 0;
          *a3 = error_internal_cf;
          goto LABEL_18;
        }
        v20 = CFSTR("No apply size in response");
      }
      else
      {
        v20 = CFSTR("No results dict in response");
      }
      error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, v20, v11, v12, v13, v25);
      if (a3)
        goto LABEL_17;
      CFRelease(error_internal_cf);
    }
    v17 = 0;
    if (!v10)
      goto LABEL_24;
    goto LABEL_23;
  }
  v19 = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 9, 0, 0, CFSTR("No asset properties provided"), v7, v8, v9, v25);
  if (a3)
  {
    v17 = 0;
    *a3 = v19;
  }
  else
  {
    CFRelease(v19);
    v17 = 0;
  }
LABEL_24:
  if (cf)
  {
    CFRelease(cf);
    cf = 0;
  }
  if ((_DWORD)v17)
  {
    v21 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v22)
      {
        *(_DWORD *)buf = 138412546;
        v30 = CFSTR("MSUCheckInstallationSize");
        v31 = 2048;
        v32 = v25;
        v23 = "[SPI] %@ | SUCCESS | required size:%llu bytes";
LABEL_34:
        _os_log_impl(&dword_211416000, v21, OS_LOG_TYPE_DEFAULT, v23, buf, 0x16u);
      }
    }
    else if (v22)
    {
      *(_DWORD *)buf = 138412546;
      v30 = CFSTR("MSUCheckInstallationSize");
      v31 = 2048;
      v32 = v25;
      v23 = "[SPI] %@ | SUCCESS | required size:%llu bytes (not returned - no output location)";
      goto LABEL_34;
    }
  }
  else if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    MSUCheckInstallationSize_cold_1();
  }
  return v17;
}

uint64_t MSURetrievePreviousUpdateResults(const __CFString **a1)
{
  NSObject *v2;
  CFMutableDictionaryRef Mutable;
  uint64_t v4;
  CFTypeID v5;
  CFTypeID TypeID;
  NSObject *v7;
  NSObject *v8;
  CFTypeRef cf;
  CFTypeRef v11;
  uint8_t buf[4];
  const __CFString *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v11 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = CFSTR("MSURetrievePreviousUpdateResults");
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = perform_command("RetrieveLastUpdateResult", Mutable, 0, (const __CFString **)&cf, &v11);
  if ((_DWORD)v4 && cf)
  {
    v5 = CFGetTypeID(cf);
    TypeID = CFDictionaryGetTypeID();
    if (a1 && v5 == TypeID)
      *a1 = copy_dictionary_to_cferror(cf);
    CFRelease(cf);
  }
  if (Mutable)
    CFRelease(Mutable);
  v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v8 = v7;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v13 = CFSTR("MSURetrievePreviousUpdateResults");
      _os_log_impl(&dword_211416000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousUpdateResults_cold_1();
  }
  if (v11)
    CFRelease(v11);
  return v4;
}

uint64_t MSURetrievePreviousUpdateState(_DWORD *a1)
{
  NSObject *v2;
  CFMutableDictionaryRef Mutable;
  uint64_t v4;
  CFTypeID v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  NSObject *v9;
  __CFString *v10;
  CFTypeRef cf;
  CFTypeRef v13;
  uint8_t buf[4];
  const __CFString *v15;
  __int16 v16;
  __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v13 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v15 = CFSTR("MSURetrievePreviousUpdateState");
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = perform_command("RetrievePreviousUpdateState", Mutable, 0, (const __CFString **)&cf, &v13);
  if (!(_DWORD)v4 || !cf)
  {
    v7 = 0;
    if (!Mutable)
      goto LABEL_10;
    goto LABEL_9;
  }
  v5 = CFGetTypeID(cf);
  if (v5 == CFNumberGetTypeID())
  {
    v6 = objc_msgSend((id)cf, "intValue");
    v7 = v6;
    if (a1)
      *a1 = v6;
  }
  else
  {
    v7 = 0;
  }
  CFRelease(cf);
  if (Mutable)
LABEL_9:
    CFRelease(Mutable);
LABEL_10:
  v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v9 = v8;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      if (v7 >= 4)
        v10 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MSUPreviousUpdateState(%d)"), v7);
      else
        v10 = off_24CBCF3F8[(int)v7];
      *(_DWORD *)buf = 138412546;
      v15 = CFSTR("MSURetrievePreviousUpdateState");
      v16 = 2112;
      v17 = v10;
      _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | previous update state:%@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousUpdateState_cold_1();
  }
  if (v13)
    CFRelease(v13);
  return v4;
}

id MSUCopyPreviousUpdateAllToleratedFailures()
{
  NSObject *v0;
  id v1;
  NSObject *v2;
  uint64_t v3;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = CFSTR("MSUCopyPreviousUpdateAllToleratedFailures");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v5, 0xCu);
  }
  v1 = copyPreviousToleratedFailures(1);
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", v1);
    v5 = 138412546;
    v6 = CFSTR("MSUCopyPreviousUpdateAllToleratedFailures");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | DONE | toleratedFailures:%@", (uint8_t *)&v5, 0x16u);
  }
  return v1;
}

id copyPreviousToleratedFailures(int a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _BOOL4 v9;
  uint64_t v10;
  __CFString **v11;
  __CFString *v12;
  const __CFString *v13;
  _QWORD v15[6];
  _QWORD v16[6];
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  void *v23;
  void **v24;
  uint64_t v25;
  void (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!a1)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist"));
    v17 = 0;
    v18 = (uint64_t)&v17;
    v19 = 0x3052000000;
    v20 = __Block_byref_object_copy_;
    v21 = __Block_byref_object_dispose_;
    v22 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3052000000;
    v26 = __Block_byref_object_copy_;
    v27 = __Block_byref_object_dispose_;
    v28 = 0;
    v7 = MEMORY[0x24BDAC760];
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke;
    v16[3] = &unk_24CBCF380;
    v16[4] = &v17;
    v16[5] = &v23;
    objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
    v8 = *(void **)(v18 + 40);
    if (v8)
    {
      v9 = 0;
    }
    else
    {
      v15[0] = v7;
      v15[1] = 3221225472;
      v15[2] = __retrieve_previous_update_first_tolerated_failure_block_invoke_2;
      v15[3] = &unk_24CBCF380;
      v15[4] = &v17;
      v15[5] = &v23;
      objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v15);
      v8 = *(void **)(v18 + 40);
      v9 = v8 != 0;
      if (!v8)
        goto LABEL_13;
    }
    v10 = objc_msgSend((id)objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("StepName")), "compare:", CFSTR("update_baseband"));
    v11 = kMSUUpdateToleratedStepValueUpdateBaseband;
    if (v10)
      v11 = kMSUUpdateToleratedStepValueUnrecognizedStep;
    v12 = *v11;
    if (*v11)
    {
      v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("StepIdentifier"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", CFSTR("StepName")), CFSTR("StepName"));
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", v24[5]), CFSTR("EventUnique"));
      if (v9)
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("RebootRetry"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", CFSTR("RetryFailureNumber")), CFSTR("FailureNumber"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", CFSTR("RetryResult")), CFSTR("Result"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", CFSTR("RetryError")), CFSTR("Error"));
        v13 = CFSTR("RetrySkipped");
      }
      else
      {
        objc_msgSend(v3, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("RebootRetry"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", CFSTR("InitialFailureNumber")), CFSTR("FailureNumber"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", CFSTR("InitialResult")), CFSTR("Result"));
        objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", CFSTR("InitialError")), CFSTR("Error"));
        v13 = CFSTR("InitialSkipped");
      }
      objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(*(id *)(v18 + 40), "objectForKeyedSubscript:", v13), CFSTR("Skipped"));
      goto LABEL_16;
    }
LABEL_13:
    v3 = 0;
LABEL_16:
    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v17, 8);
    return v3;
  }
  v1 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithContentsOfFile:", CFSTR("/private/var/MobileSoftwareUpdate/lastOTA/ota_tolerated_failures.plist"));
  if (!v1)
    return 0;
  v2 = (void *)v1;
  v3 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = (uint64_t)__retrieve_previous_update_all_tolerated_failures_block_invoke;
  v20 = (void (*)(uint64_t, uint64_t))&unk_24CBCF3A8;
  v21 = (void (*)(uint64_t))CFSTR("retrieve_previous_update_all_tolerated_failures");
  v22 = v4;
  objc_msgSend(v2, "enumerateKeysAndObjectsUsingBlock:", &v17);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("Index"), 1);
  v23 = v5;
  objc_msgSend(v3, "setObject:forKeyedSubscript:", objc_msgSend(v4, "sortedArrayUsingDescriptors:", objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v23, 1)), CFSTR("toleratedStepsArray"));

  return v3;
}

void sub_21141D5DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose((const void *)(v14 - 104), 8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MSURetrievePreviousUpdateFirstToleratedFailure()
{
  NSObject *v0;
  id v1;
  NSObject *v2;
  uint64_t v3;
  int v5;
  const __CFString *v6;
  __int16 v7;
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 138412290;
    v6 = CFSTR("MSURetrievePreviousUpdateFirstToleratedFailure");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v5, 0xCu);
  }
  v1 = copyPreviousToleratedFailures(0);
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", v1);
    v5 = 138412546;
    v6 = CFSTR("MSURetrievePreviousUpdateFirstToleratedFailure");
    v7 = 2112;
    v8 = v3;
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | DONE | toleratedFailures:%@", (uint8_t *)&v5, 0x16u);
  }
  return v1;
}

id MSUCopyToleratedStatusForStep(const __CFString *a1)
{
  NSObject *v2;
  const __CFString *v3;
  id updated;
  const void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint8_t v41[128];
  uint8_t buf[4];
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("NONE");
    if (a1)
      v3 = a1;
    *(_DWORD *)buf = 138412546;
    v43 = CFSTR("MSUCopyToleratedStatusForStep");
    v44 = 2112;
    v45 = v3;
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | step:%@", buf, 0x16u);
  }
  if (a1)
  {
    updated = MSUCopyPreviousUpdateAllToleratedFailures();
    if (updated)
    {
      v5 = updated;
      v6 = objc_msgSend((id)objc_msgSend(updated, "objectForKey:", CFSTR("toleratedStepsArray")), "mutableCopy");
      if (v6)
      {
        v7 = (void *)v6;
        v8 = (void *)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        v40 = 0u;
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
        if (v9)
        {
          v10 = v9;
          v11 = 0;
          v12 = *(_QWORD *)v38;
          do
          {
            v13 = 0;
            do
            {
              if (*(_QWORD *)v38 != v12)
                objc_enumerationMutation(v7);
              if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v13), "objectForKeyedSubscript:", CFSTR("CheckPoint")), "isEqualToString:", a1) & 1) == 0)objc_msgSend(v8, "addIndex:", v11 + v13);
              ++v13;
            }
            while (v10 != v13);
            v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v41, 16);
            v11 += v13;
          }
          while (v10);
        }
        objc_msgSend(v7, "removeObjectsAtIndexes:", v8);
        if (objc_msgSend(v7, "count"))
        {
          v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          if (v14)
          {
            v15 = v14;
            objc_msgSend(v14, "setObject:forKeyedSubscript:", v7, CFSTR("toleratedStepsArray"));
            v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
            if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v43 = CFSTR("MSUCopyToleratedStatusForStep");
              _os_log_impl(&dword_211416000, v16, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | providing tolerated failure array", buf, 0xCu);
            }
            goto LABEL_34;
          }
          v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
            MSUCopyToleratedStatusForStep_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
        }
        else
        {
          v27 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v43 = CFSTR("MSUCopyToleratedStatusForStep");
            _os_log_impl(&dword_211416000, v27, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | empty failure array", buf, 0xCu);
          }
        }
        v15 = 0;
LABEL_34:
        CFRelease(v5);
        CFRelease(v7);
        return v15;
      }
      v26 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = CFSTR("MSUCopyToleratedStatusForStep");
        _os_log_impl(&dword_211416000, v26, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | No tolerated failure array", buf, 0xCu);
      }
      CFRelease(v5);
    }
    else
    {
      v25 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v43 = CFSTR("MSUCopyToleratedStatusForStep");
        _os_log_impl(&dword_211416000, v25, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | No tolerated failures found", buf, 0xCu);
      }
    }
  }
  else
  {
    v17 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      MSUCopyToleratedStatusForStep_cold_1(v17, v18, v19, v20, v21, v22, v23, v24);
  }
  return 0;
}

uint64_t MSUParsedToleratedFailureForStep(const __CFString *a1)
{
  NSObject *v2;
  const __CFString *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  __CFString *v31;
  CFTypeRef cf;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t v38[128];
  uint8_t buf[4];
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = CFSTR("NONE");
    if (a1)
      v3 = a1;
    *(_DWORD *)buf = 138412546;
    v40 = CFSTR("MSUParsedToleratedFailureForStep");
    v41 = 2112;
    v42 = v3;
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | step:%@", buf, 0x16u);
  }
  if (a1)
  {
    v4 = MSUCopyToleratedStatusForStep(a1);
    if (v4)
    {
      cf = v4;
      v5 = (void *)objc_msgSend(v4, "objectForKey:", CFSTR("toleratedStepsArray"));
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      if (v6)
      {
        v7 = v6;
        v8 = *(_QWORD *)v35;
        while (2)
        {
          for (i = 0; i != v7; ++i)
          {
            if (*(_QWORD *)v35 != v8)
              objc_enumerationMutation(v5);
            v10 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * i);
            v11 = (void *)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Attempt"));
            v12 = objc_msgSend((id)objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("rcode")), "intValue");
            if (objc_msgSend(v11, "isEqualToString:", CFSTR("initial")))
            {
              v13 = v12 != 0;
            }
            else
            {
              if (!objc_msgSend(v11, "isEqualToString:", CFSTR("reboot-retry")))
              {
                v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
                if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
                  MSUParsedToleratedFailureForStep_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
                CFRelease(cf);
                goto LABEL_23;
              }
              v13 = 2 * (v12 != 0);
            }
          }
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
          if (v7)
            continue;
          break;
        }
      }
      else
      {
        v13 = 0;
      }
      CFRelease(cf);
    }
    else
    {
      v13 = 0;
    }
    v30 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      if (v13 >= 3)
        v31 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MSUToleratedFailureStatus(%d)"), v13);
      else
        v31 = off_24CBCF418[v13];
      *(_DWORD *)buf = 138412546;
      v40 = CFSTR("MSUParsedToleratedFailureForStep");
      v41 = 2112;
      v42 = v31;
      _os_log_impl(&dword_211416000, v30, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | Tolerated failure status:%@", buf, 0x16u);
    }
  }
  else
  {
LABEL_23:
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      MSUParsedToleratedFailureForStep_cold_1(v22, v23, v24, v25, v26, v27, v28, v29);
    return 3;
  }
  return v13;
}

BOOL MSUDidLastUpdateBasebandTolerateFailure()
{
  return MSUParsedToleratedFailureForStep(CFSTR("update_baseband")) != 0;
}

uint64_t MSUIsFirstBootAfterUpdate(_BYTE *a1)
{
  NSObject *v2;
  CFMutableDictionaryRef Mutable;
  uint64_t v4;
  CFTypeID v5;
  CFTypeID v6;
  int v7;
  int v8;
  NSObject *v9;
  NSObject *v10;
  const __CFString *v11;
  CFTypeRef cf;
  CFTypeRef v14;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  const __CFString *v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v14 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("MSUIsFirstBootAfterUpdate");
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = perform_command("IsFirstBootAfterUpdate", Mutable, 0, (const __CFString **)&cf, &v14);
  if (!(_DWORD)v4 || !cf)
  {
    v8 = 0;
    if (!Mutable)
      goto LABEL_11;
    goto LABEL_10;
  }
  v5 = CFGetTypeID(cf);
  if (v5 == CFNumberGetTypeID() || (v6 = CFGetTypeID(cf), v6 == CFBooleanGetTypeID()))
  {
    v7 = objc_msgSend((id)cf, "BOOLValue");
    v8 = v7;
    if (a1)
      *a1 = v7;
  }
  else
  {
    v8 = 0;
  }
  CFRelease(cf);
  if (Mutable)
LABEL_10:
    CFRelease(Mutable);
LABEL_11:
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v10 = v9;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v11 = CFSTR("NO");
      if (v8)
        v11 = CFSTR("YES");
      *(_DWORD *)buf = 138412546;
      v16 = CFSTR("MSUIsFirstBootAfterUpdate");
      v17 = 2112;
      v18 = v11;
      _os_log_impl(&dword_211416000, v10, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | first boot after update:%@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    MSUIsFirstBootAfterUpdate_cold_1();
  }
  if (v14)
    CFRelease(v14);
  return v4;
}

uint64_t MSURetrievePreviousUpdateDate(CFTypeRef *a1)
{
  NSObject *v2;
  CFMutableDictionaryRef Mutable;
  uint64_t v4;
  CFTypeID v5;
  NSObject *v6;
  NSObject *v7;
  CFTypeRef cf;
  CFTypeRef v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  CFTypeRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v10 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = CFSTR("MSURetrievePreviousUpdateDate");
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = perform_command("RetrievePreviousUpdateDate", Mutable, 0, (const __CFString **)&cf, &v10);
  if (!(_DWORD)v4 || !cf || (v5 = CFGetTypeID(cf), v5 != CFDateGetTypeID()))
  {
LABEL_8:
    if (!Mutable)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (a1)
  {
    *a1 = cf;
    goto LABEL_8;
  }
  CFRelease(cf);
  if (Mutable)
LABEL_9:
    CFRelease(Mutable);
LABEL_10:
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v7 = v6;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = CFSTR("MSURetrievePreviousUpdateDate");
      v13 = 2112;
      v14 = cf;
      _os_log_impl(&dword_211416000, v7, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | previous update date:%@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousUpdateDate_cold_1();
  }
  if (v10)
    CFRelease(v10);
  return v4;
}

uint64_t MSURetrievePreviousRestoreDate(CFTypeRef *a1)
{
  NSObject *v2;
  CFMutableDictionaryRef Mutable;
  uint64_t v4;
  CFTypeID v5;
  NSObject *v6;
  NSObject *v7;
  CFTypeRef cf;
  CFTypeRef v10;
  uint8_t buf[4];
  const __CFString *v12;
  __int16 v13;
  CFTypeRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v10 = 0;
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v12 = CFSTR("MSURetrievePreviousRestoreDate");
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v4 = perform_command("RetrievePreviousRestoreDate", Mutable, 0, (const __CFString **)&cf, &v10);
  if (!(_DWORD)v4 || !cf || (v5 = CFGetTypeID(cf), v5 != CFDateGetTypeID()))
  {
LABEL_8:
    if (!Mutable)
      goto LABEL_10;
    goto LABEL_9;
  }
  if (a1)
  {
    *a1 = cf;
    goto LABEL_8;
  }
  CFRelease(cf);
  if (Mutable)
LABEL_9:
    CFRelease(Mutable);
LABEL_10:
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v7 = v6;
  if ((_DWORD)v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v12 = CFSTR("MSURetrievePreviousRestoreDate");
      v13 = 2112;
      v14 = cf;
      _os_log_impl(&dword_211416000, v7, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | previous restore date:%@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    MSURetrievePreviousRestoreDate_cold_1();
  }
  if (v10)
    CFRelease(v10);
  return v4;
}

uint64_t MSUCopyEnvInfoForNeRD()
{
  NSObject *v0;
  void *v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  const __CFString *v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v16 = CFSTR("MSUCopyEnvInfoForNeRD");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%s/%s/%s"), "/private/var/MobileSoftwareUpdate/", "Controller/NeRD", "BootedOSState.plist");
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v16 = CFSTR("MSUCopyEnvInfoForNeRD");
    v17 = 2112;
    v18 = (uint64_t)v1;
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | Attempting to load bootedOS state from %@", buf, 0x16u);
  }
  v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v1);

  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", v3);
      *(_DWORD *)buf = 138412546;
      v16 = CFSTR("MSUCopyEnvInfoForNeRD");
      v17 = 2112;
      v18 = v6;
      _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | envDict:%@", buf, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    MSUCopyEnvInfoForNeRD_cold_1(v5, v7, v8, v9, v10, v11, v12, v13);
  }
  return v3;
}

CFTypeRef MSUCopyConnectivityData()
{
  NSObject *v0;
  CFTypeID v1;
  CFTypeRef v2;
  NSObject *v3;
  uint64_t v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  CFTypeRef cf;
  CFTypeRef v23;
  uint8_t buf[4];
  const __CFString *v25;
  __int16 v26;
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v23 = 0;
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = CFSTR("MSUCopyConnectivityData");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  if ((perform_command("GetStashedConnectivityData", 0, 0, (const __CFString **)&cf, &v23) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      MSUCopyConnectivityData_cold_3();
    }
    goto LABEL_14;
  }
  if (!cf)
  {
    v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      MSUCopyConnectivityData_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    goto LABEL_14;
  }
  v1 = CFGetTypeID(cf);
  if (v1 != CFDictionaryGetTypeID())
  {
    v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      MSUCopyConnectivityData_cold_2(v13, v14, v15, v16, v17, v18, v19, v20);
LABEL_14:
    v2 = 0;
    goto LABEL_15;
  }
  v2 = cf;
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", v2);
    *(_DWORD *)buf = 138412546;
    v25 = CFSTR("MSUCopyConnectivityData");
    v26 = 2112;
    v27 = v4;
    _os_log_impl(&dword_211416000, v3, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | connectivityData:%@", buf, 0x16u);
  }
LABEL_15:
  if (v23)
    CFRelease(v23);
  return v2;
}

BOOL MSUReportAndCleanupPreviousUpdateState()
{
  NSObject *v0;
  CFTypeID v1;
  int Value;
  _BOOL8 v3;
  NSObject *v4;
  const __CFString *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFTypeRef cf;
  CFTypeRef v32;
  uint8_t buf[4];
  const __CFString *v34;
  __int16 v35;
  const __CFString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v32 = 0;
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v34 = CFSTR("MSUReportAndCleanupPreviousUpdateState");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  if ((perform_command("PerformReportAndCleanup", 0, 0, (const __CFString **)&cf, &v32) & 1) == 0)
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      MSUReportAndCleanupPreviousUpdateState_cold_3(v6, v7, v8, v9, v10, v11, v12, v13);
    goto LABEL_16;
  }
  if (!cf)
  {
    v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      MSUReportAndCleanupPreviousUpdateState_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_16;
  }
  v1 = CFGetTypeID(cf);
  if (v1 != CFBooleanGetTypeID())
  {
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      MSUReportAndCleanupPreviousUpdateState_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
LABEL_16:
    v3 = 0;
    goto LABEL_17;
  }
  Value = CFBooleanGetValue((CFBooleanRef)cf);
  v3 = Value != 0;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = CFSTR("NO");
    if (Value)
      v5 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v34 = CFSTR("MSUReportAndCleanupPreviousUpdateState");
    v35 = 2112;
    v36 = v5;
    _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | perform cleanup command response value:%@", buf, 0x16u);
  }
LABEL_17:
  if (v32)
  {
    CFRelease(v32);
    v32 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v3;
}

uint64_t MSUCopyInstalledRecoveryOSVersion()
{
  NSObject *v0;
  uint64_t v1;
  void *v2;
  const void *v3;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  const __CFString *v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = CFSTR("MSUCopyInstalledRecoveryOSVersion");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/MobileSoftwareUpdate/%s"), "recoveryOSVersion.plist");
  if (!v1)
  {
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      MSUCopyInstalledRecoveryOSVersion_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    return 0;
  }
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v1);
  if (!v2)
  {
    v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      MSUCopyInstalledRecoveryOSVersion_cold_2(v14, v15, v16, v17, v18, v19, v20, v21);
    return 0;
  }
  v3 = v2;
  v4 = objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithString:", objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("BuildNumber")));
  v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v24 = CFSTR("MSUCopyInstalledRecoveryOSVersion");
    v25 = 2112;
    v26 = v4;
    _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | Installed recovery OS version:%@", buf, 0x16u);
  }
  CFRelease(v3);
  return v4;
}

uint64_t RVGetNeRDInfo()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint8_t buf[4];
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v14 = CFSTR("RVGetNeRDInfo");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  v1 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("/var/MobileSoftwareUpdate/%s"), "recoveryOSVersion.plist");
  v2 = objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithContentsOfFile:", v1);
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v4 = v3;
  if (v2)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = CFSTR("RVGetNeRDInfo");
      _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
  {
    RVGetNeRDInfo_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
  }
  return v2;
}

uint64_t RVTriggerNeRDUpdate(void *a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  _BOOL4 v5;
  const char *v6;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412290;
    v9 = CFSTR("RVTriggerNeRDUpdate");
    _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v8, 0xCu);
  }
  v3 = perform_command("RVTriggerNeRDUpdate", a1, 0, 0, 0);
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v3)
  {
    if (v5)
    {
      v8 = 138412290;
      v9 = CFSTR("RVTriggerNeRDUpdate");
      v6 = "[SPI] %@ | SUCCESS";
LABEL_8:
      _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v8, 0xCu);
    }
  }
  else if (v5)
  {
    v8 = 138412290;
    v9 = CFSTR("RVTriggerNeRDUpdate");
    v6 = "[SPI] %@ | FAILURE";
    goto LABEL_8;
  }
  return v3;
}

CFTypeRef MSUGetUpdateInfo(const __CFString *a1, void *a2)
{
  NSObject *v4;
  const __CFString *v5;
  __CFDictionary *Mutable;
  __CFDictionary *v7;
  const void *v8;
  NSObject *v9;
  const char *v10;
  CFTypeID v11;
  CFTypeRef v12;
  NSObject *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  CFTypeRef cf;
  CFTypeRef v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v33 = 0;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
      v5 = a1;
    else
      v5 = CFSTR("NONE");
    *(_DWORD *)buf = 138412802;
    v35 = CFSTR("MSUGetUpdateInfo");
    v36 = 2112;
    v37 = (uint64_t)v5;
    v38 = 2112;
    v39 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", a2);
    _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN | targetUUID:%@, options:%@", buf, 0x20u);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v7 = Mutable;
  if (a1)
    CFDictionarySetValue(Mutable, CFSTR("TargetUUID"), a1);
  if (!a2)
  {
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_16;
    *(_DWORD *)buf = 138412290;
    v35 = CFSTR("MSUGetUpdateInfo");
    v10 = "[SPI] %@ | No options in the updateInfo request";
    goto LABEL_15;
  }
  v8 = (const void *)objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("AssetProperties"));
  if (v8)
  {
    CFDictionarySetValue(v7, CFSTR("AssetProperties"), v8);
    goto LABEL_16;
  }
  v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = CFSTR("MSUGetUpdateInfo");
    v10 = "[SPI] %@ | No kAssetProperties in the updateInfo request";
LABEL_15:
    _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, v10, buf, 0xCu);
  }
LABEL_16:
  if ((perform_command("GetUpdateInformation", v7, 0, (const __CFString **)&cf, &v33) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      MSUGetUpdateInfo_cold_3();
    }
    goto LABEL_27;
  }
  if (!cf)
  {
    v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      MSUGetUpdateInfo_cold_1(v15, v16, v17, v18, v19, v20, v21, v22);
    goto LABEL_27;
  }
  v11 = CFGetTypeID(cf);
  if (v11 != CFDictionaryGetTypeID())
  {
    v23 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      MSUGetUpdateInfo_cold_2(v23, v24, v25, v26, v27, v28, v29, v30);
LABEL_27:
    v12 = 0;
    goto LABEL_28;
  }
  v12 = cf;
  v13 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = objc_msgSend(MEMORY[0x24BDBCE70], "safeSummaryForDictionary:", v12);
    *(_DWORD *)buf = 138412546;
    v35 = CFSTR("MSUGetUpdateInfo");
    v36 = 2112;
    v37 = v14;
    _os_log_impl(&dword_211416000, v13, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | update info:%@", buf, 0x16u);
  }
LABEL_28:
  if (v7)
    CFRelease(v7);
  if (v33)
    CFRelease(v33);
  return v12;
}

uint64_t MSUCommitStash(void *Value, const void **a2)
{
  NSObject *v4;
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  CFTypeID v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  NSObject *v14;
  NSObject *v15;
  const void *v16;
  CFTypeRef cf;
  CFTypeRef v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  CFTypeRef v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v19 = 0;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = CFSTR("MSUCommitStash");
    _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = Mutable;
  if (Value)
  {
    CFDictionarySetValue(Mutable, CFSTR("ClientOptions"), Value);
    Value = (void *)CFDictionaryGetValue((CFDictionaryRef)Value, CFSTR("__msu-update-attributes-dictionary-key"));
    if (Value)
      CFDictionarySetValue(v6, CFSTR("AssetProperties"), Value);
  }
  if ((perform_command("CommitStash", v6, Value, (const __CFString **)&cf, &v19) & 1) == 0)
  {
    v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_DWORD *)buf = 138412546;
    v21 = CFSTR("MSUCommitStash");
    v22 = 2112;
    v23 = v19;
    v11 = "[SPI] %@ | FAILURE | Failed to perform kCommandCommitStash command with error: %@";
    v12 = v10;
    v13 = 22;
    goto LABEL_21;
  }
  if (!cf)
  {
    v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      goto LABEL_22;
    *(_DWORD *)buf = 138412290;
    v21 = CFSTR("MSUCommitStash");
    v11 = "[SPI] %@ | FAILURE | NULL response from kCommandCommitStash command";
    goto LABEL_20;
  }
  v7 = CFGetTypeID(cf);
  if (v7 == CFDictionaryGetTypeID())
  {
    if (a2)
      *a2 = copy_dictionary_to_cferror(cf);
    v8 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v21 = CFSTR("MSUCommitStash");
      _os_log_impl(&dword_211416000, v8, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS", buf, 0xCu);
    }
    v9 = 1;
    goto LABEL_31;
  }
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v21 = CFSTR("MSUCommitStash");
    v11 = "[SPI] %@ | FAILURE | Unexpected response type to kCommandCommitStash command";
LABEL_20:
    v12 = v14;
    v13 = 12;
LABEL_21:
    _os_log_impl(&dword_211416000, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
  }
LABEL_22:
  if (a2 && !*a2 && v19)
    *a2 = CFRetain(v19);
  v15 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v9 = 0;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    if (a2)
      v16 = *a2;
    else
      v16 = 0;
    *(_DWORD *)buf = 138412546;
    v21 = CFSTR("MSUCommitStash");
    v22 = 2112;
    v23 = v16;
    _os_log_impl(&dword_211416000, v15, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | FAILURE | Failed with error: %@", buf, 0x16u);
    v9 = 0;
  }
LABEL_31:
  if (v6)
    CFRelease(v6);
  if (v19)
    CFRelease(v19);
  return v9;
}

BOOL MSUPerformSemiSplat(const void *a1, CFTypeRef *a2)
{
  NSObject *v4;
  __CFDictionary *Mutable;
  __CFDictionary *v6;
  CFTypeID v7;
  int Value;
  _BOOL8 v9;
  NSObject *v10;
  const __CFString *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  CFTypeRef v36;
  CFTypeRef cf;
  CFTypeRef v39;
  uint8_t buf[4];
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v39 = 0;
  v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v41 = CFSTR("MSUPerformSemiSplat");
    _os_log_impl(&dword_211416000, v4, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v6 = Mutable;
  if (a1)
    CFDictionarySetValue(Mutable, CFSTR("TargetVolume"), a1);
  if ((perform_command("PerformCryptegraftSemiSplat", v6, 0, (const __CFString **)&cf, &v39) & 1) == 0)
  {
    v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      MSUPerformSemiSplat_cold_3(v12, v13, v14, v15, v16, v17, v18, v19);
    goto LABEL_18;
  }
  if (!cf)
  {
    v20 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      MSUPerformSemiSplat_cold_1(v20, v21, v22, v23, v24, v25, v26, v27);
    goto LABEL_18;
  }
  v7 = CFGetTypeID(cf);
  if (v7 != CFBooleanGetTypeID())
  {
    v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      MSUPerformSemiSplat_cold_2(v28, v29, v30, v31, v32, v33, v34, v35);
LABEL_18:
    v9 = 0;
    goto LABEL_19;
  }
  Value = CFBooleanGetValue((CFBooleanRef)cf);
  v9 = Value != 0;
  v10 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = CFSTR("NO");
    if (Value)
      v11 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v41 = CFSTR("MSUPerformSemiSplat");
    v42 = 2112;
    v43 = v11;
    _os_log_impl(&dword_211416000, v10, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | cryptegraft SemiSplat command response value:%@", buf, 0x16u);
  }
LABEL_19:
  v36 = v39;
  if (a2 && v39)
  {
    *a2 = CFRetain(v39);
    v36 = v39;
  }
  if (v36)
  {
    CFRelease(v36);
    v39 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v9;
}

BOOL MSUPerformDownlevel(const void *a1, const void *a2, CFTypeRef *a3)
{
  NSObject *v6;
  __CFDictionary *Mutable;
  __CFDictionary *v8;
  CFTypeID v9;
  int Value;
  _BOOL8 v11;
  NSObject *v12;
  const __CFString *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  CFTypeRef v30;
  CFTypeRef cf;
  CFTypeRef v33;
  uint8_t buf[4];
  const __CFString *v35;
  __int16 v36;
  const __CFString *v37;
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  cf = 0;
  v33 = 0;
  v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v35 = CFSTR("MSUPerformDownlevel");
    _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", buf, 0xCu);
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  v8 = Mutable;
  if (a1)
    CFDictionarySetValue(Mutable, CFSTR("TargetVolume"), a1);
  if (a2)
    CFDictionarySetValue(v8, CFSTR("SourcePath"), a2);
  if ((perform_command("PerformCryptegraftDownlevel", v8, 0, (const __CFString **)&cf, &v33) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      MSUPerformDownlevel_cold_3();
    }
    goto LABEL_20;
  }
  if (!cf)
  {
    v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      MSUPerformDownlevel_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    goto LABEL_20;
  }
  v9 = CFGetTypeID(cf);
  if (v9 != CFBooleanGetTypeID())
  {
    v22 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      MSUPerformDownlevel_cold_2(v22, v23, v24, v25, v26, v27, v28, v29);
LABEL_20:
    v11 = 0;
    goto LABEL_21;
  }
  Value = CFBooleanGetValue((CFBooleanRef)cf);
  v11 = Value != 0;
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = CFSTR("NO");
    if (Value)
      v13 = CFSTR("YES");
    *(_DWORD *)buf = 138412546;
    v35 = CFSTR("MSUPerformDownlevel");
    v36 = 2112;
    v37 = v13;
    _os_log_impl(&dword_211416000, v12, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | SUCCESS | cryptegraft downlevel command response value:%@", buf, 0x16u);
  }
LABEL_21:
  v30 = v33;
  if (a3 && v33)
  {
    *a3 = CFRetain(v33);
    v30 = v33;
  }
  if (v30)
  {
    CFRelease(v30);
    v33 = 0;
  }
  if (cf)
    CFRelease(cf);
  return v11;
}

uint64_t MSURebootToNerd()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  const char *v4;
  int v6;
  const __CFString *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v0 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = CFSTR("MSURebootToNerd");
    _os_log_impl(&dword_211416000, v0, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | BEGIN", (uint8_t *)&v6, 0xCu);
  }
  v1 = perform_command("RebootToNerd", 0, 0, 0, 0);
  v2 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v1)
  {
    if (v3)
    {
      v6 = 138412290;
      v7 = CFSTR("MSURebootToNerd");
      v4 = "[SPI] %@ | SUCCESS";
LABEL_8:
      _os_log_impl(&dword_211416000, v2, OS_LOG_TYPE_DEFAULT, v4, (uint8_t *)&v6, 0xCu);
    }
  }
  else if (v3)
  {
    v6 = 138412290;
    v7 = CFSTR("MSURebootToNerd");
    v4 = "[SPI] %@ | FAILURE";
    goto LABEL_8;
  }
  return v1;
}

uint64_t __perform_prepare_command_block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t (*v4)(uint64_t, _QWORD);
  uint64_t v5;
  NSObject *v6;
  uint64_t v7;
  const __CFString *v8;
  NSObject *v9;
  uint64_t v10;
  uint8_t buf[4];
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = (uint64_t (*)(uint64_t, _QWORD))a1[5];
  if (v4)
  {
    v5 = v4(a2, a1[6]);
    v6 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = a1[4];
      if ((_DWORD)v5 == -1)
      {
        v8 = CFSTR("ClientSendError");
      }
      else if ((_DWORD)v5 == 2)
      {
        v8 = CFSTR("Cancel");
      }
      else if ((_DWORD)v5)
      {
        v8 = (const __CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("MSUOperation(%d)"), v5);
      }
      else
      {
        v8 = CFSTR("Continue");
      }
      *(_DWORD *)buf = 138412802;
      v13 = v7;
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = a2;
      _os_log_impl(&dword_211416000, v6, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | PrepareUpdate | PROGRESS (%@) | state:%@", buf, 0x20u);
    }
  }
  else
  {
    v9 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    v5 = 0;
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = a1[4];
      *(_DWORD *)buf = 138412802;
      v13 = v10;
      v14 = 2112;
      v15 = CFSTR("Continue");
      v16 = 2112;
      v17 = a2;
      _os_log_impl(&dword_211416000, v9, OS_LOG_TYPE_DEFAULT, "[SPI] %@ | PrepareUpdate | PROGRESS (no progress handler - %@) | state:%@", buf, 0x20u);
      return 0;
    }
  }
  return v5;
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

uint64_t __retrieve_previous_update_first_tolerated_failure_block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t result;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;

  result = objc_msgSend(a2, "isEqualToString:", CFSTR("uuid"));
  if ((result & 1) == 0)
  {
    result = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InitialAttempted")), "BOOLValue");
    if ((_DWORD)result)
    {
      v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
      v9 = *(_QWORD *)(v7 + 40);
      v8 = (_QWORD *)(v7 + 40);
      result = v9;
      if (v9)
      {
        v10 = (void *)objc_msgSend((id)result, "objectForKeyedSubscript:", CFSTR("InitialFailureNumber"));
        v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InitialFailureNumber"));
        LODWORD(v10) = objc_msgSend(v10, "intValue");
        result = objc_msgSend(v11, "intValue");
        if ((int)result > (int)v10)
          return result;
        v8 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
      }
      *v8 = a3;
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
    }
  }
  return result;
}

void *__retrieve_previous_update_first_tolerated_failure_block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *result;
  uint64_t v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;

  result = (void *)objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RetryAttempted")), "BOOLValue");
  if ((_DWORD)result)
  {
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v9 = *(void **)(v7 + 40);
    v8 = (_QWORD *)(v7 + 40);
    result = v9;
    if (v9)
    {
      v10 = (void *)objc_msgSend(result, "objectForKeyedSubscript:", CFSTR("RetryFailureNumber"));
      v11 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RetryFailureNumber"));
      LODWORD(v10) = objc_msgSend(v10, "intValue");
      result = (void *)objc_msgSend(v11, "intValue");
      if ((int)result > (int)v10)
        return result;
      v8 = (_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    }
    *v8 = a3;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = a2;
  }
  return result;
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  if ((objc_msgSend(a2, "isEqualToString:", CFSTR("uuid")) & 1) == 0)
  {
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InitialAttempted")), "BOOLValue"))
    {
      v5 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      if (v5)
      {
        v6 = v5;
        objc_msgSend(v5, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StepName")), CFSTR("CheckPoint"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InitialFailureNumber")), CFSTR("Index"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InitialError")), CFSTR("Description"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", CFSTR("initial"), CFSTR("Attempt"));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("InitialResult")), CFSTR("rcode"));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);

      }
      else
      {
        v7 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2(a1, v7, v8, v9, v10, v11, v12, v13);
      }
    }
    if (objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RetryAttempted")), "BOOLValue"))
    {
      v14 = objc_alloc_init(MEMORY[0x24BDBCED8]);
      if (v14)
      {
        v15 = v14;
        objc_msgSend(v14, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("StepName")), CFSTR("CheckPoint"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RetryFailureNumber")), CFSTR("Index"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RetryError")), CFSTR("Description"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", CFSTR("reboot-retry"), CFSTR("Attempt"));
        objc_msgSend(v15, "setObject:forKeyedSubscript:", objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("RetryResult")), CFSTR("rcode"));
        objc_msgSend(*(id *)(a1 + 40), "addObject:", v15);

      }
      else
      {
        v16 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1(a1, v16, v17, v18, v19, v20, v21, v22);
      }
    }
  }
}

void addSeObjectToMessage(uint64_t a1, void *a2, void *a3)
{
  void *v6;
  void *v7;
  size_t v8;
  id v9;

  if (a1 && a3)
  {
    v6 = (void *)objc_msgSend(a3, "stringByAppendingString:", CFSTR("Length"));
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1618]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v7, "encodeObject:forKey:", a1, *MEMORY[0x24BDD0E88]);
    v9 = (id)objc_msgSend(v7, "encodedData");
    v8 = objc_msgSend(v9, "length");
    xpc_dictionary_set_data(a2, (const char *)objc_msgSend(a3, "UTF8String"), (const void *)objc_msgSend(v9, "bytes"), v8);
    xpc_dictionary_set_double(a2, (const char *)objc_msgSend(v6, "UTF8String"), (double)v8);

  }
  else if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    addSeObjectToMessage_cold_1();
  }
}

uint64_t perform_command(const char *a1, void *a2, void *a3, const __CFString **a4, CFTypeRef *a5)
{
  return perform_se_command(a1, a2, a3, 0, a4, a5);
}

uint64_t perform_se_command(const char *a1, void *a2, void *a3, uint64_t a4, const __CFString **a5, CFTypeRef *a6)
{
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _xpc_connection_s *v16;
  xpc_object_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *context;
  void *v24;
  xpc_object_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  int v32;
  NSObject *v33;
  uint64_t v34;
  char v36;
  CFTypeRef cf;
  uint8_t buf[4];
  const char *v39;
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v12 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v39 = a1;
    _os_log_impl(&dword_211416000, v12, OS_LOG_TYPE_DEFAULT, "[CLIENT_IPC] Performing se command: %s", buf, 0xCu);
  }
  cf = 0;
  v16 = copy_connection_for_command(a1, a2, a3, 1, (const __CFString **)&cf);
  if (v16)
  {
    v17 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v17, "Command", a1);
    if (a2)
      msu_serialize_cf_object_into_xpc_dict(v17, "CommandParameters", a2, v18, v19, v20, v21, v22);
    if (a3)
      msu_serialize_cf_object_into_xpc_dict(v17, "UpdateAttributes", a3, v18, v19, v20, v21, v22);
    if (a4)
      addSeObjectToMessage(a4, v17, CFSTR("SecureEncodedObjects"));
    context = xpc_connection_get_context(v16);
    v24 = context;
    if (context)
    {
      objc_sync_enter(context);
      objc_msgSend(v24, "addObject:", v17);
      objc_sync_exit(v24);
    }
    v25 = xpc_connection_send_message_with_reply_sync(v16, v17);
    v26 = xpc_connection_get_context(v16);
    v31 = v26;
    if (v26)
    {
      objc_sync_enter(v26);
      objc_msgSend(v31, "removeObject:", v17);
      objc_sync_exit(v31);
    }
    v32 = msu_demux_reply(v25, a5, 0, (const __CFString **)&cf, v27, v28, v29, v30);
    if (v17)
      xpc_release(v17);
    if (v25)
      xpc_release(v25);
    xpc_release(v16);
    if (v32)
    {
      v33 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v39 = a1;
        _os_log_impl(&dword_211416000, v33, OS_LOG_TYPE_DEFAULT, "[CLIENT_IPC] Performed se command: %s | SUCCESS", buf, 0xCu);
      }
      v34 = 1;
      goto LABEL_26;
    }
  }
  else
  {
    cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 27, 0, 0, CFSTR("Could not create connection to update brain service"), v13, v14, v15, v36);
  }
  if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    perform_se_command_cold_1();
  }
  v34 = 0;
LABEL_26:
  if (a6)
  {
    *a6 = cf;
  }
  else if (cf)
  {
    CFRelease(cf);
  }
  return v34;
}

void sub_21142066C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

xpc_connection_t copy_connection_for_command(const char *a1, void *a2, void *a3, int a4, const __CFString **a5)
{
  uint64_t i;
  size_t v11;
  _QWORD block[7];

  for (i = 0; i != 75; i += 3)
  {
    v11 = strlen((&copy_connection_for_command_CONNECTION_TABLE)[i]);
    if (!strncmp(a1, (&copy_connection_for_command_CONNECTION_TABLE)[i], v11))
    {
      if (a4)
        return (xpc_connection_t)copy_shared_softwareupdated_connection((uint64_t)a5);
      else
        return xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0, 2uLL);
    }
  }
  if (!a4)
    return create_brain_connection(a2, a3, a5);
  if (get_shared_update_brain_connection_queue_update_brain_queue_once != -1)
    dispatch_once(&get_shared_update_brain_connection_queue_update_brain_queue_once, &__block_literal_global_58);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __copy_shared_update_brain_connection_block_invoke;
  block[3] = &__block_descriptor_56_e5_v8__0l;
  block[4] = a2;
  block[5] = a3;
  block[6] = a5;
  dispatch_sync((dispatch_queue_t)get_shared_update_brain_connection_queue_update_brain_queue, block);
  return (xpc_connection_t)copy_shared_update_brain_connection_brain_connection;
}

uint64_t perform_command_with_progress(const char *a1, void *a2, void *a3, uint64_t a4, const __CFString **a5, uint64_t a6)
{
  return perform_se_command_with_progress(a1, a2, a3, 0, a4, a5, a6);
}

uint64_t perform_se_command_with_progress(const char *a1, void *a2, void *a3, uint64_t a4, uint64_t a5, const __CFString **a6, uint64_t a7)
{
  NSObject *v14;
  NSObject *v15;
  xpc_object_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _xpc_connection_s *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _xpc_connection_s *v26;
  CFErrorRef error_internal_cf;
  NSObject *v28;
  const __CFString *v29;
  uint64_t v30;
  char v32;
  _QWORD handler[13];
  uint64_t v34;
  const __CFString **v35;
  uint64_t v36;
  uint64_t v37;
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  char v41;
  uint8_t v42[4];
  const char *v43;
  __int128 buf;
  uint64_t v45;
  char v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v14 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = a1;
    _os_log_impl(&dword_211416000, v14, OS_LOG_TYPE_DEFAULT, "[CLIENT_IPC] Performing se command with progress: %s", (uint8_t *)&buf, 0xCu);
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v45 = 0x2020000000;
  v46 = 0;
  v40[0] = 0;
  v40[1] = v40;
  v40[2] = 0x2020000000;
  v41 = 0;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x2020000000;
  v39 = 0;
  v15 = dispatch_semaphore_create(0);
  v34 = 0;
  v35 = (const __CFString **)&v34;
  v36 = 0x2020000000;
  v37 = 0;
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "Command", a1);
  if (a2)
    msu_serialize_cf_object_into_xpc_dict(v16, "CommandParameters", a2, v17, v18, v19, v20, v21);
  if (a4)
    addSeObjectToMessage(a4, v16, CFSTR("SecureEncodedObjects"));
  v22 = copy_connection_for_command(a1, a2, a3, 0, v35 + 3);
  v26 = v22;
  if (!v22)
  {
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 27, 0, 0, CFSTR("Could not create connection to update brain service"), v23, v24, v25, v32);
    v35[3] = (const __CFString *)error_internal_cf;
    if (!v16)
      goto LABEL_12;
    goto LABEL_11;
  }
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = __perform_se_command_with_progress_block_invoke;
  handler[3] = &unk_24CBCF438;
  handler[4] = v22;
  handler[5] = v16;
  handler[8] = v38;
  handler[9] = v40;
  handler[10] = &v34;
  handler[11] = &buf;
  handler[12] = a5;
  handler[6] = v15;
  handler[7] = a7;
  xpc_connection_set_event_handler(v22, handler);
  xpc_connection_resume(v26);
  xpc_connection_send_message(v26, v16);
  dispatch_semaphore_wait(v15, 0xFFFFFFFFFFFFFFFFLL);
  if (v16)
LABEL_11:
    xpc_release(v16);
LABEL_12:
  if (v26)
  {
    xpc_connection_set_event_handler(v26, &__block_literal_global_1);
    xpc_release(v26);
  }
  dispatch_release(v15);
  if (*(_BYTE *)(*((_QWORD *)&buf + 1) + 24))
  {
    v28 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v42 = 136315138;
      v43 = a1;
      _os_log_impl(&dword_211416000, v28, OS_LOG_TYPE_DEFAULT, "[CLIENT_IPC] Performed se command with progress: %s | SUCCESS", v42, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    perform_se_command_with_progress_cold_1();
  }
  v29 = v35[3];
  if (a6)
  {
    *a6 = v29;
  }
  else if (v29)
  {
    CFRelease(v29);
  }
  v30 = *(unsigned __int8 *)(*((_QWORD *)&buf + 1) + 24);
  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(v38, 8);
  _Block_object_dispose(v40, 8);
  _Block_object_dispose(&buf, 8);
  return v30;
}

void sub_211420B88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Unwind_Resume(exception_object);
}

void __perform_se_command_with_progress_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char string;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  int v20;
  xpc_object_t reply;
  void *v22;
  const char *v23;
  const char *v24;
  _xpc_connection_s *remote_connection;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  CFTypeRef cf;

  v4 = MEMORY[0x212BD9B04](a2);
  if (v4 == MEMORY[0x24BDACFB8])
  {
    if (a2 == (void *)MEMORY[0x24BDACF30] && (v29 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8), *(_BYTE *)(v29 + 24)))
    {
      *(_BYTE *)(v29 + 24) = 0;
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), *(xpc_object_t *)(a1 + 40));
    }
    else if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24))
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, CFSTR("Received XPC error %s"), v10, v11, v12, string);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = 0;
      dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
    }
  }
  else if (v4 == MEMORY[0x24BDACFA0])
  {
    v13 = xpc_dictionary_get_string(a2, "Command");
    if (v13 && !strncmp(v13, "ResendMessage", 0xDuLL))
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
    else
    {
      v14 = xpc_dictionary_get_string(a2, "IPCStatus");
      cf = 0;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = msu_demux_reply(a2, *(const __CFString ***)(a1 + 96), (__CFDictionary **)&cf, (const __CFString **)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)+ 24), v15, v16, v17, v18);
      if (cf)
      {
        v19 = *(_QWORD *)(a1 + 56);
        if (v19)
        {
          v20 = (*(uint64_t (**)(void))(v19 + 16))();
          reply = xpc_dictionary_create_reply(a2);
          if (reply)
          {
            v22 = reply;
            v23 = "kMSUOperationClientSendError";
            if (v20 == 2)
              v23 = "kMSUOperationCancel";
            if (v20)
              v24 = v23;
            else
              v24 = "kMSUOperationContinue";
            xpc_dictionary_set_string(reply, "CallbackReturn", v24);
            remote_connection = xpc_dictionary_get_remote_connection(a2);
            if (remote_connection)
              xpc_connection_send_message(remote_connection, v22);
            else
              *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, CFSTR("Could not retrieve XPC remote connection for reply"), v26, v27, v28, v30);
            xpc_release(v22);
          }
        }
        CFRelease(cf);
      }
      else if (!v14 || strncmp(v14, "Callback", 8uLL))
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = 1;
        xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
      }
    }
  }
  else
  {
    v5 = (void *)MEMORY[0x212BD9A8C](a2);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, CFSTR("Unexpected XPC object %s"), v6, v7, v8, (char)v5);
    free(v5);
  }
}

uint64_t copy_shared_softwareupdated_connection(uint64_t a1)
{
  _QWORD block[5];

  if (get_shared_softwareupdated_connection_queue_softwareupdated_queue_once != -1)
    dispatch_once(&get_shared_softwareupdated_connection_queue_softwareupdated_queue_once, &__block_literal_global_54);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __copy_shared_softwareupdated_connection_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  dispatch_sync((dispatch_queue_t)get_shared_softwareupdated_connection_queue_softwareupdated_queue, block);
  return copy_shared_softwareupdated_connection_softwareupdated_connection;
}

xpc_connection_t create_softwareupdated_connection()
{
  return xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0, 2uLL);
}

xpc_connection_t create_brain_connection(void *a1, void *a2, const __CFString **a3)
{
  uint64_t v6;
  _xpc_connection_s *v7;
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  xpc_object_t v14;
  uint64_t v15;
  void *v16;
  xpc_connection_t v17;
  _xpc_endpoint_s *value;
  const __CFString *v20;
  const __CFString *v21;

  v6 = copy_shared_softwareupdated_connection((uint64_t)a3);
  if (v6)
  {
    v7 = (_xpc_connection_s *)v6;
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "Command", "CreateUpdateBrainConnection");
    if (a1)
      msu_serialize_cf_object_into_xpc_dict(v8, "CommandParameters", a1, v9, v10, v11, v12, v13);
    if (a2)
      msu_serialize_cf_object_into_xpc_dict(v8, "UpdateAttributes", a2, v9, v10, v11, v12, v13);
    v14 = xpc_connection_send_message_with_reply_sync(v7, v8);
    v15 = MEMORY[0x212BD9B04]();
    if (v15 == MEMORY[0x24BDACFB8])
    {
      v16 = (void *)MEMORY[0x212BD9A8C](v14);
      if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        create_brain_connection_cold_2();
      }
    }
    else
    {
      if (v15 == MEMORY[0x24BDACFA0])
      {
        value = (_xpc_endpoint_s *)xpc_dictionary_get_value(v14, "UpdateBrainServiceEndPoint");
        if (value)
        {
          v17 = xpc_connection_create_from_endpoint(value);
          if (!v8)
            goto LABEL_18;
          goto LABEL_17;
        }
        if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
        {
          create_brain_connection_cold_4();
        }
        v20 = msu_deserialize_cf_object_from_xpc_dict(v14, "ErrorInfo");
        if (v20)
        {
          v21 = v20;
          if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
          {
            create_brain_connection_cold_3();
          }
          *a3 = copy_dictionary_to_cferror(v21);
          CFRelease(v21);
        }
LABEL_16:
        v17 = 0;
        if (!v8)
        {
LABEL_18:
          if (v14)
            xpc_release(v14);
          xpc_release(v7);
          return v17;
        }
LABEL_17:
        xpc_release(v8);
        goto LABEL_18;
      }
      v16 = (void *)MEMORY[0x212BD9A8C](v14);
      if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
      {
        create_brain_connection_cold_5();
      }
    }
    free(v16);
    goto LABEL_16;
  }
  if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    create_brain_connection_cold_1();
  }
  return 0;
}

void __copy_shared_softwareupdated_connection_block_invoke(uint64_t a1)
{
  void *v2;
  _xpc_connection_s *mach_service;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  CFErrorRef error_internal_cf;
  CFErrorRef *v9;

  v2 = (void *)copy_shared_softwareupdated_connection_softwareupdated_connection;
  if (copy_shared_softwareupdated_connection_softwareupdated_connection)
  {
LABEL_6:
    xpc_retain(v2);
    return;
  }
  mach_service = xpc_connection_create_mach_service("com.apple.mobile.softwareupdated", 0, 2uLL);
  copy_shared_softwareupdated_connection_softwareupdated_connection = (uint64_t)mach_service;
  if (mach_service)
  {
    xpc_connection_set_context(mach_service, objc_alloc_init(MEMORY[0x24BDBCEB8]));
    xpc_connection_set_finalizer_f((xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection, finalize_shared_softwareupdated_connection);
    v7 = (_xpc_connection_s *)copy_shared_softwareupdated_connection_softwareupdated_connection;
    if (get_shared_softwareupdated_connection_queue_softwareupdated_queue_once != -1)
      dispatch_once(&get_shared_softwareupdated_connection_queue_softwareupdated_queue_once, &__block_literal_global_54);
    xpc_connection_set_target_queue(v7, (dispatch_queue_t)get_shared_softwareupdated_connection_queue_softwareupdated_queue);
    xpc_connection_set_event_handler((xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection, &__block_literal_global_49);
    xpc_connection_resume((xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection);
    v2 = (void *)copy_shared_softwareupdated_connection_softwareupdated_connection;
    goto LABEL_6;
  }
  error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 40, 0, 0, CFSTR("Could not create connection to service %s"), v4, v5, v6, (char)"com.apple.mobile.softwareupdated");
  v9 = *(CFErrorRef **)(a1 + 32);
  if (v9)
    *v9 = error_internal_cf;
  else
    CFRelease(error_internal_cf);
}

void __copy_shared_softwareupdated_connection_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *string;
  void *context;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v3 = MEMORY[0x212BD9B04](a2);
  if (v3 != MEMORY[0x24BDACFB8])
  {
    if (v3 == MEMORY[0x24BDACFA0]
      && xpc_dictionary_get_string(a2, "Command")
      && (string = xpc_dictionary_get_string(a2, "Command"), !strncmp(string, "ResendMessage", 0xDuLL)))
    {
      _block_invoke_softwareupdated_did_self_destruct = 1;
    }
    else
    {
      v4 = (void *)MEMORY[0x212BD9A8C](a2);
      v5 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        v22 = v4;
        _os_log_impl(&dword_211416000, v5, OS_LOG_TYPE_DEFAULT, "[CLIENT_IPC] softwareupdated connection event handler | %s", buf, 0xCu);
      }
      free(v4);
    }
    return;
  }
  if (a2 != (void *)MEMORY[0x24BDACF30])
  {
    xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x24BDACF40]);
    logfunction("", 1, CFSTR("XPC error on connection to %s: %s\n"), v6, v7, v8, v9, v10, (char)"com.apple.mobile.softwareupdated");
    goto LABEL_21;
  }
  if (_block_invoke_softwareupdated_did_self_destruct != 1)
  {
LABEL_21:
    if (copy_shared_softwareupdated_connection_softwareupdated_connection)
    {
      xpc_release((xpc_object_t)copy_shared_softwareupdated_connection_softwareupdated_connection);
      copy_shared_softwareupdated_connection_softwareupdated_connection = 0;
    }
    return;
  }
  context = xpc_connection_get_context((xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection);
  if (context)
  {
    v13 = context;
    objc_sync_enter(context);
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
    if (v14)
    {
      v15 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v18 != v15)
            objc_enumerationMutation(v13);
          xpc_connection_send_message((xpc_connection_t)copy_shared_softwareupdated_connection_softwareupdated_connection, *(xpc_object_t *)(*((_QWORD *)&v17 + 1) + 8 * i));
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v23, 16);
      }
      while (v14);
    }
    objc_sync_exit(v13);
  }
}

void sub_211421550(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

dispatch_queue_t __get_shared_softwareupdated_connection_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mobile.softwareupdated", 0);
  get_shared_softwareupdated_connection_queue_softwareupdated_queue = (uint64_t)result;
  return result;
}

void __copy_shared_update_brain_connection_block_invoke(uint64_t a1)
{
  void *v1;
  _xpc_connection_s *brain_connection;

  v1 = (void *)copy_shared_update_brain_connection_brain_connection;
  if (copy_shared_update_brain_connection_brain_connection)
    goto LABEL_4;
  brain_connection = create_brain_connection(*(void **)(a1 + 32), *(void **)(a1 + 40), *(const __CFString ***)(a1 + 48));
  copy_shared_update_brain_connection_brain_connection = (uint64_t)brain_connection;
  if (brain_connection)
  {
    xpc_connection_set_event_handler(brain_connection, &__block_literal_global_56);
    xpc_connection_resume((xpc_connection_t)copy_shared_update_brain_connection_brain_connection);
    v1 = (void *)copy_shared_update_brain_connection_brain_connection;
LABEL_4:
    xpc_retain(v1);
    return;
  }
  if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
  {
    __copy_shared_update_brain_connection_block_invoke_cold_1();
  }
}

void __copy_shared_update_brain_connection_block_invoke_55(uint64_t a1, void *a2)
{
  void *v3;
  NSObject *v4;

  if (MEMORY[0x212BD9B04](a2) == MEMORY[0x24BDACFB8])
  {
    if (a2 != (void *)MEMORY[0x24BDACF30])
    {
      v4 = objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __copy_shared_update_brain_connection_block_invoke_55_cold_1(a2, v4);
    }
    if (copy_shared_update_brain_connection_brain_connection)
    {
      xpc_release((xpc_object_t)copy_shared_update_brain_connection_brain_connection);
      copy_shared_update_brain_connection_brain_connection = 0;
    }
  }
  else
  {
    v3 = (void *)MEMORY[0x212BD9A8C](a2);
    if (os_log_type_enabled((os_log_t)objc_msgSend((id)objc_msgSend(MEMORY[0x24BEAEA70], "sharedLogger"), "oslog"), OS_LOG_TYPE_ERROR))
    {
      __copy_shared_update_brain_connection_block_invoke_55_cold_2();
    }
    free(v3);
  }
}

dispatch_queue_t __get_shared_update_brain_connection_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.mobile.softwareupdated", 0);
  get_shared_update_brain_connection_queue_update_brain_queue = (uint64_t)result;
  return result;
}

void msu_process_dictionary_values_for_xpc_serialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5;
  const void *v6;
  __CFDictionary *Mutable;

  v5 = msu_process_cf_object_for_xpc_serialization(a2);
  if (v5)
  {
    v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }
    CFRelease(v6);
  }
}

CFDictionaryRef msu_process_cf_object_for_xpc_serialization(void *a1)
{
  CFTypeID v2;
  __CFArray *MutableCopy;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  const __CFAllocator *v7;
  const void *ValueAtIndex;
  uint64_t v9;
  const void *v10;
  CFDictionaryRef context;

  if (!a1)
    return 0;
  v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        v5 = Count;
        v6 = 0;
        MutableCopy = 0;
        v7 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          v9 = msu_process_cf_object_for_xpc_serialization(ValueAtIndex);
          if (v9)
          {
            v10 = (const void *)v9;
            if (!MutableCopy)
              MutableCopy = CFArrayCreateMutableCopy(v7, 0, (CFArrayRef)a1);
            CFArraySetValueAtIndex(MutableCopy, v6, v10);
            CFRelease(v10);
          }
          ++v6;
        }
        while (v5 != v6);
        return MutableCopy;
      }
    }
    else if (v2 == CFErrorGetTypeID())
    {
      return cferror_to_dictionary_embedded((__CFError *)a1, 1);
    }
    return 0;
  }
  context = 0;
  CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)msu_process_dictionary_values_for_xpc_serialization, &context);
  if (!context)
    return 0;
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return MutableCopy;
}

void msu_merge_dictionary_values(void *key, void *value, CFMutableDictionaryRef theDict)
{
  CFDictionarySetValue(theDict, key, value);
}

void msu_serialize_cf_object_into_xpc_dict(void *a1, const char *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  CFDictionaryRef v10;
  CFDictionaryRef v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  if (a3)
  {
    v10 = msu_process_cf_object_for_xpc_serialization(a3);
    if (v10)
    {
      v11 = v10;
      v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      CFRelease(v11);
      if (v12)
      {
LABEL_4:
        xpc_dictionary_set_value(a1, a2, v12);
        xpc_release(v12);
        return;
      }
    }
    else
    {
      v12 = (void *)_CFXPCCreateXPCObjectFromCFObject();
      if (v12)
        goto LABEL_4;
    }
    logfunction("", 1, CFSTR("could not create object for key %s:%@\n"), v13, v14, v15, v16, v17, (char)a2);
  }
  else
  {
    logfunction("", 1, CFSTR("%s: API misuse - object is NULL\n"), a4, a5, a6, a7, a8, (char)"msu_serialize_cf_object_into_xpc_dict");
  }
}

void msu_process_dictionary_values_from_xpc_deserialization(const void *a1, uint64_t a2, __CFDictionary **a3)
{
  uint64_t v5;
  const void *v6;
  __CFDictionary *Mutable;

  v5 = msu_process_cf_object_from_xpc_deserialization(a2);
  if (v5)
  {
    v6 = (const void *)v5;
    if (a3)
    {
      if (!*a3)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
        *a3 = Mutable;
        CFDictionarySetValue(Mutable, a1, v6);
      }
    }
    CFRelease(v6);
  }
}

const __CFString *msu_process_cf_object_from_xpc_deserialization(const void *a1)
{
  CFTypeID v2;
  CFIndex Count;
  CFIndex v5;
  CFIndex v6;
  __CFArray *MutableCopy;
  const __CFAllocator *v8;
  const void *ValueAtIndex;
  uint64_t v10;
  const void *v11;
  CFDictionaryRef context;

  if (!a1)
    return 0;
  v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
  {
    if (v2 == CFArrayGetTypeID())
    {
      Count = CFArrayGetCount((CFArrayRef)a1);
      if (Count >= 1)
      {
        v5 = Count;
        v6 = 0;
        MutableCopy = 0;
        v8 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
        do
        {
          ValueAtIndex = CFArrayGetValueAtIndex((CFArrayRef)a1, v6);
          v10 = msu_process_cf_object_from_xpc_deserialization(ValueAtIndex);
          if (v10)
          {
            v11 = (const void *)v10;
            if (!MutableCopy)
              MutableCopy = CFArrayCreateMutableCopy(v8, 0, (CFArrayRef)a1);
            CFArraySetValueAtIndex(MutableCopy, v6, v11);
            CFRelease(v11);
          }
          ++v6;
        }
        while (v5 != v6);
        return (const __CFString *)MutableCopy;
      }
    }
    return 0;
  }
  if (CFDictionaryContainsKey((CFDictionaryRef)a1, CFSTR("_MSU_Embedded_Error")))
    return copy_dictionary_to_cferror(a1);
  context = 0;
  CFDictionaryApplyFunction((CFDictionaryRef)a1, (CFDictionaryApplierFunction)msu_process_dictionary_values_from_xpc_deserialization, &context);
  if (!context)
    return 0;
  MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, (CFDictionaryRef)a1);
  CFDictionaryApplyFunction(context, (CFDictionaryApplierFunction)msu_merge_dictionary_values, MutableCopy);
  CFRelease(context);
  return (const __CFString *)MutableCopy;
}

const __CFString *msu_deserialize_cf_object_from_xpc_dict(void *a1, const char *a2)
{
  const void *v2;
  const __CFString *v3;
  const __CFString *v4;

  if (!xpc_dictionary_get_value(a1, a2))
    return 0;
  v2 = (const void *)_CFXPCCreateCFObjectFromXPCObject();
  v3 = msu_process_cf_object_from_xpc_deserialization(v2);
  if (v3)
  {
    v4 = v3;
    CFRelease(v2);
    return v4;
  }
  return (const __CFString *)v2;
}

uint64_t msu_demux_reply(void *a1, const __CFString **a2, __CFDictionary **a3, const __CFString **a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const char *string;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  CFErrorRef error_internal_cf;
  const __CFString *v18;
  CFErrorRef v19;
  uint64_t result;
  const __CFDictionary *v21;
  const void *Value;
  const void *v23;
  __CFDictionary *MutableCopy;
  const __CFString *v25;
  const __CFString *v26;
  __CFError *v27;
  char v28;

  if (!a1)
  {
    v18 = CFSTR("No reply from daemon");
LABEL_9:
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, v18, a6, a7, a8, v28);
LABEL_10:
    v19 = error_internal_cf;
    if (a4)
    {
      result = 0;
      *a4 = (const __CFString *)v19;
      return result;
    }
    goto LABEL_12;
  }
  string = xpc_dictionary_get_string(a1, "IPCStatus");
  if (!string)
  {
    v18 = CFSTR("No status key in reply from daemon");
    goto LABEL_9;
  }
  v13 = string;
  if (!strncmp(string, "Complete", 8uLL))
  {
    if (a2)
      *a2 = msu_deserialize_cf_object_from_xpc_dict(a1, "Results");
    return 1;
  }
  if (!strncmp(v13, "Callback", 8uLL))
  {
    if (a3)
    {
      v21 = (const __CFDictionary *)msu_deserialize_cf_object_from_xpc_dict(a1, "CallbackStatus");
      Value = CFDictionaryGetValue(v21, CFSTR("StallError"));
      if (Value)
      {
        v23 = Value;
        MutableCopy = CFDictionaryCreateMutableCopy((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, v21);
        if (v21)
          CFRelease(v21);
        v25 = copy_dictionary_to_cferror(v23);
        if (v25)
        {
          v26 = v25;
          CFDictionarySetValue(MutableCopy, CFSTR("StallError"), v25);
          CFRelease(v26);
        }
      }
      else
      {
        MutableCopy = v21;
      }
      *a3 = MutableCopy;
    }
    return 1;
  }
  if (strncmp(v13, "Error", 5uLL))
  {
    error_internal_cf = _create_error_internal_cf(CFSTR("MobileSoftwareUpdateErrorDomain"), 7, 0, 0, CFSTR("Unexpected IPC status %s in reply hander"), v14, v15, v16, (char)v13);
    goto LABEL_10;
  }
  if (!a4)
    return 0;
  result = (uint64_t)msu_deserialize_cf_object_from_xpc_dict(a1, "ErrorInfo");
  if (result)
  {
    v27 = (__CFError *)result;
    *a4 = copy_dictionary_to_cferror((const void *)result);
    error_internal_cf = v27;
LABEL_12:
    CFRelease(error_internal_cf);
    return 0;
  }
  return result;
}

void MSUPreflightUpdate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPrepareUpdateWithAsset_cold_1()
{
  NSObject *v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_211416000, v0, (uint64_t)v0, "[SPI] %@ | FAILURE | error:%@", (uint8_t *)v1);
  OUTLINED_FUNCTION_2();
}

void MSUPrepareUpdateWithAsset_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void perform_prepare_command_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | ...PrepareUpdate | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPrepareUpdateWithMAAsset_cold_1()
{
  NSObject *v0;
  int v1[6];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 138412546;
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1(&dword_211416000, v0, (uint64_t)v0, "[SPI] %@ | FAILURE | error:%@", (uint8_t *)v1);
  OUTLINED_FUNCTION_2();
}

void MSUPrepareUpdateWithMAAsset_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPrepareUpdate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUApplyUpdate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUSuspendUpdate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUResumeUpdateWithOptions_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUBrainIsLoadable_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Cannot determine if brain is loadable with null update asset attributes", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUBrainIsLoadable_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | Unable to determine whether brain is loadable, error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPurgeSuspendedUpdate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCloseUpdateHandle_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | NOT IMPLEMENTED", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUAssetCalculateInstallationSize_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Cannot calculate installation size with null asset properties", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUAssetCalculateInstallationSize_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUAssetCalculatePrepareSizes_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUAssetCalculateApplySizes_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCheckInstallationSize_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSURetrievePreviousUpdateResults_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSURetrievePreviousUpdateState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyToleratedStatusForStep_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Invalid argument passed for step", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyToleratedStatusForStep_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Failed to allocate memory for result dictionary", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUParsedToleratedFailureForStep_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_0(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Tolerated failure status:%@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUParsedToleratedFailureForStep_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | Unknown state encountered", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUIsFirstBootAfterUpdate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | unable to determine whether first boot after update, error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSURetrievePreviousUpdateDate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | unable to determine previous update date, error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSURetrievePreviousRestoreDate_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_5_0();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | unable to determine previous restore date, error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyEnvInfoForNeRD_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | unable to load bootedOS state", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyConnectivityData_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | NULL response from getStashedConnectivityData command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyConnectivityData_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Unexpected response type to getStashedConnectivityData command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyConnectivityData_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | Failed to perform getStashedConnectivityData command, error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUReportAndCleanupPreviousUpdateState_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | No reponse provided by perform cleanup command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUReportAndCleanupPreviousUpdateState_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Unexpected response type provided by perform cleanup command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUReportAndCleanupPreviousUpdateState_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Failed to perform cleanup command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyInstalledRecoveryOSVersion_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Failed to allocate path string for recoveryOSVersion file", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUCopyInstalledRecoveryOSVersion_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | No stashed recoveryOS version file detected", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void RVGetNeRDInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | No stashed recoveryOS version file detected", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUGetUpdateInfo_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | NULL response from kCommandGetUpdateInformation command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUGetUpdateInfo_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Unexpected response type to kCommandGetUpdateInformation command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUGetUpdateInfo_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | Failed to perform kCommandGetUpdateInformation command, error:%@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPerformSemiSplat_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | No response provided by cryptegraft SemiSplat command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPerformSemiSplat_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Unexpected response type provided by cryptegraft SemiSplat command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPerformSemiSplat_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Failed to perform cryptegraft SemiSplat command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPerformDownlevel_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | No reponse provided by cryptegraft downlevel command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPerformDownlevel_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a1, a3, "[SPI] %@ | FAILURE | Unexpected response type provided by cryptegraft downlevel command", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void MSUPerformDownlevel_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_6(*MEMORY[0x24BDAC8D0]);
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_211416000, v0, v1, "[SPI] %@ | FAILURE | Failed to perform cryptegraft downlevel command, error: %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_2();
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a2, a3, "[SPI] %@ | Failed to allocate dictionary for retryFailure", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void __retrieve_previous_update_all_tolerated_failures_block_invoke_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_211416000, a2, a3, "[SPI] %@ | Failed to allocate dictionary for currentFailure", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_2();
}

void addSeObjectToMessage_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_211416000, v0, v1, "[CLIENT_IPC] Cannot encode object into message, nil passed in", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void perform_se_command_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_211416000, v0, v1, "[CLIENT_IPC] Performed se command: %s | FAILURE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void perform_se_command_with_progress_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_211416000, v0, v1, "[CLIENT_IPC] Performed se command with progress: %s | FAILURE", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void create_brain_connection_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_211416000, v0, v1, "[CLIENT_IPC] Could not get connection to softwareupdated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void create_brain_connection_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_211416000, v0, v1, "[CLIENT_IPC] XPC error creating connection to update brain service | %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void create_brain_connection_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_211416000, v0, v1, "[CLIENT_IPC] Error from softwareupdated: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void create_brain_connection_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_211416000, v0, v1, "[CLIENT_IPC] No update brain endpoint in response from softwareupdated", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void create_brain_connection_cold_5()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_211416000, v0, v1, "[CLIENT_IPC] Unexpected XPC type from softwareupdated | %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

void __copy_shared_update_brain_connection_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_1_1(&dword_211416000, v0, v1, "[CLIENT_IPC] No brain connection", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4_0();
}

void __copy_shared_update_brain_connection_block_invoke_55_cold_1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  OUTLINED_FUNCTION_2_0();
  _os_log_error_impl(&dword_211416000, a2, OS_LOG_TYPE_ERROR, "[CLIENT_IPC] XPC error on service connection: %s", v3, 0xCu);
}

void __copy_shared_update_brain_connection_block_invoke_55_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_4(&dword_211416000, v0, v1, "[CLIENT_IPC] Unhandled event on service connetion | %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_2();
}

CFMutableArrayRef CFArrayCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFArrayRef theArray)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB810](allocator, capacity, theArray);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

void CFArraySetValueAtIndex(CFMutableArrayRef theArray, CFIndex idx, const void *value)
{
  MEMORY[0x24BDBB898](theArray, idx, value);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x24BDBBDA8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x24BDBBDC0](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFDictionaryRef theDict)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF8](allocator, capacity, theDict);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

CFDictionaryRef CFErrorCopyUserInfo(CFErrorRef err)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBE80](err);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

CFIndex CFErrorGetCode(CFErrorRef err)
{
  return MEMORY[0x24BDBBE98](err);
}

CFErrorDomain CFErrorGetDomain(CFErrorRef err)
{
  return (CFErrorDomain)MEMORY[0x24BDBBEA0](err);
}

CFTypeID CFErrorGetTypeID(void)
{
  return MEMORY[0x24BDBBEA8]();
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x24BDBC0A0](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC178](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x24BDBC5A0](alloc, formatOptions, format, arguments);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFIndex CFStringGetMaximumSizeForEncoding(CFIndex length, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC660](length, *(_QWORD *)&encoding);
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
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

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
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

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

char *__cdecl getenv(const char *a1)
{
  return (char *)MEMORY[0x24BDAE5F0](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
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

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x24BDB0760](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x24BDB07C0](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_finalizer_f(xpc_connection_t connection, xpc_finalizer_t finalizer)
{
  MEMORY[0x24BDB07D0](connection, finalizer);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x24BDB0820](object);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x24BDB0948](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x24BDB0AE8](object);
}

